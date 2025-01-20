@interface SPCacheMessage
+ (id)fromProto:(id)a3;
+ (id)toProto:(id)a3;
- (NSData)assetData;
- (NSString)assetKey;
- (NSString)gizmoCacheIdentifier;
- (SPAssetCacheSyncData)syncData;
- (SPCacheMessage)init;
- (SPCacheMessage)initWithDictionary:(id)a3;
- (int)messageType;
- (unint64_t)cacheType;
- (unint64_t)error;
- (void)setAssetData:(id)a3;
- (void)setAssetKey:(id)a3;
- (void)setCacheType:(unint64_t)a3;
- (void)setError:(unint64_t)a3;
- (void)setGizmoCacheIdentifier:(id)a3;
- (void)setMessageType:(int)a3;
- (void)setSyncData:(id)a3;
@end

@implementation SPCacheMessage

- (SPCacheMessage)init
{
  v3.receiver = self;
  v3.super_class = (Class)SPCacheMessage;
  return [(SPCacheMessage *)&v3 init];
}

- (SPCacheMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SPCacheMessage;
  v5 = [(SPCacheMessage *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"cmsg"];

    if (v6)
    {
      v7 = [v4 objectForKeyedSubscript:@"cmsg"];
      v5->_messageType = [v7 unsignedIntValue];
    }
    v8 = [v4 objectForKeyedSubscript:@"t"];

    if (v8)
    {
      v9 = [v4 objectForKeyedSubscript:@"t"];
      v5->_cacheType = [v9 unsignedIntValue];
    }
    v10 = [v4 objectForKeyedSubscript:@"a"];

    if (v10)
    {
      uint64_t v11 = [v4 objectForKeyedSubscript:@"a"];
      assetKey = v5->_assetKey;
      v5->_assetKey = (NSString *)v11;
    }
    v13 = [v4 objectForKeyedSubscript:@"d"];

    if (v13)
    {
      uint64_t v14 = [v4 objectForKeyedSubscript:@"d"];
      assetData = v5->_assetData;
      v5->_assetData = (NSData *)v14;
    }
    v16 = [v4 objectForKeyedSubscript:@"i"];

    if (v16)
    {
      uint64_t v17 = [v4 objectForKeyedSubscript:@"i"];
      gizmoCacheIdentifier = v5->_gizmoCacheIdentifier;
      v5->_gizmoCacheIdentifier = (NSString *)v17;
    }
    v19 = [v4 objectForKeyedSubscript:@"s"];

    if (v19)
    {
      uint64_t v20 = [v4 objectForKeyedSubscript:@"s"];
      syncData = v5->_syncData;
      v5->_syncData = (SPAssetCacheSyncData *)v20;
    }
    v22 = [v4 objectForKeyedSubscript:@"e"];

    if (v22)
    {
      v23 = [v4 objectForKeyedSubscript:@"e"];
      v5->_error = [v23 integerValue];
    }
  }

  return v5;
}

+ (id)toProto:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(SPProtoCacheMessage);
  -[SPProtoCacheMessage setMessageType:](v4, "setMessageType:", [v3 messageType]);
  -[SPProtoCacheMessage setCacheType:](v4, "setCacheType:", [v3 cacheType]);
  v5 = [v3 assetKey];

  if (v5)
  {
    v6 = [v3 assetKey];
    [(SPProtoCacheMessage *)v4 setAssetKey:v6];
  }
  v7 = [v3 gizmoCacheIdentifier];

  if (v7)
  {
    v8 = [v3 gizmoCacheIdentifier];
    [(SPProtoCacheMessage *)v4 setGizmoCacheIdentifier:v8];
  }
  v9 = [v3 assetData];

  if (v9)
  {
    v10 = [v3 assetData];
    [(SPProtoCacheMessage *)v4 setAssetData:v10];
  }
  uint64_t v11 = [v3 syncData];

  if (v11)
  {
    v12 = [v3 syncData];
    v13 = +[SPAssetCacheSyncData toProto:v12];
    [(SPProtoCacheMessage *)v4 setSyncData:v13];
  }

  return v4;
}

+ (id)fromProto:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(SPCacheMessage);
  -[SPCacheMessage setMessageType:](v4, "setMessageType:", [v3 messageType]);
  -[SPCacheMessage setCacheType:](v4, "setCacheType:", (int)[v3 cacheType]);
  v5 = [v3 assetKey];

  if (v5)
  {
    v6 = [v3 assetKey];
    [(SPCacheMessage *)v4 setAssetKey:v6];
  }
  v7 = [v3 gizmoCacheIdentifier];

  if (v7)
  {
    v8 = [v3 gizmoCacheIdentifier];
    [(SPCacheMessage *)v4 setGizmoCacheIdentifier:v8];
  }
  v9 = [v3 assetData];

  if (v9)
  {
    v10 = [v3 assetData];
    [(SPCacheMessage *)v4 setAssetData:v10];
  }
  uint64_t v11 = [v3 syncData];

  if (v11)
  {
    v12 = [v3 syncData];
    v13 = +[SPAssetCacheSyncData fromProto:v12];
    [(SPCacheMessage *)v4 setSyncData:v13];
  }

  return v4;
}

- (int)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int)a3
{
  self->_messageType = a3;
}

- (unint64_t)cacheType
{
  return self->_cacheType;
}

- (void)setCacheType:(unint64_t)a3
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

- (SPAssetCacheSyncData)syncData
{
  return self->_syncData;
}

- (void)setSyncData:(id)a3
{
}

- (unint64_t)error
{
  return self->_error;
}

- (void)setError:(unint64_t)a3
{
  self->_error = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncData, 0);
  objc_storeStrong((id *)&self->_assetData, 0);
  objc_storeStrong((id *)&self->_gizmoCacheIdentifier, 0);

  objc_storeStrong((id *)&self->_assetKey, 0);
}

@end