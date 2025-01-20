@interface DOCFPItemCollectionManager
+ (id)sharedManager;
- (DOCFPItemCollectionManager)init;
- (NSArray)notificationObservances;
- (NSArray)observingCollections;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForegroundNotification;
- (void)collectionDidStartObserving:(id)a3;
- (void)collectionDidStopObserving:(id)a3;
- (void)dealloc;
@end

@implementation DOCFPItemCollectionManager

uint64_t __72__DOCFPItemCollectionManager_applicationWillEnterForegroundNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startObserving];
}

- (void)collectionDidStartObserving:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSCountedSet *)v4->_activeCollections addObject:v5];
  objc_sync_exit(v4);
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__DOCFPItemCollectionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, block);
  }
  v2 = (void *)sharedManager_sharedMyManager;
  return v2;
}

- (DOCFPItemCollectionManager)init
{
  v21[2] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)DOCFPItemCollectionManager;
  v2 = [(DOCFPItemCollectionManager *)&v20 init];
  uint64_t v3 = [objc_alloc(MEMORY[0x263F08760]) initWithCapacity:100];
  activeCollections = v2->_activeCollections;
  v2->_activeCollections = (NSCountedSet *)v3;

  objc_initWeak(&location, v2);
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __34__DOCFPItemCollectionManager_init__block_invoke;
  v17[3] = &unk_2641B6298;
  objc_copyWeak(&v18, &location);
  v6 = [v5 addObserverForName:@"UIApplicationDidEnterBackgroundNotification" object:0 queue:0 usingBlock:v17];
  v21[0] = v6;
  v7 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __34__DOCFPItemCollectionManager_init__block_invoke_2;
  v15 = &unk_2641B6298;
  objc_copyWeak(&v16, &location);
  v8 = [v7 addObserverForName:@"UIApplicationWillEnterForegroundNotification" object:0 queue:0 usingBlock:&v12];
  v21[1] = v8;
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v21, 2, v12, v13, v14, v15);
  notificationObservances = v2->_notificationObservances;
  v2->_notificationObservances = (NSArray *)v9;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  return v2;
}

void __34__DOCFPItemCollectionManager_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained applicationWillEnterForegroundNotification];
}

- (void)applicationWillEnterForegroundNotification
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [(DOCFPItemCollectionManager *)self observingCollections];
  uint64_t v3 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    uint64_t v3 = docLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v2;
    _os_log_impl(&dword_213670000, v3, OS_LOG_TYPE_DEFAULT, "App will become foreground. Starting collections %@", buf, 0xCu);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = [v9 workingQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __72__DOCFPItemCollectionManager_applicationWillEnterForegroundNotification__block_invoke;
        block[3] = &unk_2641B55D8;
        block[4] = v9;
        dispatch_async(v10, block);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (NSArray)observingCollections
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(NSCountedSet *)v2->_activeCollections allObjects];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

uint64_t __43__DOCFPItemCollectionManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedManager_sharedMyManager;
  sharedManager_sharedMyManager = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

void __34__DOCFPItemCollectionManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained applicationDidEnterBackground];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  notificationObservances = self->_notificationObservances;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__DOCFPItemCollectionManager_dealloc__block_invoke;
  v7[3] = &unk_2641B62C0;
  id v8 = v3;
  id v5 = v3;
  [(NSArray *)notificationObservances enumerateObjectsUsingBlock:v7];

  v6.receiver = self;
  v6.super_class = (Class)DOCFPItemCollectionManager;
  [(DOCFPItemCollectionManager *)&v6 dealloc];
}

uint64_t __37__DOCFPItemCollectionManager_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObserver:a2];
}

- (void)applicationDidEnterBackground
{
  uint64_t v3 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    uint64_t v3 = docLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213670000, v3, OS_LOG_TYPE_DEFAULT, "App did enter background. Calling process activity to suspend FPItemCollection enumeration", buf, 2u);
  }
  id v4 = [MEMORY[0x263F08AB0] processInfo];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__DOCFPItemCollectionManager_applicationDidEnterBackground__block_invoke;
  v5[3] = &unk_2641B62E8;
  v5[4] = self;
  [v4 performExpiringActivityWithReason:@"suspend FPItemCollection enumeration" usingBlock:v5];
}

void __59__DOCFPItemCollectionManager_applicationDidEnterBackground__block_invoke(uint64_t a1, int a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    id v4 = docLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (a2) {
      id v5 = @"YES";
    }
    else {
      id v5 = @"NO";
    }
    objc_super v6 = *(void **)(a1 + 32);
    uint64_t v7 = v4;
    id v8 = [v6 observingCollections];
    *(_DWORD *)buf = 138412546;
    v34 = v5;
    __int16 v35 = 2112;
    v36 = v8;
    _os_log_impl(&dword_213670000, v7, OS_LOG_TYPE_DEFAULT, "App did enter background. Now performing expiring activity [expired: %@] for collections %@", buf, 0x16u);
  }
  if ((a2 & 1) == 0)
  {
    uint64_t v9 = [*(id *)(a1 + 32) observingCollections];
    if ([v9 count])
    {
      v10 = dispatch_group_create();
      objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      v22 = v21 = v9;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v29;
        long long v15 = (void *)MEMORY[0x263EF83A0];
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v11);
            }
            v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            id v18 = objc_msgSend(v17, "workingQueue", v21);

            if (v18 == v15)
            {
              [v22 addObject:v17];
            }
            else
            {
              dispatch_group_enter(v10);
              uint64_t v19 = [v17 workingQueue];
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __59__DOCFPItemCollectionManager_applicationDidEnterBackground__block_invoke_22;
              block[3] = &unk_2641B5600;
              block[4] = v17;
              v27 = v10;
              dispatch_async(v19, block);
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v13);
      }

      if ([v22 count])
      {
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __59__DOCFPItemCollectionManager_applicationDidEnterBackground__block_invoke_23;
        v23[3] = &unk_2641B5600;
        v24 = v10;
        id v25 = v22;
        dispatch_async(MEMORY[0x263EF83A0], v23);
      }
      dispatch_time_t v20 = dispatch_time(0, 3000000000);
      dispatch_group_wait(v10, v20);

      uint64_t v9 = v21;
    }
  }
}

void __59__DOCFPItemCollectionManager_applicationDidEnterBackground__block_invoke_22(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    uint64_t v2 = docLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_213670000, v2, OS_LOG_TYPE_DEFAULT, "App did enter background. Call stopObserving on working queue for collection %@", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(a1 + 32) stopObserving];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __59__DOCFPItemCollectionManager_applicationDidEnterBackground__block_invoke_23(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v12;
    *(void *)&long long v4 = 138412290;
    long long v10 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        uint64_t v9 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          uint64_t v9 = docLogHandle;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v10;
          id v16 = v8;
          _os_log_impl(&dword_213670000, v9, OS_LOG_TYPE_DEFAULT, "App did enter background. Call stopObserving on main queue for collection %@", buf, 0xCu);
        }
        objc_msgSend(v8, "stopObserving", v10, (void)v11);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)collectionDidStopObserving:(id)a3
{
  id v5 = a3;
  long long v4 = self;
  objc_sync_enter(v4);
  [(NSCountedSet *)v4->_activeCollections removeObject:v5];
  objc_sync_exit(v4);
}

- (NSArray)notificationObservances
{
  return self->_notificationObservances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObservances, 0);
  objc_storeStrong((id *)&self->_activeCollections, 0);
}

@end