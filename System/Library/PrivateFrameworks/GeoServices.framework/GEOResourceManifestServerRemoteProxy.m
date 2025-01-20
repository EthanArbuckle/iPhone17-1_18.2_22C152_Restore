@interface GEOResourceManifestServerRemoteProxy
- (GEOActiveTileGroup)activeTileGroup;
- (GEOResourceManifestServerProxyDelegate)delegate;
- (GEOResourceManifestServerRemoteProxy)initWithDelegate:(id)a3 configuration:(id)a4;
- (id)authToken;
- (id)configuration;
- (id)serverQueue;
- (id)updateProgress;
- (unsigned)maximumZoomLevelForStyle:(int)a3 scale:(int)a4 outSize:(int *)a5;
- (void)_handleMessage:(id)a3 xpcMessage:(id)a4;
- (void)activateResourceName:(id)a3;
- (void)activateResourceScale:(int)a3;
- (void)activateResourceScenario:(int)a3;
- (void)deactivateResourceName:(id)a3;
- (void)deactivateResourceScale:(int)a3;
- (void)deactivateResourceScenario:(int)a3;
- (void)dealloc;
- (void)forceUpdate:(int64_t)a3 completionHandler:(id)a4;
- (void)getResourceManifestWithHandler:(id)a3;
- (void)openConnection;
- (void)resetActiveTileGroup;
- (void)setActiveTileGroupIdentifier:(id)a3;
- (void)setActiveTileGroupIdentifier:(id)a3 updateType:(int64_t)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setManifestToken:(id)a3 completionHandler:(id)a4;
- (void)updateIfNecessary:(id)a3;
@end

@implementation GEOResourceManifestServerRemoteProxy

- (GEOActiveTileGroup)activeTileGroup
{
  return 0;
}

- (void)forceUpdate:(int64_t)a3 completionHandler:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = +[GEONotificationPreferenceManager sharedManager];
  int v8 = [v7 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest_ForcedUpdate"];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"GEOPPTTest_Manifest_ForcedUpdateBEGIN" object:0];
  }
  v21[0] = @"message";
  v21[1] = @"userInfo";
  v22[0] = @"resourcemanifest.forceUpdate";
  v19 = @"type";
  v10 = [NSNumber numberWithInteger:a3];
  v20 = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v22[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpcConnection = self->_xpcConnection;
  v15 = [(GEOResourceManifestServerRemoteProxy *)self serverQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__GEOResourceManifestServerRemoteProxy_forceUpdate_completionHandler___block_invoke;
  v17[3] = &unk_1E53E13A8;
  id v18 = v6;
  id v16 = v6;
  [(GEOXPCConnection *)xpcConnection sendMessageReporingProgress:v13 withReply:v15 handler:v17];
}

- (id)serverQueue
{
  return self->_serverQueue;
}

- (GEOResourceManifestServerRemoteProxy)initWithDelegate:(id)a3 configuration:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)GEOResourceManifestServerRemoteProxy;
  int v8 = [(GEOResourceManifestServerRemoteProxy *)&v30 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_configuration, a4);
    uint64_t v10 = geo_isolater_create();
    maximumZoomLevelIsolation = v9->_maximumZoomLevelIsolation;
    v9->_maximumZoomLevelIsolation = (geo_isolater *)v10;

    snprintf(__str, 0xFFuLL, "com.apple.geo.ResourceManifest.%p", v9);
    uint64_t v12 = geo_dispatch_queue_create();
    serverQueue = v9->_serverQueue;
    v9->_serverQueue = (OS_dispatch_queue *)v12;

    v9->_authTokenLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v9);
    GEOActiveTileGroupChangedInternalDarwinNotificationName(v7);
    id v14 = objc_claimAutoreleasedReturnValue();
    v15 = (const char *)[v14 UTF8String];
    id v16 = v9->_serverQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __71__GEOResourceManifestServerRemoteProxy_initWithDelegate_configuration___block_invoke;
    handler[3] = &unk_1E53E2BA8;
    objc_copyWeak(&v28, &location);
    v17 = v9;
    v27 = v17;
    notify_register_dispatch(v15, &v9->_activeTileGroupChangedNotificationToken, v16, handler);

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __71__GEOResourceManifestServerRemoteProxy_initWithDelegate_configuration___block_invoke_4;
    v24[3] = &unk_1E53D7B90;
    objc_copyWeak(&v25, &location);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__GEOResourceManifestServerRemoteProxy_initWithDelegate_configuration___block_invoke_5;
    void v22[3] = &unk_1E53DF960;
    objc_copyWeak(&v23, &location);
    uint64_t v18 = +[GEOXPCConnection createServerConnectionFor:11 debugIdentifier:@"ResourceManifest" queue:0 reconnectBlock:v24 eventHandler:v22];
    id v19 = v17[2];
    v17[2] = (id)v18;

    [v17[2] setReconnectAutomatically:1];
    v20 = v17;
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)openConnection
{
}

void __71__GEOResourceManifestServerRemoteProxy_initWithDelegate_configuration___block_invoke_4(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = WeakRetained[5];
    if (v1)
    {
      if (([v1 isDefaultConfiguration] & 1) == 0)
      {
        id v6 = @"message";
        v7[0] = @"resourcemanifest.setConfiguration";
        v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
        v3 = (void *)_CFXPCCreateXPCObjectFromCFObject();

        xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
        GEOEncodeXPCValue(v4, "cfg", WeakRetained[5], 0);
        xpc_dictionary_set_value(v3, "userInfo", v4);
        [WeakRetained[2] sendMessage:v3];
      }
    }
  }
}

- (void)activateResourceScale:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v7 = [[GEOResourceManifestActivateFilterRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  v5 = objc_alloc_init(GEOActiveResourceFilter);
  [(GEOResourceManifestActivateFilterRequest *)v7 setFilter:v5];

  id v6 = [(GEOResourceManifestActivateFilterRequest *)v7 filter];
  [v6 setScale:v3];

  [(GEOXPCRequest *)v7 send:self->_xpcConnection];
}

void __70__GEOResourceManifestServerRemoteProxy_forceUpdate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F145A8])
  {
    int v8 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      id v16 = "-[GEOResourceManifestServerRemoteProxy forceUpdate:completionHandler:]_block_invoke";
      __int16 v17 = 2080;
      uint64_t v18 = "com.apple.geod";
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "%s: Could not connect to geod on %s", (uint8_t *)&v15, 0x16u);
    }

    xpc_object_t v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15];
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v4);
    }
  }
  else
  {
    xpc_object_t v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 objectForKey:@"userInfo"];
      id v6 = objc_msgSend(v5, "_geo_errorForKey:", @"err");
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
      }
    }
    else
    {
      uint64_t v10 = GEOGetResourceManifestLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136315394;
        id v16 = "-[GEOResourceManifestServerRemoteProxy forceUpdate:completionHandler:]_block_invoke";
        __int16 v17 = 2080;
        uint64_t v18 = "com.apple.geod";
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "%s: Unexpected response type from geod on %s", (uint8_t *)&v15, 0x16u);
      }

      v5 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11];
      uint64_t v11 = *(void *)(a1 + 32);
      if (v11) {
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v5);
      }
    }
  }
  uint64_t v12 = +[GEONotificationPreferenceManager sharedManager];
  int v13 = [v12 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest_ForcedUpdate"];

  if (v13)
  {
    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"GEOPPTTest_Manifest_ForcedUpdateEND" object:0];
  }
}

void __71__GEOResourceManifestServerRemoteProxy_initWithDelegate_configuration___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && ([*(id *)(*(void *)(a1 + 32) + 16) isConnected] & 1) == 0)
  {
    id v3 = GEOActiveTileGroupPath(WeakRetained[5]);
    if ([v3 length])
    {
      xpc_object_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v3];
      if (v4)
      {
        v5 = [[GEOActiveTileGroup alloc] initWithData:v4];
LABEL_8:
        id v7 = *(id *)(a1 + 32);
        geo_isolate_sync_data();
        id v6 = objc_loadWeakRetained(WeakRetained + 1);
        [v6 serverProxy:WeakRetained didChangeActiveTileGroup:v5 finishedCallback:&__block_literal_global_86];

        goto LABEL_9;
      }
    }
    else
    {
      xpc_object_t v4 = 0;
    }
    v5 = 0;
    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __71__GEOResourceManifestServerRemoteProxy_initWithDelegate_configuration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
}

void __71__GEOResourceManifestServerRemoteProxy_initWithDelegate_configuration___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = MEMORY[0x18C1213B0](v3);
    if (v5 == MEMORY[0x1E4F14590])
    {
      id v6 = _CFXPCCreateCFObjectFromXPCObject();
      [WeakRetained _handleMessage:v6 xpcMessage:v3];
LABEL_7:

      goto LABEL_8;
    }
    if (v5 == MEMORY[0x1E4F145A8])
    {
      id v6 = GEOGetResourceManifestLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14530]);
        int v8 = 136315138;
        uint64_t v9 = string;
        _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "GEOResourceManifestServerRemoteProxy: Lost connection to geod (%s)", (uint8_t *)&v8, 0xCu);
      }
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)dealloc
{
  notify_cancel(self->_activeTileGroupChangedNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)GEOResourceManifestServerRemoteProxy;
  [(GEOResourceManifestServerRemoteProxy *)&v3 dealloc];
}

- (id)authToken
{
  p_authTokenLock = &self->_authTokenLock;
  os_unfair_lock_lock(&self->_authTokenLock);
  authToken = self->_authToken;
  if (!authToken)
  {
    uint64_t v5 = GEOResourceManifestPath(self->_configuration);
    if ([v5 length])
    {
      id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5];
      if (v6)
      {
        id v7 = [[GEOResourceManifestDownload alloc] initWithData:v6];
        int v8 = [(GEOResourceManifestDownload *)v7 resources];
        uint64_t v9 = [v8 authToken];
        uint64_t v10 = (NSString *)[v9 copy];
        uint64_t v11 = self->_authToken;
        self->_authToken = v10;
      }
    }

    authToken = self->_authToken;
  }
  uint64_t v12 = authToken;
  os_unfair_lock_unlock(p_authTokenLock);

  return v12;
}

- (id)configuration
{
  return self->_configuration;
}

- (void)setActiveTileGroupIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[GEONotificationPreferenceManager sharedManager];
  int v6 = [v5 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest_SetActiveTileGroup"];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"GEOPPTTest_Manifest_SetActiveTileGroupBEGIN" object:0];
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:@"identifier"];

  id v13 = (id)objc_msgSend(v8, "initWithObjectsAndKeys:", @"resourcemanifest.setActiveTileGroupIdentifier", @"message", v9, @"userInfo", 0);
  uint64_t v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  [(GEOXPCConnection *)self->_xpcConnection sendMessage:v10];
  uint64_t v11 = +[GEONotificationPreferenceManager sharedManager];
  LODWORD(v8) = [v11 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest_SetActiveTileGroup"];

  if (v8)
  {
    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"GEOPPTTest_Manifest_SetActiveTileGroupEND" object:0];
  }
}

- (void)setActiveTileGroupIdentifier:(id)a3 updateType:(int64_t)a4 completionHandler:(id)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v23[0] = @"resourcemanifest.setActiveTileGroupIdentifier";
  v22[0] = @"message";
  v22[1] = @"userInfo";
  v21[0] = a3;
  v20[0] = @"identifier";
  v20[1] = @"type";
  uint64_t v9 = NSNumber;
  id v10 = a3;
  uint64_t v11 = [v9 numberWithInteger:a4];
  v20[2] = @"reply";
  v21[1] = v11;
  void v21[2] = MEMORY[0x1E4F1CC38];
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  v23[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  id v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpcConnection = self->_xpcConnection;
  id v16 = [(GEOResourceManifestServerRemoteProxy *)self serverQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__GEOResourceManifestServerRemoteProxy_setActiveTileGroupIdentifier_updateType_completionHandler___block_invoke;
  v18[3] = &unk_1E53E13A8;
  id v19 = v8;
  id v17 = v8;
  [(GEOXPCConnection *)xpcConnection sendMessage:v14 withReply:v16 handler:v18];
}

void __98__GEOResourceManifestServerRemoteProxy_setActiveTileGroupIdentifier_updateType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F145A8])
  {
    id v8 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      id v13 = "-[GEOResourceManifestServerRemoteProxy setActiveTileGroupIdentifier:updateType:completionHandler:]_block_invoke";
      __int16 v14 = 2080;
      int v15 = "com.apple.geod";
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "%s: Could not connect to geod on %s", (uint8_t *)&v12, 0x16u);
    }

    id v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15];
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v4);
    }
  }
  else
  {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v4 objectForKey:@"userInfo"];
      int v6 = objc_msgSend(v5, "_geo_errorForKey:", @"err");
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
      }
    }
    else
    {
      id v10 = GEOGetResourceManifestLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315394;
        id v13 = "-[GEOResourceManifestServerRemoteProxy setActiveTileGroupIdentifier:updateType:completionHandler:]_block_invoke";
        __int16 v14 = 2080;
        int v15 = "com.apple.geod";
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "%s: Unexpected response type from geod on %s", (uint8_t *)&v12, 0x16u);
      }

      uint64_t v5 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11];
      uint64_t v11 = *(void *)(a1 + 32);
      if (v11) {
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v5);
      }
    }
  }
}

- (void)resetActiveTileGroup
{
  id v3 = +[GEONotificationPreferenceManager sharedManager];
  int v4 = [v3 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest_ResetActiveTileGroup"];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"GEOPPTTest_Manifest_ResetActiveTileGroupBEGIN" object:0];
  }
  id v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"resourcemanifest.resetActiveTileGroup", @"message", 0);
  int v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  [(GEOXPCConnection *)self->_xpcConnection sendMessage:v6];
  uint64_t v7 = +[GEONotificationPreferenceManager sharedManager];
  int v8 = [v7 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest_ResetActiveTileGroup"];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"GEOPPTTest_Manifest_ResetActiveTileGroupEND" object:0];
  }
}

- (void)updateIfNecessary:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[GEONotificationPreferenceManager sharedManager];
  int v6 = [v5 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest_Update"];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"GEOPPTTest_Manifest_UpdateBEGIN" object:0];
  }
  __int16 v14 = @"message";
  v15[0] = @"resourcemanifest.updateIfNecessary";
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__GEOResourceManifestServerRemoteProxy_updateIfNecessary___block_invoke;
  v12[3] = &unk_1E53E13A8;
  id v13 = v4;
  id v11 = v4;
  [(GEOXPCConnection *)xpcConnection sendMessage:v9 withReply:MEMORY[0x1E4F14428] handler:v12];
}

void __58__GEOResourceManifestServerRemoteProxy_updateIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F145A8])
  {
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Could not connect to geod on %s", "-[GEOResourceManifestServerRemoteProxy updateIfNecessary:]_block_invoke", "com.apple.geod");
    uint64_t v7 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v14 = v4;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    if (!*(void *)(a1 + 32)) {
      goto LABEL_14;
    }
    int v8 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:v4];
  }
  else
  {
    if (!*(void *)(a1 + 32)) {
      goto LABEL_15;
    }
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v4 objectForKey:@"userInfo"];
      uint64_t v6 = objc_msgSend(v5, "_geo_errorForKey:", @"err");
    }
    else
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Unexpected response type from geod on %s", "-[GEOResourceManifestServerRemoteProxy updateIfNecessary:]_block_invoke", "com.apple.geod");
      uint64_t v9 = GEOGetResourceManifestLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v14 = v5;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      uint64_t v6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:v5];
    }
    int v8 = (void *)v6;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_14:
LABEL_15:
  id v10 = +[GEONotificationPreferenceManager sharedManager];
  int v11 = [v10 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest_Update"];

  if (v11)
  {
    int v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"GEOPPTTest_Manifest_UpdateEND" object:0];
  }
}

- (id)updateProgress
{
  return 0;
}

- (void)getResourceManifestWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = +[GEONotificationPreferenceManager sharedManager];
    int v6 = [v5 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest_GetResourceManifest"];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 postNotificationName:@"GEOPPTTest_Manifest_GetResourceManifestBEGIN" object:0];
    }
    int v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"resourcemanifest.getResourceManifest", @"message", 0);
    uint64_t v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpcConnection = self->_xpcConnection;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__GEOResourceManifestServerRemoteProxy_getResourceManifestWithHandler___block_invoke;
    v11[3] = &unk_1E53E13A8;
    id v12 = v4;
    [(GEOXPCConnection *)xpcConnection sendMessage:v9 withReply:MEMORY[0x1E4F14428] handler:v11];
  }
}

void __71__GEOResourceManifestServerRemoteProxy_getResourceManifestWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F145A8])
  {
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Could not connect to geod on %s", "-[GEOResourceManifestServerRemoteProxy getResourceManifestWithHandler:]_block_invoke", "com.apple.geod");
    uint64_t v9 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v14 = v4;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v5 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSLog(&cfstr_SUnexpectedRes.isa, "-[GEOResourceManifestServerRemoteProxy getResourceManifestWithHandler:]_block_invoke", "com.apple.geod");
      goto LABEL_17;
    }
    uint64_t v5 = [v4 objectForKey:@"userInfo"];
    int v6 = objc_msgSend(v5, "_geo_errorForKey:", @"err");
    if (v6) {
      goto LABEL_15;
    }
    uint64_t v7 = [v5 objectForKey:@"manifestData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[GEOResourceManifestDownload alloc] initWithData:v7];
      if (v8)
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        int v6 = 0;
      }
      else
      {
        int v6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"manifest is nil"];
      }
    }
    else
    {
      int v6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"manifestData is not NSData"];
    }

    if (v6)
    {
LABEL_15:
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }

LABEL_17:
  id v10 = +[GEONotificationPreferenceManager sharedManager];
  int v11 = [v10 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest_GetResourceManifest"];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"GEOPPTTest_Manifest_GetResourceManifestEND" object:0];
  }
}

- (void)setManifestToken:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = +[GEONotificationPreferenceManager sharedManager];
    int v9 = [v8 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest_SetManifestToken"];

    if (v9)
    {
      id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 postNotificationName:@"GEOPPTTest_Manifest_SetManifestTokenBEGIN" object:0];
    }
    int v11 = [MEMORY[0x1E4F1CA60] dictionary];
    id v12 = v11;
    if (v6) {
      [v11 setObject:v6 forKey:@"requestToken"];
    }
    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"resourcemanifest.setRequestToken", @"message", v12, @"userInfo", 0);
    __int16 v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpcConnection = self->_xpcConnection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__GEOResourceManifestServerRemoteProxy_setManifestToken_completionHandler___block_invoke;
    v16[3] = &unk_1E53E13A8;
    id v17 = v7;
    [(GEOXPCConnection *)xpcConnection sendMessage:v14 withReply:MEMORY[0x1E4F14428] handler:v16];
  }
}

void __75__GEOResourceManifestServerRemoteProxy_setManifestToken_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x18C1213B0](a2) == MEMORY[0x1E4F145A8])
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Could not connect to geod on %s", "-[GEOResourceManifestServerRemoteProxy setManifestToken:completionHandler:]_block_invoke", "com.apple.geod");
    NSLog(&stru_1ED5215D0.isa, v3);
    id v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:v3];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v5 = +[GEONotificationPreferenceManager sharedManager];
  int v6 = [v5 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest_SetManifestToken"];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"GEOPPTTest_Manifest_SetManifestTokenEND" object:0];
  }
}

- (void)deactivateResourceScale:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v7 = [[GEOResourceManifestDeactivateFilterRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  uint64_t v5 = objc_alloc_init(GEOActiveResourceFilter);
  [(GEOResourceManifestDeactivateFilterRequest *)v7 setFilter:v5];

  int v6 = [(GEOResourceManifestDeactivateFilterRequest *)v7 filter];
  [v6 setScale:v3];

  [(GEOXPCRequest *)v7 send:self->_xpcConnection];
}

- (void)activateResourceScenario:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v7 = [[GEOResourceManifestActivateFilterRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  uint64_t v5 = objc_alloc_init(GEOActiveResourceFilter);
  [(GEOResourceManifestActivateFilterRequest *)v7 setFilter:v5];

  int v6 = [(GEOResourceManifestActivateFilterRequest *)v7 filter];
  [v6 setScenario:v3];

  [(GEOXPCRequest *)v7 send:self->_xpcConnection];
}

- (void)deactivateResourceScenario:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v7 = [[GEOResourceManifestDeactivateFilterRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  uint64_t v5 = objc_alloc_init(GEOActiveResourceFilter);
  [(GEOResourceManifestDeactivateFilterRequest *)v7 setFilter:v5];

  int v6 = [(GEOResourceManifestDeactivateFilterRequest *)v7 filter];
  [v6 setScenario:v3];

  [(GEOXPCRequest *)v7 send:self->_xpcConnection];
}

- (void)activateResourceName:(id)a3
{
  id v4 = a3;
  id v7 = [[GEOResourceManifestActivateFilterRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  uint64_t v5 = objc_alloc_init(GEOActiveResourceFilter);
  [(GEOResourceManifestActivateFilterRequest *)v7 setFilter:v5];

  int v6 = [(GEOResourceManifestActivateFilterRequest *)v7 filter];
  [v6 setName:v4];

  [(GEOXPCRequest *)v7 send:self->_xpcConnection];
}

- (void)deactivateResourceName:(id)a3
{
  id v4 = a3;
  id v7 = [[GEOResourceManifestDeactivateFilterRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  uint64_t v5 = objc_alloc_init(GEOActiveResourceFilter);
  [(GEOResourceManifestDeactivateFilterRequest *)v7 setFilter:v5];

  int v6 = [(GEOResourceManifestDeactivateFilterRequest *)v7 filter];
  [v6 setName:v4];

  [(GEOXPCRequest *)v7 send:self->_xpcConnection];
}

- (unsigned)maximumZoomLevelForStyle:(int)a3 scale:(int)a4 outSize:(int *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  v35[2] = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  int v31 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  geo_isolate_sync_data();
  if (*((unsigned char *)v25 + 24))
  {
    unsigned int v9 = *((_DWORD *)v29 + 6);
  }
  else
  {
    v34[0] = @"message";
    v34[1] = @"userInfo";
    v35[0] = @"resourcemanifest.getMaximumZoomLevel";
    v32[0] = @"style";
    id v10 = [NSNumber numberWithInt:v7];
    v32[1] = @"scale";
    v33[0] = v10;
    int v11 = [NSNumber numberWithInt:v6];
    v33[1] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    v35[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

    __int16 v14 = [(GEOXPCConnection *)self->_xpcConnection sendDictionaryWithReplySync:v13 error:0];
    uint64_t v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 objectForKey:@"userInfo"];
      id v17 = [v16 objectForKeyedSubscript:@"result"];
      uint64_t v18 = [v16 objectForKeyedSubscript:@"idealSize"];
      id v19 = v18;
      if (a5 && v18) {
        *a5 = [v18 intValue];
      }
      uint64_t v21 = MEMORY[0x1E4F143A8];
      id v22 = v17;
      id v23 = v19;
      geo_isolate_sync_data();
      unsigned int v9 = objc_msgSend(v22, "unsignedIntValue", v21, 3221225472, __79__GEOResourceManifestServerRemoteProxy_maximumZoomLevelForStyle_scale_outSize___block_invoke_2, &unk_1E53E2EC0, self);
    }
    else
    {
      unsigned int v9 = 0;
    }
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return v9;
}

void __79__GEOResourceManifestServerRemoteProxy_maximumZoomLevelForStyle_scale_outSize___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 80);
  uint64_t v3 = [NSNumber numberWithUnsignedLongLong:a1[7]];
  id v8 = [v2 objectForKeyedSubscript:v3];

  id v4 = v8;
  if (v8)
  {
    unint64_t v5 = [v8 unsignedLongLongValue];
    uint64_t v6 = (_DWORD *)a1[8];
    if (v5 == -1)
    {
      LODWORD(v7) = -1;
      if (v6) {
        *uint64_t v6 = -1;
      }
    }
    else
    {
      if (v6) {
        *uint64_t v6 = v5;
      }
      unint64_t v7 = HIDWORD(v5);
    }
    id v4 = v8;
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = v7;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void __79__GEOResourceManifestServerRemoteProxy_maximumZoomLevelForStyle_scale_outSize___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 80))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 80);
    *(void *)(v3 + 80) = v2;
  }
  unint64_t v5 = NSNumber;
  uint64_t v6 = [*(id *)(a1 + 40) unsignedIntValue];
  int v7 = [*(id *)(a1 + 48) intValue];
  if ((v7 & v6) == 0xFFFFFFFF) {
    uint64_t v8 = -1;
  }
  else {
    uint64_t v8 = v7 | (unint64_t)(v6 << 32);
  }
  id v11 = [v5 numberWithUnsignedLongLong:v8];
  unsigned int v9 = *(void **)(*(void *)(a1 + 32) + 80);
  id v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  [v9 setObject:v11 forKeyedSubscript:v10];
}

- (void)_handleMessage:(id)a3 xpcMessage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[GEONotificationPreferenceManager sharedManager];
  int v9 = [v8 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest_HandleMessage"];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"GEOPPTTest_Manifest_HandleMessageBEGIN" object:0];
  }
  id v11 = [v7 objectForKey:@"message"];
  id v12 = [v7 objectForKey:@"userInfo"];

  if ([v11 isEqualToString:@"resourcemanifest.didChangeActiveTileGroup"])
  {
    id v13 = [v12 objectForKey:@"activeTileGroupData"];
    __int16 v14 = [[GEOActiveTileGroup alloc] initWithData:v13];
    os_unfair_lock_lock_with_options();
    authToken = self->_authToken;
    self->_authToken = 0;

    os_unfair_lock_unlock(&self->_authTokenLock);
    if (v14)
    {
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      char v27 = __66__GEOResourceManifestServerRemoteProxy__handleMessage_xpcMessage___block_invoke;
      uint64_t v28 = &unk_1E53D79D8;
      v29 = self;
      geo_isolate_sync_data();
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      id v22 = __66__GEOResourceManifestServerRemoteProxy__handleMessage_xpcMessage___block_invoke_2;
      id v23 = &unk_1E53D79D8;
      id v24 = v6;
      [WeakRetained serverProxy:self didChangeActiveTileGroup:v14 finishedCallback:&v20];
    }
  }
  id v17 = +[GEONotificationPreferenceManager sharedManager];
  int v18 = [v17 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest_HandleMessage"];

  if (v18)
  {
    id v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 postNotificationName:@"GEOPPTTest_Manifest_HandleMessageEND" object:0];
  }
}

uint64_t __66__GEOResourceManifestServerRemoteProxy__handleMessage_xpcMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
}

void __66__GEOResourceManifestServerRemoteProxy__handleMessage_xpcMessage___block_invoke_2(uint64_t a1)
{
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  connection = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  xpc_connection_send_message(connection, reply);
}

- (GEOResourceManifestServerProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOResourceManifestServerProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumZoomLevelCache, 0);
  objc_storeStrong((id *)&self->_maximumZoomLevelIsolation, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end