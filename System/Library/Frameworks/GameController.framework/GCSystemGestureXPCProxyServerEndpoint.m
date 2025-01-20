@interface GCSystemGestureXPCProxyServerEndpoint
- (BOOL)acceptClient:(id)a3 onConnection:(id)a4 error:(id *)a5;
- (BOOL)isSystemGestureObserver;
- (GCSystemGestureXPCProxyServerEndpoint)initWithIdentifier:(id)a3;
- (GCSystemGestureXPCProxyServerEndpointDelegate)delegate;
- (GCSystemGesturesState)systemGesturesState;
- (NSObject)identifier;
- (_GCControllerComponentDescription)receiverDescription;
- (id)initSystemGestureObserverWithIdentifier:(id)a3 initialValue:(id)a4;
- (id)initSystemGestureObserverWithInitialValue:(id)a3;
- (id)userInfo;
- (void)disableSystemGestureForInput:(id)a3;
- (void)enableSystemGestureForInput:(id)a3;
- (void)fetchObjectIdentifierWithReply:(id)a3;
- (void)fetchSystemGesturesStateWithReply:(id)a3;
- (void)invalidateClient;
- (void)invalidateConnection;
- (void)setDelegate:(id)a3;
- (void)setSystemGesturesState:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation GCSystemGestureXPCProxyServerEndpoint

- (GCSystemGestureXPCProxyServerEndpoint)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GCSystemGestureXPCProxyServerEndpoint;
  v5 = [(GCSystemGestureXPCProxyServerEndpoint *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_isSystemGestureObserver = 0;
    uint64_t v7 = [v4 copyWithZone:0];
    identifier = v6->_identifier;
    v6->_identifier = v7;

    v9 = objc_alloc_init(GCSystemGesturesState);
    systemGesturesState = v6->_systemGesturesState;
    v6->_systemGesturesState = v9;
  }
  return v6;
}

- (id)initSystemGestureObserverWithIdentifier:(id)a3 initialValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GCSystemGestureXPCProxyServerEndpoint;
  v8 = [(GCSystemGestureXPCProxyServerEndpoint *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_isSystemGestureObserver = 1;
    uint64_t v10 = [v6 copyWithZone:0];
    identifier = v9->_identifier;
    v9->_identifier = v10;

    objc_storeStrong((id *)&v9->_systemGesturesState, a4);
  }

  return v9;
}

- (id)initSystemGestureObserverWithInitialValue:(id)a3
{
  id v4 = a3;
  v5 = +[NSUUID UUID];
  id v6 = [(GCSystemGestureXPCProxyServerEndpoint *)self initSystemGestureObserverWithIdentifier:v5 initialValue:v4];

  return v6;
}

- (BOOL)isSystemGestureObserver
{
  return self->_isSystemGestureObserver;
}

- (_GCControllerComponentDescription)receiverDescription
{
  v2 = [[GCSystemGestureXPCProxyClientEndpointDescription alloc] initWithIdentifier:self->_identifier initialSystemGesture:self->_systemGesturesState isSystemGestureObserver:self->_isSystemGestureObserver];

  return (_GCControllerComponentDescription *)v2;
}

- (void)invalidateClient
{
  OUTLINED_FUNCTION_1_21();
  OUTLINED_FUNCTION_0_25(&dword_220998000, v0, v1, "Dropping remote endpoint for %@", v2, v3, v4, v5, v6);
}

- (BOOL)acceptClient:(id)a3 onConnection:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  id connectionInterruptionRegistration = self->_connectionInterruptionRegistration;
  self->_id connectionInterruptionRegistration = 0;

  id connectionInvalidationRegistration = self->_connectionInvalidationRegistration;
  self->_id connectionInvalidationRegistration = 0;

  connection = self->_connection;
  self->_connection = 0;

  clientEndpoint = self->_clientEndpoint;
  self->_clientEndpoint = 0;

  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  v23 = __73__GCSystemGestureXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke;
  v24 = &unk_26D22A9D0;
  objc_copyWeak(&v25, &location);
  v14 = (void *)MEMORY[0x223C6E420](&v21);
  v15 = objc_msgSend(v9, "addInterruptionHandler:", v14, v21, v22, v23, v24);
  id v16 = self->_connectionInterruptionRegistration;
  self->_id connectionInterruptionRegistration = v15;

  v17 = [v9 addInvalidationHandler:v14];
  id v18 = self->_connectionInvalidationRegistration;
  self->_id connectionInvalidationRegistration = v17;

  objc_storeStrong((id *)&self->_connection, a4);
  objc_storeStrong((id *)&self->_clientEndpoint, a3);
  self->_pendingUpdates = 0;
  if (gc_isInternalBuild())
  {
    v20 = getGCLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[GCSystemGestureXPCProxyServerEndpoint acceptClient:onConnection:error:]();
    }
  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return 1;
}

void __73__GCSystemGestureXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __73__GCSystemGestureXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1();
      }
    }
    uint64_t v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

    uint64_t v3 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    uint64_t v4 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

- (void)setSystemGesturesState:(id)a3
{
  uint64_t v5 = (GCSystemGesturesState *)a3;
  if (self->_systemGesturesState != v5)
  {
    objc_storeStrong((id *)&self->_systemGesturesState, a3);
    uint8_t v6 = self->_clientEndpoint;
    if (v6)
    {
      unint64_t v7 = self->_pendingUpdates + 1;
      self->_pendingUpdates = v7;
      if (v7 <= 6)
      {
        int isInternalBuild = gc_isInternalBuild();
        if (v7 == 6)
        {
          if (isInternalBuild)
          {
            uint64_t v10 = getGCLogger();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
              -[GCSystemGestureXPCProxyServerEndpoint setSystemGesturesState:]();
            }
          }
          [(GCSystemGestureXPCProxyRemoteClientEndpointInterface *)v6 refreshSystemGesturesState];
        }
        else
        {
          if (isInternalBuild)
          {
            v11 = getGCLogger();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
              -[GCSystemGestureXPCProxyServerEndpoint setSystemGesturesState:]();
            }
          }
          [(GCSystemGestureXPCProxyRemoteClientEndpointInterface *)v6 newSystemGesturesState:self->_systemGesturesState];
          if (self->_pendingUpdates == 3)
          {
            connection = self->_connection;
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472;
            v12[2] = __64__GCSystemGestureXPCProxyServerEndpoint_setSystemGesturesState___block_invoke;
            v12[3] = &unk_26D22A8C0;
            v12[4] = self;
            [(_GCIPCEndpointConnection *)connection scheduleSendBarrierBlock:v12];
          }
        }
      }
    }
  }
}

uint64_t __64__GCSystemGestureXPCProxyServerEndpoint_setSystemGesturesState___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

- (void)disableSystemGestureForInput:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __70__GCSystemGestureXPCProxyServerEndpoint_disableSystemGestureForInput___block_invoke;
  v4[3] = &unk_26D22A8E8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_220998000, "(SystemGesture XPC Proxy Server Endpoint) Disable system gesture with input name", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

void __70__GCSystemGestureXPCProxyServerEndpoint_disableSystemGestureForInput___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  [WeakRetained systemGestureXPCProxyServerEndpoint:*(void *)(a1 + 32) disableSystemGestureForInput:*(void *)(a1 + 40)];
}

- (void)enableSystemGestureForInput:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __69__GCSystemGestureXPCProxyServerEndpoint_enableSystemGestureForInput___block_invoke;
  v4[3] = &unk_26D22A8E8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_220998000, "(SystemGesture XPC Proxy Server Endpoint) Enable system gesture with input name", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

void __69__GCSystemGestureXPCProxyServerEndpoint_enableSystemGestureForInput___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  [WeakRetained systemGestureXPCProxyServerEndpoint:*(void *)(a1 + 32) enableSystemGestureForInput:*(void *)(a1 + 40)];
}

- (void)fetchSystemGesturesStateWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __75__GCSystemGestureXPCProxyServerEndpoint_fetchSystemGesturesStateWithReply___block_invoke;
  v4[3] = &unk_26D22AA20;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_220998000, "(SystemGesture XPC Proxy Server Endpoint) Fetch GCSystemGesturesState", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

uint64_t __75__GCSystemGestureXPCProxyServerEndpoint_fetchSystemGesturesStateWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 64));
}

- (void)invalidateConnection
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __61__GCSystemGestureXPCProxyServerEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(SystemGesture XPC Proxy Server Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __61__GCSystemGestureXPCProxyServerEndpoint_invalidateConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = 0;
}

- (void)fetchObjectIdentifierWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(GCSystemGestureXPCProxyServerEndpoint *)self identifier];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 56, 1);
}

- (GCSystemGesturesState)systemGesturesState
{
  return self->_systemGesturesState;
}

- (GCSystemGestureXPCProxyServerEndpointDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GCSystemGestureXPCProxyServerEndpointDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_systemGesturesState, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong(&self->_connectionInterruptionRegistration, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_clientEndpoint, 0);
}

- (void)acceptClient:onConnection:error:.cold.1()
{
  OUTLINED_FUNCTION_1_21();
  OUTLINED_FUNCTION_0_25(&dword_220998000, v0, v1, "Client has arrived for %@", v2, v3, v4, v5, v6);
}

void __73__GCSystemGestureXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_21();
  OUTLINED_FUNCTION_0_25(&dword_220998000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
}

- (void)setSystemGesturesState:.cold.1()
{
  OUTLINED_FUNCTION_1_21();
  OUTLINED_FUNCTION_0_25(&dword_220998000, v0, v1, "Sending systemGesture refresh request to remote endpoint: %@", v2, v3, v4, v5, v6);
}

- (void)setSystemGesturesState:.cold.2()
{
  OUTLINED_FUNCTION_1_21();
  OUTLINED_FUNCTION_0_25(&dword_220998000, v0, v1, "Sending new systemGesture to remote endpoint: %@", v2, v3, v4, v5, v6);
}

@end