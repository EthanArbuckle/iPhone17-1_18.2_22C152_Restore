@interface HDCodableSource
- (BOOL)deleted;
- (BOOL)hasBundleIdentifier;
- (BOOL)hasDeleted;
- (BOOL)hasModificationDate;
- (BOOL)hasName;
- (BOOL)hasOptions;
- (BOOL)hasOwningAppBundleIdentifier;
- (BOOL)hasProductType;
- (BOOL)hasSyncIdentity;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)uuid;
- (NSString)bundleIdentifier;
- (NSString)name;
- (NSString)owningAppBundleIdentifier;
- (NSString)productType;
- (double)modificationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedModificationDate;
- (id)decodedUUID;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)options;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasModificationDate:(BOOL)a3;
- (void)setHasOptions:(BOOL)a3;
- (void)setModificationDate:(double)a3;
- (void)setName:(id)a3;
- (void)setOptions:(int64_t)a3;
- (void)setOwningAppBundleIdentifier:(id)a3;
- (void)setProductType:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSource

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setUuid:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setProductType:(id)a3
{
}

- (void)setDeleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_deleted = a3;
}

- (void)setOptions:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_options = a3;
}

- (void)setModificationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_modificationDate = a3;
}

- (NSData)uuid
{
  return self->_uuid;
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
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_owningAppBundleIdentifier)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_owningAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)decodedUUID
{
  if (self->_uuid)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (void)setHasOptions:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOptions
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setHasModificationDate:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModificationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeleted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasOwningAppBundleIdentifier
{
  return self->_owningAppBundleIdentifier != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSource;
  id v4 = [(HDCodableSource *)&v8 description];
  v5 = [(HDCodableSource *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }
  productType = self->_productType;
  if (productType) {
    [v4 setObject:productType forKey:@"productType"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_options];
    [v4 setObject:v8 forKey:@"options"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v4 setObject:uuid forKey:@"uuid"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v11 = [NSNumber numberWithDouble:self->_modificationDate];
    [v4 setObject:v11 forKey:@"modificationDate"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_deleted];
    [v4 setObject:v12 forKey:@"deleted"];
  }
  owningAppBundleIdentifier = self->_owningAppBundleIdentifier;
  if (owningAppBundleIdentifier) {
    [v4 setObject:owningAppBundleIdentifier forKey:@"owningAppBundleIdentifier"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v15 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"syncIdentity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSourceReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v6, "setBundleIdentifier:");
    id v4 = v6;
  }
  if (self->_productType)
  {
    objc_msgSend(v6, "setProductType:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_options;
    *((unsigned char *)v4 + 76) |= 2u;
  }
  if (self->_uuid)
  {
    objc_msgSend(v6, "setUuid:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_modificationDate;
    *((unsigned char *)v4 + 76) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 72) = self->_deleted;
    *((unsigned char *)v4 + 76) |= 4u;
  }
  if (self->_owningAppBundleIdentifier)
  {
    objc_msgSend(v6, "setOwningAppBundleIdentifier:");
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
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_productType copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_options;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  uint64_t v12 = [(NSData *)self->_uuid copyWithZone:a3];
  v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_modificationDate;
    *(unsigned char *)(v5 + 76) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 72) = self->_deleted;
    *(unsigned char *)(v5 + 76) |= 4u;
  }
  uint64_t v15 = [(NSString *)self->_owningAppBundleIdentifier copyWithZone:a3];
  v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  id v17 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v18 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v17;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_33;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:")) {
      goto LABEL_33;
    }
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](productType, "isEqual:")) {
      goto LABEL_33;
    }
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 76);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_options != *((void *)v4 + 2)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_33;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_33;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 76);
  }
  if (has)
  {
    if ((v9 & 1) == 0 || self->_modificationDate != *((double *)v4 + 1)) {
      goto LABEL_33;
    }
  }
  else if (v9)
  {
    goto LABEL_33;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) != 0)
    {
      if (self->_deleted)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_33;
        }
        goto LABEL_29;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_29;
      }
    }
LABEL_33:
    char v13 = 0;
    goto LABEL_34;
  }
  if ((v9 & 4) != 0) {
    goto LABEL_33;
  }
LABEL_29:
  owningAppBundleIdentifier = self->_owningAppBundleIdentifier;
  if ((unint64_t)owningAppBundleIdentifier | *((void *)v4 + 5)
    && !-[NSString isEqual:](owningAppBundleIdentifier, "isEqual:"))
  {
    goto LABEL_33;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 7)) {
    char v13 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_34:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_bundleIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_productType hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_options;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSData *)self->_uuid hash];
  char has = (char)self->_has;
  if (has)
  {
    double modificationDate = self->_modificationDate;
    double v11 = -modificationDate;
    if (modificationDate >= 0.0) {
      double v11 = self->_modificationDate;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v14 = 2654435761 * self->_deleted;
  }
  else {
    uint64_t v14 = 0;
  }
  NSUInteger v15 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14;
  NSUInteger v16 = [(NSString *)self->_owningAppBundleIdentifier hash];
  return v15 ^ v16 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 4))
  {
    -[HDCodableSource setName:](self, "setName:");
    id v4 = v8;
  }
  if (*((void *)v4 + 3))
  {
    -[HDCodableSource setBundleIdentifier:](self, "setBundleIdentifier:");
    id v4 = v8;
  }
  if (*((void *)v4 + 6))
  {
    -[HDCodableSource setProductType:](self, "setProductType:");
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    self->_options = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 8))
  {
    -[HDCodableSource setUuid:](self, "setUuid:");
    id v4 = v8;
  }
  char v5 = *((unsigned char *)v4 + 76);
  if (v5)
  {
    self->_double modificationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 76);
  }
  if ((v5 & 4) != 0)
  {
    self->_deleted = *((unsigned char *)v4 + 72);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 5))
  {
    -[HDCodableSource setOwningAppBundleIdentifier:](self, "setOwningAppBundleIdentifier:");
    id v4 = v8;
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v7 = *((void *)v4 + 7);
  if (syncIdentity)
  {
    if (!v7) {
      goto LABEL_23;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_23;
    }
    -[HDCodableSource setSyncIdentity:](self, "setSyncIdentity:");
  }
  id v4 = v8;
LABEL_23:
}

- (NSString)name
{
  return self->_name;
}

- (NSString)productType
{
  return self->_productType;
}

- (int64_t)options
{
  return self->_options;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (NSString)owningAppBundleIdentifier
{
  return self->_owningAppBundleIdentifier;
}

- (void)setOwningAppBundleIdentifier:(id)a3
{
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (id)decodedModificationDate
{
  if (*(unsigned char *)&self->_has)
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