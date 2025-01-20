@interface GCAdaptiveTriggersXPCProxyServerEndpoint
- (BOOL)acceptClient:(id)a3 onConnection:(id)a4 error:(id *)a5;
- (GCAdaptiveTriggersXPCProxyServerEndpoint)initWithIdentifier:(id)a3 initialStatuses:(id)a4;
- (GCAdaptiveTriggersXPCProxyServerEndpoint)initWithInitialStatuses:(id)a3;
- (GCAdaptiveTriggersXPCProxyServerEndpointDelegate)delegate;
- (GCDeviceAdaptiveTriggersPayload)leftTrigger;
- (GCDeviceAdaptiveTriggersPayload)rightTrigger;
- (NSArray)statuses;
- (NSObject)identifier;
- (_GCControllerComponentDescription)receiverDescription;
- (id)userInfo;
- (void)fetchObjectIdentifierWithReply:(id)a3;
- (void)fetchStatusesWithReply:(id)a3;
- (void)invalidateClient;
- (void)invalidateConnection;
- (void)newAdaptiveTriggerPayload:(id)a3 index:(int)a4;
- (void)setDelegate:(id)a3;
- (void)setLeftTrigger:(id)a3;
- (void)setRightTrigger:(id)a3;
- (void)setStatuses:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation GCAdaptiveTriggersXPCProxyServerEndpoint

- (GCAdaptiveTriggersXPCProxyServerEndpoint)initWithIdentifier:(id)a3 initialStatuses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GCAdaptiveTriggersXPCProxyServerEndpoint;
  v8 = [(GCAdaptiveTriggersXPCProxyServerEndpoint *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copyWithZone:0];
    identifier = v8->_identifier;
    v8->_identifier = v9;

    v11 = [[GCDeviceAdaptiveTriggersPayload alloc] initOff];
    leftTrigger = v8->_leftTrigger;
    v8->_leftTrigger = v11;

    v13 = [[GCDeviceAdaptiveTriggersPayload alloc] initOff];
    rightTrigger = v8->_rightTrigger;
    v8->_rightTrigger = v13;

    objc_storeStrong((id *)&v8->_statuses, a4);
  }

  return v8;
}

- (GCAdaptiveTriggersXPCProxyServerEndpoint)initWithInitialStatuses:(id)a3
{
  id v4 = a3;
  v5 = +[NSUUID UUID];
  id v6 = [(GCAdaptiveTriggersXPCProxyServerEndpoint *)self initWithIdentifier:v5 initialStatuses:v4];

  return v6;
}

- (_GCControllerComponentDescription)receiverDescription
{
  v2 = [[GCAdaptiveTriggersXPCProxyClientEndpointDescription alloc] initWithIdentifier:self->_identifier initialStatuses:self->_statuses];

  return (_GCControllerComponentDescription *)v2;
}

- (void)invalidateClient
{
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_0_22(&dword_220998000, v0, v1, "Dropping remote endpoint for %@", v2, v3, v4, v5, v6);
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
  v23 = __76__GCAdaptiveTriggersXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke;
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
      -[GCAdaptiveTriggersXPCProxyServerEndpoint acceptClient:onConnection:error:]();
    }
  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return 1;
}

void __76__GCAdaptiveTriggersXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __76__GCAdaptiveTriggersXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1();
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

- (void)setStatuses:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToArray:self->_statuses] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_statuses, a3);
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
              -[GCAdaptiveTriggersXPCProxyServerEndpoint setStatuses:]();
            }
          }
          [(GCAdaptiveTriggersXPCProxyRemoteClientEndpointInterface *)v6 refreshStatuses];
        }
        else
        {
          if (isInternalBuild)
          {
            v11 = getGCLogger();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
              -[GCAdaptiveTriggersXPCProxyServerEndpoint setStatuses:]();
            }
          }
          [(GCAdaptiveTriggersXPCProxyRemoteClientEndpointInterface *)v6 newStatuses:self->_statuses];
          if (self->_pendingUpdates == 3)
          {
            connection = self->_connection;
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472;
            v12[2] = __56__GCAdaptiveTriggersXPCProxyServerEndpoint_setStatuses___block_invoke;
            v12[3] = &unk_26D22A8C0;
            v12[4] = self;
            [(_GCIPCEndpointConnection *)connection scheduleSendBarrierBlock:v12];
          }
        }
      }
    }
  }
}

uint64_t __56__GCAdaptiveTriggersXPCProxyServerEndpoint_setStatuses___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

- (void)fetchStatusesWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __67__GCAdaptiveTriggersXPCProxyServerEndpoint_fetchStatusesWithReply___block_invoke;
  v4[3] = &unk_26D22AA20;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_220998000, "(Adaptive Trigger XPC Proxy Server Endpoint) Fetch Statuses", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

uint64_t __67__GCAdaptiveTriggersXPCProxyServerEndpoint_fetchStatusesWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 72));
}

- (void)newAdaptiveTriggerPayload:(id)a3 index:(int)a4
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __76__GCAdaptiveTriggersXPCProxyServerEndpoint_newAdaptiveTriggerPayload_index___block_invoke;
  activity_block[3] = &unk_26D22C900;
  int v7 = a4;
  activity_block[4] = self;
  id v6 = a3;
  id v4 = v6;
  _os_activity_initiate(&dword_220998000, "(Adaptive Trigger XPC Proxy Server Endpoint) New Adaptive Trigger Payload", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __76__GCAdaptiveTriggersXPCProxyServerEndpoint_newAdaptiveTriggerPayload_index___block_invoke(uint64_t a1)
{
  uint64_t v2 = 56;
  if (*(_DWORD *)(a1 + 48) == 1) {
    uint64_t v2 = 64;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + v2), *(id *)(a1 + 40));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained adaptiveTriggersXPCProxyServerEndpoint:*(void *)(a1 + 32) didReceiveAdaptiveTriggersChange:*(void *)(a1 + 40) forIndex:*(unsigned int *)(a1 + 48)];
}

- (void)invalidateConnection
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __64__GCAdaptiveTriggersXPCProxyServerEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(Adaptive Trigger XPC Proxy Server Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __64__GCAdaptiveTriggersXPCProxyServerEndpoint_invalidateConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = 0;
}

- (void)fetchObjectIdentifierWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(GCAdaptiveTriggersXPCProxyServerEndpoint *)self identifier];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 48, 1);
}

- (GCDeviceAdaptiveTriggersPayload)leftTrigger
{
  return self->_leftTrigger;
}

- (void)setLeftTrigger:(id)a3
{
}

- (GCDeviceAdaptiveTriggersPayload)rightTrigger
{
  return self->_rightTrigger;
}

- (void)setRightTrigger:(id)a3
{
}

- (NSArray)statuses
{
  return self->_statuses;
}

- (GCAdaptiveTriggersXPCProxyServerEndpointDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GCAdaptiveTriggersXPCProxyServerEndpointDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_statuses, 0);
  objc_storeStrong((id *)&self->_rightTrigger, 0);
  objc_storeStrong((id *)&self->_leftTrigger, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong(&self->_connectionInterruptionRegistration, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_clientEndpoint, 0);
}

- (void)acceptClient:onConnection:error:.cold.1()
{
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_0_22(&dword_220998000, v0, v1, "Client has arrived for %@", v2, v3, v4, v5, v6);
}

void __76__GCAdaptiveTriggersXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_0_22(&dword_220998000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
}

- (void)setStatuses:.cold.1()
{
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_0_22(&dword_220998000, v0, v1, "Sending statuses refresh request to remote endpoint: %@", v2, v3, v4, v5, v6);
}

- (void)setStatuses:.cold.2()
{
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_0_22(&dword_220998000, v0, v1, "Sending new status to remote endpoint: %@", v2, v3, v4, v5, v6);
}

@end