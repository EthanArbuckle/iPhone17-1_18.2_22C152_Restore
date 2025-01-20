@interface AVTInMemoryResourceCache
+ (id)keyForItem:(id)a3 scope:(id)a4;
+ (unint64_t)costForItem:(id)a3 scope:(id)a4;
- (AVTInMemoryResourceCache)initWithLockProvider:(id)a3 totalCostLimit:(unint64_t)a4 logger:(id)a5;
- (AVTUILogger)logger;
- (BOOL)resourceExistsInCacheForItem:(id)a3 scope:(id)a4;
- (NSCache)storage;
- (NSMutableArray)orderedEntries;
- (OS_dispatch_queue)storageLock;
- (id)_resourceForItem:(id)a3 scope:(id)a4 cacheMissHandler:(id)a5;
- (id)observeChangesForItem:(id)a3 key:(id)a4;
- (id)resourceForItem:(id)a3 scope:(id)a4;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)clearCache;
- (void)dealloc;
- (void)evictResourceFromCache:(id)a3 scope:(id)a4;
- (void)handleChangeForItemForKey:(id)a3;
- (void)nts_evictObjectsToFreeUpCost:(unint64_t)a3;
- (void)performStorageWork:(id)a3;
@end

@implementation AVTInMemoryResourceCache

+ (id)keyForItem:(id)a3 scope:(id)a4
{
  return (id)[a3 volatileIdentifierForScope:a4];
}

- (id)observeChangesForItem:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __54__AVTInMemoryResourceCache_observeChangesForItem_key___block_invoke;
    v10[3] = &unk_263FF03B0;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    v8 = [v6 tokenForObservingChangesWithHandler:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v5 = a4;
  id v6 = [(AVTInMemoryResourceCache *)self logger];
  id v7 = [v5 description];
  [v6 logInMemoryCacheEvictsResource:v7];

  id v8 = [(AVTInMemoryResourceCache *)self orderedEntries];
  [v8 removeObject:v5];
}

- (OS_dispatch_queue)storageLock
{
  return self->_storageLock;
}

uint64_t __68__AVTInMemoryResourceCache__resourceForItem_scope_cacheMissHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 objectForKey:a1[4]];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(*(void *)(a1[5] + 8) + 40) resource];
  return MEMORY[0x270F9A758]();
}

- (AVTInMemoryResourceCache)initWithLockProvider:(id)a3 totalCostLimit:(unint64_t)a4 logger:(id)a5
{
  id v8 = (void (**)(id, const char *))a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AVTInMemoryResourceCache;
  v10 = [(AVTInMemoryResourceCache *)&v18 init];
  if (v10)
  {
    id v11 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    storage = v10->_storage;
    v10->_storage = v11;

    uint64_t v13 = [MEMORY[0x263EFF980] array];
    orderedEntries = v10->_orderedEntries;
    v10->_orderedEntries = (NSMutableArray *)v13;

    [(NSCache *)v10->_storage setTotalCostLimit:a4];
    [(NSCache *)v10->_storage setDelegate:v10];
    uint64_t v15 = v8[2](v8, "com.apple.AvatarUI.AVTInMemoryResourceCache.storageLock");
    storageLock = v10->_storageLock;
    v10->_storageLock = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v10->_logger, a5);
  }

  return v10;
}

- (void)dealloc
{
  [(NSCache *)self->_storage removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)AVTInMemoryResourceCache;
  [(AVTInMemoryResourceCache *)&v3 dealloc];
}

+ (unint64_t)costForItem:(id)a3 scope:(id)a4
{
  return [a3 costForScope:a4];
}

- (void)performStorageWork:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTInMemoryResourceCache *)self storageLock];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__AVTInMemoryResourceCache_performStorageWork___block_invoke;
  v7[3] = &unk_263FF02C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __47__AVTInMemoryResourceCache_performStorageWork___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) storage];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)resourceExistsInCacheForItem:(id)a3 scope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() keyForItem:v6 scope:v7];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  objc_super v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__AVTInMemoryResourceCache_resourceExistsInCacheForItem_scope___block_invoke;
  v11[3] = &unk_263FF02F0;
  uint64_t v13 = &v14;
  id v9 = v8;
  id v12 = v9;
  [(AVTInMemoryResourceCache *)self performStorageWork:v11];
  LOBYTE(self) = v15[5] != 0;

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __63__AVTInMemoryResourceCache_resourceExistsInCacheForItem_scope___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKey:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

- (id)resourceForItem:(id)a3 scope:(id)a4
{
  return [(AVTInMemoryResourceCache *)self _resourceForItem:a3 scope:a4 cacheMissHandler:0];
}

- (id)_resourceForItem:(id)a3 scope:(id)a4 cacheMissHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, id, id))a5;
  id v11 = [(id)objc_opt_class() keyForItem:v8 scope:v9];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__0;
  v41 = __Block_byref_object_dispose__0;
  id v42 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__0;
  v35 = __Block_byref_object_dispose__0;
  id v36 = 0;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __68__AVTInMemoryResourceCache__resourceForItem_scope_cacheMissHandler___block_invoke;
  v27[3] = &unk_263FF0318;
  v29 = &v37;
  id v12 = v11;
  id v28 = v12;
  v30 = &v31;
  [(AVTInMemoryResourceCache *)self performStorageWork:v27];
  if (v10 && !v32[5])
  {
    uint64_t v13 = [(id)objc_opt_class() costForItem:v8 scope:v9];
    uint64_t v14 = v10[2](v10, v8, v9);
    uint64_t v15 = (void *)v32[5];
    v32[5] = v14;

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __68__AVTInMemoryResourceCache__resourceForItem_scope_cacheMissHandler___block_invoke_2;
    v20[3] = &unk_263FF0340;
    v24 = &v37;
    id v21 = v12;
    v22 = self;
    id v23 = v8;
    v25 = &v31;
    uint64_t v26 = v13;
    [(AVTInMemoryResourceCache *)self performStorageWork:v20];
  }
  if (v38[5])
  {
    uint64_t v16 = [(AVTInMemoryResourceCache *)self logger];
    v17 = [(id)v38[5] description];
    [v16 logInMemoryCacheHitForResource:v17];
  }
  id v18 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v18;
}

void __68__AVTInMemoryResourceCache__resourceForItem_scope_cacheMissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v6 = [*(id *)(a1 + 40) observeChangesForItem:*(void *)(a1 + 48) key:*(void *)(a1 + 32)];
    id v7 = [[AVTInMemoryResourceCacheEntry alloc] initWithResource:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) changeToken:v6 key:*(void *)(a1 + 32) cost:*(void *)(a1 + 72)];
    objc_msgSend(*(id *)(a1 + 40), "nts_evictObjectsToFreeUpCost:", *(void *)(a1 + 72));
    id v8 = [*(id *)(a1 + 40) logger];
    id v9 = [(AVTInMemoryResourceCacheEntry *)v7 description];
    [v8 logInMemoryCacheStorageForResource:v9];

    v10 = [*(id *)(a1 + 40) orderedEntries];
    [v10 addObject:v7];

    [v11 setObject:v7 forKey:*(void *)(a1 + 32) cost:*(void *)(a1 + 72)];
  }
}

- (void)evictResourceFromCache:(id)a3 scope:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() keyForItem:v7 scope:v6];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__AVTInMemoryResourceCache_evictResourceFromCache_scope___block_invoke;
  v10[3] = &unk_263FF0368;
  id v11 = v8;
  id v9 = v8;
  [(AVTInMemoryResourceCache *)self performStorageWork:v10];
}

uint64_t __57__AVTInMemoryResourceCache_evictResourceFromCache_scope___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObjectForKey:*(void *)(a1 + 32)];
}

- (void)clearCache
{
}

uint64_t __38__AVTInMemoryResourceCache_clearCache__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

- (void)nts_evictObjectsToFreeUpCost:(unint64_t)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = [(AVTInMemoryResourceCache *)self storage];
  uint64_t v6 = [v5 totalCostLimit];

  id v7 = [(AVTInMemoryResourceCache *)self orderedEntries];
  uint64_t v8 = [v7 count];

  if (v8 - 1 >= 0)
  {
    unint64_t v9 = 0;
    unint64_t v10 = v6 - a3;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      --v8;
      id v12 = [(AVTInMemoryResourceCache *)self orderedEntries];
      uint64_t v13 = [v12 objectAtIndexedSubscript:v8];

      v9 += [v13 cost];
      if (v9 > v10) {
        break;
      }
      uint64_t v11 = v8;
      if (v8 < 1) {
        return;
      }
    }
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = [(AVTInMemoryResourceCache *)self orderedEntries];
      uint64_t v15 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, v11);
      uint64_t v16 = [v14 objectsAtIndexes:v15];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            id v23 = [(AVTInMemoryResourceCache *)self storage];
            v24 = [v22 key];
            [v23 removeObjectForKey:v24];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v19);
      }
    }
  }
}

void __54__AVTInMemoryResourceCache_observeChangesForItem_key___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleChangeForItemForKey:*(void *)(a1 + 32)];
}

- (void)handleChangeForItemForKey:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__AVTInMemoryResourceCache_handleChangeForItemForKey___block_invoke;
  v6[3] = &unk_263FF0368;
  id v7 = v4;
  id v5 = v4;
  [(AVTInMemoryResourceCache *)self performStorageWork:v6];
}

uint64_t __54__AVTInMemoryResourceCache_handleChangeForItemForKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObjectForKey:*(void *)(a1 + 32)];
}

- (NSCache)storage
{
  return self->_storage;
}

- (NSMutableArray)orderedEntries
{
  return self->_orderedEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_storageLock, 0);
  objc_storeStrong((id *)&self->_orderedEntries, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end