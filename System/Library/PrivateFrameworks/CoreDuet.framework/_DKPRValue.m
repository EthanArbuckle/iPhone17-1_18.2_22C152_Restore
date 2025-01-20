@interface _DKPRValue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)dateValue;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)blobValue;
- (uint64_t)integerValue;
- (uint64_t)setDateValue:(uint64_t)result;
- (uint64_t)setDoubleValue:(uint64_t)result;
- (uint64_t)setIntegerValue:(uint64_t)result;
- (uint64_t)stringValue;
- (uint64_t)type;
- (unint64_t)hash;
- (void)setBlobValue:(uint64_t)a1;
- (void)setStringValue:(uint64_t)a1;
- (void)setType:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _DKPRValue

- (uint64_t)type
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (void)setType:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setStringValue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_blobValue, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_type) {
    -[_DKPRValue writeTo:]();
  }
  id v7 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = v7;
  }
  if (self->_blobValue)
  {
    PBDataWriterWriteDataField();
    v6 = v7;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    v6 = v7;
  }
}

- (uint64_t)setDoubleValue:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 56) |= 2u;
    *(double *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setIntegerValue:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 56) |= 4u;
    *(void *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)setDateValue:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 56) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_DKPRValue;
  id v4 = [(_DKPRValue *)&v8 description];
  v5 = [(_DKPRValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  type = self->_type;
  if (type)
  {
    v5 = [(_DKPRValueType *)type dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"type"];
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"stringValue"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_integerValue];
    [v3 setObject:v8 forKey:@"integerValue"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithDouble:self->_doubleValue];
    [v3 setObject:v9 forKey:@"doubleValue"];
  }
  blobValue = self->_blobValue;
  if (blobValue) {
    [v3 setObject:blobValue forKey:@"blobValue"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = [NSNumber numberWithDouble:self->_dateValue];
    [v3 setObject:v11 forKey:@"dateValue"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPRValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)setBlobValue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_DKPRValueType *)self->_type copyWithZone:a3];
  id v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_stringValue copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_integerValue;
    *(unsigned char *)(v5 + 56) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_doubleValue;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  uint64_t v11 = [(NSData *)self->_blobValue copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_dateValue;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  type = self->_type;
  if ((unint64_t)type | *((void *)v4 + 6))
  {
    if (!-[_DKPRValueType isEqual:](type, "isEqual:")) {
      goto LABEL_23;
    }
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_23;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_integerValue != *((void *)v4 + 3)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_doubleValue != *((double *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  blobValue = self->_blobValue;
  if ((unint64_t)blobValue | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](blobValue, "isEqual:"))
    {
LABEL_23:
      BOOL v9 = 0;
      goto LABEL_24;
    }
    char has = (char)self->_has;
  }
  BOOL v9 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_dateValue != *((double *)v4 + 1)) {
      goto LABEL_23;
    }
    BOOL v9 = 1;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_DKPRValueType *)self->_type hash];
  NSUInteger v4 = [(NSString *)self->_stringValue hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_integerValue;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double doubleValue = self->_doubleValue;
  double v7 = -doubleValue;
  if (doubleValue >= 0.0) {
    double v7 = self->_doubleValue;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  uint64_t v11 = [(NSData *)self->_blobValue hash];
  if (*(unsigned char *)&self->_has)
  {
    double dateValue = self->_dateValue;
    double v14 = -dateValue;
    if (dateValue >= 0.0) {
      double v14 = self->_dateValue;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12;
}

- (uint64_t)stringValue
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)integerValue
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (double)doubleValue
{
  if (a1) {
    return *(double *)(a1 + 16);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)blobValue
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (double)dateValue
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_DKPRValue writeTo:]", "_DKPRValue.m", 188, "self->_type != nil");
}

@end