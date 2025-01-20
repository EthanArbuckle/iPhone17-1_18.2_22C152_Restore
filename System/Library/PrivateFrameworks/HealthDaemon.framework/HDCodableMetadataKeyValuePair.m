@interface HDCodableMetadataKeyValuePair
- (BOOL)hasDataValue;
- (BOOL)hasDateValue;
- (BOOL)hasKey;
- (BOOL)hasNumberDoubleValue;
- (BOOL)hasNumberIntValue;
- (BOOL)hasQuantityValue;
- (BOOL)hasStringValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableQuantity)quantityValue;
- (NSData)dataValue;
- (NSString)key;
- (NSString)stringValue;
- (double)dateValue;
- (double)numberDoubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)numberIntValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDataValue:(id)a3;
- (void)setDateValue:(double)a3;
- (void)setHasDateValue:(BOOL)a3;
- (void)setHasNumberDoubleValue:(BOOL)a3;
- (void)setHasNumberIntValue:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setNumberDoubleValue:(double)a3;
- (void)setNumberIntValue:(int64_t)a3;
- (void)setQuantityValue:(id)a3;
- (void)setStringValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableMetadataKeyValuePair

- (void)setKey:(id)a3
{
}

- (void)setNumberIntValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numberIntValue = a3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_9:
  if (self->_quantityValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_dataValue)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_quantityValue, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_dataValue, 0);
}

- (void)setNumberDoubleValue:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numberDoubleValue = a3;
}

- (void)setQuantityValue:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasNumberDoubleValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasNumberIntValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int64_t)numberIntValue
{
  return self->_numberIntValue;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setDateValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dateValue = a3;
}

- (void)setHasDateValue:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasNumberIntValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setHasNumberDoubleValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasQuantityValue
{
  return self->_quantityValue != 0;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableMetadataKeyValuePair;
  id v4 = [(HDCodableMetadataKeyValuePair *)&v8 description];
  v5 = [(HDCodableMetadataKeyValuePair *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    [v4 setObject:stringValue forKey:@"stringValue"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v13 = [NSNumber numberWithDouble:self->_dateValue];
    [v4 setObject:v13 forKey:@"dateValue"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v14 = [NSNumber numberWithLongLong:self->_numberIntValue];
  [v4 setObject:v14 forKey:@"numberIntValue"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    objc_super v8 = [NSNumber numberWithDouble:self->_numberDoubleValue];
    [v4 setObject:v8 forKey:@"numberDoubleValue"];
  }
LABEL_9:
  quantityValue = self->_quantityValue;
  if (quantityValue)
  {
    v10 = [(HDCodableQuantity *)quantityValue dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"quantityValue"];
  }
  dataValue = self->_dataValue;
  if (dataValue) {
    [v4 setObject:dataValue forKey:@"dataValue"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMetadataKeyValuePairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v6;
  }
  if (self->_stringValue)
  {
    objc_msgSend(v6, "setStringValue:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_dateValue;
    *((unsigned char *)v4 + 64) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 3) = self->_numberIntValue;
  *((unsigned char *)v4 + 64) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    *((void *)v4 + 2) = *(void *)&self->_numberDoubleValue;
    *((unsigned char *)v4 + 64) |= 2u;
  }
LABEL_9:
  if (self->_quantityValue)
  {
    objc_msgSend(v6, "setQuantityValue:");
    id v4 = v6;
  }
  if (self->_dataValue)
  {
    objc_msgSend(v6, "setDataValue:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_stringValue copyWithZone:a3];
  v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 24) = self->_numberIntValue;
    *(unsigned char *)(v5 + 64) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(double *)(v5 + 8) = self->_dateValue;
  *(unsigned char *)(v5 + 64) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_numberDoubleValue;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
LABEL_5:
  id v11 = [(HDCodableQuantity *)self->_quantityValue copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  uint64_t v13 = [(NSData *)self->_dataValue copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_25;
    }
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_25;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_dateValue != *((double *)v4 + 1)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_25:
    char v9 = 0;
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_numberIntValue != *((void *)v4 + 3)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_numberDoubleValue != *((double *)v4 + 2)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_25;
  }
  quantityValue = self->_quantityValue;
  if ((unint64_t)quantityValue | *((void *)v4 + 6)
    && !-[HDCodableQuantity isEqual:](quantityValue, "isEqual:"))
  {
    goto LABEL_25;
  }
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((void *)v4 + 4)) {
    char v9 = -[NSData isEqual:](dataValue, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_26:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_stringValue hash];
  char has = (char)self->_has;
  if (has)
  {
    double dateValue = self->_dateValue;
    double v8 = -dateValue;
    if (dateValue >= 0.0) {
      double v8 = self->_dateValue;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 4) != 0)
  {
    uint64_t v11 = 2654435761 * self->_numberIntValue;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v16 = 0;
    goto LABEL_19;
  }
  uint64_t v11 = 0;
  if ((has & 2) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double numberDoubleValue = self->_numberDoubleValue;
  double v13 = -numberDoubleValue;
  if (numberDoubleValue >= 0.0) {
    double v13 = self->_numberDoubleValue;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0) {
      v16 += (unint64_t)v15;
    }
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
LABEL_19:
  unint64_t v17 = v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ [(HDCodableQuantity *)self->_quantityValue hash];
  return v17 ^ [(NSData *)self->_dataValue hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 5))
  {
    -[HDCodableMetadataKeyValuePair setKey:](self, "setKey:");
    id v4 = v8;
  }
  if (*((void *)v4 + 7))
  {
    -[HDCodableMetadataKeyValuePair setStringValue:](self, "setStringValue:");
    id v4 = v8;
  }
  char v5 = *((unsigned char *)v4 + 64);
  if (v5)
  {
    self->_double dateValue = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 64);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_numberIntValue = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
LABEL_8:
    self->_double numberDoubleValue = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_9:
  quantityValue = self->_quantityValue;
  uint64_t v7 = *((void *)v4 + 6);
  if (quantityValue)
  {
    if (!v7) {
      goto LABEL_18;
    }
    -[HDCodableQuantity mergeFrom:](quantityValue, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_18;
    }
    -[HDCodableMetadataKeyValuePair setQuantityValue:](self, "setQuantityValue:");
  }
  id v4 = v8;
LABEL_18:
  if (*((void *)v4 + 4))
  {
    -[HDCodableMetadataKeyValuePair setDataValue:](self, "setDataValue:");
    id v4 = v8;
  }
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (double)dateValue
{
  return self->_dateValue;
}

- (double)numberDoubleValue
{
  return self->_numberDoubleValue;
}

- (HDCodableQuantity)quantityValue
{
  return self->_quantityValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
}

@end