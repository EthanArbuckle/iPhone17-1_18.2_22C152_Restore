@interface ACHCodableEarnedInstance
- (ACHCodableSyncIdentity)syncIdentity;
- (BOOL)hasCreatedDate;
- (BOOL)hasCreatorDevice;
- (BOOL)hasEarnedDateComponents;
- (BOOL)hasExternalIdentifier;
- (BOOL)hasKey;
- (BOOL)hasSyncIdentity;
- (BOOL)hasTemplateUniqueName;
- (BOOL)hasValue;
- (BOOL)hasValueUnitString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)earnedDateComponents;
- (NSString)externalIdentifier;
- (NSString)templateUniqueName;
- (NSString)valueUnitString;
- (double)createdDate;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)creatorDevice;
- (int64_t)key;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreatedDate:(double)a3;
- (void)setCreatorDevice:(int64_t)a3;
- (void)setEarnedDateComponents:(id)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setHasCreatedDate:(BOOL)a3;
- (void)setHasCreatorDevice:(BOOL)a3;
- (void)setHasKey:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setKey:(int64_t)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setTemplateUniqueName:(id)a3;
- (void)setValue:(double)a3;
- (void)setValueUnitString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACHCodableEarnedInstance

- (BOOL)hasTemplateUniqueName
{
  return self->_templateUniqueName != 0;
}

- (BOOL)hasEarnedDateComponents
{
  return self->_earnedDateComponents != 0;
}

- (void)setCreatedDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_createdDate = a3;
}

- (void)setHasCreatedDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreatedDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCreatorDevice:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_creatorDevice = a3;
}

- (void)setHasCreatorDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCreatorDevice
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setValue:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasValue
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasValueUnitString
{
  return self->_valueUnitString != 0;
}

- (void)setKey:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_key = a3;
}

- (void)setHasKey:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKey
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasExternalIdentifier
{
  return self->_externalIdentifier != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACHCodableEarnedInstance;
  v4 = [(ACHCodableEarnedInstance *)&v8 description];
  v5 = [(ACHCodableEarnedInstance *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  templateUniqueName = self->_templateUniqueName;
  if (templateUniqueName) {
    [v3 setObject:templateUniqueName forKey:@"templateUniqueName"];
  }
  earnedDateComponents = self->_earnedDateComponents;
  if (earnedDateComponents) {
    [v4 setObject:earnedDateComponents forKey:@"earnedDateComponents"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v15 = [NSNumber numberWithDouble:self->_createdDate];
    [v4 setObject:v15 forKey:@"createdDate"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  v16 = [NSNumber numberWithLongLong:self->_creatorDevice];
  [v4 setObject:v16 forKey:@"creatorDevice"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    objc_super v8 = [NSNumber numberWithDouble:self->_value];
    [v4 setObject:v8 forKey:@"value"];
  }
LABEL_9:
  valueUnitString = self->_valueUnitString;
  if (valueUnitString) {
    [v4 setObject:valueUnitString forKey:@"valueUnitString"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v10 = [NSNumber numberWithLongLong:self->_key];
    [v4 setObject:v10 forKey:@"key"];
  }
  externalIdentifier = self->_externalIdentifier;
  if (externalIdentifier) {
    [v4 setObject:externalIdentifier forKey:@"externalIdentifier"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v13 = [(ACHCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"syncIdentity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ACHCodableEarnedInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_templateUniqueName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_earnedDateComponents)
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
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_9:
  if (self->_valueUnitString)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_externalIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_templateUniqueName)
  {
    objc_msgSend(v4, "setTemplateUniqueName:");
    id v4 = v6;
  }
  if (self->_earnedDateComponents)
  {
    objc_msgSend(v6, "setEarnedDateComponents:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_createdDate;
    *((unsigned char *)v4 + 80) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 2) = self->_creatorDevice;
  *((unsigned char *)v4 + 80) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    *((void *)v4 + 4) = *(void *)&self->_value;
    *((unsigned char *)v4 + 80) |= 8u;
  }
LABEL_9:
  if (self->_valueUnitString)
  {
    objc_msgSend(v6, "setValueUnitString:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_key;
    *((unsigned char *)v4 + 80) |= 4u;
  }
  if (self->_externalIdentifier)
  {
    objc_msgSend(v6, "setExternalIdentifier:");
    id v4 = v6;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v6, "setSyncIdentity:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_templateUniqueName copyWithZone:a3];
  v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  uint64_t v8 = [(NSString *)self->_earnedDateComponents copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_createdDate;
    *(unsigned char *)(v5 + 80) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_creatorDevice;
  *(unsigned char *)(v5 + 80) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(double *)(v5 + 32) = self->_value;
    *(unsigned char *)(v5 + 80) |= 8u;
  }
LABEL_5:
  uint64_t v11 = [(NSString *)self->_valueUnitString copyWithZone:a3];
  v12 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v11;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_key;
    *(unsigned char *)(v5 + 80) |= 4u;
  }
  uint64_t v13 = [(NSString *)self->_externalIdentifier copyWithZone:a3];
  v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  id v15 = [(ACHCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  templateUniqueName = self->_templateUniqueName;
  if ((unint64_t)templateUniqueName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](templateUniqueName, "isEqual:")) {
      goto LABEL_33;
    }
  }
  earnedDateComponents = self->_earnedDateComponents;
  if ((unint64_t)earnedDateComponents | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](earnedDateComponents, "isEqual:")) {
      goto LABEL_33;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_createdDate != *((double *)v4 + 1)) {
      goto LABEL_33;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_creatorDevice != *((void *)v4 + 2)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 8) == 0 || self->_value != *((double *)v4 + 4)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 8) != 0)
  {
    goto LABEL_33;
  }
  valueUnitString = self->_valueUnitString;
  if ((unint64_t)valueUnitString | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](valueUnitString, "isEqual:"))
    {
LABEL_33:
      char v11 = 0;
      goto LABEL_34;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_key != *((void *)v4 + 3)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_33;
  }
  externalIdentifier = self->_externalIdentifier;
  if ((unint64_t)externalIdentifier | *((void *)v4 + 6)
    && !-[NSString isEqual:](externalIdentifier, "isEqual:"))
  {
    goto LABEL_33;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 7)) {
    char v11 = -[ACHCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_templateUniqueName hash];
  NSUInteger v4 = [(NSString *)self->_earnedDateComponents hash];
  char has = (char)self->_has;
  if (has)
  {
    double createdDate = self->_createdDate;
    double v8 = -createdDate;
    if (createdDate >= 0.0) {
      double v8 = self->_createdDate;
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
  if ((has & 2) != 0)
  {
    uint64_t v11 = 2654435761 * self->_creatorDevice;
    if ((has & 8) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v16 = 0;
    goto LABEL_19;
  }
  uint64_t v11 = 0;
  if ((has & 8) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double value = self->_value;
  double v13 = -value;
  if (value >= 0.0) {
    double v13 = self->_value;
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
  NSUInteger v17 = [(NSString *)self->_valueUnitString hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v18 = 2654435761 * self->_key;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v19 = v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ v17;
  NSUInteger v20 = v18 ^ [(NSString *)self->_externalIdentifier hash];
  return v19 ^ v20 ^ [(ACHCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 8))
  {
    -[ACHCodableEarnedInstance setTemplateUniqueName:](self, "setTemplateUniqueName:");
    id v4 = v8;
  }
  if (*((void *)v4 + 5))
  {
    -[ACHCodableEarnedInstance setEarnedDateComponents:](self, "setEarnedDateComponents:");
    id v4 = v8;
  }
  char v5 = *((unsigned char *)v4 + 80);
  if (v5)
  {
    self->_double createdDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 80);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_creatorDevice = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 80) & 8) != 0)
  {
LABEL_8:
    self->_double value = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_9:
  if (*((void *)v4 + 9))
  {
    -[ACHCodableEarnedInstance setValueUnitString:](self, "setValueUnitString:");
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    self->_key = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 6))
  {
    -[ACHCodableEarnedInstance setExternalIdentifier:](self, "setExternalIdentifier:");
    id v4 = v8;
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v7 = *((void *)v4 + 7);
  if (syncIdentity)
  {
    if (v7) {
      -[ACHCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[ACHCodableEarnedInstance setSyncIdentity:](self, "setSyncIdentity:");
  }

  MEMORY[0x270F9A758]();
}

- (NSString)templateUniqueName
{
  return self->_templateUniqueName;
}

- (void)setTemplateUniqueName:(id)a3
{
}

- (NSString)earnedDateComponents
{
  return self->_earnedDateComponents;
}

- (void)setEarnedDateComponents:(id)a3
{
}

- (double)createdDate
{
  return self->_createdDate;
}

- (int64_t)creatorDevice
{
  return self->_creatorDevice;
}

- (double)value
{
  return self->_value;
}

- (NSString)valueUnitString
{
  return self->_valueUnitString;
}

- (void)setValueUnitString:(id)a3
{
}

- (int64_t)key
{
  return self->_key;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
}

- (ACHCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueUnitString, 0);
  objc_storeStrong((id *)&self->_templateUniqueName, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);

  objc_storeStrong((id *)&self->_earnedDateComponents, 0);
}

@end