@interface ATXHomeScreenEventLogger
- (ATXHomeScreenEventLogger)initWithHomeScreenConfigCache:(id)a3 biomeUIStream:(id)a4 PETEventTracker:(id)a5 defaults:(id)a6;
- (ATXHomeScreenEventLoggerDelegate)delegate;
- (id)_homeScreenEventWithDate:(id)a3 eventTypeString:(id)a4 stackIdentifier:(id)a5 stackKind:(unint64_t)a6 stackLocation:(unint64_t)a7 reason:(id)a8 widget:(id)a9 blendingCacheIdentifier:(id)a10 metadata:(id)a11;
- (id)_pageIndexGivenWidgetUniqueId:(id)a3;
- (id)_pageIndexGivenWidgetUniqueId:(id)a3 stackIdToStackDataDictionary:(id)a4 widgetIdToStackIdDictionary:(id)a5;
- (id)_stackIdentifierGivenWidgetUniqueId:(id)a3;
- (id)_stackIdentifierGivenWidgetUniqueId:(id)a3 widgetIdToStackIdDictionary:(id)a4;
- (unint64_t)_stackKindGivenWidgetUniqueId:(id)a3;
- (unint64_t)_stackKindGivenWidgetUniqueId:(id)a3 stackIdToStackDataDictionary:(id)a4 widgetIdToStackIdDictionary:(id)a5;
- (unint64_t)_stackLocationGivenWidgetUniqueId:(id)a3;
- (unint64_t)_stackLocationGivenWidgetUniqueId:(id)a3 stackIdToStackDataDictionary:(id)a4 widgetIdToStackIdDictionary:(id)a5;
- (void)_handleRemovedSuggestedWidgetsIfNecessary:(id)a3;
- (void)_logAppLaunchOverallCaptureRateFromAppPredictionPanelWithTappedWidget:(id)a3 suggestion:(id)a4;
- (void)_logAppPanelLaunchRatioWithTappedWidget:(id)a3;
- (void)_logCaptureRateDiversionIfAppPredictionPanelExistsWithTappedWidget:(id)a3;
- (void)_logCaptureRateForAppPredictionPanelWithEngagedSuggestion:(id)a3 isSuggestionsWidget:(BOOL)a4 widgetIdentifier:(id)a5;
- (void)_logProactiveWidgetEvent:(int)a3 suggestionIdentifiers:(id)a4 widget:(id)a5 blendingCacheId:(id)a6 date:(id)a7;
- (void)_logRemovalDateOfDefaultTVWidgetIfApplicable:(id)a3 configDiffer:(id)a4;
- (void)_logSupplementaryActionInContextMenu:(unint64_t)a3 stackId:(id)a4 widget:(id)a5 prediction:(id)a6;
- (void)_populateCachedIconState:(id)a3;
- (void)_populateStackKindAndLocation:(id)a3;
- (void)_populateSuggestedPageMetadata:(id)a3 forPage:(id)a4;
- (void)_sendEventToBiomeWithDate:(id)a3 eventType:(int)a4 stackIdentifier:(id)a5 stackKind:(unint64_t)a6 stackLocation:(unint64_t)a7 reason:(id)a8 widget:(id)a9 blendingCacheIdentifier:(id)a10 metadata:(id)a11;
- (void)_updateCurrentConfigurationsAndLogDiff;
- (void)dockAppListDidChange;
- (void)homeScreenOrTodayPageConfigDidChange;
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
- (void)logWidgetDidAppear:(id)a3 blendingCacheId:(id)a4;
- (void)logWidgetDidAppear:(id)a3 stackId:(id)a4 prediction:(id)a5;
- (void)logWidgetDidDisappear:(id)a3 blendingCacheId:(id)a4;
- (void)logWidgetDidDisappear:(id)a3 stackId:(id)a4 prediction:(id)a5;
- (void)logWidgetInsertionDidFailInStack:(id)a3 prediction:(id)a4;
- (void)logWidgetOccluded:(id)a3 blendingCacheId:(id)a4;
- (void)logWidgetUnoccluded:(id)a3 blendingCacheId:(id)a4;
- (void)notifySuggestedWidgetsToStacksChanged:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ATXHomeScreenEventLogger

void __94__ATXHomeScreenEventLogger_logHomeScreenPageDidAppear_topWidgetsByStackIdentifier_prediction___block_invoke(uint64_t a1)
{
  v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __94__ATXHomeScreenEventLogger_logHomeScreenPageDidAppear_topWidgetsByStackIdentifier_prediction___block_invoke_cold_1(a1, v2);
  }

  v3 = objc_opt_new();
  v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  [v3 setPageIndex:v4];

  [v3 setStacks:*(void *)(a1 + 32)];
  v5 = *(void **)(a1 + 40);
  v6 = [MEMORY[0x1E4F1C9C8] now];
  v7 = [*(id *)(a1 + 48) blendingCacheId];
  [v5 _sendEventToBiomeWithDate:v6 eventType:1 stackIdentifier:0 stackKind:0 stackLocation:0 reason:0 widget:0 blendingCacheIdentifier:v7 metadata:v3];
}

- (void)_sendEventToBiomeWithDate:(id)a3 eventType:(int)a4 stackIdentifier:(id)a5 stackKind:(unint64_t)a6 stackLocation:(unint64_t)a7 reason:(id)a8 widget:(id)a9 blendingCacheIdentifier:(id)a10 metadata:(id)a11
{
  uint64_t v15 = *(void *)&a4;
  id v26 = a3;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  if (v15 >= 0x17)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_1E5D08B78[(int)v15];
  }
  v23 = [(ATXHomeScreenEventLogger *)self _homeScreenEventWithDate:v26 eventTypeString:v22 stackIdentifier:v17 stackKind:a6 stackLocation:a7 reason:v18 widget:v19 blendingCacheIdentifier:v20 metadata:v21];

  biomeUIStream = self->_biomeUIStream;
  v25 = +[ATXUIEvent uiEventWithHomeScreenEvent:v23];
  [(ATXUniversalBiomeUIStream *)biomeUIStream donateGenericUIEvent:v25];
}

- (id)_homeScreenEventWithDate:(id)a3 eventTypeString:(id)a4 stackIdentifier:(id)a5 stackKind:(unint64_t)a6 stackLocation:(unint64_t)a7 reason:(id)a8 widget:(id)a9 blendingCacheIdentifier:(id)a10 metadata:(id)a11
{
  id v17 = a9;
  id v33 = a10;
  id v18 = a11;
  id v19 = a8;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = objc_opt_new();
  [v23 setDate:v22];

  [v23 setEventTypeString:v21];
  [v23 setStackId:v20];

  [v23 setStackKind:a6];
  [v23 setStackLocation:a7];
  [v23 setReason:v19];

  if (v17)
  {
    v24 = [v17 extensionBundleId];
    [v23 setWidgetBundleId:v24];

    v25 = [v17 intent];
    id v26 = [v25 intentDescription];
    if (v26)
    {
      [v23 setIntentDescription:v26];
    }
    else
    {
      v27 = [v17 intent];
      v28 = [v27 description];
      [v23 setIntentDescription:v28];
    }
    v29 = [v17 widgetUniqueId];
    [v23 setWidgetUniqueId:v29];

    v30 = [v17 widgetKind];
    [v23 setWidgetKind:v30];

    objc_msgSend(v23, "setWidgetSize:", objc_msgSend(v17, "size"));
    v31 = [v17 appBundleId];
    [v23 setAppBundleId:v31];

    objc_msgSend(v23, "setIsSuggestedWidget:", objc_msgSend(v17, "isSuggestedWidget"));
  }
  [v23 setBlendingCacheId:v33];
  [v23 setMetadata:v18];

  return v23;
}

- (void)logHomeScreenPageDidAppear:(unint64_t)a3 topWidgetsByStackIdentifier:(id)a4 prediction:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__ATXHomeScreenEventLogger_logHomeScreenPageDidAppear_topWidgetsByStackIdentifier_prediction___block_invoke;
  v13[3] = &unk_1E5D071E0;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v9;
  unint64_t v17 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (ATXHomeScreenEventLogger)initWithHomeScreenConfigCache:(id)a3 biomeUIStream:(id)a4 PETEventTracker:(id)a5 defaults:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v44.receiver = self;
  v44.super_class = (Class)ATXHomeScreenEventLogger;
  uint64_t v15 = [(ATXHomeScreenEventLogger *)&v44 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_homeScreenConfigCache, a3);
    objc_storeStrong((id *)&v16->_biomeUIStream, a4);
    unint64_t v17 = BiomeLibrary();
    id v18 = [v17 Discoverability];
    uint64_t v19 = [v18 Signals];
    discoverabilitySignalsStream = v16->_discoverabilitySignalsStream;
    v16->_discoverabilitySignalsStream = (BMStream *)v19;

    objc_storeStrong((id *)&v16->_tracker, a5);
    objc_storeStrong((id *)&v16->_defaults, a6);
    id v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.proactive.ATXHomeScreenEventLogger", v21);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v22;

    uint64_t v24 = objc_opt_new();
    widgetIdToStackId = v16->_widgetIdToStackId;
    v16->_widgetIdToStackId = (NSMutableDictionary *)v24;

    uint64_t v26 = objc_opt_new();
    stackIdToCachedStackData = v16->_stackIdToCachedStackData;
    v16->_stackIdToCachedStackData = (NSMutableDictionary *)v26;

    uint64_t v28 = objc_opt_new();
    bundleIdToSBPageNumber = v16->_bundleIdToSBPageNumber;
    v16->_bundleIdToSBPageNumber = (NSMutableDictionary *)v28;

    uint64_t v30 = objc_opt_new();
    dockAppSet = v16->_dockAppSet;
    v16->_dockAppSet = (NSSet *)v30;

    id v32 = objc_alloc(MEMORY[0x1E4F93B98]);
    id v33 = v16->_queue;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke;
    v42[3] = &unk_1E5D05300;
    v34 = v16;
    v43 = v34;
    uint64_t v35 = [v32 initWithQueue:v33 operation:v42];
    coalescedConfigDiffOperation = v34->_coalescedConfigDiffOperation;
    v34->_coalescedConfigDiffOperation = (_PASSimpleCoalescingTimer *)v35;

    v37 = v16->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2;
    block[3] = &unk_1E5D04FC8;
    v40 = v34;
    id v41 = v11;
    dispatch_async(v37, block);
  }
  return v16;
}

uint64_t __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentConfigurationsAndLogDiff];
}

void __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  id v23 = 0;
  uint64_t v3 = [v2 loadHomeScreenAndTodayPageConfigurationsWithError:&v23];
  id v4 = v23;
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v3;

  if (v4)
  {
    v7 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_4();
    }
  }
  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    id v8 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_3();
    }

    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(void *)(v9 + 24) = MEMORY[0x1E4F1CBF0];
  }
  id v11 = *(void **)(a1 + 40);
  id v22 = 0;
  uint64_t v12 = [v11 loadDockAppListWithError:&v22];
  id v13 = v22;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(v14 + 56);
  *(void *)(v14 + 56) = v12;

  if (v13)
  {
    id v16 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_2();
    }
  }
  unint64_t v17 = *(void **)(a1 + 32);
  if (!v17[7])
  {
    id v18 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_1();
    }

    uint64_t v19 = objc_opt_new();
    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = *(void **)(v20 + 56);
    *(void *)(v20 + 56) = v19;

    unint64_t v17 = *(void **)(a1 + 32);
  }
  [v17 _populateCachedIconState:v17[3]];
  [*(id *)(a1 + 32) _populateStackKindAndLocation:*(void *)(*(void *)(a1 + 32) + 24)];
}

- (void)homeScreenOrTodayPageConfigDidChange
{
}

- (void)dockAppListDidChange
{
}

- (void)notifySuggestedWidgetsToStacksChanged:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__ATXHomeScreenEventLogger_notifySuggestedWidgetsToStacksChanged___block_invoke;
  v7[3] = &unk_1E5D04FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __66__ATXHomeScreenEventLogger_notifySuggestedWidgetsToStacksChanged___block_invoke(uint64_t a1)
{
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 32) count] >= 0xC9) {
    [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  }
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v3 addEntriesFromDictionary:v2];
}

- (void)_populateCachedIconState:(id)a3
{
  bundleIdToSBPageNumber = self->_bundleIdToSBPageNumber;
  id v5 = a3;
  [(NSMutableDictionary *)bundleIdToSBPageNumber removeAllObjects];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__ATXHomeScreenEventLogger__populateCachedIconState___block_invoke;
  v6[3] = &unk_1E5D08A20;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

void __53__ATXHomeScreenEventLogger__populateCachedIconState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__ATXHomeScreenEventLogger__populateCachedIconState___block_invoke_2;
  v5[3] = &unk_1E5D08140;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  [v4 enumerateApps:v5];
}

void __53__ATXHomeScreenEventLogger__populateCachedIconState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "pageIndex"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = *(void **)(*(void *)(a1 + 32) + 48);
  v7 = [v5 bundleId];

  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (void)_populateStackKindAndLocation:(id)a3
{
  id v4 = a3;
  [(NSMutableDictionary *)self->_stackIdToCachedStackData removeAllObjects];
  *(_DWORD *)&self->_hasAppPanelOnHomeScreen = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__ATXHomeScreenEventLogger__populateStackKindAndLocation___block_invoke;
  v8[3] = &unk_1E5D08A48;
  v8[4] = self;
  v8[5] = &v9;
  [v4 enumerateObjectsUsingBlock:v8];
  if (*((unsigned char *)v10 + 24))
  {
    uint64_t v5 = *MEMORY[0x1E4F4B6A8];
    if (![(NSUserDefaults *)self->_defaults BOOLForKey:*MEMORY[0x1E4F4B6A8]])
    {
      [(NSUserDefaults *)self->_defaults setBool:1 forKey:v5];
      defaults = self->_defaults;
      v7 = [MEMORY[0x1E4F1C9C8] now];
      [(NSUserDefaults *)defaults setObject:v7 forKey:*MEMORY[0x1E4F4B6A0]];
    }
  }
  _Block_object_dispose(&v9, 8);
}

void __58__ATXHomeScreenEventLogger__populateStackKindAndLocation___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v59 = ATXStackLocationForPageAndIndex(v5, a3);
  v60 = v5;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = [v5 stacks];
  uint64_t v55 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
  if (v55)
  {
    uint64_t v53 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v74 != v53) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        id v8 = [v7 widgets];
        if ([v8 count])
        {
          uint64_t v9 = [v60 pageIndex];

          if (v9 != 20000)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
            if ([v60 containsSuggestionsWidget]) {
              *(unsigned char *)(*(void *)(a1 + 32) + 66) = 1;
            }
          }
        }
        else
        {
        }
        v10 = [v7 widgets];
        if ([v10 count])
        {
          uint64_t v11 = [v60 pageIndex];

          if (v11 == 20000 && [v60 containsSuggestionsWidget]) {
            *(unsigned char *)(*(void *)(a1 + 32) + 67) = 1;
          }
        }
        else
        {
        }
        uint64_t v57 = ATXStackKindForStack(v7);
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        char v12 = [v7 widgets];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v69 objects:v79 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v70;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v70 != v15) {
                objc_enumerationMutation(v12);
              }
              unint64_t v17 = *(void **)(*((void *)&v69 + 1) + 8 * j);
              id v18 = [v7 identifier];
              uint64_t v19 = *(void **)(*(void *)(a1 + 32) + 32);
              uint64_t v20 = [v17 widgetUniqueId];
              [v19 setObject:v18 forKeyedSubscript:v20];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v69 objects:v79 count:16];
          }
          while (v14);
        }

        id v21 = objc_opt_new();
        v21[1] = v57;
        v21[2] = v59;
        uint64_t v22 = [v7 identifier];
        id v23 = (void *)v21[3];
        v21[3] = v22;

        v21[4] = [v60 pageIndex];
        uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 40);
        v25 = [v7 identifier];
        [v24 setObject:v21 forKeyedSubscript:v25];
      }
      uint64_t v55 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
    }
    while (v55);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obja = [v60 panels];
  uint64_t v56 = [obja countByEnumeratingWithState:&v65 objects:v78 count:16];
  if (v56)
  {
    uint64_t v54 = *(void *)v66;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v66 != v54) {
          objc_enumerationMutation(obja);
        }
        v27 = *(void **)(*((void *)&v65 + 1) + 8 * v26);
        uint64_t v28 = [v27 widgets];
        if ([v28 count])
        {
          uint64_t v29 = [v60 pageIndex];

          if (v29 != 20000)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
            *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
          }
        }
        else
        {
        }
        uint64_t v30 = [v27 widgets];
        uint64_t v58 = v26;
        if ([v30 count])
        {
          uint64_t v31 = [v60 pageIndex];

          if (v31 == 20000) {
            *(unsigned char *)(*(void *)(a1 + 32) + 65) = 1;
          }
        }
        else
        {
        }
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v32 = [v27 widgets];
        uint64_t v33 = [v32 countByEnumeratingWithState:&v61 objects:v77 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v62;
          do
          {
            for (uint64_t k = 0; k != v34; ++k)
            {
              if (*(void *)v62 != v35) {
                objc_enumerationMutation(v32);
              }
              v37 = *(void **)(*((void *)&v61 + 1) + 8 * k);
              v38 = [v37 extensionBundleId];
              int v39 = [v38 isEqualToString:@"com.apple.proactive.appprediction.panel"];

              if (v39)
              {
                v40 = [v27 identifier];
                id v41 = *(void **)(*(void *)(a1 + 32) + 32);
                v42 = [v37 widgetUniqueId];
                [v41 setObject:v40 forKeyedSubscript:v42];

                v43 = [v27 identifier];
                objc_super v44 = *(void **)(*(void *)(a1 + 32) + 32);
                v45 = [v27 identifier];
                [v44 setObject:v43 forKeyedSubscript:v45];

                v46 = objc_opt_new();
                v46[1] = 1;
                v46[2] = v59;
                uint64_t v47 = [v27 identifier];
                v48 = (void *)v46[3];
                v46[3] = v47;

                v46[4] = [v60 pageIndex];
                v49 = *(void **)(*(void *)(a1 + 32) + 40);
                v50 = [v27 identifier];
                [v49 setObject:v46 forKeyedSubscript:v50];
              }
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v61 objects:v77 count:16];
          }
          while (v34);
        }

        uint64_t v26 = v58 + 1;
      }
      while (v58 + 1 != v56);
      uint64_t v56 = [obja countByEnumeratingWithState:&v65 objects:v78 count:16];
    }
    while (v56);
  }
}

- (void)_updateCurrentConfigurationsAndLogDiff
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXHomeScreenEventLogger: Could not load initial home screen and today page configurations: %@", v2, v3, v4, v5, v6);
}

void __66__ATXHomeScreenEventLogger__updateCurrentConfigurationsAndLogDiff__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__ATXHomeScreenEventLogger__updateCurrentConfigurationsAndLogDiff__block_invoke_cold_1();
    }
  }
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "addedApps", v3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v146 objects:v160 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v147;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v147 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v146 + 1) + 8 * i);
        uint64_t v11 = *(void **)(a1 + 40);
        char v12 = [v10 page];
        [v11 logUserDidAddApp:v10 page:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v146 objects:v160 count:16];
    }
    while (v7);
  }

  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  uint64_t v13 = [*(id *)(a1 + 32) removedApps];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v142 objects:v159 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v143;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v143 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v142 + 1) + 8 * j);
        uint64_t v19 = *(void **)(a1 + 40);
        uint64_t v20 = [v18 page];
        [v19 logUserDidRemoveApp:v18 page:v20];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v142 objects:v159 count:16];
    }
    while (v15);
  }

  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v21 = [*(id *)(a1 + 32) addedPinnedWidgets];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v138 objects:v158 count:16];
  BOOL v112 = v22 != 0;
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v139;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v139 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v138 + 1) + 8 * k);
        v27 = *(void **)(a1 + 40);
        uint64_t v28 = [v26 page];
        [v27 logUserDidAddPinnedWidget:v26 page:v28 defaultsComparator:*(void *)(a1 + 48)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v138 objects:v158 count:16];
    }
    while (v23);
  }

  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  uint64_t v29 = [*(id *)(a1 + 32) widgetsAddedToStacksByUser];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v134 objects:v157 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v135;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v135 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void **)(*((void *)&v134 + 1) + 8 * m);
        uint64_t v35 = [*(id *)(a1 + 48) rankOfWidgetSuggestedInGallery:v34];
        v36 = [v34 widgetUniqueId];

        if (v36)
        {
          v37 = [*(id *)(a1 + 32) stackInCurrentConfigurationsForStackedWidget:v34];
          v38 = [v37 identifier];

          [*(id *)(a1 + 40) logUserDidAddWidgetToStack:v34 stackIdentifier:v38 isSuggestion:v35 != 0];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v134 objects:v157 count:16];
    }
    while (v31);
    BOOL v112 = 1;
  }

  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  int v39 = [*(id *)(a1 + 32) suggestedWidgetsAddedPermanentlyByUser];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v130 objects:v156 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v131;
    do
    {
      for (uint64_t n = 0; n != v41; ++n)
      {
        if (*(void *)v131 != v42) {
          objc_enumerationMutation(v39);
        }
        objc_super v44 = *(void **)(*((void *)&v130 + 1) + 8 * n);
        v45 = [v44 widgetUniqueId];

        if (v45)
        {
          v46 = *(void **)(a1 + 56);
          uint64_t v47 = *(void **)(a1 + 64);
          v48 = [v44 widgetUniqueId];
          v49 = [v47 objectForKeyedSubscript:v48];
          v50 = [v46 objectForKeyedSubscript:v49];

          if (v50 && (uint64_t v51 = v50[3]) != 0)
          {
            [*(id *)(a1 + 40) _logSupplementaryActionInContextMenu:3 stackId:v51 widget:v44 prediction:0];
          }
          else
          {
            v52 = __atxlog_handle_home_screen();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v155 = v44;
              _os_log_error_impl(&dword_1A790D000, v52, OS_LOG_TYPE_ERROR, "ATXHomeScreenEventLogger: Unable to emit 'Add To Stack' event for previously suggested widget %@, due to unkown stackId.", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v130 objects:v156 count:16];
    }
    while (v41);
  }

  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  uint64_t v53 = [*(id *)(a1 + 32) addedStacks];
  uint64_t v54 = [v53 countByEnumeratingWithState:&v126 objects:v153 count:16];
  char v55 = v112;
  if (v54)
  {
    uint64_t v56 = v54;
    uint64_t v57 = *(void *)v127;
    do
    {
      for (iuint64_t i = 0; ii != v56; ++ii)
      {
        if (*(void *)v127 != v57) {
          objc_enumerationMutation(v53);
        }
        uint64_t v59 = *(void **)(*((void *)&v126 + 1) + 8 * ii);
        uint64_t v60 = [*(id *)(a1 + 48) isStackDefaultStack:v59];
        long long v61 = *(void **)(a1 + 40);
        long long v62 = [v59 page];
        [v61 logUserDidCreateStack:v59 page:v62 isSuggestion:v60];
      }
      uint64_t v56 = [v53 countByEnumeratingWithState:&v126 objects:v153 count:16];
    }
    while (v56);
    char v55 = 1;
  }

  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v63 = [*(id *)(a1 + 32) deletedPinnedWidgets];
  uint64_t v64 = [v63 countByEnumeratingWithState:&v122 objects:v152 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v123;
    do
    {
      for (juint64_t j = 0; jj != v65; ++jj)
      {
        if (*(void *)v123 != v66) {
          objc_enumerationMutation(v63);
        }
        long long v68 = *(void **)(*((void *)&v122 + 1) + 8 * jj);
        long long v69 = *(void **)(a1 + 40);
        long long v70 = [v68 widgetUniqueId];
        uint64_t v71 = [v69 _stackLocationGivenWidgetUniqueId:v70 stackIdToStackDataDictionary:*(void *)(a1 + 56) widgetIdToStackIdDictionary:*(void *)(a1 + 64)];

        long long v72 = *(void **)(a1 + 40);
        long long v73 = [v68 page];
        [v72 logUserDidDeletePinnedWidget:v68 stackLocation:v71 page:v73];

        [*(id *)(a1 + 40) _logRemovalDateOfDefaultTVWidgetIfApplicable:v68 configDiffer:*(void *)(a1 + 32)];
      }
      uint64_t v65 = [v63 countByEnumeratingWithState:&v122 objects:v152 count:16];
    }
    while (v65);
    char v55 = 1;
  }

  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v74 = [*(id *)(a1 + 32) widgetsDeletedFromStacksByUser];
  uint64_t v75 = [v74 countByEnumeratingWithState:&v118 objects:v151 count:16];
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v119;
    do
    {
      for (kuint64_t k = 0; kk != v76; ++kk)
      {
        if (*(void *)v119 != v77) {
          objc_enumerationMutation(v74);
        }
        v79 = *(void **)(*((void *)&v118 + 1) + 8 * kk);
        v80 = [*(id *)(a1 + 32) stackInPreviousConfigurationsForStackedWidget:v79];
        uint64_t v81 = [v80 identifier];

        v82 = *(void **)(a1 + 40);
        v83 = [v79 widgetUniqueId];
        uint64_t v84 = [v82 _stackKindGivenWidgetUniqueId:v83 stackIdToStackDataDictionary:*(void *)(a1 + 56) widgetIdToStackIdDictionary:*(void *)(a1 + 64)];

        v85 = *(void **)(a1 + 40);
        v86 = [v79 widgetUniqueId];
        uint64_t v87 = [v85 _stackLocationGivenWidgetUniqueId:v86 stackIdToStackDataDictionary:*(void *)(a1 + 56) widgetIdToStackIdDictionary:*(void *)(a1 + 64)];

        [*(id *)(a1 + 40) logUserDidDeleteWidgetOnStack:v79 stackIdentifier:v81 stackKind:v84 stackLocation:v87];
        [*(id *)(a1 + 40) _logRemovalDateOfDefaultTVWidgetIfApplicable:v79 configDiffer:*(void *)(a1 + 32)];
      }
      uint64_t v76 = [v74 countByEnumeratingWithState:&v118 objects:v151 count:16];
    }
    while (v76);
    char v55 = 1;
  }

  v88 = *(void **)(a1 + 40);
  v89 = [*(id *)(a1 + 32) suggestedWidgetsRemoved];
  [v88 _handleRemovedSuggestedWidgetsIfNecessary:v89];

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  v90 = [*(id *)(a1 + 32) deletedStacks];
  uint64_t v91 = [v90 countByEnumeratingWithState:&v114 objects:v150 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v115;
    obuint64_t j = v90;
    do
    {
      for (muint64_t m = 0; mm != v92; ++mm)
      {
        if (*(void *)v115 != v93) {
          objc_enumerationMutation(obj);
        }
        v95 = *(void **)(*((void *)&v114 + 1) + 8 * mm);
        v96 = *(void **)(a1 + 40);
        v97 = [v95 widgets];
        v98 = [v97 firstObject];
        v99 = [v98 widgetUniqueId];
        uint64_t v100 = [v96 _stackKindGivenWidgetUniqueId:v99 stackIdToStackDataDictionary:*(void *)(a1 + 56) widgetIdToStackIdDictionary:*(void *)(a1 + 64)];

        v101 = *(void **)(a1 + 40);
        v102 = [v95 widgets];
        v103 = [v102 firstObject];
        v104 = [v103 widgetUniqueId];
        uint64_t v105 = [v101 _stackLocationGivenWidgetUniqueId:v104 stackIdToStackDataDictionary:*(void *)(a1 + 56) widgetIdToStackIdDictionary:*(void *)(a1 + 64)];

        v106 = *(void **)(a1 + 40);
        v107 = [v95 page];
        [v106 logUserDidDeleteStack:v95 stackKind:v100 stackLocation:v105 page:v107];
      }
      uint64_t v92 = [obj countByEnumeratingWithState:&v114 objects:v150 count:16];
    }
    while (v92);
  }
  else
  {

    if ((v55 & 1) == 0)
    {
      v108 = __atxlog_handle_home_screen();
      v109 = v111;
      if (!os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_87;
      }
      *(_WORD *)buf = 0;
      v110 = "ATXHomeScreenEventLogger: No widget or stack changes, not updating default home screen items";
      goto LABEL_86;
    }
  }
  notify_post((const char *)[@"com.apple.duetexpertd.updateDefaultsDueToRelevantHomeScreenConfigUpdate" UTF8String]);
  v108 = __atxlog_handle_home_screen();
  v109 = v111;
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v110 = "ATXHomeScreenEventLogger: Widgets or stacks changed, updating default home screen items";
LABEL_86:
    _os_log_impl(&dword_1A790D000, v108, OS_LOG_TYPE_DEFAULT, v110, buf, 2u);
  }
LABEL_87:
}

- (void)_logRemovalDateOfDefaultTVWidgetIfApplicable:(id)a3 configDiffer:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (![MEMORY[0x1E4F93B08] isiPad]) {
    goto LABEL_10;
  }
  uint64_t v7 = [v16 extensionBundleId];
  if (([v7 isEqualToString:@"com.apple.tv.TVWidgetExtension"] & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v8 = [v16 widgetKind];
  if (([v8 isEqualToString:@"com.apple.tv"] & 1) == 0)
  {

    goto LABEL_9;
  }
  uint64_t v9 = [v16 size];

  if (v9 == 4
    && ([(NSUserDefaults *)self->_defaults integerForKey:*MEMORY[0x1E4F4B5F0]] & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    uint64_t v10 = *MEMORY[0x1E4F4B5E8];
    uint64_t v11 = [(NSUserDefaults *)self->_defaults objectForKey:*MEMORY[0x1E4F4B5E8]];
    if (v11)
    {
    }
    else
    {
      char v12 = [v16 extensionBundleId];
      uint64_t v13 = [v16 widgetKind];
      char v14 = objc_msgSend(v6, "currentConfigContainsWidgetWithBundleId:kind:size:", v12, v13, objc_msgSend(v16, "size"));

      if ((v14 & 1) == 0)
      {
        defaults = self->_defaults;
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", v10);
      }
    }
  }
LABEL_10:
}

- (void)_handleRemovedSuggestedWidgetsIfNecessary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_69);
  if ([v4 count])
  {
    uint64_t v5 = *MEMORY[0x1E4F4B6E8];
    uint64_t v6 = [(NSUserDefaults *)self->_defaults integerForKey:*MEMORY[0x1E4F4B6E8]];
    if (v6 <= 9)
    {
      uint64_t v7 = v6;
      uint64_t v21 = v5;
      uint64_t v20 = *MEMORY[0x1E4F4B6F0];
      NSInteger v8 = -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:");
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v23 = v4;
      id v9 = v4;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v22 = self;
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v25;
        p_delegate = &self->_delegate;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * v14);
            id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
            int v17 = [WeakRetained hasWidgetBeenSeen:v15];

            if (v17)
            {
              ++v7;
              id v18 = objc_loadWeakRetained((id *)p_delegate);
              unsigned int v19 = [v18 hasWidgetBeenTapped:v15];

              v8 += v19;
            }
            ++v14;
          }
          while (v11 != v14);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v11);
      }

      [(NSUserDefaults *)v22->_defaults setInteger:v7 forKey:v21];
      [(NSUserDefaults *)v22->_defaults setInteger:v8 forKey:v20];
      uint64_t v4 = v23;
    }
  }
}

uint64_t __70__ATXHomeScreenEventLogger__handleRemovedSuggestedWidgetsIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 extensionBundleId];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F4B5F8]];

  return v3;
}

- (id)_pageIndexGivenWidgetUniqueId:(id)a3
{
  return [(ATXHomeScreenEventLogger *)self _pageIndexGivenWidgetUniqueId:a3 stackIdToStackDataDictionary:self->_stackIdToCachedStackData widgetIdToStackIdDictionary:self->_widgetIdToStackId];
}

- (id)_pageIndexGivenWidgetUniqueId:(id)a3 stackIdToStackDataDictionary:(id)a4 widgetIdToStackIdDictionary:(id)a5
{
  id v7 = a4;
  NSInteger v8 = [a5 objectForKeyedSubscript:a3];
  if (v8 && ([v7 objectForKeyedSubscript:v8], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:*(void *)(v9 + 32)];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (unint64_t)_stackKindGivenWidgetUniqueId:(id)a3
{
  return [(ATXHomeScreenEventLogger *)self _stackKindGivenWidgetUniqueId:a3 stackIdToStackDataDictionary:self->_stackIdToCachedStackData widgetIdToStackIdDictionary:self->_widgetIdToStackId];
}

- (unint64_t)_stackKindGivenWidgetUniqueId:(id)a3 stackIdToStackDataDictionary:(id)a4 widgetIdToStackIdDictionary:(id)a5
{
  id v7 = a4;
  NSInteger v8 = [a5 objectForKeyedSubscript:a3];
  if (v8
    && ([v7 objectForKeyedSubscript:v8], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v10 = v9[1];
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (unint64_t)_stackLocationGivenWidgetUniqueId:(id)a3
{
  return [(ATXHomeScreenEventLogger *)self _stackLocationGivenWidgetUniqueId:a3 stackIdToStackDataDictionary:self->_stackIdToCachedStackData widgetIdToStackIdDictionary:self->_widgetIdToStackId];
}

- (unint64_t)_stackLocationGivenWidgetUniqueId:(id)a3 stackIdToStackDataDictionary:(id)a4 widgetIdToStackIdDictionary:(id)a5
{
  id v7 = a4;
  NSInteger v8 = [a5 objectForKeyedSubscript:a3];
  if (v8
    && ([v7 objectForKeyedSubscript:v8], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v10 = v9[2];
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (id)_stackIdentifierGivenWidgetUniqueId:(id)a3
{
  return [(ATXHomeScreenEventLogger *)self _stackIdentifierGivenWidgetUniqueId:a3 widgetIdToStackIdDictionary:self->_widgetIdToStackId];
}

- (id)_stackIdentifierGivenWidgetUniqueId:(id)a3 widgetIdToStackIdDictionary:(id)a4
{
  return (id)[a4 objectForKeyedSubscript:a3];
}

- (void)_logProactiveWidgetEvent:(int)a3 suggestionIdentifiers:(id)a4 widget:(id)a5 blendingCacheId:(id)a6 date:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v24 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (v13)
  {
    if (v10 >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v15 = off_1E5D08C30[(int)v10];
    }
    id v16 = [v12 widgetUniqueId];
    int v17 = [(ATXHomeScreenEventLogger *)self _stackIdentifierGivenWidgetUniqueId:v16];
    id v18 = [v12 widgetUniqueId];
    unint64_t v19 = [(ATXHomeScreenEventLogger *)self _stackKindGivenWidgetUniqueId:v18];
    uint64_t v20 = [v12 widgetUniqueId];
    uint64_t v21 = [(ATXHomeScreenEventLogger *)self _homeScreenEventWithDate:v14 eventTypeString:v15 stackIdentifier:v17 stackKind:v19 stackLocation:[(ATXHomeScreenEventLogger *)self _stackLocationGivenWidgetUniqueId:v20] reason:0 widget:v12 blendingCacheIdentifier:v13 metadata:0];

    [v21 setSuggestionIds:v24];
    biomeUIStreauint64_t m = self->_biomeUIStream;
    uint64_t v23 = +[ATXUIEvent uiEventWithHomeScreenEvent:v21];
    [(ATXUniversalBiomeUIStream *)biomeUIStream donateGenericUIEvent:v23];
  }
}

- (void)_logCaptureRateForAppPredictionPanelWithEngagedSuggestion:(id)a3 isSuggestionsWidget:(BOOL)a4 widgetIdentifier:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  id v8 = a5;
  if (self->_hasAppPanelOnHomeScreen)
  {
    uint64_t v9 = [v13 executableSpecification];
    uint64_t v10 = [v9 executableType];

    if (!ATXStackLocationIsTodayPage([(ATXHomeScreenEventLogger *)self _stackLocationGivenWidgetUniqueId:v8]))
    {
      if (v6)
      {
        if (v10 == 2)
        {
          tracker = self->_tracker;
          uint64_t v12 = 5001;
        }
        else
        {
          if (v10 != 1) {
            goto LABEL_10;
          }
          tracker = self->_tracker;
          uint64_t v12 = 5003;
        }
        +[ATXBlendingCaptureRateTracker logHomeScreenDiversionWithCaptureType:v12 tracker:tracker];
      }
      else
      {
        +[ATXBlendingCaptureRateTracker logHomeScreenCaptureWithTracker:self->_tracker];
      }
    }
  }
LABEL_10:
}

- (void)_logCaptureRateDiversionIfAppPredictionPanelExistsWithTappedWidget:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 widgetUniqueId];

  if (v4)
  {
    uint64_t v5 = [v10 extensionBundleId];
    if ([v5 isEqualToString:*MEMORY[0x1E4F4B5F8]])
    {
    }
    else
    {
      BOOL v6 = [v10 extensionBundleId];
      char v7 = [v6 isEqualToString:@"com.apple.proactive.appprediction.panel"];

      if ((v7 & 1) == 0)
      {
        id v8 = [v10 widgetUniqueId];
        unint64_t v9 = [(ATXHomeScreenEventLogger *)self _stackLocationGivenWidgetUniqueId:v8];

        if (self->_hasAppPanelOnHomeScreen && !ATXStackLocationIsTodayPage(v9)) {
          +[ATXBlendingCaptureRateTracker logHomeScreenDiversionWithCaptureType:5002 tracker:self->_tracker];
        }
      }
    }
  }
}

- (void)_logAppLaunchOverallCaptureRateFromAppPredictionPanelWithTappedWidget:(id)a3 suggestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 widgetUniqueId];
  unint64_t v9 = [(ATXHomeScreenEventLogger *)self _stackLocationGivenWidgetUniqueId:v8];

  id v10 = [v6 extensionBundleId];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F4B5F8]];

  if (v11)
  {
    BOOL v12 = !ATXStackLocationIsTodayPage(v9);
    unsigned int v13 = 8;
  }
  else
  {
    id v14 = [v6 extensionBundleId];
    int v15 = [v14 isEqualToString:@"com.apple.proactive.appprediction.panel"];

    if (!v15) {
      goto LABEL_21;
    }
    BOOL v12 = !ATXStackLocationIsTodayPage(v9);
    unsigned int v13 = 6;
  }
  if (v12) {
    uint64_t v16 = v13;
  }
  else {
    uint64_t v16 = v13 + 1;
  }
  int v17 = [v7 bundleIdExecutableObject];
  if (v17
    || ([v7 atxActionExecutableObject],
        id v18 = objc_claimAutoreleasedReturnValue(),
        [v18 bundleId],
        int v17 = objc_claimAutoreleasedReturnValue(),
        v18,
        v17))
  {
    unint64_t v19 = [(NSMutableDictionary *)self->_bundleIdToSBPageNumber objectForKeyedSubscript:v17];
    uint64_t v20 = v19;
    if (v19)
    {
      unint64_t v21 = [v19 unsignedIntegerValue];
      if (v21 >= 6) {
        uint64_t v22 = 8;
      }
      else {
        uint64_t v22 = (v21 + 2);
      }
    }
    else
    {
      uint64_t v22 = [(NSSet *)self->_dockAppSet containsObject:v17];
    }
    uint64_t v23 = objc_opt_new();
    [v23 setCaptureType:v16];
    [v23 setIconLocation:v22];
    id v24 = (void *)CFPreferencesCopyValue(@"SBSearchDisabledDomains", @"com.apple.spotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    uint64_t v25 = [v24 containsObject:@"DOMAIN_ZKWS"] ^ 1;

    [v23 setSpotlightEnabled:v25];
    long long v26 = (void *)CFPreferencesCopyAppValue(@"SuggestionsAppLibraryEnabled", @"com.apple.suggestions");
    long long v27 = v26;
    if (v26) {
      uint64_t v28 = [v26 BOOLValue];
    }
    else {
      uint64_t v28 = 1;
    }

    [v23 setAppLibraryEnabled:v28];
    [v23 setAppPredictionPanelTodayEnabled:self->_hasAppPanelOnLoH];
    [v23 setAppPredictionPanelEnabled:self->_hasAppPanelOnHomeScreen];
    [v23 setSuggestionsWidgetEnabled:self->_hasSuggestionWidgetOnHomeScreen];
    [v23 setSuggestionsWidgetTodayEnabled:self->_hasSuggestionWidgetOnLoH];
    [(ATXPETEventTracker2Protocol *)self->_tracker trackScalarForMessage:v23];
    uint64_t v29 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[ATXHomeScreenEventLogger _logAppLaunchOverallCaptureRateFromAppPredictionPanelWithTappedWidget:suggestion:]((uint64_t)self, v23, v29);
    }
  }
LABEL_21:
}

- (void)_logAppPanelLaunchRatioWithTappedWidget:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 extensionBundleId];
  int v5 = [v4 isEqualToString:@"com.apple.proactive.appprediction.panel"];

  id v6 = v10;
  if (v5)
  {
    id v7 = [v10 widgetUniqueId];
    id v8 = [(ATXHomeScreenEventLogger *)self _pageIndexGivenWidgetUniqueId:v7];

    if (v8)
    {
      unint64_t v9 = [v8 unsignedIntegerValue];
      if (v9 < 0x4E20) {
        +[ATXAppPanelLaunchRatioLogger logAppPanelAppLaunchWithSBPageIndex:v9];
      }
    }

    id v6 = v10;
  }
}

- (void)logHomeScreenDidDisappearWithReason:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__ATXHomeScreenEventLogger_logHomeScreenDidDisappearWithReason___block_invoke;
  v7[3] = &unk_1E5D04FC8;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __64__ATXHomeScreenEventLogger_logHomeScreenDidDisappearWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __64__ATXHomeScreenEventLogger_logHomeScreenDidDisappearWithReason___block_invoke_cold_1();
  }

  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  [v3 _sendEventToBiomeWithDate:v4 eventType:1 stackIdentifier:0 stackKind:0 stackLocation:0 reason:*(void *)(a1 + 32) widget:0 blendingCacheIdentifier:0 metadata:0];
}

- (void)logSpecialPageDidAppear:(unint64_t)a3 widgetsByStackId:(id)a4 prediction:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__ATXHomeScreenEventLogger_logSpecialPageDidAppear_widgetsByStackId_prediction___block_invoke;
  v13[3] = &unk_1E5D071E0;
  id v14 = v8;
  int v15 = self;
  id v16 = v9;
  unint64_t v17 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __80__ATXHomeScreenEventLogger_logSpecialPageDidAppear_widgetsByStackId_prediction___block_invoke(uint64_t a1)
{
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __80__ATXHomeScreenEventLogger_logSpecialPageDidAppear_widgetsByStackId_prediction___block_invoke_cold_1();
  }

  uint64_t v3 = objc_opt_new();
  id v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  [v3 setPageIndex:v4];

  [v3 setStacks:*(void *)(a1 + 32)];
  int v5 = *(void **)(a1 + 40);
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  id v7 = [*(id *)(a1 + 48) blendingCacheId];
  [v5 _sendEventToBiomeWithDate:v6 eventType:12 stackIdentifier:0 stackKind:0 stackLocation:0 reason:0 widget:0 blendingCacheIdentifier:v7 metadata:v3];
}

- (void)logSpecialPageDidDisappear:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__ATXHomeScreenEventLogger_logSpecialPageDidDisappear___block_invoke;
  v4[3] = &unk_1E5D08AB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __55__ATXHomeScreenEventLogger_logSpecialPageDidDisappear___block_invoke(uint64_t a1)
{
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __55__ATXHomeScreenEventLogger_logSpecialPageDidDisappear___block_invoke_cold_1();
  }

  uint64_t v3 = objc_opt_new();
  id v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v3 setPageIndex:v4];

  int v5 = *(void **)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  [v5 _sendEventToBiomeWithDate:v6 eventType:13 stackIdentifier:0 stackKind:0 stackLocation:0 reason:0 widget:0 blendingCacheIdentifier:0 metadata:v3];
}

- (void)logWidgetDidAppear:(id)a3 stackId:(id)a4 prediction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__ATXHomeScreenEventLogger_logWidgetDidAppear_stackId_prediction___block_invoke;
  v15[3] = &unk_1E5D07ED0;
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

void __66__ATXHomeScreenEventLogger_logWidgetDidAppear_stackId_prediction___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    int v5 = [v3 widgetUniqueId];
    *(_DWORD *)buf = 136315906;
    id v18 = "-[ATXHomeScreenEventLogger logWidgetDidAppear:stackId:prediction:]_block_invoke";
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    __int16 v21 = 2112;
    uint64_t v22 = v3;
    __int16 v23 = 2114;
    id v24 = v5;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "%s: stackID: %{public}@ topWidget: %@ (widgetID %{public}@)", buf, 0x2Au);
  }
  id v6 = *(void **)(a1 + 48);
  id v7 = [MEMORY[0x1E4F1C9C8] now];
  id v8 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) widgetUniqueId];
  uint64_t v11 = [v8 _stackKindGivenWidgetUniqueId:v10];
  id v12 = *(void **)(a1 + 48);
  id v13 = [*(id *)(a1 + 40) widgetUniqueId];
  uint64_t v14 = [v12 _stackLocationGivenWidgetUniqueId:v13];
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = [*(id *)(a1 + 56) blendingCacheId];
  [v6 _sendEventToBiomeWithDate:v7 eventType:14 stackIdentifier:v9 stackKind:v11 stackLocation:v14 reason:0 widget:v15 blendingCacheIdentifier:v16 metadata:0];
}

- (void)logWidgetDidDisappear:(id)a3 stackId:(id)a4 prediction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__ATXHomeScreenEventLogger_logWidgetDidDisappear_stackId_prediction___block_invoke;
  v15[3] = &unk_1E5D07ED0;
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

void __69__ATXHomeScreenEventLogger_logWidgetDidDisappear_stackId_prediction___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    int v5 = [v3 widgetUniqueId];
    *(_DWORD *)buf = 136315906;
    id v18 = "-[ATXHomeScreenEventLogger logWidgetDidDisappear:stackId:prediction:]_block_invoke";
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    __int16 v21 = 2112;
    uint64_t v22 = v3;
    __int16 v23 = 2114;
    id v24 = v5;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "%s: stackID: %{public}@ topWidget: %@ (widgetID %{public}@)", buf, 0x2Au);
  }
  id v6 = *(void **)(a1 + 48);
  id v7 = [MEMORY[0x1E4F1C9C8] now];
  id v8 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) widgetUniqueId];
  uint64_t v11 = [v8 _stackKindGivenWidgetUniqueId:v10];
  id v12 = *(void **)(a1 + 48);
  id v13 = [*(id *)(a1 + 40) widgetUniqueId];
  uint64_t v14 = [v12 _stackLocationGivenWidgetUniqueId:v13];
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = [*(id *)(a1 + 56) blendingCacheId];
  [v6 _sendEventToBiomeWithDate:v7 eventType:15 stackIdentifier:v9 stackKind:v11 stackLocation:v14 reason:0 widget:v15 blendingCacheIdentifier:v16 metadata:0];
}

- (void)logStackDidAppear:(id)a3 topWidget:(id)a4 prediction:(id)a5
{
  if (a4) {
    [(ATXHomeScreenEventLogger *)self logWidgetDidAppear:a4 stackId:a3 prediction:a5];
  }
}

- (void)logStackDidDisappear:(id)a3 topWidget:(id)a4 prediction:(id)a5
{
  if (a4) {
    [(ATXHomeScreenEventLogger *)self logWidgetDidDisappear:a4 stackId:a3 prediction:a5];
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
  queue = self->_queue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__ATXHomeScreenEventLogger_logStackVisibilityChanged_visibleRect_topWidget_prediction___block_invoke;
  v20[3] = &unk_1E5D08AE0;
  id v21 = v13;
  id v22 = v14;
  CGFloat v25 = x;
  CGFloat v26 = y;
  CGFloat v27 = width;
  CGFloat v28 = height;
  __int16 v23 = self;
  id v24 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  dispatch_async(queue, v20);
}

void __87__ATXHomeScreenEventLogger_logStackVisibilityChanged_visibleRect_topWidget_prediction___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    int v5 = [v3 widgetUniqueId];
    *(_DWORD *)buf = 136315906;
    uint64_t v20 = "-[ATXHomeScreenEventLogger logStackVisibilityChanged:visibleRect:topWidget:prediction:]_block_invoke";
    __int16 v21 = 2114;
    uint64_t v22 = v4;
    __int16 v23 = 2112;
    id v24 = v3;
    __int16 v25 = 2114;
    CGFloat v26 = v5;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "%s: stackID: %{public}@ topWidget: %@ (widgetID %{public}@)", buf, 0x2Au);
  }
  id v6 = objc_opt_new();
  id v7 = -[ATXCGRectWrapper initWithCGRect:]([ATXCGRectWrapper alloc], "initWithCGRect:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  [v6 setVisibleRect:v7];

  id v8 = *(void **)(a1 + 48);
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
  id v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) widgetUniqueId];
  uint64_t v13 = [v10 _stackKindGivenWidgetUniqueId:v12];
  id v14 = *(void **)(a1 + 48);
  id v15 = [*(id *)(a1 + 40) widgetUniqueId];
  uint64_t v16 = [v14 _stackLocationGivenWidgetUniqueId:v15];
  uint64_t v17 = *(void *)(a1 + 40);
  id v18 = [*(id *)(a1 + 56) blendingCacheId];
  [v8 _sendEventToBiomeWithDate:v9 eventType:20 stackIdentifier:v11 stackKind:v13 stackLocation:v16 reason:0 widget:v17 blendingCacheIdentifier:v18 metadata:v6];
}

- (void)logStackStatusDidChange:(id)a3 widgetOnTop:(id)a4 reason:(unint64_t)a5 prediction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__ATXHomeScreenEventLogger_logStackStatusDidChange_widgetOnTop_reason_prediction___block_invoke;
  block[3] = &unk_1E5D08B08;
  __int16 v21 = self;
  unint64_t v22 = a5;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

void __82__ATXHomeScreenEventLogger_logStackStatusDidChange_widgetOnTop_reason_prediction___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    id v6 = [v4 widgetUniqueId];
    *(_DWORD *)buf = 67109890;
    int v22 = v3;
    __int16 v23 = 2114;
    uint64_t v24 = v5;
    __int16 v25 = 2112;
    CGFloat v26 = v4;
    __int16 v27 = 2114;
    CGFloat v28 = v6;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "logStackStatusDidChange: reason: %d, stackID: %{public}@, widget: %@ (widgetID %{public}@)", buf, 0x26u);
  }
  if (*(void *)(a1 + 64) == 2)
  {
    id v7 = [*(id *)(a1 + 48) suggestionForStackIdentifier:*(void *)(a1 + 32)];
    if ([v7 isLowConfidenceStackRotationForStaleStack])
    {
      id v8 = objc_opt_new();
      [v8 setIsStalenessRotation:MEMORY[0x1E4F1CC38]];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v20 = *(void **)(a1 + 56);
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
  id v10 = *(void **)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) widgetUniqueId];
  uint64_t v13 = [v10 _stackKindGivenWidgetUniqueId:v12];
  id v14 = *(void **)(a1 + 56);
  id v15 = [*(id *)(a1 + 40) widgetUniqueId];
  uint64_t v16 = [v14 _stackLocationGivenWidgetUniqueId:v15];
  uint64_t v17 = NSStringForATXHomeScreenStackChangeReason(*(void *)(a1 + 64));
  uint64_t v18 = *(void *)(a1 + 40);
  id v19 = [*(id *)(a1 + 48) blendingCacheId];
  [v20 _sendEventToBiomeWithDate:v9 eventType:3 stackIdentifier:v11 stackKind:v13 stackLocation:v16 reason:v17 widget:v18 blendingCacheIdentifier:v19 metadata:v8];
}

- (void)logStackDidTap:(id)a3 engagedUrl:(id)a4 widgetOnTop:(id)a5 prediction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__ATXHomeScreenEventLogger_logStackDidTap_engagedUrl_widgetOnTop_prediction___block_invoke;
  block[3] = &unk_1E5D08560;
  id v20 = v10;
  id v21 = v12;
  int v22 = self;
  id v23 = v11;
  id v24 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(queue, block);
}

void __77__ATXHomeScreenEventLogger_logStackDidTap_engagedUrl_widgetOnTop_prediction___block_invoke(uint64_t a1)
{
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __77__ATXHomeScreenEventLogger_logStackDidTap_engagedUrl_widgetOnTop_prediction___block_invoke_cold_1(a1, v2);
  }

  [*(id *)(a1 + 48) _logCaptureRateDiversionIfAppPredictionPanelExistsWithTappedWidget:*(void *)(a1 + 40)];
  uint64_t v3 = objc_opt_new();
  [v3 setEngagedUrl:*(void *)(a1 + 56)];
  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  id v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) widgetUniqueId];
  uint64_t v9 = [v6 _stackKindGivenWidgetUniqueId:v8];
  id v10 = *(void **)(a1 + 48);
  id v11 = [*(id *)(a1 + 40) widgetUniqueId];
  uint64_t v12 = [v10 _stackLocationGivenWidgetUniqueId:v11];
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = [*(id *)(a1 + 64) blendingCacheId];
  [v4 _sendEventToBiomeWithDate:v5 eventType:4 stackIdentifier:v7 stackKind:v9 stackLocation:v12 reason:0 widget:v13 blendingCacheIdentifier:v14 metadata:v3];
}

- (void)logStackDidTap:(id)a3 widgetOnTop:(id)a4 prediction:(id)a5
{
}

- (void)_logSupplementaryActionInContextMenu:(unint64_t)a3 stackId:(id)a4 widget:(id)a5 prediction:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__ATXHomeScreenEventLogger__logSupplementaryActionInContextMenu_stackId_widget_prediction___block_invoke;
  block[3] = &unk_1E5D08B08;
  id v18 = v10;
  id v19 = v11;
  id v21 = v12;
  unint64_t v22 = a3;
  id v20 = self;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

void __91__ATXHomeScreenEventLogger__logSupplementaryActionInContextMenu_stackId_widget_prediction___block_invoke(uint64_t a1)
{
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __91__ATXHomeScreenEventLogger__logSupplementaryActionInContextMenu_stackId_widget_prediction___block_invoke_cold_1((void *)a1, v2);
  }

  uint64_t v3 = *(void **)(a1 + 48);
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) widgetUniqueId];
  uint64_t v8 = [v5 _stackKindGivenWidgetUniqueId:v7];
  uint64_t v9 = *(void **)(a1 + 48);
  id v10 = [*(id *)(a1 + 40) widgetUniqueId];
  uint64_t v11 = [v9 _stackLocationGivenWidgetUniqueId:v10];
  id v12 = NSStringForATXHomeScreenWidgetExplicitFeedback(*(void *)(a1 + 64));
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = [*(id *)(a1 + 56) blendingCacheId];
  [v3 _sendEventToBiomeWithDate:v4 eventType:6 stackIdentifier:v6 stackKind:v8 stackLocation:v11 reason:v12 widget:v13 blendingCacheIdentifier:v14 metadata:0];
}

- (void)logUserDidChangeStackConfiguration:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__ATXHomeScreenEventLogger_logUserDidChangeStackConfiguration___block_invoke;
  v7[3] = &unk_1E5D04FC8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__ATXHomeScreenEventLogger_logUserDidChangeStackConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __63__ATXHomeScreenEventLogger_logUserDidChangeStackConfiguration___block_invoke_cold_1();
  }

  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  [v3 _sendEventToBiomeWithDate:v4 eventType:7 stackIdentifier:*(void *)(a1 + 32) stackKind:0 stackLocation:0 reason:0 widget:0 blendingCacheIdentifier:0 metadata:0];
}

- (void)logUserDidAddPinnedWidget:(id)a3 page:(id)a4 defaultsComparator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__ATXHomeScreenEventLogger_logUserDidAddPinnedWidget_page_defaultsComparator___block_invoke;
  v15[3] = &unk_1E5D07ED0;
  id v16 = v8;
  id v17 = v10;
  id v18 = self;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __78__ATXHomeScreenEventLogger_logUserDidAddPinnedWidget_page_defaultsComparator___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v3 widgetUniqueId];
    *(_DWORD *)buf = 136315650;
    id v24 = "-[ATXHomeScreenEventLogger logUserDidAddPinnedWidget:page:defaultsComparator:]_block_invoke";
    __int16 v25 = 2112;
    CGFloat v26 = v3;
    __int16 v27 = 2114;
    CGFloat v28 = v4;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "%s: user added pinned widget: %@ (widgetID %{public}@)", buf, 0x20u);
  }
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [*(id *)(a1 + 40) rankOfWidgetSuggestedInGallery:*(void *)(a1 + 32)];
  uint64_t v7 = [NSNumber numberWithInt:v6 != 0];
  [v5 setIsSuggestionInAddWidgetSheet:v7];

  [*(id *)(a1 + 48) _populateSuggestedPageMetadata:v5 forPage:*(void *)(a1 + 56)];
  id v8 = *(void **)(a1 + 48);
  id v9 = [MEMORY[0x1E4F1C9C8] now];
  id v10 = *(void **)(a1 + 48);
  uint64_t v11 = [*(id *)(a1 + 32) widgetUniqueId];
  id v12 = objc_msgSend(v8, "_homeScreenEventWithDate:eventTypeString:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v9, @"PinnedWidgetAdded", 0, 1, objc_msgSend(v10, "_stackLocationGivenWidgetUniqueId:", v11), 0, *(void *)(a1 + 32), 0, v5);

  id v13 = *(void **)(*(void *)(a1 + 48) + 80);
  id v14 = +[ATXUIEvent uiEventWithHomeScreenEvent:v12];
  [v13 donateGenericUIEvent:v14];

  id v15 = objc_alloc(MEMORY[0x1E4F4FE08]);
  id v16 = [*(id *)(a1 + 32) extensionBundleId];
  id v17 = [MEMORY[0x1E4F28F80] processInfo];
  id v18 = [v17 operatingSystemVersionString];
  id v19 = (void *)[v15 initWithContentIdentifier:@"com.apple.duetexpertd.widget.added" context:v16 osBuild:v18 userInfo:0];

  id v20 = [*(id *)(*(void *)(a1 + 48) + 88) source];
  [v20 sendEvent:v19];

  id v21 = [*(id *)(a1 + 48) delegate];
  unint64_t v22 = [*(id *)(a1 + 40) galleryItems];
  [v21 logWidgetAddedFeaturesInCoreAnalytics:v12 rankOfWidgetInGallery:v6 galleryItems:v22];
}

- (void)logUserDidDeletePinnedWidget:(id)a3 stackLocation:(unint64_t)a4 page:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__ATXHomeScreenEventLogger_logUserDidDeletePinnedWidget_stackLocation_page___block_invoke;
  v13[3] = &unk_1E5D071E0;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  unint64_t v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __76__ATXHomeScreenEventLogger_logUserDidDeletePinnedWidget_stackLocation_page___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v3 widgetUniqueId];
    *(_DWORD *)buf = 136315650;
    id v9 = "-[ATXHomeScreenEventLogger logUserDidDeletePinnedWidget:stackLocation:page:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "%s: user deleted pinned widget: %@ (widgetID %{public}@)", buf, 0x20u);
  }
  uint64_t v5 = objc_opt_new();
  [*(id *)(a1 + 40) _populateSuggestedPageMetadata:v5 forPage:*(void *)(a1 + 48)];
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
  [v6 _sendEventToBiomeWithDate:v7 eventType:11 stackIdentifier:0 stackKind:1 stackLocation:*(void *)(a1 + 56) reason:0 widget:*(void *)(a1 + 32) blendingCacheIdentifier:0 metadata:v5];
}

- (void)logUserDidAddApp:(id)a3 page:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ATXHomeScreenEventLogger_logUserDidAddApp_page___block_invoke;
  block[3] = &unk_1E5D05D78;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __50__ATXHomeScreenEventLogger_logUserDidAddApp_page___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [*(id *)(a1 + 32) bundleId];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v2 setBundleIds:v4];

  [*(id *)(a1 + 40) _populateSuggestedPageMetadata:v2 forPage:*(void *)(a1 + 48)];
  if ([v2 suggestedPageType])
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = [MEMORY[0x1E4F1C9C8] now];
    [v5 _sendEventToBiomeWithDate:v6 eventType:21 stackIdentifier:0 stackKind:0 stackLocation:0 reason:0 widget:0 blendingCacheIdentifier:0 metadata:v2];
  }
}

- (void)logUserDidRemoveApp:(id)a3 page:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ATXHomeScreenEventLogger_logUserDidRemoveApp_page___block_invoke;
  block[3] = &unk_1E5D05D78;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __53__ATXHomeScreenEventLogger_logUserDidRemoveApp_page___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [*(id *)(a1 + 32) bundleId];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v2 setBundleIds:v4];

  [*(id *)(a1 + 40) _populateSuggestedPageMetadata:v2 forPage:*(void *)(a1 + 48)];
  if ([v2 suggestedPageType])
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = [MEMORY[0x1E4F1C9C8] now];
    [v5 _sendEventToBiomeWithDate:v6 eventType:22 stackIdentifier:0 stackKind:0 stackLocation:0 reason:0 widget:0 blendingCacheIdentifier:0 metadata:v2];
  }
}

- (void)logUserDidAddWidgetToStack:(id)a3 stackIdentifier:(id)a4 isSuggestion:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__ATXHomeScreenEventLogger_logUserDidAddWidgetToStack_stackIdentifier_isSuggestion___block_invoke;
  v13[3] = &unk_1E5D08B30;
  BOOL v17 = a5;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __84__ATXHomeScreenEventLogger_logUserDidAddWidgetToStack_stackIdentifier_isSuggestion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v3 widgetUniqueId];
    *(_DWORD *)buf = 136315650;
    unint64_t v22 = "-[ATXHomeScreenEventLogger logUserDidAddWidgetToStack:stackIdentifier:isSuggestion:]_block_invoke";
    __int16 v23 = 2112;
    id v24 = v3;
    __int16 v25 = 2114;
    CGFloat v26 = v4;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "%s: user added widget to stack: %@ (widgetID %{public}@)", buf, 0x20u);
  }
  uint64_t v5 = objc_opt_new();
  id v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  [v5 setIsSuggestionInAddWidgetSheet:v6];

  id v7 = *(void **)(a1 + 40);
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  id v10 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v11 = [*(id *)(a1 + 32) widgetUniqueId];
  uint64_t v12 = [v10 _stackKindGivenWidgetUniqueId:v11];
  id v13 = *(void **)(a1 + 40);
  id v14 = [*(id *)(a1 + 32) widgetUniqueId];
  objc_msgSend(v7, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v8, 18, v9, v12, objc_msgSend(v13, "_stackLocationGivenWidgetUniqueId:", v14), 0, *(void *)(a1 + 32), 0, v5);

  id v15 = objc_alloc(MEMORY[0x1E4F4FE08]);
  id v16 = [*(id *)(a1 + 32) extensionBundleId];
  BOOL v17 = [MEMORY[0x1E4F28F80] processInfo];
  id v18 = [v17 operatingSystemVersionString];
  id v19 = (void *)[v15 initWithContentIdentifier:@"com.apple.duetexpertd.widget.addedToStack" context:v16 osBuild:v18 userInfo:0];

  id v20 = [*(id *)(*(void *)(a1 + 40) + 88) source];
  [v20 sendEvent:v19];
}

- (void)logUserDidDeleteWidgetOnStack:(id)a3 stackIdentifier:(id)a4 stackKind:(unint64_t)a5 stackLocation:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__ATXHomeScreenEventLogger_logUserDidDeleteWidgetOnStack_stackIdentifier_stackKind_stackLocation___block_invoke;
  block[3] = &unk_1E5D072C8;
  id v16 = v10;
  BOOL v17 = self;
  id v18 = v11;
  unint64_t v19 = a5;
  unint64_t v20 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, block);
}

void __98__ATXHomeScreenEventLogger_logUserDidDeleteWidgetOnStack_stackIdentifier_stackKind_stackLocation___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (void *)a1[4];
    id v4 = [v3 widgetUniqueId];
    *(_DWORD *)buf = 136315650;
    id v8 = "-[ATXHomeScreenEventLogger logUserDidDeleteWidgetOnStack:stackIdentifier:stackKind:stackLocation:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "%s: user deleted widget on stack: %@ (widgetID %{public}@)", buf, 0x20u);
  }
  uint64_t v5 = (void *)a1[5];
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  [v5 _sendEventToBiomeWithDate:v6 eventType:19 stackIdentifier:a1[6] stackKind:a1[7] stackLocation:a1[8] reason:0 widget:a1[4] blendingCacheIdentifier:0 metadata:0];
}

- (void)_populateSuggestedPageMetadata:(id)a3 forPage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v6)
  {
    __int16 v9 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ATXHomeScreenEventLogger _populateSuggestedPageMetadata:forPage:]();
    }
    goto LABEL_10;
  }
  if ([v6 pageIndex] != 20000)
  {
    id v8 = [v7 uniqueIdentifier];

    if (v8)
    {
      __int16 v9 = objc_opt_new();
      id v10 = [v7 uniqueIdentifier];
      uint64_t v11 = [v9 suggestedPageTypeWithIdentifier:v10];

      if (v11) {
        [v5 setSuggestedPageType:v11];
      }
    }
    else
    {
      __int16 v9 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ATXHomeScreenEventLogger _populateSuggestedPageMetadata:forPage:](v7, v9);
      }
    }
LABEL_10:
  }
}

- (void)logUserDidCreateStack:(id)a3 page:(id)a4 isSuggestion:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__ATXHomeScreenEventLogger_logUserDidCreateStack_page_isSuggestion___block_invoke;
  v13[3] = &unk_1E5D08B30;
  BOOL v17 = a5;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __68__ATXHomeScreenEventLogger_logUserDidCreateStack_page_isSuggestion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 136315394;
    id v21 = "-[ATXHomeScreenEventLogger logUserDidCreateStack:page:isSuggestion:]_block_invoke";
    __int16 v22 = 2114;
    __int16 v23 = v3;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "%s: user created stack (ID %{public}@)", buf, 0x16u);
  }
  id v4 = objc_opt_new();
  id v5 = [*(id *)(a1 + 32) widgets];
  id v6 = (void *)[v5 copy];
  [v4 setWidgetsInStack:v6];

  id v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  [v4 setIsSuggestionInAddWidgetSheet:v7];

  [*(id *)(a1 + 40) _populateSuggestedPageMetadata:v4 forPage:*(void *)(a1 + 48)];
  unint64_t v19 = *(void **)(a1 + 40);
  id v18 = [MEMORY[0x1E4F1C9C8] now];
  id v8 = [*(id *)(a1 + 32) identifier];
  id v9 = *(void **)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) widgets];
  id v11 = [v10 firstObject];
  id v12 = [v11 widgetUniqueId];
  uint64_t v13 = [v9 _stackKindGivenWidgetUniqueId:v12];
  id v14 = *(void **)(a1 + 40);
  id v15 = [*(id *)(a1 + 32) widgets];
  id v16 = [v15 firstObject];
  BOOL v17 = [v16 widgetUniqueId];
  objc_msgSend(v19, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v18, 16, v8, v13, objc_msgSend(v14, "_stackLocationGivenWidgetUniqueId:", v17), 0, 0, 0, v4);
}

- (void)logUserDidDeleteStack:(id)a3 stackKind:(unint64_t)a4 stackLocation:(unint64_t)a5 page:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__ATXHomeScreenEventLogger_logUserDidDeleteStack_stackKind_stackLocation_page___block_invoke;
  block[3] = &unk_1E5D072C8;
  id v16 = v10;
  BOOL v17 = self;
  id v18 = v11;
  unint64_t v19 = a4;
  unint64_t v20 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, block);
}

void __79__ATXHomeScreenEventLogger_logUserDidDeleteStack_stackKind_stackLocation_page___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v3 identifier];
    *(_DWORD *)buf = 136315650;
    id v12 = "-[ATXHomeScreenEventLogger logUserDidDeleteStack:stackKind:stackLocation:page:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "%s: user deleted stack: %@ (ID %{public}@)", buf, 0x20u);
  }
  id v5 = objc_opt_new();
  id v6 = [*(id *)(a1 + 32) widgets];
  id v7 = (void *)[v6 copy];
  [v5 setWidgetsInStack:v7];

  [*(id *)(a1 + 40) _populateSuggestedPageMetadata:v5 forPage:*(void *)(a1 + 48)];
  id v8 = *(void **)(a1 + 40);
  id v9 = [MEMORY[0x1E4F1C9C8] now];
  id v10 = [*(id *)(a1 + 32) identifier];
  [v8 _sendEventToBiomeWithDate:v9 eventType:17 stackIdentifier:v10 stackKind:*(void *)(a1 + 56) stackLocation:*(void *)(a1 + 64) reason:0 widget:0 blendingCacheIdentifier:0 metadata:v5];
}

- (void)logDeviceLock
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ATXHomeScreenEventLogger_logDeviceLock__block_invoke;
  block[3] = &unk_1E5D05300;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __41__ATXHomeScreenEventLogger_logDeviceLock__block_invoke(uint64_t a1)
{
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenEventLogger: donating lock event", buf, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  [v3 _sendEventToBiomeWithDate:v4 eventType:8 stackIdentifier:0 stackKind:0 stackLocation:0 reason:0 widget:0 blendingCacheIdentifier:0 metadata:0];
}

- (void)logDeviceUnlock
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ATXHomeScreenEventLogger_logDeviceUnlock__block_invoke;
  block[3] = &unk_1E5D05300;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __43__ATXHomeScreenEventLogger_logDeviceUnlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenEventLogger: donating unlock event", buf, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  [v3 _sendEventToBiomeWithDate:v4 eventType:9 stackIdentifier:0 stackKind:0 stackLocation:0 reason:0 widget:0 blendingCacheIdentifier:0 metadata:0];
}

- (void)logWidgetDidAppear:(id)a3 blendingCacheId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__ATXHomeScreenEventLogger_logWidgetDidAppear_blendingCacheId___block_invoke;
  block[3] = &unk_1E5D05D78;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __63__ATXHomeScreenEventLogger_logWidgetDidAppear_blendingCacheId___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  id v4 = (id)objc_opt_new();
  [v1 _logProactiveWidgetEvent:4 suggestionIdentifiers:0 widget:v2 blendingCacheId:v3 date:v4];
}

- (void)logWidgetDidDisappear:(id)a3 blendingCacheId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ATXHomeScreenEventLogger_logWidgetDidDisappear_blendingCacheId___block_invoke;
  block[3] = &unk_1E5D05D78;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __66__ATXHomeScreenEventLogger_logWidgetDidDisappear_blendingCacheId___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  id v4 = (id)objc_opt_new();
  [v1 _logProactiveWidgetEvent:5 suggestionIdentifiers:0 widget:v2 blendingCacheId:v3 date:v4];
}

- (void)logSuggestionsDidAppear:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__ATXHomeScreenEventLogger_logSuggestionsDidAppear_widget_blendingCacheId___block_invoke;
  v15[3] = &unk_1E5D07ED0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __75__ATXHomeScreenEventLogger_logSuggestionsDidAppear_widget_blendingCacheId___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  [v1 _logProactiveWidgetEvent:6 suggestionIdentifiers:v2 widget:v3 blendingCacheId:v4 date:v5];
}

- (void)logSuggestionsDidDisappear:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__ATXHomeScreenEventLogger_logSuggestionsDidDisappear_widget_blendingCacheId___block_invoke;
  v15[3] = &unk_1E5D07ED0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __78__ATXHomeScreenEventLogger_logSuggestionsDidDisappear_widget_blendingCacheId___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  [v1 _logProactiveWidgetEvent:7 suggestionIdentifiers:v2 widget:v3 blendingCacheId:v4 date:v5];
}

- (void)logWidgetOccluded:(id)a3 blendingCacheId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ATXHomeScreenEventLogger_logWidgetOccluded_blendingCacheId___block_invoke;
  block[3] = &unk_1E5D05D78;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __62__ATXHomeScreenEventLogger_logWidgetOccluded_blendingCacheId___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  id v4 = (id)objc_opt_new();
  [v1 _logProactiveWidgetEvent:8 suggestionIdentifiers:0 widget:v2 blendingCacheId:v3 date:v4];
}

- (void)logWidgetUnoccluded:(id)a3 blendingCacheId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ATXHomeScreenEventLogger_logWidgetUnoccluded_blendingCacheId___block_invoke;
  block[3] = &unk_1E5D05D78;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __64__ATXHomeScreenEventLogger_logWidgetUnoccluded_blendingCacheId___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  id v4 = (id)objc_opt_new();
  [v1 _logProactiveWidgetEvent:9 suggestionIdentifiers:0 widget:v2 blendingCacheId:v3 date:v4];
}

- (void)logDidTapSuggestion:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__ATXHomeScreenEventLogger_logDidTapSuggestion_widget_blendingCacheId___block_invoke;
  v15[3] = &unk_1E5D07ED0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __71__ATXHomeScreenEventLogger_logDidTapSuggestion_widget_blendingCacheId___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  id v4 = [v3 UUIDString];
  v21[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  [v2 _logProactiveWidgetEvent:1 suggestionIdentifiers:v5 widget:v7 blendingCacheId:v6 date:v8];

  id v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 48) widgetUniqueId];
  id v11 = [v9 _stackIdentifierGivenWidgetUniqueId:v10];

  if (*(void *)(a1 + 56) && v11)
  {
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = [ATXHomeScreenPrediction alloc];
    __int16 v15 = [(ATXHomeScreenPrediction *)v14 initWithBlendingCacheIdentifier:*(void *)(a1 + 56) widgetSuggestions:MEMORY[0x1E4F1CC08] stacksAffectedByDebugRotation:0];
    [v12 logStackDidTap:v11 widgetOnTop:v13 prediction:v15];
  }
  else
  {
    __int16 v15 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      __71__ATXHomeScreenEventLogger_logDidTapSuggestion_widget_blendingCacheId___block_invoke_cold_1((uint64_t *)(a1 + 56), (uint64_t)v11, v15);
    }
  }

  +[ATXMFeedbackConversionLogger logUserInteractionFeedbackWithEngagementType:0 consumerSubType:34 tracker:*(void *)(*(void *)(a1 + 32) + 96)];
  id v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  id v18 = [*(id *)(a1 + 48) extensionBundleId];
  uint64_t v19 = [v18 isEqualToString:*MEMORY[0x1E4F4B5F8]];
  unint64_t v20 = [*(id *)(a1 + 48) widgetUniqueId];
  [v16 _logCaptureRateForAppPredictionPanelWithEngagedSuggestion:v17 isSuggestionsWidget:v19 widgetIdentifier:v20];

  [*(id *)(a1 + 32) _logAppLaunchOverallCaptureRateFromAppPredictionPanelWithTappedWidget:*(void *)(a1 + 48) suggestion:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _logAppPanelLaunchRatioWithTappedWidget:*(void *)(a1 + 48)];
}

- (void)logContextMenuDismissOnceForSuggestion:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__ATXHomeScreenEventLogger_logContextMenuDismissOnceForSuggestion_widget_blendingCacheId___block_invoke;
  v15[3] = &unk_1E5D07ED0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __90__ATXHomeScreenEventLogger_logContextMenuDismissOnceForSuggestion_widget_blendingCacheId___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  id v4 = [(id)v3 UUIDString];
  v14[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  [v2 _logProactiveWidgetEvent:2 suggestionIdentifiers:v5 widget:v6 blendingCacheId:v7 date:v8];

  +[ATXMFeedbackConversionLogger logUserInteractionFeedbackWithEngagementType:1 consumerSubType:34 tracker:*(void *)(*(void *)(a1 + 32) + 96)];
  id v9 = [*(id *)(a1 + 48) extensionBundleId];
  LOBYTE(v3) = [v9 isEqualToString:*MEMORY[0x1E4F4B5F8]];

  if (v3)
  {
    uint64_t v10 = 36;
  }
  else
  {
    id v11 = [*(id *)(a1 + 48) extensionBundleId];
    int v12 = [v11 isEqualToString:@"com.apple.proactive.appprediction.panel"];

    if (v12) {
      uint64_t v10 = 37;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  return +[ATXContextMenuFeedbackTracker logContextMenuFeedbackForDismissOnceWithSuggestion:*(void *)(a1 + 40) consumerSubType:v10 tracker:*(void *)(*(void *)(a1 + 32) + 96)];
}

- (void)logContextMenuNeverShowAgainForSuggestion:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__ATXHomeScreenEventLogger_logContextMenuNeverShowAgainForSuggestion_widget_blendingCacheId___block_invoke;
  v15[3] = &unk_1E5D07ED0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __93__ATXHomeScreenEventLogger_logContextMenuNeverShowAgainForSuggestion_widget_blendingCacheId___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  id v4 = [(id)v3 UUIDString];
  v14[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  [v2 _logProactiveWidgetEvent:3 suggestionIdentifiers:v5 widget:v6 blendingCacheId:v7 date:v8];

  +[ATXMFeedbackConversionLogger logUserInteractionFeedbackWithEngagementType:1 consumerSubType:34 tracker:*(void *)(*(void *)(a1 + 32) + 96)];
  id v9 = [*(id *)(a1 + 48) extensionBundleId];
  LOBYTE(v3) = [v9 isEqualToString:*MEMORY[0x1E4F4B5F8]];

  if (v3)
  {
    uint64_t v10 = 36;
  }
  else
  {
    id v11 = [*(id *)(a1 + 48) extensionBundleId];
    int v12 = [v11 isEqualToString:@"com.apple.proactive.appprediction.panel"];

    if (v12) {
      uint64_t v10 = 37;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  return +[ATXContextMenuFeedbackTracker logContextMenuFeedbackForNeverShowAgainWithSuggestion:*(void *)(a1 + 40) consumerSubType:v10 tracker:*(void *)(*(void *)(a1 + 32) + 96)];
}

- (void)logWidgetInsertionDidFailInStack:(id)a3 prediction:(id)a4
{
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[ATXHomeScreenEventLogger logWidgetInsertionDidFailInStack:prediction:]();
  }
}

- (void)logUserDidStartWidgetOnboarding
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ATXHomeScreenEventLogger_logUserDidStartWidgetOnboarding__block_invoke;
  block[3] = &unk_1E5D05300;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __59__ATXHomeScreenEventLogger_logUserDidStartWidgetOnboarding__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 104) setBool:1 forKey:*MEMORY[0x1E4F4B6F8]];
  uint64_t v2 = objc_opt_new();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__ATXHomeScreenEventLogger_logUserDidStartWidgetOnboarding__block_invoke_2;
  v3[3] = &unk_1E5D08B58;
  v3[4] = *(void *)(a1 + 32);
  [v2 fetchSmartStackOfVariant:2 completionHandler:v3];
}

void __59__ATXHomeScreenEventLogger_logUserDidStartWidgetOnboarding__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = [a2 firstObject];
  uint64_t v3 = [v7 smallDefaultStack];

  if (v3)
  {
    id v4 = [v7 smallDefaultStack];
    id v5 = [v4 firstObject];

    BOOL v6 = [v5 rankType] != 5 && objc_msgSend(v5, "rankType") != 6;
  }
  else
  {
    BOOL v6 = 1;
  }
  [*(id *)(*(void *)(a1 + 32) + 104) setBool:v6 forKey:*MEMORY[0x1E4F4B728]];
}

- (void)logUserDidAcceptWidgetOnboardingSuggestion:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ATXHomeScreenEventLogger_logUserDidAcceptWidgetOnboardingSuggestion___block_invoke;
  block[3] = &unk_1E5D05300;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __71__ATXHomeScreenEventLogger_logUserDidAcceptWidgetOnboardingSuggestion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) setValue:@"accepted" forKey:*MEMORY[0x1E4F4B720]];
}

- (void)logUserDidRejectWidgetOnboardingSuggestion:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ATXHomeScreenEventLogger_logUserDidRejectWidgetOnboardingSuggestion___block_invoke;
  block[3] = &unk_1E5D05300;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __71__ATXHomeScreenEventLogger_logUserDidRejectWidgetOnboardingSuggestion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) setValue:@"rejected" forKey:*MEMORY[0x1E4F4B720]];
}

- (void)logUserDidEnterEditModeForWidgetOnboarding
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__ATXHomeScreenEventLogger_logUserDidEnterEditModeForWidgetOnboarding__block_invoke;
  block[3] = &unk_1E5D05300;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __70__ATXHomeScreenEventLogger_logUserDidEnterEditModeForWidgetOnboarding__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) setValue:@"edited" forKey:*MEMORY[0x1E4F4B720]];
}

- (ATXHomeScreenEventLoggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXHomeScreenEventLoggerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_discoverabilitySignalsStream, 0);
  objc_storeStrong((id *)&self->_biomeUIStream, 0);
  objc_storeStrong((id *)&self->_homeScreenConfigCache, 0);
  objc_storeStrong((id *)&self->_dockAppSet, 0);
  objc_storeStrong((id *)&self->_bundleIdToSBPageNumber, 0);
  objc_storeStrong((id *)&self->_stackIdToCachedStackData, 0);
  objc_storeStrong((id *)&self->_widgetIdToStackId, 0);
  objc_storeStrong((id *)&self->_currentConfigurations, 0);
  objc_storeStrong((id *)&self->_coalescedConfigDiffOperation, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "ATXHomeScreenEventLogger: Loaded dock app set, but it is nil", v2, v3, v4, v5, v6);
}

void __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "ATXHomeScreenEventLogger: Could not load dock app list", v2, v3, v4, v5, v6);
}

void __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "ATXHomeScreenEventLogger: Loaded HomeScreen and Today page configs, but they are nil", v2, v3, v4, v5, v6);
}

void __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "ATXHomeScreenEventLogger: Could not load initial home screen and today page configurations", v2, v3, v4, v5, v6);
}

void __66__ATXHomeScreenEventLogger__updateCurrentConfigurationsAndLogDiff__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXHomeScreenEventLogger: Could not load default items with default home screen item comparator: %@", v2, v3, v4, v5, v6);
}

- (void)_logAppLaunchOverallCaptureRateFromAppPredictionPanelWithTappedWidget:(NSObject *)a3 suggestion:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [a2 captureType];
  if (v7 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = off_1E5D08C80[(int)v7];
  }
  id v9 = v8;
  uint64_t v10 = [a2 iconLocation];
  if (v10 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = off_1E5D08CD0[(int)v10];
  }
  *(_DWORD *)buf = 138414338;
  id v13 = v6;
  __int16 v14 = 2112;
  __int16 v15 = v9;
  __int16 v16 = 2112;
  id v17 = v11;
  __int16 v18 = 1024;
  int v19 = [a2 spotlightEnabled];
  __int16 v20 = 1024;
  int v21 = [a2 appLibraryEnabled];
  __int16 v22 = 1024;
  int v23 = [a2 appPredictionPanelEnabled];
  __int16 v24 = 1024;
  int v25 = [a2 appPredictionPanelTodayEnabled];
  __int16 v26 = 1024;
  int v27 = [a2 suggestionsWidgetEnabled];
  __int16 v28 = 1024;
  int v29 = [a2 suggestionsWidgetTodayEnabled];
  _os_log_debug_impl(&dword_1A790D000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBAppLaunchOverallCaptureRateTracker with captureType: %@, iconLocation: %@, spotlightEnabled: %u, appLibraryEnabled: %u, hasAppPanel: %u, hasAppPanelToday: %u, suggestionsWidgetEnabled: %u, suggestionsWidgetTodayEnabled: %u", buf, 0x44u);
}

void __94__ATXHomeScreenEventLogger_logHomeScreenPageDidAppear_topWidgetsByStackIdentifier_prediction___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  uint64_t v5 = "-[ATXHomeScreenEventLogger logHomeScreenPageDidAppear:topWidgetsByStackIdentifier:prediction:]_block_invoke";
  __int16 v6 = 1024;
  int v7 = v2;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_debug_impl(&dword_1A790D000, a2, OS_LOG_TYPE_DEBUG, "%s: page %d, widgets: %@", (uint8_t *)&v4, 0x1Cu);
}

void __64__ATXHomeScreenEventLogger_logHomeScreenDidDisappearWithReason___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_5_3();
  _os_log_debug_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEBUG, "%s: reason: %@", (uint8_t *)v1, 0x16u);
}

void __80__ATXHomeScreenEventLogger_logSpecialPageDidAppear_widgetsByStackId_prediction___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_4_2();
  _os_log_debug_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEBUG, "%s: special page %d", (uint8_t *)v1, 0x12u);
}

void __55__ATXHomeScreenEventLogger_logSpecialPageDidDisappear___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_4_2();
  _os_log_debug_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEBUG, "%s: special page %d", (uint8_t *)v1, 0x12u);
}

void __77__ATXHomeScreenEventLogger_logStackDidTap_engagedUrl_widgetOnTop_prediction___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 136315650;
  uint64_t v5 = "-[ATXHomeScreenEventLogger logStackDidTap:engagedUrl:widgetOnTop:prediction:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v2;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_debug_impl(&dword_1A790D000, a2, OS_LOG_TYPE_DEBUG, "%s: stack: %@, widget: %@", (uint8_t *)&v4, 0x20u);
}

void __91__ATXHomeScreenEventLogger__logSupplementaryActionInContextMenu_stackId_widget_prediction___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[8];
  int v5 = 136315906;
  __int16 v6 = "-[ATXHomeScreenEventLogger _logSupplementaryActionInContextMenu:stackId:widget:prediction:]_block_invoke";
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = v3;
  __int16 v11 = 1024;
  int v12 = v4;
  _os_log_debug_impl(&dword_1A790D000, a2, OS_LOG_TYPE_DEBUG, "%s: stack: %@, widget: %@, feedback: %d", (uint8_t *)&v5, 0x26u);
}

void __63__ATXHomeScreenEventLogger_logUserDidChangeStackConfiguration___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_5_3();
  _os_log_debug_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEBUG, "%s: stack: %@", (uint8_t *)v1, 0x16u);
}

- (void)_populateSuggestedPageMetadata:forPage:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "We have a missing parent page during diffing", v2, v3, v4, v5, v6);
}

- (void)_populateSuggestedPageMetadata:(void *)a1 forPage:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 pageIndex];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "We have a page without a unique page identifier: %ld", v3, 0xCu);
}

void __71__ATXHomeScreenEventLogger_logDidTapSuggestion_widget_blendingCacheId___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 136315650;
  uint64_t v5 = "-[ATXHomeScreenEventLogger logDidTapSuggestion:widget:blendingCacheId:]_block_invoke";
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "%s: unable to emit stackDidTap log - blendingCacheId %{public}@, stackId %{public}@", (uint8_t *)&v4, 0x20u);
}

- (void)logWidgetInsertionDidFailInStack:prediction:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "This hasn't been implemented", v2, v3, v4, v5, v6);
}

@end