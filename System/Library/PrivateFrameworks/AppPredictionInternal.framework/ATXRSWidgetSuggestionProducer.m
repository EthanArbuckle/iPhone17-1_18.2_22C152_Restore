@interface ATXRSWidgetSuggestionProducer
+ (id)_clientModelIdentifier;
+ (id)replacementContainerBundleIdForDonationBundleId:(id)a3;
- (ATXRSWidgetSuggestionProducer)init;
- (ATXRSWidgetSuggestionProducer)initWithDuetHelper:(id)a3 descriptorCache:(id)a4 relevanceMonitor:(id)a5 filter:(id)a6 abuseGuard:(id)a7 featurizer:(id)a8 featureWeights:(id)a9 ranker:(id)a10 confidenceMapper:(id)a11 suggestionReceiver:(id)a12 metadataProvider:(id)a13 widgetRelevanceService:(id)a14;
- (BOOL)_areInfoSuggestions:(id)a3 equalToProactiveSuggestions:(id)a4;
- (id)_candidatesFromBundleIdToRelevantIntentsDict:(id)a3;
- (id)_candidatesFromRelevantShortcutsFromStartDate:(id)a3;
- (id)_infoSuggestionFromCandidate:(id)a3 suggestionIdentifier:(id)a4;
- (id)_proactiveSuggestionsFromScoredInfoSuggestions:(id)a3;
- (id)relevantShortcutCandidateFromLNRelevantIntent:(id)a3 donationBundleId:(id)a4;
- (void)_coalescedRefreshRelevantShortcuts;
- (void)_coalescedRefreshRelevantShortcuts:(id)a3;
- (void)_pushSuggestionsToBlendingIfNecessary:(id)a3;
- (void)_refreshRelevantShortcuts;
- (void)relevanceMonitorDidUpdateCurrentlyRelevantCandidates:(id)a3 relevantContexts:(id)a4;
- (void)widgetRelevancesDidChangeForRelevanceService:(id)a3;
@end

@implementation ATXRSWidgetSuggestionProducer

- (ATXRSWidgetSuggestionProducer)init
{
  v13 = +[_ATXDuetHelper sharedInstance];
  v3 = [MEMORY[0x1E4F4B430] sharedInstance];
  v4 = objc_opt_new();
  v16 = objc_opt_new();
  v15 = +[ATXWidgetSuggestionAbuseGuard sharedInstance];
  v14 = objc_opt_new();
  v11 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = +[ATXClientModelSuggestionReceiver sharedInstance];
  v8 = objc_opt_new();
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F58ED0]) initWithOptions:1];
  v12 = [(ATXRSWidgetSuggestionProducer *)self initWithDuetHelper:v13 descriptorCache:v3 relevanceMonitor:v4 filter:v16 abuseGuard:v15 featurizer:v14 featureWeights:v11 ranker:v5 confidenceMapper:v6 suggestionReceiver:v7 metadataProvider:v8 widgetRelevanceService:v9];

  return v12;
}

- (ATXRSWidgetSuggestionProducer)initWithDuetHelper:(id)a3 descriptorCache:(id)a4 relevanceMonitor:(id)a5 filter:(id)a6 abuseGuard:(id)a7 featurizer:(id)a8 featureWeights:(id)a9 ranker:(id)a10 confidenceMapper:(id)a11 suggestionReceiver:(id)a12 metadataProvider:(id)a13 widgetRelevanceService:(id)a14
{
  id v53 = a3;
  id v52 = a4;
  id v41 = a5;
  id v19 = a5;
  id v51 = a6;
  id v42 = a7;
  id v50 = a7;
  id v49 = a8;
  id v48 = a9;
  id v47 = a10;
  id v46 = a11;
  id v45 = a12;
  id v44 = a13;
  id v43 = a14;
  v62.receiver = self;
  v62.super_class = (Class)ATXRSWidgetSuggestionProducer;
  v20 = [(ATXRSWidgetSuggestionProducer *)&v62 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_duetHelper, a3);
    objc_storeStrong((id *)&v21->_descriptorCache, a4);
    objc_storeStrong((id *)&v21->_relevanceMonitor, v41);
    id v55 = v19;
    [v19 setDelegate:v21];
    objc_storeStrong((id *)&v21->_filter, a6);
    objc_storeStrong((id *)&v21->_abuseGuard, v42);
    objc_storeStrong((id *)&v21->_featurizer, a8);
    objc_storeStrong((id *)&v21->_featureWeights, a9);
    objc_storeStrong((id *)&v21->_ranker, a10);
    objc_storeStrong((id *)&v21->_confidenceMapper, a11);
    objc_storeStrong((id *)&v21->_suggestionReceiver, a12);
    objc_storeStrong((id *)&v21->_metadataProvider, a13);
    objc_storeStrong((id *)&v21->_widgetRelevanceService, a14);
    [(CHSWidgetRelevanceService *)v21->_widgetRelevanceService registerObserver:v21];
    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v24 = dispatch_queue_create("ATXRSWidgetSuggestionProducer", v23);
    queue = v21->_queue;
    v21->_queue = (OS_dispatch_queue *)v24;

    objc_initWeak(&location, v21);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __212__ATXRSWidgetSuggestionProducer_initWithDuetHelper_descriptorCache_relevanceMonitor_filter_abuseGuard_featurizer_featureWeights_ranker_confidenceMapper_suggestionReceiver_metadataProvider_widgetRelevanceService___block_invoke;
    aBlock[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v60, &location);
    v26 = _Block_copy(aBlock);
    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F93B98]) initWithQueue:v21->_queue operation:v26];
    coalescedRefreshRelevantShortcutsOperation = v21->_coalescedRefreshRelevantShortcutsOperation;
    v21->_coalescedRefreshRelevantShortcutsOperation = (_PASSimpleCoalescingTimer *)v27;

    v29 = (void *)MEMORY[0x1D25F6CC0]();
    v30 = [MEMORY[0x1E4F28C40] defaultCenter];
    v31 = [MEMORY[0x1E4F5B5F8] appRelevantShortcutsStream];
    v32 = [v31 name];
    [v30 addObserver:v21 selector:sel__coalescedRefreshRelevantShortcuts_ name:*MEMORY[0x1E4F5B628] object:v32];

    v33 = [MEMORY[0x1E4F5B5F8] appRelevantShortcutsStream];
    v34 = [v33 name];
    [v30 addObserver:v21 selector:sel__coalescedRefreshRelevantShortcuts_ name:*MEMORY[0x1E4F5B638] object:v34];

    v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v35 addObserver:v21 selector:sel__coalescedRefreshRelevantShortcuts_ name:*MEMORY[0x1E4F4B548] object:v21->_descriptorCache];
    [v35 addObserver:v21 selector:sel__coalescedRefreshRelevantShortcuts_ name:@"ATXWidgetSuggestionAbuseGuardRefresh" object:v21->_abuseGuard];

    v36 = (const char *)*MEMORY[0x1E4F72908];
    v37 = v21->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __212__ATXRSWidgetSuggestionProducer_initWithDuetHelper_descriptorCache_relevanceMonitor_filter_abuseGuard_featurizer_featureWeights_ranker_confidenceMapper_suggestionReceiver_metadataProvider_widgetRelevanceService___block_invoke_35;
    handler[3] = &unk_1E68AC2F8;
    v58 = v21;
    notify_register_dispatch(v36, &v21->_relevantShortcutRefreshToken, v37, handler);
    v38 = __atxlog_handle_relevant_shortcut();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v38, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: Initialized", buf, 2u);
    }

    objc_destroyWeak(&v60);
    objc_destroyWeak(&location);

    id v19 = v55;
  }

  return v21;
}

void __212__ATXRSWidgetSuggestionProducer_initWithDuetHelper_descriptorCache_relevanceMonitor_filter_abuseGuard_featurizer_featureWeights_ranker_confidenceMapper_suggestionReceiver_metadataProvider_widgetRelevanceService___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _refreshRelevantShortcuts];
  }
  else
  {
    v3 = __atxlog_handle_relevant_shortcut();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __212__ATXRSWidgetSuggestionProducer_initWithDuetHelper_descriptorCache_relevanceMonitor_filter_abuseGuard_featurizer_featureWeights_ranker_confidenceMapper_suggestionReceiver_metadataProvider_widgetRelevanceService___block_invoke_cold_1(v3);
    }
  }
}

uint64_t __212__ATXRSWidgetSuggestionProducer_initWithDuetHelper_descriptorCache_relevanceMonitor_filter_abuseGuard_featurizer_featureWeights_ranker_confidenceMapper_suggestionReceiver_metadataProvider_widgetRelevanceService___block_invoke_35(uint64_t a1)
{
  v2 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: Triggering coalesced refresh by LNRelevantIntentsChangedNotification", v4, 2u);
  }

  return [*(id *)(a1 + 32) _coalescedRefreshRelevantShortcuts];
}

- (void)widgetRelevancesDidChangeForRelevanceService:(id)a3
{
  v4 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: Triggering coalesced refresh because CHSWidgetRelevanceService.widgetRelevancesDidChangeForRelevanceService", v5, 2u);
  }

  [(ATXRSWidgetSuggestionProducer *)self _coalescedRefreshRelevantShortcuts];
}

- (void)relevanceMonitorDidUpdateCurrentlyRelevantCandidates:(id)a3 relevantContexts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__ATXRSWidgetSuggestionProducer_relevanceMonitorDidUpdateCurrentlyRelevantCandidates_relevantContexts___block_invoke;
  block[3] = &unk_1E68AC320;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __103__ATXRSWidgetSuggestionProducer_relevanceMonitorDidUpdateCurrentlyRelevantCandidates_relevantContexts___block_invoke(id *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v15 = (void *)os_transaction_create();
  v2 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [a1[4] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v27 = v3;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: Refreshing suggestions for %lu currently relevant candidates...", buf, 0xCu);
  }

  v4 = [*((id *)a1[5] + 4) filterCandidatesBySuggestionRequirements:a1[4]];
  v18 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v19 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v7 = [a1[6] objectForKeyedSubscript:v6];
        id v20 = [NSString alloc];
        v8 = [v6 widgetDescriptor];
        id v9 = [v8 extensionBundleIdentifier];
        id v10 = [v6 widgetDescriptor];
        v11 = [v10 kind];
        id v12 = [v6 intent];
        v13 = (void *)[v20 initWithFormat:@"%@:%@:%lld:%lu", v9, v11, objc_msgSend(v12, "atx_indexingHash"), objc_msgSend(v7, "hash"), v15];

        id v14 = [a1[5] _infoSuggestionFromCandidate:v6 suggestionIdentifier:v13];
        [v18 addObject:v14];
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v19);
  }

  [a1[5] _pushSuggestionsToBlendingIfNecessary:v18];
}

- (void)_coalescedRefreshRelevantShortcuts:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: Triggering coalesced refresh by notification %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [(ATXRSWidgetSuggestionProducer *)self _coalescedRefreshRelevantShortcuts];
}

- (void)_coalescedRefreshRelevantShortcuts
{
}

- (void)_refreshRelevantShortcuts
{
  OUTLINED_FUNCTION_1_2(a1, a2);
  v5 = objc_opt_class();
  *(_DWORD *)id v4 = 138412290;
  void *v3 = v5;
  id v6 = v5;
  _os_log_fault_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_FAULT, "ATXRSWidgetSuggestionProducer: Expected intent concrete class to be INAppIntent, but it was %@ instead", v4, 0xCu);
}

void __58__ATXRSWidgetSuggestionProducer__refreshRelevantShortcuts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = __atxlog_handle_relevant_shortcut();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__ATXRSWidgetSuggestionProducer__refreshRelevantShortcuts__block_invoke_cold_1();
    }
  }
  v8 = [*(id *)(a1 + 32) _candidatesFromBundleIdToRelevantIntentsDict:v5];
  uint64_t v9 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    uint64_t v13 = [v8 count];
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: fetched %lu valid relevant intents from link", (uint8_t *)&v12, 0xCu);
  }

  [*(id *)(a1 + 40) addObjectsFromArray:v8];
  id v10 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)(a1 + 40) count];
    int v12 = 134217984;
    uint64_t v13 = v11;
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: fetched %lu relevantShortcutCandidates in total", (uint8_t *)&v12, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) resetToMonitorForRelevantShortcutCandidates:*(void *)(a1 + 40)];
}

- (id)_candidatesFromBundleIdToRelevantIntentsDict:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v23 = (id)objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  uint64_t v19 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v29;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v5;
        uint64_t v6 = *(void *)(*((void *)&v28 + 1) + 8 * v5);
        context = (void *)MEMORY[0x1D25F6CC0]();
        int v7 = [obj objectForKeyedSubscript:v6];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              uint64_t v14 = (void *)MEMORY[0x1D25F6CC0]();
              v15 = [(ATXRSWidgetSuggestionProducer *)self relevantShortcutCandidateFromLNRelevantIntent:v13 donationBundleId:v6];
              if (v15)
              {
                [v23 addObject:v15];
                v16 = __atxlog_handle_relevant_shortcut();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v33 = v13;
                  _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: successfully produced candidate from relevant intent: %@", buf, 0xCu);
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
          }
          while (v10);
        }

        uint64_t v5 = v22 + 1;
      }
      while (v22 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v19);
  }

  return v23;
}

- (id)relevantShortcutCandidateFromLNRelevantIntent:(id)a3 donationBundleId:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  metadataProvider = self->_metadataProvider;
  uint64_t v9 = [v6 action];
  uint64_t v10 = [v9 identifier];
  id v23 = 0;
  uint64_t v11 = [(LNMetadataProvider *)metadataProvider actionForBundleIdentifier:v7 andActionIdentifier:v10 error:&v23];
  id v12 = v23;

  if (v12 || !v11)
  {
    v15 = __atxlog_handle_relevant_shortcut();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ATXRSWidgetSuggestionProducer relevantShortcutCandidateFromLNRelevantIntent:donationBundleId:]();
    }
    long long v21 = 0;
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F302B8]);
    uint64_t v14 = [v6 action];
    v15 = [v13 initWithAppBundleIdentifier:v7 linkAction:v14 linkActionMetadata:v11];

    v16 = [(ATXWidgetDescriptorCache *)self->_descriptorCache homeScreenDescriptorForIntent:v15];
    if (v16)
    {
      uint64_t v17 = [v6 context];
      uint64_t v18 = +[ATXRelevantContextConverter contextFromRelevantContext:v17];

      if (v18)
      {
        uint64_t v19 = [ATXRelevantShortcutCandidate alloc];
        long long v24 = v18;
        id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
        long long v21 = [(ATXRelevantShortcutCandidate *)v19 initWithWidgetDescriptor:v16 donationBundleIdentifier:v7 intent:v15 relevantContexts:v20];
      }
      else
      {
        id v20 = __atxlog_handle_relevant_shortcut();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v6;
          _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: no context derived from relevant intent: %@", buf, 0xCu);
        }
        long long v21 = 0;
      }
    }
    else
    {
      uint64_t v18 = __atxlog_handle_relevant_shortcut();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[ATXRSWidgetSuggestionProducer relevantShortcutCandidateFromLNRelevantIntent:donationBundleId:]();
      }
      long long v21 = 0;
    }
  }
  return v21;
}

- (id)_candidatesFromRelevantShortcutsFromStartDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  duetHelper = self->_duetHelper;
  id v7 = [MEMORY[0x1E4F1C9C8] now];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__ATXRSWidgetSuggestionProducer__candidatesFromRelevantShortcutsFromStartDate___block_invoke;
  v12[3] = &unk_1E68AC390;
  v12[4] = self;
  id v8 = v5;
  id v13 = v8;
  [(_ATXDuetHelper *)duetHelper enumerateRelevantShortcutsAndBundleIdsBetweenStartDate:v4 endDate:v7 limit:1000 block:v12];

  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __79__ATXRSWidgetSuggestionProducer__candidatesFromRelevantShortcutsFromStartDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = [v6 widgetKind];

  if (v8)
  {
    uint64_t v9 = +[ATXRSWidgetSuggestionProducer replacementContainerBundleIdForDonationBundleId:v7];
    id v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = (void *)v9;
    }
    else {
      uint64_t v11 = v7;
    }
    id v12 = v11;

    id v13 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v14 = [v6 widgetKind];
    v15 = [v13 homeScreenDescriptorForContainerBundleId:v12 widgetKind:v14];

    if (!v15)
    {
      uint64_t v17 = __atxlog_handle_relevant_shortcut();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __79__ATXRSWidgetSuggestionProducer__candidatesFromRelevantShortcutsFromStartDate___block_invoke_cold_1((uint64_t)v12, v6, v17);
      }
      goto LABEL_24;
    }
    v16 = [v6 shortcut];
    uint64_t v17 = [v16 intent];

    if ([v17 _type] == 3 || ![v17 _type])
    {

      uint64_t v17 = 0;
    }
    id v27 = v12;
    uint64_t v18 = [v15 intentType];
    if (v18)
    {
      id v12 = [v17 _className];
      uint64_t v3 = [v15 intentType];
      if ([v12 isEqualToString:v3])
      {

LABEL_23:
        uint64_t v22 = [v6 relevanceProviders];
        id v23 = objc_msgSend(v22, "_pas_mappedArrayWithTransform:", &__block_literal_global_13);

        long long v24 = [[ATXRelevantShortcutCandidate alloc] initWithWidgetDescriptor:v15 donationBundleIdentifier:v7 intent:v17 relevantContexts:v23];
        [*(id *)(a1 + 40) addObject:v24];

        id v12 = v27;
LABEL_24:

        goto LABEL_25;
      }
    }
    uint64_t v19 = [v17 _className];
    if (v19)
    {

      if (v18)
      {
      }
    }
    else
    {
      id v20 = [v15 intentType];

      if (v18)
      {
      }
      if (!v20) {
        goto LABEL_23;
      }
    }
    long long v21 = __atxlog_handle_relevant_shortcut();
    id v12 = v27;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long long v25 = [v17 _className];
      id v26 = [v15 intentType];
      *(_DWORD *)buf = 138412802;
      long long v29 = v25;
      __int16 v30 = 2112;
      long long v31 = v26;
      __int16 v32 = 2112;
      id v33 = v27;
      _os_log_error_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_ERROR, "ATXRSWidgetSuggestionProducer: donated intent (%@) and matching descriptor intent (%@) do not match for containerBundleId %@", buf, 0x20u);
    }
    goto LABEL_24;
  }
LABEL_25:
}

id __79__ATXRSWidgetSuggestionProducer__candidatesFromRelevantShortcutsFromStartDate___block_invoke_54(uint64_t a1, uint64_t a2)
{
  return +[ATXRelevantContextConverter contextFromRelevanceProvider:a2];
}

- (id)_infoSuggestionFromCandidate:(id)a3 suggestionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 donationBundleIdentifier];
  id v8 = +[ATXRSWidgetSuggestionProducer replacementContainerBundleIdForDonationBundleId:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v5 donationBundleIdentifier];
  }
  id v27 = v10;

  id v11 = objc_alloc(MEMORY[0x1E4F938F0]);
  id v12 = [v5 widgetDescriptor];
  id v13 = [v12 extensionBundleIdentifier];
  uint64_t v14 = [v5 widgetDescriptor];
  v15 = [v14 kind];
  v16 = [v5 widgetDescriptor];
  uint64_t v17 = objc_msgSend(v16, "atx_layoutOptions");
  uint64_t v18 = [v5 intent];
  uint64_t v19 = (void *)[v11 initWithAppBundleIdentifier:v27 widgetBundleIdentifier:v13 widgetKind:v15 criterion:&stru_1F2740B58 applicableLayouts:v17 suggestionIdentifier:v6 startDate:0 endDate:0 intent:v18 metadata:0 relevanceScore:0];

  abuseGuard = self->_abuseGuard;
  long long v21 = [v19 widgetBundleIdentifier];
  uint64_t v22 = [v19 widgetKind];
  id v23 = [v19 intent];
  LODWORD(abuseGuard) = [(ATXWidgetSuggestionAbuseGuard *)abuseGuard shouldDemoteSuggestionsForWidget:v21 kind:v22 intent:v23];

  if (abuseGuard) {
    uint64_t v24 = 2;
  }
  else {
    uint64_t v24 = 3;
  }
  objc_msgSend(v19, "setConfidenceLevel:", -[ATXInfoToBlendingConfidenceMapper minInfoConfidenceLevelForBlendingConfidenceCategory:](self->_confidenceMapper, "minInfoConfidenceLevelForBlendingConfidenceCategory:", v24));

  return v19;
}

- (void)_pushSuggestionsToBlendingIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F93940]);
  id v6 = [(id)objc_opt_class() _clientModelIdentifier];
  id v7 = [(ATXClientModelSuggestionReceiver *)self->_suggestionReceiver blendingLayerServer];
  id v8 = (void *)[v5 initWithClientModelId:v6 blendingLayerServer:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__ATXRSWidgetSuggestionProducer__pushSuggestionsToBlendingIfNecessary___block_invoke;
  v11[3] = &unk_1E68AC3E0;
  v11[4] = self;
  id v12 = v4;
  id v13 = v8;
  id v9 = v8;
  id v10 = v4;
  [v9 retrieveCurrentSuggestionsWithReply:v11];
}

void __71__ATXRSWidgetSuggestionProducer__pushSuggestionsToBlendingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 104);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__ATXRSWidgetSuggestionProducer__pushSuggestionsToBlendingIfNecessary___block_invoke_2;
  v7[3] = &unk_1E68AC3B8;
  v7[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __71__ATXRSWidgetSuggestionProducer__pushSuggestionsToBlendingIfNecessary___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _areInfoSuggestions:*(void *)(a1 + 40) equalToProactiveSuggestions:*(void *)(a1 + 48)])
  {
    v2 = __atxlog_handle_relevant_shortcut();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: Short-circuiting Blending update, since set of suggestions has not changed.", buf, 2u);
    }
  }
  else
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 48) featurizeInfoSuggestions:*(void *)(a1 + 40)];
    id v3 = [*(id *)(*(void *)(a1 + 32) + 64) sortFeaturizedSuggestions:v5 withFeatureWeights:*(void *)(*(void *)(a1 + 32) + 56)];
    uint64_t v4 = [*(id *)(a1 + 32) _proactiveSuggestionsFromScoredInfoSuggestions:v3];
    [*(id *)(a1 + 56) updateSuggestions:v4 completionHandler:&__block_literal_global_65];
  }
}

void __71__ATXRSWidgetSuggestionProducer__pushSuggestionsToBlendingIfNecessary___block_invoke_62(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = __atxlog_handle_relevant_shortcut();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__ATXRSWidgetSuggestionProducer__pushSuggestionsToBlendingIfNecessary___block_invoke_62_cold_1();
    }
  }
}

- (BOOL)_areInfoSuggestions:(id)a3 equalToProactiveSuggestions:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    uint64_t v8 = [v6 count];
    if (v8 == [v7 count])
    {
      id v9 = objc_opt_new();
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v38 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            v16 = [v15 suggestionIdentifier];
            [v9 setObject:v15 forKeyedSubscript:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v12);
      }

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v17 = v7;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v34;
        id v31 = v7;
        id v32 = v6;
        while (2)
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v34 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void **)(*((void *)&v33 + 1) + 8 * j);
            id v23 = objc_msgSend(v22, "executableSpecification", v31, v32, (void)v33);
            uint64_t v24 = [v23 executableIdentifier];
            long long v25 = [v9 objectForKeyedSubscript:v24];

            if (!v25
              || (v26 = -[ATXInfoToBlendingConfidenceMapper blendingConfidenceCategoryForInfoConfidenceLevel:](self->_confidenceMapper, "blendingConfidenceCategoryForInfoConfidenceLevel:", [v25 confidenceLevel]), objc_msgSend(v22, "scoreSpecification"), id v27 = objc_claimAutoreleasedReturnValue(), v28 = objc_msgSend(v27, "suggestedConfidenceCategory"), v27, v26 != v28))
            {

              BOOL v29 = 0;
              id v7 = v31;
              id v6 = v32;
              goto LABEL_24;
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
          BOOL v29 = 1;
          id v7 = v31;
          id v6 = v32;
          if (v19) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v29 = 1;
      }
LABEL_24:
    }
    else
    {
      BOOL v29 = 0;
    }
  }
  else
  {
    BOOL v29 = 1;
  }

  return v29;
}

- (id)_proactiveSuggestionsFromScoredInfoSuggestions:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v27 = (id)objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    unint64_t v8 = 0x1E4F93000uLL;
    long long v25 = self;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = [v10 suggestion];
        uint64_t v12 = -[ATXInfoToBlendingConfidenceMapper blendingConfidenceCategoryForInfoConfidenceLevel:](self->_confidenceMapper, "blendingConfidenceCategoryForInfoConfidenceLevel:", [v11 confidenceLevel]);
        uint64_t v13 = *(void **)(v8 + 2288);
        uint64_t v14 = [(id)objc_opt_class() _clientModelIdentifier];
        [v10 score];
        v15 = objc_msgSend(v13, "proactiveSuggestionForInfoSuggestion:withClientModelId:clientModelVersion:rawScore:confidenceCategory:", v11, v14, @"0.1", v12);

        v16 = __atxlog_handle_relevant_shortcut();
        id v17 = v16;
        if (v15)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = [v11 suggestionIdentifier];
            uint64_t v19 = [v11 intent];
            [v19 intentDescription];
            uint64_t v20 = v6;
            uint64_t v21 = v7;
            v23 = unint64_t v22 = v8;
            *(_DWORD *)buf = 138412546;
            long long v33 = v18;
            __int16 v34 = 2112;
            long long v35 = v23;
            _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: Pushing suggestion to Blending: Suggestion ID = %@, intent description %@", buf, 0x16u);

            unint64_t v8 = v22;
            uint64_t v7 = v21;
            uint64_t v6 = v20;
            self = v25;
          }
          [v27 addObject:v15];
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[ATXRSWidgetSuggestionProducer _proactiveSuggestionsFromScoredInfoSuggestions:]((uint64_t)v36, (uint64_t)v11);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v6);
  }

  return v27;
}

+ (id)_clientModelIdentifier
{
  return (id)[MEMORY[0x1E4F93940] clientModelIdFromClientModelType:20];
}

+ (id)replacementContainerBundleIdForDonationBundleId:(id)a3
{
  uint64_t v3 = replacementContainerBundleIdForDonationBundleId___pasOnceToken35;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&replacementContainerBundleIdForDonationBundleId___pasOnceToken35, &__block_literal_global_72);
  }
  uint64_t v5 = [(id)replacementContainerBundleIdForDonationBundleId___pasExprOnceResult objectForKeyedSubscript:v4];

  return v5;
}

void __81__ATXRSWidgetSuggestionProducer_replacementContainerBundleIdForDonationBundleId___block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = (void *)replacementContainerBundleIdForDonationBundleId___pasExprOnceResult;
  replacementContainerBundleIdForDonationBundleId___pasExprOnceResult = (uint64_t)&unk_1F27F3B28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedRefreshRelevantShortcutsOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_widgetRelevanceService, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
  objc_storeStrong((id *)&self->_suggestionReceiver, 0);
  objc_storeStrong((id *)&self->_confidenceMapper, 0);
  objc_storeStrong((id *)&self->_ranker, 0);
  objc_storeStrong((id *)&self->_featureWeights, 0);
  objc_storeStrong((id *)&self->_featurizer, 0);
  objc_storeStrong((id *)&self->_abuseGuard, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_relevanceMonitor, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
  objc_storeStrong((id *)&self->_duetHelper, 0);
}

void __212__ATXRSWidgetSuggestionProducer_initWithDuetHelper_descriptorCache_relevanceMonitor_filter_abuseGuard_featurizer_featureWeights_ranker_confidenceMapper_suggestionReceiver_metadataProvider_widgetRelevanceService___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXRSWidgetSuggestionProducer: couldn't refresh relevant shortcuts because self is nil", v1, 2u);
}

void __58__ATXRSWidgetSuggestionProducer__refreshRelevantShortcuts__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "ATXRSWidgetSuggestionProducer: error fetching relevant intents from provider: %@", v2, v3, v4, v5, v6);
}

- (void)relevantShortcutCandidateFromLNRelevantIntent:donationBundleId:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "ATXRSWidgetSuggestionProducer: skipping relevant intent, no matching descriptor found: %@", v2, v3, v4, v5, v6);
}

- (void)relevantShortcutCandidateFromLNRelevantIntent:donationBundleId:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D0FA3000, v1, OS_LOG_TYPE_ERROR, "ATXRSWidgetSuggestionProducer: error fetching metadata for relevant intent link action: %@, %@", v2, 0x16u);
}

void __79__ATXRSWidgetSuggestionProducer__candidatesFromRelevantShortcutsFromStartDate___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 widgetKind];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "ATXRSWidgetSuggestionProducer: Unable to find descriptor for eligible containerBundleId (%@) and widgetKind (%@)", (uint8_t *)&v6, 0x16u);
}

void __71__ATXRSWidgetSuggestionProducer__pushSuggestionsToBlendingIfNecessary___block_invoke_62_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "ATXRSWidgetSuggestionProducer: Blending update failed due to error %{public}@", v2, v3, v4, v5, v6);
}

- (void)_proactiveSuggestionsFromScoredInfoSuggestions:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "description");
  *(_DWORD *)uint64_t v4 = 138412290;
  void *v3 = v5;
  _os_log_error_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_ERROR, "ATXRSWidgetSuggestionProducer: failed to convert ATXInfoSuggestion to ATXProactiveSuggestion: %@", v4, 0xCu);
}

@end