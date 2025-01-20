@interface MCMChildParentMapCache
- (MCMChildParentMapCache)initWithDB:(id)a3 queue:(id)a4;
- (MCMSQLiteDB)db;
- (NSMutableDictionary)cache;
- (OS_dispatch_queue)queue;
- (id)childBundleIdentifiersForParentIdentifier:(id)a3;
- (id)parentIdentifierForChildIdentifier:(id)a3;
- (void)codeSigningDB:(id)a3 addChildIdentifier:(id)a4 forParentIdentifier:(id)a5;
- (void)codeSigningDB:(id)a3 removeParentIdentifier:(id)a4;
@end

@implementation MCMChildParentMapCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MCMSQLiteDB)db
{
  return self->_db;
}

- (void)codeSigningDB:(id)a3 removeParentIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v7 = [(MCMChildParentMapCache *)self cache];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
        v13 = [(MCMChildParentMapCache *)self cache];
        v14 = [v13 objectForKeyedSubscript:v12];

        if ([v14 isEqualToString:v5]) {
          [v6 addObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v9);
  }

  v15 = [(MCMChildParentMapCache *)self cache];
  v16 = [v6 allObjects];
  [v15 removeObjectsForKeys:v16];
}

- (void)codeSigningDB:(id)a3 addChildIdentifier:(id)a4 forParentIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(MCMChildParentMapCache *)self cache];
  [v9 setObject:v7 forKeyedSubscript:v8];
}

- (id)parentIdentifierForChildIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v6 = [(MCMChildParentMapCache *)v5 cache];
  id v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);

  return v7;
}

- (id)childBundleIdentifiersForParentIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v6 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [(MCMChildParentMapCache *)v5 cache];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [(MCMChildParentMapCache *)v5 cache];
        v13 = [v12 objectForKeyedSubscript:v11];

        if ([v13 isEqualToString:v4]) {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v16 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v6 copy];
  objc_sync_exit(v5);

  return v14;
}

- (MCMChildParentMapCache)initWithDB:(id)a3 queue:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MCMChildParentMapCache;
  uint64_t v9 = [(MCMChildParentMapCache *)&v15 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_db, a3);
    [v7 setPeerageDelegate:v10];
    objc_storeStrong((id *)&v10->_queue, a4);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__MCMChildParentMapCache_initWithDB_queue___block_invoke;
    block[3] = &unk_1E6A805F0;
    v13 = v10;
    id v14 = v7;
    dispatch_sync(v8, block);
  }
  return v10;
}

void __43__MCMChildParentMapCache_initWithDB_queue___block_invoke(uint64_t a1)
{
  v8[1] = *(id *)MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 40);
  v8[0] = 0;
  v3 = [v2 childParentMapWithError:v8];
  id v4 = v8[0];
  uint64_t v5 = [v3 mutableCopy];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;
}

@end