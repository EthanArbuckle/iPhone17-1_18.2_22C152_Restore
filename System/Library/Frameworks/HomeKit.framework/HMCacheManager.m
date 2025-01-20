@interface HMCacheManager
- (HMCacheManager)initWithTimerFactory:(id)a3 persistentCache:(id)a4;
- (HMFTimer)writeDebounceTimer;
- (HMPersistentCache)persistentCache;
- (NSMapTable)cacheMap;
- (NSMutableDictionary)pendingWrites;
- (OS_dispatch_queue)workQueue;
- (id)_cacheWithName:(id)a3;
- (id)_loadCacheNamed:(id)a3;
- (id)cacheWithName:(id)a3;
- (void)_saveCache:(id)a3;
- (void)cacheDidUpdate:(id)a3;
- (void)cacheWithName:(id)a3 completion:(id)a4;
- (void)forceFlushToDisk;
- (void)timerDidFire:(id)a3;
@end

@implementation HMCacheManager

- (HMCacheManager)initWithTimerFactory:(id)a3 persistentCache:(id)a4
{
  v6 = (void (**)(void))a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HMCacheManager;
  v8 = [(HMCacheManager *)&v22 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    cacheMap = v9->_cacheMap;
    v9->_cacheMap = (NSMapTable *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingWrites = v9->_pendingWrites;
    v9->_pendingWrites = (NSMutableDictionary *)v12;

    HMDispatchQueueNameString(v9, @"WorkQueue");
    id v14 = objc_claimAutoreleasedReturnValue();
    v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v9->_persistentCache, a4);
    uint64_t v19 = v6[2](v6);
    writeDebounceTimer = v9->_writeDebounceTimer;
    v9->_writeDebounceTimer = (HMFTimer *)v19;

    [(HMFTimer *)v9->_writeDebounceTimer setDelegate:v9];
    [(HMFTimer *)v9->_writeDebounceTimer setDelegateQueue:v9->_workQueue];
  }

  return v9;
}

- (id)cacheWithName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v5 = [(HMCacheManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__HMCacheManager_cacheWithName___block_invoke;
  block[3] = &unk_1E593F520;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)cacheDidUpdate:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock_with_options();
  pendingWrites = self->_pendingWrites;
  v5 = [v7 name];
  [(NSMutableDictionary *)pendingWrites setObject:v7 forKeyedSubscript:v5];

  os_unfair_lock_unlock(&self->_lock);
  id v6 = [(HMCacheManager *)self writeDebounceTimer];
  [v6 resume];
}

- (HMFTimer)writeDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

uint64_t __32__HMCacheManager_cacheWithName___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cacheWithName:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_cacheWithName:(id)a3
{
  id v4 = a3;
  v5 = [(HMCacheManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  id v6 = [(NSMapTable *)self->_cacheMap objectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
  {
    id v6 = [(HMCacheManager *)self _loadCacheNamed:v4];
    [v6 setDelegate:self];
    os_unfair_lock_lock_with_options();
    [(NSMapTable *)self->_cacheMap setObject:v6 forKey:v4];
    os_unfair_lock_unlock(&self->_lock);
  }

  return v6;
}

- (id)_loadCacheNamed:(id)a3
{
  id v4 = a3;
  v5 = [(HMCacheManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMCacheManager *)self persistentCache];
  id v7 = [v6 loadCachedObjectsForCacheWithName:v4];

  v8 = [[HMCache alloc] initWithCachedObjects:v7 name:v4];

  return v8;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (HMPersistentCache)persistentCache
{
  return (HMPersistentCache *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_writeDebounceTimer, 0);
  objc_storeStrong((id *)&self->_pendingWrites, 0);
  objc_storeStrong((id *)&self->_cacheMap, 0);

  objc_storeStrong((id *)&self->_persistentCache, 0);
}

- (NSMutableDictionary)pendingWrites
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSMapTable)cacheMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 24, 1);
}

- (void)forceFlushToDisk
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMCacheManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableDictionary *)self->_pendingWrites copy];
  [(NSMutableDictionary *)self->_pendingWrites removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * v8), (void)v10);
        [(HMCacheManager *)self _saveCache:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMCacheManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMCacheManager *)self writeDebounceTimer];

  if (v6 == v4)
  {
    [(HMCacheManager *)self forceFlushToDisk];
  }
}

- (void)_saveCache:(id)a3
{
  id v4 = a3;
  id v5 = [(HMCacheManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v8 = [(HMCacheManager *)self persistentCache];
  id v6 = [v4 cachedObjects];
  uint64_t v7 = [v4 name];

  [v8 storeCachedObjects:v6 forCacheName:v7];
}

- (void)cacheWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMCacheManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__HMCacheManager_cacheWithName_completion___block_invoke;
  block[3] = &unk_1E5945138;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __43__HMCacheManager_cacheWithName_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _cacheWithName:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end