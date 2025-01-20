@interface APInMemoryTTLCache
- (APInMemoryTTLCache)initWithExpirationInterval:(double)a3 flushQueue:(id)a4;
- (APUnfairLock)lock;
- (BOOL)_updateMostRecentAccessForIdentifier:(id)a3;
- (NSCache)storage;
- (NSHashTable)weakEntryRefs;
- (NSString)queueLabel;
- (OS_dispatch_queue)flushQueue;
- (OS_dispatch_source)flushCacheTimer;
- (double)timeout;
- (id)getObjectForIdentifier:(id)a3;
- (void)_flushCacheStorage;
- (void)_startFlushCacheTimer;
- (void)_stopFlushCacheTimer;
- (void)dealloc;
- (void)recentlyAccessedObject:(id)a3;
- (void)setFlushCacheTimer:(id)a3;
- (void)setFlushQueue:(id)a3;
- (void)setLock:(id)a3;
- (void)setObject:(id)a3;
- (void)setStorage:(id)a3;
- (void)setWeakEntryRefs:(id)a3;
@end

@implementation APInMemoryTTLCache

- (APInMemoryTTLCache)initWithExpirationInterval:(double)a3 flushQueue:(id)a4
{
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)APInMemoryTTLCache;
  v8 = [(APInMemoryTTLCache *)&v19 init];
  if (v8)
  {
    v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    storage = v8->_storage;
    v8->_storage = v9;

    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    weakEntryRefs = v8->_weakEntryRefs;
    v8->_weakEntryRefs = (NSHashTable *)v11;

    v13 = [[APUnfairLock alloc] initWithOptions:0];
    lock = v8->_lock;
    v8->_lock = v13;

    double v15 = 0.0;
    if (a3 >= 0.0) {
      double v15 = a3;
    }
    v8->_timeout = v15;
    objc_storeStrong((id *)&v8->_flushQueue, a4);
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", dispatch_queue_get_label(v7));
    queueLabel = v8->_queueLabel;
    v8->_queueLabel = (NSString *)v16;
  }
  return v8;
}

- (void)setObject:(id)a3
{
  id v4 = a3;
  v10 = [[APPurgeableCacheEntry alloc] initWithObject:v4];
  v5 = [(APInMemoryTTLCache *)self storage];
  v6 = [v4 identifier];

  [v5 setObject:v10 forKey:v6];
  v7 = [(APInMemoryTTLCache *)self lock];
  [v7 lock];
  v8 = [(APInMemoryTTLCache *)self weakEntryRefs];
  [v8 addObject:v10];

  [v7 unlock];
  [(APInMemoryTTLCache *)self timeout];
  if (v9 > 0.0) {
    [(APInMemoryTTLCache *)self _startFlushCacheTimer];
  }
}

- (double)timeout
{
  return self->_timeout;
}

- (NSCache)storage
{
  return self->_storage;
}

- (void)recentlyAccessedObject:(id)a3
{
  id v4 = [a3 identifier];
  [(APInMemoryTTLCache *)self _updateMostRecentAccessForIdentifier:v4];
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (BOOL)_updateMostRecentAccessForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  v8 = [(NSCache *)self->_storage objectForKey:v4];
  double v9 = v8;
  if (!v8) {
    goto LABEL_6;
  }
  if (self->_timeout > 0.0)
  {
    [v8 timestamp];
    if (v7 - v10 >= self->_timeout)
    {
      v12 = [(APInMemoryTTLCache *)self storage];
      [v12 removeObjectForKey:v4];

LABEL_6:
      BOOL v11 = 0;
      goto LABEL_7;
    }
  }
  [v9 setTimestamp:v7];
  BOOL v11 = 1;
LABEL_7:

  return v11;
}

- (void)_startFlushCacheTimer
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(APInMemoryTTLCache *)v2 flushCacheTimer];
  if (!v3)
  {
    v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v2->_flushQueue);
    [(APInMemoryTTLCache *)v2 setFlushCacheTimer:v3];
    if (v3)
    {
      objc_initWeak(&location, v2);
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      BOOL v11 = sub_1D70B4D84;
      v12 = &unk_1E6A6B770;
      objc_copyWeak(&v13, &location);
      id v4 = _Block_copy(&v9);
      dispatch_source_set_timer(v3, 0, 0xDF8475800uLL, 0x37E11D600uLL);
      dispatch_source_set_event_handler(v3, v4);
      dispatch_resume(v3);
      v5 = APLogForCategory(0x13uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        double v6 = [(APInMemoryTTLCache *)v2 queueLabel];
        *(_DWORD *)buf = 138543362;
        uint64_t v16 = v6;
        _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Starting Cache Eviction Timer", buf, 0xCu);
      }
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      double v7 = APLogForCategory(0x13uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = [(APInMemoryTTLCache *)v2 queueLabel];
        *(_DWORD *)buf = 138543362;
        uint64_t v16 = v8;
        _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Error: Could not create eviction timer!", buf, 0xCu);
      }
      APSimulateCrash(5, @"Could not create eviction timer!", 0);
      v3 = 0;
    }
  }

  objc_sync_exit(v2);
}

- (OS_dispatch_source)flushCacheTimer
{
  return self->_flushCacheTimer;
}

- (void)_flushCacheStorage
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v36 = (void *)os_transaction_create();
  v37 = [(APInMemoryTTLCache *)self lock];
  [v37 lock];
  v3 = APLogForCategory(0x13uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(APInMemoryTTLCache *)self queueLabel];
    v5 = [(APInMemoryTTLCache *)self weakEntryRefs];
    *(_DWORD *)buf = 138543619;
    v49 = v4;
    __int16 v50 = 2049;
    uint64_t v51 = [v5 count];
    _os_log_impl(&dword_1D70B2000, v3, OS_LOG_TYPE_INFO, "[%{public}@] Attempting to evict objects from cache. %{private}lu entries remain", buf, 0x16u);
  }
  double v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  BOOL v11 = [(APInMemoryTTLCache *)self weakEntryRefs];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        [v16 timestamp];
        double v18 = v8 - v17;
        [(APInMemoryTTLCache *)self timeout];
        if (v18 > v19)
        {
          v20 = [v16 object];
          v21 = [v20 identifier];

          v22 = [(APInMemoryTTLCache *)self storage];
          [v22 removeObjectForKey:v21];

          [v9 addObject:v16];
          [v10 addObject:v21];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v13);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v23 = v9;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v38 + 1) + 8 * j);
        v29 = [(APInMemoryTTLCache *)self weakEntryRefs];
        [v29 removeObject:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v25);
  }

  v30 = APLogForCategory(0x13uLL);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = [(APInMemoryTTLCache *)self queueLabel];
    uint64_t v32 = [v23 count];
    *(_DWORD *)buf = 138543619;
    v49 = v31;
    __int16 v50 = 2049;
    uint64_t v51 = v32;
    _os_log_impl(&dword_1D70B2000, v30, OS_LOG_TYPE_INFO, "[%{public}@] Cache evicted %{private}lu entries due to expiration", buf, 0x16u);
  }
  v33 = [(APInMemoryTTLCache *)self weakEntryRefs];
  v34 = [v33 allObjects];
  uint64_t v35 = [v34 count];

  if (v35) {
    [(APInMemoryTTLCache *)self _startFlushCacheTimer];
  }
  else {
    [(APInMemoryTTLCache *)self _stopFlushCacheTimer];
  }
  [v37 unlock];
}

- (NSHashTable)weakEntryRefs
{
  return self->_weakEntryRefs;
}

- (NSString)queueLabel
{
  return self->_queueLabel;
}

- (id)getObjectForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NSCache *)self->_storage objectForKey:v4];
  if (v5
    && [(APInMemoryTTLCache *)self _updateMostRecentAccessForIdentifier:v4])
  {
    double v6 = [v5 object];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)setFlushCacheTimer:(id)a3
{
}

- (void)dealloc
{
  [(APInMemoryTTLCache *)self _stopFlushCacheTimer];
  v3.receiver = self;
  v3.super_class = (Class)APInMemoryTTLCache;
  [(APInMemoryTTLCache *)&v3 dealloc];
}

- (void)_stopFlushCacheTimer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = [(APInMemoryTTLCache *)v2 flushCacheTimer];
  id v4 = v3;
  if (v3)
  {
    dispatch_source_cancel(v3);
    [(APInMemoryTTLCache *)v2 setFlushCacheTimer:0];
    v5 = APLogForCategory(0x13uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      double v6 = [(APInMemoryTTLCache *)v2 queueLabel];
      int v7 = 138543362;
      double v8 = v6;
      _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Stopping Cache Eviction Timer", (uint8_t *)&v7, 0xCu);
    }
  }

  objc_sync_exit(v2);
}

- (void)setStorage:(id)a3
{
}

- (void)setWeakEntryRefs:(id)a3
{
}

- (void)setLock:(id)a3
{
}

- (OS_dispatch_queue)flushQueue
{
  return self->_flushQueue;
}

- (void)setFlushQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueLabel, 0);
  objc_storeStrong((id *)&self->_flushQueue, 0);
  objc_storeStrong((id *)&self->_flushCacheTimer, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_weakEntryRefs, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end