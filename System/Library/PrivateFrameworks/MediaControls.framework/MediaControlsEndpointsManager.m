@interface MediaControlsEndpointsManager
- (BOOL)_homeHasRoute:(id)a3;
- (BOOL)isActiveSystemEndpointEqualToLocalEndpoint;
- (MPAVEndpointRoute)activeSystemRoute;
- (MPAVEndpointRoute)resolvedActiveSystemRoute;
- (MPAVRoutingController)routingController;
- (MPMediaControlsConfiguration)configuration;
- (MediaControlsEndpointsManager)initWithConfiguration:(id)a3;
- (MediaControlsEndpointsManagerDelegate)delegate;
- (MediaControlsHomeObserver)homeObserver;
- (NSArray)routes;
- (NSString)activeSystemRouteUID;
- (NSString)pendingActiveSystemRouteUID;
- (id)_createSectionedCollectionFromRoutes:(id)a3;
- (id)_endpointControllerContainingOutputDevice:(id)a3 endpointWrapper:(id *)a4;
- (id)endpointControllerForRoute:(id)a3;
- (int64_t)_indexOfRouteWithUID:(id)a3;
- (int64_t)discoveryMode;
- (void)_activeSystemRouteDidChange:(id)a3;
- (void)_setRoutes:(id)a3 withChangeDetails:(id)a4;
- (void)_updateWithRoutes:(id)a3;
- (void)dealloc;
- (void)getOutputDeviceIsPlaying:(id)a3 completion:(id)a4;
- (void)homeObserverDidUpdateKnownUIDs:(id)a3;
- (void)loadActiveSystemRoute;
- (void)routingControllerAvailableRoutesDidChange:(id)a3;
- (void)setActiveSystemRoute:(id)a3 reason:(id)a4;
- (void)setActiveSystemRoute:(id)a3 requestDetails:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryMode:(int64_t)a3;
- (void)updateActiveSystemRoute:(id)a3;
@end

@implementation MediaControlsEndpointsManager

- (MediaControlsEndpointsManager)initWithConfiguration:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MediaControlsEndpointsManager;
  v5 = [(MediaControlsEndpointsManager *)&v26 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MediaControls.MediaControlsEndpointsManager/serialQueue", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    endpointControllersMap = v5->_endpointControllersMap;
    v5->_endpointControllersMap = v8;

    uint64_t v10 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (MPMediaControlsConfiguration *)v10;

    v5->_discoveryMode = 0;
    v12 = objc_alloc_init(MediaControlsHomeObserver);
    homeObserver = v5->_homeObserver;
    v5->_homeObserver = v12;

    [(MediaControlsHomeObserver *)v5->_homeObserver setDelegate:v5];
    v14 = [NSString stringWithFormat:@"%@(endpoints)", objc_opt_class()];
    unint64_t v15 = [(MPMediaControlsConfiguration *)v5->_configuration style];
    if (v15 <= 6)
    {
      if (((1 << v15) & 0x72) != 0)
      {
        v16 = (void *)MEMORY[0x1E4F31850];
        v17 = [(MPMediaControlsConfiguration *)v5->_configuration routingContextUID];
        id v18 = [v16 systemRouteWithContextUID:v17];

        v27[0] = v18;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      }
      else
      {
        id v18 = objc_alloc_init(MEMORY[0x1E4F31820]);
        v19 = [(MPMediaControlsConfiguration *)v5->_configuration routingContextUID];
        [v18 setRoutingContextUID:v19];

        uint64_t v20 = [objc_alloc(MEMORY[0x1E4F31850]) initWithDataSource:v18 name:v14];
        routingController = v5->_routingController;
        v5->_routingController = (MPAVRoutingController *)v20;

        [(MPAVRoutingController *)v5->_routingController setDelegate:v5];
        [(MPAVRoutingController *)v5->_routingController setDiscoveryMode:v5->_discoveryMode];
        v22 = [v4 presentingAppBundleID];
        [(MPAVRoutingController *)v5->_routingController setPresentedBundleID:v22];

        [(MPAVRoutingController *)v5->_routingController availableRoutes];
      v23 = };
      [(MediaControlsEndpointsManager *)v5 _updateWithRoutes:v23];
    }
    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v5 selector:sel__activeSystemRouteDidChange_ name:*MEMORY[0x1E4F31250] object:0];

    [(MediaControlsEndpointsManager *)v5 loadActiveSystemRoute];
  }

  return v5;
}

- (void)dealloc
{
  [(MediaControlsHomeObserver *)self->_homeObserver setDelegate:0];
  [(MPAVRoutingController *)self->_routingController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsEndpointsManager;
  [(MediaControlsEndpointsManager *)&v3 dealloc];
}

- (void)setActiveSystemRoute:(id)a3 reason:(id)a4
{
  dispatch_queue_t v6 = (objc_class *)MEMORY[0x1E4F770C0];
  id v7 = a4;
  id v8 = a3;
  id v9 = (id)[[v6 alloc] initWithName:@"setActiveSystemRoute:reason:" requestID:0 reason:v7 userInitiated:0];

  [(MediaControlsEndpointsManager *)self setActiveSystemRoute:v8 requestDetails:v9];
}

- (void)setActiveSystemRoute:(id)a3 requestDetails:(id)a4
{
  id v6 = a4;
  id v7 = [a3 routeUID];
  if (a3)
  {
    id v8 = self->_activeSystemRouteUID;
    if (v8 == v7)
    {
    }
    else
    {
      id v9 = v8;
      char v10 = [(NSString *)v8 isEqual:v7];

      if ((v10 & 1) == 0)
      {
        [(MediaControlsEndpointsManager *)self updateActiveSystemRoute:v7];
        v11 = [(MediaControlsEndpointsManager *)self activeSystemRoute];
        v12 = (void *)MEMORY[0x1E4F31850];
        v13 = [v6 reason];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __69__MediaControlsEndpointsManager_setActiveSystemRoute_requestDetails___block_invoke;
        v15[3] = &unk_1E5F0E338;
        id v16 = v11;
        id v17 = v6;
        id v18 = self;
        id v14 = v11;
        [v12 setActiveRoute:v14 reason:v13 completion:v15];
      }
    }
  }
}

void __69__MediaControlsEndpointsManager_setActiveSystemRoute_requestDetails___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v4 = [a1[4] endpointObject];
  id v10 = (id)v4;
  if (a2 || !v4)
  {
    if (a2) {
      [a1[6] loadActiveSystemRoute];
    }
  }
  else if ([a1[5] userInitiated])
  {
    v5 = [a1[6] configuration];
    id v6 = [v5 donatingAppBundleID];

    id v7 = [a1[6] configuration];
    uint64_t v8 = [v7 isDonatingAppEligible];

    id v9 = +[MRURouteRecommender sharedInstance];
    [v9 donatePickerChoiceFor:v10 bundleID:v6 isEligibleApp:v8 reason:@"setActiveSystemRoute"];
  }
}

- (void)loadActiveSystemRoute
{
  if (!self->_isRequestingActiveRoute)
  {
    self->_isRequestingActiveRoute = 1;
    objc_initWeak(&location, self);
    routingController = self->_routingController;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __54__MediaControlsEndpointsManager_loadActiveSystemRoute__block_invoke;
    v4[3] = &unk_1E5F10360;
    objc_copyWeak(&v5, &location);
    [(MPAVRoutingController *)routingController getActiveRouteWithTimeout:v4 completion:3.0];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __54__MediaControlsEndpointsManager_loadActiveSystemRoute__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__MediaControlsEndpointsManager_loadActiveSystemRoute__block_invoke_2;
  v5[3] = &unk_1E5F0D870;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __54__MediaControlsEndpointsManager_loadActiveSystemRoute__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[25] = 0;
    id v4 = WeakRetained;
    id v3 = [*(id *)(a1 + 32) routeUID];
    [v4 updateActiveSystemRoute:v3];

    WeakRetained = v4;
  }
}

- (void)updateActiveSystemRoute:(id)a3
{
  v13 = (NSString *)a3;
  int64_t v5 = [(MediaControlsEndpointsManager *)self _indexOfRouteWithUID:"_indexOfRouteWithUID:"];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = (NSString *)[(NSString *)v13 copy];
    pendingActiveSystemRouteUID = self->_pendingActiveSystemRouteUID;
    self->_pendingActiveSystemRouteUID = v6;
  }
  else
  {
    int64_t v8 = v5;
    id v9 = self->_activeSystemRouteUID;
    pendingActiveSystemRouteUID = v13;
    if (v9 != v13)
    {
      char v10 = [(NSString *)v9 isEqual:v13];

      if (v10) {
        goto LABEL_7;
      }
      objc_storeStrong((id *)&self->_activeSystemRouteUID, a3);
      v11 = self->_pendingActiveSystemRouteUID;
      self->_pendingActiveSystemRouteUID = 0;

      pendingActiveSystemRouteUID = [(NSArray *)self->_routes objectAtIndex:v8];
      v12 = [(MediaControlsEndpointsManager *)self delegate];
      [v12 endpointsManager:self activeSystemRouteDidChange:pendingActiveSystemRouteUID];
    }
  }

LABEL_7:
}

- (MPAVEndpointRoute)activeSystemRoute
{
  int64_t v3 = [(MediaControlsEndpointsManager *)self _indexOfRouteWithUID:self->_activeSystemRouteUID];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = (void *)MEMORY[0x1E4F31850];
    int64_t v5 = [(MPMediaControlsConfiguration *)self->_configuration routingContextUID];
    id v6 = [v4 systemRouteWithContextUID:v5];
  }
  else
  {
    id v6 = [(NSArray *)self->_routes objectAtIndex:v3];
  }

  return (MPAVEndpointRoute *)v6;
}

- (MPAVEndpointRoute)resolvedActiveSystemRoute
{
  int64_t v3 = [(MediaControlsEndpointsManager *)self _indexOfRouteWithUID:self->_activeSystemRouteUID];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(NSArray *)self->_routes objectAtIndex:v3];
  }

  return (MPAVEndpointRoute *)v4;
}

- (void)setDiscoveryMode:(int64_t)a3
{
  int64_t discoveryMode = self->_discoveryMode;
  if (discoveryMode != a3)
  {
    self->_int64_t discoveryMode = a3;
    -[MPAVRoutingController setDiscoveryMode:](self->_routingController, "setDiscoveryMode:");
    homeObserver = self->_homeObserver;
    if (a3)
    {
      [(MediaControlsHomeObserver *)homeObserver beginObserving];
      if (discoveryMode) {
        return;
      }
    }
    else
    {
      [(MediaControlsHomeObserver *)homeObserver stopObserving];
      if (discoveryMode) {
        return;
      }
    }
    id v7 = [(MPAVRoutingController *)self->_routingController availableRoutes];
    [(MediaControlsEndpointsManager *)self _updateWithRoutes:v7];
  }
}

- (id)endpointControllerForRoute:(id)a3
{
  endpointControllersMap = self->_endpointControllersMap;
  id v4 = [a3 routeUID];
  int64_t v5 = [(NSMutableDictionary *)endpointControllersMap objectForKey:v4];

  return v5;
}

- (BOOL)isActiveSystemEndpointEqualToLocalEndpoint
{
  activeSystemRouteUID = self->_activeSystemRouteUID;
  int64_t v3 = [MEMORY[0x1E4F31850] systemRoute];
  id v4 = [v3 routeUID];
  LOBYTE(activeSystemRouteUID) = [(NSString *)activeSystemRouteUID isEqualToString:v4];

  return (char)activeSystemRouteUID;
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  id v4 = [a3 availableRoutes];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__MediaControlsEndpointsManager_routingControllerAvailableRoutesDidChange___block_invoke;
  v6[3] = &unk_1E5F0D8E8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

unsigned char *__75__MediaControlsEndpointsManager_routingControllerAvailableRoutesDidChange___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[24]) {
    return (unsigned char *)[result _updateWithRoutes:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)getOutputDeviceIsPlaying:(id)a3 completion:(id)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v27 = 0;
    int64_t v8 = [(MediaControlsEndpointsManager *)self _endpointControllerContainingOutputDevice:v6 endpointWrapper:&v27];
    id v9 = v27;
    char v10 = [v8 route];
    v11 = v10;
    if (v8 && v9)
    {
      if ([v10 supportsRemoteControl])
      {
        v12 = [MEMORY[0x1E4F29128] UUID];
        v13 = [v12 UUIDString];

        id v14 = _MRLogForCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[MediaControlsEndpointsManager getOutputDeviceIsPlaying:completion:]();
        }

        uint64_t v15 = *MEMORY[0x1E4F31238];
        v28[0] = *MEMORY[0x1E4F31228];
        v28[1] = v15;
        v29[0] = v13;
        v29[1] = @"MediaControlsEndpointsManager-getOutputDeviceIsPlaying";
        id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
        id v17 = [v8 route];
        id v18 = [v17 connection];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke;
        v24[3] = &unk_1E5F103B0;
        id v26 = v7;
        id v25 = v9;
        [v18 connectWithUserInfo:v16 completion:v24];

        goto LABEL_12;
      }
      uint64_t v20 = [v8 route];
      int v21 = [v20 isDeviceRoute];

      if (v21)
      {
        v22 = _MRLogForCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[MediaControlsEndpointsManager getOutputDeviceIsPlaying:completion:](v22);
        }

        MRMediaRemoteGetLocalOrigin();
        id v23 = v7;
        MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin();

        goto LABEL_12;
      }
    }
    else
    {
      v19 = _MRLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[MediaControlsEndpointsManager getOutputDeviceIsPlaying:completion:]();
      }
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
LABEL_12:
  }
}

void __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _MRLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke_cold_2();
    }

    goto LABEL_5;
  }
  [*(id *)(a1 + 32) unwrappedValue];
  uint64_t v5 = MRAVEndpointCopyOrigin();
  if (!v5)
  {
LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  id v6 = (const void *)v5;
  id v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke_cold_1();
  }

  id v8 = *(id *)(a1 + 40);
  MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin();
  CFRelease(v6);

LABEL_10:
}

uint64_t __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke_28(uint64_t a1)
{
  MRMediaRemotePlaybackStateIsAdvancing();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke_30(uint64_t a1)
{
  MRMediaRemotePlaybackStateIsAdvancing();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

- (void)homeObserverDidUpdateKnownUIDs:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MediaControlsEndpointsManager_homeObserverDidUpdateKnownUIDs___block_invoke;
  block[3] = &unk_1E5F0D7F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __64__MediaControlsEndpointsManager_homeObserverDidUpdateKnownUIDs___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  v1 = *(id **)(a1 + 32);
  id v2 = [v1[10] availableRoutes];
  [v1 _updateWithRoutes:v2];
}

- (void)_activeSystemRouteDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F77210]];
  int v6 = [v5 intValue];

  if (!v6)
  {
    [(MediaControlsEndpointsManager *)self loadActiveSystemRoute];
  }
}

- (int64_t)_indexOfRouteWithUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_routes && [v4 length])
  {
    routes = self->_routes;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__MediaControlsEndpointsManager__indexOfRouteWithUID___block_invoke;
    v9[3] = &unk_1E5F103D8;
    id v10 = v5;
    int64_t v7 = [(NSArray *)routes indexOfObjectPassingTest:v9];
  }
  else
  {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

uint64_t __54__MediaControlsEndpointsManager__indexOfRouteWithUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 routeUID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_endpointControllerContainingOutputDevice:(id)a3 endpointWrapper:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v6 = [a3 routeUID];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(NSMutableDictionary *)self->_endpointControllersMap objectEnumerator];
  uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v29;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v29 != v22) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v28 + 1) + 8 * v7);
      id v9 = [v8 route];
      id v10 = [v9 endpointWrapper];

      id v11 = v10;
      [v11 unwrappedValue];
      v12 = (void *)MRAVEndpointCopyOutputDevices();
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
            if ([v18 isEqualToString:v6])
            {
              if (a4) {
                *a4 = v11;
              }
              id v19 = v8;

              goto LABEL_18;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
      id v19 = 0;
LABEL_18:

      if (v19) {
        break;
      }
      if (++v7 == v23)
      {
        uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v23) {
          goto LABEL_3;
        }
        goto LABEL_21;
      }
    }
  }
  else
  {
LABEL_21:
    id v19 = 0;
  }

  return v19;
}

- (BOOL)_homeHasRoute:(id)a3
{
  homeObserver = self->_homeObserver;
  uint64_t v4 = [a3 routeUID];
  LOBYTE(homeObserver) = [(MediaControlsHomeObserver *)homeObserver hasAccessoryWithUID:v4];

  return (char)homeObserver;
}

- (void)_setRoutes:(id)a3 withChangeDetails:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 deletedItemIndexPaths];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __62__MediaControlsEndpointsManager__setRoutes_withChangeDetails___block_invoke;
  v61[3] = &unk_1E5F10400;
  v61[4] = self;
  [v8 enumerateObjectsUsingBlock:v61];

  id v9 = (NSArray *)[v6 copy];
  routes = self->_routes;
  self->_routes = v9;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__MediaControlsEndpointsManager__setRoutes_withChangeDetails___block_invoke_2;
  aBlock[3] = &unk_1E5F10428;
  aBlock[4] = self;
  id v11 = _Block_copy(aBlock);
  v44 = v6;
  v12 = (void *)[v6 mutableCopy];
  id v13 = [v7 insertedItemIndexPaths];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __62__MediaControlsEndpointsManager__setRoutes_withChangeDetails___block_invoke_3;
  v57[3] = &unk_1E5F10450;
  v57[4] = self;
  id v14 = v11;
  id v59 = v14;
  id v15 = v12;
  id v58 = v15;
  [v13 enumerateObjectsUsingBlock:v57];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v53 objects:v64 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v54 != v19) {
          objc_enumerationMutation(v16);
        }
        int v21 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v22 = [v21 routeUID];
        uint64_t v23 = [(NSMutableDictionary *)self->_endpointControllersMap objectForKey:v22];
        [v23 setRoute:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v53 objects:v64 count:16];
    }
    while (v18);
  }

  NSUInteger v24 = [(NSArray *)self->_routes count];
  if (v24 != [(NSMutableDictionary *)self->_endpointControllersMap count])
  {
    v43 = [MEMORY[0x1E4F28E78] stringWithString:@"Routes does not match EndpointControllersMap."];
    long long v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_routes, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v26 = self->_routes;
    uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v49 objects:v63 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v50 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = [*(id *)(*((void *)&v49 + 1) + 8 * j) routeUID];
          [v25 addObject:v31];
        }
        uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v49 objects:v63 count:16];
      }
      while (v28);
    }

    v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_routes, "count"));
    v33 = [v25 componentsJoinedByString:@", "];
    [v43 appendFormat:@"\nRoute Count : %@, UIDs : %@", v32, v33];

    uint64_t v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_endpointControllersMap, "count"));
    v35 = [(NSMutableDictionary *)self->_endpointControllersMap allKeys];
    v36 = [v35 componentsJoinedByString:@", "];
    [v43 appendFormat:@"\nEndpoint Controller Map Count : %@, UIDs : %@", v34, v36];

    [v43 appendFormat:@"\nChange details: %@", v7];
    v37 = _MRLogForCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[MediaControlsEndpointsManager _setRoutes:withChangeDetails:]();
    }

    [(NSMutableDictionary *)self->_endpointControllersMap removeAllObjects];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v38 = self->_routes;
    uint64_t v39 = [(NSArray *)v38 countByEnumeratingWithState:&v45 objects:v62 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v46;
      do
      {
        for (uint64_t k = 0; k != v40; ++k)
        {
          if (*(void *)v46 != v41) {
            objc_enumerationMutation(v38);
          }
          (*((void (**)(id, void))v14 + 2))(v14, *(void *)(*((void *)&v45 + 1) + 8 * k));
        }
        uint64_t v40 = [(NSArray *)v38 countByEnumeratingWithState:&v45 objects:v62 count:16];
      }
      while (v40);
    }
  }
  if ([(NSString *)self->_pendingActiveSystemRouteUID length]) {
    [(MediaControlsEndpointsManager *)self updateActiveSystemRoute:self->_pendingActiveSystemRouteUID];
  }
}

void __62__MediaControlsEndpointsManager__setRoutes_withChangeDetails___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "objectAtIndex:", objc_msgSend(a2, "item"));
  id v4 = [v3 routeUID];

  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v4];
}

void __62__MediaControlsEndpointsManager__setRoutes_withChangeDetails___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 routeUID];
  id v4 = [[MediaControlsEndpointController alloc] initWithEndpoint:v3];

  [(MediaControlsEndpointController *)v4 setConfiguration:*(void *)(*(void *)(a1 + 32) + 40)];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v4 forKey:v5];
}

void __62__MediaControlsEndpointsManager__setRoutes_withChangeDetails___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "objectAtIndex:", objc_msgSend(a2, "item"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) removeObject:v3];
}

- (void)_updateWithRoutes:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_isUpdatingRoutes)
  {
    objc_storeStrong((id *)&self->_pendingRoutesToUpdate, a3);
  }
  else
  {
    self->_isUpdatingRoutes = 1;
    pendingRoutesToUpdate = self->_pendingRoutesToUpdate;
    self->_pendingRoutesToUpdate = 0;

    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v45 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v57 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          if ([v13 isSmartAudio]) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v10);
    }

    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke;
    v55[3] = &unk_1E5F10478;
    v55[4] = self;
    [v7 sortUsingComparator:v55];
    id v14 = [MEMORY[0x1E4F77108] currentSettings];
    int v15 = [v14 supportRouteRecommendations];

    if (v15)
    {
      id v16 = +[MRURouteRecommender sharedInstance];
      [v16 updateRecommendations];

      uint64_t v17 = +[MRURouteRecommender sharedInstance];
      uint64_t v18 = [v17 sortEndpointRoutes:v7];

      uint64_t v19 = (void *)[v18 mutableCopy];
      uint64_t v20 = (void *)MEMORY[0x1E4F31850];
      int v21 = [(MPMediaControlsConfiguration *)self->_configuration routingContextUID];
      uint64_t v22 = [v20 systemRouteWithContextUID:v21];

      [v19 removeObject:v22];
      [v19 insertObject:v22 atIndex:0];

      id v7 = v19;
    }
    if (![v7 count])
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F31850];
      NSUInteger v24 = [(MPMediaControlsConfiguration *)self->_configuration routingContextUID];
      long long v25 = [v23 systemRouteWithContextUID:v24];
      [v7 addObject:v25];
    }
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v43 = (void *)[(NSArray *)self->_routes copy];
    v44 = v7;
    uint64_t v41 = (void *)[v7 copy];
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v27 = self->_endpointControllersMap;
    uint64_t v28 = [(NSMutableDictionary *)v27 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v52 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v51 + 1) + 8 * j);
          v33 = -[NSMutableDictionary objectForKey:](self->_endpointControllersMap, "objectForKey:", v32, v41);
          uint64_t v34 = [v33 routeNames];
          v35 = (void *)[v34 copy];
          [v26 setObject:v35 forKey:v32];
        }
        uint64_t v29 = [(NSMutableDictionary *)v27 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v29);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_2;
    block[3] = &unk_1E5F102A0;
    block[4] = self;
    id v47 = v43;
    id v48 = v41;
    id v49 = v26;
    id v50 = v42;
    id v36 = v42;
    id v37 = v26;
    id v38 = v41;
    id v39 = v43;
    dispatch_block_t v40 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_async((dispatch_queue_t)self->_serialQueue, v40);

    id v5 = v45;
  }
}

uint64_t __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) _homeHasRoute:v5];
  int v8 = [*(id *)(a1 + 32) _homeHasRoute:v6];
  uint64_t v9 = -1;
  if (([v5 isDeviceRoute] & 1) == 0)
  {
    int v10 = [v6 isDeviceRoute];
    if (v7) {
      uint64_t v11 = -1;
    }
    else {
      uint64_t v11 = 1;
    }
    if (v7 != v8) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    if (v10) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v12;
    }
    if (!v9)
    {
      id v14 = [v5 sortName];
      int v15 = [v6 sortName];
      uint64_t v9 = [v14 localizedCaseInsensitiveCompare:v15];

      if (!v9)
      {
        id v16 = [v5 routeUID];
        uint64_t v17 = [v6 routeUID];
        uint64_t v9 = [v16 compare:v17];
      }
    }
  }

  return v9;
}

void __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _createSectionedCollectionFromRoutes:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) _createSectionedCollectionFromRoutes:*(void *)(a1 + 48)];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_3;
  v24[3] = &unk_1E5F0EDE0;
  id v25 = v2;
  id v26 = v3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_4;
  v19[3] = &unk_1E5F104A0;
  id v20 = v25;
  id v21 = v26;
  id v22 = *(id *)(a1 + 56);
  id v23 = *(id *)(a1 + 64);
  id v4 = v26;
  id v5 = v25;
  id v6 = [v5 changeDetailsToSectionedCollection:v4 isEqualBlock:v24 isUpdatedBlock:v19];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_5;
  aBlock[3] = &unk_1E5F0ED98;
  aBlock[4] = *(void *)(a1 + 32);
  id v16 = *(id *)(a1 + 48);
  id v7 = v6;
  id v17 = v7;
  id v18 = *(id *)(a1 + 64);
  int v8 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_7;
  block[3] = &unk_1E5F0E950;
  uint64_t v9 = *(void *)(a1 + 32);
  id v13 = v7;
  id v14 = v8;
  block[4] = v9;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 length] == 1)
  {
    uint64_t v7 = 1;
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) itemAtIndexPath:v5];
    uint64_t v9 = [*(id *)(a1 + 40) itemAtIndexPath:v6];
    uint64_t v7 = [v8 isEqual:v9];
  }
  return v7;
}

uint64_t __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 length] != 1)
  {
    uint64_t v7 = [a1[4] itemAtIndexPath:v5];
    int v8 = [a1[5] itemAtIndexPath:v6];
    uint64_t v9 = [v7 routeUID];
    id v10 = [a1[6] objectForKey:v9];
    id v11 = [v8 routeNames];
    if (([v10 isEqualToArray:v11] & 1) == 0) {
      [a1[7] addObject:v9];
    }
  }
  return 0;
}

void __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_5(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _setRoutes:*(void *)(a1 + 40) withChangeDetails:*(void *)(a1 + 48)];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(*((void *)&v10 + 1) + 8 * v6)];
        [v7 updateRoutePropertiesIfNeeded];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (*(void *)(v8 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_6;
    block[3] = &unk_1E5F0D7F8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    *(unsigned char *)(v8 + 26) = 0;
  }
}

uint64_t __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_6(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 26) = 0;
  return [*(id *)(a1 + 32) _updateWithRoutes:*(void *)(*(void *)(a1 + 32) + 32)];
}

void __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_7(id *a1)
{
  id v2 = [a1[4] delegate];
  if (v2)
  {
    id v3 = a1[4];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_8;
    v4[3] = &unk_1E5F104C8;
    id v6 = a1[6];
    id v5 = a1[5];
    [v2 endpointsManager:v3 defersRoutesReplacement:v4];
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

id __51__MediaControlsEndpointsManager__updateWithRoutes___block_invoke_8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return v2;
}

- (id)_createSectionedCollectionFromRoutes:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F319D8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 appendSection:@"SECTION"];
  [v5 appendItems:v4];

  return v5;
}

- (MPMediaControlsConfiguration)configuration
{
  return self->_configuration;
}

- (int64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (NSArray)routes
{
  return self->_routes;
}

- (MediaControlsEndpointsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MediaControlsEndpointsManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MediaControlsHomeObserver)homeObserver
{
  return self->_homeObserver;
}

- (MPAVRoutingController)routingController
{
  return self->_routingController;
}

- (NSString)activeSystemRouteUID
{
  return self->_activeSystemRouteUID;
}

- (NSString)pendingActiveSystemRouteUID
{
  return self->_pendingActiveSystemRouteUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingActiveSystemRouteUID, 0);
  objc_storeStrong((id *)&self->_activeSystemRouteUID, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_homeObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_pendingRoutesToUpdate, 0);
  objc_storeStrong((id *)&self->_endpointControllersMap, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)getOutputDeviceIsPlaying:completion:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1AE7DF000, v1, OS_LOG_TYPE_ERROR, "<%{public}@> Connecting to request now playing information for: %{public}@", v2, 0x16u);
}

- (void)getOutputDeviceIsPlaying:(os_log_t)log completion:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1AE7DF000, log, OS_LOG_TYPE_ERROR, "Requesting now playing information for local origin", v1, 2u);
}

- (void)getOutputDeviceIsPlaying:completion:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AE7DF000, v0, v1, "Could not get output device playing information - No endpoint found for: %{public}@", v2, v3, v4, v5, v6);
}

void __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AE7DF000, v0, v1, "Requesting now playing information for: %{public}@", v2, v3, v4, v5, v6);
}

void __69__MediaControlsEndpointsManager_getOutputDeviceIsPlaying_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AE7DF000, v0, v1, "Could not get output device playing information from MediaRemote. MediaRemote Error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_setRoutes:withChangeDetails:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AE7DF000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

@end