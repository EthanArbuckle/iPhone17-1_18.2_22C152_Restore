@interface MPAVTelevisionRoutingDataSource
- (BOOL)devicePresenceDetected;
- (MPAVTelevisionRoutingDataSource)init;
- (id)_discoveredTelevisions;
- (id)getRoutesForCategory:(id)a3;
- (void)_onQueue_controllerDidDiscoverTelevision:(void *)a3;
- (void)_onQueue_controllerDidRemoveTelevision:(void *)a3;
- (void)dealloc;
- (void)getPickedRouteHasVolumeControlWithCompletion:(id)a3;
- (void)setDiscoveryMode:(int64_t)a3;
@end

@implementation MPAVTelevisionRoutingDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_discoveredTelevisions, 0);
}

- (void)_onQueue_controllerDidRemoveTelevision:(void *)a3
{
  [(NSMutableArray *)self->_discoveredTelevisions removeObject:a3];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:self];
}

- (void)_onQueue_controllerDidDiscoverTelevision:(void *)a3
{
  [(NSMutableArray *)self->_discoveredTelevisions addObject:a3];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"MPAVRoutingDataSourceRoutesDidChangeNotification" object:self];
}

- (id)_discoveredTelevisions
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3504;
  v10 = __Block_byref_object_dispose__3505;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__MPAVTelevisionRoutingDataSource__discoveredTelevisions__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __57__MPAVTelevisionRoutingDataSource__discoveredTelevisions__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)getPickedRouteHasVolumeControlWithCompletion:(id)a3
{
}

- (id)getRoutesForCategory:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MPAVTelevisionRoutingDataSource *)self _discoveredTelevisions];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [MPAVTelevisionRoute alloc];
        v12 = -[MPAVTelevisionRoute initWithTelevision:](v11, "initWithTelevision:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)devicePresenceDetected
{
  uint64_t v2 = [(MPAVTelevisionRoutingDataSource *)self _discoveredTelevisions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)setDiscoveryMode:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)MPAVTelevisionRoutingDataSource;
  -[MPAVRoutingDataSource setDiscoveryMode:](&v10, sel_setDiscoveryMode_);
  int IsDiscoveringDevices = MRTelevisionControllerIsDiscoveringDevices();
  if (!a3 || (IsDiscoveringDevices & 1) != 0)
  {
    if (IsDiscoveringDevices)
    {
      uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        discoveryController = self->_discoveryController;
        *(_DWORD *)buf = 138543362;
        v12 = discoveryController;
        _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "[TelevisionRoutingDataSource] Ending discovery with controller: %{public}@", buf, 0xCu);
      }

      MRTelevisionControllerEndDiscovery();
    }
  }
  else
  {
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = self->_discoveryController;
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "[TelevisionRoutingDataSource] Beginning discovery using controller: %{public}@", buf, 0xCu);
    }

    MRTelevisionControllerBeginDiscovery();
  }
}

- (void)dealloc
{
  MRTelevisionControllerSetDiscoveryCallback();
  MRTelevisionControllerSetRemovalCallback();
  CFRelease(self->_discoveryController);
  v3.receiver = self;
  v3.super_class = (Class)MPAVTelevisionRoutingDataSource;
  [(MPAVRoutingDataSource *)&v3 dealloc];
}

- (MPAVTelevisionRoutingDataSource)init
{
  v11.receiver = self;
  v11.super_class = (Class)MPAVTelevisionRoutingDataSource;
  uint64_t v2 = [(MPAVRoutingDataSource *)&v11 init];
  if (v2)
  {
    v2->_discoveryController = (void *)MRTelevisionControllerCreate();
    objc_super v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    discoveredTelevisions = v2->_discoveredTelevisions;
    v2->_discoveredTelevisions = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MediaPlayer.MPAVTelevisionRoutingDataSource/serialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    objc_initWeak(&location, v2);
    v8[1] = (id)MEMORY[0x1E4F143A8];
    v8[2] = (id)3221225472;
    v8[3] = __39__MPAVTelevisionRoutingDataSource_init__block_invoke;
    v8[4] = &unk_1E57EE530;
    objc_copyWeak(&v9, &location);
    MRTelevisionControllerSetDiscoveryCallback();
    objc_copyWeak(v8, &location);
    MRTelevisionControllerSetRemovalCallback();
    objc_destroyWeak(v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __39__MPAVTelevisionRoutingDataSource_init__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_onQueue_controllerDidDiscoverTelevision:", a2);
}

void __39__MPAVTelevisionRoutingDataSource_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_onQueue_controllerDidRemoveTelevision:", a2);
}

@end