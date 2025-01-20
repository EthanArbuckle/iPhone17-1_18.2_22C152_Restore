@interface GCAdaptiveTriggersXPCProxyClientEndpoint
- (GCAdaptiveTriggersXPCProxyClientEndpoint)init;
- (GCAdaptiveTriggersXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialStatuses:(id)a4;
- (GCDeviceAdaptiveTriggersPayload)leftTrigger;
- (GCDeviceAdaptiveTriggersPayload)rightTrigger;
- (GCDeviceAdaptiveTriggersStatusPayload)leftStatus;
- (GCDeviceAdaptiveTriggersStatusPayload)rightStatus;
- (NSObject)identifier;
- (void)_remoteEndpointHasSetStatuses:(id)a3;
- (void)fetchObjectIdentifierWithReply:(id)a3;
- (void)invalidateConnection;
- (void)newStatuses:(id)a3;
- (void)refreshStatuses;
- (void)setController:(id)a3;
- (void)setLeftStatus:(id)a3;
- (void)setLeftTrigger:(id)a3;
- (void)setRemoteEndpoint:(id)a3 connection:(id)a4;
- (void)setRightStatus:(id)a3;
- (void)setRightTrigger:(id)a3;
@end

@implementation GCAdaptiveTriggersXPCProxyClientEndpoint

- (GCAdaptiveTriggersXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialStatuses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)GCAdaptiveTriggersXPCProxyClientEndpoint;
  v8 = [(GCAdaptiveTriggersXPCProxyClientEndpoint *)&v21 init];
  if (v8)
  {
    if (gc_isInternalBuild())
    {
      v20 = getGCLogger();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v6;
        _os_log_impl(&dword_220998000, v20, OS_LOG_TYPE_INFO, "GCAdaptiveTriggersXPCProxyClientEndpoint initWithIdentifier: %@", buf, 0xCu);
      }
    }
    uint64_t v9 = [v6 copyWithZone:0];
    identifier = v8->_identifier;
    v8->_identifier = v9;

    v11 = [[GCDeviceAdaptiveTriggersPayload alloc] initOff];
    leftTrigger = v8->_leftTrigger;
    v8->_leftTrigger = v11;

    v13 = [[GCDeviceAdaptiveTriggersPayload alloc] initOff];
    rightTrigger = v8->_rightTrigger;
    v8->_rightTrigger = v13;

    if ((unint64_t)[v7 count] >= 2)
    {
      uint64_t v15 = [v7 objectAtIndexedSubscript:0];
      leftStatus = v8->_leftStatus;
      v8->_leftStatus = (GCDeviceAdaptiveTriggersStatusPayload *)v15;

      uint64_t v17 = [v7 objectAtIndexedSubscript:1];
      rightStatus = v8->_rightStatus;
      v8->_rightStatus = (GCDeviceAdaptiveTriggersStatusPayload *)v17;
    }
  }

  return v8;
}

- (GCAdaptiveTriggersXPCProxyClientEndpoint)init
{
  return 0;
}

- (void)setRemoteEndpoint:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  uint64_t v17 = __73__GCAdaptiveTriggersXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke;
  v18 = &unk_26D22A9D0;
  objc_copyWeak(&v19, &location);
  uint64_t v9 = (void *)MEMORY[0x223C6E420](&v15);
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
      -[GCAdaptiveTriggersXPCProxyClientEndpoint setRemoteEndpoint:connection:]();
    }
  }
  [(GCAdaptiveTriggersXPCProxyClientEndpoint *)self refreshStatuses];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __73__GCAdaptiveTriggersXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __73__GCAdaptiveTriggersXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1();
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

- (void)setLeftTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_leftTrigger, a3);
  id v5 = a3;
  [(GCAdaptiveTriggersXPCProxyRemoteServerEndpointInterface *)self->_serverEndpoint newAdaptiveTriggerPayload:self->_leftTrigger index:0];
}

- (void)setRightTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_rightTrigger, a3);
  id v5 = a3;
  [(GCAdaptiveTriggersXPCProxyRemoteServerEndpointInterface *)self->_serverEndpoint newAdaptiveTriggerPayload:self->_rightTrigger index:1];
}

- (void)_remoteEndpointHasSetStatuses:(id)a3
{
  id v4 = a3;
  if (gc_isInternalBuild())
  {
    id v7 = getGCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_INFO, "_remoteEndpointHasSetStatuses: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  if ((unint64_t)[v4 count] >= 2)
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    [(GCAdaptiveTriggersXPCProxyClientEndpoint *)self setLeftStatus:v5];

    id v6 = [v4 objectAtIndexedSubscript:1];
    [(GCAdaptiveTriggersXPCProxyClientEndpoint *)self setRightStatus:v6];
  }
}

- (void)newStatuses:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __56__GCAdaptiveTriggersXPCProxyClientEndpoint_newStatuses___block_invoke;
  v4[3] = &unk_26D22A8E8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_220998000, "(Adaptive Trigger XPC Proxy Client Endpoint) New Statuses", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

uint64_t __56__GCAdaptiveTriggersXPCProxyClientEndpoint_newStatuses___block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    id v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "(Adaptive Trigger XPC Proxy Client Endpoint) New Statuses", v4, 2u);
    }
  }
  return [*(id *)(a1 + 32) _remoteEndpointHasSetStatuses:*(void *)(a1 + 40)];
}

- (void)refreshStatuses
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __59__GCAdaptiveTriggersXPCProxyClientEndpoint_refreshStatuses__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(Adaptive Trigger XPC Proxy Client Endpoint) Refresh Statuses", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __59__GCAdaptiveTriggersXPCProxyClientEndpoint_refreshStatuses__block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    id v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_INFO, "(Adaptive Trigger XPC Proxy Client Endpoint) Refresh Statuses", buf, 2u);
    }
  }
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __59__GCAdaptiveTriggersXPCProxyClientEndpoint_refreshStatuses__block_invoke_83;
  v6[3] = &unk_26D22C6E0;
  v6[4] = v2;
  return [v3 fetchStatusesWithReply:v6];
}

uint64_t __59__GCAdaptiveTriggersXPCProxyClientEndpoint_refreshStatuses__block_invoke_83(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _remoteEndpointHasSetStatuses:a2];
}

- (void)invalidateConnection
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __64__GCAdaptiveTriggersXPCProxyClientEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(Adaptive Trigger XPC Proxy Client Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __64__GCAdaptiveTriggersXPCProxyClientEndpoint_invalidateConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = 0;
}

- (void)fetchObjectIdentifierWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(GCAdaptiveTriggersXPCProxyClientEndpoint *)self identifier];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (GCDeviceAdaptiveTriggersPayload)leftTrigger
{
  return self->_leftTrigger;
}

- (GCDeviceAdaptiveTriggersPayload)rightTrigger
{
  return self->_rightTrigger;
}

- (GCDeviceAdaptiveTriggersStatusPayload)leftStatus
{
  return self->_leftStatus;
}

- (void)setLeftStatus:(id)a3
{
}

- (GCDeviceAdaptiveTriggersStatusPayload)rightStatus
{
  return self->_rightStatus;
}

- (void)setRightStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightStatus, 0);
  objc_storeStrong((id *)&self->_leftStatus, 0);
  objc_storeStrong((id *)&self->_rightTrigger, 0);
  objc_storeStrong((id *)&self->_leftTrigger, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong(&self->_connectionInterruptionRegistration, 0);
  objc_storeStrong((id *)&self->_serverEndpoint, 0);

  objc_destroyWeak((id *)&self->_controller);
}

- (void)setRemoteEndpoint:connection:.cold.1()
{
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_0_22(&dword_220998000, v0, v1, "Server connection established for %@", v2, v3, v4, v5, v6);
}

void __73__GCAdaptiveTriggersXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_0_22(&dword_220998000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
}

@end