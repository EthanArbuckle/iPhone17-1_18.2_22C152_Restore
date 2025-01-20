@interface HDCodableTimestampedKeyValuePair
- (BOOL)hasBytesValue;
- (BOOL)hasKey;
- (BOOL)hasNumberDoubleValue;
- (BOOL)hasNumberIntValue;
- (BOOL)hasStringValue;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableTimestampedKeyValuePair)initWithKey:(id)a3 value:(id)a4 timestamp:(id)a5;
- (NSData)bytesValue;
- (NSString)key;
- (NSString)stringValue;
- (double)numberDoubleValue;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedTimestamp;
- (id)decodedValue;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)numberIntValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBytesValue:(id)a3;
- (void)setHasNumberDoubleValue:(BOOL)a3;
- (void)setHasNumberIntValue:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setNumberDoubleValue:(double)a3;
- (void)setNumberIntValue:(int64_t)a3;
- (void)setStringValue:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setTimestampWithDate:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableTimestampedKeyValuePair

- (void)setKey:(id)a3
{
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_msgSend(v5, "hk_hasFloatingPointValue"))
    {
      [v5 doubleValue];
      -[HDCodableTimestampedKeyValuePair setNumberDoubleValue:](self, "setNumberDoubleValue:");
    }
    else
    {
      -[HDCodableTimestampedKeyValuePair setNumberIntValue:](self, "setNumberIntValue:", [v5 longLongValue]);
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (void *)[v5 copy];
    [(HDCodableTimestampedKeyValuePair *)self setStringValue:v4];
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (void *)[v5 copy];
    [(HDCodableTimestampedKeyValuePair *)self setBytesValue:v4];
    goto LABEL_9;
  }
  if (v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid value %@ of class %@", v5, objc_opt_class() format];
  }
LABEL_10:
}

- (void)setNumberDoubleValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numberDoubleValue = a3;
}

- (void)setTimestampWithDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];

  -[HDCodableTimestampedKeyValuePair setTimestamp:](self, "setTimestamp:");
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
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
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_7:
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_bytesValue)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_bytesValue, 0);
}

- (void)setNumberIntValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numberIntValue = a3;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNumberIntValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberIntValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNumberDoubleValue:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberDoubleValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasBytesValue
{
  return self->_bytesValue != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableTimestampedKeyValuePair;
  id v4 = [(HDCodableTimestampedKeyValuePair *)&v8 description];
  id v5 = [(HDCodableTimestampedKeyValuePair *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v11 = [NSNumber numberWithDouble:self->_timestamp];
    [v4 setObject:v11 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v12 = [NSNumber numberWithLongLong:self->_numberIntValue];
  [v4 setObject:v12 forKey:@"numberIntValue"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    v7 = [NSNumber numberWithDouble:self->_numberDoubleValue];
    [v4 setObject:v7 forKey:@"numberDoubleValue"];
  }
LABEL_7:
  stringValue = self->_stringValue;
  if (stringValue) {
    [v4 setObject:stringValue forKey:@"stringValue"];
  }
  bytesValue = self->_bytesValue;
  if (bytesValue) {
    [v4 setObject:bytesValue forKey:@"bytesValue"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableTimestampedKeyValuePairReadFrom((uint64_t)self, (uint64_t)a3);
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
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 56) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 2) = self->_numberIntValue;
  *((unsigned char *)v4 + 56) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *((void *)v4 + 1) = *(void *)&self->_numberDoubleValue;
    *((unsigned char *)v4 + 56) |= 1u;
  }
LABEL_7:
  if (self->_stringValue)
  {
    objc_msgSend(v6, "setStringValue:");
    id v4 = v6;
  }
  if (self->_bytesValue)
  {
    objc_msgSend(v6, "setBytesValue:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 16) = self->_numberIntValue;
    *(unsigned char *)(v5 + 56) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(double *)(v5 + 24) = self->_timestamp;
  *(unsigned char *)(v5 + 56) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_numberDoubleValue;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
LABEL_5:
  uint64_t v9 = [(NSString *)self->_stringValue copyWithZone:a3];
  v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  uint64_t v11 = [(NSData *)self->_bytesValue copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_timestamp != *((double *)v4 + 3)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
LABEL_23:
    char v8 = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_numberIntValue != *((void *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_numberDoubleValue != *((double *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_23;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 6)
    && !-[NSString isEqual:](stringValue, "isEqual:"))
  {
    goto LABEL_23;
  }
  bytesValue = self->_bytesValue;
  if ((unint64_t)bytesValue | *((void *)v4 + 4)) {
    char v8 = -[NSData isEqual:](bytesValue, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_24:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double timestamp = self->_timestamp;
    double v7 = -timestamp;
    if (timestamp >= 0.0) {
      double v7 = self->_timestamp;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0)
  {
    uint64_t v10 = 2654435761 * self->_numberIntValue;
    if (has) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v15 = 0;
    goto LABEL_19;
  }
  uint64_t v10 = 0;
  if ((has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double numberDoubleValue = self->_numberDoubleValue;
  double v12 = -numberDoubleValue;
  if (numberDoubleValue >= 0.0) {
    double v12 = self->_numberDoubleValue;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_19:
  NSUInteger v16 = v5 ^ v3 ^ v10 ^ v15 ^ [(NSString *)self->_stringValue hash];
  return v16 ^ [(NSData *)self->_bytesValue hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 5))
  {
    -[HDCodableTimestampedKeyValuePair setKey:](self, "setKey:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 4) != 0)
  {
    self->_double timestamp = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_numberIntValue = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 56))
  {
LABEL_6:
    self->_double numberDoubleValue = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
  if (*((void *)v4 + 6))
  {
    -[HDCodableTimestampedKeyValuePair setStringValue:](self, "setStringValue:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[HDCodableTimestampedKeyValuePair setBytesValue:](self, "setBytesValue:");
    id v4 = v6;
  }
}

- (NSString)key
{
  return self->_key;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)numberIntValue
{
  return self->_numberIntValue;
}

- (double)numberDoubleValue
{
  return self->_numberDoubleValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (NSData)bytesValue
{
  return self->_bytesValue;
}

- (void)setBytesValue:(id)a3
{
}

- (HDCodableTimestampedKeyValuePair)initWithKey:(id)a3 value:(id)a4 timestamp:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDCodableTimestampedKeyValuePair;
  uint64_t v11 = [(HDCodableTimestampedKeyValuePair *)&v14 init];
  double v12 = v11;
  if (v11)
  {
    [(HDCodableTimestampedKeyValuePair *)v11 setKey:v8];
    [(HDCodableTimestampedKeyValuePair *)v12 setValue:v9];
    [(HDCodableTimestampedKeyValuePair *)v12 setTimestampWithDate:v10];
  }

  return v12;
}

- (id)decodedValue
{
  if (*(unsigned char *)&self->_has)
  {
    NSUInteger v3 = [NSNumber numberWithDouble:self->_numberDoubleValue];
  }
  else if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    NSUInteger v3 = [NSNumber numberWithLongLong:self->_numberIntValue];
  }
  else
  {
    stringValue = (NSData *)self->_stringValue;
    if (stringValue || (stringValue = self->_bytesValue) != 0) {
      NSUInteger v3 = stringValue;
    }
    else {
      NSUInteger v3 = 0;
    }
  }

  return v3;
}

- (id)decodedTimestamp
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v2 = HDDecodeDateForValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end