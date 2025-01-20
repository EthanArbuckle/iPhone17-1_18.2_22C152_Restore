@interface ATXHomeScreenSuggestionClient
+ (id)sharedInstance;
- (ATXHomeScreenSuggestionClient)initWithHomeScreenConfigCache:(id)a3 engagementRecordManager:(id)a4 widgetDwellTracker:(id)a5 widgetDismissManager:(id)a6 uiCacheManager:(id)a7 actionPredictionClient:(id)a8 chronoServicesProvider:(id)a9 store:(id)a10 logger:(id)a11;
- (BOOL)_isFallbackSuggestionUsed:(id)a3 guardedData:(id)a4;
- (BOOL)_isSystemInitiatedLayoutUpdateAllowed:(id)a3;
- (BOOL)_isWidgetEngaged:(id)a3 kind:(id)a4 afterMostRecentProactiveRotationToSuggestionWithIdentifier:(id)a5 guardedData:(id)a6;
- (BOOL)_replaceSuggestionIfNeeded:(id)a3 fromProactiveWidget:(id)a4 guardedData:(id)a5;
- (BOOL)hasWidgetBeenSeen:(id)a3;
- (BOOL)hasWidgetBeenTapped:(id)a3;
- (BOOL)isSuggestionReplacementAvailableForSuggestion:(id)a3 inLayout:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)xpcConnection;
- (double)layoutUpdateSuppressionInterval;
- (double)rotationSuppressionInterval;
- (double)timerLeeway;
- (id)_computePreviousSuggestedSuggestionWidgetLayoutsWithGuardedData:(id)a3 cachedSuggestions:(id)a4;
- (id)_knownProactiveWidgetUniqueIdentifiersInPages:(id)a3;
- (id)_loadKnownHomeScreenProactiveWidgetUniqueIds;
- (id)_loadKnownTodayPageProactiveWidgetUniqueIds;
- (id)_newSuggestionLayoutForOldLayout:(id)a3 replacedSuggestionId:(id)a4 shouldSuggestionsBeDisjoint:(BOOL)a5 usedFallbackIndexSet:(id)a6 guardedData:(id)a7;
- (id)_replaceSuggestionWithId:(id)a3 fromSuggestionsArray:(id)a4 suggestionLayoutType:(int64_t)a5 usedFallbackIndexSet:(id)a6 shouldSuggestionsBeDisjoint:(BOOL)a7 guardedData:(id)a8;
- (id)homeScreenPrediction;
- (id)loadHomeScreenPageConfigurationsWithError:(id *)a3;
- (id)unusedFallbackAppSuggestionsForPage:(int64_t)a3;
- (int64_t)_layoutTypeOfSuggestion:(id)a3 inLayout:(id)a4;
- (unint64_t)pageIndexOfAppPredictionPanelWithIdentifier:(id)a3;
- (void)_alertUserIfNeededOfStackChange:(id)a3 widgetOnTop:(id)a4 reason:(unint64_t)a5;
- (void)_cancelAndReleaseLayoutUpdateSuppressionTimer:(id)a3;
- (void)_cleanupGuardedData:(id)a3;
- (void)_clearRotationSuppressionTimerWithGuardedData:(id)a3;
- (void)_dismissSuggestions:(id)a3 guardedData:(id)a4 fromSuggestionsWidget:(id)a5 dismissFromAllUIs:(BOOL)a6 duration:(double)a7;
- (void)_handleStackSuggestionDidUpdate:(id)a3;
- (void)_layoutUpdateSuppressionTimerFired;
- (void)_loadKnownHomeScreenProactiveWidgetUniqueIds;
- (void)_loadKnownTodayPageProactiveWidgetUniqueIds;
- (void)_notifyObserversAboutLayoutUpdateWithGuardedData:(id)a3;
- (void)_notifyObserversAboutSuggestionRefreshWithGuardedData:(id)a3;
- (void)_readCachedSuggestionsFromDiskAndUpdateGuardedData:(id)a3;
- (void)_recordSuggestedWidgetIfNecessaryInStacks:(id)a3 guardedData:(id)a4;
- (void)_refreshInferredEngagementStatusForWidgetSuggestions:(id)a3;
- (void)_replaceSuggestionForAllProactiveWidgets:(id)a3 guardedData:(id)a4;
- (void)_replaceSuggestionWithId:(id)a3 shouldSuggestionsBeDisjoint:(BOOL)a4 guardedData:(id)a5;
- (void)_rotationSuppressionTimerFired;
- (void)_startSuppressingRotationForTimeInterval:(double)a3 leeway:(double)a4 guardedData:(id)a5;
- (void)_startSuppressingSystemInitiatedLayoutUpdateForTimeInterval:(double)a3 leeway:(double)a4 guardedData:(id)a5;
- (void)_toggleSiriSearchSettingsOffForAppSuggestion:(id)a3;
- (void)_updateGuardedData:(id)a3 withCachedSuggestions:(id)a4 updateProactiveWidgetLayoutsOnly:(BOOL)a5;
- (void)_updateKnownWidgetUniqueIdsIfNecessaryWithGuardedData:(id)a3;
- (void)_updateLoggerStacksToStackSuggestionsFromHomeScreenCachedSuggestions:(id)a3;
- (void)_writeDockAppList:(id)a3 guardedData:(id)a4 completionHandler:(id)a5;
- (void)_writeHomeScreenPageConfigurations:(id)a3 guardedData:(id)a4 completionHandler:(id)a5;
- (void)_writeTodayPageStacks:(id)a3 appPredictionPanels:(id)a4 guardedData:(id)a5 completionHandler:(id)a6;
- (void)blendingLayerDidUpdateHomeScreenCachedSuggestions:(id)a3 completion:(id)a4;
- (void)chronoServiceProvider:(id)a3 finishedPrewarmingSuggestions:(id)a4;
- (void)chronoServiceProvider:(id)a3 reloadDidCompleteForWidget:(id)a4 success:(BOOL)a5 widgetIsReadyForDisplay:(BOOL)a6 error:(id)a7;
- (void)dealloc;
- (void)didFinishExecutingTappedSuggestion:(id)a3 fromWidget:(id)a4;
- (void)forceDebugRotationForStack:(id)a3 extensionBundleId:(id)a4 kind:(id)a5 completion:(id)a6;
- (void)getCurrentSuggestionsWidgetAndAppPredictionPanelLayoutsWithCompletionHandler:(id)a3;
- (void)homeScreenPredictionWithReply:(id)a3;
- (void)layoutForAppPredictionPanel:(id)a3 completionHandler:(id)a4;
- (void)layoutForSuggestionsWidget:(id)a3 completionHandler:(id)a4;
- (void)loadHomeScreenPageConfigurationsWithCompletionHandler:(id)a3;
- (void)logContextMenuDismissOnceForSuggestion:(id)a3 widget:(id)a4 blendingCacheId:(id)a5;
- (void)logContextMenuNeverShowAgainForSuggestion:(id)a3 widget:(id)a4 blendingCacheId:(id)a5;
- (void)logDeviceLock;
- (void)logDeviceUnlock;
- (void)logDidTapSuggestion:(id)a3 widget:(id)a4 blendingCacheId:(id)a5;
- (void)logHomeScreenDidDisappearWithReason:(id)a3;
- (void)logHomeScreenPageDidAppear:(unint64_t)a3 topWidgetsByStackIdentifier:(id)a4 prediction:(id)a5;
- (void)logSpecialPageDidAppear:(unint64_t)a3 widgetsByStackId:(id)a4 prediction:(id)a5;
- (void)logSpecialPageDidDisappear:(unint64_t)a3;
- (void)logStackDidAppear:(id)a3 topWidget:(id)a4 prediction:(id)a5;
- (void)logStackDidDisappear:(id)a3 topWidget:(id)a4 prediction:(id)a5;
- (void)logStackDidTap:(id)a3 engagedUrl:(id)a4 widgetOnTop:(id)a5 prediction:(id)a6;
- (void)logStackDidTap:(id)a3 widgetOnTop:(id)a4 prediction:(id)a5;
- (void)logStackStatusDidChange:(id)a3 widgetOnTop:(id)a4 reason:(unint64_t)a5 prediction:(id)a6;
- (void)logStackVisibilityChanged:(id)a3 visibleRect:(CGRect)a4 topWidget:(id)a5 prediction:(id)a6;
- (void)logSuggestionsDidAppear:(id)a3 widget:(id)a4 blendingCacheId:(id)a5;
- (void)logSuggestionsDidDisappear:(id)a3 widget:(id)a4 blendingCacheId:(id)a5;
- (void)logSupplementaryActionInContextMenu:(unint64_t)a3 stackId:(id)a4 widgetOnTop:(id)a5 prediction:(id)a6;
- (void)logUserDidAcceptWidgetOnboardingSuggestion:(id)a3;
- (void)logUserDidAddApp:(id)a3 page:(id)a4;
- (void)logUserDidAddPinnedWidget:(id)a3 page:(id)a4 defaultsComparator:(id)a5;
- (void)logUserDidAddWidgetToStack:(id)a3 stackIdentifier:(id)a4 isSuggestion:(BOOL)a5;
- (void)logUserDidChangeStackConfiguration:(id)a3;
- (void)logUserDidCreateStack:(id)a3 page:(id)a4 isSuggestion:(BOOL)a5;
- (void)logUserDidDeletePinnedWidget:(id)a3 stackLocation:(unint64_t)a4 page:(id)a5;
- (void)logUserDidDeleteStack:(id)a3 stackKind:(unint64_t)a4 stackLocation:(unint64_t)a5 page:(id)a6;
- (void)logUserDidDeleteWidgetOnStack:(id)a3 stackIdentifier:(id)a4 stackKind:(unint64_t)a5 stackLocation:(unint64_t)a6;
- (void)logUserDidEnterEditModeForWidgetOnboarding;
- (void)logUserDidRejectWidgetOnboardingSuggestion:(id)a3;
- (void)logUserDidRemoveApp:(id)a3 page:(id)a4;
- (void)logUserDidStartWidgetOnboarding;
- (void)logUserDidSwitchHomeScreenExperience:(unint64_t)a3;
- (void)logWidgetAddedFeaturesInCoreAnalytics:(id)a3 rankOfWidgetInGallery:(unint64_t)a4 galleryItems:(id)a5;
- (void)logWidgetDidAppear:(id)a3 blendingCacheId:(id)a4;
- (void)logWidgetDidAppear:(id)a3 stackId:(id)a4 prediction:(id)a5;
- (void)logWidgetDidDisappear:(id)a3 blendingCacheId:(id)a4;
- (void)logWidgetDidDisappear:(id)a3 stackId:(id)a4 prediction:(id)a5;
- (void)logWidgetInsertionDidFailInStack:(id)a3 prediction:(id)a4;
- (void)logWidgetOccluded:(id)a3 blendingCacheId:(id)a4;
- (void)logWidgetUnoccluded:(id)a3 blendingCacheId:(id)a4;
- (void)markFallbackAppSuggestion:(id)a3 asUnusedForPage:(int64_t)a4;
- (void)markFallbackAppSuggestion:(id)a3 asUsedForPage:(int64_t)a4;
- (void)registerObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setIsUserInteractingWithProactiveWidget:(BOOL)a3;
- (void)setLayoutUpdateSuppressionInterval:(double)a3;
- (void)setRotationSuppressionInterval:(double)a3;
- (void)setTimerLeeway:(double)a3;
- (void)setXpcConnection:(id)a3;
- (void)significantDwellDetectedForWidget:(id)a3 date:(id)a4;
- (void)startSuppressingRotationForTimeInterval:(double)a3 leeway:(double)a4;
- (void)synchronouslyRelinquishOnDiskResourcesAheadOfDataDeletionWithCompletionHandler:(id)a3;
- (void)userDidRemoveSuggestedWidget:(id)a3 fromStackWithIdentifier:(id)a4 prediction:(id)a5;
- (void)writeDockAppList:(id)a3 completionHandler:(id)a4;
- (void)writeHomeScreenPageConfigurations:(id)a3 completionHandler:(id)a4;
- (void)writeTodayPageStacks:(id)a3 appPredictionPanels:(id)a4 completionHandler:(id)a5;
@end

@implementation ATXHomeScreenSuggestionClient

uint64_t __99__ATXHomeScreenSuggestionClient_logHomeScreenPageDidAppear_topWidgetsByStackIdentifier_prediction___block_invoke(void *a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logHomeScreenPageDidAppear:a1[6] topWidgetsByStackIdentifier:a1[4] prediction:a1[5]];
}

- (void)logHomeScreenPageDidAppear:(unint64_t)a3 topWidgetsByStackIdentifier:(id)a4 prediction:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__ATXHomeScreenSuggestionClient_logHomeScreenPageDidAppear_topWidgetsByStackIdentifier_prediction___block_invoke;
  v13[3] = &unk_1E5D07C00;
  id v15 = v9;
  unint64_t v16 = a3;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v13];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ATXHomeScreenSuggestionClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_6 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_6, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_7;

  return v2;
}

void __47__ATXHomeScreenSuggestionClient_sharedInstance__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1AD0D3C30]();
  id v3 = objc_alloc(*(Class *)(a1 + 32));
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  id v8 = objc_opt_new();
  id v9 = objc_opt_new();
  uint64_t v10 = [v3 initWithHomeScreenConfigCache:v4 engagementRecordManager:v5 widgetDwellTracker:v6 widgetDismissManager:0 uiCacheManager:v7 actionPredictionClient:v8 chronoServicesProvider:v9 store:0 logger:0];
  id v11 = (void *)sharedInstance__pasExprOnceResult_7;
  sharedInstance__pasExprOnceResult_7 = v10;
}

- (ATXHomeScreenSuggestionClient)initWithHomeScreenConfigCache:(id)a3 engagementRecordManager:(id)a4 widgetDwellTracker:(id)a5 widgetDismissManager:(id)a6 uiCacheManager:(id)a7 actionPredictionClient:(id)a8 chronoServicesProvider:(id)a9 store:(id)a10 logger:(id)a11
{
  id v17 = a3;
  id v55 = a4;
  id v54 = a5;
  id v53 = a6;
  id v52 = a7;
  id v47 = a8;
  id v51 = a8;
  id v50 = a9;
  id v49 = a10;
  id v48 = a11;
  v61.receiver = self;
  v61.super_class = (Class)ATXHomeScreenSuggestionClient;
  v18 = [(ATXHomeScreenSuggestionClient *)&v61 init];
  if (v18)
  {
    id v45 = v17;
    uint64_t v19 = objc_opt_new();
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
    v21 = *(void **)(v19 + 8);
    *(void *)(v19 + 8) = v20;

    uint64_t v22 = objc_opt_new();
    v23 = *(void **)(v19 + 80);
    *(void *)(v19 + 80) = v22;

    objc_storeStrong((id *)(v19 + 184), a10);
    objc_storeStrong((id *)(v19 + 200), a6);
    objc_storeStrong((id *)(v19 + 192), a11);
    uint64_t v24 = objc_opt_new();
    v25 = *(void **)(v19 + 128);
    *(void *)(v19 + 128) = v24;

    id v26 = objc_alloc(MEMORY[0x1E4F93B80]);
    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v28 = dispatch_queue_create("com.apple.proactive.ATXHomeScreenSuggestionClient.lock", v27);
    uint64_t v29 = [v26 initWithGuardedData:v19 serialQueue:v28];
    v30 = (void *)*((void *)v18 + 3);
    *((void *)v18 + 3) = v29;

    v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v32 = dispatch_queue_create("com.apple.proactive.ATXHomeScreenSuggestionClient.output", v31);
    v33 = (void *)*((void *)v18 + 1);
    *((void *)v18 + 1) = v32;

    id v34 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v35 = [v34 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    v36 = (void *)*((void *)v18 + 11);
    *((void *)v18 + 11) = v35;

    objc_storeStrong((id *)v18 + 5, a7);
    objc_storeStrong((id *)v18 + 6, a3);
    objc_storeStrong((id *)v18 + 7, a4);
    objc_storeStrong((id *)v18 + 8, a5);
    [*((id *)v18 + 8) setDelegate:v18];
    *(_OWORD *)(v18 + 104) = xmmword_1A7A9D8D0;
    *((void *)v18 + 15) = 0x4014000000000000;
    objc_storeStrong((id *)v18 + 9, v47);
    objc_storeStrong((id *)v18 + 10, a9);
    [*((id *)v18 + 10) setDelegate:v18];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke;
    v59[3] = &unk_1E5D07800;
    v37 = v18;
    v60 = v37;
    v38 = (void *)MEMORY[0x1AD0D3E40](v59);
    notify_register_dispatch((const char *)[@"com.apple.duetexpertd.homeScreenPageConfigCacheUpdate" UTF8String], v37 + 8, *((dispatch_queue_t *)v18 + 1), v38);
    notify_register_dispatch((const char *)[@"com.apple.duetexpertd.todayPageConfigCacheUpdate" UTF8String], v37 + 9, *((dispatch_queue_t *)v18 + 1), v38);
    v39 = (void *)MEMORY[0x1E4F93B10];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_3;
    v57[3] = &unk_1E5D05300;
    v40 = v37;
    v58 = v40;
    [v39 runBlockWhenDeviceIsClassCUnlockedWithQoS:25 block:v57];
    uint64_t v41 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.HomeScreenSuggestion.xpc"];
    id v42 = v40[2];
    v40[2] = (id)v41;

    [v40[2] setDelegate:v40];
    [v40[2] resume];
    v43 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v43, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: XPC listener resumed", buf, 2u);
    }

    id v17 = v45;
  }

  return (ATXHomeScreenSuggestionClient *)v18;
}

uint64_t __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) runAsyncWithLockAcquired:&__block_literal_global_42];
}

uint64_t __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 80) removeAllObjects];
}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_3(uint64_t a1)
{
  v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: Received class C unlock event from ProactiveSupport", buf, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  v4 = (void *)v3[3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_83;
  v5[3] = &unk_1E5D07828;
  v6 = v3;
  [v4 runAsyncWithLockAcquired:v5];
}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_83(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = v3[19];
  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_2_84;
    v33[3] = &unk_1E5D06F40;
    id v34 = v3;
    [v6 _writeHomeScreenPageConfigurations:v5 guardedData:v34 completionHandler:v33];
  }
  uint64_t v7 = v4[20];
  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_86;
    v31[3] = &unk_1E5D06F40;
    dispatch_queue_t v32 = v4;
    [v8 _writeDockAppList:v7 guardedData:v32 completionHandler:v31];
  }
  uint64_t v9 = v4[21];
  if (v9)
  {
    uint64_t v10 = v4[22];
    if (v10)
    {
      id v11 = *(void **)(a1 + 32);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_87;
      v29[3] = &unk_1E5D06F40;
      v30 = v4;
      [v11 _writeTodayPageStacks:v9 appPredictionPanels:v10 guardedData:v30 completionHandler:v29];
    }
  }
  id v12 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v28 = 0;
    _os_log_impl(&dword_1A790D000, v12, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: Device is Class C unlocked. Populating in-memory prediction cache with on-disk prediction cache.", (uint8_t *)&v28, 2u);
  }

  if (!v4[23])
  {
    uint64_t v13 = objc_opt_new();
    id v14 = (void *)v4[23];
    v4[23] = v13;

    if (!v4[23])
    {
      id v15 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_83_cold_1(v15);
      }
    }
  }
  if (!v4[25] && v4[23])
  {
    unint64_t v16 = [[ATXWidgetSuggestionDismissManager alloc] initWithStore:v4[23]];
    id v17 = (void *)v4[25];
    v4[25] = v16;
  }
  if (!v4[24])
  {
    v18 = [ATXHomeScreenEventLogger alloc];
    uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 48);
    uint64_t v20 = objc_opt_new();
    v21 = objc_opt_new();
    uint64_t v22 = [(ATXHomeScreenEventLogger *)v18 initWithHomeScreenConfigCache:v19 biomeUIStream:v20 PETEventTracker:v21 defaults:*(void *)(*(void *)(a1 + 32) + 88)];
    v23 = (void *)v4[24];
    v4[24] = v22;

    [(id)v4[24] setDelegate:*(void *)(a1 + 32)];
  }
  uint64_t v24 = [*(id *)(a1 + 32) _loadKnownHomeScreenProactiveWidgetUniqueIds];
  v25 = (void *)v4[5];
  v4[5] = v24;

  uint64_t v26 = [*(id *)(a1 + 32) _loadKnownTodayPageProactiveWidgetUniqueIds];
  v27 = (void *)v4[7];
  v4[7] = v26;

  [*(id *)(a1 + 32) _readCachedSuggestionsFromDiskAndUpdateGuardedData:v4];
  +[ATXDemoStackAndWidgetProvider startYourEngines];
}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_2_84(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_home_screen();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_2_84_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: successfully wrote staged home screen page configurations post-class C unlock", v8, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = 0;
}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_86(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_home_screen();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_86_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: successfully wrote staged dock app list post-class C unlock", v8, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 160);
  *(void *)(v6 + 160) = 0;
}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_87(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_home_screen();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_87_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: successfully wrote staged today page stacks and panels post-class C unlock", v10, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 176);
  *(void *)(v8 + 176) = 0;
}

- (void)dealloc
{
  int v3 = self->_notifyObservers[0];
  if (v3) {
    notify_cancel(v3);
  }
  int v4 = self->_notifyObservers[1];
  if (v4) {
    notify_cancel(v4);
  }
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self];
  v5.receiver = self;
  v5.super_class = (Class)ATXHomeScreenSuggestionClient;
  [(ATXHomeScreenSuggestionClient *)&v5 dealloc];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ATXHomeScreenSuggestionClient_registerObserver___block_invoke;
  v7[3] = &unk_1E5D07828;
  id v8 = v4;
  id v6 = v4;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v7];
}

uint64_t __50__ATXHomeScreenSuggestionClient_registerObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) addObject:*(void *)(a1 + 32)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ATXHomeScreenSuggestionClient_removeObserver___block_invoke;
  v7[3] = &unk_1E5D07850;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v7];
}

void __48__ATXHomeScreenSuggestionClient_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  int v3 = a2;
  [v3[1] removeObject:*(void *)(a1 + 32)];
  if (![v3[1] count]) {
    [*(id *)(a1 + 40) _cleanupGuardedData:v3];
  }
}

- (void)startSuppressingRotationForTimeInterval:(double)a3 leeway:(double)a4
{
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__ATXHomeScreenSuggestionClient_startSuppressingRotationForTimeInterval_leeway___block_invoke;
  v5[3] = &unk_1E5D07878;
  void v5[4] = self;
  *(double *)&v5[5] = a3;
  *(double *)&v5[6] = a4;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v5];
}

uint64_t __80__ATXHomeScreenSuggestionClient_startSuppressingRotationForTimeInterval_leeway___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _startSuppressingRotationForTimeInterval:a2 leeway:*(double *)(a1 + 40) guardedData:*(double *)(a1 + 48)];
}

- (void)_startSuppressingRotationForTimeInterval:(double)a3 leeway:(double)a4 guardedData:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = (dispatch_object_t *)a5;
  if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F4B710];
    keyExistsAndHasValidFormat[0] = 0;
    if (CFPreferencesGetAppBooleanValue(v9, (CFStringRef)*MEMORY[0x1E4F4B688], keyExistsAndHasValidFormat))
    {
      a4 = 0.01;
      a3 = 1.0;
    }
  }
  uint64_t v10 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)keyExistsAndHasValidFormat = 134218240;
    double v18 = a3;
    __int16 v19 = 2048;
    double v20 = a4;
    _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: start suppressing rotation for %f seconds with %f leeway seconds", keyExistsAndHasValidFormat, 0x16u);
  }

  id v11 = v8[2];
  if (!v11)
  {
    dispatch_source_t v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_outputQueue);
    dispatch_object_t v13 = v8[2];
    v8[2] = v12;

    objc_initWeak((id *)keyExistsAndHasValidFormat, self);
    id v14 = v8[2];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __93__ATXHomeScreenSuggestionClient__startSuppressingRotationForTimeInterval_leeway_guardedData___block_invoke;
    handler[3] = &unk_1E5D05748;
    objc_copyWeak(&v16, (id *)keyExistsAndHasValidFormat);
    dispatch_source_set_event_handler(v14, handler);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)keyExistsAndHasValidFormat);
    id v11 = v8[2];
  }
  dispatch_source_set_timer(v11, [MEMORY[0x1E4F93B18] dispatchTimeWithSecondsFromNow:a3], 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a4 * 1000000000.0));
  dispatch_activate(v8[2]);
}

void __93__ATXHomeScreenSuggestionClient__startSuppressingRotationForTimeInterval_leeway_guardedData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _rotationSuppressionTimerFired];
}

- (void)_rotationSuppressionTimerFired
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__ATXHomeScreenSuggestionClient__rotationSuppressionTimerFired__block_invoke;
  v3[3] = &unk_1E5D07828;
  v3[4] = self;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v3];
}

void __63__ATXHomeScreenSuggestionClient__rotationSuppressionTimerFired__block_invoke(uint64_t a1, void *a2)
{
  int v3 = a2;
  [*(id *)(a1 + 32) _clearRotationSuppressionTimerWithGuardedData:v3];
  uint64_t v4 = v3[9];
  objc_super v5 = __atxlog_handle_home_screen();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: rotation suppression lifted, updating states with suppressed suggestion update.", buf, 2u);
    }

    uint64_t v7 = (void *)v3[9];
    v3[9] = 0;
    objc_super v5 = v7;

    [*(id *)(a1 + 32) _updateGuardedData:v3 withCachedSuggestions:v5 updateProactiveWidgetLayoutsOnly:0];
  }
  else if (v6)
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: rotation suppression lifted, no suppressed suggestion.", v8, 2u);
  }
}

- (void)_startSuppressingSystemInitiatedLayoutUpdateForTimeInterval:(double)a3 leeway:(double)a4 guardedData:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = (dispatch_object_t *)a5;
  if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F4B710];
    keyExistsAndHasValidFormat[0] = 0;
    if (CFPreferencesGetAppBooleanValue(v9, (CFStringRef)*MEMORY[0x1E4F4B688], keyExistsAndHasValidFormat))
    {
      a4 = 0.01;
      a3 = 1.0;
    }
  }
  uint64_t v10 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)keyExistsAndHasValidFormat = 134218240;
    double v18 = a3;
    __int16 v19 = 2048;
    double v20 = a4;
    _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: start suppressing layout update for %f seconds with %f leeway seconds", keyExistsAndHasValidFormat, 0x16u);
  }

  id v11 = v8[3];
  if (!v11)
  {
    dispatch_source_t v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_outputQueue);
    dispatch_object_t v13 = v8[3];
    v8[3] = v12;

    objc_initWeak((id *)keyExistsAndHasValidFormat, self);
    id v14 = v8[3];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __112__ATXHomeScreenSuggestionClient__startSuppressingSystemInitiatedLayoutUpdateForTimeInterval_leeway_guardedData___block_invoke;
    handler[3] = &unk_1E5D05748;
    objc_copyWeak(&v16, (id *)keyExistsAndHasValidFormat);
    dispatch_source_set_event_handler(v14, handler);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)keyExistsAndHasValidFormat);
    id v11 = v8[3];
  }
  dispatch_source_set_timer(v11, [MEMORY[0x1E4F93B18] dispatchTimeWithSecondsFromNow:a3], 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a4 * 1000000000.0));
  dispatch_activate(v8[3]);
}

void __112__ATXHomeScreenSuggestionClient__startSuppressingSystemInitiatedLayoutUpdateForTimeInterval_leeway_guardedData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _layoutUpdateSuppressionTimerFired];
}

- (void)_layoutUpdateSuppressionTimerFired
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__ATXHomeScreenSuggestionClient__layoutUpdateSuppressionTimerFired__block_invoke;
  v3[3] = &unk_1E5D07828;
  v3[4] = self;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v3];
}

void __67__ATXHomeScreenSuggestionClient__layoutUpdateSuppressionTimerFired__block_invoke(uint64_t a1, void *a2)
{
  int v3 = a2;
  [*(id *)(a1 + 32) _cancelAndReleaseLayoutUpdateSuppressionTimer:v3];
  uint64_t v4 = v3[9];
  objc_super v5 = __atxlog_handle_home_screen();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: layout update suppression lifted, updating states with suppressed suggestion update.", buf, 2u);
    }

    [*(id *)(a1 + 32) _updateKnownWidgetUniqueIdsIfNecessaryWithGuardedData:v3];
    [*(id *)(a1 + 32) _updateGuardedData:v3 withCachedSuggestions:v3[9] updateProactiveWidgetLayoutsOnly:0];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: layout update suppression lifted, no suppressed suggestion.", v7, 2u);
    }
  }
}

- (void)_cancelAndReleaseLayoutUpdateSuppressionTimer:(id)a3
{
  int v3 = *((void *)a3 + 3);
  if (v3)
  {
    id v5 = a3;
    dispatch_source_cancel(v3);
    id v6 = (id)*((void *)a3 + 3);
    *((void *)a3 + 3) = 0;
  }
}

- (BOOL)_isSystemInitiatedLayoutUpdateAllowed:(id)a3
{
  return !*((unsigned char *)a3 + 32) && *((void *)a3 + 3) == 0;
}

- (id)_loadKnownHomeScreenProactiveWidgetUniqueIds
{
  homeScreenConfigCache = self->_homeScreenConfigCache;
  id v10 = 0;
  uint64_t v4 = [(ATXHomeScreenConfigCache *)homeScreenConfigCache loadHomeScreenPageConfigurationsWithError:&v10];
  id v5 = v10;
  if (v5)
  {
    id v6 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXHomeScreenSuggestionClient _loadKnownHomeScreenProactiveWidgetUniqueIds]();
    }

    goto LABEL_5;
  }
  if (!v4)
  {
LABEL_5:
    uint64_t v7 = objc_opt_new();
    goto LABEL_8;
  }
  uint64_t v7 = [(ATXHomeScreenSuggestionClient *)self _knownProactiveWidgetUniqueIdentifiersInPages:v4];
LABEL_8:
  id v8 = (void *)v7;

  return v8;
}

- (id)_loadKnownTodayPageProactiveWidgetUniqueIds
{
  v11[1] = *MEMORY[0x1E4F143B8];
  homeScreenConfigCache = self->_homeScreenConfigCache;
  id v10 = 0;
  uint64_t v4 = [(ATXHomeScreenConfigCache *)homeScreenConfigCache loadTodayStacksAndPanelsAsHomeScreenPageWithError:&v10];
  id v5 = v10;
  if (v5)
  {
    id v6 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXHomeScreenSuggestionClient _loadKnownTodayPageProactiveWidgetUniqueIds]();
    }

    goto LABEL_5;
  }
  if (!v4)
  {
LABEL_5:
    uint64_t v7 = objc_opt_new();
    goto LABEL_8;
  }
  v11[0] = v4;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v7 = [(ATXHomeScreenSuggestionClient *)self _knownProactiveWidgetUniqueIdentifiersInPages:v8];

LABEL_8:

  return v7;
}

- (id)_knownProactiveWidgetUniqueIdentifiersInPages:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v3;
  uint64_t v29 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v49;
    uint64_t v5 = *MEMORY[0x1E4F4B5F8];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v49 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v48 + 1) + 8 * v6);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v30 = v7;
        uint64_t v31 = v6;
        id v32 = [v7 stacks];
        uint64_t v34 = [v32 countByEnumeratingWithState:&v44 objects:v56 count:16];
        if (v34)
        {
          uint64_t v33 = *(void *)v45;
          do
          {
            uint64_t v8 = 0;
            do
            {
              if (*(void *)v45 != v33) {
                objc_enumerationMutation(v32);
              }
              uint64_t v35 = v8;
              CFStringRef v9 = *(void **)(*((void *)&v44 + 1) + 8 * v8);
              long long v40 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              id v10 = [v9 widgets];
              uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v55 count:16];
              if (v11)
              {
                uint64_t v12 = v11;
                uint64_t v13 = *(void *)v41;
                do
                {
                  for (uint64_t i = 0; i != v12; ++i)
                  {
                    if (*(void *)v41 != v13) {
                      objc_enumerationMutation(v10);
                    }
                    id v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                    id v16 = [v15 extensionBundleId];
                    int v17 = [v16 isEqualToString:v5];

                    if (v17)
                    {
                      double v18 = [v15 widgetUniqueId];

                      if (v18)
                      {
                        __int16 v19 = [v15 widgetUniqueId];
                        [v4 addObject:v19];
                      }
                      else
                      {
                        __int16 v19 = __atxlog_handle_home_screen();
                        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
                          -[ATXHomeScreenSuggestionClient _knownProactiveWidgetUniqueIdentifiersInPages:](v53, v9, &v54, v19);
                        }
                      }
                    }
                  }
                  uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v55 count:16];
                }
                while (v12);
              }

              uint64_t v8 = v35 + 1;
            }
            while (v35 + 1 != v34);
            uint64_t v34 = [v32 countByEnumeratingWithState:&v44 objects:v56 count:16];
          }
          while (v34);
        }

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        double v20 = [v30 panels];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v52 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v37;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v37 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = [*(id *)(*((void *)&v36 + 1) + 8 * j) identifier];
              [v4 addObject:v25];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v52 count:16];
          }
          while (v22);
        }

        uint64_t v6 = v31 + 1;
      }
      while (v31 + 1 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v29);
  }

  return v4;
}

- (void)_readCachedSuggestionsFromDiskAndUpdateGuardedData:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = [(ATXUICacheManager *)self->_uiCacheManager cachedLayoutForConsumerSubType:34 expectedClass:objc_opt_class()];
  if (v5)
  {
    [(ATXHomeScreenSuggestionClient *)self _updateGuardedData:v4 withCachedSuggestions:v5 updateProactiveWidgetLayoutsOnly:1];
    [(ATXChronoServicesProvider *)self->_chronoServicesProvider resetToPrewarmWidgetsInSuggestions:v5];
  }
  else
  {
    uint64_t v6 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v18 = 0;
      _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: Unable to read cached suggestions, set prediction data as empty.", v18, 2u);
    }

    uint64_t v7 = (void *)v4[17];
    v4[17] = 0;

    uint64_t v8 = (void *)v4[11];
    v4[11] = 0;

    uint64_t v9 = objc_opt_new();
    id v10 = (void *)v4[14];
    v4[14] = v9;

    uint64_t v11 = objc_opt_new();
    uint64_t v12 = (void *)v4[12];
    v4[12] = v11;

    uint64_t v13 = objc_opt_new();
    id v14 = (void *)v4[13];
    v4[13] = v13;

    uint64_t v15 = objc_opt_new();
    id v16 = (void *)v4[15];
    v4[15] = v15;

    int v17 = (void *)v4[18];
    v4[18] = 0;
  }
}

- (void)_updateKnownWidgetUniqueIdsIfNecessaryWithGuardedData:(id)a3
{
  uint64_t v4 = a3;
  if ([(ATXHomeScreenSuggestionClient *)self _isSystemInitiatedLayoutUpdateAllowed:v4])
  {
    if (*((unsigned char *)v4 + 64))
    {
      uint64_t v5 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: updating known today page widget unique ids", buf, 2u);
      }

      uint64_t v6 = [(ATXHomeScreenSuggestionClient *)self _loadKnownTodayPageProactiveWidgetUniqueIds];
      uint64_t v7 = (void *)v4[7];
      v4[7] = v6;

      *((unsigned char *)v4 + 64) = 0;
    }
    if (*((unsigned char *)v4 + 48))
    {
      uint64_t v8 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: updating known Home Screen widget unique ids", v11, 2u);
      }

      uint64_t v9 = [(ATXHomeScreenSuggestionClient *)self _loadKnownHomeScreenProactiveWidgetUniqueIds];
      id v10 = (void *)v4[5];
      v4[5] = v9;

      *((unsigned char *)v4 + 48) = 0;
    }
  }
}

- (id)_computePreviousSuggestedSuggestionWidgetLayoutsWithGuardedData:(id)a3 cachedSuggestions:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (id *)a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v8 = [v5[12] allKeys];
  uint64_t v9 = (void *)v8;
  uint64_t v10 = MEMORY[0x1E4F1CBF0];
  if (v8) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v12 = (void *)[v7 initWithArray:v11];

  id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v34 = v6;
  id v14 = [v6 cachedSuggestionWidgetLayouts];
  uint64_t v15 = [v14 allKeys];
  id v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = v10;
  }
  uint64_t v18 = [v13 initWithArray:v17];

  uint64_t v33 = (void *)v18;
  [v12 minusSet:v18];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __115__ATXHomeScreenSuggestionClient__computePreviousSuggestedSuggestionWidgetLayoutsWithGuardedData_cachedSuggestions___block_invoke;
  v39[3] = &unk_1E5D078A0;
  __int16 v19 = v5;
  long long v40 = v19;
  double v20 = [v12 objectsPassingTest:v39];
  uint64_t v21 = (void *)[v19[11] mutableCopy];
  uint64_t v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = (id)objc_opt_new();
  }
  uint64_t v24 = v23;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v25 = v20;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v31 = [v5[12] objectForKeyedSubscript:v30];
        [v24 setObject:v31 forKeyedSubscript:v30];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v27);
  }

  return v24;
}

uint64_t __115__ATXHomeScreenSuggestionClient__computePreviousSuggestedSuggestionWidgetLayoutsWithGuardedData_cachedSuggestions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:a2];
  uint64_t v3 = [v2 isNPlusOne];

  return v3;
}

- (void)_updateGuardedData:(id)a3 withCachedSuggestions:(id)a4 updateProactiveWidgetLayoutsOnly:(BOOL)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(ATXHomeScreenSuggestionClient *)self _isSystemInitiatedLayoutUpdateAllowed:v8]&& !*((void *)v8 + 2))
  {
    uint64_t v11 = (void *)*((void *)v8 + 9);
    *((void *)v8 + 9) = 0;
  }
  else
  {
    id v10 = v9;
    uint64_t v11 = (void *)*((void *)v8 + 9);
    *((void *)v8 + 9) = v10;
  }

  if ([(ATXHomeScreenSuggestionClient *)self _isSystemInitiatedLayoutUpdateAllowed:v8])
  {
    uint64_t v12 = [(ATXHomeScreenSuggestionClient *)self _computePreviousSuggestedSuggestionWidgetLayoutsWithGuardedData:v8 cachedSuggestions:v9];
    id v13 = (void *)*((void *)v8 + 11);
    *((void *)v8 + 11) = v12;

    if ([*((id *)v8 + 11) count])
    {
      id v14 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [*((id *)v8 + 11) allKeys];
        *(_DWORD *)buf = 138412290;
        long long v35 = v15;
        _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: keeping around previously-removed suggested suggestion widget layouts: %@", buf, 0xCu);
      }
      [(ATXHomeScreenSuggestionClient *)self _clearRotationSuppressionTimerWithGuardedData:v8];
    }
    uint64_t v16 = [v9 cachedSuggestionWidgetLayouts];
    uint64_t v17 = (void *)*((void *)v8 + 12);
    *((void *)v8 + 12) = v16;

    uint64_t v18 = [v9 cachedAppPredictionPanelLayouts];
    __int16 v19 = (void *)*((void *)v8 + 13);
    *((void *)v8 + 13) = v18;

    double v20 = [v9 fallbackSuggestions];
    uint64_t v21 = [v20 mutableCopy];
    uint64_t v22 = (void *)*((void *)v8 + 15);
    *((void *)v8 + 15) = v21;

    id v23 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v23, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: updated Proactive widget layouts", buf, 2u);
    }

    [(ATXHomeScreenSuggestionClient *)self _notifyObserversAboutLayoutUpdateWithGuardedData:v8];
    if (!a5)
    {
      if (*((void *)v8 + 2)
        || [(NSUserDefaults *)self->_atxDefaults BOOLForKey:@"ATXStopAllStackRotation"])
      {
        uint64_t v24 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A790D000, v24, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: not pushing suggestions to UI clients due to rotation suppression", buf, 2u);
        }
      }
      else
      {
        if ([*((id *)v8 + 14) count]) {
          [(ATXHomeScreenSuggestionClient *)self _refreshInferredEngagementStatusForWidgetSuggestions:v8];
        }
        id v25 = [v9 uuid];
        uint64_t v26 = [v25 UUIDString];
        uint64_t v27 = (void *)*((void *)v8 + 17);
        *((void *)v8 + 17) = v26;

        uint64_t v28 = +[ATXHomeScreenStackSuggestion stackSuggestionsFromCachedSuggestions:v9];
        uint64_t v29 = (void *)*((void *)v8 + 14);
        *((void *)v8 + 14) = v28;

        uint64_t v30 = (void *)*((void *)v8 + 18);
        *((void *)v8 + 18) = 0;

        uint64_t v31 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A790D000, v31, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: updated stack suggestions", buf, 2u);
        }

        [(ATXHomeScreenSuggestionClient *)self _notifyObserversAboutSuggestionRefreshWithGuardedData:v8];
        [(ATXHomeScreenSuggestionClient *)self _handleStackSuggestionDidUpdate:v8];
        outputQueue = self->_outputQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __107__ATXHomeScreenSuggestionClient__updateGuardedData_withCachedSuggestions_updateProactiveWidgetLayoutsOnly___block_invoke;
        block[3] = &unk_1E5D05300;
        block[4] = self;
        dispatch_async(outputQueue, block);
      }
    }
  }
}

void __107__ATXHomeScreenSuggestionClient__updateGuardedData_withCachedSuggestions_updateProactiveWidgetLayoutsOnly___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__ATXHomeScreenSuggestionClient__updateGuardedData_withCachedSuggestions_updateProactiveWidgetLayoutsOnly___block_invoke_2;
  block[3] = &unk_1E5D05300;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __107__ATXHomeScreenSuggestionClient__updateGuardedData_withCachedSuggestions_updateProactiveWidgetLayoutsOnly___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) runWithLockAcquired:&__block_literal_global_111];
}

void __107__ATXHomeScreenSuggestionClient__updateGuardedData_withCachedSuggestions_updateProactiveWidgetLayoutsOnly___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 88);
  *(void *)(a2 + 88) = 0;
}

- (void)_refreshInferredEngagementStatusForWidgetSuggestions:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v52 = (id *)a3;
  id v53 = self;
  uint64_t v4 = [(ATXEngagementRecordManager *)self->_engagementRecordManager engagedExecutablesOfType:4 queryOptions:0];
  uint64_t v54 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "RAS: >>>>>>>>>> checking currently engaged executables for removing engagement <<<<<<<<<<", buf, 2u);
  }

  long long v47 = v4;
  if ([v4 count])
  {
    obuint64_t j = (id)objc_opt_new();
    long long v49 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-300.0];
    long long v48 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-6000.0];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v60 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          if ([v11 type] == 3)
          {
            uint64_t v12 = [v11 object];
            id v13 = [v12 suggestionIdentifier];
            id v14 = [v12 widgetBundleIdentifier];
            uint64_t v15 = [v12 widgetKind];
            BOOL v16 = [(ATXHomeScreenSuggestionClient *)v53 _isWidgetEngaged:v14 kind:v15 afterMostRecentProactiveRotationToSuggestionWithIdentifier:v13 guardedData:v52];

            if (!v16)
            {
              uint64_t v17 = __atxlog_handle_home_screen();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v18 = [v12 confidenceLevel];
                __int16 v19 = [v12 widgetBundleIdentifier];
                *(_DWORD *)buf = 138543874;
                v65 = v13;
                __int16 v66 = 2050;
                uint64_t v67 = v18;
                __int16 v68 = 2112;
                v69 = v19;
                _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_DEFAULT, "RAS:     [TRYING TO REMOVE ENGAGEMENT] infoSuggestionId %{public}@, confidence %{public}ld, widgetExtBundleId %@", buf, 0x20u);
              }
              uint64_t v20 = [v12 confidenceLevel];
              if (v20 >= [obj minInfoConfidenceLevelForBlendingConfidenceCategory:3]) {
                uint64_t v21 = v49;
              }
              else {
                uint64_t v21 = v48;
              }
              [(ATXEngagementRecordManager *)v53->_engagementRecordManager removeEngagementForExecutableIdentifier:v11 recordType:4 abortingRemovalIfEngagementDateIsLaterThanDate:v21];
            }
            [v54 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v59 objects:v70 count:16];
      }
      while (v8);
    }
  }
  uint64_t v22 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A790D000, v22, OS_LOG_TYPE_DEFAULT, "RAS: ========== checking current stack suggestions for adding engagement ==========", buf, 2u);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obja = [v52[14] allValues];
  uint64_t v23 = [obja countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v56 != v25) {
          objc_enumerationMutation(obja);
        }
        uint64_t v27 = *(void **)(*((void *)&v55 + 1) + 8 * j);
        uint64_t v28 = [v27 topWidgetProactiveSuggestion];

        if (v28)
        {
          uint64_t v29 = [v27 topWidgetProactiveSuggestion];
          uint64_t v30 = [v29 executableSpecification];
          uint64_t v31 = [v30 executableIdentifier];

          if ([v54 containsObject:v31])
          {
            id v32 = __atxlog_handle_home_screen();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v65 = v31;
              _os_log_impl(&dword_1A790D000, v32, OS_LOG_TYPE_DEFAULT, "RAS:     Skipping infoSuggestionId %{public}@ becaues it was already processed", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v33 = [v27 topWidget];
            uint64_t v34 = [v33 extensionBundleId];
            long long v35 = [v27 topWidget];
            uint64_t v36 = [v35 widgetKind];
            BOOL v37 = [(ATXHomeScreenSuggestionClient *)v53 _isWidgetEngaged:v34 kind:v36 afterMostRecentProactiveRotationToSuggestionWithIdentifier:v31 guardedData:v52];

            if (v37)
            {
              engagementRecordManager = v53->_engagementRecordManager;
              long long v39 = [v27 topWidgetProactiveSuggestion];
              LODWORD(engagementRecordManager) = [(ATXEngagementRecordManager *)engagementRecordManager hasReferenceForSuggestion:v39];

              long long v40 = __atxlog_handle_home_screen();
              BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
              if (engagementRecordManager)
              {
                if (v41)
                {
                  uint64_t v42 = [v27 topWidget];
                  long long v43 = [v42 extensionBundleId];
                  *(_DWORD *)buf = 138543618;
                  v65 = v31;
                  __int16 v66 = 2112;
                  uint64_t v67 = (uint64_t)v43;
                  _os_log_impl(&dword_1A790D000, v40, OS_LOG_TYPE_DEFAULT, "RAS:     [ADDING ENGAGEMENT] infoSuggestionId %{public}@, widgetExtBundleId %@", buf, 0x16u);
                }
                long long v44 = v53->_engagementRecordManager;
                long long v40 = [v27 topWidgetProactiveSuggestion];
                [(ATXEngagementRecordManager *)v44 addEngagedSuggestion:v40 engagementRecordType:4];
              }
              else if (v41)
              {
                long long v45 = [v27 topWidget];
                long long v46 = [v45 extensionBundleId];
                *(_DWORD *)buf = 138543618;
                v65 = v31;
                __int16 v66 = 2112;
                uint64_t v67 = (uint64_t)v46;
                _os_log_impl(&dword_1A790D000, v40, OS_LOG_TYPE_DEFAULT, "RAS:     Skipping infoSuggestionId %{public}@ because ERM doesn't contain a reference, widgetExtBundleId %@", buf, 0x16u);
              }
              [v54 addObject:v31];
            }
          }
        }
      }
      uint64_t v24 = [obja countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v24);
  }
}

- (BOOL)_isWidgetEngaged:(id)a3 kind:(id)a4 afterMostRecentProactiveRotationToSuggestionWithIdentifier:(id)a5 guardedData:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (id *)a6;
  id v13 = [v12[23] mostRecentRotationRecordForSuggestionIdentifier:v11];
  id v14 = [v13 rotationDate];

  if (v14)
  {
    uint64_t v15 = [v12[23] mostRecentEngagementOfWidget:v9 kind:v10 ofType:1];
    BOOL v16 = [v12[23] mostRecentEngagementOfWidget:v9 kind:v10 ofType:2];
    uint64_t v17 = [v16 date];
    if (v17
      && (uint64_t v18 = (void *)v17,
          [v15 date],
          __int16 v19 = objc_claimAutoreleasedReturnValue(),
          v19,
          v18,
          v19))
    {
      uint64_t v20 = [v16 date];
      uint64_t v21 = [v15 date];
      uint64_t v22 = [v20 laterDate:v21];

      if (!v22) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v23 = [v16 date];

      if (v23)
      {
        uint64_t v24 = v16;
      }
      else
      {
        uint64_t v22 = [v15 date];

        if (!v22) {
          goto LABEL_17;
        }
        uint64_t v24 = v15;
      }
      uint64_t v22 = [v24 date];
      if (!v22) {
        goto LABEL_17;
      }
    }
    uint64_t v26 = [v13 rotationDate];
    uint64_t v27 = [v22 earlierDate:v26];

    if (v27 != v22)
    {
      uint64_t v28 = [v12[23] mostRecentTimelineUpdateDateOfWidget:v9 kind:v10];
      uint64_t v29 = v28;
      if (v28)
      {
        uint64_t v30 = v28;
      }
      else
      {
        uint64_t v30 = [MEMORY[0x1E4F1C9C8] distantPast];
      }
      uint64_t v31 = v30;

      uint64_t v33 = [v22 laterDate:v31];

      log = __atxlog_handle_home_screen();
      BOOL v34 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
      BOOL v35 = v33 == v31;
      BOOL v25 = v33 != v31;
      if (v35)
      {
        if (v34)
        {
          long long v38 = [v13 rotationDate];
          *(_DWORD *)buf = 138413314;
          id v41 = v9;
          __int16 v42 = 2114;
          id v43 = v11;
          __int16 v44 = 2114;
          long long v45 = v38;
          __int16 v46 = 2114;
          long long v47 = v22;
          __int16 v48 = 2114;
          long long v49 = v31;
          uint64_t v36 = "RAS:     NO <= _isWidgetEngaged: %@, suggestionId: %{public}@ (mostRecentRotation %{public}@, mostRecent"
                "Engagement %{public}@, mostRecentTimelineUpdate %{public}@)";
          goto LABEL_26;
        }
      }
      else if (v34)
      {
        long long v38 = [v13 rotationDate];
        *(_DWORD *)buf = 138413314;
        id v41 = v9;
        __int16 v42 = 2114;
        id v43 = v11;
        __int16 v44 = 2114;
        long long v45 = v38;
        __int16 v46 = 2114;
        long long v47 = v22;
        __int16 v48 = 2114;
        long long v49 = v31;
        uint64_t v36 = "RAS:     YES <= _isWidgetEngaged: %@, suggestionId: %{public}@ (mostRecentRotation %{public}@, mostRecentE"
              "ngagement %{public}@, mostRecentTimelineUpdate %{public}@)";
LABEL_26:
        _os_log_impl(&dword_1A790D000, log, OS_LOG_TYPE_DEFAULT, v36, buf, 0x34u);
      }
LABEL_28:

      goto LABEL_29;
    }
LABEL_17:
    uint64_t v31 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = [v13 rotationDate];
      *(_DWORD *)buf = 138413058;
      id v41 = v9;
      __int16 v42 = 2114;
      id v43 = v11;
      __int16 v44 = 2114;
      long long v45 = v32;
      __int16 v46 = 2114;
      long long v47 = v22;
      _os_log_impl(&dword_1A790D000, v31, OS_LOG_TYPE_DEFAULT, "RAS:     NO <= _isWidgetEngaged: %@, suggestionId: %{public}@ (mostRecentRotation %{public}@, mostRecentEngagement %{public}@)", buf, 0x2Au);
    }
    BOOL v25 = 0;
    goto LABEL_28;
  }
  uint64_t v15 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v41 = v9;
    __int16 v42 = 2114;
    id v43 = v11;
    _os_log_impl(&dword_1A790D000, v15, OS_LOG_TYPE_DEFAULT, "RAS:     NO <= _isWidgetEngaged: %@, suggestionId: %{public}@ (nil suggestion rotation date)", buf, 0x16u);
  }
  BOOL v25 = 0;
LABEL_29:

  return v25;
}

- (void)_notifyObserversAboutSuggestionRefreshWithGuardedData:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        outputQueue = self->_outputQueue;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        void v11[2] = __87__ATXHomeScreenSuggestionClient__notifyObserversAboutSuggestionRefreshWithGuardedData___block_invoke;
        v11[3] = &unk_1E5D04FC8;
        v11[4] = v9;
        v11[5] = self;
        dispatch_async(outputQueue, v11);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

uint64_t __87__ATXHomeScreenSuggestionClient__notifyObserversAboutSuggestionRefreshWithGuardedData___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 suggestionClientDidRefreshSuggestions:v4];
  }
  return result;
}

- (void)_notifyObserversAboutLayoutUpdateWithGuardedData:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        outputQueue = self->_outputQueue;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        void v11[2] = __82__ATXHomeScreenSuggestionClient__notifyObserversAboutLayoutUpdateWithGuardedData___block_invoke;
        v11[3] = &unk_1E5D04FC8;
        v11[4] = v9;
        v11[5] = self;
        dispatch_async(outputQueue, v11);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

uint64_t __82__ATXHomeScreenSuggestionClient__notifyObserversAboutLayoutUpdateWithGuardedData___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 suggestionClientDidRefreshProactiveWidgetLayouts:v4];
  }
  return result;
}

- (void)_cleanupGuardedData:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v14 = 0;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: cleaning up guarded data", v14, 2u);
  }

  uint64_t v6 = (void *)v4[11];
  v4[11] = 0;

  uint64_t v7 = (void *)v4[17];
  v4[17] = 0;

  uint64_t v8 = (void *)v4[12];
  v4[12] = 0;

  uint64_t v9 = (void *)v4[13];
  v4[13] = 0;

  id v10 = (void *)v4[14];
  v4[14] = 0;

  id v11 = (void *)v4[15];
  v4[15] = 0;

  long long v12 = (void *)v4[18];
  v4[18] = 0;

  long long v13 = (void *)v4[9];
  v4[9] = 0;

  [(ATXHomeScreenSuggestionClient *)self _clearRotationSuppressionTimerWithGuardedData:v4];
}

- (void)_clearRotationSuppressionTimerWithGuardedData:(id)a3
{
  uint64_t v3 = *((void *)a3 + 2);
  if (v3)
  {
    id v5 = a3;
    dispatch_source_cancel(v3);
    id v6 = (id)*((void *)a3 + 2);
    *((void *)a3 + 2) = 0;
  }
}

- (void)_handleStackSuggestionDidUpdate:(id)a3
{
}

void __65__ATXHomeScreenSuggestionClient__handleStackSuggestionDidUpdate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v3 = [v6 topWidgetInfoSuggestion];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F938F8] sharedInstance];
    id v5 = [v6 topWidgetInfoSuggestion];
    objc_msgSend(v4, "stackDidRotateProactivelyForInfoSuggestion:isStalenessRotation:", v5, objc_msgSend(v6, "isLowConfidenceStackRotationForStaleStack"));
  }
}

- (void)_alertUserIfNeededOfStackChange:(id)a3 widgetOnTop:(id)a4 reason:(unint64_t)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(NSUserDefaults *)self->_atxDefaults BOOLForKey:@"ATXHomeScreenStackChangeAlert"]) {
    BOOL v10 = a5 > 9;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && ((1 << a5) & 0x20C) != 0)
  {
    uint64_t v36 = v9;
    [(ATXHomeScreenConfigCache *)self->_homeScreenConfigCache loadHomeScreenAndTodayPageConfigurationsWithError:0];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v34 = [obj countByEnumeratingWithState:&v42 objects:v53 count:16];
    if (!v34) {
      goto LABEL_32;
    }
    uint64_t v33 = *(void *)v43;
    while (1)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v43 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v12;
        long long v13 = *(void **)(*((void *)&v42 + 1) + 8 * v12);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v37 = [v13 stacks];
        uint64_t v14 = [v37 countByEnumeratingWithState:&v38 objects:v52 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v39 != v16) {
                objc_enumerationMutation(v37);
              }
              uint64_t v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              __int16 v19 = [v18 identifier];
              int v20 = [v19 isEqualToString:v8];

              if (v20)
              {
                uint64_t v21 = objc_opt_new();
                if (a5 == 9)
                {
                  id v25 = [NSString alloc];
                  uint64_t v23 = [v36 extensionBundleId];
                  uint64_t v24 = [v25 initWithFormat:@"%@ (forced debug rotation)", v23];
LABEL_23:
                  uint64_t v26 = (void *)v24;
                  [v21 setObject:v24 forKeyedSubscript:@"widget"];
                }
                else
                {
                  if (a5 == 3)
                  {
                    id v22 = [NSString alloc];
                    uint64_t v23 = [v36 extensionBundleId];
                    uint64_t v24 = [v22 initWithFormat:@"%@ (due to suggestion expiry)", v23];
                    goto LABEL_23;
                  }
                  uint64_t v23 = [v36 extensionBundleId];
                  [v21 setObject:v23 forKeyedSubscript:@"widget"];
                }

                uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "pageIndex"));
                [v21 setObject:v27 forKeyedSubscript:@"pageNumber"];

                uint64_t v28 = [MEMORY[0x1E4F28C40] defaultCenter];
                [v28 postNotificationName:@"com.apple.duetexpertd.homeScreenStackChange" object:0 userInfo:v21];

                uint64_t v29 = __atxlog_handle_home_screen();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v30 = [v18 identifier];
                  uint64_t v31 = [v13 pageIndex];
                  *(_DWORD *)buf = 136315650;
                  long long v47 = "-[ATXHomeScreenSuggestionClient _alertUserIfNeededOfStackChange:widgetOnTop:reason:]";
                  __int16 v48 = 2112;
                  long long v49 = v30;
                  __int16 v50 = 2048;
                  uint64_t v51 = v31;
                  _os_log_impl(&dword_1A790D000, v29, OS_LOG_TYPE_DEFAULT, "%s: sent notification about stackID: %@ on page: %lu", buf, 0x20u);
                }
                continue;
              }
            }
            uint64_t v15 = [v37 countByEnumeratingWithState:&v38 objects:v52 count:16];
          }
          while (v15);
        }

        uint64_t v12 = v35 + 1;
      }
      while (v35 + 1 != v34);
      uint64_t v34 = [obj countByEnumeratingWithState:&v42 objects:v53 count:16];
      if (!v34)
      {
LABEL_32:

        id v9 = v36;
        break;
      }
    }
  }
}

- (void)layoutForSuggestionsWidget:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __78__ATXHomeScreenSuggestionClient_layoutForSuggestionsWidget_completionHandler___block_invoke;
  v11[3] = &unk_1E5D078E8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v11];
}

void __78__ATXHomeScreenSuggestionClient_layoutForSuggestionsWidget_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)*((void *)v3 + 12);
  if (!v4)
  {
    id v5 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: layoutForSuggestionWidgetWithIdentifier fallback to read from DisplayCache", (uint8_t *)&v23, 2u);
    }

    [*(id *)(a1 + 32) _readCachedSuggestionsFromDiskAndUpdateGuardedData:v3];
    uint64_t v4 = (void *)*((void *)v3 + 12);
  }
  id v6 = (id *)(a1 + 40);
  id v7 = [*(id *)(a1 + 40) widgetUniqueId];
  id v8 = [v4 objectForKeyedSubscript:v7];
  id v9 = (void *)[v8 copy];

  if (v9) {
    goto LABEL_9;
  }
  id v10 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [*v6 widgetUniqueId];
    int v23 = 138543362;
    uint64_t v24 = v11;
    _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: using previous suggested SG widget layout: %{public}@", (uint8_t *)&v23, 0xCu);
  }
  id v12 = (void *)*((void *)v3 + 11);
  id v13 = [*v6 widgetUniqueId];
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];
  id v9 = (void *)[v14 copy];

  if (v9) {
    goto LABEL_9;
  }
  uint64_t v15 = [*v6 widgetUniqueId];
  if (!v15)
  {
LABEL_16:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_10;
  }
  uint64_t v16 = v15;
  uint64_t v17 = (void *)*((void *)v3 + 5);
  uint64_t v18 = [*v6 widgetUniqueId];
  if ([v17 containsObject:v18])
  {

LABEL_14:
    goto LABEL_16;
  }
  __int16 v19 = (void *)*((void *)v3 + 7);
  int v20 = [*v6 widgetUniqueId];
  LODWORD(v19) = [v19 containsObject:v20];

  if (v19) {
    goto LABEL_16;
  }
  if ([*v6 size])
  {
    if ([*v6 size] == 1)
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F4B608];
    }
    else
    {
      if ([*v6 size] != 2)
      {
        uint64_t v16 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          __78__ATXHomeScreenSuggestionClient_layoutForSuggestionsWidget_completionHandler___block_invoke_cold_1((id *)(a1 + 40));
        }
        goto LABEL_14;
      }
      uint64_t v21 = (void *)MEMORY[0x1E4F4B610];
    }
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F4B600];
  }
  id v22 = [*((id *)v3 + 12) objectForKeyedSubscript:*v21];
  id v9 = (void *)[v22 copy];

LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_10:
}

- (void)layoutForAppPredictionPanel:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __79__ATXHomeScreenSuggestionClient_layoutForAppPredictionPanel_completionHandler___block_invoke;
  v11[3] = &unk_1E5D078E8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v11];
}

void __79__ATXHomeScreenSuggestionClient_layoutForAppPredictionPanel_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  id v5 = (void *)v3[13];
  if (!v5 || !v3[12])
  {
    id v6 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: layoutForSuggestionWidgetWithIdentifier fallback to read from DisplayCache", (uint8_t *)&v22, 2u);
    }

    [*(id *)(a1 + 32) _readCachedSuggestionsFromDiskAndUpdateGuardedData:v4];
    id v5 = (void *)*((void *)v4 + 13);
  }
  id v7 = (id *)(a1 + 40);
  id v8 = [*(id *)(a1 + 40) widgetUniqueId];
  id v9 = [v5 objectForKeyedSubscript:v8];
  id v10 = (void *)[v9 copy];

  if (v10) {
    goto LABEL_7;
  }
  uint64_t v11 = [*v7 widgetUniqueId];
  if (!v11) {
    goto LABEL_12;
  }
  id v12 = (void *)v11;
  id v13 = (void *)*((void *)v4 + 5);
  uint64_t v14 = [*v7 widgetUniqueId];
  if ([v13 containsObject:v14])
  {

    goto LABEL_12;
  }
  uint64_t v15 = (void *)*((void *)v4 + 7);
  uint64_t v16 = [*v7 widgetUniqueId];
  LODWORD(v15) = [v15 containsObject:v16];

  if (v15)
  {
LABEL_12:
    uint64_t v17 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [*v7 widgetUniqueId];
      int v22 = 138543362;
      int v23 = v18;
      _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: expecting layout for %{public}@ but did not have one", (uint8_t *)&v22, 0xCu);
    }
LABEL_14:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_15;
  }
  if ([*v7 size] != 1)
  {
    uint64_t v17 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      __79__ATXHomeScreenSuggestionClient_layoutForAppPredictionPanel_completionHandler___block_invoke_cold_1((id *)(a1 + 40));
    }
    goto LABEL_14;
  }
  __int16 v19 = [*((id *)v4 + 13) objectForKeyedSubscript:*MEMORY[0x1E4F4B598]];
  id v10 = (void *)[v19 copy];

  int v20 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = [*v7 widgetUniqueId];
    int v22 = 138543362;
    int v23 = v21;
    _os_log_impl(&dword_1A790D000, v20, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: returning preview layout for %{public}@", (uint8_t *)&v22, 0xCu);
  }
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_15:
}

- (int64_t)_layoutTypeOfSuggestion:(id)a3 inLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 oneByOneSuggestions];
  char v8 = [v7 containsObject:v5];

  if (v8)
  {
    int64_t v9 = 1;
  }
  else
  {
    id v10 = [v6 oneByTwoSuggestions];
    char v11 = [v10 containsObject:v5];

    if (v11)
    {
      int64_t v9 = 2;
    }
    else
    {
      id v12 = [v6 twoByTwoSuggestions];
      char v13 = [v12 containsObject:v5];

      if (v13)
      {
        int64_t v9 = 3;
      }
      else
      {
        uint64_t v14 = [v6 oneByFourSuggestions];
        char v15 = [v14 containsObject:v5];

        if (v15)
        {
          int64_t v9 = 5;
        }
        else
        {
          uint64_t v16 = [v6 twoByFourSuggestions];
          char v17 = [v16 containsObject:v5];

          if (v17)
          {
            int64_t v9 = 4;
          }
          else
          {
            uint64_t v18 = [v6 fourByFourSuggestions];
            char v19 = [v18 containsObject:v5];

            if (v19)
            {
              int64_t v9 = 6;
            }
            else
            {
              int v20 = [v6 fourByEightSuggestions];
              int v21 = [v20 containsObject:v5];

              if (v21) {
                int64_t v9 = 7;
              }
              else {
                int64_t v9 = 0;
              }
            }
          }
        }
      }
    }
  }

  return v9;
}

- (BOOL)isSuggestionReplacementAvailableForSuggestion:(id)a3 inLayout:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(ATXHomeScreenSuggestionClient *)self _layoutTypeOfSuggestion:v6 inLayout:v7];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke;
  v14[3] = &unk_1E5D07938;
  v14[5] = &v15;
  v14[6] = v8;
  v14[4] = self;
  [(_PASQueueLock *)lock runWithLockAcquired:v14];
  id v10 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *((unsigned __int8 *)v16 + 24);
    *(_DWORD *)buf = 67109120;
    int v20 = v11;
    _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: isSuggestionReplacementAvailableForSuggestion: %d", buf, 8u);
  }

  BOOL v12 = *((unsigned char *)v16 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)v3[15];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2;
  v8[3] = &unk_1E5D07910;
  uint64_t v5 = a1[5];
  v8[4] = a1[4];
  id v9 = v3;
  uint64_t v6 = a1[6];
  uint64_t v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  [v4 enumerateObjectsUsingBlock:v8];
}

void __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ([v6 isValidForSuggestionsWidget])
  {
    if ([*(id *)(a1 + 32) _isFallbackSuggestionUsed:v6 guardedData:*(void *)(a1 + 40)])
    {
      id v7 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2_cold_1(v6);
      }
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      int64_t v8 = objc_msgSend(v6, "uiSpecification", 0);
      id v7 = [v8 preferredLayoutConfigs];

      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v7);
            }
            if ([*(id *)(*((void *)&v14 + 1) + 8 * i) applicableLayoutType] == *(void *)(a1 + 56))
            {
              char v13 = __atxlog_handle_home_screen();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
                __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2_cold_2(v6);
              }

              *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
              *a4 = 1;
              goto LABEL_19;
            }
          }
          uint64_t v10 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
    }
  }
  else
  {
    id v7 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2_cold_3(v6);
    }
  }
LABEL_19:
}

- (BOOL)_isFallbackSuggestionUsed:(id)a3 guardedData:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (id *)a4;
  id v6 = [a3 executableSpecification];
  id v7 = [v6 executableObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int64_t v8 = objc_msgSend(v5[16], "allValues", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * i) containsObject:v7])
          {
            LOBYTE(v9) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)unusedFallbackAppSuggestionsForPage:(int64_t)a3
{
  uint64_t v5 = objc_opt_new();
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__ATXHomeScreenSuggestionClient_unusedFallbackAppSuggestionsForPage___block_invoke;
  v9[3] = &unk_1E5D07988;
  int64_t v11 = a3;
  id v7 = v5;
  id v10 = v7;
  [(_PASQueueLock *)lock runWithLockAcquired:v9];

  return v7;
}

void __69__ATXHomeScreenSuggestionClient_unusedFallbackAppSuggestionsForPage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)a2[16];
  id v4 = NSNumber;
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [v4 numberWithInteger:v5];
  int64_t v8 = [v3 objectForKeyedSubscript:v7];

  uint64_t v9 = (void *)v6[15];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __69__ATXHomeScreenSuggestionClient_unusedFallbackAppSuggestionsForPage___block_invoke_2;
  v11[3] = &unk_1E5D07960;
  id v12 = v8;
  id v13 = *(id *)(a1 + 32);
  id v10 = v8;
  [v9 enumerateObjectsUsingBlock:v11];
}

void __69__ATXHomeScreenSuggestionClient_unusedFallbackAppSuggestionsForPage___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 executableSpecification];
  if ([v4 executableType] == 1)
  {

    goto LABEL_4;
  }
  uint64_t v5 = [v3 executableSpecification];
  uint64_t v6 = [v5 executableType];

  if (v6 == 5)
  {
LABEL_4:
    id v7 = [v3 executableSpecification];
    int64_t v8 = [v7 executableObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([*(id *)(a1 + 32) containsObject:v8])
      {
LABEL_19:

        goto LABEL_20;
      }
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v9 = objc_msgSend(v3, "uiSpecification", 0);
      id v10 = [v9 preferredLayoutConfigs];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            if ([*(id *)(*((void *)&v15 + 1) + 8 * i) applicableLayoutType] == 1)
            {
              [*(id *)(a1 + 40) addObject:v3];
              goto LABEL_18;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      id v10 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        __69__ATXHomeScreenSuggestionClient_unusedFallbackAppSuggestionsForPage___block_invoke_2_cold_1(v10);
      }
    }
LABEL_18:

    goto LABEL_19;
  }
LABEL_20:
}

- (void)markFallbackAppSuggestion:(id)a3 asUnusedForPage:(int64_t)a4
{
  id v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__ATXHomeScreenSuggestionClient_markFallbackAppSuggestion_asUnusedForPage___block_invoke;
  v9[3] = &unk_1E5D07988;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v9];
}

void __75__ATXHomeScreenSuggestionClient_markFallbackAppSuggestion_asUnusedForPage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a2 + 128);
  id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  id v4 = [v3 objectForKeyedSubscript:v5];
  [v4 removeObject:*(void *)(a1 + 32)];
}

- (void)markFallbackAppSuggestion:(id)a3 asUsedForPage:(int64_t)a4
{
  id v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__ATXHomeScreenSuggestionClient_markFallbackAppSuggestion_asUsedForPage___block_invoke;
  v9[3] = &unk_1E5D07988;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v9];
}

void __73__ATXHomeScreenSuggestionClient_markFallbackAppSuggestion_asUsedForPage___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = (void *)v8[16];
  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5)
  {
    id v5 = objc_opt_new();
    id v6 = (void *)v8[16];
    id v7 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
  [v5 addObject:*(void *)(a1 + 32)];
}

- (void)didFinishExecutingTappedSuggestion:(id)a3 fromWidget:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __79__ATXHomeScreenSuggestionClient_didFinishExecutingTappedSuggestion_fromWidget___block_invoke;
  v11[3] = &unk_1E5D079B0;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v11];
}

void __79__ATXHomeScreenSuggestionClient_didFinishExecutingTappedSuggestion_fromWidget___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) uuid];
    id v6 = [v5 UUIDString];
    id v7 = [*(id *)(a1 + 32) executableSpecification];
    id v8 = [v7 executableDescription];
    id v9 = (void *)MEMORY[0x1E4F93950];
    id v10 = [*(id *)(a1 + 32) executableSpecification];
    int64_t v11 = objc_msgSend(v9, "stringForExecutableType:", objc_msgSend(v10, "executableType"));
    int v12 = 138543874;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    long long v15 = v8;
    __int16 v16 = 2114;
    long long v17 = v11;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: handling didFinishExecutingTappedSuggestion for suggestion with uuid: %{public}@ executable description: %@ executable type: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 40) + 56) addEngagedSuggestion:*(void *)(a1 + 32) engagementRecordType:1];
  [*(id *)(*(void *)(a1 + 40) + 72) removeActionPredictionNotificationsMatchingSuggestion:*(void *)(a1 + 32) reply:0];
  [*(id *)(a1 + 40) _replaceSuggestionIfNeeded:*(void *)(a1 + 32) fromProactiveWidget:*(void *)(a1 + 48) guardedData:v3];
}

- (void)setIsUserInteractingWithProactiveWidget:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__ATXHomeScreenSuggestionClient_setIsUserInteractingWithProactiveWidget___block_invoke;
  v4[3] = &unk_1E5D079D8;
  BOOL v5 = a3;
  v4[4] = self;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v4];
}

uint64_t __73__ATXHomeScreenSuggestionClient_setIsUserInteractingWithProactiveWidget___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3[32] != *(unsigned char *)(a1 + 40))
  {
    id v6 = v3;
    if (*(unsigned char *)(a1 + 40))
    {
      v3[32] = 1;
      id v3 = (unsigned char *)[*(id *)(a1 + 32) _cancelAndReleaseLayoutUpdateSuppressionTimer:v3];
    }
    else
    {
      v3[32] = 0;
      id v3 = (unsigned char *)[*(id *)(a1 + 32) _startSuppressingSystemInitiatedLayoutUpdateForTimeInterval:v3 leeway:*(double *)(*(void *)(a1 + 32) + 112) guardedData:*(double *)(*(void *)(a1 + 32) + 120)];
    }
    id v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (id)homeScreenPrediction
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = __Block_byref_object_copy__9;
  int v23 = __Block_byref_object_dispose__9;
  id v24 = 0;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__9;
  long long v17 = __Block_byref_object_dispose__9;
  id v18 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__9;
  int64_t v11 = __Block_byref_object_dispose__9;
  id v12 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__ATXHomeScreenSuggestionClient_homeScreenPrediction__block_invoke;
  v6[3] = &unk_1E5D07A00;
  v6[4] = self;
  v6[5] = &v19;
  v6[6] = &v13;
  v6[7] = &v7;
  [(_PASQueueLock *)lock runWithLockAcquired:v6];
  if (v20[5] && v14[5])
  {
    id v3 = [ATXHomeScreenPrediction alloc];
    id v4 = [(ATXHomeScreenPrediction *)v3 initWithBlendingCacheIdentifier:v20[5] widgetSuggestions:v14[5] stacksAffectedByDebugRotation:v8[5]];
  }
  else
  {
    id v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v4;
}

void __53__ATXHomeScreenSuggestionClient_homeScreenPrediction__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = (void *)*((void *)v13 + 17);
  if (!v3)
  {
    [*(id *)(a1 + 32) _readCachedSuggestionsFromDiskAndUpdateGuardedData:v13];
    id v3 = (void *)*((void *)v13 + 17);
  }
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [*((id *)v13 + 14) copy];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = [*((id *)v13 + 18) copy];
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)homeScreenPredictionWithReply:(id)a3
{
  id v4 = a3;
  outputQueue = self->_outputQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__ATXHomeScreenSuggestionClient_homeScreenPredictionWithReply___block_invoke;
  v7[3] = &unk_1E5D064C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(outputQueue, v7);
}

void __63__ATXHomeScreenSuggestionClient_homeScreenPredictionWithReply___block_invoke(uint64_t a1)
{
  v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __63__ATXHomeScreenSuggestionClient_homeScreenPredictionWithReply___block_invoke_cold_1(v2);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) homeScreenPrediction];
  (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);
}

- (void)userDidRemoveSuggestedWidget:(id)a3 fromStackWithIdentifier:(id)a4 prediction:(id)a5
{
}

- (void)chronoServiceProvider:(id)a3 finishedPrewarmingSuggestions:(id)a4
{
  id v5 = a4;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__ATXHomeScreenSuggestionClient_chronoServiceProvider_finishedPrewarmingSuggestions___block_invoke;
  v8[3] = &unk_1E5D07850;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v8];
}

void __85__ATXHomeScreenSuggestionClient_chronoServiceProvider_finishedPrewarmingSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: chornoServiceProvider finished preparing suggestions, starting suggestion update.", v5, 2u);
  }

  [*(id *)(a1 + 32) _updateKnownWidgetUniqueIdsIfNecessaryWithGuardedData:v3];
  [*(id *)(a1 + 32) _updateGuardedData:v3 withCachedSuggestions:*(void *)(a1 + 40) updateProactiveWidgetLayoutsOnly:0];
}

- (void)chronoServiceProvider:(id)a3 reloadDidCompleteForWidget:(id)a4 success:(BOOL)a5 widgetIsReadyForDisplay:(BOOL)a6 error:(id)a7
{
  id v11 = a4;
  id v12 = a7;
  lock = self->_lock;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __120__ATXHomeScreenSuggestionClient_chronoServiceProvider_reloadDidCompleteForWidget_success_widgetIsReadyForDisplay_error___block_invoke;
  v16[3] = &unk_1E5D07A28;
  BOOL v19 = a5;
  id v17 = v11;
  id v18 = v12;
  BOOL v20 = a6;
  id v14 = v12;
  id v15 = v11;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v16];
}

void __120__ATXHomeScreenSuggestionClient_chronoServiceProvider_reloadDidCompleteForWidget_success_widgetIsReadyForDisplay_error___block_invoke(uint64_t a1, void *a2)
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v3 = NSString;
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 extensionIdentity];
  id v7 = [v6 extensionBundleIdentifier];
  id v8 = [*(id *)(a1 + 32) kind];
  id v9 = [v3 stringWithFormat:@"%@:%@", v7, v8];

  v16[0] = @"reloadDidSuccess";
  uint64_t v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v17[0] = v10;
  v17[1] = v9;
  v16[1] = @"widget";
  v16[2] = @"errorCode";
  id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
  v17[2] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  AnalyticsSendEvent();
  id v13 = (void *)v5[23];

  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = [MEMORY[0x1E4F1C9C8] now];
  [v13 recordWidgetReloadForSuggestion:v14 date:v15 readyForDisplay:*(unsigned __int8 *)(a1 + 49)];
}

- (void)_updateLoggerStacksToStackSuggestionsFromHomeScreenCachedSuggestions:(id)a3
{
  id v4 = +[ATXHomeScreenStackSuggestion stackSuggestionsFromCachedSuggestions:a3];
  id v5 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __102__ATXHomeScreenSuggestionClient__updateLoggerStacksToStackSuggestionsFromHomeScreenCachedSuggestions___block_invoke;
  v11[3] = &unk_1E5D07A50;
  id v6 = v5;
  id v12 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v11];
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__ATXHomeScreenSuggestionClient__updateLoggerStacksToStackSuggestionsFromHomeScreenCachedSuggestions___block_invoke_2;
  v9[3] = &unk_1E5D07828;
  id v10 = v6;
  id v8 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v9];
}

void __102__ATXHomeScreenSuggestionClient__updateLoggerStacksToStackSuggestionsFromHomeScreenCachedSuggestions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 suggestedWidgets];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = objc_msgSend(v6, "suggestedWidgets", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(a1 + 32);
          id v15 = [*(id *)(*((void *)&v16 + 1) + 8 * v13) widgetUniqueId];
          [v14 setObject:v5 forKeyedSubscript:v15];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

uint64_t __102__ATXHomeScreenSuggestionClient__updateLoggerStacksToStackSuggestionsFromHomeScreenCachedSuggestions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) notifySuggestedWidgetsToStacksChanged:*(void *)(a1 + 32)];
}

- (void)blendingLayerDidUpdateHomeScreenCachedSuggestions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: received update from duetexpertd", buf, 2u);
  }

  [(ATXChronoServicesProvider *)self->_chronoServicesProvider resetToPrewarmWidgetsInSuggestions:v7];
  [(ATXHomeScreenSuggestionClient *)self _updateLoggerStacksToStackSuggestionsFromHomeScreenCachedSuggestions:v7];

  outputQueue = self->_outputQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__ATXHomeScreenSuggestionClient_blendingLayerDidUpdateHomeScreenCachedSuggestions_completion___block_invoke;
  block[3] = &unk_1E5D07A78;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(outputQueue, block);
}

uint64_t __94__ATXHomeScreenSuggestionClient_blendingLayerDidUpdateHomeScreenCachedSuggestions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCurrentSuggestionsWidgetAndAppPredictionPanelLayoutsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __110__ATXHomeScreenSuggestionClient_getCurrentSuggestionsWidgetAndAppPredictionPanelLayoutsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5D07AA0;
  id v8 = v4;
  id v6 = v4;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v7];
}

uint64_t __110__ATXHomeScreenSuggestionClient_getCurrentSuggestionsWidgetAndAppPredictionPanelLayoutsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)synchronouslyRelinquishOnDiskResourcesAheadOfDataDeletionWithCompletionHandler:(id)a3
{
  lock = self->_lock;
  id v4 = (void (**)(id, void))a3;
  [(_PASQueueLock *)lock runWithLockAcquired:&__block_literal_global_153];
  v4[2](v4, 0);
}

void __112__ATXHomeScreenSuggestionClient_synchronouslyRelinquishOnDiskResourcesAheadOfDataDeletionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)a2[23];
  id v4 = a2;
  [v3 close];
  id v5 = (id)a2[23];
  a2[23] = 0;
}

- (void)forceDebugRotationForStack:(id)a3 extensionBundleId:(id)a4 kind:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  lock = self->_lock;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__ATXHomeScreenSuggestionClient_forceDebugRotationForStack_extensionBundleId_kind_completion___block_invoke;
  v19[3] = &unk_1E5D07AC8;
  id v22 = v12;
  id v23 = v13;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v19];
}

void __94__ATXHomeScreenSuggestionClient_forceDebugRotationForStack_extensionBundleId_kind_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  id v65 = 0;
  id v5 = [v4 loadHomeScreenAndTodayPageConfigurationsWithError:&v65];
  id v6 = v65;
  if (!v6)
  {
    __int16 v48 = v5;
    long long v49 = v3;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v61 objects:v76 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v51 = *(void *)v62;
      id v52 = 0;
      obuint64_t j = v8;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v62 != v51) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v13 = [v12 stacks];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v57 objects:v75 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v58;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v58 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = *(void **)(*((void *)&v57 + 1) + 8 * j);
                long long v19 = [v18 identifier];
                int v20 = [v19 isEqualToString:*(void *)(a1 + 40)];

                if (v20)
                {
                  id v21 = v18;

                  id v52 = v21;
                  goto LABEL_18;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v57 objects:v75 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
LABEL_18:
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v61 objects:v76 count:16];
      }
      while (v10);

      if (v52)
      {
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v22 = [v52 widgets];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v72 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v54;
LABEL_23:
          uint64_t v26 = 0;
          while (1)
          {
            if (*(void *)v54 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void **)(*((void *)&v53 + 1) + 8 * v26);
            uint64_t v28 = [v27 extensionBundleId];
            if ([v28 isEqualToString:*(void *)(a1 + 48)])
            {
              uint64_t v29 = [v27 widgetKind];
              char v30 = [v29 isEqualToString:*(void *)(a1 + 56)];

              if (v30)
              {
                id v34 = v27;

                uint64_t v31 = v52;
                if (v34) {
                  goto LABEL_37;
                }
                goto LABEL_36;
              }
            }
            else
            {
            }
            if (v24 == ++v26)
            {
              uint64_t v24 = [v22 countByEnumeratingWithState:&v53 objects:v72 count:16];
              if (v24) {
                goto LABEL_23;
              }
              break;
            }
          }
        }

        uint64_t v31 = v52;
LABEL_36:
        id v34 = (id)objc_opt_new();
        [v34 setExtensionBundleId:*(void *)(a1 + 48)];
        [v34 setWidgetKind:*(void *)(a1 + 56)];
        objc_msgSend(v34, "setSize:", objc_msgSend(v31, "stackLayoutSize"));
LABEL_37:
        uint64_t v35 = (void *)[v49[14] mutableCopy];
        uint64_t v36 = [ATXHomeScreenStackSuggestion alloc];
        uint64_t v37 = *(void *)(a1 + 40);
        long long v38 = [v35 objectForKeyedSubscript:v37];
        long long v39 = [v38 suggestedWidgets];
        id v40 = [(ATXHomeScreenStackSuggestion *)v36 initForDebuggingWithStackIdentifier:v37 topWidget:v34 suggestedWidgets:v39];

        [v35 setObject:v40 forKeyedSubscript:*(void *)(a1 + 40)];
        objc_storeStrong(v49 + 14, v35);
        id v41 = v49[18];
        if (!v41)
        {
          uint64_t v42 = objc_opt_new();
          id v43 = v49[18];
          v49[18] = (id)v42;

          id v41 = v49[18];
        }
        [v41 addObject:*(void *)(a1 + 40)];
        long long v44 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v45 = *(void *)(a1 + 40);
          uint64_t v46 = *(void *)(a1 + 48);
          uint64_t v47 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 138412802;
          uint64_t v67 = v45;
          __int16 v68 = 2112;
          uint64_t v69 = v46;
          __int16 v70 = 2112;
          uint64_t v71 = v47;
          _os_log_impl(&dword_1A790D000, v44, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: forcing debug rotation for stack %@, widget %@, kind %@. Notifying observers.", buf, 0x20u);
        }

        id v3 = v49;
        [*(id *)(a1 + 32) _notifyObserversAboutSuggestionRefreshWithGuardedData:v49];
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

        id v7 = 0;
        goto LABEL_42;
      }
    }
    else
    {
    }
    id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v73 = *MEMORY[0x1E4F28568];
    v74 = @"Specified stack not found in home screen config.";
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    id v7 = (void *)[v32 initWithDomain:@"ATXHomeScreenSuggestionClientErrorDomain" code:-1 userInfo:v33];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v3 = v49;
LABEL_42:
    id v5 = v48;
    goto LABEL_43;
  }
  id v7 = v6;
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_43:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 valueForEntitlement:@"com.apple.proactive.HomeScreenSuggestion.xpc"];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0 && ([v8 BOOLValue] & 1) != 0)
  {
    uint64_t v9 = ATXHomeScreenSuggestionServerXPCInterface();
    [v7 setExportedInterface:v9];

    [v7 setExportedObject:self];
    [v7 setInterruptionHandler:&__block_literal_global_165];
    objc_initWeak(&location, self);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __68__ATXHomeScreenSuggestionClient_listener_shouldAcceptNewConnection___block_invoke_166;
    id v18 = &unk_1E5D05748;
    objc_copyWeak(&v19, &location);
    [v7 setInvalidationHandler:&v15];
    uint64_t v10 = ATXHomeScreenSuggestionClientXPCInterface();
    objc_msgSend(v7, "setRemoteObjectInterface:", v10, v15, v16, v17, v18);

    [(ATXHomeScreenSuggestionClient *)self setXpcConnection:v7];
    [v7 resume];
    id v11 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v7;
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: accepts XPC connection: %{public}@", buf, 0xCu);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    BOOL v12 = 1;
  }
  else
  {
    id v13 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXHomeScreenSuggestionClient listener:shouldAcceptNewConnection:]();
    }

    BOOL v12 = 0;
  }

  return v12;
}

void __68__ATXHomeScreenSuggestionClient_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: XPC connection interrupted.", v1, 2u);
  }
}

void __68__ATXHomeScreenSuggestionClient_listener_shouldAcceptNewConnection___block_invoke_166(uint64_t a1)
{
  v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: XPC connection invalidated.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setXpcConnection:0];
}

- (void)logWidgetAddedFeaturesInCoreAnalytics:(id)a3 rankOfWidgetInGallery:(unint64_t)a4 galleryItems:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = [(ATXHomeScreenSuggestionClient *)self xpcConnection];
  uint64_t v10 = [v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_168];
  [v10 logWidgetAddedFeaturesInCoreAnalytics:v9 rankOfWidgetInGallery:a4 galleryItems:v8];
}

void __106__ATXHomeScreenSuggestionClient_logWidgetAddedFeaturesInCoreAnalytics_rankOfWidgetInGallery_galleryItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __106__ATXHomeScreenSuggestionClient_logWidgetAddedFeaturesInCoreAnalytics_rankOfWidgetInGallery_galleryItems___block_invoke_cold_1();
  }
}

- (BOOL)hasWidgetBeenSeen:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__ATXHomeScreenSuggestionClient_hasWidgetBeenSeen___block_invoke;
  v8[3] = &unk_1E5D07AF0;
  uint64_t v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __51__ATXHomeScreenSuggestionClient_hasWidgetBeenSeen___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a2 + 184) mostRecentEngagementOfWidget:*(void *)(a1 + 32) ofType:3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 != 0;
}

- (BOOL)hasWidgetBeenTapped:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__ATXHomeScreenSuggestionClient_hasWidgetBeenTapped___block_invoke;
  v8[3] = &unk_1E5D07AF0;
  uint64_t v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __53__ATXHomeScreenSuggestionClient_hasWidgetBeenTapped___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a2 + 184) mostRecentEngagementOfWidget:*(void *)(a1 + 32) ofType:1];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 != 0;
}

- (void)significantDwellDetectedForWidget:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __72__ATXHomeScreenSuggestionClient_significantDwellDetectedForWidget_date___block_invoke;
  v11[3] = &unk_1E5D07850;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v11];
}

uint64_t __72__ATXHomeScreenSuggestionClient_significantDwellDetectedForWidget_date___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 184) updateMostRecentSignificantDwellOfWidget:*(void *)(a1 + 32) date:*(void *)(a1 + 40)];
}

- (unint64_t)pageIndexOfAppPredictionPanelWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__ATXHomeScreenSuggestionClient_pageIndexOfAppPredictionPanelWithIdentifier___block_invoke;
  v9[3] = &unk_1E5D07B18;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(_PASQueueLock *)lock runWithLockAcquired:v9];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __77__ATXHomeScreenSuggestionClient_pageIndexOfAppPredictionPanelWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v7 = a2;
  id v3 = [v7[10] objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v4 = v3;
  if (v3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 unsignedIntegerValue];
  }
  else
  {
    id v5 = objc_opt_new();
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 pageIndexOfAppPredictionPanelWithIdentifier:*(void *)(a1 + 32)];
    id v6 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    [v7[10] setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

- (void)loadHomeScreenPageConfigurationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__ATXHomeScreenSuggestionClient_loadHomeScreenPageConfigurationsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5D07B40;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v7];
}

void __87__ATXHomeScreenSuggestionClient_loadHomeScreenPageConfigurationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v5 = 0;
  id v3 = [v2 loadHomeScreenPageConfigurationsWithError:&v5];
  id v4 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)loadHomeScreenPageConfigurationsWithError:(id *)a3
{
  return [(ATXHomeScreenConfigCache *)self->_homeScreenConfigCache loadHomeScreenPageConfigurationsWithError:a3];
}

- (void)writeHomeScreenPageConfigurations:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __85__ATXHomeScreenSuggestionClient_writeHomeScreenPageConfigurations_completionHandler___block_invoke;
  v11[3] = &unk_1E5D078E8;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v11];
}

uint64_t __85__ATXHomeScreenSuggestionClient_writeHomeScreenPageConfigurations_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _writeHomeScreenPageConfigurations:*(void *)(a1 + 40) guardedData:a2 completionHandler:*(void *)(a1 + 48)];
}

- (void)_writeHomeScreenPageConfigurations:(id)a3 guardedData:(id)a4 completionHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    uint64_t v11 = [v8 copy];
    id v12 = (void *)*((void *)v9 + 19);
    *((void *)v9 + 19) = v11;

    v10[2](v10, 0);
  }
  else
  {
    homeScreenConfigCache = self->_homeScreenConfigCache;
    id v35 = 0;
    BOOL v14 = [(ATXHomeScreenConfigCache *)homeScreenConfigCache writeHomeScreenPageConfigurations:v8 error:&v35];
    id v15 = v35;
    uint64_t v16 = v15;
    if (v14)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v17 = v8;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v32 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if ((objc_msgSend(v22, "isHidden", (void)v31) & 1) == 0)
            {
              uint64_t v23 = [v22 stacks];
              [(ATXHomeScreenSuggestionClient *)self _recordSuggestedWidgetIfNecessaryInStacks:v23 guardedData:v9];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v19);
      }

      [MEMORY[0x1E4F93940] refreshBlendingLayerWithReason:@"Wrote home screen page configurations"];
      *((unsigned char *)v9 + 48) = 1;
      [*((id *)v9 + 24) homeScreenOrTodayPageConfigDidChange];
      id v24 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v25 = objc_msgSend(v17, "_pas_mappedArrayWithTransform:", &__block_literal_global_175);
      uint64_t v26 = (void *)v25;
      if (v25) {
        uint64_t v27 = v25;
      }
      else {
        uint64_t v27 = MEMORY[0x1E4F1CBF0];
      }
      uint64_t v28 = objc_msgSend(v24, "initWithArray:", v27, (void)v31);

      uint64_t v29 = objc_opt_new();
      [v29 removePagesWithIdentifiersNotInSet:v28];
      v10[2](v10, 0);
    }
    else
    {
      if (v15)
      {
        char v30 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[ATXHomeScreenSuggestionClient _writeHomeScreenPageConfigurations:guardedData:completionHandler:]();
        }
      }
      ((void (**)(id, void *))v10)[2](v10, v16);
    }
  }
}

uint64_t __98__ATXHomeScreenSuggestionClient__writeHomeScreenPageConfigurations_guardedData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (void)writeDockAppList:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __68__ATXHomeScreenSuggestionClient_writeDockAppList_completionHandler___block_invoke;
  v11[3] = &unk_1E5D078E8;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v11];
}

uint64_t __68__ATXHomeScreenSuggestionClient_writeDockAppList_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _writeDockAppList:*(void *)(a1 + 40) guardedData:a2 completionHandler:*(void *)(a1 + 48)];
}

- (void)_writeDockAppList:(id)a3 guardedData:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v10 = (void *)MEMORY[0x1E4F93B10];
  id v11 = a3;
  if ([v10 isClassCLocked])
  {
    uint64_t v12 = [v11 copy];

    id v13 = (void *)*((void *)v8 + 20);
    *((void *)v8 + 20) = v12;

    v9[2](v9, 0);
  }
  else
  {
    homeScreenConfigCache = self->_homeScreenConfigCache;
    id v20 = 0;
    BOOL v15 = [(ATXHomeScreenConfigCache *)homeScreenConfigCache writeDockAppList:v11 error:&v20];

    id v16 = v20;
    id v17 = v16;
    if (v15)
    {
      [MEMORY[0x1E4F93940] refreshBlendingLayerWithReason:@"Wrote Dock apps"];
      [*((id *)v8 + 24) dockAppListDidChange];
      id v18 = 0;
    }
    else
    {
      id v18 = v16;
      if (v16)
      {
        uint64_t v19 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[ATXHomeScreenSuggestionClient _writeDockAppList:guardedData:completionHandler:]();
        }

        id v18 = v17;
      }
    }
    ((void (**)(id, id))v9)[2](v9, v18);
  }
}

- (void)writeTodayPageStacks:(id)a3 appPredictionPanels:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__ATXHomeScreenSuggestionClient_writeTodayPageStacks_appPredictionPanels_completionHandler___block_invoke;
  v15[3] = &unk_1E5D07B88;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v15];
}

uint64_t __92__ATXHomeScreenSuggestionClient_writeTodayPageStacks_appPredictionPanels_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _writeTodayPageStacks:*(void *)(a1 + 40) appPredictionPanels:*(void *)(a1 + 48) guardedData:a2 completionHandler:*(void *)(a1 + 56)];
}

- (void)_writeTodayPageStacks:(id)a3 appPredictionPanels:(id)a4 guardedData:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    uint64_t v14 = [v10 copy];
    BOOL v15 = (void *)*((void *)v12 + 21);
    *((void *)v12 + 21) = v14;

    uint64_t v16 = [v11 copy];
    id v17 = (void *)*((void *)v12 + 22);
    *((void *)v12 + 22) = v16;

    v13[2](v13, 0);
  }
  else
  {
    homeScreenConfigCache = self->_homeScreenConfigCache;
    id v24 = 0;
    BOOL v19 = [(ATXHomeScreenConfigCache *)homeScreenConfigCache writeTodayPageStacks:v10 appPredictionPanels:v11 error:&v24];
    id v20 = v24;
    id v21 = v20;
    if (v19)
    {
      [(ATXHomeScreenSuggestionClient *)self _recordSuggestedWidgetIfNecessaryInStacks:v10 guardedData:v12];
      [MEMORY[0x1E4F93940] refreshBlendingLayerWithReason:@"Wrote Today page configuration"];
      id v22 = objc_opt_new();
      [v22 setPageIndex:20000];
      [v22 setStacks:v10];
      [v22 setPanels:v11];
      *((unsigned char *)v12 + 64) = 1;
      [*((id *)v12 + 24) homeScreenOrTodayPageConfigDidChange];
      v13[2](v13, 0);
    }
    else
    {
      if (v20)
      {
        uint64_t v23 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[ATXHomeScreenSuggestionClient _writeTodayPageStacks:appPredictionPanels:guardedData:completionHandler:]();
        }
      }
      ((void (**)(id, void *))v13)[2](v13, v21);
    }
  }
}

- (void)_recordSuggestedWidgetIfNecessaryInStacks:(id)a3 guardedData:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v5;
  uint64_t v21 = [v5 countByEnumeratingWithState:&v26 objects:v37 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v9 = [v8 widgets];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v36 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              if ([v14 isSuggestedWidget])
              {
                BOOL v15 = [v14 widgetUniqueId];

                if (v15)
                {
                  uint64_t v16 = (void *)v6[23];
                  id v17 = [v14 widgetUniqueId];
                  [v16 recordSuggestedWidgetUniqueIdIfNotExist:v17];
                }
                else
                {
                  id v17 = __atxlog_handle_home_screen();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
                  {
                    id v18 = [v8 identifier];
                    *(_DWORD *)buf = 136315650;
                    long long v31 = "-[ATXHomeScreenSuggestionClient _recordSuggestedWidgetIfNecessaryInStacks:guardedData:]";
                    __int16 v32 = 2112;
                    long long v33 = v14;
                    __int16 v34 = 2114;
                    id v35 = v18;
                    _os_log_fault_impl(&dword_1A790D000, v17, OS_LOG_TYPE_FAULT, "%s: Suggested widget %@ in stack %{public}@ does not have widgetUniqueId", buf, 0x20u);
                  }
                }
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v36 count:16];
          }
          while (v11);
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v37 count:16];
    }
    while (v21);
  }
}

- (void)logWidgetDidAppear:(id)a3 stackId:(id)a4 prediction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__ATXHomeScreenSuggestionClient_logWidgetDidAppear_stackId_prediction___block_invoke;
  v15[3] = &unk_1E5D07BB0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v15];
}

void __71__ATXHomeScreenSuggestionClient_logWidgetDidAppear_stackId_prediction___block_invoke(uint64_t *a1, void *a2)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 64);
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a2;
  id v7 = [v5 now];
  [v4 widgetDidAppear:v3 date:v7];

  id v8 = (void *)v6[23];
  uint64_t v9 = a1[5];
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  [v8 addEngagementRecordForWidget:v9 date:v10 engagementType:3];

  uint64_t v11 = (void *)v6[24];
  [v11 logWidgetDidAppear:a1[5] stackId:a1[6] prediction:a1[7]];
  id v12 = [(id)a1[5] widgetUniqueId];
  if (v12)
  {
    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v14 = a1[4];
    v17[0] = @"uniqueID";
    v17[1] = @"stackID";
    uint64_t v15 = a1[6];
    v18[0] = v12;
    v18[1] = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    [v13 postNotificationName:@"ATXHomeScreenSuggestionClientTopWidgetDidAppearNotification" object:v14 userInfo:v16];
  }
}

- (void)logWidgetDidDisappear:(id)a3 stackId:(id)a4 prediction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__ATXHomeScreenSuggestionClient_logWidgetDidDisappear_stackId_prediction___block_invoke;
  v15[3] = &unk_1E5D07BB0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v15];
}

void __74__ATXHomeScreenSuggestionClient_logWidgetDidDisappear_stackId_prediction___block_invoke(uint64_t *a1, void *a2)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 64);
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a2;
  id v7 = [v5 now];
  [v4 widgetDidDisappear:v3 date:v7];

  id v8 = (void *)v6[24];
  [v8 logWidgetDidDisappear:a1[5] stackId:a1[6] prediction:a1[7]];
  id v9 = [(id)a1[5] widgetUniqueId];
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v11 = a1[4];
    v14[0] = @"uniqueID";
    v14[1] = @"stackID";
    uint64_t v12 = a1[6];
    v15[0] = v9;
    v15[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    [v10 postNotificationName:@"ATXHomeScreenSuggestionClientTopWidgetDidDisappearNotification" object:v11 userInfo:v13];
  }
}

- (void)logStackVisibilityChanged:(id)a3 visibleRect:(CGRect)a4 topWidget:(id)a5 prediction:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  lock = self->_lock;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__ATXHomeScreenSuggestionClient_logStackVisibilityChanged_visibleRect_topWidget_prediction___block_invoke;
  v20[3] = &unk_1E5D07BD8;
  CGFloat v24 = x;
  CGFloat v25 = y;
  CGFloat v26 = width;
  CGFloat v27 = height;
  id v21 = v13;
  id v22 = v14;
  id v23 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v20];
}

uint64_t __92__ATXHomeScreenSuggestionClient_logStackVisibilityChanged_visibleRect_topWidget_prediction___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logStackVisibilityChanged:visibleRect:topWidget:prediction:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)logStackDidDisappear:(id)a3 topWidget:(id)a4 prediction:(id)a5
{
  if (a4)
  {
    [(ATXHomeScreenSuggestionClient *)self logWidgetDidDisappear:a4 stackId:a3 prediction:a5];
  }
  else
  {
    id v6 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[ATXHomeScreenSuggestionClient logStackDidDisappear:topWidget:prediction:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)logStackDidAppear:(id)a3 topWidget:(id)a4 prediction:(id)a5
{
  if (a4)
  {
    [(ATXHomeScreenSuggestionClient *)self logWidgetDidAppear:a4 stackId:a3 prediction:a5];
  }
  else
  {
    id v6 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[ATXHomeScreenSuggestionClient logStackDidAppear:topWidget:prediction:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)logHomeScreenDidDisappearWithReason:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__ATXHomeScreenSuggestionClient_logHomeScreenDidDisappearWithReason___block_invoke;
  v7[3] = &unk_1E5D07828;
  id v8 = v4;
  id v6 = v4;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v7];
}

uint64_t __69__ATXHomeScreenSuggestionClient_logHomeScreenDidDisappearWithReason___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logHomeScreenDidDisappearWithReason:*(void *)(a1 + 32)];
}

- (void)logSpecialPageDidAppear:(unint64_t)a3 widgetsByStackId:(id)a4 prediction:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__ATXHomeScreenSuggestionClient_logSpecialPageDidAppear_widgetsByStackId_prediction___block_invoke;
  v13[3] = &unk_1E5D07C00;
  id v15 = v9;
  unint64_t v16 = a3;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v13];
}

uint64_t __85__ATXHomeScreenSuggestionClient_logSpecialPageDidAppear_widgetsByStackId_prediction___block_invoke(void *a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logSpecialPageDidAppear:a1[6] widgetsByStackId:a1[4] prediction:a1[5]];
}

- (void)logSpecialPageDidDisappear:(unint64_t)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__ATXHomeScreenSuggestionClient_logSpecialPageDidDisappear___block_invoke;
  v4[3] = &__block_descriptor_40_e50_v16__0__ATXHomeScreenSuggestionClientGuardedData_8l;
  v4[4] = a3;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v4];
}

uint64_t __60__ATXHomeScreenSuggestionClient_logSpecialPageDidDisappear___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logSpecialPageDidDisappear:*(void *)(a1 + 32)];
}

- (void)logStackStatusDidChange:(id)a3 widgetOnTop:(id)a4 reason:(unint64_t)a5 prediction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  lock = self->_lock;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __87__ATXHomeScreenSuggestionClient_logStackStatusDidChange_widgetOnTop_reason_prediction___block_invoke;
  v17[3] = &unk_1E5D07C48;
  id v20 = v11;
  unint64_t v21 = a5;
  void v17[4] = self;
  id v18 = v12;
  id v19 = v10;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v17];
}

void __87__ATXHomeScreenSuggestionClient_logStackStatusDidChange_widgetOnTop_reason_prediction___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  unint64_t v3 = *(void *)(a1 + 64);
  if (v3 <= 8 && ((1 << v3) & 0x182) != 0)
  {
    [*(id *)(a1 + 32) startSuppressingRotationForTimeInterval:*(double *)(*(void *)(a1 + 32) + 104) leeway:*(double *)(*(void *)(a1 + 32) + 120)];
    unint64_t v3 = *(void *)(a1 + 64);
  }
  uint64_t v5 = [*(id *)(a1 + 40) stacksAffectedByDebugRotation];
  int v6 = [v5 containsObject:*(void *)(a1 + 48)];

  if (v6) {
    uint64_t v7 = 9;
  }
  else {
    uint64_t v7 = v3;
  }
  [v8[24] logStackStatusDidChange:*(void *)(a1 + 48) widgetOnTop:*(void *)(a1 + 56) reason:v7 prediction:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _alertUserIfNeededOfStackChange:*(void *)(a1 + 48) widgetOnTop:*(void *)(a1 + 56) reason:v7];
}

- (void)logStackDidTap:(id)a3 engagedUrl:(id)a4 widgetOnTop:(id)a5 prediction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  lock = self->_lock;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __82__ATXHomeScreenSuggestionClient_logStackDidTap_engagedUrl_widgetOnTop_prediction___block_invoke;
  v19[3] = &unk_1E5D07BB0;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v19];
}

uint64_t __82__ATXHomeScreenSuggestionClient_logStackDidTap_engagedUrl_widgetOnTop_prediction___block_invoke(void *a1, void *a2)
{
  unint64_t v3 = (void *)a2[23];
  uint64_t v4 = a1[4];
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
  int v6 = a2;
  uint64_t v7 = [v5 now];
  [v3 updateMostRecentTapOfWidget:v4 date:v7];

  id v8 = (void *)v6[24];
  uint64_t v10 = a1[4];
  uint64_t v9 = a1[5];
  uint64_t v11 = a1[6];
  uint64_t v12 = a1[7];

  return [v8 logStackDidTap:v9 engagedUrl:v11 widgetOnTop:v10 prediction:v12];
}

- (void)logStackDidTap:(id)a3 widgetOnTop:(id)a4 prediction:(id)a5
{
}

- (void)logSupplementaryActionInContextMenu:(unint64_t)a3 stackId:(id)a4 widgetOnTop:(id)a5 prediction:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  lock = self->_lock;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __100__ATXHomeScreenSuggestionClient_logSupplementaryActionInContextMenu_stackId_widgetOnTop_prediction___block_invoke;
  v17[3] = &unk_1E5D07C48;
  id v20 = v12;
  unint64_t v21 = a3;
  void v17[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v17];
}

void __100__ATXHomeScreenSuggestionClient_logSupplementaryActionInContextMenu_stackId_widgetOnTop_prediction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __100__ATXHomeScreenSuggestionClient_logSupplementaryActionInContextMenu_stackId_widgetOnTop_prediction___block_invoke_2;
  v30[3] = &unk_1E5D05300;
  v30[4] = *(void *)(a1 + 32);
  uint64_t v4 = (void (**)(void))MEMORY[0x1AD0D3E40](v30);
  uint64_t v5 = *(void *)(a1 + 64);
  switch(v5)
  {
    case 3:
LABEL_7:
      v4[2](v4);
      break;
    case 2:
      id v14 = [*(id *)(a1 + 40) extensionBundleId];
      int v15 = [v14 isEqualToString:*MEMORY[0x1E4F4B5F8]];

      if (v15)
      {
        id v16 = (void *)*((void *)v3 + 12);
        id v17 = [*(id *)(a1 + 40) widgetUniqueId];
        id v18 = [v16 objectForKeyedSubscript:v17];

        if (v18)
        {
          id v19 = [v18 minSuggestionListInLayout];
          [*(id *)(a1 + 32) _dismissSuggestions:v19 guardedData:v3 fromSuggestionsWidget:*(void *)(a1 + 40) dismissFromAllUIs:0 duration:604800.0];
        }
      }
      id v20 = [*(id *)(a1 + 40) appBundleId];
      if ([v20 length])
      {
        unint64_t v21 = (objc_class *)MEMORY[0x1E4F1CA80];
        id v22 = v20;
        id v23 = [v21 alloc];
        CGFloat v24 = (void *)CFPreferencesCopyAppValue(@"SBSearchDisabledShortcuts", @"com.apple.spotlightui");
        CGFloat v25 = v24;
        if (v24) {
          id v26 = v24;
        }
        else {
          id v26 = (id)objc_opt_new();
        }
        CGFloat v27 = v26;

        long long v28 = (void *)[v23 initWithArray:v27];
        [v28 addObject:v22];

        CFPreferencesSetAppValue(@"SBSearchDisabledShortcuts", (CFPropertyListRef)[v28 allObjects], @"com.apple.spotlightui");
        CFPreferencesSynchronize(@"com.apple.spotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.spotlightui.prefschanged", 0, 0, 1u);
      }
      v4[2](v4);

      break;
    case 1:
      int v6 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [*(id *)(a1 + 40) extensionBundleId];
        uint64_t v8 = *((void *)v3 + 25);
        *(_DWORD *)buf = 138412546;
        __int16 v32 = v7;
        __int16 v33 = 2048;
        uint64_t v34 = v8;
        _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "Recording dismiss once for %@ with widget dismiss manager: %p", buf, 0x16u);
      }
      uint64_t v9 = (void *)*((void *)v3 + 25);
      id v10 = [*(id *)(a1 + 40) extensionBundleId];
      id v11 = [*(id *)(a1 + 40) widgetKind];
      id v12 = [*(id *)(a1 + 40) intent];
      id v13 = [MEMORY[0x1E4F1C9C8] now];
      [v9 userDidDismissSuggestionForWidget:v10 kind:v11 intent:v12 atDate:v13 duration:0.0];

      goto LABEL_7;
  }
  [*((id *)v3 + 24) logSupplementaryActionInContextMenu:*(void *)(a1 + 64) stackId:*(void *)(a1 + 48) widgetOnTop:*(void *)(a1 + 40) prediction:*(void *)(a1 + 56)];
}

uint64_t __100__ATXHomeScreenSuggestionClient_logSupplementaryActionInContextMenu_stackId_widgetOnTop_prediction___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) startSuppressingRotationForTimeInterval:*(double *)(*(void *)(a1 + 32) + 104) leeway:*(double *)(*(void *)(a1 + 32) + 120)];
}

- (void)logUserDidChangeStackConfiguration:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__ATXHomeScreenSuggestionClient_logUserDidChangeStackConfiguration___block_invoke;
  v7[3] = &unk_1E5D07828;
  id v8 = v4;
  id v6 = v4;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v7];
}

uint64_t __68__ATXHomeScreenSuggestionClient_logUserDidChangeStackConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logUserDidChangeStackConfiguration:*(void *)(a1 + 32)];
}

- (void)logUserDidAddApp:(id)a3 page:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __55__ATXHomeScreenSuggestionClient_logUserDidAddApp_page___block_invoke;
  v11[3] = &unk_1E5D07850;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v11];
}

uint64_t __55__ATXHomeScreenSuggestionClient_logUserDidAddApp_page___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logUserDidAddApp:*(void *)(a1 + 32) page:*(void *)(a1 + 40)];
}

- (void)logUserDidRemoveApp:(id)a3 page:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __58__ATXHomeScreenSuggestionClient_logUserDidRemoveApp_page___block_invoke;
  v11[3] = &unk_1E5D07850;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v11];
}

uint64_t __58__ATXHomeScreenSuggestionClient_logUserDidRemoveApp_page___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logUserDidRemoveApp:*(void *)(a1 + 32) page:*(void *)(a1 + 40)];
}

- (void)logUserDidAddPinnedWidget:(id)a3 page:(id)a4 defaultsComparator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__ATXHomeScreenSuggestionClient_logUserDidAddPinnedWidget_page_defaultsComparator___block_invoke;
  void v15[3] = &unk_1E5D079B0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v15];
}

uint64_t __83__ATXHomeScreenSuggestionClient_logUserDidAddPinnedWidget_page_defaultsComparator___block_invoke(void *a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logUserDidAddPinnedWidget:a1[4] page:a1[5] defaultsComparator:a1[6]];
}

- (void)logUserDidDeletePinnedWidget:(id)a3 stackLocation:(unint64_t)a4 page:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__ATXHomeScreenSuggestionClient_logUserDidDeletePinnedWidget_stackLocation_page___block_invoke;
  v13[3] = &unk_1E5D07C00;
  id v15 = v9;
  unint64_t v16 = a4;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v13];
}

uint64_t __81__ATXHomeScreenSuggestionClient_logUserDidDeletePinnedWidget_stackLocation_page___block_invoke(void *a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logUserDidDeletePinnedWidget:a1[4] stackLocation:a1[6] page:a1[5]];
}

- (void)logUserDidAddWidgetToStack:(id)a3 stackIdentifier:(id)a4 isSuggestion:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__ATXHomeScreenSuggestionClient_logUserDidAddWidgetToStack_stackIdentifier_isSuggestion___block_invoke;
  v13[3] = &unk_1E5D07C70;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v13];
}

uint64_t __89__ATXHomeScreenSuggestionClient_logUserDidAddWidgetToStack_stackIdentifier_isSuggestion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logUserDidAddWidgetToStack:*(void *)(a1 + 32) stackIdentifier:*(void *)(a1 + 40) isSuggestion:*(unsigned __int8 *)(a1 + 48)];
}

- (void)logUserDidDeleteWidgetOnStack:(id)a3 stackIdentifier:(id)a4 stackKind:(unint64_t)a5 stackLocation:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103__ATXHomeScreenSuggestionClient_logUserDidDeleteWidgetOnStack_stackIdentifier_stackKind_stackLocation___block_invoke;
  void v15[3] = &unk_1E5D07C98;
  id v16 = v10;
  id v17 = v11;
  unint64_t v18 = a5;
  unint64_t v19 = a6;
  id v13 = v11;
  id v14 = v10;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v15];
}

uint64_t __103__ATXHomeScreenSuggestionClient_logUserDidDeleteWidgetOnStack_stackIdentifier_stackKind_stackLocation___block_invoke(void *a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logUserDidDeleteWidgetOnStack:a1[4] stackIdentifier:a1[5] stackKind:a1[6] stackLocation:a1[7]];
}

- (void)logUserDidCreateStack:(id)a3 page:(id)a4 isSuggestion:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__ATXHomeScreenSuggestionClient_logUserDidCreateStack_page_isSuggestion___block_invoke;
  v13[3] = &unk_1E5D07CC0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v13];
}

uint64_t __73__ATXHomeScreenSuggestionClient_logUserDidCreateStack_page_isSuggestion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(double **)(a1 + 32);
  double v4 = v3[13];
  double v5 = v3[15];
  id v6 = a2;
  [v3 startSuppressingRotationForTimeInterval:v4 leeway:v5];
  id v7 = (void *)v6[24];

  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 56);

  return [v7 logUserDidCreateStack:v8 page:v9 isSuggestion:v10];
}

- (void)logUserDidDeleteStack:(id)a3 stackKind:(unint64_t)a4 stackLocation:(unint64_t)a5 page:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__ATXHomeScreenSuggestionClient_logUserDidDeleteStack_stackKind_stackLocation_page___block_invoke;
  void v15[3] = &unk_1E5D07C98;
  unint64_t v18 = a4;
  unint64_t v19 = a5;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v15];
}

uint64_t __84__ATXHomeScreenSuggestionClient_logUserDidDeleteStack_stackKind_stackLocation_page___block_invoke(void *a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logUserDidDeleteStack:a1[4] stackKind:a1[6] stackLocation:a1[7] page:a1[5]];
}

- (void)logDeviceLock
{
  dispatch_time_t v3 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ATXHomeScreenSuggestionClient_logDeviceLock__block_invoke;
  block[3] = &unk_1E5D05300;
  void block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

uint64_t __46__ATXHomeScreenSuggestionClient_logDeviceLock__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__ATXHomeScreenSuggestionClient_logDeviceLock__block_invoke_2;
  v4[3] = &unk_1E5D07828;
  v4[4] = v1;
  return [v2 runAsyncWithLockAcquired:v4];
}

uint64_t __46__ATXHomeScreenSuggestionClient_logDeviceLock__block_invoke_2(uint64_t a1, void *a2)
{
  dispatch_time_t v3 = *(void **)(a1 + 32);
  double v4 = a2;
  [v3 _refreshInferredEngagementStatusForWidgetSuggestions:v4];
  [*(id *)(*(void *)(a1 + 32) + 64) resetAllTracking];
  double v5 = (void *)v4[24];

  return [v5 logDeviceLock];
}

- (void)logDeviceUnlock
{
}

uint64_t __48__ATXHomeScreenSuggestionClient_logDeviceUnlock__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logDeviceUnlock];
}

- (void)logWidgetInsertionDidFailInStack:(id)a3 prediction:(id)a4
{
  id v5 = a3;
  id v6 = [a4 suggestionForStackIdentifier:v5];
  id v7 = [v6 topWidget];

  uint64_t v8 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    -[ATXHomeScreenSuggestionClient logWidgetInsertionDidFailInStack:prediction:](v7, (uint64_t)v5, v8);
  }
}

- (void)logWidgetDidAppear:(id)a3 blendingCacheId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __68__ATXHomeScreenSuggestionClient_logWidgetDidAppear_blendingCacheId___block_invoke;
  v11[3] = &unk_1E5D07850;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v11];
}

uint64_t __68__ATXHomeScreenSuggestionClient_logWidgetDidAppear_blendingCacheId___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logWidgetDidAppear:*(void *)(a1 + 32) blendingCacheId:*(void *)(a1 + 40)];
}

- (void)logWidgetDidDisappear:(id)a3 blendingCacheId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __71__ATXHomeScreenSuggestionClient_logWidgetDidDisappear_blendingCacheId___block_invoke;
  v11[3] = &unk_1E5D07850;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v11];
}

uint64_t __71__ATXHomeScreenSuggestionClient_logWidgetDidDisappear_blendingCacheId___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logWidgetDidDisappear:*(void *)(a1 + 32) blendingCacheId:*(void *)(a1 + 40)];
}

- (void)logSuggestionsDidAppear:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__ATXHomeScreenSuggestionClient_logSuggestionsDidAppear_widget_blendingCacheId___block_invoke;
  void v15[3] = &unk_1E5D079B0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v15];
}

uint64_t __80__ATXHomeScreenSuggestionClient_logSuggestionsDidAppear_widget_blendingCacheId___block_invoke(void *a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logSuggestionsDidAppear:a1[4] widget:a1[5] blendingCacheId:a1[6]];
}

- (void)logSuggestionsDidDisappear:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__ATXHomeScreenSuggestionClient_logSuggestionsDidDisappear_widget_blendingCacheId___block_invoke;
  void v15[3] = &unk_1E5D079B0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v15];
}

uint64_t __83__ATXHomeScreenSuggestionClient_logSuggestionsDidDisappear_widget_blendingCacheId___block_invoke(void *a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logSuggestionsDidDisappear:a1[4] widget:a1[5] blendingCacheId:a1[6]];
}

- (void)logWidgetOccluded:(id)a3 blendingCacheId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __67__ATXHomeScreenSuggestionClient_logWidgetOccluded_blendingCacheId___block_invoke;
  v11[3] = &unk_1E5D07850;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v11];
}

uint64_t __67__ATXHomeScreenSuggestionClient_logWidgetOccluded_blendingCacheId___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logWidgetOccluded:*(void *)(a1 + 32) blendingCacheId:*(void *)(a1 + 40)];
}

- (void)logWidgetUnoccluded:(id)a3 blendingCacheId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __69__ATXHomeScreenSuggestionClient_logWidgetUnoccluded_blendingCacheId___block_invoke;
  v11[3] = &unk_1E5D07850;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v11];
}

uint64_t __69__ATXHomeScreenSuggestionClient_logWidgetUnoccluded_blendingCacheId___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logWidgetUnoccluded:*(void *)(a1 + 32) blendingCacheId:*(void *)(a1 + 40)];
}

- (void)logDidTapSuggestion:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__ATXHomeScreenSuggestionClient_logDidTapSuggestion_widget_blendingCacheId___block_invoke;
  void v15[3] = &unk_1E5D079B0;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v15];
}

uint64_t __76__ATXHomeScreenSuggestionClient_logDidTapSuggestion_widget_blendingCacheId___block_invoke(void *a1, void *a2)
{
  dispatch_time_t v3 = (void *)a2[23];
  uint64_t v4 = a1[4];
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a2;
  id v7 = [v5 now];
  [v3 updateMostRecentTapOfWidget:v4 date:v7];

  id v8 = (void *)v6[24];
  uint64_t v10 = a1[4];
  uint64_t v9 = a1[5];
  uint64_t v11 = a1[6];

  return [v8 logDidTapSuggestion:v9 widget:v10 blendingCacheId:v11];
}

- (void)_dismissSuggestions:(id)a3 guardedData:(id)a4 fromSuggestionsWidget:(id)a5 dismissFromAllUIs:(BOOL)a6 duration:(double)a7
{
  BOOL v8 = a6;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = (void *)*((void *)a4 + 25);
  id v15 = [v13 extensionBundleId];
  id v16 = [v13 widgetKind];
  long long v29 = v13;
  id v17 = [v13 intent];
  id v18 = [MEMORY[0x1E4F1C9C8] now];
  [v14 userDidDismissSuggestionForWidget:v15 kind:v16 intent:v17 atDate:v18 duration:a7];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v19 = v12;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    if (v8) {
      uint64_t v23 = 120;
    }
    else {
      uint64_t v23 = 8;
    }
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        CGFloat v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v26 = [v25 executableSpecification];
        uint64_t v27 = [v26 executableType];

        if (v27 == 1) {
          uint64_t v28 = 8;
        }
        else {
          uint64_t v28 = v23;
        }
        [(ATXEngagementRecordManager *)self->_engagementRecordManager addHiddenSuggestion:v25 duration:v28 engagementRecordType:691200.0];
        [(ATXActionPredictionClient *)self->_actionPredictionClient removeActionPredictionNotificationsMatchingSuggestion:v25 reply:0];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v21);
  }
}

- (void)logContextMenuDismissOnceForSuggestion:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__ATXHomeScreenSuggestionClient_logContextMenuDismissOnceForSuggestion_widget_blendingCacheId___block_invoke;
  void v15[3] = &unk_1E5D07BB0;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v15];
}

uint64_t __95__ATXHomeScreenSuggestionClient_logContextMenuDismissOnceForSuggestion_widget_blendingCacheId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = a2;
  uint64_t v4 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) uuid];
    id v6 = [v5 UUIDString];
    id v7 = [*(id *)(a1 + 32) executableSpecification];
    id v8 = [v7 executableDescription];
    id v9 = (void *)MEMORY[0x1E4F93950];
    id v10 = [*(id *)(a1 + 32) executableSpecification];
    uint64_t v11 = objc_msgSend(v9, "stringForExecutableType:", objc_msgSend(v10, "executableType"));
    *(_DWORD *)buf = 138543874;
    id v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2114;
    uint64_t v22 = v11;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: handling dismiss once for suggestion with uuid: %{public}@ executable description: %@ executable type: %{public}@", buf, 0x20u);
  }
  id v12 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 32);
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  [v12 _dismissSuggestions:v13 guardedData:v3 fromSuggestionsWidget:*(void *)(a1 + 48) dismissFromAllUIs:1 duration:3600.0];

  [*(id *)(a1 + 40) _replaceSuggestionIfNeeded:*(void *)(a1 + 32) fromProactiveWidget:*(void *)(a1 + 48) guardedData:v3];
  id v14 = (void *)v3[24];

  return [v14 logContextMenuDismissOnceForSuggestion:*(void *)(a1 + 32) widget:*(void *)(a1 + 48) blendingCacheId:*(void *)(a1 + 56)];
}

- (void)logContextMenuNeverShowAgainForSuggestion:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__ATXHomeScreenSuggestionClient_logContextMenuNeverShowAgainForSuggestion_widget_blendingCacheId___block_invoke;
  void v15[3] = &unk_1E5D07BB0;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v15];
}

uint64_t __98__ATXHomeScreenSuggestionClient_logContextMenuNeverShowAgainForSuggestion_widget_blendingCacheId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = a2;
  uint64_t v4 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) uuid];
    id v6 = [v5 UUIDString];
    id v7 = (void *)MEMORY[0x1E4F93950];
    id v8 = [*(id *)(a1 + 32) executableSpecification];
    id v9 = objc_msgSend(v7, "stringForExecutableType:", objc_msgSend(v8, "executableType"));
    int v12 = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: handling never show again for suggestion with uuid: %{public}@ executable type: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 40) + 56) addHiddenSuggestion:*(void *)(a1 + 32) duration:120 engagementRecordType:86400.0];
  [*(id *)(a1 + 40) _toggleSiriSearchSettingsOffForAppSuggestion:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _replaceSuggestionIfNeeded:*(void *)(a1 + 32) fromProactiveWidget:*(void *)(a1 + 48) guardedData:v3];
  id v10 = (void *)v3[24];

  return [v10 logContextMenuNeverShowAgainForSuggestion:*(void *)(a1 + 32) widget:*(void *)(a1 + 48) blendingCacheId:*(void *)(a1 + 56)];
}

- (void)logUserDidStartWidgetOnboarding
{
}

uint64_t __64__ATXHomeScreenSuggestionClient_logUserDidStartWidgetOnboarding__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logUserDidStartWidgetOnboarding];
}

- (void)logUserDidAcceptWidgetOnboardingSuggestion:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__ATXHomeScreenSuggestionClient_logUserDidAcceptWidgetOnboardingSuggestion___block_invoke;
  v7[3] = &unk_1E5D07828;
  id v8 = v4;
  id v6 = v4;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v7];
}

uint64_t __76__ATXHomeScreenSuggestionClient_logUserDidAcceptWidgetOnboardingSuggestion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logUserDidAcceptWidgetOnboardingSuggestion:*(void *)(a1 + 32)];
}

- (void)logUserDidRejectWidgetOnboardingSuggestion:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__ATXHomeScreenSuggestionClient_logUserDidRejectWidgetOnboardingSuggestion___block_invoke;
  v7[3] = &unk_1E5D07828;
  id v8 = v4;
  id v6 = v4;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v7];
}

uint64_t __76__ATXHomeScreenSuggestionClient_logUserDidRejectWidgetOnboardingSuggestion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logUserDidRejectWidgetOnboardingSuggestion:*(void *)(a1 + 32)];
}

- (void)logUserDidEnterEditModeForWidgetOnboarding
{
}

uint64_t __75__ATXHomeScreenSuggestionClient_logUserDidEnterEditModeForWidgetOnboarding__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logUserDidEnterEditModeForWidgetOnboarding];
}

- (void)logUserDidSwitchHomeScreenExperience:(unint64_t)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__ATXHomeScreenSuggestionClient_logUserDidSwitchHomeScreenExperience___block_invoke;
  v4[3] = &__block_descriptor_40_e50_v16__0__ATXHomeScreenSuggestionClientGuardedData_8l;
  v4[4] = a3;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v4];
}

uint64_t __70__ATXHomeScreenSuggestionClient_logUserDidSwitchHomeScreenExperience___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 192) logUserDidSwitchHomeScreenExperience:*(void *)(a1 + 32)];
}

- (BOOL)_replaceSuggestionIfNeeded:(id)a3 fromProactiveWidget:(id)a4 guardedData:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 extensionBundleId];
  char v12 = [v11 isEqualToString:*MEMORY[0x1E4F4B5F8]];

  if (v12)
  {
    uint64_t v13 = 11;
  }
  else
  {
    __int16 v14 = [v9 extensionBundleId];
    char v15 = [v14 isEqualToString:@"com.apple.proactive.appprediction.panel"];

    if (v15)
    {
      uint64_t v13 = 19;
    }
    else
    {
      uint64_t v16 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[ATXHomeScreenSuggestionClient _replaceSuggestionIfNeeded:fromProactiveWidget:guardedData:](v16, v17, v18, v19, v20, v21, v22, v23);
      }

      uint64_t v13 = 3;
    }
  }
  BOOL v24 = [(ATXEngagementRecordManager *)self->_engagementRecordManager hasEngagedWithSuggestion:v8 engagementRecordType:v13];
  CGFloat v25 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = [v8 uuid];
    uint64_t v27 = [v26 UUIDString];
    int v31 = 136315650;
    long long v32 = "-[ATXHomeScreenSuggestionClient _replaceSuggestionIfNeeded:fromProactiveWidget:guardedData:]";
    __int16 v33 = 2114;
    uint64_t v34 = v27;
    __int16 v35 = 1024;
    BOOL v36 = v24;
    _os_log_impl(&dword_1A790D000, v25, OS_LOG_TYPE_DEFAULT, "%s: suggestionID %{public}@, isSuggestionReplacementNeeded %{BOOL}u", (uint8_t *)&v31, 0x1Cu);
  }
  if (v24)
  {
    uint64_t v28 = [v8 uuid];
    long long v29 = [v28 UUIDString];
    [(ATXHomeScreenSuggestionClient *)self _replaceSuggestionForAllProactiveWidgets:v29 guardedData:v10];
  }
  return v24;
}

- (void)_replaceSuggestionForAllProactiveWidgets:(id)a3 guardedData:(id)a4
{
  double rotationSuppressionInterval = self->_rotationSuppressionInterval;
  timerLeewaCGFloat y = self->_timerLeeway;
  id v8 = a4;
  id v9 = a3;
  [(ATXHomeScreenSuggestionClient *)self _startSuppressingRotationForTimeInterval:v8 leeway:rotationSuppressionInterval guardedData:timerLeeway];
  [(ATXHomeScreenSuggestionClient *)self _replaceSuggestionWithId:v9 shouldSuggestionsBeDisjoint:0 guardedData:v8];

  [(ATXHomeScreenSuggestionClient *)self _notifyObserversAboutLayoutUpdateWithGuardedData:v8];
  id v10 = (void *)MEMORY[0x1E4F93940];

  [v10 refreshBlendingLayerWithReason:@"Replaced suggestion for all widgets"];
}

- (void)_toggleSiriSearchSettingsOffForAppSuggestion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 executableSpecification];
  uint64_t v5 = [v4 executableType];

  id v6 = [v3 executableSpecification];
  id v7 = [v6 executableObject];

  if (v5 == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = v7;
    id v9 = objc_alloc(MEMORY[0x1E4F1CA80]);
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    char v12 = (void *)CFPreferencesCopyValue(@"SBSearchSuggestAppDisabled", @"com.apple.spotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    uint64_t v13 = v12;
    if (v12) {
      id v14 = v12;
    }
    else {
      id v14 = (id)objc_opt_new();
    }
    char v15 = v14;

    uint64_t v16 = (void *)[v9 initWithArray:v15];
    [v16 addObject:v8];
    CFPreferencesSetAppValue(@"SBSearchSuggestAppDisabled", (CFPropertyListRef)[v16 allObjects], @"com.apple.spotlightui");
    CFPreferencesSynchronize(@"com.apple.spotlightui", v10, v11);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.spotlightui.prefschanged", 0, 0, 1u);

    uint64_t v18 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      uint64_t v20 = v8;
      _os_log_impl(&dword_1A790D000, v18, OS_LOG_TYPE_DEFAULT, "toggled siri & search settings for spotlight OFF for app prediction: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    id v8 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(ATXHomeScreenSuggestionClient *)v3 _toggleSiriSearchSettingsOffForAppSuggestion:v8];
    }
  }
}

- (id)_newSuggestionLayoutForOldLayout:(id)a3 replacedSuggestionId:(id)a4 shouldSuggestionsBeDisjoint:(BOOL)a5 usedFallbackIndexSet:(id)a6 guardedData:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = [v15 oneByOneSuggestions];
  __int16 v33 = [(ATXHomeScreenSuggestionClient *)self _replaceSuggestionWithId:v14 fromSuggestionsArray:v16 suggestionLayoutType:1 usedFallbackIndexSet:v13 shouldSuggestionsBeDisjoint:v8 guardedData:v12];

  uint64_t v17 = [v15 oneByTwoSuggestions];
  long long v32 = [(ATXHomeScreenSuggestionClient *)self _replaceSuggestionWithId:v14 fromSuggestionsArray:v17 suggestionLayoutType:2 usedFallbackIndexSet:v13 shouldSuggestionsBeDisjoint:v8 guardedData:v12];

  uint64_t v18 = [v15 twoByTwoSuggestions];
  int v31 = [(ATXHomeScreenSuggestionClient *)self _replaceSuggestionWithId:v14 fromSuggestionsArray:v18 suggestionLayoutType:3 usedFallbackIndexSet:v13 shouldSuggestionsBeDisjoint:v8 guardedData:v12];

  int v19 = [v15 oneByFourSuggestions];
  uint64_t v20 = [(ATXHomeScreenSuggestionClient *)self _replaceSuggestionWithId:v14 fromSuggestionsArray:v19 suggestionLayoutType:5 usedFallbackIndexSet:v13 shouldSuggestionsBeDisjoint:v8 guardedData:v12];

  uint64_t v21 = [v15 twoByFourSuggestions];
  uint64_t v22 = [(ATXHomeScreenSuggestionClient *)self _replaceSuggestionWithId:v14 fromSuggestionsArray:v21 suggestionLayoutType:4 usedFallbackIndexSet:v13 shouldSuggestionsBeDisjoint:v8 guardedData:v12];

  uint64_t v23 = [v15 fourByFourSuggestions];
  BOOL v24 = [(ATXHomeScreenSuggestionClient *)self _replaceSuggestionWithId:v14 fromSuggestionsArray:v23 suggestionLayoutType:6 usedFallbackIndexSet:v13 shouldSuggestionsBeDisjoint:v8 guardedData:v12];

  CGFloat v25 = [v15 fourByEightSuggestions];
  id v26 = [(ATXHomeScreenSuggestionClient *)self _replaceSuggestionWithId:v14 fromSuggestionsArray:v25 suggestionLayoutType:7 usedFallbackIndexSet:v13 shouldSuggestionsBeDisjoint:v8 guardedData:v12];

  uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F939C8]), "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:", objc_msgSend(v15, "layoutType"), v33, v32, v31, v20, v22, v24, v26);
  [v15 layoutScore];
  objc_msgSend(v27, "setLayoutScore:");
  uint64_t v28 = [v15 uuid];
  [v27 setUuid:v28];

  objc_msgSend(v27, "setIsValidForSuggestionsWidget:", objc_msgSend(v15, "isValidForSuggestionsWidget"));
  objc_msgSend(v27, "setConfidenceWarrantsSnappingOrNPlusOne:", objc_msgSend(v15, "confidenceWarrantsSnappingOrNPlusOne"));
  objc_msgSend(v27, "setIsNPlusOne:", objc_msgSend(v15, "isNPlusOne"));
  long long v29 = [v15 widgetUniqueId];

  [v27 setWidgetUniqueId:v29];
  return v27;
}

- (void)_replaceSuggestionWithId:(id)a3 shouldSuggestionsBeDisjoint:(BOOL)a4 guardedData:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = (id *)a5;
  id v9 = v8 + 12;
  CFStringRef v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8[12], "count"));
  CFStringRef v11 = v8 + 13;
  id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8[13], "count"));
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  long long v39 = __Block_byref_object_copy__9;
  id v40 = __Block_byref_object_dispose__9;
  id v41 = (id)objc_opt_new();
  id v13 = v8[12];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __98__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_shouldSuggestionsBeDisjoint_guardedData___block_invoke;
  v30[3] = &unk_1E5D07CE8;
  v30[4] = self;
  id v14 = v7;
  BOOL v35 = a4;
  id v31 = v14;
  uint64_t v34 = &v36;
  id v15 = v8;
  long long v32 = v15;
  id v16 = v10;
  id v33 = v16;
  [v13 enumerateKeysAndObjectsUsingBlock:v30];
  id v17 = *v11;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __98__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_shouldSuggestionsBeDisjoint_guardedData___block_invoke_2;
  v24[3] = &unk_1E5D07CE8;
  v24[4] = self;
  id v18 = v14;
  BOOL v29 = a4;
  id v25 = v18;
  uint64_t v28 = &v36;
  int v19 = v15;
  id v26 = v19;
  id v20 = v12;
  id v27 = v20;
  [v17 enumerateKeysAndObjectsUsingBlock:v24];
  objc_storeStrong(v9, v10);
  objc_storeStrong(v11, v12);
  [v19[15] removeObjectsAtIndexes:v37[5]];
  uint64_t v21 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [*v9 allKeys];
    *(_DWORD *)buf = 138543362;
    id v43 = v22;
    _os_log_impl(&dword_1A790D000, v21, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: setting new suggestion widget layouts after replacement: %{public}@", buf, 0xCu);
  }
  _Block_object_dispose(&v36, 8);
}

void __98__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_shouldSuggestionsBeDisjoint_guardedData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = a2;
  id v11 = (id)[v5 _newSuggestionLayoutForOldLayout:a3 replacedSuggestionId:v6 shouldSuggestionsBeDisjoint:v7 usedFallbackIndexSet:v8 guardedData:v9];
  [*(id *)(a1 + 56) setObject:v11 forKeyedSubscript:v10];
}

void __98__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_shouldSuggestionsBeDisjoint_guardedData___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = a2;
  id v11 = (id)[v5 _newSuggestionLayoutForOldLayout:a3 replacedSuggestionId:v6 shouldSuggestionsBeDisjoint:v7 usedFallbackIndexSet:v8 guardedData:v9];
  [*(id *)(a1 + 56) setObject:v11 forKeyedSubscript:v10];
}

- (id)_replaceSuggestionWithId:(id)a3 fromSuggestionsArray:(id)a4 suggestionLayoutType:(int64_t)a5 usedFallbackIndexSet:(id)a6 shouldSuggestionsBeDisjoint:(BOOL)a7 guardedData:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = (id *)a8;
  if (v15)
  {
    uint64_t v42 = 0;
    id v43 = &v42;
    uint64_t v44 = 0x2020000000;
    uint64_t v45 = 0;
    uint64_t v45 = [v15 count];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __161__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_fromSuggestionsArray_suggestionLayoutType_usedFallbackIndexSet_shouldSuggestionsBeDisjoint_guardedData___block_invoke;
    v39[3] = &unk_1E5D07D10;
    id v40 = v14;
    id v41 = &v42;
    [v15 enumerateObjectsUsingBlock:v39];
    uint64_t v18 = v43[3];
    if (v18 == [v15 count])
    {
      id v19 = v15;
    }
    else
    {
      uint64_t v35 = 0;
      uint64_t v36 = &v35;
      uint64_t v37 = 0x2020000000;
      uint64_t v38 = 0;
      uint64_t v38 = [v17[15] count];
      id v20 = v17[15];
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      id v27 = __161__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_fromSuggestionsArray_suggestionLayoutType_usedFallbackIndexSet_shouldSuggestionsBeDisjoint_guardedData___block_invoke_2;
      uint64_t v28 = &unk_1E5D07D38;
      BOOL v29 = self;
      long long v30 = v17;
      BOOL v34 = a7;
      id v21 = v16;
      long long v32 = &v35;
      int64_t v33 = a5;
      id v31 = v21;
      [v20 enumerateObjectsUsingBlock:&v25];
      uint64_t v22 = v36[3];
      if (v22 == objc_msgSend(v17[15], "count", v25, v26, v27, v28, v29))
      {
        id v19 = v15;
      }
      else
      {
        uint64_t v23 = [v17[15] objectAtIndexedSubscript:v36[3]];
        [v21 addIndex:v36[3]];
        id v19 = (id)[v15 mutableCopy];
        [v19 replaceObjectAtIndex:v43[3] withObject:v23];
      }
      _Block_object_dispose(&v35, 8);
    }

    _Block_object_dispose(&v42, 8);
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

void __161__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_fromSuggestionsArray_suggestionLayoutType_usedFallbackIndexSet_shouldSuggestionsBeDisjoint_guardedData___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 uuid];
  uint64_t v8 = [v7 UUIDString];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __161__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_fromSuggestionsArray_suggestionLayoutType_usedFallbackIndexSet_shouldSuggestionsBeDisjoint_guardedData___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if ([v7 isValidForSuggestionsWidget]
    && ([*(id *)(a1 + 32) _isFallbackSuggestionUsed:v7 guardedData:*(void *)(a1 + 40)] & 1) == 0
    && (!*(unsigned char *)(a1 + 72) || ([*(id *)(a1 + 48) containsIndex:a3] & 1) == 0))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = objc_msgSend(v7, "uiSpecification", 0);
    int v9 = [v8 preferredLayoutConfigs];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v14 + 1) + 8 * i) applicableLayoutType] == *(void *)(a1 + 64))
          {
            *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
            *a4 = 1;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 96, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (double)rotationSuppressionInterval
{
  return self->_rotationSuppressionInterval;
}

- (void)setRotationSuppressionInterval:(double)a3
{
  self->_double rotationSuppressionInterval = a3;
}

- (double)layoutUpdateSuppressionInterval
{
  return self->_layoutUpdateSuppressionInterval;
}

- (void)setLayoutUpdateSuppressionInterval:(double)a3
{
  self->_layoutUpdateSuppressionInterval = a3;
}

- (double)timerLeeway
{
  return self->_timerLeeway;
}

- (void)setTimerLeeway:(double)a3
{
  self->_timerLeewaCGFloat y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsafeXPCConnection, 0);
  objc_storeStrong((id *)&self->_atxDefaults, 0);
  objc_storeStrong((id *)&self->_chronoServicesProvider, 0);
  objc_storeStrong((id *)&self->_actionPredictionClient, 0);
  objc_storeStrong((id *)&self->_widgetDwellTracker, 0);
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_homeScreenConfigCache, 0);
  objc_storeStrong((id *)&self->_uiCacheManager, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);

  objc_storeStrong((id *)&self->_outputQueue, 0);
}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_83_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "ATXHomeScreenSuggestionClient: Device is Class-C unlocked, but still could not access ATXInformationStore.", v1, 2u);
}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_2_84_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXHomeScreenSuggestionClient: failed to write staged home screen page configurations post-class C unlock with error: %@", v2, v3, v4, v5, v6);
}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_86_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXHomeScreenSuggestionClient: failed to write staged dock app list post-class C unlock with error: %@", v2, v3, v4, v5, v6);
}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_87_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXHomeScreenSuggestionClient: failed to write staged today page stacks and panels post-class C unlock with error: %@", v2, v3, v4, v5, v6);
}

- (void)_loadKnownHomeScreenProactiveWidgetUniqueIds
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXHomeScreenSuggestionClient: Unable to load known HomeScreen proactive widget unique IDs - %{public}@", v2, v3, v4, v5, v6);
}

- (void)_loadKnownTodayPageProactiveWidgetUniqueIds
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXHomeScreenSuggestionClient: Unable to load known TodayPage proactive widget unique IDs - %{public}@", v2, v3, v4, v5, v6);
}

- (void)_knownProactiveWidgetUniqueIdentifiersInPages:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 identifier];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_fault_impl(&dword_1A790D000, a4, OS_LOG_TYPE_FAULT, "ATXHomeScreenSuggestionClient: Proactive widget in stack %{public}@ does not have widget unique ID.", a1, 0xCu);
}

void __78__ATXHomeScreenSuggestionClient_layoutForSuggestionsWidget_completionHandler___block_invoke_cold_1(id *a1)
{
  [*a1 size];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_5(&dword_1A790D000, v1, v2, "%s: unsupported layout size %lu", v3, v4, v5, v6, 2u);
}

void __79__ATXHomeScreenSuggestionClient_layoutForAppPredictionPanel_completionHandler___block_invoke_cold_1(id *a1)
{
  [*a1 size];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_5(&dword_1A790D000, v1, v2, "%s: unsupported layout size %lu", v3, v4, v5, v6, 2u);
}

void __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 uiSpecification];
  uint64_t v2 = [v1 title];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_1A790D000, v3, v4, "ATXHomeScreenSuggestionClient: isSuggestionReplacementAvailableForSuggestion: %@ is already marked as used", v5, v6, v7, v8, v9);
}

void __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2_cold_2(void *a1)
{
  uint64_t v1 = [a1 uiSpecification];
  uint64_t v2 = [v1 title];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_1A790D000, v3, v4, "ATXHomeScreenSuggestionClient: isSuggestionReplacementAvailableForSuggestion: found %@", v5, v6, v7, v8, v9);
}

void __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2_cold_3(void *a1)
{
  uint64_t v1 = [a1 uiSpecification];
  uint64_t v2 = [v1 title];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_1A790D000, v3, v4, "ATXHomeScreenSuggestionClient: isSuggestionReplacementAvailableForSuggestion: %@ is not valid", v5, v6, v7, v8, v9);
}

void __69__ATXHomeScreenSuggestionClient_unusedFallbackAppSuggestionsForPage___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "We have an app prediction fallback without a valid executable object", v1, 2u);
}

void __63__ATXHomeScreenSuggestionClient_homeScreenPredictionWithReply___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[ATXHomeScreenSuggestionClient homeScreenPredictionWithReply:]_block_invoke";
  _os_log_debug_impl(&dword_1A790D000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A790D000, v1, OS_LOG_TYPE_ERROR, "ATXHomeScreenSuggestionClient: Rejecting connection %{public}@ without entitlement %{public}@", v2, 0x16u);
}

void __106__ATXHomeScreenSuggestionClient_logWidgetAddedFeaturesInCoreAnalytics_rankOfWidgetInGallery_galleryItems___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  uint64_t v2 = "-[ATXHomeScreenSuggestionClient logWidgetAddedFeaturesInCoreAnalytics:rankOfWidgetInGallery:galleryItems:]_block_invoke";
  OUTLINED_FUNCTION_4_1();
  _os_log_error_impl(&dword_1A790D000, v0, OS_LOG_TYPE_ERROR, "%s: error with xpc connection to logWidgetAddedFeaturesInCoreAnalytics: %@", (uint8_t *)&v1, 0x16u);
}

- (void)_writeHomeScreenPageConfigurations:guardedData:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXHomeScreenSuggestionClient: failed to write home screen page configurations with error: %@", v2, v3, v4, v5, v6);
}

- (void)_writeDockAppList:guardedData:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXHomeScreenSuggestionClient: failed to write dock app list with error: %@", v2, v3, v4, v5, v6);
}

- (void)_writeTodayPageStacks:appPredictionPanels:guardedData:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXHomeScreenSuggestionClient: failed to write today page stacks and panels with error: %@", v2, v3, v4, v5, v6);
}

- (void)logStackDidDisappear:(uint64_t)a3 topWidget:(uint64_t)a4 prediction:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)logStackDidAppear:(uint64_t)a3 topWidget:(uint64_t)a4 prediction:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)logWidgetInsertionDidFailInStack:(NSObject *)a3 prediction:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = [a1 widgetUniqueId];
  uint64_t v7 = [a1 extensionBundleId];
  int v8 = 138543874;
  uint8_t v9 = v6;
  OUTLINED_FUNCTION_4_1();
  __int16 v10 = 2114;
  uint64_t v11 = a2;
  _os_log_fault_impl(&dword_1A790D000, a3, OS_LOG_TYPE_FAULT, "ATXHomeScreenSuggestionClient: Failed to insert N+1 widget %{public}@ (extensionBundleId %@) for stack %{public}@", (uint8_t *)&v8, 0x20u);
}

- (void)_replaceSuggestionIfNeeded:(uint64_t)a3 fromProactiveWidget:(uint64_t)a4 guardedData:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_toggleSiriSearchSettingsOffForAppSuggestion:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F93950];
  uint64_t v5 = [a1 executableSpecification];
  uint8_t v6 = objc_msgSend(v4, "stringForExecutableType:", objc_msgSend(v5, "executableType"));
  uint64_t v7 = (objc_class *)objc_opt_class();
  int v8 = NSStringFromClass(v7);
  int v9 = 136315650;
  __int16 v10 = "-[ATXHomeScreenSuggestionClient _toggleSiriSearchSettingsOffForAppSuggestion:]";
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  __int16 v13 = 2114;
  long long v14 = v8;
  _os_log_error_impl(&dword_1A790D000, a3, OS_LOG_TYPE_ERROR, "%s: attempted to toggle siri & search settings off for non-app executable type: %{public}@ class: %{public}@", (uint8_t *)&v9, 0x20u);
}

@end