@interface HDCodableOnboardingCompletion
- (BOOL)deleted;
- (BOOL)hasCompletionDate;
- (BOOL)hasCountryCode;
- (BOOL)hasCountryCodeProvenance;
- (BOOL)hasDeleted;
- (BOOL)hasFeatureIdentifier;
- (BOOL)hasModificationDate;
- (BOOL)hasSyncIdentity;
- (BOOL)hasUuid;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidWithError:(id *)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)uuid;
- (NSString)countryCode;
- (NSString)featureIdentifier;
- (double)completionDate;
- (double)modificationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedCompletionDate;
- (id)decodedModificationDate;
- (id)decodedUUID;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)countryCodeProvenance;
- (int64_t)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompletionDate:(double)a3;
- (void)setCountryCode:(id)a3;
- (void)setCountryCodeProvenance:(int64_t)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setFeatureIdentifier:(id)a3;
- (void)setHasCompletionDate:(BOOL)a3;
- (void)setHasCountryCodeProvenance:(BOOL)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasModificationDate:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setModificationDate:(double)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableOnboardingCompletion

- (id)decodedCompletionDate
{
  if ([(HDCodableOnboardingCompletion *)self hasCompletionDate])
  {
    [(HDCodableOnboardingCompletion *)self completionDate];
    v3 = HDDecodeDateForValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)decodedModificationDate
{
  if ([(HDCodableOnboardingCompletion *)self hasModificationDate])
  {
    [(HDCodableOnboardingCompletion *)self modificationDate];
    v3 = HDDecodeDateForValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)decodedUUID
{
  if ([(HDCodableOnboardingCompletion *)self hasUuid])
  {
    v3 = (void *)MEMORY[0x1E4F29128];
    v4 = [(HDCodableOnboardingCompletion *)self uuid];
    v5 = objc_msgSend(v3, "hk_UUIDWithData:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isValidWithError:(id *)a3
{
  v5 = [(HDCodableOnboardingCompletion *)self decodedUUID];

  if (v5)
  {
    if ([(HDCodableOnboardingCompletion *)self hasModificationDate])
    {
      if ([(HDCodableOnboardingCompletion *)self deleted]) {
        return 1;
      }
      if ([(HDCodableOnboardingCompletion *)self hasFeatureIdentifier])
      {
        if ([(HDCodableOnboardingCompletion *)self hasVersion]
          && [(HDCodableOnboardingCompletion *)self hasCompletionDate])
        {
          return 1;
        }
        v7 = @"Failed to decode onboarding completion due to missing version";
      }
      else
      {
        v7 = @"Failed to decode onboarding completion due to missing featureIdentifier";
      }
    }
    else
    {
      v7 = @"Failed to decode onboarding completion due to missing modification date";
    }
  }
  else
  {
    v7 = @"Failed to decode onboarding completion due to missing UUID";
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, v7);
  return 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasFeatureIdentifier
{
  return self->_featureIdentifier != 0;
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

- (void)setCompletionDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_completionDate = a3;
}

- (void)setHasCompletionDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompletionDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (void)setModificationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModificationDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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

- (void)setCountryCodeProvenance:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_countryCodeProvenance = a3;
}

- (void)setHasCountryCodeProvenance:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCountryCodeProvenance
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableOnboardingCompletion;
  v4 = [(HDCodableOnboardingCompletion *)&v8 description];
  v5 = [(HDCodableOnboardingCompletion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  featureIdentifier = self->_featureIdentifier;
  if (featureIdentifier) {
    [v4 setObject:featureIdentifier forKey:@"featureIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_version];
    [v4 setObject:v8 forKey:@"version"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_completionDate];
    [v4 setObject:v9 forKey:@"completionDate"];
  }
  countryCode = self->_countryCode;
  if (countryCode) {
    [v4 setObject:countryCode forKey:@"countryCode"];
  }
  char v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    v16 = [NSNumber numberWithDouble:self->_modificationDate];
    [v4 setObject:v16 forKey:@"modificationDate"];

    char v11 = (char)self->_has;
    if ((v11 & 0x10) == 0)
    {
LABEL_13:
      if ((v11 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_13;
  }
  v17 = [NSNumber numberWithBool:self->_deleted];
  [v4 setObject:v17 forKey:@"deleted"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_14:
    v12 = [NSNumber numberWithLongLong:self->_countryCodeProvenance];
    [v4 setObject:v12 forKey:@"countryCodeProvenance"];
  }
LABEL_15:
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v14 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"syncIdentity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableOnboardingCompletionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_featureIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    char v6 = (char)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_13:
      if ((v6 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_14:
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
LABEL_15:
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v7;
  }
  if (self->_featureIdentifier)
  {
    objc_msgSend(v7, "setFeatureIdentifier:");
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)v4 + 4) = self->_version;
    *((unsigned char *)v4 + 76) |= 8u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_completionDate;
    *((unsigned char *)v4 + 76) |= 1u;
  }
  if (self->_countryCode)
  {
    objc_msgSend(v7, "setCountryCode:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_modificationDate;
    *((unsigned char *)v4 + 76) |= 4u;
    char v6 = (char)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_13:
      if ((v6 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_13;
  }
  *((unsigned char *)v4 + 72) = self->_deleted;
  *((unsigned char *)v4 + 76) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_14:
    *((void *)v4 + 2) = self->_countryCodeProvenance;
    *((unsigned char *)v4 + 76) |= 2u;
  }
LABEL_15:
  if (self->_syncIdentity)
  {
    objc_msgSend(v7, "setSyncIdentity:");
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_uuid copyWithZone:a3];
  id v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  uint64_t v8 = [(NSString *)self->_featureIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_version;
    *(unsigned char *)(v5 + 76) |= 8u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_completionDate;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v11 = [(NSString *)self->_countryCode copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  char v13 = (char)self->_has;
  if ((v13 & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    *(unsigned char *)(v5 + 72) = self->_deleted;
    *(unsigned char *)(v5 + 76) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(double *)(v5 + 24) = self->_modificationDate;
  *(unsigned char *)(v5 + 76) |= 4u;
  char v13 = (char)self->_has;
  if ((v13 & 0x10) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if ((v13 & 2) != 0)
  {
LABEL_8:
    *(void *)(v5 + 16) = self->_countryCodeProvenance;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
LABEL_9:
  id v14 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_39;
    }
  }
  featureIdentifier = self->_featureIdentifier;
  if ((unint64_t)featureIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](featureIdentifier, "isEqual:")) {
      goto LABEL_39;
    }
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 76);
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 8) == 0 || self->_version != *((void *)v4 + 4)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 8) != 0)
  {
    goto LABEL_39;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_completionDate != *((double *)v4 + 1)) {
      goto LABEL_39;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_39;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:")) {
      goto LABEL_39;
    }
    char has = (char)self->_has;
    char v8 = *((unsigned char *)v4 + 76);
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_modificationDate != *((double *)v4 + 3)) {
      goto LABEL_39;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) != 0)
    {
      if (self->_deleted)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_39;
        }
        goto LABEL_32;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_32;
      }
    }
LABEL_39:
    char v11 = 0;
    goto LABEL_40;
  }
  if ((v8 & 0x10) != 0) {
    goto LABEL_39;
  }
LABEL_32:
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_countryCodeProvenance != *((void *)v4 + 2)) {
      goto LABEL_39;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_39;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 7)) {
    char v11 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_40:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_uuid hash];
  NSUInteger v4 = [(NSString *)self->_featureIdentifier hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v5 = 2654435761 * self->_version;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double completionDate = self->_completionDate;
  double v7 = -completionDate;
  if (completionDate >= 0.0) {
    double v7 = self->_completionDate;
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
  NSUInteger v11 = [(NSString *)self->_countryCode hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double modificationDate = self->_modificationDate;
    double v15 = -modificationDate;
    if (modificationDate >= 0.0) {
      double v15 = self->_modificationDate;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  if ((has & 0x10) != 0)
  {
    uint64_t v18 = 2654435761 * self->_deleted;
    if ((has & 2) != 0) {
      goto LABEL_21;
    }
LABEL_23:
    uint64_t v19 = 0;
    return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v13 ^ v18 ^ v19 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
  }
  uint64_t v18 = 0;
  if ((has & 2) == 0) {
    goto LABEL_23;
  }
LABEL_21:
  uint64_t v19 = 2654435761 * self->_countryCodeProvenance;
  return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v13 ^ v18 ^ v19 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (*((void *)v4 + 8))
  {
    -[HDCodableOnboardingCompletion setUuid:](self, "setUuid:");
    id v4 = v9;
  }
  if (*((void *)v4 + 6))
  {
    -[HDCodableOnboardingCompletion setFeatureIdentifier:](self, "setFeatureIdentifier:");
    id v4 = v9;
  }
  char v5 = *((unsigned char *)v4 + 76);
  if ((v5 & 8) != 0)
  {
    self->_version = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 76);
  }
  if (v5)
  {
    self->_double completionDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5))
  {
    -[HDCodableOnboardingCompletion setCountryCode:](self, "setCountryCode:");
    id v4 = v9;
  }
  char v6 = *((unsigned char *)v4 + 76);
  if ((v6 & 4) != 0)
  {
    self->_double modificationDate = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v4 + 76);
    if ((v6 & 0x10) == 0)
    {
LABEL_13:
      if ((v6 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 0x10) == 0)
  {
    goto LABEL_13;
  }
  self->_deleted = *((unsigned char *)v4 + 72);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
LABEL_14:
    self->_countryCodeProvenance = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_15:
  syncIdentity = self->_syncIdentity;
  uint64_t v8 = *((void *)v4 + 7);
  if (syncIdentity)
  {
    if (!v8) {
      goto LABEL_24;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_24;
    }
    -[HDCodableOnboardingCompletion setSyncIdentity:](self, "setSyncIdentity:");
  }
  id v4 = v9;
LABEL_24:
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(id)a3
{
}

- (int64_t)version
{
  return self->_version;
}

- (double)completionDate
{
  return self->_completionDate;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (int64_t)countryCodeProvenance
{
  return self->_countryCodeProvenance;
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);

  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end