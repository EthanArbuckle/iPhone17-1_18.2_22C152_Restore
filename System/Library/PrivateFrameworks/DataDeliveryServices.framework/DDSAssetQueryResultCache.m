@interface DDSAssetQueryResultCache
- (DDSAssetQueryResultCache)init;
- (DDSCache)cache;
- (id)cachedAssetsForQuery:(id)a3;
- (void)cache:(id)a3 willEvictObjects:(id)a4;
- (void)cacheAssets:(id)a3 forQuery:(id)a4;
- (void)clearCache;
- (void)clearCacheForAssetType:(id)a3;
@end

@implementation DDSAssetQueryResultCache

- (id)cachedAssetsForQuery:(id)a3
{
  id v4 = a3;
  v5 = [(DDSAssetQueryResultCache *)self cache];
  v6 = [v4 cacheKey];

  v7 = [v5 objectForKey:v6];

  return v7;
}

- (DDSCache)cache
{
  return self->_cache;
}

- (void)cacheAssets:(id)a3 forQuery:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(DDSAssetQueryResultCache *)self cache];
  v8 = [v6 cacheKey];

  [v9 cacheObject:v7 forKey:v8];
}

- (DDSAssetQueryResultCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)DDSAssetQueryResultCache;
  v2 = [(DDSAssetQueryResultCache *)&v6 init];
  if (v2)
  {
    v3 = [[DDSCache alloc] initWithMaxCount:100];
    cache = v2->_cache;
    v2->_cache = v3;

    [(DDSCache *)v2->_cache setDelegate:v2];
  }
  return v2;
}

- (void)clearCache
{
  v3 = DefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1E41D6000, v3, OS_LOG_TYPE_DEFAULT, "Asked to clear cache...", v5, 2u);
  }

  id v4 = [(DDSAssetQueryResultCache *)self cache];
  [v4 clearCache];
}

- (void)clearCacheForAssetType:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = DefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Asked to clear cache for asset type: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_super v6 = [(DDSAssetQueryResultCache *)self cache];
  [v6 removeEntriesWithPrefixKey:v4];
}

- (void)cache:(id)a3 willEvictObjects:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  v5 = DefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Cache will evict: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void).cxx_destruct
{
}

@end