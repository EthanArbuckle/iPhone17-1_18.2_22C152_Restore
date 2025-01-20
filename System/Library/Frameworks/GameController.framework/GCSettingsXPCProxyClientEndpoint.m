@interface GCSettingsXPCProxyClientEndpoint
- (GCSProfile)settingsProfile;
- (GCSettingsXPCProxyClientEndpoint)init;
- (GCSettingsXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialValueForProfile:(id)a4;
- (NSObject)identifier;
- (id)changedHandler;
- (void)_remoteEndpointHasSetProfile:(id)a3;
- (void)fetchObjectIdentifierWithReply:(id)a3;
- (void)invalidateConnection;
- (void)newProfile:(id)a3;
- (void)refreshProfile;
- (void)setChangedHandler:(id)a3;
- (void)setController:(id)a3;
- (void)setRemoteEndpoint:(id)a3 connection:(id)a4;
@end

@implementation GCSettingsXPCProxyClientEndpoint

- (GCSettingsXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialValueForProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GCSettingsXPCProxyClientEndpoint;
  v8 = [(GCSettingsXPCProxyClientEndpoint *)&v13 init];
  if (v8)
  {
    v9 = getGCSettingsLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "GCSettingsXPCProxyClientEndpoint initWithIdentifier: %@ initialProfile: %@", buf, 0x16u);
    }

    uint64_t v10 = [v6 copyWithZone:0];
    identifier = v8->_identifier;
    v8->_identifier = v10;

    objc_storeStrong((id *)&v8->_settingsProfile, a4);
  }

  return v8;
}

- (GCSettingsXPCProxyClientEndpoint)init
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
  id v17 = __65__GCSettingsXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke;
  v18 = &unk_26D22A9D0;
  objc_copyWeak(&v19, &location);
  v9 = (void *)MEMORY[0x223C6E420](&v15);
  uint64_t v10 = objc_msgSend(v8, "addInterruptionHandler:", v9, v15, v16, v17, v18);
  id connectionInterruptionRegistration = self->_connectionInterruptionRegistration;
  self->_id connectionInterruptionRegistration = v10;

  v12 = [v8 addInvalidationHandler:v9];
  id connectionInvalidationRegistration = self->_connectionInvalidationRegistration;
  self->_id connectionInvalidationRegistration = v12;

  objc_storeStrong((id *)&self->_serverEndpoint, a3);
  v14 = getGCSettingsLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[GCSettingsXPCProxyClientEndpoint setRemoteEndpoint:connection:]();
  }

  [(GCSettingsXPCProxyClientEndpoint *)self refreshProfile];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __65__GCSettingsXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = getGCSettingsLogger();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __65__GCSettingsXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1();
    }

    v3 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

    v4 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    v5 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
  }
}

- (void)setController:(id)a3
{
}

- (void)_remoteEndpointHasSetProfile:(id)a3
{
  id v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __65__GCSettingsXPCProxyClientEndpoint__remoteEndpointHasSetProfile___block_invoke;
  block[3] = &unk_26D22B618;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = WeakRetained;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t __65__GCSettingsXPCProxyClientEndpoint__remoteEndpointHasSetProfile___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"settingsProfile"];
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 48), *(id *)(a1 + 48));
  [*(id *)(a1 + 32) didChangeValueForKey:@"settingsProfile"];
  uint64_t result = *(void *)(*(void *)(a1 + 40) + 56);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)newProfile:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __47__GCSettingsXPCProxyClientEndpoint_newProfile___block_invoke;
  v4[3] = &unk_26D22A8E8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_220998000, "(Settings XPC Proxy Client Endpoint) New Profile", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

uint64_t __47__GCSettingsXPCProxyClientEndpoint_newProfile___block_invoke(uint64_t a1)
{
  v2 = getGCSettingsLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_220998000, v2, OS_LOG_TYPE_INFO, "(Settings XPC Proxy Client Endpoint) New Profile", v4, 2u);
  }

  return [*(id *)(a1 + 32) _remoteEndpointHasSetProfile:*(void *)(a1 + 40)];
}

- (void)refreshProfile
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __50__GCSettingsXPCProxyClientEndpoint_refreshProfile__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_void block[4] = self;
  _os_activity_initiate(&dword_220998000, "(Settings XPC Proxy Client Endpoint) Refresh Profile", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __50__GCSettingsXPCProxyClientEndpoint_refreshProfile__block_invoke(uint64_t a1)
{
  v2 = getGCSettingsLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_220998000, v2, OS_LOG_TYPE_INFO, "(Settings XPC Proxy Client Endpoint) Refresh Profile", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __50__GCSettingsXPCProxyClientEndpoint_refreshProfile__block_invoke_86;
  v6[3] = &unk_26D22C3A8;
  v6[4] = v3;
  return [v4 fetchProfileWithReply:v6];
}

uint64_t __50__GCSettingsXPCProxyClientEndpoint_refreshProfile__block_invoke_86(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _remoteEndpointHasSetProfile:a2];
}

- (void)invalidateConnection
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __56__GCSettingsXPCProxyClientEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_void block[4] = self;
  _os_activity_initiate(&dword_220998000, "(Settings XPC Proxy Client Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __56__GCSettingsXPCProxyClientEndpoint_invalidateConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
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
  id v6 = [(GCSettingsXPCProxyClientEndpoint *)self identifier];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (GCSProfile)settingsProfile
{
  return self->_settingsProfile;
}

- (id)changedHandler
{
  return self->_changedHandler;
}

- (void)setChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changedHandler, 0);
  objc_storeStrong((id *)&self->_settingsProfile, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong(&self->_connectionInterruptionRegistration, 0);
  objc_storeStrong((id *)&self->_serverEndpoint, 0);

  objc_destroyWeak((id *)&self->_controller);
}

- (void)setRemoteEndpoint:connection:.cold.1()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_17(&dword_220998000, v0, v1, "Server connection established for %@", v2, v3, v4, v5, v6);
}

void __65__GCSettingsXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_17(&dword_220998000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
}

@end