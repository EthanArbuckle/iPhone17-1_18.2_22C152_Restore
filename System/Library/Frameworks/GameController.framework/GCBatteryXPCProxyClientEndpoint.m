@interface GCBatteryXPCProxyClientEndpoint
- (GCBatteryXPCProxyClientEndpoint)init;
- (GCBatteryXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialBattery:(id)a4;
- (GCDeviceBattery)battery;
- (NSObject)identifier;
- (void)_remoteEndpointHasSetBattery:(id)a3;
- (void)fetchObjectIdentifierWithReply:(id)a3;
- (void)invalidateConnection;
- (void)newBattery:(id)a3;
- (void)refreshBattery;
- (void)setController:(id)a3;
- (void)setRemoteEndpoint:(id)a3 connection:(id)a4;
@end

@implementation GCBatteryXPCProxyClientEndpoint

- (GCBatteryXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialBattery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GCBatteryXPCProxyClientEndpoint;
  v8 = [(GCBatteryXPCProxyClientEndpoint *)&v13 init];
  if (v8)
  {
    if (gc_isInternalBuild())
    {
      v12 = getGCLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v6;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_impl(&dword_220998000, v12, OS_LOG_TYPE_INFO, "GCBatteryXPCProxyClientEndpoint initWithIdentifier: %@ initialBattery: %@", buf, 0x16u);
      }
    }
    uint64_t v9 = [v6 copyWithZone:0];
    identifier = v8->_identifier;
    v8->_identifier = v9;

    objc_storeStrong((id *)&v8->_battery, a4);
  }

  return v8;
}

- (GCBatteryXPCProxyClientEndpoint)init
{
  return 0;
}

- (void)setRemoteEndpoint:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = __64__GCBatteryXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke;
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
      -[GCBatteryXPCProxyClientEndpoint setRemoteEndpoint:connection:]();
    }
  }
  [(GCBatteryXPCProxyClientEndpoint *)self refreshBattery];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __64__GCBatteryXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __64__GCBatteryXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1();
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

- (void)_remoteEndpointHasSetBattery:(id)a3
{
  id v4 = a3;
  if (gc_isInternalBuild())
  {
    id v7 = getGCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_DEFAULT, "_remoteEndpointHasSetBattery: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained willChangeValueForKey:@"battery"];
  battery = self->_battery;
  [v4 batteryLevel];
  -[GCDeviceBattery _setBatteryLevel:](battery, "_setBatteryLevel:");
  -[GCDeviceBattery _setBatteryState:](self->_battery, "_setBatteryState:", [v4 batteryState]);
  [WeakRetained didChangeValueForKey:@"battery"];
}

- (void)newBattery:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __46__GCBatteryXPCProxyClientEndpoint_newBattery___block_invoke;
  v4[3] = &unk_26D22A8E8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_220998000, "(Battery XPC Proxy Client Endpoint) New Battery", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

uint64_t __46__GCBatteryXPCProxyClientEndpoint_newBattery___block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    id v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "(Battery XPC Proxy Client Endpoint) New Battery", v4, 2u);
    }
  }
  return [*(id *)(a1 + 32) _remoteEndpointHasSetBattery:*(void *)(a1 + 40)];
}

- (void)refreshBattery
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __49__GCBatteryXPCProxyClientEndpoint_refreshBattery__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(Battery XPC Proxy Client Endpoint) Refresh Battery", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __49__GCBatteryXPCProxyClientEndpoint_refreshBattery__block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    id v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_INFO, "(Battery XPC Proxy Client Endpoint) Refresh Battery", buf, 2u);
    }
  }
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __49__GCBatteryXPCProxyClientEndpoint_refreshBattery__block_invoke_86;
  v6[3] = &unk_26D22A9F8;
  v6[4] = v2;
  return [v3 fetchBatteryWithReply:v6];
}

uint64_t __49__GCBatteryXPCProxyClientEndpoint_refreshBattery__block_invoke_86(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _remoteEndpointHasSetBattery:a2];
}

- (void)invalidateConnection
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __55__GCBatteryXPCProxyClientEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(Battery XPC Proxy Client Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __55__GCBatteryXPCProxyClientEndpoint_invalidateConnection__block_invoke(uint64_t a1)
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
  id v6 = [(GCBatteryXPCProxyClientEndpoint *)self identifier];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (GCDeviceBattery)battery
{
  return self->_battery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_battery, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong(&self->_connectionInterruptionRegistration, 0);
  objc_storeStrong((id *)&self->_serverEndpoint, 0);

  objc_destroyWeak((id *)&self->_controller);
}

- (void)setRemoteEndpoint:connection:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_220998000, v0, v1, "Server connection established for %@", v2, v3, v4, v5, v6);
}

void __64__GCBatteryXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_220998000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
}

@end