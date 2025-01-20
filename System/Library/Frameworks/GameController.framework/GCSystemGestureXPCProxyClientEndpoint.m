@interface GCSystemGestureXPCProxyClientEndpoint
- (BOOL)isSystemGestureObserver;
- (GCSystemGestureXPCProxyClientEndpoint)init;
- (GCSystemGestureXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialSystemGesture:(id)a4 isSystemGestureObserver:(BOOL)a5;
- (GCSystemGesturesState)systemGesturesState;
- (NSObject)identifier;
- (void)_remoteEndpointHasSetSystemGesturesState:(id)a3;
- (void)disableSystemGestureForInput:(id)a3;
- (void)enableSystemGestureForInput:(id)a3;
- (void)fetchObjectIdentifierWithReply:(id)a3;
- (void)invalidateConnection;
- (void)newSystemGesturesState:(id)a3;
- (void)refreshSystemGesturesState;
- (void)setController:(id)a3;
- (void)setRemoteEndpoint:(id)a3 connection:(id)a4;
@end

@implementation GCSystemGestureXPCProxyClientEndpoint

- (GCSystemGestureXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialSystemGesture:(id)a4 isSystemGestureObserver:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GCSystemGestureXPCProxyClientEndpoint;
  v10 = [(GCSystemGestureXPCProxyClientEndpoint *)&v15 init];
  if (v10)
  {
    if (gc_isInternalBuild())
    {
      v14 = getGCLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = v8;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_impl(&dword_220998000, v14, OS_LOG_TYPE_INFO, "GCSystemGestureXPCProxyClientEndpoint initWithIdentifier: %@ initialSystemGesture: %@", buf, 0x16u);
      }
    }
    uint64_t v11 = [v8 copyWithZone:0];
    identifier = v10->_identifier;
    v10->_identifier = v11;

    objc_storeStrong((id *)&v10->_systemGesturesState, a4);
    v10->_isSystemGestureObserver = a5;
  }

  return v10;
}

- (GCSystemGestureXPCProxyClientEndpoint)init
{
  return 0;
}

- (void)setRemoteEndpoint:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  objc_super v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = __70__GCSystemGestureXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke;
  __int16 v18 = &unk_26D22A9D0;
  objc_copyWeak(&v19, &location);
  id v9 = (void *)MEMORY[0x223C6E420](&v15);
  v10 = objc_msgSend(v8, "addInterruptionHandler:", v9, v15, v16, v17, v18);
  id connectionInterruptionRegistration = self->_connectionInterruptionRegistration;
  self->_id connectionInterruptionRegistration = v10;

  v12 = [v8 addInvalidationHandler:v9];
  id connectionInvalidationRegistration = self->_connectionInvalidationRegistration;
  self->_id connectionInvalidationRegistration = v12;

  objc_storeStrong((id *)&self->_serverEndpoint, a3);
  if (gc_isInternalBuild())
  {
    v14 = getGCLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[GCSystemGestureXPCProxyClientEndpoint setRemoteEndpoint:connection:]();
    }
  }
  [(GCSystemGestureXPCProxyClientEndpoint *)self refreshSystemGesturesState];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __70__GCSystemGestureXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __70__GCSystemGestureXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1();
      }
    }
    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

    v3 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    v4 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
  }
}

- (void)setController:(id)a3
{
}

- (void)_remoteEndpointHasSetSystemGesturesState:(id)a3
{
  v4 = (GCSystemGesturesState *)a3;
  if (gc_isInternalBuild())
  {
    v6 = getGCLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_220998000, v6, OS_LOG_TYPE_DEFAULT, "_remoteEndpointHasSetSystemGesturesState: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [(GCSystemGestureXPCProxyClientEndpoint *)self willChangeValueForKey:@"systemGesturesState"];
  systemGesturesState = self->_systemGesturesState;
  self->_systemGesturesState = v4;

  [(GCSystemGestureXPCProxyClientEndpoint *)self didChangeValueForKey:@"systemGesturesState"];
}

- (void)newSystemGesturesState:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_isSystemGestureObserver)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __64__GCSystemGestureXPCProxyClientEndpoint_newSystemGesturesState___block_invoke;
    v6[3] = &unk_26D22A8E8;
    v6[4] = self;
    id v7 = v4;
    _os_activity_initiate(&dword_220998000, "(SystemGesture XPC Proxy Client Endpoint) New GCSystemGesturesState", OS_ACTIVITY_FLAG_DEFAULT, v6);
  }
}

uint64_t __64__GCSystemGestureXPCProxyClientEndpoint_newSystemGesturesState___block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "(SystemGesture XPC Proxy Client Endpoint) New GCSystemGesturesState", v4, 2u);
    }
  }
  return [*(id *)(a1 + 32) _remoteEndpointHasSetSystemGesturesState:*(void *)(a1 + 40)];
}

- (void)refreshSystemGesturesState
{
  if (self->_isSystemGestureObserver)
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = __67__GCSystemGestureXPCProxyClientEndpoint_refreshSystemGesturesState__block_invoke;
    activity_block[3] = &unk_26D22A8C0;
    activity_block[4] = self;
    _os_activity_initiate(&dword_220998000, "(SystemGesture XPC Proxy Client Endpoint) Refresh GCSystemGesturesState", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

uint64_t __67__GCSystemGestureXPCProxyClientEndpoint_refreshSystemGesturesState__block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_INFO, "(SystemGesture XPC Proxy Client Endpoint) Refresh GCSystemGesturesState", buf, 2u);
    }
  }
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __67__GCSystemGestureXPCProxyClientEndpoint_refreshSystemGesturesState__block_invoke_86;
  v6[3] = &unk_26D22CCA8;
  v6[4] = v2;
  return [v3 fetchSystemGesturesStateWithReply:v6];
}

uint64_t __67__GCSystemGestureXPCProxyClientEndpoint_refreshSystemGesturesState__block_invoke_86(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _remoteEndpointHasSetSystemGesturesState:a2];
}

- (void)invalidateConnection
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __61__GCSystemGestureXPCProxyClientEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(SystemGesture XPC Proxy Client Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __61__GCSystemGestureXPCProxyClientEndpoint_invalidateConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = 0;
}

- (BOOL)isSystemGestureObserver
{
  return self->_isSystemGestureObserver;
}

- (void)fetchObjectIdentifierWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(GCSystemGestureXPCProxyClientEndpoint *)self identifier];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)disableSystemGestureForInput:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_isSystemGestureObserver)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __70__GCSystemGestureXPCProxyClientEndpoint_disableSystemGestureForInput___block_invoke;
    v6[3] = &unk_26D22A8E8;
    v6[4] = self;
    id v7 = v4;
    _os_activity_initiate(&dword_220998000, "(SystemGesture XPC Proxy Client Endpoint) Disable system gesture for input name", OS_ACTIVITY_FLAG_DEFAULT, v6);
  }
}

uint64_t __70__GCSystemGestureXPCProxyClientEndpoint_disableSystemGestureForInput___block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "(SystemGesture XPC Proxy Client Endpoint) Disable system gesture for input name", v4, 2u);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 16) disableSystemGestureForInput:*(void *)(a1 + 40)];
}

- (void)enableSystemGestureForInput:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_isSystemGestureObserver)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __69__GCSystemGestureXPCProxyClientEndpoint_enableSystemGestureForInput___block_invoke;
    v6[3] = &unk_26D22A8E8;
    v6[4] = self;
    id v7 = v4;
    _os_activity_initiate(&dword_220998000, "(SystemGesture XPC Proxy Client Endpoint) Enable system gesture for input name", OS_ACTIVITY_FLAG_DEFAULT, v6);
  }
}

uint64_t __69__GCSystemGestureXPCProxyClientEndpoint_enableSystemGestureForInput___block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "(SystemGesture XPC Proxy Client Endpoint) Enable system gesture for input name", v4, 2u);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 16) enableSystemGestureForInput:*(void *)(a1 + 40)];
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 48, 1);
}

- (GCSystemGesturesState)systemGesturesState
{
  return self->_systemGesturesState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemGesturesState, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong(&self->_connectionInterruptionRegistration, 0);
  objc_storeStrong((id *)&self->_serverEndpoint, 0);

  objc_destroyWeak((id *)&self->_controller);
}

- (void)setRemoteEndpoint:connection:.cold.1()
{
  OUTLINED_FUNCTION_1_21();
  OUTLINED_FUNCTION_0_25(&dword_220998000, v0, v1, "Server connection established for %@", v2, v3, v4, v5, v6);
}

void __70__GCSystemGestureXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_21();
  OUTLINED_FUNCTION_0_25(&dword_220998000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
}

@end