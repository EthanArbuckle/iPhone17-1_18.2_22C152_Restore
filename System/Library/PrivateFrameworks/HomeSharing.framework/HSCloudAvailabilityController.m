@interface HSCloudAvailabilityController
+ (id)sharedController;
- (BOOL)_hasCellularCapability;
- (BOOL)_hasWiFiCapability;
- (BOOL)_isAutoDownloadOnCellularAllowed;
- (BOOL)_uncachedIsAutoDownloadOnCellularAllowed;
- (BOOL)_uncachedIsShowingAllMusic;
- (BOOL)_uncachedIsShowingAllVideo;
- (BOOL)canShowCloudDownloadButtons;
- (BOOL)canShowCloudMusic;
- (BOOL)canShowCloudVideo;
- (BOOL)hasProperNetworkConditionsToPlayMedia;
- (BOOL)hasProperNetworkConditionsToShowCloudMedia;
- (BOOL)isCellularDataRestricted;
- (BOOL)isCellularDataRestrictedForMusic;
- (BOOL)isCellularDataRestrictedForStoreApps;
- (BOOL)isCellularDataRestrictedForVideos;
- (BOOL)isNetworkReachable;
- (BOOL)shouldProhibitActionsForCurrentNetworkConditions;
- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions;
- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions;
- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions;
- (HSCloudAvailabilityController)init;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_onQueue_updateCanShowCloudDownloadButtonsWithNotification:(BOOL)a3;
- (void)_onQueue_updateCanShowCloudTracksWithNotification:(BOOL)a3;
- (void)_onQueue_updateIsCellularDataRestrictedForMusic;
- (void)_setNewIsNetworkReachable:(BOOL)a3 networkType:(int64_t)a4;
- (void)_wifiStateDidChangeNotification:(id)a3;
- (void)airplaneModeChanged;
- (void)beginObservingNetworkReachability;
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)dealloc;
- (void)endObservingNetworkReachability;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)environmentMonitorDidChangeNetworkType:(id)a3;
@end

@implementation HSCloudAvailabilityController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a5;
  telephonyClient = self->_telephonyClient;
  id v18 = 0;
  id v9 = a3;
  v10 = [(CoreTelephonyClient *)telephonyClient getCurrentDataSubscriptionContextSync:&v18];
  id v11 = v18;
  if (v11)
  {
    v12 = os_log_create("com.apple.amp.HomeSharing", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = v13;
      __int16 v21 = 2048;
      v22 = self;
      __int16 v23 = 2114;
      id v24 = v11;
      _os_log_impl(&dword_2152C7000, v12, OS_LOG_TYPE_DEFAULT, "<%@ %p> Error getting current data context. error=%{public}@", buf, 0x20u);
    }
  }
  v14 = [v10 uuid];
  v15 = [v9 uuid];

  int v16 = [v14 isEqual:v15];
  if (v16)
  {
    BOOL v17 = [v7 state] == 2;
    if (self->_isCellularDataActive != v17)
    {
      self->_isCellularDataActive = v17;
      [(HSCloudAvailabilityController *)self _onQueue_updateCanShowCloudDownloadButtonsWithNotification:1];
      [(HSCloudAvailabilityController *)self _onQueue_updateCanShowCloudTracksWithNotification:1];
    }
  }
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkType___block_invoke;
  v7[3] = &unk_264239E50;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __72__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) networkType];
  if (*(void *)(*(void *)(a1 + 40) + 40) != v2)
  {
    int IsCellular = ICEnvironmentNetworkTypeIsCellular();
    int v4 = ICEnvironmentNetworkTypeIsCellular();
    *(void *)(*(void *)(a1 + 40) + 40) = v2;
    if (IsCellular != v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
      objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateCanShowCloudTracksWithNotification:", 0);
      v5 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __72__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkType___block_invoke_2;
      block[3] = &unk_26423A410;
      block[4] = *(void *)(a1 + 40);
      dispatch_async(v5, block);
    }
  }
}

void __72__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkType___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"HSCloudAvailabilityControllerCanShowCloudTracksDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke;
  v7[3] = &unk_264239E50;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __80__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isRemoteServerLikelyReachable];
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned __int8 *)(v3 + 26) != v2)
  {
    *(unsigned char *)(v3 + 26) = v2;
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke_2;
    block[3] = &unk_26423A410;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(v4, block);
  }
}

void __80__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"HSCloudAvailabilityControllerNetworkReachabilityDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_onQueue_updateCanShowCloudTracksWithNotification:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HSCloudAvailabilityController *)self _hasWiFiCapability]) {
    BOOL isWiFiEnabled = self->_isWiFiEnabled;
  }
  else {
    BOOL isWiFiEnabled = 0;
  }
  if ([(HSCloudAvailabilityController *)self _hasCellularCapability]) {
    BOOL v6 = !self->_isAirplaneModeActive;
  }
  else {
    BOOL v6 = 0;
  }
  if (isWiFiEnabled || v6)
  {
    BOOL isShowingAllMusic = self->_isShowingAllMusic;
    BOOL isShowingAllVideo = self->_isShowingAllVideo;
  }
  else
  {
    BOOL isShowingAllMusic = 0;
    BOOL isShowingAllVideo = 0;
  }
  if (self->_canShowCloudMusic != isShowingAllMusic || self->_canShowCloudVideo != isShowingAllVideo)
  {
    self->_canShowCloudMusic = isShowingAllMusic;
    self->_canShowCloudVideo = isShowingAllVideo;
    if (v3)
    {
      id v9 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __83__HSCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke;
      block[3] = &unk_26423A410;
      block[4] = self;
      dispatch_async(v9, block);
    }
  }
  if (!isWiFiEnabled)
  {
    if (!v6)
    {
      BOOL isCellularDataActive = 0;
      goto LABEL_21;
    }
LABEL_19:
    BOOL isCellularDataActive = self->_isCellularDataActive;
    goto LABEL_21;
  }
  BOOL isCellularDataActive = self->_isWiFiAssociated;
  if (!self->_isWiFiAssociated && v6) {
    goto LABEL_19;
  }
LABEL_21:
  if (self->_hasProperNetworkConditionsToShowCloudMedia != isCellularDataActive)
  {
    self->_hasProperNetworkConditionsToShowCloudMedia = isCellularDataActive;
    if (v3)
    {
      id v11 = dispatch_get_global_queue(0, 0);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __83__HSCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke_2;
      v12[3] = &unk_26423A410;
      v12[4] = self;
      dispatch_async(v11, v12);
    }
  }
}

void __83__HSCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"HSCloudAvailabilityControllerCanShowCloudTracksDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __83__HSCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"HSCloudAvailabilityControllerHasProperNetworkConditionsToShowCloudMediaDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_onQueue_updateCanShowCloudDownloadButtonsWithNotification:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HSCloudAvailabilityController *)self _hasCellularCapability]
    && !self->_isAirplaneModeActive
    && self->_isCellularDataActive)
  {
    BOOL isWiFiEnabled = 1;
  }
  else if ([(HSCloudAvailabilityController *)self _hasWiFiCapability])
  {
    BOOL isWiFiEnabled = self->_isWiFiEnabled;
    if (self->_isWiFiEnabled) {
      BOOL isWiFiEnabled = self->_isWiFiAssociated;
    }
  }
  else
  {
    BOOL isWiFiEnabled = 0;
  }
  if (self->_canShowCloudDownloadButtons != isWiFiEnabled)
  {
    self->_canShowCloudDownloadButtons = isWiFiEnabled;
    if (v3)
    {
      [(HSCloudAvailabilityController *)self _onQueue_updateCanShowCloudTracksWithNotification:1];
    }
  }
}

- (BOOL)_uncachedIsShowingAllVideo
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"VideosShowCloudMediaEnabledSetting", @"com.apple.mobileipod", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (void)_onQueue_updateIsCellularDataRestrictedForMusic
{
  theDict[1] = *(CFDictionaryRef *)MEMORY[0x263EF8340];
  if (self->_ctServerConnection)
  {
    theDict[0] = 0;
    _CTServerConnectionCopyCellularUsagePolicy();
  }
  BOOL v3 = os_log_create("com.apple.amp.HomeSharing", "Availability");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isCellularDataRestrictedForMusic = self->_isCellularDataRestrictedForMusic;
    LODWORD(theDict[0]) = 67109120;
    HIDWORD(theDict[0]) = isCellularDataRestrictedForMusic;
    _os_log_impl(&dword_2152C7000, v3, OS_LOG_TYPE_DEFAULT, "Music restrict cellular data: %d", (uint8_t *)theDict, 8u);
  }
}

- (BOOL)_uncachedIsShowingAllMusic
{
  return 1;
}

- (BOOL)_uncachedIsAutoDownloadOnCellularAllowed
{
  return CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", @"com.apple.itunesstored", 0) != 0;
}

- (void)_setNewIsNetworkReachable:(BOOL)a3 networkType:(int64_t)a4
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HSCloudAvailabilityController__setNewIsNetworkReachable_networkType___block_invoke;
  block[3] = &unk_264239E28;
  BOOL v6 = a3;
  block[4] = self;
  void block[5] = a4;
  dispatch_async(accessQueue, block);
}

void __71__HSCloudAvailabilityController__setNewIsNetworkReachable_networkType___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(a1 + 48);
  if (*(unsigned __int8 *)(v2 + 26) != v3)
  {
    *(unsigned char *)(v2 + 26) = v3;
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__HSCloudAvailabilityController__setNewIsNetworkReachable_networkType___block_invoke_2;
    block[3] = &unk_26423A410;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v4, block);

    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(void *)(v2 + 40) != v5)
  {
    *(void *)(v2 + 40) = v5;
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateCanShowCloudTracksWithNotification:", 0);
    BOOL v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __71__HSCloudAvailabilityController__setNewIsNetworkReachable_networkType___block_invoke_3;
    v7[3] = &unk_26423A410;
    void v7[4] = *(void *)(a1 + 32);
    dispatch_async(v6, v7);
  }
}

void __71__HSCloudAvailabilityController__setNewIsNetworkReachable_networkType___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"HSCloudAvailabilityControllerNetworkReachabilityDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __71__HSCloudAvailabilityController__setNewIsNetworkReachable_networkType___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"HSCloudAvailabilityControllerCanShowCloudTracksDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)_hasWiFiCapability
{
  if (_hasWiFiCapability_wifiOnceToken != -1) {
    dispatch_once(&_hasWiFiCapability_wifiOnceToken, &__block_literal_global_45);
  }
  return _hasWiFiCapability_hasWiFiCapability;
}

void __51__HSCloudAvailabilityController__hasWiFiCapability__block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    CFBooleanRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    BOOL v3 = v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) != 0;
    _hasWiFiCapability_hasWiFiCapability = v3;
    CFRelease(v1);
  }
  else
  {
    _hasWiFiCapability_hasWiFiCapability = 0;
  }
}

- (BOOL)_hasCellularCapability
{
  if (_hasCellularCapability_cellularOnceToken != -1) {
    dispatch_once(&_hasCellularCapability_cellularOnceToken, &__block_literal_global_40);
  }
  return _hasCellularCapability_hasCellularCapability;
}

void __55__HSCloudAvailabilityController__hasCellularCapability__block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    CFBooleanRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    BOOL v3 = v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) != 0;
    _hasCellularCapability_hasCellularCapability = v3;
    CFRelease(v1);
  }
  else
  {
    _hasCellularCapability_hasCellularCapability = 0;
  }
}

- (BOOL)_isAutoDownloadOnCellularAllowed
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__HSCloudAvailabilityController__isAutoDownloadOnCellularAllowed__block_invoke;
  v5[3] = &unk_26423A438;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__HSCloudAvailabilityController__isAutoDownloadOnCellularAllowed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 18);
  return result;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL isCellularDataRestrictedForMusic = self->_isCellularDataRestrictedForMusic;
  telephonyClient = self->_telephonyClient;
  id v13 = 0;
  uint64_t v6 = [(CoreTelephonyClient *)telephonyClient getInternetConnectionStateSync:&v13];
  id v7 = v13;
  if (v7)
  {
    uint64_t v8 = os_log_create("com.apple.amp.HomeSharing", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v7;
      _os_log_impl(&dword_2152C7000, v8, OS_LOG_TYPE_ERROR, "HSCloudAvailabilityController _applicationWillEnterForeground [CoreTelephonyClient getInternetConnectionStateSync] encountered error=%{public}@", buf, 0xCu);
    }

    BOOL v9 = isCellularDataRestrictedForMusic;
  }
  else
  {
    BOOL v9 = [v6 state] == 2;
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__HSCloudAvailabilityController__applicationWillEnterForeground___block_invoke;
  block[3] = &unk_264239DD8;
  block[4] = self;
  BOOL v12 = v9;
  dispatch_async(accessQueue, block);
}

uint64_t __65__HSCloudAvailabilityController__applicationWillEnterForeground___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 19) != v2)
  {
    *(unsigned char *)(v1 + 19) = v2;
    return objc_msgSend(*(id *)(result + 32), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
  }
  return result;
}

- (void)_wifiStateDidChangeNotification:(id)a3
{
  id v4 = +[HSWiFiManager sharedWiFiManager];
  char v5 = [v4 isWiFiEnabled];

  uint64_t v6 = +[HSWiFiManager sharedWiFiManager];
  char v7 = [v6 isWiFiAssociated];

  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__HSCloudAvailabilityController__wifiStateDidChangeNotification___block_invoke;
  v9[3] = &unk_264239E00;
  v9[4] = self;
  char v10 = v5;
  char v11 = v7;
  dispatch_async(accessQueue, v9);
}

uint64_t __65__HSCloudAvailabilityController__wifiStateDidChangeNotification___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  int v3 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v2 + 24) != v3 || *(unsigned __int8 *)(v2 + 25) != *(unsigned __int8 *)(result + 41))
  {
    *(unsigned char *)(v2 + 24) = v3;
    *(unsigned char *)(*(void *)(result + 32) + 25) = *(unsigned char *)(result + 41);
    objc_msgSend(*(id *)(result + 32), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
    id v4 = *(void **)(v1 + 32);
    return objc_msgSend(v4, "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
  }
  return result;
}

- (void)airplaneModeChanged
{
  char v3 = [(RadiosPreferences *)self->_radiosPreferences airplaneMode];
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__HSCloudAvailabilityController_airplaneModeChanged__block_invoke;
  v5[3] = &unk_264239DD8;
  v5[4] = self;
  char v6 = v3;
  dispatch_async(accessQueue, v5);
}

uint64_t __52__HSCloudAvailabilityController_airplaneModeChanged__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 17) != v2)
  {
    *(unsigned char *)(v1 + 17) = v2;
    return objc_msgSend(*(id *)(result + 32), "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
  }
  return result;
}

- (void)endObservingNetworkReachability
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HSCloudAvailabilityController_endObservingNetworkReachability__block_invoke;
  block[3] = &unk_26423A410;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

void *__64__HSCloudAvailabilityController_endObservingNetworkReachability__block_invoke(void *result)
{
  uint64_t v1 = result[4];
  uint64_t v2 = *(void *)(v1 + 56);
  if (v2)
  {
    *(void *)(v1 + 56) = v2 - 1;
    result = (void *)result[4];
    if (!result[7]) {
      return objc_msgSend(result, "_onQueue_endObservingReachabilityChanges");
    }
  }
  return result;
}

- (void)beginObservingNetworkReachability
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__HSCloudAvailabilityController_beginObservingNetworkReachability__block_invoke;
  block[3] = &unk_26423A410;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

void *__66__HSCloudAvailabilityController_beginObservingNetworkReachability__block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 56);
  result = *(void **)(a1 + 32);
  if (result[7] == 1) {
    return objc_msgSend(result, "_onQueue_beginObservingReachabilityChanges");
  }
  return result;
}

- (BOOL)isNetworkReachable
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__HSCloudAvailabilityController_isNetworkReachable__block_invoke;
  v5[3] = &unk_26423A438;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__HSCloudAvailabilityController_isNetworkReachable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 26);
  return result;
}

- (BOOL)shouldProhibitActionsForCurrentNetworkConditions
{
  if (self->_isNetworkReachable)
  {
    int IsCellular = ICEnvironmentNetworkTypeIsCellular();
    if (IsCellular)
    {
      LOBYTE(IsCellular) = [(HSCloudAvailabilityController *)self _isAutoDownloadOnCellularAllowed];
    }
  }
  else
  {
    LOBYTE(IsCellular) = 1;
  }
  return IsCellular;
}

- (BOOL)isCellularDataRestricted
{
  return ![(HSCloudAvailabilityController *)self _isAutoDownloadOnCellularAllowed];
}

- (BOOL)canShowCloudVideo
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__HSCloudAvailabilityController_canShowCloudVideo__block_invoke;
  v5[3] = &unk_26423A438;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__HSCloudAvailabilityController_canShowCloudVideo__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 28);
  return result;
}

- (BOOL)canShowCloudMusic
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__HSCloudAvailabilityController_canShowCloudMusic__block_invoke;
  v5[3] = &unk_26423A438;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__HSCloudAvailabilityController_canShowCloudMusic__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 27);
  return result;
}

- (BOOL)canShowCloudDownloadButtons
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__HSCloudAvailabilityController_canShowCloudDownloadButtons__block_invoke;
  v5[3] = &unk_26423A438;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__HSCloudAvailabilityController_canShowCloudDownloadButtons__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 29);
  return result;
}

- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions
{
  if (self->_isNetworkReachable)
  {
    int IsCellular = ICEnvironmentNetworkTypeIsCellular();
    if (IsCellular)
    {
      LOBYTE(IsCellular) = [(HSCloudAvailabilityController *)self isCellularDataRestrictedForStoreApps];
    }
  }
  else
  {
    LOBYTE(IsCellular) = 1;
  }
  return IsCellular;
}

- (BOOL)isCellularDataRestrictedForStoreApps
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = os_log_create("com.apple.amp.HomeSharing", "Availability");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = 1;
    _os_log_impl(&dword_2152C7000, v2, OS_LOG_TYPE_DEFAULT, "StoreApps allow cellular data: %d", (uint8_t *)v4, 8u);
  }

  return 0;
}

- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions
{
  if (self->_isNetworkReachable)
  {
    int IsCellular = ICEnvironmentNetworkTypeIsCellular();
    if (IsCellular)
    {
      LOBYTE(IsCellular) = [(HSCloudAvailabilityController *)self isCellularDataRestrictedForVideos];
    }
  }
  else
  {
    LOBYTE(IsCellular) = 1;
  }
  return IsCellular;
}

- (BOOL)isCellularDataRestrictedForVideos
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v2 = [(HSCloudAvailabilityController *)self _isAutoDownloadOnCellularAllowed];
  char v3 = os_log_create("com.apple.amp.HomeSharing", "Availability");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_2152C7000, v3, OS_LOG_TYPE_DEFAULT, "Videos allow cellular data: %d", (uint8_t *)v5, 8u);
  }

  return !v2;
}

- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions
{
  if (self->_isNetworkReachable)
  {
    int IsCellular = ICEnvironmentNetworkTypeIsCellular();
    if (IsCellular)
    {
      LOBYTE(IsCellular) = [(HSCloudAvailabilityController *)self isCellularDataRestrictedForMusic];
    }
  }
  else
  {
    LOBYTE(IsCellular) = 1;
  }
  return IsCellular;
}

- (BOOL)isCellularDataRestrictedForMusic
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __65__HSCloudAvailabilityController_isCellularDataRestrictedForMusic__block_invoke;
  v5[3] = &unk_26423A438;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__HSCloudAvailabilityController_isCellularDataRestrictedForMusic__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 20);
  return result;
}

- (BOOL)hasProperNetworkConditionsToShowCloudMedia
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __75__HSCloudAvailabilityController_hasProperNetworkConditionsToShowCloudMedia__block_invoke;
  v5[3] = &unk_26423A438;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __75__HSCloudAvailabilityController_hasProperNetworkConditionsToShowCloudMedia__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (BOOL)hasProperNetworkConditionsToPlayMedia
{
  if (!self->_isNetworkReachable) {
    return 0;
  }
  if (ICEnvironmentNetworkTypeIsCellular()) {
    return self->_isAutoDownloadOnCellularAllowed;
  }
  return 1;
}

- (void)dealloc
{
  [(CoreTelephonyClient *)self->_telephonyClient setDelegate:0];
  [(RadiosPreferences *)self->_radiosPreferences setDelegate:0];
  char v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"UIApplicationWillEnterForegroundNotification" object:0];

  if (self->_preferencesChangedNotifyTokenIsValid) {
    notify_cancel(self->_preferencesChangedNotifyToken);
  }
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = +[HSWiFiManager sharedWiFiManager];
  [v4 removeObserver:self name:@"HSWiFiManagerWiFiDidChangeNotification" object:v5];

  if (self->_ctServerConnection)
  {
    _CTServerConnectionUnregisterForNotification();
    CFRelease(self->_ctServerConnection);
  }
  v6.receiver = self;
  v6.super_class = (Class)HSCloudAvailabilityController;
  [(HSCloudAvailabilityController *)&v6 dealloc];
}

- (HSCloudAvailabilityController)init
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)HSCloudAvailabilityController;
  BOOL v2 = [(HSCloudAvailabilityController *)&v34 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.HomeSharing.HSCloudAvailabilityController.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x263F255D8]);
    radiosPreferences = v2->_radiosPreferences;
    v2->_radiosPreferences = v5;

    [(RadiosPreferences *)v2->_radiosPreferences setDelegate:v2];
    v2->_isAirplaneModeActive = [(RadiosPreferences *)v2->_radiosPreferences airplaneMode];
    v2->_isAutoDownloadOnCellularAllowed = [(HSCloudAvailabilityController *)v2 _uncachedIsAutoDownloadOnCellularAllowed];
    v2->_BOOL isShowingAllMusic = [(HSCloudAvailabilityController *)v2 _uncachedIsShowingAllMusic];
    v2->_BOOL isShowingAllVideo = [(HSCloudAvailabilityController *)v2 _uncachedIsShowingAllVideo];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v2->_accessQueue];
    telephonyClient = v2->_telephonyClient;
    v2->_telephonyClient = (CoreTelephonyClient *)v7;

    char v9 = v2->_telephonyClient;
    id v33 = 0;
    char v10 = [(CoreTelephonyClient *)v9 getInternetConnectionStateSync:&v33];
    id v11 = v33;
    if (v11)
    {
      BOOL v12 = os_log_create("com.apple.amp.HomeSharing", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_2152C7000, v12, OS_LOG_TYPE_ERROR, "HSCloudAvailabilityController init [CoreTelephonyClient getInternetConnectionStateSync] encountered error=%{public}@", (uint8_t *)&buf, 0xCu);
      }

      v2->_BOOL isCellularDataActive = 0;
    }
    else
    {
      v2->_BOOL isCellularDataActive = [v10 state] == 2;
    }
    [(CoreTelephonyClient *)v2->_telephonyClient setDelegate:v2];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__761;
    v42 = __Block_byref_object_dispose__762;
    id v13 = v2;
    v43 = v13;
    v14 = v2->_accessQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __37__HSCloudAvailabilityController_init__block_invoke;
    handler[3] = &unk_264239D88;
    handler[4] = &buf;
    v13->_preferencesChangedNotifyTokenIsValid = notify_register_dispatch("com.apple.mobileipod-prefsChanged", &v13->_preferencesChangedNotifyToken, v14, handler) == 0;
    id v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v13 selector:sel__applicationWillEnterForeground_ name:@"UIApplicationWillEnterForegroundNotification" object:0];

    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = __37__HSCloudAvailabilityController_init__block_invoke_2;
    v30 = &unk_264239DB0;
    p_long long buf = &buf;
    v13->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
    uint64_t v16 = _CTServerConnectionRegisterForNotification();
    if (v16)
    {
      BOOL v17 = os_log_create("com.apple.amp.HomeSharing", "Availability");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v35 = 67109376;
        int v36 = v16;
        __int16 v37 = 1024;
        int v38 = HIDWORD(v16);
        _os_log_impl(&dword_2152C7000, v17, OS_LOG_TYPE_ERROR, "Error (domain %d, code %d) registering for PerAppNetworkDataAccessPolicyChangedNotification", v35, 0xEu);
      }
    }
    id v18 = +[HSWiFiManager sharedWiFiManager];
    v13->_BOOL isWiFiEnabled = [v18 isWiFiEnabled];

    v19 = +[HSWiFiManager sharedWiFiManager];
    v13->_isWiFiAssociated = [v19 isWiFiAssociated];

    uint64_t v20 = [MEMORY[0x263F08A00] defaultCenter];
    __int16 v21 = +[HSWiFiManager sharedWiFiManager];
    [v20 addObserver:v13 selector:sel__wifiStateDidChangeNotification_ name:@"HSWiFiManagerWiFiDidChangeNotification" object:v21];

    v22 = [MEMORY[0x263F89110] sharedMonitor];
    [v22 registerObserver:v13];
    v13->_isNetworkReachable = [v22 isRemoteServerLikelyReachable];
    v13->_networkType = [v22 networkType];
    v13->_networkReachabilityObservationCount = 0;
    [(HSCloudAvailabilityController *)v13 _onQueue_updateCanShowCloudDownloadButtonsWithNotification:0];
    [(HSCloudAvailabilityController *)v13 _onQueue_updateCanShowCloudTracksWithNotification:0];
    v13->_BOOL isCellularDataRestrictedForMusic = 1;
    __int16 v23 = v2->_accessQueue;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __37__HSCloudAvailabilityController_init__block_invoke_36;
    v25[3] = &unk_26423A410;
    v26 = v13;
    dispatch_async(v23, v25);

    _Block_object_dispose(&buf, 8);
  }
  return v2;
}

uint64_t __37__HSCloudAvailabilityController_init__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    uint64_t v5 = v1;
    CFPreferencesAppSynchronize(@"com.apple.mobileipod");
    int v2 = [v5 _uncachedIsShowingAllMusic];
    int v3 = [v5 _uncachedIsShowingAllVideo];
    if (v5[21] != v2 || v5[22] != v3)
    {
      v5[21] = v2;
      v5[22] = v3;
      objc_msgSend(v5, "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
      objc_msgSend(v5, "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
    }
  }
  return MEMORY[0x270F9A758]();
}

void __37__HSCloudAvailabilityController_init__block_invoke_2(uint64_t a1, const __CFString *a2)
{
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (CFEqual(a2, (CFStringRef)*MEMORY[0x263F02E80])) {
    objc_msgSend(v3, "_onQueue_updateIsCellularDataRestrictedForMusic");
  }
}

uint64_t __37__HSCloudAvailabilityController_init__block_invoke_36(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateIsCellularDataRestrictedForMusic");
}

+ (id)sharedController
{
  if (sharedController___once != -1) {
    dispatch_once(&sharedController___once, &__block_literal_global);
  }
  int v2 = (void *)sharedController___sharedController;
  return v2;
}

uint64_t __49__HSCloudAvailabilityController_sharedController__block_invoke()
{
  sharedController___sharedController = objc_alloc_init(HSCloudAvailabilityController);
  return MEMORY[0x270F9A758]();
}

@end