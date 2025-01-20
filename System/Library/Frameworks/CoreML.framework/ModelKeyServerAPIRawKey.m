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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionKey, 0);

  objc_storeStrong((id *)&self->_encryptionIv, 0);
}

- (void)setEncryptionIv:(id)a3
{
}

- (NSData)encryptionIv
{
  return self->_encryptionIv;
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[ModelKeyServerAPIRawKey setEncryptionKey:](self, "setEncryptionKey:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[ModelKeyServerAPIRawKey setEncryptionIv:](self, "setEncryptionIv:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_encryptionKey hash];
  return [(NSData *)self->_encryptionIv hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((encryptionKey = self->_encryptionKey, !((unint64_t)encryptionKey | v4[2]))
     || -[NSData isEqual:](encryptionKey, "isEqual:")))
  {
    encryptionIv = self->_encryptionIv;
    if ((unint64_t)encryptionIv | v4[1]) {
      char v7 = -[NSData isEqual:](encryptionIv, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_encryptionKey copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_encryptionIv copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
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

- (BOOL)readFrom:(id)a3
{
  return ModelKeyServerAPIRawKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
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

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ModelKeyServerAPIRawKey;
  id v4 = [(ModelKeyServerAPIRawKey *)&v8 description];
  id v5 = [(ModelKeyServerAPIRawKey *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEncryptionIv
{
  return self->_encryptionIv != 0;
}

- (BOOL)hasEncryptionKey
{
  return self->_encryptionKey != 0;
}

@end