@interface ATXFaceSuggestionServer
+ (id)sharedInstance;
- (ATXFaceSuggestionServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)descriptorCacheDidUpdateWithDescriptors:(id)a3;
- (void)fetchComplicationSetsForFaceGalleryItem:(id)a3 completion:(id)a4;
- (void)fetchComplicationSuggestionsModelDescriptionWithCompletion:(id)a3;
- (void)fetchFaceGalleryConfigurationWithCompletion:(id)a3;
- (void)fetchFaceSuggestionsForFocusMode:(id)a3 completion:(id)a4;
- (void)fetchInlineComplicationSetForFaceGalleryItem:(id)a3 completion:(id)a4;
- (void)fetchLandscapeComplicationSetsForFaceGalleryItem:(id)a3 completion:(id)a4;
- (void)fetchMetricsDescriptionWithCompletion:(id)a3;
- (void)fetchPosterConfigurationsWithCompletion:(id)a3;
- (void)fetchPosterDescriptorsAndSuggestionDataWithCompletion:(id)a3;
- (void)fetchRankedPosterDescriptors:(id)a3;
- (void)fetchScoredComplicationDescriptionWithCompletion:(id)a3;
- (void)generatorDidUpdateFaceGalleryConfiguration:(id)a3;
- (void)inputDescriptionForComplicationSuggestionSignal:(id)a3 completion:(id)a4;
- (void)logComplicationsSeenInGalleryWithEngagements:(id)a3 completion:(id)a4;
- (void)logFaceGalleryDidAppearWithFaceGalleryConfiguration:(id)a3;
- (void)logFaceGalleryItemsSeenInGalleryWithOutcomes:(id)a3 completion:(id)a4;
- (void)logPosterEdit:(id)a3 completion:(id)a4;
- (void)logPosterEditUIViewedWithCompletion:(id)a3;
- (void)logPosterSwitch:(id)a3 completion:(id)a4;
- (void)posterBoardDidUpdateConfigurations:(id)a3 completion:(id)a4;
- (void)posterBoardDidUpdateDescriptors:(id)a3 completion:(id)a4;
- (void)refreshComplicationsCacheWithCompletion:(id)a3;
- (void)regenerateFaceGalleryConfigurationWithCompletion:(id)a3;
- (void)reloadLockScreenSuggestionsWithActivity:(id)a3 completion:(id)a4;
- (void)reloadLockScreenSuggestionsWithCompletion:(id)a3;
- (void)synchronousDateOfLastGalleryAppearanceWithCompletion:(id)a3;
- (void)widgetDescriptorCacheDidUpdateDescriptors:(id)a3;
@end

@implementation ATXFaceSuggestionServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_41 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_41, &__block_literal_global_223);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_52;
  return v2;
}

void __41__ATXFaceSuggestionServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_52;
  sharedInstance__pasExprOnceResult_52 = v1;
}

- (ATXFaceSuggestionServer)init
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)ATXFaceSuggestionServer;
  v2 = [(ATXFaceSuggestionServer *)&v39 init];
  if (v2)
  {
    uint64_t v3 = +[ATXPosterConfigurationCache sharedInstance];
    configurationCache = v2->_configurationCache;
    v2->_configurationCache = (ATXPosterConfigurationCache *)v3;

    uint64_t v5 = +[ATXPosterDescriptorCache sharedInstance];
    descriptorCache = v2->_descriptorCache;
    v2->_descriptorCache = (ATXPosterDescriptorCache *)v5;

    [(ATXPosterDescriptorCache *)v2->_descriptorCache registerObserver:v2];
    id v7 = objc_alloc(MEMORY[0x1E4F93B98]);
    v8 = dispatch_get_global_queue(17, 0);
    uint64_t v9 = [v7 initWithQueue:v8 leewaySeconds:&__block_literal_global_15_6 operation:10.0];
    modeFaceSuggestionRefreshCoalescingTimer = v2->_modeFaceSuggestionRefreshCoalescingTimer;
    v2->_modeFaceSuggestionRefreshCoalescingTimer = (_PASSimpleCoalescingTimer *)v9;

    uint64_t v11 = objc_opt_new();
    complicationsGenerator = v2->_complicationsGenerator;
    v2->_complicationsGenerator = (ATXComplicationSuggestionGenerator *)v11;

    v13 = objc_opt_new();
    v14 = [ATXFaceSuggestionGenerator alloc];
    v15 = v2->_descriptorCache;
    v16 = v2->_configurationCache;
    v17 = v2->_complicationsGenerator;
    v18 = [MEMORY[0x1E4F4B430] sharedInstance];
    uint64_t v19 = [(ATXFaceSuggestionGenerator *)v14 initWithDescriptorCache:v15 configurationCache:v16 complicationProvider:v17 complicationDescriptorProvider:v18 parameters:v13];
    faceSuggestionGenerator = v2->_faceSuggestionGenerator;
    v2->_faceSuggestionGenerator = (ATXFaceSuggestionGenerator *)v19;

    [(ATXFaceSuggestionGenerator *)v2->_faceSuggestionGenerator setDelegate:v2];
    v21 = [MEMORY[0x1E4F4B430] sharedInstance];
    [v21 registerObserver:v2];

    id v22 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v23 = [v22 initWithMachServiceName:*MEMORY[0x1E4F4B510]];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v23;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    v25 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[ATXFaceSuggestionServer init]";
      _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "%s: listening for connections", buf, 0xCu);
    }

    uint64_t v26 = objc_opt_new();
    uninstallNotification = v2->_uninstallNotification;
    v2->_uninstallNotification = (_ATXInternalUninstallNotification *)v26;

    [(_ATXInternalUninstallNotification *)v2->_uninstallNotification registerForNotificationsWithUninstallBlock:&__block_literal_global_27_1];
    objc_initWeak((id *)buf, v2);
    uint64_t v28 = objc_opt_new();
    lockedOrHiddenAppNotification = v2->_lockedOrHiddenAppNotification;
    v2->_lockedOrHiddenAppNotification = (ATXInternalLockedOrHiddenAppNotification *)v28;

    v30 = v2->_lockedOrHiddenAppNotification;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __31__ATXFaceSuggestionServer_init__block_invoke_2;
    v37[3] = &unk_1E68ACB30;
    objc_copyWeak(&v38, (id *)buf);
    [(ATXInternalLockedOrHiddenAppNotification *)v30 registerForNotificationsWithLockedOrHiddenAppBlock:v37];
    uint64_t v31 = objc_opt_new();
    unlockedOrUnhiddenAppNotification = v2->_unlockedOrUnhiddenAppNotification;
    v2->_unlockedOrUnhiddenAppNotification = (ATXInternalUnLockedOrUnHiddenAppNotification *)v31;

    v33 = v2->_unlockedOrUnhiddenAppNotification;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __31__ATXFaceSuggestionServer_init__block_invoke_3;
    v35[3] = &unk_1E68ACB08;
    objc_copyWeak(&v36, (id *)buf);
    [(ATXInternalUnLockedOrUnHiddenAppNotification *)v33 registerForNotificationsWithUnLockedOrUnHiddenAppBlock:v35];
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

void __31__ATXFaceSuggestionServer_init__block_invoke()
{
  id v3 = (id)os_transaction_create();
  v0 = objc_alloc_init(ATXModeFaceSuggestionGenerator);
  uint64_t v1 = +[ATXPosterDescriptorCache sharedInstance];
  v2 = [v1 allDescriptors];
  [(ATXModeFaceSuggestionGenerator *)v0 generateAndCacheFacesFromDescriptors:v2];
}

void __31__ATXFaceSuggestionServer_init__block_invoke_24()
{
  id v0 = (id)objc_opt_new();
  [v0 evictCachedSuggestedFaces];
}

void __31__ATXFaceSuggestionServer_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = [v6 lockedApps];
    int v5 = [v4 containsObject:@"com.apple.mobileslideshow"];

    if (v5)
    {
      [WeakRetained[4] regenerateFaceGalleryConfigurationImmediatelyWithReason:@"Photos app has been locked"];
      [WeakRetained[4] regenerateFaceSuggestionsForFocusModesWithReason:@"Photos app has been locked"];
    }
  }
}

void __31__ATXFaceSuggestionServer_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = [v6 unLockedApps];
    int v5 = [v4 containsObject:@"com.apple.mobileslideshow"];

    if (v5)
    {
      [WeakRetained[4] regenerateFaceGalleryConfigurationImmediatelyWithReason:@"Photos app has been unlocked"];
      [WeakRetained[4] regenerateFaceSuggestionsForFocusModesWithReason:@"Photos app has been unlocked"];
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "-[ATXFaceSuggestionServer listener:shouldAcceptNewConnection:]";
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s: incoming connection", buf, 0xCu);
  }

  uint64_t v9 = [v7 valueForEntitlement:*MEMORY[0x1E4F4B510]];
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0 && ([v9 BOOLValue] & 1) != 0)
  {
    v10 = ATXFaceSuggestionClientXPCInterface();
    [v7 setExportedInterface:v10];

    [v7 setExportedObject:self];
    objc_initWeak((id *)buf, v7);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke;
    v19[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v20, (id *)buf);
    [v7 setInterruptionHandler:v19];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_44;
    v17 = &unk_1E68AC2D0;
    objc_copyWeak(&v18, (id *)buf);
    [v7 setInvalidationHandler:&v14];
    objc_msgSend(v7, "resume", v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
    BOOL v11 = 1;
  }
  else
  {
    v12 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXFaceSuggestionServer listener:shouldAcceptNewConnection:]();
    }

    BOOL v11 = 0;
  }

  return v11;
}

void __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1();
  }
}

void __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_44_cold_1();
  }
}

- (void)fetchFaceGalleryConfigurationWithCompletion:(id)a3
{
  faceSuggestionGenerator = self->_faceSuggestionGenerator;
  id v5 = a3;
  id v6 = [(ATXFaceSuggestionGenerator *)faceSuggestionGenerator faceGalleryConfiguration];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

- (void)regenerateFaceGalleryConfigurationWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  id v6 = (id)os_transaction_create();
  [(ATXFaceSuggestionGenerator *)self->_faceSuggestionGenerator regenerateFaceGalleryConfigurationImmediatelyWithReason:@"XPC request or activity"];
  id v5 = [(ATXFaceSuggestionGenerator *)self->_faceSuggestionGenerator faceGalleryConfiguration];
  v4[2](v4, v5, 0);
}

- (void)fetchFaceSuggestionsForFocusMode:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = a3;
  v10 = objc_alloc_init(ATXModeFaceSuggestionGenerator);
  v8 = [(ATXPosterDescriptorCache *)self->_descriptorCache allDescriptors];
  uint64_t v9 = [(ATXModeFaceSuggestionGenerator *)v10 facesForMode:v7 allDescriptors:v8];

  v6[2](v6, v9, 0);
}

- (void)fetchPosterDescriptorsAndSuggestionDataWithCompletion:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v21 = (void (**)(id, void *, void))a3;
  v25 = objc_opt_new();
  v4 = [(ATXPosterDescriptorCache *)self->_descriptorCache allDescriptors];
  id v20 = objc_opt_new();
  v24 = [[ATXFaceSuggestionScorer alloc] initWithParameters:v20 descriptors:v4];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v4;
  uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v26)
  {
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v5;
        uint64_t v6 = *(void *)(*((void *)&v33 + 1) + 8 * v5);
        id v7 = objc_opt_new();
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v28 = [(ATXFaceSuggestionScorer *)v24 signals];
        uint64_t v8 = [v28 countByEnumeratingWithState:&v29 objects:v39 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v30;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v30 != v10) {
                objc_enumerationMutation(v28);
              }
              v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
              v13 = (objc_class *)objc_opt_class();
              uint64_t v14 = NSStringFromClass(v13);
              v37[0] = @"weight";
              uint64_t v15 = NSNumber;
              [v12 weight];
              v16 = objc_msgSend(v15, "numberWithDouble:");
              v37[1] = @"value";
              v38[0] = v16;
              v17 = NSNumber;
              [v12 valueForDescriptor:v6];
              id v18 = objc_msgSend(v17, "numberWithDouble:");
              v38[1] = v18;
              uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
              [v7 setObject:v19 forKeyedSubscript:v14];

              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v28 countByEnumeratingWithState:&v29 objects:v39 count:16];
          }
          while (v9);
        }

        [v25 setObject:v7 forKeyedSubscript:v6];
        uint64_t v5 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v26);
  }

  v21[2](v21, v25, 0);
}

- (void)fetchRankedPosterDescriptors:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  id v12 = (id)objc_opt_new();
  uint64_t v5 = [ATXFaceGalleryLayoutGenerator alloc];
  uint64_t v6 = [(ATXPosterDescriptorCache *)self->_descriptorCache descriptors];
  complicationsGenerator = self->_complicationsGenerator;
  uint64_t v8 = [MEMORY[0x1E4F4B430] sharedInstance];
  uint64_t v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v10 = [(ATXFaceGalleryLayoutGenerator *)v5 initWithDescriptors:v6 complicationProvider:complicationsGenerator complicationDescriptorProvider:v8 parameters:v12 dayZero:0 locale:v9];

  uint64_t v11 = [(ATXFaceGalleryLayoutGenerator *)v10 rankedFeaturedDescriptors];
  v4[2](v4, v11, 0);
}

- (void)fetchPosterConfigurationsWithCompletion:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[ATXFaceSuggestionServer fetchPosterConfigurationsWithCompletion:]";
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = [(ATXPosterConfigurationCache *)self->_configurationCache configurations];
  v4[2](v4, v6, 0);
}

- (void)fetchComplicationSetsForFaceGalleryItem:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, void *, void))a4;
  uint64_t v6 = (void *)os_transaction_create();
  int v7 = [MEMORY[0x1E4F4B430] sharedInstance];
  id v24 = 0;
  uint64_t v8 = [v7 fetchAccessoryWidgetDescriptorMetadataWithError:&v24];
  id v9 = v24;

  uint64_t v10 = v8;
  if (!v8)
  {
    uint64_t v11 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXFaceSuggestionServer fetchComplicationSetsForFaceGalleryItem:completion:]((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    }

    uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F4AED0]);
  uint64_t v19 = [v18 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps];

  complicationsGenerator = self->_complicationsGenerator;
  v21 = [v19 allKeys];
  id v22 = +[ATXCompanionBundleIdMapper generateMappingForAppBundleIds:v21];
  uint64_t v23 = [(ATXComplicationSuggestionGenerator *)complicationsGenerator modularSetsWithWidgetDescriptorsAdditionalData:v10 aggregatedAppLaunchData:v19 bundleIdToCompanionBundleId:v22];

  v5[2](v5, v23, 0);
}

- (void)fetchLandscapeComplicationSetsForFaceGalleryItem:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, void *, void))a4;
  uint64_t v6 = (void *)os_transaction_create();
  int v7 = [MEMORY[0x1E4F4B430] sharedInstance];
  id v24 = 0;
  uint64_t v8 = [v7 fetchAccessoryWidgetDescriptorMetadataWithError:&v24];
  id v9 = v24;

  uint64_t v10 = v8;
  if (!v8)
  {
    uint64_t v11 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXFaceSuggestionServer fetchComplicationSetsForFaceGalleryItem:completion:]((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    }

    uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F4AED0]);
  uint64_t v19 = [v18 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps];

  complicationsGenerator = self->_complicationsGenerator;
  v21 = [v19 allKeys];
  id v22 = +[ATXCompanionBundleIdMapper generateMappingForAppBundleIds:v21];
  uint64_t v23 = [(ATXComplicationSuggestionGenerator *)complicationsGenerator landscapeModularSetsWithWidgetDescriptorsAdditionalData:v10 aggregatedAppLaunchData:v19 bundleIdToCompanionBundleId:v22];

  v5[2](v5, v23, 0);
}

- (void)posterBoardDidUpdateConfigurations:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[ATXFaceSuggestionServer posterBoardDidUpdateConfigurations:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  [(ATXPosterConfigurationCache *)self->_configurationCache updateConfigurations:v6 completion:v7];
}

- (void)posterBoardDidUpdateDescriptors:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  uint64_t v8 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[ATXFaceSuggestionServer posterBoardDidUpdateDescriptors:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  [(ATXPosterDescriptorCache *)self->_descriptorCache updateDescriptors:v6];
  v7[2](v7, 1);
}

- (void)inputDescriptionForComplicationSuggestionSignal:(id)a3 completion:(id)a4
{
  complicationsGenerator = self->_complicationsGenerator;
  id v6 = (void (**)(id, id, void))a4;
  id v7 = [(ATXComplicationSuggestionGenerator *)complicationsGenerator inputDescriptionForComplicationSuggestionSignal:a3];
  v6[2](v6, v7, 0);
}

- (void)fetchComplicationSuggestionsModelDescriptionWithCompletion:(id)a3
{
  complicationsGenerator = self->_complicationsGenerator;
  v4 = (void (**)(id, id, void))a3;
  id v5 = [(ATXComplicationSuggestionGenerator *)complicationsGenerator modelDescription];
  v4[2](v4, v5, 0);
}

- (void)fetchInlineComplicationSetForFaceGalleryItem:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void *, void))a4;
  id v7 = (id)os_transaction_create();
  id v6 = [(ATXComplicationSuggestionGenerator *)self->_complicationsGenerator inlineSet];
  v5[2](v5, v6, 0);
}

- (void)refreshComplicationsCacheWithCompletion:(id)a3
{
  complicationsGenerator = self->_complicationsGenerator;
  v4 = (void (**)(id, void))a3;
  [(ATXComplicationSuggestionGenerator *)complicationsGenerator refreshComplicationCache];
  v4[2](v4, 0);
}

- (void)reloadLockScreenSuggestionsWithCompletion:(id)a3
{
}

- (void)reloadLockScreenSuggestionsWithActivity:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F4B428] sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke;
  v10[3] = &unk_1E68B5890;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 refreshWithCompletion:v10];
}

void __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_cold_1();
    }
  }
  if ([*(id *)(a1 + 32) didDefer])
  {
    id v8 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[ATXFaceSuggestionServer reloadLockScreenSuggestionsWithActivity:completion:]_block_invoke";
      id v9 = "%s: deferred after fetching watch faces";
LABEL_11:
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  uint64_t v10 = objc_opt_new();
  [v10 refreshComplicationCache];

  if ([*(id *)(a1 + 32) didDefer])
  {
    id v8 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[ATXFaceSuggestionServer reloadLockScreenSuggestionsWithActivity:completion:]_block_invoke";
      id v9 = "%s: deferred after refreshing complication cache";
      goto LABEL_11;
    }
LABEL_12:

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  id v11 = objc_alloc_init(ATXModeFaceSuggestionGenerator);
  id v12 = +[ATXPosterDescriptorCache sharedInstance];
  uint64_t v13 = [v12 allDescriptors];
  [(ATXModeFaceSuggestionGenerator *)v11 generateAndCacheFacesFromDescriptors:v13];

  if ([*(id *)(a1 + 32) didDefer])
  {
    uint64_t v14 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[ATXFaceSuggestionServer reloadLockScreenSuggestionsWithActivity:completion:]_block_invoke";
      _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "%s: deferred after refreshing mode face suggestions", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v15 = +[ATXFaceSuggestionServer sharedInstance];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_67;
    v16[3] = &unk_1E68B5868;
    id v17 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    [v15 regenerateFaceGalleryConfigurationWithCompletion:v16];
  }
LABEL_19:
}

void __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = __atxlog_handle_lock_screen();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_67_cold_2();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    id v20 = "-[ATXFaceSuggestionServer reloadLockScreenSuggestionsWithActivity:completion:]_block_invoke";
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s: successfully regenerated face gallery configuration", (uint8_t *)&v19, 0xCu);
  }

  int v9 = [*(id *)(a1 + 32) setDone];
  uint64_t v10 = __atxlog_handle_lock_screen();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      id v20 = "-[ATXFaceSuggestionServer reloadLockScreenSuggestionsWithActivity:completion:]_block_invoke";
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "%s: activity set to DONE", (uint8_t *)&v19, 0xCu);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_67_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchScoredComplicationDescriptionWithCompletion:(id)a3
{
  complicationsGenerator = self->_complicationsGenerator;
  id v5 = a3;
  id v6 = [(ATXComplicationSuggestionGenerator *)complicationsGenerator scoredComplicationsDescription];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

- (void)fetchMetricsDescriptionWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_opt_new();
  id v5 = [v6 dailyMetricsDescription];
  (*((void (**)(id, void *, void))a3 + 2))(v4, v5, 0);
}

- (void)logPosterEdit:(id)a3 completion:(id)a4
{
  id v7 = (void (**)(id, void))a4;
  id v5 = a3;
  id v6 = objc_opt_new();
  [v6 postEditMetricWithEvent:v5];

  v7[2](v7, 0);
}

- (void)logPosterEditUIViewedWithCompletion:(id)a3
{
}

- (void)logPosterSwitch:(id)a3 completion:(id)a4
{
  id v7 = (void (**)(id, void))a4;
  id v5 = a3;
  id v6 = objc_opt_new();
  [v6 postSwitchMetricWithEvent:v5];

  v7[2](v7, 0);
}

- (void)logFaceGalleryDidAppearWithFaceGalleryConfiguration:(id)a3
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  uint64_t v5 = *MEMORY[0x1E4F4B740];
  id v6 = v4;
  if (([v4 BOOLForKey:*MEMORY[0x1E4F4B740]] & 1) == 0) {
    [v6 setBool:1 forKey:v5];
  }
}

- (void)logComplicationsSeenInGalleryWithEngagements:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v19 = (void (**)(id, void))a4;
  id v6 = objc_opt_new();
  id v7 = [v6 UUIDString];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v14 = [v8 objectForKeyedSubscript:v13];
        uint64_t v15 = [v14 integerValue];

        if (v15 >= 5) {
          uint64_t v15 = 5;
        }
        uint64_t v16 = objc_opt_new();
        uint64_t v17 = [v13 extensionBundleIdentifier];
        [v16 setExtensionBundleId:v17];

        objc_msgSend(v16, "setFamily:", objc_msgSend(v13, "widgetFamily"));
        uint64_t v18 = [v13 kind];
        [v16 setKind:v18];

        objc_msgSend(v16, "setReason:", (int)objc_msgSend(v13, "source"));
        [v16 setOutcome:0];
        [v16 setNumEngaged:v15];
        [v16 setSessionId:v7];
        [v16 logToCoreAnalytics];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  v19[2](v19, 0);
}

- (void)logFaceGalleryItemsSeenInGalleryWithOutcomes:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v20 = (void (**)(id, void))a4;
  id v6 = objc_opt_new();
  id v7 = [v6 UUIDString];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        uint64_t v14 = [v8 objectForKeyedSubscript:v13];
        uint64_t v15 = objc_opt_new();
        uint64_t v16 = [v13 extensionBundleIdentifier];
        [v15 setExtensionBundleId:v16];

        objc_msgSend(v15, "setSection:", objc_msgSend(v13, "source"));
        [v15 setSessionId:v7];
        int v17 = [v14 isEqualToString:@"viewed"];
        if (v17 & 1) != 0 || ([v14 isEqualToString:@"tapped"])
        {
          uint64_t v18 = 0;
LABEL_9:
          [v15 setOutcome:v18];
          [v15 setEngaged:v17 ^ 1u];
          goto LABEL_10;
        }
        if ([v14 isEqualToString:@"added"])
        {
          uint64_t v18 = 1;
          goto LABEL_9;
        }
LABEL_10:
        [v15 logToCoreAnalytics];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v19 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v10 = v19;
    }
    while (v19);
  }

  v20[2](v20, 0);
}

- (void)synchronousDateOfLastGalleryAppearanceWithCompletion:(id)a3
{
  id v3 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__99;
  v13[4] = __Block_byref_object_dispose__99;
  id v14 = 0;
  id v4 = objc_opt_new();
  id v5 = [v4 publisherFromStartTime:0.0];
  id v6 = [v5 last];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__ATXFaceSuggestionServer_synchronousDateOfLastGalleryAppearanceWithCompletion___block_invoke;
  v10[3] = &unk_1E68B58B8;
  id v7 = v3;
  id v11 = v7;
  uint64_t v12 = v13;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__ATXFaceSuggestionServer_synchronousDateOfLastGalleryAppearanceWithCompletion___block_invoke_86;
  v9[3] = &unk_1E68AC690;
  v9[4] = v13;
  id v8 = (id)[v6 sinkWithCompletion:v10 receiveInput:v9];

  _Block_object_dispose(v13, 8);
}

void __80__ATXFaceSuggestionServer_synchronousDateOfLastGalleryAppearanceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 state] == 1)
  {
    id v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 error];
      int v9 = 136315394;
      uint64_t v10 = "-[ATXFaceSuggestionServer synchronousDateOfLastGalleryAppearanceWithCompletion:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%s: failed to fetch Biome events with error %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v8 = [v3 error];
  (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);
}

uint64_t __80__ATXFaceSuggestionServer_synchronousDateOfLastGalleryAppearanceWithCompletion___block_invoke_86(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v5 = [v3 alloc];
  [v4 timestamp];
  double v7 = v6;

  uint64_t v8 = [v5 initWithTimeIntervalSinceReferenceDate:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void *)(v9 + 40);
  *(void *)(v9 + 40) = v8;
  return MEMORY[0x1F41817F8](v8, v10);
}

- (void)generatorDidUpdateFaceGalleryConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v4 = (void *)getPRSServiceClass_softClass_0;
  uint64_t v14 = getPRSServiceClass_softClass_0;
  if (!getPRSServiceClass_softClass_0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getPRSServiceClass_block_invoke_0;
    v10[3] = &unk_1E68AB438;
    void v10[4] = &v11;
    __getPRSServiceClass_block_invoke_0((uint64_t)v10);
    id v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  double v6 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__ATXFaceSuggestionServer_generatorDidUpdateFaceGalleryConfiguration___block_invoke;
  v8[3] = &unk_1E68B36D8;
  id v9 = v6;
  id v7 = v6;
  [v7 pushPosterGalleryUpdate:v3 completion:v8];
}

void __70__ATXFaceSuggestionServer_generatorDidUpdateFaceGalleryConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__ATXFaceSuggestionServer_generatorDidUpdateFaceGalleryConfiguration___block_invoke_cold_1(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 136315394;
    uint64_t v8 = "-[ATXFaceSuggestionServer generatorDidUpdateFaceGalleryConfiguration:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%s: service: %@, successfully pushed face gallery configuration to PosterBoard", (uint8_t *)&v7, 0x16u);
  }
}

- (void)widgetDescriptorCacheDidUpdateDescriptors:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[ATXFaceSuggestionServer widgetDescriptorCacheDidUpdateDescriptors:]";
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%s: refreshing complication cache", (uint8_t *)&v5, 0xCu);
  }

  [(ATXComplicationSuggestionGenerator *)self->_complicationsGenerator refreshComplicationCache];
}

- (void)descriptorCacheDidUpdateWithDescriptors:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[ATXFaceSuggestionServer descriptorCacheDidUpdateWithDescriptors:]";
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%s: scheduling mode face suggestions cache refresh due to descriptor update", (uint8_t *)&v5, 0xCu);
  }

  [(_PASSimpleCoalescingTimer *)self->_modeFaceSuggestionRefreshCoalescingTimer runAfterDelaySeconds:1 coalescingBehavior:30.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_modeFaceSuggestionRefreshCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_unlockedOrUnhiddenAppNotification, 0);
  objc_storeStrong((id *)&self->_lockedOrHiddenAppNotification, 0);
  objc_storeStrong((id *)&self->_uninstallNotification, 0);
  objc_storeStrong((id *)&self->_faceSuggestionGenerator, 0);
  objc_storeStrong((id *)&self->_complicationsGenerator, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
  objc_storeStrong((id *)&self->_configurationCache, 0);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_10(&dword_1D0FA3000, v0, v1, "%s: rejecting connection %@ without entitlement %@", v2);
}

void __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "%s: connection interrupted: %@", v2, v3, v4, v5, 2u);
}

void __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_44_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "%s: connection invalidated: %@", v2, v3, v4, v5, 2u);
}

- (void)fetchComplicationSetsForFaceGalleryItem:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "%s: Error refreshing watch face configurations: %@", v2, v3, v4, v5, 2u);
}

void __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_67_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_67_cold_2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "%s: error regenerating face gallery configuration: %@", v2, v3, v4, v5, 2u);
}

void __70__ATXFaceSuggestionServer_generatorDidUpdateFaceGalleryConfiguration___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = "-[ATXFaceSuggestionServer generatorDidUpdateFaceGalleryConfiguration:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a1 + 32);
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_2_10(&dword_1D0FA3000, a2, a3, "%s: service: %@, error pushing face gallery configuration to PosterBoard: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

@end