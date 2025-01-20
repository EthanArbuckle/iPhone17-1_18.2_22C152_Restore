@interface ARDaemonService
+ (BOOL)isSupported;
+ (Class)remoteServiceClass;
+ (id)serviceName;
+ (int64_t)maximumConcurrentServicesPerClient;
- (ARDaemonService)initWithConnection:(id)a3;
- (ARDaemonService)initWithConnection:(id)a3 exportedInterface:(id)a4 remoteObjectInterface:(id)a5;
- (ARDaemonService)initWithRemoteService:(id)a3;
- (ARDaemonServiceDataSource)dataSource;
- (ARDaemonServiceDelegate)delegate;
- (ARRemoteService)remoteService;
- (ARRemoteServiceBaseProtocol)clientService;
- (BOOL)isActive;
- (BOOL)isAuthorized;
- (BOOL)isImmersive;
- (NSString)clientBundleIdentifier;
- (NSString)clientProcessName;
- (NSXPCConnection)connection;
- (id)initAsLocalService;
- (id)shortenedServiceNameForLogging;
- (int)clientProcessIdentifier;
- (uint64_t)setImmersive:(uint64_t)result;
- (void)_commonInitWithProcessName:(id)a3 processIdentifier:(int)a4 bundleIdentifier:(id)a5;
- (void)interruptionHandler;
- (void)invalidate;
- (void)invalidationHandler;
- (void)resume;
- (void)setActive:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRemoteService:(id)a3;
- (void)startService:(id)a3;
- (void)suspend;
@end

@implementation ARDaemonService

- (void)_commonInitWithProcessName:(id)a3 processIdentifier:(int)a4 bundleIdentifier:(id)a5
{
  v8 = (NSString *)a3;
  v9 = (NSString *)a5;
  clientProcessName = self->_clientProcessName;
  self->_clientProcessName = v8;
  v11 = v8;

  self->_clientProcessIdentifier = a4;
  clientBundleIdentifier = self->_clientBundleIdentifier;
  self->_clientBundleIdentifier = v9;
  v13 = v9;

  id v16 = [(id)objc_opt_class() serviceName];
  v14 = [v16 stringByReplacingOccurrencesOfString:@"com.apple.arkit.service." withString:&stru_26FB5B738];
  shortenedServiceNameForLogging = self->_shortenedServiceNameForLogging;
  self->_shortenedServiceNameForLogging = v14;
}

- (ARDaemonService)initWithConnection:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(id)objc_opt_class() remoteServiceClass])
  {
    uint64_t v5 = [(id)objc_opt_class() remoteServiceClass];
    if (v5 != objc_opt_class())
    {
      v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "remoteServiceClass"), "performSelector:", sel_remoteServiceInterface);
      uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "remoteServiceClass"), "performSelector:", sel_daemonServiceInterface);
      v8 = (void *)v7;
      if (v6)
      {
        if (v7)
        {
          self = [(ARDaemonService *)self initWithConnection:v4 exportedInterface:v7 remoteObjectInterface:v6];
          v9 = self;
LABEL_15:

          goto LABEL_16;
        }
        v14 = _ARLogDaemon_1();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v20 = (objc_class *)objc_opt_class();
          id v16 = NSStringFromClass(v20);
          v21 = (objc_class *)[(id)objc_opt_class() remoteServiceClass];
          v18 = NSStringFromClass(v21);
          int v23 = 138543874;
          v24 = v16;
          __int16 v25 = 2048;
          v26 = self;
          __int16 v27 = 2112;
          v28 = v18;
          v19 = "%{public}@ <%p>: %@ does not define a daemon service interface. Implement the 'daemonServiceInterface'";
          goto LABEL_13;
        }
      }
      else
      {
        v14 = _ARLogDaemon_1();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = (objc_class *)objc_opt_class();
          id v16 = NSStringFromClass(v15);
          v17 = (objc_class *)[(id)objc_opt_class() remoteServiceClass];
          v18 = NSStringFromClass(v17);
          int v23 = 138543874;
          v24 = v16;
          __int16 v25 = 2048;
          v26 = self;
          __int16 v27 = 2112;
          v28 = v18;
          v19 = "%{public}@ <%p>: %@ does not define a remote service interface. Implement the 'remoteServiceInterface'";
LABEL_13:
          _os_log_impl(&dword_24719A000, v14, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v23, 0x20u);
        }
      }

      v9 = 0;
      goto LABEL_15;
    }
  }
  v6 = _ARLogDaemon_1();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    int v23 = 138543874;
    v24 = v11;
    __int16 v25 = 2048;
    v26 = self;
    __int16 v27 = 2112;
    v28 = v13;
    _os_log_impl(&dword_24719A000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ does not define a remote service class. Implement the 'remoteServiceClass' function and point it to its remote", (uint8_t *)&v23, 0x20u);
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (ARDaemonService)initWithConnection:(id)a3 exportedInterface:(id)a4 remoteObjectInterface:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v34.receiver = self;
    v34.super_class = (Class)ARDaemonService;
    id v12 = [(ARDaemonService *)&v34 init];
    if (v12)
    {
      os_activity_t v13 = _os_activity_create(&dword_24719A000, "Daemon service", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
      v14 = (void *)*((void *)v12 + 2);
      *((void *)v12 + 2) = v13;

      [v9 setExportedObject:v12];
      [v9 setExportedInterface:v10];
      [v9 setRemoteObjectInterface:v11];
      objc_initWeak(&location, v12);
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __78__ARDaemonService_initWithConnection_exportedInterface_remoteObjectInterface___block_invoke;
      v31[3] = &unk_265206DE0;
      objc_copyWeak(&v32, &location);
      [v9 setInterruptionHandler:v31];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __78__ARDaemonService_initWithConnection_exportedInterface_remoteObjectInterface___block_invoke_2;
      v29[3] = &unk_265206DE0;
      objc_copyWeak(&v30, &location);
      [v9 setInvalidationHandler:v29];
      objc_storeStrong((id *)v12 + 9, a3);
      uint64_t v15 = ARCreateTransactionForService();
      id v16 = (void *)*((void *)v12 + 1);
      *((void *)v12 + 1) = v15;

      *((unsigned char *)v12 + 32) = 1;
      v17 = objc_msgSend(*((id *)v12 + 9), "ar_processName");
      uint64_t v18 = [*((id *)v12 + 9) processIdentifier];
      v19 = objc_msgSend(*((id *)v12 + 9), "ar_processBundleIdentifier");
      [v12 _commonInitWithProcessName:v17 processIdentifier:v18 bundleIdentifier:v19];

      v20 = _ARLogGeneral_0();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        uint64_t v24 = *((void *)v12 + 5);
        uint64_t v23 = *((void *)v12 + 6);
        int v25 = *((_DWORD *)v12 + 9);
        *(_DWORD *)buf = 138544387;
        *(void *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v12;
        __int16 v36 = 2114;
        uint64_t v37 = v23;
        __int16 v38 = 2113;
        uint64_t v39 = v24;
        __int16 v40 = 1024;
        int v41 = v25;
        _os_log_impl(&dword_24719A000, v20, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Client connected: %{public}@ (%{private}@, %i)", buf, 0x30u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      v26 = _os_activity_create(&dword_24719A000, "Daemon service init", *((os_activity_t *)v12 + 2), OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v26, (os_activity_scope_state_t)buf);

      os_activity_scope_leave((os_activity_scope_state_t)buf);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
    self = (ARDaemonService *)v12;
    __int16 v27 = self;
  }
  else
  {
    __int16 v27 = 0;
  }

  return v27;
}

void __78__ARDaemonService_initWithConnection_exportedInterface_remoteObjectInterface___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained interruptionHandler];
}

void __78__ARDaemonService_initWithConnection_exportedInterface_remoteObjectInterface___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidationHandler];
}

- (id)initAsLocalService
{
  v10.receiver = self;
  v10.super_class = (Class)ARDaemonService;
  v2 = [(ARDaemonService *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08AB0] processInfo];
    id v4 = [v3 processName];
    uint64_t v5 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v6 = [v5 processIdentifier];
    uint64_t v7 = [MEMORY[0x263F086E0] mainBundle];
    v8 = [v7 bundleIdentifier];
    [(ARDaemonService *)v2 _commonInitWithProcessName:v4 processIdentifier:v6 bundleIdentifier:v8];
  }
  return v2;
}

- (ARDaemonService)initWithRemoteService:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARDaemonService;
  uint64_t v6 = [(ARDaemonService *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F08AB0] processInfo];
    v8 = [v7 processName];
    id v9 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v10 = [v9 processIdentifier];
    id v11 = [MEMORY[0x263F086E0] mainBundle];
    id v12 = [v11 bundleIdentifier];
    [(ARDaemonService *)v6 _commonInitWithProcessName:v8 processIdentifier:v10 bundleIdentifier:v12];

    objc_storeStrong((id *)&v6->_remoteService, a3);
  }

  return v6;
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)interruptionHandler
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  v3 = _os_activity_create(&dword_24719A000, "Daemon service interrupted", (os_activity_t)self->_daemonServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v10);

  id v4 = _ARLogGeneral_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)buf = 138543874;
    id v12 = v6;
    __int16 v13 = 2048;
    objc_super v14 = self;
    __int16 v15 = 2114;
    id v16 = clientProcessName;
    _os_log_impl(&dword_24719A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Daemon service interrupted: %{public}@", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "serviceDidInterrupt:", self, v10.opaque[0], v10.opaque[1]);
  }
  os_activity_scope_leave(&v10);
}

- (void)invalidationHandler
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  v3 = _os_activity_create(&dword_24719A000, "Daemon service invalidated", (os_activity_t)self->_daemonServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v10);

  id v4 = _ARLogGeneral_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)buf = 138543874;
    id v12 = v6;
    __int16 v13 = 2048;
    objc_super v14 = self;
    __int16 v15 = 2114;
    id v16 = clientProcessName;
    _os_log_impl(&dword_24719A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Daemon service invalidated: %{public}@", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "serviceDidInvalidate:", self, v10.opaque[0], v10.opaque[1]);
  }
  -[ARDaemonService setConnection:](self, "setConnection:", 0, v10.opaque[0], v10.opaque[1]);
  os_activity_scope_leave(&v10);
}

+ (id)serviceName
{
  return &stru_26FB5B738;
}

- (id)shortenedServiceNameForLogging
{
  return self->_shortenedServiceNameForLogging;
}

+ (int64_t)maximumConcurrentServicesPerClient
{
  if (maximumConcurrentServicesPerClient_onceToken != -1) {
    dispatch_once(&maximumConcurrentServicesPerClient_onceToken, &__block_literal_global_1);
  }
  return maximumConcurrentServicesPerClient_maximum;
}

uint64_t __53__ARDaemonService_maximumConcurrentServicesPerClient__block_invoke()
{
  uint64_t result = [MEMORY[0x263F20ED0] integerForKey:*MEMORY[0x263F20E10]];
  maximumConcurrentServicesPerClient_maximum = result;
  return result;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)invalidate
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(ARDaemonService *)self connection];
  [(ARDaemonService *)self setConnection:0];
  [v3 invalidate];
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  id v4 = _os_activity_create(&dword_24719A000, "Daemon service invalidate", (os_activity_t)self->_daemonServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &v9);

  id v5 = _ARLogGeneral_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend((id)objc_opt_class(), "serviceName", v9.opaque[0], v9.opaque[1]);
    *(_DWORD *)buf = 138543874;
    id v11 = v7;
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2114;
    __int16 v15 = v8;
    _os_log_impl(&dword_24719A000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Invalidate: %{public}@", buf, 0x20u);
  }
  os_activity_scope_leave(&v9);
}

- (void)resume
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  v3 = _os_activity_create(&dword_24719A000, "Daemon service resume", (os_activity_t)self->_daemonServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v8);

  id v4 = _ARLogGeneral_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = objc_msgSend((id)objc_opt_class(), "serviceName", v8.opaque[0], v8.opaque[1]);
    *(_DWORD *)buf = 138543874;
    id v10 = v6;
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2114;
    __int16 v14 = v7;
    _os_log_impl(&dword_24719A000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Resume: %{public}@", buf, 0x20u);
  }
  os_activity_scope_leave(&v8);
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = _ARLogGeneral_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    os_activity_scope_state_s v8 = @"NO";
    int v9 = 138543874;
    id v10 = v7;
    if (v3) {
      os_activity_scope_state_s v8 = @"YES";
    }
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2114;
    __int16 v14 = v8;
    _os_log_impl(&dword_24719A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Setting active to: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  self->_active = v3;
}

- (void)suspend
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(ARDaemonService *)self connection];
  [v3 suspend];

  id v4 = _ARLogGeneral_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = [(id)objc_opt_class() serviceName];
    int v8 = 138543874;
    int v9 = v6;
    __int16 v10 = 2048;
    __int16 v11 = self;
    __int16 v12 = 2114;
    __int16 v13 = v7;
    _os_log_impl(&dword_24719A000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Suspend: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)startService:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = _ARLogGeneral_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    clientProcessName = self->_clientProcessName;
    *(_DWORD *)__int16 v10 = 138543874;
    *(void *)&v10[4] = v7;
    *(_WORD *)&v10[12] = 2048;
    *(void *)&v10[14] = self;
    __int16 v11 = 2114;
    __int16 v12 = clientProcessName;
    _os_log_impl(&dword_24719A000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Daemon service started: %{public}@", v10, 0x20u);
  }
  *(void *)__int16 v10 = 0;
  *(void *)&v10[8] = 0;
  int v9 = _os_activity_create(&dword_24719A000, "Daemon service started", (os_activity_t)self->_daemonServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v9, (os_activity_scope_state_t)v10);

  v4[2](v4, 1);
  os_activity_scope_leave((os_activity_scope_state_t)v10);
}

+ (Class)remoteServiceClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isActive
{
  return self->_active;
}

- (ARDaemonServiceDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (ARDaemonServiceDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (ARDaemonServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARDaemonServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConnection:(id)a3
{
}

- (ARRemoteServiceBaseProtocol)clientService
{
  return (ARRemoteServiceBaseProtocol *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)isAuthorized
{
  if (result) {
    return *(unsigned char *)(result + 33) != 0;
  }
  return result;
}

- (BOOL)isImmersive
{
  if (result) {
    return *(unsigned char *)(result + 34) != 0;
  }
  return result;
}

- (uint64_t)setImmersive:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 34) = a2;
  }
  return result;
}

- (ARRemoteService)remoteService
{
  return (ARRemoteService *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRemoteService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_clientService, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_shortenedServiceNameForLogging, 0);
  objc_storeStrong((id *)&self->_daemonServiceActivity, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end