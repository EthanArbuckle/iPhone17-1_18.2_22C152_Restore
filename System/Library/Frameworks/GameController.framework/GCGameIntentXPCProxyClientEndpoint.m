@interface GCGameIntentXPCProxyClientEndpoint
- (GCGameIntentXPCProxyClientEndpoint)init;
- (GCGameIntentXPCProxyClientEndpoint)initWithIdentifier:(id)a3;
- (NSObject)identifier;
- (void)fetchObjectIdentifierWithReply:(id)a3;
- (void)invalidateConnection;
- (void)setController:(id)a3;
- (void)setRemoteEndpoint:(id)a3 connection:(id)a4;
- (void)triggerGestureGameIntentAppLibrary;
- (void)triggerGestureGameIntentGameCenter;
@end

@implementation GCGameIntentXPCProxyClientEndpoint

- (GCGameIntentXPCProxyClientEndpoint)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GCGameIntentXPCProxyClientEndpoint;
  v5 = [(GCGameIntentXPCProxyClientEndpoint *)&v10 init];
  if (v5)
  {
    if (gc_isInternalBuild())
    {
      v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "GCGameIntentXPCProxyClientEndpoint initWithIdentifier: %@", buf, 0xCu);
      }
    }
    uint64_t v6 = [v4 copyWithZone:0];
    identifier = v5->_identifier;
    v5->_identifier = v6;
  }
  return v5;
}

- (GCGameIntentXPCProxyClientEndpoint)init
{
  return 0;
}

- (void)setRemoteEndpoint:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = __67__GCGameIntentXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke;
  v18 = &unk_26D22A9D0;
  objc_copyWeak(&v19, &location);
  v9 = (void *)MEMORY[0x223C6E420](&v15);
  objc_super v10 = objc_msgSend(v8, "addInterruptionHandler:", v9, v15, v16, v17, v18);
  id connectionInterruptionRegistration = self->_connectionInterruptionRegistration;
  self->_id connectionInterruptionRegistration = v10;

  id v12 = [v8 addInvalidationHandler:v9];
  id connectionInvalidationRegistration = self->_connectionInvalidationRegistration;
  self->_id connectionInvalidationRegistration = v12;

  objc_storeStrong((id *)&self->_serverEndpoint, a3);
  if (gc_isInternalBuild())
  {
    v14 = getGCLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[GCGameIntentXPCProxyClientEndpoint setRemoteEndpoint:connection:]();
    }
  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __67__GCGameIntentXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __67__GCGameIntentXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1();
      }
    }
    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

    v3 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    id v4 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
  }
}

- (void)setController:(id)a3
{
}

- (void)invalidateConnection
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __58__GCGameIntentXPCProxyClientEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(GameIntent XPC Proxy Client Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __58__GCGameIntentXPCProxyClientEndpoint_invalidateConnection__block_invoke(uint64_t a1)
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
  id v6 = [(GCGameIntentXPCProxyClientEndpoint *)self identifier];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)triggerGestureGameIntentAppLibrary
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __72__GCGameIntentXPCProxyClientEndpoint_triggerGestureGameIntentAppLibrary__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(Game Intent XPC Proxy Client Endpoint) Trigger Game Intent App Library", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __72__GCGameIntentXPCProxyClientEndpoint_triggerGestureGameIntentAppLibrary__block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "(Game Intent XPC Proxy Client Endpoint) Trigger Game Intent App Library", v4, 2u);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 16) triggerGameIntentWithEvent:1];
}

- (void)triggerGestureGameIntentGameCenter
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __72__GCGameIntentXPCProxyClientEndpoint_triggerGestureGameIntentGameCenter__block_invoke;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_220998000, "(Game Intent XPC Proxy Client Endpoint) Trigger Game Intent Game Center", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __72__GCGameIntentXPCProxyClientEndpoint_triggerGestureGameIntentGameCenter__block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "(Game Intent XPC Proxy Client Endpoint) Trigger Game Intent Game Center", v4, 2u);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 16) triggerGameIntentWithEvent:3];
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 40, 1);
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
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_9(&dword_220998000, v0, v1, "Server connection established for %@", v2, v3, v4, v5, v6);
}

void __67__GCGameIntentXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_9(&dword_220998000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
}

@end