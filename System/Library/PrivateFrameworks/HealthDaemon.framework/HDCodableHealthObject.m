@interface HDCodableHealthObject
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasCreationDate;
- (BOOL)hasExternalSyncObjectCode;
- (BOOL)hasMetadataDictionary;
- (BOOL)hasSourceBundleIdentifier;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableMetadataDictionary)metadataDictionary;
- (NSData)uuid;
- (NSString)description;
- (NSString)sourceBundleIdentifier;
- (double)creationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedMetadata;
- (id)dictionaryRepresentation;
- (int64_t)externalSyncObjectCode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setExternalSyncObjectCode:(int64_t)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasExternalSyncObjectCode:(BOOL)a3;
- (void)setMetadataDictionary:(id)a3;
- (void)setSourceBundleIdentifier:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableHealthObject

- (id)decodedMetadata
{
  if (self->_metadataDictionary)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_dictionaryWithCodableMetadata:");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)applyToObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    if (self->_uuid)
    {
      v6 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:");
      [v4 _setUUID:v6];
    }
    else
    {
      objc_msgSend(v4, "_setUUID:");
    }
    v7 = [(HDCodableHealthObject *)self decodedMetadata];
    [v4 _setMetadata:v7];

    v8 = [(HDCodableHealthObject *)self sourceBundleIdentifier];
    [v4 _setSourceBundleIdentifier:v8];

    if (*(unsigned char *)&self->_has) {
      double creationDate = self->_creationDate;
    }
    else {
      double creationDate = 2.22507386e-308;
    }
    [v4 _setCreationTimestamp:creationDate];
  }

  return isKindOfClass & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasMetadataDictionary
{
  return self->_metadataDictionary != 0;
}

- (BOOL)hasSourceBundleIdentifier
{
  return self->_sourceBundleIdentifier != 0;
}

- (void)setCreationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExternalSyncObjectCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_externalSyncObjectCode = a3;
}

- (void)setHasExternalSyncObjectCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExternalSyncObjectCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableHealthObject;
  id v4 = [(HDCodableHealthObject *)&v8 description];
  v5 = [(HDCodableHealthObject *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  metadataDictionary = self->_metadataDictionary;
  if (metadataDictionary)
  {
    v7 = [(HDCodableMetadataDictionary *)metadataDictionary dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"metadataDictionary"];
  }
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  if (sourceBundleIdentifier) {
    [v4 setObject:sourceBundleIdentifier forKey:@"sourceBundleIdentifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v10 = [NSNumber numberWithDouble:self->_creationDate];
    [v4 setObject:v10 forKey:@"creationDate"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v11 = [NSNumber numberWithLongLong:self->_externalSyncObjectCode];
    [v4 setObject:v11 forKey:@"externalSyncObjectCode"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableHealthObjectReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_metadataDictionary)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sourceBundleIdentifier)
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
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v6;
  }
  if (self->_metadataDictionary)
  {
    objc_msgSend(v6, "setMetadataDictionary:");
    id v4 = v6;
  }
  if (self->_sourceBundleIdentifier)
  {
    objc_msgSend(v6, "setSourceBundleIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_creationDate;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_externalSyncObjectCode;
    *((unsigned char *)v4 + 48) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_uuid copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  id v8 = [(HDCodableMetadataDictionary *)self->_metadataDictionary copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_sourceBundleIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_creationDate;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_externalSyncObjectCode;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_17;
    }
  }
  metadataDictionary = self->_metadataDictionary;
  if ((unint64_t)metadataDictionary | *((void *)v4 + 3))
  {
    if (!-[HDCodableMetadataDictionary isEqual:](metadataDictionary, "isEqual:")) {
      goto LABEL_17;
    }
  }
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  if ((unint64_t)sourceBundleIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sourceBundleIdentifier, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_creationDate != *((double *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  BOOL v8 = (*((unsigned char *)v4 + 48) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_externalSyncObjectCode != *((void *)v4 + 2)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_uuid hash];
  unint64_t v4 = [(HDCodableMetadataDictionary *)self->_metadataDictionary hash];
  NSUInteger v5 = [(NSString *)self->_sourceBundleIdentifier hash];
  char has = (char)self->_has;
  if (has)
  {
    double creationDate = self->_creationDate;
    double v9 = -creationDate;
    if (creationDate >= 0.0) {
      double v9 = self->_creationDate;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v12 = 2654435761 * self->_externalSyncObjectCode;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 5))
  {
    -[HDCodableHealthObject setUuid:](self, "setUuid:");
    id v4 = v8;
  }
  metadataDictionary = self->_metadataDictionary;
  uint64_t v6 = *((void *)v4 + 3);
  if (metadataDictionary)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[HDCodableMetadataDictionary mergeFrom:](metadataDictionary, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[HDCodableHealthObject setMetadataDictionary:](self, "setMetadataDictionary:");
  }
  id v4 = v8;
LABEL_9:
  if (*((void *)v4 + 4))
  {
    -[HDCodableHealthObject setSourceBundleIdentifier:](self, "setSourceBundleIdentifier:");
    id v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 48);
  if (v7)
  {
    self->_double creationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 48);
  }
  if ((v7 & 2) != 0)
  {
    self->_externalSyncObjectCode = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (HDCodableMetadataDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void)setMetadataDictionary:(id)a3
{
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (void)setSourceBundleIdentifier:(id)a3
{
}

- (double)creationDate
{
  return self->_creationDate;
}

- (int64_t)externalSyncObjectCode
{
  return self->_externalSyncObjectCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_metadataDictionary, 0);
}

@end