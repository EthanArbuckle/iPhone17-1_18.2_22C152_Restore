@interface DDSCache
- (DDSCache)initWithMaxCount:(unint64_t)a3;
- (DDSCacheDelegate)delegate;
- (NSMutableDictionary)cache;
- (NSMutableOrderedSet)order;
- (OS_dispatch_queue)queue;
- (id)objectForKey:(id)a3;
- (unint64_t)maxCount;
- (void)cacheObject:(id)a3 forKey:(id)a4;
- (void)clearCache;
- (void)removeEntriesWithPrefixKey:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DDSCache

void __31__DDSCache_cacheObject_forKey___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) cache];
  unint64_t v3 = [v2 count];
  unint64_t v4 = [*(id *)(a1 + 32) maxCount];

  if (v3 >= v4)
  {
    v5 = [*(id *)(a1 + 32) order];
    v6 = [v5 objectAtIndex:0];

    v7 = [*(id *)(a1 + 32) order];
    [v7 removeObjectAtIndex:0];

    v8 = [*(id *)(a1 + 32) cache];
    v9 = [v8 objectForKey:v6];

    v10 = [*(id *)(a1 + 32) cache];
    [v10 removeObjectForKey:v6];

    v11 = [*(id *)(a1 + 32) delegate];

    if (v11)
    {
      v12 = [*(id *)(a1 + 32) delegate];
      uint64_t v13 = *(void *)(a1 + 32);
      v17[0] = v9;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      [v12 cache:v13 willEvictObjects:v14];
    }
  }
  v15 = [*(id *)(a1 + 32) cache];
  [v15 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];

  v16 = [*(id *)(a1 + 32) order];
  [v16 addObject:*(void *)(a1 + 48)];
}

void __25__DDSCache_objectForKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) order];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    unint64_t v4 = [*(id *)(a1 + 32) cache];
    uint64_t v5 = [v4 objectForKey:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = [*(id *)(a1 + 32) order];
    [v8 removeObject:*(void *)(a1 + 40)];

    id v9 = [*(id *)(a1 + 32) order];
    [v9 addObject:*(void *)(a1 + 40)];
  }
}

- (NSMutableOrderedSet)order
{
  return self->_order;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  uint64_t v5 = [(DDSCache *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__DDSCache_objectForKey___block_invoke;
  block[3] = &unk_1E6E3A7C8;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (void)cacheObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DDSCache *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__DDSCache_cacheObject_forKey___block_invoke;
  block[3] = &unk_1E6E3A7A0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)setDelegate:(id)a3
{
}

- (DDSCache)initWithMaxCount:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)DDSCache;
  id v4 = [(DDSCache *)&v12 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
    cache = v4->_cache;
    v4->_cache = (NSMutableDictionary *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:a3];
    order = v4->_order;
    v4->_order = (NSMutableOrderedSet *)v7;

    v4->_maxCount = a3;
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.DataDeliveryServices.DDSAssetQueryResultCache", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v9;
  }
  return v4;
}

- (void)removeEntriesWithPrefixKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DDSCache *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__DDSCache_removeEntriesWithPrefixKey___block_invoke;
  v7[3] = &unk_1E6E39F58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __39__DDSCache_removeEntriesWithPrefixKey___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  int v3 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = [*(id *)(a1 + 32) cache];
  uint64_t v5 = [v4 allKeys];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v10 hasPrefix:*(void *)(a1 + 40)])
        {
          [v2 addObject:v10];
          v11 = [*(id *)(a1 + 32) cache];
          objc_super v12 = [v11 objectForKey:v10];
          [v3 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  if ([v2 count])
  {
    id v13 = [*(id *)(a1 + 32) delegate];
    [v13 cache:*(void *)(a1 + 32) willEvictObjects:v3];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = v2;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * j);
          v20 = objc_msgSend(*(id *)(a1 + 32), "cache", (void)v22);
          [v20 removeObjectForKey:v19];

          v21 = [*(id *)(a1 + 32) order];
          [v21 removeObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v16);
    }
  }
}

- (void)clearCache
{
  int v3 = [(DDSCache *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__DDSCache_clearCache__block_invoke;
  block[3] = &unk_1E6E39DE0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __22__DDSCache_clearCache__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  int v3 = *(void **)(a1 + 32);
  id v4 = [v3 cache];
  uint64_t v5 = [v4 allValues];
  [v2 cache:v3 willEvictObjects:v5];

  uint64_t v6 = [*(id *)(a1 + 32) cache];
  [v6 removeAllObjects];

  id v7 = [*(id *)(a1 + 32) order];
  [v7 removeAllObjects];
}

- (DDSCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DDSCacheDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end