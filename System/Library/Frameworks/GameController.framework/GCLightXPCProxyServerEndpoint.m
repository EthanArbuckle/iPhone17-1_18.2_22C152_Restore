@interface GCLightXPCProxyServerEndpoint
- (BOOL)acceptClient:(id)a3 onConnection:(id)a4 error:(id *)a5;
- (GCDeviceLight)light;
- (GCLightXPCProxyServerEndpoint)initWithIdentifier:(id)a3 initialValue:(id)a4;
- (GCLightXPCProxyServerEndpoint)initWithInitialValue:(id)a3;
- (GCLightXPCProxyServerEndpointDelegate)delegate;
- (NSObject)identifier;
- (_GCControllerComponentDescription)receiverDescription;
- (id)userInfo;
- (void)fetchLightWithReply:(id)a3;
- (void)fetchObjectIdentifierWithReply:(id)a3;
- (void)invalidateClient;
- (void)invalidateConnection;
- (void)newLight:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLight:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation GCLightXPCProxyServerEndpoint

- (GCLightXPCProxyServerEndpoint)initWithIdentifier:(id)a3 initialValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GCLightXPCProxyServerEndpoint;
  v8 = [(GCLightXPCProxyServerEndpoint *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copyWithZone:0];
    identifier = v8->_identifier;
    v8->_identifier = v9;

    objc_storeStrong((id *)&v8->_light, a4);
  }

  return v8;
}

- (GCLightXPCProxyServerEndpoint)initWithInitialValue:(id)a3
{
  id v4 = a3;
  v5 = +[NSUUID UUID];
  id v6 = [(GCLightXPCProxyServerEndpoint *)self initWithIdentifier:v5 initialValue:v4];

  return v6;
}

- (_GCControllerComponentDescription)receiverDescription
{
  v2 = [[GCLightXPCProxyClientEndpointDescription alloc] initWithIdentifier:self->_identifier initialLight:self->_light];

  return (_GCControllerComponentDescription *)v2;
}

- (void)invalidateClient
{
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_13(&dword_220998000, v0, v1, "Dropping remote endpoint for %@", v2, v3, v4, v5, v6);
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
  v23 = __65__GCLightXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke;
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
      -[GCLightXPCProxyServerEndpoint acceptClient:onConnection:error:]();
    }
  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return 1;
}

void __65__GCLightXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __65__GCLightXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1();
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

- (void)setLight:(id)a3
{
  uint64_t v5 = (GCDeviceLight *)a3;
  if (self->_light != v5)
  {
    objc_storeStrong((id *)&self->_light, a3);
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
            v10 = getGCLogger();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
              -[GCLightXPCProxyServerEndpoint setLight:]();
            }
          }
          [(GCLightXPCProxyRemoteClientEndpointInterface *)v6 refreshLight];
        }
        else
        {
          if (isInternalBuild)
          {
            v11 = getGCLogger();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
              -[GCLightXPCProxyServerEndpoint setLight:]();
            }
          }
          [(GCLightXPCProxyRemoteClientEndpointInterface *)v6 newLight:self->_light];
          if (self->_pendingUpdates == 3)
          {
            connection = self->_connection;
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472;
            v12[2] = __42__GCLightXPCProxyServerEndpoint_setLight___block_invoke;
            v12[3] = &unk_26D22A8C0;
            v12[4] = self;
            [(_GCIPCEndpointConnection *)connection scheduleSendBarrierBlock:v12];
          }
        }
      }
    }
  }
}

uint64_t __42__GCLightXPCProxyServerEndpoint_setLight___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

- (void)newLight:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __42__GCLightXPCProxyServerEndpoint_newLight___block_invoke;
  v5[3] = &unk_26D22A8E8;
  id v6 = a3;
  unint64_t v7 = self;
  id v4 = v6;
  _os_activity_initiate(&dword_220998000, "(Light XPC Proxy Server Endpoint) New Light", OS_ACTIVITY_FLAG_DEFAULT, v5);
}

void __42__GCLightXPCProxyServerEndpoint_newLight___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(v2 + 56);
  id v4 = (id *)(v2 + 56);
  if (v3 != v5)
  {
    objc_storeStrong(v4, v3);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
    [WeakRetained lightXPCProxyServerEndpoint:*(void *)(a1 + 40) didReceiveLightChange:*(void *)(a1 + 32)];
  }
}

- (void)fetchLightWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __53__GCLightXPCProxyServerEndpoint_fetchLightWithReply___block_invoke;
  v4[3] = &unk_26D22AA20;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_220998000, "(Light XPC Proxy Server Endpoint) Fetch Light", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

uint64_t __53__GCLightXPCProxyServerEndpoint_fetchLightWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 56));
}

- (void)invalidateConnection
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __53__GCLightXPCProxyServerEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(Light XPC Proxy Server Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __53__GCLightXPCProxyServerEndpoint_invalidateConnection__block_invoke(uint64_t a1)
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
  id v6 = [(GCLightXPCProxyServerEndpoint *)self identifier];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 48, 1);
}

- (GCDeviceLight)light
{
  return self->_light;
}

- (GCLightXPCProxyServerEndpointDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GCLightXPCProxyServerEndpointDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_light, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong(&self->_connectionInterruptionRegistration, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_clientEndpoint, 0);
}

- (void)acceptClient:onConnection:error:.cold.1()
{
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_13(&dword_220998000, v0, v1, "Client has arrived for %@", v2, v3, v4, v5, v6);
}

void __65__GCLightXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_13(&dword_220998000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
}

- (void)setLight:.cold.1()
{
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_13(&dword_220998000, v0, v1, "Sending light refresh request to remote endpoint: %@", v2, v3, v4, v5, v6);
}

- (void)setLight:.cold.2()
{
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_13(&dword_220998000, v0, v1, "Sending new light to remote endpoint: %@", v2, v3, v4, v5, v6);
}

@end