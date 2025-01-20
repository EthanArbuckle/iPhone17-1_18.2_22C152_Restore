@interface ATXAppDirectoryClient
+ (id)_allPlaceholderBundleIdsFromHomeScreenService:(id)a3;
+ (id)_sortedAllOtherBundleIDsFromAllBundleIDs:(id)a3 allPlaceholderBundleIDs:(id)a4 hardcodedAppCategoryMappings:(id)a5;
+ (id)_sortedBundleIDsByCategoryWithHardcodedAppCategoryMappings:(id)a3;
+ (id)_sortedDefaultCategories;
+ (id)hardcodedAppCategoryMappings;
+ (id)sharedInstance;
+ (void)hardcodedAppCategoryMappings;
- (BOOL)didSendFeedbackDuringSession;
- (NSArray)recentAppsVisible;
- (NSArray)topAppsVisible;
- (id)_hiddenAppsFromCache;
- (id)_init;
- (id)_suggestionsPodDedupableBundleIds;
- (void)_addEngagedSuggestionToERM:(id)a3;
- (void)_hiddenAppsFromCache;
- (void)_logCaptureRateCapture;
- (void)_logCaptureRateDiversionWithType:(int)a3;
- (void)_logToBiome:(unint64_t)a3 metadata:(id)a4;
- (void)_logToBiomeWithEventType:(unint64_t)a3 date:(id)a4 blendingCacheUUID:(id)a5 shownSuggestionIds:(id)a6 engagedSuggestionIds:(id)a7 categoryID:(id)a8 categoryIndex:(id)a9 bundleId:(id)a10 bundleIndex:(id)a11 searchQueryLength:(id)a12 searchTab:(id)a13 bundleIdInTopAppsVisible:(id)a14 userLaunchedAppBeforeLeaving:(id)a15;
- (void)_logToDuet:(unint64_t)a3 metadata:(id)a4;
- (void)_resetSessionState;
- (void)_updateTopAppsVisibilityWithCategories:(id)a3;
- (void)appLaunchDatesWithReply:(id)a3;
- (void)categoriesWithReply:(id)a3;
- (void)categoriesWithShouldUseDefault:(BOOL)a3 reply:(id)a4;
- (void)dealloc;
- (void)logCategoryExitWithDate:(id)a3 categoryID:(unint64_t)a4 categoryIndex:(unint64_t)a5;
- (void)logCategoryExpansionWithDate:(id)a3 categoryID:(unint64_t)a4 categoryIndex:(unint64_t)a5;
- (void)logCloseSearchWithDate:(id)a3;
- (void)logDidEnterAppDirectoryWithDate:(id)a3;
- (void)logDidLeaveAppDirectoryWithDate:(id)a3 appDirectoryResponse:(id)a4;
- (void)logLaunchFromCategoryPreviewWithDate:(id)a3 categoryID:(unint64_t)a4 categoryIndex:(unint64_t)a5 bundleID:(id)a6 bundleIndex:(unint64_t)a7 appDirectoryResponse:(id)a8;
- (void)logLaunchFromExpandedCategoryWithDate:(id)a3 categoryID:(unint64_t)a4 categoryIndex:(unint64_t)a5 bundleID:(id)a6 bundleIndex:(unint64_t)a7 appDirectoryResponse:(id)a8;
- (void)logLaunchFromSearchWithDate:(id)a3 bundleID:(id)a4 bundleIndex:(unint64_t)a5 searchQueryLength:(unint64_t)a6 searchTab:(unint64_t)a7 appDirectoryResponse:(id)a8;
- (void)logOpenSearchWithDate:(id)a3;
- (void)notifyBookmarksDidChange;
- (void)predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps:(unint64_t)a3 shouldUseDefaultCategories:(BOOL)a4 reply:(id)a5;
- (void)predictedAppsAndRecentAppsWithShouldUseDefaultCategories:(BOOL)a3 reply:(id)a4;
- (void)requestNotificationWhenCategoriesAreReady;
- (void)setDidSendFeedbackDuringSession:(BOOL)a3;
- (void)setRecentAppsVisible:(id)a3;
- (void)setTopAppsVisible:(id)a3;
@end

@implementation ATXAppDirectoryClient

void __113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke_33(uint64_t a1)
{
  v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Top apps are visible, did send reply", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (id)_hiddenAppsFromCache
{
  id v2 = objc_alloc(MEMORY[0x1E4F4B638]);
  uint64_t v3 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"ATXAppDirectoryHiddenAppsCache"];
  v4 = __atxlog_handle_app_library();
  v5 = (void *)[v2 initWithCacheFilePath:v3 loggingHandle:v4 debugName:@"hidden apps"];

  v6 = (void *)MEMORY[0x1AD0D3C30]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  id v16 = 0;
  v10 = [v5 readSecureCodedObjectWithMaxValidAge:v9 allowableClasses:&v16 error:-1.0];
  id v11 = v16;

  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    v13 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXAppDirectoryClient _hiddenAppsFromCache]();
    }

    uint64_t v14 = objc_opt_new();
    v10 = (void *)v14;
  }

  return v10;
}

ATXAppDirectoryResponse *__113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke(uint64_t a1)
{
  id v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Starting to process recent apps", buf, 2u);
  }

  id v3 = objc_alloc(MEMORY[0x1E4F4B638]);
  v4 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"ATXAppDirectoryRecentsCache"];
  v5 = __atxlog_handle_app_library();
  v6 = (void *)[v3 initWithCacheFilePath:v4 loggingHandle:v5 debugName:@"recent apps"];

  id v7 = (void *)MEMORY[0x1AD0D3C30]();
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
  id v24 = 0;
  id v11 = [v6 readSecureCodedObjectWithMaxValidAge:v10 allowableClasses:&v24 error:-1.0];
  id v12 = v24;

  if (!v11)
  {
    v13 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke_cold_1();
    }

    id v11 = objc_opt_new();
  }
  uint64_t v14 = [ATXAppDirectoryResponse alloc];
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = [*(id *)(a1 + 40) _hiddenAppsFromCache];
  v17 = [*(id *)(a1 + 40) topAppsVisible];
  v18 = [(ATXAppDirectoryResponse *)v14 initWithSuggestionLayout:v15 recentApps:v11 hiddenApps:v16 otherAppsOnScreen:v17 numAppsToPredict:*(void *)(a1 + 48) error:v12];

  v19 = *(void **)(a1 + 40);
  v20 = [(ATXAppDirectoryResponse *)v18 recentAppsVisible];
  [v19 setRecentAppsVisible:v20];

  v21 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_1A790D000, v21, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Finished processing recent apps", v23, 2u);
  }

  return v18;
}

- (NSArray)topAppsVisible
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRecentAppsVisible:(id)a3
{
}

- (void)predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps:(unint64_t)a3 shouldUseDefaultCategories:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, id))a5;
  uint64_t v9 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v39 = v5;
    _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Starting loading predicted app with shouldUseDefaultCategories: %{BOOL}d", buf, 8u);
  }

  BOOL v10 = +[ATXDemoAppLibraryProvider isAppLibraryDemoModeEnabled];
  id v11 = __atxlog_handle_app_library();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: Using Demo suggestions and recents", buf, 2u);
    }

    if (v8)
    {
      id v13 = +[ATXDemoAppLibraryProvider demoSuggestionsAndRecents];
      v8[2](v8, v13);
      goto LABEL_23;
    }
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: Using non-demo suggestions and recents", buf, 2u);
    }
  }
  blendingClient = self->_blendingClient;
  if (!blendingClient)
  {
    uint64_t v15 = [[ATXProactiveSuggestionClient alloc] initWithConsumerSubType:35];
    id v16 = self->_blendingClient;
    self->_blendingClient = v15;

    blendingClient = self->_blendingClient;
  }
  v17 = [(ATXProactiveSuggestionClient *)blendingClient suggestionLayoutFromCache];
  v18 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A790D000, v18, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Read suggestion layout from cache", buf, 2u);
  }

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke;
  v34[3] = &unk_1E5D05BB0;
  id v13 = v17;
  id v35 = v13;
  v36 = self;
  unint64_t v37 = a3;
  v19 = (void *)MEMORY[0x1AD0D3E40](v34);
  v20 = [(ATXAppDirectoryClient *)self topAppsVisible];

  v21 = __atxlog_handle_app_library();
  v22 = v21;
  if (v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v22, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Top apps are visible, will send reply", buf, 2u);
    }

    v23 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke_33;
    block[3] = &unk_1E5D05C00;
    id v24 = (id *)&v29;
    v25 = &v30;
    v29 = v8;
    v30 = v19;
    id v26 = v19;
    dispatch_async(v23, block);
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ATXAppDirectoryClient predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps:shouldUseDefaultCategories:reply:]();
    }

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke_32;
    v31[3] = &unk_1E5D05BD8;
    id v24 = (id *)&v32;
    v25 = &v33;
    v32 = v8;
    v33 = v19;
    id v27 = v19;
    [(ATXAppDirectoryClient *)self categoriesWithShouldUseDefault:v5 reply:v31];
  }

LABEL_23:
}

- (void)predictedAppsAndRecentAppsWithShouldUseDefaultCategories:(BOOL)a3 reply:(id)a4
{
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_2, &__block_literal_global_8);
  }
  id v2 = (void *)sharedInstance__pasExprOnceResult_3;

  return v2;
}

void __39__ATXAppDirectoryClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1AD0D3C30]();
  id v1 = [[ATXAppDirectoryClient alloc] _init];
  id v2 = (void *)sharedInstance__pasExprOnceResult_3;
  sharedInstance__pasExprOnceResult_3 = (uint64_t)v1;
}

- (id)_init
{
  v13.receiver = self;
  v13.super_class = (Class)ATXAppDirectoryClient;
  id v2 = [(ATXAppDirectoryClient *)&v13 init];
  if (v2)
  {
    id v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    BOOL v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    loggingQueue = v2->_loggingQueue;
    v2->_loggingQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.proactive.appDirectory" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v9;

    id v11 = ATXAppDirectoryInterface();
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v11];

    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global_10];
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:&__block_literal_global_13];
    [(NSXPCConnection *)v2->_xpcConnection resume];
  }
  return v2;
}

void __30__ATXAppDirectoryClient__init__block_invoke()
{
  v0 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __30__ATXAppDirectoryClient__init__block_invoke_cold_1();
  }
}

void __30__ATXAppDirectoryClient__init__block_invoke_11()
{
  v0 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __30__ATXAppDirectoryClient__init__block_invoke_11_cold_1();
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATXAppDirectoryClient;
  [(ATXAppDirectoryClient *)&v3 dealloc];
}

- (void)categoriesWithReply:(id)a3
{
}

- (void)categoriesWithShouldUseDefault:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_queue_t v7 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v28 = v4;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Starting requesting for categorization with shouldUseDefault: %{BOOL}d", buf, 8u);
  }

  if (v4
    && !+[ATXDemoAppLibraryProvider isAppLibraryDemoModeEnabled])
  {
    objc_super v13 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Using default categories", buf, 2u);
    }

    xpcConnection = self->_xpcConnection;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke;
    v24[3] = &unk_1E5D05B60;
    BOOL v26 = v4;
    id v25 = v6;
    uint64_t v15 = (void (**)(id, void *, void))v6;
    id v16 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v24];
    [v16 requestNotificationWhenCategoriesAreReady];

    v17 = [(id)objc_opt_class() _sortedDefaultCategories];
    v18 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v28 = v17 != 0;
      _os_log_impl(&dword_1A790D000, v18, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Obtained non-nil categories: %{BOOL}d", buf, 8u);
    }

    if (v17) {
      [(ATXAppDirectoryClient *)self _updateTopAppsVisibilityWithCategories:v17];
    }
    uint64_t v9 = &v25;
    v19 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v19, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Sending reply with default categories", buf, 2u);
    }

    v15[2](v15, v17, 0);
  }
  else
  {
    id v8 = self->_xpcConnection;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_18;
    v22[3] = &unk_1E5D04F50;
    uint64_t v9 = &v23;
    id v10 = v6;
    id v23 = v10;
    id v11 = [(NSXPCConnection *)v8 remoteObjectProxyWithErrorHandler:v22];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_19;
    v20[3] = &unk_1E5D05B88;
    v20[4] = self;
    id v21 = v10;
    id v12 = v10;
    [v11 categoriesWithReply:v20];
  }
}

void __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_cold_1();
  }

  if (!*(unsigned char *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_18_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_queue_t v7 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Start of categories reply", buf, 2u);
  }

  if (v5) {
    [*(id *)(a1 + 32) _updateTopAppsVisibilityWithCategories:v5];
  }
  BOOL v8 = +[ATXDemoAppLibraryProvider isAppLibraryDemoModeEnabled];
  uint64_t v9 = __atxlog_handle_app_library();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: Using Demo app categories", v14, 2u);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      id v12 = +[ATXDemoAppLibraryProvider demoAppCategoriesForRealAppCategories:v5];
      (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v6);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v13 = 0;
      _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Received successful categorization response from server", v13, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3 != 0;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Received reply for categories: %{BOOL}d", (uint8_t *)v7, 8u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

- (void)appLaunchDatesWithReply:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__ATXAppDirectoryClient_appLaunchDatesWithReply___block_invoke;
  v8[3] = &unk_1E5D04F50;
  id v9 = v4;
  id v6 = v4;
  dispatch_queue_t v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 appLaunchDatesWithReply:v6];
}

void __49__ATXAppDirectoryClient_appLaunchDatesWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__ATXAppDirectoryClient_appLaunchDatesWithReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)notifyBookmarksDidChange
{
  id v2 = [(NSXPCConnection *)self->_xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_35];
  [v2 notifyBookmarksDidChange];
}

void __49__ATXAppDirectoryClient_notifyBookmarksDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __49__ATXAppDirectoryClient_appLaunchDatesWithReply___block_invoke_cold_1();
  }
}

- (void)requestNotificationWhenCategoriesAreReady
{
  id v2 = [(NSXPCConnection *)self->_xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_37];
  [v2 requestNotificationWhenCategoriesAreReady];
}

void __66__ATXAppDirectoryClient_requestNotificationWhenCategoriesAreReady__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __49__ATXAppDirectoryClient_appLaunchDatesWithReply___block_invoke_cold_1();
  }
}

- (id)_suggestionsPodDedupableBundleIds
{
  id v3 = [(ATXAppDirectoryClient *)self topAppsVisible];
  if (!v3) {
    id v3 = objc_opt_new();
  }
  id v4 = [(ATXAppDirectoryClient *)self recentAppsVisible];
  if (!v4) {
    id v4 = objc_opt_new();
  }
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (void)_updateTopAppsVisibilityWithCategories:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B08];
  id v5 = a3;
  char v6 = [v4 isiPad];
  dispatch_queue_t v7 = objc_opt_new();
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __64__ATXAppDirectoryClient__updateTopAppsVisibilityWithCategories___block_invoke;
  id v12 = &unk_1E5D05C50;
  id v8 = v7;
  id v13 = v8;
  char v14 = v6;
  [v5 enumerateObjectsUsingBlock:&v9];

  if (v8) {
    -[ATXAppDirectoryClient setTopAppsVisible:](self, "setTopAppsVisible:", v8, v9, v10, v11, v12);
  }
}

void __64__ATXAppDirectoryClient__updateTopAppsVisibilityWithCategories___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = [v7 appBundleIDs];
  if ((unint64_t)[v8 count] > 4)
  {
    uint64_t v10 = 3;
  }
  else
  {
    uint64_t v9 = [v7 appBundleIDs];
    uint64_t v10 = [v9 count];
  }
  uint64_t v11 = [v7 appBundleIDs];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__ATXAppDirectoryClient__updateTopAppsVisibilityWithCategories___block_invoke_2;
  v12[3] = &unk_1E5D05C28;
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = v10;
  [v11 enumerateObjectsUsingBlock:v12];

  if (a3 >= 5 && !*(unsigned char *)(a1 + 40)) {
    *a4 = 1;
  }
}

uint64_t __64__ATXAppDirectoryClient__updateTopAppsVisibilityWithCategories___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) addObject:a2];
  if (*(void *)(a1 + 40) - 1 <= a3) {
    *a4 = 1;
  }
  return result;
}

+ (id)hardcodedAppCategoryMappings
{
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 pathForResource:@"AppDirectoryDefaultCategories" ofType:@"plist"];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v3];
  }
  else
  {
    id v5 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[ATXAppDirectoryClient hardcodedAppCategoryMappings]();
    }

    id v4 = 0;
  }

  return v4;
}

+ (id)_sortedBundleIDsByCategoryWithHardcodedAppCategoryMappings:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1AD0D3C30]();
  id v5 = objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__ATXAppDirectoryClient__sortedBundleIDsByCategoryWithHardcodedAppCategoryMappings___block_invoke;
  v18[3] = &unk_1E5D05C78;
  id v6 = v5;
  id v19 = v6;
  [v3 enumerateKeysAndObjectsUsingBlock:v18];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(v7, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v12 sortUsingComparator:&__block_literal_global_54];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v9);
  }

  return v7;
}

void __84__ATXAppDirectoryClient__sortedBundleIDsByCategoryWithHardcodedAppCategoryMappings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectForKeyedSubscript:v10];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 addObject:v6];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];

    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
    id v6 = (id)v9;
  }
}

uint64_t __84__ATXAppDirectoryClient__sortedBundleIDsByCategoryWithHardcodedAppCategoryMappings___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 lowercaseString];
  id v6 = [v4 lowercaseString];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)_sortedDefaultCategories
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1AD0D3C30](a1, a2);
  id v4 = [a1 hardcodedAppCategoryMappings];
  id v5 = (void *)[v4 mutableCopy];

  double Current = CFAbsoluteTimeGetCurrent();
  id v7 = objc_alloc_init(MEMORY[0x1E4FA6AC8]);
  uint64_t v8 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime v41 = CFAbsoluteTimeGetCurrent() - Current;
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "Time to initialize home screen service: %f seconds", buf, 0xCu);
  }

  double v9 = CFAbsoluteTimeGetCurrent();
  id v10 = +[ATXAppDisplayIdentifiers appIdentifiers];
  if (![v10 count])
  {
    uint64_t v11 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    id v12 = [v7 allHomeScreenApplicationBundleIdentifiers];
    if (v12) {
      [MEMORY[0x1E4F1CAD0] setWithArray:v12];
    }
    else {
    uint64_t v13 = [MEMORY[0x1E4F1CAD0] set];
    }

    id v10 = (void *)v13;
  }
  long long v14 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v15 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime v41 = v15 - v9;
    _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "Time to copy app identifiers: %f seconds", buf, 0xCu);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v16 = [v5 allKeys];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        if (([v10 containsObject:v21] & 1) == 0) {
          [v5 removeObjectForKey:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v18);
  }

  v22 = objc_opt_new();
  id v23 = [a1 _sortedBundleIDsByCategoryWithHardcodedAppCategoryMappings:v5];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __49__ATXAppDirectoryClient__sortedDefaultCategories__block_invoke;
  v33[3] = &unk_1E5D05CC0;
  id v24 = v22;
  id v34 = v24;
  [v23 enumerateKeysAndObjectsUsingBlock:v33];

  [v24 sortUsingComparator:&__block_literal_global_61];
  double v25 = CFAbsoluteTimeGetCurrent();
  BOOL v26 = [a1 _allPlaceholderBundleIdsFromHomeScreenService:v7];
  id v27 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v28 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime v41 = v28 - v25;
    _os_log_impl(&dword_1A790D000, v27, OS_LOG_TYPE_DEFAULT, "Time to retrieve app placeholders: %f seconds", buf, 0xCu);
  }

  uint64_t v29 = [a1 _sortedAllOtherBundleIDsFromAllBundleIDs:v10 allPlaceholderBundleIDs:v26 hardcodedAppCategoryMappings:v5];
  v30 = [[ATXAppDirectoryCategory alloc] initWithCategoryID:1008 appBundleIDs:v29];
  [v24 addObject:v30];
  id v31 = v24;

  return v31;
}

void __49__ATXAppDirectoryClient__sortedDefaultCategories__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [ATXAppDirectoryCategory alloc];
  uint64_t v8 = [v6 unsignedIntegerValue];

  double v9 = [(ATXAppDirectoryCategory *)v7 initWithCategoryID:v8 appBundleIDs:v5];
  [*(id *)(a1 + 32) addObject:v9];
}

uint64_t __49__ATXAppDirectoryClient__sortedDefaultCategories__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = +[ATXAppDirectoryCategory localizedStringForCategoryID:](ATXAppDirectoryCategory, "localizedStringForCategoryID:", [a2 categoryID]);
  uint64_t v6 = [v4 categoryID];

  id v7 = +[ATXAppDirectoryCategory localizedStringForCategoryID:v6];
  uint64_t v8 = [v5 compare:v7];

  return v8;
}

+ (id)_allPlaceholderBundleIdsFromHomeScreenService:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 allHomeScreenApplicationPlaceholderBundleIdentifiers];

  id v7 = (void *)[v5 initWithArray:v6];

  return v7;
}

+ (id)_sortedAllOtherBundleIDsFromAllBundleIDs:(id)a3 allPlaceholderBundleIDs:(id)a4 hardcodedAppCategoryMappings:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  context = (void *)MEMORY[0x1AD0D3C30]();
  id v10 = (void *)[v7 mutableCopy];
  [v10 unionSet:v8];
  uint64_t v11 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v18 = [v9 objectForKeyedSubscript:v17];

        if (!v18) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  [v11 sortUsingComparator:&__block_literal_global_63];

  return v11;
}

uint64_t __119__ATXAppDirectoryClient__sortedAllOtherBundleIDsFromAllBundleIDs_allPlaceholderBundleIDs_hardcodedAppCategoryMappings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 lowercaseString];
  uint64_t v6 = [v4 lowercaseString];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_addEngagedSuggestionToERM:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_loggingQueue);
  id v5 = v9;
  if (v9)
  {
    engagementRecordManager = self->_engagementRecordManager;
    if (!engagementRecordManager)
    {
      uint64_t v7 = +[ATXEngagementRecordManager sharedInstance];
      id v8 = self->_engagementRecordManager;
      self->_engagementRecordManager = v7;

      engagementRecordManager = self->_engagementRecordManager;
    }
    uint64_t v4 = [(ATXEngagementRecordManager *)engagementRecordManager addEngagedSuggestion:v9 engagementRecordType:1];
    id v5 = v9;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_logCaptureRateDiversionWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_loggingQueue);
  tracker = self->_tracker;
  if (!tracker)
  {
    uint64_t v6 = (ATXPETEventTracker2Protocol *)objc_opt_new();
    uint64_t v7 = self->_tracker;
    self->_tracker = v6;

    tracker = self->_tracker;
  }

  +[ATXBlendingCaptureRateTracker logAppDirectoryDiversionWithCaptureType:v3 tracker:tracker];
}

- (void)_logCaptureRateCapture
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_loggingQueue);
  tracker = self->_tracker;
  if (!tracker)
  {
    uint64_t v4 = (ATXPETEventTracker2Protocol *)objc_opt_new();
    id v5 = self->_tracker;
    self->_tracker = v4;

    tracker = self->_tracker;
  }

  +[ATXBlendingCaptureRateTracker logAppDirectoryCaptureWithTracker:tracker];
}

- (void)_logToBiomeWithEventType:(unint64_t)a3 date:(id)a4 blendingCacheUUID:(id)a5 shownSuggestionIds:(id)a6 engagedSuggestionIds:(id)a7 categoryID:(id)a8 categoryIndex:(id)a9 bundleId:(id)a10 bundleIndex:(id)a11 searchQueryLength:(id)a12 searchTab:(id)a13 bundleIdInTopAppsVisible:(id)a14 userLaunchedAppBeforeLeaving:(id)a15
{
  unint64_t v18 = (unint64_t)a14;
  unint64_t v19 = (unint64_t)a15;
  v43 = self;
  queue = self->_loggingQueue;
  id v38 = a13;
  id v37 = a12;
  id v36 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  dispatch_assert_queue_V2(queue);
  v44 = (void *)v18;
  if (v18 | v19) {
    id v27 = [[ATXAppDirectoryEventMetadata alloc] initWithBundleIdInTopAppsVisible:v18 userLaunchedAppBeforeLeaving:v19];
  }
  else {
    id v27 = 0;
  }
  uint64_t v42 = v27;
  uint64_t v40 = [[ATXAppDirectoryEvent alloc] initWithDate:v26 eventType:a3 categoryID:v22 categoryIndex:v21 bundleId:v20 bundleIndex:v36 searchQueryLength:v37 searchTab:v38 blendingCacheUUID:v25 shownSuggestionIds:v24 engagedSuggestionIds:v23 metadata:v27];

  uiStream = v43->_uiStream;
  if (!uiStream)
  {
    uint64_t v29 = objc_opt_new();
    v30 = v43->_uiStream;
    v43->_uiStream = (ATXUniversalBiomeUIStream *)v29;

    uiStream = v43->_uiStream;
  }
  id v31 = +[ATXUIEvent uiEventWithAppDirectoryEvent:v40];
  [(ATXUniversalBiomeUIStream *)uiStream donateGenericUIEvent:v31];

  v32 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    -[ATXAppDirectoryClient _logToBiomeWithEventType:date:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:bundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:](v40, v32);
  }
}

- (void)_logToBiome:(unint64_t)a3 metadata:(id)a4
{
  loggingQueue = self->_loggingQueue;
  id v7 = a4;
  dispatch_assert_queue_V2(loggingQueue);
  id v13 = +[ATXAppDirectoryEvent appDirectoryEventWithEventType:a3 metadata:v7];

  id v8 = v13;
  if (v13)
  {
    uiStream = self->_uiStream;
    if (!uiStream)
    {
      id v10 = (ATXUniversalBiomeUIStream *)objc_opt_new();
      uint64_t v11 = self->_uiStream;
      self->_uiStream = v10;

      uiStream = self->_uiStream;
    }
    id v12 = +[ATXUIEvent uiEventWithAppDirectoryEvent:v13];
    [(ATXUniversalBiomeUIStream *)uiStream donateGenericUIEvent:v12];

    id v8 = v13;
  }
}

- (void)_logToDuet:(unint64_t)a3 metadata:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_loggingQueue);
  if (self->_knowledgeStore
    || ([MEMORY[0x1E4F5B560] knowledgeStore],
        id v7 = (_DKKnowledgeSaving *)objc_claimAutoreleasedReturnValue(),
        id v8 = self->_knowledgeStore,
        self->_knowledgeStore = v7,
        v8,
        self->_knowledgeStore))
  {
    knowledgeStream = self->_knowledgeStream;
    if (knowledgeStream
      || ([MEMORY[0x1E4F5B5F8] appDirectoryInteractionStream],
          id v10 = (_DKEventStream *)objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = self->_knowledgeStream,
          self->_knowledgeStream = v10,
          v11,
          (knowledgeStream = self->_knowledgeStream) != 0))
    {
      id v12 = (void *)MEMORY[0x1E4F5B510];
      id v13 = [v6 objectForKeyedSubscript:@"kATXAppDirectoryLoggingDate"];
      uint64_t v14 = [v6 objectForKeyedSubscript:@"kATXAppDirectoryLoggingDate"];
      uint64_t v15 = (void *)MEMORY[0x1E4F5B4D8];
      long long v16 = [MEMORY[0x1E4F5B488] type];
      uint64_t v17 = [v15 categoryWithInteger:a3 type:v16];
      unint64_t v18 = [v12 eventWithStream:knowledgeStream startDate:v13 endDate:v14 value:v17 metadata:v6];

      knowledgeStore = self->_knowledgeStore;
      v23[0] = v18;
      id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      [(_DKKnowledgeSaving *)knowledgeStore saveObjects:v20 responseQueue:0 withCompletion:&__block_literal_global_78];

      if (ATXIsSessionEndedByEvent(a3))
      {
        id v21 = self->_knowledgeStore;
        self->_knowledgeStore = 0;

        id v22 = self->_knowledgeStream;
        self->_knowledgeStream = 0;
      }
    }
    else
    {
      unint64_t v18 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[ATXAppDirectoryClient _logToDuet:metadata:]();
      }
    }
  }
  else
  {
    unint64_t v18 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ATXAppDirectoryClient _logToDuet:metadata:]();
    }
  }
}

void __45__ATXAppDirectoryClient__logToDuet_metadata___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__ATXAppDirectoryClient__logToDuet_metadata___block_invoke_cold_1();
    }
  }
}

- (void)_resetSessionState
{
  self->_didSendFeedbackDuringSession = 0;
}

- (void)logDidEnterAppDirectoryWithDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[ATXHomeScreenSuggestionClient sharedInstance];
    [v5 logSpecialPageDidAppear:1 widgetsByStackId:0 prediction:0];

    loggingQueue = self->_loggingQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__ATXAppDirectoryClient_logDidEnterAppDirectoryWithDate___block_invoke;
    v15[3] = &unk_1E5D04FC8;
    long long v16 = v4;
    uint64_t v17 = self;
    dispatch_async(loggingQueue, v15);
    id v7 = v16;
  }
  else
  {
    id v7 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXAppDirectoryClient logDidEnterAppDirectoryWithDate:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

void __57__ATXAppDirectoryClient_logDidEnterAppDirectoryWithDate___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ATXAppDirectoryClient logDidEnterAppDirectoryWithDate:]_block_invoke";
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s", buf, 0xCu);
  }

  id v4 = @"kATXAppDirectoryLoggingDate";
  uint64_t v5 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  [*(id *)(a1 + 40) _logToDuet:0 metadata:v3];
  [*(id *)(a1 + 40) _logToBiomeWithEventType:0 date:*(void *)(a1 + 32) blendingCacheUUID:0 shownSuggestionIds:0 engagedSuggestionIds:0 categoryID:0 categoryIndex:0 bundleId:0 bundleIndex:0 searchQueryLength:0 searchTab:0 bundleIdInTopAppsVisible:0 userLaunchedAppBeforeLeaving:0];
  [*(id *)(a1 + 40) _resetSessionState];
}

- (void)logCategoryExpansionWithDate:(id)a3 categoryID:(unint64_t)a4 categoryIndex:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8)
  {
    loggingQueue = self->_loggingQueue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __79__ATXAppDirectoryClient_logCategoryExpansionWithDate_categoryID_categoryIndex___block_invoke;
    v19[3] = &unk_1E5D05D28;
    unint64_t v21 = a4;
    unint64_t v22 = a5;
    v19[4] = self;
    id v20 = v8;
    dispatch_async(loggingQueue, v19);
  }
  else
  {
    uint64_t v11 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXAppDirectoryClient logCategoryExpansionWithDate:categoryID:categoryIndex:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

void __79__ATXAppDirectoryClient_logCategoryExpansionWithDate_categoryID_categoryIndex___block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[6];
    uint64_t v4 = a1[7];
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "-[ATXAppDirectoryClient logCategoryExpansionWithDate:categoryID:categoryIndex:]_block_invoke";
    __int16 v17 = 2048;
    uint64_t v18 = v3;
    __int16 v19 = 2048;
    uint64_t v20 = v4;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s, categoryId: %tu, categoryIndex: %tu", buf, 0x20u);
  }

  uint64_t v5 = (void *)a1[4];
  v14[0] = a1[5];
  v13[0] = @"kATXAppDirectoryLoggingDate";
  v13[1] = @"kATXAppDirectoryLoggingCategoryID";
  id v6 = [NSNumber numberWithUnsignedInteger:a1[6]];
  v14[1] = v6;
  v13[2] = @"kATXAppDirectoryLoggingCategoryIndex";
  id v7 = [NSNumber numberWithUnsignedInteger:a1[7]];
  v14[2] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  [v5 _logToDuet:1 metadata:v8];

  uint64_t v9 = (void *)a1[4];
  uint64_t v10 = a1[5];
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:a1[6]];
  uint64_t v12 = [NSNumber numberWithUnsignedInteger:a1[7]];
  [v9 _logToBiomeWithEventType:1 date:v10 blendingCacheUUID:0 shownSuggestionIds:0 engagedSuggestionIds:0 categoryID:v11 categoryIndex:v12 bundleId:0 bundleIndex:0 searchQueryLength:0 searchTab:0 bundleIdInTopAppsVisible:0 userLaunchedAppBeforeLeaving:0];
}

- (void)logCategoryExitWithDate:(id)a3 categoryID:(unint64_t)a4 categoryIndex:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8)
  {
    loggingQueue = self->_loggingQueue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__ATXAppDirectoryClient_logCategoryExitWithDate_categoryID_categoryIndex___block_invoke;
    v19[3] = &unk_1E5D05D28;
    unint64_t v21 = a4;
    unint64_t v22 = a5;
    v19[4] = self;
    id v20 = v8;
    dispatch_async(loggingQueue, v19);
  }
  else
  {
    uint64_t v11 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXAppDirectoryClient logCategoryExitWithDate:categoryID:categoryIndex:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

void __74__ATXAppDirectoryClient_logCategoryExitWithDate_categoryID_categoryIndex___block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[6];
    uint64_t v4 = a1[7];
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "-[ATXAppDirectoryClient logCategoryExitWithDate:categoryID:categoryIndex:]_block_invoke";
    __int16 v17 = 2048;
    uint64_t v18 = v3;
    __int16 v19 = 2048;
    uint64_t v20 = v4;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s, categoryId: %tu, categoryIndex: %tu", buf, 0x20u);
  }

  uint64_t v5 = (void *)a1[4];
  v14[0] = a1[5];
  v13[0] = @"kATXAppDirectoryLoggingDate";
  v13[1] = @"kATXAppDirectoryLoggingCategoryID";
  id v6 = [NSNumber numberWithUnsignedInteger:a1[6]];
  v14[1] = v6;
  v13[2] = @"kATXAppDirectoryLoggingCategoryIndex";
  id v7 = [NSNumber numberWithUnsignedInteger:a1[7]];
  v14[2] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  [v5 _logToDuet:2 metadata:v8];

  uint64_t v9 = (void *)a1[4];
  uint64_t v10 = a1[5];
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:a1[6]];
  uint64_t v12 = [NSNumber numberWithUnsignedInteger:a1[7]];
  [v9 _logToBiomeWithEventType:2 date:v10 blendingCacheUUID:0 shownSuggestionIds:0 engagedSuggestionIds:0 categoryID:v11 categoryIndex:v12 bundleId:0 bundleIndex:0 searchQueryLength:0 searchTab:0 bundleIdInTopAppsVisible:0 userLaunchedAppBeforeLeaving:0];
}

- (void)logLaunchFromExpandedCategoryWithDate:(id)a3 categoryID:(unint64_t)a4 categoryIndex:(unint64_t)a5 bundleID:(id)a6 bundleIndex:(unint64_t)a7 appDirectoryResponse:(id)a8
{
  id v14 = a3;
  uint64_t v15 = (__CFString *)a6;
  id v16 = a8;
  if (v14)
  {
    if (!v15)
    {
      __int16 v17 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ATXAppDirectoryClient logLaunchFromExpandedCategoryWithDate:categoryID:categoryIndex:bundleID:bundleIndex:appDirectoryResponse:]();
      }

      uint64_t v15 = @"nil";
    }
    loggingQueue = self->_loggingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __130__ATXAppDirectoryClient_logLaunchFromExpandedCategoryWithDate_categoryID_categoryIndex_bundleID_bundleIndex_appDirectoryResponse___block_invoke;
    block[3] = &unk_1E5D05D50;
    unint64_t v32 = a4;
    unint64_t v33 = a5;
    uint64_t v15 = v15;
    CFAbsoluteTime v28 = v15;
    unint64_t v34 = a7;
    id v29 = v16;
    v30 = self;
    id v31 = v14;
    dispatch_async(loggingQueue, block);

    __int16 v19 = v28;
  }
  else
  {
    __int16 v19 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      [(ATXAppDirectoryClient *)v19 logLaunchFromExpandedCategoryWithDate:v21 categoryID:v22 categoryIndex:v23 bundleID:v24 bundleIndex:v25 appDirectoryResponse:v26];
    }
  }
}

void __130__ATXAppDirectoryClient_logLaunchFromExpandedCategoryWithDate_categoryID_categoryIndex_bundleID_bundleIndex_appDirectoryResponse___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 80);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136316418;
    BOOL v39 = "-[ATXAppDirectoryClient logLaunchFromExpandedCategoryWithDate:categoryID:categoryIndex:bundleID:bundleIndex:ap"
          "pDirectoryResponse:]_block_invoke";
    __int16 v40 = 2048;
    uint64_t v41 = v3;
    __int16 v42 = 2048;
    uint64_t v43 = v4;
    __int16 v44 = 2112;
    uint64_t v45 = v6;
    __int16 v46 = 2048;
    uint64_t v47 = v5;
    __int16 v48 = 2112;
    uint64_t v49 = v7;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s, categoryId: %lu, categoryIndex: %lu, bundleId: %@, bundleIndex: %lu, response: %@", buf, 0x3Eu);
  }

  id v8 = [*(id *)(a1 + 40) predictedApps];
  uint64_t v9 = [*(id *)(a1 + 40) predictedApps];
  unint64_t v10 = [v9 count];

  if (v10 >= 4) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = objc_msgSend(v8, "subarrayWithRange:", 0, v11);

  uint64_t v13 = NSNumber;
  id v14 = [*(id *)(a1 + 48) _suggestionsPodDedupableBundleIds];
  unint64_t v34 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "containsObject:", *(void *)(a1 + 32)));

  uint64_t v15 = *(void **)(a1 + 48);
  v37[0] = *(void *)(a1 + 56);
  v36[0] = @"kATXAppDirectoryLoggingDate";
  v36[1] = @"kATXAppDirectoryLoggingCategoryID";
  id v16 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  v37[1] = v16;
  v36[2] = @"kATXAppDirectoryLoggingCategoryIndex";
  __int16 v17 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  uint64_t v18 = *(void *)(a1 + 32);
  v37[2] = v17;
  v37[3] = v18;
  v36[3] = @"kATXAppDirectoryLoggingBundleID";
  v36[4] = @"kATXAppDirectoryLoggingBundleIndex";
  __int16 v19 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
  v37[4] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:5];
  [v15 _logToDuet:3 metadata:v20];

  uint64_t v22 = *(void **)(a1 + 48);
  uint64_t v21 = *(void *)(a1 + 56);
  uint64_t v23 = [*(id *)(a1 + 40) suggestionLayout];
  uint64_t v24 = [v23 uuid];
  long long v35 = (void *)v12;
  uint64_t v25 = [*(id *)(a1 + 40) uuidsForBundleIds:v12];
  uint64_t v26 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  id v27 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  uint64_t v28 = *(void *)(a1 + 32);
  id v29 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
  [v22 _logToBiomeWithEventType:3 date:v21 blendingCacheUUID:v24 shownSuggestionIds:v25 engagedSuggestionIds:0 categoryID:v26 categoryIndex:v27 bundleId:v28 bundleIndex:v29 searchQueryLength:0 searchTab:0 bundleIdInTopAppsVisible:v34 userLaunchedAppBeforeLeaving:0];

  if ([v34 BOOLValue]) {
    uint64_t v30 = 4006;
  }
  else {
    uint64_t v30 = 4002;
  }
  if (*(void *)(a1 + 64) == 4)
  {
    if ([v34 BOOLValue]) {
      uint64_t v30 = 4007;
    }
    else {
      uint64_t v30 = 4003;
    }
  }
  id v31 = (void *)CFPreferencesCopyAppValue(@"SuggestionsAppLibraryEnabled", @"com.apple.suggestions");
  if (!v31 || (unint64_t v32 = v31, v33 = [v31 BOOLValue], v32, v33)) {
    [*(id *)(a1 + 48) _logCaptureRateDiversionWithType:v30];
  }
  *(unsigned char *)(*(void *)(a1 + 48) + 72) = 1;
}

- (void)logLaunchFromCategoryPreviewWithDate:(id)a3 categoryID:(unint64_t)a4 categoryIndex:(unint64_t)a5 bundleID:(id)a6 bundleIndex:(unint64_t)a7 appDirectoryResponse:(id)a8
{
  id v14 = a3;
  uint64_t v15 = (__CFString *)a6;
  id v16 = a8;
  if (v14)
  {
    if (!v15)
    {
      __int16 v17 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ATXAppDirectoryClient logLaunchFromCategoryPreviewWithDate:categoryID:categoryIndex:bundleID:bundleIndex:appDirectoryResponse:]();
      }

      uint64_t v15 = @"nil";
    }
    loggingQueue = self->_loggingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __129__ATXAppDirectoryClient_logLaunchFromCategoryPreviewWithDate_categoryID_categoryIndex_bundleID_bundleIndex_appDirectoryResponse___block_invoke;
    block[3] = &unk_1E5D05D50;
    unint64_t v32 = a4;
    unint64_t v33 = a5;
    uint64_t v15 = v15;
    uint64_t v28 = v15;
    unint64_t v34 = a7;
    id v29 = v16;
    uint64_t v30 = self;
    id v31 = v14;
    dispatch_async(loggingQueue, block);

    __int16 v19 = v28;
  }
  else
  {
    __int16 v19 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      [(ATXAppDirectoryClient *)v19 logLaunchFromCategoryPreviewWithDate:v21 categoryID:v22 categoryIndex:v23 bundleID:v24 bundleIndex:v25 appDirectoryResponse:v26];
    }
  }
}

void __129__ATXAppDirectoryClient_logLaunchFromCategoryPreviewWithDate_categoryID_categoryIndex_bundleID_bundleIndex_appDirectoryResponse___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 80);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136316418;
    uint64_t v50 = "-[ATXAppDirectoryClient logLaunchFromCategoryPreviewWithDate:categoryID:categoryIndex:bundleID:bundleIndex:app"
          "DirectoryResponse:]_block_invoke";
    __int16 v51 = 2048;
    uint64_t v52 = v3;
    __int16 v53 = 2048;
    uint64_t v54 = v4;
    __int16 v55 = 2112;
    uint64_t v56 = v6;
    __int16 v57 = 2048;
    uint64_t v58 = v5;
    __int16 v59 = 2112;
    uint64_t v60 = v7;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s, categoryId: %lu, categoryIndex: %lu, bundleId: %@, bundleIndex: %lu, response: %@", buf, 0x3Eu);
  }

  id v8 = [*(id *)(a1 + 40) predictedApps];
  uint64_t v9 = [*(id *)(a1 + 40) predictedApps];
  unint64_t v10 = [v9 count];

  if (v10 >= 4) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = objc_msgSend(v8, "subarrayWithRange:", 0, v11);

  uint64_t v13 = NSNumber;
  id v14 = [*(id *)(a1 + 48) _suggestionsPodDedupableBundleIds];
  __int16 v44 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "containsObject:", *(void *)(a1 + 32)));

  uint64_t v43 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "containsObject:", *(void *)(a1 + 32)));
  uint64_t v15 = *(void *)(a1 + 64);
  v48[0] = *(void *)(a1 + 56);
  v47[0] = @"kATXAppDirectoryLoggingDate";
  v47[1] = @"kATXAppDirectoryLoggingCategoryID";
  id v16 = [NSNumber numberWithUnsignedInteger:v15];
  v48[1] = v16;
  v47[2] = @"kATXAppDirectoryLoggingCategoryIndex";
  __int16 v17 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  uint64_t v18 = *(void *)(a1 + 32);
  v48[2] = v17;
  v48[3] = v18;
  v47[3] = @"kATXAppDirectoryLoggingBundleID";
  v47[4] = @"kATXAppDirectoryLoggingBundleIndex";
  __int16 v19 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
  v48[4] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:5];

  __int16 v42 = (void *)v20;
  [*(id *)(a1 + 48) _logToDuet:4 metadata:v20];
  id v38 = *(void **)(a1 + 48);
  uint64_t v39 = *(void *)(a1 + 56);
  __int16 v40 = [*(id *)(a1 + 40) suggestionLayout];
  uint64_t v21 = [v40 uuid];
  uint64_t v22 = [*(id *)(a1 + 40) uuidsForBundleIds:v12];
  uint64_t v41 = v15;
  BOOL v23 = v15 == 3;
  uint64_t v45 = v12;
  uint64_t v24 = (void *)v21;
  if (v23)
  {
    uint64_t v25 = *(void **)(a1 + 40);
    uint64_t v46 = *(void *)(a1 + 32);
    id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
    uint64_t v26 = objc_msgSend(v25, "uuidsForBundleIds:");
  }
  else
  {
    uint64_t v26 = 0;
  }
  id v27 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  uint64_t v28 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  uint64_t v29 = *(void *)(a1 + 32);
  uint64_t v30 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
  [v38 _logToBiomeWithEventType:4 date:v39 blendingCacheUUID:v24 shownSuggestionIds:v22 engagedSuggestionIds:v26 categoryID:v27 categoryIndex:v28 bundleId:v29 bundleIndex:v30 searchQueryLength:0 searchTab:0 bundleIdInTopAppsVisible:v44 userLaunchedAppBeforeLeaving:0];

  if (v41 == 3)
  {

    id v31 = v43;
    unint64_t v32 = v45;
    if (([v43 BOOLValue] & 1) == 0)
    {
      unint64_t v33 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        __129__ATXAppDirectoryClient_logLaunchFromCategoryPreviewWithDate_categoryID_categoryIndex_bundleID_bundleIndex_appDirectoryResponse___block_invoke_cold_1();
      }
    }
    [*(id *)(a1 + 48) _logCaptureRateCapture];
    unint64_t v34 = *(void **)(a1 + 48);
    long long v35 = [*(id *)(a1 + 40) proactiveSuggestionForBundleId:*(void *)(a1 + 32)];
    [v34 _addEngagedSuggestionToERM:v35];
  }
  else
  {

    if ([v44 BOOLValue]) {
      uint64_t v36 = 4005;
    }
    else {
      uint64_t v36 = 4001;
    }
    unint64_t v32 = v45;
    id v31 = v43;
    if (v41 == 4)
    {
      if ([v44 BOOLValue]) {
        uint64_t v36 = 4007;
      }
      else {
        uint64_t v36 = 4003;
      }
    }
    if ([v45 count]) {
      [*(id *)(a1 + 48) _logCaptureRateDiversionWithType:v36];
    }
  }
  *(unsigned char *)(*(void *)(a1 + 48) + 72) = 1;
}

- (void)logLaunchFromSearchWithDate:(id)a3 bundleID:(id)a4 bundleIndex:(unint64_t)a5 searchQueryLength:(unint64_t)a6 searchTab:(unint64_t)a7 appDirectoryResponse:(id)a8
{
  id v14 = a3;
  uint64_t v15 = (__CFString *)a4;
  id v16 = a8;
  if (v14)
  {
    if (!v15)
    {
      __int16 v17 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ATXAppDirectoryClient logLaunchFromSearchWithDate:bundleID:bundleIndex:searchQueryLength:searchTab:appDirectoryResponse:]();
      }

      uint64_t v15 = @"nil";
    }
    loggingQueue = self->_loggingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __123__ATXAppDirectoryClient_logLaunchFromSearchWithDate_bundleID_bundleIndex_searchQueryLength_searchTab_appDirectoryResponse___block_invoke;
    block[3] = &unk_1E5D05D50;
    uint64_t v15 = v15;
    uint64_t v28 = v15;
    unint64_t v32 = a5;
    unint64_t v33 = a6;
    unint64_t v34 = a7;
    id v29 = v16;
    uint64_t v30 = self;
    id v31 = v14;
    dispatch_async(loggingQueue, block);

    __int16 v19 = v28;
  }
  else
  {
    __int16 v19 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      [(ATXAppDirectoryClient *)v19 logLaunchFromSearchWithDate:v21 bundleID:v22 bundleIndex:v23 searchQueryLength:v24 searchTab:v25 appDirectoryResponse:v26];
    }
  }
}

void __123__ATXAppDirectoryClient_logLaunchFromSearchWithDate_bundleID_bundleIndex_searchQueryLength_searchTab_appDirectoryResponse___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 80);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136316418;
    id v38 = "-[ATXAppDirectoryClient logLaunchFromSearchWithDate:bundleID:bundleIndex:searchQueryLength:searchTab:appDirect"
          "oryResponse:]_block_invoke";
    __int16 v39 = 2112;
    uint64_t v40 = v6;
    __int16 v41 = 2048;
    uint64_t v42 = v3;
    __int16 v43 = 2048;
    uint64_t v44 = v4;
    __int16 v45 = 2048;
    uint64_t v46 = v5;
    __int16 v47 = 2112;
    uint64_t v48 = v7;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s, bundleId: %@, bundleIndex: %lu, searchQueryLength: %lu, searchTab: %lu, response: %@", buf, 0x3Eu);
  }

  id v8 = [*(id *)(a1 + 40) predictedApps];
  uint64_t v9 = [*(id *)(a1 + 40) predictedApps];
  unint64_t v10 = [v9 count];

  if (v10 >= 4) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = objc_msgSend(v8, "subarrayWithRange:", 0, v11);

  uint64_t v13 = NSNumber;
  id v14 = [*(id *)(a1 + 48) _suggestionsPodDedupableBundleIds];
  unint64_t v34 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "containsObject:", *(void *)(a1 + 32)));

  id v16 = *(void **)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  v35[0] = @"kATXAppDirectoryLoggingDate";
  v35[1] = @"kATXAppDirectoryLoggingBundleID";
  uint64_t v17 = *(void *)(a1 + 32);
  v36[0] = v15;
  v36[1] = v17;
  v35[2] = @"kATXAppDirectoryLoggingBundleIndex";
  uint64_t v18 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  v36[2] = v18;
  v35[3] = @"kATXAppDirectoryLoggingSearchQueryLength";
  __int16 v19 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  v36[3] = v19;
  v35[4] = @"kATXAppDirectoryLoggingSearchTab";
  uint64_t v20 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
  v36[4] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:5];
  [v16 _logToDuet:6 metadata:v21];

  uint64_t v22 = *(void **)(a1 + 48);
  uint64_t v33 = *(void *)(a1 + 56);
  uint64_t v23 = [*(id *)(a1 + 40) suggestionLayout];
  uint64_t v24 = [v23 uuid];
  uint64_t v25 = (void *)v12;
  uint64_t v26 = [*(id *)(a1 + 40) uuidsForBundleIds:v12];
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  id v29 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  uint64_t v30 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
  [v22 _logToBiomeWithEventType:6 date:v33 blendingCacheUUID:v24 shownSuggestionIds:v26 engagedSuggestionIds:0 categoryID:0 categoryIndex:0 bundleId:v27 bundleIndex:v28 searchQueryLength:v29 searchTab:v30 bundleIdInTopAppsVisible:v34 userLaunchedAppBeforeLeaving:0];

  int v31 = [v34 BOOLValue];
  if ([v25 count])
  {
    if (v31) {
      uint64_t v32 = 4004;
    }
    else {
      uint64_t v32 = 4000;
    }
    [*(id *)(a1 + 48) _logCaptureRateDiversionWithType:v32];
  }
  *(unsigned char *)(*(void *)(a1 + 48) + 72) = 1;
}

- (void)logOpenSearchWithDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    loggingQueue = self->_loggingQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__ATXAppDirectoryClient_logOpenSearchWithDate___block_invoke;
    v15[3] = &unk_1E5D04FC8;
    void v15[4] = self;
    id v16 = v4;
    dispatch_async(loggingQueue, v15);
  }
  else
  {
    uint64_t v7 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXAppDirectoryClient logOpenSearchWithDate:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

uint64_t __47__ATXAppDirectoryClient_logOpenSearchWithDate___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[ATXAppDirectoryClient logOpenSearchWithDate:]_block_invoke";
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s", buf, 0xCu);
  }

  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v7 = @"kATXAppDirectoryLoggingDate";
  uint64_t v8 = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v4 _logToDuet:7 metadata:v5];

  return [*(id *)(a1 + 32) _logToBiomeWithEventType:7 date:*(void *)(a1 + 40) blendingCacheUUID:0 shownSuggestionIds:0 engagedSuggestionIds:0 categoryID:0 categoryIndex:0 bundleId:0 bundleIndex:0 searchQueryLength:0 searchTab:0 bundleIdInTopAppsVisible:0 userLaunchedAppBeforeLeaving:0];
}

- (void)logDidLeaveAppDirectoryWithDate:(id)a3 appDirectoryResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = +[ATXHomeScreenSuggestionClient sharedInstance];
    [v8 logSpecialPageDidDisappear:1];

    loggingQueue = self->_loggingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__ATXAppDirectoryClient_logDidLeaveAppDirectoryWithDate_appDirectoryResponse___block_invoke;
    block[3] = &unk_1E5D05D78;
    __int16 v19 = v7;
    uint64_t v20 = self;
    id v21 = v6;
    dispatch_async(loggingQueue, block);

    uint64_t v10 = v19;
  }
  else
  {
    uint64_t v10 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXAppDirectoryClient logDidLeaveAppDirectoryWithDate:appDirectoryResponse:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

void __78__ATXAppDirectoryClient_logDidLeaveAppDirectoryWithDate_appDirectoryResponse___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = "-[ATXAppDirectoryClient logDidLeaveAppDirectoryWithDate:appDirectoryResponse:]_block_invoke";
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s", buf, 0xCu);
  }

  uint64_t v3 = [*(id *)(a1 + 32) predictedApps];
  id v4 = [*(id *)(a1 + 32) predictedApps];
  unint64_t v5 = [v4 count];

  if (v5 >= 4) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = objc_msgSend(v3, "subarrayWithRange:", 0, v6);

  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v17 = @"kATXAppDirectoryLoggingDate";
  uint64_t v18 = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v9 _logToDuet:8 metadata:v10];

  uint64_t v12 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v13 = [*(id *)(a1 + 32) suggestionLayout];
  uint64_t v14 = [v13 uuid];
  uint64_t v15 = [*(id *)(a1 + 32) uuidsForBundleIds:v7];
  uint64_t v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 72)];
  [v12 _logToBiomeWithEventType:8 date:v11 blendingCacheUUID:v14 shownSuggestionIds:v15 engagedSuggestionIds:0 categoryID:0 categoryIndex:0 bundleId:0 bundleIndex:0 searchQueryLength:0 searchTab:0 bundleIdInTopAppsVisible:0 userLaunchedAppBeforeLeaving:v16];

  [*(id *)(a1 + 40) _resetSessionState];
}

- (void)logCloseSearchWithDate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    loggingQueue = self->_loggingQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__ATXAppDirectoryClient_logCloseSearchWithDate___block_invoke;
    v15[3] = &unk_1E5D04FC8;
    void v15[4] = self;
    id v16 = v4;
    dispatch_async(loggingQueue, v15);
  }
  else
  {
    id v7 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXAppDirectoryClient logCloseSearchWithDate:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

uint64_t __48__ATXAppDirectoryClient_logCloseSearchWithDate___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[ATXAppDirectoryClient logCloseSearchWithDate:]_block_invoke";
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s", buf, 0xCu);
  }

  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = @"kATXAppDirectoryLoggingDate";
  uint64_t v8 = v3;
  unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v4 _logToDuet:9 metadata:v5];

  return [*(id *)(a1 + 32) _logToBiomeWithEventType:9 date:*(void *)(a1 + 40) blendingCacheUUID:0 shownSuggestionIds:0 engagedSuggestionIds:0 categoryID:0 categoryIndex:0 bundleId:0 bundleIndex:0 searchQueryLength:0 searchTab:0 bundleIdInTopAppsVisible:0 userLaunchedAppBeforeLeaving:0];
}

- (void)setTopAppsVisible:(id)a3
{
}

- (NSArray)recentAppsVisible
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)didSendFeedbackDuringSession
{
  return self->_didSendFeedbackDuringSession;
}

- (void)setDidSendFeedbackDuringSession:(BOOL)a3
{
  self->_didSendFeedbackDuringSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentAppsVisible, 0);
  objc_storeStrong((id *)&self->_topAppsVisible, 0);
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_uiStream, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_blendingClient, 0);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_knowledgeStream, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __30__ATXAppDirectoryClient__init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "ATXAppDirectoryClient: Connection to App Directory server interrupted", v2, v3, v4, v5, v6);
}

void __30__ATXAppDirectoryClient__init__block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "ATXAppDirectoryClient: Connection to App Directory server invalidated", v2, v3, v4, v5, v6);
}

void __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXAppDirectoryClient: Failed to request update notification from server: %@", v2, v3, v4, v5, v6);
}

void __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_18_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXAppDirectoryClient: Received categorization response with error: %@", v2, v3, v4, v5, v6);
}

- (void)predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps:shouldUseDefaultCategories:reply:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "ATXAppDirectoryClient: Requesting categories for deduplication", v2, v3, v4, v5, v6);
}

void __113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXAppDirectoryClient: Recent apps deduplication failed with error: %@", v2, v3, v4, v5, v6);
}

void __49__ATXAppDirectoryClient_appLaunchDatesWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXAppDirectoryClient: %@", v2, v3, v4, v5, v6);
}

- (void)_hiddenAppsFromCache
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXAppDirectoryResponse: getting hidden apps from cache failed with error: %@", v2, v3, v4, v5, v6);
}

+ (void)hardcodedAppCategoryMappings
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "ATXAppDirectoryOrderingProvider: Unable to find hardcoded mappings for iTunes categories", v2, v3, v4, v5, v6);
}

- (void)_logToBiomeWithEventType:(void *)a1 date:(NSObject *)a2 blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:bundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 jsonDict];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1A790D000, a2, OS_LOG_TYPE_DEBUG, "ATXAppDirectoryClient: logging event to Biome: %@", v4, 0xCu);
}

- (void)_logToDuet:metadata:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "ATXAppDirectoryClient: Failed to retrieve knowledge store, bailing", v2, v3, v4, v5, v6);
}

- (void)_logToDuet:metadata:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "ATXAppDirectoryClient: Failed to retrieve knowledge stream, bailing", v2, v3, v4, v5, v6);
}

void __45__ATXAppDirectoryClient__logToDuet_metadata___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXAppDirectoryClient: log to duet failed, error: %@", v2, v3, v4, v5, v6);
}

- (void)logDidEnterAppDirectoryWithDate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)logCategoryExpansionWithDate:(uint64_t)a3 categoryID:(uint64_t)a4 categoryIndex:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)logCategoryExitWithDate:(uint64_t)a3 categoryID:(uint64_t)a4 categoryIndex:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)logLaunchFromExpandedCategoryWithDate:(uint64_t)a3 categoryID:(uint64_t)a4 categoryIndex:(uint64_t)a5 bundleID:(uint64_t)a6 bundleIndex:(uint64_t)a7 appDirectoryResponse:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)logLaunchFromExpandedCategoryWithDate:categoryID:categoryIndex:bundleID:bundleIndex:appDirectoryResponse:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "ATXAppDirectoryClient: Received nil value for non-nil field in %s. Replacing with \"%@\"", v2, v3, v4, v5, 2u);
}

- (void)logLaunchFromCategoryPreviewWithDate:(uint64_t)a3 categoryID:(uint64_t)a4 categoryIndex:(uint64_t)a5 bundleID:(uint64_t)a6 bundleIndex:(uint64_t)a7 appDirectoryResponse:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)logLaunchFromCategoryPreviewWithDate:categoryID:categoryIndex:bundleID:bundleIndex:appDirectoryResponse:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "ATXAppDirectoryClient: Received nil value for non-nil field in %s. Replacing with \"%@\"", v2, v3, v4, v5, 2u);
}

void __129__ATXAppDirectoryClient_logLaunchFromCategoryPreviewWithDate_categoryID_categoryIndex_bundleID_bundleIndex_appDirectoryResponse___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_3_0();
  uint64_t v3 = v0;
  _os_log_fault_impl(&dword_1A790D000, v1, OS_LOG_TYPE_FAULT, "ATXAppDirectoryClient launch from suggestions category with bundleId: %@ not in shown bundleIds: %@", (uint8_t *)v2, 0x16u);
}

- (void)logLaunchFromSearchWithDate:(uint64_t)a3 bundleID:(uint64_t)a4 bundleIndex:(uint64_t)a5 searchQueryLength:(uint64_t)a6 searchTab:(uint64_t)a7 appDirectoryResponse:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)logLaunchFromSearchWithDate:bundleID:bundleIndex:searchQueryLength:searchTab:appDirectoryResponse:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "ATXAppDirectoryClient: Received nil value for non-nil field in %s. Replacing with \"%@\"", v2, v3, v4, v5, 2u);
}

- (void)logOpenSearchWithDate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)logDidLeaveAppDirectoryWithDate:(uint64_t)a3 appDirectoryResponse:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)logCloseSearchWithDate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end