@interface CHSWidgetEventServiceListener
- (BOOL)_isConnectingProcessAuthorized:(id)a3 error:(id *)a4;
- (CHSWidgetEventServiceListener)initWithServiceDomain:(id)a3 delegate:(id)a4;
- (CHSWidgetEventServiceListenerDelegate)delegate;
- (NSString)description;
- (void)_addConnection:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)activate;
- (void)handleOpenEventWithURL:(id)a3;
- (void)handleOpenEventWithUserActivityData:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation CHSWidgetEventServiceListener

- (CHSWidgetEventServiceListener)initWithServiceDomain:(id)a3 delegate:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CHSWidgetEventServiceListener;
  v9 = [(CHSWidgetEventServiceListener *)&v29 init];
  if (v9)
  {
    if (!v7)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, v9, @"CHSWidgetEventServiceListener.m", 37, @"Invalid parameter not satisfying: %@", @"serviceDomain" object file lineNumber description];
    }
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.chronoservices.CHSWidgetEventServiceListener.connection", v10);
    connectionQueue = v9->_connectionQueue;
    v9->_connectionQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.chronoservices.CHSWidgetEventServiceListener.callout", v13);
    calloutQueue = v9->_calloutQueue;
    v9->_calloutQueue = (OS_dispatch_queue *)v14;

    v16 = (void *)MEMORY[0x1E4F50BC8];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __64__CHSWidgetEventServiceListener_initWithServiceDomain_delegate___block_invoke;
    v26[3] = &unk_1E56C9210;
    id v27 = v7;
    v17 = v9;
    v28 = v17;
    uint64_t v18 = [v16 listenerWithConfigurator:v26];
    connectionListener = v17->_connectionListener;
    v17->_connectionListener = (BSServiceConnectionListener *)v18;

    v20 = CHSLogChronoServices();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      v23 = [(CHSWidgetEventServiceListener *)v17 description];
      *(_DWORD *)buf = 138543618;
      v31 = v22;
      __int16 v32 = 2114;
      v33 = v23;
      _os_log_impl(&dword_190C6F000, v20, OS_LOG_TYPE_DEFAULT, "Initializing new %{public}@ instance: %{public}@", buf, 0x16u);
    }
  }

  return v9;
}

void __64__CHSWidgetEventServiceListener_initWithServiceDomain_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:*(void *)(a1 + 32)];
  v3 = +[CHSWidgetEventServiceSpecification identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 40)];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(BSServiceConnectionListener *)self->_connectionListener domain];
  v6 = [v3 stringWithFormat:@"<%@: %p; serviceDomain: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 remoteProcess];
  id v15 = 0;
  BOOL v8 = [(CHSWidgetEventServiceListener *)self _isConnectingProcessAuthorized:v7 error:&v15];
  id v9 = v15;

  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__CHSWidgetEventServiceListener_listener_didReceiveConnection_withContext___block_invoke;
    v14[3] = &unk_1E56C86D0;
    v14[4] = self;
    [v6 configureConnection:v14];
    [(CHSWidgetEventServiceListener *)self _addConnection:v6];
  }
  else
  {
    v10 = CHSLogChronoServices();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      dispatch_queue_t v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = [v9 localizedDescription];
      -[CHSWidgetEventServiceListener listener:didReceiveConnection:withContext:](v12, v13, buf, v10);
    }

    [v6 invalidate];
  }
}

void __75__CHSWidgetEventServiceListener_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v4 = +[CHSWidgetEventServiceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[CHSWidgetEventServiceSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__CHSWidgetEventServiceListener_listener_didReceiveConnection_withContext___block_invoke_2;
  v8[3] = &unk_1E56C9238;
  objc_copyWeak(&v9, &location);
  [v3 setActivationHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__CHSWidgetEventServiceListener_listener_didReceiveConnection_withContext___block_invoke_20;
  v6[3] = &unk_1E56C9260;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __75__CHSWidgetEventServiceListener_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_190C6F000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (client-side) connection did activate", (uint8_t *)&v6, 0xCu);
  }
}

void __75__CHSWidgetEventServiceListener_listener_didReceiveConnection_withContext___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = CHSLogChronoServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ (client-side) connection invalidated", (uint8_t *)&v8, 0xCu);
  }
  [WeakRetained _removeConnection:v3];
}

- (void)handleOpenEventWithURL:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_initWeak(&location, self);
  if (objc_opt_respondsToSelector())
  {
    calloutQueue = self->_calloutQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__CHSWidgetEventServiceListener_handleOpenEventWithURL___block_invoke;
    v7[3] = &unk_1E56C9288;
    id v8 = WeakRetained;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    dispatch_async(calloutQueue, v7);

    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&location);
}

void __56__CHSWidgetEventServiceListener_handleOpenEventWithURL___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v1, "eventServiceListener:didReceiveOpenEventWithURL:");
}

- (void)handleOpenEventWithUserActivityData:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_initWeak(&location, self);
  if (objc_opt_respondsToSelector())
  {
    int v6 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityData:v4];
    calloutQueue = self->_calloutQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__CHSWidgetEventServiceListener_handleOpenEventWithUserActivityData___block_invoke;
    v9[3] = &unk_1E56C9288;
    id v10 = WeakRetained;
    objc_copyWeak(&v12, &location);
    id v11 = v6;
    id v8 = v6;
    dispatch_async(calloutQueue, v9);

    objc_destroyWeak(&v12);
  }
  objc_destroyWeak(&location);
}

void __69__CHSWidgetEventServiceListener_handleOpenEventWithUserActivityData___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v1, "eventServiceListener:didReceiveOpenEventWithUserActivity:");
}

- (void)activate
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_190C6F000, log, OS_LOG_TYPE_FAULT, "%{public}@ unable to start event lister, connection listener is nil.", buf, 0xCu);
}

- (BOOL)_isConnectingProcessAuthorized:(id)a3 error:(id *)a4
{
  id v5 = a3;
  char v6 = [v5 hasEntitlement:@"com.apple.chrono.event-service-publisher"];
  BOOL v7 = v6;
  if (a4) {
    char v8 = v6;
  }
  else {
    char v8 = 1;
  }
  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "chs_initWithErrorCode:", 2);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_addConnection:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  connections = v4->_connections;
  if (!connections)
  {
    char v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v7 = v4->_connections;
    v4->_connections = v6;

    connections = v4->_connections;
  }
  [(NSMutableArray *)connections addObject:v8];
  [v8 activate];
  objc_sync_exit(v4);
}

- (void)_removeConnection:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_connections removeObject:v6];
  if (![(NSMutableArray *)v4->_connections count])
  {
    connections = v4->_connections;
    v4->_connections = 0;
  }
  objc_sync_exit(v4);
}

- (CHSWidgetEventServiceListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CHSWidgetEventServiceListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

- (void)listener:(uint8_t *)buf didReceiveConnection:(os_log_t)log withContext:.cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_190C6F000, log, OS_LOG_TYPE_ERROR, "%{public}@ (client-side) connection failed to authenticate: %{public}@", buf, 0x16u);
}

@end