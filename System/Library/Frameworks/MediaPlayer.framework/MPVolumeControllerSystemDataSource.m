@interface MPVolumeControllerSystemDataSource
- (BOOL)_supportsNativeMute;
- (BOOL)applicationShouldOverrideHardwareVolumeBehavior;
- (BOOL)forceAVSystemController;
- (BOOL)isMuted;
- (BOOL)isVolumeControlAvailable;
- (BOOL)supportNativeMute;
- (BOOL)volumeWarningEnabled;
- (MPVolumeControllerDataSourceDelegate)delegate;
- (MPVolumeControllerSystemDataSource)init;
- (MPVolumeControllerSystemDataSource)initWithVolumeAudioCategories:(id)a3;
- (MPVolumeControllerSystemDataSource)initWithVolumeAudioCategory:(id)a3;
- (NSSet)volumeAudioCategories;
- (NSString)description;
- (NSString)volumeAudioCategory;
- (NSString)volumeControlLabel;
- (float)EUVolumeLimit;
- (float)_effectiveVolume;
- (id)_categoryForActiveCategory:(id)a3 currentCategory:(id)a4 categories:(id)a5;
- (id)_mediaPlaybackVolumeAudioCategory;
- (id)_reloadQueue;
- (id)initCommon;
- (int64_t)volumeWarningState;
- (unsigned)volumeControlCapabilities;
- (void)_mediaServerDiedNotification:(id)a3;
- (void)_notifyVolumeDidChage:(float)a3 silenceVolumeHUD:(BOOL)a4;
- (void)_reload;
- (void)_routeDidChangeNotification:(id)a3;
- (void)_setVolumeAudioCategory:(id)a3;
- (void)_setup;
- (void)_systemVolumeDidChange:(id)a3;
- (void)_tearDown;
- (void)adjustVolumeValue:(float)a3;
- (void)dealloc;
- (void)endDecreasingRelativeVolume;
- (void)endIncreasingRelativeVolume;
- (void)getVolumeValueWithCompletion:(id)a3;
- (void)reload;
- (void)setDelegate:(id)a3;
- (void)setForceAVSystemController:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setSupportNativeMute:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)setVolumeAudioCategory:(id)a3;
- (void)updateVolume:(float)a3 silenceVolumeHUD:(BOOL)a4;
- (void)updateVolumeControlCapabilities:(unsigned int)a3;
- (void)updateVolumeMuted:(BOOL)a3;
@end

@implementation MPVolumeControllerSystemDataSource

- (void)_systemVolumeDidChange:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F74AF0]];
  [v6 floatValue];
  float v8 = v7;

  v9 = [v4 userInfo];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F74AE0]];

  v11 = [v4 userInfo];
  v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F74AD8]];
  char v13 = [v12 BOOLValue];

  v14 = [v4 userInfo];

  v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F74AC0]];

  char v16 = [v10 isEqualToString:@"RouteChange"];
  int v17 = [v10 isEqualToString:@"CategoryChange"];
  v18 = (void *)[(NSString *)self->_volumeAudioCategory copy];
  if ((v16 & 1) != 0 || v17)
  {
    v19 = [(MPVolumeControllerSystemDataSource *)self _categoryForActiveCategory:v15 currentCategory:self->_volumeAudioCategory categories:self->_volumeAudioCategories];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__MPVolumeControllerSystemDataSource__systemVolumeDidChange___block_invoke;
    block[3] = &unk_1E57F9F98;
    block[4] = self;
    id v30 = v19;
    id v20 = v19;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if ([v15 isEqualToString:v18])
  {
    float v21 = 1.0;
    if (v8 <= 1.0) {
      float v21 = v8;
    }
    v23[1] = 3221225472;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[2] = __61__MPVolumeControllerSystemDataSource__systemVolumeDidChange___block_invoke_2;
    v23[3] = &unk_1E57F9AA8;
    float v22 = fmaxf(v21, 0.0);
    v23[4] = self;
    float v26 = v8;
    id v24 = v15;
    id v25 = v10;
    char v28 = v13;
    float v27 = v22;
    dispatch_async(MEMORY[0x1E4F14428], v23);
  }
}

- (id)_categoryForActiveCategory:(id)a3 currentCategory:(id)a4 categories:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 containsObject:v8])
  {
    id v11 = v8;
  }
  else if ([v10 containsObject:@"Audio/Video"])
  {
    id v11 = [(MPVolumeControllerSystemDataSource *)self _mediaPlaybackVolumeAudioCategory];
  }
  else if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v10 anyObject];
  }
  v12 = v11;

  return v12;
}

uint64_t __61__MPVolumeControllerSystemDataSource__systemVolumeDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVolumeAudioCategory:*(void *)(a1 + 40)];
}

void __61__MPVolumeControllerSystemDataSource__systemVolumeDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) volumeControlCapabilities];
  v2 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription();
  v3 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    double v5 = *(float *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    int v9 = *(unsigned __int8 *)(a1 + 64);
    int v11 = 138544898;
    uint64_t v12 = v4;
    __int16 v13 = 2048;
    uint64_t v14 = v6;
    __int16 v15 = 2048;
    double v16 = v5;
    __int16 v17 = 2114;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    id v20 = v2;
    __int16 v21 = 2114;
    uint64_t v22 = v8;
    __int16 v23 = 1024;
    int v24 = v9;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> AVSystemController volume changed to: %f | category: %{public}@ | capabilities: %@ | reason: %{public}@ | silence: %{BOOL}u", (uint8_t *)&v11, 0x44u);
  }

  LODWORD(v10) = *(_DWORD *)(a1 + 60);
  [*(id *)(a1 + 32) updateVolume:*(unsigned __int8 *)(a1 + 64) silenceVolumeHUD:v10];
}

- (unsigned)volumeControlCapabilities
{
  return self->_volumeControlCapabilities;
}

- (void)updateVolume:(float)a3 silenceVolumeHUD:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!self->_volumeInitialized) {
    goto LABEL_5;
  }
  float v6 = self->_volume - a3;
  if (v6 < 0.0) {
    float v6 = -v6;
  }
  if (v6 > 0.00000011921)
  {
LABEL_5:
    self->_volumeInitialized = 1;
    self->_double volume = a3;
    [(MPVolumeControllerSystemDataSource *)self _effectiveVolume];
    -[MPVolumeControllerSystemDataSource _notifyVolumeDidChage:silenceVolumeHUD:](self, "_notifyVolumeDidChage:silenceVolumeHUD:", v4);
    uint64_t v7 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription();
    uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      double volume = self->_volume;
      volumeAudioCategory = self->_volumeAudioCategory;
      BOOL volumeControlAvailable = self->_volumeControlAvailable;
      BOOL muted = self->_muted;
      *(_DWORD *)buf = 138544898;
      uint64_t v27 = v9;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2048;
      double v31 = volume;
      __int16 v32 = 2114;
      v33 = volumeAudioCategory;
      __int16 v34 = 1024;
      BOOL v35 = volumeControlAvailable;
      __int16 v36 = 2112;
      v37 = v7;
      __int16 v38 = 1024;
      BOOL v39 = muted;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> AVSystemController update volume to: %f | category %{public}@ | available: %{BOOL}u | capabilities: %@ | muted: %{BOOL}u", buf, 0x40u);
    }
  }
  pendingVolumeCompletions = self->_pendingVolumeCompletions;
  if (pendingVolumeCompletions)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    __int16 v15 = pendingVolumeCompletions;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          (*(void (**)(float))(*(void *)(*((void *)&v21 + 1) + 8 * i) + 16))(self->_volume);
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v17);
    }

    id v20 = self->_pendingVolumeCompletions;
    self->_pendingVolumeCompletions = 0;
  }
}

- (void)setVolumeAudioCategory:(id)a3
{
  BOOL v4 = (NSString *)a3;
  if (!v4)
  {
    BOOL v4 = [(MPVolumeControllerSystemDataSource *)self _mediaPlaybackVolumeAudioCategory];
  }
  int v11 = v4;
  volumeAudioCategories = self->_volumeAudioCategories;
  if (!volumeAudioCategories
    || (v6 = [(NSSet *)volumeAudioCategories containsObject:v11], uint64_t v7 = v11, v6))
  {
    uint64_t v8 = self->_volumeAudioCategory;
    if (v8 == v11)
    {
    }
    else
    {
      char v9 = [(NSString *)v8 isEqual:v11];

      uint64_t v7 = v11;
      if (v9) {
        goto LABEL_10;
      }
      [(MPVolumeControllerSystemDataSource *)self _setVolumeAudioCategory:v11];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained volumeControllerDataSource:self didChangeVolumeAudioCategory:v11];

      [(MPVolumeControllerSystemDataSource *)self reload];
    }
    uint64_t v7 = v11;
  }
LABEL_10:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeAudioCategories, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_volumeAudioCategory, 0);
  objc_storeStrong((id *)&self->_avSystemController, 0);
  objc_storeStrong((id *)&self->_avscQueue, 0);

  objc_storeStrong((id *)&self->_pendingVolumeCompletions, 0);
}

- (void)setSupportNativeMute:(BOOL)a3
{
  self->_supportNativeMute = a3;
}

- (BOOL)supportNativeMute
{
  return self->_supportNativeMute;
}

- (void)setForceAVSystemController:(BOOL)a3
{
  self->_forceAVSystemController = a3;
}

- (BOOL)forceAVSystemController
{
  return self->_forceAVSystemController;
}

- (NSSet)volumeAudioCategories
{
  return self->_volumeAudioCategories;
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

- (NSString)volumeAudioCategory
{
  return self->_volumeAudioCategory;
}

- (float)_effectiveVolume
{
  if ([(MPVolumeControllerSystemDataSource *)self _supportsNativeMute]) {
    return self->_volume;
  }
  float result = 0.0;
  if (!self->_muted) {
    return self->_volume;
  }
  return result;
}

- (BOOL)_supportsNativeMute
{
  return (_os_feature_enabled_impl() & 1) != 0 || self->_supportNativeMute;
}

- (void)_tearDown
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  *(_WORD *)&self->_volumeInitialized = 0;
  self->_volumeMutedInitialized = 0;
  [v4 removeObserver:self name:*MEMORY[0x1E4F74B68] object:0];
  [v4 removeObserver:self name:*MEMORY[0x1E4F74ED8] object:0];
  [v4 removeObserver:self name:*MEMORY[0x1E4F74BD8] object:0];
  [v4 removeObserver:self name:*MEMORY[0x1E4F74E30] object:0];
  v3 = +[MPAVRoutingController systemRoute];
  [v4 removeObserver:self name:@"MPAVRouteDidChangeNotification" object:v3];
}

- (void)_setup
{
  avscQueue = self->_avscQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MPVolumeControllerSystemDataSource__setup__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(avscQueue, block);
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__routeDidChangeNotification_ name:@"MPAVRouteDidChangeNotification" object:0];
}

void __44__MPVolumeControllerSystemDataSource__setup__block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  double v5 = (void *)MEMORY[0x1E4F74B68];
  BOOL v6 = (void *)MEMORY[0x1E4F74EA8];
  if (*MEMORY[0x1E4F74B68])
  {
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 40);
    v25[0] = *MEMORY[0x1E4F74B68];
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [v7 setAttribute:v8 forKey:*v6 error:0];

    char v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:*(void *)(a1 + 32) selector:sel__systemVolumeCapabilitiesDidChange_ name:*v5 object:*(void *)(*(void *)(a1 + 32) + 40)];
  }
  double v10 = (void *)MEMORY[0x1E4F74ED8];
  if (*MEMORY[0x1E4F74ED8])
  {
    int v11 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v24 = *MEMORY[0x1E4F74ED8];
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    [v11 setAttribute:v12 forKey:*v6 error:0];

    __int16 v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:*(void *)(a1 + 32) selector:sel__systemVolumeDidChange_ name:*v10 object:*(void *)(*(void *)(a1 + 32) + 40)];
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F74BD8];
  if (*MEMORY[0x1E4F74BD8])
  {
    __int16 v15 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v23 = *MEMORY[0x1E4F74BD8];
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [v15 setAttribute:v16 forKey:*v6 error:0];

    uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:*(void *)(a1 + 32) selector:sel__systemMuteDidChange_ name:*v14 object:*(void *)(*(void *)(a1 + 32) + 40)];
  }
  uint64_t v18 = (void *)MEMORY[0x1E4F74E30];
  if (*MEMORY[0x1E4F74E30])
  {
    __int16 v19 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v22 = *MEMORY[0x1E4F74E30];
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    [v19 setAttribute:v20 forKey:*v6 error:0];

    long long v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:*(void *)(a1 + 32) selector:sel__mediaServerDiedNotification_ name:*v18 object:0];
  }
}

- (NSString)volumeControlLabel
{
  uint64_t v2 = +[MPAVRoutingController systemRoute];
  if ([v2 isDeviceSpeakerRoute])
  {
    uint64_t v3 = &stru_1EE680640;
  }
  else
  {
    uint64_t v3 = [v2 routeName];
  }

  return (NSString *)v3;
}

- (void)_routeDidChangeNotification:(id)a3
{
  id v4 = [a3 object];
  double v5 = +[MPAVRoutingController systemRoute];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__MPVolumeControllerSystemDataSource__routeDidChangeNotification___block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __66__MPVolumeControllerSystemDataSource__routeDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 volumeControlLabel];
  [WeakRetained volumeControllerDataSource:v2 didChangeVolumeLabel:v3];
}

- (void)_mediaServerDiedNotification:(id)a3
{
  [(MPVolumeControllerSystemDataSource *)self _tearDown];
  [(MPVolumeControllerSystemDataSource *)self _setup];

  [(MPVolumeControllerSystemDataSource *)self reload];
}

- (void)endDecreasingRelativeVolume
{
  uint64_t v3 = [(MPVolumeControllerSystemDataSource *)self volumeAudioCategory];
  id v4 = [(MPVolumeControllerSystemDataSource *)self _mediaPlaybackVolumeAudioCategory];
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F76FB8] sharedLocalEndpoint];
    [v6 adjustVolume:5 queue:MEMORY[0x1E4F14428] completion:&__block_literal_global_34_55182];
  }
}

- (void)endIncreasingRelativeVolume
{
  uint64_t v3 = [(MPVolumeControllerSystemDataSource *)self volumeAudioCategory];
  id v4 = [(MPVolumeControllerSystemDataSource *)self _mediaPlaybackVolumeAudioCategory];
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F76FB8] sharedLocalEndpoint];
    [v6 adjustVolume:2 queue:MEMORY[0x1E4F14428] completion:&__block_literal_global_32];
  }
}

- (void)getVolumeValueWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  double v10 = v4;
  if (self->_volumeInitialized)
  {
    [(MPVolumeControllerSystemDataSource *)self volume];
    v10[2]();
  }
  else
  {
    pendingVolumeCompletions = self->_pendingVolumeCompletions;
    if (!pendingVolumeCompletions)
    {
      id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = self->_pendingVolumeCompletions;
      self->_pendingVolumeCompletions = v6;

      id v4 = v10;
      pendingVolumeCompletions = self->_pendingVolumeCompletions;
    }
    uint64_t v8 = (void *)[v4 copy];
    char v9 = (void *)MEMORY[0x19971E0F0]();
    [(NSMutableArray *)pendingVolumeCompletions addObject:v9];
  }
}

- (void)adjustVolumeValue:(float)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  float v4 = a3 * 100000.0;
  float v5 = floorf(v4) * 0.00001;
  id v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543874;
    uint64_t v9 = objc_opt_class();
    __int16 v10 = 2048;
    int v11 = self;
    __int16 v12 = 2048;
    double v13 = v5;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Adjusting local endpoint volume by: %f", (uint8_t *)&v8, 0x20u);
  }

  double v7 = fmax(fmin((float)(self->_volume + v5), 1.0), 0.0);
  *(float *)&double v7 = v7;
  [(MPVolumeControllerSystemDataSource *)self setVolume:v7];
}

- (void)_reload
{
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  int v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  int v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  uint64_t v3 = (void *)[(NSString *)self->_volumeAudioCategory copy];
  if (v3)
  {
    self->_reloading = 1;
    *(_WORD *)&self->_volumeInitialized = 0;
    self->_volumeMutedInitialized = 0;
    float v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    float v5 = [(MPVolumeControllerSystemDataSource *)self _reloadQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__MPVolumeControllerSystemDataSource__reload__block_invoke;
    block[3] = &unk_1E57F9A58;
    block[4] = self;
    int v11 = v14;
    __int16 v12 = v18;
    double v13 = v16;
    id v9 = v3;
    __int16 v10 = v4;
    id v6 = v4;
    dispatch_async(v5, block);

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__MPVolumeControllerSystemDataSource__reload__block_invoke_27;
    v7[3] = &unk_1E57F9A80;
    v7[4] = self;
    v7[5] = v16;
    v7[6] = v18;
    v7[7] = v14;
    dispatch_group_notify(v6, MEMORY[0x1E4F14428], v7);
  }
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
}

void __45__MPVolumeControllerSystemDataSource__reload__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MPVolumeControllerSystemDataSource__reload__block_invoke_2;
  block[3] = &unk_1E57F9A30;
  block[4] = v2;
  long long v8 = *(_OWORD *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 72);
  id v7 = v4;
  uint64_t v9 = v5;
  dispatch_sync(v3, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

unsigned char *__45__MPVolumeControllerSystemDataSource__reload__block_invoke_27(void *a1, double a2)
{
  float result = (unsigned char *)a1[4];
  if (!result[11])
  {
    [result updateVolumeControlCapabilities:*(unsigned int *)(*(void *)(a1[5] + 8) + 24)];
    float result = (unsigned char *)a1[4];
  }
  if (!result[10])
  {
    LODWORD(a2) = *(_DWORD *)(*(void *)(a1[6] + 8) + 24);
    [result updateVolume:0 silenceVolumeHUD:a2];
    float result = (unsigned char *)a1[4];
  }
  if (!result[12])
  {
    [result updateVolumeMuted:*(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24)];
    float result = (unsigned char *)a1[4];
  }
  result[8] = 0;
  uint64_t v4 = a1[4];
  if (*(unsigned char *)(v4 + 9))
  {
    *(unsigned char *)(v4 + 9) = 0;
    uint64_t v5 = (void *)a1[4];
    return (unsigned char *)[v5 reload];
  }
  return result;
}

void __45__MPVolumeControllerSystemDataSource__reload__block_invoke_2(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 40) attributeForKey:*MEMORY[0x1E4F74BD0]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 BOOLValue];

  [*(id *)(a1[4] + 40) getVolume:*(void *)(a1[7] + 8) + 24 forCategory:a1[5]];
  int v3 = [*(id *)(a1[4] + 40) currentRouteHasVolumeControl];
  if (v3) {
    *(_DWORD *)(*(void *)(a1[8] + 8) + 24) = 10;
  }
  uint64_t v4 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription();
  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    double v7 = *(float *)(*(void *)(a1[7] + 8) + 24);
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    int v10 = 138544642;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    double v15 = v7;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    __int16 v18 = 1024;
    int v19 = v3;
    __int16 v20 = 2112;
    long long v21 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> AVSystemController reloading volume: %f | category: %{public}@ | hasVolumeControl: %{BOOL}u | capabilities: %@", (uint8_t *)&v10, 0x3Au);
  }
}

- (void)reload
{
  if (self->_reloading) {
    self->_needsReloading = 1;
  }
  else {
    [(MPVolumeControllerSystemDataSource *)self _reload];
  }
}

- (id)_reloadQueue
{
  if (_reloadQueue___token != -1) {
    dispatch_once(&_reloadQueue___token, &__block_literal_global_55187);
  }
  uint64_t v2 = (void *)_reloadQueue__queue;

  return v2;
}

void __50__MPVolumeControllerSystemDataSource__reloadQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MediaPlayer.SystemVolumeDataSource.reloadQueue", v2);
  v1 = (void *)_reloadQueue__queue;
  _reloadQueue__queue = (uint64_t)v0;
}

- (id)_mediaPlaybackVolumeAudioCategory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MPVolumeControllerSystemDataSource__mediaPlaybackVolumeAudioCategory__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  if (_mediaPlaybackVolumeAudioCategory___token != -1) {
    dispatch_once(&_mediaPlaybackVolumeAudioCategory___token, block);
  }
  return (id)_mediaPlaybackVolumeAudioCategory___mediaPlaybackVolumeAudioCategory;
}

uint64_t __71__MPVolumeControllerSystemDataSource__mediaPlaybackVolumeAudioCategory__block_invoke()
{
  return msv_dispatch_sync_on_queue();
}

void __71__MPVolumeControllerSystemDataSource__mediaPlaybackVolumeAudioCategory__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 40) volumeCategoryForAudioCategory:@"MediaPlayback"];
  uint64_t v2 = (void *)_mediaPlaybackVolumeAudioCategory___mediaPlaybackVolumeAudioCategory;
  _mediaPlaybackVolumeAudioCategory___mediaPlaybackVolumeAudioCategory = v1;
}

- (void)updateVolumeMuted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!self->_volumeMutedInitialized || self->_muted != a3)
  {
    self->_volumeMutedInitialized = 1;
    self->_BOOL muted = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained volumeControllerDataSource:self didChangeMuted:v3];
    uint64_t v6 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription();
    double v7 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      double volume = self->_volume;
      volumeAudioCategory = self->_volumeAudioCategory;
      BOOL volumeControlAvailable = self->_volumeControlAvailable;
      BOOL muted = self->_muted;
      int v13 = 138544898;
      uint64_t v14 = v8;
      __int16 v15 = 2048;
      __int16 v16 = self;
      __int16 v17 = 2048;
      double v18 = volume;
      __int16 v19 = 2114;
      __int16 v20 = volumeAudioCategory;
      __int16 v21 = 1024;
      BOOL v22 = volumeControlAvailable;
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      __int16 v25 = 1024;
      BOOL v26 = muted;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> AVSystemController update mute to: %f | category %{public}@ | available: %{BOOL}u | capabilities: %@ | muted: %{BOOL}u", (uint8_t *)&v13, 0x40u);
    }
  }
}

- (void)updateVolumeControlCapabilities:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v6 = WeakRetained;
  if ((!self->_volumeControlCapabilitiesInitialized || ((v3 >> 1) & 1) != self->_volumeControlAvailable)
    && (self->_BOOL volumeControlAvailable = (v3 & 2) >> 1,
        [WeakRetained volumeControllerDataSource:self didChangeVolumeControlAvailability:(v3 & 2) != 0], !self->_volumeControlCapabilitiesInitialized)|| self->_volumeControlCapabilities != v3)
  {
    self->_volumeControlCapabilitiesInitialized = 1;
    self->_volumeControlCapabilities = v3;
    [v6 volumeControllerDataSource:self didChangeVolumeCapabilities:v3];
    double v7 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      double volume = self->_volume;
      volumeAudioCategory = self->_volumeAudioCategory;
      BOOL muted = self->_muted;
      int v12 = 138544898;
      uint64_t v13 = v8;
      __int16 v14 = 2048;
      __int16 v15 = self;
      __int16 v16 = 2048;
      double v17 = volume;
      __int16 v18 = 2114;
      __int16 v19 = volumeAudioCategory;
      __int16 v20 = 1024;
      unsigned int v21 = (v3 >> 1) & 1;
      __int16 v22 = 1024;
      int v23 = v3;
      __int16 v24 = 1024;
      BOOL v25 = muted;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> AVSystemController update volume capabilities to: %f | category %{public}@ | available: %{BOOL}u | capabilities: %u | muted: %{BOOL}u", (uint8_t *)&v12, 0x3Cu);
    }
  }
}

- (void)_notifyVolumeDidChage:(float)a3 silenceVolumeHUD:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v7 = a3;
    [WeakRetained volumeControllerDataSource:self didChangeVolume:v4 silenceVolumeHUD:v7];
  }
  else
  {
    *(float *)&double v7 = a3;
    [WeakRetained volumeControllerDataSource:self didChangeVolume:v7];
  }
}

- (void)setMuted:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_muted != a3)
  {
    BOOL v3 = a3;
    uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_opt_class();
      volumeAudioCategory = self->_volumeAudioCategory;
      *(_DWORD *)buf = 138544130;
      uint64_t v12 = v6;
      __int16 v13 = 2048;
      __int16 v14 = self;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      __int16 v17 = 2114;
      __int16 v18 = volumeAudioCategory;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> AVSystemController set mute to: %{BOOL}u | category %{public}@", buf, 0x26u);
    }

    [(MPVolumeControllerSystemDataSource *)self updateVolumeMuted:v3];
    if (![(MPVolumeControllerSystemDataSource *)self _supportsNativeMute])
    {
      [(MPVolumeControllerSystemDataSource *)self _effectiveVolume];
      -[MPVolumeControllerSystemDataSource _notifyVolumeDidChage:silenceVolumeHUD:](self, "_notifyVolumeDidChage:silenceVolumeHUD:", 0);
    }
    avscQueue = self->_avscQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__MPVolumeControllerSystemDataSource_setMuted___block_invoke;
    v9[3] = &unk_1E57F9E08;
    v9[4] = self;
    BOOL v10 = v3;
    dispatch_async(avscQueue, v9);
  }
}

void __47__MPVolumeControllerSystemDataSource_setMuted___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 40);
  id v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v1 setAttribute:v2 forKey:*MEMORY[0x1E4F74BD0] error:0];
}

- (void)setVolume:(float)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_volume != a3)
  {
    uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_opt_class();
      volumeAudioCategory = self->_volumeAudioCategory;
      *(_DWORD *)buf = 138544130;
      uint64_t v13 = v6;
      __int16 v14 = 2048;
      __int16 v15 = self;
      __int16 v16 = 2048;
      double v17 = a3;
      __int16 v18 = 2114;
      uint64_t v19 = volumeAudioCategory;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> AVSystemController set volume to: %f | category %{public}@", buf, 0x2Au);
    }

    *(float *)&double v8 = a3;
    [(MPVolumeControllerSystemDataSource *)self updateVolume:0 silenceVolumeHUD:v8];
    avscQueue = self->_avscQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__MPVolumeControllerSystemDataSource_setVolume___block_invoke;
    v10[3] = &unk_1E57F9C60;
    v10[4] = self;
    float v11 = a3;
    dispatch_async(avscQueue, v10);
  }
}

uint64_t __48__MPVolumeControllerSystemDataSource_setVolume___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 40) setVolumeTo:*(void *)(*(void *)(a1 + 32) + 64) forCategory:a2];
}

- (void)_setVolumeAudioCategory:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (NSString *)a3;
  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543874;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2048;
    BOOL v10 = self;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> changed volumeAudioCategory to: %{public}@", (uint8_t *)&v7, 0x20u);
  }

  volumeAudioCategory = self->_volumeAudioCategory;
  self->_volumeAudioCategory = v4;
}

- (BOOL)applicationShouldOverrideHardwareVolumeBehavior
{
  return 0;
}

- (NSString)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_volumeControlAvailable) {
    uint64_t v5 = @"available";
  }
  else {
    uint64_t v5 = @"not available";
  }
  return (NSString *)[v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];
}

- (void)dealloc
{
  [(MPVolumeControllerSystemDataSource *)self _tearDown];
  v3.receiver = self;
  v3.super_class = (Class)MPVolumeControllerSystemDataSource;
  [(MPVolumeControllerSystemDataSource *)&v3 dealloc];
}

- (MPVolumeControllerSystemDataSource)init
{
  return [(MPVolumeControllerSystemDataSource *)self initWithVolumeAudioCategory:0];
}

- (MPVolumeControllerSystemDataSource)initWithVolumeAudioCategories:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(MPVolumeControllerSystemDataSource *)self initCommon];
  if (v6)
  {
    if (!v5 || ![v5 count])
    {
      BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:v6 file:@"MPVolumeControllerSystemDataSource.m" lineNumber:97 description:@"Must provide at least one cateogry"];
    }
    int v7 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = objc_opt_class();
      __int16 v16 = 2048;
      double v17 = v6;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> init volumeAudioCategories: %{public}@", buf, 0x20u);
    }

    avscQueue = v6->_avscQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__MPVolumeControllerSystemDataSource_initWithVolumeAudioCategories___block_invoke;
    v11[3] = &unk_1E57F9F98;
    uint64_t v12 = v6;
    id v13 = v5;
    dispatch_async(avscQueue, v11);
  }
  return v6;
}

void __68__MPVolumeControllerSystemDataSource_initWithVolumeAudioCategories___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__MPVolumeControllerSystemDataSource_initWithVolumeAudioCategories___block_invoke_2;
  void v16[3] = &unk_1E57F9A08;
  objc_super v3 = *(void **)(a1 + 40);
  id v17 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "msv_compactMap:", v16);
  uint64_t v5 = [v2 initWithArray:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v5;

  uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(v10 + 88);
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v9;
    __int16 v20 = 2048;
    uint64_t v21 = v10;
    __int16 v22 = 2114;
    uint64_t v23 = v11;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> resolved volumeAudioCategories to: %{public}@", buf, 0x20u);
  }

  uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 40);
  id v15 = 0;
  [v12 getActiveCategoryVolume:0 andName:&v15];
  id v13 = v15;
  __int16 v14 = [*(id *)(a1 + 32) _categoryForActiveCategory:v13 currentCategory:0 categories:*(void *)(*(void *)(a1 + 32) + 88)];
  [*(id *)(a1 + 32) _setVolumeAudioCategory:v14];
  [*(id *)(a1 + 32) reload];
}

uint64_t __68__MPVolumeControllerSystemDataSource_initWithVolumeAudioCategories___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) volumeCategoryForAudioCategory:a2];
}

- (MPVolumeControllerSystemDataSource)initWithVolumeAudioCategory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MPVolumeControllerSystemDataSource *)self initCommon];
  uint64_t v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      id v4 = [(MPVolumeControllerSystemDataSource *)v5 _mediaPlaybackVolumeAudioCategory];
    }
    [(MPVolumeControllerSystemDataSource *)v6 _setVolumeAudioCategory:v4];
    [(MPVolumeControllerSystemDataSource *)v6 reload];
  }

  return v6;
}

- (id)initCommon
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)MPVolumeControllerSystemDataSource;
  id v2 = [(MPVolumeControllerSystemDataSource *)&v8 init];
  if (v2)
  {
    objc_super v3 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = v4;
      __int16 v11 = 2048;
      uint64_t v12 = v2;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> init", buf, 0x16u);
    }

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MediaPlayer.SystemVolumeDataSource.avscQueue", 0);
    avscQueue = v2->_avscQueue;
    v2->_avscQueue = (OS_dispatch_queue *)v5;

    v2->_supportNativeMute = MSVDeviceIsAppleTV() ^ 1;
    [(MPVolumeControllerSystemDataSource *)v2 _setup];
  }
  return v2;
}

@end