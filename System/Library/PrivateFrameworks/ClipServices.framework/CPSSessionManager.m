@interface CPSSessionManager
+ (CPSSessionManager)sharedManager;
- (CPSAppInfoFetching)appInfoFetcher;
- (CPSBusinessItemFetching)businessItemFetcher;
- (CPSInstallationController)clipInstaller;
- (CPSLegacyAppInstalling)legacyInstaller;
- (CPSSessionManager)init;
- (NSArray)allSessions;
- (id)sessionWithURL:(id)a3 createIfNoExist:(BOOL)a4;
- (void)_handleMemoryPressure:(unint64_t)a3;
- (void)_localeChanged:(id)a3;
- (void)_setUpMemoryPressureHandler;
- (void)clearSessionWithURL:(id)a3;
- (void)getSessionWithURL:(id)a3 completion:(id)a4;
- (void)getSessionWithURL:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)handleManagedConfigurationChanged;
- (void)setLegacyInstaller:(id)a3;
@end

@implementation CPSSessionManager

+ (CPSSessionManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)sharedManager_manager;

  return (CPSSessionManager *)v2;
}

uint64_t __34__CPSSessionManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_alloc_init(CPSSessionManager);

  return MEMORY[0x270F9A758]();
}

- (CPSSessionManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)CPSSessionManager;
  v2 = [(CPSSessionManager *)&v17 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    sessions = v2->_sessions;
    v2->_sessions = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.ClipServices.clipserviced.CPSSessionManager", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_alloc_init(CPSBusinessItemFetcher);
    businessItemFetcher = v2->_businessItemFetcher;
    v2->_businessItemFetcher = (CPSBusinessItemFetching *)v8;

    v10 = objc_alloc_init(CPSAppInfoFetcher);
    appInfoFetcher = v2->_appInfoFetcher;
    v2->_appInfoFetcher = (CPSAppInfoFetching *)v10;

    v12 = [[CPSInstallationController alloc] initWithAppInfoFetcher:v2->_appInfoFetcher];
    clipInstaller = v2->_clipInstaller;
    v2->_clipInstaller = v12;

    [(CPSSessionManager *)v2 _setUpMemoryPressureHandler];
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v2 selector:sel__localeChanged_ name:*MEMORY[0x263EFF458] object:0];

    v15 = v2;
  }

  return v2;
}

- (void)_setUpMemoryPressureHandler
{
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83D8], 0, 2uLL, 0);
  memoryPressureSource = self->_memoryPressureSource;
  self->_memoryPressureSource = v3;

  objc_initWeak(&location, self);
  v5 = self->_memoryPressureSource;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__CPSSessionManager__setUpMemoryPressureHandler__block_invoke;
  v6[3] = &unk_26424EBF8;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler(v5, v6);
  dispatch_resume((dispatch_object_t)self->_memoryPressureSource);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__CPSSessionManager__setUpMemoryPressureHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uintptr_t data = dispatch_source_get_data(*((dispatch_source_t *)WeakRetained + 3));
    v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21559C000, v4, OS_LOG_TYPE_DEFAULT, "Received memory warning", buf, 2u);
    }
    v5 = v2[2];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __48__CPSSessionManager__setUpMemoryPressureHandler__block_invoke_9;
    v6[3] = &unk_26424EBD0;
    void v6[4] = v2;
    v6[5] = data;
    dispatch_async(v5, v6);
  }
}

uint64_t __48__CPSSessionManager__setUpMemoryPressureHandler__block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleMemoryPressure:*(void *)(a1 + 40)];
}

- (void)_handleMemoryPressure:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21559C000, v4, OS_LOG_TYPE_DEFAULT, "Handling memory pressure (warning) by purging cached sessions.", buf, 2u);
  }
  v5 = [(NSMutableDictionary *)self->_sessions allValues];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 isPurgeable])
        {
          sessions = self->_sessions;
          v12 = [v10 url];
          [(NSMutableDictionary *)sessions removeObjectForKey:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)handleManagedConfigurationChanged
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__CPSSessionManager_handleManagedConfigurationChanged__block_invoke;
  block[3] = &unk_26424E7B0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __54__CPSSessionManager_handleManagedConfigurationChanged__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "allValues", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v7 = [v6 metadata];
        uint64_t v8 = [v7 invocationPolicy];
        int v9 = [v8 isIneligibleDueToContentRestriction];

        if (v9)
        {
          v10 = [MEMORY[0x263EFF910] date];
          v11 = [v6 metadata];
          [v11 setExpirationDate:v10];
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

- (NSArray)allSessions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__CPSSessionManager_allSessions__block_invoke;
  v5[3] = &unk_26424EC20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __32__CPSSessionManager_allSessions__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) allValues];

  return MEMORY[0x270F9A758]();
}

- (id)sessionWithURL:(id)a3 createIfNoExist:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  uint64_t v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__CPSSessionManager_sessionWithURL_createIfNoExist___block_invoke;
  v11[3] = &unk_26424EC48;
  id v12 = v6;
  long long v13 = &v15;
  v11[4] = self;
  BOOL v14 = a4;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

void __52__CPSSessionManager_sessionWithURL_createIfNoExist___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) && *(unsigned char *)(a1 + 56))
  {
    v5 = [[CPSSession alloc] initWithURL:*(void *)(a1 + 40) usingQueue:*(void *)(*(void *)(a1 + 32) + 16)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setBusinessItemFetcher:*(void *)(*(void *)(a1 + 32) + 56)];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setAppInfoFetcher:*(void *)(*(void *)(a1 + 32) + 48)];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v10 = *(void **)(*(void *)(a1 + 32) + 8);
    [v10 setObject:v9 forKeyedSubscript:v8];
  }
}

- (void)clearSessionWithURL:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__CPSSessionManager_clearSessionWithURL___block_invoke;
  v7[3] = &unk_26424E7D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __41__CPSSessionManager_clearSessionWithURL___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 8);
    v5 = v2;
    id v6 = [v4 objectForKeyedSubscript:v3];
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138412547;
    v10 = v6;
    __int16 v11 = 2113;
    uint64_t v12 = v7;
    _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_DEFAULT, "Clearing session: %@ for URL: %{private}@", (uint8_t *)&v9, 0x16u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)getSessionWithURL:(id)a3 completion:(id)a4
{
}

- (void)getSessionWithURL:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__CPSSessionManager_getSessionWithURL_configuration_completion___block_invoke;
  v15[3] = &unk_26424E9F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __64__CPSSessionManager_getSessionWithURL_configuration_completion___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 metadata];
  int v4 = [v3 isExpired];

  if (v4)
  {
    v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412547;
      v35 = v2;
      __int16 v36 = 2117;
      v37 = v6;
      _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_DEFAULT, "Metadata associated with cached session: %@ for url: %{sensitive}@ is expired. Clearing and refetching metadata.", buf, 0x16u);
    }
    [v2 clearMetadataAndRefetch];
  }
  uint64_t v7 = *(void **)(a1 + 48);
  if (!v7) {
    goto LABEL_24;
  }
  if (v2 && ([v7 usedByPPT] & 1) == 0)
  {
    uint64_t v15 = [v2 configuration];
    if (v15)
    {
      id v16 = (void *)v15;
      if ([*(id *)(a1 + 48) useLocalContent])
      {

LABEL_23:
        uint64_t v28 = [*(id *)(a1 + 48) isForSwitcherOverlay];
        v29 = [v2 configuration];
        [v29 setIsForSwitcherOverlay:v28];

LABEL_24:
        uint64_t v30 = *(void *)(a1 + 56);
        id v9 = [v2 metadata];
        id v18 = [v9 clipBundleID];
        (*(void (**)(uint64_t, void *, void *))(v30 + 16))(v30, v2, v18);
        goto LABEL_25;
      }
      id v20 = [v2 configuration];
      v21 = [v20 sourceBundleID];
      v22 = [*(id *)(a1 + 48) sourceBundleID];
      if ([v21 isEqualToString:v22])
      {
        v23 = [v2 configuration];
        v24 = [v23 referrerBundleID];
        v25 = [*(id *)(a1 + 48) referrerBundleID];
        if ([v24 isEqualToString:v25])
        {
          v31 = [v2 configuration];
          v26 = [v31 launchReason];
          [*(id *)(a1 + 48) launchReason];
          v27 = v32 = v23;
          char v33 = [v26 isEqualToString:v27];

          if (v33) {
            goto LABEL_23;
          }
          goto LABEL_22;
        }
      }
    }
LABEL_22:
    [v2 setConfiguration:*(void *)(a1 + 48)];
    goto LABEL_23;
  }
  id v8 = [[CPSSession alloc] initWithURL:*(void *)(a1 + 40) usingQueue:*(void *)(*(void *)(a1 + 32) + 16) configuration:*(void *)(a1 + 48)];

  id v9 = +[CPSDeveloperOverride overrideForURL:*(void *)(a1 + 40)];
  if (v9)
  {
    id v10 = [[CPSClipMetadata alloc] initWithDeveloperOverride:v9 invocationURL:*(void *)(a1 + 40)];
    [(CPSSession *)v8 setPreloadedMetadata:v10];

    __int16 v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      id v13 = [(CPSSession *)v8 logID];
      id v14 = [v9 clipBundleID];
      *(_DWORD *)buf = 138412547;
      v35 = v13;
      __int16 v36 = 2113;
      v37 = v14;
      _os_log_impl(&dword_21559C000, v12, OS_LOG_TYPE_DEFAULT, "Use an overriden app clip experince for session: %@, bundleID: %{private}@", buf, 0x16u);
    }
  }
  else
  {
    [(CPSSession *)v8 setBusinessItemFetcher:*(void *)(*(void *)(a1 + 32) + 56)];
    [(CPSSession *)v8 setAppInfoFetcher:*(void *)(*(void *)(a1 + 32) + 48)];
  }
  [(CPSSession *)v8 setConfiguration:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v17 = *(void *)(a1 + 56);
  id v18 = [(CPSSession *)v8 metadata];
  uint64_t v19 = [v18 clipBundleID];
  (*(void (**)(uint64_t, CPSSession *, void *))(v17 + 16))(v17, v8, v19);

  uint64_t v2 = v8;
LABEL_25:
}

- (void)_localeChanged:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__CPSSessionManager__localeChanged___block_invoke;
  block[3] = &unk_26424E7B0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __36__CPSSessionManager__localeChanged___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = *(void **)(*(void *)(a1 + 32) + 48);
        id v9 = [v7 metadata];
        id v10 = [v9 clipBundleID];
        [v8 evictCachedMetadataForClipBundleID:v10];

        __int16 v11 = *(void **)(*(void *)(a1 + 32) + 8);
        id v12 = [v7 url];
        [v11 removeObjectForKey:v12];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

- (CPSInstallationController)clipInstaller
{
  return self->_clipInstaller;
}

- (CPSLegacyAppInstalling)legacyInstaller
{
  return self->_legacyInstaller;
}

- (void)setLegacyInstaller:(id)a3
{
}

- (CPSAppInfoFetching)appInfoFetcher
{
  return self->_appInfoFetcher;
}

- (CPSBusinessItemFetching)businessItemFetcher
{
  return self->_businessItemFetcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessItemFetcher, 0);
  objc_storeStrong((id *)&self->_appInfoFetcher, 0);
  objc_storeStrong((id *)&self->_legacyInstaller, 0);
  objc_storeStrong((id *)&self->_clipInstaller, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_sessions, 0);
}

@end