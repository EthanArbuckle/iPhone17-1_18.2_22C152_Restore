@interface SPAssetCacheSyncData
+ (id)fromProto:(id)a3;
+ (id)toProto:(id)a3;
- (NSString)cacheIdentifier;
- (SPAssetCacheAssets)permanentCache;
- (SPAssetCacheAssets)transientCache;
- (SPAssetCacheSyncData)init;
- (void)setCacheIdentifier:(id)a3;
- (void)setPermanentCache:(id)a3;
- (void)setTransientCache:(id)a3;
@end

@implementation SPAssetCacheSyncData

- (SPAssetCacheSyncData)init
{
  v3.receiver = self;
  v3.super_class = (Class)SPAssetCacheSyncData;
  return [(SPAssetCacheSyncData *)&v3 init];
}

+ (id)toProto:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SPProtoCacheSyncData);
  v5 = [v3 cacheIdentifier];
  [(SPProtoCacheSyncData *)v4 setCacheIdentifier:v5];

  v6 = [v3 permanentCache];
  v7 = +[SPAssetCacheAssets toProto:v6];
  [(SPProtoCacheSyncData *)v4 setPermanentCache:v7];

  v8 = [v3 transientCache];

  v9 = +[SPAssetCacheAssets toProto:v8];
  [(SPProtoCacheSyncData *)v4 setTransientCache:v9];

  return v4;
}

+ (id)fromProto:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SPAssetCacheSyncData);
  v5 = [v3 cacheIdentifier];
  [(SPAssetCacheSyncData *)v4 setCacheIdentifier:v5];

  v6 = [v3 permanentCache];
  v7 = +[SPAssetCacheAssets fromProto:v6];
  [(SPAssetCacheSyncData *)v4 setPermanentCache:v7];

  v8 = [v3 transientCache];

  v9 = +[SPAssetCacheAssets fromProto:v8];
  [(SPAssetCacheSyncData *)v4 setTransientCache:v9];

  return v4;
}

- (SPAssetCacheAssets)permanentCache
{
  return self->_permanentCache;
}

- (void)setPermanentCache:(id)a3
{
}

- (SPAssetCacheAssets)transientCache
{
  return self->_transientCache;
}

- (void)setTransientCache:(id)a3
{
}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (void)setCacheIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
  objc_storeStrong((id *)&self->_transientCache, 0);

  objc_storeStrong((id *)&self->_permanentCache, 0);
}

@end