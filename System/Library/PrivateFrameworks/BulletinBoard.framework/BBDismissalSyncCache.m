@interface BBDismissalSyncCache
- (BBDismissalSyncCache)init;
- (BOOL)_isTimeToCheck;
- (NSDate)timeToCheck;
- (NSMutableDictionary)cache;
- (id)description;
- (id)findBulletinMatch:(id)a3;
- (void)_checkCache;
- (void)cacheDismissalDictionaries:(id)a3 dismissalIDs:(id)a4 inSection:(id)a5 forFeeds:(unint64_t)a6;
- (void)removeBulletinMatch:(id)a3;
- (void)setCache:(id)a3;
- (void)setTimeToCheck:(id)a3;
@end

@implementation BBDismissalSyncCache

- (BBDismissalSyncCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)BBDismissalSyncCache;
  v2 = [(BBDismissalSyncCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cache = v2->_cache;
    v2->_cache = v3;
  }
  return v2;
}

- (void)cacheDismissalDictionaries:(id)a3 dismissalIDs:(id)a4 inSection:(id)a5 forFeeds:(unint64_t)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v10 = (BBDismissalSyncCache *)a3;
  id v11 = a4;
  id v12 = a5;
  v13 = BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138413058;
    v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2048;
    unint64_t v25 = a6;
    _os_log_impl(&dword_217675000, v13, OS_LOG_TYPE_DEFAULT, "Request to cache dismissal dictionaries:%@ IDs:%@ inSection:%@ forFeeds:%lu", (uint8_t *)&v18, 0x2Au);
  }
  [(BBDismissalSyncCache *)self _checkCache];
  if (-[BBDismissalSyncCache count](v10, "count") || [v11 count])
  {
    v14 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v12];
    if (!v14)
    {
      v14 = objc_alloc_init(BBDismissalSyncCacheItem);
      [(NSMutableDictionary *)self->_cache setObject:v14 forKeyedSubscript:v12];
    }
    [(BBDismissalSyncCacheItem *)v14 cacheDismissalDictionaries:v10 dismissalIDs:v11 forFeeds:a6];
    if (!self->_timeToCheck)
    {
      v15 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:120.0];
      timeToCheck = self->_timeToCheck;
      self->_timeToCheck = v15;
    }
    v17 = BBLogSync;
    if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      v19 = self;
      _os_log_impl(&dword_217675000, v17, OS_LOG_TYPE_DEFAULT, "cache updated to: %@", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (id)findBulletinMatch:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = v5;
    v7 = [v4 bulletinID];
    int v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "request to find bulletin match: %@", (uint8_t *)&v14, 0xCu);
  }
  [(BBDismissalSyncCache *)self _checkCache];
  v8 = [v4 sectionID];
  if (v8)
  {
    v9 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v8];
    v10 = v9;
    if (v9)
    {
      id v11 = [v9 findBulletinMatch:v4];
      [v11 setSectionID:v8];
      id v12 = BBLogSync;
      if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_217675000, v12, OS_LOG_TYPE_DEFAULT, "Found a match: %@", (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)removeBulletinMatch:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Request to remove bulletin match:%@", (uint8_t *)&v10, 0xCu);
  }
  objc_super v6 = [v4 sectionID];
  if (v6)
  {
    v7 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v6];
    v8 = v7;
    if (v7)
    {
      [v7 removeBulletinMatch:v4];
      v9 = BBLogSync;
      if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_217675000, v9, OS_LOG_TYPE_DEFAULT, "bulletin match removed", (uint8_t *)&v10, 2u);
      }
    }
  }
}

- (BOOL)_isTimeToCheck
{
  v3 = [MEMORY[0x263EFF910] date];
  id v4 = [(BBDismissalSyncCache *)self timeToCheck];
  [v3 timeIntervalSinceDate:v4];
  BOOL v6 = v5 >= 0.0;

  return v6;
}

- (void)_checkCache
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Request to check cache: %@", (uint8_t *)&buf, 0xCu);
  }
  if ([(BBDismissalSyncCache *)self _isTimeToCheck])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v17 = 0x3032000000;
    int v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    cache = self->_cache;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    int v10 = __35__BBDismissalSyncCache__checkCache__block_invoke;
    id v11 = &unk_264295C88;
    id v6 = v4;
    id v12 = v6;
    p_long long buf = &buf;
    [(NSMutableDictionary *)cache enumerateKeysAndObjectsUsingBlock:&v8];
    -[NSMutableDictionary removeObjectsForKeys:](self->_cache, "removeObjectsForKeys:", v6, v8, v9, v10, v11);
    objc_storeStrong((id *)&self->_timeToCheck, *(id *)(*((void *)&buf + 1) + 40));
    v7 = BBLogSync;
    if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v14 = 138412290;
      v15 = self;
      _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "check cache purge complete: %@", v14, 0xCu);
    }

    _Block_object_dispose(&buf, 8);
  }
}

void __35__BBDismissalSyncCache__checkCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  double v5 = [a3 purgeExpired];
  id v6 = v5;
  if (v5)
  {
    if ([v5 compare:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)] == -1) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; cache:%@; timeToCheck:%@>",
               objc_opt_class(),
               self,
               self->_cache,
               self->_timeToCheck);
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (NSDate)timeToCheck
{
  return self->_timeToCheck;
}

- (void)setTimeToCheck:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToCheck, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end