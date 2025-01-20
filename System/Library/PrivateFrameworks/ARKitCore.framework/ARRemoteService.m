@interface ARRemoteService
+ (BOOL)isSupported;
+ (BOOL)isSupportedWithError:(id *)a3;
+ (NSXPCInterface)daemonServiceInterface;
+ (NSXPCInterface)remoteServiceInterface;
+ (id)createDaemonServiceInterface:(id)a3;
+ (id)createRemoteServiceInterface:(id)a3;
+ (id)serviceName;
- (ARDaemonServiceBaseProtocol)service;
- (ARDaemonServiceBaseProtocol)syncService;
- (ARRemoteService)init;
- (ARRemoteService)initWithDaemon:(id)a3;
- (ARRemoteService)initWithDaemon:(id)a3 dispatchChannelQueue:(id)a4;
- (ARRemoteService)initWithDaemon:(id)a3 startConnection:(BOOL)a4;
- (ARRemoteService)initWithDaemon:(id)a3 startConnection:(BOOL)a4 dispatchChannelQueue:(id)a5;
- (ARRemoteService)initWithDispatchChannelQueue:(id)a3;
- (ARRemoteService)initWithEndpoint:(id)a3;
- (ARRemoteService)initWithEndpoint:(id)a3 startConnection:(BOOL)a4 dispatchChannelQueue:(id)a5;
- (ARRemoteService)initWithMachServiceName:(id)a3 exportedInterface:(id)a4 remoteObjectInterface:(id)a5 dispatchChannelQueue:(id)a6;
- (ARRemoteService)initWithMachServiceName:(id)a3 exportedInterface:(id)a4 remoteObjectInterface:(id)a5 endpoint:(id)a6;
- (ARRemoteService)initWithMachServiceName:(id)a3 exportedInterface:(id)a4 remoteObjectInterface:(id)a5 endpoint:(id)a6 startConnection:(BOOL)a7 dispatchChannelQueue:(id)a8;
- (ARRemoteServiceAnchorDelegate)anchorDelegate;
- (BOOL)_waitUntilStarted:(unint64_t)a3;
- (BOOL)updateUnmodifiedAnchors;
- (BOOL)waitUntilStarted:(unint64_t)a3;
- (NSXPCConnection)connection;
- (__n128)originFromWorld;
- (__n128)worldFromOrigin;
- (id)_getAsyncServiceQueue;
- (id)clientProcessName;
- (id)serviceDidInvalidateBlock;
- (int)clientProcessIdentifier;
- (int64_t)_waitForDispatchGroup:(unint64_t)a3;
- (unint64_t)status;
- (void)_serverConnectionInterrupted;
- (void)_serverConnectionInvalidated;
- (void)_skipRemoteObjectProxyErrorHandlers;
- (void)_startService;
- (void)asyncServiceWithCallback:(id)a3;
- (void)connectionDispatchGroupLeave;
- (void)dealloc;
- (void)invalidate;
- (void)reconnect;
- (void)serviceConfiguredWithCompletionHandler:(id)a3;
- (void)serviceConfiguredWithError:(id)a3;
- (void)serviceFailedWithError:(id)a3;
- (void)setAnchorDelegate:(id)a3;
- (void)setConnection:(id)a3;
- (void)setService:(id)a3 syncService:(id)a4;
- (void)setServiceDidInvalidateBlock:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setSyncService:(id)a3;
- (void)setUpdateUnmodifiedAnchors:(BOOL)a3;
- (void)syncServiceWithTimeout:(unint64_t)a3 callback:(id)a4;
@end

@implementation ARRemoteService

- (void)_skipRemoteObjectProxyErrorHandlers
{
  self->_skipRemoteObjectErrorHandlers = 1;
}

- (ARRemoteService)init
{
  return [(ARRemoteService *)self initWithDispatchChannelQueue:0];
}

- (ARRemoteService)initWithDispatchChannelQueue:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() serviceName];
  v6 = [(id)objc_opt_class() remoteServiceInterface];
  v7 = [(id)objc_opt_class() daemonServiceInterface];
  v8 = [(ARRemoteService *)self initWithMachServiceName:v5 exportedInterface:v6 remoteObjectInterface:v7 dispatchChannelQueue:v4];

  return v8;
}

- (ARRemoteService)initWithEndpoint:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() serviceName];
  v6 = [(id)objc_opt_class() remoteServiceInterface];
  v7 = [(id)objc_opt_class() daemonServiceInterface];
  v8 = [(ARRemoteService *)self initWithMachServiceName:v5 exportedInterface:v6 remoteObjectInterface:v7 endpoint:v4 startConnection:0 dispatchChannelQueue:0];

  return v8;
}

- (ARRemoteService)initWithEndpoint:(id)a3 startConnection:(BOOL)a4 dispatchChannelQueue:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() serviceName];
  v11 = [(id)objc_opt_class() remoteServiceInterface];
  v12 = [(id)objc_opt_class() daemonServiceInterface];
  v13 = [(ARRemoteService *)self initWithMachServiceName:v10 exportedInterface:v11 remoteObjectInterface:v12 endpoint:v9 startConnection:v5 dispatchChannelQueue:v8];

  return v13;
}

- (ARRemoteService)initWithMachServiceName:(id)a3 exportedInterface:(id)a4 remoteObjectInterface:(id)a5 dispatchChannelQueue:(id)a6
{
  return [(ARRemoteService *)self initWithMachServiceName:a3 exportedInterface:a4 remoteObjectInterface:a5 endpoint:0 startConnection:1 dispatchChannelQueue:a6];
}

- (ARRemoteService)initWithMachServiceName:(id)a3 exportedInterface:(id)a4 remoteObjectInterface:(id)a5 endpoint:(id)a6
{
  return [(ARRemoteService *)self initWithMachServiceName:a3 exportedInterface:a4 remoteObjectInterface:a5 endpoint:a6 startConnection:1 dispatchChannelQueue:0];
}

- (ARRemoteService)initWithMachServiceName:(id)a3 exportedInterface:(id)a4 remoteObjectInterface:(id)a5 endpoint:(id)a6 startConnection:(BOOL)a7 dispatchChannelQueue:(id)a8
{
  BOOL v48 = a7;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v50 = a4;
  id v14 = a5;
  id v15 = a6;
  id v49 = a8;
  v57.receiver = self;
  v57.super_class = (Class)ARRemoteService;
  id v16 = [(ARRemoteService *)&v57 init];
  if (v16)
  {
    os_activity_t v17 = _os_activity_create(&dword_1B88A2000, "Remote service", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v18 = (void *)*((void *)v16 + 6);
    *((void *)v16 + 6) = v17;

    *((_DWORD *)v16 + 10) = 0;
    dispatch_group_t v19 = dispatch_group_create();
    v20 = (void *)*((void *)v16 + 4);
    *((void *)v16 + 4) = v19;

    *((unsigned char *)v16 + 232) = 0;
    dispatch_group_enter(*((dispatch_group_t *)v16 + 4));
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v21 = _os_activity_create(&dword_1B88A2000, "Remote service init", *((os_activity_t *)v16 + 6), OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v21, &state);

    v22 = _ARLogGeneral_5();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v24;
      __int16 v59 = 2048;
      id v60 = v16;
      _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Remote service init", buf, 0x16u);
    }
    id v25 = [v13 stringByAppendingString:@".asyncServiceQueue"];
    v26 = (const char *)[v25 UTF8String];
    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v28 = dispatch_queue_create(v26, v27);
    v29 = (void *)*((void *)v16 + 3);
    *((void *)v16 + 3) = v28;

    if (v15) {
      uint64_t v30 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v15];
    }
    else {
      uint64_t v30 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v13 options:4096];
    }
    v31 = (void *)*((void *)v16 + 30);
    *((void *)v16 + 30) = v30;

    v32 = +[ARWeakReference weakReferenceWithObject:v16];
    [*((id *)v16 + 30) setExportedObject:v32];

    [*((id *)v16 + 30) setExportedInterface:v50];
    [*((id *)v16 + 30) setRemoteObjectInterface:v14];
    objc_initWeak(&location, v16);
    v33 = (void *)*((void *)v16 + 30);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __129__ARRemoteService_initWithMachServiceName_exportedInterface_remoteObjectInterface_endpoint_startConnection_dispatchChannelQueue___block_invoke;
    v53[3] = &unk_1E61852E8;
    objc_copyWeak(&v54, &location);
    [v33 setInterruptionHandler:v53];
    v34 = (void *)*((void *)v16 + 30);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __129__ARRemoteService_initWithMachServiceName_exportedInterface_remoteObjectInterface_endpoint_startConnection_dispatchChannelQueue___block_invoke_2;
    v51[3] = &unk_1E61852E8;
    objc_copyWeak(&v52, &location);
    [v34 setInvalidationHandler:v51];
    [*((id *)v16 + 30) resume];
    [v16 setStatus:0];
    uint64_t v35 = objc_opt_new();
    v36 = (void *)*((void *)v16 + 1);
    *((void *)v16 + 1) = v35;

    *((_DWORD *)v16 + 4) = 0;
    *((unsigned char *)v16 + 64) = [v16 conformsToProtocol:&unk_1F12858C0];
    v37 = [v13 componentsSeparatedByString:@"."];
    v38 = [v37 lastObject];
    *(void *)buf = 0;
    id v39 = v38;
    int v40 = objc_msgSend(v39, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v39, "length"), 0);

    uint64_t v41 = *(void *)buf;
    if (!v40) {
      uint64_t v41 = 0;
    }
    *((void *)v16 + 7) = v41;

    uint64_t v42 = MEMORY[0x1E4F149A0];
    long long v43 = *MEMORY[0x1E4F149A0];
    long long v44 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
    *((_OWORD *)v16 + 5) = *MEMORY[0x1E4F149A0];
    *((_OWORD *)v16 + 6) = v44;
    long long v45 = *(_OWORD *)(v42 + 32);
    long long v46 = *(_OWORD *)(v42 + 48);
    *((_OWORD *)v16 + 7) = v45;
    *((_OWORD *)v16 + 8) = v46;
    *((_OWORD *)v16 + 9) = v43;
    *((_OWORD *)v16 + 10) = v44;
    *((_OWORD *)v16 + 11) = v45;
    *((_OWORD *)v16 + 12) = v46;
    *((_DWORD *)v16 + 52) = 0;
    [v16 setUpdateUnmodifiedAnchors:1];
    [v16 _commonInit];
    if (v48) {
      [v16 _startService];
    }
    objc_destroyWeak(&v52);
    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);

    os_activity_scope_leave(&state);
  }

  return (ARRemoteService *)v16;
}

void __129__ARRemoteService_initWithMachServiceName_exportedInterface_remoteObjectInterface_endpoint_startConnection_dispatchChannelQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _serverConnectionInterrupted];
}

void __129__ARRemoteService_initWithMachServiceName_exportedInterface_remoteObjectInterface_endpoint_startConnection_dispatchChannelQueue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _serverConnectionInvalidated];
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_1B88A2000, "dealloc", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);

  id v4 = _ARLogGeneral_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    __int16 v12 = 2048;
    id v13 = self;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: dealloc", buf, 0x16u);
  }
  [(ARRemoteService *)self setServiceDidInvalidateBlock:0];
  [(ARRemoteService *)self invalidate];
  [(ARRemoteService *)self connectionDispatchGroupLeave];
  messageBuffer = self->_messageBuffer;
  if (messageBuffer)
  {
    free(messageBuffer);
    self->_messageBuffer = 0;
  }
  os_activity_scope_leave(&state);
  v8.receiver = self;
  v8.super_class = (Class)ARRemoteService;
  [(ARRemoteService *)&v8 dealloc];
}

- (id)_getAsyncServiceQueue
{
  return self->_asyncServiceQueue;
}

- (void)connectionDispatchGroupLeave
{
  p_connectionDispatchGroupLock = &self->_connectionDispatchGroupLock;
  os_unfair_lock_lock(&self->_connectionDispatchGroupLock);
  connectionDispatchGroup = self->_connectionDispatchGroup;
  if (connectionDispatchGroup)
  {
    dispatch_group_leave(connectionDispatchGroup);
    BOOL v5 = self->_connectionDispatchGroup;
    self->_connectionDispatchGroup = 0;
  }
  os_unfair_lock_unlock(p_connectionDispatchGroupLock);
}

- (void)_startService
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_1B88A2000, "_startService", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);

  id v4 = _ARLogGeneral_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543618;
    dispatch_group_t v19 = v6;
    __int16 v20 = 2048;
    v21 = self;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: _startService", buf, 0x16u);
  }
  BOOL skipRemoteObjectErrorHandlers = self->_skipRemoteObjectErrorHandlers;
  objc_initWeak((id *)buf, self);
  objc_super v8 = [(ARRemoteService *)self connection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __32__ARRemoteService__startService__block_invoke;
  uint64_t v14 = &unk_1E6185B68;
  BOOL v16 = skipRemoteObjectErrorHandlers;
  objc_copyWeak(&v15, (id *)buf);
  id v9 = [v8 remoteObjectProxyWithErrorHandler:&v11];
  service = self->_service;
  self->_service = v9;

  if (self->_service)
  {
    -[ARRemoteService setStatus:](self, "setStatus:", 1, v11, v12, v13, v14);
    [(ARDaemonServiceBaseProtocol *)self->_service startService:&__block_literal_global_16];
  }
  else
  {
    -[ARRemoteService serviceFailedWithError:](self, "serviceFailedWithError:", 0, v11, v12, v13, v14);
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);
}

void __32__ARRemoteService__startService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*(unsigned char *)(a1 + 40))
  {
    id v4 = _ARLogGeneral_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = [v3 description];
      int v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_ERROR, "ARRemoteService: remote object proxy failed with error: %@", (uint8_t *)&v9, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained serviceFailedWithError:v3];
    }
    else
    {
      objc_super v8 = _ARLogGeneral_5();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_ERROR, "ARRemoteService: weak self released before invalidation", (uint8_t *)&v9, 2u);
      }
    }
  }
}

void __32__ARRemoteService__startService__block_invoke_58(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = _ARLogGeneral_5();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = @"unsuccessfully";
    if (a2) {
      id v4 = @"successfully";
    }
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "Connected to arkitd %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)invalidate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  id v3 = _os_activity_create(&dword_1B88A2000, "invalidate", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v12);

  id v4 = _ARLogGeneral_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v6;
    __int16 v15 = 2048;
    BOOL v16 = self;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: invalidate", buf, 0x16u);
  }
  uint64_t v7 = [(ARRemoteService *)self connection];
  [v7 invalidate];

  [(ARRemoteService *)self setConnection:0];
  service = self->_service;
  self->_service = 0;

  syncService = self->_syncService;
  self->_syncService = 0;

  v10 = [(ARRemoteService *)self serviceDidInvalidateBlock];

  if (v10)
  {
    uint64_t v11 = [(ARRemoteService *)self serviceDidInvalidateBlock];
    ((void (**)(void, ARRemoteService *))v11)[2](v11, self);
  }
  os_activity_scope_leave(&v12);
}

- (int64_t)_waitForDispatchGroup:(unint64_t)a3
{
  p_connectionDispatchGroupLock = &self->_connectionDispatchGroupLock;
  os_unfair_lock_lock(&self->_connectionDispatchGroupLock);
  v6 = self->_connectionDispatchGroup;
  os_unfair_lock_unlock(p_connectionDispatchGroupLock);
  if (v6) {
    intptr_t v7 = dispatch_group_wait((dispatch_group_t)v6, a3);
  }
  else {
    intptr_t v7 = 0;
  }

  return v7;
}

- (BOOL)_waitUntilStarted:(unint64_t)a3
{
  objc_initWeak(&location, self);
  int64_t v5 = [(ARRemoteService *)self _waitForDispatchGroup:a3];
  id v6 = objc_loadWeakRetained(&location);
  uint64_t v7 = [v6 status];

  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = (unint64_t)(v7 - 3) >= 2;
  }
  BOOL v9 = !v8;
  objc_destroyWeak(&location);
  return v9;
}

- (BOOL)waitUntilStarted:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__ARRemoteService_waitUntilStarted___block_invoke;
  v5[3] = &unk_1E6185BB0;
  v5[4] = &v6;
  [(ARRemoteService *)self syncServiceWithTimeout:a3 callback:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__ARRemoteService_waitUntilStarted___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 != 0;
  return result;
}

- (void)reconnect
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  char v3 = _os_activity_create(&dword_1B88A2000, "reconnect", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);

  id v4 = _ARLogGeneral_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543618;
    v18 = v6;
    __int16 v19 = 2048;
    __int16 v20 = self;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: reconnect", buf, 0x16u);
  }
  if ([(ARRemoteService *)self status] != 3)
  {
    if ([(ARRemoteService *)self status] == 4)
    {
      uint64_t v7 = _ARLogGeneral_5();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = (objc_class *)objc_opt_class();
        char v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138543618;
        v18 = v9;
        __int16 v19 = 2048;
        __int16 v20 = self;
        _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Service not started - delaying reconnection attempt", buf, 0x16u);
      }
      objc_initWeak((id *)buf, self);
      dispatch_time_t v10 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __28__ARRemoteService_reconnect__block_invoke;
      block[3] = &unk_1E61852E8;
      objc_copyWeak(&v15, (id *)buf);
      dispatch_after(v10, MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
    uint64_t v11 = _ARLogGeneral_5();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      os_activity_scope_state_s v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      __int16 v19 = 2048;
      __int16 v20 = self;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Attempting reconnection", buf, 0x16u);
    }
    [(ARDaemonServiceBaseProtocol *)self->_service startService:&__block_literal_global_69];
  }
  os_activity_scope_leave(&state);
}

void __28__ARRemoteService_reconnect__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reconnect];
}

void __28__ARRemoteService_reconnect__block_invoke_67()
{
  v0 = _ARLogGeneral_5();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B88A2000, v0, OS_LOG_TYPE_INFO, "Reconnected to arkitd", v1, 2u);
  }
}

- (void)syncServiceWithTimeout:(unint64_t)a3 callback:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void (**)(id, void *))a4;
  objc_initWeak(&location, self);
  if ([(ARRemoteService *)self _waitUntilStarted:a3])
  {
    id v8 = objc_loadWeakRetained(&location);
    char v9 = [v8 syncService];
    v7[2](v7, v9);
  }
  else
  {
    dispatch_time_t v10 = _ARLogGeneral_5();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_loadWeakRetained(&location);
      if (v11)
      {
        id v4 = objc_loadWeakRetained(&location);
        os_activity_scope_state_s v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v13 = @"ARRemoteService";
      }
      id v14 = objc_loadWeakRetained(&location);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v13;
      __int16 v18 = 2048;
      id v19 = v14;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%@ <%p>: syncService timed out.", buf, 0x16u);

      if (v11)
      {
      }
    }

    v7[2](v7, 0);
  }
  objc_destroyWeak(&location);
}

- (void)asyncServiceWithCallback:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  asyncServiceQueue = self->_asyncServiceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ARRemoteService_asyncServiceWithCallback___block_invoke;
  block[3] = &unk_1E6185BD8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(asyncServiceQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __44__ARRemoteService_asyncServiceWithCallback___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained _waitUntilStarted:-1];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    id v8 = objc_loadWeakRetained(v2);
    id v6 = [v8 service];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    uint64_t v7 = *(void (**)(uint64_t, void))(v5 + 16);
    v7(v5, 0);
  }
}

- (void)setService:(id)a3 syncService:(id)a4
{
  id v6 = (ARDaemonServiceBaseProtocol *)a3;
  uint64_t v7 = (ARDaemonServiceBaseProtocol *)a4;
  service = self->_service;
  self->_service = v6;
  dispatch_time_t v10 = v6;

  syncService = self->_syncService;
  self->_syncService = v7;
}

- (void)_serverConnectionInterrupted
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  char v3 = _os_activity_create(&dword_1B88A2000, "Connection interrupted", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v10);

  int v4 = _ARLogGeneral_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543618;
    os_activity_scope_state_s v12 = v6;
    __int16 v13 = 2048;
    id v14 = self;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Connection interrupted", buf, 0x16u);
  }
  uint64_t v7 = [(ARRemoteService *)self connection];
  id v8 = [v7 endpoint];
  if (v8)
  {
  }
  else
  {
    BOOL v9 = [(ARRemoteService *)self status] == 0;

    if (!v9)
    {
      [(ARRemoteService *)self setStatus:4];
      [(ARRemoteService *)self reconnect];
    }
  }
  os_activity_scope_leave(&v10);
}

- (void)_serverConnectionInvalidated
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  char v3 = _os_activity_create(&dword_1B88A2000, "Connection invalidated", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v7);

  int v4 = _ARLogGeneral_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543618;
    BOOL v9 = v6;
    __int16 v10 = 2048;
    id v11 = self;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Connection invalidated", buf, 0x16u);
  }
  -[ARRemoteService setConnection:](self, "setConnection:", 0, v7.opaque[0], v7.opaque[1]);
  os_activity_scope_leave(&v7);
}

- (id)clientProcessName
{
  v2 = objc_opt_new();
  char v3 = [v2 processName];

  return v3;
}

- (int)clientProcessIdentifier
{
  v2 = objc_opt_new();
  int v3 = [v2 processIdentifier];

  return v3;
}

+ (id)serviceName
{
  return &stru_1F120C8F0;
}

+ (id)createRemoteServiceInterface:(id)a3
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:a3];
}

+ (id)createDaemonServiceInterface:(id)a3
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:a3];
}

+ (NSXPCInterface)remoteServiceInterface
{
  return 0;
}

+ (NSXPCInterface)daemonServiceInterface
{
  return 0;
}

- (void)serviceConfiguredWithCompletionHandler:(id)a3
{
}

- (void)serviceFailedWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  uint64_t v5 = _os_activity_create(&dword_1B88A2000, "serviceFailedWithError", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v9);

  id v6 = _ARLogGeneral_5();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    os_activity_scope_state_s v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138543874;
    id v11 = v8;
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: serviceFailedWithError: %@", buf, 0x20u);
  }
  -[ARRemoteService setStatus:](self, "setStatus:", 2, v9.opaque[0], v9.opaque[1]);
  [(ARRemoteService *)self connectionDispatchGroupLeave];
  os_activity_scope_leave(&v9);
}

- (void)serviceConfiguredWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _ARLogGeneral_5();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      os_activity_scope_state_s v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = self;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Service configured with error: %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    os_activity_scope_state_s v9 = (objc_class *)objc_opt_class();
    __int16 v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Service successfully configured", buf, 0x16u);
  }
  if ([(ARRemoteService *)self status] == 4) {
    [(ARRemoteService *)self serviceDidReconnect:v4 == 0];
  }
  if (v4)
  {
    [(ARRemoteService *)self invalidate];
    [(ARRemoteService *)self serviceFailedWithError:v4];
  }
  else
  {
    [(ARRemoteService *)self setStatus:3];
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    id v11 = _os_activity_create(&dword_1B88A2000, "serviceConfiguredWithNOError", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, (os_activity_scope_state_t)buf);

    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__ARRemoteService_serviceConfiguredWithError___block_invoke;
    v12[3] = &unk_1E61852E8;
    objc_copyWeak(&v13, &location);
    [(ARRemoteService *)self serviceConfiguredWithCompletionHandler:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    os_activity_scope_leave((os_activity_scope_state_t)buf);
  }
}

void __46__ARRemoteService_serviceConfiguredWithError___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (objc_class *)objc_opt_class();
    int v3 = NSStringFromClass(v2);
    id v4 = _ARLogGeneral_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_INFO, "%{public}@ - Preparing sync service and leaving dispatch group", buf, 0xCu);
    }

    uint64_t v5 = [WeakRetained connection];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__ARRemoteService_serviceConfiguredWithError___block_invoke_78;
    v8[3] = &unk_1E6185C00;
    id v9 = v3;
    id v6 = v3;
    os_activity_scope_state_s v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v8];
    [WeakRetained setSyncService:v7];

    [WeakRetained connectionDispatchGroupLeave];
  }
}

void __46__ARRemoteService_serviceConfiguredWithError___block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _ARLogGeneral_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_ERROR, "%{public}@ - Synchronous remote object proxy failed with error: %@", (uint8_t *)&v6, 0x16u);
  }
}

+ (BOOL)isSupportedWithError:(id *)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  return [a1 isSupportedWithError:0];
}

- (ARRemoteService)initWithDaemon:(id)a3
{
  return [(ARRemoteService *)self initWithDaemon:a3 startConnection:0 dispatchChannelQueue:0];
}

- (ARRemoteService)initWithDaemon:(id)a3 dispatchChannelQueue:(id)a4
{
  return [(ARRemoteService *)self initWithDaemon:a3 startConnection:0 dispatchChannelQueue:a4];
}

- (ARRemoteService)initWithDaemon:(id)a3 startConnection:(BOOL)a4
{
  return [(ARRemoteService *)self initWithDaemon:a3 startConnection:a4 dispatchChannelQueue:0];
}

- (ARRemoteService)initWithDaemon:(id)a3 startConnection:(BOOL)a4 dispatchChannelQueue:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(id)objc_opt_class() performSelector:sel_serviceName];
  id v11 = [v9 listenerEndPointForServiceNamed:v10];

  if (v11)
  {
    uint64_t v12 = [(ARRemoteService *)self initWithEndpoint:v11 startConnection:v5 dispatchChannelQueue:v8];
  }
  else
  {
    id v13 = [(id)objc_opt_class() serviceName];
    __int16 v14 = [(id)objc_opt_class() remoteServiceInterface];
    id v15 = [(id)objc_opt_class() daemonServiceInterface];
    uint64_t v12 = [(ARRemoteService *)self initWithMachServiceName:v13 exportedInterface:v14 remoteObjectInterface:v15 endpoint:0 startConnection:v5 dispatchChannelQueue:v8];
  }
  return v12;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 240, 1);
}

- (void)setConnection:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (__n128)worldFromOrigin
{
  return a1[18];
}

- (__n128)originFromWorld
{
  return a1[22];
}

- (ARDaemonServiceBaseProtocol)syncService
{
  return (ARDaemonServiceBaseProtocol *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSyncService:(id)a3
{
}

- (ARDaemonServiceBaseProtocol)service
{
  return self->_service;
}

- (ARRemoteServiceAnchorDelegate)anchorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_anchorDelegate);
  return (ARRemoteServiceAnchorDelegate *)WeakRetained;
}

- (void)setAnchorDelegate:(id)a3
{
}

- (BOOL)updateUnmodifiedAnchors
{
  return self->_updateUnmodifiedAnchors;
}

- (void)setUpdateUnmodifiedAnchors:(BOOL)a3
{
  self->_updateUnmodifiedAnchors = a3;
}

- (id)serviceDidInvalidateBlock
{
  return self->_serviceDidInvalidateBlock;
}

- (void)setServiceDidInvalidateBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serviceDidInvalidateBlock, 0);
  objc_destroyWeak((id *)&self->_anchorDelegate);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_syncService, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteServiceActivity, 0);
  objc_storeStrong((id *)&self->_connectionDispatchGroup, 0);
  objc_storeStrong((id *)&self->_asyncServiceQueue, 0);
  objc_storeStrong((id *)&self->_anchorsByIdentifier, 0);
}

@end