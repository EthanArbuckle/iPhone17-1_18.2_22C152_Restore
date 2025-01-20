@interface CADDatabaseConnectionPoolManager
- (CADDatabaseConnectionPoolManager)init;
- (id)poolForClient:(id)a3 options:(id)a4;
- (void)_purgeAndReschedule;
- (void)databaseChangedExternally:(id)a3;
- (void)returnPool:(id)a3 forClient:(id)a4;
- (void)schedulePurge;
@end

@implementation CADDatabaseConnectionPoolManager

- (void)schedulePurge
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_purgeScheduled)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_purgeScheduled = 1;
    os_unfair_lock_unlock(p_lock);
    v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v9 = 0x4044000000000000;
      _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_DEBUG, "Scheduling a purge for %f seconds", buf, 0xCu);
    }
    dispatch_time_t v5 = dispatch_time(0, 40000000000);
    purgeQueue = self->_purgeQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__CADDatabaseConnectionPoolManager_schedulePurge__block_invoke;
    block[3] = &unk_1E624E508;
    block[4] = self;
    dispatch_after(v5, purgeQueue, block);
  }
}

- (id)poolForClient:(id)a3 options:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (CADDatabasePoolKey *)a4;
  if (([(CADDatabasePoolKey *)v7 databaseInitOptions] & 0x20) != 0)
  {
    uint64_t v9 = [[CADDatabaseSingleConnectionProvider alloc] initWithConfiguration:v7];
    v8 = v7;
  }
  else
  {
    v8 = [[CADDatabasePoolKey alloc] initWithInitializationOptions:v7];

    os_unfair_lock_lock(&self->_lock);
    uint64_t v9 = [(NSMutableDictionary *)self->_pools objectForKeyedSubscript:v8];
    if (!v9)
    {
      uint64_t v10 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 138412290;
        v15 = v8;
        _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_DEBUG, "Creating a new pool for %@", (uint8_t *)&v14, 0xCu);
      }
      v11 = [CADDatabaseConnectionPool alloc];
      v12 = [(CADDatabasePoolKey *)v8 options];
      uint64_t v9 = [(CADDatabaseConnectionPool *)v11 initWithOptions:v12 manager:self];

      [(NSMutableDictionary *)self->_pools setObject:v9 forKeyedSubscript:v8];
    }
    [(CADDatabaseSingleConnectionProvider *)v9 addClient:v6];
    os_unfair_lock_unlock(&self->_lock);
  }

  return v9;
}

- (CADDatabaseConnectionPoolManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)CADDatabaseConnectionPoolManager;
  v2 = [(CADDatabaseConnectionPoolManager *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.calendar.db_connection_purge", v3);
    purgeQueue = v2->_purgeQueue;
    v2->_purgeQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    pools = v2->_pools;
    v2->_pools = (NSMutableDictionary *)v6;

    v2->_lock._os_unfair_lock_opaque = 0;
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel_databaseChangedExternally_ name:*MEMORY[0x1E4F574A0] object:0];
  }
  return v2;
}

uint64_t __49__CADDatabaseConnectionPoolManager_schedulePurge__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeAndReschedule];
}

- (void)_purgeAndReschedule
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CalApproximateContinuousTime();
  uint64_t v4 = CalNSTimeIntervalToContinuousInterval();
  long long v26 = xmmword_1BBD050C0;
  os_unfair_lock_lock(&self->_lock);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  dispatch_time_t v5 = self->_pools;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v22 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = v3 - v4;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = [(NSMutableDictionary *)self->_pools objectForKeyedSubscript:*(void *)(*((void *)&v22 + 1) + 8 * v10)];
        [v11 purgeConnectionsLastUsedPriorTo:v8 stats:&v26];

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v22 objects:v33 count:16];
    }
    while (v7);
  }

  unint64_t v12 = CalApproximateContinuousTime();
  unint64_t v13 = *((void *)&v26 + 1);
  self->_purgeScheduled = *((void *)&v26 + 1) < v12;
  os_unfair_lock_unlock(&self->_lock);
  if (v13 >= v12)
  {
    v20 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      int v28 = v26;
      __int16 v29 = 1024;
      int v30 = DWORD1(v26);
      _os_log_impl(&dword_1BBC88000, v20, OS_LOG_TYPE_INFO, "Purged %i unused connections (%i remain.) Not scheduling another purge because no old pools remain", buf, 0xEu);
    }
  }
  else
  {
    CalContinuousIntervalToNSTimeInterval();
    double v15 = 20.0 - v14 + 20.0;
    if (v15 >= 0.0) {
      double v16 = v15;
    }
    else {
      double v16 = 0.0;
    }
    v17 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      int v28 = v26;
      __int16 v29 = 1024;
      int v30 = DWORD1(v26);
      __int16 v31 = 2048;
      double v32 = v16;
      _os_log_impl(&dword_1BBC88000, v17, OS_LOG_TYPE_INFO, "Purged %i unused connections (%i remain.) Scheduling another check in %f seconds", buf, 0x18u);
    }
    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
    purgeQueue = self->_purgeQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__CADDatabaseConnectionPoolManager__purgeAndReschedule__block_invoke;
    block[3] = &unk_1E624E508;
    block[4] = self;
    dispatch_after(v18, purgeQueue, block);
  }
}

uint64_t __55__CADDatabaseConnectionPoolManager__purgeAndReschedule__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeAndReschedule];
}

- (void)databaseChangedExternally:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 userInfo];
  dispatch_time_t v5 = [v4 objectForKeyedSubscript:@"path"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"auxDBID"];
  uint64_t v7 = [v6 intValue];

  if (([v5 hasSuffix:@"/"] & 1) == 0)
  {
    uint64_t v8 = [v5 stringByAppendingString:@"/"];

    dispatch_time_t v5 = (void *)v8;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = [(NSMutableDictionary *)self->_pools allValues];
  os_unfair_lock_unlock(p_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "databaseChangedExternally:auxDatabaseID:", v5, v7, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)returnPool:(id)a3 forClient:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    [v8 removeClient:v7];
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (![v8 numberOfClients])
    {
      long long v18 = &self->_lock;
      id v19 = v8;
      uint64_t v10 = objc_opt_new();
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = self->_pools;
      uint64_t v12 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            long long v17 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pools, "objectForKeyedSubscript:", v16, v18, v19, (void)v20);
            if (![v17 numberOfClients]) {
              [v10 addObject:v16];
            }
          }
          uint64_t v13 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v13);
      }

      [(NSMutableDictionary *)self->_pools removeObjectsForKeys:v10];
      p_lock = v18;
      id v8 = v19;
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeQueue, 0);
  objc_storeStrong((id *)&self->_pools, 0);
}

@end