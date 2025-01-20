@interface ModelKeyServerAPIRawKey
- (BOOL)hasEncryptionIv;
- (BOOL)hasEncryptionKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptionIv;
- (NSData)encryptionKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptionIv:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ModelKeyServerAPIRawKey

- (BOOL)hasEncryptionKey
{
  return self->_encryptionKey != 0;
}

- (BOOL)hasEncryptionIv
{
  return self->_encryptionIv != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ModelKeyServerAPIRawKey;
  v3 = [(ModelKeyServerAPIRawKey *)&v7 description];
  v4 = [(ModelKeyServerAPIRawKey *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  encryptionKey = self->_encryptionKey;
  if (encryptionKey) {
    [v3 setObject:encryptionKey forKey:@"encryption_key"];
  }
  encryptionIv = self->_encryptionIv;
  if (encryptionIv) {
    [v4 setObject:encryptionIv forKey:@"encryption_iv"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ModelKeyServerAPIRawKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encryptionKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_encryptionIv)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encryptionKey)
  {
    objc_msgSend(v4, "setEncryptionKey:");
    id v4 = v5;
  }
  if (self->_encryptionIv)
  {
    objc_msgSend(v5, "setEncryptionIv:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_encryptionKey copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSData *)self->_encryptionIv copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((encryptionKey = self->_encryptionKey, !((unint64_t)encryptionKey | v4[2]))
     || -[NSData isEqual:](encryptionKey, "isEqual:")))
  {
    encryptionIv = self->_encryptionIv;
    if ((unint64_t)encryptionIv | v4[1]) {
      unsigned __int8 v7 = -[NSData isEqual:](encryptionIv, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_encryptionKey hash];
  return (unint64_t)[(NSData *)self->_encryptionIv hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[ModelKeyServerAPIRawKey setEncryptionKey:](self, "setEncryptionKey:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[ModelKeyServerAPIRawKey setEncryptionIv:](self, "setEncryptionIv:");
    id v4 = v5;
  }
}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSData)encryptionIv
{
  return self->_encryptionIv;
}

- (void)setEncryptionIv:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionKey, 0);

  objc_storeStrong((id *)&self->_encryptionIv, 0);
}

@end