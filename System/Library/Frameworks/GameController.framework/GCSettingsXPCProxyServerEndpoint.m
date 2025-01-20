@interface GCSettingsXPCProxyServerEndpoint
- (BOOL)acceptClient:(id)a3 onConnection:(id)a4 error:(id *)a5;
- (GCSProfile)settingsProfile;
- (GCSettingsXPCProxyServerEndpoint)initWithIdentifier:(id)a3 initialValueForProfile:(id)a4;
- (GCSettingsXPCProxyServerEndpoint)initWithInitialValueForProfile:(id)a3;
- (GCSettingsXPCProxyServerEndpointDelegate)delegate;
- (NSObject)identifier;
- (_GCControllerComponentDescription)receiverDescription;
- (id)userInfo;
- (void)fetchObjectIdentifierWithReply:(id)a3;
- (void)fetchProfileWithReply:(id)a3;
- (void)invalidateClient;
- (void)invalidateConnection;
- (void)setDelegate:(id)a3;
- (void)setSettingsProfile:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation GCSettingsXPCProxyServerEndpoint

- (GCSettingsXPCProxyServerEndpoint)initWithIdentifier:(id)a3 initialValueForProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GCSettingsXPCProxyServerEndpoint;
  v8 = [(GCSettingsXPCProxyServerEndpoint *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copyWithZone:0];
    identifier = v8->_identifier;
    v8->_identifier = v9;

    objc_storeStrong((id *)&v8->_settingsProfile, a4);
  }

  return v8;
}

- (GCSettingsXPCProxyServerEndpoint)initWithInitialValueForProfile:(id)a3
{
  id v4 = a3;
  v5 = +[NSUUID UUID];
  id v6 = [(GCSettingsXPCProxyServerEndpoint *)self initWithIdentifier:v5 initialValueForProfile:v4];

  return v6;
}

- (_GCControllerComponentDescription)receiverDescription
{
  v2 = [[GCSettingsXPCProxyClientEndpointDescription alloc] initWithIdentifier:self->_identifier initialValueForProfile:self->_settingsProfile];

  return (_GCControllerComponentDescription *)v2;
}

- (void)invalidateClient
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_17(&dword_220998000, v0, v1, "Dropping remote endpoint for %@", v2, v3, v4, v5, v6);
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
  v23 = __68__GCSettingsXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke;
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
  v19 = getGCSettingsLogger();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[GCSettingsXPCProxyServerEndpoint acceptClient:onConnection:error:]();
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return 1;
}

void __68__GCSettingsXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = getGCSettingsLogger();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __68__GCSettingsXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1();
    }

    uint64_t v3 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

    uint64_t v4 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    uint64_t v5 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

- (void)setSettingsProfile:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_settingsProfile, a3);
  uint8_t v6 = self->_clientEndpoint;
  if (v6)
  {
    unint64_t v7 = self->_pendingUpdates + 1;
    self->_pendingUpdates = v7;
    if (v7 <= 6)
    {
      id v8 = getGCSettingsLogger();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
      if (v7 == 6)
      {
        if (v9) {
          -[GCSettingsXPCProxyServerEndpoint setSettingsProfile:]();
        }

        [(GCSettingsXPCProxyRemoteClientEndpointInterface *)v6 refreshProfile];
      }
      else
      {
        if (v9) {
          -[GCSettingsXPCProxyServerEndpoint setSettingsProfile:]();
        }

        [(GCSettingsXPCProxyRemoteClientEndpointInterface *)v6 newProfile:v5];
        if (self->_pendingUpdates == 3)
        {
          connection = self->_connection;
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = __55__GCSettingsXPCProxyServerEndpoint_setSettingsProfile___block_invoke;
          v11[3] = &unk_26D22A8C0;
          v11[4] = self;
          [(_GCIPCEndpointConnection *)connection scheduleSendBarrierBlock:v11];
        }
      }
    }
  }
}

uint64_t __55__GCSettingsXPCProxyServerEndpoint_setSettingsProfile___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

- (void)fetchProfileWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __58__GCSettingsXPCProxyServerEndpoint_fetchProfileWithReply___block_invoke;
  v4[3] = &unk_26D22AA20;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_220998000, "(Settings XPC Proxy Server Endpoint) Fetch Profile", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

uint64_t __58__GCSettingsXPCProxyServerEndpoint_fetchProfileWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 56));
}

- (void)invalidateConnection
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __56__GCSettingsXPCProxyServerEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(Settings XPC Proxy Server Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __56__GCSettingsXPCProxyServerEndpoint_invalidateConnection__block_invoke(uint64_t a1)
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
  BOOL v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = 0;
}

- (void)fetchObjectIdentifierWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(GCSettingsXPCProxyServerEndpoint *)self identifier];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 48, 1);
}

- (GCSProfile)settingsProfile
{
  return self->_settingsProfile;
}

- (GCSettingsXPCProxyServerEndpointDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GCSettingsXPCProxyServerEndpointDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_settingsProfile, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong(&self->_connectionInterruptionRegistration, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_clientEndpoint, 0);
}

- (void)acceptClient:onConnection:error:.cold.1()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_17(&dword_220998000, v0, v1, "Client has arrived for %@", v2, v3, v4, v5, v6);
}

void __68__GCSettingsXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_17(&dword_220998000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
}

- (void)setSettingsProfile:.cold.1()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_17(&dword_220998000, v0, v1, "Sending settings refresh request to remote endpoint: %@", v2, v3, v4, v5, v6);
}

- (void)setSettingsProfile:.cold.2()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_17(&dword_220998000, v0, v1, "Sending new settings to remote endpoint: %@", v2, v3, v4, v5, v6);
}

@end