@interface GCMotionXPCProxyServerEndpoint
- (BOOL)acceptClient:(id)a3 onConnection:(id)a4 error:(id *)a5;
- (BOOL)sensorsActive;
- (GCMotionXPCProxyServerEndpoint)initWithIdentifier:(id)a3 initialValue:(BOOL)a4;
- (GCMotionXPCProxyServerEndpoint)initWithInitialValue:(BOOL)a3;
- (GCMotionXPCProxyServerEndpointDelegate)delegate;
- (NSObject)identifier;
- (_GCControllerComponentDescription)receiverDescription;
- (id)userInfo;
- (void)fetchObjectIdentifierWithReply:(id)a3;
- (void)fetchSensorsActiveWithReply:(id)a3;
- (void)invalidateClient;
- (void)invalidateConnection;
- (void)newSensorsActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setSensorsActive:(BOOL)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation GCMotionXPCProxyServerEndpoint

- (GCMotionXPCProxyServerEndpoint)initWithIdentifier:(id)a3 initialValue:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCMotionXPCProxyServerEndpoint;
  v7 = [(GCMotionXPCProxyServerEndpoint *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copyWithZone:0];
    identifier = v7->_identifier;
    v7->_identifier = v8;

    v7->_sensorsActive = a4;
  }

  return v7;
}

- (GCMotionXPCProxyServerEndpoint)initWithInitialValue:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSUUID UUID];
  id v6 = [(GCMotionXPCProxyServerEndpoint *)self initWithIdentifier:v5 initialValue:v3];

  return v6;
}

- (_GCControllerComponentDescription)receiverDescription
{
  v2 = [[GCMotionXPCProxyClientEndpointDescription alloc] initWithIdentifier:self->_identifier initialSensorsActive:self->_sensorsActive];

  return (_GCControllerComponentDescription *)v2;
}

- (void)invalidateClient
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_220998000, v0, v1, "Dropping remote endpoint for %@", v2, v3, v4, v5, v6);
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
  v23 = __66__GCMotionXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke;
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
      -[GCMotionXPCProxyServerEndpoint acceptClient:onConnection:error:]();
    }
  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return 1;
}

void __66__GCMotionXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __66__GCMotionXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1();
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

- (void)setSensorsActive:(BOOL)a3
{
  if (self->_sensorsActive != a3)
  {
    self->_sensorsActive = a3;
    uint64_t v4 = self->_clientEndpoint;
    if (v4)
    {
      unint64_t v5 = self->_pendingUpdates + 1;
      self->_pendingUpdates = v5;
      if (v5 <= 6)
      {
        int isInternalBuild = gc_isInternalBuild();
        if (v5 == 6)
        {
          if (isInternalBuild)
          {
            id v8 = getGCLogger();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
              -[GCMotionXPCProxyServerEndpoint setSensorsActive:]();
            }
          }
          [(GCMotionXPCProxyRemoteClientEndpointInterface *)v4 refreshSensorsActive];
        }
        else
        {
          if (isInternalBuild)
          {
            id v9 = getGCLogger();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
              -[GCMotionXPCProxyServerEndpoint setSensorsActive:]();
            }
          }
          [(GCMotionXPCProxyRemoteClientEndpointInterface *)v4 newSensorsActive:self->_sensorsActive];
          if (self->_pendingUpdates == 3)
          {
            connection = self->_connection;
            v10[0] = _NSConcreteStackBlock;
            v10[1] = 3221225472;
            v10[2] = __51__GCMotionXPCProxyServerEndpoint_setSensorsActive___block_invoke;
            v10[3] = &unk_26D22A8C0;
            v10[4] = self;
            [(_GCIPCEndpointConnection *)connection scheduleSendBarrierBlock:v10];
          }
        }
      }
    }
  }
}

uint64_t __51__GCMotionXPCProxyServerEndpoint_setSensorsActive___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

- (void)newSensorsActive:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __51__GCMotionXPCProxyServerEndpoint_newSensorsActive___block_invoke;
  v3[3] = &unk_26D22B0A8;
  BOOL v4 = a3;
  v3[4] = self;
  _os_activity_initiate(&dword_220998000, "(Motion XPC Proxy Server Endpoint) New Sensors Active", OS_ACTIVITY_FLAG_DEFAULT, v3);
}

void __51__GCMotionXPCProxyServerEndpoint_newSensorsActive___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 48))
  {
    *(unsigned char *)(v2 + 48) = v1;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [WeakRetained motionXPCProxyServerEndpoint:*(void *)(a1 + 32) didReceiveSensorsActiveChange:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)fetchSensorsActiveWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __62__GCMotionXPCProxyServerEndpoint_fetchSensorsActiveWithReply___block_invoke;
  v4[3] = &unk_26D22AA20;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_220998000, "(Motion XPC Proxy Server Endpoint) Fetch Sensors Active", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

uint64_t __62__GCMotionXPCProxyServerEndpoint_fetchSensorsActiveWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(*(void *)(a1 + 32) + 48));
}

- (void)invalidateConnection
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __54__GCMotionXPCProxyServerEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(Motion XPC Proxy Server Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __54__GCMotionXPCProxyServerEndpoint_invalidateConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
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
  id v6 = [(GCMotionXPCProxyServerEndpoint *)self identifier];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 56, 1);
}

- (BOOL)sensorsActive
{
  return self->_sensorsActive;
}

- (GCMotionXPCProxyServerEndpointDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GCMotionXPCProxyServerEndpointDelegate *)WeakRetained;
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
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_220998000, v0, v1, "Client has arrived for %@", v2, v3, v4, v5, v6);
}

void __66__GCMotionXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_220998000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
}

- (void)setSensorsActive:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_220998000, v0, v1, "Sending sensors active refresh request to remote endpoint: %@", v2, v3, v4, v5, v6);
}

- (void)setSensorsActive:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_220998000, v0, v1, "Sending new sensors active to remote endpoint: %@", v2, v3, v4, v5, v6);
}

@end