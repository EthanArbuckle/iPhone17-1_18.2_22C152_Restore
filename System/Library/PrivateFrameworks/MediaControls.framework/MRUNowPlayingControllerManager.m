@interface MRUNowPlayingControllerManager
+ (MRUNowPlayingControllerManager)sharedManager;
- (MRUArtworkBackdropDataSource)artworkBackdropDataSource;
- (MRUNowPlayingController)activeController;
- (MRUNowPlayingControllerManager)init;
- (MediaControlsEndpointsManager)endpointsManager;
- (NSArray)controllers;
- (NSDictionary)controllerMap;
- (NSHashTable)observers;
- (id)controllerForIdentifier:(id)a3;
- (void)addObserver:(id)a3;
- (void)endpointsManager:(id)a3 defersRoutesReplacement:(id)a4;
- (void)getOutputDeviceIsPlaying:(id)a3 completion:(id)a4;
- (void)notifyObserversDidChangeActiveController:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setActiveController:(id)a3;
- (void)setArtworkBackdropDataSource:(id)a3;
- (void)setControllerMap:(id)a3;
- (void)setControllers:(id)a3;
- (void)setEndpointsManager:(id)a3;
- (void)setObservers:(id)a3;
- (void)updateActiveController;
- (void)updateAutomaticResponseLoading;
- (void)updateDiscoveryMode;
- (void)updateNowPlayingControllers;
@end

@implementation MRUNowPlayingControllerManager

+ (MRUNowPlayingControllerManager)sharedManager
{
  if (sharedManager___once != -1) {
    dispatch_once(&sharedManager___once, &__block_literal_global_10);
  }
  v2 = (void *)sharedManager___sharedManager;

  return (MRUNowPlayingControllerManager *)v2;
}

void __47__MRUNowPlayingControllerManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(MRUNowPlayingControllerManager);
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;
}

- (MRUNowPlayingControllerManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)MRUNowPlayingControllerManager;
  v2 = [(MRUNowPlayingControllerManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionary];
    controllerMap = v2->_controllerMap;
    v2->_controllerMap = (NSDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    if (MRAVOutputContextGetSharedAudioPresentationContext())
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F31910]);
      [v7 setStyle:0];
      v8 = (void *)MRAVOutputContextCopyUniqueIdentifier();
      [v7 setRoutingContextUID:v8];

      [v7 setAllowsNowPlayingApplicationLaunch:1];
      v9 = [[MediaControlsEndpointsManager alloc] initWithConfiguration:v7];
      endpointsManager = v2->_endpointsManager;
      v2->_endpointsManager = v9;

      [(MediaControlsEndpointsManager *)v2->_endpointsManager setDelegate:v2];
    }
    [(MRUNowPlayingControllerManager *)v2 updateNowPlayingControllers];
    [(MRUNowPlayingControllerManager *)v2 updateActiveController];
  }
  return v2;
}

- (void)setActiveController:(id)a3
{
  v8 = (MRUNowPlayingController *)a3;
  if (self->_activeController != v8)
  {
    objc_storeStrong((id *)&self->_activeController, a3);
    uint64_t v5 = [(MRUNowPlayingController *)v8 endpointController];
    v6 = [v5 route];

    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F770C0]) initWithName:@"collectionView:didSelectItemAtIndexPath:" requestID:0 reason:@"User selected active system endpoint" userInitiated:1];
    [(MediaControlsEndpointsManager *)self->_endpointsManager setActiveSystemRoute:v6 requestDetails:v7];
    [(MRUNowPlayingControllerManager *)self notifyObserversDidChangeActiveController:v8];
  }
}

- (MRUArtworkBackdropDataSource)artworkBackdropDataSource
{
  artworkBackdropDataSource = self->_artworkBackdropDataSource;
  if (!artworkBackdropDataSource)
  {
    v4 = objc_alloc_init(MRUArtworkBackdropDataSource);
    uint64_t v5 = self->_artworkBackdropDataSource;
    self->_artworkBackdropDataSource = v4;

    artworkBackdropDataSource = self->_artworkBackdropDataSource;
  }

  return artworkBackdropDataSource;
}

- (void)updateDiscoveryMode
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) discoveryMode];
        if (v6 <= v9) {
          uint64_t v6 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  if (v6 >= 3) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = v6;
  }
  [(MediaControlsEndpointsManager *)self->_endpointsManager setDiscoveryMode:v10];
}

- (id)controllerForIdentifier:(id)a3
{
  return [(NSDictionary *)self->_controllerMap objectForKeyedSubscript:a3];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)updateAutomaticResponseLoading
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = (void *)[(NSArray *)self->_controllers copy];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) updateAutomaticResponseLoading];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)endpointsManager:(id)a3 defersRoutesReplacement:(id)a4
{
  id v5 = (id)(*((uint64_t (**)(id, SEL, id))a4 + 2))(a4, a2, a3);
  [(MRUNowPlayingControllerManager *)self updateNowPlayingControllers];

  [(MRUNowPlayingControllerManager *)self updateActiveController];
}

- (void)getOutputDeviceIsPlaying:(id)a3 completion:(id)a4
{
}

- (void)updateNowPlayingControllers
{
  v2 = self;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = [(MediaControlsEndpointsManager *)self->_endpointsManager routes];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  uint64_t v6 = (void *)[(NSDictionary *)v2->_controllerMap mutableCopy];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v7 = [(MediaControlsEndpointsManager *)v2->_endpointsManager routes];
  long long v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v42;
    *(void *)&long long v10 = 138412546;
    long long v35 = v10;
    do
    {
      uint64_t v13 = 0;
      uint64_t v36 = v11;
      do
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v41 + 1) + 8 * v13);
        v15 = objc_msgSend(v14, "routeUID", v35);
        if (v15)
        {
          uint64_t v16 = [v6 objectForKeyedSubscript:v15];
          if (!v16)
          {
            v17 = [(MediaControlsEndpointsManager *)v2->_endpointsManager endpointControllerForRoute:v14];
            uint64_t v18 = v12;
            v19 = v6;
            v20 = v5;
            v21 = v2;
            v22 = v8;
            v23 = [[MRUEndpointController alloc] initWithEndpointController:v17];
            uint64_t v16 = [[MRUNowPlayingController alloc] initWithEndpointController:v23];

            long long v8 = v22;
            v2 = v21;
            id v5 = v20;
            uint64_t v6 = v19;
            uint64_t v12 = v18;
            uint64_t v11 = v36;
          }
          [v5 addObject:v16];
          [v6 setObject:v16 forKeyedSubscript:v15];
        }
        else
        {
          MCLogCategoryDefault();
          uint64_t v16 = (MRUNowPlayingController *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = objc_opt_class();
            *(_DWORD *)buf = v35;
            uint64_t v47 = v24;
            __int16 v48 = 2112;
            v49 = v14;
            _os_log_impl(&dword_1AE7DF000, &v16->super, OS_LOG_TYPE_ERROR, "%@ ignoring endpoint route with no routeUID: %@", buf, 0x16u);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v11);
  }

  BOOL v25 = [(NSArray *)v2->_controllers isEqualToArray:v5];
  uint64_t v26 = [v5 copy];
  controllers = v2->_controllers;
  v2->_controllers = (NSArray *)v26;

  uint64_t v28 = [v6 copy];
  controllerMap = v2->_controllerMap;
  v2->_controllerMap = (NSDictionary *)v28;

  if (!v25)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v30 = (void *)[(NSHashTable *)v2->_observers copy];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v38 != v33) {
            objc_enumerationMutation(v30);
          }
          [*(id *)(*((void *)&v37 + 1) + 8 * i) nowPlayingControllerManager:v2 didChangeControllers:v5];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v32);
    }
  }
}

- (void)updateActiveController
{
  uint64_t v3 = [(MediaControlsEndpointsManager *)self->_endpointsManager activeSystemRoute];
  uint64_t v4 = [v3 routeUID];
  obj = [(MRUNowPlayingControllerManager *)self controllerForIdentifier:v4];

  if (self->_activeController != obj)
  {
    objc_storeStrong((id *)&self->_activeController, obj);
    [(MRUNowPlayingControllerManager *)self notifyObserversDidChangeActiveController:obj];
  }
}

- (void)notifyObserversDidChangeActiveController:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) nowPlayingControllerManager:self didChangeActiveController:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSArray)controllers
{
  return self->_controllers;
}

- (void)setControllers:(id)a3
{
}

- (MRUNowPlayingController)activeController
{
  return self->_activeController;
}

- (void)setArtworkBackdropDataSource:(id)a3
{
}

- (MediaControlsEndpointsManager)endpointsManager
{
  return self->_endpointsManager;
}

- (void)setEndpointsManager:(id)a3
{
}

- (NSDictionary)controllerMap
{
  return self->_controllerMap;
}

- (void)setControllerMap:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_controllerMap, 0);
  objc_storeStrong((id *)&self->_endpointsManager, 0);
  objc_storeStrong((id *)&self->_artworkBackdropDataSource, 0);
  objc_storeStrong((id *)&self->_activeController, 0);

  objc_storeStrong((id *)&self->_controllers, 0);
}

@end