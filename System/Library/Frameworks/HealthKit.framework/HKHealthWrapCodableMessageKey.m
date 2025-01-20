@interface HKHealthWrapCodableMessageKey
- (BOOL)hasIv;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)iv;
- (NSData)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIv:(id)a3;
- (void)setKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKHealthWrapCodableMessageKey

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasIv
{
  return self->_iv != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKHealthWrapCodableMessageKey;
  v4 = [(HKHealthWrapCodableMessageKey *)&v8 description];
  v5 = [(HKHealthWrapCodableMessageKey *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  iv = self->_iv;
  if (iv) {
    [v4 setObject:iv forKey:@"iv"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKHealthWrapCodableMessageKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_iv)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v5;
  }
  if (self->_iv)
  {
    objc_msgSend(v5, "setIv:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_key copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_iv copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[2])) || -[NSData isEqual:](key, "isEqual:")))
  {
    iv = self->_iv;
    if ((unint64_t)iv | v4[1]) {
      char v7 = -[NSData isEqual:](iv, "isEqual:");
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

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_key hash];
  return [(NSData *)self->_iv hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[HKHealthWrapCodableMessageKey setKey:](self, "setKey:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[HKHealthWrapCodableMessageKey setIv:](self, "setIv:");
    id v4 = v5;
  }
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSData)iv
{
  return self->_iv;
}

- (void)setIv:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_iv, 0);
}

@end