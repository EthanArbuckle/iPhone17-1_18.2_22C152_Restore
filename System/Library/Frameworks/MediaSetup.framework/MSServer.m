@interface MSServer
- (BOOL)_isConnectionEntitled:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MSServer)initWithMediator:(id)a3;
- (MSServerMediator)mediator;
- (NSMutableSet)connections;
- (void)_addConnection:(id)a3;
- (void)_initializeServer;
- (void)_removeConnection:(id)a3;
- (void)openConnection;
- (void)serviceSettingDidUpdate:(id)a3 homeUserID:(id)a4;
- (void)setConnections:(id)a3;
- (void)setMediator:(id)a3;
- (void)userDidRemoveService:(id)a3 homeUserID:(id)a4;
- (void)userDidUpdateDefaultService:(id)a3 homeUserID:(id)a4;
@end

@implementation MSServer

- (MSServer)initWithMediator:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSServer;
  v6 = [(MSServer *)&v10 init];
  if (v6)
  {
    v7 = _MSLogingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[MSServer initWithMediator:]";
      _os_log_impl(&dword_225D52000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_mediator, a3);
    [(MSServerMediator *)v6->_mediator setConnectionDelegate:v6];
    v8 = +[MSServiceUpdatedHandler shared];
    [v8 setDelegate:v6];

    [(MSServer *)v6 _initializeServer];
  }

  return v6;
}

- (void)_initializeServer
{
  v3 = (NSMutableSet *)objc_opt_new();
  connections = self->_connections;
  self->_connections = v3;

  id v5 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.mediasetupd.server"];
  serverListener = self->_serverListener;
  self->_serverListener = v5;

  [(NSXPCListener *)self->_serverListener setDelegate:self];
  v7 = self->_serverListener;

  [(NSXPCListener *)v7 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MSServer *)self _isConnectionEntitled:v7];
  BOOL v9 = v8;
  if (v8)
  {
    BOOL v57 = v8;
    [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D99B8E8];
    objc_super v10 = v58 = self;
    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    [v10 setClasses:v13 forSelector:sel_addMediaService_usingSetupBundles_completion_ argumentIndex:1 ofReply:0];

    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    v56 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:");
    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v55 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:");
    v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_msgSend(v20, "setWithObjects:", v21, v22, v23, v24, objc_opt_class(), 0);
    [v10 setClasses:v25 forSelector:sel_getResolvedServiceInfo_sharedUserID_completion_ argumentIndex:0 ofReply:1];
    v54 = (void *)v25;
    [v10 setClasses:v25 forSelector:sel_getResolvedServiceInfo_completion_ argumentIndex:0 ofReply:1];
    v26 = (void *)MEMORY[0x263EFFA08];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    v31 = objc_msgSend(v26, "setWithObjects:", v27, v28, v29, v30, objc_opt_class(), 0);
    [v10 setClasses:v31 forSelector:sel_getServiceConfigurationInfo_serviceID_completion_ argumentIndex:0 ofReply:1];
    v32 = (void *)MEMORY[0x263EFFA08];
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    [v10 setClasses:v34 forSelector:sel_getServiceConfigurationInfo_serviceID_completion_ argumentIndex:0 ofReply:0];

    [v10 setClasses:v31 forSelector:sel_getDefaultMediaServiceForAllUsers_ argumentIndex:0 ofReply:1];
    [v10 setClass:objc_opt_class() forSelector:sel_getCachedServiceInfo_homeUserID_endpointID_completion_ argumentIndex:0 ofReply:1];
    [v10 setClass:objc_opt_class() forSelector:sel_getDefaultMediaService_homeUserID_completion_ argumentIndex:0 ofReply:1];
    [v10 setClass:objc_opt_class() forSelector:sel_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion_ argumentIndex:0 ofReply:1];
    v35 = (void *)MEMORY[0x263EFFA08];
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    v38 = objc_msgSend(v35, "setWithObjects:", v36, v37, objc_opt_class(), 0);
    [v10 setClasses:v38 forSelector:sel_getPublicInfoForBundleID_completion_ argumentIndex:0 ofReply:1];

    v39 = (void *)MEMORY[0x263EFFA08];
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = objc_opt_class();
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = objc_opt_class();
    v44 = objc_msgSend(v39, "setWithObjects:", v40, v41, v42, v43, objc_opt_class(), 0);
    [v10 setClasses:v44 forSelector:sel_activeServiceApplicationInformationForSharedUserID_completionHandler_ argumentIndex:0 ofReply:1];

    v45 = (void *)MEMORY[0x263EFFA08];
    uint64_t v46 = objc_opt_class();
    v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    [v10 setClasses:v47 forSelector:sel_getSupportedThirdPartyMediaServices_ argumentIndex:0 ofReply:1];

    v48 = (void *)MEMORY[0x263EFFA08];
    uint64_t v49 = objc_opt_class();
    v50 = objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
    [v10 setClasses:v50 forSelector:sel_getMediaServiceChoicesForSharedUser_completion_ argumentIndex:0 ofReply:1];

    [v7 setExportedInterface:v10];
    [v7 setExportedObject:v58->_mediator];
    v51 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D982598];
    [v7 setRemoteObjectInterface:v51];

    objc_initWeak(location, v7);
    objc_initWeak(&from, v58);
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __47__MSServer_listener_shouldAcceptNewConnection___block_invoke;
    v63[3] = &unk_2647753A8;
    objc_copyWeak(&v64, &from);
    objc_copyWeak(&v65, location);
    [v7 setInterruptionHandler:v63];
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __47__MSServer_listener_shouldAcceptNewConnection___block_invoke_130;
    v60[3] = &unk_2647753A8;
    objc_copyWeak(&v61, &from);
    objc_copyWeak(&v62, location);
    [v7 setInvalidationHandler:v60];
    [v7 resume];
    v52 = _MSLogingFacility();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225D52000, v52, OS_LOG_TYPE_DEFAULT, "Connection accepted", buf, 2u);
    }

    objc_destroyWeak(&v62);
    objc_destroyWeak(&v61);
    objc_destroyWeak(&v65);
    objc_destroyWeak(&v64);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);

    BOOL v9 = v57;
  }
  else
  {
    objc_super v10 = _MSLogingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MSServer listener:shouldAcceptNewConnection:](v10);
    }
  }

  return v9;
}

void __47__MSServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = _MSLogingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_225D52000, v2, OS_LOG_TYPE_DEFAULT, "MSD Server Connection interrupted", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeConnection:v4];
}

void __47__MSServer_listener_shouldAcceptNewConnection___block_invoke_130(uint64_t a1)
{
  v2 = _MSLogingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_225D52000, v2, OS_LOG_TYPE_DEFAULT, "MSD Server Connection invalidated", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeConnection:v4];
}

- (void)openConnection
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08D68] currentConnection];
  id v4 = _MSLogingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_225D52000, v4, OS_LOG_TYPE_DEFAULT, "Registering client connection, %@", (uint8_t *)&v5, 0xCu);
  }

  [(MSServer *)self _addConnection:v3];
}

- (void)serviceSettingDidUpdate:(id)a3 homeUserID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MSServer *)self connections];
  objc_sync_enter(v8);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v9 = [(MSServer *)self connections];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = [*(id *)(*((void *)&v14 + 1) + 8 * v12) remoteObjectProxy];
        [v13 serviceSettingDidUpdate:v6 homeUserID:v7];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
  ICSiriPostDynamiteClientStateChangedNotification();
}

- (void)userDidRemoveService:(id)a3 homeUserID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MSServer *)self connections];
  objc_sync_enter(v8);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v9 = [(MSServer *)self connections];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = [*(id *)(*((void *)&v14 + 1) + 8 * v12) remoteObjectProxy];
        [v13 userDidRemoveService:v6 homeUserID:v7];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
  ICSiriPostDynamiteClientStateChangedNotification();
}

- (void)userDidUpdateDefaultService:(id)a3 homeUserID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MSServer *)self connections];
  objc_sync_enter(v8);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v9 = [(MSServer *)self connections];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = [*(id *)(*((void *)&v14 + 1) + 8 * v12) remoteObjectProxy];
        [v13 userDidUpdateDefaultService:v6 homeUserID:v7];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
  ICSiriPostDynamiteClientStateChangedNotification();
}

- (BOOL)_isConnectionEntitled:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForEntitlement:@"com.apple.mediasetupd.client"];
  char v5 = [v4 BOOLValue];

  id v6 = [v3 valueForEntitlement:@"com.apple.developer.mediasetup"];

  LOBYTE(v3) = [v6 BOOLValue];
  return v5 | v3;
}

- (void)_addConnection:(id)a3
{
  id v6 = a3;
  id v4 = [(MSServer *)self connections];
  objc_sync_enter(v4);
  char v5 = [(MSServer *)self connections];
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)_removeConnection:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(MSServer *)self connections];
  objc_sync_enter(v5);
  id v6 = [(MSServer *)self connections];
  [v6 removeObject:v4];

  id v7 = _MSLogingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_225D52000, v7, OS_LOG_TYPE_DEFAULT, "Removed Connection: (%@)", (uint8_t *)&v8, 0xCu);
  }

  objc_sync_exit(v5);
}

- (NSMutableSet)connections
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnections:(id)a3
{
}

- (MSServerMediator)mediator
{
  return self->_mediator;
}

- (void)setMediator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediator, 0);
  objc_storeStrong((id *)&self->_connections, 0);

  objc_storeStrong((id *)&self->_serverListener, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_225D52000, log, OS_LOG_TYPE_ERROR, "Missing required entitlement to connect to MediaSetup", v1, 2u);
}

@end