@interface ATXChronoServicesProvider
- (ATXChronoServicesProvider)init;
- (ATXChronoServicesProvider)initWithProactiveService:(id)a3 widgetMetricsService:(id)a4;
- (ATXChronoServicesProviderDelegate)delegate;
- (BOOL)_allReloadsAreCompletedInGuardedData:(id)a3;
- (BOOL)_isCurrentTimelineRelevanceScoreNonPositiveForEntries:(id)a3;
- (BOOL)_shouldBlockSuggestionForWidget:(id)a3 entries:(id)a4;
- (id)_recordFromSuggestionLayout:(id)a3 guardedData:(id)a4;
- (id)_widgetFromSuggestionLayout:(id)a3;
- (void)_chronoDidReplyHandle:(id)a3 timelineEntries:(id)a4 forWidget:(id)a5 withError:(id)a6;
- (void)_removeOudatedFailureEntriesInGuardedData:(id)a3;
- (void)_requestChronoToLoadWidget:(id)a3 inGuardedData:(id)a4;
- (void)_updateAndSendHomeScreenSuggestionsToDelegateWithGuardedData:(id)a3;
- (void)_updateGuardedData:(id)a3 withNewCachedSuggestions:(id)a4;
- (void)resetToPrewarmWidgetsInSuggestions:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ATXChronoServicesProvider

- (ATXChronoServicesProvider)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(ATXChronoServicesProvider *)self initWithProactiveService:v3 widgetMetricsService:v4];

  return v5;
}

- (ATXChronoServicesProvider)initWithProactiveService:(id)a3 widgetMetricsService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ATXChronoServicesProvider;
  v9 = [(ATXChronoServicesProvider *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_proactiveService, a3);
    objc_storeStrong((id *)&v10->_widgetMetricService, a4);
    v11 = objc_opt_new();
    v12 = (void *)v11[1];
    v11[1] = 0;

    v13 = (void *)v11[2];
    v11[2] = MEMORY[0x1E4F1CC08];

    uint64_t v14 = objc_opt_new();
    v15 = (void *)v11[3];
    v11[3] = v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.proactive.ATXChronoServicesProvider", v16);

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F93B80]) initWithGuardedData:v11 serialQueue:v17];
    lock = v10->_lock;
    v10->_lock = (_PASQueueLock *)v18;
  }
  return v10;
}

- (void)resetToPrewarmWidgetsInSuggestions:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__ATXChronoServicesProvider_resetToPrewarmWidgetsInSuggestions___block_invoke;
  v7[3] = &unk_1E5D082D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v7];
}

void __64__ATXChronoServicesProvider_resetToPrewarmWidgetsInSuggestions___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  [*(id *)(a1 + 32) _removeOudatedFailureEntriesInGuardedData:v3];
  id v4 = [v3[1] uuid];
  v5 = [*(id *)(a1 + 40) uuid];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0) {
    [*(id *)(a1 + 32) _updateGuardedData:v3 withNewCachedSuggestions:*(void *)(a1 + 40)];
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v7 = v3[2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__ATXChronoServicesProvider_resetToPrewarmWidgetsInSuggestions___block_invoke_2;
  v10[3] = &unk_1E5D082A8;
  v13 = &v14;
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  v11 = v8;
  uint64_t v12 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];
  if (!v15[3]) {
    [*(id *)(a1 + 32) _updateAndSendHomeScreenSuggestionsToDelegateWithGuardedData:v8];
  }

  _Block_object_dispose(&v14, 8);
}

void __64__ATXChronoServicesProvider_resetToPrewarmWidgetsInSuggestions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 state];
  if (!v7 || v7 == 3)
  {
    id v8 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v5];
    if (v8)
    {
      uint64_t v9 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543618;
        v11 = v8;
        __int16 v12 = 2112;
        id v13 = v5;
        _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: Short-circuit widget reload because it recently failed at %{public}@: %@", (uint8_t *)&v10, 0x16u);
      }

      [v6 setState:3];
    }
    else
    {
      [*(id *)(a1 + 40) _requestChronoToLoadWidget:v5 inGuardedData:*(void *)(a1 + 32)];
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
  }
  else if (v7 == 1)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

- (void)_removeOudatedFailureEntriesInGuardedData:(id)a3
{
  v3 = (id *)a3;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  int v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  id v4 = v3[3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__ATXChronoServicesProvider__removeOudatedFailureEntriesInGuardedData___block_invoke;
  v5[3] = &unk_1E5D082F8;
  v5[4] = &v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
  if ([(id)v7[5] count]) {
    [v3[3] removeObjectsForKeys:v7[5]];
  }
  _Block_object_dispose(&v6, 8);
}

void __71__ATXChronoServicesProvider__removeOudatedFailureEntriesInGuardedData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  [a3 timeIntervalSinceNow];
  if (v5 < -1800.0)
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = objc_opt_new();
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v6 addObject:v10];
  }
}

- (void)_updateGuardedData:(id)a3 withNewCachedSuggestions:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v31 = (id *)a3;
  id v6 = a4;
  v30 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v26 = v6;
  id obj = [v6 cachedSuggestedWidgetsLayouts];
  uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v37;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v7;
        uint64_t v8 = *(void *)(*((void *)&v36 + 1) + 8 * v7);
        uint64_t v9 = [v26 cachedSuggestedWidgetsLayouts];
        id v10 = [v9 objectForKeyedSubscript:v8];

        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v29 = v10;
        uint64_t v11 = [v29 countByEnumeratingWithState:&v32 objects:v44 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v33 != v13) {
                objc_enumerationMutation(v29);
              }
              uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              uint64_t v16 = [(ATXChronoServicesProvider *)self _widgetFromSuggestionLayout:v15];
              if (v16)
              {
                uint64_t v17 = [v31[2] objectForKeyedSubscript:v16];
                if (!v17)
                {
                  uint64_t v17 = objc_opt_new();
                  [v17 setState:0];
                }
                uint64_t v18 = [v16 extensionIdentity];
                v19 = [v18 extensionBundleIdentifier];
                int IsSpecialWidgetExtensionBundleId = ATXBundleIdIsSpecialWidgetExtensionBundleId();

                if (IsSpecialWidgetExtensionBundleId) {
                  [v17 setState:2];
                }
                [v17 setWidget:v16];
                [v17 setSuggestedStackId:v8];
                [v30 setObject:v17 forKeyedSubscript:v16];
              }
              else
              {
                uint64_t v17 = __atxlog_handle_home_screen();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  uint64_t v41 = v8;
                  __int16 v42 = 2112;
                  uint64_t v43 = v15;
                  _os_log_fault_impl(&dword_1A790D000, v17, OS_LOG_TYPE_FAULT, "ATXChronoServicesProvider: Unable to prewarm suggested widget for stack %{public}@ due to failure of converting suggestion layout into ATXHomeScreenWidgetIdentifiable. Layout: \n%@", buf, 0x16u);
                }
              }
            }
            uint64_t v12 = [v29 countByEnumeratingWithState:&v32 objects:v44 count:16];
          }
          while (v12);
        }

        uint64_t v7 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v27);
  }

  id v21 = v31[1];
  v31[1] = v26;
  id v22 = v26;

  id v23 = v31[2];
  v31[2] = v30;
}

- (id)_widgetFromSuggestionLayout:(id)a3
{
  v3 = +[ATXHomeScreenStackSuggestion widgetFromSuggestionLayout:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F58DD8]);
    id v5 = objc_alloc(MEMORY[0x1E4F58CC0]);
    id v6 = [v3 extensionBundleId];
    uint64_t v7 = [v3 appBundleId];
    uint64_t v8 = (void *)[v5 initWithExtensionBundleIdentifier:v6 containerBundleIdentifier:v7 deviceIdentifier:0];
    uint64_t v9 = [v3 widgetKind];
    uint64_t v10 = CHSWidgetFamilyFromATXStackLayoutSize([v3 size]);
    uint64_t v11 = [v3 intent];
    uint64_t v12 = (void *)[v4 initWithExtensionIdentity:v8 kind:v9 family:v10 intent:v11 activityIdentifier:0];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)_requestChronoToLoadWidget:(id)a3 inGuardedData:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (id *)a4;
  uint64_t v8 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: Requesting Chrono to load widget %@", buf, 0xCu);
  }

  uint64_t v9 = [v7[2] objectForKeyedSubscript:v6];
  if (v9)
  {
    uint64_t v10 = [(SBSWidgetMetricsService *)self->_widgetMetricService systemMetricsForWidget:v6];
    if (v10)
    {
      [v9 setState:1];
      proactiveService = self->_proactiveService;
      uint64_t v12 = [v9 suggestedStackId];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __70__ATXChronoServicesProvider__requestChronoToLoadWidget_inGuardedData___block_invoke;
      v15[3] = &unk_1E5D08320;
      v15[4] = self;
      id v16 = v6;
      [(CHSProactiveService *)proactiveService loadSuggestedWidget:v16 metrics:v10 stackIdentifier:v12 completion:v15];
    }
    else
    {
      uint64_t v13 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXChronoServicesProvider _requestChronoToLoadWidget:inGuardedData:]((uint64_t)v6, v13);
      }

      [v9 setState:3];
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
      [v7[3] setObject:v14 forKeyedSubscript:v6];
    }
  }
  else
  {
    uint64_t v10 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXChronoServicesProvider _requestChronoToLoadWidget:inGuardedData:]((uint64_t)v6, v10);
    }
  }
}

uint64_t __70__ATXChronoServicesProvider__requestChronoToLoadWidget_inGuardedData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _chronoDidReplyHandle:a2 timelineEntries:a3 forWidget:*(void *)(a1 + 40) withError:a4];
}

- (void)_chronoDidReplyHandle:(id)a3 timelineEntries:(id)a4 forWidget:(id)a5 withError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  lock = self->_lock;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87__ATXChronoServicesProvider__chronoDidReplyHandle_timelineEntries_forWidget_withError___block_invoke;
  v19[3] = &unk_1E5D08348;
  id v20 = v10;
  id v21 = v13;
  id v22 = v12;
  id v23 = self;
  id v24 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  id v18 = v10;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v19];
}

void __87__ATXChronoServicesProvider__chronoDidReplyHandle_timelineEntries_forWidget_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    uint64_t v7 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      long long v38 = v8;
      _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: Chrono successfully loaded widget %@.", buf, 0xCu);
    }

    uint64_t v5 = [*(id *)(a1 + 56) _shouldBlockSuggestionForWidget:*(void *)(a1 + 48) entries:*(void *)(a1 + 64)] ^ 1;
    uint64_t v6 = 1;
  }
  else
  {
    id v4 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __87__ATXChronoServicesProvider__chronoDidReplyHandle_timelineEntries_forWidget_withError___block_invoke_cold_1(a1, (uint64_t *)(a1 + 32), v4);
    }

    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 56) + 32));
  [WeakRetained chronoServiceProvider:*(void *)(a1 + 56) reloadDidCompleteForWidget:*(void *)(a1 + 48) success:v6 widgetIsReadyForDisplay:v5 error:*(void *)(a1 + 40)];

  id v10 = [v3[2] objectForKeyedSubscript:*(void *)(a1 + 48)];
  if (v10)
  {
    id v11 = __atxlog_handle_home_screen();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v12)
      {
        id v13 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        long long v38 = v13;
        _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: Widget is OK to display %@.", buf, 0xCu);
      }

      [v10 setState:2];
      [v10 setWidgetHandle:*(void *)(a1 + 32)];
      goto LABEL_30;
    }
    v31 = v10;
    long long v32 = v3;
    if (v12)
    {
      uint64_t v14 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      long long v38 = v14;
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: Widget is NOT OK to display %@.", buf, 0xCu);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = *(id *)(a1 + 64);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (!v16)
    {
LABEL_29:

      id v10 = v31;
      [v31 setState:3];
      v30 = [MEMORY[0x1E4F1C9C8] now];
      v3 = v32;
      [v32[3] setObject:v30 forKeyedSubscript:*(void *)(a1 + 48)];

LABEL_30:
      if ([*(id *)(a1 + 56) _allReloadsAreCompletedInGuardedData:v3]) {
        [*(id *)(a1 + 56) _updateAndSendHomeScreenSuggestionsToDelegateWithGuardedData:v3];
      }
      goto LABEL_32;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
LABEL_18:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v34 != v18) {
        objc_enumerationMutation(v15);
      }
      id v20 = *(void **)(*((void *)&v33 + 1) + 8 * v19);
      id v21 = [v20 relevance];

      id v22 = __atxlog_handle_home_screen();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v23)
        {
          id v24 = [v20 date];
          uint64_t v25 = [v20 relevance];
          [v25 score];
          uint64_t v27 = v26;
          uint64_t v28 = [v20 relevance];
          [v28 duration];
          *(_DWORD *)buf = 138412802;
          long long v38 = v24;
          __int16 v39 = 2048;
          uint64_t v40 = v27;
          __int16 v41 = 2048;
          uint64_t v42 = v29;
          _os_log_impl(&dword_1A790D000, v22, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: timeline entry at %@ has relevance score %f duration %f", buf, 0x20u);

LABEL_26:
        }
      }
      else if (v23)
      {
        id v24 = [v20 date];
        *(_DWORD *)buf = 138412290;
        long long v38 = v24;
        _os_log_impl(&dword_1A790D000, v22, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: timeline entry at %@ has nil relevance", buf, 0xCu);
        goto LABEL_26;
      }

      if (v17 == ++v19)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v43 count:16];
        if (!v17) {
          goto LABEL_29;
        }
        goto LABEL_18;
      }
    }
  }
LABEL_32:
}

- (BOOL)_shouldBlockSuggestionForWidget:(id)a3 entries:(id)a4
{
  return [(ATXChronoServicesProvider *)self _isCurrentTimelineRelevanceScoreNonPositiveForEntries:a4];
}

- (BOOL)_isCurrentTimelineRelevanceScoreNonPositiveForEntries:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [a3 sortedArrayUsingComparator:&__block_literal_global_55];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v7)
  {

    uint64_t v9 = 0;
    uint64_t v8 = 0;
    goto LABEL_21;
  }
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v27;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v27 != v10) {
      objc_enumerationMutation(v6);
    }
    BOOL v12 = *(void **)(*((void *)&v26 + 1) + 8 * v11);
    id v13 = objc_msgSend(v12, "date", (void)v26);
    [v13 timeIntervalSinceReferenceDate];
    double v15 = v14;

    if (v15 > v5) {
      break;
    }
    uint64_t v16 = [v12 relevance];

    if (v16)
    {
      uint64_t v17 = [v12 relevance];

      uint64_t v18 = [v12 date];

      uint64_t v8 = (void *)v17;
      uint64_t v9 = (void *)v18;
    }
    if (v7 == ++v11)
    {
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v7) {
        goto LABEL_3;
      }
      break;
    }
  }

  if (!v8)
  {
LABEL_20:
    LOBYTE(v7) = 0;
    goto LABEL_21;
  }
  [v8 duration];
  if (v19 >= 0.0)
  {
    [v8 duration];
    if (v20 == 0.0
      || ([v9 timeIntervalSinceReferenceDate], double v22 = v21, objc_msgSend(v8, "duration"), v5 < v22 + v23))
    {
      [v8 score];
      LOBYTE(v7) = v24 <= 0.0;
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  uint64_t v7 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[ATXChronoServicesProvider _isCurrentTimelineRelevanceScoreNonPositiveForEntries:](v7);
  }

  LOBYTE(v7) = 1;
LABEL_21:

  return (char)v7;
}

uint64_t __83__ATXChronoServicesProvider__isCurrentTimelineRelevanceScoreNonPositiveForEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 date];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  uint64_t v8 = [v4 date];

  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  if (v7 < v10) {
    return -1;
  }
  else {
    return v7 > v10;
  }
}

- (BOOL)_allReloadsAreCompletedInGuardedData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(*((id *)a3 + 2), "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (![v8 state] || objc_msgSend(v8, "state") == 1)
        {
          BOOL v9 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 1;
  }
LABEL_13:

  return v9;
}

- (void)_updateAndSendHomeScreenSuggestionsToDelegateWithGuardedData:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  v51 = self;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    location = (id *)p_delegate;
    double v7 = objc_opt_new();
    [v4[1] cachedTopOfStackLayouts];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
    BOOL v9 = v4;
    uint64_t v44 = v7;
    if (!v8) {
      goto LABEL_25;
    }
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v61;
    while (1)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v61 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v60 + 1) + 8 * v12);
        long long v14 = objc_msgSend(obj, "objectForKeyedSubscript:", v13, location);
        if (![v14 isNPlusOne]) {
          goto LABEL_18;
        }
        double v15 = [(ATXChronoServicesProvider *)v51 _recordFromSuggestionLayout:v14 guardedData:v4];
        if (!v15)
        {
          uint64_t v16 = __atxlog_handle_home_screen();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v67 = v13;
            __int16 v68 = 2112;
            v69 = v14;
            _os_log_fault_impl(&dword_1A790D000, v16, OS_LOG_TYPE_FAULT, "ATXChronoServicesProvider: Unable to find record for a N+1 topOfStackLayout for stack %{public}@. Layout %@", buf, 0x16u);
          }

          double v7 = v44;
        }
        if (CFPreferencesGetAppBooleanValue(@"widgetKitDeveloperModeEnabled", @"com.apple.duetexpertd", 0))
        {
          uint64_t v17 = __atxlog_handle_home_screen();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v67 = v13;
            __int16 v68 = 2112;
            v69 = v14;
            _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: widgetkit developer mode on, allowing topOfStackLayout for stack %{public}@. Layout %@", buf, 0x16u);
          }

LABEL_17:
          uint64_t v4 = v9;
LABEL_18:
          [v7 setObject:v14 forKeyedSubscript:v13];
          goto LABEL_19;
        }
        if ([v15 state] == 2) {
          goto LABEL_17;
        }
        uint64_t v18 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v67 = v13;
          __int16 v68 = 2112;
          v69 = v14;
          _os_log_impl(&dword_1A790D000, v18, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: Skipping topOfStackLayout for stack %{public}@ because it's a suggested widget and it's not ready for display. Layout %@", buf, 0x16u);
        }

        uint64_t v4 = v9;
LABEL_19:

        ++v12;
      }
      while (v10 != v12);
      uint64_t v19 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
      uint64_t v10 = v19;
      if (!v19)
      {
LABEL_25:
        uint64_t v46 = objc_opt_new();
        [v4[1] cachedSuggestedWidgetsLayouts];
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v48 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v47 = [v48 countByEnumeratingWithState:&v56 objects:v65 count:16];
        if (!v47) {
          goto LABEL_53;
        }
        uint64_t v45 = *(void *)v57;
        while (1)
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v57 != v45) {
              objc_enumerationMutation(v48);
            }
            uint64_t v50 = v20;
            uint64_t v21 = *(void *)(*((void *)&v56 + 1) + 8 * v20);
            double v22 = objc_opt_new();
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            double v23 = [v48 objectForKeyedSubscript:v21];
            uint64_t v24 = [v23 countByEnumeratingWithState:&v52 objects:v64 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v53;
              do
              {
                uint64_t v27 = 0;
                do
                {
                  if (*(void *)v53 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  long long v28 = *(void **)(*((void *)&v52 + 1) + 8 * v27);
                  long long v29 = -[ATXChronoServicesProvider _recordFromSuggestionLayout:guardedData:](v51, "_recordFromSuggestionLayout:guardedData:", v28, v9, location);
                  if (!v29)
                  {
                    v30 = __atxlog_handle_home_screen();
                    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      uint64_t v67 = v21;
                      __int16 v68 = 2112;
                      v69 = v28;
                      _os_log_fault_impl(&dword_1A790D000, v30, OS_LOG_TYPE_FAULT, "ATXChronoServicesProvider: Unable to find record for a suggestedWidgetLayout for stack %{public}@. Layout %@", buf, 0x16u);
                    }
                  }
                  if (CFPreferencesGetAppBooleanValue(@"widgetKitDeveloperModeEnabled", @"com.apple.duetexpertd", 0))
                  {
                    uint64_t v31 = __atxlog_handle_home_screen();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      uint64_t v67 = v21;
                      __int16 v68 = 2112;
                      v69 = v28;
                      _os_log_impl(&dword_1A790D000, v31, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: widgetkit developer mode on, allowing suggestedWidgetLayout for stack %{public}@. Layout %@", buf, 0x16u);
                    }

LABEL_44:
                    [v22 addObject:v28];
                    goto LABEL_45;
                  }
                  if ([v29 state] == 2) {
                    goto LABEL_44;
                  }
                  long long v32 = __atxlog_handle_home_screen();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    uint64_t v67 = v21;
                    __int16 v68 = 2112;
                    v69 = v28;
                    _os_log_impl(&dword_1A790D000, v32, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: Skipping suggestedWidgetLayout for stack %{public}@ because it's not ready for display. Layout %@", buf, 0x16u);
                  }

LABEL_45:
                  ++v27;
                }
                while (v25 != v27);
                uint64_t v33 = [v23 countByEnumeratingWithState:&v52 objects:v64 count:16];
                uint64_t v25 = v33;
              }
              while (v33);
            }

            [v46 setObject:v22 forKeyedSubscript:v21];
            uint64_t v20 = v50 + 1;
          }
          while (v50 + 1 != v47);
          uint64_t v47 = [v48 countByEnumeratingWithState:&v56 objects:v65 count:16];
          if (!v47)
          {
LABEL_53:
            id v34 = objc_alloc(MEMORY[0x1E4F938E8]);
            uint64_t v4 = v9;
            long long v35 = [v9[1] uuid];
            long long v36 = [v4[1] cachedSuggestionWidgetLayouts];
            long long v37 = [v4[1] cachedAppPredictionPanelLayouts];
            long long v38 = [v4[1] fallbackSuggestions];
            __int16 v39 = (void *)[v34 initWithUUID:v35 suggestionWidgetLayouts:v36 appPredictionPanelLayouts:v37 topOfStackLayouts:v44 suggestedWidgetLayouts:v46 fallbackSuggestions:v38];

            id v40 = v4[1];
            v4[1] = v39;
            id v41 = v39;

            id v42 = objc_loadWeakRetained(location);
            [v42 chronoServiceProvider:v51 finishedPrewarmingSuggestions:v41];

            goto LABEL_54;
          }
        }
      }
    }
  }
LABEL_54:
}

- (id)_recordFromSuggestionLayout:(id)a3 guardedData:(id)a4
{
  uint64_t v6 = (id *)a4;
  double v7 = [(ATXChronoServicesProvider *)self _widgetFromSuggestionLayout:a3];
  if (v7)
  {
    uint64_t v8 = [v6[2] objectForKeyedSubscript:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (ATXChronoServicesProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXChronoServicesProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_widgetMetricService, 0);

  objc_storeStrong((id *)&self->_proactiveService, 0);
}

- (void)_requestChronoToLoadWidget:(uint64_t)a1 inGuardedData:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "ATXChronoServicesProvider: No record found for widget %@ in guardedData.", (uint8_t *)&v2, 0xCu);
}

- (void)_requestChronoToLoadWidget:(uint64_t)a1 inGuardedData:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "ATXChronoServicesProvider: Failed - SBSWidgetMetricsService returned nil metrics for widget %@.", (uint8_t *)&v2, 0xCu);
}

void __87__ATXChronoServicesProvider__chronoDidReplyHandle_timelineEntries_forWidget_withError___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  int v6 = 138412802;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXChronoServicesProvider: Chrono reload failed for widget %@: returned widget handle %@, error %@", (uint8_t *)&v6, 0x20u);
}

- (void)_isCurrentTimelineRelevanceScoreNonPositiveForEntries:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXChronoServicesProvider: Unexpectedly found TimelineEntry with negative duration!", v1, 2u);
}

@end