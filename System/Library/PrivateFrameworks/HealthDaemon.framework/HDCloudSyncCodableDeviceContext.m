@interface HDCloudSyncCodableDeviceContext
- (BOOL)hasCurrentOSName;
- (BOOL)hasCurrentOSVersion;
- (BOOL)hasModificationDate;
- (BOOL)hasProductTypeName;
- (BOOL)hasSyncIdentity;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncIdentity)syncIdentity;
- (NSString)currentOSName;
- (NSString)currentOSVersion;
- (NSString)productTypeName;
- (double)modificationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentOSName:(id)a3;
- (void)setCurrentOSVersion:(id)a3;
- (void)setHasModificationDate:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setModificationDate:(double)a3;
- (void)setProductTypeName:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableDeviceContext

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
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

- (BOOL)hasCurrentOSName
{
  return self->_currentOSName != 0;
}

- (BOOL)hasCurrentOSVersion
{
  return self->_currentOSVersion != 0;
}

- (BOOL)hasProductTypeName
{
  return self->_productTypeName != 0;
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableDeviceContext;
  v4 = [(HDCloudSyncCodableDeviceContext *)&v8 description];
  v5 = [(HDCloudSyncCodableDeviceContext *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithLongLong:self->_type];
    [v3 setObject:v6 forKey:@"type"];
  }
  currentOSName = self->_currentOSName;
  if (currentOSName) {
    [v3 setObject:currentOSName forKey:@"currentOSName"];
  }
  currentOSVersion = self->_currentOSVersion;
  if (currentOSVersion) {
    [v3 setObject:currentOSVersion forKey:@"currentOSVersion"];
  }
  productTypeName = self->_productTypeName;
  if (productTypeName) {
    [v3 setObject:productTypeName forKey:@"productTypeName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = [NSNumber numberWithDouble:self->_modificationDate];
    [v3 setObject:v10 forKey:@"modificationDate"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableDeviceContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_currentOSName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_currentOSVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_productTypeName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_syncIdentity)
  {
    objc_msgSend(v4, "setSyncIdentity:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_type;
    *((unsigned char *)v4 + 56) |= 2u;
  }
  if (self->_currentOSName)
  {
    objc_msgSend(v5, "setCurrentOSName:");
    id v4 = v5;
  }
  if (self->_currentOSVersion)
  {
    objc_msgSend(v5, "setCurrentOSVersion:");
    id v4 = v5;
  }
  if (self->_productTypeName)
  {
    objc_msgSend(v5, "setProductTypeName:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_modificationDate;
    *((unsigned char *)v4 + 56) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_type;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_currentOSName copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_currentOSVersion copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_productTypeName copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_modificationDate;
    *(unsigned char *)(v5 + 56) |= 1u;
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
  if ((unint64_t)syncIdentity | *((void *)v4 + 6))
  {
    if (!-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_type != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  currentOSName = self->_currentOSName;
  if ((unint64_t)currentOSName | *((void *)v4 + 3)
    && !-[NSString isEqual:](currentOSName, "isEqual:"))
  {
    goto LABEL_19;
  }
  currentOSVersion = self->_currentOSVersion;
  if ((unint64_t)currentOSVersion | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](currentOSVersion, "isEqual:")) {
      goto LABEL_19;
    }
  }
  productTypeName = self->_productTypeName;
  if ((unint64_t)productTypeName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](productTypeName, "isEqual:")) {
      goto LABEL_19;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_modificationDate != *((double *)v4 + 1)) {
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
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_currentOSName hash];
  NSUInteger v6 = [(NSString *)self->_currentOSVersion hash];
  NSUInteger v7 = [(NSString *)self->_productTypeName hash];
  if (*(unsigned char *)&self->_has)
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
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  syncIdentity = self->_syncIdentity;
  uint64_t v6 = *((void *)v4 + 6);
  id v7 = v4;
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
    -[HDCloudSyncCodableDeviceContext setSyncIdentity:](self, "setSyncIdentity:");
  }
  id v4 = v7;
LABEL_7:
  if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    self->_type = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    -[HDCloudSyncCodableDeviceContext setCurrentOSName:](self, "setCurrentOSName:");
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[HDCloudSyncCodableDeviceContext setCurrentOSVersion:](self, "setCurrentOSVersion:");
    id v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[HDCloudSyncCodableDeviceContext setProductTypeName:](self, "setProductTypeName:");
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 56))
  {
    self->_double modificationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)currentOSName
{
  return self->_currentOSName;
}

- (void)setCurrentOSName:(id)a3
{
}

- (NSString)currentOSVersion
{
  return self->_currentOSVersion;
}

- (void)setCurrentOSVersion:(id)a3
{
}

- (NSString)productTypeName
{
  return self->_productTypeName;
}

- (void)setProductTypeName:(id)a3
{
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_productTypeName, 0);
  objc_storeStrong((id *)&self->_currentOSVersion, 0);

  objc_storeStrong((id *)&self->_currentOSName, 0);
}

@end