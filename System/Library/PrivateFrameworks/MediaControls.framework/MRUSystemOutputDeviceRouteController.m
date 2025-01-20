@interface MRUSystemOutputDeviceRouteController
+ (MRUSystemOutputDeviceRouteController)sharedController;
+ (id)outputContextDescription;
- (BOOL)isSplitRoute;
- (MPAVEndpointRoute)systemRoute;
- (MPAVOutputDeviceRoute)primaryOutputDeviceRoute;
- (MPAVOutputDeviceRoute)secondaryOutputDeviceRoute;
- (MPAVOutputDeviceRoute)systemOutputDeviceRoute;
- (MRUOutputDeviceAsset)primaryOutputDeviceAsset;
- (MRUOutputDeviceAsset)secondaryOutputDeviceAsset;
- (MRUOutputDeviceAsset)systemOutputDeviceAsset;
- (MRUOutputDeviceAsset)systemOutputDeviceAssetWithInCall;
- (MRUSystemOutputDeviceRouteController)init;
- (NSHashTable)observers;
- (void)addObserver:(id)a3;
- (void)callMonitorDidUpdateOnCall:(id)a3 isOnCall:(BOOL)a4;
- (void)removeObserver:(id)a3;
- (void)routeDidChangeNotification;
- (void)setObservers:(id)a3;
- (void)updateOutputDevices;
@end

@implementation MRUSystemOutputDeviceRouteController

- (BOOL)isSplitRoute
{
  return self->_isSplitRoute;
}

- (MPAVOutputDeviceRoute)primaryOutputDeviceRoute
{
  return self->_primaryOutputDeviceRoute;
}

+ (MRUSystemOutputDeviceRouteController)sharedController
{
  if (sharedController___once != -1) {
    dispatch_once(&sharedController___once, &__block_literal_global_1);
  }
  v2 = (void *)sharedController___sharedController;

  return (MRUSystemOutputDeviceRouteController *)v2;
}

void __56__MRUSystemOutputDeviceRouteController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(MRUSystemOutputDeviceRouteController);
  v1 = (void *)sharedController___sharedController;
  sharedController___sharedController = (uint64_t)v0;
}

- (MRUSystemOutputDeviceRouteController)init
{
  v10.receiver = self;
  v10.super_class = (Class)MRUSystemOutputDeviceRouteController;
  v2 = [(MRUSystemOutputDeviceRouteController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F31850] systemRoute];
    systemRoute = v2->_systemRoute;
    v2->_systemRoute = (MPAVEndpointRoute *)v5;

    v7 = +[MRUCallMonitor sharedMonitor];
    [v7 addObserver:v2];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel_routeDidChangeNotification name:*MEMORY[0x1E4F31240] object:v2->_systemRoute];

    [(MRUSystemOutputDeviceRouteController *)v2 updateOutputDevices];
  }
  return v2;
}

- (MRUOutputDeviceAsset)systemOutputDeviceAsset
{
  if ([(MPAVEndpointRoute *)self->_systemRoute isSplitRoute])
  {
    uint64_t v3 = +[MRUOutputDeviceAsset sharingAsset];
  }
  else
  {
    uint64_t v3 = [[MRUOutputDeviceAsset alloc] initWithOutputDeviceRoute:self->_systemOutputDeviceRoute];
  }

  return v3;
}

- (MRUOutputDeviceAsset)systemOutputDeviceAssetWithInCall
{
  uint64_t v3 = [(MPAVOutputDeviceRoute *)self->_systemOutputDeviceRoute outputDevice];
  int v4 = [v3 deviceType];

  uint64_t v5 = +[MRUCallMonitor sharedMonitor];
  int v6 = [v5 isOnCall];

  if (v6) {
    BOOL v7 = v4 == 4;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    +[MRUOutputDeviceAsset inCallAsset];
  }
  else {
  v8 = [(MRUSystemOutputDeviceRouteController *)self systemOutputDeviceAsset];
  }

  return (MRUOutputDeviceAsset *)v8;
}

- (MRUOutputDeviceAsset)primaryOutputDeviceAsset
{
  v2 = [[MRUOutputDeviceAsset alloc] initWithOutputDeviceRoute:self->_primaryOutputDeviceRoute];

  return v2;
}

- (MRUOutputDeviceAsset)secondaryOutputDeviceAsset
{
  v2 = [[MRUOutputDeviceAsset alloc] initWithOutputDeviceRoute:self->_secondaryOutputDeviceRoute];

  return v2;
}

+ (id)outputContextDescription
{
  MRAVOutputContextGetSharedAudioPresentationContext();
  v2 = (void *)MRAVOutputContextCopyOutputDevices();
  uint64_t v3 = [v2 firstObject];
  [v3 deviceType];
  int v4 = (void *)MRAVOutputDeviceTypeCopyDescription();

  return v4;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)routeDidChangeNotification
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MRUSystemOutputDeviceRouteController_routeDidChangeNotification__block_invoke;
  block[3] = &unk_1E5F0D7F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __66__MRUSystemOutputDeviceRouteController_routeDidChangeNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateOutputDevices];
}

- (void)callMonitorDidUpdateOnCall:(id)a3 isOnCall:(BOOL)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties:self];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)updateOutputDevices
{
  v53[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MPAVEndpointRoute *)self->_systemRoute endpointObject];
  int v4 = [v3 outputDevices];

  if (!v4) {
    goto LABEL_31;
  }
  if ([(MPAVEndpointRoute *)self->_systemRoute isSplitRoute]
    && [v4 count] == 2)
  {
    BOOL isSplitRoute = self->_isSplitRoute;
    if (!self->_isSplitRoute) {
      self->_BOOL isSplitRoute = 1;
    }
    uint64_t v5 = (MPAVOutputDeviceRoute *)[objc_alloc(MEMORY[0x1E4F31830]) initWithOutputDevices:v4];
    systemOutputDeviceRoute = self->_systemOutputDeviceRoute;
    self->_systemOutputDeviceRoute = v5;

    [(MPAVOutputDeviceRoute *)self->_primaryOutputDeviceRoute logicalLeaderOutputDevice];
    uint64_t v7 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
    uint64_t v8 = [v4 firstObject];
    uint64_t v9 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();

    id v10 = objc_alloc(MEMORY[0x1E4F31830]);
    long long v11 = [v4 firstObject];
    v53[0] = v11;
    long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
    long long v13 = (MPAVOutputDeviceRoute *)[v10 initWithOutputDevices:v12];
    primaryOutputDeviceRoute = self->_primaryOutputDeviceRoute;
    self->_primaryOutputDeviceRoute = v13;

    int v15 = [v9 isEqualToString:v7];
    [(MPAVOutputDeviceRoute *)self->_secondaryOutputDeviceRoute logicalLeaderOutputDevice];
    uint64_t v16 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
    v17 = [v4 lastObject];
    v18 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();

    id v19 = objc_alloc(MEMORY[0x1E4F31830]);
    v20 = [v4 lastObject];
    v52 = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
    v22 = (MPAVOutputDeviceRoute *)[v19 initWithOutputDevices:v21];
    secondaryOutputDeviceRoute = self->_secondaryOutputDeviceRoute;
    self->_secondaryOutputDeviceRoute = v22;

    LODWORD(v19) = [v18 isEqualToString:v16];
    if (v19 && isSplitRoute && v15) {
      goto LABEL_21;
    }
    goto LABEL_11;
  }
  self->_BOOL isSplitRoute = 0;
  v24 = [(MPAVOutputDeviceRoute *)self->_systemOutputDeviceRoute outputDevices];
  char v25 = [v24 isEqualToArray:v4];

  v26 = (MPAVOutputDeviceRoute *)[objc_alloc(MEMORY[0x1E4F31830]) initWithOutputDevices:v4];
  v27 = self->_systemOutputDeviceRoute;
  self->_systemOutputDeviceRoute = v26;

  objc_storeStrong((id *)&self->_primaryOutputDeviceRoute, self->_systemOutputDeviceRoute);
  v28 = self->_secondaryOutputDeviceRoute;
  self->_secondaryOutputDeviceRoute = 0;

  if ((v25 & 1) == 0)
  {
LABEL_11:
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v29 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v47 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v34 systemOutputDeviceRouteControllerDidUpdateOutputDevices:self];
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v31);
    }
  }
LABEL_21:
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v35 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v43 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          [v40 systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties:self];
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v37);
  }

LABEL_31:
}

- (MPAVEndpointRoute)systemRoute
{
  return self->_systemRoute;
}

- (MPAVOutputDeviceRoute)systemOutputDeviceRoute
{
  return self->_systemOutputDeviceRoute;
}

- (MPAVOutputDeviceRoute)secondaryOutputDeviceRoute
{
  return self->_secondaryOutputDeviceRoute;
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
  objc_storeStrong((id *)&self->_secondaryOutputDeviceRoute, 0);
  objc_storeStrong((id *)&self->_primaryOutputDeviceRoute, 0);
  objc_storeStrong((id *)&self->_systemOutputDeviceRoute, 0);

  objc_storeStrong((id *)&self->_systemRoute, 0);
}

@end