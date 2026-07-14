CREATE TABLE autor (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf CHAR(11) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE categoria (
    id INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(255),
    PRIMARY KEY(id)
);

CREATE TABLE livro (
    id INT NOT NULL AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    isbn VARCHAR(100),
    editora VARCHAR(100),
    ano YEAR not null,
    PRIMARY KEY(id),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);



CREATE TABLE aluno (
    id INT  NOT NULL AUTO_INCREMENT,
    RA INT NOT NULL,
    curso VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE usuario (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    email VARCHAR(255),
    senha VARCHAR(255),
    PRIMARY KEY(id)
);

CREATE TABLE emprestimo (
    id INT NOT NULL AUTO_INCREMENT,
    id_livro int not null,
    id_aluno int not null,
    id_usuario int not null,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    PRIMARY KEY(id),
    FOREIGN KEY (id_livro) REFERENCES livro(id),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);


CREATE TABLE livro_autor_assoc (
    id_livro int not null,
    id_autor int not null,
    
    FOREIGN KEY (id_livro) REFERENCES livro(id),
    FOREIGN KEY (id_autor) REFERENCES autor(id),
    PRIMARY KEY(id_livro, id_autor)
);