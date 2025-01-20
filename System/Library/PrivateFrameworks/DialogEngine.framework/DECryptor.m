@interface DECryptor
- (DECryptor)init;
- (DECryptor)initWithWriter:(id)a3 operation:(unsigned int)a4 key:(id)a5 iv:(id)a6;
- (DEWriter)writer;
- (_CCCryptor)cryptor;
- (unsigned)operation;
- (void)close;
- (void)dealloc;
- (void)setCryptor:(_CCCryptor *)a3;
- (void)setOperation:(unsigned int)a3;
- (void)setWriter:(id)a3;
- (void)writeData:(id)a3;
@end

@implementation DECryptor

- (void).cxx_destruct
{
}

- (void)setOperation:(unsigned int)a3
{
  self->_operation = a3;
}

- (unsigned)operation
{
  return self->_operation;
}

- (void)setCryptor:(_CCCryptor *)a3
{
  self->_cryptor = a3;
}

- (_CCCryptor)cryptor
{
  return self->_cryptor;
}

- (void)setWriter:(id)a3
{
}

- (DEWriter)writer
{
  return self->_writer;
}

- (void)close
{
  size_t dataOutMoved = 0;
  objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", CCCryptorGetOutputLength(self->_cryptor, 0, 1));
  id v3 = objc_claimAutoreleasedReturnValue();
  if (CCCryptorFinal(self->_cryptor, (void *)[v3 mutableBytes], objc_msgSend(v3, "length"), &dataOutMoved))
  {
    +[DELog error:@"Failed to perform final crypto operation"];
  }
  else
  {
    [v3 setLength:dataOutMoved];
    [(DEWriter *)self->_writer writeData:v3];
    [(DEWriter *)self->_writer close];
  }
}

- (void)writeData:(id)a3
{
  id v4 = a3;
  size_t dataOutMoved = 0;
  objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", CCCryptorGetOutputLength(self->_cryptor, objc_msgSend(v4, "length"), 0));
  id v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)[v5 mutableBytes];
  cryptor = self->_cryptor;
  id v8 = v4;
  if (CCCryptorUpdate(cryptor, (const void *)[v8 bytes], objc_msgSend(v8, "length"), v6, objc_msgSend(v5, "length"), &dataOutMoved))
  {
    +[DELog error:@"Failed to perform crypto operation"];
  }
  else
  {
    [v5 setLength:dataOutMoved];
    [(DEWriter *)self->_writer writeData:v5];
  }
}

- (void)dealloc
{
  cryptor = self->_cryptor;
  if (cryptor)
  {
    CCCryptorRelease(cryptor);
    self->_cryptor = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DECryptor;
  [(DECryptor *)&v4 dealloc];
}

- (DECryptor)initWithWriter:(id)a3 operation:(unsigned int)a4 key:(id)a5 iv:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)DECryptor;
  v14 = [(DECryptor *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_writer, a3);
    if (a4 >= 2)
    {
      +[DELog error:@"Unsupported crypto operation in DECryptor"];
LABEL_5:

      v15 = 0;
      goto LABEL_6;
    }
    v15->_cryptor = 0;
    v15->_operation = a4;
    v16 = (const void *)[v13 bytes];
    id v17 = v12;
    if (CCCryptorCreateWithMode(a4, 4u, 0, 0, v16, (const void *)[v17 bytes], objc_msgSend(v17, "length"), 0, 0, 0, 2u, &v15->_cryptor))
    {
      goto LABEL_5;
    }
  }
LABEL_6:

  return v15;
}

- (DECryptor)init
{
  id v3 = objc_opt_new();
  objc_super v4 = objc_opt_new();
  id v5 = [(DECryptor *)self initWithWriter:0 operation:0 key:v3 iv:v4];

  return v5;
}

@end