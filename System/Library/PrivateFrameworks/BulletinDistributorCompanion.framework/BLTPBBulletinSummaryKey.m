@interface BLTPBBulletinSummaryKey
- (BOOL)hasValue;
- (BOOL)hasValueNulls;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)value;
- (NSData)valueNulls;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueNulls:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBBulletinSummaryKey

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasValueNulls
{
  return self->_valueNulls != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBBulletinSummaryKey;
  v4 = [(BLTPBBulletinSummaryKey *)&v8 description];
  v5 = [(BLTPBBulletinSummaryKey *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  value = self->_value;
  if (value) {
    [v4 setObject:value forKey:@"value"];
  }
  valueNulls = self->_valueNulls;
  if (valueNulls) {
    [v4 setObject:valueNulls forKey:@"valueNulls"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBBulletinSummaryKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_key) {
    -[BLTPBBulletinSummaryKey writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_value) {
    PBDataWriterWriteDataField();
  }
  if (self->_valueNulls) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setKey:self->_key];
  if (self->_value) {
    objc_msgSend(v4, "setValue:");
  }
  if (self->_valueNulls) {
    objc_msgSend(v4, "setValueNulls:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_value copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSData *)self->_valueNulls copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:"))
    && ((value = self->_value, !((unint64_t)value | v4[2])) || -[NSData isEqual:](value, "isEqual:")))
  {
    valueNulls = self->_valueNulls;
    if ((unint64_t)valueNulls | v4[3]) {
      char v8 = -[NSData isEqual:](valueNulls, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  uint64_t v4 = [(NSData *)self->_value hash] ^ v3;
  return v4 ^ [(NSData *)self->_valueNulls hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[1]) {
    -[BLTPBBulletinSummaryKey setKey:](self, "setKey:");
  }
  if (v4[2]) {
    -[BLTPBBulletinSummaryKey setValue:](self, "setValue:");
  }
  if (v4[3]) {
    -[BLTPBBulletinSummaryKey setValueNulls:](self, "setValueNulls:");
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSData)valueNulls
{
  return self->_valueNulls;
}

- (void)setValueNulls:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueNulls, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BLTPBBulletinSummaryKey writeTo:]", "BLTPBBulletinSummaryKey.m", 102, "nil != self->_key");
}

@end