@interface HDCodableUserDomainConceptNamedQuantity
- (BOOL)deleted;
- (BOOL)hasDeleted;
- (BOOL)hasName;
- (BOOL)hasTimestamp;
- (BOOL)hasType;
- (BOOL)hasUnit;
- (BOOL)hasValue;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)name;
- (NSString)unit;
- (double)timestamp;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)type;
- (int64_t)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int64_t)a3;
- (void)setUnit:(id)a3;
- (void)setValue:(double)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableUserDomainConceptNamedQuantity

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setValue:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasUnit
{
  return self->_unit != 0;
}

- (void)setType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDeleted
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableUserDomainConceptNamedQuantity;
  v4 = [(HDCodableUserDomainConceptNamedQuantity *)&v8 description];
  v5 = [(HDCodableUserDomainConceptNamedQuantity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v6 = [NSNumber numberWithDouble:self->_value];
    [v4 setObject:v6 forKey:@"value"];
  }
  unit = self->_unit;
  if (unit) {
    [v4 setObject:unit forKey:@"unit"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = [NSNumber numberWithLongLong:self->_type];
    [v4 setObject:v11 forKey:@"type"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  v12 = [NSNumber numberWithLongLong:self->_version];
  [v4 setObject:v12 forKey:@"version"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  v13 = [NSNumber numberWithDouble:self->_timestamp];
  [v4 setObject:v13 forKey:@"timestamp"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    v9 = [NSNumber numberWithBool:self->_deleted];
    [v4 setObject:v9 forKey:@"deleted"];
  }
LABEL_12:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableUserDomainConceptNamedQuantityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_unit)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_12:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_value;
    *((unsigned char *)v4 + 60) |= 4u;
  }
  if (self->_unit)
  {
    objc_msgSend(v6, "setUnit:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_type;
    *((unsigned char *)v4 + 60) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 4) = self->_version;
  *((unsigned char *)v4 + 60) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  *((void *)v4 + 1) = *(void *)&self->_timestamp;
  *((unsigned char *)v4 + 60) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    *((unsigned char *)v4 + 56) = self->_deleted;
    *((unsigned char *)v4 + 60) |= 0x10u;
  }
LABEL_12:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_value;
    *(unsigned char *)(v5 + 60) |= 4u;
  }
  uint64_t v8 = [(NSString *)self->_unit copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_type;
    *(unsigned char *)(v5 + 60) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(double *)(v5 + 8) = self->_timestamp;
      *(unsigned char *)(v5 + 60) |= 1u;
      if ((*(unsigned char *)&self->_has & 0x10) == 0) {
        return (id)v5;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v5 + 32) = self->_version;
  *(unsigned char *)(v5 + 60) |= 8u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    *(unsigned char *)(v5 + 56) = self->_deleted;
    *(unsigned char *)(v5 + 60) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_29;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 60);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_value != *((double *)v4 + 3)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_29;
  }
  unit = self->_unit;
  if ((unint64_t)unit | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](unit, "isEqual:")) {
      goto LABEL_29;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 60);
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_type != *((void *)v4 + 2)) {
      goto LABEL_29;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_version != *((void *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_29;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (v7)
  {
    goto LABEL_29;
  }
  BOOL v9 = (v7 & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) != 0)
    {
      if (self->_deleted)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_29;
        }
      }
      else if (*((unsigned char *)v4 + 56))
      {
        goto LABEL_29;
      }
      BOOL v9 = 1;
      goto LABEL_30;
    }
LABEL_29:
    BOOL v9 = 0;
  }
LABEL_30:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    double value = self->_value;
    double v6 = -value;
    if (value >= 0.0) {
      double v6 = self->_value;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_unit hash];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_11;
    }
LABEL_17:
    uint64_t v12 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_12;
    }
LABEL_18:
    unint64_t v17 = 0;
    goto LABEL_21;
  }
  uint64_t v11 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_17;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_version;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_18;
  }
LABEL_12:
  double timestamp = self->_timestamp;
  double v14 = -timestamp;
  if (timestamp >= 0.0) {
    double v14 = self->_timestamp;
  }
  long double v15 = floor(v14 + 0.5);
  double v16 = (v14 - v15) * 1.84467441e19;
  unint64_t v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0) {
      v17 += (unint64_t)v16;
    }
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
LABEL_21:
  if ((has & 0x10) != 0) {
    uint64_t v18 = 2654435761 * self->_deleted;
  }
  else {
    uint64_t v18 = 0;
  }
  return v4 ^ v3 ^ v9 ^ v11 ^ v12 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 5))
  {
    -[HDCodableUserDomainConceptNamedQuantity setName:](self, "setName:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    self->_double value = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 6))
  {
    -[HDCodableUserDomainConceptNamedQuantity setUnit:](self, "setUnit:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 2) != 0)
  {
    self->_type = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 60);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_version = *((void *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  self->_double timestamp = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
LABEL_11:
    self->_deleted = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_12:
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)value
{
  return self->_value;
}

- (NSString)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)version
{
  return self->_version;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end