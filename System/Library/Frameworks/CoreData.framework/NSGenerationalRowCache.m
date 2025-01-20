@interface NSGenerationalRowCache
- (NSGenerationalRowCache)initWithStore:(id)a3;
- (id)rowCacheForGeneration:(uint64_t)a1;
- (void)dealloc;
- (void)forgetAllGenerationalExternalData;
- (void)removeRowCacheForGenerationWithIdentifier:(uint64_t)a1;
@end

@implementation NSGenerationalRowCache

- (id)rowCacheForGeneration:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if ([a2 _isEnabled])
  {
    v4 = -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)a2, *(id *)(a1 + 8));
    if (v4)
    {
      uint64_t v5 = *((void *)v4 + 3);
      if (v5)
      {
        os_unfair_lock_lock_with_options();
        v6 = (void *)[*(id *)(a1 + 24) objectForKey:v5];
        v7 = v6;
        if (v6)
        {
          id v8 = v6;
        }
        else
        {
          v7 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "rowCacheClass")), "initWithPersistentStore:", *(void *)(a1 + 8));
          [*(id *)(a1 + 24) setObject:v7 forKey:v5];
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
        id v11 = v7;
        return v7;
      }
    }
    return 0;
  }
  id v9 = *(id *)(a1 + 16);

  return v9;
}

- (NSGenerationalRowCache)initWithStore:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSGenerationalRowCache;
  v4 = [(NSGenerationalRowCache *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_store = (NSPersistentStore *)a3;
    v4->_primaryCache = (NSPersistentStoreCache *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "rowCacheClass")), "initWithPersistentStore:", a3);
    v5->_rowCachesByGenerationToken = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)removeRowCacheForGenerationWithIdentifier:(uint64_t)a1
{
  if (a1 && a2)
  {
    v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();
    [*(id *)(a1 + 24) removeObjectForKey:a2];
    os_unfair_lock_unlock(v4);
  }
}

- (void)dealloc
{
  self->_primaryCache = 0;
  self->_rowCachesByGenerationToken = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSGenerationalRowCache;
  [(NSGenerationalRowCache *)&v3 dealloc];
}

- (void)forgetAllGenerationalExternalData
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 32);
    uint64_t v3 = os_unfair_lock_lock_with_options();
    v4 = (void *)MEMORY[0x18C127630](v3);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 24), "allValues", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          -[NSPersistentStoreCache forgetAllExternalData](*(void *)(*((void *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
    os_unfair_lock_unlock(v2);
  }
}

@end