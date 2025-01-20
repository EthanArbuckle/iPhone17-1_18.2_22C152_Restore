@interface ATXClientModelSuggestionReceiver
+ (ATXClientModelSuggestionReceiver)sharedInstance;
+ (id)layoutSelectorsForConsumerSubTypes;
+ (void)_updateCacheForClientModel:(id)a3 withSuggestions:(id)a4 cacheManager:(id)a5;
+ (void)clearPreviouslyPersistedCachesForCardSuggestionClientsIfNecessary;
- (ATXClientModelSuggestionReceiver)init;
- (ATXClientModelSuggestionReceiver)initWithBlendingLayerServer:(id)a3;
- (ATXUniversalBlendingLayerServer)blendingLayerServer;
- (BOOL)rerouteSuggestions:(id)a3 clientModelId:(id)a4 completion:(id)a5;
- (void)_sendStackChangeDebugNotification:(id)a3;
- (void)blendingLayerRerankedSuggestions:(id)a3 consumerSubType:(unsigned __int8)a4;
- (void)blendingLayerUpdatedUICache:(id)a3 consumerSubType:(unsigned __int8)a4;
- (void)dealloc;
- (void)routeSuggestionsToInfoSuggestionEngine:(id)a3 clientModelId:(id)a4 completion:(id)a5;
- (void)start;
- (void)willCreateCacheUpdateWithFeedbackMetadataLength:(int64_t)a3 forClientModelId:(id)a4;
@end

@implementation ATXClientModelSuggestionReceiver

+ (ATXClientModelSuggestionReceiver)sharedInstance
{
  if (sharedInstance__pasOnceToken6_27 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_27, &__block_literal_global_150);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_35;
  return (ATXClientModelSuggestionReceiver *)v2;
}

void __50__ATXClientModelSuggestionReceiver_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_35;
  sharedInstance__pasExprOnceResult_35 = v1;
}

- (ATXClientModelSuggestionReceiver)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F939F8]);
  v4 = objc_opt_new();
  v5 = [(id)objc_opt_class() layoutSelectorsForConsumerSubTypes];
  v6 = objc_opt_new();
  v7 = [MEMORY[0x1E4F93550] sharedInstance];
  v8 = (void *)[v3 initWithSuggestionPreprocessor:v4 delegate:self layoutSelectorsForConsumerSubTypes:v5 blendingSessionLogger:v6 hyperParameters:v7];

  id v9 = objc_alloc(MEMORY[0x1E4F93A00]);
  v10 = [MEMORY[0x1E4F4B018] sharedInstance];
  v11 = [MEMORY[0x1E4F93550] sharedInstance];
  v12 = (void *)[v9 initWithBlendingLayer:v8 engagementRecordsManager:v10 hyperParameters:v11 serverDelegate:self];

  v13 = [(ATXClientModelSuggestionReceiver *)self initWithBlendingLayerServer:v12];
  return v13;
}

- (ATXClientModelSuggestionReceiver)initWithBlendingLayerServer:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ATXClientModelSuggestionReceiver;
  v6 = [(ATXClientModelSuggestionReceiver *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_blendingLayerServer, a3);
    uint64_t v8 = [v5 clientModelCacheManager];
    clientModelCacheManager = v7->_clientModelCacheManager;
    v7->_clientModelCacheManager = (ATXClientModelCacheManagerProtocol *)v8;

    uint64_t v10 = objc_opt_new();
    appSwitcherSuggestionSender = v7->_appSwitcherSuggestionSender;
    v7->_appSwitcherSuggestionSender = (ATXAppSwitcherSuggestionSender *)v10;

    uint64_t v12 = objc_opt_new();
    homeScreenSuggestionSender = v7->_homeScreenSuggestionSender;
    v7->_homeScreenSuggestionSender = (ATXHomeScreenSuggestionSender *)v12;

    uint64_t v14 = objc_opt_new();
    lockscreenSuggestionSender = v7->_lockscreenSuggestionSender;
    v7->_lockscreenSuggestionSender = (ATXLockscreenSuggestionSender *)v14;

    uint64_t v16 = objc_opt_new();
    watchSmartStacksSender = v7->_watchSmartStacksSender;
    v7->_watchSmartStacksSender = (ATXWatchSmartStacksSender *)v16;

    uint64_t v18 = objc_opt_new();
    spotlightActionsSuggestionSender = v7->_spotlightActionsSuggestionSender;
    v7->_spotlightActionsSuggestionSender = (ATXSpotlightActionsSuggestionSender *)v18;

    uint64_t v20 = objc_opt_new();
    router = v7->_router;
    v7->_router = (ATXClientModelSuggestionRouter *)v20;
  }
  return v7;
}

- (void)start
{
  [(ATXUniversalBlendingLayerServer *)self->_blendingLayerServer start];
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__sendStackChangeDebugNotification_ name:*MEMORY[0x1E4F4B520] object:0];

  v4 = (_ATXInternalUninstallNotification *)objc_opt_new();
  uninstallNotificationListener = self->_uninstallNotificationListener;
  self->_uninstallNotificationListener = v4;

  v6 = self->_uninstallNotificationListener;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __41__ATXClientModelSuggestionReceiver_start__block_invoke;
  v13 = &unk_1E68AB9D8;
  objc_copyWeak(&v14, &location);
  [(_ATXInternalUninstallNotification *)v6 registerForNotificationsWithUninstallBlock:&v10];
  if (_PASIsInternalDevice())
  {
    id v7 = objc_alloc(MEMORY[0x1E4F44680]);
    uint64_t v8 = (UNUserNotificationCenter *)objc_msgSend(v7, "initWithBundleIdentifier:", @"com.apple.ATXDebugNotifications", v10, v11, v12, v13);
    notificationCenter = self->_notificationCenter;
    self->_notificationCenter = v8;

    [(UNUserNotificationCenter *)self->_notificationCenter setDelegate:self];
    [(UNUserNotificationCenter *)self->_notificationCenter setWantsNotificationResponsesDelivered];
    [(UNUserNotificationCenter *)self->_notificationCenter requestAuthorizationWithOptions:6 completionHandler:&__block_literal_global_38_1];
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __41__ATXClientModelSuggestionReceiver_start__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[14] refreshBlendingLayer];
  }
  else
  {
    id v3 = __atxlog_handle_blending();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __41__ATXClientModelSuggestionReceiver_start__block_invoke_cold_1(v3);
    }
  }
}

void __41__ATXClientModelSuggestionReceiver_start__block_invoke_35(uint64_t a1, int a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "StackChangeDebugNotification: notification authorized = %d", (uint8_t *)v7, 8u);
  }

  if (v4)
  {
    v6 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __41__ATXClientModelSuggestionReceiver_start__block_invoke_35_cold_1();
    }
  }
}

- (void)dealloc
{
  int homeScreenStackChangeDarwinNotificationObserver = self->_homeScreenStackChangeDarwinNotificationObserver;
  if (homeScreenStackChangeDarwinNotificationObserver)
  {
    notify_cancel(homeScreenStackChangeDarwinNotificationObserver);
    self->_int homeScreenStackChangeDarwinNotificationObserver = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ATXClientModelSuggestionReceiver;
  [(ATXClientModelSuggestionReceiver *)&v4 dealloc];
}

+ (id)layoutSelectorsForConsumerSubTypes
{
  v18[13] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  id v3 = objc_opt_new();
  objc_super v4 = objc_opt_new();
  id v5 = objc_alloc(MEMORY[0x1E4F93918]);
  v6 = objc_opt_new();
  id v7 = [MEMORY[0x1E4F93550] sharedInstance];
  uint64_t v8 = (void *)[v5 initWithSuggestionDeduplicator:v6 hyperParameters:v7];

  id v9 = [ATXSpotlightLayoutSelector alloc];
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = [MEMORY[0x1E4F93550] sharedInstance];
  uint64_t v12 = [(ATXSpotlightLayoutSelector *)v9 initWithSuggestionDeduplicator:v10 hyperParameters:v11];

  v13 = objc_opt_new();
  v17[0] = &unk_1F27F1920;
  v17[1] = &unk_1F27F1938;
  v18[0] = v4;
  v18[1] = v8;
  v17[2] = &unk_1F27F1950;
  v17[3] = &unk_1F27F1968;
  v18[2] = v12;
  v18[3] = v8;
  v17[4] = &unk_1F27F1980;
  v17[5] = &unk_1F27F1998;
  v18[4] = v8;
  v18[5] = v8;
  v17[6] = &unk_1F27F19B0;
  v17[7] = &unk_1F27F19C8;
  v18[6] = v8;
  v18[7] = v8;
  v17[8] = &unk_1F27F19E0;
  v17[9] = &unk_1F27F19F8;
  v18[8] = v8;
  v18[9] = v8;
  v17[10] = &unk_1F27F1A10;
  v17[11] = &unk_1F27F1A28;
  v18[10] = v8;
  v18[11] = v2;
  v17[12] = &unk_1F27F1A40;
  v18[12] = v3;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:13];
  [v13 setDictionary:v14];

  v15 = (void *)[v13 copy];
  return v15;
}

- (void)_sendStackChangeDebugNotification:(id)a3
{
  if (self->_notificationCenter)
  {
    id v4 = a3;
    id v25 = (id)objc_opt_new();
    [v25 setTitle:@"Widget Stack Change Alert"];
    id v5 = [v4 userInfo];

    uint64_t v6 = *MEMORY[0x1E4F4B528];
    id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4B528]];
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F4B540]];
    int v9 = [v7 isEqualToNumber:v8];

    uint64_t v10 = NSString;
    if (v9)
    {
      uint64_t v11 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4B530]];
      uint64_t v12 = (void *)v11;
      v13 = @"unknown";
      if (v11) {
        v13 = (__CFString *)v11;
      }
      id v14 = [v10 stringWithFormat:@"The suggested widget on the Today page changed to %@", v13];
      [v25 setBody:v14];
    }
    else
    {
      uint64_t v15 = [v5 objectForKeyedSubscript:v6];
      uint64_t v12 = (void *)v15;
      if (v15) {
        uint64_t v16 = (__CFString *)v15;
      }
      else {
        uint64_t v16 = @"unknown";
      }
      uint64_t v17 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4B530]];
      id v14 = (void *)v17;
      if (v17) {
        uint64_t v18 = (__CFString *)v17;
      }
      else {
        uint64_t v18 = @"unknown";
      }
      v19 = [v10 stringWithFormat:@"The suggested widget on page %@ changed to %@", v16, v18];
      [v25 setBody:v19];
    }
    uint64_t v20 = [MEMORY[0x1E4F44670] triggerWithTimeInterval:0 repeats:1.0];
    v21 = (void *)MEMORY[0x1E4F44628];
    v22 = [MEMORY[0x1E4F29128] UUID];
    objc_super v23 = [v22 UUIDString];
    v24 = [v21 requestWithIdentifier:v23 content:v25 trigger:v20];

    [(UNUserNotificationCenter *)self->_notificationCenter addNotificationRequest:v24 withCompletionHandler:&__block_literal_global_94_0];
  }
}

void __70__ATXClientModelSuggestionReceiver__sendStackChangeDebugNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __70__ATXClientModelSuggestionReceiver__sendStackChangeDebugNotification___block_invoke_cold_1();
    }
  }
}

- (void)blendingLayerRerankedSuggestions:(id)a3 consumerSubType:(unsigned __int8)a4
{
  if (a4 == 34)
  {
    id v5 = a3;
    id v6 = +[ATXContextualEngine sharedInstance];
    [v6 donateRerankedBlendingSuggestions:v5];
  }
}

- (void)blendingLayerUpdatedUICache:(id)a3 consumerSubType:(unsigned __int8)a4
{
  int v4 = a4;
  id v7 = a3;
  uint64_t v8 = v7;
  if (v4 <= 33)
  {
    switch(v4)
    {
      case 21:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v14 = v8;
        }
        else {
          id v14 = 0;
        }
        [(ATXSpotlightActionsSuggestionSender *)self->_spotlightActionsSuggestionSender blendingLayerDidUpdateSpotlightUICache:v14];

        break;
      case 22:
        if (v7)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v28 = [MEMORY[0x1E4F28B00] currentHandler];
            v29 = (objc_class *)objc_opt_class();
            v30 = NSStringFromClass(v29);
            v31 = (objc_class *)objc_opt_class();
            v32 = NSStringFromClass(v31);
            [v28 handleFailureInMethod:a2, self, @"ATXClientModelSuggestionReceiver.m", 270, @"Expected cache update being pushed to lockscreen to be of type %@, but got an object of another type instead %@", v30, v32 object file lineNumber description];
          }
          id v15 = v8;
        }
        [(ATXLockscreenSuggestionSender *)self->_lockscreenSuggestionSender blendingLayerDidUpdateLockscreenUICache:v8];
        goto LABEL_31;
      case 31:
        [(ATXAppSwitcherSuggestionSender *)self->_appSwitcherSuggestionSender blendingLayerDidUpdateAppSwitcherUICache];
        break;
    }
  }
  else
  {
    if (v4 <= 45)
    {
      if (v4 == 34)
      {
        if (v7)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_super v23 = [MEMORY[0x1E4F28B00] currentHandler];
            v24 = (objc_class *)objc_opt_class();
            id v25 = NSStringFromClass(v24);
            v26 = (objc_class *)objc_opt_class();
            v27 = NSStringFromClass(v26);
            [v23 handleFailureInMethod:a2, self, @"ATXClientModelSuggestionReceiver.m", 239, @"Expected cache update being pushed to homescreen to be of type %@, but got an object of another type instead %@", v25, v27 object file lineNumber description];
          }
          homeScreenSuggestionSender = self->_homeScreenSuggestionSender;
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __80__ATXClientModelSuggestionReceiver_blendingLayerUpdatedUICache_consumerSubType___block_invoke;
          v34[3] = &unk_1E68B36D8;
          v34[4] = self;
          [(ATXHomeScreenSuggestionSender *)homeScreenSuggestionSender blendingLayerDidUpdateHomeScreenCachedSuggestions:v8 completion:v34];
        }
      }
      else if (v4 == 35 && v7)
      {
        appDirectoryOrderingProvider = self->_appDirectoryOrderingProvider;
        if (!appDirectoryOrderingProvider)
        {
          uint64_t v10 = +[ATXAppDirectoryOrderingProvider sharedInstance];
          uint64_t v11 = self->_appDirectoryOrderingProvider;
          self->_appDirectoryOrderingProvider = v10;

          appDirectoryOrderingProvider = self->_appDirectoryOrderingProvider;
        }
        [(ATXAppDirectoryOrderingProvider *)appDirectoryOrderingProvider postPredictedAppsAndRecentsUpdateNotificationWithReason:@"Suggestions Cache Updated"];
      }
      goto LABEL_37;
    }
    if (v4 != 46)
    {
      if (v4 != 47) {
        goto LABEL_37;
      }
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
          v19 = (objc_class *)objc_opt_class();
          uint64_t v20 = NSStringFromClass(v19);
          v21 = (objc_class *)objc_opt_class();
          v22 = NSStringFromClass(v21);
          [v18 handleFailureInMethod:a2, self, @"ATXClientModelSuggestionReceiver.m", 281, @"Expected cache update being pushed to Watch to be of type %@, but got an object of another type instead %@", v20, v22 object file lineNumber description];
        }
        id v12 = v8;
      }
      [(ATXWatchSmartStacksSender *)self->_watchSmartStacksSender blendingLayerDidUpdateUICache:v8];
LABEL_31:

      goto LABEL_37;
    }
    uint64_t v16 = __atxlog_handle_settings_actions();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "Posting distributed notification about settings action suggestions refresh", buf, 2u);
    }

    uint64_t v17 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v17 postNotificationName:*MEMORY[0x1E4F4ADE0] object:0];
  }
LABEL_37:
}

void __80__ATXClientModelSuggestionReceiver_blendingLayerUpdatedUICache_consumerSubType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = self;
  if (v2)
  {
    int v4 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__ATXClientModelSuggestionReceiver_blendingLayerUpdatedUICache_consumerSubType___block_invoke_cold_1();
    }
  }
}

- (void)willCreateCacheUpdateWithFeedbackMetadataLength:(int64_t)a3 forClientModelId:(id)a4
{
  id v6 = a4;
  if (_PASIsInternalDevice())
  {
    if (self->_notificationCenter)
    {
      Boolean keyExistsAndHasValidFormat = 0;
      int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ATXBlendingMemoryWarningAlert", (CFStringRef)*MEMORY[0x1E4F4B688], &keyExistsAndHasValidFormat);
      if (a3 >= 256000)
      {
        if (AppBooleanValue)
        {
          uint64_t v8 = objc_opt_new();
          [v8 setTitle:@"File a Blending Memory Radar"];
          int v9 = [NSString stringWithFormat:@"🚨 Feedback metadata for a blending update exceeded %d KB in size. (%@)", 250, v6];
          [v8 setBody:v9];

          uint64_t v10 = (void *)MEMORY[0x1E4F44628];
          uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
          id v12 = [v11 UUIDString];
          v13 = [v10 requestWithIdentifier:v12 content:v8 trigger:0];

          [(UNUserNotificationCenter *)self->_notificationCenter addNotificationRequest:v13 withCompletionHandler:&__block_literal_global_127];
        }
      }
    }
  }
}

void __101__ATXClientModelSuggestionReceiver_willCreateCacheUpdateWithFeedbackMetadataLength_forClientModelId___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = __atxlog_handle_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __101__ATXClientModelSuggestionReceiver_willCreateCacheUpdateWithFeedbackMetadataLength_forClientModelId___block_invoke_cold_1();
    }
  }
}

- (BOOL)rerouteSuggestions:(id)a3 clientModelId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(ATXClientModelSuggestionRouter *)self->_router shouldRouteClientToInfoSuggestionEngine:v9];
  if (v11) {
    [(ATXClientModelSuggestionReceiver *)self routeSuggestionsToInfoSuggestionEngine:v8 clientModelId:v9 completion:v10];
  }

  return v11;
}

- (void)routeSuggestionsToInfoSuggestionEngine:(id)a3 clientModelId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = __atxlog_handle_blending();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "Blending: route suggestions to the info engine", buf, 2u);
  }

  id v12 = +[ATXInfoSuggestionServer sharedInstance];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __100__ATXClientModelSuggestionReceiver_routeSuggestionsToInfoSuggestionEngine_clientModelId_completion___block_invoke;
  v16[3] = &unk_1E68B3700;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  [v12 overwriteSuggestionsWithProactiveSuggestions:v14 forClientModelIdentifier:v15 completionHandler:v16];
}

void __100__ATXClientModelSuggestionReceiver_routeSuggestionsToInfoSuggestionEngine_clientModelId_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (!v5 && [*(id *)(a1[4] + 8) shouldPersistCacheForClientModel:a1[5]])
  {
    id v6 = objc_opt_class();
    if (v9)
    {
      uint64_t v7 = *(void *)(a1[4] + 72);
      id v8 = v9;
    }
    else
    {
      id v8 = (id)a1[6];
      uint64_t v7 = *(void *)(a1[4] + 72);
    }
    [v6 _updateCacheForClientModel:a1[5] withSuggestions:v8 cacheManager:v7];
  }
  (*(void (**)(void))(a1[7] + 16))();
}

+ (void)_updateCacheForClientModel:(id)a3 withSuggestions:(id)a4 cacheManager:(id)a5
{
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F938D0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)[[v7 alloc] initWithClientModelId:v10 suggestions:v9 feedbackMetadata:0 responseForRealTimeRequest:0];

  [v8 updateCachedSuggestions:v11];
}

+ (void)clearPreviouslyPersistedCachesForCardSuggestionClientsIfNecessary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.photos", @"com.apple.news", 0);
  id v3 = objc_opt_new();
  int v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ([v4 shouldRouteClientToInfoSuggestionEngine:v11])
        {
          id v12 = [v3 lastCacheUpdateDateForClientModel:v11];

          if (v12) {
            [(id)objc_opt_class() _updateCacheForClientModel:v11 withSuggestions:v9 cacheManager:v3];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (ATXUniversalBlendingLayerServer)blendingLayerServer
{
  return self->_blendingLayerServer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendingLayerServer, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_coalescedBlendingLayerRefreshOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientModelCacheManager, 0);
  objc_storeStrong((id *)&self->_uninstallNotificationListener, 0);
  objc_storeStrong((id *)&self->_spotlightActionsSuggestionSender, 0);
  objc_storeStrong((id *)&self->_watchSmartStacksSender, 0);
  objc_storeStrong((id *)&self->_lockscreenSuggestionSender, 0);
  objc_storeStrong((id *)&self->_homeScreenSuggestionSender, 0);
  objc_storeStrong((id *)&self->_appSwitcherSuggestionSender, 0);
  objc_storeStrong((id *)&self->_appDirectoryOrderingProvider, 0);
  objc_storeStrong((id *)&self->_router, 0);
}

void __41__ATXClientModelSuggestionReceiver_start__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXClientModelSuggestionReceiver: couldn't perform refresh operation because swelf is nil in uninstall handler in -[ATXClientModelSuggestionReceiver start].", v1, 2u);
}

void __41__ATXClientModelSuggestionReceiver_start__block_invoke_35_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "StackChangeDebugNotification: error while requesting notification auth - %@", v2, v3, v4, v5, v6);
}

void __70__ATXClientModelSuggestionReceiver__sendStackChangeDebugNotification___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "StackChangeDebugNotification: error while adding notification request - %@", v2, v3, v4, v5, v6);
}

void __80__ATXClientModelSuggestionReceiver_blendingLayerUpdatedUICache_consumerSubType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Blending: failed to push update to home screen - %@", v2, v3, v4, v5, v6);
}

void __101__ATXClientModelSuggestionReceiver_willCreateCacheUpdateWithFeedbackMetadataLength_forClientModelId___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error while adding blending memory warning notification request: %@", v2, v3, v4, v5, v6);
}

@end