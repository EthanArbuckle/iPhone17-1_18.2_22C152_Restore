@interface HDCloudSyncCodableStore
- (BOOL)active;
- (BOOL)hasActive;
- (BOOL)hasDeviceMode;
- (BOOL)hasDeviceName;
- (BOOL)hasIsChild;
- (BOOL)hasOrder;
- (BOOL)hasOwnerIdentifier;
- (BOOL)hasPendingOwnerIdentifier;
- (BOOL)hasPendingSyncIdentity;
- (BOOL)hasProductType;
- (BOOL)hasRequiredProtocolVersion;
- (BOOL)hasShardPredicate;
- (BOOL)hasStoreIdentifier;
- (BOOL)hasSupportedProtocolVersion;
- (BOOL)hasSyncIdentity;
- (BOOL)hasSystemBuildVersion;
- (BOOL)isChild;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCloudSyncCodableShardPredicate)shardPredicate;
- (HDCodableSyncIdentity)pendingSyncIdentity;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)storeIdentifier;
- (NSString)deviceName;
- (NSString)ownerIdentifier;
- (NSString)pendingOwnerIdentifier;
- (NSString)productType;
- (NSString)systemBuildVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceModeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)requiredProtocolVersionAsString:(int)a3;
- (id)supportedProtocolVersionAsString:(int)a3;
- (int)StringAsDeviceMode:(id)a3;
- (int)StringAsRequiredProtocolVersion:(id)a3;
- (int)StringAsSupportedProtocolVersion:(id)a3;
- (int)deviceMode;
- (int)requiredProtocolVersion;
- (int)supportedProtocolVersion;
- (int64_t)order;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setDeviceMode:(int)a3;
- (void)setDeviceName:(id)a3;
- (void)setHasActive:(BOOL)a3;
- (void)setHasDeviceMode:(BOOL)a3;
- (void)setHasIsChild:(BOOL)a3;
- (void)setHasOrder:(BOOL)a3;
- (void)setHasRequiredProtocolVersion:(BOOL)a3;
- (void)setHasSupportedProtocolVersion:(BOOL)a3;
- (void)setIsChild:(BOOL)a3;
- (void)setOrder:(int64_t)a3;
- (void)setOwnerIdentifier:(id)a3;
- (void)setPendingOwnerIdentifier:(id)a3;
- (void)setPendingSyncIdentity:(id)a3;
- (void)setProductType:(id)a3;
- (void)setRequiredProtocolVersion:(int)a3;
- (void)setShardPredicate:(id)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setSupportedProtocolVersion:(int)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setSystemBuildVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableStore

- (BOOL)hasOwnerIdentifier
{
  return self->_ownerIdentifier != 0;
}

- (BOOL)hasPendingOwnerIdentifier
{
  return self->_pendingOwnerIdentifier != 0;
}

- (void)setOrder:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_order = a3;
}

- (void)setHasOrder:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOrder
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (BOOL)hasPendingSyncIdentity
{
  return self->_pendingSyncIdentity != 0;
}

- (void)setIsChild:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isChild = a3;
}

- (void)setHasIsChild:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsChild
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasStoreIdentifier
{
  return self->_storeIdentifier != 0;
}

- (void)setActive:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_active = a3;
}

- (void)setHasActive:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasActive
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)deviceMode
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_deviceMode;
  }
  else {
    return 1;
  }
}

- (void)setDeviceMode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_deviceMode = a3;
}

- (void)setHasDeviceMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeviceMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)deviceModeAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"Basic";
  }
  else if (a3 == 2)
  {
    v4 = @"Satellite";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsDeviceMode:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"Basic"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"Satellite"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (int)supportedProtocolVersion
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_supportedProtocolVersion;
  }
  else {
    return 0;
  }
}

- (void)setSupportedProtocolVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_supportedProtocolVersion = a3;
}

- (void)setHasSupportedProtocolVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportedProtocolVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)supportedProtocolVersionAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Yukon";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Tigris";
  }
  return v4;
}

- (int)StringAsSupportedProtocolVersion:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Tigris"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Yukon"];
  }

  return v4;
}

- (int)requiredProtocolVersion
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_requiredProtocolVersion;
  }
  else {
    return 0;
  }
}

- (void)setRequiredProtocolVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_requiredProtocolVersion = a3;
}

- (void)setHasRequiredProtocolVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRequiredProtocolVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)requiredProtocolVersionAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Yukon";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Tigris";
  }
  return v4;
}

- (int)StringAsRequiredProtocolVersion:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Tigris"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Yukon"];
  }

  return v4;
}

- (BOOL)hasSystemBuildVersion
{
  return self->_systemBuildVersion != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasShardPredicate
{
  return self->_shardPredicate != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableStore;
  int v4 = [(HDCloudSyncCodableStore *)&v8 description];
  v5 = [(HDCloudSyncCodableStore *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  ownerIdentifier = self->_ownerIdentifier;
  if (ownerIdentifier) {
    [v3 setObject:ownerIdentifier forKey:@"ownerIdentifier"];
  }
  pendingOwnerIdentifier = self->_pendingOwnerIdentifier;
  if (pendingOwnerIdentifier) {
    [v4 setObject:pendingOwnerIdentifier forKey:@"pendingOwnerIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithLongLong:self->_order];
    [v4 setObject:v7 forKey:@"order"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v9 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"syncIdentity"];
  }
  pendingSyncIdentity = self->_pendingSyncIdentity;
  if (pendingSyncIdentity)
  {
    v11 = [(HDCodableSyncIdentity *)pendingSyncIdentity dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"pendingSyncIdentity"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_isChild];
    [v4 setObject:v12 forKey:@"isChild"];
  }
  storeIdentifier = self->_storeIdentifier;
  if (storeIdentifier) {
    [v4 setObject:storeIdentifier forKey:@"storeIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v15 = [NSNumber numberWithBool:self->_active];
    [v4 setObject:v15 forKey:@"active"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_17:
      if ((has & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_17;
  }
  int deviceMode = self->_deviceMode;
  if (deviceMode == 1)
  {
    v17 = @"Basic";
  }
  else if (deviceMode == 2)
  {
    v17 = @"Satellite";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_deviceMode);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [v4 setObject:v17 forKey:@"deviceMode"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 4) == 0) {
      goto LABEL_39;
    }
    goto LABEL_33;
  }
LABEL_27:
  int supportedProtocolVersion = self->_supportedProtocolVersion;
  if (supportedProtocolVersion)
  {
    if (supportedProtocolVersion == 1)
    {
      v19 = @"Yukon";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_supportedProtocolVersion);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v19 = @"Tigris";
  }
  [v4 setObject:v19 forKey:@"supportedProtocolVersion"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_33:
    int requiredProtocolVersion = self->_requiredProtocolVersion;
    if (requiredProtocolVersion)
    {
      if (requiredProtocolVersion == 1)
      {
        v21 = @"Yukon";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_requiredProtocolVersion);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v21 = @"Tigris";
    }
    [v4 setObject:v21 forKey:@"requiredProtocolVersion"];
  }
LABEL_39:
  systemBuildVersion = self->_systemBuildVersion;
  if (systemBuildVersion) {
    [v4 setObject:systemBuildVersion forKey:@"systemBuildVersion"];
  }
  productType = self->_productType;
  if (productType) {
    [v4 setObject:productType forKey:@"productType"];
  }
  deviceName = self->_deviceName;
  if (deviceName) {
    [v4 setObject:deviceName forKey:@"deviceName"];
  }
  shardPredicate = self->_shardPredicate;
  if (shardPredicate)
  {
    v26 = [(HDCloudSyncCodableShardPredicate *)shardPredicate dictionaryRepresentation];
    [v4 setObject:v26 forKey:@"shardPredicate"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableStoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_ownerIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_pendingOwnerIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_pendingSyncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_storeIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_17:
      if ((has & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_19:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_20:
  if (self->_systemBuildVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_shardPredicate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_ownerIdentifier)
  {
    objc_msgSend(v4, "setOwnerIdentifier:");
    id v4 = v6;
  }
  if (self->_pendingOwnerIdentifier)
  {
    objc_msgSend(v6, "setPendingOwnerIdentifier:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_order;
    *((unsigned char *)v4 + 116) |= 1u;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v6, "setSyncIdentity:");
    id v4 = v6;
  }
  if (self->_pendingSyncIdentity)
  {
    objc_msgSend(v6, "setPendingSyncIdentity:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((unsigned char *)v4 + 113) = self->_isChild;
    *((unsigned char *)v4 + 116) |= 0x20u;
  }
  if (self->_storeIdentifier)
  {
    objc_msgSend(v6, "setStoreIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((unsigned char *)v4 + 112) = self->_active;
    *((unsigned char *)v4 + 116) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_17:
      if ((has & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 4) = self->_deviceMode;
  *((unsigned char *)v4 + 116) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_33:
  *((_DWORD *)v4 + 22) = self->_supportedProtocolVersion;
  *((unsigned char *)v4 + 116) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_19:
    *((_DWORD *)v4 + 16) = self->_requiredProtocolVersion;
    *((unsigned char *)v4 + 116) |= 4u;
  }
LABEL_20:
  if (self->_systemBuildVersion)
  {
    objc_msgSend(v6, "setSystemBuildVersion:");
    id v4 = v6;
  }
  if (self->_productType)
  {
    objc_msgSend(v6, "setProductType:");
    id v4 = v6;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v6, "setDeviceName:");
    id v4 = v6;
  }
  if (self->_shardPredicate)
  {
    objc_msgSend(v6, "setShardPredicate:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_ownerIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_pendingOwnerIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_order;
    *(unsigned char *)(v5 + 116) |= 1u;
  }
  id v10 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v11 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v10;

  id v12 = [(HDCodableSyncIdentity *)self->_pendingSyncIdentity copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 113) = self->_isChild;
    *(unsigned char *)(v5 + 116) |= 0x20u;
  }
  uint64_t v14 = [(NSData *)self->_storeIdentifier copyWithZone:a3];
  v15 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v14;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 112) = self->_active;
    *(unsigned char *)(v5 + 116) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      *(_DWORD *)(v5 + 88) = self->_supportedProtocolVersion;
      *(unsigned char *)(v5 + 116) |= 8u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 16) = self->_deviceMode;
  *(unsigned char *)(v5 + 116) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((has & 4) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 64) = self->_requiredProtocolVersion;
    *(unsigned char *)(v5 + 116) |= 4u;
  }
LABEL_10:
  uint64_t v17 = [(NSString *)self->_systemBuildVersion copyWithZone:a3];
  v18 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v17;

  uint64_t v19 = [(NSString *)self->_productType copyWithZone:a3];
  v20 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v19;

  uint64_t v21 = [(NSString *)self->_deviceName copyWithZone:a3];
  v22 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v21;

  id v23 = [(HDCloudSyncCodableShardPredicate *)self->_shardPredicate copyWithZone:a3];
  v24 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v23;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  ownerIdentifier = self->_ownerIdentifier;
  if ((unint64_t)ownerIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](ownerIdentifier, "isEqual:")) {
      goto LABEL_57;
    }
  }
  pendingOwnerIdentifier = self->_pendingOwnerIdentifier;
  if ((unint64_t)pendingOwnerIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](pendingOwnerIdentifier, "isEqual:")) {
      goto LABEL_57;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 116) & 1) == 0 || self->_order != *((void *)v4 + 1)) {
      goto LABEL_57;
    }
  }
  else if (*((unsigned char *)v4 + 116))
  {
    goto LABEL_57;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 12)
    && !-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
  {
    goto LABEL_57;
  }
  pendingSyncIdentity = self->_pendingSyncIdentity;
  if ((unint64_t)pendingSyncIdentity | *((void *)v4 + 6))
  {
    if (!-[HDCodableSyncIdentity isEqual:](pendingSyncIdentity, "isEqual:")) {
      goto LABEL_57;
    }
  }
  char has = (char)self->_has;
  char v10 = *((unsigned char *)v4 + 116);
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 0x20) == 0) {
      goto LABEL_57;
    }
    if (self->_isChild)
    {
      if (!*((unsigned char *)v4 + 113)) {
        goto LABEL_57;
      }
    }
    else if (*((unsigned char *)v4 + 113))
    {
      goto LABEL_57;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 0x20) != 0)
  {
    goto LABEL_57;
  }
  storeIdentifier = self->_storeIdentifier;
  if ((unint64_t)storeIdentifier | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](storeIdentifier, "isEqual:")) {
      goto LABEL_57;
    }
    char has = (char)self->_has;
    char v10 = *((unsigned char *)v4 + 116);
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) != 0)
    {
      if (self->_active)
      {
        if (!*((unsigned char *)v4 + 112)) {
          goto LABEL_57;
        }
        goto LABEL_34;
      }
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_34;
      }
    }
LABEL_57:
    char v16 = 0;
    goto LABEL_58;
  }
  if ((v10 & 0x10) != 0) {
    goto LABEL_57;
  }
LABEL_34:
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_deviceMode != *((_DWORD *)v4 + 4)) {
      goto LABEL_57;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_supportedProtocolVersion != *((_DWORD *)v4 + 22)) {
      goto LABEL_57;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_requiredProtocolVersion != *((_DWORD *)v4 + 16)) {
      goto LABEL_57;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_57;
  }
  systemBuildVersion = self->_systemBuildVersion;
  if ((unint64_t)systemBuildVersion | *((void *)v4 + 13)
    && !-[NSString isEqual:](systemBuildVersion, "isEqual:"))
  {
    goto LABEL_57;
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](productType, "isEqual:")) {
      goto LABEL_57;
    }
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:")) {
      goto LABEL_57;
    }
  }
  shardPredicate = self->_shardPredicate;
  if ((unint64_t)shardPredicate | *((void *)v4 + 9)) {
    char v16 = -[HDCloudSyncCodableShardPredicate isEqual:](shardPredicate, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_58:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_ownerIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_pendingOwnerIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_order;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(HDCodableSyncIdentity *)self->_syncIdentity hash];
  unint64_t v7 = [(HDCodableSyncIdentity *)self->_pendingSyncIdentity hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v8 = 2654435761 * self->_isChild;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [(NSData *)self->_storeIdentifier hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v10 = 2654435761 * self->_active;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_9:
      uint64_t v11 = 2654435761 * self->_deviceMode;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_10;
      }
LABEL_14:
      uint64_t v12 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_11;
      }
LABEL_15:
      uint64_t v13 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_9;
    }
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v12 = 2654435761 * self->_supportedProtocolVersion;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_15;
  }
LABEL_11:
  uint64_t v13 = 2654435761 * self->_requiredProtocolVersion;
LABEL_16:
  NSUInteger v14 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  NSUInteger v15 = v10 ^ v11 ^ v12 ^ v13 ^ [(NSString *)self->_systemBuildVersion hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_productType hash];
  NSUInteger v17 = v14 ^ v16 ^ [(NSString *)self->_deviceName hash];
  return v17 ^ [(HDCloudSyncCodableShardPredicate *)self->_shardPredicate hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (*((void *)v4 + 4))
  {
    -[HDCloudSyncCodableStore setOwnerIdentifier:](self, "setOwnerIdentifier:");
    id v4 = v12;
  }
  if (*((void *)v4 + 5))
  {
    -[HDCloudSyncCodableStore setPendingOwnerIdentifier:](self, "setPendingOwnerIdentifier:");
    id v4 = v12;
  }
  if (*((unsigned char *)v4 + 116))
  {
    self->_order = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v6 = *((void *)v4 + 12);
  if (syncIdentity)
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[HDCloudSyncCodableStore setSyncIdentity:](self, "setSyncIdentity:");
  }
  id v4 = v12;
LABEL_13:
  pendingSyncIdentity = self->_pendingSyncIdentity;
  uint64_t v8 = *((void *)v4 + 6);
  if (pendingSyncIdentity)
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[HDCodableSyncIdentity mergeFrom:](pendingSyncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[HDCloudSyncCodableStore setPendingSyncIdentity:](self, "setPendingSyncIdentity:");
  }
  id v4 = v12;
LABEL_19:
  if ((*((unsigned char *)v4 + 116) & 0x20) != 0)
  {
    self->_isChild = *((unsigned char *)v4 + 113);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 10))
  {
    -[HDCloudSyncCodableStore setStoreIdentifier:](self, "setStoreIdentifier:");
    id v4 = v12;
  }
  char v9 = *((unsigned char *)v4 + 116);
  if ((v9 & 0x10) != 0)
  {
    self->_active = *((unsigned char *)v4 + 112);
    *(unsigned char *)&self->_has |= 0x10u;
    char v9 = *((unsigned char *)v4 + 116);
    if ((v9 & 2) == 0)
    {
LABEL_25:
      if ((v9 & 8) == 0) {
        goto LABEL_26;
      }
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 2) == 0)
  {
    goto LABEL_25;
  }
  self->_int deviceMode = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v9 = *((unsigned char *)v4 + 116);
  if ((v9 & 8) == 0)
  {
LABEL_26:
    if ((v9 & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_39:
  self->_int supportedProtocolVersion = *((_DWORD *)v4 + 22);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 116) & 4) != 0)
  {
LABEL_27:
    self->_int requiredProtocolVersion = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_28:
  if (*((void *)v4 + 13))
  {
    -[HDCloudSyncCodableStore setSystemBuildVersion:](self, "setSystemBuildVersion:");
    id v4 = v12;
  }
  if (*((void *)v4 + 7))
  {
    -[HDCloudSyncCodableStore setProductType:](self, "setProductType:");
    id v4 = v12;
  }
  if (*((void *)v4 + 3))
  {
    -[HDCloudSyncCodableStore setDeviceName:](self, "setDeviceName:");
    id v4 = v12;
  }
  shardPredicate = self->_shardPredicate;
  uint64_t v11 = *((void *)v4 + 9);
  if (shardPredicate)
  {
    if (!v11) {
      goto LABEL_44;
    }
    -[HDCloudSyncCodableShardPredicate mergeFrom:](shardPredicate, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_44;
    }
    -[HDCloudSyncCodableStore setShardPredicate:](self, "setShardPredicate:");
  }
  id v4 = v12;
LABEL_44:
}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (void)setOwnerIdentifier:(id)a3
{
}

- (NSString)pendingOwnerIdentifier
{
  return self->_pendingOwnerIdentifier;
}

- (void)setPendingOwnerIdentifier:(id)a3
{
}

- (int64_t)order
{
  return self->_order;
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (HDCodableSyncIdentity)pendingSyncIdentity
{
  return self->_pendingSyncIdentity;
}

- (void)setPendingSyncIdentity:(id)a3
{
}

- (BOOL)isChild
{
  return self->_isChild;
}

- (NSData)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (void)setSystemBuildVersion:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (HDCloudSyncCodableShardPredicate)shardPredicate
{
  return self->_shardPredicate;
}

- (void)setShardPredicate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_shardPredicate, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_pendingSyncIdentity, 0);
  objc_storeStrong((id *)&self->_pendingOwnerIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end