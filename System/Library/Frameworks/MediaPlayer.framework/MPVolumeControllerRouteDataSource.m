@interface MPVolumeControllerRouteDataSource
- (BOOL)_supportsNativeMute;
- (BOOL)applicationShouldOverrideHardwareVolumeBehavior;
- (BOOL)isMuted;
- (BOOL)isVolumeControlAvailable;
- (BOOL)volumeWarningEnabled;
- (MPAVRoute)groupRoute;
- (MPAVRoute)outputDeviceRoute;
- (MPVolumeControllerDataSourceDelegate)delegate;
- (MPVolumeControllerRouteDataSource)initWithGroupRoute:(id)a3 outputDeviceRoute:(id)a4;
- (NSString)description;
- (NSString)volumeAudioCategory;
- (NSString)volumeControlLabel;
- (float)EUVolumeLimit;
- (float)volume;
- (int64_t)volumeWarningState;
- (unsigned)volumeControlCapabilities;
- (void)_initializeVolume;
- (void)_routeVolumeControlCapabilitiesDidChangeNotification:(id)a3;
- (void)_routeVolumeDidChangeNotification:(id)a3;
- (void)_routeVolumeMutedDidChangeNotification:(id)a3;
- (void)_routeWasAddedOrRemovedFromGroupRouteNotification:(id)a3;
- (void)_sendVolumeButtonEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4 down:(BOOL)a5;
- (void)_setPendingVolumeIfNeeded;
- (void)_updateMuted:(BOOL)a3;
- (void)_updateVolume:(float)a3;
- (void)_updateVolumeControlCapabilities:(unsigned int)a3;
- (void)adjustVolumeValue:(float)a3;
- (void)beginDecreasingRelativeVolume;
- (void)beginIncreasingRelativeVolume;
- (void)dealloc;
- (void)endDecreasingRelativeVolume;
- (void)endIncreasingRelativeVolume;
- (void)getVolumeValueWithCompletion:(id)a3;
- (void)initializeVolume;
- (void)reload;
- (void)setDelegate:(id)a3;
- (void)setGroupRoute:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setOutputDeviceRoute:(id)a3;
- (void)setVolume:(float)a3;
@end

@implementation MPVolumeControllerRouteDataSource

- (BOOL)applicationShouldOverrideHardwareVolumeBehavior
{
  return 1;
}

- (float)volume
{
  return self->_volume;
}

- (void)reload
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_volumeCapabilitiesInitialized) {
    [WeakRetained volumeControllerDataSource:self didChangeVolumeControlAvailability:self->_volumeControlAvailable];
  }
  if (self->_volumeInitialized)
  {
    *(float *)&double v3 = self->_volume;
    [WeakRetained volumeControllerDataSource:self didChangeVolume:v3];
  }
  if ([(MPVolumeControllerRouteDataSource *)self _supportsNativeMute] && self->_mutedInitialized) {
    [WeakRetained volumeControllerDataSource:self didChangeMuted:self->_muted];
  }
}

void __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_54(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      uint64_t v9 = a2;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "%@ initializeVolume - Error getting master volume: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

unsigned char *__54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[14]) {
    return (unsigned char *)objc_msgSend(result, "_updateVolume:");
  }
  return result;
}

- (void)_updateVolume:(float)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  self->_volumeInitialized = 1;
  self->_volume = a3;
  int v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    uint64_t v10 = self;
    __int16 v11 = 2048;
    double v12 = a3;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "%@ MPLogVolume volume: %lf", (uint8_t *)&v9, 0x16u);
  }

  if (!self->_hasVolumeInFlight)
  {
    *(float *)&double v7 = a3;
    [WeakRetained volumeControllerDataSource:self didChangeVolume:v7];
  }
  if (![(MPVolumeControllerRouteDataSource *)self _supportsNativeMute])
  {
    BOOL v8 = a3 == 0.0;
    if (self->_muted != v8)
    {
      self->_muted = v8;
      [WeakRetained volumeControllerDataSource:self didChangeMuted:a3 == 0.0];
    }
  }
}

- (MPVolumeControllerRouteDataSource)initWithGroupRoute:(id)a3 outputDeviceRoute:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MPVolumeControllerRouteDataSource;
  uint64_t v10 = [(MPVolumeControllerRouteDataSource *)&v19 init];
  if (!v10) {
    goto LABEL_10;
  }
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:v10 file:@"MPVolumeControllerRouteDataSource.m" lineNumber:57 description:@"Group route must be an endpoint route."];

    if (v9)
    {
LABEL_5:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2 object:v10 file:@"MPVolumeControllerRouteDataSource.m" lineNumber:58 description:@"Output device route must be an output device."];
      }
    }
  }
  else if (v9)
  {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v10->_groupRoute, a3);
  objc_storeStrong((id *)&v10->_outputDeviceRoute, a4);
  __int16 v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:v10 selector:sel__routeVolumeDidChangeNotification_ name:*MEMORY[0x1E4F76F00] object:0];

  double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 addObserver:v10 selector:sel__routeVolumeControlCapabilitiesDidChangeNotification_ name:*MEMORY[0x1E4F76EF8] object:0];

  if ([(MPVolumeControllerRouteDataSource *)v10 _supportsNativeMute])
  {
    uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v10 selector:sel__routeVolumeMutedDidChangeNotification_ name:*MEMORY[0x1E4F76F08] object:0];
  }
  v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 addObserver:v10 selector:sel__routeWasAddedOrRemovedFromGroupRouteNotification_ name:*MEMORY[0x1E4F76EE8] object:0];

  v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 addObserver:v10 selector:sel__routeWasAddedOrRemovedFromGroupRouteNotification_ name:*MEMORY[0x1E4F76EF0] object:0];

  [(MPVolumeControllerRouteDataSource *)v10 initializeVolume];
LABEL_10:

  return v10;
}

- (void)initializeVolume
{
  if (self->_reloading) {
    self->_needsReloading = 1;
  }
  else {
    [(MPVolumeControllerRouteDataSource *)self _initializeVolume];
  }
}

- (void)_initializeVolume
{
  *(_WORD *)&self->_volumeInitialized = 0;
  self->_mutedInitialized = ![(MPVolumeControllerRouteDataSource *)self _supportsNativeMute];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke;
  v54[3] = &unk_1E57F9B48;
  v54[4] = self;
  double v3 = (void *)MEMORY[0x19971E0F0](v54);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_2;
  v53[3] = &unk_1E57F9B70;
  v53[4] = self;
  v4 = (void *)MEMORY[0x19971E0F0](v53);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_3;
  v52[3] = &unk_1E57F9B98;
  v52[4] = self;
  uint64_t v5 = (void *)MEMORY[0x19971E0F0](v52);
  int v6 = self->_groupRoute;
  double v7 = self->_outputDeviceRoute;
  id v8 = dispatch_group_create();
  id v9 = [(MPAVRoute *)v6 endpointWrapper];
  uint64_t v10 = [v9 unwrappedValue];

  if (v7)
  {
    if (v10)
    {
      dispatch_group_enter(v8);
      id v11 = [(MPAVRoute *)v6 endpointWrapper];
      [v11 unwrappedValue];
      [(MPAVRoute *)v7 logicalLeaderOutputDevice];
      uint64_t v45 = MEMORY[0x1E4F143A8];
      uint64_t v46 = 3221225472;
      v47 = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_4;
      v48 = &unk_1E57F9BC0;
      id v51 = v4;
      v49 = self;
      v50 = v8;
      MRAVEndpointGetOutputDeviceVolumeControlCapabilities();
    }
    id v12 = [(MPAVRoute *)v6 endpointWrapper];
    uint64_t v13 = [v12 unwrappedValue];

    if (v13)
    {
      dispatch_group_enter(v8);
      id v14 = [(MPAVRoute *)v6 endpointWrapper];
      [v14 unwrappedValue];
      [(MPAVRoute *)v7 logicalLeaderOutputDevice];
      v42[1] = MEMORY[0x1E4F143A8];
      v42[2] = 3221225472;
      v42[3] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_49;
      v42[4] = &unk_1E57F9BE8;
      id v44 = v3;
      v42[5] = self;
      v43 = v8;
      MRAVEndpointGetOutputDeviceVolume();
    }
    if ([(MPVolumeControllerRouteDataSource *)self _supportsNativeMute])
    {
      v15 = [(MPAVRoute *)v6 endpointObject];

      if (v15)
      {
        v26 = v3;
        dispatch_group_enter(v8);
        v16 = [(MPAVRoute *)v6 endpointObject];
        v17 = [(MPAVRoute *)v7 routeUID];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_51;
        v40[3] = &unk_1E57F9C10;
        v18 = (id *)v42;
        objc_super v19 = v5;
        v42[0] = v5;
        v40[4] = self;
        v20 = (id *)&v41;
        v41 = v8;
        [v16 outputDeviceVolumeMuted:v17 queue:MEMORY[0x1E4F14428] completion:v40];

LABEL_16:
        uint64_t v5 = v19;
        double v3 = v26;
      }
    }
  }
  else
  {
    if (v10)
    {
      dispatch_group_enter(v8);
      id v21 = [(MPAVRoute *)v6 endpointWrapper];
      [v21 unwrappedValue];
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      v35 = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_53;
      v36 = &unk_1E57F9BC0;
      id v39 = v4;
      v37 = self;
      v38 = v8;
      MRAVEndpointGetVolumeControlCapabilities();
    }
    id v22 = [(MPAVRoute *)v6 endpointWrapper];
    uint64_t v23 = [v22 unwrappedValue];

    if (v23)
    {
      dispatch_group_enter(v8);
      id v24 = [(MPAVRoute *)v6 endpointWrapper];
      [v24 unwrappedValue];
      v30[1] = MEMORY[0x1E4F143A8];
      v30[2] = 3221225472;
      v30[3] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_54;
      v30[4] = &unk_1E57F9BE8;
      id v32 = v3;
      v30[5] = self;
      v31 = v8;
      MRAVEndpointGetVolume();
    }
    if ([(MPVolumeControllerRouteDataSource *)self _supportsNativeMute])
    {
      v25 = [(MPAVRoute *)v6 endpointObject];

      if (v25)
      {
        v26 = v3;
        dispatch_group_enter(v8);
        v16 = [(MPAVRoute *)v6 endpointObject];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_55;
        v28[3] = &unk_1E57F9C10;
        v18 = (id *)v30;
        objc_super v19 = v5;
        v30[0] = v5;
        v28[4] = self;
        v20 = (id *)&v29;
        v29 = v8;
        [v16 volumeMutedOnQueue:MEMORY[0x1E4F14428] completion:v28];
        goto LABEL_16;
      }
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_56;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_group_notify(v8, MEMORY[0x1E4F14428], block);
}

- (BOOL)_supportsNativeMute
{
  return _os_feature_enabled_impl();
}

uint64_t __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_56(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 17) = 0;
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 18))
  {
    *(unsigned char *)(v1 + 18) = 0;
    return [*(id *)(result + 32) reload];
  }
  return result;
}

void __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_53(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (a3)
  {
    uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2114;
      uint64_t v10 = a3;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "%@ initializeVolume - Error getting group volume control capabilities: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

unsigned char *__54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_2(uint64_t a1, uint64_t a2)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[15]) {
    return (unsigned char *)[result _updateVolumeControlCapabilities:a2];
  }
  return result;
}

- (void)_updateVolumeControlCapabilities:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v6 = WeakRetained;
  if ((!self->_volumeCapabilitiesInitialized || ((v3 >> 1) & 1) != self->_volumeControlAvailable)
    && (self->_volumeControlAvailable = (v3 & 2) >> 1,
        [WeakRetained volumeControllerDataSource:self didChangeVolumeControlAvailability:(v3 & 2) != 0], !self->_volumeCapabilitiesInitialized)|| self->_volumeControlCapabilities != v3)
  {
    self->_volumeCapabilitiesInitialized = 1;
    self->_volumeControlCapabilities = v3;
    int v7 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription();
      int v9 = 138412546;
      uint64_t v10 = self;
      __int16 v11 = 2114;
      id v12 = v8;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "%@ MPLogVolume capabilities: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    [v6 volumeControllerDataSource:self didChangeVolumeCapabilities:v3];
  }
}

- (NSString)description
{
  uint64_t v3 = NSString;
  outputDeviceRoute = self->_outputDeviceRoute;
  uint64_t v5 = [(MPAVRoute *)self->_groupRoute routeName];
  uint64_t v6 = (void *)v5;
  if (outputDeviceRoute)
  {
    int v7 = [(MPAVRoute *)self->_outputDeviceRoute routeName];
    uint64_t v8 = [v3 stringWithFormat:@"Endpoint: %@ OutputDevice: %@", v6, v7];
  }
  else
  {
    uint64_t v8 = [v3 stringWithFormat:@"Endpoint: %@", v5];
  }

  int v9 = NSString;
  uint64_t v10 = objc_opt_class();
  if (self->_volumeControlAvailable) {
    __int16 v11 = @"available";
  }
  else {
    __int16 v11 = @"not available";
  }
  id v12 = [v9 stringWithFormat:@"<%@: %p %@ volume control %@>", v10, self, v8, v11];

  return (NSString *)v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceRoute, 0);
  objc_storeStrong((id *)&self->_groupRoute, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setOutputDeviceRoute:(id)a3
{
}

- (MPAVRoute)outputDeviceRoute
{
  return self->_outputDeviceRoute;
}

- (void)setGroupRoute:(id)a3
{
}

- (MPAVRoute)groupRoute
{
  return self->_groupRoute;
}

- (int64_t)volumeWarningState
{
  return self->_volumeWarningState;
}

- (BOOL)volumeWarningEnabled
{
  return self->_volumeWarningEnabled;
}

- (float)EUVolumeLimit
{
  return self->_EUVolumeLimit;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (unsigned)volumeControlCapabilities
{
  return self->_volumeControlCapabilities;
}

- (BOOL)isVolumeControlAvailable
{
  return self->_volumeControlAvailable;
}

- (void)setDelegate:(id)a3
{
}

- (MPVolumeControllerDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPVolumeControllerDataSourceDelegate *)WeakRetained;
}

- (void)_routeWasAddedOrRemovedFromGroupRouteNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F77110]];

  int v7 = [v4 userInfo];

  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F77118]];

  int v9 = [(MPAVRoute *)self->_groupRoute endpointObject];
  uint64_t v10 = [(MPAVRoute *)self->_outputDeviceRoute logicalLeaderOutputDevice];
  __int16 v11 = [v9 uniqueIdentifier];
  int v12 = [v11 isEqualToString:v6];

  uint64_t v13 = [v10 uid];
  int v14 = [v13 isEqual:v8];

  if (v12) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__MPVolumeControllerRouteDataSource__routeWasAddedOrRemovedFromGroupRouteNotification___block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __87__MPVolumeControllerRouteDataSource__routeWasAddedOrRemovedFromGroupRouteNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) initializeVolume];
}

- (void)_routeVolumeMutedDidChangeNotification:(id)a3
{
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__MPVolumeControllerRouteDataSource__routeVolumeMutedDidChangeNotification___block_invoke;
  v19[3] = &unk_1E57F9B98;
  v19[4] = self;
  id v4 = a3;
  uint64_t v5 = (void (**)(void, void))MEMORY[0x19971E0F0](v19);
  uint64_t v6 = [v4 userInfo];
  int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F77110]];

  uint64_t v8 = [v4 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F77118]];

  uint64_t v10 = [v4 userInfo];

  __int16 v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F76F10]];
  uint64_t v12 = [v11 BOOLValue];

  uint64_t v13 = [(MPAVRoute *)self->_groupRoute routeUID];
  int v14 = [v13 isEqualToString:v7];

  BOOL v15 = [(MPAVRoute *)self->_outputDeviceRoute logicalLeaderOutputDevice];
  v16 = [v15 uid];
  int v17 = [v16 isEqual:v9];

  if ((uint64_t)self->_outputDeviceRoute | v9) {
    int v18 = v17;
  }
  else {
    int v18 = 1;
  }
  if (v18 == 1 && v14) {
    v5[2](v5, v12);
  }
}

void __76__MPVolumeControllerRouteDataSource__routeVolumeMutedDidChangeNotification___block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __76__MPVolumeControllerRouteDataSource__routeVolumeMutedDidChangeNotification___block_invoke_2;
  v2[3] = &unk_1E57F9E08;
  v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __76__MPVolumeControllerRouteDataSource__routeVolumeMutedDidChangeNotification___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMuted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_routeVolumeControlCapabilitiesDidChangeNotification:(id)a3
{
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__MPVolumeControllerRouteDataSource__routeVolumeControlCapabilitiesDidChangeNotification___block_invoke;
  v19[3] = &unk_1E57F9B70;
  v19[4] = self;
  id v4 = a3;
  uint64_t v5 = (void (**)(void, void))MEMORY[0x19971E0F0](v19);
  uint64_t v6 = [v4 userInfo];
  int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F77110]];

  uint64_t v8 = [v4 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F77118]];

  uint64_t v10 = [v4 userInfo];

  __int16 v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F77130]];
  uint64_t v12 = [v11 intValue];

  uint64_t v13 = [(MPAVRoute *)self->_groupRoute routeUID];
  int v14 = [v13 isEqualToString:v7];

  BOOL v15 = [(MPAVRoute *)self->_outputDeviceRoute logicalLeaderOutputDevice];
  v16 = [v15 uid];
  int v17 = [v16 isEqual:v9];

  if ((uint64_t)self->_outputDeviceRoute | v9) {
    int v18 = v17;
  }
  else {
    int v18 = 1;
  }
  if (v18 == 1 && v14) {
    v5[2](v5, v12);
  }
}

void __90__MPVolumeControllerRouteDataSource__routeVolumeControlCapabilitiesDidChangeNotification___block_invoke(uint64_t a1, int a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __90__MPVolumeControllerRouteDataSource__routeVolumeControlCapabilitiesDidChangeNotification___block_invoke_2;
  v2[3] = &unk_1E57F9C60;
  v2[4] = *(void *)(a1 + 32);
  int v3 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __90__MPVolumeControllerRouteDataSource__routeVolumeControlCapabilitiesDidChangeNotification___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVolumeControlCapabilities:*(unsigned int *)(a1 + 40)];
}

- (void)_routeVolumeDidChangeNotification:(id)a3
{
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__MPVolumeControllerRouteDataSource__routeVolumeDidChangeNotification___block_invoke;
  v20[3] = &unk_1E57F9B48;
  v20[4] = self;
  id v4 = a3;
  uint64_t v5 = (void (**)(void, float))MEMORY[0x19971E0F0](v20);
  uint64_t v6 = [v4 userInfo];
  int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F77138]];
  [v7 floatValue];
  float v9 = v8;

  uint64_t v10 = [v4 userInfo];
  __int16 v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F77110]];

  uint64_t v12 = [v4 userInfo];

  uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F77118]];

  int v14 = [(MPAVRoute *)self->_groupRoute routeUID];
  char v15 = [v14 isEqualToString:v11];

  v16 = [(MPAVRoute *)self->_outputDeviceRoute logicalLeaderOutputDevice];
  int v17 = [v16 uid];
  int v18 = [v17 isEqual:v13];

  if ((uint64_t)self->_outputDeviceRoute | v13) {
    char v19 = 0;
  }
  else {
    char v19 = v15;
  }
  if ((v19 & 1) != 0 || v18) {
    v5[2](v5, v9);
  }
}

void __71__MPVolumeControllerRouteDataSource__routeVolumeDidChangeNotification___block_invoke(uint64_t a1, float a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __71__MPVolumeControllerRouteDataSource__routeVolumeDidChangeNotification___block_invoke_2;
  v2[3] = &unk_1E57F9C60;
  v2[4] = *(void *)(a1 + 32);
  float v3 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __71__MPVolumeControllerRouteDataSource__routeVolumeDidChangeNotification___block_invoke_2(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(a1 + 32) _updateVolume:a2];
}

- (void)getVolumeValueWithCompletion:(id)a3
{
  id v4 = a3;
  groupRoute = self->_groupRoute;
  outputDeviceRoute = self->_outputDeviceRoute;
  int v7 = outputDeviceRoute;
  float v8 = groupRoute;
  id v9 = [(MPAVRoute *)v8 endpointWrapper];
  [v9 unwrappedValue];
  if (outputDeviceRoute)
  {
    [(MPAVRoute *)v7 logicalLeaderOutputDevice];
    uint64_t v10 = dispatch_get_global_queue(21, 0);
    v12[1] = MEMORY[0x1E4F143A8];
    v12[2] = 3221225472;
    v12[3] = __66__MPVolumeControllerRouteDataSource_getVolumeValueWithCompletion___block_invoke;
    v12[4] = &unk_1E57F9C38;
    v12[5] = self;
    __int16 v11 = &v13;
    id v13 = v4;
    MRAVEndpointGetOutputDeviceVolume();
  }
  else
  {
    uint64_t v10 = dispatch_get_global_queue(21, 0);
    __int16 v11 = (id *)v12;
    v12[0] = v4;
    MRAVEndpointGetVolume();
  }
}

uint64_t __66__MPVolumeControllerRouteDataSource_getVolumeValueWithCompletion___block_invoke(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = a2;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, "%@ Error getting output device volume: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  return (*(uint64_t (**)(float))(*(void *)(a1 + 40) + 16))(a3);
}

uint64_t __66__MPVolumeControllerRouteDataSource_getVolumeValueWithCompletion___block_invoke_58(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = a2;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, "%@ Error getting master volume: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  return (*(uint64_t (**)(float))(*(void *)(a1 + 40) + 16))(a3);
}

- (void)_updateMuted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!self->_mutedInitialized || self->_muted != v3)
  {
    self->_mutedInitialized = 1;
    self->_BOOL muted = v3;
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL muted = self->_muted;
      int v8 = 138412546;
      int v9 = self;
      __int16 v10 = 1024;
      BOOL v11 = muted;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "%@ MPLogVolume muted:%{BOOL}u", (uint8_t *)&v8, 0x12u);
    }

    [WeakRetained volumeControllerDataSource:self didChangeMuted:v3];
  }
}

unsigned char *__54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_3(uint64_t a1, uint64_t a2)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[16]) {
    return (unsigned char *)[result _updateMuted:a2];
  }
  return result;
}

void __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (a3)
  {
    uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2114;
      uint64_t v10 = a3;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "%@ initializeVolume - Error getting output device volume control capabilities: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_49(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (a2)
  {
    id v4 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      uint64_t v9 = a2;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "%@ initializeVolume - Error getting output device volume: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_51(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v4)
  {
    uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "%@ initializeVolume - Error getting output device mute: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_55(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v4)
  {
    uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "%@ initializeVolume - Error getting output device mute: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)adjustVolumeValue:(float)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  float v4 = a3 * 100000.0;
  float v5 = floorf(v4) * 0.00001;
  uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    __int16 v9 = self;
    __int16 v10 = 2048;
    double v11 = v5;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Adjusting endpoint volume by: %f", (uint8_t *)&v8, 0x16u);
  }

  double v7 = fmax(fmin((float)(self->_volume + v5), 1.0), 0.0);
  *(float *)&double v7 = v7;
  [(MPVolumeControllerRouteDataSource *)self setVolume:v7];
}

- (void)_sendVolumeButtonEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4 down:(BOOL)a5
{
  groupRoute = self->_groupRoute;
  if (groupRoute)
  {
    BOOL v6 = a5;
    uint64_t v7 = *(void *)&a4;
    [(MPAVRoute *)groupRoute endpoint];
    uint64_t ExternalDevice = MRAVEndpointGetExternalDevice();
    MEMORY[0x1F412E358](ExternalDevice, a3 | (unint64_t)(v7 << 32), v6);
  }
}

- (void)endIncreasingRelativeVolume
{
  unsigned int volumeControlCapabilities = self->_volumeControlCapabilities;
  if ((volumeControlCapabilities & 4) != 0)
  {
    groupRoute = self->_groupRoute;
    float v4 = self->_outputDeviceRoute;
    uint64_t v7 = groupRoute;
    float v5 = [(MPAVRoute *)v7 endpointObject];
    BOOL v6 = [(MPAVRoute *)v4 routeUID];

    [v5 adjustOutputDeviceVolume:2 outputDevice:v6 queue:MEMORY[0x1E4F14428] completion:&__block_literal_global_44_55402];
  }
  else if (volumeControlCapabilities)
  {
    [(MPVolumeControllerRouteDataSource *)self _sendVolumeButtonEventWithUsagePage:12 usage:233 down:0];
  }
}

- (void)beginIncreasingRelativeVolume
{
  if ((self->_volumeControlCapabilities & 5) == 1) {
    [(MPVolumeControllerRouteDataSource *)self _sendVolumeButtonEventWithUsagePage:12 usage:233 down:1];
  }
}

- (void)endDecreasingRelativeVolume
{
  unsigned int volumeControlCapabilities = self->_volumeControlCapabilities;
  if ((volumeControlCapabilities & 4) != 0)
  {
    groupRoute = self->_groupRoute;
    float v4 = self->_outputDeviceRoute;
    uint64_t v7 = groupRoute;
    float v5 = [(MPAVRoute *)v7 endpointObject];
    BOOL v6 = [(MPAVRoute *)v4 routeUID];

    [v5 adjustOutputDeviceVolume:5 outputDevice:v6 queue:MEMORY[0x1E4F14428] completion:&__block_literal_global_55404];
  }
  else if (volumeControlCapabilities)
  {
    [(MPVolumeControllerRouteDataSource *)self _sendVolumeButtonEventWithUsagePage:12 usage:234 down:0];
  }
}

- (void)beginDecreasingRelativeVolume
{
  if ((self->_volumeControlCapabilities & 5) == 1) {
    [(MPVolumeControllerRouteDataSource *)self _sendVolumeButtonEventWithUsagePage:12 usage:234 down:1];
  }
}

- (void)setMuted:(BOOL)a3
{
  if (self->_muted != a3)
  {
    BOOL v3 = a3;
    self->_BOOL muted = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained volumeControllerDataSource:self didChangeMuted:v3];

    if ([(MPVolumeControllerRouteDataSource *)self _supportsNativeMute])
    {
      groupRoute = self->_groupRoute;
      outputDeviceRoute = self->_outputDeviceRoute;
      int v8 = outputDeviceRoute;
      __int16 v9 = groupRoute;
      __int16 v10 = [(MPAVRoute *)v9 endpointObject];
      double v11 = v10;
      if (outputDeviceRoute)
      {
        uint64_t v12 = [(MPAVRoute *)self->_outputDeviceRoute routeUID];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __46__MPVolumeControllerRouteDataSource_setMuted___block_invoke;
        v15[3] = &unk_1E57F9B00;
        v15[4] = self;
        [v11 muteOutputDeviceVolume:v3 outputDevice:v12 queue:MEMORY[0x1E4F14428] completion:v15];
      }
      else
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __46__MPVolumeControllerRouteDataSource_setMuted___block_invoke_42;
        v14[3] = &unk_1E57F9B00;
        v14[4] = self;
        [v10 muteVolume:v3 queue:MEMORY[0x1E4F14428] completion:v14];
      }
    }
    else
    {
      double v13 = 0.0;
      if (!v3) {
        *(float *)&double v13 = self->_volume;
      }
      [(MPVolumeControllerRouteDataSource *)self setVolume:v13];
    }
  }
}

void __46__MPVolumeControllerRouteDataSource_setMuted___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    float v4 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "%@ Error setting output device mute: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void __46__MPVolumeControllerRouteDataSource_setMuted___block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    float v4 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "%@ Error setting mute: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_setPendingVolumeIfNeeded
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_hasPendingVolume && !self->_hasVolumeInFlight)
  {
    *(_WORD *)&self->_hasPendingVolume = 256;
    id v3 = self->_groupRoute;
    float v4 = self->_outputDeviceRoute;
    uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        [(MPAVRoute *)v4 logicalLeaderOutputDevice];
        uint64_t v7 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
        *(double *)&uint64_t v8 = self->_pendingVolume;
        id v9 = [(MPAVRoute *)v3 endpointWrapper];
        *(_DWORD *)buf = 138413058;
        int v14 = self;
        __int16 v15 = 2112;
        double v16 = *(double *)&v7;
        __int16 v17 = 2048;
        uint64_t v18 = v8;
        __int16 v19 = 2112;
        uint64_t v20 = [v9 unwrappedValue];
        _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%@ setOutputDeviceVolume: %@ to: %f for endpoint: %@", buf, 0x2Au);
      }
      id v10 = [(MPAVRoute *)v3 endpointWrapper];
      [v10 unwrappedValue];
      [(MPAVRoute *)v4 logicalLeaderOutputDevice];
      MRAVEndpointSetOutputDeviceVolume();
    }
    else
    {
      if (v6)
      {
        double pendingVolume = self->_pendingVolume;
        id v12 = [(MPAVRoute *)v3 endpointWrapper];
        *(_DWORD *)buf = 138412802;
        int v14 = self;
        __int16 v15 = 2048;
        double v16 = pendingVolume;
        __int16 v17 = 2112;
        uint64_t v18 = [v12 unwrappedValue];
        _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%@ setVolume to: %f endpoint: %@", buf, 0x20u);
      }
      id v10 = [(MPAVRoute *)v3 endpointWrapper];
      [v10 unwrappedValue];
      MRAVEndpointSetVolume();
    }
  }
}

void __62__MPVolumeControllerRouteDataSource__setPendingVolumeIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 13) = 0;
  [*(id *)(a1 + 32) _setPendingVolumeIfNeeded];
  if (a2)
  {
    float v4 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      uint64_t v9 = a2;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "%@ Error setting output device volume: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void __62__MPVolumeControllerRouteDataSource__setPendingVolumeIfNeeded__block_invoke_40(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 13) = 0;
  [*(id *)(a1 + 32) _setPendingVolumeIfNeeded];
  if (a2)
  {
    float v4 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      uint64_t v9 = a2;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "%@ Error setting group volume: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)setVolume:(float)a3
{
  if (self->_volume != a3)
  {
    self->_volume = a3;
    if (![(MPVolumeControllerRouteDataSource *)self _supportsNativeMute]
      && self->_volume > 0.0
      && self->_muted)
    {
      self->_BOOL muted = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained volumeControllerDataSource:self didChangeMuted:0];
    }
    self->_double pendingVolume = a3;
    self->_hasPendingVolume = 1;
    [(MPVolumeControllerRouteDataSource *)self _setPendingVolumeIfNeeded];
  }
}

- (NSString)volumeControlLabel
{
  id v3 = [(MPVolumeControllerRouteDataSource *)self outputDeviceRoute];

  if (v3) {
    [(MPVolumeControllerRouteDataSource *)self outputDeviceRoute];
  }
  else {
  float v4 = [(MPVolumeControllerRouteDataSource *)self groupRoute];
  }
  uint64_t v5 = [v4 routeName];

  return (NSString *)v5;
}

- (NSString)volumeAudioCategory
{
  return (NSString *)@"Audio/Video";
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F76F00] object:0];

  float v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F76EF8] object:0];

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F76F08] object:0];

  int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4F76EE8] object:0];

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x1E4F76EF0] object:0];

  v8.receiver = self;
  v8.super_class = (Class)MPVolumeControllerRouteDataSource;
  [(MPVolumeControllerRouteDataSource *)&v8 dealloc];
}

@end