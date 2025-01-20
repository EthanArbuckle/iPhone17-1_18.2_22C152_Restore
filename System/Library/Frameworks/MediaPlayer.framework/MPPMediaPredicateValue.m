@interface MPPMediaPredicateValue
- (BOOL)BOOLPredicateValue;
- (BOOL)hasBoolPredicateValue;
- (BOOL)hasBytesPredicateValue;
- (BOOL)hasDoublePredicateValue;
- (BOOL)hasFloatPredicateValue;
- (BOOL)hasIntegerPredicateValue;
- (BOOL)hasStringPredicateValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)bytesPredicateValue;
- (NSString)stringPredicateValue;
- (double)doublePredicateValue;
- (float)floatPredicateValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)type;
- (int64_t)integerPredicateValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)setBoolPredicateValue:(BOOL)a3;
- (void)setBytesPredicateValue:(id)a3;
- (void)setDoublePredicateValue:(double)a3;
- (void)setFloatPredicateValue:(float)a3;
- (void)setHasBoolPredicateValue:(BOOL)a3;
- (void)setHasDoublePredicateValue:(BOOL)a3;
- (void)setHasFloatPredicateValue:(BOOL)a3;
- (void)setHasIntegerPredicateValue:(BOOL)a3;
- (void)setIntegerPredicateValue:(int64_t)a3;
- (void)setStringPredicateValue:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MPPMediaPredicateValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringPredicateValue, 0);

  objc_storeStrong((id *)&self->_bytesPredicateValue, 0);
}

- (void)setBytesPredicateValue:(id)a3
{
}

- (NSData)bytesPredicateValue
{
  return self->_bytesPredicateValue;
}

- (void)setStringPredicateValue:(id)a3
{
}

- (NSString)stringPredicateValue
{
  return self->_stringPredicateValue;
}

- (BOOL)BOOLPredicateValue
{
  return self->_BOOLPredicateValue;
}

- (float)floatPredicateValue
{
  return self->_floatPredicateValue;
}

- (double)doublePredicateValue
{
  return self->_doublePredicateValue;
}

- (int64_t)integerPredicateValue
{
  return self->_integerPredicateValue;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)type
{
  return self->_type;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_integerPredicateValue;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t type = self->_type;
  if (*(unsigned char *)&self->_has)
  {
    double doublePredicateValue = self->_doublePredicateValue;
    double v8 = -doublePredicateValue;
    if (doublePredicateValue >= 0.0) {
      double v8 = self->_doublePredicateValue;
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
    float floatPredicateValue = self->_floatPredicateValue;
    double v13 = floatPredicateValue;
    if (floatPredicateValue < 0.0) {
      double v13 = -floatPredicateValue;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((has & 8) != 0) {
    uint64_t v16 = 2654435761 * self->_BOOLPredicateValue;
  }
  else {
    uint64_t v16 = 0;
  }
  NSUInteger v17 = v4 ^ v6 ^ v11 ^ v16 ^ [(NSString *)self->_stringPredicateValue hash];
  return v17 ^ [(NSData *)self->_bytesPredicateValue hash] ^ (2654435761 * type);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || self->_type != *((_DWORD *)v4 + 12)) {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[56] & 2) == 0 || self->_integerPredicateValue != *((void *)v4 + 2)) {
      goto LABEL_27;
    }
  }
  else if ((v4[56] & 2) != 0)
  {
LABEL_27:
    char v7 = 0;
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[56] & 1) == 0 || self->_doublePredicateValue != *((double *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (v4[56])
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[56] & 4) == 0 || self->_floatPredicateValue != *((float *)v4 + 8)) {
      goto LABEL_27;
    }
  }
  else if ((v4[56] & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[56] & 8) == 0 || self->_BOOLPredicateValue != v4[52]) {
      goto LABEL_27;
    }
  }
  else if ((v4[56] & 8) != 0)
  {
    goto LABEL_27;
  }
  stringPredicateValue = self->_stringPredicateValue;
  if ((unint64_t)stringPredicateValue | *((void *)v4 + 5)
    && !-[NSString isEqual:](stringPredicateValue, "isEqual:"))
  {
    goto LABEL_27;
  }
  bytesPredicateValue = self->_bytesPredicateValue;
  if ((unint64_t)bytesPredicateValue | *((void *)v4 + 3)) {
    char v7 = -[NSData isEqual:](bytesPredicateValue, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_28:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  *(_DWORD *)(v5 + 48) = self->_type;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_integerPredicateValue;
    *(unsigned char *)(v5 + 56) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(float *)(v5 + 32) = self->_floatPredicateValue;
      *(unsigned char *)(v5 + 56) |= 4u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 8) = self->_doublePredicateValue;
  *(unsigned char *)(v5 + 56) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(unsigned char *)(v5 + 52) = self->_BOOLPredicateValue;
    *(unsigned char *)(v5 + 56) |= 8u;
  }
LABEL_6:
  uint64_t v8 = [(NSString *)self->_stringPredicateValue copyWithZone:a3];
  long double v9 = (void *)v6[5];
  v6[5] = v8;

  uint64_t v10 = [(NSData *)self->_bytesPredicateValue copyWithZone:a3];
  unint64_t v11 = (void *)v6[3];
  v6[3] = v10;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "setType:", -[MPPMediaPredicateValue type](self, "type"));
  if ([(MPPMediaPredicateValue *)self hasIntegerPredicateValue]) {
    objc_msgSend(v6, "setIntegerPredicateValue:", -[MPPMediaPredicateValue integerPredicateValue](self, "integerPredicateValue"));
  }
  if ([(MPPMediaPredicateValue *)self hasDoublePredicateValue])
  {
    [(MPPMediaPredicateValue *)self doublePredicateValue];
    objc_msgSend(v6, "setDoublePredicateValue:");
  }
  if ([(MPPMediaPredicateValue *)self hasFloatPredicateValue])
  {
    [(MPPMediaPredicateValue *)self floatPredicateValue];
    objc_msgSend(v6, "setFloatPredicateValue:");
  }
  if ([(MPPMediaPredicateValue *)self hasBoolPredicateValue]) {
    objc_msgSend(v6, "setBoolPredicateValue:", -[MPPMediaPredicateValue BOOLPredicateValue](self, "BOOLPredicateValue"));
  }
  if ([(MPPMediaPredicateValue *)self hasStringPredicateValue])
  {
    uint64_t v4 = [(MPPMediaPredicateValue *)self stringPredicateValue];
    [v6 setStringPredicateValue:v4];
  }
  if ([(MPPMediaPredicateValue *)self hasBytesPredicateValue])
  {
    uint64_t v5 = [(MPPMediaPredicateValue *)self bytesPredicateValue];
    [v6 setBytesPredicateValue:v5];
  }
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  [v9 writeInt32:self->_type forTag:1];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v9 writeInt64:self->_integerPredicateValue forTag:2];
    char has = (char)self->_has;
  }
  if (has)
  {
    [v9 writeDouble:3 forTag:self->_doublePredicateValue];
    char has = (char)self->_has;
  }
  id v6 = v9;
  if ((has & 4) != 0)
  {
    *(float *)&double v4 = self->_floatPredicateValue;
    [v9 writeFloat:4 forTag:v4];
    id v6 = v9;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    [v9 writeBOOL:self->_BOOLPredicateValue forTag:5];
    id v6 = v9;
  }
  stringPredicateValue = self->_stringPredicateValue;
  if (stringPredicateValue)
  {
    [v9 writeString:stringPredicateValue forTag:6];
    id v6 = v9;
  }
  bytesPredicateValue = self->_bytesPredicateValue;
  if (bytesPredicateValue)
  {
    [v9 writeData:bytesPredicateValue forTag:7];
    id v6 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MPPMediaPredicateValueReadFrom(self, a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  double v4 = [NSNumber numberWithInt:self->_type];
  [v3 setObject:v4 forKey:@"type"];

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unint64_t v11 = [NSNumber numberWithLongLong:self->_integerPredicateValue];
    [v3 setObject:v11 forKey:@"integerPredicateValue"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v12 = [NSNumber numberWithDouble:self->_doublePredicateValue];
  [v3 setObject:v12 forKey:@"doublePredicateValue"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  *(float *)&double v5 = self->_floatPredicateValue;
  double v13 = [NSNumber numberWithFloat:v5];
  [v3 setObject:v13 forKey:@"floatPredicateValue"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    char v7 = [NSNumber numberWithBool:self->_BOOLPredicateValue];
    [v3 setObject:v7 forKey:@"BOOLPredicateValue"];
  }
LABEL_6:
  stringPredicateValue = self->_stringPredicateValue;
  if (stringPredicateValue) {
    [v3 setObject:stringPredicateValue forKey:@"stringPredicateValue"];
  }
  bytesPredicateValue = self->_bytesPredicateValue;
  if (bytesPredicateValue) {
    [v3 setObject:bytesPredicateValue forKey:@"bytesPredicateValue"];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MPPMediaPredicateValue;
  double v4 = [(MPPMediaPredicateValue *)&v8 description];
  double v5 = [(MPPMediaPredicateValue *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBytesPredicateValue
{
  return self->_bytesPredicateValue != 0;
}

- (BOOL)hasStringPredicateValue
{
  return self->_stringPredicateValue != 0;
}

- (BOOL)hasBoolPredicateValue
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasBoolPredicateValue:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setBoolPredicateValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_BOOLPredicateValue = a3;
}

- (BOOL)hasFloatPredicateValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasFloatPredicateValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setFloatPredicateValue:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float floatPredicateValue = a3;
}

- (BOOL)hasDoublePredicateValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDoublePredicateValue:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDoublePredicateValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double doublePredicateValue = a3;
}

- (BOOL)hasIntegerPredicateValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasIntegerPredicateValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setIntegerPredicateValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_integerPredicateValue = a3;
}

- (void)dealloc
{
  [(MPPMediaPredicateValue *)self setStringPredicateValue:0];
  [(MPPMediaPredicateValue *)self setBytesPredicateValue:0];
  v3.receiver = self;
  v3.super_class = (Class)MPPMediaPredicateValue;
  [(MPPMediaPredicateValue *)&v3 dealloc];
}

@end