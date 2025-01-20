@interface HDCodableUserDomainConceptLocalizedStringProperty
- (BOOL)deleted;
- (BOOL)hasDeleted;
- (BOOL)hasLocale;
- (BOOL)hasStringValue;
- (BOOL)hasTimestamp;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)locale;
- (NSString)stringValue;
- (double)timestamp;
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
- (void)setHasVersion:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int64_t)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableUserDomainConceptLocalizedStringProperty

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
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)setDeleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeleted
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableUserDomainConceptLocalizedStringProperty;
  v4 = [(HDCodableUserDomainConceptLocalizedStringProperty *)&v8 description];
  v5 = [(HDCodableUserDomainConceptLocalizedStringProperty *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v10 = [NSNumber numberWithLongLong:self->_type];
    [v3 setObject:v10 forKey:@"type"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v11 = [NSNumber numberWithLongLong:self->_version];
  [v3 setObject:v11 forKey:@"version"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v5 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];
  }
LABEL_5:
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"stringValue"];
  }
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKey:@"locale"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_deleted];
    [v3 setObject:v8 forKey:@"deleted"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableUserDomainConceptLocalizedStringPropertyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    PBDataWriterWriteDoubleField();
LABEL_5:
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  if (self->_locale) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_type;
    *((unsigned char *)v4 + 52) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_version;
  *((unsigned char *)v4 + 52) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v4[1] = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 52) |= 1u;
  }
LABEL_5:
  v6 = v4;
  if (self->_stringValue)
  {
    objc_msgSend(v4, "setStringValue:");
    v4 = v6;
  }
  if (self->_locale)
  {
    objc_msgSend(v6, "setLocale:");
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v4 + 48) = self->_deleted;
    *((unsigned char *)v4 + 52) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_type;
    *(unsigned char *)(v5 + 52) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 24) = self->_version;
  *(unsigned char *)(v5 + 52) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_stringValue copyWithZone:a3];
  v9 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_locale copyWithZone:a3];
  v11 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v10;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v6 + 48) = self->_deleted;
    *(unsigned char *)(v6 + 52) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_type != *((void *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_version != *((void *)v4 + 3)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_23;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 5)
    && !-[NSString isEqual:](stringValue, "isEqual:"))
  {
    goto LABEL_23;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](locale, "isEqual:")) {
      goto LABEL_23;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 52) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0)
    {
LABEL_23:
      BOOL v7 = 0;
      goto LABEL_24;
    }
    if (self->_deleted)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_23;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_23;
    }
    BOOL v7 = 1;
  }
LABEL_24:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v9 = 0;
    goto LABEL_13;
  }
  uint64_t v3 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_version;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double timestamp = self->_timestamp;
  double v6 = -timestamp;
  if (timestamp >= 0.0) {
    double v6 = self->_timestamp;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_13:
  NSUInteger v10 = [(NSString *)self->_stringValue hash];
  NSUInteger v11 = [(NSString *)self->_locale hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v12 = 2654435761 * self->_deleted;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 2) != 0)
  {
    self->_type = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 52);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_version = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 52))
  {
LABEL_4:
    self->_double timestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  id v6 = v4;
  if (*((void *)v4 + 5))
  {
    -[HDCodableUserDomainConceptLocalizedStringProperty setStringValue:](self, "setStringValue:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[HDCodableUserDomainConceptLocalizedStringProperty setLocale:](self, "setLocale:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    self->_deleted = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 8u;
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

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end