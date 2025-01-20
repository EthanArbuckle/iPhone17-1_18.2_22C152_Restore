@interface HDCodableUserDomainConceptProperty
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasDataValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasIntegerValue;
- (BOOL)hasStringValue;
- (BOOL)hasTimestamp;
- (BOOL)hasType;
- (BOOL)hasValueType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dataValue;
- (NSString)stringValue;
- (double)doubleValue;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)integerValue;
- (int64_t)type;
- (int64_t)valueType;
- (int64_t)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setDataValue:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntegerValue:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasValueType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIntegerValue:(int64_t)a3;
- (void)setStringValue:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int64_t)a3;
- (void)setValueType:(int64_t)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableUserDomainConceptProperty

- (void)setType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setValueType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_valueType = a3;
}

- (void)setHasValueType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasValueType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
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

- (void)setIntegerValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_integerValue = a3;
}

- (void)setHasIntegerValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntegerValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBoolValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasBoolValue
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableUserDomainConceptProperty;
  v4 = [(HDCodableUserDomainConceptProperty *)&v8 description];
  v5 = [(HDCodableUserDomainConceptProperty *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v11 = [NSNumber numberWithLongLong:self->_type];
    [v3 setObject:v11 forKey:@"type"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v12 = [NSNumber numberWithLongLong:self->_version];
  [v3 setObject:v12 forKey:@"version"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_19:
  v13 = [NSNumber numberWithDouble:self->_timestamp];
  [v3 setObject:v13 forKey:@"timestamp"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v5 = [NSNumber numberWithLongLong:self->_valueType];
    [v3 setObject:v5 forKey:@"valueType"];
  }
LABEL_6:
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"stringValue"];
  }
  char v7 = (char)self->_has;
  if (v7)
  {
    v14 = [NSNumber numberWithDouble:self->_doubleValue];
    [v3 setObject:v14 forKey:@"doubleValue"];

    char v7 = (char)self->_has;
    if ((v7 & 2) == 0)
    {
LABEL_10:
      if ((v7 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  v15 = [NSNumber numberWithLongLong:self->_integerValue];
  [v3 setObject:v15 forKey:@"integerValue"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    objc_super v8 = [NSNumber numberWithBool:self->_BOOLValue];
    [v3 setObject:v8 forKey:@"BOOLValue"];
  }
LABEL_12:
  dataValue = self->_dataValue;
  if (dataValue) {
    [v3 setObject:dataValue forKey:@"dataValue"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableUserDomainConceptPropertyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
LABEL_6:
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    char v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
LABEL_12:
  if (self->_dataValue)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = self->_type;
    *((unsigned char *)v4 + 76) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_version;
  *((unsigned char *)v4 + 76) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_19:
  v4[3] = *(void *)&self->_timestamp;
  *((unsigned char *)v4 + 76) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v4[5] = self->_valueType;
    *((unsigned char *)v4 + 76) |= 0x10u;
  }
LABEL_6:
  id v7 = v4;
  if (self->_stringValue)
  {
    objc_msgSend(v4, "setStringValue:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    v4[1] = *(void *)&self->_doubleValue;
    *((unsigned char *)v4 + 76) |= 1u;
    char v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  v4[2] = self->_integerValue;
  *((unsigned char *)v4 + 76) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    *((unsigned char *)v4 + 72) = self->_BOOLValue;
    *((unsigned char *)v4 + 76) |= 0x40u;
  }
LABEL_12:
  if (self->_dataValue)
  {
    objc_msgSend(v7, "setDataValue:");
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_type;
    *(unsigned char *)(v5 + 76) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 48) = self->_version;
  *(unsigned char *)(v5 + 76) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  *(double *)(v5 + 24) = self->_timestamp;
  *(unsigned char *)(v5 + 76) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *(void *)(v5 + 40) = self->_valueType;
    *(unsigned char *)(v5 + 76) |= 0x10u;
  }
LABEL_6:
  uint64_t v8 = [(NSString *)self->_stringValue copyWithZone:a3];
  v9 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v8;

  char v10 = (char)self->_has;
  if ((v10 & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    *(void *)(v6 + 16) = self->_integerValue;
    *(unsigned char *)(v6 + 76) |= 2u;
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  *(double *)(v6 + 8) = self->_doubleValue;
  *(unsigned char *)(v6 + 76) |= 1u;
  char v10 = (char)self->_has;
  if ((v10 & 2) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if ((v10 & 0x40) != 0)
  {
LABEL_9:
    *(unsigned char *)(v6 + 72) = self->_BOOLValue;
    *(unsigned char *)(v6 + 76) |= 0x40u;
  }
LABEL_10:
  uint64_t v11 = [(NSData *)self->_dataValue copyWithZone:a3];
  v12 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v11;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 76);
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 8) == 0 || self->_type != *((void *)v4 + 4)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 8) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 0x20) == 0 || self->_version != *((void *)v4 + 6)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 0x20) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) == 0 || self->_timestamp != *((double *)v4 + 3)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 0x10) == 0 || self->_valueType != *((void *)v4 + 5)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 0x10) != 0)
  {
    goto LABEL_39;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_39;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 76);
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_doubleValue != *((double *)v4 + 1)) {
      goto LABEL_39;
    }
  }
  else if (v6)
  {
    goto LABEL_39;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_integerValue != *((void *)v4 + 2)) {
      goto LABEL_39;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((has & 0x40) == 0)
  {
    if ((v6 & 0x40) == 0) {
      goto LABEL_45;
    }
LABEL_39:
    char v8 = 0;
    goto LABEL_40;
  }
  if ((v6 & 0x40) == 0) {
    goto LABEL_39;
  }
  if (!self->_BOOLValue)
  {
    if (!*((unsigned char *)v4 + 72)) {
      goto LABEL_45;
    }
    goto LABEL_39;
  }
  if (!*((unsigned char *)v4 + 72)) {
    goto LABEL_39;
  }
LABEL_45:
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((void *)v4 + 7)) {
    char v8 = -[NSData isEqual:](dataValue, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_40:

  return v8;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v10 = 0;
    goto LABEL_13;
  }
  uint64_t v4 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_version;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double timestamp = self->_timestamp;
  double v7 = -timestamp;
  if (timestamp >= 0.0) {
    double v7 = self->_timestamp;
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
LABEL_13:
  if ((has & 0x10) != 0) {
    uint64_t v11 = 2654435761 * self->_valueType;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = [(NSString *)self->_stringValue hash];
  char v13 = (char)self->_has;
  if (v13)
  {
    double doubleValue = self->_doubleValue;
    double v16 = -doubleValue;
    if (doubleValue >= 0.0) {
      double v16 = self->_doubleValue;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((v13 & 2) != 0)
  {
    uint64_t v19 = 2654435761 * self->_integerValue;
    if ((v13 & 0x40) != 0) {
      goto LABEL_26;
    }
LABEL_28:
    uint64_t v20 = 0;
    return v5 ^ v4 ^ v10 ^ v11 ^ v14 ^ v19 ^ v20 ^ v12 ^ [(NSData *)self->_dataValue hash];
  }
  uint64_t v19 = 0;
  if ((v13 & 0x40) == 0) {
    goto LABEL_28;
  }
LABEL_26:
  uint64_t v20 = 2654435761 * self->_BOOLValue;
  return v5 ^ v4 ^ v10 ^ v11 ^ v14 ^ v19 ^ v20 ^ v12 ^ [(NSData *)self->_dataValue hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 76);
  if ((v5 & 8) != 0)
  {
    self->_type = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 76);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_version = *((void *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 76);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_19:
  self->_double timestamp = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 76) & 0x10) != 0)
  {
LABEL_5:
    self->_valueType = *((void *)v4 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_6:
  id v7 = v4;
  if (*((void *)v4 + 8))
  {
    -[HDCodableUserDomainConceptProperty setStringValue:](self, "setStringValue:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 76);
  if (v6)
  {
    self->_double doubleValue = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 76);
    if ((v6 & 2) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) == 0)
  {
    goto LABEL_10;
  }
  self->_integerValue = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 76) & 0x40) != 0)
  {
LABEL_11:
    self->_BOOLValue = *((unsigned char *)v4 + 72);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_12:
  if (*((void *)v4 + 7))
  {
    -[HDCodableUserDomainConceptProperty setDataValue:](self, "setDataValue:");
    id v4 = v7;
  }
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

- (int64_t)valueType
{
  return self->_valueType;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);

  objc_storeStrong((id *)&self->_dataValue, 0);
}

@end