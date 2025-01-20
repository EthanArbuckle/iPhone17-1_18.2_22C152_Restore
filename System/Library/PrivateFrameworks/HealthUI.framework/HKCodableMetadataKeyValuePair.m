@interface HKCodableMetadataKeyValuePair
- (BOOL)hasKey;
- (BOOL)hasNumberIntValue;
- (BOOL)hasQuantityValue;
- (BOOL)hasStringValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableQuantity)quantityValue;
- (NSString)key;
- (NSString)stringValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)numberIntValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNumberIntValue:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setNumberIntValue:(int64_t)a3;
- (void)setQuantityValue:(id)a3;
- (void)setStringValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableMetadataKeyValuePair

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setNumberIntValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numberIntValue = a3;
}

- (void)setHasNumberIntValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberIntValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasQuantityValue
{
  return self->_quantityValue != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableMetadataKeyValuePair;
  v4 = [(HKCodableMetadataKeyValuePair *)&v8 description];
  v5 = [(HKCodableMetadataKeyValuePair *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_numberIntValue];
    [v4 setObject:v6 forKey:@"numberIntValue"];
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    [v4 setObject:stringValue forKey:@"stringValue"];
  }
  quantityValue = self->_quantityValue;
  if (quantityValue)
  {
    v9 = [(HKCodableQuantity *)quantityValue dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"quantityValue"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableMetadataKeyValuePairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_quantityValue)
  {
    PBDataWriterWriteSubmessage();
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
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_numberIntValue;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_stringValue)
  {
    objc_msgSend(v5, "setStringValue:");
    id v4 = v5;
  }
  if (self->_quantityValue)
  {
    objc_msgSend(v5, "setQuantityValue:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_numberIntValue;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_stringValue copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  id v10 = [(HKCodableQuantity *)self->_quantityValue copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_numberIntValue != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 4)
    && !-[NSString isEqual:](stringValue, "isEqual:"))
  {
    goto LABEL_13;
  }
  quantityValue = self->_quantityValue;
  if ((unint64_t)quantityValue | *((void *)v4 + 3)) {
    char v8 = -[HKCodableQuantity isEqual:](quantityValue, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_numberIntValue;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  NSUInteger v6 = [(NSString *)self->_stringValue hash];
  return v5 ^ v6 ^ [(HKCodableQuantity *)self->_quantityValue hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[HKCodableMetadataKeyValuePair setKey:](self, "setKey:");
    uint64_t v4 = v7;
  }
  if (v4[5])
  {
    self->_numberIntValue = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[4])
  {
    -[HKCodableMetadataKeyValuePair setStringValue:](self, "setStringValue:");
    uint64_t v4 = v7;
  }
  quantityValue = self->_quantityValue;
  uint64_t v6 = v4[3];
  if (quantityValue)
  {
    if (!v6) {
      goto LABEL_13;
    }
    quantityValue = (HKCodableQuantity *)-[HKCodableQuantity mergeFrom:](quantityValue, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_13;
    }
    quantityValue = (HKCodableQuantity *)-[HKCodableMetadataKeyValuePair setQuantityValue:](self, "setQuantityValue:");
  }
  uint64_t v4 = v7;
LABEL_13:
  MEMORY[0x1F41817F8](quantityValue, v4);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (int64_t)numberIntValue
{
  return self->_numberIntValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (HKCodableQuantity)quantityValue
{
  return self->_quantityValue;
}

- (void)setQuantityValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_quantityValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end