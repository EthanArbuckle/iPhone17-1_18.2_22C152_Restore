@interface CloudMediaServicesInterfaceXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CloudMediaServicesInterfaceProtocol)playbackCommandDelegate;
- (CloudMediaServicesInterfaceXPCListener)initWithDelegate:(id)a3;
- (NSMutableArray)clients;
- (void)getCloudExtensionConfigurationFor:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 withCompletion:(id)a6;
- (void)handleClientDisconnection:(id)a3;
- (void)pauseSample;
- (void)playSample:(id)a3;
- (void)sendPlaybackQueueToRemoteDestination:(id)a3 withCompletion:(id)a4;
- (void)sendPlaybackQueueWithUserActivityDictionary:(id)a3 forIntentID:(id)a4 toDestination:(id)a5 withIntentData:(id)a6 prepareQueue:(BOOL)a7 withCompletion:(id)a8;
- (void)setClients:(id)a3;
- (void)setOverrideURL:(id)a3;
- (void)setPlaybackCommandDelegate:(id)a3;
- (void)setServerEnvironment:(id)a3;
- (void)stopAnalyticsWithIdentifier:(id)a3;
- (void)submitAnalyticsForType:(id)a3 andIdentifier:(id)a4 eventType:(id)a5 atTime:(id)a6 withMetadata:(id)a7;
@end

@implementation CloudMediaServicesInterfaceXPCListener

- (CloudMediaServicesInterfaceXPCListener)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CloudMediaServicesInterfaceXPCListener;
  v5 = [(CloudMediaServicesInterfaceXPCListener *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.agora.server"];
    xpcListener = v5->_xpcListener;
    v5->_xpcListener = (NSXPCListener *)v6;

    [(NSXPCListener *)v5->_xpcListener setDelegate:v5];
    objc_storeWeak((id *)&v5->_playbackCommandDelegate, v4);
    uint64_t v8 = objc_opt_new();
    clients = v5->_clients;
    v5->_clients = (NSMutableArray *)v8;

    [(NSXPCListener *)v5->_xpcListener resume];
  }

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 valueForEntitlement:@"com.apple.agora.client"];
  char v9 = [v8 BOOLValue];

  if (v9)
  {
    id v19 = v6;
    v10 = +[CMSClient clientWithConnection:v7];
    objc_super v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DE66818];
    v12 = [v11 classesForSelector:sel_sendPlaybackQueueWithUserActivityDictionary_forIntentID_toDestination_withIntentData_prepareQueue_withCompletion_ argumentIndex:3 ofReply:0];
    v13 = (void *)[v12 mutableCopy];

    [v13 addObject:objc_opt_class()];
    [v11 setClasses:v13 forSelector:sel_sendPlaybackQueueWithUserActivityDictionary_forIntentID_toDestination_withIntentData_prepareQueue_withCompletion_ argumentIndex:3 ofReply:0];
    [v7 setExportedInterface:v11];
    [v7 setExportedObject:self];
    objc_initWeak(&location, self);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __77__CloudMediaServicesInterfaceXPCListener_listener_shouldAcceptNewConnection___block_invoke;
    v23[3] = &unk_264888938;
    objc_copyWeak(&v25, &location);
    id v14 = v7;
    id v24 = v14;
    [v14 setInterruptionHandler:v23];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __77__CloudMediaServicesInterfaceXPCListener_listener_shouldAcceptNewConnection___block_invoke_67;
    v20[3] = &unk_264888938;
    objc_copyWeak(&v22, &location);
    id v15 = v14;
    id v21 = v15;
    [v15 setInvalidationHandler:v20];
    v16 = [(CloudMediaServicesInterfaceXPCListener *)self clients];
    objc_sync_enter(v16);
    v17 = [(CloudMediaServicesInterfaceXPCListener *)self clients];
    [v17 addObject:v10];

    objc_sync_exit(v16);
    [v15 resume];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

    id v6 = v19;
  }
  else
  {
    v10 = _CMSILogingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CloudMediaServicesInterfaceXPCListener listener:shouldAcceptNewConnection:](v10);
    }
  }

  return v9;
}

void __77__CloudMediaServicesInterfaceXPCListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = _CMSILogingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22B0FF000, v2, OS_LOG_TYPE_DEFAULT, "Interruption Handler called", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleClientDisconnection:*(void *)(a1 + 32)];
}

void __77__CloudMediaServicesInterfaceXPCListener_listener_shouldAcceptNewConnection___block_invoke_67(uint64_t a1)
{
  v2 = _CMSILogingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22B0FF000, v2, OS_LOG_TYPE_DEFAULT, "Invalidation Handler called", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleClientDisconnection:*(void *)(a1 + 32)];
}

- (void)handleClientDisconnection:(id)a3
{
  id v4 = a3;
  v5 = [(CloudMediaServicesInterfaceXPCListener *)self clients];
  objc_sync_enter(v5);
  id v6 = [(CloudMediaServicesInterfaceXPCListener *)self clients];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__CloudMediaServicesInterfaceXPCListener_handleClientDisconnection___block_invoke;
  v10[3] = &unk_264888960;
  id v7 = v4;
  id v11 = v7;
  uint64_t v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  if (v8)
  {
    char v9 = [(CloudMediaServicesInterfaceXPCListener *)self clients];
    [v9 removeObject:v8];
  }
  objc_sync_exit(v5);
}

uint64_t __68__CloudMediaServicesInterfaceXPCListener_handleClientDisconnection___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 connection];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)playSample:(id)a3
{
  id v7 = a3;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    [v6 playSample:v7];
  }
}

- (void)sendPlaybackQueueToRemoteDestination:(id)a3 withCompletion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    [v9 sendPlaybackQueueToRemoteDestination:v10 withCompletion:v6];
  }
}

- (void)sendPlaybackQueueWithUserActivityDictionary:(id)a3 forIntentID:(id)a4 toDestination:(id)a5 withIntentData:(id)a6 prepareQueue:(BOOL)a7 withCompletion:(id)a8
{
  BOOL v9 = a7;
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    id v20 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    [v20 sendPlaybackQueueWithUserActivityDictionary:v21 forIntentID:v14 toDestination:v15 withIntentData:v16 prepareQueue:v9 withCompletion:v17];
  }
}

- (void)pauseSample
{
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackCommandDelegate);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    [v4 pauseSample];
  }
}

- (void)setServerEnvironment:(id)a3
{
  id v7 = a3;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    [v6 setServerEnvironment:v7];
  }
}

- (void)setOverrideURL:(id)a3
{
  id v7 = a3;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    [v6 setOverrideURL:v7];
  }
}

- (void)getCloudExtensionConfigurationFor:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 withCompletion:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    id v15 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    [v15 getCloudExtensionConfigurationFor:v16 homeUserID:v10 endpointID:v11 withCompletion:v12];
  }
}

- (void)submitAnalyticsForType:(id)a3 andIdentifier:(id)a4 eventType:(id)a5 atTime:(id)a6 withMetadata:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    id v18 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    [v18 submitAnalyticsForType:v19 andIdentifier:v12 eventType:v13 atTime:v14 withMetadata:v15];
  }
}

- (void)stopAnalyticsWithIdentifier:(id)a3
{
  id v7 = a3;
  p_playbackCommandDelegate = &self->_playbackCommandDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_playbackCommandDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_playbackCommandDelegate);
    [v6 stopAnalyticsWithIdentifier:v7];
  }
}

- (CloudMediaServicesInterfaceProtocol)playbackCommandDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackCommandDelegate);
  return (CloudMediaServicesInterfaceProtocol *)WeakRetained;
}

- (void)setPlaybackCommandDelegate:(id)a3
{
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_destroyWeak((id *)&self->_playbackCommandDelegate);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22B0FF000, log, OS_LOG_TYPE_ERROR, "Missing Required Entitlement to connect to CloudMediaServicesInterface Server", v1, 2u);
}

@end