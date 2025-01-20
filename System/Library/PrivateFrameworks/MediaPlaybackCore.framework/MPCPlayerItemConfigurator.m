@interface MPCPlayerItemConfigurator
- (BOOL)_setupQueueItemForEnhancedAudioHLSPlayback:(id)a3 playerItem:(id)a4 metadataWaitTime:(double *)a5 error:(id *)a6;
- (BOOL)_shouldReloadEntireQueue;
- (BOOL)configureQueueItem:(id)a3 playerItem:(id)a4 error:(id *)a5;
- (BOOL)updateCurrentAudioRouteWithPickedRouteIfNeeded:(id)a3;
- (MFPlaybackStackController)stackController;
- (MPAVRoutingController)routingController;
- (MPCAudioAssetTypeSelector)audioAssetTypeSelector;
- (MPCMediaFoundationTranslator)translator;
- (MPCModelGenericAVItem)currentItem;
- (MPCPlaybackEngine)playbackEngine;
- (MPCPlayerAudioRoute)currentAudioRoute;
- (MPCPlayerItemConfigurator)initWithPlaybackEngine:(id)a3 stackController:(id)a4 translator:(id)a5;
- (MPPlaybackEQSetting)eqSetting;
- (OS_dispatch_source)userDefaultsDebouncer;
- (id)_HLSMetadataForAsset:(id)a3 error:(id *)a4;
- (id)_audioFormatsDictionaryWithHLSMetadata:(id)a3;
- (id)_audioFormatsDictionaryWithHLSMetadataFromAsset:(id)a3 metadataWaitTime:(double *)a4 error:(id *)a5;
- (id)_modeObjectForPlayerItem:(id)a3;
- (id)queuedItems;
- (void)_emitAudioFormatSelection:(id)a3 item:(id)a4;
- (void)_highQualityMusicStreamingOnCellularDidChange:(id)a3;
- (void)_playbackUserDefaultsEQPresetDidChangeNotification:(id)a3;
- (void)_preferredResolutionDidChange:(id)a3;
- (void)_resetBufferedAudio;
- (void)_setupNotifications;
- (void)_setupPlayer;
- (void)_setupQueueItemForHLSPlayback:(id)a3 playerItem:(id)a4;
- (void)_setupQueueItemForLossyAudioPlayback:(id)a3 playerItem:(id)a4;
- (void)_setupRoutingController;
- (void)_soundCheckEnabledChangedNotification:(id)a3;
- (void)_updatePreferredAudioFormatIfRequiredForItem:(id)a3 route:(id)a4;
- (void)_updateQueueItemsAndPlayerForFormatChangeIfRequired;
- (void)dealloc;
- (void)engineDidChangeVocalAttenuationLevel:(id)a3;
- (void)engineDidChangeVocalAttenuationState:(id)a3;
- (void)processAudioQualityChanges;
- (void)routingController:(id)a3 pickedRoutesDidChange:(id)a4;
- (void)setEqSetting:(id)a3;
- (void)setUserDefaultsDebouncer:(id)a3;
- (void)setupDefaultsDebouncer;
- (void)tearDownDefaultsDebouncer;
@end

@implementation MPCPlayerItemConfigurator

- (void)routingController:(id)a3 pickedRoutesDidChange:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [(MPCPlayerItemConfigurator *)self playbackEngine];
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v6 engineID];
    int v11 = 138543874;
    v12 = v8;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - Route changed to %{public}@", (uint8_t *)&v11, 0x20u);
  }
  v9 = [v5 firstObject];
  BOOL v10 = [(MPCPlayerItemConfigurator *)self updateCurrentAudioRouteWithPickedRouteIfNeeded:v9];

  if (v10) {
    [(MPCPlayerItemConfigurator *)self _updateQueueItemsAndPlayerForFormatChangeIfRequired];
  }
}

- (id)queuedItems
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(MPCPlayerItemConfigurator *)self stackController];
  v4 = [v3 nextItems];

  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count") + 1);
  v6 = [(MPCPlayerItemConfigurator *)self currentItem];
  if (v6) {
    [v5 addObject:v6];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = -[MPCPlayerItemConfigurator _modeObjectForPlayerItem:](self, "_modeObjectForPlayerItem:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v12) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  __int16 v13 = (void *)[v5 copy];

  return v13;
}

- (void)_setupPlayer
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(MPCPlayerItemConfigurator *)self currentItem];
  v4 = [(MPCPlayerItemConfigurator *)self audioAssetTypeSelector];
  int v5 = [v4 spatialIsOff];

  v6 = [(MPCPlayerItemConfigurator *)self stackController];
  [v6 setSpatializationFormat:v5 ^ 1u];

  id v7 = [(MPCPlayerItemConfigurator *)self playbackEngine];
  uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 engineID];
    uint64_t v10 = @"Default device capability";
    int v11 = 138544130;
    __int16 v13 = 2048;
    v12 = v9;
    if (v5) {
      uint64_t v10 = @"Forced stereo";
    }
    v14 = self;
    __int16 v15 = 2114;
    long long v16 = v10;
    __int16 v17 = 2114;
    long long v18 = v3;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - AVPlayer setup: %{public}@ - currentItem: %{public}@", (uint8_t *)&v11, 0x2Au);
  }
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (MPCModelGenericAVItem)currentItem
{
  v3 = [(MPCPlayerItemConfigurator *)self stackController];
  v4 = [v3 currentItem];
  int v5 = [(MPCPlayerItemConfigurator *)self _modeObjectForPlayerItem:v4];

  return (MPCModelGenericAVItem *)v5;
}

- (MFPlaybackStackController)stackController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackController);

  return (MFPlaybackStackController *)WeakRetained;
}

- (id)_modeObjectForPlayerItem:(id)a3
{
  id v4 = a3;
  if ([v4 isAssetLoaded])
  {
    int v5 = [(MPCPlayerItemConfigurator *)self translator];
    v6 = [v5 MPAVItemForMFPlayerItem:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (MPCAudioAssetTypeSelector)audioAssetTypeSelector
{
  return self->_audioAssetTypeSelector;
}

- (void)_updateQueueItemsAndPlayerForFormatChangeIfRequired
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(MPCPlayerItemConfigurator *)self currentAudioRoute];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(MPCPlayerItemConfigurator *)self queuedItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MPCPlayerItemConfigurator *)self _updatePreferredAudioFormatIfRequiredForItem:*(void *)(*((void *)&v9 + 1) + 8 * v8++) route:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(MPCPlayerItemConfigurator *)self _setupPlayer];
}

- (MPCPlayerAudioRoute)currentAudioRoute
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_currentAudioRoute)
  {
    v3 = [MPCPlayerAudioRoute alloc];
    id v4 = [(MPAVRoutingController *)v2->_routingController pickedRoutes];
    uint64_t v5 = [v4 firstObject];
    uint64_t v6 = [(MPCPlayerItemConfigurator *)v2 audioAssetTypeSelector];
    uint64_t v7 = -[MPCPlayerAudioRoute initWithRoute:spatialIsAlwaysOn:](v3, "initWithRoute:spatialIsAlwaysOn:", v5, [v6 spatialIsAlwaysOn]);
    currentAudioRoute = v2->_currentAudioRoute;
    v2->_currentAudioRoute = (MPCPlayerAudioRoute *)v7;
  }
  objc_sync_exit(v2);

  long long v9 = v2->_currentAudioRoute;

  return v9;
}

- (MPCPlayerItemConfigurator)initWithPlaybackEngine:(id)a3 stackController:(id)a4 translator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MPCPlayerItemConfigurator;
  long long v11 = [(MPCPlayerItemConfigurator *)&v19 init];
  long long v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_playbackEngine, v8);
    [v8 addEngineObserver:v12];
    objc_storeWeak((id *)&v12->_stackController, v9);
    objc_storeWeak((id *)&v12->_translator, v10);
    __int16 v13 = [MEMORY[0x263F12178] standardUserDefaults];
    uint64_t v14 = [v13 musicEQSetting];
    eqSetting = v12->_eqSetting;
    v12->_eqSetting = (MPPlaybackEQSetting *)v14;

    long long v16 = [[MPCAudioAssetTypeSelector alloc] initWithPlaybackEngine:v8];
    audioAssetTypeSelector = v12->_audioAssetTypeSelector;
    v12->_audioAssetTypeSelector = v16;

    [(MPCPlayerItemConfigurator *)v12 _setupNotifications];
    [(MPCPlayerItemConfigurator *)v12 _setupRoutingController];
    [(MPCPlayerItemConfigurator *)v12 _setupPlayer];
  }

  return v12;
}

- (void)_setupRoutingController
{
  id v3 = objc_alloc(MEMORY[0x263F11D28]);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (MPAVRoutingController *)[v3 initWithName:v5];
  routingController = self->_routingController;
  self->_routingController = v6;

  [(MPAVRoutingController *)self->_routingController setFetchAvailableRoutesSynchronously:1];
  id v8 = self->_routingController;

  [(MPAVRoutingController *)v8 setDelegate:self];
}

- (void)_setupNotifications
{
  id v5 = [MEMORY[0x263F12178] standardUserDefaults];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__playbackUserDefaultsEQPresetDidChangeNotification_ name:*MEMORY[0x263F11C38] object:v5];
  uint64_t v4 = *MEMORY[0x263F11C40];
  [v3 addObserver:self selector:sel__preferredResolutionDidChange_ name:*MEMORY[0x263F11C40] object:v5];
  [v3 addObserver:self selector:sel__highQualityMusicStreamingOnCellularDidChange_ name:v4 object:v5];
  [v3 addObserver:self selector:sel__soundCheckEnabledChangedNotification_ name:*MEMORY[0x263F11C50] object:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsDebouncer, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_destroyWeak((id *)&self->_stackController);
  objc_destroyWeak((id *)&self->_translator);
  objc_storeStrong((id *)&self->_eqSetting, 0);
  objc_storeStrong((id *)&self->_audioAssetTypeSelector, 0);
  objc_storeStrong((id *)&self->_routingController, 0);

  objc_storeStrong((id *)&self->_currentAudioRoute, 0);
}

- (void)setUserDefaultsDebouncer:(id)a3
{
}

- (OS_dispatch_source)userDefaultsDebouncer
{
  return self->_userDefaultsDebouncer;
}

- (MPCMediaFoundationTranslator)translator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_translator);

  return (MPCMediaFoundationTranslator *)WeakRetained;
}

- (void)setEqSetting:(id)a3
{
}

- (MPPlaybackEQSetting)eqSetting
{
  return self->_eqSetting;
}

- (MPAVRoutingController)routingController
{
  return self->_routingController;
}

- (void)_resetBufferedAudio
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(MPCPlayerItemConfigurator *)self currentItem];
  if ([v3 isAssetLoaded])
  {
    uint64_t v4 = [v3 playerItem];
    id v5 = [(MPCPlayerItemConfigurator *)self playbackEngine];
    uint64_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v5 engineID];
      int v8 = 138543874;
      id v9 = v7;
      __int16 v10 = 2048;
      long long v11 = self;
      __int16 v12 = 2114;
      __int16 v13 = v4;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AP] - resetAudioBufferedAhead for: %{public}@", (uint8_t *)&v8, 0x20u);
    }
    [v4 resetAudioBufferedAhead];
  }
}

- (void)engineDidChangeVocalAttenuationState:(id)a3
{
  uint64_t v4 = [a3 vocalAttenuationController];
  if (v4 && (unint64_t)(v4[9] - 5) <= 2)
  {
    id v5 = v4;
    [(MPCPlayerItemConfigurator *)self _resetBufferedAudio];
    uint64_t v4 = v5;
  }
}

- (void)engineDidChangeVocalAttenuationLevel:(id)a3
{
  if ([a3 isVocalAttenuationEnabled])
  {
    [(MPCPlayerItemConfigurator *)self _resetBufferedAudio];
  }
}

- (void)_updatePreferredAudioFormatIfRequiredForItem:(id)a3 route:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v8 = [v6 preferredFormat];

    if (v8)
    {
      id v9 = [v6 preferredFormat];
      int v10 = [v6 isDownloadedAsset];
      long long v11 = [(MPCPlayerItemConfigurator *)self audioAssetTypeSelector];
      __int16 v12 = v11;
      if (v10)
      {
        uint64_t v13 = [v6 loadedAudioAssetType];
        uint64_t v14 = [v6 availableSortedFormats];
        __int16 v15 = [v12 audioFormatMatchingAudioAssetType:v13 formats:v14 route:v7];
      }
      else
      {
        __int16 v15 = [v11 preferredPlayerAudioFormatForItem:v6 route:v7];
      }

      [v6 setAudioRoute:v7];
      [(MPCPlayerItemConfigurator *)self _emitAudioFormatSelection:v15 item:v6];
      long long v16 = [v15 format];
      if ([v6 updatePreferredFormat:v16]
        && [v6 isAssetLoaded])
      {
        uint64_t v20 = [(MPCPlayerItemConfigurator *)self playbackEngine];
        v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = [v20 engineID];
          *(_DWORD *)buf = 138544642;
          v31 = v22;
          __int16 v32 = 2048;
          v33 = self;
          __int16 v34 = 2114;
          id v35 = v6;
          __int16 v36 = 1024;
          *(_DWORD *)v37 = [v6 isDownloadedAsset];
          *(_WORD *)&v37[4] = 2112;
          *(void *)&v37[6] = v9;
          __int16 v38 = 2112;
          v39 = v16;
          _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - Preferred audio format changed [configuring player item] - item:%{public}@ - downloaded:%{BOOL}u - audio format: %@ -> %@", buf, 0x3Au);
        }
        v23 = [(MPCPlayerItemConfigurator *)self audioAssetTypeSelector];
        objc_msgSend(v6, "configureAVPlayerItemWithAudioFormat:forceSpatial:", v16, objc_msgSend(v23, "spatialIsAlwaysOn"));

        v24 = [(MPCPlayerItemConfigurator *)self playbackEngine];
        v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          [v24 engineID];
          v26 = v29 = v24;
          v27 = [v6 playerItem];
          v28 = objc_msgSend(v27, "mpc_setupDescription");
          *(_DWORD *)buf = 138544130;
          v31 = v26;
          __int16 v32 = 2048;
          v33 = self;
          __int16 v34 = 2114;
          id v35 = v28;
          __int16 v36 = 2114;
          *(void *)v37 = v6;
          _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - AVPlayerItem setup: %{public}@ - item:%{public}@", buf, 0x2Au);

          v24 = v29;
        }
      }
      goto LABEL_18;
    }
    __int16 v15 = [(MPCPlayerItemConfigurator *)self playbackEngine];
    id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = [v15 engineID];
      *(_DWORD *)buf = 138543874;
      v31 = v16;
      __int16 v32 = 2048;
      v33 = self;
      __int16 v34 = 2114;
      id v35 = v6;
      __int16 v17 = "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - No configuration possible [no preferred format on item] -"
            " item: %{public}@";
      long long v18 = v9;
      uint32_t v19 = 32;
      goto LABEL_9;
    }
  }
  else
  {
    __int16 v15 = [(MPCPlayerItemConfigurator *)self playbackEngine];
    id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = [v15 engineID];
      *(_DWORD *)buf = 138543618;
      v31 = v16;
      __int16 v32 = 2048;
      v33 = self;
      __int16 v17 = "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - No configuration possible [no player item]";
      long long v18 = v9;
      uint32_t v19 = 22;
LABEL_9:
      _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_18:
    }
  }
}

- (BOOL)_shouldReloadEntireQueue
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = [(MPCPlayerItemConfigurator *)self queuedItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v8 isAssetLoaded])
        {
          if (([v8 isHLSAsset] & 1) == 0)
          {
            id v9 = [(MPCPlayerItemConfigurator *)self audioAssetTypeSelector];
            int v10 = [v9 preferredAudioAssetTypeForItem:v8];
            uint64_t v11 = [v10 type];

            if (v11 >= 3)
            {
              if ([v8 playerItemType]
                || ([v8 asset],
                    __int16 v12 = objc_claimAutoreleasedReturnValue(),
                    [v12 URL],
                    uint64_t v13 = objc_claimAutoreleasedReturnValue(),
                    int v14 = [v13 isFileURL],
                    v13,
                    v12,
                    !v14))
              {
                BOOL v15 = 1;
                goto LABEL_15;
              }
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_15:

  return v15;
}

- (BOOL)updateCurrentAudioRouteWithPickedRouteIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  currentAudioRoute = v5->_currentAudioRoute;
  if (!currentAudioRoute) {
    goto LABEL_5;
  }
  id v7 = [(MPCPlayerAudioRoute *)currentAudioRoute pickedRoute];
  if (v7 == v4)
  {
    BOOL v10 = 0;
    __int16 v12 = v4;
    goto LABEL_7;
  }
  int v8 = [(MPCPlayerAudioRoute *)v5->_currentAudioRoute pickedRoute];
  char v9 = [v4 isEqual:v8];

  if ((v9 & 1) == 0)
  {
LABEL_5:
    uint64_t v11 = [MPCPlayerAudioRoute alloc];
    __int16 v12 = [(MPCPlayerItemConfigurator *)v5 audioAssetTypeSelector];
    uint64_t v13 = -[MPCPlayerAudioRoute initWithRoute:spatialIsAlwaysOn:](v11, "initWithRoute:spatialIsAlwaysOn:", v4, [v12 spatialIsAlwaysOn]);
    int v14 = v5->_currentAudioRoute;
    v5->_currentAudioRoute = (MPCPlayerAudioRoute *)v13;

    BOOL v10 = 1;
LABEL_7:

    goto LABEL_8;
  }
  BOOL v10 = 0;
LABEL_8:
  objc_sync_exit(v5);

  return v10;
}

- (id)_audioFormatsDictionaryWithHLSMetadata:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = NSDictionary;
    uint64_t v5 = [a3 value];
    id v19 = 0;
    uint64_t v6 = objc_msgSend(v4, "msv_dictionaryWithContentsOfBase64EncodedJSONString:error:", v5, &v19);
    id v7 = v19;

    if (v7)
    {
      int v8 = [(MPCPlayerItemConfigurator *)self playbackEngine];
      char v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        BOOL v10 = [v8 engineID];
        *(_DWORD *)buf = 138543874;
        v21 = v10;
        __int16 v22 = 2048;
        v23 = self;
        __int16 v24 = 2114;
        id v25 = v7;
        _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - Error decoding HLS metadata [Clearing audioFormatsDictionary] - Error:%{public}@", buf, 0x20u);
      }
      id v11 = 0;
    }
    else
    {
      __int16 v12 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      long long v16 = __68__MPCPlayerItemConfigurator__audioFormatsDictionaryWithHLSMetadata___block_invoke;
      long long v17 = &unk_2643C1FB0;
      long long v18 = v12;
      int v8 = v12;
      [v6 enumerateKeysAndObjectsUsingBlock:&v14];
      id v11 = [v8 copy];
      char v9 = v18;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __68__MPCPlayerItemConfigurator__audioFormatsDictionaryWithHLSMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[MPCPlayerAudioFormat alloc] initWithJSONDictionaryRepresentation:v5 stableVariantID:v6];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)_HLSMetadataForAsset:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v15 = 0;
  id v6 = objc_msgSend(a3, "mpc_synchronousHLSSessionDataWithTimeout:error:", 5, &v15);
  id v7 = v15;
  if (v7
    || ([v6 value],
        int v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = _NSIsNSString(),
        v8,
        (v9 & 1) == 0))
  {
    id v11 = [(MPCPlayerItemConfigurator *)self playbackEngine];
    __int16 v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v11 engineID];
      *(_DWORD *)buf = 138543874;
      long long v17 = v13;
      __int16 v18 = 2048;
      id v19 = self;
      __int16 v20 = 2114;
      id v21 = v7;
      _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_ERROR, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - Error retrieving HLS metadata - Error:%{public}@", buf, 0x20u);
    }
    id v10 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    id v10 = v6;
  }

  return v10;
}

- (id)_audioFormatsDictionaryWithHLSMetadataFromAsset:(id)a3 metadataWaitTime:(double *)a4 error:(id *)a5
{
  int v8 = (void *)MEMORY[0x263EFF910];
  id v9 = a3;
  [v8 timeIntervalSinceReferenceDate];
  double v11 = v10;
  __int16 v12 = [(MPCPlayerItemConfigurator *)self _HLSMetadataForAsset:v9 error:a5];

  if (a4)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    *a4 = v13 - v11;
  }
  uint64_t v14 = [(MPCPlayerItemConfigurator *)self _audioFormatsDictionaryWithHLSMetadata:v12];

  return v14;
}

- (void)_emitAudioFormatSelection:(id)a3 item:(id)a4
{
  v24[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 queueSectionID];
  uint64_t v9 = [v7 queueItemID];

  double v10 = [(MPCPlayerItemConfigurator *)self playbackEngine];
  double v11 = [v10 eventStream];
  v23[0] = @"queue-section-id";
  v23[1] = @"queue-item-id";
  id v19 = (void *)v9;
  __int16 v20 = (void *)v8;
  v24[0] = v8;
  v24[1] = v9;
  v23[2] = @"item-audio-format-selection-metadata";
  v21[0] = @"audio-format-selection-format";
  __int16 v12 = [v6 format];
  double v13 = v12;
  if (!v12)
  {
    double v13 = [MEMORY[0x263EFF9D0] null];
  }
  v22[0] = v13;
  v21[1] = @"audio-format-selection-explanation";
  uint64_t v14 = [v6 explanation];
  v22[1] = v14;
  v21[2] = @"audio-format-selection-justification";
  id v15 = [v6 justification];
  long long v16 = v15;
  if (!v15)
  {
    long long v16 = [MEMORY[0x263EFF9D0] null];
  }
  v22[2] = v16;
  long long v17 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  v24[2] = v17;
  __int16 v18 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
  [v11 emitEventType:@"audio-format-selection" payload:v18];

  if (!v15) {
  if (!v12)
  }
}

- (void)_setupQueueItemForLossyAudioPlayback:(id)a3 playerItem:(id)a4
{
  v31[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v30[0] = @"LQ";
  uint64_t v8 = +[MPCPlayerAudioFormat lossyLowQualityStereoFormat];
  v30[1] = @"HQ";
  v31[0] = v8;
  uint64_t v9 = +[MPCPlayerAudioFormat lossyHighQualityStereoFormat];
  v31[1] = v9;
  double v10 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];

  [v6 updateAudioFormatsDictionary:v10];
  double v11 = [(MPCPlayerItemConfigurator *)self audioAssetTypeSelector];
  __int16 v12 = [v6 availableSortedFormats];
  double v13 = [(MPCPlayerItemConfigurator *)self currentAudioRoute];
  uint64_t v14 = [v11 preferredAudioFormatForAudioFormats:v12 route:v13];

  id v15 = [v14 format];
  [(MPCPlayerItemConfigurator *)self _emitAudioFormatSelection:v14 item:v6];
  long long v16 = [(MPCPlayerItemConfigurator *)self currentAudioRoute];
  [v6 setAudioRoute:v16];

  [v6 updatePreferredFormat:v15];
  [v6 updateActiveFormat:v15 justification:100];
  if ([v6 mediaType] == 1024)
  {
    uint64_t v17 = 7;
  }
  else
  {
    if ([v6 mediaType] != 2) {
      goto LABEL_6;
    }
    uint64_t v17 = 4;
  }
  [v7 setAllowedAudioSpatializationFormats:v17];
LABEL_6:
  __int16 v18 = [(MPCPlayerItemConfigurator *)self playbackEngine];
  id v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v20 = [v18 engineID];
    id v21 = [v6 preferredFormat];
    int v22 = 138544130;
    v23 = v20;
    __int16 v24 = 2048;
    id v25 = self;
    __int16 v26 = 2114;
    id v27 = v6;
    __int16 v28 = 2114;
    v29 = v21;
    _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - No enhanced audio format [Using pre-defined lossy formats] - item:%{public}@ - Preferred/active format:%{public}@", (uint8_t *)&v22, 0x2Au);
  }
}

- (void)_setupQueueItemForHLSPlayback:(id)a3 playerItem:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 asset];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v10 = [(MPCPlayerItemConfigurator *)self audioAssetTypeSelector];
    uint64_t v11 = [v10 spatialPreference];
    __int16 v12 = [(MPCPlayerItemConfigurator *)self audioAssetTypeSelector];
    uint64_t v13 = [v12 spatialIsAlwaysOn];
    uint64_t v14 = [(MPCPlayerItemConfigurator *)self audioAssetTypeSelector];
    objc_msgSend(v7, "mpc_setupForHLSPlaybackWithPreferredFormat:spatialPreference:forceSpatial:maxResolution:isDownloadedAsset:", 0, v11, v13, objc_msgSend(v14, "maxResolution"), objc_msgSend(v6, "isDownloadedAsset"));

    id v15 = [(MPCPlayerItemConfigurator *)self currentAudioRoute];
    [v6 setAudioRoute:v15];

    long long v16 = [(MPCPlayerItemConfigurator *)self playbackEngine];
    uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [v16 engineID];
      id v19 = objc_msgSend(v7, "mpc_setupDescription");
      int v20 = 138544130;
      id v21 = v18;
      __int16 v22 = 2048;
      v23 = self;
      __int16 v24 = 2114;
      id v25 = v19;
      __int16 v26 = 2114;
      id v27 = v6;
      _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - AVPlayerItem setup:%{public}@ - item:%{public}@", (uint8_t *)&v20, 0x2Au);
    }
  }
}

- (BOOL)_setupQueueItemForEnhancedAudioHLSPlayback:(id)a3 playerItem:(id)a4 metadataWaitTime:(double *)a5 error:(id *)a6
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v10 asset];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v62 = [v10 asset];
    uint64_t v13 = -[MPCPlayerItemConfigurator _audioFormatsDictionaryWithHLSMetadataFromAsset:metadataWaitTime:error:](self, "_audioFormatsDictionaryWithHLSMetadataFromAsset:metadataWaitTime:error:");
    id v14 = 0;
    BOOL v15 = v14 == 0;
    id v63 = v14;
    if (v14)
    {
      long long v16 = v14;
      uint64_t v17 = [(MPCPlayerItemConfigurator *)self playbackEngine];
      __int16 v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v17 engineID];
        *(_DWORD *)buf = 138544130;
        v67 = v19;
        __int16 v68 = 2048;
        v69 = self;
        __int16 v70 = 2114;
        id v71 = v9;
        __int16 v72 = 2114;
        id v73 = v63;
        _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_ERROR, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - Error retrieving audio formats - item:%{public}@ - error:%{public}@", buf, 0x2Au);

        long long v16 = v63;
      }
      int v20 = (void *)v13;

      id v21 = [MPCPlayerAudioFormatSelection alloc];
      v64 = @"Error";
      __int16 v22 = [v16 debugDescription];
      v23 = v22;
      if (!v22)
      {
        v23 = [MEMORY[0x263EFF9D0] null];
      }
      v65 = v23;
      __int16 v24 = [NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
      id v25 = [(MPCPlayerAudioFormatSelection *)v21 initWithExplanation:@" Error retrieving audio formats" justification:v24];

      if (!v22) {
      [(MPCPlayerItemConfigurator *)self _emitAudioFormatSelection:v25 item:v9];
      }
      if (a6)
      {
        __int16 v26 = v63;
        *a6 = v63;
        id v27 = (void *)v62;
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v28 = [v9 isDownloadedAsset];
      v61 = (void *)v13;
      if (v13)
      {
        [v9 updateAudioFormatsDictionary:v13];
        v29 = [(MPCPlayerItemConfigurator *)self audioAssetTypeSelector];
        if (v28)
        {
          uint64_t v30 = [v9 loadedAudioAssetType];
          v31 = [v9 availableSortedFormats];
          __int16 v32 = [(MPCPlayerItemConfigurator *)self currentAudioRoute];
          [v29 audioFormatMatchingAudioAssetType:v30 formats:v31 route:v32];
        }
        else
        {
          v31 = [v9 availableSortedFormats];
          __int16 v32 = [(MPCPlayerItemConfigurator *)self currentAudioRoute];
          [v29 preferredAudioFormatForAudioFormats:v31 route:v32];
        }
        id v25 = (MPCPlayerAudioFormatSelection *)objc_claimAutoreleasedReturnValue();
        unsigned int v59 = v28;
        BOOL v60 = v15;

        uint64_t v41 = [(MPCPlayerAudioFormatSelection *)v25 format];
        [(MPCPlayerItemConfigurator *)self _emitAudioFormatSelection:v25 item:v9];
        v42 = [(MPCPlayerItemConfigurator *)self currentAudioRoute];
        [v9 setAudioRoute:v42];

        v58 = (void *)v41;
        [v9 updatePreferredFormat:v41];
        v43 = [(MPCPlayerItemConfigurator *)self playbackEngine];
        v44 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = [v43 engineID];
          v46 = [v9 preferredFormat];
          *(_DWORD *)buf = 138544130;
          v67 = v45;
          __int16 v68 = 2048;
          v69 = self;
          __int16 v70 = 2114;
          id v71 = v9;
          __int16 v72 = 2114;
          id v73 = v46;
          _os_log_impl(&dword_21BB87000, v44, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - Audio formats available in HLS session data [Setting up player item] - item:%{public}@ - Preferred format:%{public}@", buf, 0x2Au);
        }
        v47 = [v9 preferredFormat];
        v48 = [(MPCPlayerItemConfigurator *)self audioAssetTypeSelector];
        uint64_t v49 = [v48 spatialPreference];
        v50 = [(MPCPlayerItemConfigurator *)self audioAssetTypeSelector];
        uint64_t v51 = [v50 spatialIsAlwaysOn];
        v52 = [(MPCPlayerItemConfigurator *)self audioAssetTypeSelector];
        objc_msgSend(v10, "mpc_setupForHLSPlaybackWithPreferredFormat:spatialPreference:forceSpatial:maxResolution:isDownloadedAsset:", v47, v49, v51, objc_msgSend(v52, "maxResolution"), v59);

        v53 = [(MPCPlayerItemConfigurator *)self playbackEngine];
        v54 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = [v53 engineID];
          v56 = objc_msgSend(v10, "mpc_setupDescription");
          *(_DWORD *)buf = 138544130;
          v67 = v55;
          __int16 v68 = 2048;
          v69 = self;
          __int16 v70 = 2114;
          id v71 = v56;
          __int16 v72 = 2114;
          id v73 = v9;
          _os_log_impl(&dword_21BB87000, v54, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - AVPlayerItem setup:%{public}@ - item:%{public}@", buf, 0x2Au);
        }
        int v20 = v61;
        id v27 = (void *)v62;
        BOOL v15 = v60;
        __int16 v26 = 0;
        goto LABEL_25;
      }
      v33 = [(MPCPlayerItemConfigurator *)self playbackEngine];
      __int16 v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        id v35 = [v33 engineID];
        *(_DWORD *)buf = 138543874;
        v67 = v35;
        __int16 v68 = 2048;
        v69 = self;
        __int16 v70 = 2114;
        id v71 = v9;
        _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AL] - No audio formats in HLS session data [Setting up player item using preferred audio asset type] - item:%{public}@", buf, 0x20u);
      }
      id v25 = [[MPCPlayerAudioFormatSelection alloc] initWithExplanation:@"No audio formats in HLS session data [Attempting setup with preferred type]" justification:0];
      [(MPCPlayerItemConfigurator *)self _emitAudioFormatSelection:v25 item:v9];
      __int16 v36 = [(MPCPlayerItemConfigurator *)self audioAssetTypeSelector];
      uint64_t v37 = [v36 spatialPreference];
      __int16 v38 = [(MPCPlayerItemConfigurator *)self audioAssetTypeSelector];
      uint64_t v39 = [v38 spatialIsAlwaysOn];
      uint64_t v40 = [(MPCPlayerItemConfigurator *)self audioAssetTypeSelector];
      objc_msgSend(v10, "mpc_setupForHLSPlaybackWithPreferredFormat:spatialPreference:forceSpatial:maxResolution:isDownloadedAsset:", 0, v37, v39, objc_msgSend(v40, "maxResolution"), v28);

      int v20 = 0;
    }
    id v27 = (void *)v62;
    __int16 v26 = v63;
    goto LABEL_25;
  }
  BOOL v15 = 0;
LABEL_26:

  return v15;
}

- (void)processAudioQualityChanges
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(MPCPlayerItemConfigurator *)self playbackEngine];
  if (v3)
  {
    id v4 = [(MPCPlayerItemConfigurator *)self currentItem];
    if (([v3 isVocalAttenuationEnabled] & 1) == 0)
    {
      if (v4)
      {
        BOOL v5 = [(MPCPlayerItemConfigurator *)self _shouldReloadEntireQueue];
        id v6 = [(MPCPlayerItemConfigurator *)self playbackEngine];
        id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        if (v5)
        {
          if (v8)
          {
            id v9 = [v6 engineID];
            id v10 = [(MPCPlayerItemConfigurator *)self queuedItems];
            *(_DWORD *)buf = 138543874;
            BOOL v15 = v9;
            __int16 v16 = 2048;
            uint64_t v17 = self;
            __int16 v18 = 2114;
            id v19 = v10;
            _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - Preferred asset type changed [reloading all queued items] - items:%{public}@", buf, 0x20u);
          }
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __55__MPCPlayerItemConfigurator_processAudioQualityChanges__block_invoke;
          v13[3] = &unk_2643C30F8;
          v13[4] = self;
          [v3 reloadQueueForReason:0 completion:v13];
        }
        else
        {
          if (v8)
          {
            uint64_t v11 = [v6 engineID];
            __int16 v12 = [(MPCPlayerItemConfigurator *)self queuedItems];
            *(_DWORD *)buf = 138543874;
            BOOL v15 = v11;
            __int16 v16 = 2048;
            uint64_t v17 = self;
            __int16 v18 = 2114;
            id v19 = v12;
            _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - Preferred asset type changed [reconfiguring all queued items & player] - items:%{public}@", buf, 0x20u);
          }
          [(MPCPlayerItemConfigurator *)self _updateQueueItemsAndPlayerForFormatChangeIfRequired];
        }
      }
      else
      {
        [(MPCPlayerItemConfigurator *)self _setupPlayer];
      }
    }
  }
}

void __55__MPCPlayerItemConfigurator_processAudioQualityChanges__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) playbackEngine];
    BOOL v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 engineID];
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543874;
      id v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v3;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AF] - Failed to reload items [Preferred asset type changed] - error:%{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)tearDownDefaultsDebouncer
{
  id v3 = [(MPCPlayerItemConfigurator *)self userDefaultsDebouncer];

  if (v3)
  {
    id v4 = [(MPCPlayerItemConfigurator *)self userDefaultsDebouncer];
    dispatch_source_cancel(v4);

    [(MPCPlayerItemConfigurator *)self setUserDefaultsDebouncer:0];
  }
}

- (void)setupDefaultsDebouncer
{
  [(MPCPlayerItemConfigurator *)self tearDownDefaultsDebouncer];
  id v3 = [(MPCPlayerItemConfigurator *)self userDefaultsDebouncer];

  if (!v3)
  {
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    [(MPCPlayerItemConfigurator *)self setUserDefaultsDebouncer:v4];

    dispatch_time_t v5 = dispatch_time(0, 300000000);
    id v6 = [(MPCPlayerItemConfigurator *)self userDefaultsDebouncer];
    dispatch_source_set_timer(v6, v5, 0xFFFFFFFFFFFFFFFFLL, 0);

    objc_initWeak(&location, self);
    uint64_t v7 = [(MPCPlayerItemConfigurator *)self userDefaultsDebouncer];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __51__MPCPlayerItemConfigurator_setupDefaultsDebouncer__block_invoke;
    handler[3] = &unk_2643C1F60;
    objc_copyWeak(&v10, &location);
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);

    int v8 = [(MPCPlayerItemConfigurator *)self userDefaultsDebouncer];
    dispatch_resume(v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __51__MPCPlayerItemConfigurator_setupDefaultsDebouncer__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) playbackEngine];
    dispatch_source_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v5 = [v3 engineID];
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543618;
      int v8 = v5;
      __int16 v9 = 2048;
      uint64_t v10 = v6;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - Processing user default audio quality change", (uint8_t *)&v7, 0x16u);
    }
    [WeakRetained processAudioQualityChanges];
    [WeakRetained tearDownDefaultsDebouncer];
  }
}

- (void)_preferredResolutionDidChange:(id)a3
{
  dispatch_source_t v4 = [(MPCPlayerItemConfigurator *)self stackController];
  id v5 = [v4 currentItem];

  if ([v5 isAssetLoaded]) {
    [(MPCPlayerItemConfigurator *)self setupDefaultsDebouncer];
  }
}

- (void)_soundCheckEnabledChangedNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_source_t v4 = [(MPCPlayerItemConfigurator *)self playbackEngine];
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 engineID];
    int v7 = [MEMORY[0x263F12178] standardUserDefaults];
    *(_DWORD *)buf = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 1024;
    int v14 = [v7 soundCheckEnabled];
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p: _soundCheckEnabledChangedNotification soundCheckEnabled=%{BOOL}u", buf, 0x1Cu);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__MPCPlayerItemConfigurator__soundCheckEnabledChangedNotification___block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __67__MPCPlayerItemConfigurator__soundCheckEnabledChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "queuedItems", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        int v7 = [v6 feeder];
        [v7 applyVolumeNormalizationForItem:v6];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (void)_playbackUserDefaultsEQPresetDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__MPCPlayerItemConfigurator__playbackUserDefaultsEQPresetDidChangeNotification___block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __80__MPCPlayerItemConfigurator__playbackUserDefaultsEQPresetDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F12178] standardUserDefaults];
  uint64_t v3 = [v2 musicEQSetting];
  [*(id *)(a1 + 32) setEqSetting:v3];

  uint64_t v4 = [*(id *)(a1 + 32) playbackEngine];
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 engineID];
    int v7 = *(void **)(a1 + 32);
    long long v8 = [v7 eqSetting];
    int v18 = 138543874;
    id v19 = v6;
    __int16 v20 = 2048;
    id v21 = v7;
    __int16 v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - Setting EQ to %{public}@", (uint8_t *)&v18, 0x20u);
  }
  long long v9 = [*(id *)(a1 + 32) stackController];
  long long v10 = [v9 currentItem];

  if ([v10 isAssetLoaded])
  {
    long long v11 = [*(id *)(a1 + 32) translator];
    __int16 v12 = [v11 MPAVItemForMFPlayerItem:v10];

    uint64_t v13 = [*(id *)(a1 + 32) playbackEngine];
    int v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v13 engineID];
      __int16 v16 = *(void **)(a1 + 32);
      int v18 = 138543874;
      id v19 = v15;
      __int16 v20 = 2048;
      id v21 = v16;
      __int16 v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - Setting up EQ for %{public}@", (uint8_t *)&v18, 0x20u);
    }
    uint64_t v17 = [*(id *)(a1 + 32) eqSetting];
    objc_msgSend(v12, "setupEQPresetWithDefaultPreset:", (int)objc_msgSend(v17, "avPreset"));
  }
}

- (void)_highQualityMusicStreamingOnCellularDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__MPCPlayerItemConfigurator__highQualityMusicStreamingOnCellularDidChange___block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __75__MPCPlayerItemConfigurator__highQualityMusicStreamingOnCellularDidChange___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "queuedItems", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v6++) disableItemReuse];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v4);
  }

  int v7 = [*(id *)(a1 + 32) playbackEngine];
  long long v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    long long v9 = [v7 engineID];
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v9;
    __int16 v18 = 2048;
    uint64_t v19 = v10;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p: _highQualityMusicStreamingOnCellularDidChange: reloading items [pref changed] keepCurrentItem=YES", buf, 0x16u);
  }
  long long v11 = [v7 player];
  [v11 reloadItemsKeepingCurrentItem:1 allowReuse:0];
}

- (BOOL)configureQueueItem:(id)a3 playerItem:(id)a4 error:(id *)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MPCPlayerItemConfigurator *)self playbackEngine];
  long long v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = [v10 engineID];
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v12;
    __int16 v65 = 2048;
    v66 = self;
    __int16 v67 = 2114;
    id v68 = v8;
    __int16 v69 = 2114;
    id v70 = v9;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - Configuring queue item:%{public}@ player item:%{public}@", buf, 0x2Au);
  }
  long long v13 = [v8 queueSectionID];
  long long v14 = [v8 queueItemID];
  long long v15 = [(MPCPlayerItemConfigurator *)self playbackEngine];
  __int16 v16 = v15;
  if (v13) {
    BOOL v17 = v14 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  int v18 = !v17;
  int v58 = v18;
  if (!v17)
  {
    uint64_t v19 = [v15 eventStream];
    v62[0] = @"queue-section-id";
    v62[1] = @"queue-item-id";
    v63[0] = v13;
    v63[1] = v14;
    __int16 v20 = [NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
    [v19 emitEventType:@"item-configuration-begin" payload:v20];
  }
  uint64_t v21 = [v8 contentItemID];
  [v9 setContentItemID:v21];

  __int16 v22 = [v8 description];
  [v9 setTitle:v22];

  objc_msgSend(v9, "setPrefersSeekOverSkip:", objc_msgSend(v8, "prefersSeekOverSkip"));
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v8;
    if ([v23 isRadioStreamPlayback])
    {
      uint64_t v24 = @"radio-stream";
    }
    else
    {
      if (![v23 isRadioPlayback])
      {
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v24 = @"radio";
    }
    [v9 setModelTypeName:v24];
    id v25 = [v23 stationStringID];
    [v9 setModelStringID:v25];

    goto LABEL_17;
  }
LABEL_18:
  [v8 setupWithPlaybackInfo];
  __int16 v26 = [(MPCPlayerItemConfigurator *)self eqSetting];
  uint64_t v27 = (int)[v26 avPreset];

  [v8 setupEQPresetWithDefaultPreset:v27];
  [v8 _applyLoudnessInfo];
  uint64_t v28 = [v8 feeder];
  [v28 applyVolumeNormalizationForItem:v8];

  [v9 _setTimeJumpedNotificationIncludesExtendedDiagnosticPayload:1];
  if ([v16 isVocalAttenuationEnabled])
  {
    v29 = [(MPCPlayerItemConfigurator *)self playbackEngine];
    uint64_t v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      [v29 engineID];
      v31 = a5;
      __int16 v32 = v16;
      v33 = v14;
      v35 = __int16 v34 = v13;
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v35;
      __int16 v65 = 2048;
      v66 = self;
      __int16 v67 = 2114;
      id v68 = v8;
      _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlayerItemConfigurator %p - [AP] - Configuring item for Suntory: %{public}@", buf, 0x20u);

      long long v13 = v34;
      long long v14 = v33;
      __int16 v16 = v32;
      a5 = v31;
    }

    __int16 v36 = [v16 vocalAttenuationController];
    objc_msgSend(v8, "setConfiguredForVocalAttenuation:", objc_msgSend(v36, "configureQueueItem:", v8));
  }
  else
  {
    if (![v16 isAudioAnalyzerEnabled]) {
      goto LABEL_25;
    }
    __int16 v36 = [v16 audioAnalyzer];
    [v36 configurePlayerItem:v9];
  }

LABEL_25:
  *(void *)buf = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_35;
  }
  id v37 = v8;
  if (![v37 isHLSAsset]) {
    goto LABEL_33;
  }
  if ([v37 loadedAudioAssetType] < 3)
  {
    if (([v37 hasVideo] & 1) != 0
      || ([v37 isRadioStreamPlayback] & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [(MPCPlayerItemConfigurator *)self _setupQueueItemForHLSPlayback:v37 playerItem:v9];
      goto LABEL_34;
    }
LABEL_33:
    [(MPCPlayerItemConfigurator *)self _setupQueueItemForLossyAudioPlayback:v37 playerItem:v9];
    goto LABEL_34;
  }
  [(MPCPlayerItemConfigurator *)self _setupQueueItemForEnhancedAudioHLSPlayback:v37 playerItem:v9 metadataWaitTime:buf error:a5];
LABEL_34:

LABEL_35:
  if (v58)
  {
    v57 = [v16 eventStream];
    v60[0] = @"queue-section-id";
    v60[1] = @"queue-item-id";
    v61[0] = v13;
    v61[1] = v14;
    v55 = v14;
    v60[2] = @"item-configured-eq";
    __int16 v38 = NSNumber;
    v54 = [(MPCPlayerItemConfigurator *)self eqSetting];
    v53 = objc_msgSend(v38, "numberWithInteger:", objc_msgSend(v54, "preset"));
    v61[2] = v53;
    v60[3] = @"item-configured-sc-vol-normalization";
    uint64_t v39 = NSNumber;
    [v8 soundCheckVolumeNormalization];
    v52 = objc_msgSend(v39, "numberWithFloat:");
    v61[3] = v52;
    v60[4] = @"item-configured-loudness";
    uint64_t v40 = [v9 loudnessInfo];
    uint64_t v41 = (void *)v40;
    if (!v40)
    {
      uint64_t v40 = [MEMORY[0x263EFF9D0] null];
    }
    v50 = (void *)v40;
    v61[4] = v40;
    v60[5] = @"hls-metadata-wait-time";
    v56 = v13;
    if (*(double *)buf > 0.0) {
      [NSNumber numberWithDouble:*(double *)buf];
    }
    else {
      objc_msgSend(MEMORY[0x263EFF9D0], "null", *(double *)buf);
    }
    uint64_t v51 = v59 = v16;
    v61[5] = v51;
    v60[6] = @"audio-route";
    v42 = [(MPCPlayerItemConfigurator *)self currentAudioRoute];
    v43 = v42;
    if (!v42)
    {
      v43 = [MEMORY[0x263EFF9D0] null];
    }
    v61[6] = v43;
    v60[7] = @"supports-vocal-attenuation";
    v44 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "supportsVocalAttenuation"));
    v61[7] = v44;
    v60[8] = @"vocal-attenuation-configured";
    v45 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isConfiguredForVocalAttenuation"));
    v61[8] = v45;
    v60[9] = @"vocal-attenuation-available";
    v46 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v59, "isVocalAttenuationAvailable"));
    v61[9] = v46;
    v60[10] = @"vocal-attenuation-enabled";
    v47 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v59, "isVocalAttenuationEnabled"));
    v61[10] = v47;
    v48 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:11];
    [v57 emitEventType:@"item-configuration-end" payload:v48];

    if (!v42) {
    if (!v41)
    }

    long long v14 = v55;
    long long v13 = v56;
    __int16 v16 = v59;
  }

  return 1;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MPCPlayerItemConfigurator;
  [(MPCPlayerItemConfigurator *)&v4 dealloc];
}

@end