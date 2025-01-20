@interface ATSessionServerListener
+ (id)sharedSessionServer;
- (ATSessionServerListener)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)_dumpDebugInformation;
- (void)addSession:(id)a3;
- (void)cancelSessionWithIdentifier:(id)a3 completion:(id)a4;
- (void)fetchActiveSessionCountForSessionTypeIdentifier:(id)a3 completion:(id)a4;
- (void)fetchSessionsWithTypeIdentifier:(id)a3 completion:(id)a4;
- (void)removeSession:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ATSessionServerListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionProxiesBySessionID, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)_dumpDebugInformation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  obj = self->_sessionProxiesBySessionID;
  objc_sync_enter(obj);
  v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(NSMutableDictionary *)self->_sessionProxiesBySessionID count];
    *(_DWORD *)buf = 138543618;
    v20 = self;
    __int16 v21 = 2048;
    uint64_t v22 = v4;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ dumping info for %lu session proxies", buf, 0x16u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(NSMutableDictionary *)self->_sessionProxiesBySessionID objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = _ATLogCategoryFramework_Oversize();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = [v9 session];
          v12 = [v11 debugDescription];
          *(_DWORD *)buf = 138543362;
          v20 = v12;
          _os_log_impl(&dword_1D9BC7000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  objc_sync_exit(obj);
}

- (void)fetchActiveSessionCountForSessionTypeIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  __int16 v21 = self;
  uint64_t v22 = (void (**)(id, uint64_t, void))a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [(NSMutableDictionary *)self->_sessionProxiesBySessionID objectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (v6)
        {
          long long v14 = [*(id *)(*((void *)&v23 + 1) + 8 * i) session];
          long long v15 = [v14 sessionTypeIdentifier];
          int v16 = [v15 isEqualToString:v6];

          if (!v16) {
            continue;
          }
        }
        long long v17 = [v13 session];
        if ([v17 isCancelled])
        {
        }
        else
        {
          v18 = [v13 session];
          uint64_t v19 = [v18 isFinished] ^ 1;

          v10 += v19;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  v20 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v28 = v21;
    __int16 v29 = 2048;
    uint64_t v30 = v10;
    __int16 v31 = 2114;
    id v32 = v6;
    _os_log_impl(&dword_1D9BC7000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ found %lu active sessions for %{public}@", buf, 0x20u);
  }

  v22[2](v22, v10, 0);
}

- (void)cancelSessionWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v8 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    long long v25 = self;
    __int16 v26 = 2114;
    id v27 = v6;
    _os_log_impl(&dword_1D9BC7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling session. id=%{public}@", buf, 0x16u);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [(NSMutableDictionary *)self->_sessionProxiesBySessionID objectEnumerator];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = [v14 session];
        int v16 = [v15 sessionIdentifier];
        int v17 = [v16 isEqualToString:v6];

        if (v17)
        {
          v18 = [v14 session];
          [v18 cancel];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  v7[2](v7, 0);
}

- (void)fetchSessionsWithTypeIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v19 = (void (**)(id, void *, void))a4;
  long long v20 = objc_opt_new();
  uint64_t v7 = [MEMORY[0x1E4F4A2E0] allSessions];
  uint64_t v8 = (void *)[v7 copy];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v15 = objc_msgSend(v14, "sessionTypeIdentifier", v19);
        if ([v15 isEqualToString:v6])
        {
          sessionProxiesBySessionID = self->_sessionProxiesBySessionID;
          int v17 = [v14 sessionIdentifier];
          v18 = [(NSMutableDictionary *)sessionProxiesBySessionID objectForKey:v17];

          if (v18) {
            [v20 addObject:v14];
          }
        }
        else
        {
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  v19[2](v19, v20, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [v5 processIdentifier];
  uint64_t v7 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    long long v15 = self;
    __int16 v16 = 1024;
    int v17 = v6;
    _os_log_impl(&dword_1D9BC7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Got connection from pid %i", buf, 0x12u);
  }

  [v5 setExportedObject:self];
  uint64_t v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F33E49C0];
  [v5 setExportedInterface:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__ATSessionServerListener_listener_shouldAcceptNewConnection___block_invoke;
  v12[3] = &unk_1E6B8C2E8;
  v12[4] = self;
  int v13 = v6;
  [v5 setInterruptionHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__ATSessionServerListener_listener_shouldAcceptNewConnection___block_invoke_56;
  v10[3] = &unk_1E6B8C2E8;
  v10[4] = self;
  int v11 = v6;
  [v5 setInvalidationHandler:v10];
  [v5 resume];

  return 1;
}

void __62__ATSessionServerListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection interrupted from pid: %i", (uint8_t *)&v5, 0x12u);
  }
}

void __62__ATSessionServerListener_listener_shouldAcceptNewConnection___block_invoke_56(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection invalidated from pid: %i", (uint8_t *)&v5, 0x12u);
  }
}

- (void)removeSession:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  sessionProxiesBySessionID = self->_sessionProxiesBySessionID;
  uint64_t v6 = [v4 sessionIdentifier];
  __int16 v7 = [(NSMutableDictionary *)sessionProxiesBySessionID objectForKey:v6];

  if (v7)
  {
    [v7 stop];
    int v8 = self->_sessionProxiesBySessionID;
    objc_sync_enter(v8);
    uint64_t v9 = self->_sessionProxiesBySessionID;
    uint64_t v10 = [v4 sessionIdentifier];
    [(NSMutableDictionary *)v9 removeObjectForKey:v10];

    objc_sync_exit(v8);
  }
  int v11 = _ATLogCategoryFramework();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  CFStringRef v13 = (const __CFString *)*MEMORY[0x1E4F4A298];
  if (v12)
  {
    int v15 = 138543618;
    CFStringRef v16 = v13;
    __int16 v17 = 2114;
    id v18 = v4;
    _os_log_impl(&dword_1D9BC7000, v11, OS_LOG_TYPE_DEFAULT, "posting %{public}@ notification for removing session %{public}@", (uint8_t *)&v15, 0x16u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v13, 0, 0, 1u);
}

- (void)addSession:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [[ATSessionProxyListener alloc] initWithSession:v4];
  uint64_t v6 = self->_sessionProxiesBySessionID;
  objc_sync_enter(v6);
  sessionProxiesBySessionID = self->_sessionProxiesBySessionID;
  int v8 = [v4 sessionIdentifier];
  [(NSMutableDictionary *)sessionProxiesBySessionID setObject:v5 forKey:v8];

  objc_sync_exit(v6);
  [(ATSessionProxyListener *)v5 start];
  uint64_t v9 = _ATLogCategoryFramework();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F4A298];
  if (v10)
  {
    int v13 = 138543618;
    CFStringRef v14 = v11;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_1D9BC7000, v9, OS_LOG_TYPE_DEFAULT, "posting %{public}@ notification for adding session %{public}@", (uint8_t *)&v13, 0x16u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v11, 0, 0, 1u);
}

- (void)stop
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    __int16 v7 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping", (uint8_t *)&v6, 0xCu);
  }

  listener = self->_listener;
  if (listener)
  {
    [(NSXPCListener *)listener invalidate];
    [(NSXPCListener *)self->_listener setDelegate:0];
    int v5 = self->_listener;
    self->_listener = 0;
  }
}

- (void)start
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting", (uint8_t *)&v7, 0xCu);
  }

  id v4 = objc_alloc(MEMORY[0x1E4F29290]);
  int v5 = (NSXPCListener *)[v4 initWithMachServiceName:*MEMORY[0x1E4F4A278]];
  listener = self->_listener;
  self->_listener = v5;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
}

- (ATSessionServerListener)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATSessionServerListener;
  v2 = [(ATSessionServerListener *)&v7 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sessionProxiesBySessionID = v2->_sessionProxiesBySessionID;
    v2->_sessionProxiesBySessionID = v3;

    int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__dumpDebugInformation name:*MEMORY[0x1E4F4A250] object:0];
  }
  return v2;
}

+ (id)sharedSessionServer
{
  if (sharedSessionServer_onceToken != -1) {
    dispatch_once(&sharedSessionServer_onceToken, &__block_literal_global_330);
  }
  v2 = (void *)sharedSessionServer_server;

  return v2;
}

uint64_t __46__ATSessionServerListener_sharedSessionServer__block_invoke()
{
  sharedSessionServer_server = objc_alloc_init(ATSessionServerListener);

  return MEMORY[0x1F41817F8]();
}

@end