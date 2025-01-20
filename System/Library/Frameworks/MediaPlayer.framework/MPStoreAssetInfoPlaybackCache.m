@interface MPStoreAssetInfoPlaybackCache
+ (MPStoreAssetInfoPlaybackCache)sharedCache;
- (id)_init;
- (id)cachedResponseForRequest:(id)a3;
- (void)addCachedResponse:(id)a3 forRequest:(id)a4;
- (void)updateForPlaybackOfFileAsset:(id)a3 fromResponse:(id)a4;
- (void)withSyncLock:(id)a3;
@end

@implementation MPStoreAssetInfoPlaybackCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToCachedResponse, 0);

  objc_storeStrong((id *)&self->_accessOrderedRequests, 0);
}

- (void)updateForPlaybackOfFileAsset:(id)a3 fromResponse:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__MPStoreAssetInfoPlaybackCache_updateForPlaybackOfFileAsset_fromResponse___block_invoke;
  v7[3] = &unk_1E57F9F98;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(MPStoreAssetInfoPlaybackCache *)self withSyncLock:v7];
}

void __75__MPStoreAssetInfoPlaybackCache_updateForPlaybackOfFileAsset_fromResponse___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__42151;
  v19 = __Block_byref_object_dispose__42152;
  id v20 = 0;
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__MPStoreAssetInfoPlaybackCache_updateForPlaybackOfFileAsset_fromResponse___block_invoke_2;
  v12[3] = &unk_1E57F6940;
  id v13 = *(id *)(a1 + 40);
  v14 = &v15;
  [v2 enumerateKeysAndObjectsUsingBlock:v12];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = (id)v16[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObjectForKey:", v7, (void)v8);
        [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v7];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v21 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v15, 8);
}

void __75__MPStoreAssetInfoPlaybackCache_updateForPlaybackOfFileAsset_fromResponse___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  uint64_t v5 = [a3 fileAssetInfoList];
  int v6 = [v5 containsObject:*(void *)(a1 + 32)];

  if (v6)
  {
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v7)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v7 addObject:v11];
  }
}

- (id)cachedResponseForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__42151;
  uint64_t v15 = __Block_byref_object_dispose__42152;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__MPStoreAssetInfoPlaybackCache_cachedResponseForRequest___block_invoke;
  v8[3] = &unk_1E57F9F48;
  long long v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(MPStoreAssetInfoPlaybackCache *)self withSyncLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __58__MPStoreAssetInfoPlaybackCache_cachedResponseForRequest___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (v5)
  {
    id v6 = [v5 expirationDate];
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 timeIntervalSinceNow];
      if (v8 < 10.0)
      {
        [*(id *)(a1[4] + 24) removeObjectForKey:a1[5]];
        uint64_t v9 = *(void *)(a1[6] + 8);
        long long v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = 0;
      }
    }
  }
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v11 = a1[5];
  v12 = *(void **)(a1[4] + 16);

  return [v12 insertObject:v11 atIndex:0];
}

- (void)addCachedResponse:(id)a3 forRequest:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)[a3 copy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__MPStoreAssetInfoPlaybackCache_addCachedResponse_forRequest___block_invoke;
  v10[3] = &unk_1E57FA038;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MPStoreAssetInfoPlaybackCache *)self withSyncLock:v10];
}

void __62__MPStoreAssetInfoPlaybackCache_addCachedResponse_forRequest___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = [v7 expirationDate];
  if (!v2
    || ([*(id *)(a1 + 48) expirationDate],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v2 laterDate:v3],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4 == v3))
  {
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
  }
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 16) insertObject:*(void *)(a1 + 40) atIndex:0];
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 16) count] >= 0x33)
  {
    do
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) count] - 1;
      id v6 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndex:v5];
      [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:v6];
      [*(id *)(*(void *)(a1 + 32) + 16) removeObjectAtIndex:v5];
    }
    while ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 16) count] > 0x32);
  }
}

- (void)withSyncLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)MPStoreAssetInfoPlaybackCache;
  uint64_t v2 = [(MPStoreAssetInfoPlaybackCache *)&v9 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    accessOrderedRequests = v3->_accessOrderedRequests;
    v3->_accessOrderedRequests = v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestToCachedResponse = v3->_requestToCachedResponse;
    v3->_requestToCachedResponse = v6;
  }
  return v3;
}

+ (MPStoreAssetInfoPlaybackCache)sharedCache
{
  if (sharedCache_sOnceToken != -1) {
    dispatch_once(&sharedCache_sOnceToken, &__block_literal_global_42164);
  }
  uint64_t v2 = (void *)sharedCache_sSharedCache;

  return (MPStoreAssetInfoPlaybackCache *)v2;
}

void __44__MPStoreAssetInfoPlaybackCache_sharedCache__block_invoke()
{
  id v0 = [[MPStoreAssetInfoPlaybackCache alloc] _init];
  v1 = (void *)sharedCache_sSharedCache;
  sharedCache_sSharedCache = (uint64_t)v0;
}

@end