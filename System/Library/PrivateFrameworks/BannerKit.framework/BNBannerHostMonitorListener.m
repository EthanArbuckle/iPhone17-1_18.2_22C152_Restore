@interface BNBannerHostMonitorListener
+ (void)initialize;
- (BNBannerHostMonitorListener)initWithServiceDomain:(id)a3 authorizedBundleIDs:(id)a4;
- (BOOL)_isConnectingProcessAuthorized:(id)a3 error:(id *)a4;
- (BOOL)isBannerHostAvailable;
- (NSString)description;
- (void)_addConnection:(id)a3;
- (void)_notifyObserversWithBlock:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)addObserver:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)removeObserver:(id)a3;
@end

@implementation BNBannerHostMonitorListener

- (BOOL)isBannerHostAvailable
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSMutableArray *)v2->_connections count] != 0;
  objc_sync_exit(v2);

  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    BNRegisterBannerKitLogging();
  }
}

- (BNBannerHostMonitorListener)initWithServiceDomain:(id)a3 authorizedBundleIDs:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BNBannerHostMonitorListener;
  v9 = [(BNBannerHostMonitorListener *)&v26 init];
  if (v9)
  {
    if (!v7)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, v9, @"BNBannerHostMonitorListener.m", 43, @"Invalid parameter not satisfying: %@", @"serviceDomain" object file lineNumber description];
    }
    objc_storeStrong((id *)&v9->_authorizedBundleIDs, a4);
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)Serial;

    v12 = (void *)MEMORY[0x1E4F623F0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __73__BNBannerHostMonitorListener_initWithServiceDomain_authorizedBundleIDs___block_invoke;
    v23[3] = &unk_1E63B9680;
    id v24 = v7;
    v13 = v9;
    v25 = v13;
    uint64_t v14 = [v12 listenerWithConfigurator:v23];
    id v15 = v13[2];
    v13[2] = (id)v14;

    v16 = (void *)BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      v20 = [v13 description];
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      __int16 v29 = 2114;
      v30 = v20;
      _os_log_impl(&dword_1BEC04000, v17, OS_LOG_TYPE_DEFAULT, "Initializing new %{public}@ instance: %{public}@", buf, 0x16u);
    }
    [v13[2] activate];
  }
  return v9;
}

void __73__BNBannerHostMonitorListener_initWithServiceDomain_authorizedBundleIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setDomain:v3];
  v4 = +[BNBannerHostMonitorSessionSpecification identifier];
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 40)];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(BSServiceConnectionListener *)self->_connectionListener domain];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; serviceDomain: %@; authorizedBundleIDs: %@>",
    v4,
    self,
    v5,
  v6 = self->_authorizedBundleIDs);

  return (NSString *)v6;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    observers = v5->_observers;
    if (!observers)
    {
      uint64_t v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      id v8 = v5->_observers;
      v5->_observers = (NSHashTable *)v7;

      observers = v5->_observers;
    }
    [(NSHashTable *)observers addObject:v9];
    objc_sync_exit(v5);

    id v4 = v9;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    observers = v5->_observers;
    if (observers) {
      [(NSHashTable *)observers removeObject:v7];
    }
    objc_sync_exit(v5);

    id v4 = v7;
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  v12 = [v9 remoteProcess];
  id v20 = 0;
  BOOL v13 = [(BNBannerHostMonitorListener *)v11 _isConnectingProcessAuthorized:v12 error:&v20];
  id v14 = v20;

  if (v13)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__BNBannerHostMonitorListener_listener_didReceiveConnection_withContext___block_invoke;
    v19[3] = &unk_1E63B9568;
    v19[4] = v11;
    [v9 configureConnection:v19];
    [(BNBannerHostMonitorListener *)v11 _addConnection:v9];
  }
  else
  {
    id v15 = (id)BNLogHostingService;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = [v14 localizedDescription];
      -[BNBannerHostMonitorListener listener:didReceiveConnection:withContext:](v17, v18, buf, v15);
    }

    [v9 invalidate];
  }

  objc_sync_exit(v11);
}

void __73__BNBannerHostMonitorListener_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[BNBannerHostMonitorSessionSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  id v5 = +[BNBannerHostMonitorSessionSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__BNBannerHostMonitorListener_listener_didReceiveConnection_withContext___block_invoke_2;
  v8[3] = &unk_1E63BA140;
  objc_copyWeak(&v9, &location);
  [v3 setActivationHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__BNBannerHostMonitorListener_listener_didReceiveConnection_withContext___block_invoke_23;
  v6[3] = &unk_1E63B96D0;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __73__BNBannerHostMonitorListener_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1BEC04000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ (client-side) connection did activate", (uint8_t *)&v7, 0xCu);
  }
}

void __73__BNBannerHostMonitorListener_listener_didReceiveConnection_withContext___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    int v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_1BEC04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ (client-side) connection invalidated", (uint8_t *)&v9, 0xCu);
  }
  [WeakRetained _removeConnection:v3];
}

- (BOOL)_isConnectingProcessAuthorized:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned __int8 v7 = [v6 hasEntitlement:@"com.apple.bannerkit.hostmonitor"];
  authorizedBundleIDs = self->_authorizedBundleIDs;
  int v9 = [v6 bundleIdentifier];

  BOOL v10 = [(NSSet *)authorizedBundleIDs containsObject:v9];
  BOOL v11 = v7 & v10;
  if (a4 && (v7 & v10 & 1) == 0)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    BOOL v13 = v12;
    if ((v7 & 1) == 0) {
      [v12 appendString:@"missing entitlement"];
    }
    if (!v10)
    {
      if ([v13 length]) {
        id v14 = @", not an authorized bundle ID";
      }
      else {
        id v14 = @"not an authorized bundle ID";
      }
      [v13 appendString:v14];
    }
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = v13;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    *a4 = [v15 errorWithDomain:@"BNBannerSourceErrorDomain" code:0 userInfo:v16];
  }
  return v11;
}

- (void)_addConnection:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  connections = v5->_connections;
  if (!connections)
  {
    unsigned __int8 v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = v5->_connections;
    v5->_connections = v7;

    connections = v5->_connections;
  }
  [(NSMutableArray *)connections addObject:v4];
  [v4 activate];
  if ([(NSMutableArray *)v5->_connections count] == 1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__BNBannerHostMonitorListener__addConnection___block_invoke;
    block[3] = &unk_1E63B9B88;
    block[4] = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  objc_sync_exit(v5);
}

uint64_t __46__BNBannerHostMonitorListener__addConnection___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__BNBannerHostMonitorListener__addConnection___block_invoke_2;
  v3[3] = &unk_1E63BA168;
  v3[4] = v1;
  return [v1 _notifyObserversWithBlock:v3];
}

void __46__BNBannerHostMonitorListener__addConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 bannerHostDidBecomeAvailableForMonitorListener:*(void *)(a1 + 32)];
  }
}

- (void)_removeConnection:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  [(NSMutableArray *)v5->_connections removeObject:v4];
  if (![(NSMutableArray *)v5->_connections count])
  {
    connections = v5->_connections;
    v5->_connections = 0;
  }
  if (!v5->_connections)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__BNBannerHostMonitorListener__removeConnection___block_invoke;
    block[3] = &unk_1E63B9B88;
    block[4] = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  objc_sync_exit(v5);
}

uint64_t __49__BNBannerHostMonitorListener__removeConnection___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__BNBannerHostMonitorListener__removeConnection___block_invoke_2;
  v3[3] = &unk_1E63BA168;
  v3[4] = v1;
  return [v1 _notifyObserversWithBlock:v3];
}

void __49__BNBannerHostMonitorListener__removeConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 bannerHostDidBecomeUnavailableForMonitorListener:*(void *)(a1 + 32)];
  }
}

- (void)_notifyObserversWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v6 = (id)[(NSHashTable *)observers copy];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_authorizedBundleIDs, 0);
}

- (void)listener:(uint8_t *)buf didReceiveConnection:(os_log_t)log withContext:.cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1BEC04000, log, OS_LOG_TYPE_ERROR, "%{public}@ (client-side) connection failed to authenticate: %{public}@", buf, 0x16u);
}

@end