@interface ACCMediaLibraryShim
+ (BOOL)allowCachedTracksForAppleMusic;
+ (BOOL)isMusicAppVisible;
- (ACCMediaLibraryAccessory)accessory;
- (ACCMediaLibraryShim)initWithAccessory:(id)a3 windowPerLibrary:(unsigned int)a4 delegate:(id)a5;
- (ACCMediaLibraryShimDelegate)delegate;
- (ACCMediaLibraryShimInfo)deviceLibrary;
- (ACCMediaLibraryShimInfo)radioLibrary;
- (ACCMemUsageStat)memUse;
- (ACCSettingsState)measureMemoryUsage;
- (BOOL)_checkForDifferentMediaLibraries;
- (BOOL)_checkForDifferentRadioLibrary;
- (BOOL)isGeniusMixesSupported;
- (BOOL)isShuttingDown;
- (BOOL)isSubscribedToAppleMusic;
- (BOOL)radioIsEnabled;
- (BOOL)subscribedToAppleMusic;
- (NSMutableDictionary)libraryList;
- (OS_dispatch_queue)libraryInfoUpdateQ;
- (id)description;
- (unsigned)windowPerLibrary;
- (void)_handlMediaLibraryNeedFilterChange:(id)a3;
- (void)_handleSubscribedToAppleMusicChanged:(id)a3;
- (void)_mediaLibrariesAvailableChanged:(id)a3;
- (void)_sendLibraryInfoList;
- (void)_setupNewLibraries:(id)a3 forAccessory:(id)a4;
- (void)_updateMediaLibraryInfomationUpdates:(BOOL)a3;
- (void)_updateSubscribedToAppleMusicStatus:(BOOL)a3;
- (void)confirmMediaLibraryPlaylistContentUpdate:(id)a3 lastRevision:(id)a4;
- (void)confirmMediaLibraryUpdate:(id)a3 lastRevision:(id)a4 updateCount:(unsigned int)a5;
- (void)dealloc;
- (void)playAllSongs:(id)a3;
- (void)playAllSongs:(id)a3 firstItemPersistentID:(unint64_t)a4;
- (void)playMediaLibraryCollection:(id)a3 collection:(unint64_t)a4 type:(int)a5 firstItemIndex:(unint64_t)a6;
- (void)playMediaLibraryCollection:(id)a3 collection:(unint64_t)a4 type:(int)a5 firstItemPersistentID:(unint64_t)a6;
- (void)playMediaLibraryCurrentSelection:(id)a3;
- (void)playMediaLibraryItems:(id)a3 itemList:(id)a4 firstItemIndex:(unint64_t)a5;
- (void)setIsSubscribedToAppleMusic:(BOOL)a3;
- (void)setMeasureMemoryUsage:(id)a3;
- (void)setWindowPerLibrary:(unsigned int)a3;
- (void)shuttingDown;
- (void)startMediaLibraryUpdate:(id)a3 lastRevision:(id)a4 requestedInfo:(id)a5;
- (void)startSendingMediaLibraryInfomationUpdates;
- (void)startShimForAccessoryAttach:(id)a3;
- (void)stopAllMediaLibraryUpdate;
- (void)stopMediaLibraryUpdate:(id)a3;
- (void)stopSendingMediaLibraryInfomationUpdates;
@end

@implementation ACCMediaLibraryShim

+ (BOOL)allowCachedTracksForAppleMusic
{
  int AppBooleanValue = __allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting;
  if (__allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting == -1)
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"allowCachedTracksForAppleMusic", @"com.apple.iapd", 0);
    __allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting = AppBooleanValue;
  }
  return AppBooleanValue != 0;
}

+ (BOOL)isMusicAppVisible
{
  v2 = GetMediaLibraryHelper();
  char v3 = [v2 showMusic];

  return v3;
}

- (void)_updateSubscribedToAppleMusicStatus:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!self->_isShuttingDown && self->_enableLibraryInfoUpdate)
  {
    BOOL v4 = a3;
    int AppBooleanValue = __allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting;
    if (__allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting == -1)
    {
      int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"allowCachedTracksForAppleMusic", @"com.apple.iapd", 0);
      __allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting = AppBooleanValue;
    }
    if (AppBooleanValue)
    {
      if (__mlForceAppleMusicSubscribedState == 1)
      {
        char v6 = 0;
      }
      else
      {
        if (__mlForceAppleMusicSubscribedState != 2)
        {
          if (v4) {

          }
          char v6 = 0;
          uint64_t v7 = 36;
          goto LABEL_15;
        }
        char v6 = 1;
      }
      uint64_t v7 = 35;
LABEL_15:
      *((unsigned char *)&self->super.isa + v7) = v6;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        v8 = MEMORY[0x263EF8438];
        id v9 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        BOOL subscribedToAppleMusic = self->_subscribedToAppleMusic;
        v11[0] = 67109376;
        v11[1] = __mlForceAppleMusicSubscribedState;
        __int16 v12 = 1024;
        BOOL v13 = subscribedToAppleMusic;
        _os_log_impl(&dword_2269CB000, v8, OS_LOG_TYPE_DEFAULT, "_updateSubscribedToAppleMusicStatus: __mlForceAppleMusicSubscribedState=%d _subscribedToAppleMusic=%d", (uint8_t *)v11, 0xEu);
      }
    }
  }
}

- (void)_handleSubscribedToAppleMusicChanged:(id)a3
{
}

- (void)_mediaLibrariesAvailableChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    uint64_t v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_INFO, "_mediaLibrariesAvailableChanged: notification=%@", buf, 0xCu);
  }

  if (self->_enableLibraryInfoUpdate && !self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__ACCMediaLibraryShim__mediaLibrariesAvailableChanged___block_invoke;
    block[3] = &unk_2647C02E8;
    block[4] = self;
    dispatch_async(libraryInfoUpdateQ, block);
  }
}

unsigned char *__55__ACCMediaLibraryShim__mediaLibrariesAvailableChanged___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[32])
  {
    if (!result[33]) {
      return (unsigned char *)[result _updateMediaLibraryInfomationUpdates:0];
    }
  }
  return result;
}

- (void)_handlMediaLibraryNeedFilterChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    uint64_t v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_INFO, "_handlMediaLibraryNeedFilterChange: notification=%@", (uint8_t *)&v8, 0xCu);
  }

  [(ACCMediaLibraryShim *)self _mediaLibrariesAvailableChanged:0];
}

- (void)_setupNewLibraries:(id)a3 forAccessory:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v43 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    id v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL enableLibraryInfoUpdate = self->_enableLibraryInfoUpdate;
    BOOL isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 67109890;
    BOOL v51 = enableLibraryInfoUpdate;
    __int16 v52 = 1024;
    BOOL v53 = isShuttingDown;
    __int16 v54 = 2112;
    id v55 = v6;
    __int16 v56 = 2112;
    id v57 = v43;
    _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_INFO, "_setupNewLibraries: _enableLibraryInfoUpdate=%d _isShuttingDown=%d oldLibraryList=%@ accessory=%@", buf, 0x22u);
  }

  if (self->_enableLibraryInfoUpdate && !self->_isShuttingDown)
  {
    uint64_t v12 = [MEMORY[0x263F11E40] mediaLibraries];
    id v44 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    BOOL v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    libraryList = self->_libraryList;
    self->_libraryList = v13;

    int v15 = [(ACCMediaLibraryShim *)self subscribedToAppleMusic];
    deviceLibrary = self->_deviceLibrary;
    self->_deviceLibrary = 0;

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      v17 = MEMORY[0x263EF8438];
      id v18 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[ACCMediaLibraryShim _setupNewLibraries:forAccessory:]((uint64_t)self, (uint64_t)v12, v17);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v12;
    uint64_t v19 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v46 != v21) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v24 = ACCMediaLibraryShimUIDString(v23, v15);
          v25 = ACCMediaLibraryShimUIDString(self->_deviceMediaLibrary, v15);
          int v26 = [v24 isEqualToString:v25];

          if (!v6
            || ([v6 objectForKey:v24],
                (v27 = (ACCMediaLibraryShimInfo *)objc_claimAutoreleasedReturnValue()) == 0))
          {
            v27 = [[ACCMediaLibraryShimInfo alloc] initWithMediaLibrary:v23 accessory:v43 Context:self LibraryType:v26 ^ 1u];
          }
          [v44 setObject:v23 forKey:v24];
          if (v26) {
            objc_storeStrong((id *)&self->_deviceLibrary, v27);
          }
          [(NSMutableDictionary *)self->_libraryList setObject:v27 forKey:v24];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v20);
    }

    radioLibrary = self->_radioLibrary;
    if (radioLibrary)
    {
      unint64_t v29 = 0x26ABFC000;
      unint64_t v30 = 0x26ABFC000;
      if (self->_radioIsEnabled)
      {
LABEL_40:
        p_libraries = &self->_libraries;
        libraries = self->_libraries;
        if (libraries)
        {
          *p_libraries = 0;
        }
        if (self->_enableLibraryInfoUpdate)
        {
          uint64_t v37 = [NSDictionary dictionaryWithDictionary:v44];
          v38 = *p_libraries;
          *p_libraries = (NSDictionary *)v37;
        }
        v39 = *(id **)(v29 + 2608);
        if (v39 && *(int *)(v30 + 2616) >= 1)
        {
          v40 = *v39;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCMediaLibraryShimInfo _getUIDString]();
          }
          v40 = MEMORY[0x263EF8438];
          id v41 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
          -[ACCMediaLibraryShim _setupNewLibraries:forAccessory:]();
        }

        goto LABEL_53;
      }
      self->_radioLibrary = 0;
    }
    else
    {
      unint64_t v29 = 0x26ABFC000uLL;
      unint64_t v30 = 0x26ABFC000uLL;
      if (!self->_mpRadioLibrary || !self->_radioIsEnabled) {
        goto LABEL_40;
      }
      v31 = [[ACCMediaLibraryShimInfo alloc] initWithMediaLibrary:self->_mpRadioLibrary accessory:v43 Context:self LibraryType:2];
      v32 = self->_radioLibrary;
      self->_radioLibrary = v31;

      v33 = self->_libraryList;
      v34 = self->_radioLibrary;
      radioLibrary = [(ACCMediaLibraryShimInfo *)v34 UIDString];
      [(NSMutableDictionary *)v33 setObject:v34 forKey:radioLibrary];
    }

    goto LABEL_40;
  }
LABEL_53:
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ACCMediaLibraryShim>[\naccessory=%@\n    _libraryInfoUpdateQ=%@\n    _libraryList=%@\n    _libraries=%@\n    _deviceMediaLibrary=%@\n    _deviceLibrary=%@\n    _enableLibraryInfoUpdate=%d\n    _radioIsEnabled=%d]", self->_accessory, self->_libraryInfoUpdateQ, self->_libraryList, self->_libraries, self->_deviceMediaLibrary, self->_deviceLibrary, self->_enableLibraryInfoUpdate, self->_radioIsEnabled];
}

- (ACCMediaLibraryShim)initWithAccessory:(id)a3 windowPerLibrary:(unsigned int)a4 delegate:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    BOOL v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v40 = v9;
    __int16 v41 = 1024;
    unsigned int v42 = a4;
    __int16 v43 = 2112;
    id v44 = v10;
    _os_log_impl(&dword_2269CB000, v13, OS_LOG_TYPE_INFO, "ACCMediaLibraryShim  initWithAccessory: %@ windowPerLibrary: %u delegate: %@", buf, 0x1Cu);
  }

  v38.receiver = self;
  v38.super_class = (Class)ACCMediaLibraryShim;
  uint64_t v14 = [(ACCMediaLibraryShim *)&v38 init];
  if (v14)
  {
    int v15 = [[ACCSettingsState alloc] initWithKey:@"MeasureMemoryUsage" applicationID:@"com.apple.iapd" notification:@"com.apple.iapd.LoggingPreferencesChangedNotification" defaultValue:0 invalidValue:-1];
    measureMemoryUsage = v14->_measureMemoryUsage;
    v14->_measureMemoryUsage = v15;

    id v17 = GetMediaLibraryHelper();
    if (__mlForceAppleMusicSubscribedState == -1) {
      __mlForceAppleMusicSubscribedState = CFPreferencesGetAppIntegerValue(@"ACCForceAppleMusicSubscribedState", @"com.apple.iapd", 0);
    }
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.accml.mediaLibraryInfoQ", 0);
    libraryInfoUpdateQ = v14->_libraryInfoUpdateQ;
    v14->_libraryInfoUpdateQ = (OS_dispatch_queue *)v18;

    v14->_BOOL enableLibraryInfoUpdate = 0;
    objc_storeStrong((id *)&v14->_accessory, a3);
    v14->_BOOL isShuttingDown = 0;
    deviceLibrary = v14->_deviceLibrary;
    v14->_deviceLibrary = 0;

    radioLibrary = v14->_radioLibrary;
    v14->_radioLibrary = 0;

    v14->_windowPerLibrary = a4;
    libraries = v14->_libraries;
    v14->_libraries = 0;

    libraryList = v14->_libraryList;
    v14->_libraryList = 0;

    objc_storeWeak((id *)&v14->_delegate, v10);
    memUse = v14->_memUse;
    v14->_memUse = 0;

    if ([(ACCSettingsState *)v14->_measureMemoryUsage BOOLValue])
    {
      v25 = [[ACCMemUsageStat alloc] initWithName:@"ACCMediaLibraryUpdate"];
      int v26 = v14->_memUse;
      v14->_memUse = v25;
    }
    v27 = (void *)MEMORY[0x263F11E40];
    v28 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v27 setRunLoopForNotifications:v28];

    [MEMORY[0x263F11E68] setFilteringDisabled:1];
    unint64_t v29 = [MEMORY[0x263F11E60] predicateWithValue:&unk_26DA86F90 forProperty:*MEMORY[0x263F11358]];
    unint64_t v30 = [MEMORY[0x263F11E40] defaultMediaLibrary];
    [v30 addLibraryFilterPredicate:v29];

    uint64_t v31 = [MEMORY[0x263F11E40] deviceMediaLibrary];
    deviceMediaLibrary = v14->_deviceMediaLibrary;
    v14->_deviceMediaLibrary = (MPMediaLibrary *)v31;

    uint64_t v33 = [MEMORY[0x263F12198] defaultRadioLibrary];
    mpRadioLibrary = v14->_mpRadioLibrary;
    v14->_mpRadioLibrary = (MPRadioLibrary *)v33;

    v35 = GetMediaLibraryHelper();
    v14->_radioIsEnabled = [v35 iTunesRadioEnabled];

    v14->_BOOL subscribedToAppleMusic = 0;
    [(ACCMediaLibraryShim *)v14 _updateSubscribedToAppleMusicStatus:1];
    v36 = [MEMORY[0x263F08A00] defaultCenter];
    [v36 addObserver:v14 selector:sel__mediaLibrariesAvailableChanged_ name:*MEMORY[0x263F11408] object:0];
    if (__allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting == -1) {
      __allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting = CFPreferencesGetAppBooleanValue(@"allowCachedTracksForAppleMusic", @"com.apple.iapd", 0);
    }
    [v36 addObserver:v14 selector:sel__mediaLibrariesAvailableChanged_ name:*MEMORY[0x263F11C58] object:0];
    [v36 addObserver:v14 selector:sel__handlMediaLibraryNeedFilterChange_ name:kMediaLibraryNeedFilterChange object:0];
  }
  return v14;
}

- (void)startShimForAccessoryAttach:(id)a3
{
  id v4 = a3;
  libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__ACCMediaLibraryShim_startShimForAccessoryAttach___block_invoke;
  v7[3] = &unk_2647C0298;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(libraryInfoUpdateQ, v7);
}

uint64_t __51__ACCMediaLibraryShim_startShimForAccessoryAttach___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupNewLibraries:0 forAccessory:*(void *)(a1 + 40)];
}

- (void)shuttingDown
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    BOOL v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    libraries = self->_libraries;
    libraryList = self->_libraryList;
    *(_DWORD *)buf = 138412546;
    long long v47 = libraries;
    __int16 v48 = 2112;
    v49 = libraryList;
    _os_log_impl(&dword_2269CB000, v5, OS_LOG_TYPE_INFO, "ACCMediaLibraryShim shuttingDown: _libraries=%@  _libraryList=%@", buf, 0x16u);
  }

  *(_WORD *)&self->_BOOL enableLibraryInfoUpdate = 256;
  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 removeObserver:self];
  libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__ACCMediaLibraryShim_shuttingDown__block_invoke;
  block[3] = &unk_2647C02E8;
  block[4] = self;
  dispatch_async(libraryInfoUpdateQ, block);
  if ([(ACCSettingsState *)self->_measureMemoryUsage BOOLValue])
  {
    memUse = self->_memUse;
    if (memUse)
    {
      [(ACCMemUsageStat *)memUse update];
      uint64_t v37 = v8;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        BOOL v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        BOOL v11 = MEMORY[0x263EF8438];
        id v12 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = [(ACCMediaLibraryAccessory *)self->_accessory accessoryUID];
        uint64_t v14 = [MEMORY[0x263EFF910] date];
        int v15 = [(ACCMemUsageStat *)self->_memUse statInfo];
        v16 = [v15 startTime];
        [v14 timeIntervalSinceDate:v16];
        id v17 = self->_memUse;
        *(_DWORD *)buf = 138412802;
        long long v47 = v13;
        __int16 v48 = 2048;
        v49 = v18;
        __int16 v50 = 2112;
        uint64_t v51 = (uint64_t)v17;
        _os_log_impl(&dword_2269CB000, v11, OS_LOG_TYPE_DEFAULT, "shuttingDown: %@, Finished after %f sec, memUse:\n%@", buf, 0x20u);
      }
      uint64_t v19 = [(ACCMemUsageStat *)self->_memUse markList];
      uint64_t v38 = [v19 count];

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v39 = self;
      uint64_t v20 = [(ACCMemUsageStat *)self->_memUse markList];
      uint64_t v21 = [v20 allValues];

      id obj = v21;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v54 count:16];
      unint64_t v23 = 0x26ABFC000uLL;
      if (v22)
      {
        uint64_t v24 = v22;
        uint64_t v25 = 0;
        uint64_t v26 = *(void *)v42;
        v27 = MEMORY[0x263EF8438];
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v42 != v26) {
              objc_enumerationMutation(obj);
            }
            uint64_t v29 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            unint64_t v30 = *(id **)(v23 + 2608);
            int v31 = gNumLogObjects;
            if (v30) {
              BOOL v32 = gNumLogObjects < 1;
            }
            else {
              BOOL v32 = 1;
            }
            if (v32)
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                long long v47 = (NSDictionary *)v30;
                __int16 v48 = 1024;
                LODWORD(v49) = v31;
                _os_log_error_impl(&dword_2269CB000, v27, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              uint64_t v33 = v27;
              v34 = v27;
            }
            else
            {
              v34 = *v30;
            }
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              v35 = [(ACCMediaLibraryAccessory *)v39->_accessory accessoryUID];
              *(_DWORD *)buf = 138413058;
              long long v47 = v35;
              __int16 v48 = 2048;
              v49 = (NSMutableDictionary *)(v25 + i);
              unint64_t v23 = 0x26ABFC000;
              __int16 v50 = 2048;
              uint64_t v51 = v38;
              __int16 v52 = 2112;
              uint64_t v53 = v29;
              _os_log_impl(&dword_2269CB000, v34, OS_LOG_TYPE_DEFAULT, "shuttingDown: %@, mark: %lu / %lu \n%@", buf, 0x2Au);
            }
          }
          uint64_t v24 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
          v25 += i;
        }
        while (v24);
      }

      self = v39;
      id v8 = v37;
    }
  }
  accessory = self->_accessory;
  self->_accessory = 0;
}

void __35__ACCMediaLibraryShim_shuttingDown__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 64);
  if (v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = objc_msgSend(v3, "allValues", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v8++) shuttingDown];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }

    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 64);
    *(void *)(v9 + 64) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeWeak((id *)(v2 + 88), 0);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 80);
  *(void *)(v11 + 80) = 0;

  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 72);
  *(void *)(v13 + 72) = 0;
}

- (void)dealloc
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_2269CB000, v0, OS_LOG_TYPE_DEBUG, "ACCMediaLibraryShim dealloc: _libraries=%@  _libraryList=%@", v1, 0x16u);
}

void __30__ACCMediaLibraryShim_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 64);
  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = objc_msgSend(v3, "allValues", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v8++) shuttingDown];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 64);
    *(void *)(v9 + 64) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v11 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0;

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 72);
  *(void *)(v12 + 72) = 0;
}

- (BOOL)_checkForDifferentMediaLibraries
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!self->_libraries) {
    return 1;
  }
  BOOL v3 = [MEMORY[0x263F11E40] mediaLibraries];
  int v4 = [(ACCMediaLibraryShim *)self subscribedToAppleMusic];
  NSUInteger v5 = [(NSDictionary *)self->_libraries count];
  if (v5 != [v3 count])
  {
    BOOL v16 = 1;
    goto LABEL_22;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7)
  {
LABEL_17:
    BOOL v16 = 0;
    goto LABEL_21;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v19;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = ACCMediaLibraryShimUIDString(*(void **)(*((void *)&v18 + 1) + 8 * i), v4);
      uint64_t v12 = ACCMediaLibraryShimUIDString(self->_deviceMediaLibrary, v4);
      int v13 = objc_msgSend(v11, "isEqualToString:", v12, (void)v18);

      if (v13)
      {
        long long v14 = [(NSDictionary *)self->_libraries objectForKey:v11];

        if (!v14)
        {
          BOOL v16 = 1;
          goto LABEL_20;
        }
      }
      if (!self->_enableLibraryInfoUpdate)
      {
        BOOL v16 = 0;
LABEL_20:

        goto LABEL_21;
      }
      BOOL isShuttingDown = self->_isShuttingDown;

      if (isShuttingDown) {
        goto LABEL_17;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    BOOL v16 = 0;
    if (v8) {
      continue;
    }
    break;
  }
LABEL_21:

LABEL_22:
  return v16;
}

- (BOOL)_checkForDifferentRadioLibrary
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int radioIsEnabled = self->_radioIsEnabled;
  int v4 = GetMediaLibraryHelper();
  int v5 = [v4 iTunesRadioEnabled];

  if (radioIsEnabled != v5)
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 1;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCMediaLibraryShimInfo _getUIDString]();
      }
      uint64_t v8 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = self->_radioIsEnabled;
      id v10 = GetMediaLibraryHelper();
      v15[0] = 67109376;
      v15[1] = v9;
      __int16 v16 = 1024;
      int v17 = [v10 iTunesRadioEnabled];
      _os_log_impl(&dword_2269CB000, v8, OS_LOG_TYPE_INFO, "_checkForDifferentRadioLibrary: _radioIsEnabled=%d->%d", (uint8_t *)v15, 0xEu);
    }
    uint64_t v11 = GetMediaLibraryHelper();
    self->_int radioIsEnabled = [v11 iTunesRadioEnabled];

    if (self->_radioIsEnabled)
    {
      uint64_t v12 = [MEMORY[0x263F12198] defaultRadioLibrary];
      mpRadioLibrary = self->_mpRadioLibrary;
      self->_mpRadioLibrary = v12;
    }
  }
  return radioIsEnabled != v5;
}

- (void)_sendLibraryInfoList
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!self->_enableLibraryInfoUpdate) {
    goto LABEL_21;
  }
  if (self->_isShuttingDown) {
    goto LABEL_3;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  BOOL v9 = [(NSMutableDictionary *)self->_libraryList allValues];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
LABEL_10:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v40 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v14 = *(void **)(*((void *)&v39 + 1) + 8 * v13);
      if (![v14 libraryType])
      {
        id v15 = objc_alloc(MEMORY[0x263F22E60]);
        __int16 v16 = [v14 UIDString];
        int v17 = [v14 name];
        uint64_t v18 = objc_msgSend(v15, "initWithMediaLibrary:name:type:", v16, v17, objc_msgSend(v14, "libraryType"));

        [v3 addObject:v18];
      }
      if (!self->_enableLibraryInfoUpdate || self->_isShuttingDown) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
        if (v11) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  if (self->_enableLibraryInfoUpdate && !self->_isShuttingDown)
  {
    if (self->_mpRadioLibrary && self->_radioLibrary)
    {
      if (gLogObjects) {
        BOOL v19 = gNumLogObjects <= 0;
      }
      else {
        BOOL v19 = 1;
      }
      int v20 = !v19;
      if (self->_radioIsEnabled)
      {
        if (v20)
        {
          long long v21 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCMediaLibraryShimInfo _getUIDString]();
          }
          long long v21 = MEMORY[0x263EF8438];
          id v29 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          BOOL radioIsEnabled = self->_radioIsEnabled;
          radioLibrary = self->_radioLibrary;
          mpRadioLibrary = self->_mpRadioLibrary;
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)long long v44 = radioIsEnabled;
          *(_WORD *)&v44[4] = 2112;
          *(void *)&v44[6] = radioLibrary;
          *(_WORD *)&v44[14] = 2112;
          *(void *)&v44[16] = mpRadioLibrary;
          _os_log_impl(&dword_2269CB000, v21, OS_LOG_TYPE_INFO, "_sendLibraryInfoList: _radioIsEnabled=%d _radioLibrary=%@ _mpRadioLibrary=%@", buf, 0x1Cu);
        }

        uint64_t v22 = [(ACCMediaLibraryShimInfo *)self->_radioLibrary UIDString];
        if ([(ACCMediaLibraryShimInfo *)self->_radioLibrary libraryType] == 2)
        {
          uint64_t v33 = acc_strings_bundle();
          v34 = [v33 localizedStringForKey:@"Apple Music Radio" value:&stru_26DA84CD0 table:0];

          v35 = (void *)[objc_alloc(MEMORY[0x263F22E60]) initWithMediaLibrary:v22 name:v34 type:2];
          [v3 addObject:v35];
        }
        goto LABEL_56;
      }
      if (v20)
      {
        uint64_t v22 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        uint64_t v22 = MEMORY[0x263EF8438];
        id v36 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
        goto LABEL_56;
      }
      uint64_t v37 = [(MPRadioLibrary *)self->_mpRadioLibrary stationCount];
      BOOL v38 = self->_radioIsEnabled;
      *(_DWORD *)buf = 134218240;
      *(void *)long long v44 = v37;
      *(_WORD *)&v44[8] = 1024;
      *(_DWORD *)&v44[10] = v38;
      uint64_t v26 = "_sendLibraryInfoList: RadioLibrary count(%llu) == 0 _radioIsEnabled=%d";
      v27 = v22;
      uint32_t v28 = 18;
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v22 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        uint64_t v22 = MEMORY[0x263EF8438];
        id v23 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
        goto LABEL_56;
      }
      uint64_t v24 = self->_radioLibrary;
      uint64_t v25 = self->_mpRadioLibrary;
      *(_DWORD *)buf = 138412546;
      *(void *)long long v44 = v24;
      *(_WORD *)&v44[8] = 2112;
      *(void *)&v44[10] = v25;
      uint64_t v26 = "_sendLibraryInfoList: Error, no RadioLibrary (info=%@ mp=%@)";
      v27 = v22;
      uint32_t v28 = 22;
    }
    _os_log_impl(&dword_2269CB000, v27, OS_LOG_TYPE_INFO, v26, buf, v28);
LABEL_56:

LABEL_3:
    if (self->_enableLibraryInfoUpdate && !self->_isShuttingDown)
    {
      p_delegate = &self->_delegate;
      id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

      if (WeakRetained)
      {
        id v6 = objc_loadWeakRetained((id *)p_delegate);
        char v7 = objc_opt_respondsToSelector();

        if (v7)
        {
          id v8 = objc_loadWeakRetained((id *)p_delegate);
          [v8 notifyAvailableLibraries:v3];
        }
      }
    }
  }
LABEL_21:
}

- (void)_updateMediaLibraryInfomationUpdates:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (self->_enableLibraryInfoUpdate && !self->_isShuttingDown)
  {
    BOOL v4 = a3;
    BOOL v5 = [(ACCMediaLibraryShim *)self _checkForDifferentRadioLibrary];
    BOOL v6 = [(ACCMediaLibraryShim *)self _checkForDifferentMediaLibraries];
    if (self->_enableLibraryInfoUpdate && !self->_isShuttingDown && (v5 || v6 || v4))
    {
      char v7 = self->_libraryList;
      libraryList = self->_libraryList;
      self->_libraryList = 0;

      [(ACCMediaLibraryShim *)self _setupNewLibraries:v7 forAccessory:self->_accessory];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      BOOL v9 = [(NSMutableDictionary *)v7 allValues];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            id v15 = self->_libraryList;
            __int16 v16 = [v14 UIDString];
            int v17 = [(NSMutableDictionary *)v15 objectForKey:v16];

            if (!v17)
            {
              [v14 stopSendingMediaLibraryUpdates];
              [v14 shuttingDown];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }

      [(ACCMediaLibraryShim *)self _sendLibraryInfoList];
    }
  }
}

- (void)startSendingMediaLibraryInfomationUpdates
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    BOOL v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL enableLibraryInfoUpdate = self->_enableLibraryInfoUpdate;
    *(_DWORD *)buf = 67109120;
    BOOL v10 = enableLibraryInfoUpdate;
    _os_log_impl(&dword_2269CB000, v5, OS_LOG_TYPE_DEFAULT, "startSendingMediaLibraryInfomationUpdates _enableLibraryInfoUpdate=%d", buf, 8u);
  }

  if (!self->_enableLibraryInfoUpdate)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__ACCMediaLibraryShim_startSendingMediaLibraryInfomationUpdates__block_invoke;
    block[3] = &unk_2647C02E8;
    block[4] = self;
    dispatch_async(libraryInfoUpdateQ, block);
  }
}

uint64_t __64__ACCMediaLibraryShim_startSendingMediaLibraryInfomationUpdates__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    id v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 32);
    v7[0] = 67109376;
    v7[1] = v5;
    __int16 v8 = 1024;
    int v9 = 1;
    _os_log_impl(&dword_2269CB000, v4, OS_LOG_TYPE_INFO, "startSendingMediaLibraryInfomationUpdates: _updateMediaLibraryInfomationUpdates:true _enableLibraryInfoUpdate=%d->%d", (uint8_t *)v7, 0xEu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  return [*(id *)(a1 + 32) _updateMediaLibraryInfomationUpdates:1];
}

- (void)stopSendingMediaLibraryInfomationUpdates
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    int v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    int v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL enableLibraryInfoUpdate = self->_enableLibraryInfoUpdate;
    *(_DWORD *)buf = 67109376;
    BOOL v10 = enableLibraryInfoUpdate;
    __int16 v11 = 1024;
    int v12 = 0;
    _os_log_impl(&dword_2269CB000, v5, OS_LOG_TYPE_DEFAULT, "stopSendingMediaLibraryInfomationUpdates _enableLibraryInfoUpdate=%d->%d", buf, 0xEu);
  }

  self->_BOOL enableLibraryInfoUpdate = 0;
  libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__ACCMediaLibraryShim_stopSendingMediaLibraryInfomationUpdates__block_invoke;
  block[3] = &unk_2647C02E8;
  block[4] = self;
  dispatch_async(libraryInfoUpdateQ, block);
}

uint64_t __63__ACCMediaLibraryShim_stopSendingMediaLibraryInfomationUpdates__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    id v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 32);
    v7[0] = 67109376;
    v7[1] = v5;
    __int16 v8 = 1024;
    int v9 = 0;
    _os_log_impl(&dword_2269CB000, v4, OS_LOG_TYPE_INFO, "_updateMediaLibraryInfomationUpdates:false _enableLibraryInfoUpdate=%d->%d", (uint8_t *)v7, 0xEu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  return [*(id *)(a1 + 32) _updateMediaLibraryInfomationUpdates:0];
}

- (BOOL)isGeniusMixesSupported
{
  int AppBooleanValue = isGeniusMixesSupported___bGeniusMixSupportEnable;
  if (isGeniusMixesSupported___bGeniusMixSupportEnable == -1)
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"GeniusMixSupport", @"com.apple.iapd", 0);
    isGeniusMixesSupported___bGeniusMixSupportEnable = AppBooleanValue;
  }
  return AppBooleanValue != 0;
}

- (void)startMediaLibraryUpdate:(id)a3 lastRevision:(id)a4 requestedInfo:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    uint64_t v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    long long v14 = ACCMediaLibraryFeatureRequestedInfoDesc(v9);
    *(_DWORD *)buf = 138412802;
    id v52 = v7;
    __int16 v53 = 2112;
    id v54 = v8;
    __int16 v55 = 2112;
    __int16 v56 = v14;
    _os_log_impl(&dword_2269CB000, v13, OS_LOG_TYPE_DEFAULT, "startMediaLibraryUpdate:%@ lastRevision:%@ requestedInfo:%@", buf, 0x20u);
  }
  BOOL v32 = v8;

  uint64_t v33 = v7;
  [v10 setValue:v7 forKey:@"LibUID"];
  [v10 setValue:@"1" forKey:@"Progress"];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v15 = v9;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v35 = 0;
    char v34 = 0;
    uint64_t v38 = *(void *)v47;
    uint64_t v37 = *MEMORY[0x263F22E40];
    uint64_t v36 = *MEMORY[0x263F22E28];
    uint64_t v18 = *MEMORY[0x263F22E38];
    uint64_t v19 = *MEMORY[0x263F22E48];
    uint64_t v20 = *MEMORY[0x263F22E20];
    uint64_t v21 = *MEMORY[0x263F22E30];
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v47 != v38) {
          objc_enumerationMutation(v15);
        }
        uint64_t v23 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        if ([v23 isEqualToString:v37])
        {
          uint64_t v24 = [v15 objectForKey:v23];
          [v10 setValue:v24 forKey:@"PlaylistProperty"];
        }
        if ([v23 isEqualToString:v36])
        {
          uint64_t v25 = [v15 objectForKey:v23];
          [v10 setValue:v25 forKey:@"ItemProperty"];
        }
        if ([v23 isEqualToString:v18])
        {
          uint64_t v26 = [v15 objectForKey:v23];
          [v10 setValue:v26 forKey:@"PlaylistContentStyle"];
          if ([v26 intValue] == 1 || objc_msgSend(v26, "intValue") == 3) {
            char v34 = 1;
          }
          if ([v26 intValue] == 2 || objc_msgSend(v26, "intValue") == 3) {
            LOBYTE(v35) = 1;
          }
        }
        if ([v23 isEqualToString:v19])
        {
          v27 = [v15 objectForKey:v23];
          [v10 setValue:v27 forKey:@"PlaylistContentItemProperty"];

          BYTE4(v35) = 1;
        }
        if ([v23 isEqualToString:v20])
        {
          uint32_t v28 = [v15 objectForKey:v23];
          [v10 setValue:v28 forKey:@"HideNonLocal"];
        }
        if ([v23 isEqualToString:v21])
        {
          id v29 = [v15 objectForKey:v23];
          [v10 setValue:v29 forKey:@"PlayAllSongsCapable"];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v17);
  }
  else
  {
    uint64_t v35 = 0;
    char v34 = 0;
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__ACCMediaLibraryShim_startMediaLibraryUpdate_lastRevision_requestedInfo___block_invoke;
    block[3] = &unk_2647C0380;
    block[4] = self;
    id v40 = v10;
    char v43 = v34 & 1;
    char v44 = v35 & 1;
    char v45 = BYTE4(v35) & 1;
    id v41 = v32;
    id v42 = v33;
    dispatch_async(libraryInfoUpdateQ, block);
  }
}

void __74__ACCMediaLibraryShim_startMediaLibraryUpdate_lastRevision_requestedInfo___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 33))
  {
    BOOL v2 = [*(id *)(a1 + 40) objectForKey:@"LibUID"];
    id v3 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:v2];
    id v4 = v3;
    if (v3 && ([v3 isShuttingDown] & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v9 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = *(unsigned __int8 *)(a1 + 64);
        int v12 = *(unsigned __int8 *)(a1 + 65);
        int v13 = *(unsigned __int8 *)(a1 + 66);
        int v14 = 138413058;
        id v15 = v4;
        __int16 v16 = 1024;
        *(_DWORD *)uint64_t v17 = v11;
        *(_WORD *)&v17[4] = 1024;
        *(_DWORD *)&v17[6] = v12;
        __int16 v18 = 1024;
        int v19 = v13;
        _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_INFO, "startSendingMediaLibraryUpdates: libraryinInfo=%@ requestedPlaylistContentTransferID=%d requestedPlaylistContentMetaList=%d requestedPlaylistContentMetaProperties=%d", (uint8_t *)&v14, 0x1Eu);
      }

      [v4 startSendingMediaLibraryUpdates:*(void *)(a1 + 40) lastRevision:*(void *)(a1 + 48) requestedTransferID:*(unsigned __int8 *)(a1 + 64) requestedMetaList:*(unsigned __int8 *)(a1 + 65) requestedMetaProperties:*(unsigned __int8 *)(a1 + 66)];
    }
    else
    {
      if (gLogObjects) {
        BOOL v5 = gNumLogObjects < 1;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v7 = MEMORY[0x263EF8438];
        id v6 = MEMORY[0x263EF8438];
      }
      else
      {
        id v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *(void **)(a1 + 56);
        int v14 = 138412546;
        id v15 = v8;
        __int16 v16 = 2112;
        *(void *)uint64_t v17 = v4;
        _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "startSendingMediaLibraryUpdates: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@ libraryInfo=%@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

- (void)stopMediaLibraryUpdate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138412546;
    id v13 = v4;
    __int16 v14 = 1024;
    BOOL v15 = isShuttingDown;
    _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "stopMediaLibraryUpdate: %@ _isShuttingDown=%d", buf, 0x12u);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __46__ACCMediaLibraryShim_stopMediaLibraryUpdate___block_invoke;
    v10[3] = &unk_2647C0298;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(libraryInfoUpdateQ, v10);
  }
}

void __46__ACCMediaLibraryShim_stopMediaLibraryUpdate___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 33))
  {
    id v3 = [*(id *)(v1 + 64) objectForKey:*(void *)(a1 + 40)];
    id v4 = v3;
    if (v3 && ([v3 isShuttingDown] & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v9 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_INFO, "stopMediaLibraryUpdate: libraryInfo=%@, call stopSendingMediaLibraryUpdates:", (uint8_t *)&v12, 0xCu);
      }

      [v4 stopSendingMediaLibraryUpdates];
    }
    else
    {
      if (gLogObjects) {
        BOOL v5 = gNumLogObjects < 1;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v7 = MEMORY[0x263EF8438];
        id v6 = MEMORY[0x263EF8438];
      }
      else
      {
        id v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *(void **)(a1 + 40);
        int v12 = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "stopMediaLibraryUpdate: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v12, 0xCu);
      }
    }
    id v11 = *(void **)(*(void *)(a1 + 32) + 48);
    if (v11) {
      [v11 clearAllUpdatesForLibrary:*(void *)(a1 + 40)];
    }
  }
}

- (void)stopAllMediaLibraryUpdate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    BOOL v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 67109120;
    BOOL v10 = isShuttingDown;
    _os_log_impl(&dword_2269CB000, v5, OS_LOG_TYPE_DEFAULT, "stopAllMediaLibraryUpdate _isShuttingDown=%d", buf, 8u);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__ACCMediaLibraryShim_stopAllMediaLibraryUpdate__block_invoke;
    block[3] = &unk_2647C02E8;
    block[4] = self;
    dispatch_async(libraryInfoUpdateQ, block);
  }
}

void *__48__ACCMediaLibraryShim_stopAllMediaLibraryUpdate__block_invoke(void *result)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 33))
  {
    int v19 = result;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    BOOL v2 = [*(id *)(v1 + 64) allValues];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v21;
      id v6 = MEMORY[0x263EF8438];
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v21 != v5) {
            objc_enumerationMutation(v2);
          }
          id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          char v9 = [v8 isShuttingDown];
          uint64_t v10 = gLogObjects;
          int v11 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v12 = gNumLogObjects <= 0;
          }
          else {
            BOOL v12 = 1;
          }
          int v13 = !v12;
          if (v9)
          {
            if (v13)
            {
              uint64_t v14 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v26 = v10;
                __int16 v27 = 1024;
                int v28 = v11;
                _os_log_error_impl(&dword_2269CB000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              uint64_t v16 = v6;
              uint64_t v14 = v6;
            }
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v17 = [v8 UIDString];
              *(_DWORD *)buf = 138412290;
              uint64_t v26 = (uint64_t)v17;
              _os_log_impl(&dword_2269CB000, v14, OS_LOG_TYPE_DEFAULT, "stopAllMediaLibraryUpdate: WARNING No libraryInfo or shuttingDown for libraryInfo.UIDString=%@", buf, 0xCu);
            }
          }
          else
          {
            if (v13)
            {
              BOOL v15 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v26 = v10;
                __int16 v27 = 1024;
                int v28 = v11;
                _os_log_error_impl(&dword_2269CB000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              __int16 v18 = v6;
              BOOL v15 = v6;
            }
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v26 = (uint64_t)v8;
              _os_log_impl(&dword_2269CB000, v15, OS_LOG_TYPE_INFO, "stopAllMediaLibraryUpdate: libraryInfo=%@, call stopSendingMediaLibraryUpdates:", buf, 0xCu);
            }

            [v8 stopSendingMediaLibraryUpdates];
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v4);
    }

    result = *(void **)(v19[4] + 48);
    if (result) {
      return (void *)[result clearAllUpdates];
    }
  }
  return result;
}

- (void)playMediaLibraryCurrentSelection:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138412546;
    id v13 = v4;
    __int16 v14 = 1024;
    BOOL v15 = isShuttingDown;
    _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "playMediaLibraryCurrentSelection: %@ _isShuttingDown=%d", buf, 0x12u);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __56__ACCMediaLibraryShim_playMediaLibraryCurrentSelection___block_invoke;
    v10[3] = &unk_2647C0298;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(libraryInfoUpdateQ, v10);
  }
}

void __56__ACCMediaLibraryShim_playMediaLibraryCurrentSelection___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 33))
  {
    uint64_t v3 = [*(id *)(v1 + 64) objectForKey:*(void *)(a1 + 40)];
    id v4 = v3;
    if (v3 && ([v3 isShuttingDown] & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        char v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        char v9 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        BOOL v12 = v4;
        _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_INFO, "playMediaLibraryCurrentSelection: libraryInfo=%@, call startMLPlaybackWithResume:", (uint8_t *)&v11, 0xCu);
      }

      [v4 startMLPlaybackWithResume:1];
    }
    else
    {
      if (gLogObjects) {
        BOOL v5 = gNumLogObjects < 1;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v7 = MEMORY[0x263EF8438];
        id v6 = MEMORY[0x263EF8438];
      }
      else
      {
        id v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *(void **)(a1 + 40);
        int v11 = 138412290;
        BOOL v12 = v8;
        _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "playMediaLibraryCurrentSelection: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)playMediaLibraryItems:(id)a3 itemList:(id)a4 firstItemIndex:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    BOOL v12 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v9 count];
    BOOL isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138413058;
    id v21 = v8;
    __int16 v22 = 2048;
    uint64_t v23 = v13;
    __int16 v24 = 2048;
    unint64_t v25 = a5;
    __int16 v26 = 1024;
    BOOL v27 = isShuttingDown;
    _os_log_impl(&dword_2269CB000, v12, OS_LOG_TYPE_DEFAULT, "playMediaLibraryItems: %@ itemList.count:%lu firstItemIndex:%lu _isShuttingDown=%d", buf, 0x26u);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __69__ACCMediaLibraryShim_playMediaLibraryItems_itemList_firstItemIndex___block_invoke;
    v16[3] = &unk_2647C03A8;
    v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    unint64_t v19 = a5;
    dispatch_async(libraryInfoUpdateQ, v16);
  }
}

void __69__ACCMediaLibraryShim_playMediaLibraryItems_itemList_firstItemIndex___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 33))
  {
    uint64_t v3 = [*(id *)(v1 + 64) objectForKey:*(void *)(a1 + 40)];
    id v4 = v3;
    if (v3 && ([v3 isShuttingDown] & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v9 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [*(id *)(a1 + 48) count];
        uint64_t v12 = *(void *)(a1 + 56);
        int v13 = 138412802;
        __int16 v14 = v4;
        __int16 v15 = 2048;
        uint64_t v16 = v11;
        __int16 v17 = 2048;
        uint64_t v18 = v12;
        _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_INFO, "playMediaLibraryItems: libraryInfo=%@  itemList.count=%lu firstItemIndex=%lu, call startPlaybackOfItems:witFirst:", (uint8_t *)&v13, 0x20u);
      }

      [v4 startPlaybackOfItems:*(void *)(a1 + 48) withFirst:*(unsigned int *)(a1 + 56)];
    }
    else
    {
      if (gLogObjects) {
        BOOL v5 = gNumLogObjects < 1;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v7 = MEMORY[0x263EF8438];
        id v6 = MEMORY[0x263EF8438];
      }
      else
      {
        id v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *(void **)(a1 + 40);
        int v13 = 138412290;
        __int16 v14 = v8;
        _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "playMediaLibraryItems: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void)playMediaLibraryCollection:(id)a3 collection:(unint64_t)a4 type:(int)a5 firstItemIndex:(unint64_t)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    int v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    int v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138413314;
    id v22 = v10;
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    __int16 v25 = 1024;
    int v26 = a5;
    __int16 v27 = 2048;
    unint64_t v28 = a6;
    __int16 v29 = 1024;
    BOOL v30 = isShuttingDown;
    _os_log_impl(&dword_2269CB000, v13, OS_LOG_TYPE_DEFAULT, "playMediaLibraryCollection: %@ collectionPersistentID:%llu collectionType:%d firstItemIndex:%lu _isShuttingDown=%d", buf, 0x2Cu);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__ACCMediaLibraryShim_playMediaLibraryCollection_collection_type_firstItemIndex___block_invoke;
    block[3] = &unk_2647C03D0;
    block[4] = self;
    id v17 = v10;
    unint64_t v18 = a4;
    int v20 = a5;
    unint64_t v19 = a6;
    dispatch_async(libraryInfoUpdateQ, block);
  }
}

void __81__ACCMediaLibraryShim_playMediaLibraryCollection_collection_type_firstItemIndex___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 33))
  {
    uint64_t v3 = [*(id *)(v1 + 64) objectForKey:*(void *)(a1 + 40)];
    id v4 = v3;
    if (v3 && ([v3 isShuttingDown] & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v9 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = *(_DWORD *)(a1 + 64);
        uint64_t v12 = *(void *)(a1 + 48);
        uint64_t v13 = *(void *)(a1 + 56);
        int v14 = 138413058;
        __int16 v15 = v4;
        __int16 v16 = 2048;
        uint64_t v17 = v12;
        __int16 v18 = 1024;
        int v19 = v11;
        __int16 v20 = 2048;
        uint64_t v21 = v13;
        _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_INFO, "playMediaLibraryCollection: libraryInfo=%@ collectionPersistentID=%llu collectionType=%d firstItemIndex=%lu, call startPlaybackOfCollection:ofType:withFirst:", (uint8_t *)&v14, 0x26u);
      }

      [v4 startPlaybackOfCollection:*(void *)(a1 + 48) ofType:*(unsigned int *)(a1 + 64) withFirst:*(unsigned int *)(a1 + 56)];
    }
    else
    {
      if (gLogObjects) {
        BOOL v5 = gNumLogObjects < 1;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v7 = MEMORY[0x263EF8438];
        id v6 = MEMORY[0x263EF8438];
      }
      else
      {
        id v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *(void **)(a1 + 40);
        int v14 = 138412290;
        __int16 v15 = v8;
        _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "playMediaLibraryCollection WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)playMediaLibraryCollection:(id)a3 collection:(unint64_t)a4 type:(int)a5 firstItemPersistentID:(unint64_t)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    uint64_t v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138413314;
    id v22 = v10;
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    __int16 v25 = 1024;
    int v26 = a5;
    __int16 v27 = 2048;
    unint64_t v28 = a6;
    __int16 v29 = 1024;
    BOOL v30 = isShuttingDown;
    _os_log_impl(&dword_2269CB000, v13, OS_LOG_TYPE_DEFAULT, "playMediaLibraryCollection: %@ collectionPersistentID:%llu collectionType:%d firstItemPersistentID:%llu _isShuttingDown=%d", buf, 0x2Cu);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__ACCMediaLibraryShim_playMediaLibraryCollection_collection_type_firstItemPersistentID___block_invoke;
    block[3] = &unk_2647C03D0;
    block[4] = self;
    id v17 = v10;
    unint64_t v18 = a4;
    int v20 = a5;
    unint64_t v19 = a6;
    dispatch_async(libraryInfoUpdateQ, block);
  }
}

void __88__ACCMediaLibraryShim_playMediaLibraryCollection_collection_type_firstItemPersistentID___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 33))
  {
    uint64_t v3 = [*(id *)(v1 + 64) objectForKey:*(void *)(a1 + 40)];
    id v4 = v3;
    if (v3 && ([v3 isShuttingDown] & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v9 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = *(_DWORD *)(a1 + 64);
        uint64_t v12 = *(void *)(a1 + 48);
        uint64_t v13 = *(void *)(a1 + 56);
        int v14 = 138413058;
        __int16 v15 = v4;
        __int16 v16 = 2048;
        uint64_t v17 = v12;
        __int16 v18 = 1024;
        int v19 = v11;
        __int16 v20 = 2048;
        uint64_t v21 = v13;
        _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_INFO, "playMediaLibraryCollection: libraryInfo=%@ collectionPersistentID=%llu collectionType=%d firstItemPersistentID%llu, call startPlaybackOfCollection:ofType:withFirstPersistentID:", (uint8_t *)&v14, 0x26u);
      }

      [v4 startPlaybackOfCollection:*(void *)(a1 + 48) ofType:*(unsigned int *)(a1 + 64) withFirstPersistentID:*(void *)(a1 + 56)];
    }
    else
    {
      if (gLogObjects) {
        BOOL v5 = gNumLogObjects < 1;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v7 = MEMORY[0x263EF8438];
        id v6 = MEMORY[0x263EF8438];
      }
      else
      {
        id v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *(void **)(a1 + 40);
        int v14 = 138412290;
        __int16 v15 = v8;
        _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "playMediaLibraryCollection: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)playAllSongs:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138412546;
    id v13 = v4;
    __int16 v14 = 1024;
    BOOL v15 = isShuttingDown;
    _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "playAllSongs: %@ _isShuttingDown=%d", buf, 0x12u);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __36__ACCMediaLibraryShim_playAllSongs___block_invoke;
    v10[3] = &unk_2647C0298;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(libraryInfoUpdateQ, v10);
  }
}

void __36__ACCMediaLibraryShim_playAllSongs___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 33))
  {
    uint64_t v3 = [*(id *)(v1 + 64) objectForKey:*(void *)(a1 + 40)];
    id v4 = v3;
    if (v3 && ([v3 isShuttingDown] & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v9 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        uint64_t v12 = v4;
        _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_INFO, "playAllSongs: libraryInfo=%@ call startMLPlaybackOfAllSongs", (uint8_t *)&v11, 0xCu);
      }

      [v4 startMLPlaybackOfAllSongs];
    }
    else
    {
      if (gLogObjects) {
        BOOL v5 = gNumLogObjects < 1;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v7 = MEMORY[0x263EF8438];
        id v6 = MEMORY[0x263EF8438];
      }
      else
      {
        id v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *(void **)(a1 + 40);
        int v11 = 138412290;
        uint64_t v12 = v8;
        _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "playAllSongs: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)playAllSongs:(id)a3 firstItemPersistentID:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    id v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138412802;
    id v16 = v6;
    __int16 v17 = 2048;
    unint64_t v18 = a4;
    __int16 v19 = 1024;
    BOOL v20 = isShuttingDown;
    _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_DEFAULT, "playAllSongs: %@ firstItemPersistentID:%llu _isShuttingDown=%d", buf, 0x1Cu);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__ACCMediaLibraryShim_playAllSongs_firstItemPersistentID___block_invoke;
    block[3] = &unk_2647C03F8;
    block[4] = self;
    id v13 = v6;
    unint64_t v14 = a4;
    dispatch_async(libraryInfoUpdateQ, block);
  }
}

void __58__ACCMediaLibraryShim_playAllSongs_firstItemPersistentID___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1[4];
  if (!*(unsigned char *)(v1 + 33))
  {
    uint64_t v3 = [*(id *)(v1 + 64) objectForKey:a1[5]];
    id v4 = v3;
    if (v3 && ([v3 isShuttingDown] & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v9 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = a1[6];
        int v12 = 138412546;
        id v13 = v4;
        __int16 v14 = 2048;
        uint64_t v15 = v11;
        _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_INFO, "playAllSongs: libraryInfo=%@ firstItemPersistentID=%llu, call startMLPlaybackOfAllSongsStartPersistentID:", (uint8_t *)&v12, 0x16u);
      }

      [v4 startMLPlaybackOfAllSongsStartPersistentID:a1[6]];
    }
    else
    {
      if (gLogObjects) {
        BOOL v5 = gNumLogObjects < 1;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        BOOL v7 = MEMORY[0x263EF8438];
        id v6 = MEMORY[0x263EF8438];
      }
      else
      {
        BOOL v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (void *)a1[5];
        int v12 = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "playAllSongs: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (void)confirmMediaLibraryUpdate:(id)a3 lastRevision:(id)a4 updateCount:(unsigned int)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    int v12 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  else
  {
    int v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138412802;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 1024;
    BOOL v24 = isShuttingDown;
    _os_log_impl(&dword_2269CB000, v12, OS_LOG_TYPE_DEFAULT, "confirmMediaLibraryUpdate: %@ lastRevision:%@ _isShuttingDown=%d", buf, 0x1Cu);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    _DWORD v15[2] = __74__ACCMediaLibraryShim_confirmMediaLibraryUpdate_lastRevision_updateCount___block_invoke;
    v15[3] = &unk_2647C0420;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    unsigned int v18 = a5;
    dispatch_async(libraryInfoUpdateQ, v15);
  }
}

void __74__ACCMediaLibraryShim_confirmMediaLibraryUpdate_lastRevision_updateCount___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 33))
  {
    uint64_t v3 = [*(id *)(v1 + 64) objectForKey:*(void *)(a1 + 40)];
    id v4 = v3;
    if (v3 && ([v3 isShuttingDown] & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v9 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(a1 + 48);
        int v12 = *(_DWORD *)(a1 + 56);
        int v13 = 138412802;
        __int16 v14 = v4;
        __int16 v15 = 2112;
        uint64_t v16 = v11;
        __int16 v17 = 1024;
        int v18 = v12;
        _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_INFO, "confirmMediaLibraryUpdateLastRevision: libraryInfo=%@ lastRevision=%@ count=%d, call confirmMediaLibraryUpdateLastRevision:updateCount:", (uint8_t *)&v13, 0x1Cu);
      }

      [v4 confirmMediaLibraryUpdateLastRevision:*(void *)(a1 + 48) updateCount:*(unsigned int *)(a1 + 56)];
    }
    else
    {
      if (gLogObjects) {
        BOOL v5 = gNumLogObjects < 1;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        BOOL v7 = MEMORY[0x263EF8438];
        id v6 = MEMORY[0x263EF8438];
      }
      else
      {
        BOOL v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *(void **)(a1 + 40);
        int v13 = 138412290;
        __int16 v14 = v8;
        _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "confirmMediaLibraryUpdate: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void)confirmMediaLibraryPlaylistContentUpdate:(id)a3 lastRevision:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCMediaLibraryShimInfo _getUIDString]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138412802;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 1024;
    BOOL v21 = isShuttingDown;
    _os_log_impl(&dword_2269CB000, v10, OS_LOG_TYPE_DEFAULT, "confirmMediaLibraryPlaylistContentUpdate: %@ lastRevision:%@ _isShuttingDown=%d", buf, 0x1Cu);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__ACCMediaLibraryShim_confirmMediaLibraryPlaylistContentUpdate_lastRevision___block_invoke;
    block[3] = &unk_2647C0358;
    block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(libraryInfoUpdateQ, block);
  }
}

void __77__ACCMediaLibraryShim_confirmMediaLibraryPlaylistContentUpdate_lastRevision___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1[4];
  if (!*(unsigned char *)(v1 + 33))
  {
    uint64_t v3 = [*(id *)(v1 + 64) objectForKey:a1[5]];
    id v4 = v3;
    if (v3 && ([v3 isShuttingDown] & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v9 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = a1[6];
        int v12 = 138412546;
        int v13 = v4;
        __int16 v14 = 2112;
        uint64_t v15 = v11;
        _os_log_impl(&dword_2269CB000, v9, OS_LOG_TYPE_INFO, "confirmMediaLibraryPlaylistContentUpdate: libraryInfo=%@ lastRevision=%@, call confirmMediaLibraryPlaylistContentUpdateLastRevision:", (uint8_t *)&v12, 0x16u);
      }

      [v4 confirmMediaLibraryPlaylistContentUpdateLastRevision:a1[6]];
    }
    else
    {
      if (gLogObjects) {
        BOOL v5 = gNumLogObjects < 1;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCMediaLibraryShimInfo _getUIDString]();
        }
        id v7 = MEMORY[0x263EF8438];
        id v6 = MEMORY[0x263EF8438];
      }
      else
      {
        id v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v8 = (void *)a1[5];
        int v12 = 138412290;
        int v13 = v8;
        _os_log_impl(&dword_2269CB000, v7, OS_LOG_TYPE_DEFAULT, "confirmMediaLibraryPlaylistContentUpdate: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (ACCMediaLibraryAccessory)accessory
{
  return self->_accessory;
}

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (OS_dispatch_queue)libraryInfoUpdateQ
{
  return self->_libraryInfoUpdateQ;
}

- (NSMutableDictionary)libraryList
{
  return self->_libraryList;
}

- (ACCMediaLibraryShimInfo)deviceLibrary
{
  return self->_deviceLibrary;
}

- (ACCMediaLibraryShimInfo)radioLibrary
{
  return self->_radioLibrary;
}

- (BOOL)radioIsEnabled
{
  return self->_radioIsEnabled;
}

- (BOOL)subscribedToAppleMusic
{
  return self->_subscribedToAppleMusic;
}

- (unsigned)windowPerLibrary
{
  return self->_windowPerLibrary;
}

- (void)setWindowPerLibrary:(unsigned int)a3
{
  self->_windowPerLibrary = a3;
}

- (ACCMediaLibraryShimDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCMediaLibraryShimDelegate *)WeakRetained;
}

- (ACCMemUsageStat)memUse
{
  return self->_memUse;
}

- (BOOL)isSubscribedToAppleMusic
{
  return self->_isSubscribedToAppleMusic;
}

- (void)setIsSubscribedToAppleMusic:(BOOL)a3
{
  self->_isSubscribedToAppleMusic = a3;
}

- (ACCSettingsState)measureMemoryUsage
{
  return self->_measureMemoryUsage;
}

- (void)setMeasureMemoryUsage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measureMemoryUsage, 0);
  objc_storeStrong((id *)&self->_memUse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_radioLibrary, 0);
  objc_storeStrong((id *)&self->_deviceLibrary, 0);
  objc_storeStrong((id *)&self->_libraryList, 0);
  objc_storeStrong((id *)&self->_libraryInfoUpdateQ, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_mpRadioLibrary, 0);
  objc_storeStrong((id *)&self->_deviceMediaLibrary, 0);
  objc_storeStrong((id *)&self->_libraries, 0);
}

- (void)_setupNewLibraries:forAccessory:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_2269CB000, v0, v1, "_setupNewLibraries: _libraries=%@  _libraryList=%@");
}

- (void)_setupNewLibraries:(NSObject *)a3 forAccessory:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 16);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_9(&dword_2269CB000, a2, a3, "_setupNewLibraries: _deviceMediaLibrary=%@  libs=%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end