@interface MPAVRoutingController
+ (BOOL)bundleIdRepresentsLongFormVideoContent:(id)a3;
+ (MPAVRoute)systemRoute;
+ (id)_currentDeviceRoutingSymbolImage;
+ (id)_currentDeviceRoutingSymbolName;
+ (id)_sharedWorkerQueue;
+ (id)_symbolImageForIdentifier:(id)a3;
+ (id)_symbolImageForRoute:(id)a3;
+ (id)_symbolImageForRoutes:(id)a3;
+ (id)_symbolNameForModelID:(id)a3;
+ (id)_symbolNameForProductIdentifier:(id)a3;
+ (id)_symbolNameForRoute:(id)a3;
+ (id)_symbolNameForRoutes:(id)a3;
+ (id)systemRouteWithContextUID:(id)a3;
+ (int64_t)activeRouteType;
+ (void)_getActiveRouteWithTimeout:(double)a3 type:(int64_t)a4 completion:(id)a5;
+ (void)getActiveRouteWithCompletion:(id)a3;
+ (void)getActiveRouteWithTimeout:(double)a3 completion:(id)a4;
+ (void)getProactiveRouteWithCompletion:(id)a3;
+ (void)getProactiveRouteWithTimeout:(double)a3 completion:(id)a4;
+ (void)setActiveRoute:(id)a3 completion:(id)a4;
+ (void)setActiveRoute:(id)a3 reason:(id)a4 completion:(id)a5;
- (BOOL)_deviceAvailabilityOverrideState;
- (BOOL)_pickRoute:(id)a3 completion:(id)a4;
- (BOOL)_shouldSendDelegateRoutesChanged;
- (BOOL)addPickedRoute:(id)a3;
- (BOOL)addPickedRoute:(id)a3 completion:(id)a4;
- (BOOL)airtunesRouteIsPicked;
- (BOOL)alwaysAllowUpdates;
- (BOOL)fetchAvailableRoutesSynchronously;
- (BOOL)handsetRouteIsPicked;
- (BOOL)hasPendingPickedRoutes;
- (BOOL)pickBestDeviceRoute;
- (BOOL)pickHandsetRoute;
- (BOOL)pickRoute:(id)a3;
- (BOOL)pickRoute:(id)a3 withPassword:(id)a4;
- (BOOL)pickRoute:(id)a3 withPassword:(id)a4 completion:(id)a5;
- (BOOL)pickSpeakerRoute;
- (BOOL)receiverRouteIsPicked;
- (BOOL)removePickedRoute:(id)a3;
- (BOOL)removePickedRoute:(id)a3 completion:(id)a4;
- (BOOL)representsLongFormVideoContent;
- (BOOL)routeIsLeaderOfEndpoint:(id)a3;
- (BOOL)routeIsPendingPick:(id)a3;
- (BOOL)routeOtherThanHandsetAndSpeakerAvailable;
- (BOOL)routeOtherThanHandsetAvailable;
- (BOOL)speakerRouteIsPicked;
- (BOOL)supportsMultipleSelection;
- (BOOL)volumeControlIsAvailable;
- (BOOL)wirelessDisplayRouteIsPicked;
- (BOOL)wirelessDisplayRoutesAvailable;
- (MPAVOutputDevicePlaybackDataSource)playbackDataSource;
- (MPAVRoute)legacyCachedRoute;
- (MPAVRoute)pendingPickedRoute;
- (MPAVRoute)pickedRoute;
- (MPAVRoutingController)init;
- (MPAVRoutingController)initWithDataSource:(id)a3 name:(id)a4;
- (MPAVRoutingController)initWithName:(id)a3;
- (MPAVRoutingControllerDelegate)delegate;
- (MPAVRoutingDataSource)dataSource;
- (NSArray)availableRoutes;
- (NSArray)pickedRoutes;
- (NSSet)pendingPickedRoutes;
- (NSString)category;
- (NSString)description;
- (NSString)name;
- (NSString)presentedBundleID;
- (NSString)representedBundleID;
- (id)_fullStateDumpObject;
- (id)_pickedRouteInArray:(id)a3;
- (id)_pickedRoutesInArray:(id)a3;
- (id)_stateDumpObject;
- (id)cachedPickedRoutes;
- (id)cachedRoutes;
- (id)updateAvailableRoutes;
- (id)updatePickedRoutes;
- (id)videoRouteForRoute:(id)a3;
- (int64_t)_externalScreenType:(BOOL *)a3;
- (int64_t)_volumeControlStateForPickedRoute;
- (int64_t)activeRouteType;
- (int64_t)discoveryMode;
- (int64_t)externalScreenType;
- (int64_t)routeTypes;
- (void)_activeAudioRouteDidChangeNotification:(id)a3;
- (void)_clearLegacyCachedRoute;
- (void)_externalScreenTypeDidChangeNotification:(id)a3;
- (void)_mediaServerDiedNotification:(id)a3;
- (void)_onQueueSetExternalScreenType:(int64_t)a3;
- (void)_pickableRoutesDidChangeNotification:(id)a3;
- (void)_promptForHijackIfNeeded:(id)a3 handler:(id)a4;
- (void)_registerNotifications;
- (void)_routeStatusDidChangeNotification:(id)a3;
- (void)_scheduleSendDelegateRoutesChanged;
- (void)_sendDelegateFailedToPickRouteWithError:(id)a3;
- (void)_sendDelegatePickedRoutesChanged;
- (void)_setExternalScreenType:(int64_t)a3;
- (void)_setVolumeControlStateForPickedRoute:(int64_t)a3;
- (void)_syncUpdateRoutes;
- (void)_unregisterNotifications;
- (void)_updateCachedRoutes;
- (void)_volumeControlAvailabilityDidChangeNotification:(id)a3;
- (void)clearCachedRoutes;
- (void)dealloc;
- (void)fetchAvailableRoutesWithCompletionHandler:(id)a3;
- (void)fetchAvailableRoutesWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)getActiveRouteWithTimeout:(double)a3 completion:(id)a4;
- (void)selectRoute:(id)a3 operation:(int64_t)a4 completion:(id)a5;
- (void)selectRoutes:(id)a3 operation:(int64_t)a4 completion:(id)a5;
- (void)setAlwaysAllowUpdates:(BOOL)a3;
- (void)setCachedRoutes:(id)a3;
- (void)setCategory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryMode:(int64_t)a3;
- (void)setFetchAvailableRoutesSynchronously:(BOOL)a3;
- (void)setLegacyCachedRoute:(id)a3;
- (void)setName:(id)a3;
- (void)setPlaybackDataSource:(id)a3;
- (void)setPresentedBundleID:(id)a3;
- (void)setRepresentedBundleID:(id)a3;
- (void)setRouteTypes:(int64_t)a3;
- (void)unpickAirPlayScreenRouteWithCompletion:(id)a3;
- (void)unpickTVRoutes;
@end

@implementation MPAVRoutingController

- (void)_scheduleSendDelegateRoutesChanged
{
  if ([(MPAVRoutingController *)self _shouldSendDelegateRoutesChanged])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__MPAVRoutingController__scheduleSendDelegateRoutesChanged__block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (BOOL)_shouldSendDelegateRoutesChanged
{
  v3 = [(MPAVRoutingController *)self dataSource];
  if (([v3 didReceiveDiscoveryResults] & 1) == 0)
  {

    goto LABEL_7;
  }
  v4 = [(MPAVRoutingController *)self dataSource];
  int v5 = [v4 hasActiveAudioCategory];

  if (!v5)
  {
LABEL_7:
    LOBYTE(v6) = 0;
    return v6;
  }
  if ([(MPAVRoutingController *)self discoveryMode]
    || (BOOL v6 = [(MPAVRoutingController *)self alwaysAllowUpdates]))
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (MPAVRoutingDataSource)dataSource
{
  return self->_dataSource;
}

- (int64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (BOOL)alwaysAllowUpdates
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (MPAVRoutingController)initWithName:(id)a3
{
  id v4 = a3;
  int v5 = objc_alloc_init(MPAVOutputDeviceRoutingDataSource);
  uint64_t v6 = [(MPAVRoutingController *)self initWithDataSource:v5 name:v4];

  return v6;
}

uint64_t __83__MPAVRoutingController_fetchAvailableRoutesWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)getActiveRouteWithCompletion:(id)a3
{
}

- (void)setDiscoveryMode:(int64_t)a3
{
  self->_discoveryMode = a3;
  -[MPAVRoutingDataSource setDiscoveryMode:](self->_dataSource, "setDiscoveryMode:");
}

void __36__MPAVRoutingController_pickedRoute__block_invoke(uint64_t a1)
{
}

- (void)setDelegate:(id)a3
{
}

uint64_t __43__MPAVRoutingController_alwaysAllowUpdates__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80);
  return result;
}

void __43__MPAVRoutingController_cachedPickedRoutes__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setFetchAvailableRoutesSynchronously:(BOOL)a3
{
  self->_fetchAvailableRoutesSynchronously = a3;
}

void __68__MPAVRoutingController__getActiveRouteWithTimeout_type_completion___block_invoke()
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = [v2 addObserverForName:*MEMORY[0x1E4F77220] object:0 queue:0 usingBlock:&__block_literal_global_63];
  v1 = (void *)_getActiveRouteWithTimeout_type_completion____activeRouteNotificationObserver;
  _getActiveRouteWithTimeout_type_completion____activeRouteNotificationObserver = v0;
}

+ (void)getActiveRouteWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  objc_msgSend(a1, "_getActiveRouteWithTimeout:type:completion:", objc_msgSend(a1, "activeRouteType"), v6, a3);
}

+ (int64_t)activeRouteType
{
  return MEMORY[0x1F412DD98](a1, a2);
}

+ (void)_getActiveRouteWithTimeout:(double)a3 type:(int64_t)a4 completion:(id)a5
{
  id v5 = a5;
  if (_getActiveRouteWithTimeout_type_completion__onceToken != -1) {
    dispatch_once(&_getActiveRouteWithTimeout_type_completion__onceToken, &__block_literal_global_59);
  }
  char v7 = v5;
  id v6 = v5;
  MRAVEndpointResolveActiveSystemEndpointWithType();
}

void __68__MPAVRoutingController__getActiveRouteWithTimeout_type_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v4 = +[MPAVRoutingController systemRoute];
  if (!a2 || MRAVEndpointGetLocalEndpoint() == a2)
  {
    char v7 = v4;
  }
  else
  {
    v8 = [[MPAVEndpointRoute alloc] initWithEndpoint:a2];

    id v5 = MRAVEndpointGetExternalDevice();
    if (v5)
    {
      id v6 = [[MPAVRouteConnection alloc] initWithExternalDeviceObject:v5];
      [(MPAVEndpointRoute *)v8 setConnection:v6];
    }
    char v7 = v8;
  }
  v9 = v7;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (MPAVRoute)systemRoute
{
  if (systemRoute_onceToken != -1) {
    dispatch_once(&systemRoute_onceToken, &__block_literal_global_53);
  }
  id v2 = (void *)systemRoute_systemRoute;

  return (MPAVRoute *)v2;
}

void __41__MPAVRoutingController_setCachedRoutes___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  id v5 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    char v7 = [*(id *)(v6 + 8) valueForKey:@"routeName"];
    v8 = [v7 componentsJoinedByString:@", "];
    int v16 = 138543618;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ updated routes: [%@]", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v9 = [*(id *)(a1 + 32) _pickedRoutesInArray:*(void *)(a1 + 40)];
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v9;

  v12 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = [*(id *)(v13 + 16) valueForKey:@"routeName"];
    v15 = [v14 componentsJoinedByString:@", "];
    int v16 = 138543618;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    v19 = v15;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ updated picked routes: [%@]", (uint8_t *)&v16, 0x16u);
  }
}

- (id)_pickedRoutesInArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
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
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isPicked", (void)v12)) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

void __57__MPAVRoutingController__sendDelegatePickedRoutesChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = [v2 pickedRoute];
    [WeakRetained routingController:v2 pickedRouteDidChange:v3];
  }
  if (objc_opt_respondsToSelector())
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 pickedRoutes];
    [WeakRetained routingController:v4 pickedRoutesDidChange:v5];
  }
}

- (MPAVRoute)pickedRoute
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(MPAVRoutingController *)self pickedRoutes];
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__9235;
  int v16 = __Block_byref_object_dispose__9236;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__MPAVRoutingController_pickedRoute__block_invoke;
  v11[3] = &unk_1E57F9F20;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(serialQueue, v11);
  id v5 = (void *)v13[5];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [v3 firstObject];
  }
  uint64_t v7 = v6;
  uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [v7 routeName];
    *(_DWORD *)buf = 138543618;
    v19 = self;
    __int16 v20 = 2114;
    v21 = v9;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ returning single pickedRoute: %{public}@", buf, 0x16u);
  }
  _Block_object_dispose(&v12, 8);

  return (MPAVRoute *)v7;
}

- (NSArray)pickedRoutes
{
  id v3 = [(MPAVRoutingController *)self cachedPickedRoutes];
  if (![v3 count]
    && [(MPAVRoutingController *)self fetchAvailableRoutesSynchronously])
  {
    [(MPAVRoutingController *)self _syncUpdateRoutes];
    uint64_t v4 = [(MPAVRoutingController *)self cachedPickedRoutes];

    id v3 = (void *)v4;
  }

  return (NSArray *)v3;
}

- (id)cachedPickedRoutes
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__9235;
  uint64_t v8 = __Block_byref_object_dispose__9236;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (BOOL)fetchAvailableRoutesSynchronously
{
  return self->_fetchAvailableRoutesSynchronously;
}

uint64_t __62__MPAVRoutingController__pickableRoutesDidChangeNotification___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__MPAVRoutingController__pickableRoutesDidChangeNotification___block_invoke_2;
  v3[3] = &unk_1E57F9ED0;
  v3[4] = v1;
  return [v1 fetchAvailableRoutesWithCompletionQueue:MEMORY[0x1E4F14428] completionHandler:v3];
}

- (MPAVRoutingController)initWithDataSource:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MPAVRoutingController;
  id v9 = [(MPAVRoutingController *)&v21 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_alwaysAllowUpdates = 1;
    objc_storeStrong((id *)&v9->_dataSource, a3);
    uint64_t v11 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_discoveryMode = 0;
    v10->_routeTypes = -1;
    long long v13 = [[MPAVRoutingControllerSelectionQueue alloc] initWithRoutingController:v10];
    routingControllerSelectionQueue = v10->_routingControllerSelectionQueue;
    v10->_routingControllerSelectionQueue = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.MediaPlayer.MPAVRoutingController/serialQueue", 0);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v15;

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __49__MPAVRoutingController_initWithDataSource_name___block_invoke;
    v19[3] = &unk_1E57F6298;
    id v17 = v10;
    __int16 v20 = v17;
    v17->_stateHandle = __49__MPAVRoutingController_initWithDataSource_name___block_invoke((uint64_t)v19);
    [(MPAVRoutingController *)v17 _registerNotifications];
  }
  return v10;
}

uint64_t __49__MPAVRoutingController_initWithDataSource_name___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = dispatch_get_global_queue(0, 0);
  id v3 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), *(void *)(a1 + 32)];
  objc_copyWeak(&v6, &location);
  uint64_t v4 = MSVLogAddStateHandler();
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v4;
}

- (void)_pickableRoutesDidChangeNotification:(id)a3
{
  uint64_t v4 = [(id)objc_opt_class() _sharedWorkerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MPAVRoutingController__pickableRoutesDidChangeNotification___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_registerNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__pickableRoutesDidChangeNotification_ name:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:self->_dataSource];
  [v3 addObserver:self selector:sel__routeStatusDidChangeNotification_ name:@"MPAVRoutingDataSourceFailureNotification" object:self->_dataSource];
  [v3 addObserver:self selector:sel__volumeControlAvailabilityDidChangeNotification_ name:@"MPAVRoutingDataSourceVolumeControlAvailabilityDidChangeNotification" object:self->_dataSource];
  [v3 addObserver:self selector:sel__externalScreenTypeDidChangeNotification_ name:@"MPAVRoutingDataSourceExternalScreenTypeDidChangeNotification" object:self->_dataSource];
  [v3 addObserver:self selector:sel__activeAudioRouteDidChangeNotification_ name:@"MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification" object:self->_dataSource];
  objc_initWeak(&location, self);
  uint64_t v4 = [(id)objc_opt_class() _sharedWorkerQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MPAVRoutingController__registerNotifications__block_invoke;
  v5[3] = &unk_1E57F6F90;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch("com.apple.airplay.deviceAvailability", &self->_deviceAvailabilityNotifyToken, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)fetchAvailableRoutesWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(id)objc_opt_class() _sharedWorkerQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__MPAVRoutingController_fetchAvailableRoutesWithCompletionQueue_completionHandler___block_invoke;
    block[3] = &unk_1E57F8408;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

+ (id)_sharedWorkerQueue
{
  if (_sharedWorkerQueue_onceToken != -1) {
    dispatch_once(&_sharedWorkerQueue_onceToken, &__block_literal_global_9398);
  }
  id v2 = (void *)_sharedWorkerQueue___sharedWorkerQueue;

  return v2;
}

void __59__MPAVRoutingController__scheduleSendDelegateRoutesChanged__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained routingControllerAvailableRoutesDidChange:*(void *)(a1 + 32)];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 0;
}

uint64_t __62__MPAVRoutingController__pickableRoutesDidChangeNotification___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendDelegatePickedRoutesChanged];
  [*(id *)(*(void *)(a1 + 32) + 48) pickedRouteDidChange];
  id v2 = *(void **)(a1 + 32);

  return [v2 _scheduleSendDelegateRoutesChanged];
}

- (void)_sendDelegatePickedRoutesChanged
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MPAVRoutingController__sendDelegatePickedRoutesChanged__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __83__MPAVRoutingController_fetchAvailableRoutesWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 96) getRoutesForCategory:*(void *)(*(void *)(a1 + 32) + 120)];
  id v3 = (void *)[v2 copy];

  [*(id *)(a1 + 32) setCachedRoutes:v3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__MPAVRoutingController_fetchAvailableRoutesWithCompletionQueue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E57F9140;
  uint64_t v4 = *(NSObject **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

- (void)setCachedRoutes:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

void __59__MPAVRoutingController__scheduleSendDelegateRoutesChanged__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 33))
  {
    *(unsigned char *)(v1 + 33) = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__MPAVRoutingController__scheduleSendDelegateRoutesChanged__block_invoke_2;
    block[3] = &unk_1E57F9EA8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __36__MPAVRoutingController_systemRoute__block_invoke()
{
  uint64_t v0 = [[MPAVEndpointRoute alloc] initWithEndpoint:MRAVEndpointGetLocalEndpoint()];
  uint64_t v1 = (void *)systemRoute_systemRoute;
  systemRoute_systemRoute = (uint64_t)v0;
}

void __43__MPAVRoutingController__sharedWorkerQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MediaPlayer.MPAVRoutingController/sharedWorkerQueue", v2);
  uint64_t v1 = (void *)_sharedWorkerQueue___sharedWorkerQueue;
  _sharedWorkerQueue___sharedWorkerQueue = (uint64_t)v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedBundleID, 0);
  objc_storeStrong((id *)&self->_presentedBundleID, 0);
  objc_destroyWeak((id *)&self->_playbackDataSource);
  objc_storeStrong((id *)&self->_legacyCachedRoute, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_routingControllerSelectionQueue, 0);
  objc_storeStrong((id *)&self->_cachedPickedRoutes, 0);

  objc_storeStrong((id *)&self->_cachedRoutes, 0);
}

- (BOOL)representsLongFormVideoContent
{
  return self->_representsLongFormVideoContent;
}

- (NSString)representedBundleID
{
  return self->_representedBundleID;
}

- (NSString)presentedBundleID
{
  return self->_presentedBundleID;
}

- (void)setPlaybackDataSource:(id)a3
{
}

- (MPAVOutputDevicePlaybackDataSource)playbackDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackDataSource);

  return (MPAVOutputDevicePlaybackDataSource *)WeakRetained;
}

- (void)setLegacyCachedRoute:(id)a3
{
}

- (MPAVRoute)legacyCachedRoute
{
  return self->_legacyCachedRoute;
}

- (int64_t)routeTypes
{
  return self->_routeTypes;
}

- (NSString)category
{
  return self->_category;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (MPAVRoutingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPAVRoutingControllerDelegate *)WeakRetained;
}

- (id)_fullStateDumpObject
{
  v21[7] = *MEMORY[0x1E4F143B8];
  v20[0] = @"_obj";
  uint64_t v3 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  id v4 = (void *)v3;
  dataSource = self->_dataSource;
  name = (__CFString *)self->_name;
  if (!name) {
    name = @"<NONE>";
  }
  v21[0] = v3;
  v21[1] = name;
  v20[1] = @"name";
  v20[2] = @"dataSource";
  if (dataSource) {
    id v7 = (__CFString *)dataSource;
  }
  else {
    id v7 = @"<NONE>";
  }
  v21[2] = v7;
  v20[3] = @"discoveryMode";
  id v8 = [NSNumber numberWithInteger:self->_discoveryMode];
  v21[3] = v8;
  v20[4] = @"cachedRoutes";
  uint64_t v9 = [(MPAVRoutingController *)self cachedRoutes];
  id v10 = (void *)v9;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  else {
    id v11 = @"<NONE>";
  }
  v21[4] = v11;
  v20[5] = @"cachedPickedRoutes";
  uint64_t v12 = [(MPAVRoutingController *)self cachedPickedRoutes];
  long long v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = @"<NONE>";
  }
  v21[5] = v14;
  v20[6] = @"pendingRoutes";
  uint64_t v15 = [(MPAVRoutingControllerSelectionQueue *)self->_routingControllerSelectionQueue pendingPickedRoute];
  int v16 = (void *)v15;
  if (v15) {
    id v17 = (__CFString *)v15;
  }
  else {
    id v17 = @"<NONE>";
  }
  v21[6] = v17;
  __int16 v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];

  return v18;
}

- (id)_stateDumpObject
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"_obj";
  uint64_t v3 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  v7[1] = @"name";
  v8[0] = v3;
  name = (__CFString *)self->_name;
  if (!name) {
    name = @"<NONE>";
  }
  v8[1] = name;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (BOOL)removePickedRoute:(id)a3 completion:(id)a4
{
  [(MPAVRoutingController *)self selectRoute:a3 operation:2 completion:a4];

  return [(MPAVRoutingController *)self supportsMultipleSelection];
}

- (BOOL)removePickedRoute:(id)a3
{
  return [(MPAVRoutingController *)self removePickedRoute:a3 completion:0];
}

- (BOOL)addPickedRoute:(id)a3 completion:(id)a4
{
  [(MPAVRoutingController *)self selectRoute:a3 operation:1 completion:a4];

  return [(MPAVRoutingController *)self supportsMultipleSelection];
}

- (BOOL)addPickedRoute:(id)a3
{
  return [(MPAVRoutingController *)self addPickedRoute:a3 completion:0];
}

- (BOOL)supportsMultipleSelection
{
  return [(MPAVRoutingDataSource *)self->_dataSource supportsMultipleSelection];
}

- (BOOL)_pickRoute:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"MPAVRoutingController.m", 1160, @"Invalid parameter not satisfying: %@", @"route" object file lineNumber description];
  }
  [(MPAVRoutingController *)self _clearLegacyCachedRoute];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = [(MPAVRoutingController *)self cachedPickedRoutes];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v12++) setPicked:0];
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  id v30 = v7;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  [(MPAVRoutingControllerSelectionQueue *)self->_routingControllerSelectionQueue addPendingRoutes:v13];
  objc_initWeak(&location, self);
  dataSource = self->_dataSource;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__MPAVRoutingController__pickRoute_completion___block_invoke;
  v20[3] = &unk_1E57EF028;
  objc_copyWeak(&v24, &location);
  id v15 = v13;
  id v21 = v15;
  id v16 = v7;
  id v22 = v16;
  id v17 = v8;
  id v23 = v17;
  [(MPAVRoutingDataSource *)dataSource setPickedRoute:v16 withPassword:0 completion:v20];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return 1;
}

void __47__MPAVRoutingController__pickRoute_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[6] removePendingRoutes:*(void *)(a1 + 32)];
    id v6 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    id v7 = v6;
    if (v3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v17 = v8;
        __int16 v18 = 2114;
        id v19 = v3;
        _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "Failed to pick single route %{public}@ error: %{public}@", buf, 0x16u);
      }

      [v5 _sendDelegateFailedToPickRouteWithError:v3];
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v9;
        _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Successfully picked single route %{public}@", buf, 0xCu);
      }

      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v14 = @"MPAVRoutingControllerRouteUserInfoKey";
      uint64_t v15 = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 postNotificationName:@"MPAVRoutingControllerDidPickRouteNotification" object:v5 userInfo:v11];
    }
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }
}

- (BOOL)pickRoute:(id)a3 withPassword:(id)a4 completion:(id)a5
{
  return [(MPAVRoutingController *)self _pickRoute:a3 completion:a5];
}

- (BOOL)pickRoute:(id)a3 withPassword:(id)a4
{
  return [(MPAVRoutingController *)self pickRoute:a3 withPassword:a4 completion:0];
}

- (BOOL)pickRoute:(id)a3
{
  return [(MPAVRoutingController *)self pickRoute:a3 withPassword:0];
}

void __47__MPAVRoutingController__registerNotifications__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    notify_get_state(a2, &state64);
    WeakRetained[60] = (state64 & 3) != 0;
    [WeakRetained _scheduleSendDelegateRoutesChanged];
  }
}

- (void)_volumeControlAvailabilityDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"VolumeControlAvailability"];
  uint64_t v6 = [v5 BOOLValue];

  if (v6) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  [(MPAVRoutingController *)self _setVolumeControlStateForPickedRoute:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained routingController:self volumeControlAvailabilityDidChange:v6];
  }
}

- (void)_routeStatusDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v10 = [v5 objectForKey:@"Route"];

  uint64_t v6 = [v4 userInfo];

  uint64_t v7 = [v6 objectForKey:@"Error"];

  uint64_t v8 = v10;
  if (v10)
  {
    char v9 = [v10 isPicked];
    uint64_t v8 = v10;
    if ((v9 & 1) != 0 || v7)
    {
      [(MPAVRoutingControllerSelectionQueue *)self->_routingControllerSelectionQueue cancelInProgressSelectionForRoute:v10];
      uint64_t v8 = v10;
    }
  }
  if ([v8 routeSubtype] == 9) {
    [(MPAVRoutingController *)self _sendDelegateFailedToPickRouteWithError:v7];
  }
}

- (void)_mediaServerDiedNotification:(id)a3
{
  [(MPAVRoutingController *)self _unregisterNotifications];

  [(MPAVRoutingController *)self _registerNotifications];
}

- (void)_externalScreenTypeDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"ExternalScreenType"];
  uint64_t v6 = [v5 integerValue];

  [(MPAVRoutingController *)self _setExternalScreenType:v6];
}

- (void)_activeAudioRouteDidChangeNotification:(id)a3
{
  id v4 = a3;
  [(MPAVRoutingController *)self _clearLegacyCachedRoute];
  [(MPAVRoutingController *)self _updateCachedRoutes];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  char v9 = __64__MPAVRoutingController__activeAudioRouteDidChangeNotification___block_invoke;
  id v10 = &unk_1E57F9F98;
  id v5 = v4;
  id v11 = v5;
  uint64_t v12 = self;
  uint64_t v6 = (void (**)(void))MEMORY[0x19971E0F0](&v7);
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v7, v8, v9, v10)) {
    v6[2](v6);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __64__MPAVRoutingController__activeAudioRouteDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) userInfo];
    int v8 = 136446466;
    char v9 = "-[MPAVRoutingController _activeAudioRouteDidChangeNotification:]_block_invoke";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "🎥 %{public}s %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v4 = [*(id *)(a1 + 32) userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F74A90]];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 88));
    if (objc_opt_respondsToSelector()) {
      [WeakRetained routingControllerDidPauseFromActiveRouteChange:*(void *)(a1 + 40)];
    }
  }
}

- (int64_t)_volumeControlStateForPickedRoute
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__MPAVRoutingController__volumeControlStateForPickedRoute__block_invoke;
  v5[3] = &unk_1E57F9F20;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__MPAVRoutingController__volumeControlStateForPickedRoute__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (void)_updateCachedRoutes
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__MPAVRoutingController__updateCachedRoutes__block_invoke;
  v2[3] = &unk_1E57F9ED0;
  v2[4] = self;
  [(MPAVRoutingController *)self fetchAvailableRoutesWithCompletionQueue:MEMORY[0x1E4F14428] completionHandler:v2];
}

uint64_t __44__MPAVRoutingController__updateCachedRoutes__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleSendDelegateRoutesChanged];
}

- (void)_unregisterNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:self->_dataSource];
  [v3 removeObserver:self name:@"MPAVRoutingDataSourceFailureNotification" object:self->_dataSource];
  [v3 removeObserver:self name:@"MPAVRoutingDataSourceVolumeControlAvailabilityDidChangeNotification" object:self->_dataSource];
  [v3 removeObserver:self name:@"MPAVRoutingDataSourceExternalScreenTypeDidChangeNotification" object:self->_dataSource];
  [v3 removeObserver:self name:@"MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification" object:self->_dataSource];
  notify_cancel(self->_deviceAvailabilityNotifyToken);
}

- (void)_setVolumeControlStateForPickedRoute:(int64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__MPAVRoutingController__setVolumeControlStateForPickedRoute___block_invoke;
  v4[3] = &unk_1E57F8328;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

void __62__MPAVRoutingController__setVolumeControlStateForPickedRoute___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 40);
  *(void *)(v1 + 40) = *(void *)(a1 + 40);
  if (v2 != *(void *)(a1 + 40))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__MPAVRoutingController__setVolumeControlStateForPickedRoute___block_invoke_2;
    block[3] = &unk_1E57F9EA8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __62__MPAVRoutingController__setVolumeControlStateForPickedRoute___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPAVRoutingControllerDidUpdateVolumeControlStateNotification" object:*(void *)(a1 + 32) userInfo:0];
}

- (void)_setExternalScreenType:(int64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__MPAVRoutingController__setExternalScreenType___block_invoke;
  v4[3] = &unk_1E57F8328;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

uint64_t __48__MPAVRoutingController__setExternalScreenType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueSetExternalScreenType:*(void *)(a1 + 40)];
}

- (void)_sendDelegateFailedToPickRouteWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__MPAVRoutingController__sendDelegateFailedToPickRouteWithError___block_invoke;
  v6[3] = &unk_1E57F9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __65__MPAVRoutingController__sendDelegateFailedToPickRouteWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained routingController:*(void *)(a1 + 32) didFailToPickRouteWithError:*(void *)(a1 + 40)];
  }
}

- (void)_promptForHijackIfNeeded:(id)a3 handler:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v46[0] = 0;
      v46[1] = v46;
      v46[2] = 0x3032000000;
      v46[3] = __Block_byref_object_copy__9235;
      v46[4] = __Block_byref_object_dispose__9236;
      id v47 = 0;
      id v10 = objc_alloc(MEMORY[0x1E4F223C8]);
      id v11 = [(MPAVRoutingController *)self presentedBundleID];
      uint64_t v12 = (void *)[v10 initWithBundleIdentifier:v11 allowPlaceholder:0 error:0];

      uint64_t v13 = [v12 localizedName];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __58__MPAVRoutingController__promptForHijackIfNeeded_handler___block_invoke;
      v41[3] = &unk_1E57EEFB0;
      v41[4] = self;
      id v14 = v6;
      id v42 = v14;
      v45 = v46;
      id v15 = v13;
      id v43 = v15;
      id v16 = v7;
      id v44 = v16;
      id v30 = (void *)MEMORY[0x19971E0F0](v41);
      id v17 = objc_loadWeakRetained((id *)&self->_playbackDataSource);
      id v18 = objc_loadWeakRetained((id *)&self->_delegate);
      char v19 = [v14 isPicked];
      if (v17) {
        char v20 = v19;
      }
      else {
        char v20 = 1;
      }
      if ((v20 & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v25 = os_log_create("com.apple.amp.mediaplayer", "Routing");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v49 = v14;
          __int16 v50 = 2114;
          id v51 = v17;
          _os_log_impl(&dword_1952E8000, v25, OS_LOG_TYPE_DEFAULT, "Skipping playback checks. Route: %{public}@, playbackDataSource: %{public}@", buf, 0x16u);
        }

        (*((void (**)(id, uint64_t))v16 + 2))(v16, 1);
      }
      else
      {
        id v29 = v14;
        id v21 = [(MPAVRoutingController *)self dataSource];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v23 = [(MPAVRoutingController *)self dataSource];
          id v24 = [v23 endpointRoute];
        }
        else
        {
          id v24 = 0;
        }
        long long v26 = os_log_create("com.apple.amp.mediaplayer", "Routing");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v29;
          _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_DEFAULT, "Hijack - Requesting playbackState for %@", buf, 0xCu);
        }

        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __58__MPAVRoutingController__promptForHijackIfNeeded_handler___block_invoke_74;
        v31[3] = &unk_1E57EF000;
        id v32 = v29;
        id v27 = v24;
        id v33 = v27;
        id v28 = v32;
        id v34 = v28;
        id v35 = v18;
        id v38 = v30;
        v36 = self;
        id v39 = v16;
        v40 = v46;
        id v37 = v15;
        [v17 getOutputDeviceIsPlaying:v28 completion:v31];
      }
      _Block_object_dispose(v46, 8);
    }
    else
    {
      (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    }
  }
}

void __58__MPAVRoutingController__promptForHijackIfNeeded_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__MPAVRoutingController__promptForHijackIfNeeded_handler___block_invoke_2;
  v9[3] = &unk_1E57F3220;
  v9[4] = v5;
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  [WeakRetained routingController:v5 shouldHijackRoute:v6 alertStyle:a2 busyRouteName:v7 presentingAppName:v8 completion:v9];
}

void __58__MPAVRoutingController__promptForHijackIfNeeded_handler___block_invoke_74(uint64_t a1, int a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 67109378;
    int v31 = a2;
    __int16 v32 = 2112;
    uint64_t v33 = v5;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "Hijack - playbackState is %{BOOL}u for %@", buf, 0x12u);
  }

  if (([*(id *)(a1 + 40) isDeviceRoute] & 1) != 0
    || ![*(id *)(a1 + 48) isDeviceRoute])
  {
    int v6 = [*(id *)(a1 + 48) isProxyGroupPlayer];
    if (v6) {
      LOBYTE(v6) = [*(id *)(a1 + 64) routeIsLeaderOfEndpoint:*(void *)(a1 + 48)];
    }
    if (a2 && (v6 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [*(id *)(a1 + 56) routingController:*(void *)(a1 + 64) shouldHijackRoute:*(void *)(a1 + 48) alertStyle:0 busyRouteName:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) presentingAppName:*(void *)(a1 + 72) completion:*(void *)(a1 + 88)];
    }
    else
    {
      MRAVOutputContextGetSharedAudioPresentationContext();
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v7 = (id)MRAVOutputContextCopyOutputDevices();
      uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        char v10 = 0;
        uint64_t v11 = *(void *)v26;
LABEL_16:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
          id v14 = [*(id *)(a1 + 48) routeUID];
          int v15 = [v13 isEqualToString:v14];

          if ((v10 & 1) != 0 || (MRAVOutputDeviceIsLocalDevice() & 1) == 0)
          {
            uint64_t v16 = MRAVOutputDeviceCopyName();
            uint64_t v17 = *(void *)(*(void *)(a1 + 96) + 8);
            id v18 = *(void **)(v17 + 40);
            *(void *)(v17 + 40) = v16;

            if (v15)
            {

              goto LABEL_30;
            }
            char v10 = 1;
          }
          else
          {
            char v10 = 0;
          }
          if (v9 == ++v12)
          {
            uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
            if (v9) {
              goto LABEL_16;
            }

            if ((v10 & 1) == 0) {
              goto LABEL_38;
            }
            if (!v15)
            {
LABEL_34:
              char v20 = [*(id *)(a1 + 64) pickedRoute];
              if (![v20 isDeviceRoute])
              {

                goto LABEL_38;
              }
              char v21 = objc_opt_respondsToSelector();

              if ((v21 & 1) == 0) {
                goto LABEL_38;
              }
              (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
              goto LABEL_39;
            }
LABEL_30:
            if ([*(id *)(a1 + 48) isAirPlayRoute])
            {
              int8x16_t v22 = *(int8x16_t *)(a1 + 56);
              id v19 = (id)v22.i64[0];
              id v23 = *(id *)(a1 + 80);
              id v24 = *(id *)(a1 + 88);
              MRMediaRemoteGetNowPlayingClient();

              goto LABEL_39;
            }
            goto LABEL_34;
          }
        }
      }

LABEL_38:
      (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
LABEL_39:
    }
  }
  else if (a2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
}

void __58__MPAVRoutingController__promptForHijackIfNeeded_handler___block_invoke_75(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[(id)MRNowPlayingClientGetBundleIdentifier() copy];
  id v3 = [*(id *)(a1 + 32) presentedBundleID];
  int v4 = [v3 isEqualToString:v2];

  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      int v6 = @"does NOT represent NowPlaying App";
    }
    else {
      int v6 = @"represents NowPlaying App";
    }
    id v7 = [*(id *)(a1 + 32) presentedBundleID];
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    uint64_t v13 = v2;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "Hijack - RoutingController %{public}@ Presenting: %{public}@ NowPlaying: %{public}@", (uint8_t *)&v8, 0x20u);
  }
  if (v4 & 1) == 0 && *(unsigned char *)(a1 + 64) && (objc_opt_respondsToSelector()) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __58__MPAVRoutingController__promptForHijackIfNeeded_handler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      int v6 = [*(id *)(a1 + 32) presentedBundleID];
      int v9 = 138412290;
      __int16 v10 = v6;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "Perform hijack for %@", (uint8_t *)&v9, 0xCu);
    }
    int v4 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    id v7 = [*(id *)(a1 + 32) presentedBundleID];
    [v4 setAttribute:v7 forKey:*MEMORY[0x1E4F74AB0] error:0];
    goto LABEL_7;
  }
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) presentedBundleID];
    int v9 = 138412290;
    __int16 v10 = v7;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "Do not perform hijack for %@", (uint8_t *)&v9, 0xCu);
LABEL_7:
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_pickedRouteInArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 isPicked])
        {
          id v10 = v9;

          int v6 = v10;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)_onQueueSetExternalScreenType:(int64_t)a3
{
  if (self->_externalScreenType != a3)
  {
    self->_externalScreenType = a3;
    self->_hasExternalScreenType = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__MPAVRoutingController__onQueueSetExternalScreenType___block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __55__MPAVRoutingController__onQueueSetExternalScreenType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained routingControllerExternalScreenTypeDidChange:*(void *)(a1 + 32)];
  }
}

- (int64_t)_externalScreenType:(BOOL *)a3
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MPAVRoutingController__externalScreenType___block_invoke;
  block[3] = &unk_1E57F9278;
  block[4] = self;
  void block[5] = &v12;
  block[6] = &v8;
  dispatch_sync(serialQueue, block);
  if (a3) {
    *a3 = *((unsigned char *)v9 + 24);
  }
  int64_t v5 = v13[3];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

void *__45__MPAVRoutingController__externalScreenType___block_invoke(void *result)
{
  *(void *)(*(void *)(result[5] + 8) + 24) = *(void *)(result[4] + 24);
  *(unsigned char *)(*(void *)(result[6] + 8) + 24) = *(unsigned char *)(result[4] + 32);
  return result;
}

- (BOOL)_deviceAvailabilityOverrideState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__MPAVRoutingController__deviceAvailabilityOverrideState__block_invoke;
  v5[3] = &unk_1E57F9F20;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__MPAVRoutingController__deviceAvailabilityOverrideState__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 60);
  return result;
}

- (void)_clearLegacyCachedRoute
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MPAVRoutingController__clearLegacyCachedRoute__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __48__MPAVRoutingController__clearLegacyCachedRoute__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 136);
  *(void *)(v1 + 136) = 0;
}

- (void)_syncUpdateRoutes
{
  id v3 = [(MPAVRoutingDataSource *)self->_dataSource getRoutesForCategory:self->_category];
  [(MPAVRoutingController *)self setCachedRoutes:v3];
}

- (void)unpickTVRoutes
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  MRAVOutputContextGetSharedAudioPresentationContext();
  id v2 = (void *)MRAVOutputContextCopyOutputDevices();
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        if (MRAVOutputDeviceGetSubtype() == 11 || MRAVOutputDeviceGetSubtype() == 13) {
          objc_msgSend(v3, "addObject:", v9, (void)v13);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    MRAVOutputContextGetSharedAudioPresentationContext();
    MRAVOutputContextRemoveOutputDevices();
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F165D0] sharedAudioPresentationOutputContext];
    char v11 = [MEMORY[0x1E4F165D0] sharedAudioPresentationOutputContext];
    uint64_t v12 = [v11 outputDevices];
    [v10 setOutputDevices:v12];
  }
}

- (void)clearCachedRoutes
{
}

- (BOOL)wirelessDisplayRoutesAvailable
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(MPAVRoutingController *)self availableRoutes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v8 supportsWirelessDisplay] & 1) != 0 || objc_msgSend(v8, "routeType") == 2)
        {

          return 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  return [(MPAVRoutingController *)self _deviceAvailabilityOverrideState]
      || [(MPAVRoutingDataSource *)self->_dataSource devicePresenceDetected];
}

- (BOOL)wirelessDisplayRouteIsPicked
{
  id v2 = [(MPAVRoutingController *)self pickedRoute];
  BOOL v3 = [v2 routeType] == 2;

  return v3;
}

- (id)videoRouteForRoute:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 routeUID];
  if ([v4 length])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [(MPAVRoutingController *)self availableRoutes];
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          long long v10 = [v9 routeUID];
          if ([v4 isEqualToString:v10])
          {
            uint64_t v11 = [v9 routeType];

            if (v11 == 1)
            {
              id v6 = v9;
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
LABEL_15:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)unpickAirPlayScreenRouteWithCompletion:(id)a3
{
  id v4 = a3;
  dataSource = self->_dataSource;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __64__MPAVRoutingController_unpickAirPlayScreenRouteWithCompletion___block_invoke;
  v7[3] = &unk_1E57F90A0;
  id v8 = v4;
  id v6 = v4;
  [(MPAVRoutingDataSource *)dataSource unpickAirPlayAVRoutesWithCompletion:v7];
}

uint64_t __64__MPAVRoutingController_unpickAirPlayScreenRouteWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)routeOtherThanHandsetAvailable
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(MPAVRoutingController *)self availableRoutes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * v7) pickableRouteType])
        {

          return 1;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  return [(MPAVRoutingController *)self _deviceAvailabilityOverrideState]
      || [(MPAVRoutingDataSource *)self->_dataSource devicePresenceDetected];
}

- (BOOL)routeOtherThanHandsetAndSpeakerAvailable
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(MPAVRoutingController *)self availableRoutes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 pickableRouteType] && objc_msgSend(v8, "routeSubtype") != 1)
        {

          return 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  return [(MPAVRoutingController *)self _deviceAvailabilityOverrideState]
      || [(MPAVRoutingDataSource *)self->_dataSource devicePresenceDetected];
}

- (BOOL)receiverRouteIsPicked
{
  id v2 = [(MPAVRoutingController *)self pickedRoute];
  BOOL v3 = [v2 routeSubtype] == 4;

  return v3;
}

- (BOOL)speakerRouteIsPicked
{
  id v2 = [(MPAVRoutingController *)self pickedRoute];
  BOOL v3 = [v2 routeSubtype] == 1;

  return v3;
}

- (void)selectRoutes:(id)a3 operation:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(MPAVRoutingControllerSelectionQueue *)self->_routingControllerSelectionQueue addPendingRoutes:v8];
  long long v10 = [v8 firstObject];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__MPAVRoutingController_selectRoutes_operation_completion___block_invoke;
  v13[3] = &unk_1E57EEF48;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  [(MPAVRoutingController *)self _promptForHijackIfNeeded:v10 handler:v13];
}

void __59__MPAVRoutingController_selectRoutes_operation_completion___block_invoke(void *a1, int a2)
{
  BOOL v3 = *(void **)(a1[4] + 48);
  if (a2)
  {
    uint64_t v5 = a1[6];
    uint64_t v4 = a1[7];
    uint64_t v6 = a1[5];
    [v3 enqueueSelectionOperation:v4 forRoutes:v6 completion:v5];
  }
  else
  {
    [v3 removePendingRoutes:a1[5]];
    uint64_t v7 = a1[6];
    id v8 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MPErrorDomain" code:1 userInfo:0];
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

- (void)selectRoute:(id)a3 operation:(int64_t)a4 completion:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 arrayWithObjects:&v12 count:1];

  -[MPAVRoutingController selectRoutes:operation:completion:](self, "selectRoutes:operation:completion:", v11, a4, v9, v12, v13);
}

- (BOOL)pickSpeakerRoute
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v3 = [(MPAVRoutingController *)self availableRoutes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v8 routeSubtype] == 1)
        {
          routingControllerSelectionQueue = self->_routingControllerSelectionQueue;
          uint64_t v18 = v8;
          id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
          [(MPAVRoutingControllerSelectionQueue *)routingControllerSelectionQueue enqueueSelectionOperation:0 forRoutes:v10 completion:0];

          serialQueue = self->_serialQueue;
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __41__MPAVRoutingController_pickSpeakerRoute__block_invoke;
          v13[3] = &unk_1E57F9F98;
          v13[4] = self;
          void v13[5] = v8;
          dispatch_sync(serialQueue, v13);
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return 1;
}

void __41__MPAVRoutingController_pickSpeakerRoute__block_invoke(uint64_t a1)
{
}

- (BOOL)pickHandsetRoute
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = [(MPAVRoutingController *)self availableRoutes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (![v7 pickableRouteType])
        {
          routingControllerSelectionQueue = self->_routingControllerSelectionQueue;
          long long v17 = v7;
          LOBYTE(v4) = 1;
          id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
          [(MPAVRoutingControllerSelectionQueue *)routingControllerSelectionQueue enqueueSelectionOperation:0 forRoutes:v9 completion:0];

          serialQueue = self->_serialQueue;
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __41__MPAVRoutingController_pickHandsetRoute__block_invoke;
          v12[3] = &unk_1E57F9F98;
          v12[4] = self;
          v12[5] = v7;
          dispatch_sync(serialQueue, v12);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

void __41__MPAVRoutingController_pickHandsetRoute__block_invoke(uint64_t a1)
{
}

- (BOOL)pickBestDeviceRoute
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = [(MPAVRoutingController *)self availableRoutes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v8 routeSubtype] == 1 || objc_msgSend(v8, "routeSubtype") == 2)
        {
          routingControllerSelectionQueue = self->_routingControllerSelectionQueue;
          long long v17 = v8;
          BOOL v9 = 1;
          id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
          [(MPAVRoutingControllerSelectionQueue *)routingControllerSelectionQueue enqueueSelectionOperation:0 forRoutes:v11 completion:0];

          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
      BOOL v9 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_13:

  return v9;
}

- (BOOL)handsetRouteIsPicked
{
  id v2 = [(MPAVRoutingController *)self pickedRoute];
  BOOL v3 = [v2 pickableRouteType] == 0;

  return v3;
}

- (void)getActiveRouteWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  objc_msgSend((id)objc_opt_class(), "_getActiveRouteWithTimeout:type:completion:", -[MPAVRoutingController activeRouteType](self, "activeRouteType"), v6, a3);
}

- (void)fetchAvailableRoutesWithCompletionHandler:(id)a3
{
}

- (id)updatePickedRoutes
{
  [(MPAVRoutingController *)self _syncUpdateRoutes];

  return [(MPAVRoutingController *)self cachedPickedRoutes];
}

- (id)updateAvailableRoutes
{
  [(MPAVRoutingController *)self _syncUpdateRoutes];

  return [(MPAVRoutingController *)self cachedRoutes];
}

- (BOOL)airtunesRouteIsPicked
{
  id v2 = [(MPAVRoutingController *)self pickedRoute];
  BOOL v3 = [v2 routeSubtype] == 9;

  return v3;
}

- (void)setRepresentedBundleID:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  if (self->_representedBundleID != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)&self->_representedBundleID, a3);
    if ([(id)objc_opt_class() bundleIdRepresentsLongFormVideoContent:self->_representedBundleID]) {
      char v6 = 1;
    }
    else {
      char v6 = [(id)objc_opt_class() bundleIdRepresentsLongFormVideoContent:self->_presentedBundleID];
    }
    self->_representsLongFormVideoContent = v6;
    uint64_t v5 = v7;
  }
}

- (void)setPresentedBundleID:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  if (self->_presentedBundleID != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)&self->_presentedBundleID, a3);
    if ([(id)objc_opt_class() bundleIdRepresentsLongFormVideoContent:self->_presentedBundleID]) {
      char v6 = 1;
    }
    else {
      char v6 = [(id)objc_opt_class() bundleIdRepresentsLongFormVideoContent:self->_representedBundleID];
    }
    self->_representsLongFormVideoContent = v6;
    uint64_t v5 = v7;
  }
}

- (BOOL)volumeControlIsAvailable
{
  int64_t v3 = [(MPAVRoutingController *)self _volumeControlStateForPickedRoute];
  if (!v3)
  {
    dataSource = self->_dataSource;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__MPAVRoutingController_volumeControlIsAvailable__block_invoke;
    v6[3] = &unk_1E57F9B98;
    v6[4] = self;
    [(MPAVRoutingDataSource *)dataSource getPickedRouteHasVolumeControlWithCompletion:v6];
  }
  return v3 == 1;
}

uint64_t __49__MPAVRoutingController_volumeControlIsAvailable__block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [*(id *)(a1 + 32) _setVolumeControlStateForPickedRoute:v3];
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 _scheduleSendDelegateRoutesChanged];
}

- (void)setRouteTypes:(int64_t)a3
{
  self->_routeTypes = a3;
  [(MPAVRoutingController *)self _updateCachedRoutes];
}

- (void)setCategory:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSString *)[a3 copy];
  category = self->_category;
  self->_category = v4;

  char v6 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = self->_category;
    int v8 = 138543362;
    BOOL v9 = v7;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "Audio category override changed to %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [(MPAVRoutingController *)self _updateCachedRoutes];
}

- (BOOL)routeIsPendingPick:(id)a3
{
  return [(MPAVRoutingControllerSelectionQueue *)self->_routingControllerSelectionQueue routeIsPendingPick:a3];
}

- (BOOL)routeIsLeaderOfEndpoint:(id)a3
{
  return [(MPAVRoutingDataSource *)self->_dataSource routeIsLeaderOfEndpoint:a3];
}

- (NSSet)pendingPickedRoutes
{
  return [(MPAVRoutingControllerSelectionQueue *)self->_routingControllerSelectionQueue pendingPickedRoutes];
}

- (MPAVRoute)pendingPickedRoute
{
  return [(MPAVRoutingControllerSelectionQueue *)self->_routingControllerSelectionQueue pendingPickedRoute];
}

- (BOOL)hasPendingPickedRoutes
{
  return [(MPAVRoutingControllerSelectionQueue *)self->_routingControllerSelectionQueue hasPendingRoutes];
}

- (int64_t)externalScreenType
{
  char v7 = 0;
  int64_t v3 = [(MPAVRoutingController *)self _externalScreenType:&v7];
  if (!v7)
  {
    dataSource = self->_dataSource;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__MPAVRoutingController_externalScreenType__block_invoke;
    v6[3] = &unk_1E57F3380;
    v6[4] = self;
    [(MPAVRoutingDataSource *)dataSource getExternalScreenTypeWithCompletion:v6];
  }
  return v3;
}

uint64_t __43__MPAVRoutingController_externalScreenType__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setExternalScreenType:a2];
}

- (NSArray)availableRoutes
{
  int64_t v3 = [(MPAVRoutingController *)self cachedRoutes];
  if (!v3)
  {
    if ([(MPAVRoutingController *)self fetchAvailableRoutesSynchronously])
    {
      [(MPAVRoutingController *)self _syncUpdateRoutes];
      int64_t v3 = [(MPAVRoutingController *)self cachedRoutes];
      [(MPAVRoutingController *)self _scheduleSendDelegateRoutesChanged];
    }
    else
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      void v7[2] = __40__MPAVRoutingController_availableRoutes__block_invoke;
      v7[3] = &unk_1E57F9ED0;
      void v7[4] = self;
      [(MPAVRoutingController *)self fetchAvailableRoutesWithCompletionQueue:MEMORY[0x1E4F14428] completionHandler:v7];
      int64_t v3 = 0;
    }
  }
  if ([v3 count]) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

uint64_t __40__MPAVRoutingController_availableRoutes__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleSendDelegateRoutesChanged];
}

- (id)cachedRoutes
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  char v7 = __Block_byref_object_copy__9235;
  int v8 = __Block_byref_object_dispose__9236;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __37__MPAVRoutingController_cachedRoutes__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setAlwaysAllowUpdates:(BOOL)a3
{
}

uint64_t __47__MPAVRoutingController_setAlwaysAllowUpdates___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 80) = *(unsigned char *)(result + 40);
  return result;
}

- (NSString)description
{
  name = self->_name;
  uint64_t v4 = NSString;
  uint64_t v5 = objc_opt_class();
  if (name) {
    [v4 stringWithFormat:@"<%@ %p \"%@\" dataSource=%@>", v5, self, self->_name, self->_dataSource];
  }
  else {
  uint64_t v6 = [v4 stringWithFormat:@"<%@ %p dataSource=%@>", v5, self, self->_dataSource, v8];
  }

  return (NSString *)v6;
}

- (void)dealloc
{
  MEMORY[0x19971B730](self->_stateHandle, a2);
  [(MPAVRoutingController *)self _unregisterNotifications];
  v3.receiver = self;
  v3.super_class = (Class)MPAVRoutingController;
  [(MPAVRoutingController *)&v3 dealloc];
}

- (MPAVRoutingController)init
{
  objc_super v3 = objc_alloc_init(MPAVOutputDeviceRoutingDataSource);
  uint64_t v4 = [(MPAVRoutingController *)self initWithDataSource:v3 name:0];

  return v4;
}

uint64_t __49__MPAVRoutingController_initWithDataSource_name___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v8 = WeakRetained;
    if (WeakRetained)
    {
      id v9 = [WeakRetained _fullStateDumpObject];
      uint64_t v6 = v5[2](v5, v9);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (int64_t)activeRouteType
{
  if (self->_presentedBundleID)
  {
    presentedBundleID = self->_presentedBundleID;
    return MEMORY[0x1F412DD90](presentedBundleID, a2);
  }
  else
  {
    objc_super v3 = objc_opt_class();
    return [v3 activeRouteType];
  }
}

void __68__MPAVRoutingController__getActiveRouteWithTimeout_type_completion___block_invoke_2()
{
}

void __68__MPAVRoutingController__getActiveRouteWithTimeout_type_completion___block_invoke_3()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"MPAVRoutingControllerActiveSystemRouteDidChangeNotification" object:0];
}

+ (id)_symbolNameForProductIdentifier:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4F77028];
  id v4 = a3;
  uint64_t v5 = [v3 sharedProvider];
  uint64_t v6 = [v5 symbolNameForProductIdentifier:v4];

  return v6;
}

+ (id)_symbolNameForModelID:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4F77028];
  id v4 = a3;
  uint64_t v5 = [v3 sharedProvider];
  uint64_t v6 = [v5 symbolNameForModelID:v4];

  return v6;
}

+ (id)_currentDeviceRoutingSymbolName
{
  return (id)[MEMORY[0x1E4F77028] currentDeviceRoutingSymbolName];
}

+ (BOOL)bundleIdRepresentsLongFormVideoContent:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4F74F68];
  id v4 = a3;
  uint64_t v5 = [v3 sharedAVSystemController];
  char v6 = [v5 hasRouteSharingPolicyLongFormVideo:v4];

  return v6;
}

+ (id)systemRouteWithContextUID:(id)a3
{
  if (a3)
  {
    objc_super v3 = [[MPAVEndpointRoute alloc] initWithEndpoint:MRAVEndpointGetLocalEndpoint()];
  }
  else
  {
    objc_super v3 = [a1 systemRoute];
  }

  return v3;
}

+ (void)setActiveRoute:(id)a3 reason:(id)a4 completion:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  id v11 = v10;
  if (v10 && (int v12 = [v10 isDeviceRoute], v11, !v12))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [v11 endpointWrapper];
      [v14 unwrappedValue];
      id v17 = v9;
      MRAVEndpointUpdateActiveSystemEndpointWithReason();

      long long v13 = v17;
    }
    else
    {
      if (!v9) {
        goto LABEL_5;
      }
      long long v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28228];
      v20[0] = @"Active route must be of type MPAVEndpointRoute.";
      long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      long long v16 = [v15 errorWithDomain:@"MPAVRoutingControllerErrorDomain" code:4 userInfo:v13];
      (*((void (**)(id, void *))v9 + 2))(v9, v16);
    }
  }
  else
  {
    id v18 = v9;
    MRAVEndpointUpdateActiveSystemEndpointWithReason();
    long long v13 = v18;
  }

LABEL_5:
}

uint64_t __58__MPAVRoutingController_setActiveRoute_reason_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __58__MPAVRoutingController_setActiveRoute_reason_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)setActiveRoute:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [(id)objc_opt_class() setActiveRoute:v6 reason:0 completion:v5];
}

+ (void)getProactiveRouteWithTimeout:(double)a3 completion:(id)a4
{
}

+ (void)getProactiveRouteWithCompletion:(id)a3
{
}

+ (id)_currentDeviceRoutingSymbolImage
{
  uint64_t v2 = [a1 _currentDeviceRoutingSymbolName];
  objc_super v3 = [MEMORY[0x1E4FB1818] _systemImageNamed:v2];

  return v3;
}

+ (id)_symbolNameForRoutes:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "msv_flatMap:", &__block_literal_global_43);
  id v4 = (void *)v3;
  id v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  id v7 = [MEMORY[0x1E4F76FD0] symbolNameForOutputDevices:v6];

  return v7;
}

id __46__MPAVRoutingController__symbolNameForRoutes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 endpointObject];
    uint64_t v4 = [v3 resolvedOutputDevices];
    id v5 = (void *)v4;
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
    if (v4) {
      id v6 = (void *)v4;
    }
    id v7 = v6;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = (id)MEMORY[0x1E4F1CBF0];
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_11;
    }
    uint64_t v9 = [v2 outputDevices];
    uint64_t v3 = (void *)v9;
    if (v9) {
      id v10 = (void *)v9;
    }
    else {
      id v10 = v7;
    }
    id v7 = v10;
  }

LABEL_11:

  return v7;
}

+ (id)_symbolNameForRoute:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v9 = a3;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:&v9 count:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = objc_msgSend(a1, "_symbolNameForRoutes:", v6, v9, v10);

  return v7;
}

+ (id)_symbolImageForRoute:(id)a3
{
  uint64_t v4 = [a1 _symbolNameForRoute:a3];
  id v5 = [a1 _symbolImageForIdentifier:v4];

  return v5;
}

+ (id)_symbolImageForRoutes:(id)a3
{
  uint64_t v4 = [a1 _symbolNameForRoutes:a3];
  id v5 = [a1 _symbolImageForIdentifier:v4];

  return v5;
}

+ (id)_symbolImageForIdentifier:(id)a3
{
  return (id)[MEMORY[0x1E4FB1818] _systemImageNamed:a3];
}

@end