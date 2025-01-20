@interface MGRemoteQueryServerManager
- (BOOL)_shouldRunServer;
- (BOOL)haveGroupsToAdvertise;
- (BOOL)havePermissiveACL;
- (MGInternalQueryRunner)queryRunner;
- (MGOutstandingQuery)query;
- (MGRemoteQueryServer)server;
- (MGRemoteQueryServerManager)initWithQueryRunner:(id)a3;
- (NSString)description;
- (NSString)homeHash;
- (NSUserDefaults)airplayDefaults;
- (OS_dispatch_queue)dispatchQueue;
- (unint64_t)relaunchCount;
- (void)_setupQuery;
- (void)_startServer;
- (void)_stopServer;
- (void)_updateState;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)serverInvalidated:(id)a3 withError:(id)a4;
- (void)setHaveGroupsToAdvertise:(BOOL)a3;
- (void)setHavePermissiveACL:(BOOL)a3;
- (void)setHomeHash:(id)a3;
- (void)setQuery:(id)a3;
- (void)setRelaunchCount:(unint64_t)a3;
- (void)setServer:(id)a3;
@end

@implementation MGRemoteQueryServerManager

- (MGRemoteQueryServerManager)initWithQueryRunner:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MGRemoteQueryServerManager;
  v5 = [(MGRemoteQueryServerManager *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_queryRunner, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MediaGroups.RemoteQuery.Server", v7);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v8;

    server = v6->_server;
    v6->_server = 0;

    *(_WORD *)&v6->_havePermissiveACL = 0;
    uint64_t v11 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.airplay"];
    airplayDefaults = v6->_airplayDefaults;
    v6->_airplayDefaults = (NSUserDefaults *)v11;

    [(NSUserDefaults *)v6->_airplayDefaults addObserver:v6 forKeyPath:@"accessControlLevel" options:4 context:0];
    v13 = [(MGRemoteQueryServerManager *)v6 dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__MGRemoteQueryServerManager_initWithQueryRunner___block_invoke;
    block[3] = &unk_26485E378;
    v16 = v6;
    dispatch_async(v13, block);
  }
  return v6;
}

uint64_t __50__MGRemoteQueryServerManager_initWithQueryRunner___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupQuery];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateState];
}

- (void)dealloc
{
  v3 = [(MGRemoteQueryServerManager *)self airplayDefaults];
  [v3 removeObserver:self forKeyPath:@"accessControlLevel" context:0];

  id v4 = [(MGRemoteQueryServerManager *)self query];
  if (v4)
  {
    v5 = [(MGRemoteQueryServerManager *)self queryRunner];
    [v5 stopOutstandingQuery:v4];
  }
  v6.receiver = self;
  v6.super_class = (Class)MGRemoteQueryServerManager;
  [(MGRemoteQueryServerManager *)&v6 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(MGRemoteQueryServerManager *)self havePermissiveACL];
  BOOL v7 = [(MGRemoteQueryServerManager *)self haveGroupsToAdvertise];
  dispatch_queue_t v8 = [(MGRemoteQueryServerManager *)self homeHash];
  v9 = [(MGRemoteQueryServerManager *)self server];
  uint64_t v10 = 78;
  if (v7) {
    uint64_t v11 = 89;
  }
  else {
    uint64_t v11 = 78;
  }
  if (v6) {
    uint64_t v10 = 89;
  }
  v12 = [v3 stringWithFormat:@"<%@: %p, ACL(%c), Groups(%c), _homeHash = %@, _server = %@>", v5, self, v10, v11, v8, v9];

  return (NSString *)v12;
}

- (void)_updateState
{
  v3 = [(MGRemoteQueryServerManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MGRemoteQueryServerManager *)self server];

  BOOL v5 = [(MGRemoteQueryServerManager *)self _shouldRunServer];
  if (v4 || !v5)
  {
    if (v4) {
      char v6 = v5;
    }
    else {
      char v6 = 1;
    }
    if ((v6 & 1) == 0)
    {
      [(MGRemoteQueryServerManager *)self _stopServer];
    }
  }
  else
  {
    [(MGRemoteQueryServerManager *)self _startServer];
  }
}

- (BOOL)_shouldRunServer
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(MGRemoteQueryServerManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  if ([(MGRemoteQueryServerManager *)self havePermissiveACL]
    && [(MGRemoteQueryServerManager *)self haveGroupsToAdvertise])
  {
    id v4 = [(MGRemoteQueryServerManager *)self homeHash];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  char v6 = MGLogForCategory(5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    if (v5) {
      int v8 = 89;
    }
    else {
      int v8 = 78;
    }
    if ([(MGRemoteQueryServerManager *)self havePermissiveACL]) {
      int v9 = 89;
    }
    else {
      int v9 = 78;
    }
    if ([(MGRemoteQueryServerManager *)self haveGroupsToAdvertise]) {
      int v10 = 89;
    }
    else {
      int v10 = 78;
    }
    uint64_t v11 = [(MGRemoteQueryServerManager *)self homeHash];
    int v13 = 134219008;
    if ([v11 length]) {
      int v12 = 89;
    }
    else {
      int v12 = 78;
    }
    v14 = self;
    __int16 v15 = 1024;
    int v16 = v8;
    __int16 v17 = 1024;
    int v18 = v9;
    __int16 v19 = 1024;
    int v20 = v10;
    __int16 v21 = 1024;
    int v22 = v12;
    _os_log_debug_impl(&dword_229257000, v6, OS_LOG_TYPE_DEBUG, "%p server should run %c, ACL(%c) GTA(%c) HH(%c)", (uint8_t *)&v13, 0x24u);
  }
  return v5;
}

- (void)_startServer
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(MGRemoteQueryServerManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MGRemoteQueryServerManager *)self server];

  if (v4)
  {
    BOOL v5 = MGLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      char v6 = [(MGRemoteQueryServerManager *)self server];
      int v11 = 134218240;
      int v12 = self;
      __int16 v13 = 2048;
      v14 = v6;
      _os_log_error_impl(&dword_229257000, v5, OS_LOG_TYPE_ERROR, "%p server already started, running %p", (uint8_t *)&v11, 0x16u);
LABEL_6:
    }
  }
  else
  {
    BOOL v7 = [MGRemoteQueryServer alloc];
    int v8 = [(MGRemoteQueryServerManager *)self homeHash];
    int v9 = [(MGRemoteQueryServerManager *)self dispatchQueue];
    int v10 = [(MGRemoteQueryServer *)v7 initWithHomeHash:v8 delegate:self dispatchQueue:v9];
    [(MGRemoteQueryServerManager *)self setServer:v10];

    BOOL v5 = MGLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      char v6 = [(MGRemoteQueryServerManager *)self server];
      int v11 = 134218240;
      int v12 = self;
      __int16 v13 = 2048;
      v14 = v6;
      _os_log_impl(&dword_229257000, v5, OS_LOG_TYPE_DEFAULT, "%p started server %p", (uint8_t *)&v11, 0x16u);
      goto LABEL_6;
    }
  }
}

- (void)_stopServer
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [(MGRemoteQueryServerManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MGRemoteQueryServerManager *)self server];
  BOOL v5 = MGLogForCategory(5);
  char v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134218240;
      int v8 = self;
      __int16 v9 = 2048;
      int v10 = v4;
      _os_log_impl(&dword_229257000, v6, OS_LOG_TYPE_DEFAULT, "%p stopping server %p", (uint8_t *)&v7, 0x16u);
    }

    [(MGRemoteQueryServerManager *)self setServer:0];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134217984;
      int v8 = self;
      _os_log_error_impl(&dword_229257000, v6, OS_LOG_TYPE_ERROR, "%p server already stopped", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_setupQuery
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [(MGRemoteQueryServerManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MGRemoteQueryServerManager *)self query];

  if (v4)
  {
    BOOL v5 = MGLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      char v6 = [(MGRemoteQueryServerManager *)self query];
      int v7 = [v6 identifier];
      *(_DWORD *)buf = 134218242;
      v26 = self;
      __int16 v27 = 2112;
      v28 = v7;
      _os_log_error_impl(&dword_229257000, v5, OS_LOG_TYPE_ERROR, "%p server monitoring query already running %@", buf, 0x16u);
    }
  }
  else
  {
    int v8 = (void *)MEMORY[0x263F08730];
    __int16 v9 = [MEMORY[0x263F546F8] predicateForCurrentDevice];
    v24[0] = v9;
    int v10 = (void *)MEMORY[0x263F08730];
    uint64_t v11 = objc_msgSend(MEMORY[0x263F546D0], "rq_predicateForHaveCurrentHome");
    v23[0] = v11;
    int v12 = objc_msgSend(MEMORY[0x263F546D0], "rq_predicateForLocal");
    v23[1] = v12;
    __int16 v13 = [MEMORY[0x263F08A98] predicateWithValue:0];
    v23[2] = v13;
    v14 = objc_msgSend(MEMORY[0x263F546D0], "rq_predicateForInCurrentHome");
    v23[3] = v14;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
    int v16 = [v10 andPredicateWithSubpredicates:v15];
    v24[1] = v16;
    __int16 v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
    BOOL v5 = [v8 orPredicateWithSubpredicates:v17];

    objc_initWeak((id *)buf, self);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __41__MGRemoteQueryServerManager__setupQuery__block_invoke;
    v21[3] = &unk_26485E648;
    objc_copyWeak(&v22, (id *)buf);
    int v18 = (void *)MEMORY[0x22A6B39E0](v21);
    __int16 v19 = [(MGRemoteQueryServerManager *)self queryRunner];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __41__MGRemoteQueryServerManager__setupQuery__block_invoke_19;
    v20[3] = &unk_26485E6C0;
    v20[4] = self;
    [v19 startOutstandingQueryWithPredicate:v5 handler:v18 completion:v20];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

void __41__MGRemoteQueryServerManager__setupQuery__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    char v6 = [WeakRetained dispatchQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__MGRemoteQueryServerManager__setupQuery__block_invoke_2;
    v7[3] = &unk_26485E468;
    id v8 = v3;
    __int16 v9 = v5;
    dispatch_async(v6, v7);
  }
}

void __41__MGRemoteQueryServerManager__setupQuery__block_invoke_2(uint64_t a1)
{
  data[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  id v3 = MGLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    buf.A = 134218240;
    *(void *)&buf.B = v4;
    LOWORD(buf.D) = 2048;
    *(void *)((char *)&buf.D + 2) = v2;
    _os_log_impl(&dword_229257000, v3, OS_LOG_TYPE_DEFAULT, "%p server monitoring query received %lu groups", (uint8_t *)&buf, 0x16u);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 identifier];
          int v12 = MGHomeIdentifierForGroupIdentifier(v11);

          if (v12)
          {
            uint64_t v15 = *(void **)(a1 + 40);
            data[0] = 0;
            data[1] = 0;
            [v12 getUUIDBytes:data];
            memset(&buf, 0, sizeof(buf));
            CC_MD5_Init(&buf);
            CC_MD5_Update(&buf, data, 0x10u);
            CC_MD5_Final(md, &buf);
            id v16 = objc_alloc_init(NSString);
            for (uint64_t i = 0; i != 16; ++i)
            {
              int v18 = v16;
              objc_msgSend(v16, "stringByAppendingFormat:", @"%hhX", md[i]);
              id v16 = (id)objc_claimAutoreleasedReturnValue();
            }
            [v15 setHomeHash:v16];

            [*(id *)(a1 + 40) setHaveGroupsToAdvertise:v2 != 1];
            return;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  __int16 v13 = MGLogForCategory(5);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    buf.A = 134217984;
    *(void *)&buf.B = v14;
    _os_log_impl(&dword_229257000, v13, OS_LOG_TYPE_DEFAULT, "%p no suitable home found for advertising.", (uint8_t *)&buf, 0xCu);
  }

  [*(id *)(a1 + 40) setHomeHash:0];
  [*(id *)(a1 + 40) setHaveGroupsToAdvertise:0];
}

void __41__MGRemoteQueryServerManager__setupQuery__block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) dispatchQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__MGRemoteQueryServerManager__setupQuery__block_invoke_2_20;
  v6[3] = &unk_26485E468;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __41__MGRemoteQueryServerManager__setupQuery__block_invoke_2_20(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = MGLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) identifier];
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_229257000, v2, OS_LOG_TYPE_DEFAULT, "%p server monitoring using query %@", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 32) setQuery:*(void *)(a1 + 40)];
}

- (void)setHavePermissiveACL:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MGRemoteQueryServerManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_havePermissiveACL != v3)
  {
    self->_havePermissiveACL = v3;
    int v6 = [(MGRemoteQueryServerManager *)self dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__MGRemoteQueryServerManager_setHavePermissiveACL___block_invoke;
    block[3] = &unk_26485E378;
    void block[4] = self;
    dispatch_async(v6, block);
  }
}

uint64_t __51__MGRemoteQueryServerManager_setHavePermissiveACL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateState];
}

- (void)setHaveGroupsToAdvertise:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MGRemoteQueryServerManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_haveGroupsToAdvertise != v3)
  {
    self->_haveGroupsToAdvertise = v3;
    int v6 = [(MGRemoteQueryServerManager *)self dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__MGRemoteQueryServerManager_setHaveGroupsToAdvertise___block_invoke;
    block[3] = &unk_26485E378;
    void block[4] = self;
    dispatch_async(v6, block);
  }
}

uint64_t __55__MGRemoteQueryServerManager_setHaveGroupsToAdvertise___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateState];
}

- (void)setHomeHash:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = (NSString *)a3;
  id v5 = [(MGRemoteQueryServerManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_homeHash != v4)
  {
    int v6 = [(MGRemoteQueryServerManager *)self homeHash];
    char v7 = [v6 isEqual:v4];

    if ((v7 & 1) == 0)
    {
      __int16 v8 = MGLogForCategory(5);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CC_MD5_CTX buf = 134218242;
        uint64_t v14 = self;
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_impl(&dword_229257000, v8, OS_LOG_TYPE_DEFAULT, "%p home hash changing %@", buf, 0x16u);
      }

      [(MGRemoteQueryServerManager *)self _stopServer];
      uint64_t v9 = (NSString *)[(NSString *)v4 copy];
      homeHash = self->_homeHash;
      self->_homeHash = v9;

      uint64_t v11 = [(MGRemoteQueryServerManager *)self dispatchQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __42__MGRemoteQueryServerManager_setHomeHash___block_invoke;
      block[3] = &unk_26485E378;
      void block[4] = self;
      dispatch_async(v11, block);
    }
  }
}

uint64_t __42__MGRemoteQueryServerManager_setHomeHash___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateState];
}

- (void)serverInvalidated:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(MGRemoteQueryServerManager *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__MGRemoteQueryServerManager_serverInvalidated_withError___block_invoke;
  block[3] = &unk_26485E5F8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __58__MGRemoteQueryServerManager_serverInvalidated_withError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) server];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    [*(id *)(a1 + 32) setServer:0];
    unint64_t v4 = [*(id *)(a1 + 32) relaunchCount];
    if (*(void *)(a1 + 48))
    {
      unint64_t v5 = v4;
      double v6 = exp2((double)v4);
      if (v5 >= 5) {
        unint64_t v7 = v5;
      }
      else {
        unint64_t v7 = v5 + 1;
      }
      int64_t v8 = 1000000000 * (unint64_t)(v6 + -1.0);
    }
    else
    {
      unint64_t v7 = 0;
      int64_t v8 = 0;
    }
    [*(id *)(a1 + 32) setRelaunchCount:v7];
    dispatch_time_t v9 = dispatch_time(0, v8);
    id v10 = [*(id *)(a1 + 32) dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__MGRemoteQueryServerManager_serverInvalidated_withError___block_invoke_2;
    block[3] = &unk_26485E378;
    void block[4] = *(void *)(a1 + 32);
    dispatch_after(v9, v10, block);
  }
}

uint64_t __58__MGRemoteQueryServerManager_serverInvalidated_withError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateState];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  int64_t v8 = [(MGRemoteQueryServerManager *)self dispatchQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__MGRemoteQueryServerManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v10[3] = &unk_26485E468;
  id v11 = v7;
  id v12 = self;
  id v9 = v7;
  dispatch_async(v8, v10);
}

void __77__MGRemoteQueryServerManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isEqualToString:@"accessControlLevel"])
  {
    uint64_t v2 = [*(id *)(a1 + 40) airplayDefaults];
    int v3 = [v2 objectForKey:@"accessControlLevel"];

    if (v3)
    {
      unint64_t v4 = [*(id *)(a1 + 40) airplayDefaults];
      uint64_t v5 = [v4 integerForKey:@"accessControlLevel"];

      double v6 = MGLogForCategory(5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        int v12 = 134218240;
        uint64_t v13 = v7;
        __int16 v14 = 2048;
        uint64_t v15 = v5;
        _os_log_impl(&dword_229257000, v6, OS_LOG_TYPE_DEFAULT, "%p ACL changed to %ld", (uint8_t *)&v12, 0x16u);
      }

      int64_t v8 = *(void **)(a1 + 40);
      BOOL v9 = v5 == 0;
    }
    else
    {
      id v10 = MGLogForCategory(5);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        int v12 = 134217984;
        uint64_t v13 = v11;
        _os_log_impl(&dword_229257000, v10, OS_LOG_TYPE_DEFAULT, "%p ACL not set", (uint8_t *)&v12, 0xCu);
      }

      int64_t v8 = *(void **)(a1 + 40);
      BOOL v9 = 0;
    }
    [v8 setHavePermissiveACL:v9];
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

- (MGRemoteQueryServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (BOOL)havePermissiveACL
{
  return self->_havePermissiveACL;
}

- (BOOL)haveGroupsToAdvertise
{
  return self->_haveGroupsToAdvertise;
}

- (NSString)homeHash
{
  return self->_homeHash;
}

- (NSUserDefaults)airplayDefaults
{
  return self->_airplayDefaults;
}

- (MGOutstandingQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (unint64_t)relaunchCount
{
  return self->_relaunchCount;
}

- (void)setRelaunchCount:(unint64_t)a3
{
  self->_relaunchCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_airplayDefaults, 0);
  objc_storeStrong((id *)&self->_homeHash, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_queryRunner);
}

@end