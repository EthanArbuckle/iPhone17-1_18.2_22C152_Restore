@interface MGRemoteQueryClientManager
- (BOOL)_targetValidate:(id)a3;
- (BOOL)invalidated;
- (MGGroupsQueryAgent)queryAgent;
- (MGInternalQueryRunner)queryRunner;
- (MGOutstandingQuery)query;
- (MGRemoteQueryClientBrowser)browser;
- (MGRemoteQueryClientManager)initWithQueryRunner:(id)a3 groupsQueryAgent:(id)a4;
- (MGRemoteQueryClientManagerForwarder)forwarder;
- (NSArray)clients;
- (NSArray)homeHashes;
- (NSDictionary)queries;
- (NSDictionary)watchdogs;
- (NSSet)targets;
- (NSString)description;
- (NSURLSession)session;
- (OS_dispatch_queue)dispatchQueue;
- (id)_clientForTarget:(id)a3 withQuery:(id)a4;
- (id)_clientForTask:(id)a3 includeOthers:(BOOL)a4;
- (id)_clientsForTarget:(id)a3;
- (id)_clientsWithQuery:(id)a3;
- (id)_watchdogForTarget:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_browserStart;
- (void)_browserStop;
- (void)_browserUpdateState;
- (void)_clientRemove:(id)a3;
- (void)_clientStartWithQuery:(id)a3 target:(id)a4;
- (void)_clientStop:(id)a3;
- (void)_invalidate;
- (void)_prepareURLSession;
- (void)_queryAdd:(id)a3;
- (void)_queryRemove:(id)a3;
- (void)_setupQuery;
- (void)_targetAdd:(id)a3;
- (void)_targetRemove:(id)a3;
- (void)_watchdogAdd:(id)a3;
- (void)_watchdogFired:(id)a3;
- (void)_watchdogRemove:(id)a3;
- (void)_watchdogReset:(id)a3;
- (void)addOutstandingQuery:(id)a3;
- (void)browser:(id)a3 foundTarget:(id)a4;
- (void)browser:(id)a3 invalidatedWithError:(id)a4;
- (void)browser:(id)a3 lostTarget:(id)a4;
- (void)clientInvalidated:(id)a3 withError:(id)a4;
- (void)dealloc;
- (void)removeOutstandingQuery:(id)a3;
- (void)setBrowser:(id)a3;
- (void)setClients:(id)a3;
- (void)setHomeHashes:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setQueries:(id)a3;
- (void)setQuery:(id)a3;
- (void)setTargets:(id)a3;
- (void)setWatchdogs:(id)a3;
- (void)watchdogFired:(id)a3;
@end

@implementation MGRemoteQueryClientManager

- (MGRemoteQueryClientManager)initWithQueryRunner:(id)a3 groupsQueryAgent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)MGRemoteQueryClientManager;
  v8 = [(MGRemoteQueryClientManager *)&v28 init];
  v9 = v8;
  if (v8)
  {
    v8->_invalidated = 0;
    objc_storeWeak((id *)&v8->_queryRunner, v6);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.MediaGroups.RemoteQuery.Client", v10);
    dispatchQueue = v9->_dispatchQueue;
    v9->_dispatchQueue = (OS_dispatch_queue *)v11;

    objc_storeWeak((id *)&v9->_queryAgent, v7);
    browser = v9->_browser;
    v9->_browser = 0;

    uint64_t v14 = [MEMORY[0x263EFFA08] set];
    targets = v9->_targets;
    v9->_targets = (NSSet *)v14;

    uint64_t v16 = [NSDictionary dictionary];
    queries = v9->_queries;
    v9->_queries = (NSDictionary *)v16;

    v18 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    homeHashes = v9->_homeHashes;
    v9->_homeHashes = v18;

    uint64_t v20 = [MEMORY[0x263EFF8C0] array];
    clients = v9->_clients;
    v9->_clients = (NSArray *)v20;

    uint64_t v22 = [NSDictionary dictionary];
    watchdogs = v9->_watchdogs;
    v9->_watchdogs = (NSDictionary *)v22;

    v24 = [(MGRemoteQueryClientManager *)v9 dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__MGRemoteQueryClientManager_initWithQueryRunner_groupsQueryAgent___block_invoke;
    block[3] = &unk_26485E378;
    v27 = v9;
    dispatch_async(v24, block);
  }
  return v9;
}

uint64_t __67__MGRemoteQueryClientManager_initWithQueryRunner_groupsQueryAgent___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupQuery];
  [*(id *)(a1 + 32) _prepareURLSession];
  v2 = *(void **)(a1 + 32);
  return [v2 _browserUpdateState];
}

- (void)dealloc
{
  [(MGRemoteQueryClientManager *)self _invalidate];
  v3 = [(MGRemoteQueryClientManager *)self query];
  if (v3)
  {
    v4 = [(MGRemoteQueryClientManager *)self queryRunner];
    [v4 stopOutstandingQuery:v3];
  }
  v5.receiver = self;
  v5.super_class = (Class)MGRemoteQueryClientManager;
  [(MGRemoteQueryClientManager *)&v5 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  id v6 = [(MGRemoteQueryClientManager *)self clients];
  id v7 = [(MGRemoteQueryClientManager *)self queries];
  v8 = [(MGRemoteQueryClientManager *)self targets];
  v9 = [(MGRemoteQueryClientManager *)self session];
  v10 = [(MGRemoteQueryClientManager *)self browser];
  dispatch_queue_t v11 = [v3 stringWithFormat:@"<%@: %p, _clients = %lu, _queries = %lu, _targets = %lu, _session = %@, _browser = %@>", v5, self, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (void)addOutstandingQuery:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__MGRemoteQueryClientManager_addOutstandingQuery___block_invoke;
  v7[3] = &unk_26485E468;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__MGRemoteQueryClientManager_addOutstandingQuery___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryAdd:*(void *)(a1 + 40)];
}

- (void)removeOutstandingQuery:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__MGRemoteQueryClientManager_removeOutstandingQuery___block_invoke;
  v7[3] = &unk_26485E468;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__MGRemoteQueryClientManager_removeOutstandingQuery___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryRemove:*(void *)(a1 + 40)];
}

- (void)_prepareURLSession
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MGRemoteQueryClientManager *)self session];

  if (v4)
  {
    objc_super v5 = MGLogForCategory(6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v17 = self;
      id v6 = "%p session already prepared";
LABEL_7:
      _os_log_error_impl(&dword_229257000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([(MGRemoteQueryClientManager *)self invalidated])
  {
    objc_super v5 = MGLogForCategory(6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v17 = self;
      id v6 = "%p invalidated, not preparing session";
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  id v15 = [MEMORY[0x263EFC648] ephemeralSessionConfiguration];
  [v15 setNetworkServiceType:6];
  [v15 setAllowsCellularAccess:0];
  [v15 setTimeoutIntervalForRequest:0.0];
  [v15 setTimeoutIntervalForResource:0.0];
  [v15 setWaitsForConnectivity:0];
  [v15 setRequestCachePolicy:4];
  [v15 setURLCache:0];
  [v15 setHTTPCookieAcceptPolicy:1];
  [v15 setHTTPShouldSetCookies:0];
  [v15 setHTTPCookieStorage:0];
  objc_msgSend(v15, "set_reportsDataStalls:", 0);
  id v7 = objc_alloc_init(MEMORY[0x263F08A48]);
  id v8 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  [v7 setUnderlyingQueue:v8];

  v9 = [[MGRemoteQueryClientManagerForwarder alloc] initWithClientManager:self];
  forwarder = self->_forwarder;
  self->_forwarder = v9;

  dispatch_queue_t v11 = (void *)MEMORY[0x263EFC640];
  v12 = [(MGRemoteQueryClientManager *)self forwarder];
  v13 = [v11 sessionWithConfiguration:v15 delegate:v12 delegateQueue:v7];

  session = self->_session;
  self->_session = v13;
}

- (void)_invalidate
{
  id v2 = [(MGRemoteQueryClientManager *)self session];
  [v2 invalidateAndCancel];
}

- (void)_setupQuery
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MGRemoteQueryClientManager *)self query];

  if (v4)
  {
    objc_super v5 = MGLogForCategory(6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [(MGRemoteQueryClientManager *)self query];
      id v7 = [v6 identifier];
      *(_DWORD *)buf = 134218242;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v7;
      _os_log_error_impl(&dword_229257000, v5, OS_LOG_TYPE_ERROR, "%p client monitoring query already running %@", buf, 0x16u);
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x263F08730];
    v9 = objc_msgSend(MEMORY[0x263F546D0], "rq_predicateForLocal");
    v17[0] = v9;
    v10 = [MEMORY[0x263F546F8] predicateForType];
    v17[1] = v10;
    dispatch_queue_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    objc_super v5 = [v8 andPredicateWithSubpredicates:v11];

    objc_initWeak((id *)buf, self);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __41__MGRemoteQueryClientManager__setupQuery__block_invoke;
    v15[3] = &unk_26485E648;
    objc_copyWeak(&v16, (id *)buf);
    v12 = (void *)MEMORY[0x22A6B39E0](v15);
    v13 = [(MGRemoteQueryClientManager *)self queryRunner];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __41__MGRemoteQueryClientManager__setupQuery__block_invoke_16;
    v14[3] = &unk_26485E6C0;
    v14[4] = self;
    [v13 startOutstandingQueryWithPredicate:v5 handler:v12 completion:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

void __41__MGRemoteQueryClientManager__setupQuery__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained dispatchQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__MGRemoteQueryClientManager__setupQuery__block_invoke_2;
    v7[3] = &unk_26485E468;
    id v8 = v3;
    v9 = v5;
    dispatch_async(v6, v7);
  }
}

void __41__MGRemoteQueryClientManager__setupQuery__block_invoke_2(uint64_t a1)
{
  data[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  id v3 = MGLogForCategory(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    buf.A = 134218240;
    *(void *)&buf.B = v4;
    LOWORD(buf.D) = 2048;
    *(void *)((char *)&buf.D + 2) = v2;
    _os_log_impl(&dword_229257000, v3, OS_LOG_TYPE_DEFAULT, "%p client monitoring query received %lu groups", (uint8_t *)&buf, 0x16u);
  }

  id v5 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) identifier];
        dispatch_queue_t v11 = MGHomeIdentifierForGroupIdentifier(v10);

        if (v11)
        {
          data[0] = 0;
          data[1] = 0;
          [v11 getUUIDBytes:data];
          memset(&buf, 0, sizeof(buf));
          CC_MD5_Init(&buf);
          CC_MD5_Update(&buf, data, 0x10u);
          CC_MD5_Final(md, &buf);
          id v12 = objc_alloc_init(NSString);
          for (uint64_t j = 0; j != 16; ++j)
          {
            uint64_t v14 = v12;
            objc_msgSend(v12, "stringByAppendingFormat:", @"%hhX", md[j]);
            id v12 = (id)objc_claimAutoreleasedReturnValue();
          }
          uint64_t v15 = [v5 arrayByAddingObject:v12];

          id v5 = (id)v15;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 40) setHomeHashes:v5];
}

void __41__MGRemoteQueryClientManager__setupQuery__block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) dispatchQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__MGRemoteQueryClientManager__setupQuery__block_invoke_2_17;
  v6[3] = &unk_26485E468;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __41__MGRemoteQueryClientManager__setupQuery__block_invoke_2_17(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = MGLogForCategory(6);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) identifier];
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_229257000, v2, OS_LOG_TYPE_DEFAULT, "%p client monitoring using query %@", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 32) setQuery:*(void *)(a1 + 40)];
}

- (void)_browserUpdateState
{
  uint64_t v3 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(MGRemoteQueryClientManager *)self browser];

  id v5 = [(MGRemoteQueryClientManager *)self queries];
  uint64_t v6 = [v5 count];

  if (v4 || !v6)
  {
    if (v4 && !v6)
    {
      [(MGRemoteQueryClientManager *)self _browserStop];
    }
  }
  else
  {
    [(MGRemoteQueryClientManager *)self _browserStart];
  }
}

- (void)_browserStart
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(MGRemoteQueryClientManager *)self browser];

  if (v4)
  {
    id v5 = MGLogForCategory(6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [(MGRemoteQueryClientManager *)self browser];
      int v10 = 134218240;
      dispatch_queue_t v11 = self;
      __int16 v12 = 2048;
      v13 = v6;
      _os_log_error_impl(&dword_229257000, v5, OS_LOG_TYPE_ERROR, "%p browser already started, running %p", (uint8_t *)&v10, 0x16u);
LABEL_6:
    }
  }
  else
  {
    uint64_t v7 = [MGRemoteQueryClientBrowser alloc];
    __int16 v8 = [(MGRemoteQueryClientManager *)self dispatchQueue];
    v9 = [(MGRemoteQueryClientBrowser *)v7 initWithDelegate:self dispatchQueue:v8];
    [(MGRemoteQueryClientManager *)self setBrowser:v9];

    id v5 = MGLogForCategory(6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(MGRemoteQueryClientManager *)self browser];
      int v10 = 134218240;
      dispatch_queue_t v11 = self;
      __int16 v12 = 2048;
      v13 = v6;
      _os_log_impl(&dword_229257000, v5, OS_LOG_TYPE_DEFAULT, "%p started browser %p", (uint8_t *)&v10, 0x16u);
      goto LABEL_6;
    }
  }
}

- (void)_browserStop
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(MGRemoteQueryClientManager *)self browser];
  id v5 = MGLogForCategory(6);
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134218240;
      __int16 v8 = self;
      __int16 v9 = 2048;
      int v10 = v4;
      _os_log_impl(&dword_229257000, v6, OS_LOG_TYPE_DEFAULT, "%p stopping browser %p", (uint8_t *)&v7, 0x16u);
    }

    [(MGRemoteQueryClientManager *)self setBrowser:0];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134217984;
      __int16 v8 = self;
      _os_log_error_impl(&dword_229257000, v6, OS_LOG_TYPE_ERROR, "%p browser already stopped", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_targetAdd:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(MGRemoteQueryClientManager *)self targets];
  if ([v6 containsObject:v4])
  {
    int v7 = MGLogForCategory(6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CC_MD5_CTX buf = 134218242;
      v25 = self;
      __int16 v26 = 2112;
      uint64_t v27 = (uint64_t)v4;
      __int16 v8 = "%p already tracking target %@";
LABEL_21:
      _os_log_error_impl(&dword_229257000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0x16u);
    }
  }
  else if ([(MGRemoteQueryClientManager *)self _targetValidate:v4])
  {
    __int16 v9 = [v6 setByAddingObject:v4];

    [(MGRemoteQueryClientManager *)self setTargets:v9];
    int v10 = MGLogForCategory(6);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CC_MD5_CTX buf = 134218498;
      v25 = self;
      __int16 v26 = 2048;
      uint64_t v27 = [v9 count];
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl(&dword_229257000, v10, OS_LOG_TYPE_DEFAULT, "%p now %lu targets after adding %@", buf, 0x20u);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = [(MGRemoteQueryClientManager *)self queries];
    int v7 = [v11 allValues];

    uint64_t v12 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v20;
      do
      {
        uint64_t v16 = 0;
        long long v17 = v14;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v7);
          }
          uint64_t v18 = *(void *)(*((void *)&v19 + 1) + 8 * v16);
          uint64_t v14 = [(MGRemoteQueryClientManager *)self _clientForTarget:v4 withQuery:v18];

          if (!v14) {
            [(MGRemoteQueryClientManager *)self _clientStartWithQuery:v18 target:v4];
          }
          ++v16;
          long long v17 = v14;
        }
        while (v13 != v16);
        uint64_t v13 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
    uint64_t v6 = v9;
  }
  else
  {
    int v7 = MGLogForCategory(6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CC_MD5_CTX buf = 134218242;
      v25 = self;
      __int16 v26 = 2112;
      uint64_t v27 = (uint64_t)v4;
      __int16 v8 = "%p ignoring invalid target %@";
      goto LABEL_21;
    }
  }
}

- (void)_targetRemove:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(MGRemoteQueryClientManager *)self targets];
  if ([v6 containsObject:v4])
  {
    int v7 = [v6 mutableCopy];
    [v7 removeObject:v4];
    [(MGRemoteQueryClientManager *)self setTargets:v7];
    __int16 v8 = MGLogForCategory(6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218498;
      int v10 = self;
      __int16 v11 = 2048;
      uint64_t v12 = [v7 count];
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_229257000, v8, OS_LOG_TYPE_DEFAULT, "%p now %lu targets after removing %@", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    int v7 = MGLogForCategory(6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 134218242;
      int v10 = self;
      __int16 v11 = 2112;
      uint64_t v12 = (uint64_t)v4;
      _os_log_debug_impl(&dword_229257000, v7, OS_LOG_TYPE_DEBUG, "%p not tracking target %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (BOOL)_targetValidate:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 homeHash];
  if (v6)
  {
    int v7 = [(MGRemoteQueryClientManager *)self homeHashes];
    int v8 = [v7 containsObject:v6];

    if (v8)
    {
      int v9 = MGLogForCategory(6);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CC_MD5_CTX buf = 134218242;
        v25 = self;
        __int16 v26 = 2112;
        id v27 = v4;
        _os_log_impl(&dword_229257000, v9, OS_LOG_TYPE_DEFAULT, "%p same source target %@", buf, 0x16u);
      }
LABEL_18:
      BOOL v10 = 0;
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      int v9 = [(MGRemoteQueryClientManager *)self targets];
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v9);
            }
            uint64_t v15 = [*(id *)(*((void *)&v19 + 1) + 8 * i) homeHash];
            int v16 = [v15 isEqual:v6];

            if (v16)
            {
              long long v17 = MGLogForCategory(6);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)CC_MD5_CTX buf = 134218242;
                v25 = self;
                __int16 v26 = 2112;
                id v27 = v4;
                _os_log_impl(&dword_229257000, v17, OS_LOG_TYPE_DEFAULT, "%p duplicate target %@", buf, 0x16u);
              }

              goto LABEL_18;
            }
          }
          uint64_t v12 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          BOOL v10 = 1;
          if (v12) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v10 = 1;
      }
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)browser:(id)a3 foundTarget:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__MGRemoteQueryClientManager_browser_foundTarget___block_invoke;
  block[3] = &unk_26485E5F8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __50__MGRemoteQueryClientManager_browser_foundTarget___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) browser];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    [v4 _targetAdd:v5];
  }
}

- (void)browser:(id)a3 lostTarget:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__MGRemoteQueryClientManager_browser_lostTarget___block_invoke;
  block[3] = &unk_26485E5F8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __49__MGRemoteQueryClientManager_browser_lostTarget___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) browser];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    [v4 _targetRemove:v5];
  }
}

- (void)browser:(id)a3 invalidatedWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__MGRemoteQueryClientManager_browser_invalidatedWithError___block_invoke;
  block[3] = &unk_26485E5F8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __59__MGRemoteQueryClientManager_browser_invalidatedWithError___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) browser];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = MGLogForCategory(6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)CC_MD5_CTX buf = 134218498;
      uint64_t v21 = v5;
      __int16 v22 = 2048;
      uint64_t v23 = v6;
      __int16 v24 = 2112;
      uint64_t v25 = v7;
      _os_log_impl(&dword_229257000, v4, OS_LOG_TYPE_DEFAULT, "%p browser %p stopped, error %@", buf, 0x20u);
    }

    [*(id *)(a1 + 32) setBrowser:0];
    int v8 = [*(id *)(a1 + 32) targets];
    id v9 = (void *)[v8 copy];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(a1 + 32), "_targetRemove:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- (void)_queryAdd:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 identifier];
  uint64_t v7 = [(MGRemoteQueryClientManager *)self queries];
  int v8 = [v7 objectForKey:v6];

  if (v8)
  {
    id v9 = MGLogForCategory(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CC_MD5_CTX buf = 134218242;
      v32 = self;
      __int16 v33 = 2112;
      uint64_t v34 = (uint64_t)v6;
      _os_log_error_impl(&dword_229257000, v9, OS_LOG_TYPE_ERROR, "%p already tracking query %@", buf, 0x16u);
    }
    goto LABEL_4;
  }
  id v10 = [v4 predicate];
  int v11 = objc_msgSend(v10, "rq_restrictedToLocal");

  if (v11)
  {
    id v9 = MGLogForCategory(6);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)CC_MD5_CTX buf = 134218242;
    v32 = self;
    __int16 v33 = 2112;
    uint64_t v34 = (uint64_t)v6;
    uint64_t v12 = "%p query %@ ineligible by locality";
LABEL_11:
    _os_log_impl(&dword_229257000, v9, OS_LOG_TYPE_DEFAULT, v12, buf, 0x16u);
    goto LABEL_4;
  }
  uint64_t v13 = [v4 predicate];
  int v14 = objc_msgSend(v13, "mg_containsCurrentDevice");

  if (v14)
  {
    id v9 = MGLogForCategory(6);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)CC_MD5_CTX buf = 134218242;
    v32 = self;
    __int16 v33 = 2112;
    uint64_t v34 = (uint64_t)v6;
    uint64_t v12 = "%p query %@ ineligible by context";
    goto LABEL_11;
  }
  id v9 = [v7 mutableCopy];
  [v9 setObject:v4 forKey:v6];
  [(MGRemoteQueryClientManager *)self setQueries:v9];
  long long v15 = MGLogForCategory(6);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CC_MD5_CTX buf = 134218498;
    v32 = self;
    __int16 v33 = 2048;
    uint64_t v34 = [v9 count];
    __int16 v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_229257000, v15, OS_LOG_TYPE_DEFAULT, "%p now %lu queries after adding %@", buf, 0x20u);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v16 = [(MGRemoteQueryClientManager *)self targets];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    __int16 v24 = v7;
    uint64_t v25 = v6;
    long long v19 = 0;
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v21 = 0;
      __int16 v22 = v19;
      do
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8 * v21);
        long long v19 = -[MGRemoteQueryClientManager _clientForTarget:withQuery:](self, "_clientForTarget:withQuery:", v23, v4, v24, v25);

        if (!v19) {
          [(MGRemoteQueryClientManager *)self _clientStartWithQuery:v4 target:v23];
        }
        ++v21;
        __int16 v22 = v19;
      }
      while (v18 != v21);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v18);

    uint64_t v7 = v24;
    uint64_t v6 = v25;
  }

  [(MGRemoteQueryClientManager *)self _browserUpdateState];
LABEL_4:
}

- (void)_queryRemove:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 identifier];
  uint64_t v7 = [(MGRemoteQueryClientManager *)self queries];
  int v8 = [v7 objectForKey:v6];

  if (v8)
  {
    id v9 = [v7 mutableCopy];
    [v9 removeObjectForKey:v6];
    [(MGRemoteQueryClientManager *)self setQueries:v9];
    id v10 = MGLogForCategory(6);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CC_MD5_CTX buf = 134218498;
      __int16 v22 = self;
      __int16 v23 = 2048;
      uint64_t v24 = [v9 count];
      __int16 v25 = 2112;
      long long v26 = v6;
      _os_log_impl(&dword_229257000, v10, OS_LOG_TYPE_DEFAULT, "%p now %lu queries after removing %@", buf, 0x20u);
    }

    [(MGRemoteQueryClientManager *)self _browserUpdateState];
    int v11 = [(MGRemoteQueryClientManager *)self _clientsWithQuery:v4];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
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
          [(MGRemoteQueryClientManager *)self _clientStop:*(void *)(*((void *)&v16 + 1) + 8 * v15++)];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v9 = MGLogForCategory(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)CC_MD5_CTX buf = 134218242;
      __int16 v22 = self;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v6;
      _os_log_debug_impl(&dword_229257000, v9, OS_LOG_TYPE_DEBUG, "%p not tracking query %@", buf, 0x16u);
    }
  }
}

- (void)_clientStartWithQuery:(id)a3 target:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  int v8 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(MGRemoteQueryClientManager *)self queryAgent];
  id v10 = +[MGRemoteQueryClientHandlerQuery handlerWithQuery:v7 forGroupsQueryAgent:v9];

  int v11 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  uint64_t v12 = [(MGRemoteQueryClientManager *)self session];
  uint64_t v13 = +[MGRemoteQueryClient clientWithHandler:v10 target:v6 dispatchQueue:v11 delegate:self usingSession:v12];

  uint64_t v14 = [(MGRemoteQueryClientManager *)self clients];
  uint64_t v15 = [v14 arrayByAddingObject:v13];

  [(MGRemoteQueryClientManager *)self setClients:v15];
  long long v16 = MGLogForCategory(6);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134218498;
    long long v19 = self;
    __int16 v20 = 2048;
    uint64_t v21 = [v15 count];
    __int16 v22 = 2112;
    __int16 v23 = v13;
    _os_log_impl(&dword_229257000, v16, OS_LOG_TYPE_DEFAULT, "%p now %lu clients after starting %@", (uint8_t *)&v18, 0x20u);
  }

  long long v17 = [(MGRemoteQueryClientManager *)self _watchdogForTarget:v6];
  if (!v17) {
    [(MGRemoteQueryClientManager *)self _watchdogAdd:v6];
  }
}

- (void)_clientStop:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  [(MGRemoteQueryClientManager *)self _clientRemove:v4];
  id v6 = MGLogForCategory(6);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(MGRemoteQueryClientManager *)self clients];
    int v8 = 134218498;
    id v9 = self;
    __int16 v10 = 2048;
    uint64_t v11 = [v7 count];
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_229257000, v6, OS_LOG_TYPE_DEFAULT, "%p now %lu clients after stopping %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)_clientRemove:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MGRemoteQueryClientManager *)self clients];
  id v7 = (void *)[v6 mutableCopy];

  [v7 removeObject:v4];
  [(MGRemoteQueryClientManager *)self setClients:v7];
  int v8 = [v4 target];
  id v9 = [v8 homeHash];
  if (v9)
  {
    __int16 v22 = v8;
    __int16 v23 = v7;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    __int16 v10 = [(MGRemoteQueryClientManager *)self targets];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v16 = [v15 homeHash];
          int v17 = [v16 isEqual:v9];

          if (v17)
          {
            uint64_t v18 = [v4 query];
            if (v18)
            {
              uint64_t v21 = (void *)v18;
              [(MGRemoteQueryClientManager *)self _clientStartWithQuery:v18 target:v15];

              int v8 = v22;
              id v7 = v23;
              goto LABEL_15;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    int v8 = v22;
    id v7 = v23;
  }
  long long v19 = [(MGRemoteQueryClientManager *)self _clientsForTarget:v8];
  uint64_t v20 = [v19 count];

  if (!v20) {
    [(MGRemoteQueryClientManager *)self _watchdogRemove:v8];
  }
LABEL_15:
}

- (id)_clientForTask:(id)a3 includeOthers:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v7);

  [(MGRemoteQueryClientManager *)self clients];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = (id)[v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v13 = [v12 task];
        int v14 = [v6 isEqual:v13];

        if (v14)
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (v4)
  {
    uint64_t v15 = [(MGRemoteQueryClientManager *)self watchdogs];
    long long v16 = [v15 allValues];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      while (2)
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          __int16 v22 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "pingClient", (void)v27);
          __int16 v23 = v22;
          if (v22)
          {
            long long v24 = [v22 task];
            int v25 = [v6 isEqual:v24];

            if (v25)
            {

              goto LABEL_23;
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
    __int16 v23 = v9;
LABEL_23:

    id v9 = v23;
  }

  return v9;
}

- (id)_clientForTarget:(id)a3 withQuery:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v20 = [v7 identifier];
  [(MGRemoteQueryClientManager *)self clients];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = (id)[v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v19 = v7;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int v14 = objc_msgSend(v13, "target", v19);
        if ([v6 isEqual:v14])
        {
          uint64_t v15 = [v13 query];
          long long v16 = [v15 identifier];
          int v17 = [v20 isEqual:v16];

          if (v17)
          {
            id v10 = v13;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
LABEL_12:
    id v7 = v19;
  }

  return v10;
}

- (id)_clientsWithQuery:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x263EFF9C0] set];
  long long v21 = v4;
  id v7 = [v4 identifier];
  uint64_t v20 = self;
  id v8 = [(MGRemoteQueryClientManager *)self clients];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v14 = [v13 query];
        uint64_t v15 = [v14 identifier];
        int v16 = [v7 isEqual:v15];

        if (v16) {
          [v6 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v10);
  }
  int v17 = MGLogForCategory(6);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = [v6 count];
    *(_DWORD *)CC_MD5_CTX buf = 134218498;
    long long v27 = v20;
    __int16 v28 = 2048;
    uint64_t v29 = v19;
    __int16 v30 = 2112;
    long long v31 = v7;
    _os_log_debug_impl(&dword_229257000, v17, OS_LOG_TYPE_DEBUG, "%p have %lu clients for query %@", buf, 0x20u);
  }

  return v6;
}

- (id)_clientsForTarget:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x263EFF9C0] set];
  id v7 = [(MGRemoteQueryClientManager *)self clients];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = [v12 target];
        int v14 = [v4 isEqual:v13];

        if (v14) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_watchdogForTarget:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MGRemoteQueryClientManager *)self watchdogs];
  id v7 = [v6 objectForKey:v4];

  return v7;
}

- (void)_watchdogAdd:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(MGRemoteQueryClientManager *)self _watchdogForTarget:v4];
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = MGLogForCategory(6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 134218498;
      int v14 = self;
      __int16 v15 = 2112;
      uint64_t v16 = (uint64_t)v7;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_error_impl(&dword_229257000, v8, OS_LOG_TYPE_ERROR, "%p already tracking watchdog %@ for target %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    uint64_t v9 = [(MGRemoteQueryClientManager *)self dispatchQueue];
    uint64_t v10 = [(MGRemoteQueryClientManager *)self session];
    id v7 = +[MGRemoteQueryClientWatchdog watchdogForTarget:v4 dispatchQueue:v9 delegate:self usingSession:v10];

    uint64_t v11 = [(MGRemoteQueryClientManager *)self watchdogs];
    uint64_t v8 = [v11 mutableCopy];

    [v8 setObject:v7 forKey:v4];
    [(MGRemoteQueryClientManager *)self setWatchdogs:v8];
    uint64_t v12 = MGLogForCategory(6);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218498;
      int v14 = self;
      __int16 v15 = 2048;
      uint64_t v16 = [v8 count];
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_229257000, v12, OS_LOG_TYPE_DEFAULT, "%p now %lu watchdogs after adding %@", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (void)_watchdogReset:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(MGRemoteQueryClientManager *)self _watchdogForTarget:v4];
  id v7 = v6;
  if (v6)
  {
    [v6 reset];
  }
  else
  {
    uint64_t v8 = MGLogForCategory(6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134218242;
      uint64_t v10 = self;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_error_impl(&dword_229257000, v8, OS_LOG_TYPE_ERROR, "%p no watchdog to reset for %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_watchdogRemove:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(MGRemoteQueryClientManager *)self _watchdogForTarget:v4];
  if (v6)
  {
    id v7 = [(MGRemoteQueryClientManager *)self watchdogs];
    uint64_t v8 = [v7 mutableCopy];

    [v8 removeObjectForKey:v4];
    [(MGRemoteQueryClientManager *)self setWatchdogs:v8];
    int v9 = MGLogForCategory(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218498;
      __int16 v11 = self;
      __int16 v12 = 2048;
      uint64_t v13 = [v8 count];
      __int16 v14 = 2112;
      __int16 v15 = v6;
      _os_log_impl(&dword_229257000, v9, OS_LOG_TYPE_DEFAULT, "%p now %lu watchdogs after removing %@", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    uint64_t v8 = MGLogForCategory(6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134218242;
      __int16 v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = (uint64_t)v4;
      _os_log_error_impl(&dword_229257000, v8, OS_LOG_TYPE_ERROR, "%p not tracking watchdog for target %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_watchdogFired:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  [(MGRemoteQueryClientManager *)self _targetRemove:v4];
  uint64_t v6 = [(MGRemoteQueryClientManager *)self _clientsForTarget:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [(MGRemoteQueryClientManager *)self _clientStop:*(void *)(*((void *)&v14 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v8);
  }
  __int16 v11 = [(MGRemoteQueryClientManager *)self _clientsForTarget:v4];
  if ([v11 count])
  {
  }
  else
  {
    __int16 v12 = [(MGRemoteQueryClientManager *)self _watchdogForTarget:v4];

    if (v12)
    {
      uint64_t v13 = MGLogForCategory(6);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CC_MD5_CTX buf = 134218242;
        uint64_t v19 = self;
        __int16 v20 = 2112;
        id v21 = v4;
        _os_log_error_impl(&dword_229257000, v13, OS_LOG_TYPE_ERROR, "%p watchdog for target %@ lingered after firing", buf, 0x16u);
      }

      [(MGRemoteQueryClientManager *)self _watchdogRemove:v4];
    }
  }
}

- (void)clientInvalidated:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__MGRemoteQueryClientManager_clientInvalidated_withError___block_invoke;
  block[3] = &unk_26485E5F8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __58__MGRemoteQueryClientManager_clientInvalidated_withError___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) clients];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    [*(id *)(a1 + 32) _clientRemove:*(void *)(a1 + 40)];
    id v4 = MGLogForCategory(6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void **)(a1 + 32);
      id v6 = [v5 clients];
      uint64_t v7 = [v6 count];
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 134218754;
      __int16 v11 = v5;
      __int16 v12 = 2048;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl(&dword_229257000, v4, OS_LOG_TYPE_DEFAULT, "%p now %lu clients after invalidation of %@ with error %@", (uint8_t *)&v10, 0x2Au);
    }
  }
}

- (void)watchdogFired:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__MGRemoteQueryClientManager_watchdogFired___block_invoke;
  v7[3] = &unk_26485E468;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__MGRemoteQueryClientManager_watchdogFired___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) target];
  int v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) _watchdogForTarget:v2];
  LODWORD(v3) = [v3 isEqual:v4];

  if (v3)
  {
    uint64_t v5 = MGLogForCategory(6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 134218498;
      uint64_t v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v2;
      _os_log_error_impl(&dword_229257000, v5, OS_LOG_TYPE_ERROR, "%p watchdog %p fired for %@", (uint8_t *)&v8, 0x20u);
    }

    [*(id *)(a1 + 40) _watchdogFired:v2];
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a4;
  int v8 = (void (**)(id, uint64_t, void *))a5;
  uint64_t v9 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v9);

  __int16 v10 = [v7 protectionSpace];
  uint64_t v11 = [v10 authenticationMethod];
  if ([(id)*MEMORY[0x263EFC5A0] isEqual:v11]
    && (uint64_t v12 = [v10 serverTrust]) != 0)
  {
    uint64_t v13 = v12;
    uint64_t v14 = [MEMORY[0x263EFC610] credentialForTrust:v12];
    uint64_t v15 = MGLogForCategory(6);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 134218498;
      uint64_t v18 = self;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_debug_impl(&dword_229257000, v15, OS_LOG_TYPE_DEBUG, "%p allowing trust %@ for challenge %@", (uint8_t *)&v17, 0x20u);
    }

    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v16 = 1;
  }
  v8[2](v8, v16, v14);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, uint64_t))a6;
  uint64_t v12 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = [(MGRemoteQueryClientManager *)self _clientForTask:v9 includeOthers:1];
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v14 = v10;
    uint64_t v15 = [v13 target];
    [(MGRemoteQueryClientManager *)self _watchdogReset:v15];

    [v13 consumeResponse:v14];
    uint64_t v16 = 1;
  }
  else
  {
    int v17 = MGLogForCategory(6);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 134218754;
      __int16 v19 = self;
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2112;
      long long v25 = v13;
      _os_log_error_impl(&dword_229257000, v17, OS_LOG_TYPE_ERROR, "%p bad response %@ from task %@ for client %@", (uint8_t *)&v18, 0x2Au);
    }

    uint64_t v16 = 0;
  }
  v11[2](v11, v16);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(MGRemoteQueryClientManager *)self _clientForTask:v7 includeOthers:1];
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 target];
    [(MGRemoteQueryClientManager *)self _watchdogReset:v12];

    [v11 consumeData:v8];
  }
  else
  {
    uint64_t v13 = MGLogForCategory(6);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 134218242;
      uint64_t v15 = self;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_error_impl(&dword_229257000, v13, OS_LOG_TYPE_ERROR, "%p no data consumer for task %@", (uint8_t *)&v14, 0x16u);
    }

    [v7 cancel];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v11 = a5;
  id v7 = a4;
  id v8 = [(MGRemoteQueryClientManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(MGRemoteQueryClientManager *)self _clientForTask:v7 includeOthers:1];

  if (v9)
  {
    id v10 = [v9 target];
    [(MGRemoteQueryClientManager *)self _watchdogReset:v10];

    [v9 completeWithError:v11];
  }
}

- (MGInternalQueryRunner)queryRunner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queryRunner);
  return (MGInternalQueryRunner *)WeakRetained;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (MGGroupsQueryAgent)queryAgent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queryAgent);
  return (MGGroupsQueryAgent *)WeakRetained;
}

- (MGRemoteQueryClientBrowser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
}

- (NSSet)targets
{
  return self->_targets;
}

- (void)setTargets:(id)a3
{
}

- (NSDictionary)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
}

- (NSArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSDictionary)watchdogs
{
  return self->_watchdogs;
}

- (void)setWatchdogs:(id)a3
{
}

- (MGRemoteQueryClientManagerForwarder)forwarder
{
  return self->_forwarder;
}

- (NSURLSession)session
{
  return self->_session;
}

- (MGOutstandingQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSArray)homeHashes
{
  return self->_homeHashes;
}

- (void)setHomeHashes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeHashes, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_forwarder, 0);
  objc_storeStrong((id *)&self->_watchdogs, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_targets, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_destroyWeak((id *)&self->_queryAgent);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_queryRunner);
}

@end