@interface SPProtoCacheMessage
- (BOOL)hasAssetData;
- (BOOL)hasAssetKey;
- (BOOL)hasGizmoCacheIdentifier;
- (BOOL)hasSyncData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)assetData;
- (NSString)assetKey;
- (NSString)gizmoCacheIdentifier;
- (SPProtoCacheSyncData)syncData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)cacheType;
- (int)messageType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetData:(id)a3;
- (void)setAssetKey:(id)a3;
- (void)setCacheType:(int)a3;
- (void)setGizmoCacheIdentifier:(id)a3;
- (void)setMessageType:(int)a3;
- (void)setSyncData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoCacheMessage

- (BOOL)hasAssetKey
{
  return self->_assetKey != 0;
}

- (BOOL)hasGizmoCacheIdentifier
{
  return self->_gizmoCacheIdentifier != 0;
}

- (BOOL)hasAssetData
{
  return self->_assetData != 0;
}

- (BOOL)hasSyncData
{
  return self->_syncData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SPProtoCacheMessage;
  v4 = [(SPProtoCacheMessage *)&v8 description];
  v5 = [(SPProtoCacheMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithInt:self->_messageType];
  [v3 setObject:v4 forKey:@"messageType"];

  v5 = [NSNumber numberWithInt:self->_cacheType];
  [v3 setObject:v5 forKey:@"cacheType"];

  assetKey = self->_assetKey;
  if (assetKey) {
    [v3 setObject:assetKey forKey:@"assetKey"];
  }
  gizmoCacheIdentifier = self->_gizmoCacheIdentifier;
  if (gizmoCacheIdentifier) {
    [v3 setObject:gizmoCacheIdentifier forKey:@"gizmoCacheIdentifier"];
  }
  assetData = self->_assetData;
  if (assetData) {
    [v3 setObject:assetData forKey:@"assetData"];
  }
  syncData = self->_syncData;
  if (syncData)
  {
    v10 = [(SPProtoCacheSyncData *)syncData dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"syncData"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoCacheMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  if (self->_assetKey) {
    PBDataWriterWriteStringField();
  }
  if (self->_gizmoCacheIdentifier) {
    PBDataWriterWriteStringField();
  }
  v4 = v5;
  if (self->_assetData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_syncData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[10] = self->_messageType;
  v4[6] = self->_cacheType;
  id v5 = v4;
  if (self->_assetKey)
  {
    objc_msgSend(v4, "setAssetKey:");
    v4 = v5;
  }
  if (self->_gizmoCacheIdentifier)
  {
    objc_msgSend(v5, "setGizmoCacheIdentifier:");
    v4 = v5;
  }
  if (self->_assetData)
  {
    objc_msgSend(v5, "setAssetData:");
    v4 = v5;
  }
  if (self->_syncData)
  {
    objc_msgSend(v5, "setSyncData:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 40) = self->_messageType;
  *(_DWORD *)(v5 + 24) = self->_cacheType;
  uint64_t v6 = [(NSString *)self->_assetKey copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_gizmoCacheIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSData *)self->_assetData copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  id v12 = [(SPProtoCacheSyncData *)self->_syncData copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_messageType == *((_DWORD *)v4 + 10)
    && self->_cacheType == *((_DWORD *)v4 + 6)
    && ((assetKey = self->_assetKey, !((unint64_t)assetKey | v4[2]))
     || -[NSString isEqual:](assetKey, "isEqual:"))
    && ((gizmoCacheIdentifier = self->_gizmoCacheIdentifier, !((unint64_t)gizmoCacheIdentifier | v4[4]))
     || -[NSString isEqual:](gizmoCacheIdentifier, "isEqual:"))
    && ((assetData = self->_assetData, !((unint64_t)assetData | v4[1]))
     || -[NSData isEqual:](assetData, "isEqual:")))
  {
    syncData = self->_syncData;
    if ((unint64_t)syncData | v4[6]) {
      char v9 = -[SPProtoCacheSyncData isEqual:](syncData, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = (2654435761 * self->_cacheType) ^ (2654435761 * self->_messageType);
  NSUInteger v4 = [(NSString *)self->_assetKey hash];
  NSUInteger v5 = v4 ^ [(NSString *)self->_gizmoCacheIdentifier hash];
  uint64_t v6 = v5 ^ [(NSData *)self->_assetData hash];
  return v3 ^ v6 ^ [(SPProtoCacheSyncData *)self->_syncData hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  self->_messageType = v4[10];
  self->_cacheType = v4[6];
  v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[SPProtoCacheMessage setAssetKey:](self, "setAssetKey:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[SPProtoCacheMessage setGizmoCacheIdentifier:](self, "setGizmoCacheIdentifier:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 1))
  {
    -[SPProtoCacheMessage setAssetData:](self, "setAssetData:");
    NSUInteger v4 = v7;
  }
  syncData = self->_syncData;
  uint64_t v6 = *((void *)v4 + 6);
  if (syncData)
  {
    if (v6) {
      -[SPProtoCacheSyncData mergeFrom:](syncData, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SPProtoCacheMessage setSyncData:](self, "setSyncData:");
  }

  MEMORY[0x270F9A758]();
}

- (int)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int)a3
{
  self->_messageType = a3;
}

- (int)cacheType
{
  return self->_cacheType;
}

- (void)setCacheType:(int)a3
{
  self->_cacheType = a3;
}

- (NSString)assetKey
{
  return self->_assetKey;
}

- (void)setAssetKey:(id)a3
{
}

- (NSString)gizmoCacheIdentifier
{
  return self->_gizmoCacheIdentifier;
}

- (void)setGizmoCacheIdentifier:(id)a3
{
}

- (NSData)assetData
{
  return self->_assetData;
}

- (void)setAssetData:(id)a3
{
}

- (SPProtoCacheSyncData)syncData
{
  return self->_syncData;
}

- (void)setSyncData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncData, 0);
  objc_storeStrong((id *)&self->_gizmoCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);

  objc_storeStrong((id *)&self->_assetData, 0);
}

@end