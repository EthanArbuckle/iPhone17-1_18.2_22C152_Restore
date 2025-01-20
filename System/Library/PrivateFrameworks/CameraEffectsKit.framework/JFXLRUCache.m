@interface JFXLRUCache
- (BOOL)JT_removeLeastRecentlyUsedIfAtCapacity;
- (JFXLRUCache)initWithCapacity:(unint64_t)a3;
- (NSMutableDictionary)dictionary;
- (NSMutableOrderedSet)keys;
- (OS_dispatch_queue)cacheQueue;
- (id)objectForKey:(id)a3;
- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4;
- (unint64_t)capacity;
- (unint64_t)count;
- (void)JT_markRecentlyUsed:(id)a3;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setCapacity:(unint64_t)a3;
- (void)setKeys:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation JFXLRUCache

- (JFXLRUCache)initWithCapacity:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)JFXLRUCache;
  v4 = [(JFXLRUCache *)&v13 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    dictionary = v4->_dictionary;
    v4->_dictionary = (NSMutableDictionary *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.cachedictionary", 0);
    cacheQueue = v4->_cacheQueue;
    v4->_cacheQueue = (OS_dispatch_queue *)v7;

    v4->_capacity = a3;
    uint64_t v9 = [objc_alloc(MEMORY[0x263EFF9B0]) initWithCapacity:v4->_capacity + 1];
    keys = v4->_keys;
    v4->_keys = (NSMutableOrderedSet *)v9;

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v4 selector:sel_highMemoryWarning name:*MEMORY[0x263F1D060] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D060] object:0];

  v4.receiver = self;
  v4.super_class = (Class)JFXLRUCache;
  [(JFXLRUCache *)&v4 dealloc];
}

- (unint64_t)capacity
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(JFXLRUCache *)self cacheQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __23__JFXLRUCache_capacity__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __23__JFXLRUCache_capacity__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)setCapacity:(unint64_t)a3
{
  if (self->_capacity != a3)
  {
    uint64_t v5 = [(JFXLRUCache *)self cacheQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __27__JFXLRUCache_setCapacity___block_invoke;
    v6[3] = &unk_264C0A3A0;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(v5, v6);
  }
}

uint64_t __27__JFXLRUCache_setCapacity___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(a1 + 40);
  do
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "JT_removeLeastRecentlyUsedIfAtCapacity");
  while ((result & 1) != 0);
  return result;
}

- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__15;
  v21 = __Block_byref_object_dispose__15;
  id v22 = 0;
  v8 = [(JFXLRUCache *)self cacheQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__JFXLRUCache_objectsForKeys_notFoundMarker___block_invoke;
  v13[3] = &unk_264C0AB88;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __45__JFXLRUCache_objectsForKeys_notFoundMarker___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) dictionary];
  uint64_t v3 = [v2 objectsForKeys:*(void *)(a1 + 40) notFoundMarker:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(a1 + 32), "JT_markRecentlyUsed:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(JFXLRUCache *)self cacheQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__JFXLRUCache_addEntriesFromDictionary___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __40__JFXLRUCache_addEntriesFromDictionary___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) dictionary];
  [v2 addEntriesFromDictionary:*(void *)(a1 + 40)];

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "allKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(a1 + 32), "JT_markRecentlyUsed:", *(void *)(*((void *)&v8 + 1) + 8 * v7));
        objc_msgSend(*(id *)(a1 + 32), "JT_removeLeastRecentlyUsedIfAtCapacity");
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (unint64_t)count
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(JFXLRUCache *)self cacheQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __20__JFXLRUCache_count__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __20__JFXLRUCache_count__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dictionary];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(JFXLRUCache *)self cacheQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__JFXLRUCache_setObject_forKey___block_invoke;
  block[3] = &unk_264C0A888;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

uint64_t __32__JFXLRUCache_setObject_forKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dictionary];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];

  objc_msgSend(*(id *)(a1 + 32), "JT_markRecentlyUsed:", *(void *)(a1 + 48));
  uint64_t v3 = *(void **)(a1 + 32);
  return objc_msgSend(v3, "JT_removeLeastRecentlyUsedIfAtCapacity");
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__15;
  uint64_t v16 = __Block_byref_object_dispose__15;
  id v17 = 0;
  uint64_t v5 = [(JFXLRUCache *)self cacheQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__JFXLRUCache_objectForKey___block_invoke;
  block[3] = &unk_264C0A4B8;
  id v10 = v4;
  long long v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __28__JFXLRUCache_objectForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dictionary];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    objc_msgSend(v6, "JT_markRecentlyUsed:", v7);
  }
}

- (void)removeAllObjects
{
  uint64_t v3 = [(JFXLRUCache *)self cacheQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__JFXLRUCache_removeAllObjects__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __31__JFXLRUCache_removeAllObjects__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dictionary];
  [v2 removeAllObjects];

  id v3 = [*(id *)(a1 + 32) keys];
  [v3 removeAllObjects];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(JFXLRUCache *)self cacheQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__JFXLRUCache_removeObjectForKey___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __34__JFXLRUCache_removeObjectForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dictionary];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) keys];
  [v3 removeObject:*(void *)(a1 + 40)];
}

- (void)JT_markRecentlyUsed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(JFXLRUCache *)self keys];
  [v5 removeObject:v4];

  id v6 = [(JFXLRUCache *)self keys];
  [v6 insertObject:v4 atIndex:0];
}

- (BOOL)JT_removeLeastRecentlyUsedIfAtCapacity
{
  if (!self->_capacity) {
    return 0;
  }
  id v3 = [(JFXLRUCache *)self keys];
  unint64_t v4 = [v3 count];

  if (v4 <= self->_capacity) {
    return 0;
  }
  uint64_t v5 = [(JFXLRUCache *)self keys];
  unint64_t v6 = v4 - 1;
  uint64_t v7 = [v5 objectAtIndex:v4 - 1];

  if (v7)
  {
    id v8 = [(JFXLRUCache *)self dictionary];
    [v8 removeObjectForKey:v7];

    id v9 = [(JFXLRUCache *)self keys];
    [v9 removeObjectAtIndex:v6];
  }
  return 1;
}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (NSMutableOrderedSet)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (OS_dispatch_queue)cacheQueue
{
  return self->_cacheQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end