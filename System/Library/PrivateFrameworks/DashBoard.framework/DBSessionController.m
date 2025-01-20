@interface DBSessionController
- (BSInvalidatable)clusterThemeServiceDomainActivationToken;
- (CARObserverHashTable)observers;
- (CARSession)currentSession;
- (CARSessionStatus)sessionStatus;
- (CARThemeAsset)currentThemeAsset;
- (CARThemeAssetLibrary)themeAssetLibrary;
- (CRFeatureAvailability)featureAvailability;
- (CRPairedVehicleManager)pairedVehicleManager;
- (CRSUIClusterThemeService)clusterThemeService;
- (CRVehicle)currentVehicle;
- (DBLayerMetadataService)layerMetadataService;
- (DBSessionController)init;
- (DBSessionControllerDelegate)delegate;
- (DBUISyncChannel)uisyncChannel;
- (NSMutableSet)layerMetadataServiceRequesters;
- (OS_dispatch_queue)vehicleUpdateQueue;
- (ResourceHint)powerResourceHint;
- (_TtC9DashBoard17DBThemeController)themeController;
- (id)_sync_pairedVehicle;
- (id)assetBaseURL;
- (id)clusterThemeDisplays;
- (id)extraAssetsURL;
- (id)getURLForAssetWithIdentifier:(id)a3 displayID:(id)a4;
- (id)pendingConnectCompletion;
- (id)themeData;
- (int64_t)cachedSoundRecognitionState;
- (unint64_t)assetVersion;
- (unint64_t)cachedSoundRecognitionPreference;
- (unint64_t)currentSupportedFeatures;
- (void)_applyAXPreferences;
- (void)_handleSessionConnectRequiringThemeAssetWithCompletion:(id)a3;
- (void)_handleSessionConnectWithThemeAsset:(id)a3;
- (void)_pairedVehiclesDidChange:(id)a3;
- (void)_restoreAXPreferences;
- (void)_updateLayerMetadataService;
- (void)_updateVehicleAppearancePreferenceIfNecessary;
- (void)_updateVehicleInfo:(id)a3 completion:(id)a4;
- (void)_updateVehicleInfoSync;
- (void)_updateVehicleInfoWithCompletion:(id)a3;
- (void)addSessionObserver:(id)a3;
- (void)removeSessionObserver:(id)a3;
- (void)session:(id)a3 showUIForScreenInfo:(id)a4 withURL:(id)a5;
- (void)session:(id)a3 stopUIForScreenInfo:(id)a4;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setCachedSoundRecognitionPreference:(unint64_t)a3;
- (void)setCachedSoundRecognitionState:(int64_t)a3;
- (void)setClusterThemeService:(id)a3;
- (void)setClusterThemeServiceDomainActivationToken:(id)a3;
- (void)setCurrentSession:(id)a3;
- (void)setCurrentSupportedFeatures:(unint64_t)a3;
- (void)setCurrentThemeAsset:(id)a3;
- (void)setCurrentVehicle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeatureAvailability:(id)a3;
- (void)setLayerMetadataService:(id)a3;
- (void)setLayerMetadataServiceRequesters:(id)a3;
- (void)setNeedsLayerMetadataService:(BOOL)a3 forDisplayIdentity:(id)a4;
- (void)setObservers:(id)a3;
- (void)setPairedVehicleManager:(id)a3;
- (void)setPendingConnectCompletion:(id)a3;
- (void)setPowerResourceHint:(id)a3;
- (void)setSessionStatus:(id)a3;
- (void)setThemeAssetLibrary:(id)a3;
- (void)setThemeController:(id)a3;
- (void)setUisyncChannel:(id)a3;
- (void)setVehicleUpdateQueue:(id)a3;
- (void)themeAssetLibrary:(id)a3 attemptingDownloadOfAssetWithVersion:(id)a4;
- (void)themeAssetLibrary:(id)a3 completedDownloadOfAsset:(id)a4;
- (void)themeAssetLibrary:(id)a3 didUpdateFromAsset:(id)a4 toAsset:(id)a5;
- (void)themeAssetLibrary:(id)a3 failedDownloadOfAssetWithVersion:(id)a4 error:(id)a5;
@end

@implementation DBSessionController

- (DBSessionController)init
{
  v17.receiver = self;
  v17.super_class = (Class)DBSessionController;
  v2 = [(DBSessionController *)&v17 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F30E18]);
    uint64_t v4 = [v3 initWithProtocol:&unk_26E197A80 callbackQueue:MEMORY[0x263EF83A0]];
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F30E50]) initForCarPlayShell];
    sessionStatus = v2->_sessionStatus;
    v2->_sessionStatus = (CARSessionStatus *)v6;

    [(CARSessionStatus *)v2->_sessionStatus addSessionObserver:v2];
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.CarPlay.SessionController", v8);
    vehicleUpdateQueue = v2->_vehicleUpdateQueue;
    v2->_vehicleUpdateQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263F5F600]) initWithResourceType:3 andState:0];
    powerResourceHint = v2->_powerResourceHint;
    v2->_powerResourceHint = (ResourceHint *)v11;

    v13 = (CRFeatureAvailability *)objc_alloc_init(MEMORY[0x263F30E98]);
    featureAvailability = v2->_featureAvailability;
    v2->_featureAvailability = v13;

    v15 = [MEMORY[0x263F087C8] defaultCenter];
    [v15 addObserver:v2 selector:sel__pairedVehiclesDidChange_ name:*MEMORY[0x263F30DE0] object:0];
  }
  return v2;
}

- (void)setNeedsLayerMetadataService:(BOOL)a3 forDisplayIdentity:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(DBSessionController *)self layerMetadataServiceRequesters];
  v8 = v7;
  if (v4)
  {

    if (!v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [(DBSessionController *)self setLayerMetadataServiceRequesters:v9];
    }
    v8 = [(DBSessionController *)self layerMetadataServiceRequesters];
    [v8 addObject:v6];
  }
  else
  {
    [v7 removeObject:v6];
  }

  [(DBSessionController *)self _updateLayerMetadataService];
}

- (void)addSessionObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBSessionController *)self observers];
  [v5 addObserver:v4];
}

- (void)removeSessionObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBSessionController *)self observers];
  [v5 removeObserver:v4];
}

- (void)session:(id)a3 showUIForScreenInfo:(id)a4 withURL:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a5;
  v8 = DBLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 identifier];
    int v16 = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "[DBSessionController] Saving showUI URL to defaults: %@ for identifier: %@", (uint8_t *)&v16, 0x16u);
  }
  v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v11 = [v10 dictionaryForKey:@"DBSessionPreviousShowUIURLDictionary"];
  v12 = (void *)[v11 mutableCopy];

  if (!v12) {
    v12 = objc_opt_new();
  }
  v13 = [v7 absoluteString];
  v14 = [v6 identifier];
  [v12 setObject:v13 forKeyedSubscript:v14];

  v15 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v15 setObject:v12 forKey:@"DBSessionPreviousShowUIURLDictionary"];
}

- (void)session:(id)a3 stopUIForScreenInfo:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v6 = [v5 dictionaryForKey:@"DBSessionPreviousShowUIURLDictionary"];
  id v7 = (void *)[v6 mutableCopy];

  if (v7)
  {
    v8 = DBLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v4 identifier];
      int v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "[DBSessionController] Removing showUI URL from defaults for identifier: %@", (uint8_t *)&v12, 0xCu);
    }
    v10 = [v4 identifier];
    [v7 removeObjectForKey:v10];

    uint64_t v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v11 setObject:v7 forKey:@"DBSessionPreviousShowUIURLDictionary"];
  }
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__DBSessionController_sessionDidConnect___block_invoke;
  v6[3] = &unk_2649B3D30;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __41__DBSessionController_sessionDidConnect___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = DBLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v23 = v3;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "[DBSessionController] Session did connect: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) _updateVehicleInfoSync];
  [*(id *)(a1 + 40) _updateVehicleAppearancePreferenceIfNecessary];
  id v4 = [*(id *)(a1 + 40) featureAvailability];
  objc_msgSend(*(id *)(a1 + 40), "setCurrentSupportedFeatures:", objc_msgSend(v4, "supportedCarPlayFeaturesForSession:", *(void *)(a1 + 32)));

  id v5 = [*(id *)(a1 + 40) powerResourceHint];
  [v5 updateState:1];

  id v6 = DBLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 40) powerResourceHint];
    v8 = [v7 uuid];
    *(_DWORD *)buf = 138543362;
    v23 = v8;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "[DBSessionController] holding power resource %{public}@", buf, 0xCu);
  }
  id v9 = [*(id *)(a1 + 40) currentVehicle];
  v10 = [v9 clusterAssetIdentifier];
  if (v10 && ([*(id *)(a1 + 40) currentSupportedFeatures] & 8) != 0)
  {
    v13 = [*(id *)(a1 + 32) configuration];
    int v14 = [v13 hasGaugeClusterScreen];

    if (v14)
    {
      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      v15 = *(void **)(a1 + 40);
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      __int16 v18 = __41__DBSessionController_sessionDidConnect___block_invoke_187;
      v19 = &unk_2649B49E0;
      objc_copyWeak(&v21, (id *)buf);
      id v20 = *(id *)(a1 + 32);
      [v15 _handleSessionConnectRequiringThemeAssetWithCompletion:&v16];

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
      return objc_msgSend(*(id *)(a1 + 40), "_applyAXPreferences", v16, v17, v18, v19);
    }
  }
  else
  {
  }
  [*(id *)(a1 + 40) setCurrentSession:*(void *)(a1 + 32)];
  uint64_t v11 = [*(id *)(a1 + 40) delegate];
  [v11 sessionController:*(void *)(a1 + 40) didConnectSession:*(void *)(a1 + 32)];

  return objc_msgSend(*(id *)(a1 + 40), "_applyAXPreferences", v16, v17, v18, v19);
}

void __41__DBSessionController_sessionDidConnect___block_invoke_187(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = DBLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [WeakRetained currentThemeAsset];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "[DBSessionController] Notifying session did connect with theme asset: %@", (uint8_t *)&v6, 0xCu);
  }
  [WeakRetained setCurrentSession:*(void *)(a1 + 32)];
  id v5 = [WeakRetained delegate];
  [v5 sessionController:WeakRetained didConnectSession:*(void *)(a1 + 32)];
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__DBSessionController_sessionDidDisconnect___block_invoke;
  v6[3] = &unk_2649B3D30;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __44__DBSessionController_sessionDidDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40)];
  v2 = DBLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    int v17 = 138412290;
    __int16 v18 = v3;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "[DBSessionController] Session did disconnect: %@", (uint8_t *)&v17, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) delegate];
  [v4 sessionController:*(void *)(a1 + 40) didDisconnectSession:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) setCurrentVehicle:0];
  [*(id *)(a1 + 40) setCurrentSession:0];
  [*(id *)(a1 + 40) setCurrentSupportedFeatures:0];
  id v5 = [*(id *)(a1 + 40) powerResourceHint];
  [v5 updateState:0];

  int v6 = DBLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 40) powerResourceHint];
    uint64_t v8 = [v7 uuid];
    int v17 = 138543362;
    __int16 v18 = v8;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "[DBSessionController] released power resource %{public}@", (uint8_t *)&v17, 0xCu);
  }
  CFPreferencesSetAppValue(@"UISyncChannelDisabled", 0, @"com.apple.carplay.internal");
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v10 = [v9 objectForKey:@"DBSessionPreviousShowUIURLDictionary"];

  if (v10)
  {
    uint64_t v11 = DBLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "[DBSessionController] Removing showUI Dictionary from defaults", (uint8_t *)&v17, 2u);
    }

    int v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v12 removeObjectForKey:@"DBSessionPreviousShowUIURLDictionary"];
  }
  v13 = [*(id *)(a1 + 40) themeAssetLibrary];
  [v13 invalidate];

  [*(id *)(a1 + 40) setThemeAssetLibrary:0];
  [*(id *)(a1 + 40) setPendingConnectCompletion:0];
  [*(id *)(a1 + 40) setCurrentThemeAsset:0];
  [*(id *)(a1 + 40) setThemeController:0];
  int v14 = [*(id *)(a1 + 40) clusterThemeServiceDomainActivationToken];
  [v14 invalidate];

  [*(id *)(a1 + 40) setClusterThemeServiceDomainActivationToken:0];
  v15 = [*(id *)(a1 + 40) clusterThemeService];
  [v15 invalidate];

  [*(id *)(a1 + 40) setClusterThemeService:0];
  return [*(id *)(a1 + 40) _restoreAXPreferences];
}

- (void)_pairedVehiclesDidChange:(id)a3
{
  id v4 = a3;
  id v5 = DBLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "[DBSessionController] Paired vehicles did change", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__DBSessionController__pairedVehiclesDidChange___block_invoke;
  v6[3] = &unk_2649B4738;
  objc_copyWeak(&v7, buf);
  [(DBSessionController *)self _updateVehicleInfoWithCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void __48__DBSessionController__pairedVehiclesDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateVehicleAppearancePreferenceIfNecessary];
  v2 = DBLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "[DBSessionController] Notifying observers current vehicle did change", v5, 2u);
  }

  id v3 = [WeakRetained observers];
  id v4 = [WeakRetained currentVehicle];
  [v3 sessionController:WeakRetained didUpdateVehicle:v4];
}

- (void)_updateVehicleAppearancePreferenceIfNecessary
{
  id v3 = [(DBSessionController *)self currentSession];
  uint64_t v4 = [(DBSessionController *)self currentVehicle];
  id v5 = (void *)v4;
  if (!v4 || !v3)
  {
    if (v3)
    {
      if (v4) {
        goto LABEL_32;
      }
    }
    else
    {
      int v14 = DBLogForCategory(0x10uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "Current session not available, not updating appearance preference", v24, 2u);
      }

      if (v5) {
        goto LABEL_32;
      }
    }
    v15 = DBLogForCategory(0x10uLL);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
LABEL_31:

      goto LABEL_32;
    }
    *(_WORD *)uint64_t v24 = 0;
    uint64_t v16 = "Current session not available, not updating appearance preference";
LABEL_30:
    _os_log_impl(&dword_22D6F0000, v15, OS_LOG_TYPE_DEFAULT, v16, v24, 2u);
    goto LABEL_31;
  }
  int v6 = [v3 configuration];
  id v7 = [v6 screens];
  uint64_t v8 = [v7 firstObject];
  int v9 = [v8 supportsAppearanceMode];

  if ([v5 appearanceModePreference] == -1)
  {
    v10 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "No appearance preference stored for this vehicle", v24, 2u);
    }

    if (v9)
    {
      uint64_t v11 = DBLogForCategory(0x10uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Main display supports UIAppearance, setting preference to automatic", v24, 2u);
      }

      int v12 = v5;
      uint64_t v13 = 0;
    }
    else
    {
      int v17 = [v3 configuration];
      uint64_t v18 = [v17 defaultUserInterfaceStyle];

      uint64_t v19 = DBLogForCategory(0x10uLL);
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v18 != -1)
      {
        if (v20)
        {
          *(_WORD *)uint64_t v24 = 0;
          _os_log_impl(&dword_22D6F0000, v19, OS_LOG_TYPE_DEFAULT, "Car supports default appearance, setting preference to provided value", v24, 2u);
        }

        id v21 = [v3 configuration];
        objc_msgSend(v5, "setAppearanceModePreference:", objc_msgSend(v21, "defaultUserInterfaceStyle"));

        goto LABEL_26;
      }
      if (v20)
      {
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl(&dword_22D6F0000, v19, OS_LOG_TYPE_DEFAULT, "Main display does not support appearance, setting preference to always dark", v24, 2u);
      }

      int v12 = v5;
      uint64_t v13 = 2;
    }
    [v12 setAppearanceModePreference:v13];
LABEL_26:
    v22 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_22D6F0000, v22, OS_LOG_TYPE_DEFAULT, "Saving updated vehicle", v24, 2u);
    }

    v23 = [(DBSessionController *)self pairedVehicleManager];
    [v23 saveVehicle:v5 completion:&__block_literal_global_37];

    v15 = DBLogForCategory(0x10uLL);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_WORD *)uint64_t v24 = 0;
    uint64_t v16 = "Appearance preference already stored for this vehicle";
    goto LABEL_30;
  }
LABEL_32:
}

void __68__DBSessionController__updateVehicleAppearancePreferenceIfNecessary__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v3 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __68__DBSessionController__updateVehicleAppearancePreferenceIfNecessary__block_invoke_cold_1();
    }
  }
}

- (void)_applyAXPreferences
{
  id v3 = [(DBSessionController *)self currentVehicle];
  uint64_t v4 = [(DBSessionController *)self currentSession];
  id v5 = (void *)v4;
  if (v3 && v4)
  {
    int v6 = objc_opt_new();
    if (_AXSCommandAndControlEnabled()) {
      id v7 = @"true";
    }
    else {
      id v7 = @"false";
    }
    uint64_t v8 = v7;
    if (_AXSCommandAndControlCarPlayEnabled()) {
      int v9 = @"true";
    }
    else {
      int v9 = @"false";
    }
    unint64_t v10 = 0x263F08000uLL;
    uint64_t v11 = [NSString stringWithFormat:@"phone:%@, car:%@", v8, v9];
    [v6 setObject:v11 forKeyedSubscript:@"voiceControl"];

    int v12 = [v3 boldTextPreference] == 1;
    if (_AXSCarPlayEnhanceTextLegibilityEnabled() != v12) {
      _AXSSetCarPlayEnhanceTextLegibilityEnabled();
    }
    if (_AXSEnhanceTextLegibilityEnabled()) {
      uint64_t v13 = @"true";
    }
    else {
      uint64_t v13 = @"false";
    }
    int v14 = v13;
    if (_AXSCarPlayEnhanceTextLegibilityEnabled()) {
      v15 = @"true";
    }
    else {
      v15 = @"false";
    }
    uint64_t v16 = [NSString stringWithFormat:@"phone:%@, car:%@", v14, v15];
    [v6 setObject:v16 forKeyedSubscript:@"boldText"];

    MAPreferencesSetDomainOverride();
    int v17 = +[DBAnalytics _axPhoneColorFiltersAnalyticsString];
    uint64_t v18 = [v3 _axColorFiltersAnalyticsString];
    uint64_t v19 = [NSString stringWithFormat:@"phone:%@, car:%@", v17, v18];
    [v6 setObject:v19 forKeyedSubscript:@"colorFilters"];

    MAPreferencesSetDomainOverride();
    MADisplayFilterPrefResetAll();
    if ([v3 colorFilterPreference]) {
      int v20 = [v3 colorFilterPreference] != 1;
    }
    else {
      int v20 = 0;
    }
    if (MADisplayFilterPrefGetCategoryEnabled() != v20) {
      MADisplayFilterPrefSetCategoryEnabled();
    }
    if (v20)
    {
      [v3 colorFilterPreference];
      MADisplayFilterPrefSetType();
    }
    v22 = [v3 colorFilterIntensityPreference];
    [v22 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_208];
    if (CPUIDeviceSupportsSoundRecognition())
    {
      [(DBSessionController *)self setCachedSoundRecognitionPreference:0];
      v23 = [MEMORY[0x263F21DA0] sharedInstance];
      -[DBSessionController setCachedSoundRecognitionState:](self, "setCachedSoundRecognitionState:", [v23 soundDetectionState]);

      int64_t cachedSoundRecognitionState = self->_cachedSoundRecognitionState;
      [v3 soundRecognitionPreference];
      uint64_t v25 = [v3 soundRecognitionPreference];
      if ((unint64_t)(cachedSoundRecognitionState - 1) > 1)
      {
        int v28 = 0;
      }
      else
      {
        uint64_t v26 = v25;
        [(DBSessionController *)self setCachedSoundRecognitionPreference:[(DBSessionController *)self cachedSoundRecognitionPreference] | 1];
        if (v26)
        {
          int v55 = 0;
        }
        else
        {
          int v55 = 1;
          [v3 setSoundRecognitionPreference:1];
        }
        v29 = [MEMORY[0x263F21DA0] sharedInstance];
        v30 = [v29 enabledSoundDetectionTypes];
        int v31 = [v30 containsObject:*MEMORY[0x263F21D20]];

        if (v31)
        {
          [(DBSessionController *)self setCachedSoundRecognitionPreference:[(DBSessionController *)self cachedSoundRecognitionPreference] | 2];
          if (!v26)
          {
            objc_msgSend(v3, "setSoundRecognitionPreference:", objc_msgSend(v3, "soundRecognitionPreference") | 2);
            int v55 = 1;
          }
        }
        v32 = [MEMORY[0x263F21DA0] sharedInstance];
        v33 = [v32 enabledSoundDetectionTypes];
        int v34 = [v33 containsObject:*MEMORY[0x263F21D88]];

        if (v34)
        {
          [(DBSessionController *)self setCachedSoundRecognitionPreference:[(DBSessionController *)self cachedSoundRecognitionPreference] | 4];
          unint64_t v10 = 0x263F08000;
          if (!v26)
          {
            objc_msgSend(v3, "setSoundRecognitionPreference:", objc_msgSend(v3, "soundRecognitionPreference") | 4);
            int v55 = 1;
          }
        }
        else
        {
          unint64_t v10 = 0x263F08000uLL;
        }
        char v35 = [v3 soundRecognitionPreference];
        v36 = [MEMORY[0x263F21DA0] sharedInstance];
        v37 = v36;
        uint64_t v38 = *MEMORY[0x263F21D20];
        if ((v35 & 2) != 0) {
          [v36 addSoundDetectionType:v38];
        }
        else {
          [v36 removeSoundDetectionType:v38];
        }

        v39 = [MEMORY[0x263F21DA0] sharedInstance];
        v40 = v39;
        uint64_t v41 = *MEMORY[0x263F21D88];
        if ((v35 & 4) != 0) {
          [v39 addSoundDetectionType:v41];
        }
        else {
          [v39 removeSoundDetectionType:v41];
        }

        if ((v35 & 6) == 0 || (v35 & 1) == 0) {
          uint64_t v43 = 0;
        }
        else {
          uint64_t v43 = 2;
        }
        v44 = [MEMORY[0x263F21DA0] sharedInstance];
        [v44 setSoundDetectionState:v43];

        int v28 = v55;
      }
      BOOL v27 = v28 != 0;
    }
    else
    {
      BOOL v27 = 0;
    }
    v56 = v22;
    if ([v3 voiceControlPreference])
    {
      [v3 voiceControlPreference];
      _AXSCommandAndControlCarPlaySetEnabled();
      if (!v27) {
        goto LABEL_68;
      }
    }
    else
    {
      if (_AXSCommandAndControlEnabled()) {
        uint64_t v45 = 1;
      }
      else {
        uint64_t v45 = 2;
      }
      [v3 setVoiceControlPreference:v45];
      [v3 voiceControlPreference];
      _AXSCommandAndControlCarPlaySetEnabled();
    }
    v46 = [(DBSessionController *)self pairedVehicleManager];
    [v46 saveVehicle:v3 completion:&__block_literal_global_215];

LABEL_68:
    v47 = [v3 _axSoundRecognitionAnalyticsString];
    v48 = +[DBAnalytics _axPhoneSoundRecognitionAnalyticsString:[(DBSessionController *)self cachedSoundRecognitionPreference]];
    [*(id *)(v10 + 2880) stringWithFormat:@"phone:%@, car:%@", v48, v47];
    v50 = unint64_t v49 = v10;
    [v6 setObject:v50 forKeyedSubscript:@"soundRecognition"];

    if (UIAccessibilityIsReduceMotionEnabled()) {
      v51 = @"true";
    }
    else {
      v51 = @"false";
    }
    v52 = v51;
    v53 = [*(id *)(v49 + 2880) stringWithFormat:@"phone:%@, car:%@", v52, v52];
    [v6 setObject:v53 forKeyedSubscript:@"reduceMotion"];

    if (+[DBAnalytics shouldSendAnalyticsEvents])
    {
      v54 = objc_msgSend(v5, "analytics_dictionaryRepresentationWithVehicle:", v3);
      [v6 addEntriesFromDictionary:v54];
      [v6 setObject:0 forKeyedSubscript:@"supportsDestinationSharing"];
      [v6 setObject:0 forKeyedSubscript:@"systemNightMode"];
      [v6 setObject:0 forKeyedSubscript:@"transports"];
      AnalyticsSendEvent();
    }
LABEL_74:

    goto LABEL_75;
  }
  if (v4)
  {
    if (!v3)
    {
LABEL_25:
      int v6 = DBLogForCategory(0x10uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v57 = 0;
        _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Current session not available, not updating ax appearance preference", v57, 2u);
      }
      goto LABEL_74;
    }
  }
  else
  {
    id v21 = DBLogForCategory(0x10uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v21, OS_LOG_TYPE_DEFAULT, "Current session not available, not updating ax appearance preference", buf, 2u);
    }

    if (!v3) {
      goto LABEL_25;
    }
  }
LABEL_75:
}

void __42__DBSessionController__applyAXPreferences__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (([v4 isEqualToNumber:&unk_26E17ED20] & 1) == 0) {
    [v4 isEqualToNumber:&unk_26E17ED38];
  }
  if ([v5 isEqualToString:@"CARColorFilterIntensityGrayscaleKey"])
  {
    MADisplayFilterPrefSetGrayscaleCorrectionIntensity();
  }
  else if ([v5 isEqualToString:@"CARColorFilterIntensityRedGreenKey"])
  {
    MADisplayFilterPrefSetRedColorCorrectionIntensity();
  }
  else if ([v5 isEqualToString:@"CARColorFilterIntensityGreenRedKey"])
  {
    MADisplayFilterPrefSetGreenColorCorrectionIntensity();
  }
  else if ([v5 isEqualToString:@"CARColorFilterIntensityBlueYellowKey"])
  {
    MADisplayFilterPrefSetBlueColorCorrectionIntensity();
  }
}

void __42__DBSessionController__applyAXPreferences__block_invoke_213(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v3 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__DBSessionController__applyAXPreferences__block_invoke_213_cold_1();
    }
  }
}

- (void)_restoreAXPreferences
{
  if (CPUIDeviceSupportsSoundRecognition())
  {
    id v3 = [MEMORY[0x263F21DA0] sharedInstance];
    uint64_t v4 = [v3 soundDetectionState];

    if (self->_cachedSoundRecognitionState != v4)
    {
      id v5 = [MEMORY[0x263F21DA0] sharedInstance];
      [v5 setSoundDetectionState:self->_cachedSoundRecognitionState];
    }
    unint64_t v6 = [(DBSessionController *)self cachedSoundRecognitionPreference];
    char v7 = v6;
    uint64_t v8 = (v6 >> 1) & 1;
    int v9 = [MEMORY[0x263F21DA0] sharedInstance];
    unint64_t v10 = [v9 enabledSoundDetectionTypes];
    uint64_t v11 = (uint64_t *)MEMORY[0x263F21D20];
    int v12 = [v10 containsObject:*MEMORY[0x263F21D20]];

    if (v8 != v12)
    {
      uint64_t v13 = [MEMORY[0x263F21DA0] sharedInstance];
      int v14 = v13;
      uint64_t v15 = *v11;
      if ((v7 & 2) != 0) {
        [v13 addSoundDetectionType:v15];
      }
      else {
        [v13 removeSoundDetectionType:v15];
      }
    }
    unint64_t v16 = [(DBSessionController *)self cachedSoundRecognitionPreference];
    char v17 = v16;
    uint64_t v18 = (v16 >> 2) & 1;
    uint64_t v19 = [MEMORY[0x263F21DA0] sharedInstance];
    int v20 = [v19 enabledSoundDetectionTypes];
    id v21 = (uint64_t *)MEMORY[0x263F21D88];
    int v22 = [v20 containsObject:*MEMORY[0x263F21D88]];

    if (v18 != v22)
    {
      v23 = [MEMORY[0x263F21DA0] sharedInstance];
      uint64_t v24 = v23;
      uint64_t v25 = *v21;
      if ((v17 & 4) != 0) {
        [v23 addSoundDetectionType:v25];
      }
      else {
        [v23 removeSoundDetectionType:v25];
      }
    }
  }
  if (_AXSCommandAndControlCarPlayEnabled())
  {
    _AXSCommandAndControlCarPlaySetEnabled();
  }
}

- (void)_updateVehicleInfoSync
{
  BSDispatchQueueAssertMain();
  id v3 = [(DBSessionController *)self _sync_pairedVehicle];
  [(DBSessionController *)self _updateVehicleInfo:v3 completion:0];
}

- (void)_updateVehicleInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DBSessionController *)self vehicleUpdateQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__DBSessionController__updateVehicleInfoWithCompletion___block_invoke;
  v7[3] = &unk_2649B55B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__DBSessionController__updateVehicleInfoWithCompletion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_sync_pairedVehicle");
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DBSessionController__updateVehicleInfoWithCompletion___block_invoke_2;
  block[3] = &unk_2649B5170;
  id v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__DBSessionController__updateVehicleInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVehicleInfo:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_updateVehicleInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  BSDispatchQueueAssertMain();
  if (!v6)
  {
    id v8 = DBLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DBSessionController _updateVehicleInfo:completion:](self, v8);
    }
  }
  [(DBSessionController *)self setCurrentVehicle:v6];
  if (v7) {
    v7[2](v7);
  }
}

- (CRPairedVehicleManager)pairedVehicleManager
{
  pairedVehicleManager = self->_pairedVehicleManager;
  if (!pairedVehicleManager)
  {
    id v4 = (CRPairedVehicleManager *)objc_alloc_init(MEMORY[0x263F30EA0]);
    id v5 = self->_pairedVehicleManager;
    self->_pairedVehicleManager = v4;

    pairedVehicleManager = self->_pairedVehicleManager;
  }
  return pairedVehicleManager;
}

- (id)_sync_pairedVehicle
{
  id v3 = [(DBSessionController *)self sessionStatus];
  id v4 = [v3 currentSession];
  id v5 = [v4 MFiCertificateSerialNumber];

  id v6 = [(DBSessionController *)self pairedVehicleManager];
  id v7 = [v6 vehicleForCertificateSerial:v5];

  return v7;
}

- (void)_handleSessionConnectRequiringThemeAssetWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DBSessionController *)self themeAssetLibrary];

  if (v5)
  {
    id v6 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DBSessionController _handleSessionConnectRequiringThemeAssetWithCompletion:]();
    }

    id v7 = [(DBSessionController *)self themeAssetLibrary];
    [v7 invalidate];

    [(DBSessionController *)self setThemeAssetLibrary:0];
  }
  id v8 = objc_alloc(MEMORY[0x263F30E58]);
  int v9 = [(DBSessionController *)self currentVehicle];
  unint64_t v10 = (CARThemeAssetLibrary *)[v8 initWithVehicle:v9];
  themeAssetLibrary = self->_themeAssetLibrary;
  self->_themeAssetLibrary = v10;

  [(CARThemeAssetLibrary *)self->_themeAssetLibrary addObserver:self];
  [(DBSessionController *)self setPendingConnectCompletion:v4];

  int v12 = DBLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [(DBSessionController *)self currentVehicle];
    *(_DWORD *)buf = 138412290;
    char v17 = v13;
    _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "[DBSessionController] Fetching theme asset for current vehicle: %@", buf, 0xCu);
  }
  int v14 = self->_themeAssetLibrary;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__DBSessionController__handleSessionConnectRequiringThemeAssetWithCompletion___block_invoke;
  v15[3] = &unk_2649B64F8;
  v15[4] = self;
  [(CARThemeAssetLibrary *)v14 findCurrentAssetWithCompletion:v15];
}

void __78__DBSessionController__handleSessionConnectRequiringThemeAssetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__DBSessionController__handleSessionConnectRequiringThemeAssetWithCompletion___block_invoke_2;
  v6[3] = &unk_2649B3D30;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __78__DBSessionController__handleSessionConnectRequiringThemeAssetWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = DBLogForCategory(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_INFO, "[DBSessionController] Received theme asset %@", (uint8_t *)&v5, 0xCu);
  }

  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleSessionConnectWithThemeAsset:");
  }
  else
  {
    uint64_t v4 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "[DBSessionController] Theme asset not ready yet.", (uint8_t *)&v5, 2u);
    }
  }
}

- (void)_handleSessionConnectWithThemeAsset:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(DBSessionController *)self currentThemeAsset];

  if (!v5)
  {
    uint64_t v7 = (CRSUIClusterThemeService *)objc_alloc_init(MEMORY[0x263F314C0]);
    clusterThemeService = self->_clusterThemeService;
    self->_clusterThemeService = v7;

    [(CRSUIClusterThemeService *)self->_clusterThemeService setThemeDataProvider:self];
    int v9 = [MEMORY[0x263F2BA00] activateManualDomain:@"com.apple.CarPlay.ClusterTheme"];
    clusterThemeServiceDomainActivationToken = self->_clusterThemeServiceDomainActivationToken;
    self->_clusterThemeServiceDomainActivationToken = v9;

    [(DBSessionController *)self setCurrentThemeAsset:v4];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__DBSessionController__handleSessionConnectWithThemeAsset___block_invoke;
    aBlock[3] = &unk_2649B3E90;
    aBlock[4] = self;
    uint64_t v6 = (uint64_t)_Block_copy(aBlock);
    uint64_t v11 = [v4 layoutURL];
    int v12 = DBLogForCategory(8uLL);
    uint64_t v13 = v12;
    if (!v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[DBSessionController _handleSessionConnectWithThemeAsset:]();
      }

      (*(void (**)(uint64_t))(v6 + 16))(v6);
      goto LABEL_19;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "[DBSessionController] Theme asset layout document available at URL %@", buf, 0xCu);
    }

    kdebug_trace();
    int v14 = [[_TtC9DashBoard20DBThemeAssetDocument alloc] initWithDocumentURL:v11];
    kdebug_trace();
    if (v14)
    {
      uint64_t v15 = [[_TtC9DashBoard17DBThemeController alloc] initWithThemeAssetDocument:v14];
      [(DBSessionController *)self setThemeController:v15];

      unint64_t v16 = self->_clusterThemeService;
      char v17 = [(DBSessionController *)self extraAssetsURL];
      [(CRSUIClusterThemeService *)v16 updateExtraAssetsURL:v17];

      uint64_t v18 = [(DBSessionController *)self themeController];
      uint64_t v19 = [(DBSessionController *)self currentVehicle];
      char v20 = [v18 validateThemeDataOnVehicle:v19];

      if (v20)
      {
LABEL_18:
        (*(void (**)(uint64_t))(v6 + 16))(v6);

LABEL_19:
        goto LABEL_20;
      }
      id v21 = DBLogForCategory(8uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v21, OS_LOG_TYPE_DEFAULT, "Theme data failed validation, updating vehicle.", buf, 2u);
      }

      int v22 = [(DBSessionController *)self currentVehicle];
      v23 = [(DBSessionController *)self themeController];
      uint64_t v24 = [(DBSessionController *)self currentVehicle];
      uint64_t v25 = [v24 displayThemeData];
      objc_msgSend(v22, "setAppearanceModePreference:", objc_msgSend(v23, "defaultAppearanceModePreferenceForThemeData:", v25));

      uint64_t v26 = [(DBSessionController *)self pairedVehicleManager];
      BOOL v27 = [(DBSessionController *)self currentVehicle];
      [v26 saveVehicle:v27 completion:&__block_literal_global_246];
    }
    else
    {
      uint64_t v26 = DBLogForCategory(8uLL);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[DBSessionController _handleSessionConnectWithThemeAsset:]((uint64_t)v11, v26);
      }
    }

    goto LABEL_18;
  }
  uint64_t v6 = DBLogForCategory(8uLL);
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
    -[DBSessionController _handleSessionConnectWithThemeAsset:]();
  }
LABEL_20:
}

uint64_t __59__DBSessionController__handleSessionConnectWithThemeAsset___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingConnectCompletion];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) pendingConnectCompletion];
    v3[2]();
  }
  id v4 = *(void **)(a1 + 32);
  return [v4 setPendingConnectCompletion:0];
}

void __59__DBSessionController__handleSessionConnectWithThemeAsset___block_invoke_244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__DBSessionController__handleSessionConnectWithThemeAsset___block_invoke_244_cold_1();
    }
  }
}

- (void)themeAssetLibrary:(id)a3 attemptingDownloadOfAssetWithVersion:(id)a4
{
  id v4 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__DBSessionController_themeAssetLibrary_attemptingDownloadOfAssetWithVersion___block_invoke;
  block[3] = &unk_2649B3E90;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __78__DBSessionController_themeAssetLibrary_attemptingDownloadOfAssetWithVersion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = DBLogForCategory(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_INFO, "attempting download for asset version: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)themeAssetLibrary:(id)a3 failedDownloadOfAssetWithVersion:(id)a4 error:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__DBSessionController_themeAssetLibrary_failedDownloadOfAssetWithVersion_error___block_invoke;
  v10[3] = &unk_2649B3D30;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __80__DBSessionController_themeAssetLibrary_failedDownloadOfAssetWithVersion_error___block_invoke(uint64_t a1)
{
  v2 = DBLogForCategory(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __80__DBSessionController_themeAssetLibrary_failedDownloadOfAssetWithVersion_error___block_invoke_cold_1(a1, v2);
  }
}

- (void)themeAssetLibrary:(id)a3 completedDownloadOfAsset:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__DBSessionController_themeAssetLibrary_completedDownloadOfAsset___block_invoke;
  v7[3] = &unk_2649B3D30;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __66__DBSessionController_themeAssetLibrary_completedDownloadOfAsset___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = DBLogForCategory(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "Asset download completed: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _handleSessionConnectWithThemeAsset:*(void *)(a1 + 32)];
}

- (void)themeAssetLibrary:(id)a3 didUpdateFromAsset:(id)a4 toAsset:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__DBSessionController_themeAssetLibrary_didUpdateFromAsset_toAsset___block_invoke;
  v10[3] = &unk_2649B3D30;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __68__DBSessionController_themeAssetLibrary_didUpdateFromAsset_toAsset___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = DBLogForCategory(8uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_INFO, "new asset is available: %@, previousAsset: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (id)themeData
{
  v2 = [(DBSessionController *)self currentVehicle];
  uint64_t v3 = [v2 displayThemeData];

  return v3;
}

- (id)clusterThemeDisplays
{
  v2 = [(DBSessionController *)self themeController];
  uint64_t v3 = [v2 displays];

  return v3;
}

- (id)assetBaseURL
{
  v2 = [(DBSessionController *)self currentThemeAsset];
  uint64_t v3 = [v2 layoutURL];

  if (v3) {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08B18]) initWithURL:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)extraAssetsURL
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = DBLogForCategory(8uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [(DBSessionController *)self themeController];
    int v5 = [(DBSessionController *)self themeController];
    uint64_t v6 = [v5 extraAssetsURL];
    int v16 = 138412546;
    char v17 = v4;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_INFO, "controller=%@ extraAssetsURL=%@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v7 = [(DBSessionController *)self themeController];
  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [(DBSessionController *)self themeController];
  unint64_t v10 = [v9 extraAssetsURL];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F08B18]);
    id v12 = [(DBSessionController *)self themeController];
    uint64_t v13 = [v12 extraAssetsURL];
    int v14 = (void *)[v11 initWithURL:v13 readonly:1];
  }
  else
  {
LABEL_6:
    int v14 = 0;
  }
  return v14;
}

- (unint64_t)assetVersion
{
  v2 = [(DBSessionController *)self themeController];
  unint64_t v3 = [v2 assetVersion];

  return v3;
}

- (id)getURLForAssetWithIdentifier:(id)a3 displayID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(DBSessionController *)self themeController];
  uint64_t v9 = [v8 urlFor:v7 displayID:v6];

  if (v9) {
    unint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F08B18]) initWithURL:v9 readonly:1];
  }
  else {
    unint64_t v10 = 0;
  }

  return v10;
}

- (void)_updateLayerMetadataService
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[DBSessionController _updateLayerMetadataService]";
  _os_log_error_impl(&dword_22D6F0000, log, OS_LOG_TYPE_ERROR, "%s: uisyncChannel and currentSession are nil", (uint8_t *)&v1, 0xCu);
}

- (DBSessionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBSessionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CARSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
}

- (CRVehicle)currentVehicle
{
  return self->_currentVehicle;
}

- (void)setCurrentVehicle:(id)a3
{
}

- (unint64_t)currentSupportedFeatures
{
  return self->_currentSupportedFeatures;
}

- (void)setCurrentSupportedFeatures:(unint64_t)a3
{
  self->_currentSupportedFeatures = a3;
}

- (CARThemeAsset)currentThemeAsset
{
  return self->_currentThemeAsset;
}

- (void)setCurrentThemeAsset:(id)a3
{
}

- (CRSUIClusterThemeService)clusterThemeService
{
  return self->_clusterThemeService;
}

- (void)setClusterThemeService:(id)a3
{
}

- (_TtC9DashBoard17DBThemeController)themeController
{
  return self->_themeController;
}

- (void)setThemeController:(id)a3
{
}

- (DBLayerMetadataService)layerMetadataService
{
  return self->_layerMetadataService;
}

- (void)setLayerMetadataService:(id)a3
{
}

- (DBUISyncChannel)uisyncChannel
{
  return self->_uisyncChannel;
}

- (void)setUisyncChannel:(id)a3
{
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (ResourceHint)powerResourceHint
{
  return self->_powerResourceHint;
}

- (void)setPowerResourceHint:(id)a3
{
}

- (CRFeatureAvailability)featureAvailability
{
  return self->_featureAvailability;
}

- (void)setFeatureAvailability:(id)a3
{
}

- (void)setPairedVehicleManager:(id)a3
{
}

- (OS_dispatch_queue)vehicleUpdateQueue
{
  return self->_vehicleUpdateQueue;
}

- (void)setVehicleUpdateQueue:(id)a3
{
}

- (CARThemeAssetLibrary)themeAssetLibrary
{
  return self->_themeAssetLibrary;
}

- (void)setThemeAssetLibrary:(id)a3
{
}

- (id)pendingConnectCompletion
{
  return self->_pendingConnectCompletion;
}

- (void)setPendingConnectCompletion:(id)a3
{
}

- (BSInvalidatable)clusterThemeServiceDomainActivationToken
{
  return self->_clusterThemeServiceDomainActivationToken;
}

- (void)setClusterThemeServiceDomainActivationToken:(id)a3
{
}

- (NSMutableSet)layerMetadataServiceRequesters
{
  return self->_layerMetadataServiceRequesters;
}

- (void)setLayerMetadataServiceRequesters:(id)a3
{
}

- (unint64_t)cachedSoundRecognitionPreference
{
  return self->_cachedSoundRecognitionPreference;
}

- (void)setCachedSoundRecognitionPreference:(unint64_t)a3
{
  self->_cachedSoundRecognitionPreference = a3;
}

- (int64_t)cachedSoundRecognitionState
{
  return self->_cachedSoundRecognitionState;
}

- (void)setCachedSoundRecognitionState:(int64_t)a3
{
  self->_int64_t cachedSoundRecognitionState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerMetadataServiceRequesters, 0);
  objc_storeStrong((id *)&self->_clusterThemeServiceDomainActivationToken, 0);
  objc_storeStrong(&self->_pendingConnectCompletion, 0);
  objc_storeStrong((id *)&self->_themeAssetLibrary, 0);
  objc_storeStrong((id *)&self->_vehicleUpdateQueue, 0);
  objc_storeStrong((id *)&self->_pairedVehicleManager, 0);
  objc_storeStrong((id *)&self->_featureAvailability, 0);
  objc_storeStrong((id *)&self->_powerResourceHint, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_uisyncChannel, 0);
  objc_storeStrong((id *)&self->_layerMetadataService, 0);
  objc_storeStrong((id *)&self->_themeController, 0);
  objc_storeStrong((id *)&self->_clusterThemeService, 0);
  objc_storeStrong((id *)&self->_currentThemeAsset, 0);
  objc_storeStrong((id *)&self->_currentVehicle, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __68__DBSessionController__updateVehicleAppearancePreferenceIfNecessary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Unable to save vehicle", v2, v3, v4, v5, v6);
}

void __42__DBSessionController__applyAXPreferences__block_invoke_213_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Unable to save theme ax data to vehicle", v2, v3, v4, v5, v6);
}

- (void)_updateVehicleInfo:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 currentSession];
  uint64_t v4 = [v3 MFiCertificateSerialNumber];
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "[DBSessionController] Failed to find a matching vehicle for certificate serial %@", (uint8_t *)&v5, 0xCu);
}

- (void)_handleSessionConnectRequiringThemeAssetWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "[DBSessionController] Unexpected theme asset library at session connect", v2, v3, v4, v5, v6);
}

- (void)_handleSessionConnectWithThemeAsset:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "[DBSessionController] Theme asset does not have a layoutURL", v2, v3, v4, v5, v6);
}

- (void)_handleSessionConnectWithThemeAsset:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "[DBSessionController] Failed to decode document at URL %@", (uint8_t *)&v2, 0xCu);
}

- (void)_handleSessionConnectWithThemeAsset:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "[DBSessionController] Already have a theme asset! Ignoring", v2, v3, v4, v5, v6);
}

void __59__DBSessionController__handleSessionConnectWithThemeAsset___block_invoke_244_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_22D6F0000, v0, v1, "Unable to save theme data to vehicle", v2, v3, v4, v5, v6);
}

void __80__DBSessionController_themeAssetLibrary_failedDownloadOfAssetWithVersion_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "failed download for asset version: %@, error: %@", (uint8_t *)&v4, 0x16u);
}

@end