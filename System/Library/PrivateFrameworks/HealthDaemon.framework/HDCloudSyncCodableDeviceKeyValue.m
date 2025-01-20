@interface HDCloudSyncCodableDeviceKeyValue
- (BOOL)hasDomain;
- (BOOL)hasKey;
- (BOOL)hasModificationDate;
- (BOOL)hasProtectionCategory;
- (BOOL)hasSyncIdentity;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)value;
- (NSString)domain;
- (NSString)key;
- (double)modificationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)protectionCategory;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDomain:(id)a3;
- (void)setHasModificationDate:(BOOL)a3;
- (void)setHasProtectionCategory:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setModificationDate:(double)a3;
- (void)setProtectionCategory:(int64_t)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableDeviceKeyValue

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setModificationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModificationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setProtectionCategory:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_protectionCategory = a3;
}

- (void)setHasProtectionCategory:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProtectionCategory
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableDeviceKeyValue;
  v4 = [(HDCloudSyncCodableDeviceKeyValue *)&v8 description];
  v5 = [(HDCloudSyncCodableDeviceKeyValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v5 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"syncIdentity"];
  }
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  value = self->_value;
  if (value) {
    [v3 setObject:value forKey:@"value"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v10 = [NSNumber numberWithDouble:self->_modificationDate];
    [v3 setObject:v10 forKey:@"modificationDate"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v11 = [NSNumber numberWithLongLong:self->_protectionCategory];
    [v3 setObject:v11 forKey:@"protectionCategory"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableDeviceKeyValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_value)
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
  if (self->_syncIdentity)
  {
    objc_msgSend(v4, "setSyncIdentity:");
    id v4 = v6;
  }
  if (self->_domain)
  {
    objc_msgSend(v6, "setDomain:");
    id v4 = v6;
  }
  if (self->_key)
  {
    objc_msgSend(v6, "setKey:");
    id v4 = v6;
  }
  if (self->_value)
  {
    objc_msgSend(v6, "setValue:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_modificationDate;
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_protectionCategory;
    *((unsigned char *)v4 + 56) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_domain copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_key copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSData *)self->_value copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_modificationDate;
    *(unsigned char *)(v5 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_protectionCategory;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 5))
  {
    if (!-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:")) {
      goto LABEL_19;
    }
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](domain, "isEqual:")) {
      goto LABEL_19;
    }
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_19;
    }
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](value, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_modificationDate != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  BOOL v9 = (*((unsigned char *)v4 + 56) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_protectionCategory != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableSyncIdentity *)self->_syncIdentity hash];
  NSUInteger v4 = [(NSString *)self->_domain hash];
  NSUInteger v5 = [(NSString *)self->_key hash];
  uint64_t v6 = [(NSData *)self->_value hash];
  char has = (char)self->_has;
  if (has)
  {
    double modificationDate = self->_modificationDate;
    double v10 = -modificationDate;
    if (modificationDate >= 0.0) {
      double v10 = self->_modificationDate;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v13 = 2654435761 * self->_protectionCategory;
  }
  else {
    uint64_t v13 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  syncIdentity = self->_syncIdentity;
  uint64_t v6 = *((void *)v4 + 5);
  id v8 = v4;
  if (syncIdentity)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCloudSyncCodableDeviceKeyValue setSyncIdentity:](self, "setSyncIdentity:");
  }
  id v4 = v8;
LABEL_7:
  if (*((void *)v4 + 3))
  {
    -[HDCloudSyncCodableDeviceKeyValue setDomain:](self, "setDomain:");
    id v4 = v8;
  }
  if (*((void *)v4 + 4))
  {
    -[HDCloudSyncCodableDeviceKeyValue setKey:](self, "setKey:");
    id v4 = v8;
  }
  if (*((void *)v4 + 6))
  {
    -[HDCloudSyncCodableDeviceKeyValue setValue:](self, "setValue:");
    id v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 56);
  if (v7)
  {
    self->_double modificationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 56);
  }
  if ((v7 & 2) != 0)
  {
    self->_protectionCategory = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (int64_t)protectionCategory
{
  return self->_protectionCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end