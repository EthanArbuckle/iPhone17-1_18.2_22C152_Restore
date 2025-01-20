@interface GCGameIntentXPCProxyServerEndpoint
- (BOOL)acceptClient:(id)a3 onConnection:(id)a4 error:(id *)a5;
- (GCGameIntentXPCProxyServerEndpoint)init;
- (GCGameIntentXPCProxyServerEndpoint)initWithIdentifier:(id)a3;
- (GCGameIntentXPCProxyServerEndpointDelegate)delegate;
- (NSObject)identifier;
- (_GCControllerComponentDescription)receiverDescription;
- (id)userInfo;
- (void)fetchObjectIdentifierWithReply:(id)a3;
- (void)invalidateClient;
- (void)invalidateConnection;
- (void)setDelegate:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)triggerGameIntentWithEvent:(int64_t)a3;
@end

@implementation GCGameIntentXPCProxyServerEndpoint

- (GCGameIntentXPCProxyServerEndpoint)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCGameIntentXPCProxyServerEndpoint;
  v5 = [(GCGameIntentXPCProxyServerEndpoint *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copyWithZone:0];
    identifier = v5->_identifier;
    v5->_identifier = v6;
  }
  return v5;
}

- (GCGameIntentXPCProxyServerEndpoint)init
{
  v3 = +[NSUUID UUID];
  id v4 = [(GCGameIntentXPCProxyServerEndpoint *)self initWithIdentifier:v3];

  return v4;
}

- (_GCControllerComponentDescription)receiverDescription
{
  v2 = [[GCGameIntentXPCProxyClientEndpointDescription alloc] initWithIdentifier:self->_identifier];

  return (_GCControllerComponentDescription *)v2;
}

- (void)triggerGameIntentWithEvent:(int64_t)a3
{
  id v5 = [(GCGameIntentXPCProxyServerEndpoint *)self delegate];
  [v5 gameIntentXPCProxyServerEndpoint:self didReceiveGameIntent:a3];
}

- (void)invalidateClient
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_9(&dword_220998000, v0, v1, "Dropping remote endpoint for %@", v2, v3, v4, v5, v6);
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
  v23 = __70__GCGameIntentXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke;
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
  if (gc_isInternalBuild())
  {
    v20 = getGCLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[GCGameIntentXPCProxyServerEndpoint acceptClient:onConnection:error:]();
    }
  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return 1;
}

void __70__GCGameIntentXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __70__GCGameIntentXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1();
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

- (void)invalidateConnection
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __58__GCGameIntentXPCProxyServerEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(GameIntent XPC Proxy Server Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __58__GCGameIntentXPCProxyServerEndpoint_invalidateConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = 0;
}

- (void)fetchObjectIdentifierWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(GCGameIntentXPCProxyServerEndpoint *)self identifier];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (GCGameIntentXPCProxyServerEndpointDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GCGameIntentXPCProxyServerEndpointDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong(&self->_connectionInterruptionRegistration, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_clientEndpoint, 0);
}

- (void)acceptClient:onConnection:error:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_9(&dword_220998000, v0, v1, "Client has arrived for %@", v2, v3, v4, v5, v6);
}

void __70__GCGameIntentXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_9(&dword_220998000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
}

@end