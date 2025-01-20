@interface MPAVOutputDeviceRoutingDataSource
+ (id)_globalAudioSessionLock;
- (BOOL)_isRemovingPredictedDevice:(id)a3;
- (BOOL)_shouldAddPredictedDeviceToOuputDevices:(id)a3;
- (BOOL)_shouldDetachOutputDevicesToGroup:(id)a3;
- (BOOL)detachesRoutesToGroup;
- (BOOL)devicePresenceDetected;
- (BOOL)didReceiveDiscoveryResults;
- (BOOL)routeIsLeaderOfEndpoint:(id)a3;
- (BOOL)supportsMultipleSelection;
- (BOOL)supportsQueueHandoff;
- (MPAVEndpointRoute)endpointRoute;
- (MPAVOutputDeviceRoutingDataSource)init;
- (MPMRAVOutputContextWrapper)applicationOutputContext;
- (MRAVEndpoint)endpoint;
- (MRAVOutputDevice)predictedDevice;
- (MRAVRoutingDiscoverySession)companionDiscoverySession;
- (MRAVRoutingDiscoverySession)discoverySession;
- (MRAVRoutingDiscoverySessionConfiguration)discoverySessionConfiguration;
- (NSString)initiator;
- (NSString)presentingAppBundleID;
- (NSString)routingContextUID;
- (id)_detachableDevicesInOutputDevices:(id)a3;
- (id)_initWithEndpointRoute:(id)a3;
- (id)_outputDeviceRouteWithUID:(id)a3;
- (id)_stateDumpObject;
- (id)getRoutesForCategory:(id)a3;
- (id)outputDevicesForRoutes:(id)a3;
- (int64_t)discoveryMode;
- (unsigned)targetSessionID;
- (void)_endpointsDidChangeNotification:(id)a3;
- (void)_generateDiscoverySession;
- (void)_onDiscoverySessionQueue_generateCompanionDiscoverySession;
- (void)_onDiscoverySessionQueue_generateDiscoverySession;
- (void)_outputDevicesDidChange:(id)a3;
- (void)_outputDevicesDidChangeNotification:(id)a3;
- (void)_personalRoutesDidChange;
- (void)_registerNotifications;
- (void)_resetPredictedOutputDevice;
- (void)_routeStatusDidChangeNotification:(id)a3;
- (void)_setShouldSourceOutputDevicesFromAVODDS:(BOOL)a3;
- (void)_unregisterNotifications;
- (void)addRouteToGroup:(id)a3 completion:(id)a4;
- (void)addRoutesToGroup:(id)a3 completion:(id)a4;
- (void)createGroupFromOutputDevices:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)removeRouteFromGroup:(id)a3 completion:(id)a4;
- (void)removeRoutesFromGroup:(id)a3 completion:(id)a4;
- (void)setApplicationOutputContext:(id)a3;
- (void)setCompanionDiscoverySession:(id)a3;
- (void)setDetachesRoutesToGroup:(BOOL)a3;
- (void)setDidReceiveDiscoveryResults:(BOOL)a3;
- (void)setDiscoveryMode:(int64_t)a3;
- (void)setDiscoverySession:(id)a3;
- (void)setEndpointRoute:(id)a3;
- (void)setInitiator:(id)a3;
- (void)setPickedRoute:(id)a3 withPassword:(id)a4 completion:(id)a5;
- (void)setPredictedDevice:(id)a3;
- (void)setPresentingAppBundleID:(id)a3;
- (void)setRoutingContextUID:(id)a3;
- (void)setSupportsMultipleSelection:(BOOL)a3;
- (void)setSupportsQueueHandoff:(BOOL)a3;
- (void)setTargetSessionID:(unsigned int)a3;
@end

@implementation MPAVOutputDeviceRoutingDataSource

void *__57__MPAVOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  result = *(void **)(*(void *)(a1 + 32) + 192);
  if (result == v2)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 113) = [result devicePresenceDetected];
    result = (void *)[*(id *)(a1 + 48) count];
    if (result) {
      *(unsigned char *)(*(void *)(a1 + 32) + 129) = 1;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  return result;
}

- (void)_onDiscoverySessionQueue_generateDiscoverySession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoverySessionQueue);
  id v7 = [(MPAVOutputDeviceRoutingDataSource *)self endpoint];
  if ([v7 isCompanionEndpoint])
  {
    v3 = [(MPAVOutputDeviceRoutingDataSource *)self discoverySessionConfiguration];
    v4 = v7;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F76FD8];
    v3 = [(MPAVOutputDeviceRoutingDataSource *)self discoverySessionConfiguration];
    v4 = v5;
  }
  v6 = [v4 discoverySessionWithConfiguration:v3];
  [(MPAVOutputDeviceRoutingDataSource *)self setDiscoverySession:v6];
}

- (void)setDiscoverySession:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoverySessionQueue);
  [(MRAVRoutingDiscoverySession *)self->_discoverySession removeOutputDevicesChangedCallback:self->_callbackToken];
  [(MRAVRoutingDiscoverySession *)self->_discoverySession setDiscoveryMode:0];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MPAVOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke;
  block[3] = &unk_1E57F9F98;
  block[4] = self;
  id v7 = v5;
  id v19 = v7;
  dispatch_sync(serialQueue, block);
  objc_storeStrong((id *)&self->_discoverySession, a3);
  self->_devicePresenceDetected = [(MRAVRoutingDiscoverySession *)self->_discoverySession devicePresenceDetected];
  self->_didReceiveDiscoveryResults = 0;
  objc_initWeak(&location, self);
  discoverySession = self->_discoverySession;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__MPAVOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_2;
  v14[3] = &unk_1E57F9FE8;
  objc_copyWeak(&v16, &location);
  id v9 = v7;
  id v15 = v9;
  v10 = [(MRAVRoutingDiscoverySession *)discoverySession addOutputDevicesChangedCallback:v14];
  id callbackToken = self->_callbackToken;
  self->_id callbackToken = v10;

  unint64_t v12 = [(MPAVOutputDeviceRoutingDataSource *)self discoveryMode] - 1;
  if (v12 < 3) {
    uint64_t v13 = (v12 + 1);
  }
  else {
    uint64_t v13 = 0;
  }
  [(MRAVRoutingDiscoverySession *)self->_discoverySession setDiscoveryMode:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (int64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (BOOL)didReceiveDiscoveryResults
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  discoverySessionQueue = self->_discoverySessionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__MPAVOutputDeviceRoutingDataSource_didReceiveDiscoveryResults__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(discoverySessionQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (MPAVOutputDeviceRoutingDataSource)init
{
  return (MPAVOutputDeviceRoutingDataSource *)[(MPAVOutputDeviceRoutingDataSource *)self _initWithEndpointRoute:0];
}

- (id)_initWithEndpointRoute:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MPAVOutputDeviceRoutingDataSource;
  uint64_t v6 = [(MPAVRoutingDataSource *)&v16 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MediaPlayer.MPAVOutputDeviceRoutingDataSource/serialQueue", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MediaPlayer.MPAVOutputDeviceRoutingDataSource/discoverySessionQueue", 0);
    discoverySessionQueue = v6->_discoverySessionQueue;
    v6->_discoverySessionQueue = (OS_dispatch_queue *)v9;

    v6->_attemptedToInitializeAppOutputContext = 0;
    v6->_shouldSourceOutputDevicesFromAVODDS = 1;
    v6->_supportsMultipleSelection = 1;
    v6->_supportsQueueHandoff = 1;
    objc_storeStrong((id *)&v6->_endpointRoute, a3);
    SharedAudioPresentationContext = (void *)MRAVOutputContextGetSharedAudioPresentationContext();
    if (SharedAudioPresentationContext)
    {
      unint64_t v12 = [[MPMRAVOutputContextWrapper alloc] initWithMRAVOutputContext:SharedAudioPresentationContext];
      applicationOutputContext = v6->_applicationOutputContext;
      v6->_applicationOutputContext = v12;

      SharedAudioPresentationContext = (void *)MRAVOutputContextCopyUniqueIdentifier();
    }
    v14 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v18 = SharedAudioPresentationContext;
      __int16 v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEFAULT, "Created new application output context: %{public}@ for data source: %{public}@", buf, 0x16u);
    }

    [(MPAVOutputDeviceRoutingDataSource *)v6 _registerNotifications];
    [(MPAVOutputDeviceRoutingDataSource *)v6 _generateDiscoverySession];
  }
  return v6;
}

- (void)_registerNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__outputDevicesDidChangeNotification_ name:*MEMORY[0x1E4F77140] object:0];
  [v3 addObserver:self selector:sel__routeStatusDidChangeNotification_ name:*MEMORY[0x1E4F77848] object:0];
}

- (void)_generateDiscoverySession
{
  discoverySessionQueue = self->_discoverySessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MPAVOutputDeviceRoutingDataSource__generateDiscoverySession__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(discoverySessionQueue, block);
}

- (MRAVRoutingDiscoverySessionConfiguration)discoverySessionConfiguration
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F76FE0]) initWithEndpointFeatures:1];
  objc_msgSend(v3, "setTargetAudioSessionID:", -[MPAVOutputDeviceRoutingDataSource targetSessionID](self, "targetSessionID"));

  return (MRAVRoutingDiscoverySessionConfiguration *)v3;
}

- (unsigned)targetSessionID
{
  return self->_targetSessionID;
}

uint64_t __62__MPAVOutputDeviceRoutingDataSource__generateDiscoverySession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDiscoverySessionQueue_generateDiscoverySession");
}

void __50__MPAVOutputDeviceRoutingDataSource_endpointRoute__block_invoke(uint64_t a1)
{
}

void __45__MPAVOutputDeviceRoutingDataSource_endpoint__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 160) endpointWrapper];
  uint64_t v2 = [v5 unwrappedValue];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __63__MPAVOutputDeviceRoutingDataSource_didReceiveDiscoveryResults__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 129);
  return result;
}

void __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 192);
  id v6 = [*(id *)(a1 + 40) endpointObject];
  uint64_t v3 = [v2 availableOutputDevicesForEndpoint:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __57__MPAVOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 136);
  if (v2)
  {
    [v2 unwrappedValue];
    id v3 = (id)MRAVOutputContextCopyUniqueIdentifier();
    [*(id *)(a1 + 40) setRoutingContextUID:v3];
  }
}

void __61__MPAVOutputDeviceRoutingDataSource_applicationOutputContext__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) endpoint];
  if (!v4
    || ([*(id *)(a1 + 32) endpoint],
        v1 = objc_claimAutoreleasedReturnValue(),
        [v1 isLocalEndpoint]))
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 136);
  }
  else
  {
    id v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  if (v4) {
}
  }

void __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_3(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) endpoint];
  id v3 = [v2 personalOutputDevices];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        v10 = [MPAVOutputDeviceRoute alloc];
        uint64_t v48 = v9;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
        unint64_t v12 = [(MPAVOutputDeviceRoute *)v10 initWithOutputDevices:v11];

        [*(id *)(a1 + 40) addObject:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v6);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v13 = [*(id *)(a1 + 48) objectEnumerator];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v15);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = *(id *)(a1 + 56);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(a1 + 72);
        uint64_t v45 = *(void *)(*((void *)&v33 + 1) + 8 * k);
        v24 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v45, 1, (void)v33);
        (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v20);
  }

  v25 = *(void **)(a1 + 64);
  if (v25)
  {
    id v26 = v25;
  }
  else
  {
    id v26 = [*(id *)(a1 + 32) activeAudioCategory];
  }
  v27 = v26;
  if (*(unsigned char *)(a1 + 80)
    && [v26 isEqualToString:*MEMORY[0x1E4F14FA0]]
    && !*(void *)(a1 + 32))
  {
    v28 = *(void **)(a1 + 40);
    v29 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_49911];
    [v28 filterUsingPredicate:v29];
  }
  uint64_t v30 = objc_msgSend(*(id *)(a1 + 40), "copy", (void)v33);
  uint64_t v31 = *(void *)(a1 + 32);
  v32 = *(void **)(v31 + 120);
  *(void *)(v31 + 120) = v30;
}

- (MRAVEndpoint)endpoint
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__49862;
  uint64_t v8 = __Block_byref_object_dispose__49863;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRAVEndpoint *)v2;
}

void __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_22(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (([*(id *)(a1 + 32) supportsMultipleSelection] & 1) == 0)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_2;
    v22[3] = &unk_1E57F8350;
    id v23 = *(id *)(a1 + 40);
    uint64_t v5 = [v3 sortedArrayUsingComparator:v22];
    uint64_t v6 = [v5 firstObject];
    v25[0] = v6;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  }
  uint64_t v7 = [[MPAVOutputDeviceRoute alloc] initWithOutputDevices:v4];
  uint64_t v8 = v7;
  if (*(unsigned char *)(a1 + 72)
    || ![(MPAVOutputDeviceRoute *)v7 isDeviceRoute] && [(MPAVRoute *)v8 isSmartAudio])
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 128))
    {
      if (*(unsigned char *)(a1 + 73))
      {
        uint64_t v9 = [(MPAVOutputDeviceRoute *)v8 isPickedOnPairedDevice];
      }
      else if (*(void *)(a1 + 64) {
             || ![(MPAVOutputDeviceRoute *)v8 isDeviceRoute]
      }
             || (uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8), *(unsigned char *)(v10 + 24)))
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        v11 = [(MPAVOutputDeviceRoute *)v8 outputDevices];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) uid];
              v17 = MRComputeBaseRouteUID();

              LOBYTE(v16) = [*(id *)(a1 + 40) containsObject:v17];
              if (v16)
              {

                goto LABEL_25;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v9 = 1;
        *(unsigned char *)(v10 + 24) = 1;
      }
    }
    else if ([(MPAVOutputDeviceRoute *)v8 isDeviceRoute])
    {
      uint64_t v9 = *(unsigned char *)(a1 + 74) != 0;
    }
    else
    {
LABEL_25:
      uint64_t v9 = 1;
    }
    [(MPAVRoute *)v8 setPicked:v9];
    [*(id *)(a1 + 48) addObject:v8];
  }
}

- (BOOL)supportsMultipleSelection
{
  return self->_supportsMultipleSelection;
}

- (id)getRoutesForCategory:(id)a3
{
  v187[1] = *MEMORY[0x1E4F143B8];
  id v104 = a3;
  id v105 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v110 = self;
  uint64_t v4 = [(MPAVOutputDeviceRoutingDataSource *)self endpointRoute];
  uint64_t v5 = [(MPAVOutputDeviceRoutingDataSource *)self applicationOutputContext];
  uint64_t v170 = 0;
  v171 = &v170;
  uint64_t v172 = 0x3032000000;
  v173 = __Block_byref_object_copy__49862;
  v174 = __Block_byref_object_dispose__49863;
  id v175 = 0;
  uint64_t v163 = MEMORY[0x1E4F143A8];
  uint64_t v164 = 3221225472;
  v165 = __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke;
  v166 = &unk_1E57F9F48;
  v169 = &v170;
  v167 = v110;
  id v6 = v4;
  id v168 = v6;
  msv_dispatch_sync_on_queue();
  v108 = v6;
  if (v6)
  {
    uint64_t v7 = [v6 endpointObject];
    uint64_t v8 = [v7 resolvedOutputDevices];

    int v9 = [v108 isDeviceRoute] ^ 1;
  }
  else if (v5)
  {
    [v5 unwrappedValue];
    uint64_t v8 = (void *)MRAVOutputContextCopyOutputDevices();
    int v9 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    int v9 = 1;
  }
  id v107 = v5;
  [v107 unwrappedValue];
  uint64_t v10 = MRAVOutputContextCopyPredictedOutputDevice();
  v11 = (void *)v10;
  v106 = (void *)v10;
  if (v10)
  {
    v187[0] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v187 count:1];

    uint64_t v8 = (void *)v12;
    v11 = v106;
  }
  [(MPAVOutputDeviceRoutingDataSource *)v110 setPredictedDevice:v11];
  uint64_t v13 = [v8 count];
  id v112 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v103 = v13;
  if (v9)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v161 = 0u;
    long long v162 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    id v15 = v8;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v159 objects:v186 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v160;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v160 != v17) {
            objc_enumerationMutation(v15);
          }
          long long v19 = *(void **)(*((void *)&v159 + 1) + 8 * i);
          long long v20 = [v19 logicalDeviceID];
          if ([v19 isProxyGroupPlayer] && objc_msgSend(v20, "length")) {
            [v14 addObject:v20];
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v159 objects:v186 count:16];
      }
      while (v16);
    }

    long long v157 = 0u;
    long long v158 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    id v21 = v15;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v155 objects:v185 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v156;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v156 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = *(void **)(*((void *)&v155 + 1) + 8 * j);
          id v26 = [v25 uid];
          v27 = MRComputeBaseRouteUID();

          v28 = [v25 logicalDeviceID];
          if (v27
            && ([v25 isProxyGroupPlayer] & 1) == 0
            && (![v28 length] || (objc_msgSend(v14, "containsObject:", v28) & 1) == 0))
          {
            [v112 addObject:v27];
          }
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v155 objects:v185 count:16];
      }
      while (v22);
    }
  }
  else
  {
    long long v153 = 0u;
    long long v154 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    id v14 = v8;
    uint64_t v29 = [v14 countByEnumeratingWithState:&v151 objects:v184 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v152;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v152 != v30) {
            objc_enumerationMutation(v14);
          }
          v32 = [*(id *)(*((void *)&v151 + 1) + 8 * k) uid];
          long long v33 = MRComputeBaseRouteUID();

          if (v33) {
            [v112 addObject:v33];
          }
        }
        uint64_t v29 = [v14 countByEnumeratingWithState:&v151 objects:v184 count:16];
      }
      while (v29);
    }
  }

  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  obuint64_t j = v8;
  uint64_t v34 = [obj countByEnumeratingWithState:&v147 objects:v183 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v148;
    while (2)
    {
      for (uint64_t m = 0; m != v34; ++m)
      {
        if (*(void *)v148 != v35) {
          objc_enumerationMutation(obj);
        }
        long long v37 = *(void **)(*((void *)&v147 + 1) + 8 * m);
        long long v38 = [v37 uid];
        long long v39 = MRComputeBaseRouteUID();

        if (!v39)
        {
          long long v41 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v37;
            _os_log_impl(&dword_1952E8000, v41, OS_LOG_TYPE_DEFAULT, "Found picked device with nil UID: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          char v40 = 0;
          goto LABEL_53;
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v147 objects:v183 count:16];
      if (v34) {
        continue;
      }
      break;
    }
  }
  char v40 = 1;
LABEL_53:

  id v42 = objc_alloc(MEMORY[0x1E4F1CA80]);
  long long v43 = objc_msgSend(v42, "initWithCapacity:", objc_msgSend((id)v171[5], "count"));
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v44 = (id)v171[5];
  uint64_t v45 = [v44 countByEnumeratingWithState:&v143 objects:v182 count:16];
  if (v45)
  {
    v115 = 0;
    uint64_t v46 = *(void *)v144;
    do
    {
      for (uint64_t n = 0; n != v45; ++n)
      {
        if (*(void *)v144 != v46) {
          objc_enumerationMutation(v44);
        }
        uint64_t v48 = *(void **)(*((void *)&v143 + 1) + 8 * n);
        if ([v48 isLocalDevice])
        {
          id v49 = v48;

          v115 = v49;
        }
        uint64_t v50 = [v48 uid];
        v51 = MRComputeBaseRouteUID();

        if (v51)
        {
          [v43 addObject:v51];
        }
        else
        {
          v52 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v48;
            _os_log_impl(&dword_1952E8000, v52, OS_LOG_TYPE_DEFAULT, "Found discovery device with nil UID: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          char v40 = 0;
        }
      }
      uint64_t v45 = [v44 countByEnumeratingWithState:&v143 objects:v182 count:16];
    }
    while (v45);
  }
  else
  {
    v115 = 0;
  }

  -[MPAVOutputDeviceRoutingDataSource _setShouldSourceOutputDevicesFromAVODDS:](v110, "_setShouldSourceOutputDevicesFromAVODDS:", ([(id)v171[5] count] != 0) & v40);
  if (!v110->_shouldSourceOutputDevicesFromAVODDS)
  {
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v65 = obj;
    uint64_t v66 = [v65 countByEnumeratingWithState:&v135 objects:v180 count:16];
    if (v66)
    {
      uint64_t v67 = *(void *)v136;
      while (2)
      {
        for (iuint64_t i = 0; ii != v66; ++ii)
        {
          if (*(void *)v136 != v67) {
            objc_enumerationMutation(v65);
          }
          if ([*(id *)(*((void *)&v135 + 1) + 8 * ii) isLocalDevice])
          {

            id v53 = v65;
            char v71 = 1;
            goto LABEL_95;
          }
        }
        uint64_t v66 = [v65 countByEnumeratingWithState:&v135 objects:v180 count:16];
        if (v66) {
          continue;
        }
        break;
      }
    }

    id v69 = v65;
    id v53 = v69;
    if (!v115)
    {
      char v71 = 0;
      goto LABEL_95;
    }
    objc_msgSend(v69, "arrayByAddingObject:");
    id v70 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_92;
  }
  id v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(obj, "count"));
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v54 = obj;
  uint64_t v55 = [v54 countByEnumeratingWithState:&v139 objects:v181 count:16];
  if (v55)
  {
    uint64_t v56 = *(void *)v140;
    do
    {
      for (juint64_t j = 0; jj != v55; ++jj)
      {
        if (*(void *)v140 != v56) {
          objc_enumerationMutation(v54);
        }
        v58 = *(void **)(*((void *)&v139 + 1) + 8 * jj);
        v59 = [v58 uid];
        v60 = MRComputeBaseRouteUID();

        if (([v43 containsObject:v60] & 1) == 0) {
          [v53 addObject:v58];
        }
      }
      uint64_t v55 = [v54 countByEnumeratingWithState:&v139 objects:v181 count:16];
    }
    while (v55);
  }

  uint64_t v61 = [v53 count];
  v62 = (void *)v171[5];
  if (!v61)
  {
    id v70 = v62;
LABEL_92:
    uint64_t v64 = (uint64_t)v70;
    goto LABEL_93;
  }
  v63 = (void *)[v62 mutableCopy];
  uint64_t v64 = [v63 arrayByAddingObjectsFromArray:v53];

LABEL_93:
  char v71 = 0;
  id v53 = (id)v64;
LABEL_95:
  id v72 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v73 = objc_msgSend(v72, "initWithCapacity:", objc_msgSend((id)v171[5], "count"));
  char v102 = v71;
  id v74 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v75 = objc_msgSend(v74, "initWithCapacity:", objc_msgSend((id)v171[5], "count"));
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v114 = v53;
  char v76 = 0;
  uint64_t v77 = [v114 countByEnumeratingWithState:&v131 objects:v179 count:16];
  if (!v77) {
    goto LABEL_109;
  }
  uint64_t v78 = *(void *)v132;
  do
  {
    for (kuint64_t k = 0; kk != v77; ++kk)
    {
      if (*(void *)v132 != v78) {
        objc_enumerationMutation(v114);
      }
      v80 = *(void **)(*((void *)&v131 + 1) + 8 * kk);
      uint64_t v81 = [v80 logicalDeviceID];
      v82 = (void *)v81;
      if (v76)
      {
        char v76 = 1;
        if (!v81) {
          goto LABEL_106;
        }
      }
      else
      {
        char v76 = [v80 isPickedOnPairedDevice];
        if (!v82)
        {
LABEL_106:
          [v75 addObject:v80];
          goto LABEL_107;
        }
      }
      id v83 = [v73 objectForKey:v82];
      if (!v83)
      {
        id v83 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [v73 setObject:v83 forKey:v82];
      }
      [v83 addObject:v80];

LABEL_107:
    }
    uint64_t v77 = [v114 countByEnumeratingWithState:&v131 objects:v179 count:16];
  }
  while (v77);
LABEL_109:

  id v84 = v108;
  v85 = v84;
  if (v108) {
    char v86 = [v84 isDeviceRoute];
  }
  else {
    char v86 = 1;
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v177 = 0x2020000000;
  char v178 = 0;
  v123[0] = MEMORY[0x1E4F143A8];
  v123[1] = 3221225472;
  v123[2] = __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_22;
  v123[3] = &unk_1E57F8378;
  v123[4] = v110;
  char v128 = v86;
  char v129 = v76;
  p_long long buf = &buf;
  uint64_t v127 = v103;
  id v113 = v112;
  id v124 = v113;
  char v130 = v102;
  id v87 = v105;
  id v125 = v87;
  v88 = (void *)MEMORY[0x19971E0F0](v123);
  serialQueue = v110->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_3;
  block[3] = &unk_1E57F83C0;
  block[4] = v110;
  id v90 = v87;
  id v117 = v90;
  id v91 = v73;
  id v118 = v91;
  id v92 = v88;
  id v121 = v92;
  id v93 = v75;
  id v119 = v93;
  id v109 = v104;
  id v120 = v109;
  char v122 = v86;
  dispatch_sync(serialQueue, block);
  uint64_t v94 = [(MPAVRoutingDataSource *)v110 filterMode];
  switch(v94)
  {
    case 1:
      v95 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_29_49906];
      v96 = [v90 filteredArrayUsingPredicate:v95];
      uint64_t v97 = [v96 mutableCopy];
LABEL_118:
      v98 = (void *)v97;

      goto LABEL_120;
    case 2:
      v95 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_33];
      v96 = [v90 filteredArrayUsingPredicate:v95];
      uint64_t v97 = [v96 mutableCopy];
      goto LABEL_118;
    case 3:
      v95 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_31_49907];
      v96 = [v90 filteredArrayUsingPredicate:v95];
      uint64_t v97 = [v96 mutableCopy];
      goto LABEL_118;
  }
  v98 = v90;
LABEL_120:
  v99 = v120;
  id v100 = v98;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v170, 8);

  return v100;
}

- (void)setPredictedDevice:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MPAVOutputDeviceRoutingDataSource_setPredictedDevice___block_invoke;
  v7[3] = &unk_1E57F9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (MPAVEndpointRoute)endpointRoute
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__49862;
  id v8 = __Block_byref_object_dispose__49863;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MPAVEndpointRoute *)v2;
}

- (MPMRAVOutputContextWrapper)applicationOutputContext
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__49862;
  uint64_t v10 = __Block_byref_object_dispose__49863;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__MPAVOutputDeviceRoutingDataSource_applicationOutputContext__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPMRAVOutputContextWrapper *)v3;
}

- (void)_setShouldSourceOutputDevicesFromAVODDS:(BOOL)a3
{
  if (self->_shouldSourceOutputDevicesFromAVODDS != a3)
  {
    BOOL v3 = a3;
    self->_shouldSourceOutputDevicesFromAVODDS = a3;
    uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        __int16 v9 = 0;
        uint64_t v6 = "Output device UIDs determined to be available. Output devices from AVODDS will no longer be ignored.";
        uint64_t v7 = (uint8_t *)&v9;
LABEL_7:
        _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
    }
    else if (v5)
    {
      __int16 v8 = 0;
      uint64_t v6 = "Output device UIDs determined to be unavailable. Output devices from AVODDS will be ignored.";
      uint64_t v7 = (uint8_t *)&v8;
      goto LABEL_7;
    }
  }
}

void __57__MPAVOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v7 = MEMORY[0x1E4F143A8];
    id v8 = WeakRetained;
    id v9 = *(id *)(a1 + 32);
    id v6 = v3;
    uint64_t v10 = v6;
    msv_dispatch_sync_on_queue();
    if (*((unsigned char *)v12 + 24)) {
      objc_msgSend(v5, "_outputDevicesDidChange:", v6, v7, 3221225472, __57__MPAVOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_3, &unk_1E57F82D8, v8, v9, v6, &v11);
    }

    _Block_object_dispose(&v11, 8);
  }
}

- (void)_outputDevicesDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:self];
}

void __56__MPAVOutputDeviceRoutingDataSource_setPredictedDevice___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 152);
  id v3 = *(id *)(a1 + 40);
  if (v2 == v3)
  {
  }
  else
  {
    id v4 = v3;
    id v5 = v2;
    char v6 = [v5 isEqual:v4];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = objc_opt_class();
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 40);
        int v12 = 138543874;
        uint64_t v13 = v8;
        __int16 v14 = 2048;
        uint64_t v15 = v9;
        __int16 v16 = 2112;
        uint64_t v17 = v10;
        id v11 = v8;
        _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Setting predicted device: %@", (uint8_t *)&v12, 0x20u);
      }
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 152), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoverySession, 0);
  objc_storeStrong((id *)&self->_companionDiscoverySession, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_presentingAppBundleID, 0);
  objc_storeStrong((id *)&self->_endpointRoute, 0);
  objc_storeStrong((id *)&self->_predictedDevice, 0);
  objc_storeStrong((id *)&self->_applicationOutputContext, 0);
  objc_storeStrong((id *)&self->_outputDeviceRoutes, 0);
  objc_storeStrong(&self->_callbackToken, 0);
  objc_storeStrong(&self->_companionCallbackToken, 0);
  objc_storeStrong((id *)&self->_discoverySessionQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (MRAVRoutingDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (MRAVRoutingDiscoverySession)companionDiscoverySession
{
  return self->_companionDiscoverySession;
}

- (void)setInitiator:(id)a3
{
}

- (NSString)initiator
{
  return self->_initiator;
}

- (void)setPresentingAppBundleID:(id)a3
{
}

- (NSString)presentingAppBundleID
{
  return self->_presentingAppBundleID;
}

- (void)setSupportsQueueHandoff:(BOOL)a3
{
  self->_supportsQueueHandoff = a3;
}

- (BOOL)supportsQueueHandoff
{
  return self->_supportsQueueHandoff;
}

- (void)setDetachesRoutesToGroup:(BOOL)a3
{
  self->_detachesRoutesToGroup = a3;
}

- (BOOL)detachesRoutesToGroup
{
  return self->_detachesRoutesToGroup;
}

- (BOOL)devicePresenceDetected
{
  return self->_devicePresenceDetected;
}

- (void)setSupportsMultipleSelection:(BOOL)a3
{
  self->_supportsMultipleSelectiouint64_t n = a3;
}

- (void)setApplicationOutputContext:(id)a3
{
}

- (id)_stateDumpObject
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"_obj";
  id v3 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  v18[0] = v3;
  v17[1] = @"predictedDevice";
  uint64_t v4 = [(MPAVOutputDeviceRoutingDataSource *)self predictedDevice];
  id v5 = (void *)v4;
  if (v4) {
    char v6 = (__CFString *)v4;
  }
  else {
    char v6 = @"<NONE>";
  }
  v18[1] = v6;
  v17[2] = @"AVOutputContext.predictedDevice";
  id v7 = [(MPAVOutputDeviceRoutingDataSource *)self applicationOutputContext];
  [v7 unwrappedValue];
  uint64_t v8 = MRAVOutputContextCopyPredictedOutputDevice();
  uint64_t v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  else {
    uint64_t v10 = @"<NONE>";
  }
  v18[2] = v10;
  v17[3] = @"AVOutputContext.outputDeviceUIDs";
  id v11 = [(MPAVOutputDeviceRoutingDataSource *)self applicationOutputContext];
  [v11 unwrappedValue];
  uint64_t v12 = MRAVOutputContextCopyOutputDevices();
  uint64_t v13 = (void *)v12;
  if (v12) {
    __int16 v14 = (__CFString *)v12;
  }
  else {
    __int16 v14 = @"<NONE>";
  }
  v18[3] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (void)_resetPredictedOutputDevice
{
  id v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "Reset predicted outputDevice", v6, 2u);
  }

  id v4 = [(MPAVOutputDeviceRoutingDataSource *)self applicationOutputContext];
  [v4 unwrappedValue];
  MRAVOutputContextResetPredictedOutputDevice();
  id v5 = [(MRAVRoutingDiscoverySession *)self->_discoverySession availableOutputDevices];
  [(MPAVOutputDeviceRoutingDataSource *)self _outputDevicesDidChange:v5];
}

- (void)_onDiscoverySessionQueue_generateCompanionDiscoverySession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoverySessionQueue);
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F76FE0]) initWithEndpointFeatures:8];
  id v3 = [MEMORY[0x1E4F76FD8] discoverySessionWithConfiguration:v4];
  [(MPAVOutputDeviceRoutingDataSource *)self setCompanionDiscoverySession:v3];
}

- (id)_outputDeviceRouteWithUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__49862;
  serialQueue = self->_serialQueue;
  __int16 v16 = __Block_byref_object_dispose__49863;
  id v17 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MPAVOutputDeviceRoutingDataSource__outputDeviceRouteWithUID___block_invoke;
  block[3] = &unk_1E57F9F48;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __63__MPAVOutputDeviceRoutingDataSource__outputDeviceRouteWithUID___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1[4] + 120);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "routeUID", (void)v10);
        int v9 = [v8 isEqualToString:a1[5]];

        if (v9)
        {
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_personalRoutesDidChange
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:self];
}

- (void)_unregisterNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F77140] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F77848] object:0];
}

- (BOOL)_isRemovingPredictedDevice:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    uint64_t v5 = [v4 firstObject];
    id v6 = [(MPAVOutputDeviceRoutingDataSource *)self predictedDevice];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldAddPredictedDeviceToOuputDevices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = [v4 count];

  if (v6 == 1) {
    int v7 = [v5 isSplitterCapable];
  }
  else {
    int v7 = 0;
  }
  uint64_t v8 = [(MPAVOutputDeviceRoutingDataSource *)self predictedDevice];
  char v9 = [v8 supportsBluetoothSharing];

  long long v10 = [v5 routeUID];
  long long v11 = [(MPAVOutputDeviceRoutingDataSource *)self predictedDevice];
  long long v12 = [v11 uid];
  char v13 = [v10 isEqualToString:v12];

  if (v7) {
    char v14 = v9 & (v13 ^ 1);
  }
  else {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)_shouldDetachOutputDevicesToGroup:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_detachesRoutesToGroup)
  {
    uint64_t v5 = [(MPAVOutputDeviceRoutingDataSource *)self endpointRoute];
    id v6 = [v5 endpointWrapper];
    [v6 unwrappedValue];
    int v7 = MRAVEndpointGetDesignatedGroupLeader();

    if (([v4 containsObject:v7] & 1) == 0)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v8 = v4;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        int v12 = 1;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            v12 &= objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "isGroupable", (void)v16);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);

        if ((v12 & 1) == 0) {
          goto LABEL_11;
        }
      }
      else
      {
      }
      BOOL v14 = (unint64_t)objc_msgSend(v8, "count", (void)v16) > 1;
      goto LABEL_15;
    }
LABEL_11:
    BOOL v14 = 0;
LABEL_15:

    goto LABEL_16;
  }
  BOOL v14 = 0;
LABEL_16:

  return v14;
}

- (id)_detachableDevicesInOutputDevices:(id)a3
{
  id v4 = objc_msgSend(a3, "msv_filter:", &__block_literal_global_61_49867);
  if ([(MPAVOutputDeviceRoutingDataSource *)self _shouldDetachOutputDevicesToGroup:v4])
  {
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

uint64_t __71__MPAVOutputDeviceRoutingDataSource__detachableDevicesInOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEligibleForWHAPlayback];
}

- (id)outputDevicesForRoutes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "outputDevices", (void)v12);
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_routeStatusDidChangeNotification:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v17 = objc_alloc_init(v4);
  uint64_t v6 = [v5 userInfo];

  uint64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F77840]];
  uint64_t v8 = [v7 objectForKey:@"RouteUID"];
  uint64_t v9 = [v6 objectForKey:*MEMORY[0x1E4F77850]];
  uint64_t v10 = [(MPAVOutputDeviceRoutingDataSource *)self _outputDeviceRouteWithUID:v8];
  uint64_t v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    [v17 setObject:v10 forKey:@"Route"];
    uint64_t v13 = [v9 integerValue];
    if ((unint64_t)(v13 - 2) <= 3)
    {
      uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPAVRoutingControllerErrorDomain" code:v13 userInfo:0];
      if (v14)
      {
        long long v15 = (void *)v14;
        [v17 setObject:v14 forKey:@"Error"];
      }
    }
  }
  if ([v17 count])
  {
    long long v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 postNotificationName:@"MPAVRoutingDataSourceFailureNotification" object:self userInfo:v17];
  }
}

- (void)_outputDevicesDidChangeNotification:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:self];
}

- (void)_endpointsDidChangeNotification:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  uint64_t v6 = [v5 name];

  [v7 postNotificationName:v6 object:self];
}

- (BOOL)routeIsLeaderOfEndpoint:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MPAVOutputDeviceRoutingDataSource.m" lineNumber:894 description:@"must be an MPAVOutputDeviceRoute"];
  }
  if ([v5 isGroupLeader]
    && ([(MPAVOutputDeviceRoutingDataSource *)self endpointRoute],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = [(MPAVOutputDeviceRoutingDataSource *)self endpoint];
    uint64_t v9 = [v8 outputDevices];
    uint64_t v10 = [v7 setWithArray:v9];

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v12 = [v5 outputDevices];
    uint64_t v13 = [v11 setWithArray:v12];

    char v14 = [v10 intersectsSet:v13];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (void)removeRoutesFromGroup:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void))a4;
  id v7 = [(MPAVOutputDeviceRoutingDataSource *)self outputDevicesForRoutes:a3];
  if ([(MPAVOutputDeviceRoutingDataSource *)self _isRemovingPredictedDevice:v7])
  {
    [(MPAVOutputDeviceRoutingDataSource *)self _resetPredictedOutputDevice];
    v6[2](v6, 0);
  }
  else
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __70__MPAVOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke;
    v38[3] = &unk_1E57F8EE0;
    v28 = v6;
    long long v39 = v6;
    uint64_t v8 = (void *)MEMORY[0x19971E0F0](v38);
    v27 = dispatch_get_global_queue(21, 0);
    uint64_t v9 = [(MPAVOutputDeviceRoutingDataSource *)self endpoint];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v10 = v7;
    id v11 = (id)[v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v11)
    {
      v24 = v8;
      v25 = self;
      id v26 = v7;
      uint64_t v12 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v10);
          }
          char v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          long long v15 = objc_msgSend(v14, "uid", v24, v25, v26);
          long long v16 = [v9 designatedGroupLeader];
          id v17 = [v16 uid];
          int v18 = [v15 isEqualToString:v17];

          if (v18)
          {
            id v11 = v14;
            goto LABEL_13;
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_13:
      self = v25;
      id v7 = v26;
      uint64_t v8 = v24;
    }

    long long v19 = (void *)[v10 mutableCopy];
    unint64_t v20 = [v10 count];
    if (v11 && v20 >= 2) {
      [v19 removeObject:v11];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__MPAVOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_3;
    block[3] = &unk_1E57F8550;
    block[4] = self;
    id v30 = v19;
    id v31 = v27;
    id v32 = v10;
    id v33 = v8;
    id v21 = v8;
    uint64_t v22 = v27;
    id v23 = v19;
    dispatch_async(v22, block);

    uint64_t v6 = v28;
  }
}

void __70__MPAVOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 copy];
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = v4;
    id v5 = v3;
    msv_dispatch_on_main_queue();
  }
}

void __70__MPAVOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_3(id *a1)
{
  id v2 = [a1[4] endpointRoute];
  id v3 = [v2 endpointWrapper];
  [v3 unwrappedValue];
  id v4 = a1[7];
  id v5 = a1[6];
  id v6 = a1[8];
  MRAVEndpointRemoveOutputDevicesWithInitiator();
}

void __70__MPAVOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification" object:*(void *)(a1 + 32)];
  [v6 postNotificationName:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 32) _detachableDevicesInOutputDevices:*(void *)(a1 + 40)];
  id v5 = v4;
  if (a2 || ![v4 count]) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else {
    [*(id *)(a1 + 32) createGroupFromOutputDevices:v5 queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

uint64_t __70__MPAVOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeRouteFromGroup:(id)a3 completion:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"MPAVOutputDeviceRoutingDataSource.m", 835, @"invalid class for %@", v11 object file lineNumber description];
  }
  v12[0] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [(MPAVOutputDeviceRoutingDataSource *)self removeRoutesFromGroup:v9 completion:v8];
}

- (void)addRoutesToGroup:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  unint64_t v20 = __65__MPAVOutputDeviceRoutingDataSource_addRoutesToGroup_completion___block_invoke;
  id v21 = &unk_1E57F8500;
  uint64_t v22 = self;
  id v7 = v6;
  id v23 = v7;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x19971E0F0](&v18);
  id v10 = -[MPAVOutputDeviceRoutingDataSource outputDevicesForRoutes:](self, "outputDevicesForRoutes:", v8, v18, v19, v20, v21, v22);
  id v11 = (void *)[v10 mutableCopy];

  LODWORD(v10) = [(MPAVOutputDeviceRoutingDataSource *)self _shouldAddPredictedDeviceToOuputDevices:v8];
  if (v10)
  {
    uint64_t v12 = [(MPAVOutputDeviceRoutingDataSource *)self predictedDevice];
    [v11 addObject:v12];
  }
  uint64_t v13 = dispatch_get_global_queue(21, 0);
  if (self->_supportsQueueHandoff
    || ([MEMORY[0x1E4F77038] sharedManager],
        char v14 = objc_claimAutoreleasedReturnValue(),
        [(MPAVOutputDeviceRoutingDataSource *)self presentingAppBundleID],
        long long v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v14 activeActivityExistsForBundle:v15],
        v15,
        v14,
        v16))
  {
    id v17 = [(MPAVOutputDeviceRoutingDataSource *)self endpoint];
    [v17 migrateToOrAddOutputDevices:v11 initiator:self->_initiator withReplyQueue:v13 completion:v9];
  }
  else
  {
    id v17 = [(MPAVOutputDeviceRoutingDataSource *)self endpoint];
    [v17 addOutputDevices:v11 initiator:self->_initiator withReplyQueue:v13 completion:v9];
  }
}

void __65__MPAVOutputDeviceRoutingDataSource_addRoutesToGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification" object:*(void *)(a1 + 32)];
  [v3 postNotificationName:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)addRouteToGroup:(id)a3 completion:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"MPAVOutputDeviceRoutingDataSource.m", 804, @"invalid class for %@", v11 object file lineNumber description];
  }
  v12[0] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [(MPAVOutputDeviceRoutingDataSource *)self addRoutesToGroup:v9 completion:v8];
}

- (void)createGroupFromOutputDevices:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = [*(id *)(*((void *)&v21 + 1) + 8 * v15) uid];
        [v10 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  id v17 = (void *)MEMORY[0x1E4F76FA8];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__MPAVOutputDeviceRoutingDataSource_createGroupFromOutputDevices_queue_completion___block_invoke;
  v19[3] = &unk_1E57F84D8;
  id v20 = v9;
  id v18 = v9;
  [v17 createEndpointWithOutputDeviceUIDs:v10 queue:v8 completion:v19];
}

uint64_t __83__MPAVOutputDeviceRoutingDataSource_createGroupFromOutputDevices_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPickedRoute:(id)a3 withPassword:(id)a4 completion:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v44 = a4;
  id v10 = a5;
  uint64_t v45 = [(MPAVOutputDeviceRoutingDataSource *)self applicationOutputContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v9;
    uint64_t v12 = [v11 outputDevices];
    uint64_t v41 = (void *)[v12 mutableCopy];

    objc_initWeak(&location, self);
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke;
    v59[3] = &unk_1E57F8430;
    objc_copyWeak(&v61, &location);
    id v13 = v10;
    id v60 = v13;
    uint64_t v14 = (void *)MEMORY[0x19971E0F0](v59);
    uint64_t v15 = dispatch_get_global_queue(21, 0);
    int v16 = [(MPAVOutputDeviceRoutingDataSource *)self endpoint];
    id v42 = [v16 outputDevices];

    id v17 = [(MPAVOutputDeviceRoutingDataSource *)self endpointRoute];
    if (v17
      && ([(MPAVOutputDeviceRoutingDataSource *)self endpoint],
          id v18 = objc_claimAutoreleasedReturnValue(),
          char v19 = [v18 isLocalEndpoint],
          v18,
          v17,
          (v19 & 1) == 0))
    {
      if (self->_supportsQueueHandoff
        || ([MEMORY[0x1E4F77038] sharedManager],
            long long v35 = objc_claimAutoreleasedReturnValue(),
            [(MPAVOutputDeviceRoutingDataSource *)self presentingAppBundleID],
            long long v36 = objc_claimAutoreleasedReturnValue(),
            int v37 = [v35 activeActivityExistsForBundle:v36],
            v36,
            v35,
            v37))
      {
        id v20 = [(MPAVOutputDeviceRoutingDataSource *)self endpoint];
        long long v38 = [v11 outputDevices];
        [v20 migrateToOrSetOutputDevices:v38 initiator:self->_initiator withReplyQueue:v15 completion:v14];
      }
      else
      {
        id v20 = [(MPAVOutputDeviceRoutingDataSource *)self endpoint];
        char v40 = [v11 outputDevices];
        [v20 setOutputDevices:v40 initiator:self->_initiator withReplyQueue:v15 completion:v14];
      }
    }
    else if (v45)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_3;
      block[3] = &unk_1E57F8458;
      id v58 = v14;
      block[4] = self;
      id v53 = v42;
      id v54 = v45;
      id v55 = v41;
      uint64_t v56 = v15;
      id v57 = v11;
      dispatch_async(v56, block);

      id v20 = v58;
    }
    else
    {
      if (!v13)
      {
LABEL_29:

        objc_destroyWeak(&v61);
        objc_destroyWeak(&location);

        goto LABEL_30;
      }
      id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPAVRoutingControllerErrorDomain" code:5 userInfo:0];
      (*((void (**)(id, void *))v13 + 2))(v13, v20);
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v21 = v45;
    if (v45)
    {
      id v43 = v9;
      id v22 = [v43 endpointWrapper];
      [v22 unwrappedValue];
      long long v23 = (void *)MRAVEndpointCopyOutputDevices();

      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v25 = v23;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v63 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v49 != v27) {
              objc_enumerationMutation(v25);
            }
            uint64_t v29 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
            id v30 = MRComputeBaseRouteUID();

            if (v30) {
              [v24 addObject:v30];
            }
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v63 count:16];
        }
        while (v26);
      }

      MRAVReconnaissanceSessionCreateWithEndpointFeatures();
      id v46 = v45;
      id v47 = v10;
      MRAVReconnaissanceSessionBeginSearch();

      goto LABEL_30;
    }
    if (v10)
    {
      long long v39 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPAVRoutingControllerErrorDomain" code:5 userInfo:0];
      (*((void (**)(id, void *))v10 + 2))(v10, v39);

LABEL_30:
      long long v21 = v45;
    }
  }
  else
  {
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    id v32 = NSStringFromSelector(a2);
    id v33 = (objc_class *)objc_opt_class();
    long long v34 = NSStringFromClass(v33);
    [v31 handleFailureInMethod:a2, self, @"MPAVOutputDeviceRoutingDataSource.m", 783, @"invalid class for %@ (%@)", v32, v34 object file lineNumber description];

    long long v21 = v45;
    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

void __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  id v6 = WeakRetained;
  msv_dispatch_on_main_queue();
}

void __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_3(uint64_t a1)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_4;
  v8[3] = &unk_1E57F8EE0;
  id v9 = *(id *)(a1 + 80);
  id v2 = (void *)MEMORY[0x19971E0F0](v8);
  id v3 = [*(id *)(a1 + 32) _detachableDevicesInOutputDevices:*(void *)(a1 + 40)];
  if ([v3 count])
  {
    [*(id *)(a1 + 48) unwrappedValue];
    id v7 = v2;
    id v5 = v3;
    id v6 = *(id *)(a1 + 64);
    MRAVOutputContextSetOutputDevicesWithInitiator();
  }
  else
  {
    if ([*(id *)(a1 + 72) isDeviceSpeakerRoute])
    {
      uint64_t v4 = [*(id *)(a1 + 32) predictedDevice];

      if (v4) {
        [*(id *)(a1 + 32) _resetPredictedOutputDevice];
      }
    }
    [*(id *)(a1 + 48) unwrappedValue];
    MRAVOutputContextSetOutputDevicesWithInitiator();
  }
}

void __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  if ([v6 count])
  {
    [*(id *)(a1 + 32) unwrappedValue];
    id v7 = dispatch_get_global_queue(21, 0);
    id v9 = *(id *)(a1 + 48);
    MRAVOutputContextSetOutputDevicesWithInitiator();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a4);
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

void __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v9 = a2;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "picked endpoint route, set devices: %{public}@", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    }
  }
  else
  {
    id v6 = dispatch_get_global_queue(21, 0);
    id v7 = *(id *)(a1 + 40);
    MRAVEndpointUpdateActiveSystemEndpointWithReason();
  }
}

uint64_t __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_42(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      uint64_t v7 = a2;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "picked endpoint route, clear system endpoint: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification" object:*(void *)(a1 + 32)];
    [v4 postNotificationName:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:*(void *)(a1 + 32)];
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

uint64_t __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) createGroupFromOutputDevices:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

void __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_2(void *a1)
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification" object:a1[4]];
  [v3 postNotificationName:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:a1[4]];
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[5]);
  }
}

uint64_t __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isTVRoute] & 1) != 0 || (objc_msgSend(v2, "isAppleTVRoute")) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 containsDeviceWithSubtype:18];
  }

  return v3;
}

uint64_t __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 isSmartAudio];
}

uint64_t __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isTVRoute] & 1) != 0 || (objc_msgSend(v2, "isAppleTVRoute")) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 containsDeviceWithSubtype:18] ^ 1;
  }

  return v3;
}

BOOL __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 routeSubtype] != 1;
}

uint64_t __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  int v6 = [a2 uid];
  uint64_t v7 = MRComputeBaseRouteUID();

  uint64_t v8 = [v5 uid];

  uint64_t v9 = MRComputeBaseRouteUID();

  int v10 = [*(id *)(a1 + 32) containsObject:v7];
  int v11 = [*(id *)(a1 + 32) containsObject:v9];
  if (!v10 || v11)
  {
    if ((v10 | v11 ^ 1) == 1) {
      uint64_t v12 = [v7 compare:v9];
    }
    else {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = -1;
  }

  return v12;
}

- (void)setDiscoveryMode:(int64_t)a3
{
  discoverySessionQueue = self->_discoverySessionQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__MPAVOutputDeviceRoutingDataSource_setDiscoveryMode___block_invoke;
  v4[3] = &unk_1E57F8328;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(discoverySessionQueue, v4);
}

uint64_t __54__MPAVOutputDeviceRoutingDataSource_setDiscoveryMode___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 144) = *(void *)(a1 + 40);
  if ((unint64_t)(*(void *)(a1 + 40) - 1) < 3) {
    uint64_t v2 = *(unsigned int *)(a1 + 40);
  }
  else {
    uint64_t v2 = 0;
  }
  [*(id *)(*(void *)(a1 + 32) + 192) setDiscoveryMode:v2];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 184);

  return [v3 setDiscoveryMode:v2];
}

- (void)setCompanionDiscoverySession:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoverySessionQueue);
  [(MRAVRoutingDiscoverySession *)self->_companionDiscoverySession removeEndpointsChangedCallback:self->_companionCallbackToken];
  objc_storeStrong((id *)&self->_companionDiscoverySession, a3);
  self->_didFindCompaniouint64_t n = 0;
  objc_initWeak(&location, self);
  companionDiscoverySessiouint64_t n = self->_companionDiscoverySession;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  int v11 = __66__MPAVOutputDeviceRoutingDataSource_setCompanionDiscoverySession___block_invoke;
  uint64_t v12 = &unk_1E57F8300;
  objc_copyWeak(&v13, &location);
  uint64_t v7 = [(MRAVRoutingDiscoverySession *)companionDiscoverySession addEndpointsChangedCallback:&v9];
  companionCallbackTokeuint64_t n = self->_companionCallbackToken;
  self->_companionCallbackTokeuint64_t n = v7;

  -[MRAVRoutingDiscoverySession setDiscoveryMode:](self->_companionDiscoverySession, "setDiscoveryMode:", 3, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __66__MPAVOutputDeviceRoutingDataSource_setCompanionDiscoverySession___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          if (!WeakRetained[96]
            && [*(id *)(*((void *)&v10 + 1) + 8 * i) isCompanionEndpoint])
          {
            msv_dispatch_sync_on_queue();
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

void __66__MPAVOutputDeviceRoutingDataSource_setCompanionDiscoverySession___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) discoverySessionConfiguration];
  uint64_t v4 = [v2 discoverySessionWithConfiguration:v3];
  [*(id *)(a1 + 32) setDiscoverySession:v4];

  *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
}

- (void)setDidReceiveDiscoveryResults:(BOOL)a3
{
  discoverySessionQueue = self->_discoverySessionQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__MPAVOutputDeviceRoutingDataSource_setDidReceiveDiscoveryResults___block_invoke;
  v4[3] = &unk_1E57F9E08;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(discoverySessionQueue, v4);
}

uint64_t __67__MPAVOutputDeviceRoutingDataSource_setDidReceiveDiscoveryResults___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 129) = *(unsigned char *)(result + 40);
  return result;
}

- (MRAVOutputDevice)predictedDevice
{
  uint64_t v4 = 0;
  BOOL v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__49862;
  uint64_t v8 = __Block_byref_object_dispose__49863;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRAVOutputDevice *)v2;
}

void __52__MPAVOutputDeviceRoutingDataSource_predictedDevice__block_invoke(uint64_t a1)
{
}

- (void)setTargetSessionID:(unsigned int)a3
{
  if (self->_targetSessionID != a3)
  {
    self->_targetSessionID = a3;
    discoverySessionQueue = self->_discoverySessionQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __56__MPAVOutputDeviceRoutingDataSource_setTargetSessionID___block_invoke;
    v4[3] = &unk_1E57F9C60;
    v4[4] = self;
    unsigned int v5 = a3;
    dispatch_async(discoverySessionQueue, v4);
  }
}

uint64_t __56__MPAVOutputDeviceRoutingDataSource_setTargetSessionID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 192) setTargetAudioSessionID:*(unsigned int *)(a1 + 40)];
}

- (void)setEndpointRoute:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v4 = a3;
  msv_dispatch_sync_on_queue();
  if (*((unsigned char *)v7 + 24))
  {
    [(MPAVOutputDeviceRoutingDataSource *)self setDidReceiveDiscoveryResults:0];
    unsigned int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:@"MPAVRouteDidChangeNotification" object:0];
    [v5 addObserver:self selector:sel__personalRoutesDidChange name:@"MPAVRouteDidChangeNotification" object:v4];
    [v5 postNotificationName:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:self];
    [v5 postNotificationName:@"MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification" object:self];
    [(MPAVOutputDeviceRoutingDataSource *)self _generateDiscoverySession];
  }
  _Block_object_dispose(&v6, 8);
}

void __54__MPAVOutputDeviceRoutingDataSource_setEndpointRoute___block_invoke(uint64_t a1)
{
  id v5 = *(id *)(*(void *)(a1 + 32) + 160);
  id v2 = *(id *)(a1 + 40);
  if (v5 == v2)
  {
  }
  else
  {
    id v3 = v5;
    char v4 = [v3 isEqual:v2];

    if ((v4 & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), *(id *)(a1 + 40));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

- (void)setRoutingContextUID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MPAVOutputDeviceRoutingDataSource.m", 160, @"Invalid parameter not satisfying: %@", @"routingContextUID" object file lineNumber description];
  }
  uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    *(_DWORD *)long long buf = 138543874;
    int v16 = v8;
    __int16 v17 = 2048;
    id v18 = self;
    __int16 v19 = 2114;
    id v20 = v5;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> setting routing context UID = %{public}@", buf, 0x20u);
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MPAVOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke;
  block[3] = &unk_1E57F9F98;
  block[4] = self;
  id v14 = v5;
  id v10 = v5;
  dispatch_sync(serialQueue, block);
  long long v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:self];
  [v11 postNotificationName:@"MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification" object:self];
}

void __58__MPAVOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 136);
  *(void *)(v2 + 136) = 0;

  char v4 = [(id)objc_opt_class() _globalAudioSessionLock];
  [v4 lock];
  uint64_t RoutingContext = MRAVOutputContextCreateRoutingContext();
  if (RoutingContext)
  {
    uint64_t v6 = (const void *)RoutingContext;
    uint64_t v7 = [[MPMRAVOutputContextWrapper alloc] initWithMRAVOutputContext:RoutingContext];
    uint64_t v8 = *(void *)(a1 + 32);
    char v9 = *(void **)(v8 + 136);
    *(void *)(v8 + 136) = v7;

    CFRelease(v6);
  }
  [v4 unlock];
  uint64_t v10 = *(void *)(a1 + 32);
  long long v11 = *(NSObject **)(v10 + 72);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __58__MPAVOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke_2;
  v12[3] = &unk_1E57F9F98;
  v12[4] = v10;
  id v13 = *(id *)(a1 + 40);
  dispatch_async(v11, v12);
}

uint64_t __58__MPAVOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 192) setRoutingContextUID:*(void *)(a1 + 40)];
}

- (NSString)routingContextUID
{
  id v2 = [(MPAVOutputDeviceRoutingDataSource *)self applicationOutputContext];
  [v2 unwrappedValue];
  id v3 = (void *)MRAVOutputContextCopyUniqueIdentifier();

  return (NSString *)v3;
}

- (void)dealloc
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __44__MPAVOutputDeviceRoutingDataSource_dealloc__block_invoke;
  uint64_t v7 = &unk_1E57F9EA8;
  uint64_t v8 = self;
  msv_dispatch_sync_on_queue();
  [(MPAVOutputDeviceRoutingDataSource *)self _unregisterNotifications];
  v3.receiver = self;
  v3.super_class = (Class)MPAVOutputDeviceRoutingDataSource;
  [(MPAVRoutingDataSource *)&v3 dealloc];
}

uint64_t __44__MPAVOutputDeviceRoutingDataSource_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 192) removeOutputDevicesChangedCallback:*(void *)(*(void *)(a1 + 32) + 104)];
  [*(id *)(*(void *)(a1 + 32) + 192) setDiscoveryMode:0];
  [*(id *)(*(void *)(a1 + 32) + 184) removeEndpointsChangedCallback:*(void *)(*(void *)(a1 + 32) + 88)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 184);

  return [v2 setDiscoveryMode:0];
}

+ (id)_globalAudioSessionLock
{
  if (_globalAudioSessionLock___once != -1) {
    dispatch_once(&_globalAudioSessionLock___once, &__block_literal_global_63_49935);
  }
  id v2 = (void *)_globalAudioSessionLock___globalAudioSessionLock;

  return v2;
}

void __60__MPAVOutputDeviceRoutingDataSource__globalAudioSessionLock__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v1 = (void *)_globalAudioSessionLock___globalAudioSessionLock;
  _globalAudioSessionLock___globalAudioSessionLocuint64_t k = (uint64_t)v0;
}

@end