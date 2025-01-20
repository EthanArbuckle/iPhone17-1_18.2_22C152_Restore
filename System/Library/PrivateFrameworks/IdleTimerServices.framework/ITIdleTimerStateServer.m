@interface ITIdleTimerStateServer
- (BOOL)_hasIdleTimerServicesEntitlementForProcess:(id)a3 missingEntitlementError:(id *)a4;
- (BOOL)clientConfiguration:(id)a3 handleIdleEvent:(unint64_t)a4;
- (BOOL)isIdleTimerServiceAvailableWithError:(id *)a3;
- (ITIdleTimerStateServer)initWithCalloutQueue:(id)a3 delegate:(id)a4;
- (ITIdleTimerStateServerDelegate)delegate;
- (void)_addConnection:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)addIdleTimerServiceConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)removeIdleTimerServiceConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5;
- (void)setDelegate:(id)a3;
@end

@implementation ITIdleTimerStateServer

- (void)addIdleTimerServiceConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x263F2B9B8] currentContext];
  v11 = [v10 remoteProcess];

  if (![(ITIdleTimerStateServer *)self _hasIdleTimerServicesEntitlementForProcess:v11 missingEntitlementError:a5])
  {
    v14 = ITLogIdleTimer();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543874;
      v26 = v22;
      __int16 v27 = 2114;
      v28 = v11;
      __int16 v29 = 2114;
      id v30 = v8;
      _os_log_error_impl(&dword_210665000, v14, OS_LOG_TYPE_ERROR, "%{public}@ - Missing entitlement. Rejecting unauthorized access from %{public}@ to add a configuration: %{public}@.", buf, 0x20u);
    }
    goto LABEL_7;
  }
  v12 = [(ITIdleTimerStateServer *)self delegate];
  int v13 = [v12 addIdleTimerConfiguration:v8 fromProcess:v11 forReason:v9];

  if (v13)
  {
    if ([v8 _idleEventMask])
    {
      v14 = [v8 _identifier];
      clientTargetsByConfigIdentifier = self->_clientTargetsByConfigIdentifier;
      v16 = [MEMORY[0x263F2B9B8] currentContext];
      v17 = [v16 remoteTarget];
      [(NSMutableDictionary *)clientTargetsByConfigIdentifier setObject:v17 forKey:v14];

LABEL_7:
    }
  }
  else if (a5)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    v19 = objc_msgSend(v8, "description", @"ITIdleTimerServicesErrorConfigurationDescriptionKey");
    v23[1] = @"ITIdleTimerServicesErrorReasonKey";
    v24[0] = v19;
    v24[1] = v9;
    v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    *a5 = [v18 errorWithDomain:@"ITIdleTimerConfigurationErrorDomain" code:3 userInfo:v20];
  }
}

- (ITIdleTimerStateServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ITIdleTimerStateServerDelegate *)WeakRetained;
}

- (BOOL)_hasIdleTimerServicesEntitlementForProcess:(id)a3 missingEntitlementError:(id *)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  char v5 = [a3 hasEntitlement:@"com.apple.idle-timer-services"];
  BOOL v6 = v5;
  if (a4 && (v5 & 1) == 0)
  {
    v7 = [NSString stringWithFormat:@"Missing <%@> Entitlement", @"com.apple.idle-timer-services"];
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08338];
    v12[0] = *MEMORY[0x263F08320];
    v12[1] = v9;
    v13[0] = v7;
    v13[1] = @"Missing Entitlement";
    v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    *a4 = [v8 errorWithDomain:@"ITIdleTimerConfigurationErrorDomain" code:2 userInfo:v10];
  }
  return v6;
}

- (ITIdleTimerStateServer)initWithCalloutQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)ITIdleTimerStateServer;
  uint64_t v9 = [(ITIdleTimerStateServer *)&v22 init];
  v10 = v9;
  if (v9)
  {
    v9->_accessLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_calloutQueue, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    clientTargetsByConfigIdentifier = v10->_clientTargetsByConfigIdentifier;
    v10->_clientTargetsByConfigIdentifier = v11;

    int v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    connections = v10->_connections;
    v10->_connections = v13;

    v15 = (void *)MEMORY[0x263F2B9E0];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __56__ITIdleTimerStateServer_initWithCalloutQueue_delegate___block_invoke;
    v20[3] = &unk_2641331A0;
    v16 = v10;
    v21 = v16;
    uint64_t v17 = [v15 listenerWithConfigurator:v20];
    id v18 = v16[3];
    v16[3] = (id)v17;

    [v16[3] activate];
  }

  return v10;
}

void __56__ITIdleTimerStateServer_initWithCalloutQueue_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"com.apple.frontboard"];
  [v3 setService:@"com.apple.idletimer-service"];
  [v3 setDelegate:*(void *)(a1 + 32)];
}

- (BOOL)clientConfiguration:(id)a3 handleIdleEvent:(unint64_t)a4
{
  id v6 = a3;
  BSDispatchQueueAssert();
  id v7 = [v6 _identifier];

  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  uint64_t v9 = [(NSMutableDictionary *)self->_clientTargetsByConfigIdentifier objectForKey:v7];
  os_unfair_lock_unlock(p_accessLock);
  if (v9)
  {
    v10 = [NSNumber numberWithUnsignedInteger:a4];
    char v11 = [v9 handleIdleEvent:v10 usingConfigurationWithIdentifier:v7];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isIdleTimerServiceAvailableWithError:(id *)a3
{
  return 1;
}

- (void)removeIdleTimerServiceConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x263F2B9B8] currentContext];
  char v11 = [v10 remoteProcess];

  if ([(ITIdleTimerStateServer *)self _hasIdleTimerServicesEntitlementForProcess:v11 missingEntitlementError:a5])
  {
    v12 = [(ITIdleTimerStateServer *)self delegate];
    [v12 removeIdleTimerConfigurationFromProcess:v11 forReason:v9];

    int v13 = [v8 _identifier];
    [(NSMutableDictionary *)self->_clientTargetsByConfigIdentifier removeObjectForKey:v13];
  }
  else
  {
    int v13 = ITLogIdleTimer();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      int v16 = 138543874;
      uint64_t v17 = v15;
      __int16 v18 = 2114;
      v19 = v11;
      __int16 v20 = 2114;
      id v21 = v8;
      _os_log_error_impl(&dword_210665000, v13, OS_LOG_TYPE_ERROR, "%{public}@ - Missing entitlement. Rejecting unauthorized access from %{public}@ to remove a configuration: %{public}@.", (uint8_t *)&v16, 0x20u);
    }
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  id v7 = [v6 remoteProcess];
  int v8 = [v7 pid];
  id v9 = ITLogIdleTimer();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ITIdleTimerStateServer listener:didReceiveConnection:withContext:]((uint64_t)v6, v8, v9);
  }

  if (v8 <= 0)
  {
    v10 = ITLogIdleTimer();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ITIdleTimerStateServer listener:didReceiveConnection:withContext:]((uint64_t)v6, v8, v10);
    }

    [v6 invalidate];
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke;
    v11[3] = &unk_2641331F0;
    int v14 = v8;
    id v12 = v7;
    int v13 = self;
    [v6 configureConnection:v11];
    [(ITIdleTimerStateServer *)self _addConnection:v6];
    [v6 activate];
  }
}

void __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = ITLogIdleTimer();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = [*(id *)(a1 + 32) bundleIdentifier];
    int v6 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v5;
    __int16 v21 = 1024;
    int v22 = v6;
    _os_log_impl(&dword_210665000, v4, OS_LOG_TYPE_DEFAULT, "configuring connection from client bundleID: %{public}@, pid:%d", buf, 0x12u);
  }
  id v7 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26C2907F8];
  int v8 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26C290BA0];
  id v9 = [MEMORY[0x263F2B9E8] interfaceWithServer:v7 client:v8];
  v10 = [MEMORY[0x263F2B9F0] utility];
  [v3 setServiceQuality:v10];

  [v3 setInterface:v9];
  [v3 setInterfaceTarget:*(void *)(a1 + 40)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 40) + 16)];
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_62;
  v15[3] = &unk_2641331C8;
  id v16 = *(id *)(a1 + 32);
  int v18 = *(_DWORD *)(a1 + 48);
  objc_copyWeak(&v17, (id *)buf);
  [v3 setInterruptionHandler:v15];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_64;
  v11[3] = &unk_2641331C8;
  id v12 = *(id *)(a1 + 32);
  int v14 = *(_DWORD *)(a1 + 48);
  objc_copyWeak(&v13, (id *)buf);
  [v3 setInvalidationHandler:v11];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_62(uint64_t a1)
{
  v2 = ITLogIdleTimer();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_62_cold_1(a1);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    char v5 = [WeakRetained delegate];
    [v5 clientDidDisconnect:*(void *)(a1 + 32)];
  }
}

void __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_64(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = ITLogIdleTimer();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_64_cold_1(a1);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained delegate];
    [v7 clientDidDisconnect:*(void *)(a1 + 32)];

    [v6 _removeConnection:v3];
  }
}

- (void)_addConnection:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  [(NSMutableSet *)self->_connections addObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)_removeConnection:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  [(NSMutableSet *)self->_connections removeObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientTargetsByConfigIdentifier, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(int)a2 withContext:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_210665000, log, OS_LOG_TYPE_ERROR, "dropping connection with junk pid (%d) -- %{public}@, ", (uint8_t *)v3, 0x12u);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(int)a2 withContext:(os_log_t)log .cold.2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_debug_impl(&dword_210665000, log, OS_LOG_TYPE_DEBUG, "got a connection! -- %{public}@ pid:%d", (uint8_t *)&v3, 0x12u);
}

void __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_62_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) bundleIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_210665000, v2, v3, "interrupted connection from client bundleID: %{public}@, pid:%d", v4, v5, v6, v7, v8);
}

void __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_64_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) bundleIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_210665000, v2, v3, "invalidated connection from client bundleID: %{public}@, pid:%d", v4, v5, v6, v7, v8);
}

@end