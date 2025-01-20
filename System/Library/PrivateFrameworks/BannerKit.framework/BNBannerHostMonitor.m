@interface BNBannerHostMonitor
+ (void)initialize;
- (BNBannerHostMonitor)initWithMachName:(id)a3;
- (BOOL)isActive;
- (BSServiceConnection)_connection;
- (id)_activeConnection;
- (id)description;
- (void)_invalidateConnection;
- (void)_setActive:(BOOL)a3;
- (void)_setConnection:(id)a3;
- (void)activate;
- (void)deactivate;
- (void)dealloc;
@end

@implementation BNBannerHostMonitor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    BNRegisterBannerKitLogging();
  }
}

- (void)dealloc
{
  [(BNBannerHostMonitor *)self _invalidateConnection];
  v3.receiver = self;
  v3.super_class = (Class)BNBannerHostMonitor;
  [(BNBannerHostMonitor *)&v3 dealloc];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; machName: %@>",
               objc_opt_class(),
               self,
               self->_machName);
}

- (BNBannerHostMonitor)initWithMachName:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"BNBannerHostMonitor.m", 48, @"Invalid parameter not satisfying: %@", @"machName" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)BNBannerHostMonitor;
  v6 = [(BNBannerHostMonitor *)&v18 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    machName = v6->_machName;
    v6->_machName = (NSString *)v7;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)Serial;

    v11 = (void *)BNLogHostingHost;
    if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = [(BNBannerHostMonitor *)v6 description];
      *(_DWORD *)buf = 138543618;
      v20 = v14;
      __int16 v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_1BEC04000, v12, OS_LOG_TYPE_DEFAULT, "Initializing new %{public}@ instance: %{public}@", buf, 0x16u);
    }
  }

  return v6;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)activate
{
  id v2 = [(BNBannerHostMonitor *)self _activeConnection];
}

- (void)deactivate
{
}

- (id)_activeConnection
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_connection)
  {
    objc_super v3 = (void *)MEMORY[0x1E4F623E8];
    machName = v2->_machName;
    id v5 = +[BNBannerHostMonitorSessionSpecification identifier];
    v6 = [v3 endpointForMachName:machName service:v5 instance:0];

    uint64_t v7 = [MEMORY[0x1E4F623E0] connectionWithEndpoint:v6];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__BNBannerHostMonitor__activeConnection__block_invoke;
    v10[3] = &unk_1E63B9568;
    v10[4] = v2;
    [v7 configureConnection:v10];
    objc_storeStrong((id *)&v2->_connection, v7);
    [(BSServiceConnection *)v2->_connection activate];
  }
  objc_sync_exit(v2);

  connection = v2->_connection;
  return connection;
}

void __40__BNBannerHostMonitor__activeConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[BNBannerHostMonitorSessionSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  id v5 = +[BNBannerHostMonitorSessionSpecification interface];
  if (v5)
  {
    [v3 setInterface:v5];
    [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  }
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__BNBannerHostMonitor__activeConnection__block_invoke_2;
  v10[3] = &unk_1E63B9540;
  objc_copyWeak(&v11, &location);
  [v3 setActivationHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__BNBannerHostMonitor__activeConnection__block_invoke_21;
  v8[3] = &unk_1E63B9540;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__BNBannerHostMonitor__activeConnection__block_invoke_22;
  v6[3] = &unk_1E63B9540;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __40__BNBannerHostMonitor__activeConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)BNLogHostingHost;
  if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v10 = 138543362;
    id v11 = v8;
    _os_log_impl(&dword_1BEC04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) connection activated", (uint8_t *)&v10, 0xCu);
  }
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    objc_sync_enter(v9);
    [v9 _setActive:1];
    objc_sync_exit(v9);
  }
}

void __40__BNBannerHostMonitor__activeConnection__block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v10 = 138543362;
    id v11 = v8;
    _os_log_impl(&dword_1BEC04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ (service-side) connection interrupted", (uint8_t *)&v10, 0xCu);
  }
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    objc_sync_enter(v9);
    [v9 _setActive:0];
    [v3 activate];
    objc_sync_exit(v9);
  }
}

void __40__BNBannerHostMonitor__activeConnection__block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)BNLogHostingHost;
  if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v10 = 138543362;
    id v11 = v8;
    _os_log_impl(&dword_1BEC04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) connection invalidated", (uint8_t *)&v10, 0xCu);
  }
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    objc_sync_enter(v9);
    [v9 _setActive:0];
    [v9 _invalidateConnection];
    objc_sync_exit(v9);
  }
}

- (void)_invalidateConnection
{
  obj = self;
  objc_sync_enter(obj);
  id v2 = obj;
  connection = obj->_connection;
  if (connection)
  {
    [(BSServiceConnection *)connection invalidate];
    v4 = obj->_connection;
    obj->_connection = 0;

    id v2 = obj;
  }
  objc_sync_exit(v2);
}

- (void)_setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BSServiceConnection)_connection
{
  return self->_connection;
}

- (void)_setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_machName, 0);
}

@end