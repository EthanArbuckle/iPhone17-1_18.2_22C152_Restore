@interface HSBrowser
+ (id)homeSharingBrowserWithGroupID:(id)a3;
- (HSBrowser)initWithBrowserType:(int64_t)a3 groupID:(id)a4;
- (HSBrowserDelegate)delegate;
- (NSMutableArray)availableLibraries;
- (NSMutableArray)librariesPendingRemoval;
- (NSMutableArray)resolvingServices;
- (NSNetServiceBrowser)serviceBrowser;
- (NSString)homeSharingGroupID;
- (NSString)serviceType;
- (OS_dispatch_queue)serviceBrowserQueue;
- (int64_t)browserType;
- (void)_removalTimerFired:(id)a3;
- (void)netService:(id)a3 didNotResolve:(id)a4;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4;
- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceDidResolveAddress:(id)a3;
- (void)setAvailableLibraries:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLibrariesPendingRemoval:(id)a3;
- (void)setResolvingServices:(id)a3;
- (void)setServiceBrowser:(id)a3;
- (void)setServiceBrowserQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation HSBrowser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBrowser, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceBrowserQueue, 0);
  objc_storeStrong((id *)&self->_librariesPendingRemoval, 0);
  objc_storeStrong((id *)&self->_resolvingServices, 0);
  objc_storeStrong((id *)&self->_availableLibraries, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeSharingGroupID, 0);
}

- (void)setServiceBrowser:(id)a3
{
}

- (NSNetServiceBrowser)serviceBrowser
{
  return self->_serviceBrowser;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceBrowserQueue:(id)a3
{
}

- (OS_dispatch_queue)serviceBrowserQueue
{
  return self->_serviceBrowserQueue;
}

- (void)setLibrariesPendingRemoval:(id)a3
{
}

- (NSMutableArray)librariesPendingRemoval
{
  return self->_librariesPendingRemoval;
}

- (void)setResolvingServices:(id)a3
{
}

- (NSMutableArray)resolvingServices
{
  return self->_resolvingServices;
}

- (void)setAvailableLibraries:(id)a3
{
}

- (NSMutableArray)availableLibraries
{
  return self->_availableLibraries;
}

- (void)setDelegate:(id)a3
{
}

- (HSBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HSBrowserDelegate *)WeakRetained;
}

- (NSString)homeSharingGroupID
{
  return self->_homeSharingGroupID;
}

- (int64_t)browserType
{
  return self->_browserType;
}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = [(HSBrowser *)self serviceBrowser];
    v10 = [v6 name];
    v11 = [v7 objectForKeyedSubscript:*MEMORY[0x263F08400]];
    int v14 = 134218498;
    v15 = v9;
    __int16 v16 = 2114;
    v17 = v10;
    __int16 v18 = 2048;
    uint64_t v19 = [v11 longLongValue];
    _os_log_impl(&dword_2152C7000, v8, OS_LOG_TYPE_ERROR, "Service browser: %p failed to resolve service '%{public}@' with error code: %lld", (uint8_t *)&v14, 0x20u);
  }
  v12 = [(HSBrowser *)self resolvingServices];
  [v12 removeObject:v6];

  v13 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [v6 removeFromRunLoop:v13 forMode:*MEMORY[0x263EFF588]];
}

- (void)netServiceDidResolveAddress:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HSBrowser *)self resolvingServices];
  [v5 removeObject:v4];

  id v6 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [v4 removeFromRunLoop:v6 forMode:*MEMORY[0x263EFF588]];

  id v7 = [v4 name];
  v8 = (objc_class *)MEMORY[0x263F08BA0];
  id v9 = v4;
  id v10 = objc_alloc_init(v8);
  [v10 setScheme:@"http"];
  v11 = [v9 hostName];
  [v10 setHost:v11];

  v12 = NSNumber;
  uint64_t v13 = [v9 port];

  int v14 = [v12 numberWithInteger:v13];
  [v10 setPort:v14];

  v15 = [v10 URL];

  __int16 v16 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = [(HSBrowser *)self serviceBrowser];
    *(_DWORD *)buf = 134218498;
    id v59 = v17;
    __int16 v60 = 2114;
    v61 = v7;
    __int16 v62 = 2112;
    v63 = v15;
    _os_log_impl(&dword_2152C7000, v16, OS_LOG_TYPE_INFO, "Service browser: %p resolved service '%{public}@' base URL: %@", buf, 0x20u);
  }
  if (v15)
  {
    __int16 v18 = (void *)MEMORY[0x263F089E8];
    uint64_t v19 = [v9 TXTRecordData];
    uint64_t v20 = [v18 dictionaryFromTXTRecordData:v19];

    if (![(HSBrowser *)self browserType])
    {
      id v53 = v7;
      id v52 = v15;
      id v21 = v20;
      id v22 = [NSString alloc];
      v23 = [v21 objectForKey:@"iTSh Version"];
      v24 = (void *)[v22 initWithData:v23 encoding:4];

      int v25 = [v24 intValue];
      v26 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v59) = v25;
        _os_log_impl(&dword_2152C7000, v26, OS_LOG_TYPE_INFO, "iTunes sharing version: %i", buf, 8u);
      }

      v51 = v21;
      if (v25 <= 196611)
      {
        v38 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
        v40 = v52;
        v39 = v53;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v59 = v53;
          _os_log_impl(&dword_2152C7000, v38, OS_LOG_TYPE_ERROR, "Service: %{public}@ has unsupported version", buf, 0xCu);
        }
        v41 = 0;
      }
      else
      {
        v49 = v24;
        v50 = v20;
        id v27 = [NSString alloc];
        v28 = [v21 objectForKey:@"Database ID"];
        uint64_t v29 = [v27 initWithData:v28 encoding:4];

        id v30 = [NSString alloc];
        v31 = [v21 objectForKey:@"Machine ID"];
        uint64_t v32 = [v30 initWithData:v31 encoding:4];

        id v33 = [NSString alloc];
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        v46 = objc_msgSend(v33, "initWithFormat:", @"%.0f", v34);
        v47 = (void *)v32;
        v48 = v29;
        v35 = (void *)[[NSString alloc] initWithFormat:@"%@-%@-%@", v29, v32, v46];
        v36 = [v21 objectForKey:@"hG"];
        if ([v36 length]) {
          v37 = (void *)[[NSString alloc] initWithData:v36 encoding:4];
        }
        else {
          v37 = 0;
        }
        v40 = v52;
        v39 = v53;
        v41 = [[HSHomeSharingLibrary alloc] initWithName:v53 uniqueIdentifier:v35 version:196624 baseURL:v52 homeSharingGroupID:v37 connectionType:0];

        v24 = v49;
        uint64_t v20 = v50;
        v38 = v48;
      }

      if (v41)
      {
        [(HSHomeSharingLibrary *)v41 setService:v9];
        v42 = [(HSBrowser *)self availableLibraries];
        [v42 addObject:v41];

        v43 = [(HSBrowser *)self librariesPendingRemoval];
        [v43 removeObject:v41];

        v44 = [(HSBrowser *)self delegate];
        if (objc_opt_respondsToSelector())
        {
          v45 = dispatch_get_global_queue(0, 0);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __41__HSBrowser_netServiceDidResolveAddress___block_invoke;
          block[3] = &unk_264239E90;
          id v55 = v44;
          v56 = self;
          v57 = v41;
          dispatch_async(v45, block);
        }
      }
    }
  }
}

uint64_t __41__HSBrowser_netServiceDidResolveAddress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) browser:*(void *)(a1 + 40) didAddLibrary:*(void *)(a1 + 48)];
}

- (void)_removalTimerFired:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = [(HSBrowser *)self librariesPendingRemoval];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = [(HSBrowser *)self librariesPendingRemoval];
    [v7 removeObject:v4];

    v8 = [(HSBrowser *)self availableLibraries];
    [v8 removeObject:v4];

    id v9 = [(HSBrowser *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v10 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __32__HSBrowser__removalTimerFired___block_invoke;
      block[3] = &unk_264239E90;
      id v12 = v9;
      uint64_t v13 = self;
      id v14 = v4;
      dispatch_async(v10, block);
    }
  }
}

uint64_t __32__HSBrowser__removalTimerFired___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) browser:*(void *)(a1 + 40) didRemoveLibrary:*(void *)(a1 + 48)];
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 name];
    *(_DWORD *)buf = 134218242;
    id v31 = v7;
    __int16 v32 = 2114;
    id v33 = v10;
    _os_log_impl(&dword_2152C7000, v9, OS_LOG_TYPE_DEFAULT, "Service browser: %p removed service with name: '%{public}@'", buf, 0x16u);
  }
  v23 = v7;

  v11 = [MEMORY[0x263EFF9F0] mainRunLoop];
  uint64_t v24 = *MEMORY[0x263EFF588];
  objc_msgSend(v8, "removeFromRunLoop:forMode:", v11);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = (void *)[(NSMutableArray *)self->_availableLibraries copy];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        __int16 v18 = objc_msgSend(v17, "service", v23);
        int v19 = [v18 isEqual:v8];

        if (v19)
        {
          uint64_t v20 = [(HSBrowser *)self librariesPendingRemoval];
          [v20 addObject:v17];

          id v21 = [MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel__removalTimerFired_ selector:v17 userInfo:0 repeats:2.0];
          id v22 = [MEMORY[0x263EFF9F0] mainRunLoop];
          [v22 addTimer:v21 forMode:v24];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 name];
    int v13 = 134218242;
    id v14 = v7;
    __int16 v15 = 2114;
    __int16 v16 = v10;
    _os_log_impl(&dword_2152C7000, v9, OS_LOG_TYPE_DEFAULT, "Service browser: %p found service with name: '%{public}@'", (uint8_t *)&v13, 0x16u);
  }
  v11 = [(HSBrowser *)self resolvingServices];
  [v11 addObject:v8];

  [v8 setDelegate:self];
  id v12 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [v8 scheduleInRunLoop:v12 forMode:*MEMORY[0x263EFF588]];

  [v8 resolveWithTimeout:10.0];
}

- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F08400]];
    int v9 = 134218240;
    id v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = [v8 longLongValue];
    _os_log_impl(&dword_2152C7000, v7, OS_LOG_TYPE_ERROR, "Service browser: %p failed to search with error code: %lld", (uint8_t *)&v9, 0x16u);
  }
}

- (void)stop
{
  v3 = [(HSBrowser *)self serviceBrowserQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __17__HSBrowser_stop__block_invoke;
  block[3] = &unk_26423A410;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __17__HSBrowser_stop__block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) serviceBrowser];

  v3 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) serviceBrowser];
      id v6 = [*(id *)(a1 + 32) serviceType];
      *(_DWORD *)buf = 134218242;
      v37 = v5;
      __int16 v38 = 2114;
      v39 = v6;
      _os_log_impl(&dword_2152C7000, v4, OS_LOG_TYPE_DEFAULT, "Service browser: %p stopping search for services of type: %{public}@", buf, 0x16u);
    }
    id v7 = [*(id *)(a1 + 32) serviceBrowser];
    [v7 stop];

    id v8 = [*(id *)(a1 + 32) serviceBrowser];
    int v9 = [MEMORY[0x263EFF9F0] mainRunLoop];
    uint64_t v10 = *MEMORY[0x263EFF588];
    [v8 removeFromRunLoop:v9 forMode:*MEMORY[0x263EFF588]];

    [*(id *)(a1 + 32) setServiceBrowser:0];
    __int16 v11 = [*(id *)(a1 + 32) availableLibraries];
    uint64_t v12 = (void *)[v11 copy];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v4 = v12;
    uint64_t v13 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v32;
      long long v25 = v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v4);
          }
          uint64_t v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          __int16 v18 = objc_msgSend(*(id *)(a1 + 32), "delegate", v25);
          if (objc_opt_respondsToSelector())
          {
            int v19 = dispatch_get_global_queue(0, 0);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            v27[0] = __17__HSBrowser_stop__block_invoke_14;
            v27[1] = &unk_264239E90;
            id v20 = v18;
            uint64_t v21 = *(void *)(a1 + 32);
            id v28 = v20;
            uint64_t v29 = v21;
            id v30 = v17;
            dispatch_async(v19, block);
          }
          id v22 = [v17 service];
          v23 = [MEMORY[0x263EFF9F0] mainRunLoop];
          [v22 removeFromRunLoop:v23 forMode:v10];
        }
        uint64_t v14 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v14);
    }

    uint64_t v24 = [*(id *)(a1 + 32) availableLibraries];
    [v24 removeAllObjects];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2152C7000, v4, OS_LOG_TYPE_DEBUG, "Service browser is not searching, stopping has no effect.", buf, 2u);
  }
}

uint64_t __17__HSBrowser_stop__block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) browser:*(void *)(a1 + 40) didRemoveLibrary:*(void *)(a1 + 48)];
}

- (void)start
{
  v3 = [(HSBrowser *)self serviceBrowserQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  void block[2] = __18__HSBrowser_start__block_invoke;
  block[3] = &unk_26423A410;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __18__HSBrowser_start__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) serviceBrowser];

  if (v2)
  {
    v3 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_2152C7000, v3, OS_LOG_TYPE_DEBUG, "Service browser is already active, starting again has no effect.", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x263F089F0]);
    [*(id *)(a1 + 32) setServiceBrowser:v4];

    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 serviceBrowser];
    [v6 setDelegate:v5];

    id v7 = [*(id *)(a1 + 32) serviceBrowser];
    id v8 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v7 scheduleInRunLoop:v8 forMode:*MEMORY[0x263EFF588]];

    int v9 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 32) serviceBrowser];
      __int16 v11 = [*(id *)(a1 + 32) serviceType];
      int v13 = 134218242;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      __int16 v16 = v11;
      _os_log_impl(&dword_2152C7000, v9, OS_LOG_TYPE_DEFAULT, "Service browser: %p starting search for services of type: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    v3 = [*(id *)(a1 + 32) serviceBrowser];
    uint64_t v12 = [*(id *)(a1 + 32) serviceType];
    [v3 searchForServicesOfType:v12 inDomain:@"local."];
  }
}

- (HSBrowser)initWithBrowserType:(int64_t)a3 groupID:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (!a3 && ![v7 length])
  {
    id v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"HSBrowser.m" lineNumber:36 description:@"Home Sharing group ID is required for browser type HSBrowserTypeHomeSharing."];
  }
  v23.receiver = self;
  v23.super_class = (Class)HSBrowser;
  int v9 = [(HSBrowser *)&v23 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_browserType = a3;
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    availableLibraries = v10->_availableLibraries;
    v10->_availableLibraries = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x263EFF980] array];
    resolvingServices = v10->_resolvingServices;
    v10->_resolvingServices = (NSMutableArray *)v13;

    uint64_t v15 = [MEMORY[0x263EFF980] array];
    librariesPendingRemoval = v10->_librariesPendingRemoval;
    v10->_librariesPendingRemoval = (NSMutableArray *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.HomeSharing.HSBrowser.serviceBrowserQueue", 0);
    serviceBrowserQueue = v10->_serviceBrowserQueue;
    v10->_serviceBrowserQueue = (OS_dispatch_queue *)v17;

    if (a3)
    {
      int v19 = @"_daap._tcp";
    }
    else
    {
      int v19 = [NSString stringWithFormat:@"_home-sharing._tcp,_%@", v8];
    }
    serviceType = v10->_serviceType;
    v10->_serviceType = &v19->isa;
  }
  return v10;
}

+ (id)homeSharingBrowserWithGroupID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBrowserType:0 groupID:v3];

  return v4;
}

@end