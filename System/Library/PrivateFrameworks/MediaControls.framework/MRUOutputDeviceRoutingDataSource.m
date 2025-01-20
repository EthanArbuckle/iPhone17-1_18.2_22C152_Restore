@interface MRUOutputDeviceRoutingDataSource
+ (id)_globalAudioSessionLock;
- (BOOL)_isRemovingPredictedDevice:(id)a3;
- (BOOL)_shouldAddPredictedDeviceToOuputDevices:(id)a3;
- (BOOL)_shouldDetachOutputDevicesToGroup:(id)a3;
- (BOOL)detachesRoutesToGroup;
- (BOOL)devicePresenceDetected;
- (BOOL)didReceiveDiscoveryResults;
- (BOOL)isDonatingAppEligible;
- (BOOL)routeIsLeaderOfEndpoint:(id)a3;
- (BOOL)subscribed;
- (BOOL)supportsMultipleSelection;
- (BOOL)supportsQueueHandoff;
- (MPAVEndpointRoute)endpointRoute;
- (MPAVOutputDeviceRoute)hearingDeviceRoute;
- (MPMRAVOutputContextWrapper)applicationOutputContext;
- (MRAVEndpoint)endpoint;
- (MRAVOutputDevice)predictedDevice;
- (MRAVRoutingDiscoverySession)companionDiscoverySession;
- (MRAVRoutingDiscoverySession)discoverySession;
- (MRAVRoutingDiscoverySessionConfiguration)discoverySessionConfiguration;
- (MRUODRDSNoticationObserver)notificationObserver;
- (MRUOutputDeviceRoutingDataSource)init;
- (MRUOutputDeviceRoutingDataSourceObserver)hearingAidDelegate;
- (NSArray)visibleMediaApps;
- (NSString)donatingAppBundleID;
- (NSString)hearingDeviceName;
- (NSString)initiator;
- (NSString)nowPlayingAppBundleID;
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
- (void)addHearingAidRouteIfNeededToRoutes:(id)a3;
- (void)addRouteToGroup:(id)a3 completion:(id)a4;
- (void)addRoutesToGroup:(id)a3 completion:(id)a4;
- (void)createGroupFromOutputDevices:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)hearingAidReachabilityDidChange;
- (void)removeRouteFromGroup:(id)a3 completion:(id)a4;
- (void)removeRoutesFromGroup:(id)a3 completion:(id)a4;
- (void)setApplicationOutputContext:(id)a3;
- (void)setCompanionDiscoverySession:(id)a3;
- (void)setDetachesRoutesToGroup:(BOOL)a3;
- (void)setDidReceiveDiscoveryResults:(BOOL)a3;
- (void)setDiscoveryMode:(int64_t)a3;
- (void)setDiscoverySession:(id)a3;
- (void)setDonatingAppBundleID:(id)a3;
- (void)setDonatingAppEligible:(BOOL)a3;
- (void)setEndpointRoute:(id)a3;
- (void)setHearingAidDelegate:(id)a3;
- (void)setHearingDeviceName:(id)a3;
- (void)setHearingDeviceRoute:(id)a3;
- (void)setInitiator:(id)a3;
- (void)setNotificationObserver:(id)a3;
- (void)setNowPlayingAppBundleID:(id)a3;
- (void)setPickedRoute:(id)a3 withPassword:(id)a4 completion:(id)a5;
- (void)setPredictedDevice:(id)a3;
- (void)setPresentingAppBundleID:(id)a3;
- (void)setRoutingContextUID:(id)a3;
- (void)setSubscribed:(BOOL)a3;
- (void)setSupportsMultipleSelection:(BOOL)a3;
- (void)setSupportsQueueHandoff:(BOOL)a3;
- (void)setTargetSessionID:(unsigned int)a3;
- (void)setVisibleMediaApps:(id)a3;
@end

@implementation MRUOutputDeviceRoutingDataSource

- (MRUOutputDeviceRoutingDataSource)init
{
  return (MRUOutputDeviceRoutingDataSource *)[(MRUOutputDeviceRoutingDataSource *)self _initWithEndpointRoute:0];
}

- (id)_initWithEndpointRoute:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MRUOutputDeviceRoutingDataSource;
  v6 = [(MPAVRoutingDataSource *)&v18 init];
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
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F318E8]) initWithMRAVOutputContext:SharedAudioPresentationContext];
      applicationOutputContext = v6->_applicationOutputContext;
      v6->_applicationOutputContext = (MPMRAVOutputContextWrapper *)v12;

      SharedAudioPresentationContext = (void *)MRAVOutputContextCopyUniqueIdentifier();
    }
    v14 = MCLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v20 = SharedAudioPresentationContext;
      __int16 v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_1AE7DF000, v14, OS_LOG_TYPE_DEFAULT, "Created new application output context: %{public}@ for data source: %{public}@", buf, 0x16u);
    }

    [(MRUOutputDeviceRoutingDataSource *)v6 _registerNotifications];
    [(MRUOutputDeviceRoutingDataSource *)v6 _generateDiscoverySession];
    [(MRUOutputDeviceRoutingDataSource *)v6 hearingAidReachabilityDidChange];
    v15 = [[MRUODRDSNoticationObserver alloc] initWithDelegate:v6];
    notificationObserver = v6->_notificationObserver;
    v6->_notificationObserver = v15;
  }
  return v6;
}

- (void)dealloc
{
  [(MRUODRDSNoticationObserver *)self->_notificationObserver endObservation];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __43__MRUOutputDeviceRoutingDataSource_dealloc__block_invoke;
  dispatch_queue_t v7 = &unk_1E5F0D7F8;
  v8 = self;
  msv_dispatch_sync_on_queue();
  [(MRUOutputDeviceRoutingDataSource *)self _unregisterNotifications];
  v3.receiver = self;
  v3.super_class = (Class)MRUOutputDeviceRoutingDataSource;
  [(MPAVRoutingDataSource *)&v3 dealloc];
}

uint64_t __43__MRUOutputDeviceRoutingDataSource_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 240) removeOutputDevicesChangedCallback:*(void *)(*(void *)(a1 + 32) + 104)];
  [*(id *)(*(void *)(a1 + 32) + 240) setDiscoveryMode:0];
  [*(id *)(*(void *)(a1 + 32) + 232) removeEndpointsChangedCallback:*(void *)(*(void *)(a1 + 32) + 88)];
  v2 = *(void **)(*(void *)(a1 + 32) + 232);

  return [v2 setDiscoveryMode:0];
}

- (MPMRAVOutputContextWrapper)applicationOutputContext
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__MRUOutputDeviceRoutingDataSource_applicationOutputContext__block_invoke;
  v5[3] = &unk_1E5F0EF88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPMRAVOutputContextWrapper *)v3;
}

void __60__MRUOutputDeviceRoutingDataSource_applicationOutputContext__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) endpoint];
  if (!v4
    || ([*(id *)(a1 + 32) endpoint],
        v1 = objc_claimAutoreleasedReturnValue(),
        [v1 isLocalEndpoint]))
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 144);
  }
  else
  {
    id v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  if (v4) {
}
  }

- (NSString)routingContextUID
{
  id v2 = [(MRUOutputDeviceRoutingDataSource *)self applicationOutputContext];
  [v2 unwrappedValue];
  id v3 = (void *)MRAVOutputContextCopyUniqueIdentifier();

  return (NSString *)v3;
}

- (void)setRoutingContextUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MCLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    dispatch_queue_t v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543874;
    objc_super v18 = v7;
    __int16 v19 = 2048;
    v20 = self;
    __int16 v21 = 2114;
    id v22 = v4;
    _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> setting routing context UID = %{public}@", buf, 0x20u);
  }
  serialQueue = self->_serialQueue;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __57__MRUOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke;
  v14 = &unk_1E5F0D8E8;
  v15 = self;
  id v16 = v4;
  id v9 = v4;
  dispatch_sync(serialQueue, &v11);
  v10 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v11, v12, v13, v14, v15);
  [v10 postNotificationName:*MEMORY[0x1E4F31280] object:self];
  [v10 postNotificationName:*MEMORY[0x1E4F31260] object:self];
}

void __57__MRUOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 144);
  *(void *)(v2 + 144) = 0;

  id v4 = [(id)objc_opt_class() _globalAudioSessionLock];
  [v4 lock];
  uint64_t RoutingContext = MRAVOutputContextCreateRoutingContext();
  if (RoutingContext)
  {
    uint64_t v6 = (const void *)RoutingContext;
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F318E8]) initWithMRAVOutputContext:RoutingContext];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 144);
    *(void *)(v8 + 144) = v7;

    CFRelease(v6);
  }
  [v4 unlock];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(NSObject **)(v10 + 72);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__MRUOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke_2;
  v12[3] = &unk_1E5F0D8E8;
  v12[4] = v10;
  id v13 = *(id *)(a1 + 40);
  dispatch_async(v11, v12);
}

uint64_t __57__MRUOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 240) setRoutingContextUID:*(void *)(a1 + 40)];
}

- (void)setEndpointRoute:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = a3;
  msv_dispatch_sync_on_queue();
  if (*((unsigned char *)v8 + 24))
  {
    [(MRUOutputDeviceRoutingDataSource *)self setDidReceiveDiscoveryResults:0];
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4F31248];
    [v5 removeObserver:self name:*MEMORY[0x1E4F31248] object:0];
    [v5 addObserver:self selector:sel__personalRoutesDidChange name:v6 object:v4];
    [v5 postNotificationName:*MEMORY[0x1E4F31280] object:self];
    [v5 postNotificationName:*MEMORY[0x1E4F31260] object:self];
    [(MRUOutputDeviceRoutingDataSource *)self _generateDiscoverySession];
  }
  _Block_object_dispose(&v7, 8);
}

void __53__MRUOutputDeviceRoutingDataSource_setEndpointRoute___block_invoke(uint64_t a1)
{
  id v5 = *(id *)(*(void *)(a1 + 32) + 168);
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
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), *(id *)(a1 + 40));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

- (void)setTargetSessionID:(unsigned int)a3
{
  if (self->_targetSessionID != a3)
  {
    self->_targetSessionID = a3;
    discoverySessionQueue = self->_discoverySessionQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__MRUOutputDeviceRoutingDataSource_setTargetSessionID___block_invoke;
    v4[3] = &unk_1E5F0E2E8;
    v4[4] = self;
    unsigned int v5 = a3;
    dispatch_async(discoverySessionQueue, v4);
  }
}

uint64_t __55__MRUOutputDeviceRoutingDataSource_setTargetSessionID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 240) setTargetAudioSessionID:*(unsigned int *)(a1 + 40)];
}

- (MRAVEndpoint)endpoint
{
  uint64_t v4 = 0;
  unsigned int v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__1;
  uint64_t v8 = __Block_byref_object_dispose__1;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRAVEndpoint *)v2;
}

void __44__MRUOutputDeviceRoutingDataSource_endpoint__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 168) endpointWrapper];
  uint64_t v2 = [v5 unwrappedValue];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (MPAVEndpointRoute)endpointRoute
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__1;
  uint64_t v8 = __Block_byref_object_dispose__1;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MPAVEndpointRoute *)v2;
}

void __49__MRUOutputDeviceRoutingDataSource_endpointRoute__block_invoke(uint64_t a1)
{
}

- (BOOL)supportsMultipleSelection
{
  return self->_supportsMultipleSelection;
}

- (MRAVOutputDevice)predictedDevice
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__1;
  uint64_t v8 = __Block_byref_object_dispose__1;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRAVOutputDevice *)v2;
}

void __51__MRUOutputDeviceRoutingDataSource_predictedDevice__block_invoke(uint64_t a1)
{
}

- (void)setPredictedDevice:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__MRUOutputDeviceRoutingDataSource_setPredictedDevice___block_invoke;
  v7[3] = &unk_1E5F0D8E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __55__MRUOutputDeviceRoutingDataSource_setPredictedDevice___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 160);
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
      uint64_t v7 = MCLogCategoryDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = objc_opt_class();
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 40);
        int v12 = 138543874;
        id v13 = v8;
        __int16 v14 = 2048;
        uint64_t v15 = v9;
        __int16 v16 = 2112;
        uint64_t v17 = v10;
        id v11 = v8;
        _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Setting predicted device: %@", (uint8_t *)&v12, 0x20u);
      }
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), *(id *)(a1 + 40));
}

- (BOOL)didReceiveDiscoveryResults
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  discoverySessionQueue = self->_discoverySessionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__MRUOutputDeviceRoutingDataSource_didReceiveDiscoveryResults__block_invoke;
  v5[3] = &unk_1E5F0EF88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(discoverySessionQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__MRUOutputDeviceRoutingDataSource_didReceiveDiscoveryResults__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 129);
  return result;
}

- (void)setDidReceiveDiscoveryResults:(BOOL)a3
{
  discoverySessionQueue = self->_discoverySessionQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__MRUOutputDeviceRoutingDataSource_setDidReceiveDiscoveryResults___block_invoke;
  v4[3] = &unk_1E5F0D8C0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(discoverySessionQueue, v4);
}

uint64_t __66__MRUOutputDeviceRoutingDataSource_setDidReceiveDiscoveryResults___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 129) = *(unsigned char *)(result + 40);
  return result;
}

- (NSString)hearingDeviceName
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__1;
  uint64_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__MRUOutputDeviceRoutingDataSource_hearingDeviceName__block_invoke;
  v5[3] = &unk_1E5F0EF88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __53__MRUOutputDeviceRoutingDataSource_hearingDeviceName__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 176) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setHearingDeviceName:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__MRUOutputDeviceRoutingDataSource_setHearingDeviceName___block_invoke;
  v7[3] = &unk_1E5F0D8E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __57__MRUOutputDeviceRoutingDataSource_setHearingDeviceName___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 176) isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 176);
    *(void *)(v3 + 176) = v2;
  }
}

- (MRAVRoutingDiscoverySessionConfiguration)discoverySessionConfiguration
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F76FE0]) initWithEndpointFeatures:1];
  objc_msgSend(v3, "setTargetAudioSessionID:", -[MRUOutputDeviceRoutingDataSource targetSessionID](self, "targetSessionID"));

  return (MRAVRoutingDiscoverySessionConfiguration *)v3;
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
  block[2] = __56__MRUOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke;
  block[3] = &unk_1E5F0D8E8;
  block[4] = self;
  id v7 = v5;
  id v17 = v7;
  dispatch_sync(serialQueue, block);
  objc_storeStrong((id *)&self->_discoverySession, a3);
  self->_devicePresenceDetected = [(MRAVRoutingDiscoverySession *)self->_discoverySession devicePresenceDetected];
  self->_didReceiveDiscoveryResults = 0;
  objc_initWeak(&location, self);
  discoverySession = self->_discoverySession;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__MRUOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_2;
  v12[3] = &unk_1E5F0FDA0;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v13 = v9;
  uint64_t v10 = [(MRAVRoutingDiscoverySession *)discoverySession addOutputDevicesChangedCallback:v12];
  id callbackToken = self->_callbackToken;
  self->_id callbackToken = v10;

  [(MRAVRoutingDiscoverySession *)self->_discoverySession setDiscoveryMode:MPAVMRRouteDiscoveryModeFromDiscoveryMode()];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __56__MRUOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 144);
  if (v2)
  {
    [v2 unwrappedValue];
    id v3 = (id)MRAVOutputContextCopyUniqueIdentifier();
    [*(id *)(a1 + 40) setRoutingContextUID:v3];
  }
}

void __56__MRUOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v11 = 0;
    int v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v7 = MEMORY[0x1E4F143A8];
    id v8 = WeakRetained;
    id v9 = *(id *)(a1 + 32);
    id v6 = v3;
    uint64_t v10 = v6;
    msv_dispatch_sync_on_queue();
    if (*((unsigned char *)v12 + 24)) {
      objc_msgSend(v5, "_outputDevicesDidChange:", v6, v7, 3221225472, __56__MRUOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_3, &unk_1E5F0FD78, v8, v9, v6, &v11);
    }

    _Block_object_dispose(&v11, 8);
  }
}

void *__56__MRUOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  result = *(void **)(*(void *)(a1 + 32) + 240);
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

- (void)setCompanionDiscoverySession:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoverySessionQueue);
  [(MRAVRoutingDiscoverySession *)self->_companionDiscoverySession removeEndpointsChangedCallback:self->_companionCallbackToken];
  objc_storeStrong((id *)&self->_companionDiscoverySession, a3);
  self->_didFindCompanion = 0;
  objc_initWeak(&location, self);
  companionDiscoverySession = self->_companionDiscoverySession;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __65__MRUOutputDeviceRoutingDataSource_setCompanionDiscoverySession___block_invoke;
  int v12 = &unk_1E5F0FDC8;
  objc_copyWeak(&v13, &location);
  uint64_t v7 = [(MRAVRoutingDiscoverySession *)companionDiscoverySession addEndpointsChangedCallback:&v9];
  id companionCallbackToken = self->_companionCallbackToken;
  self->_id companionCallbackToken = v7;

  -[MRAVRoutingDiscoverySession setDiscoveryMode:](self->_companionDiscoverySession, "setDiscoveryMode:", 3, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __65__MRUOutputDeviceRoutingDataSource_setCompanionDiscoverySession___block_invoke(uint64_t a1, void *a2)
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

void __65__MRUOutputDeviceRoutingDataSource_setCompanionDiscoverySession___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) discoverySessionConfiguration];
  id v4 = [v2 discoverySessionWithConfiguration:v3];
  [*(id *)(a1 + 32) setDiscoverySession:v4];

  *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
}

- (void)setDiscoveryMode:(int64_t)a3
{
  discoverySessionQueue = self->_discoverySessionQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__MRUOutputDeviceRoutingDataSource_setDiscoveryMode___block_invoke;
  v4[3] = &unk_1E5F0DBF8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(discoverySessionQueue, v4);
}

uint64_t __53__MRUOutputDeviceRoutingDataSource_setDiscoveryMode___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 152) = *(void *)(a1 + 40);
  uint64_t v2 = MPAVMRRouteDiscoveryModeFromDiscoveryMode();
  [*(id *)(*(void *)(a1 + 32) + 240) setDiscoveryMode:v2];
  id v3 = *(void **)(*(void *)(a1 + 32) + 232);

  return [v3 setDiscoveryMode:v2];
}

- (int64_t)discoveryMode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  discoverySessionQueue = self->_discoverySessionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__MRUOutputDeviceRoutingDataSource_discoveryMode__block_invoke;
  v5[3] = &unk_1E5F0EF88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(discoverySessionQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__MRUOutputDeviceRoutingDataSource_discoveryMode__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 152);
  return result;
}

- (id)getRoutesForCategory:(id)a3
{
  uint64_t v203 = *MEMORY[0x1E4F143B8];
  id v111 = a3;
  id v112 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v121 = self;
  id v4 = [(MRUOutputDeviceRoutingDataSource *)self endpointRoute];
  v122 = [(MRUOutputDeviceRoutingDataSource *)v121 applicationOutputContext];
  uint64_t v184 = 0;
  v185 = &v184;
  uint64_t v186 = 0x3032000000;
  v187 = __Block_byref_object_copy__1;
  v188 = __Block_byref_object_dispose__1;
  id v189 = 0;
  uint64_t v177 = MEMORY[0x1E4F143A8];
  uint64_t v178 = 3221225472;
  v179 = __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke;
  v180 = &unk_1E5F0E148;
  v183 = &v184;
  v181 = v121;
  id v5 = v4;
  id v182 = v5;
  msv_dispatch_sync_on_queue();
  v113 = v5;
  if ([v5 isPhoneRoute])
  {
    id v124 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v175 = 0u;
    long long v176 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    id v6 = (id)v185[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v173 objects:v202 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v174;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v174 != v8) {
            objc_enumerationMutation(v6);
          }
          long long v10 = *(void **)(*((void *)&v173 + 1) + 8 * i);
          long long v11 = [v10 groupID];
          long long v12 = [(MRUOutputDeviceRoutingDataSource *)v121 endpoint];
          long long v13 = [v12 groupLeader];
          char v14 = [v13 groupID];
          int v15 = [v11 isEqualToString:v14];

          if (v15) {
            [v124 addObject:v10];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v173 objects:v202 count:16];
      }
      while (v7);
    }

    __int16 v16 = (void *)[v124 copy];
    goto LABEL_12;
  }
  if (v5)
  {
    uint64_t v18 = [v5 endpointObject];
    __int16 v16 = [v18 resolvedOutputDevices];

    int v17 = [v113 isDeviceRoute] ^ 1;
  }
  else
  {
    if (v122)
    {
      [v122 unwrappedValue];
      __int16 v16 = (void *)MRAVOutputContextCopyOutputDevices();
LABEL_12:
      int v17 = 0;
      goto LABEL_15;
    }
    __int16 v16 = 0;
    int v17 = 1;
  }
LABEL_15:
  id v116 = v122;
  [v116 unwrappedValue];
  uint64_t v19 = MRAVOutputContextCopyPredictedOutputDevice();
  v117 = (void *)v19;
  if (v19)
  {
    uint64_t v201 = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v201 count:1];

    __int16 v16 = (void *)v20;
  }
  -[MRUOutputDeviceRoutingDataSource setPredictedDevice:](v121, "setPredictedDevice:");
  uint64_t v21 = [v16 count];
  id v119 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v110 = v21;
  if (v17)
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    id v23 = v16;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v169 objects:v200 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v170;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v170 != v25) {
            objc_enumerationMutation(v23);
          }
          v27 = *(void **)(*((void *)&v169 + 1) + 8 * j);
          v28 = objc_msgSend(v27, "logicalDeviceID", v110, v111);
          if ([v27 isProxyGroupPlayer] && objc_msgSend(v28, "length")) {
            [v22 addObject:v28];
          }
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v169 objects:v200 count:16];
      }
      while (v24);
    }

    long long v167 = 0u;
    long long v168 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    id v29 = v23;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v165 objects:v199 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v166;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v166 != v31) {
            objc_enumerationMutation(v29);
          }
          v33 = *(void **)(*((void *)&v165 + 1) + 8 * k);
          v34 = objc_msgSend(v33, "uid", v110);
          v35 = MRComputeBaseRouteUID();

          v36 = [v33 logicalDeviceID];
          if (v35
            && ([v33 isProxyGroupPlayer] & 1) == 0
            && (![v36 length] || (objc_msgSend(v22, "containsObject:", v36) & 1) == 0))
          {
            [v119 addObject:v35];
          }
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v165 objects:v199 count:16];
      }
      while (v30);
    }
  }
  else
  {
    long long v163 = 0u;
    long long v164 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    id v22 = v16;
    uint64_t v37 = [v22 countByEnumeratingWithState:&v161 objects:v198 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v162;
      do
      {
        for (uint64_t m = 0; m != v37; ++m)
        {
          if (*(void *)v162 != v38) {
            objc_enumerationMutation(v22);
          }
          v40 = objc_msgSend(*(id *)(*((void *)&v161 + 1) + 8 * m), "uid", v110, v111);
          v41 = MRComputeBaseRouteUID();

          if (v41) {
            [v119 addObject:v41];
          }
        }
        uint64_t v37 = [v22 countByEnumeratingWithState:&v161 objects:v198 count:16];
      }
      while (v37);
    }
  }

  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  obuint64_t j = v16;
  uint64_t v42 = [obj countByEnumeratingWithState:&v157 objects:v197 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v158;
    while (2)
    {
      for (uint64_t n = 0; n != v42; ++n)
      {
        if (*(void *)v158 != v43) {
          objc_enumerationMutation(obj);
        }
        v45 = *(void **)(*((void *)&v157 + 1) + 8 * n);
        v46 = objc_msgSend(v45, "uid", v110);
        v47 = MRComputeBaseRouteUID();

        if (!v47)
        {
          v49 = MCLogCategoryDefault();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v45;
            _os_log_impl(&dword_1AE7DF000, v49, OS_LOG_TYPE_DEFAULT, "Found picked device with nil UID: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          char v48 = 0;
          goto LABEL_62;
        }
      }
      uint64_t v42 = [obj countByEnumeratingWithState:&v157 objects:v197 count:16];
      if (v42) {
        continue;
      }
      break;
    }
  }
  char v48 = 1;
LABEL_62:

  id v50 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v51 = objc_msgSend(v50, "initWithCapacity:", objc_msgSend((id)v185[5], "count"));
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  id v52 = (id)v185[5];
  uint64_t v53 = [v52 countByEnumeratingWithState:&v153 objects:v196 count:16];
  if (v53)
  {
    v125 = 0;
    uint64_t v54 = *(void *)v154;
    do
    {
      for (iuint64_t i = 0; ii != v53; ++ii)
      {
        if (*(void *)v154 != v54) {
          objc_enumerationMutation(v52);
        }
        v56 = *(void **)(*((void *)&v153 + 1) + 8 * ii);
        if (objc_msgSend(v56, "isLocalDevice", v110))
        {
          id v57 = v56;

          v125 = v57;
        }
        v58 = [v56 uid];
        v59 = MRComputeBaseRouteUID();

        if (v59)
        {
          [v51 addObject:v59];
        }
        else
        {
          v60 = MCLogCategoryDefault();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v56;
            _os_log_impl(&dword_1AE7DF000, v60, OS_LOG_TYPE_DEFAULT, "Found discovery device with nil UID: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          char v48 = 0;
        }
      }
      uint64_t v53 = [v52 countByEnumeratingWithState:&v153 objects:v196 count:16];
    }
    while (v53);
  }
  else
  {
    v125 = 0;
  }

  -[MRUOutputDeviceRoutingDataSource _setShouldSourceOutputDevicesFromAVODDS:](v121, "_setShouldSourceOutputDevicesFromAVODDS:", ([(id)v185[5] count] != 0) & v48);
  if (v121->_shouldSourceOutputDevicesFromAVODDS)
  {
    v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(obj, "count"));
    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    id v62 = obj;
    uint64_t v63 = [v62 countByEnumeratingWithState:&v149 objects:v195 count:16];
    if (v63)
    {
      uint64_t v64 = *(void *)v150;
      do
      {
        for (juint64_t j = 0; jj != v63; ++jj)
        {
          if (*(void *)v150 != v64) {
            objc_enumerationMutation(v62);
          }
          v66 = *(void **)(*((void *)&v149 + 1) + 8 * jj);
          v67 = objc_msgSend(v66, "uid", v110);
          v68 = MRComputeBaseRouteUID();

          if (([v51 containsObject:v68] & 1) == 0) {
            [v61 addObject:v66];
          }
        }
        uint64_t v63 = [v62 countByEnumeratingWithState:&v149 objects:v195 count:16];
      }
      while (v63);
    }

    uint64_t v69 = [v61 count];
    v70 = (void *)v185[5];
    if (v69)
    {
      v71 = (void *)[v70 mutableCopy];
      v72 = [v71 arrayByAddingObjectsFromArray:v61];

LABEL_110:
      char v114 = 0;
      goto LABEL_111;
    }
    id v77 = v70;
LABEL_109:
    v72 = v77;
    goto LABEL_110;
  }
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  id v73 = obj;
  uint64_t v74 = [v73 countByEnumeratingWithState:&v145 objects:v194 count:16];
  if (v74)
  {
    uint64_t v75 = *(void *)v146;
    while (2)
    {
      for (kuint64_t k = 0; kk != v74; ++kk)
      {
        if (*(void *)v146 != v75) {
          objc_enumerationMutation(v73);
        }
        if (objc_msgSend(*(id *)(*((void *)&v145 + 1) + 8 * kk), "isLocalDevice", v110))
        {
          char v114 = 1;
          goto LABEL_101;
        }
      }
      uint64_t v74 = [v73 countByEnumeratingWithState:&v145 objects:v194 count:16];
      if (v74) {
        continue;
      }
      break;
    }
  }
  char v114 = 0;
LABEL_101:

  id v78 = v73;
  v61 = v78;
  if (v125) {
    char v79 = v114;
  }
  else {
    char v79 = 1;
  }
  if ((v79 & 1) == 0)
  {
    objc_msgSend(v78, "arrayByAddingObject:");
    id v77 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_109;
  }
  v72 = v78;
LABEL_111:
  id v80 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v81 = objc_msgSend(v80, "initWithCapacity:", objc_msgSend((id)v185[5], "count"));
  id v82 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v83 = objc_msgSend(v82, "initWithCapacity:", objc_msgSend((id)v185[5], "count"));
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id v123 = v72;
  char v84 = 0;
  uint64_t v85 = [v123 countByEnumeratingWithState:&v141 objects:v193 count:16];
  if (!v85) {
    goto LABEL_125;
  }
  uint64_t v86 = *(void *)v142;
  do
  {
    for (muint64_t m = 0; mm != v85; ++mm)
    {
      if (*(void *)v142 != v86) {
        objc_enumerationMutation(v123);
      }
      v88 = *(void **)(*((void *)&v141 + 1) + 8 * mm);
      uint64_t v89 = objc_msgSend(v88, "logicalDeviceID", v110);
      v90 = (void *)v89;
      if (v84)
      {
        char v84 = 1;
        if (!v89) {
          goto LABEL_122;
        }
      }
      else
      {
        char v84 = [v88 isPickedOnPairedDevice];
        if (!v90)
        {
LABEL_122:
          [v83 addObject:v88];
          goto LABEL_123;
        }
      }
      id v91 = [v81 objectForKey:v90];
      if (!v91)
      {
        id v91 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [v81 setObject:v91 forKey:v90];
      }
      [v91 addObject:v88];

LABEL_123:
    }
    uint64_t v85 = [v123 countByEnumeratingWithState:&v141 objects:v193 count:16];
  }
  while (v85);
LABEL_125:

  id v92 = v113;
  v93 = v92;
  if (v92) {
    char v94 = [v92 isDeviceRoute];
  }
  else {
    char v94 = 1;
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v191 = 0x2020000000;
  char v192 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_30;
  aBlock[3] = &unk_1E5F0FE18;
  aBlock[4] = v121;
  char v138 = v94;
  char v139 = v84;
  p_long long buf = &buf;
  uint64_t v137 = v110;
  id v120 = v119;
  id v134 = v120;
  char v140 = v114;
  id v95 = v112;
  id v135 = v95;
  v96 = _Block_copy(aBlock);
  serialQueue = v121->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_3;
  block[3] = &unk_1E5F0FE60;
  block[4] = v121;
  id v98 = v95;
  id v127 = v98;
  id v99 = v81;
  id v128 = v99;
  id v100 = v96;
  id v131 = v100;
  id v101 = v83;
  id v129 = v101;
  id v115 = v111;
  id v130 = v115;
  char v132 = v94;
  dispatch_sync(serialQueue, block);
  uint64_t v102 = [(MPAVRoutingDataSource *)v121 filterMode];
  switch(v102)
  {
    case 1:
      v103 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_37];
      v104 = [v98 filteredArrayUsingPredicate:v103];
      uint64_t v105 = [v104 mutableCopy];
LABEL_134:
      v106 = (void *)v105;

      goto LABEL_136;
    case 2:
      v103 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_41_0];
      v104 = [v98 filteredArrayUsingPredicate:v103];
      uint64_t v105 = [v104 mutableCopy];
      goto LABEL_134;
    case 3:
      v103 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_39_1];
      v104 = [v98 filteredArrayUsingPredicate:v103];
      uint64_t v105 = [v104 mutableCopy];
      goto LABEL_134;
  }
  v106 = v98;
LABEL_136:
  -[MRUOutputDeviceRoutingDataSource addHearingAidRouteIfNeededToRoutes:](v121, "addHearingAidRouteIfNeededToRoutes:", v106, v110);
  v107 = v130;
  id v108 = v106;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v184, 8);

  return v108;
}

void __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 240);
  id v6 = [*(id *)(a1 + 40) endpointObject];
  uint64_t v3 = [v2 availableOutputDevicesForEndpoint:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_30(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (([*(id *)(a1 + 32) supportsMultipleSelection] & 1) == 0)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_2;
    v22[3] = &unk_1E5F0FDF0;
    id v23 = *(id *)(a1 + 40);
    id v5 = [v3 sortedArrayUsingComparator:v22];
    id v6 = [v5 firstObject];
    v25[0] = v6;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  }
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F31830]) initWithOutputDevices:v4];
  uint64_t v8 = v7;
  if (*(unsigned char *)(a1 + 72)
    || ([v7 isDeviceRoute] & 1) == 0 && objc_msgSend(v8, "isSmartAudio"))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 128))
    {
      if (*(unsigned char *)(a1 + 73))
      {
        uint64_t v9 = [v8 isPickedOnPairedDevice];
      }
      else if (*(void *)(a1 + 64) {
             || ![v8 isDeviceRoute]
      }
             || (uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8), *(unsigned char *)(v10 + 24)))
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v11 = objc_msgSend(v8, "outputDevices", 0);
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
              int v17 = MRComputeBaseRouteUID();

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
    else if ([v8 isDeviceRoute])
    {
      uint64_t v9 = *(unsigned char *)(a1 + 74) != 0;
    }
    else
    {
LABEL_25:
      uint64_t v9 = 1;
    }
    [v8 setPicked:v9];
    [*(id *)(a1 + 48) addObject:v8];
  }
}

uint64_t __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 uid];
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

void __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_3(uint64_t a1)
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
        id v10 = objc_alloc(MEMORY[0x1E4F31830]);
        uint64_t v48 = v9;
        int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
        uint64_t v12 = (void *)[v10 initWithOutputDevices:v11];

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
        uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v45, 1, (void)v33);
        (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v20);
  }

  uint64_t v25 = *(void **)(a1 + 64);
  if (v25)
  {
    id v26 = v25;
  }
  else
  {
    id v26 = [*(id *)(a1 + 32) activeAudioCategory];
  }
  v27 = v26;
  if (*(unsigned char *)(a1 + 80) && [v26 isEqualToString:*MEMORY[0x1E4F14FA0]])
  {
    v28 = *(void **)(a1 + 40);
    id v29 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_39];
    [v28 filterUsingPredicate:v29];
  }
  uint64_t v30 = objc_msgSend(*(id *)(a1 + 40), "copy", (void)v33);
  uint64_t v31 = *(void *)(a1 + 32);
  v32 = *(void **)(v31 + 120);
  *(void *)(v31 + 120) = v30;
}

BOOL __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 routeSubtype] != 1;
}

uint64_t __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_5(uint64_t a1, void *a2)
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

uint64_t __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 isSmartAudio];
}

uint64_t __57__MRUOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_7(uint64_t a1, void *a2)
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

- (void)setPickedRoute:(id)a3 withPassword:(id)a4 completion:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v39 = a4;
  id v9 = a5;
  long long v40 = [(MRUOutputDeviceRoutingDataSource *)self applicationOutputContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    int v11 = [v10 outputDevices];
    uint64_t v12 = (void *)[v11 mutableCopy];

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke;
    aBlock[3] = &unk_1E5F0FED0;
    objc_copyWeak(&v56, &location);
    aBlock[4] = self;
    id v13 = v9;
    id v55 = v13;
    long long v37 = _Block_copy(aBlock);
    uint64_t v14 = dispatch_get_global_queue(21, 0);
    uint64_t v15 = [(MRUOutputDeviceRoutingDataSource *)self endpoint];
    long long v36 = [v15 outputDevices];

    uint64_t v16 = [(MRUOutputDeviceRoutingDataSource *)self endpointRoute];
    if (v16
      && ([(MRUOutputDeviceRoutingDataSource *)self endpoint],
          int v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = [v17 isLocalEndpoint],
          v17,
          v16,
          (v18 & 1) == 0))
    {
      if (self->_supportsQueueHandoff
        || ([MEMORY[0x1E4F77038] sharedManager],
            uint64_t v30 = objc_claimAutoreleasedReturnValue(),
            [(MRUOutputDeviceRoutingDataSource *)self presentingAppBundleID],
            uint64_t v31 = objc_claimAutoreleasedReturnValue(),
            int v32 = [v30 activeActivityExistsForBundle:v31],
            v31,
            v30,
            v32))
      {
        uint64_t v19 = [(MRUOutputDeviceRoutingDataSource *)self endpoint];
        long long v33 = [v10 outputDevices];
        [v19 migrateToOrSetOutputDevices:v33 initiator:self->_initiator withReplyQueue:v14 completion:v37];
      }
      else
      {
        uint64_t v19 = [(MRUOutputDeviceRoutingDataSource *)self endpoint];
        long long v35 = [v10 outputDevices];
        [v19 setOutputDevices:v35 initiator:self->_initiator withReplyQueue:v14 completion:v37];
      }
    }
    else if (v40)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_3;
      block[3] = &unk_1E5F0FF48;
      id v53 = v37;
      block[4] = self;
      id v48 = v36;
      id v49 = v40;
      id v50 = v12;
      dispatch_queue_t v51 = v14;
      id v52 = v10;
      dispatch_async(v51, block);

      uint64_t v19 = v53;
    }
    else
    {
      if (!v13)
      {
LABEL_29:

        objc_destroyWeak(&v56);
        objc_destroyWeak(&location);

        goto LABEL_30;
      }
      uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F31258] code:5 userInfo:0];
      (*((void (**)(id, void *))v13 + 2))(v13, v19);
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = v40;
    if (v40)
    {
      id v38 = v8;
      id v21 = [v38 endpointWrapper];
      [v21 unwrappedValue];
      id v22 = (void *)MRAVEndpointCopyOutputDevices();

      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v24 = v22;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v43 objects:v58 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v44 != v26) {
              objc_enumerationMutation(v24);
            }
            v28 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
            id v29 = MRComputeBaseRouteUID();

            if (v29) {
              [v23 addObject:v29];
            }
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v43 objects:v58 count:16];
        }
        while (v25);
      }

      MRAVReconnaissanceSessionCreateWithEndpointFeatures();
      id v41 = v40;
      id v42 = v9;
      MRAVReconnaissanceSessionBeginSearch();

      goto LABEL_30;
    }
    if (v9)
    {
      long long v34 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F31258] code:5 userInfo:0];
      (*((void (**)(id, void *))v9 + 2))(v9, v34);

LABEL_30:
      uint64_t v20 = v40;
    }
  }
  else
  {
    uint64_t v20 = v40;
    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

void __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  id v6 = WeakRetained;
  msv_dispatch_on_main_queue();
}

void __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_2(uint64_t a1)
{
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:*MEMORY[0x1E4F31260] object:*(void *)(a1 + 32)];
  [v6 postNotificationName:*MEMORY[0x1E4F31280] object:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) endpoint];
  if (v2 && !*(void *)(a1 + 48))
  {
    id v3 = +[MRURouteRecommender sharedInstance];
    id v4 = [*(id *)(a1 + 40) donatingAppBundleID];
    objc_msgSend(v3, "donatePickerChoiceFor:bundleID:isEligibleApp:reason:", v2, v4, objc_msgSend(*(id *)(a1 + 40), "isDonatingAppEligible"), @"setPickedRoute");
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(a1 + 48));
  }
}

void __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_3(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_4;
  aBlock[3] = &unk_1E5F0FEF8;
  id v9 = *(id *)(a1 + 80);
  id v2 = _Block_copy(aBlock);
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
      id v4 = [*(id *)(a1 + 32) predictedDevice];

      if (v4) {
        [*(id *)(a1 + 32) _resetPredictedOutputDevice];
      }
    }
    [*(id *)(a1 + 48) unwrappedValue];
    MRAVOutputContextSetOutputDevicesWithInitiator();
  }
}

uint64_t __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) createGroupFromOutputDevices:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

void __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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

void __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = MCLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v9 = a2;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_ERROR, "picked endpoint route, set devices: %{public}@", buf, 0xCu);
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

uint64_t __75__MRUOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_52(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = MCLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      uint64_t v7 = a2;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_ERROR, "picked endpoint route, clear system endpoint: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:*MEMORY[0x1E4F31260] object:*(void *)(a1 + 32)];
    [v4 postNotificationName:*MEMORY[0x1E4F31280] object:*(void *)(a1 + 32)];
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
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
        uint64_t v16 = [*(id *)(*((void *)&v21 + 1) + 8 * v15) uid];
        [v10 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  int v17 = (void *)MEMORY[0x1E4F76FA8];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __82__MRUOutputDeviceRoutingDataSource_createGroupFromOutputDevices_queue_completion___block_invoke;
  v19[3] = &unk_1E5F0FFE8;
  id v20 = v9;
  id v18 = v9;
  [v17 createEndpointWithOutputDeviceUIDs:v10 queue:v8 completion:v19];
}

uint64_t __82__MRUOutputDeviceRoutingDataSource_createGroupFromOutputDevices_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addRouteToGroup:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[MRUOutputDeviceRoutingDataSource addRoutesToGroup:completion:](self, "addRoutesToGroup:completion:", v9, v7, v10, v11);
}

- (void)addRoutesToGroup:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __64__MRUOutputDeviceRoutingDataSource_addRoutesToGroup_completion___block_invoke;
  long long v21 = &unk_1E5F10010;
  long long v22 = self;
  id v7 = v6;
  id v23 = v7;
  id v8 = a3;
  id v9 = _Block_copy(&v18);
  id v10 = -[MRUOutputDeviceRoutingDataSource outputDevicesForRoutes:](self, "outputDevicesForRoutes:", v8, v18, v19, v20, v21, v22);
  uint64_t v11 = (void *)[v10 mutableCopy];

  LODWORD(v10) = [(MRUOutputDeviceRoutingDataSource *)self _shouldAddPredictedDeviceToOuputDevices:v8];
  if (v10)
  {
    uint64_t v12 = [(MRUOutputDeviceRoutingDataSource *)self predictedDevice];
    [v11 addObject:v12];
  }
  uint64_t v13 = dispatch_get_global_queue(21, 0);
  if (self->_supportsQueueHandoff
    || ([MEMORY[0x1E4F77038] sharedManager],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        [(MRUOutputDeviceRoutingDataSource *)self presentingAppBundleID],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v14 activeActivityExistsForBundle:v15],
        v15,
        v14,
        v16))
  {
    int v17 = [(MRUOutputDeviceRoutingDataSource *)self endpoint];
    [v17 migrateToOrAddOutputDevices:v11 initiator:self->_initiator withReplyQueue:v13 completion:v9];
  }
  else
  {
    int v17 = [(MRUOutputDeviceRoutingDataSource *)self endpoint];
    [v17 addOutputDevices:v11 initiator:self->_initiator withReplyQueue:v13 completion:v9];
  }
}

void __64__MRUOutputDeviceRoutingDataSource_addRoutesToGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:*MEMORY[0x1E4F31260] object:*(void *)(a1 + 32)];
  [v3 postNotificationName:*MEMORY[0x1E4F31280] object:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 32) endpoint];
  if (!v8 && v4)
  {
    uint64_t v5 = +[MRURouteRecommender sharedInstance];
    id v6 = [*(id *)(a1 + 32) donatingAppBundleID];
    objc_msgSend(v5, "donatePickerChoiceFor:bundleID:isEligibleApp:reason:", v4, v6, objc_msgSend(*(id *)(a1 + 32), "isDonatingAppEligible"), @"addRoutesToGroup");
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

- (void)removeRouteFromGroup:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[MRUOutputDeviceRoutingDataSource removeRoutesFromGroup:completion:](self, "removeRoutesFromGroup:completion:", v9, v7, v10, v11);
}

- (void)removeRoutesFromGroup:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void))a4;
  id v7 = [(MRUOutputDeviceRoutingDataSource *)self outputDevicesForRoutes:a3];
  if ([(MRUOutputDeviceRoutingDataSource *)self _isRemovingPredictedDevice:v7])
  {
    [(MRUOutputDeviceRoutingDataSource *)self _resetPredictedOutputDevice];
    v6[2](v6, 0);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__MRUOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke;
    aBlock[3] = &unk_1E5F0FF70;
    void aBlock[4] = self;
    v28 = v6;
    id v39 = v6;
    id v8 = _Block_copy(aBlock);
    v27 = dispatch_get_global_queue(21, 0);
    id v9 = [(MRUOutputDeviceRoutingDataSource *)self endpoint];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v10 = v7;
    id v11 = (id)[v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v11)
    {
      long long v24 = v8;
      uint64_t v25 = self;
      uint64_t v26 = v7;
      uint64_t v12 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v14, "uid", v24, v25, v26);
          int v16 = [v9 designatedGroupLeader];
          int v17 = [v16 uid];
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
      id v8 = v24;
    }

    uint64_t v19 = (void *)[v10 mutableCopy];
    unint64_t v20 = [v10 count];
    if (v11 && v20 >= 2) {
      [v19 removeObject:v11];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__MRUOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_3;
    block[3] = &unk_1E5F10060;
    block[4] = self;
    id v30 = v19;
    id v31 = v27;
    id v32 = v10;
    id v33 = v8;
    id v21 = v8;
    long long v22 = v27;
    id v23 = v19;
    dispatch_async(v22, block);

    id v6 = v28;
  }
}

void __69__MRUOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = (void *)[a2 copy];
  uint64_t v5 = [*(id *)(a1 + 32) endpoint];
  id v6 = (void *)v5;
  if (!a2 && v5)
  {
    id v7 = +[MRURouteRecommender sharedInstance];
    id v8 = [*(id *)(a1 + 32) donatingAppBundleID];
    objc_msgSend(v7, "donatePickerChoiceFor:bundleID:isEligibleApp:reason:", v6, v8, objc_msgSend(*(id *)(a1 + 32), "isDonatingAppEligible"), @"removeRoutesFromGroup");
  }
  id v9 = *(void **)(a1 + 40);
  if (v9)
  {
    id v11 = v9;
    id v10 = v4;
    msv_dispatch_on_main_queue();
  }
}

uint64_t __69__MRUOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __69__MRUOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_3(id *a1)
{
  id v2 = [a1[4] endpointRoute];
  id v3 = [v2 endpointWrapper];
  [v3 unwrappedValue];
  id v4 = a1[7];
  id v5 = a1[6];
  id v6 = a1[8];
  MRAVEndpointRemoveOutputDevicesWithInitiator();
}

void __69__MRUOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:*MEMORY[0x1E4F31260] object:*(void *)(a1 + 32)];
  [v6 postNotificationName:*MEMORY[0x1E4F31280] object:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 32) _detachableDevicesInOutputDevices:*(void *)(a1 + 40)];
  id v5 = v4;
  if (a2 || ![v4 count]) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else {
    [*(id *)(a1 + 32) createGroupFromOutputDevices:v5 queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

- (BOOL)routeIsLeaderOfEndpoint:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v4 isGroupLeader]
    && ([(MRUOutputDeviceRoutingDataSource *)self endpointRoute],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    id v7 = [(MRUOutputDeviceRoutingDataSource *)self endpoint];
    id v8 = [v7 outputDevices];
    id v9 = [v6 setWithArray:v8];

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    id v11 = [v4 outputDevices];
    uint64_t v12 = [v10 setWithArray:v11];

    char v13 = [v9 intersectsSet:v12];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)_endpointsDidChangeNotification:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  id v6 = [v5 name];

  [v7 postNotificationName:v6 object:self];
}

- (void)_outputDevicesDidChangeNotification:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:*MEMORY[0x1E4F31280] object:self];
}

- (void)_routeStatusDidChangeNotification:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v17 = objc_alloc_init(v4);
  id v6 = [v5 userInfo];

  id v7 = [v6 objectForKey:*MEMORY[0x1E4F77840]];
  id v8 = [v7 objectForKey:@"RouteUID"];
  id v9 = [v6 objectForKey:*MEMORY[0x1E4F77850]];
  uint64_t v10 = [(MRUOutputDeviceRoutingDataSource *)self _outputDeviceRouteWithUID:v8];
  id v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    [v17 setObject:v10 forKey:*MEMORY[0x1E4F31278]];
    uint64_t v13 = [v9 integerValue];
    if ((unint64_t)(v13 - 2) <= 3)
    {
      uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F31258] code:v13 userInfo:0];
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        [v17 setObject:v14 forKey:*MEMORY[0x1E4F31268]];
      }
    }
  }
  if ([v17 count])
  {
    int v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 postNotificationName:*MEMORY[0x1E4F31270] object:self userInfo:v17];
  }
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

- (id)_detachableDevicesInOutputDevices:(id)a3
{
  id v4 = objc_msgSend(a3, "msv_filter:", &__block_literal_global_68);
  if ([(MRUOutputDeviceRoutingDataSource *)self _shouldDetachOutputDevicesToGroup:v4])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

uint64_t __70__MRUOutputDeviceRoutingDataSource__detachableDevicesInOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEligibleForWHAPlayback];
}

- (BOOL)_shouldDetachOutputDevicesToGroup:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_detachesRoutesToGroup)
  {
    id v5 = [(MRUOutputDeviceRoutingDataSource *)self endpointRoute];
    id v6 = [v5 endpointWrapper];
    [v6 unwrappedValue];
    uint64_t v7 = MRAVEndpointGetDesignatedGroupLeader();

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

- (BOOL)_shouldAddPredictedDeviceToOuputDevices:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  uint64_t v6 = [v4 count];

  if (v6 == 1) {
    int v7 = [v5 isSplitterCapable];
  }
  else {
    int v7 = 0;
  }
  id v8 = [(MRUOutputDeviceRoutingDataSource *)self predictedDevice];
  char v9 = [v8 supportsBluetoothSharing];

  uint64_t v10 = [v5 routeUID];
  uint64_t v11 = [(MRUOutputDeviceRoutingDataSource *)self predictedDevice];
  int v12 = [v11 uid];
  char v13 = [v10 isEqualToString:v12];

  if (v7) {
    char v14 = v9 & (v13 ^ 1);
  }
  else {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)_isRemovingPredictedDevice:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    id v5 = [v4 firstObject];
    uint64_t v6 = [(MRUOutputDeviceRoutingDataSource *)self predictedDevice];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)_globalAudioSessionLock
{
  if (_globalAudioSessionLock___once != -1) {
    dispatch_once(&_globalAudioSessionLock___once, &__block_literal_global_70_0);
  }
  id v2 = (void *)_globalAudioSessionLock___globalAudioSessionLock;

  return v2;
}

void __59__MRUOutputDeviceRoutingDataSource__globalAudioSessionLock__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v1 = (void *)_globalAudioSessionLock___globalAudioSessionLock;
  _globalAudioSessionLock___globalAudioSessionLocuint64_t k = (uint64_t)v0;
}

- (void)_registerNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__outputDevicesDidChangeNotification_ name:*MEMORY[0x1E4F77140] object:0];
  [v3 addObserver:self selector:sel__routeStatusDidChangeNotification_ name:*MEMORY[0x1E4F77848] object:0];
}

- (void)_unregisterNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F77140] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F77848] object:0];
}

- (void)_personalRoutesDidChange
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:*MEMORY[0x1E4F31280] object:self];
}

- (void)_outputDevicesDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:*MEMORY[0x1E4F31280] object:self];
}

- (id)_outputDeviceRouteWithUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__1;
  serialQueue = self->_serialQueue;
  long long v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MRUOutputDeviceRoutingDataSource__outputDeviceRouteWithUID___block_invoke;
  block[3] = &unk_1E5F0FD50;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __62__MRUOutputDeviceRoutingDataSource__outputDeviceRouteWithUID___block_invoke(void *a1)
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
        id v8 = objc_msgSend(v7, "routeUID", (void)v10);
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

- (void)_setShouldSourceOutputDevicesFromAVODDS:(BOOL)a3
{
  if (self->_shouldSourceOutputDevicesFromAVODDS != a3)
  {
    BOOL v3 = a3;
    self->_shouldSourceOutputDevicesFromAVODDS = a3;
    uint64_t v4 = MCLogCategoryDefault();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        __int16 v9 = 0;
        id v6 = "Output device UIDs determined to be available. Output devices from AVODDS will no longer be ignored.";
        id v7 = (uint8_t *)&v9;
LABEL_7:
        _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
    }
    else if (v5)
    {
      __int16 v8 = 0;
      id v6 = "Output device UIDs determined to be unavailable. Output devices from AVODDS will be ignored.";
      id v7 = (uint8_t *)&v8;
      goto LABEL_7;
    }
  }
}

- (void)_onDiscoverySessionQueue_generateDiscoverySession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoverySessionQueue);
  id v7 = [(MRUOutputDeviceRoutingDataSource *)self endpoint];
  if ([v7 isCompanionEndpoint])
  {
    BOOL v3 = [(MRUOutputDeviceRoutingDataSource *)self discoverySessionConfiguration];
    uint64_t v4 = v7;
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x1E4F76FD8];
    BOOL v3 = [(MRUOutputDeviceRoutingDataSource *)self discoverySessionConfiguration];
    uint64_t v4 = v5;
  }
  id v6 = [v4 discoverySessionWithConfiguration:v3];
  [(MRUOutputDeviceRoutingDataSource *)self setDiscoverySession:v6];
}

- (void)_generateDiscoverySession
{
  discoverySessionQueue = self->_discoverySessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MRUOutputDeviceRoutingDataSource__generateDiscoverySession__block_invoke;
  block[3] = &unk_1E5F0D7F8;
  block[4] = self;
  dispatch_async(discoverySessionQueue, block);
}

uint64_t __61__MRUOutputDeviceRoutingDataSource__generateDiscoverySession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDiscoverySessionQueue_generateDiscoverySession");
}

- (void)_onDiscoverySessionQueue_generateCompanionDiscoverySession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoverySessionQueue);
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F76FE0]) initWithEndpointFeatures:8];
  BOOL v3 = [MEMORY[0x1E4F76FD8] discoverySessionWithConfiguration:v4];
  [(MRUOutputDeviceRoutingDataSource *)self setCompanionDiscoverySession:v3];
}

- (void)_resetPredictedOutputDevice
{
  BOOL v3 = MCLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "Reset predicted outputDevice", v6, 2u);
  }

  id v4 = [(MRUOutputDeviceRoutingDataSource *)self applicationOutputContext];
  [v4 unwrappedValue];
  MRAVOutputContextResetPredictedOutputDevice();
  BOOL v5 = [(MRAVRoutingDiscoverySession *)self->_discoverySession availableOutputDevices];
  [(MRUOutputDeviceRoutingDataSource *)self _outputDevicesDidChange:v5];
}

- (id)_stateDumpObject
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"_obj";
  BOOL v3 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  v18[0] = v3;
  v17[1] = @"predictedDevice";
  uint64_t v4 = [(MRUOutputDeviceRoutingDataSource *)self predictedDevice];
  BOOL v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = @"<NONE>";
  }
  v18[1] = v6;
  v17[2] = @"AVOutputContext.predictedDevice";
  id v7 = [(MRUOutputDeviceRoutingDataSource *)self applicationOutputContext];
  [v7 unwrappedValue];
  uint64_t v8 = MRAVOutputContextCopyPredictedOutputDevice();
  __int16 v9 = (void *)v8;
  if (v8) {
    long long v10 = (__CFString *)v8;
  }
  else {
    long long v10 = @"<NONE>";
  }
  v18[2] = v10;
  v17[3] = @"AVOutputContext.outputDeviceUIDs";
  id v11 = [(MRUOutputDeviceRoutingDataSource *)self applicationOutputContext];
  [v11 unwrappedValue];
  uint64_t v12 = MRAVOutputContextCopyOutputDevices();
  long long v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = @"<NONE>";
  }
  v18[3] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (void)addHearingAidRouteIfNeededToRoutes:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(MRUOutputDeviceRoutingDataSource *)self hearingDeviceName];
  if ([v5 length])
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mediaremote"];
    id v7 = v5;
    uint64_t v26 = v6;
    int v8 = [v6 BOOLForKey:@"AccessibilityHearingShowVirtualRoute"];
    uint64_t v9 = (uint64_t)v7;
    if (v8)
    {
      uint64_t v9 = [v7 stringByAppendingString:@" Virtual"];
    }
    v27 = (void *)v9;
    id v28 = v4;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v10 = (MPAVOutputDeviceRoute *)v4;
    uint64_t v11 = [(MPAVOutputDeviceRoute *)v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v29 + 1) + 8 * i) outputDevice];
          long long v16 = [v15 name];
          char v17 = [v16 isEqualToString:v7];

          if (v17)
          {
            hearingDeviceRoute = self->_hearingDeviceRoute;
            self->_hearingDeviceRoute = 0;

            long long v22 = v26;
            unint64_t v20 = v27;
            goto LABEL_17;
          }
        }
        uint64_t v12 = [(MPAVOutputDeviceRoute *)v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    long long v18 = [(MPAVOutputDeviceRoute *)self->_hearingDeviceRoute outputDevice];
    long long v19 = [v18 name];
    unint64_t v20 = v27;
    char v21 = [v19 isEqualToString:v27];

    if (v21)
    {
      id v4 = v28;
      long long v22 = v26;
    }
    else
    {
      uint64_t v25 = [[MRUVirtualHearingAidRoute alloc] initWithHearingDeviceName:v27];
      long long v10 = self->_hearingDeviceRoute;
      self->_hearingDeviceRoute = &v25->super;
      long long v22 = v26;
LABEL_17:

      id v4 = v28;
    }
  }
  else
  {
    long long v24 = self->_hearingDeviceRoute;
    self->_hearingDeviceRoute = 0;
  }
  if (self->_hearingDeviceRoute) {
    objc_msgSend(v4, "addObject:");
  }
}

- (void)hearingAidReachabilityDidChange
{
  objc_initWeak(&location, self);
  id v2 = dispatch_get_global_queue(0, 0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__MRUOutputDeviceRoutingDataSource_hearingAidReachabilityDidChange__block_invoke;
  v3[3] = &unk_1E5F0DA00;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __67__MRUOutputDeviceRoutingDataSource_hearingAidReachabilityDidChange__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = nameOfHearingDeviceReachableForAudioHandoff();
  BOOL v3 = MCLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v9 = v2;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "Reachable for handoff hearingDeviceName: %@", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__MRUOutputDeviceRoutingDataSource_hearingAidReachabilityDidChange__block_invoke_108;
  v5[3] = &unk_1E5F0D870;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v2;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __67__MRUOutputDeviceRoutingDataSource_hearingAidReachabilityDidChange__block_invoke_108(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setHearingDeviceName:v1];

  id v4 = objc_loadWeakRetained(v2);
  id v5 = [v4 hearingAidDelegate];

  if (objc_opt_respondsToSelector()) {
    [v5 hearingAidReachabilityDidChange];
  }
}

- (void)setApplicationOutputContext:(id)a3
{
}

- (void)setSupportsMultipleSelection:(BOOL)a3
{
  self->_supportsMultipleSelectiouint64_t n = a3;
}

- (BOOL)devicePresenceDetected
{
  return self->_devicePresenceDetected;
}

- (unsigned)targetSessionID
{
  return self->_targetSessionID;
}

- (BOOL)detachesRoutesToGroup
{
  return self->_detachesRoutesToGroup;
}

- (void)setDetachesRoutesToGroup:(BOOL)a3
{
  self->_detachesRoutesToGroup = a3;
}

- (BOOL)supportsQueueHandoff
{
  return self->_supportsQueueHandoff;
}

- (void)setSupportsQueueHandoff:(BOOL)a3
{
  self->_supportsQueueHandoff = a3;
}

- (NSString)presentingAppBundleID
{
  return self->_presentingAppBundleID;
}

- (void)setPresentingAppBundleID:(id)a3
{
}

- (NSString)nowPlayingAppBundleID
{
  return self->_nowPlayingAppBundleID;
}

- (void)setNowPlayingAppBundleID:(id)a3
{
}

- (NSArray)visibleMediaApps
{
  return self->_visibleMediaApps;
}

- (void)setVisibleMediaApps:(id)a3
{
}

- (NSString)donatingAppBundleID
{
  return self->_donatingAppBundleID;
}

- (void)setDonatingAppBundleID:(id)a3
{
}

- (BOOL)isDonatingAppEligible
{
  return self->_donatingAppEligible;
}

- (void)setDonatingAppEligible:(BOOL)a3
{
  self->_donatingAppEligible = a3;
}

- (NSString)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
}

- (MRUOutputDeviceRoutingDataSourceObserver)hearingAidDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hearingAidDelegate);

  return (MRUOutputDeviceRoutingDataSourceObserver *)WeakRetained;
}

- (void)setHearingAidDelegate:(id)a3
{
}

- (MRAVRoutingDiscoverySession)companionDiscoverySession
{
  return self->_companionDiscoverySession;
}

- (MRAVRoutingDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (MPAVOutputDeviceRoute)hearingDeviceRoute
{
  return self->_hearingDeviceRoute;
}

- (void)setHearingDeviceRoute:(id)a3
{
}

- (BOOL)subscribed
{
  return self->_subscribed;
}

- (void)setSubscribed:(BOOL)a3
{
  self->_subscribed = a3;
}

- (MRUODRDSNoticationObserver)notificationObserver
{
  return self->_notificationObserver;
}

- (void)setNotificationObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_hearingDeviceRoute, 0);
  objc_storeStrong((id *)&self->_discoverySession, 0);
  objc_storeStrong((id *)&self->_companionDiscoverySession, 0);
  objc_destroyWeak((id *)&self->_hearingAidDelegate);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_donatingAppBundleID, 0);
  objc_storeStrong((id *)&self->_visibleMediaApps, 0);
  objc_storeStrong((id *)&self->_nowPlayingAppBundleID, 0);
  objc_storeStrong((id *)&self->_presentingAppBundleID, 0);
  objc_storeStrong((id *)&self->_hearingDeviceName, 0);
  objc_storeStrong((id *)&self->_endpointRoute, 0);
  objc_storeStrong((id *)&self->_predictedDevice, 0);
  objc_storeStrong((id *)&self->_applicationOutputContext, 0);
  objc_storeStrong((id *)&self->_outputDeviceRoutes, 0);
  objc_storeStrong(&self->_callbackToken, 0);
  objc_storeStrong(&self->_companionCallbackToken, 0);
  objc_storeStrong((id *)&self->_discoverySessionQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end