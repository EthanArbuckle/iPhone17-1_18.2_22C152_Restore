@interface ATStatusMonitor
+ (id)sharedMonitor;
- (ATStatusMonitor)init;
- (id)allStatus;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setDataClasses:(id)a3 forObserver:(id)a4;
- (void)updateAssets:(id)a3;
- (void)updateStatus:(id)a3;
- (void)updateStatusValuesWithDictionary:(id)a3;
- (void)updateStatusWithValue:(id)a3 forKey:(id)a4;
@end

@implementation ATStatusMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedMonitor___sharedMonitor;

  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  statusQueue = self->_statusQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__ATStatusMonitor_addObserver___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(statusQueue, v7);
}

- (void)setDataClasses:(id)a3 forObserver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  statusQueue = self->_statusQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ATStatusMonitor_setDataClasses_forObserver___block_invoke;
  block[3] = &unk_1E6B8C500;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(statusQueue, block);
}

void __46__ATStatusMonitor_setDataClasses_forObserver___block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  v3 = *(void **)(a1[5] + 24);
  if (v2) {
    [v3 setObject:v2 forKey:a1[6]];
  }
  else {
    [v3 removeObjectForKey:a1[6]];
  }
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = +[ATAssetLinkController sharedInstance];
  id v6 = [v5 allAssets];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = (void *)a1[4];
        v13 = [v11 dataclass];
        LODWORD(v12) = [v12 containsObject:v13];

        if (v12) {
          [v4 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = (void *)a1[6];
  v15 = [v4 allObjects];
  [v14 connection:0 updatedAssets:v15];
}

uint64_t __31__ATStatusMonitor_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    v3 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v4;
      _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "Added observer %{public}@", buf, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
    if (objc_opt_respondsToSelector())
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = *(id *)(*(void *)(a1 + 32) + 32);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*(id *)(a1 + 40), "monitor:didUpdateWithStatus:", *(void *)(a1 + 32), *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
    return objc_msgSend(*(id *)(a1 + 40), "connection:updatedProgress:", 0, *(void *)(*(void *)(a1 + 32) + 40), (void)v10);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDictionary, 0);
  objc_storeStrong((id *)&self->_statuses, 0);
  objc_storeStrong((id *)&self->_observerDataClasses, 0);
  objc_storeStrong((id *)&self->_statusObservers, 0);

  objc_storeStrong((id *)&self->_statusQueue, 0);
}

- (void)updateStatusValuesWithDictionary:(id)a3
{
  id v4 = a3;
  statusQueue = self->_statusQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__ATStatusMonitor_updateStatusValuesWithDictionary___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(statusQueue, v7);
}

void __52__ATStatusMonitor_updateStatusValuesWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 40) addEntriesFromDictionary:*(void *)(a1 + 40)];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "connection:updatedProgress:", 0, *(void *)(*(void *)(a1 + 32) + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)updateStatusWithValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  statusQueue = self->_statusQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ATStatusMonitor_updateStatusWithValue_forKey___block_invoke;
  block[3] = &unk_1E6B8C500;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(statusQueue, block);
}

void __48__ATStatusMonitor_updateStatusWithValue_forKey___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1[4] + 40) setObject:a1[5] forKey:a1[6]];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(a1[4] + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "connection:updatedProgress:", 0, *(void *)(a1[4] + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)updateAssets:(id)a3
{
  id v4 = a3;
  statusQueue = self->_statusQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__ATStatusMonitor_updateAssets___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(statusQueue, v7);
}

void __32__ATStatusMonitor_updateAssets___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v15 = v1;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v4 = [*(id *)(*(void *)(v1 + 32) + 24) objectForKey:v3];
        if (v4)
        {
          uint64_t v17 = v3;
          uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(v1 + 40), "count"));
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v6 = *(id *)(v1 + 40);
          uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v8; ++j)
              {
                if (*(void *)v20 != v9) {
                  objc_enumerationMutation(v6);
                }
                long long v11 = *(void **)(*((void *)&v19 + 1) + 8 * j);
                uint64_t v12 = [v11 dataclass];
                int v13 = [v4 containsObject:v12];

                if (v13) {
                  [v5 addObject:v11];
                }
              }
              uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v8);
          }

          if ([v5 count]) {
            [v17 connection:0 updatedAssets:v5];
          }

          uint64_t v1 = v15;
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }
}

- (void)updateStatus:(id)a3
{
  id v4 = a3;
  statusQueue = self->_statusQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__ATStatusMonitor_updateStatus___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(statusQueue, v7);
}

void __32__ATStatusMonitor_updateStatus___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 40) syncStage]) {
    [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "monitor:didUpdateWithStatus:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)allStatus
{
  id v2 = (void *)[(NSMutableSet *)self->_statuses copy];

  return v2;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  statusQueue = self->_statusQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__ATStatusMonitor_removeObserver___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async(statusQueue, v7);
}

uint64_t __34__ATStatusMonitor_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "Removed observer %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(*(void *)(a1 + 40) + 16) removeObject:*(void *)(a1 + 32)];
}

- (ATStatusMonitor)init
{
  v15.receiver = self;
  v15.super_class = (Class)ATStatusMonitor;
  id v2 = [(ATStatusMonitor *)&v15 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.airtraffic.statusmonitor", 0);
    statusQueue = v2->_statusQueue;
    v2->_statusQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    statusObservers = v2->_statusObservers;
    v2->_statusObservers = (NSHashTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    observerDataClasses = v2->_observerDataClasses;
    v2->_observerDataClasses = (NSMapTable *)v7;

    long long v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    statuses = v2->_statuses;
    v2->_statuses = v9;

    id v11 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v12 = objc_msgSend(v11, "initWithObjectsAndKeys:", MEMORY[0x1E4F1CBF0], @"ConnectedLibraries", MEMORY[0x1E4F1CC28], @"Enabled", MEMORY[0x1E4F1CC28], @"Wireless", MEMORY[0x1E4F1CC28], @"AutoSync", &unk_1F33E2748, @"SyncStage", 0);
    statusDictionary = v2->_statusDictionary;
    v2->_statusDictionary = (NSMutableDictionary *)v12;
  }
  return v2;
}

uint64_t __32__ATStatusMonitor_sharedMonitor__block_invoke()
{
  sharedMonitor___sharedMonitor = objc_alloc_init(ATStatusMonitor);

  return MEMORY[0x1F41817F8]();
}

@end