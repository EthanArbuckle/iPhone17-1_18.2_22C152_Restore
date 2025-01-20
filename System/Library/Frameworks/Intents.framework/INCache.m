@interface INCache
+ (id)sharedCache;
- (NSCache)_cacheDictionary;
- (id)_init;
- (id)cacheableObjectForIdentifier:(id)a3;
- (id)consumeCacheableObjectForIdentifier:(id)a3;
- (void)addCacheableObject:(id)a3;
- (void)removeAllCacheableObjects;
- (void)removeCacheableObject:(id)a3;
@end

@implementation INCache

- (void)addCacheableObject:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 cacheIdentifier];
  if (v5)
  {
    [(NSCache *)self->_underlyingCache setObject:v4 forKey:v5];
  }
  else
  {
    v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      v8 = "-[INCache addCacheableObject:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_INFO, "%s Unable to add %@ to cache because there's no identifier.", (uint8_t *)&v7, 0x16u);
    }
  }
}

+ (id)sharedCache
{
  if (sharedCache_onceToken_82294 != -1) {
    dispatch_once(&sharedCache_onceToken_82294, &__block_literal_global_82295);
  }
  v2 = (void *)sharedCache_sSharedCache;

  return v2;
}

- (void).cxx_destruct
{
}

- (void)removeAllCacheableObjects
{
}

- (id)consumeCacheableObjectForIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSCache *)self->_underlyingCache objectForKey:v4];
  if (v5)
  {
    [(NSCache *)self->_underlyingCache removeObjectForKey:v4];
  }
  else
  {
    v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      __int16 v9 = "-[INCache consumeCacheableObjectForIdentifier:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_INFO, "%s Unable to find cacheable object with identifier %@ in cache for consuming.", (uint8_t *)&v8, 0x16u);
    }
  }

  return v5;
}

- (id)cacheableObjectForIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSCache *)self->_underlyingCache objectForKey:v4];
  if (!v5)
  {
    v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      __int16 v9 = "-[INCache cacheableObjectForIdentifier:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_INFO, "%s Unable to find cacheable object with identifier %@ in cache.", (uint8_t *)&v8, 0x16u);
    }
  }

  return v5;
}

- (void)removeCacheableObject:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 cacheIdentifier];
  if (v5)
  {
    [(NSCache *)self->_underlyingCache removeObjectForKey:v5];
  }
  else
  {
    v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      int v8 = "-[INCache removeCacheableObject:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_INFO, "%s Unable to remove %@ from cache because there's no identifier.", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (NSCache)_cacheDictionary
{
  return self->_underlyingCache;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)INCache;
  v2 = [(INCache *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    underlyingCache = v2->_underlyingCache;
    v2->_underlyingCache = v3;
  }
  return v2;
}

uint64_t __22__INCache_sharedCache__block_invoke()
{
  id v0 = [[INCache alloc] _init];
  uint64_t v1 = sharedCache_sSharedCache;
  sharedCache_sSharedCache = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end