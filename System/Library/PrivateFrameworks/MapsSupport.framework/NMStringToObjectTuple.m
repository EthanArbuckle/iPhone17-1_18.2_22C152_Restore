@interface NMStringToObjectTuple
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasDataValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasIntValue;
- (BOOL)hasKey;
- (BOOL)hasStringValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dataValue;
- (NSString)key;
- (NSString)stringValue;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)intValue;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setDataValue:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntValue:(BOOL)a3;
- (void)setIntValue:(unint64_t)a3;
- (void)setKey:(id)a3;
- (void)setStringValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NMStringToObjectTuple

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (void)setBoolValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBoolValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIntValue:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_intValue = a3;
}

- (void)setHasIntValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDoubleValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoubleValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NMStringToObjectTuple;
  char v3 = [(NMStringToObjectTuple *)&v7 description];
  v4 = [(NMStringToObjectTuple *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    [v4 setObject:stringValue forKey:@"stringValue"];
  }
  dataValue = self->_dataValue;
  if (dataValue) {
    [v4 setObject:dataValue forKey:@"dataValue"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v11 = +[NSNumber numberWithBool:self->_BOOLValue];
    [v4 setObject:v11 forKey:@"BOOLValue"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  v12 = +[NSNumber numberWithUnsignedLongLong:self->_intValue];
  [v4 setObject:v12 forKey:@"intValue"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_10:
    v9 = +[NSNumber numberWithDouble:self->_doubleValue];
    [v4 setObject:v9 forKey:@"doubleValue"];
  }
LABEL_11:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NMStringToObjectTupleReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_dataValue)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_10:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_11:
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
  if (self->_dataValue)
  {
    objc_msgSend(v6, "setDataValue:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 48) = self->_BOOLValue;
    *((unsigned char *)v4 + 52) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 2) = self->_intValue;
  *((unsigned char *)v4 + 52) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_10:
    *((void *)v4 + 1) = *(void *)&self->_doubleValue;
    *((unsigned char *)v4 + 52) |= 1u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_key copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_stringValue copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  id v10 = [(NSData *)self->_dataValue copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    v5[2] = self->_intValue;
    *((unsigned char *)v5 + 52) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v5;
    }
    goto LABEL_4;
  }
  *((unsigned char *)v5 + 48) = self->_BOOLValue;
  *((unsigned char *)v5 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    v5[1] = *(void *)&self->_doubleValue;
    *((unsigned char *)v5 + 52) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_25;
    }
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_25;
    }
  }
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](dataValue, "isEqual:")) {
      goto LABEL_25;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) != 0)
    {
      if (self->_BOOLValue)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_25;
        }
        goto LABEL_16;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_16;
      }
    }
LABEL_25:
    BOOL v8 = 0;
    goto LABEL_26;
  }
  if ((*((unsigned char *)v4 + 52) & 4) != 0) {
    goto LABEL_25;
  }
LABEL_16:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_intValue != *((void *)v4 + 2)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_25;
  }
  BOOL v8 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_doubleValue != *((double *)v4 + 1)) {
      goto LABEL_25;
    }
    BOOL v8 = 1;
  }
LABEL_26:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_stringValue hash];
  unint64_t v5 = (unint64_t)[(NSData *)self->_dataValue hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    unint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
  }
  uint64_t v6 = 2654435761 * self->_BOOLValue;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  unint64_t v7 = 2654435761u * self->_intValue;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double doubleValue = self->_doubleValue;
  double v9 = -doubleValue;
  if (doubleValue >= 0.0) {
    double v9 = self->_doubleValue;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[NMStringToObjectTuple setKey:](self, "setKey:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[NMStringToObjectTuple setStringValue:](self, "setStringValue:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[NMStringToObjectTuple setDataValue:](self, "setDataValue:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 4) != 0)
  {
    self->_BOOLValue = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_intValue = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 52))
  {
LABEL_10:
    self->_double doubleValue = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_11:
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (unint64_t)intValue
{
  return self->_intValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_dataValue, 0);
}

@end