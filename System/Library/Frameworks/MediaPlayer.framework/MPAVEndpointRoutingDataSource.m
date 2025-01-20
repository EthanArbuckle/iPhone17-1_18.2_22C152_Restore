@interface MPAVEndpointRoutingDataSource
- (BOOL)devicePresenceDetected;
- (BOOL)didReceiveDiscoveryResults;
- (BOOL)suppressNotifications;
- (MPAVEndpointRoutingDataSource)init;
- (MPAVEndpointRoutingDataSource)initWithThrottlingEnabled:(BOOL)a3;
- (MRAVRoutingDiscoverySessionConfiguration)discoverySessionConfiguration;
- (NSMutableDictionary)endpoints;
- (NSString)routingContextUID;
- (OS_dispatch_queue)serialQueue;
- (id)getRoutesForCategory:(id)a3;
- (int64_t)discoveryMode;
- (unsigned)targetSessionID;
- (void)_clearDiscoverySessionCallback;
- (void)_endpointsDidChange:(id)a3;
- (void)_setDiscoverySessionCallback;
- (void)dealloc;
- (void)setDidReceiveDiscoveryResults:(BOOL)a3;
- (void)setDiscoveryMode:(int64_t)a3;
- (void)setEndpoints:(id)a3;
- (void)setPickedRoute:(id)a3 withPassword:(id)a4 completion:(id)a5;
- (void)setRoutingContextUID:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSuppressNotifications:(BOOL)a3;
- (void)setTargetSessionID:(unsigned int)a3;
@end

@implementation MPAVEndpointRoutingDataSource

- (MPAVEndpointRoutingDataSource)initWithThrottlingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPAVEndpointRoutingDataSource;
  v4 = [(MPAVRoutingDataSource *)&v13 init];
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    endpoints = v4->_endpoints;
    v4->_endpoints = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MediaPlayer.MPAVEndpointRoutingDataSource/serialQueue", 0);
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v7;

    v9 = [(MPAVEndpointRoutingDataSource *)v4 discoverySessionConfiguration];
    [v9 setEnableThrottling:v3];
    v4->_suppressNotifications = 0;
    uint64_t v10 = [MEMORY[0x1E4F76FD8] discoverySessionWithConfiguration:v9];
    discoverySession = v4->_discoverySession;
    v4->_discoverySession = (MRAVRoutingDiscoverySession *)v10;

    if (!v4->_suppressNotifications) {
      [(MPAVEndpointRoutingDataSource *)v4 _setDiscoverySessionCallback];
    }
  }
  return v4;
}

- (MRAVRoutingDiscoverySessionConfiguration)discoverySessionConfiguration
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F76FE0]) initWithEndpointFeatures:8];
  objc_msgSend(v3, "setTargetAudioSessionID:", -[MPAVEndpointRoutingDataSource targetSessionID](self, "targetSessionID"));

  return (MRAVRoutingDiscoverySessionConfiguration *)v3;
}

- (unsigned)targetSessionID
{
  return self->_targetSessionID;
}

- (void)_setDiscoverySessionCallback
{
  if (!self->_callbackToken)
  {
    objc_initWeak(&location, self);
    discoverySession = self->_discoverySession;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__MPAVEndpointRoutingDataSource__setDiscoverySessionCallback__block_invoke;
    v6[3] = &unk_1E57F8300;
    objc_copyWeak(&v7, &location);
    v4 = [(MRAVRoutingDiscoverySession *)discoverySession addEndpointsChangedCallback:v6];
    id callbackToken = self->_callbackToken;
    self->_id callbackToken = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (MPAVEndpointRoutingDataSource)init
{
  return [(MPAVEndpointRoutingDataSource *)self initWithThrottlingEnabled:0];
}

- (void)setDiscoveryMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    a3 = a3;
  }
  else {
    a3 = 0;
  }
  [(MRAVRoutingDiscoverySession *)self->_discoverySession setDiscoveryMode:a3];
}

- (id)getRoutesForCategory:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__44614;
  v11 = __Block_byref_object_dispose__44615;
  id v12 = 0;
  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__MPAVEndpointRoutingDataSource_getRoutesForCategory___block_invoke;
  v6[3] = &unk_1E57F9F20;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __54__MPAVEndpointRoutingDataSource_getRoutesForCategory___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v22 = (void *)[*(id *)(*(void *)(a1 + 32) + 104) copy];
  [*(id *)(*(void *)(a1 + 32) + 104) removeAllObjects];
  uint64_t v21 = a1;
  v2 = [*(id *)(*(void *)(a1 + 32) + 64) availableEndpoints];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v9 = [v8 uniqueIdentifier];
        uint64_t v10 = [v22 objectForKeyedSubscript:v9];
        if (v10)
        {
          v11 = (MPAVEndpointRoute *)v10;
          id v12 = [[MPMRAVEndpointWrapper alloc] initWithMRAVEndpoint:v8];
          [(MPAVEndpointRoute *)v11 setEndpointWrapper:v12];
        }
        else
        {
          v11 = [[MPAVEndpointRoute alloc] initWithEndpoint:v8];
        }
        objc_super v13 = [v8 externalDevice];

        v14 = [(MPAVEndpointRoute *)v11 connection];
        uint64_t v15 = [v14 externalDevice];

        if ((void *)v15 != v13)
        {
          if (v13)
          {
            v16 = [[MPAVRouteConnection alloc] initWithExternalDevice:v13];
            [(MPAVEndpointRoute *)v11 setConnection:v16];
          }
          else
          {
            [(MPAVEndpointRoute *)v11 setConnection:0];
          }
        }
        [*(id *)(*(void *)(v21 + 32) + 104) setObject:v11 forKeyedSubscript:v9];
        [v3 addObject:v11];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }

  uint64_t v17 = [v3 copy];
  uint64_t v18 = *(void *)(*(void *)(v21 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;
}

uint64_t __63__MPAVEndpointRoutingDataSource_setDidReceiveDiscoveryResults___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 80) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __59__MPAVEndpointRoutingDataSource_didReceiveDiscoveryResults__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80);
  return result;
}

void __61__MPAVEndpointRoutingDataSource__setDiscoverySessionCallback__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ([v4 count]) {
      [WeakRetained setDidReceiveDiscoveryResults:1];
    }
    [WeakRetained _endpointsDidChange:v4];
  }
}

- (void)setDidReceiveDiscoveryResults:(BOOL)a3
{
  uint64_t v5 = [(MPAVEndpointRoutingDataSource *)self serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__MPAVEndpointRoutingDataSource_setDidReceiveDiscoveryResults___block_invoke;
  v6[3] = &unk_1E57F9E08;
  void v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

- (BOOL)didReceiveDiscoveryResults
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(MPAVEndpointRoutingDataSource *)self serialQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__MPAVEndpointRoutingDataSource_didReceiveDiscoveryResults__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)_endpointsDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_routingContextUID, 0);
  objc_storeStrong(&self->_callbackToken, 0);

  objc_storeStrong((id *)&self->_discoverySession, 0);
}

- (void)setEndpoints:(id)a3
{
}

- (NSMutableDictionary)endpoints
{
  return self->_endpoints;
}

- (void)setSerialQueue:(id)a3
{
}

- (BOOL)suppressNotifications
{
  return self->_suppressNotifications;
}

- (NSString)routingContextUID
{
  return self->_routingContextUID;
}

- (void)_clearDiscoverySessionCallback
{
  if (self->_callbackToken)
  {
    -[MRAVRoutingDiscoverySession removeEndpointsChangedCallback:](self->_discoverySession, "removeEndpointsChangedCallback:");
    id callbackToken = self->_callbackToken;
    self->_id callbackToken = 0;
  }
}

- (void)setPickedRoute:(id)a3 withPassword:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [v8 routeUID];
    id v12 = (const void *)MRAVRouteQueryCreate();
    MRAVRouteQuerySetRouteUID();
    id v21 = v10;
    MRMediaRemoteFindAndPickRoute();
    CFRelease(v12);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = (void *)MEMORY[0x1E4F76FB8];
      routingContextUID = self->_routingContextUID;
      id v15 = v8;
      v16 = [v13 sharedLocalEndpointForRoutingContextWithUID:routingContextUID];
      uint64_t v17 = [v15 endpointObject];

      uint64_t v18 = [v17 outputDevices];
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      [v16 setOutputDevices:v18 initiator:v20 withReplyQueue:MEMORY[0x1E4F14428] completion:v10];
    }
  }
}

uint64_t __72__MPAVEndpointRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  uint64_t v5 = v4;
  if (a2)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v11 = 138412290;
    uint64_t v12 = a2;
    uint64_t v6 = "[EndpointRoutingDataSource] Route search failed with error: %@";
    BOOL v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    uint32_t v9 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    LOWORD(v11) = 0;
    uint64_t v6 = "[EndpointRoutingDataSource] Successfully found and picked route.";
    BOOL v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 2;
  }
  _os_log_impl(&dword_1952E8000, v7, v8, v6, (uint8_t *)&v11, v9);
LABEL_7:

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (BOOL)devicePresenceDetected
{
  return [(MRAVRoutingDiscoverySession *)self->_discoverySession devicePresenceDetected];
}

- (int64_t)discoveryMode
{
  uint64_t v2 = [(MRAVRoutingDiscoverySession *)self->_discoverySession discoveryMode] - 1;
  if (v2 < 3) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

- (void)setRoutingContextUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MPAVEndpointRoutingDataSource.m", 94, @"Invalid parameter not satisfying: %@", @"routingContextUID" object file lineNumber description];
  }
  if (![(NSString *)self->_routingContextUID isEqualToString:v5])
  {
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> setting routing context UID = %{public}@", buf, 0x20u);
    }

    BOOL v7 = (NSString *)[v5 copy];
    routingContextUID = self->_routingContextUID;
    self->_routingContextUID = v7;

    [(MRAVRoutingDiscoverySession *)self->_discoverySession setRoutingContextUID:self->_routingContextUID];
    uint32_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:self];
  }
}

- (void)setTargetSessionID:(unsigned int)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_targetSessionID != a3)
  {
    uint64_t v3 = *(void *)&a3;
    id v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543874;
      uint64_t v8 = objc_opt_class();
      __int16 v9 = 2048;
      id v10 = self;
      __int16 v11 = 1026;
      int v12 = v3;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>_targetSessionID setting target session ID = %{public}d", (uint8_t *)&v7, 0x1Cu);
    }

    self->_targetSessionID = v3;
    [(MRAVRoutingDiscoverySession *)self->_discoverySession setTargetAudioSessionID:v3];
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:self];
  }
}

- (void)setSuppressNotifications:(BOOL)a3
{
  if (a3) {
    [(MPAVEndpointRoutingDataSource *)self _clearDiscoverySessionCallback];
  }
  else {
    [(MPAVEndpointRoutingDataSource *)self _setDiscoverySessionCallback];
  }
  self->_suppressNotifications = a3;
}

- (void)dealloc
{
  [(MRAVRoutingDiscoverySession *)self->_discoverySession removeEndpointsChangedCallback:self->_callbackToken];
  v3.receiver = self;
  v3.super_class = (Class)MPAVEndpointRoutingDataSource;
  [(MPAVRoutingDataSource *)&v3 dealloc];
}

@end