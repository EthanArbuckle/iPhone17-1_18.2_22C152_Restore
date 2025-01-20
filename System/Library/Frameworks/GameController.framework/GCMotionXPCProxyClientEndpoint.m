@interface GCMotionXPCProxyClientEndpoint
- (BOOL)sensorsActive;
- (GCMotionXPCProxyClientEndpoint)init;
- (GCMotionXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialSensorsActive:(BOOL)a4;
- (NSObject)identifier;
- (void)_remoteEndpointSetSensorsActive:(BOOL)a3;
- (void)fetchObjectIdentifierWithReply:(id)a3;
- (void)invalidateConnection;
- (void)newSensorsActive:(BOOL)a3;
- (void)refreshSensorsActive;
- (void)setController:(id)a3;
- (void)setRemoteEndpoint:(id)a3 connection:(id)a4;
- (void)setSensorsActive:(BOOL)a3;
@end

@implementation GCMotionXPCProxyClientEndpoint

- (GCMotionXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialSensorsActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GCMotionXPCProxyClientEndpoint;
  v7 = [(GCMotionXPCProxyClientEndpoint *)&v12 init];
  if (v7)
  {
    if (gc_isInternalBuild())
    {
      v11 = getGCLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v6;
        __int16 v15 = 1024;
        BOOL v16 = v4;
        _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_INFO, "GCMotionXPCProxyClientEndpoint initWithIdentifier: %@ initialSensorsActive: %d", buf, 0x12u);
      }
    }
    uint64_t v8 = [v6 copyWithZone:0];
    identifier = v7->_identifier;
    v7->_identifier = v8;

    v7->_sensorsActive = v4;
  }

  return v7;
}

- (GCMotionXPCProxyClientEndpoint)init
{
  return 0;
}

- (void)setRemoteEndpoint:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  __int16 v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = __63__GCMotionXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke;
  v18 = &unk_26D22A9D0;
  objc_copyWeak(&v19, &location);
  v9 = (void *)MEMORY[0x223C6E420](&v15);
  v10 = objc_msgSend(v8, "addInterruptionHandler:", v9, v15, v16, v17, v18);
  id connectionInterruptionRegistration = self->_connectionInterruptionRegistration;
  self->_id connectionInterruptionRegistration = v10;

  objc_super v12 = [v8 addInvalidationHandler:v9];
  id connectionInvalidationRegistration = self->_connectionInvalidationRegistration;
  self->_id connectionInvalidationRegistration = v12;

  objc_storeStrong((id *)&self->_serverEndpoint, a3);
  if (gc_isInternalBuild())
  {
    id v14 = getGCLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[GCMotionXPCProxyClientEndpoint setRemoteEndpoint:connection:]();
    }
  }
  [(GCMotionXPCProxyClientEndpoint *)self refreshSensorsActive];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __63__GCMotionXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __63__GCMotionXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1();
      }
    }
    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

    v3 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    BOOL v4 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
  }
}

- (void)setController:(id)a3
{
}

- (void)setSensorsActive:(BOOL)a3
{
  self->_sensorsActive = a3;
  -[GCMotionXPCProxyRemoteServerEndpointInterface newSensorsActive:](self->_serverEndpoint, "newSensorsActive:");
}

- (void)_remoteEndpointSetSensorsActive:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v6 = [WeakRetained motion];
    [v6 willChangeValueForKey:@"sensorsActive"];

    self->_sensorsActive = a3;
    id v7 = [v8 motion];
    [v7 didChangeValueForKey:@"sensorsActive"];

    id WeakRetained = v8;
  }
}

- (void)newSensorsActive:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __51__GCMotionXPCProxyClientEndpoint_newSensorsActive___block_invoke;
  v3[3] = &unk_26D22B0A8;
  v3[4] = self;
  BOOL v4 = a3;
  _os_activity_initiate(&dword_220998000, "(Motion XPC Proxy Client Endpoint) New Sensors Active", OS_ACTIVITY_FLAG_DEFAULT, v3);
}

uint64_t __51__GCMotionXPCProxyClientEndpoint_newSensorsActive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _remoteEndpointSetSensorsActive:*(unsigned __int8 *)(a1 + 40)];
}

- (void)refreshSensorsActive
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __54__GCMotionXPCProxyClientEndpoint_refreshSensorsActive__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(Motion XPC Proxy Client Endpoint) Refresh Sensors Active", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __54__GCMotionXPCProxyClientEndpoint_refreshSensorsActive__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __54__GCMotionXPCProxyClientEndpoint_refreshSensorsActive__block_invoke_2;
  v4[3] = &unk_26D22B0D0;
  v4[4] = v1;
  return [v2 fetchSensorsActiveWithReply:v4];
}

uint64_t __54__GCMotionXPCProxyClientEndpoint_refreshSensorsActive__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _remoteEndpointSetSensorsActive:a2];
}

- (void)invalidateConnection
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __54__GCMotionXPCProxyClientEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(Motion XPC Proxy Client Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __54__GCMotionXPCProxyClientEndpoint_invalidateConnection__block_invoke(uint64_t a1)
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

- (void)fetchObjectIdentifierWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(GCMotionXPCProxyClientEndpoint *)self identifier];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 48, 1);
}

- (BOOL)sensorsActive
{
  return self->_sensorsActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong(&self->_connectionInterruptionRegistration, 0);
  objc_storeStrong((id *)&self->_serverEndpoint, 0);

  objc_destroyWeak((id *)&self->_controller);
}

- (void)setRemoteEndpoint:connection:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_220998000, v0, v1, "Server connection established for %@", v2, v3, v4, v5, v6);
}

void __63__GCMotionXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_220998000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
}

@end