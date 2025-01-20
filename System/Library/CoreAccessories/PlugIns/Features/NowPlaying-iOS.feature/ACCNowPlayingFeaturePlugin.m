@interface ACCNowPlayingFeaturePlugin
+ (BOOL)isMusicAppVisible;
+ (id)getItemDictionaryForContentItem:(id)a3 infoMask:(unsigned int)a4;
- (ACCMemUsageStat)memUse;
- (ACCSettingsState)maxPlaybackQueueInfoCount;
- (ACCSettingsState)measureMemoryUsage;
- (ACCSettingsState)nowPlayingInfoDebounceTimerValue;
- (ACCSettingsState)playbackQueueInfoSendPartialOnTimeout;
- (ACCSettingsState)playbackQueueInfoTimeoutMs;
- (AccessoryNowPlayingClient)nowPlayingClient;
- (BOOL)_nowPlayingAppIsIPodApp;
- (BOOL)_nowPlayingAppIsIPodRadio;
- (BOOL)_nowPlayingIsStreaming;
- (BOOL)isRunning;
- (BOOL)setPlaybackElapsedTime:(id)a3;
- (BOOL)setPlaybackQueueIndex:(id)a3;
- (MPMusicPlayerController)mpMusicPlayerControllerHandler;
- (NSData)cachedMediaItemArtworkHash;
- (NSMutableDictionary)cachedMediaItemAttributes;
- (NSMutableDictionary)cachedPlaybackAttributes;
- (NSMutableDictionary)pbqUpdateAccessoryList;
- (NSString)description;
- (NSString)pluginName;
- (OS_dispatch_queue)completionQueue;
- (OS_dispatch_queue)mpMusicPlayerControllerQueue;
- (OS_dispatch_queue)nowPlayingInfoPBQueueListQ;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)nowPlayingInfoDebounceTimer;
- (id)currentMediaItemArtwork;
- (id)currentMediaItemArtworkOriginal;
- (id)currentMediaItemAttributes;
- (id)currentPlaybackAppBundleID;
- (id)currentPlaybackAppName;
- (id)currentPlaybackAttributes;
- (unsigned)currentPlaybackStateMR;
- (unsigned)nowPlayingInfoDebounceTimerRunningMask;
- (void)_generatePlaybackQueueItemsWithPropertyList:(id)a3 request:(id)a4 completionHandler:(id)a5 continueQuery:(id)a6;
- (void)_nowPlayingAppDidChange;
- (void)_nowPlayingArtworkDidChange;
- (void)_nowPlayingInfoDebounceTimerKick:(int)a3;
- (void)_nowPlayingInfoDebounceTimerStop:(int)a3;
- (void)_nowPlayingInfoDidChange;
- (void)_nowPlayingIsStreaming;
- (void)_nowPlayingPlaybackQueueDidChange;
- (void)_nowPlayingStateDidChange;
- (void)cancelRequestPlaybackQueueListInfo:(id)a3 requestID:(id)a4;
- (void)currentMediaItemArtwork;
- (void)currentMediaItemArtworkOriginal;
- (void)currentMediaItemAttributes;
- (void)currentPlaybackAttributes;
- (void)initPlugin;
- (void)nowPlayingAppDidChange:(id)a3;
- (void)nowPlayingArtworkDidChange:(id)a3;
- (void)nowPlayingInfoDidChange:(id)a3;
- (void)nowPlayingPlaybackQueueDidChange:(id)a3;
- (void)nowPlayingStateDidChange:(id)a3;
- (void)requestPlaybackQueueListInfo:(id)a3 requestID:(id)a4 startIndex:(unsigned int)a5 upToCount:(unsigned int)a6 infoMask:(unsigned int)a7;
- (void)setCachedMediaItemArtworkHash:(id)a3;
- (void)setCachedMediaItemAttributes:(id)a3;
- (void)setCachedPlaybackAttributes:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setMaxPlaybackQueueInfoCount:(id)a3;
- (void)setMeasureMemoryUsage:(id)a3;
- (void)setMemUse:(id)a3;
- (void)setMpMusicPlayerControllerHandler:(id)a3;
- (void)setMpMusicPlayerControllerQueue:(id)a3;
- (void)setNowPlayingClient:(id)a3;
- (void)setNowPlayingInfoDebounceTimer:(id)a3;
- (void)setNowPlayingInfoDebounceTimerRunningMask:(unsigned int)a3;
- (void)setNowPlayingInfoPBQueueListQ:(id)a3;
- (void)setPbqUpdateAccessoryList:(id)a3;
- (void)setPlaybackQueueInfoSendPartialOnTimeout:(id)a3;
- (void)setPlaybackQueueInfoTimeoutMs:(id)a3;
- (void)setQueue:(id)a3;
- (void)startPlugin;
- (void)stopPlugin;
@end

@implementation ACCNowPlayingFeaturePlugin

- (NSString)pluginName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(ACCNowPlayingFeaturePlugin *)self pluginName];
  uint64_t v5 = obfuscatedPointer((uint64_t)self);
  BOOL v6 = [(ACCNowPlayingFeaturePlugin *)self isRunning];
  v7 = "NO";
  if (v6) {
    v7 = "YES";
  }
  v8 = [v3 stringWithFormat:@"<%@: %p> isRunning: %s", v4, v5, v7];

  return (NSString *)v8;
}

- (void)initPlugin
{
  init_logging();
  [(ACCNowPlayingFeaturePlugin *)self setIsRunning:0];
  dispatch_queue_t v3 = dispatch_queue_create("ACCNowPlayingFeaturePlugin", 0);
  [(ACCNowPlayingFeaturePlugin *)self setQueue:v3];

  v4 = dispatch_get_global_queue(0, 0);
  [(ACCNowPlayingFeaturePlugin *)self setCompletionQueue:v4];

  [(ACCNowPlayingFeaturePlugin *)self setCachedMediaItemAttributes:0];
  [(ACCNowPlayingFeaturePlugin *)self setCachedMediaItemArtworkHash:0];
  [(ACCNowPlayingFeaturePlugin *)self setCachedPlaybackAttributes:0];
  [(ACCNowPlayingFeaturePlugin *)self setPbqUpdateAccessoryList:0];
  [(ACCNowPlayingFeaturePlugin *)self setMemUse:0];
  [(ACCNowPlayingFeaturePlugin *)self setMaxPlaybackQueueInfoCount:0];
  [(ACCNowPlayingFeaturePlugin *)self setPlaybackQueueInfoTimeoutMs:0];
  [(ACCNowPlayingFeaturePlugin *)self setPlaybackQueueInfoSendPartialOnTimeout:0];
  [(ACCNowPlayingFeaturePlugin *)self setMeasureMemoryUsage:0];
}

- (void)startPlugin
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22632B000, v5, OS_LOG_TYPE_DEFAULT, "Starting Now Playing feature plugin...", buf, 2u);
  }

  dispatch_queue_t v6 = dispatch_queue_create("com.apple.accessoryd.MediaPlayerMPQ", 0);
  [(ACCNowPlayingFeaturePlugin *)self setMpMusicPlayerControllerQueue:v6];

  v7 = (void *)[objc_alloc(MEMORY[0x263F120B0]) initWithClientIdentifier:@"com.apple.accessoryd.mediaplayer" queue:self->_mpMusicPlayerControllerQueue];
  [(ACCNowPlayingFeaturePlugin *)self setMpMusicPlayerControllerHandler:v7];

  v8 = (void *)[objc_alloc(MEMORY[0x263F22EB0]) initWithDelegate:self];
  [(ACCNowPlayingFeaturePlugin *)self setNowPlayingClient:v8];

  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(ACCNowPlayingFeaturePlugin *)self setPbqUpdateAccessoryList:v9];

  dispatch_queue_t v10 = dispatch_queue_create("com.apple.iap2d.nowPlayPBQueueListQ", 0);
  [(ACCNowPlayingFeaturePlugin *)self setNowPlayingInfoPBQueueListQ:v10];

  self->_nowPlayingInfoDebounceTimerRunningMask = 0;
  v11 = [[ACCSettingsState alloc] initWithKey:@"NowPlayingInfoDebounce" applicationID:@"com.apple.iapd" notification:@"com.apple.iapd.LoggingPreferencesChangedNotification" defaultValue:500 invalidValue:0];
  nowPlayingInfoDebounceTimerValue = self->_nowPlayingInfoDebounceTimerValue;
  self->_nowPlayingInfoDebounceTimerValue = v11;

  v13 = [(ACCNowPlayingFeaturePlugin *)self queue];
  v14 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v13);
  nowPlayingInfoDebounceTimer = self->_nowPlayingInfoDebounceTimer;
  self->_nowPlayingInfoDebounceTimer = v14;

  v16 = [(ACCNowPlayingFeaturePlugin *)self nowPlayingInfoDebounceTimer];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __41__ACCNowPlayingFeaturePlugin_startPlugin__block_invoke;
  handler[3] = &unk_26479D6D0;
  handler[4] = self;
  dispatch_source_set_event_handler(v16, handler);

  [(ACCNowPlayingFeaturePlugin *)self _nowPlayingInfoDebounceTimerStop:127];
  v17 = [(ACCNowPlayingFeaturePlugin *)self nowPlayingInfoDebounceTimer];
  dispatch_resume(v17);

  v18 = [[ACCSettingsState alloc] initWithKey:@"MaxPlaybackQueueInfoCount" applicationID:@"com.apple.iapd" notification:@"com.apple.iapd.LoggingPreferencesChangedNotification" defaultValue:2000 invalidValue:0];
  [(ACCNowPlayingFeaturePlugin *)self setMaxPlaybackQueueInfoCount:v18];

  v19 = [[ACCSettingsState alloc] initWithKey:@"PlaybackQueueInfoTimeoutMs" applicationID:@"com.apple.iapd" notification:@"com.apple.iapd.LoggingPreferencesChangedNotification" defaultValue:5000 invalidValue:0];
  [(ACCNowPlayingFeaturePlugin *)self setPlaybackQueueInfoTimeoutMs:v19];

  v20 = [[ACCSettingsState alloc] initWithKey:@"PlaybackQueueInfoSendPartialOnTimeout" applicationID:@"com.apple.iapd" notification:@"com.apple.iapd.LoggingPreferencesChangedNotification" defaultValue:3 invalidValue:0];
  [(ACCNowPlayingFeaturePlugin *)self setPlaybackQueueInfoSendPartialOnTimeout:v20];

  v21 = [[ACCSettingsState alloc] initWithKey:@"MeasureMemoryUsage" applicationID:@"com.apple.iapd" notification:@"com.apple.iapd.LoggingPreferencesChangedNotification" defaultValue:0 invalidValue:-1];
  [(ACCNowPlayingFeaturePlugin *)self setMeasureMemoryUsage:v21];

  [(ACCNowPlayingFeaturePlugin *)self setMemUse:0];
  v22 = [(ACCNowPlayingFeaturePlugin *)self measureMemoryUsage];
  int v23 = [v22 BOOLValue];

  if (v23)
  {
    v24 = [[ACCMemUsageStat alloc] initWithName:@"ACCNowPlayingUpdate"];
    [(ACCNowPlayingFeaturePlugin *)self setMemUse:v24];
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v25 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    v25 = MEMORY[0x263EF8438];
    id v26 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22632B000, v25, OS_LOG_TYPE_INFO, "Adding notification observers...", buf, 2u);
  }

  v27 = [MEMORY[0x263F08A00] defaultCenter];
  [v27 addObserver:self selector:sel_nowPlayingInfoDidChange_ name:*MEMORY[0x263F54B88] object:0];

  v28 = [MEMORY[0x263F08A00] defaultCenter];
  [v28 addObserver:self selector:sel_nowPlayingStateDidChange_ name:*MEMORY[0x263F54B28] object:0];

  v29 = [MEMORY[0x263F08A00] defaultCenter];
  [v29 addObserver:self selector:sel_nowPlayingStateDidChange_ name:*MEMORY[0x263F54B30] object:0];

  v30 = [MEMORY[0x263F08A00] defaultCenter];
  [v30 addObserver:self selector:sel_nowPlayingAppDidChange_ name:*MEMORY[0x263F54B20] object:0];

  v31 = [MEMORY[0x263F08A00] defaultCenter];
  [v31 addObserver:self selector:sel_nowPlayingInfoDidChange_ name:*MEMORY[0x263F54E18] object:0];

  MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
  v32 = [MEMORY[0x263F08A00] defaultCenter];
  [v32 addObserver:self selector:sel_nowPlayingPlaybackQueueDidChange_ name:*MEMORY[0x263F11B50] object:0];

  v33 = [MEMORY[0x263F08A00] defaultCenter];
  [v33 addObserver:self selector:sel_nowPlayingArtworkDidChange_ name:*MEMORY[0x263F54E58] object:0];

  v34 = [(ACCNowPlayingFeaturePlugin *)self queue];
  MRMediaRemoteRegisterForNowPlayingNotifications();

  v35 = [(ACCNowPlayingFeaturePlugin *)self mpMusicPlayerControllerQueue];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __41__ACCNowPlayingFeaturePlugin_startPlugin__block_invoke_151;
  v36[3] = &unk_26479D6D0;
  v36[4] = self;
  dispatch_sync(v35, v36);

  [(ACCNowPlayingFeaturePlugin *)self setIsRunning:1];
}

void __41__ACCNowPlayingFeaturePlugin_startPlugin__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 12);
  *(_DWORD *)(v2 + 12) = 0;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    dispatch_queue_t v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    dispatch_queue_t v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v17 = 67109120;
    int v18 = v3;
    _os_log_impl(&dword_22632B000, v6, OS_LOG_TYPE_INFO, "NowPlayingInfoUpdate debounce timer fired: mask = 0x%02x", (uint8_t *)&v17, 8u);
  }

  if ((v3 & 0x11) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v17 = 67109120;
      int v18 = 17;
      _os_log_impl(&dword_22632B000, v7, OS_LOG_TYPE_INFO, "NowPlayingInfoUpdate debounce timer fired, handle mask 0x%02x, call _nowPlayingInfoDidChange", (uint8_t *)&v17, 8u);
    }

    [*(id *)(a1 + 32) _nowPlayingInfoDidChange];
  }
  if ((v3 & 0xA) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      id v9 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v17 = 67109120;
      int v18 = 10;
      _os_log_impl(&dword_22632B000, v9, OS_LOG_TYPE_INFO, "NowPlayingInfoUpdate debounce timer fired, handle mask 0x%02x, call _nowPlayingStateDidChange", (uint8_t *)&v17, 8u);
    }

    [*(id *)(a1 + 32) _nowPlayingStateDidChange];
  }
  if ((v3 & 4) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      v11 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v17 = 67109120;
      int v18 = 4;
      _os_log_impl(&dword_22632B000, v11, OS_LOG_TYPE_INFO, "NowPlayingInfoUpdate debounce timer fired, handle mask 0x%02x, call _nowPlayingAppDidChange", (uint8_t *)&v17, 8u);
    }

    [*(id *)(a1 + 32) _nowPlayingAppDidChange];
    if ((v3 & 0x20) == 0)
    {
LABEL_33:
      if ((v3 & 0x40) == 0) {
        return;
      }
      goto LABEL_53;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_33;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v13 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    v13 = MEMORY[0x263EF8438];
    id v14 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v17 = 67109120;
    int v18 = 32;
    _os_log_impl(&dword_22632B000, v13, OS_LOG_TYPE_INFO, "NowPlayingInfoUpdate debounce timer fired, handle mask 0x%02x, call _nowPlayingPlaybackQueueDidChange", (uint8_t *)&v17, 8u);
  }

  [*(id *)(a1 + 32) _nowPlayingPlaybackQueueDidChange];
  if ((v3 & 0x40) != 0)
  {
LABEL_53:
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      v15 = MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v17 = 67109120;
      int v18 = 64;
      _os_log_impl(&dword_22632B000, v15, OS_LOG_TYPE_INFO, "NowPlayingInfoUpdate debounce timer fired, handle mask 0x%02x, call _nowPlayingArtworkDidChange", (uint8_t *)&v17, 8u);
    }

    [*(id *)(a1 + 32) _nowPlayingArtworkDidChange];
  }
}

void __41__ACCNowPlayingFeaturePlugin_startPlugin__block_invoke_151(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) mpMusicPlayerControllerHandler];
  [v1 beginGeneratingPlaybackNotifications];
}

- (void)stopPlugin
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22632B000, v5, OS_LOG_TYPE_DEFAULT, "Stopping Now Playing feature plugin...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    dispatch_queue_t v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    dispatch_queue_t v6 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22632B000, v6, OS_LOG_TYPE_INFO, "Removing all notification observers...", buf, 2u);
  }

  id v8 = [(ACCNowPlayingFeaturePlugin *)self mpMusicPlayerControllerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__ACCNowPlayingFeaturePlugin_stopPlugin__block_invoke;
  block[3] = &unk_26479D6D0;
  block[4] = self;
  dispatch_sync(v8, block);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *MEMORY[0x263F11B28];
    uint64_t v12 = *MEMORY[0x263F11B20];
    *(_DWORD *)buf = 134218240;
    uint64_t v17 = v11;
    __int16 v18 = 2048;
    uint64_t v19 = v12;
    _os_log_impl(&dword_22632B000, v9, OS_LOG_TYPE_DEFAULT, "Revert to Default MediaRemote NPQ Max Item Count: Reverse %ld, Forward %ld", buf, 0x16u);
  }

  MRMediaRemoteUnregisterForNowPlayingNotifications();
  MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 removeObserver:self];

  id v14 = [(ACCNowPlayingFeaturePlugin *)self nowPlayingClient];
  [v14 setDelegate:0];

  [(ACCNowPlayingFeaturePlugin *)self setNowPlayingClient:0];
  [(ACCNowPlayingFeaturePlugin *)self setPbqUpdateAccessoryList:0];
  [(ACCNowPlayingFeaturePlugin *)self setMpMusicPlayerControllerHandler:0];
  [(ACCNowPlayingFeaturePlugin *)self setMemUse:0];
  [(ACCNowPlayingFeaturePlugin *)self setMaxPlaybackQueueInfoCount:0];
  [(ACCNowPlayingFeaturePlugin *)self setPlaybackQueueInfoTimeoutMs:0];
  [(ACCNowPlayingFeaturePlugin *)self setMeasureMemoryUsage:0];
  [(ACCNowPlayingFeaturePlugin *)self setIsRunning:0];
}

void __40__ACCNowPlayingFeaturePlugin_stopPlugin__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) mpMusicPlayerControllerHandler];
  [v1 endGeneratingPlaybackNotifications];
}

- (void)_nowPlayingInfoDidChange
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22632B000, v0, v1, "cachedPlaybackAttributes: %@", v2, v3, v4, v5, v6);
}

- (void)_nowPlayingStateDidChange
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t v6 = 0;
    _os_log_impl(&dword_22632B000, v5, OS_LOG_TYPE_INFO, "_nowPlayingStateDidChange: Gather and process info", v6, 2u);
  }

  [(ACCNowPlayingFeaturePlugin *)self _nowPlayingInfoDidChange];
}

- (void)_nowPlayingAppDidChange
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t v6 = 0;
    _os_log_impl(&dword_22632B000, v5, OS_LOG_TYPE_INFO, "_nowPlayingAppDidChange: Gather and process info", v6, 2u);
  }

  [(ACCNowPlayingFeaturePlugin *)self _nowPlayingInfoDidChange];
}

- (void)_nowPlayingPlaybackQueueDidChange
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_22632B000, v5, OS_LOG_TYPE_INFO, "_nowPlayingPlaybackQueueDidChange: Tell client playbackQueueListDidChange", v7, 2u);
  }

  uint8_t v6 = [(ACCNowPlayingFeaturePlugin *)self nowPlayingClient];
  [v6 playbackQueueListDidChange];
}

- (void)_nowPlayingArtworkDidChange
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 nowPlayingClient];
  v4[0] = 67109120;
  v4[1] = [v3 shouldSendArtwork];
  _os_log_debug_impl(&dword_22632B000, a2, OS_LOG_TYPE_DEBUG, "#Artwork shouldSendArtwork: %d", (uint8_t *)v4, 8u);
}

- (void)nowPlayingInfoDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
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
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int64_t v8 = [(ACCSettingsState *)self->_nowPlayingInfoDebounceTimerValue intValue];
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2048;
    int64_t v12 = v8;
    _os_log_impl(&dword_22632B000, v7, OS_LOG_TYPE_INFO, "nowPlayingInfoDidChange: Notification received: %@, debounce=%ld", (uint8_t *)&v9, 0x16u);
  }

  if ([(ACCSettingsState *)self->_nowPlayingInfoDebounceTimerValue intValue] < 1) {
    [(ACCNowPlayingFeaturePlugin *)self _nowPlayingInfoDidChange];
  }
  else {
    [(ACCNowPlayingFeaturePlugin *)self _nowPlayingInfoDebounceTimerKick:1];
  }
}

- (void)nowPlayingStateDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
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
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int64_t v8 = [(ACCSettingsState *)self->_nowPlayingInfoDebounceTimerValue intValue];
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2048;
    int64_t v12 = v8;
    _os_log_impl(&dword_22632B000, v7, OS_LOG_TYPE_INFO, "nowPlayingStateDidChange: Notification received: %@, debounce=%ld", (uint8_t *)&v9, 0x16u);
  }

  if ([(ACCSettingsState *)self->_nowPlayingInfoDebounceTimerValue intValue] < 1) {
    [(ACCNowPlayingFeaturePlugin *)self _nowPlayingStateDidChange];
  }
  else {
    [(ACCNowPlayingFeaturePlugin *)self _nowPlayingInfoDebounceTimerKick:2];
  }
}

- (void)nowPlayingAppDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
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
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int64_t v8 = [(ACCSettingsState *)self->_nowPlayingInfoDebounceTimerValue intValue];
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2048;
    int64_t v12 = v8;
    _os_log_impl(&dword_22632B000, v7, OS_LOG_TYPE_INFO, "nowPlayingAppDidChange: Notification received: %@, debounce=%ld", (uint8_t *)&v9, 0x16u);
  }

  if ([(ACCSettingsState *)self->_nowPlayingInfoDebounceTimerValue intValue] < 1) {
    [(ACCNowPlayingFeaturePlugin *)self _nowPlayingAppDidChange];
  }
  else {
    [(ACCNowPlayingFeaturePlugin *)self _nowPlayingInfoDebounceTimerKick:4];
  }
}

- (void)nowPlayingPlaybackQueueDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
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
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int64_t v8 = [(ACCSettingsState *)self->_nowPlayingInfoDebounceTimerValue intValue];
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2048;
    int64_t v12 = v8;
    _os_log_impl(&dword_22632B000, v7, OS_LOG_TYPE_INFO, "nowPlayingPlaybackQueueDidChange: Notification received: %@, debounce=%ld", (uint8_t *)&v9, 0x16u);
  }

  if ([(ACCSettingsState *)self->_nowPlayingInfoDebounceTimerValue intValue] < 1) {
    [(ACCNowPlayingFeaturePlugin *)self _nowPlayingPlaybackQueueDidChange];
  }
  else {
    [(ACCNowPlayingFeaturePlugin *)self _nowPlayingInfoDebounceTimerKick:32];
  }
}

- (void)nowPlayingArtworkDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
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
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int64_t v8 = [(ACCSettingsState *)self->_nowPlayingInfoDebounceTimerValue intValue];
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2048;
    int64_t v12 = v8;
    _os_log_impl(&dword_22632B000, v7, OS_LOG_TYPE_INFO, "nowPlayingArtworkDidChange: Notification received: %@, debounce=%ld", (uint8_t *)&v9, 0x16u);
  }

  if ([(ACCSettingsState *)self->_nowPlayingInfoDebounceTimerValue intValue] < 1) {
    [(ACCNowPlayingFeaturePlugin *)self _nowPlayingArtworkDidChange];
  }
  else {
    [(ACCNowPlayingFeaturePlugin *)self _nowPlayingInfoDebounceTimerKick:64];
  }
}

- (unsigned)currentPlaybackStateMR
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(ACCNowPlayingFeaturePlugin *)self completionQueue];
  BOOL v5 = v3;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();

  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      id v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v19 = 5000;
      _os_log_impl(&dword_22632B000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] currentPlaybackStateMR: timed out (%d ms) waiting for MR PlaybackState", buf, 8u);
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    int v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    int v9 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *((_DWORD *)v15 + 6);
    *(_DWORD *)buf = 67109120;
    int v19 = v11;
    _os_log_impl(&dword_22632B000, v9, OS_LOG_TYPE_DEFAULT, "currentPlaybackStateMR: %d", buf, 8u);
  }

  unsigned int v12 = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  return v12;
}

intptr_t __52__ACCNowPlayingFeaturePlugin_currentPlaybackStateMR__block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)currentPlaybackAppBundleID
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  int v17 = __Block_byref_object_copy_;
  __int16 v18 = __Block_byref_object_dispose_;
  int v19 = &stru_26DA06AE8;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  MRMediaRemoteGetLocalOrigin();
  id v4 = [(ACCNowPlayingFeaturePlugin *)self completionQueue];
  BOOL v5 = v3;
  MRMediaRemoteGetNowPlayingClientForOrigin();

  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      id v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = 5000;
      _os_log_impl(&dword_22632B000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] currentPlaybackAppBundleID: timed out (%d ms) waiting for MR nowPlaying clientRef", buf, 8u);
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    int v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    int v9 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v15[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v11;
    _os_log_impl(&dword_22632B000, v9, OS_LOG_TYPE_DEFAULT, "currentPlaybackAppBundleID: %@", buf, 0xCu);
  }

  id v12 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v12;
}

intptr_t __56__ACCNowPlayingFeaturePlugin_currentPlaybackAppBundleID__block_invoke(uint64_t a1)
{
  CFStringRef BundleIdentifier = (const __CFString *)MRNowPlayingClientGetBundleIdentifier();
  if (BundleIdentifier)
  {
    CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], BundleIdentifier);
    if (Copy)
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
      BOOL v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = Copy;
    }
  }
  dispatch_time_t v6 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v6);
}

- (id)currentPlaybackAppName
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  int v17 = __Block_byref_object_copy_;
  __int16 v18 = __Block_byref_object_dispose_;
  int v19 = &stru_26DA06AE8;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  MRMediaRemoteGetLocalOrigin();
  uint64_t v4 = [(ACCNowPlayingFeaturePlugin *)self completionQueue];
  BOOL v5 = v3;
  MRMediaRemoteGetNowPlayingClientForOrigin();

  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      id v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = 5000;
      _os_log_impl(&dword_22632B000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] currentPlaybackAppName: timed out (%d ms) waiting for MR nowPlaying clientRef", buf, 8u);
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    int v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    int v9 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v15[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v11;
    _os_log_impl(&dword_22632B000, v9, OS_LOG_TYPE_DEFAULT, "currentPlaybackAppName: %@", buf, 0xCu);
  }

  id v12 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v12;
}

intptr_t __52__ACCNowPlayingFeaturePlugin_currentPlaybackAppName__block_invoke(uint64_t a1)
{
  CFStringRef DisplayName = (const __CFString *)MRNowPlayingClientGetDisplayName();
  if (DisplayName)
  {
    CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], DisplayName);
    if (Copy)
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
      BOOL v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = Copy;
    }
  }
  dispatch_time_t v6 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v6);
}

- (id)currentMediaItemAttributes
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = (id)0xAAAAAAAAAAAAAAAALL;
  id v29 = [MEMORY[0x263EFF9A0] dictionary];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  MRMediaRemoteGetLocalOrigin();
  uint64_t v4 = [(ACCNowPlayingFeaturePlugin *)self completionQueue];
  BOOL v5 = v3;
  int v23 = v5;
  MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork();

  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      id v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v31 = 5000;
      _os_log_impl(&dword_22632B000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] currentMediaItemAttributes: timed out (%d ms) waiting for MR nowPlayingInfo", buf, 8u);
    }
  }
  int v9 = [(ACCNowPlayingFeaturePlugin *)self completionQueue];
  uint64_t v22 = MEMORY[0x263EF8330];
  id v10 = v5;
  MRMediaRemoteGetSupportedCommands();

  dispatch_time_t v11 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      id v12 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v31 = 5000;
      _os_log_impl(&dword_22632B000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] currentMediaItemAttributes: timed out (%d ms) waiting for MR supportedCommands", buf, 8u);
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    uint64_t v14 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACCNowPlayingFeaturePlugin currentMediaItemAttributes]();
  }

  uint64_t v16 = [(ACCNowPlayingFeaturePlugin *)self cachedMediaItemAttributes];
  BOOL v17 = v16 == 0;

  if (v17)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      __int16 v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      __int16 v18 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[ACCNowPlayingFeaturePlugin currentMediaItemAttributes]();
    }

    [(ACCNowPlayingFeaturePlugin *)self setCachedMediaItemAttributes:v25[5]];
  }
  uint64_t v20 = (void *)[(id)v25[5] copy];

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __56__ACCNowPlayingFeaturePlugin_currentMediaItemAttributes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    dispatch_time_t v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    dispatch_time_t v6 = *(id *)gLogObjects;
  }
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  id v8 = (void *)MEMORY[0x263F54C18];
  int v9 = (void *)MEMORY[0x263F54B78];
  id v10 = (uint64_t *)MEMORY[0x263F54B98];
  dispatch_time_t v11 = (void *)MEMORY[0x263F54BC8];
  id v12 = (void *)MEMORY[0x263F54B60];
  if (v7)
  {
    v34 = [v3 objectForKeyedSubscript:*MEMORY[0x263F54C50]];
    v33 = [v3 objectForKeyedSubscript:*v8];
    uint64_t v32 = [v3 objectForKeyedSubscript:*MEMORY[0x263F54B38]];
    int v31 = [v3 objectForKeyedSubscript:*MEMORY[0x263F54B48]];
    v30 = [v3 objectForKeyedSubscript:*MEMORY[0x263F54BB0]];
    id v29 = [v3 objectForKeyedSubscript:*v9];
    v27 = [v3 objectForKeyedSubscript:*v10];
    v25 = [v3 objectForKeyedSubscript:*MEMORY[0x263F54C40]];
    id v13 = [v3 objectForKeyedSubscript:*MEMORY[0x263F54C38]];
    uint64_t v26 = [v3 objectForKeyedSubscript:*MEMORY[0x263F54B90]];
    uint64_t v14 = [v3 objectForKeyedSubscript:*MEMORY[0x263F54C28]];
    [v3 objectForKeyedSubscript:*MEMORY[0x263F54C20]];
    id v15 = log = v6;
    uint64_t v16 = [v3 objectForKeyedSubscript:*v11];
    BOOL v17 = [v3 objectForKeyedSubscript:*MEMORY[0x263F54BC0]];
    __int16 v18 = [v3 objectForKeyedSubscript:*MEMORY[0x263F54B60]];
    *(_DWORD *)buf = 138415874;
    v36 = v34;
    __int16 v37 = 2112;
    v38 = v33;
    __int16 v39 = 2112;
    v40 = v32;
    __int16 v41 = 2112;
    v42 = v31;
    __int16 v43 = 2112;
    v44 = v30;
    __int16 v45 = 2112;
    v46 = v29;
    __int16 v47 = 2112;
    v48 = v27;
    __int16 v49 = 2112;
    v50 = v25;
    __int16 v51 = 2112;
    v52 = v13;
    __int16 v53 = 2112;
    v54 = v26;
    __int16 v55 = 2112;
    v56 = v14;
    __int16 v57 = 2112;
    v58 = v15;
    __int16 v59 = 2112;
    v60 = v16;
    __int16 v61 = 2112;
    v62 = v17;
    __int16 v63 = 2112;
    v64 = v18;
    _os_log_impl(&dword_22632B000, log, OS_LOG_TYPE_DEFAULT, "currentMediaItemAttributes nowPlayingInfo: \nnowPlayingInfo Item Info \n    PID: %@ \n    Title: %@ \n    Album: %@ \n    Artist: %@ \n    Genre: %@ \n    Composer: %@ \n    Duration: %@ \n    Album Index/Count: %@ / %@ \n    Disc Index/Count: %@ / %@ \n    Chapter Count: %@ \n    Liked / Banned: %@ / %@ \n    artworkID; %@ \n",
      buf,
      0x98u);

    id v10 = (uint64_t *)MEMORY[0x263F54B98];
    dispatch_time_t v11 = (void *)MEMORY[0x263F54BC8];

    dispatch_time_t v6 = log;
    int v9 = (void *)MEMORY[0x263F54B78];

    id v12 = (void *)MEMORY[0x263F54B60];
    id v8 = (void *)MEMORY[0x263F54C18];
  }
  id v19 = &unk_26DA089F0;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyToKey:*MEMORY[0x263F22F28] fromKey:*MEMORY[0x263F54C50] inDictionary:v3 objectIfNil:&unk_26DA089F0];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyToKey:*MEMORY[0x263F22F38] fromKey:*v8 inDictionary:v3 objectIfNil:&stru_26DA06AE8];
  uint64_t v20 = *v10;
  uint64_t v21 = [v3 objectForKey:v20];

  if (v21)
  {
    uint64_t v22 = [v3 objectForKey:v20];
    [v22 doubleValue];
    id v19 = [NSNumber numberWithUnsignedLong:(unint64_t)(v23 * 1000.0)];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v19 forKey:*MEMORY[0x263F22F30]];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyToKey:*MEMORY[0x263F22EC8] fromKey:*MEMORY[0x263F54B38] inDictionary:v3 objectIfNil:&stru_26DA06AE8];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyToKey:*MEMORY[0x263F22ED8] fromKey:*MEMORY[0x263F54C40] inDictionary:v3 objectIfNil:&unk_26DA089F0];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyToKey:*MEMORY[0x263F22ED0] fromKey:*MEMORY[0x263F54C38] inDictionary:v3 objectIfNil:&unk_26DA089F0];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyToKey:*MEMORY[0x263F22EC0] fromKey:*MEMORY[0x263F54B90] inDictionary:v3 objectIfNil:&unk_26DA089F0];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyToKey:*MEMORY[0x263F22EB8] fromKey:*MEMORY[0x263F54C28] inDictionary:v3 objectIfNil:&unk_26DA089F0];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyToKey:*MEMORY[0x263F22EE0] fromKey:*MEMORY[0x263F54B48] inDictionary:v3 objectIfNil:&stru_26DA06AE8];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyToKey:*MEMORY[0x263F22F00] fromKey:*MEMORY[0x263F54BB0] inDictionary:v3 objectIfNil:&stru_26DA06AE8];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyToKey:*MEMORY[0x263F22EF8] fromKey:*v9 inDictionary:v3 objectIfNil:&stru_26DA06AE8];
  uint64_t v24 = MEMORY[0x263EFFA80];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyToKey:*MEMORY[0x263F22F20] fromKey:*v11 inDictionary:v3 objectIfNil:MEMORY[0x263EFFA80]];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyToKey:*MEMORY[0x263F22F10] fromKey:*MEMORY[0x263F54BC0] inDictionary:v3 objectIfNil:v24];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyToKey:*MEMORY[0x263F22EF0] fromKey:*MEMORY[0x263F54C20] inDictionary:v3 objectIfNil:v24];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyToKey:*MEMORY[0x263F22EE8] fromKey:*v12 inDictionary:v3 objectIfNil:&stru_26DA06AE8];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__ACCNowPlayingFeaturePlugin_currentMediaItemAttributes__block_invoke_160(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = v2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects <= 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = !v4;
  if (v2)
  {
    if (v5)
    {
      dispatch_time_t v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      dispatch_time_t v6 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)__int16 v37 = v3;
      _os_log_impl(&dword_22632B000, v6, OS_LOG_TYPE_INFO, "currentMediaItemAttributes supportedCommands: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      dispatch_time_t v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      dispatch_time_t v6 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __56__ACCNowPlayingFeaturePlugin_currentMediaItemAttributes__block_invoke_160_cold_1();
    }
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    char v12 = 0;
    char v13 = 0;
    uint64_t v14 = *(void *)v32;
    id v15 = MEMORY[0x263EF8438];
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v9);
        }
        int v17 = MEMORY[0x22A64DB30](*(void *)(*((void *)&v31 + 1) + 8 * i));
        if (v17 == 22)
        {
          uint64_t v21 = gLogObjects;
          int v22 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v23 = gNumLogObjects < 1;
          }
          else {
            BOOL v23 = 1;
          }
          if (v23)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)__int16 v37 = v21;
              *(_WORD *)&v37[8] = 1024;
              int v38 = v22;
              _os_log_error_impl(&dword_22632B000, v15, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            uint64_t v24 = v15;
            uint64_t v20 = v15;
          }
          else
          {
            uint64_t v20 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)__int16 v37 = 22;
            *(_WORD *)&v37[4] = 1024;
            *(_DWORD *)&v37[6] = v13 & 1;
            _os_log_impl(&dword_22632B000, v20, OS_LOG_TYPE_DEFAULT, "currentMediaItemAttributes supportedCommands: %d, isBanSupported=%d", buf, 0xEu);
          }
          char v13 = 1;
        }
        else
        {
          if (v17 != 21) {
            continue;
          }
          uint64_t v18 = gLogObjects;
          int v19 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            uint64_t v20 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)__int16 v37 = v18;
              *(_WORD *)&v37[8] = 1024;
              int v38 = v19;
              _os_log_error_impl(&dword_22632B000, v15, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v25 = v15;
            uint64_t v20 = v15;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)__int16 v37 = 21;
            *(_WORD *)&v37[4] = 1024;
            *(_DWORD *)&v37[6] = v12 & 1;
            _os_log_impl(&dword_22632B000, v20, OS_LOG_TYPE_DEFAULT, "currentMediaItemAttributes supportedCommands: %d, isLikeSupported=%d", buf, 0xEu);
          }
          char v12 = 1;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (!v11) {
        goto LABEL_54;
      }
    }
  }
  char v12 = 0;
  char v13 = 0;
LABEL_54:

  uint64_t v26 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v27 = [NSNumber numberWithBool:v12 & 1];
  [v26 setObject:v27 forKey:*MEMORY[0x263F22F18]];

  v28 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v29 = [NSNumber numberWithBool:v13 & 1];
  [v28 setObject:v29 forKey:*MEMORY[0x263F22F08]];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)currentMediaItemArtworkOriginal
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  int v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    dispatch_time_t v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    dispatch_time_t v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCNowPlayingFeaturePlugin currentMediaItemArtworkOriginal]();
  }

  MRMediaRemoteGetLocalOrigin();
  id v7 = [(ACCNowPlayingFeaturePlugin *)self completionQueue];
  id v8 = v3;
  MRMediaRemoteGetNowPlayingArtwork();

  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      uint64_t v10 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACCNowPlayingFeaturePlugin currentMediaItemArtworkOriginal](v10);
    }
  }
  id v12 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v12;
}

intptr_t __61__ACCNowPlayingFeaturePlugin_currentMediaItemArtworkOriginal__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = MEMORY[0x22A64DBF0](a2);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
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
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      id v8 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    else
    {
      id v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_22632B000, v8, OS_LOG_TYPE_INFO, "#Artwork No artwork image received from MediaRemote!", v10, 2u);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)currentMediaItemArtwork
{
  v32[3] = *MEMORY[0x263EF8340];
  id v2 = [(ACCNowPlayingFeaturePlugin *)self currentMediaItemArtworkOriginal];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(ACCNowPlayingFeaturePlugin *)v2 currentMediaItemArtwork];
  }

  if (!v2) {
    goto LABEL_57;
  }
  BOOL v6 = CGImageSourceCreateWithData((CFDataRef)v2, 0);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v7 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(ACCNowPlayingFeaturePlugin *)v6 currentMediaItemArtwork];
  }

  dispatch_time_t v9 = [MEMORY[0x263EFF990] data];
  uint64_t v10 = CGImageDestinationCreateWithData(v9, (CFStringRef)*MEMORY[0x263F01A80], 1uLL, 0);
  uint64_t v11 = *MEMORY[0x263F0EFE8];
  v32[0] = &unk_26DA08A20;
  uint64_t v12 = *MEMORY[0x263F0F248];
  v31[0] = v11;
  v31[1] = v12;
  char v13 = [MEMORY[0x263EFF9D0] null];
  v32[1] = v13;
  v31[2] = *MEMORY[0x263F0F3C0];
  uint64_t v14 = [MEMORY[0x263EFF9D0] null];
  v32[2] = v14;
  CFDictionaryRef v15 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
  CGImageDestinationAddImageFromSource(v10, v6, 0, v15);

  BOOL v16 = CGImageDestinationFinalize(v10);
  if (gLogObjects) {
    BOOL v17 = gNumLogObjects <= 0;
  }
  else {
    BOOL v17 = 1;
  }
  int v18 = !v17;
  if (v16)
  {
    if (v18)
    {
      id v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      id v19 = MEMORY[0x263EF8438];
      id v21 = MEMORY[0x263EF8438];
    }
    BOOL v22 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);

    if (v22)
    {
      BOOL v23 = CGImageSourceCreateWithData(v9, 0);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v24 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
        }
        uint64_t v24 = MEMORY[0x263EF8438];
        id v27 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        [(ACCNowPlayingFeaturePlugin *)v23 currentMediaItemArtwork];
      }

      if (v23) {
        CFRelease(v23);
      }
    }
    uint64_t v26 = v9;
    if (v10) {
LABEL_53:
    }
      CFRelease(v10);
  }
  else
  {
    if (v18)
    {
      uint64_t v20 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      uint64_t v20 = MEMORY[0x263EF8438];
      id v25 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ACCNowPlayingFeaturePlugin currentMediaItemArtwork].cold.6();
    }

    uint64_t v26 = 0;
    if (v10) {
      goto LABEL_53;
    }
  }

  if (v6) {
    CFRelease(v6);
  }
  if (!v26)
  {
LABEL_57:
    uint64_t v26 = [MEMORY[0x263EFF8F8] dataWithBytes:0 length:0];
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v28 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    v28 = MEMORY[0x263EF8438];
    id v29 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    [(ACCNowPlayingFeaturePlugin *)v26 currentMediaItemArtwork];
  }

  return v26;
}

- (id)currentPlaybackAttributes
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  BOOL v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = (id)0xAAAAAAAAAAAAAAAALL;
  id v25 = [MEMORY[0x263EFF9A0] dictionary];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  MRMediaRemoteGetLocalOrigin();
  id v4 = [(ACCNowPlayingFeaturePlugin *)self completionQueue];
  id v19 = v3;
  MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork();

  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v19, v5);
  BOOL v6 = [(ACCNowPlayingFeaturePlugin *)self completionQueue];
  id v7 = v19;
  MRMediaRemoteGetSupportedCommands();

  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      dispatch_time_t v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      dispatch_time_t v9 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v27 = 5000;
      _os_log_impl(&dword_22632B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] currentPlaybackAttributes: timed out (%d ms) waiting for MR supportedCommands", buf, 8u);
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    uint64_t v11 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ACCNowPlayingFeaturePlugin currentPlaybackAttributes]();
  }

  char v13 = [(ACCNowPlayingFeaturePlugin *)self cachedPlaybackAttributes];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      CFDictionaryRef v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      CFDictionaryRef v15 = MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[ACCNowPlayingFeaturePlugin currentPlaybackAttributes]();
    }

    [(ACCNowPlayingFeaturePlugin *)self setCachedPlaybackAttributes:v21[5]];
  }
  BOOL v17 = (void *)[(id)v21[5] copy];

  _Block_object_dispose(&v20, 8);
  return v17;
}

void __55__ACCNowPlayingFeaturePlugin_currentPlaybackAttributes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    BOOL v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __55__ACCNowPlayingFeaturePlugin_currentPlaybackAttributes__block_invoke_cold_2();
  }

  id v7 = a2;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    dispatch_time_t v8 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    dispatch_time_t v8 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  uint64_t v11 = (void *)MEMORY[0x263F54C10];
  id v12 = (void *)MEMORY[0x263F54BA0];
  char v13 = (void *)MEMORY[0x263F54B98];
  BOOL v14 = (uint64_t *)MEMORY[0x263F54BE0];
  if (v10)
  {
    uint64_t v15 = *MEMORY[0x263F54C10];
    __int16 v55 = [v7 objectForKeyedSubscript:*MEMORY[0x263F54C10]];
    __int16 v49 = [v7 objectForKeyedSubscript:v15];
    [v49 timeIntervalSince1970];
    uint64_t v17 = v16;
    v54 = [v7 objectForKeyedSubscript:*v12];
    __int16 v53 = [v7 objectForKeyedSubscript:*v13];
    v52 = [v7 objectForKeyedSubscript:*v14];
    v50 = [v7 objectForKeyedSubscript:*MEMORY[0x263F54B80]];
    v48 = [v7 objectForKeyedSubscript:*MEMORY[0x263F54BE8]];
    __int16 v47 = [v7 objectForKeyedSubscript:*MEMORY[0x263F54C30]];
    int v18 = [v7 objectForKeyedSubscript:*MEMORY[0x263F54B70]];
    [v7 objectForKeyedSubscript:*MEMORY[0x263F54C20]];
    id v19 = log = v8;
    uint64_t v20 = [v7 objectForKeyedSubscript:*MEMORY[0x263F54BB8]];
    id v21 = [v7 objectForKeyedSubscript:*MEMORY[0x263F54BF0]];
    uint64_t v22 = [v7 objectForKeyedSubscript:*MEMORY[0x263F54BF8]];
    BOOL v23 = [v7 objectForKeyedSubscript:*MEMORY[0x263F54BD0]];
    *(_DWORD *)buf = 138415618;
    __int16 v57 = v55;
    __int16 v58 = 2048;
    uint64_t v59 = v17;
    __int16 v60 = 2112;
    __int16 v61 = v54;
    __int16 v62 = 2112;
    __int16 v63 = v53;
    __int16 v64 = 2112;
    uint64_t v65 = v52;
    __int16 v66 = 2112;
    v67 = v50;
    __int16 v68 = 2112;
    v69 = v48;
    __int16 v70 = 2112;
    v71 = v47;
    __int16 v72 = 2112;
    v73 = v18;
    __int16 v74 = 2112;
    v75 = v19;
    __int16 v76 = 2112;
    v77 = v20;
    __int16 v78 = 2112;
    v79 = v21;
    __int16 v80 = 2112;
    v81 = v22;
    __int16 v82 = 2112;
    v83 = v23;
    _os_log_impl(&dword_22632B000, log, OS_LOG_TYPE_DEFAULT, "currentPlaybackAttributes nowPlayingInfo: \nnowPlayingInfoInfo Playback Info \n    Timestamp: %@ (%f) \n    ElapsedTime: %@ / %@ \n    PlaybackRate: %@ (%@) \n    Index / Count: %@ / %@ \n    Chapter: %@ / %@ \n    IsAd: %@ \n    RadioStation: %@ (%@)\n    IsMusicApp: %@\n", buf, 0x8Eu);

    id v12 = (void *)MEMORY[0x263F54BA0];
    uint64_t v11 = (void *)MEMORY[0x263F54C10];

    BOOL v14 = (uint64_t *)MEMORY[0x263F54BE0];
    dispatch_time_t v8 = log;

    char v13 = (void *)MEMORY[0x263F54B98];
  }

  uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v25 = [v7 objectForKeyedSubscript:*v12];
  uint64_t v26 = [v7 objectForKeyedSubscript:*v13];
  uint64_t v27 = *v14;
  uint64_t v28 = [v7 objectForKeyedSubscript:*v14];
  id v29 = [v7 objectForKeyedSubscript:*v11];
  v30 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", (unint64_t)(calculateCurrentElapsedTime(v25, v26, v28, v29) * 1000.0));
  [v24 setObject:v30 forKey:*MEMORY[0x263F22F50]];

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copyToKey:*MEMORY[0x263F22F78] fromKey:*MEMORY[0x263F54BE8] inDictionary:v7 objectIfNil:&unk_26DA089F0];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copyToKey:*MEMORY[0x263F22F70] fromKey:*MEMORY[0x263F54C30] inDictionary:v7 objectIfNil:&unk_26DA089F0];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copyToKey:*MEMORY[0x263F22F68] fromKey:*MEMORY[0x263F54B70] inDictionary:v7 objectIfNil:&unk_26DA089F0];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copyToKey:*MEMORY[0x263F22FA0] fromKey:*MEMORY[0x263F54BB8] inDictionary:v7 objectIfNil:MEMORY[0x263EFFA80]];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copyToKey:*MEMORY[0x263F22FA8] fromKey:*MEMORY[0x263F54BF0] inDictionary:v7 objectIfNil:&stru_26DA06AE8];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copyToKey:*MEMORY[0x263F22FB0] fromKey:*MEMORY[0x263F54BF8] inDictionary:v7 objectIfNil:&stru_26DA06AE8];
  long long v31 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  long long v32 = [NSNumber numberWithUnsignedInteger:0];
  [v31 setObject:v32 forKey:*MEMORY[0x263F22FB8]];

  long long v33 = [v7 objectForKey:v27];
  long long v34 = [v7 objectForKey:*MEMORY[0x263F54B80]];
  uint64_t v35 = *MEMORY[0x263F54BD0];
  v36 = [v7 objectForKey:*MEMORY[0x263F54BD0]];
  __int16 v37 = v36;
  if (v36) {
    int v38 = [v36 BOOLValue];
  }
  else {
    int v38 = 0;
  }
  uint64_t v39 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v40 = calculatePlaybackSpeed(v33, v34, v38);
  [v39 setObject:v40 forKey:*MEMORY[0x263F22F60]];

  __int16 v41 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v42 = convertPlaybackStatus([*(id *)(a1 + 32) currentPlaybackStateMR], v33, v34);
  [v41 setObject:v42 forKey:*MEMORY[0x263F22F98]];

  __int16 v43 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v44 = [*(id *)(a1 + 32) currentPlaybackAppName];
  [v43 setObject:v44 forKey:*MEMORY[0x263F22F48] objectIfNil:&stru_26DA06AE8];

  __int16 v45 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v46 = [*(id *)(a1 + 32) currentPlaybackAppBundleID];
  [v45 setObject:v46 forKey:*MEMORY[0x263F22F40] objectIfNil:&stru_26DA06AE8];

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copyToKey:*MEMORY[0x263F22F58] fromKey:v35 inDictionary:v7 objectIfNil:MEMORY[0x263EFFA80]];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __55__ACCNowPlayingFeaturePlugin_currentPlaybackAttributes__block_invoke_167(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v49 = *MEMORY[0x263F22F80];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setObject:forKey:", &unk_26DA08A08);
  uint64_t v48 = *MEMORY[0x263F22F90];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setObject:forKey:", &unk_26DA08A08);
  uint64_t v50 = a1;
  BOOL v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = [NSNumber numberWithBool:0];
  uint64_t v47 = *MEMORY[0x263F22F88];
  objc_msgSend(v4, "setObject:forKey:", v5);

  id v6 = a2;
  id v7 = v6;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects <= 0;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  if (v6)
  {
    if (v9)
    {
      BOOL v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      BOOL v10 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)__int16 v57 = v7;
      _os_log_impl(&dword_22632B000, v10, OS_LOG_TYPE_INFO, "currentPlaybackAttributes supportedCommands: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      BOOL v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      BOOL v10 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __56__ACCNowPlayingFeaturePlugin_currentMediaItemAttributes__block_invoke_160_cold_1();
    }
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v52;
    int v18 = MEMORY[0x263EF8438];
    *(void *)&long long v15 = 134218240;
    long long v46 = v15;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v52 != v17) {
          objc_enumerationMutation(v13);
        }
        int v20 = MEMORY[0x22A64DB30](*(void *)(*((void *)&v51 + 1) + 8 * i));
        if (MRMediaRemoteCommandInfoGetEnabled())
        {
          uint64_t v21 = gLogObjects;
          int v22 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v23 = gNumLogObjects < 1;
          }
          else {
            BOOL v23 = 1;
          }
          if (v23)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v46;
              *(void *)__int16 v57 = v21;
              *(_WORD *)&v57[8] = 1024;
              *(_DWORD *)&v57[10] = v22;
              _os_log_error_impl(&dword_22632B000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            uint64_t v24 = v18;
            id v25 = v18;
          }
          else
          {
            id v25 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)__int16 v57 = v20;
            _os_log_impl(&dword_22632B000, v25, OS_LOG_TYPE_INFO, "currentPlaybackAttributes supportedCommands: supportedCommand=%d", buf, 8u);
          }

          switch(v20)
          {
            case 26:
              id v29 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
              uint64_t v33 = gLogObjects;
              int v34 = gNumLogObjects;
              if (gLogObjects && gNumLogObjects >= 1)
              {
                uint64_t v35 = *(id *)gLogObjects;
              }
              else
              {
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v46;
                  *(void *)__int16 v57 = v33;
                  *(_WORD *)&v57[8] = 1024;
                  *(_DWORD *)&v57[10] = v34;
                  _os_log_error_impl(&dword_22632B000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v42 = v18;
                uint64_t v35 = v18;
              }
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)__int16 v57 = 26;
                *(_WORD *)&v57[4] = 2112;
                *(void *)&v57[6] = v29;
                _os_log_impl(&dword_22632B000, v35, OS_LOG_TYPE_DEFAULT, "currentPlaybackAttributes supportedCommands: %d, ShuffleMode=%@", buf, 0x12u);
              }

              __int16 v43 = *(void **)(*(void *)(*(void *)(v50 + 40) + 8) + 40);
              int v38 = convertShuffleMode(v29);
              uint64_t v39 = v43;
              v40 = v38;
              uint64_t v41 = v48;
              break;
            case 25:
              id v29 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
              uint64_t v30 = gLogObjects;
              int v31 = gNumLogObjects;
              if (gLogObjects && gNumLogObjects >= 1)
              {
                long long v32 = *(id *)gLogObjects;
              }
              else
              {
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v46;
                  *(void *)__int16 v57 = v30;
                  *(_WORD *)&v57[8] = 1024;
                  *(_DWORD *)&v57[10] = v31;
                  _os_log_error_impl(&dword_22632B000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v36 = v18;
                long long v32 = v18;
              }
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)__int16 v57 = 25;
                *(_WORD *)&v57[4] = 2112;
                *(void *)&v57[6] = v29;
                _os_log_impl(&dword_22632B000, v32, OS_LOG_TYPE_DEFAULT, "currentPlaybackAttributes supportedCommands: %d, RepeastMode=%@", buf, 0x12u);
              }

              __int16 v37 = *(void **)(*(void *)(*(void *)(v50 + 40) + 8) + 40);
              int v38 = convertRepeatMode(v29);
              uint64_t v39 = v37;
              v40 = v38;
              uint64_t v41 = v49;
              break;
            case 24:
              uint64_t v26 = gLogObjects;
              int v27 = gNumLogObjects;
              if (gLogObjects && gNumLogObjects >= 1)
              {
                uint64_t v28 = *(id *)gLogObjects;
              }
              else
              {
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v46;
                  *(void *)__int16 v57 = v26;
                  *(_WORD *)&v57[8] = 1024;
                  *(_DWORD *)&v57[10] = v27;
                  _os_log_error_impl(&dword_22632B000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v44 = v18;
                uint64_t v28 = v18;
              }
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)__int16 v57 = 24;
                _os_log_impl(&dword_22632B000, v28, OS_LOG_TYPE_DEFAULT, "currentPlaybackAttributes supportedCommands: %d, SetTimeElpasedAvailable", buf, 8u);
              }

              __int16 v45 = *(void **)(*(void *)(*(void *)(v50 + 40) + 8) + 40);
              id v29 = [NSNumber numberWithBool:1];
              [v45 setObject:v29 forKey:v47];
              goto LABEL_69;
            default:
              continue;
          }
          objc_msgSend(v39, "setObject:forKey:", v40, v41, v46);

LABEL_69:
          continue;
        }
      }
      uint64_t v16 = [v13 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v16);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v50 + 32));
}

- (BOOL)setPlaybackElapsedTime:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_22632B000, v6, OS_LOG_TYPE_DEFAULT, "Received set playback elapsed time: %@", (uint8_t *)&v8, 0xCu);
  }

  [v3 unsignedLongValue];
  MRMediaRemoteSetElapsedTime();

  return 1;
}

- (BOOL)setPlaybackQueueIndex:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
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
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
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
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_22632B000, v7, OS_LOG_TYPE_DEFAULT, "Received set playback queue index: %@", buf, 0xCu);
  }

  int v8 = [(ACCNowPlayingFeaturePlugin *)self mpMusicPlayerControllerQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__ACCNowPlayingFeaturePlugin_setPlaybackQueueIndex___block_invoke;
  v11[3] = &unk_26479D7E8;
  v11[4] = self;
  id v12 = v4;
  id v9 = v4;
  dispatch_sync(v8, v11);

  return 0;
}

void __52__ACCNowPlayingFeaturePlugin_setPlaybackQueueIndex___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mpMusicPlayerControllerHandler];
  if (v2)
  {
    id v3 = objc_msgSend(v2, "nowPlayingItemAtIndex:", objc_msgSend(*(id *)(a1 + 40), "unsignedLongValue"));
    if (v3)
    {
      [v2 setNowPlayingItem:v3];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
        }
        id v6 = MEMORY[0x263EF8438];
        id v7 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __52__ACCNowPlayingFeaturePlugin_setPlaybackQueueIndex___block_invoke_cold_3();
      }
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 1;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      id v3 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    else
    {
      id v3 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __52__ACCNowPlayingFeaturePlugin_setPlaybackQueueIndex___block_invoke_cold_1();
    }
  }
}

- (void)requestPlaybackQueueListInfo:(id)a3 requestID:(id)a4 startIndex:(unsigned int)a5 upToCount:(unsigned int)a6 infoMask:(unsigned int)a7
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = [(ACCNowPlayingFeaturePlugin *)self cachedPlaybackAttributes];
  uint64_t v15 = [v14 objectForKey:*MEMORY[0x263F22F70]];
  unsigned int v16 = [v15 unsignedIntegerValue];

  uint64_t v17 = [(ACCSettingsState *)self->_maxPlaybackQueueInfoCount intValue];
  if (v17 >= 1
    && ((uint64_t v18 = v17, v17 >= (unint64_t)a6) ? (v19 = a6 == 0) : (v19 = 1),
        v19 ? (BOOL v20 = v16 > (unint64_t)v17) : (BOOL v20 = 0),
        v20))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v27 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      int v27 = MEMORY[0x263EF8438];
      id v28 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v38 = v12;
      __int16 v39 = 2048;
      uint64_t v40 = v18;
      __int16 v41 = 1024;
      unsigned int v42 = a6;
      __int16 v43 = 1024;
      unsigned int v44 = v16;
      _os_log_impl(&dword_22632B000, v27, OS_LOG_TYPE_DEFAULT, "requestPlaybackQueueListInfo: accessoryUID %@, ignore request, maxPlaybackQueueInfoCount=%ld upToCount=%u count=%u !!!!!!!!", buf, 0x22u);
    }
  }
  else
  {
    int64_t v21 = [(ACCSettingsState *)self->_playbackQueueInfoTimeoutMs intValue];
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v23 = v22 * 1000.0;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v24 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      uint64_t v24 = MEMORY[0x263EF8438];
      id v25 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413826;
      id v38 = v12;
      __int16 v39 = 2112;
      uint64_t v40 = (uint64_t)v13;
      __int16 v41 = 1024;
      unsigned int v42 = a5;
      __int16 v43 = 1024;
      unsigned int v44 = a6;
      __int16 v45 = 1024;
      unsigned int v46 = a7;
      __int16 v47 = 2048;
      int64_t v48 = v21;
      __int16 v49 = 2048;
      unint64_t v50 = (unint64_t)v23;
      _os_log_impl(&dword_22632B000, v24, OS_LOG_TYPE_DEFAULT, "Received requestPlaybackQueueListInfo: %@ requestID: %@ startIndex: %u upToCount: %u infoMask: 0x%x, playbackQueueInfoTimeoutMs=%ld startTimeMs=%lld", buf, 0x3Cu);
    }

    nowPlayingInfoPBQueueListQ = self->_nowPlayingInfoPBQueueListQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke;
    block[3] = &unk_26479D8D8;
    block[4] = self;
    id v30 = v12;
    unsigned int v34 = a7;
    unsigned int v35 = a5;
    unsigned int v36 = a6;
    id v31 = v13;
    unint64_t v32 = (unint64_t)v23;
    int64_t v33 = v21;
    dispatch_async(nowPlayingInfoPBQueueListQ, block);
  }
}

void __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKey:*(void *)(a1 + 40)];
  if (v2) {
    goto LABEL_13;
  }
  if (!gLogObjects || gNumLogObjects < 1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = v6;
    _os_log_impl(&dword_22632B000, v5, OS_LOG_TYPE_INFO, "requestPlaybackQueueListInfo: create new accessory object for accessoryUID %@", buf, 0xCu);
  }

  id v2 = [[_ACCNowPlayingPBQUpdateRequestAccessory alloc] initWithAccessoryUID:*(void *)(a1 + 40)];
  id v7 = *(void **)(*(void *)(a1 + 32) + 80);
  int v8 = [(_ACCNowPlayingPBQUpdateRequestAccessory *)v2 accessoryUID];
  [v7 setObject:v2 forKey:v8];

  if (v2)
  {
LABEL_13:
    int v9 = *(_DWORD *)(a1 + 72);
    uint64_t v10 = [(_ACCNowPlayingPBQUpdateRequestAccessory *)v2 currentRequestID];
    if (v10)
    {
    }
    else if (*(void *)(a1 + 48))
    {
      uint64_t v15 = [[_ACCNowPlayingPBQUpdateRequest alloc] initWithID:*(void *)(a1 + 48) startIndex:*(unsigned int *)(a1 + 76) upToCount:*(unsigned int *)(a1 + 80) infoMask:*(unsigned int *)(a1 + 72) allowNonLibrary:v9 >= 0];
      [(_ACCNowPlayingPBQUpdateRequest *)v15 setStartTimeMs:*(void *)(a1 + 56)];
      if (gLogObjects && gNumLogObjects >= 1)
      {
        unsigned int v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
        }
        unsigned int v16 = MEMORY[0x263EF8438];
        id v18 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v30 = v19;
        __int16 v31 = 2112;
        unint64_t v32 = v15;
        _os_log_impl(&dword_22632B000, v16, OS_LOG_TYPE_INFO, "requestPlaybackQueueListInfo: %@ created request %@", buf, 0x16u);
      }

      [(_ACCNowPlayingPBQUpdateRequestAccessory *)v2 setCurrentRequestID:*(void *)(a1 + 48)];
      [(_ACCNowPlayingPBQUpdateRequestAccessory *)v2 setCurrentRequest:v15];
      goto LABEL_37;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      id v11 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v14 = *(_ACCNowPlayingPBQUpdateRequest **)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = v13;
      __int16 v31 = 2112;
      unint64_t v32 = v14;
      _os_log_impl(&dword_22632B000, v11, OS_LOG_TYPE_INFO, "requestPlaybackQueueListInfo: requestID %@ already exists for accessory %@, ignore request (should cancel request first)", buf, 0x16u);
    }

    uint64_t v15 = 0;
LABEL_37:
    BOOL v20 = [(_ACCNowPlayingPBQUpdateRequestAccessory *)v2 queue];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_174;
    v25[3] = &unk_26479D8B0;
    uint64_t v21 = *(void *)(a1 + 64);
    v25[4] = *(void *)(a1 + 32);
    uint64_t v26 = v2;
    int v27 = v15;
    uint64_t v28 = v21;
    double v22 = v15;
    uint64_t v17 = v2;
    dispatch_async(v20, v25);

    goto LABEL_38;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v17 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    uint64_t v17 = MEMORY[0x263EF8438];
    id v23 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = v24;
    _os_log_impl(&dword_22632B000, v17, OS_LOG_TYPE_DEFAULT, "requestPlaybackQueueListInfo: failed to find accessory for accessoryUID %@", buf, 0xCu);
  }
LABEL_38:
}

void __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_174(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_2;
  v17[3] = &unk_26479D860;
  v17[4] = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x22A64DF90](v17);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_178;
  v16[3] = &unk_26479D888;
  uint64_t v3 = *(void *)(a1 + 56);
  v16[4] = *(void *)(a1 + 32);
  v16[5] = v3;
  id v4 = (void *)MEMORY[0x22A64DF90](v16);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v5 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v5 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    unint64_t v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    _os_log_impl(&dword_22632B000, v5, OS_LOG_TYPE_INFO, "requestPlaybackQueueListInfo: call _generatePlaybackQueueItemsWithPropertyList, accessory=%@ request=%@", buf, 0x16u);
  }

  [*(id *)(a1 + 32) _generatePlaybackQueueItemsWithPropertyList:*(void *)(a1 + 40) request:*(void *)(a1 + 48) completionHandler:v2 continueQuery:v4];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v10 = v9;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v11 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [*(id *)(a1 + 48) startTimeMs];
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134218498;
    unint64_t v19 = (unint64_t)(v10 * 1000.0) - v13;
    __int16 v20 = 2112;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    uint64_t v23 = v15;
    _os_log_impl(&dword_22632B000, v11, OS_LOG_TYPE_INFO, "requestPlaybackQueueListInfo: finished in %lld ms, accessory=%@ request=%@", buf, 0x20u);
  }
}

void __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  double v9 = a4;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v12 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  else
  {
    id v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v40 = v9;
    _os_log_impl(&dword_22632B000, v12, OS_LOG_TYPE_INFO, "requestPlaybackQueueListInfo: completionCB: %@, reqID=%@ info=%@", buf, 0x20u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy_;
  __int16 v41 = __Block_byref_object_dispose_;
  id v42 = 0;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(NSObject **)(v13 + 128);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_175;
  block[3] = &unk_26479D810;
  unint64_t v32 = buf;
  block[4] = v13;
  id v15 = v7;
  id v31 = v15;
  dispatch_sync(v14, block);
  unsigned int v16 = *(void **)(*(void *)&buf[8] + 40);
  if (v16)
  {
    uint64_t v17 = [v16 currentRequestID];
    int v18 = [v8 isEqualToString:v17];

    if (v18)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        unint64_t v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
        }
        unint64_t v19 = MEMORY[0x263EF8438];
        id v22 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v33 = 138412802;
        id v34 = v15;
        __int16 v35 = 2112;
        id v36 = v8;
        __int16 v37 = 2112;
        id v38 = v9;
        _os_log_impl(&dword_22632B000, v19, OS_LOG_TYPE_DEFAULT, "requestPlaybackQueueListInfo: completionCB: %@, reqID=%@, call playbackQueueListInfoResponse info=%@", v33, 0x20u);
      }

      [*(id *)(*(void *)(a1 + 32) + 16) playbackQueueListInfoResponse:v15 requestID:v8 info:v9];
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v23 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      uint64_t v23 = MEMORY[0x263EF8438];
      id v24 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_2_cold_2();
    }

    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = *(NSObject **)(v25 + 128);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_176;
    v27[3] = &unk_26479D838;
    v27[4] = v25;
    id v28 = v15;
    id v29 = buf;
    dispatch_sync(v26, v27);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      __int16 v20 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      __int16 v20 = MEMORY[0x263EF8438];
      id v21 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v33 = 138412290;
      id v34 = v15;
      _os_log_impl(&dword_22632B000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] requestPlaybackQueueListInfo: completionCB: %@, no accessory obejct to handle completion!", v33, 0xCu);
    }
  }
  _Block_object_dispose(buf, 8);
}

uint64_t __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_175(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 80) objectForKey:a1[5]];
  return MEMORY[0x270F9A758]();
}

void __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_176(void *a1)
{
  [*(id *)(a1[4] + 80) removeObjectForKey:a1[5]];
  uint64_t v2 = *(void *)(a1[6] + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

uint64_t __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_178(uint64_t a1, void *a2, void *a3, char a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if ((a4 & 0x7F) != 0
    || *(void *)(a1 + 40) == -1
    || ([MEMORY[0x263EFF910] timeIntervalSinceReferenceDate],
        unint64_t v10 = (unint64_t)(v9 * 1000.0),
        *(void *)(a1 + 40) + [v8 startTimeMs] > v10))
  {
    uint64_t v11 = 0;
    if (v7 && v8)
    {
      id v12 = [v8 requestID];
      uint64_t v13 = [v7 currentRequestID];
      uint64_t v11 = [v12 isEqualToString:v13];
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      uint64_t v14 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = [v7 accessoryUID];
      uint64_t v17 = [v8 requestID];
      uint64_t v18 = [v8 startTimeMs];
      uint64_t v19 = *(void *)(a1 + 40);
      __int16 v20 = [*(id *)(a1 + 32) playbackQueueInfoSendPartialOnTimeout];
      int v25 = 138413570;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      id v28 = v17;
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      __int16 v31 = 2048;
      unint64_t v32 = v10;
      __int16 v33 = 2048;
      uint64_t v34 = v19;
      __int16 v35 = 2048;
      uint64_t v36 = [v20 intValue];
      _os_log_impl(&dword_22632B000, v14, OS_LOG_TYPE_DEFAULT, "requestPlaybackQueueListInfo: continueCB: %@, request %@ timed out!, start=%lld cur=%lld timeout=%ld !!!!!!!! (SendPartialOnTimeout=%ld)", (uint8_t *)&v25, 0x3Eu);
    }
    id v21 = [*(id *)(a1 + 32) playbackQueueInfoSendPartialOnTimeout];
    if ([v21 intValue] == 1)
    {
    }
    else
    {
      id v22 = [*(id *)(a1 + 32) playbackQueueInfoSendPartialOnTimeout];
      uint64_t v23 = [v22 intValue];

      if (v23 != 3)
      {
        uint64_t v11 = 0;
        goto LABEL_20;
      }
    }
    uint64_t v11 = 0xFFFFFFFFLL;
  }
LABEL_20:

  return v11;
}

- (void)cancelRequestPlaybackQueueListInfo:(id)a3 requestID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
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
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    unint64_t v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    unint64_t v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_22632B000, v10, OS_LOG_TYPE_DEFAULT, "Received cancelRequestPlaybackQueueListInfo: %@ requestID: %@", buf, 0x16u);
  }

  nowPlayingInfoPBQueueListQ = self->_nowPlayingInfoPBQueueListQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__ACCNowPlayingFeaturePlugin_cancelRequestPlaybackQueueListInfo_requestID___block_invoke;
  block[3] = &unk_26479D900;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(nowPlayingInfoPBQueueListQ, block);
}

void __75__ACCNowPlayingFeaturePlugin_cancelRequestPlaybackQueueListInfo_requestID___block_invoke(void *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKey:a1[5]];
  uint64_t v3 = (void *)v2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects <= 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = !v4;
  if (!v2)
  {
    if (v5)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      id v7 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_45;
    }
    uint64_t v16 = a1[5];
    int v24 = 138412290;
    uint64_t v25 = v16;
    uint64_t v17 = "cancelRequestPlaybackQueueListInfo: failed to find accessory for accessoryUID %@";
    id v18 = v7;
    uint32_t v19 = 12;
    goto LABEL_44;
  }
  if (v5)
  {
    id v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __75__ACCNowPlayingFeaturePlugin_cancelRequestPlaybackQueueListInfo_requestID___block_invoke_cold_5();
  }

  id v9 = (void *)a1[6];
  unint64_t v10 = [v3 currentRequestID];
  int v11 = [v9 isEqualToString:v10];

  if (gLogObjects) {
    BOOL v12 = gNumLogObjects <= 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (!v11)
  {
    if (v13)
    {
      id v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      id v7 = MEMORY[0x263EF8438];
      id v21 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_45;
    }
    uint64_t v23 = a1[5];
    uint64_t v22 = a1[6];
    int v24 = 138412546;
    uint64_t v25 = v22;
    __int16 v26 = 2112;
    uint64_t v27 = v23;
    uint64_t v17 = "cancelRequestPlaybackQueueListInfo: failed to find requestID %@ for accessory %@";
    id v18 = v7;
    uint32_t v19 = 22;
LABEL_44:
    _os_log_impl(&dword_22632B000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v24, v19);
LABEL_45:

    goto LABEL_46;
  }
  if (v13)
  {
    uint64_t v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    uint64_t v14 = MEMORY[0x263EF8438];
    id v20 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __75__ACCNowPlayingFeaturePlugin_cancelRequestPlaybackQueueListInfo_requestID___block_invoke_cold_2();
  }

  [v3 setCurrentRequestID:0];
  [v3 setCurrentRequest:0];
LABEL_46:
}

- (void)_generatePlaybackQueueItemsWithPropertyList:(id)a3 request:(id)a4 completionHandler:(id)a5 continueQuery:(id)a6
{
  uint64_t v205 = *MEMORY[0x263EF8340];
  id v175 = a3;
  id v10 = a4;
  v172 = (void (**)(id, NSObject *, void *, id))a5;
  v173 = (uint64_t (**)(id, id, id, void))a6;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
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
    uint64_t v14 = [v175 accessoryUID];
    id v15 = [v10 requestID];
    uint64_t v6 = [v10 startIndex];
    *(_DWORD *)buf = 138413314;
    *(void *)v189 = v14;
    *(_WORD *)&v189[8] = 2112;
    *(void *)v190 = v15;
    *(_WORD *)&v190[8] = 1024;
    *(_DWORD *)&v190[10] = v6;
    *(_WORD *)&v190[14] = 1024;
    *(_DWORD *)&v190[16] = [v10 upToCount];
    *(_WORD *)&v190[20] = 1024;
    *(_DWORD *)&v190[22] = [v10 infoMask];
    _os_log_impl(&dword_22632B000, v13, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: %@ requestID: %@ startIndex: %u upToCount: %u infoMask:%xh", buf, 0x28u);
  }
  int v16 = v173[2](v173, v175, v10, 0);
  if (v16 > 0)
  {
    uint64_t v17 = [(ACCNowPlayingFeaturePlugin *)self measureMemoryUsage];
    if ([v17 BOOLValue])
    {
      BOOL v18 = self->_memUse == 0;

      if (v18)
      {
        v171 = 0;
LABEL_33:
        id v174 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        __int16 v31 = [v10 requestID];
        uint64_t v168 = *MEMORY[0x263F22FE0];
        objc_msgSend(v174, "setObject:forKey:", v31);

        if (![(ACCNowPlayingFeaturePlugin *)self _nowPlayingAppIsIPodApp]
          || [(ACCNowPlayingFeaturePlugin *)self _nowPlayingAppIsIPodRadio]
          || [(ACCNowPlayingFeaturePlugin *)self _nowPlayingIsStreaming])
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            unint64_t v32 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
            }
            unint64_t v32 = MEMORY[0x263EF8438];
            id v33 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = [v175 accessoryUID];
            uint64_t v6 = [v10 requestID];
            *(_DWORD *)buf = 138412546;
            *(void *)v189 = v34;
            *(_WORD *)&v189[8] = 2112;
            *(void *)v190 = v6;
            _os_log_impl(&dword_22632B000, v32, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: acc %@, req %@, 3rd party app / streaming, pbqList not available", buf, 0x16u);
          }
          [v174 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F22FC0]];
          __int16 v35 = [v175 accessoryUID];
          uint64_t v36 = [v10 requestID];
          v172[2](v172, v35, v36, v174);

          int v169 = 0;
          unsigned int v170 = 0;
          goto LABEL_45;
        }
        __int16 v49 = [(ACCNowPlayingFeaturePlugin *)self cachedPlaybackAttributes];
        unint64_t v50 = [v49 objectForKey:*MEMORY[0x263F22F70]];
        unsigned int v170 = [v50 unsignedIntegerValue];

        uint64_t v51 = [(ACCNowPlayingFeaturePlugin *)self cachedPlaybackAttributes];
        long long v52 = [v51 objectForKey:*MEMORY[0x263F22F78]];
        int v169 = [v52 unsignedIntegerValue];

        if (gLogObjects && gNumLogObjects >= 1)
        {
          long long v53 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
          }
          long long v53 = MEMORY[0x263EF8438];
          id v54 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          v121 = [v175 accessoryUID];
          uint64_t v6 = [v10 requestID];
          *(_DWORD *)buf = 138413058;
          *(void *)v189 = v121;
          *(_WORD *)&v189[8] = 2112;
          *(void *)v190 = v6;
          *(_WORD *)&v190[8] = 1024;
          *(_DWORD *)&v190[10] = v170;
          *(_WORD *)&v190[14] = 1024;
          *(_DWORD *)&v190[16] = v169;
          _os_log_debug_impl(&dword_22632B000, v53, OS_LOG_TYPE_DEBUG, "_generatePlaybackQueueItemsWithPropertyList: acc %@, req %@, count=%d curIndex=%d", buf, 0x22u);
        }
        if (!v170)
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            uint64_t v58 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
            }
            uint64_t v58 = MEMORY[0x263EF8438];
            id v61 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v62 = [v175 accessoryUID];
            uint64_t v6 = [v10 requestID];
            *(_DWORD *)buf = 138412546;
            *(void *)v189 = v62;
            *(_WORD *)&v189[8] = 2112;
            *(void *)v190 = v6;
            _os_log_impl(&dword_22632B000, v58, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: acc %@, req %@, No QueueCount", buf, 0x16u);
          }
          [v174 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F22FC0]];
          __int16 v35 = [v175 accessoryUID];
          __int16 v63 = [v10 requestID];
          v172[2](v172, v35, v63, v174);

          unsigned int v170 = 0;
          goto LABEL_45;
        }
        if ((int)v173[2](v173, v175, v10, 0) < 1)
        {
          __int16 v35 = logObjectForModule();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v59 = [v175 accessoryUID];
            __int16 v60 = [v10 requestID];
            *(_DWORD *)buf = 138412546;
            *(void *)v189 = v59;
            *(_WORD *)&v189[8] = 2112;
            *(void *)v190 = v60;
            _os_log_impl(&dword_22632B000, v35, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: %@ requestID: %@, got continueCB false before retrieve list, skip processing.", buf, 0x16u);
          }
          goto LABEL_45;
        }
        __int16 v35 = objc_alloc_init(MEMORY[0x263EFF980]);
        if ([v10 upToCount]) {
          unsigned int v167 = [v10 startIndex];
        }
        else {
          unsigned int v167 = 0;
        }
        int v64 = [v10 upToCount];
        unsigned int v65 = v170;
        unsigned int v66 = v170;
        if (v64)
        {
          unsigned int v67 = [v10 upToCount];
          unsigned int v65 = v170;
          unsigned int v66 = v170;
          if (v67 < v170)
          {
            unsigned int v66 = [v10 upToCount];
            unsigned int v65 = v170;
          }
        }
        unsigned int v68 = v65 - v167;
        if (v68 >= v66) {
          unint64_t v69 = v66;
        }
        else {
          unint64_t v69 = v68;
        }
        unint64_t v166 = v69;
        __int16 v70 = objc_msgSend(NSNumber, "numberWithUnsignedLong:");
        uint64_t v164 = *MEMORY[0x263F22FC8];
        objc_msgSend(v174, "setObject:forKey:", v70);

        v71 = objc_msgSend(NSNumber, "numberWithUnsignedLong:");
        [v174 setObject:v71 forKey:*MEMORY[0x263F22FE8]];

        if (gLogObjects && gNumLogObjects >= 1)
        {
          __int16 v72 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
          }
          __int16 v72 = MEMORY[0x263EF8438];
          id v73 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          __int16 v74 = [v171 startTime];
          [v74 timeIntervalSince1970];
          *(_DWORD *)buf = 134218240;
          *(void *)v189 = v170;
          *(_WORD *)&v189[8] = 2048;
          *(void *)v190 = v75;
          _os_log_impl(&dword_22632B000, v72, OS_LOG_TYPE_INFO, "_generatePlaybackQueueItemsWithPropertyList: Start retrieving queued track info: count=%lu startTimeInterval=%f", buf, 0x16u);
        }
        if ((int)v173[2](v173, v175, v10, 0) >= 1
          && +[ACCNowPlayingFeaturePlugin isMusicAppVisible])
        {
          __int16 v76 = logObjectForModule();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)v189 = v167;
            *(_WORD *)&v189[4] = 1024;
            *(_DWORD *)&v189[6] = v66;
            *(_WORD *)v190 = 1024;
            *(_DWORD *)&v190[2] = v166;
            *(_WORD *)&v190[6] = 1024;
            *(_DWORD *)&v190[8] = v166 + v167;
            _os_log_debug_impl(&dword_22632B000, v76, OS_LOG_TYPE_DEBUG, "_generatePlaybackQueueItemsWithPropertyList: startIndex=%d contentSize=%d contentCount=%d endIndex=%d", buf, 0x1Au);
          }

          uint64_t v182 = 0;
          v183 = &v182;
          uint64_t v184 = 0x3032000000;
          v185 = __Block_byref_object_copy_;
          v186 = __Block_byref_object_dispose_;
          id v187 = 0;
          v165 = [(ACCNowPlayingFeaturePlugin *)self mpMusicPlayerControllerHandler];
          if (v166)
          {
            int v77 = 0;
            uint64_t v78 = 0;
            uint64_t v6 = 0;
            v79 = "exist";
            if (!v165) {
              v79 = "null";
            }
            v163 = v79;
            char v80 = 1;
            while (1)
            {
              if ((int)v173[2](v173, v175, v10, v78) <= 0) {
                goto LABEL_190;
              }
              v81 = [(ACCNowPlayingFeaturePlugin *)self mpMusicPlayerControllerQueue];
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __114__ACCNowPlayingFeaturePlugin__generatePlaybackQueueItemsWithPropertyList_request_completionHandler_continueQuery___block_invoke;
              block[3] = &unk_26479D928;
              v179 = &v182;
              id v82 = v165;
              unsigned int v181 = v167;
              id v178 = v82;
              uint64_t v180 = v78;
              dispatch_sync(v81, block);

              v83 = MEMORY[0x263EF8438];
              uint64_t v84 = gLogObjects;
              int v85 = gNumLogObjects;
              if (!gLogObjects) {
                goto LABEL_216;
              }
              if (gNumLogObjects >= 1)
              {
                v86 = *(id *)gLogObjects;
              }
              else
              {
LABEL_216:
                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  *(void *)v189 = v84;
                  *(_WORD *)&v189[8] = 1024;
                  *(_DWORD *)v190 = v85;
                  _os_log_error_impl(&dword_22632B000, v83, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v87 = v83;
                v86 = v83;
              }
              if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218496;
                *(void *)v189 = v78;
                *(_WORD *)&v189[8] = 2048;
                *(void *)v190 = v167 + v78;
                *(_WORD *)&v190[8] = 1024;
                *(_DWORD *)&v190[10] = v170;
                _os_log_debug_impl(&dword_22632B000, v86, OS_LOG_TYPE_DEBUG, "_generatePlaybackQueueItemsWithPropertyList: %lu [%lu / %d]", buf, 0x1Cu);
              }

              v88 = (void *)v183[5];
              if (!v88) {
                break;
              }
              if ([v88 persistentID] && (objc_msgSend((id)v183[5], "existsInLibrary") & 1) != 0)
              {
                v89 = MEMORY[0x263EF8438];
              }
              else
              {
                if (![v10 allowNonLibrary]) {
                  char v80 = 0;
                }
                uint64_t v90 = gLogObjects;
                int v91 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v92 = *(id *)gLogObjects;
                  v89 = MEMORY[0x263EF8438];
                }
                else
                {
                  v89 = MEMORY[0x263EF8438];
                  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(void *)v189 = v90;
                    *(_WORD *)&v189[8] = 1024;
                    *(_DWORD *)v190 = v91;
                    _os_log_error_impl(&dword_22632B000, v89, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v95 = v89;
                  v92 = v89;
                }
                if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
                {
                  v96 = (void *)v183[5];
                  id v97 = [v96 title];
                  uint64_t v98 = [(id)v183[5] persistentID];
                  *(_DWORD *)buf = 134219010;
                  *(void *)v189 = v78;
                  *(_WORD *)&v189[8] = 2048;
                  *(void *)v190 = v170;
                  *(_WORD *)&v190[8] = 2112;
                  *(void *)&v190[10] = v96;
                  *(_WORD *)&v190[18] = 2112;
                  *(void *)&v190[20] = v97;
                  *(_WORD *)&v190[28] = 2048;
                  *(void *)&v190[30] = v98;
                  _os_log_impl(&dword_22632B000, v92, OS_LOG_TYPE_INFO, "_generatePlaybackQueueItemsWithPropertyList: i=%lu/%lu Found non-library item %@ (%@ : %llu)", buf, 0x34u);
                }
                uint64_t v6 = 1;
              }
              if ((v80 & 1) != 0 && v174)
              {
                uint64_t v99 = gLogObjects;
                int v100 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v89 = *(id *)gLogObjects;
                }
                else
                {
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(void *)v189 = v99;
                    *(_WORD *)&v189[8] = 1024;
                    *(_DWORD *)v190 = v100;
                    _os_log_error_impl(&dword_22632B000, v89, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v102 = v89;
                }
                if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v110 = [(id)v183[5] persistentID];
                  v161 = [(id)v183[5] title];
                  v111 = [(id)v183[5] artist];
                  v112 = [(id)v183[5] albumTitle];
                  *(_DWORD *)buf = 134219522;
                  *(void *)v189 = v78;
                  *(_WORD *)&v189[8] = 2048;
                  *(void *)v190 = v167 + v78;
                  *(_WORD *)&v190[8] = 1024;
                  *(_DWORD *)&v190[10] = v170;
                  *(_WORD *)&v190[14] = 2048;
                  *(void *)&v190[16] = v110;
                  *(_WORD *)&v190[24] = 2112;
                  *(void *)&v190[26] = v161;
                  *(_WORD *)&v190[34] = 2112;
                  *(void *)&v190[36] = v111;
                  *(_WORD *)&v190[44] = 2112;
                  *(void *)&v190[46] = v112;
                  _os_log_debug_impl(&dword_22632B000, v89, OS_LOG_TYPE_DEBUG, "_generatePlaybackQueueItemsWithPropertyList: %lu [%lu / %d]   mediaItem:(pid=%llu title='%@' artist='%@' album='%@')", buf, 0x44u);
                }
                v83 = +[ACCNowPlayingFeaturePlugin getItemDictionaryForContentItem:infoMask:](ACCNowPlayingFeaturePlugin, "getItemDictionaryForContentItem:infoMask:", v183[5], [v10 infoMask]);
                [v35 addObject:v83];
LABEL_162:
              }
              v103 = [(ACCNowPlayingFeaturePlugin *)self measureMemoryUsage];
              if ([v103 BOOLValue])
              {
                BOOL v104 = self->_memUse == 0;

                if (v104 || (v78 & 0x7F) != 0 && v170 - 1 != v78) {
                  goto LABEL_172;
                }
                [(ACCMemUsageStat *)self->_memUse update];
                if (!v171) {
                  goto LABEL_172;
                }
                [v171 timeIntervalSinceLastUpdate];
                if (v105 < 1.0) {
                  goto LABEL_172;
                }
                v103 = logObjectForModule();
                if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
                {
                  v162 = [v171 residentMem];
                  uint64_t v150 = [v162 last];
                  v160 = [v171 residentMem];
                  unint64_t v149 = [v160 last];
                  v159 = [v171 residentMem];
                  uint64_t v148 = [v159 max];
                  v158 = [v171 residentMem];
                  unint64_t v147 = [v158 max];
                  v157 = [v171 virtualMem];
                  uint64_t v146 = [v157 last];
                  v156 = [v171 virtualMem];
                  unint64_t v145 = [v156 last];
                  v155 = [v171 virtualMem];
                  uint64_t v144 = [v155 max];
                  v154 = [v171 virtualMem];
                  unint64_t v143 = [v154 max];
                  v153 = [v171 physFootprintMem];
                  uint64_t v142 = [v153 last];
                  v152 = [v171 physFootprintMem];
                  unint64_t v113 = [v152 last];
                  v151 = [v171 physFootprintMem];
                  uint64_t v114 = [v151 max];
                  v115 = [v171 physFootprintMem];
                  unint64_t v116 = [v115 max];
                  *(_DWORD *)buf = 134221568;
                  *(void *)v189 = v78;
                  *(_WORD *)&v189[8] = 1024;
                  *(_DWORD *)v190 = v166;
                  *(_WORD *)&v190[4] = 1024;
                  *(_DWORD *)&v190[6] = v170;
                  *(_WORD *)&v190[10] = 2048;
                  *(void *)&v190[12] = v150;
                  *(_WORD *)&v190[20] = 2048;
                  *(double *)&v190[22] = (double)v149 / 1000000.0;
                  *(_WORD *)&v190[30] = 2048;
                  *(void *)&v190[32] = v148;
                  *(_WORD *)&v190[40] = 2048;
                  *(double *)&v190[42] = (double)v147 / 1000000.0;
                  *(_WORD *)&v190[50] = 2048;
                  *(void *)&v190[52] = v146;
                  __int16 v191 = 2048;
                  double v192 = (double)v145 / 1000000.0;
                  __int16 v193 = 2048;
                  uint64_t v194 = v144;
                  __int16 v195 = 2048;
                  double v196 = (double)v143 / 1000000.0;
                  __int16 v197 = 2048;
                  uint64_t v198 = v142;
                  __int16 v199 = 2048;
                  double v200 = (double)v113 / 1000000.0;
                  __int16 v201 = 2048;
                  uint64_t v202 = v114;
                  __int16 v203 = 2048;
                  double v204 = (double)v116 / 1000000.0;
                  _os_log_debug_impl(&dword_22632B000, v103, OS_LOG_TYPE_DEBUG, "_generatePlaybackQueueItemsWithPropertyList: %lu / %d / %d, memUse[resident=%llu(%.3fM)/%llu(%.3fM) virtual=%llu(%.3fM)/%llu(%.3fM) physFootprint=%llu(%.3fM)/=%llu(%.3fM)]", buf, 0x90u);
                }
              }

LABEL_172:
              v106 = (void *)v183[5];
              v183[5] = 0;

              int v77 = v6 & 1;
              BOOL v107 = (v6 & 1) == 0 || v174 != 0;
              unsigned __int8 v108 = v80;
              BOOL v109 = (v80 & 1) == 0;
              if ((v80 & 1) != 0 && v107 && ++v78 < v166) {
                continue;
              }
              goto LABEL_191;
            }
            uint64_t v93 = gLogObjects;
            int v94 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v83 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(void *)v189 = v93;
                *(_WORD *)&v189[8] = 1024;
                *(_DWORD *)v190 = v94;
                _os_log_error_impl(&dword_22632B000, v83, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v101 = v83;
            }
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134219266;
              *(void *)v189 = v78;
              *(_WORD *)&v189[8] = 2048;
              *(void *)v190 = v167 + v78;
              *(_WORD *)&v190[8] = 1024;
              *(_DWORD *)&v190[10] = v170;
              *(_WORD *)&v190[14] = 2048;
              *(void *)&v190[16] = v170;
              *(_WORD *)&v190[24] = 2048;
              *(void *)&v190[26] = v78;
              *(_WORD *)&v190[34] = 2080;
              *(void *)&v190[36] = v163;
              _os_log_impl(&dword_22632B000, v83, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: %lu [%lu / %d] Unexpected end of playback queue list, expected count=%lu but only got to index=%lu, systemMusicPlayer = %s", buf, 0x3Au);
            }
            char v80 = 0;
            uint64_t v6 = 1;
            goto LABEL_162;
          }
          int v77 = 0;
LABEL_190:
          BOOL v109 = 0;
          unsigned __int8 v108 = 1;
LABEL_191:
          v122 = logObjectForModule();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
          {
            uint64_t v123 = [v35 count];
            *(_DWORD *)buf = 134218752;
            *(void *)v189 = v170;
            *(_WORD *)&v189[8] = 1024;
            *(_DWORD *)v190 = v77;
            *(_WORD *)&v190[4] = 1024;
            *(_DWORD *)&v190[6] = v108;
            *(_WORD *)&v190[10] = 2048;
            *(void *)&v190[12] = v123;
            _os_log_impl(&dword_22632B000, v122, OS_LOG_TYPE_INFO, "_generatePlaybackQueueItemsWithPropertyList: after iteration, count=%lu foundNonLibrary=%d pbqListAvailable=%d metaList.count=%lu", buf, 0x22u);
          }

          if (v109)
          {
            [v174 removeAllObjects];
            v124 = [v10 requestID];
            [v174 setObject:v124 forKey:v168];

            [v174 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F22FC0]];
          }

          _Block_object_dispose(&v182, 8);
          int v119 = v173[2](v173, v175, v10, 0);
          if (v119)
          {
            BOOL v120 = v77 != 0;
            if (!v108)
            {
              int v133 = 0;
LABEL_207:
              v134 = logObjectForModule();
              if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v135 = [v35 count];
                v136 = [v174 objectForKey:v164];
                uint64_t v6 = [v136 unsignedLongValue];
                [v171 timeIntervalSinceStart];
                *(_DWORD *)buf = 134219008;
                *(void *)v189 = v135;
                *(_WORD *)&v189[8] = 2048;
                *(void *)v190 = v6;
                *(_WORD *)&v190[8] = 1024;
                *(_DWORD *)&v190[10] = v120;
                *(_WORD *)&v190[14] = 1024;
                *(_DWORD *)&v190[16] = v133;
                *(_WORD *)&v190[20] = 2048;
                *(void *)&v190[22] = v137;
                _os_log_impl(&dword_22632B000, v134, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: End retrieving queued track items (count=%lu(req'd=%lu), foundNonLibrary=%d pbqListAvailable=%d): timeSinceStart=%f", buf, 0x2Cu);
              }
              v138 = [v175 accessoryUID];
              v139 = [v10 requestID];
              v172[2](v172, v138, v139, v174);

LABEL_212:
LABEL_45:

              uint64_t v37 = [(ACCNowPlayingFeaturePlugin *)self measureMemoryUsage];
              if ([v37 BOOLValue])
              {
                BOOL v38 = self->_memUse == 0;

                if (!v38)
                {
                  [(ACCMemUsageStat *)self->_memUse update];
                  uint64_t v39 = gNumLogObjects;
                  if (gLogObjects && gNumLogObjects >= 1)
                  {
                    uint64_t v40 = *(id *)gLogObjects;
                  }
                  else
                  {
                    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
                    }
                    uint64_t v40 = MEMORY[0x263EF8438];
                    id v41 = MEMORY[0x263EF8438];
                  }
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                  {
                    id v42 = [v175 accessoryUID];
                    uint64_t v43 = [v10 requestID];
                    int v44 = [v10 startIndex];
                    int v45 = [v10 upToCount];
                    int v46 = [v10 infoMask];
                    __int16 v47 = v171;
                    if (v171)
                    {
                      uint64_t v39 = [MEMORY[0x263EFF910] date];
                      uint64_t v6 = [v171 startTime];
                      [(id)v39 timeIntervalSinceDate:v6];
                      __int16 v47 = v171;
                    }
                    else
                    {
                      uint64_t v48 = 0;
                    }
                    memUse = self->_memUse;
                    *(_DWORD *)buf = 138414338;
                    *(void *)v189 = v42;
                    *(_WORD *)&v189[8] = 2112;
                    *(void *)v190 = v43;
                    *(_WORD *)&v190[8] = 1024;
                    *(_DWORD *)&v190[10] = v44;
                    *(_WORD *)&v190[14] = 1024;
                    *(_DWORD *)&v190[16] = v45;
                    *(_WORD *)&v190[20] = 1024;
                    *(_DWORD *)&v190[22] = v46;
                    *(_WORD *)&v190[26] = 2048;
                    *(void *)&v190[28] = v48;
                    *(_WORD *)&v190[36] = 1024;
                    *(_DWORD *)&v190[38] = v169;
                    *(_WORD *)&v190[42] = 1024;
                    *(_DWORD *)&v190[44] = v170;
                    *(_WORD *)&v190[48] = 2112;
                    *(void *)&v190[50] = memUse;
                    _os_log_impl(&dword_22632B000, v40, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: %@ requestID: %@ startIndex: %u upToCount: %u infoMask: 0x%x, \n  Finished in %f sec, curIndex=%d / %d, memUse:\n%@", buf, 0x48u);
                    if (v47)
                    {
                    }
                  }

                  if (gLogObjects && gNumLogObjects >= 1)
                  {
                    v56 = *(id *)gLogObjects;
                  }
                  else
                  {
                    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
                    }
                    v56 = MEMORY[0x263EF8438];
                    id v57 = MEMORY[0x263EF8438];
                  }
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)v189 = v171;
                    _os_log_impl(&dword_22632B000, v56, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: markStat: \nmark: \n%@", buf, 0xCu);
                  }

                  [(ACCMemUsageStat *)self->_memUse removeMark:@"npPbqUpdateMark"];
                  v171 = 0;
                }
              }
              else
              {
              }
              uint32_t v19 = v171;
              goto LABEL_83;
            }
LABEL_197:
            v125 = [(ACCNowPlayingFeaturePlugin *)self playbackQueueInfoSendPartialOnTimeout];
            if ([v125 intValue] == 3)
            {
              BOOL v126 = [v35 count] < v166;

              if (!v126)
              {
LABEL_204:
                [v174 setObject:v35 forKey:*MEMORY[0x263F22FD0]];
                v131 = [NSNumber numberWithBool:v120];
                [v174 setObject:v131 forKey:*MEMORY[0x263F22FD8]];

                [v174 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F22FC0]];
                if (v119 < 0)
                {
                  v132 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[NSObject count](v35, "count"));
                  [v174 setObject:v132 forKey:v164];
                }
                int v133 = 1;
                goto LABEL_207;
              }
              v127 = logObjectForModule();
              if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v128 = [v35 count];
                *(_DWORD *)buf = 134217984;
                *(void *)v189 = v166 - v128;
                _os_log_impl(&dword_22632B000, v127, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: list not full, fill %lu items with 0 pid!", buf, 0xCu);
              }

              v125 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", &unk_26DA08A08, *MEMORY[0x263F23018], 0);
              unint64_t v129 = [v35 count];
              unint64_t v130 = v166 - v129;
              if (v166 > v129)
              {
                do
                {
                  [v35 addObject:v125];
                  --v130;
                }
                while (v130);
              }
            }

            goto LABEL_204;
          }
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v117 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
            }
            v117 = MEMORY[0x263EF8438];
            id v118 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22632B000, v117, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: no systemMusicPlayer!", buf, 2u);
          }

          int v119 = v173[2](v173, v175, v10, 0);
          if (v119)
          {
            BOOL v120 = 0;
            goto LABEL_197;
          }
        }
        v138 = logObjectForModule();
        if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
        {
          v140 = [v175 accessoryUID];
          v141 = [v10 requestID];
          *(_DWORD *)buf = 138412546;
          *(void *)v189 = v140;
          *(_WORD *)&v189[8] = 2112;
          *(void *)v190 = v141;
          _os_log_impl(&dword_22632B000, v138, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: %@ requestID: %@, got continueCB false attempting to retrieve list, skip processing.", buf, 0x16u);
        }
        goto LABEL_212;
      }
      [(ACCMemUsageStat *)self->_memUse mark:@"npPbqUpdateMark"];
      v171 = [(ACCMemUsageStat *)self->_memUse getMark:@"npPbqUpdateMark"];
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v17 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
        }
        uint64_t v17 = MEMORY[0x263EF8438];
        id v23 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v24 = [v175 accessoryUID];
        uint64_t v25 = [v10 requestID];
        __int16 v26 = [v171 residentMem];
        uint64_t v27 = [v26 start];
        uint64_t v28 = [v171 virtualMem];
        uint64_t v29 = [v28 start];
        uint64_t v6 = [v171 physFootprintMem];
        uint64_t v30 = [(id)v6 start];
        *(_DWORD *)buf = 138413314;
        *(void *)v189 = v24;
        *(_WORD *)&v189[8] = 2112;
        *(void *)v190 = v25;
        *(_WORD *)&v190[8] = 2048;
        *(void *)&v190[10] = v27;
        *(_WORD *)&v190[18] = 2048;
        *(void *)&v190[20] = v29;
        *(_WORD *)&v190[28] = 2048;
        *(void *)&v190[30] = v30;
        _os_log_impl(&dword_22632B000, v17, OS_LOG_TYPE_INFO, "_generatePlaybackQueueItemsWithPropertyList: %@ requestID: %@, memUse:[residentStart=%llu virtualStart=%llu ]hysFootprintStart=%llu]", buf, 0x34u);
      }
    }
    else
    {
      v171 = 0;
    }

    goto LABEL_33;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint32_t v19 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    uint32_t v19 = MEMORY[0x263EF8438];
    id v20 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [v175 accessoryUID];
    uint64_t v22 = [v10 requestID];
    *(_DWORD *)buf = 138412802;
    *(void *)v189 = v21;
    *(_WORD *)&v189[8] = 2112;
    *(void *)v190 = v22;
    *(_WORD *)&v190[8] = 1024;
    *(_DWORD *)&v190[10] = v16;
    _os_log_impl(&dword_22632B000, v19, OS_LOG_TYPE_DEFAULT, "_generatePlaybackQueueItemsWithPropertyList: %@ requestID: %@, got continueCB=%d, @ enter, skip processing.", buf, 0x1Cu);
  }
LABEL_83:
}

uint64_t __114__ACCNowPlayingFeaturePlugin__generatePlaybackQueueItemsWithPropertyList_request_completionHandler_continueQuery___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) nowPlayingItemAtIndex:*(void *)(a1 + 48) + *(unsigned int *)(a1 + 56)];
  return MEMORY[0x270F9A758]();
}

- (BOOL)_nowPlayingAppIsIPodApp
{
  uint64_t v2 = [(ACCNowPlayingFeaturePlugin *)self cachedPlaybackAttributes];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x263F22F58]];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (BOOL)_nowPlayingAppIsIPodRadio
{
  uint64_t v2 = [(ACCNowPlayingFeaturePlugin *)self cachedPlaybackAttributes];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x263F22FB0]];

  if (v3) {
    BOOL v4 = [v3 length] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_nowPlayingIsStreaming
{
  uint64_t v3 = [(ACCNowPlayingFeaturePlugin *)self cachedPlaybackAttributes];
  BOOL v4 = [v3 objectForKey:*MEMORY[0x263F22F78]];

  int v5 = [(ACCNowPlayingFeaturePlugin *)self cachedPlaybackAttributes];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x263F22F70]];

  unsigned int v7 = [v6 unsignedLongValue];
  BOOL v8 = [(ACCNowPlayingFeaturePlugin *)self _nowPlayingAppIsIPodRadio];
  int v9 = v7 > 0x7FFFFFFE || v8;
  if (v7) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 && [v4 unsignedLongValue])
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      BOOL v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      BOOL v11 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ACCNowPlayingFeaturePlugin _nowPlayingIsStreaming]();
    }
  }
  return v10;
}

- (void)_nowPlayingInfoDebounceTimerKick:(int)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    unsigned int v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    unsigned int v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int nowPlayingInfoDebounceTimerRunningMask = self->_nowPlayingInfoDebounceTimerRunningMask;
    int v17 = 67109376;
    int v18 = a3;
    __int16 v19 = 1024;
    unsigned int v20 = nowPlayingInfoDebounceTimerRunningMask;
    _os_log_impl(&dword_22632B000, v7, OS_LOG_TYPE_DEFAULT, "_nowPlayingInfoDebounceTimerKick: event = 0x%02x, _unsigned int nowPlayingInfoDebounceTimerRunningMask = 0x%02x", (uint8_t *)&v17, 0xEu);
  }

  unsigned int v9 = self->_nowPlayingInfoDebounceTimerRunningMask;
  if (!a3 || v9)
  {
    self->_unsigned int nowPlayingInfoDebounceTimerRunningMask = v9 | a3;
  }
  else
  {
    self->_unsigned int nowPlayingInfoDebounceTimerRunningMask = a3;
    uint64_t v10 = [(ACCSettingsState *)self->_nowPlayingInfoDebounceTimerValue intValue];
    nowPlayingInfoDebounceTimer = self->_nowPlayingInfoDebounceTimer;
    dispatch_time_t v12 = dispatch_time(0, 1000000 * v10);
    if (v10 <= 1000) {
      uint64_t v13 = 1000000 * (v10 / 10);
    }
    else {
      uint64_t v13 = 100000000;
    }
    dispatch_source_set_timer(nowPlayingInfoDebounceTimer, v12, 0xFFFFFFFFFFFFFFFFLL, v13);
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    uint64_t v14 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    unsigned int v16 = self->_nowPlayingInfoDebounceTimerRunningMask;
    int v17 = 67109376;
    int v18 = v9;
    __int16 v19 = 1024;
    unsigned int v20 = v16;
    _os_log_impl(&dword_22632B000, v14, OS_LOG_TYPE_INFO, "_nowPlayingInfoDebounceTimerKick: _nowPlayingInfoDebounceTimerRunningMask 0x%02x -> 0x%02x", (uint8_t *)&v17, 0xEu);
  }
}

- (void)_nowPlayingInfoDebounceTimerStop:(int)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    unsigned int v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    unsigned int v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int nowPlayingInfoDebounceTimerRunningMask = self->_nowPlayingInfoDebounceTimerRunningMask;
    int v13 = 67109376;
    int v14 = a3;
    __int16 v15 = 1024;
    unsigned int v16 = nowPlayingInfoDebounceTimerRunningMask;
    _os_log_impl(&dword_22632B000, v7, OS_LOG_TYPE_DEFAULT, "_nowPlayingInfoDebounceTimerStop: event = 0x%02x, _unsigned int nowPlayingInfoDebounceTimerRunningMask = 0x%02x", (uint8_t *)&v13, 0xEu);
  }

  unsigned int v9 = self->_nowPlayingInfoDebounceTimerRunningMask;
  self->_unsigned int nowPlayingInfoDebounceTimerRunningMask = v9 & ~a3;
  if ((v9 & ~a3) == 0) {
    dispatch_source_set_timer((dispatch_source_t)self->_nowPlayingInfoDebounceTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v10 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    uint64_t v10 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    unsigned int v12 = self->_nowPlayingInfoDebounceTimerRunningMask;
    int v13 = 67109376;
    int v14 = v9;
    __int16 v15 = 1024;
    unsigned int v16 = v12;
    _os_log_impl(&dword_22632B000, v10, OS_LOG_TYPE_INFO, "_nowPlayingInfoDebounceTimerStop: _nowPlayingInfoDebounceTimerRunningMask 0x%02x -> 0x%02x", (uint8_t *)&v13, 0xEu);
  }
}

+ (BOOL)isMusicAppVisible
{
  if (GetMediaLibraryHelper___mediaLibraryHelperInitOnce != -1) {
    dispatch_once(&GetMediaLibraryHelper___mediaLibraryHelperInitOnce, &__block_literal_global);
  }
  uint64_t v2 = (void *)GetMediaLibraryHelper___mediaLibraryHelper;
  return [v2 showMusic];
}

+ (id)getItemDictionaryForContentItem:(id)a3 infoMask:(unsigned int)a4
{
  id v5 = a3;
  id v6 = 0;
  if (v5 && a4)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    int v7 = 0;
    uint64_t v20 = *MEMORY[0x263F23008];
    uint64_t v21 = *MEMORY[0x263F11260];
    uint64_t v8 = *MEMORY[0x263F112A0];
    uint64_t v27 = *MEMORY[0x263F23010];
    uint64_t v9 = *MEMORY[0x263F11208];
    uint64_t v26 = *MEMORY[0x263F22FF0];
    uint64_t v10 = *MEMORY[0x263F11238];
    uint64_t v25 = *MEMORY[0x263F23000];
    uint64_t v11 = *MEMORY[0x263F11220];
    uint64_t v24 = *MEMORY[0x263F22FF8];
    uint64_t v12 = *MEMORY[0x263F11400];
    uint64_t v23 = *MEMORY[0x263F23020];
    uint64_t v22 = *MEMORY[0x263F23018];
    do
    {
      if ((a4 >> v7))
      {
        if (v7 > 11)
        {
          switch(v7)
          {
            case 12:
              int v13 = [v5 valueForProperty:v10];
              if (!v13) {
                goto LABEL_23;
              }
              int v14 = v6;
              __int16 v15 = v13;
              uint64_t v16 = v25;
              goto LABEL_22;
            case 14:
              int v13 = [v5 valueForProperty:v9];
              if (!v13) {
                goto LABEL_23;
              }
              int v14 = v6;
              __int16 v15 = v13;
              uint64_t v16 = v26;
              goto LABEL_22;
            case 16:
              int v13 = [v5 valueForProperty:v8];
              if (!v13) {
                goto LABEL_23;
              }
              int v14 = v6;
              __int16 v15 = v13;
              uint64_t v16 = v27;
              goto LABEL_22;
            case 18:
              __int16 v19 = [v5 valueForProperty:v21];
              if (v19) {
                [v6 setObject:v19 forKey:v20];
              }

              goto LABEL_25;
            default:
              goto LABEL_24;
          }
        }
        if (v7)
        {
          if (v7 == 1)
          {
            int v13 = [v5 valueForProperty:v12];
            if (v13)
            {
              int v14 = v6;
              __int16 v15 = v13;
              uint64_t v16 = v23;
LABEL_22:
              objc_msgSend(v14, "setObject:forKey:", v15, v16, v20);
            }
LABEL_23:

            goto LABEL_24;
          }
          if (v7 == 6)
          {
            int v13 = [v5 valueForProperty:v11];
            if (v13)
            {
              int v14 = v6;
              __int16 v15 = v13;
              uint64_t v16 = v24;
              goto LABEL_22;
            }
            goto LABEL_23;
          }
        }
        else
        {
          uint64_t v17 = [v5 persistentID];
          if (v17)
          {
            int v13 = [NSNumber numberWithUnsignedLongLong:v17];
            int v14 = v6;
            __int16 v15 = v13;
            uint64_t v16 = v22;
            goto LABEL_22;
          }
        }
      }
LABEL_24:
      ++v7;
    }
    while (v7 != 19);
  }
LABEL_25:

  return v6;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (AccessoryNowPlayingClient)nowPlayingClient
{
  return self->_nowPlayingClient;
}

- (void)setNowPlayingClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (OS_dispatch_source)nowPlayingInfoDebounceTimer
{
  return self->_nowPlayingInfoDebounceTimer;
}

- (void)setNowPlayingInfoDebounceTimer:(id)a3
{
}

- (unsigned)nowPlayingInfoDebounceTimerRunningMask
{
  return self->_nowPlayingInfoDebounceTimerRunningMask;
}

- (void)setNowPlayingInfoDebounceTimerRunningMask:(unsigned int)a3
{
  self->_unsigned int nowPlayingInfoDebounceTimerRunningMask = a3;
}

- (ACCSettingsState)nowPlayingInfoDebounceTimerValue
{
  return self->_nowPlayingInfoDebounceTimerValue;
}

- (NSMutableDictionary)cachedMediaItemAttributes
{
  return self->_cachedMediaItemAttributes;
}

- (void)setCachedMediaItemAttributes:(id)a3
{
}

- (NSData)cachedMediaItemArtworkHash
{
  return self->_cachedMediaItemArtworkHash;
}

- (void)setCachedMediaItemArtworkHash:(id)a3
{
}

- (NSMutableDictionary)cachedPlaybackAttributes
{
  return self->_cachedPlaybackAttributes;
}

- (void)setCachedPlaybackAttributes:(id)a3
{
}

- (NSMutableDictionary)pbqUpdateAccessoryList
{
  return self->_pbqUpdateAccessoryList;
}

- (void)setPbqUpdateAccessoryList:(id)a3
{
}

- (ACCSettingsState)maxPlaybackQueueInfoCount
{
  return self->_maxPlaybackQueueInfoCount;
}

- (void)setMaxPlaybackQueueInfoCount:(id)a3
{
}

- (ACCSettingsState)playbackQueueInfoTimeoutMs
{
  return self->_playbackQueueInfoTimeoutMs;
}

- (void)setPlaybackQueueInfoTimeoutMs:(id)a3
{
}

- (ACCSettingsState)playbackQueueInfoSendPartialOnTimeout
{
  return self->_playbackQueueInfoSendPartialOnTimeout;
}

- (void)setPlaybackQueueInfoSendPartialOnTimeout:(id)a3
{
}

- (ACCSettingsState)measureMemoryUsage
{
  return self->_measureMemoryUsage;
}

- (void)setMeasureMemoryUsage:(id)a3
{
}

- (ACCMemUsageStat)memUse
{
  return self->_memUse;
}

- (void)setMemUse:(id)a3
{
}

- (OS_dispatch_queue)nowPlayingInfoPBQueueListQ
{
  return self->_nowPlayingInfoPBQueueListQ;
}

- (void)setNowPlayingInfoPBQueueListQ:(id)a3
{
}

- (MPMusicPlayerController)mpMusicPlayerControllerHandler
{
  return self->_mpMusicPlayerControllerHandler;
}

- (void)setMpMusicPlayerControllerHandler:(id)a3
{
}

- (OS_dispatch_queue)mpMusicPlayerControllerQueue
{
  return self->_mpMusicPlayerControllerQueue;
}

- (void)setMpMusicPlayerControllerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mpMusicPlayerControllerQueue, 0);
  objc_storeStrong((id *)&self->_mpMusicPlayerControllerHandler, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoPBQueueListQ, 0);
  objc_storeStrong((id *)&self->_memUse, 0);
  objc_storeStrong((id *)&self->_measureMemoryUsage, 0);
  objc_storeStrong((id *)&self->_playbackQueueInfoSendPartialOnTimeout, 0);
  objc_storeStrong((id *)&self->_playbackQueueInfoTimeoutMs, 0);
  objc_storeStrong((id *)&self->_maxPlaybackQueueInfoCount, 0);
  objc_storeStrong((id *)&self->_pbqUpdateAccessoryList, 0);
  objc_storeStrong((id *)&self->_cachedPlaybackAttributes, 0);
  objc_storeStrong((id *)&self->_cachedMediaItemArtworkHash, 0);
  objc_storeStrong((id *)&self->_cachedMediaItemAttributes, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoDebounceTimerValue, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoDebounceTimer, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nowPlayingClient, 0);
}

- (void)currentMediaItemAttributes
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2(&dword_22632B000, v0, v1, "currentMediaItemAttributes mediaItemAttributes: %@", v2, v3, v4, v5, v6);
}

void __56__ACCNowPlayingFeaturePlugin_currentMediaItemAttributes__block_invoke_160_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_22632B000, v0, v1, "MRMediaRemoteGetSupportedCommands() returned commands array = NULL!", v2, v3, v4, v5, v6);
}

- (void)currentMediaItemArtworkOriginal
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_22632B000, v0, v1, "#Artwork Requesting artwork for current now playing item...", v2, v3, v4, v5, v6);
}

- (void)currentMediaItemArtwork
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [a1 length];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22632B000, a2, v3, "#Artwork artworkData.length: %lu bytes", v4);
}

- (void)currentPlaybackAttributes
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2(&dword_22632B000, v0, v1, "currentPlaybackAttributes playbackAttributes: %@", v2, v3, v4, v5, v6);
}

void __55__ACCNowPlayingFeaturePlugin_currentPlaybackAttributes__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22632B000, v0, v1, "currentPlaybackAttributes nowPlayingInfo: %@", v2, v3, v4, v5, v6);
}

void __52__ACCNowPlayingFeaturePlugin_setPlaybackQueueIndex___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_22632B000, v0, v1, "Couldn't get systemMusicPlayer instance!", v2, v3, v4, v5, v6);
}

void __52__ACCNowPlayingFeaturePlugin_setPlaybackQueueIndex___block_invoke_cold_3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_22632B000, v0, OS_LOG_TYPE_ERROR, "Couldn't find mediaItem at index %@!", v1, 0xCu);
}

void __99__ACCNowPlayingFeaturePlugin_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22632B000, v0, v1, "requestPlaybackQueueListInfo: completionCB: %@ remove accessory from list", v2, v3, v4, v5, v6);
}

void __75__ACCNowPlayingFeaturePlugin_cancelRequestPlaybackQueueListInfo_requestID___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22632B000, v0, v1, "cancelRequestPlaybackQueueListInfo: reset currentRequest for accessory=%@", v2, v3, v4, v5, v6);
}

void __75__ACCNowPlayingFeaturePlugin_cancelRequestPlaybackQueueListInfo_requestID___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22632B000, v0, v1, "cancelRequestPlaybackQueueListInfo: accessory=%@", v2, v3, v4, v5, v6);
}

- (void)_nowPlayingIsStreaming
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22632B000, v0, v1, "_nowPlayingIsStreaming: Got bogus QueueIndex(%@) for streaming playback!", v2, v3, v4, v5, v6);
}

@end