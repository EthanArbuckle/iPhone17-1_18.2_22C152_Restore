@interface PDDPBinaryValue
- (BOOL)hasValue;
- (BOOL)hasValueType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)valueTypeAsString:(int)a3;
- (int)StringAsValueType:(id)a3;
- (int)valueType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setHasValueType:(BOOL)a3;
- (void)setValue:(BOOL)a3;
- (void)setValueType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPBinaryValue

- (void)setValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)valueType
{
  if (*(unsigned char *)&self->_has) {
    return self->_valueType;
  }
  else {
    return 0;
  }
}

- (void)setValueType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_valueType = a3;
}

- (void)setHasValueType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValueType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)valueTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1001F63D0 + a3);
  }

  return v3;
}

- (int)StringAsValueType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRUE_FALSE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PASS_FAIL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"YES_NO"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CORRECT_INCORRECT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPBinaryValue;
  id v3 = [(PDDPBinaryValue *)&v7 description];
  int v4 = [(PDDPBinaryValue *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithBool:self->_value];
    [v3 setObject:v5 forKey:@"value"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t valueType = self->_valueType;
    if (valueType >= 5)
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_valueType];
    }
    else
    {
      objc_super v7 = *(&off_1001F63D0 + valueType);
    }
    [v3 setObject:v7 forKey:@"value_type"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100167638((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[12] = self->_value;
    v4[16] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_valueType;
    v4[16] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 12) = self->_value;
    *((unsigned char *)result + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)result + 2) = self->_valueType;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) != 0)
    {
      if (self->_value)
      {
        if (!*((unsigned char *)v4 + 12)) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 12)) {
        goto LABEL_10;
      }
    }
LABEL_14:
    BOOL v5 = 0;
    goto LABEL_15;
  }
  if ((*((unsigned char *)v4 + 16) & 2) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_valueType != *((_DWORD *)v4 + 2)) {
      goto LABEL_14;
    }
    BOOL v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_value;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_valueType;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_value = *((unsigned char *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if (v5)
  {
    self->_uint64_t valueType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)value
{
  return self->_value;
}

@end