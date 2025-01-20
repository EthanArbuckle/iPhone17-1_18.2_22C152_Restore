@interface ATXContextHeuristics
- (ATXContextHeuristics)initWithLocationManager:(id)a3;
- (ATXContextHeuristicsDelegate)delegate;
- (ATXHeuristicDevice)heuristicDevice;
- (BOOL)_queue_refreshResultsForHeuristics:(id)a3;
- (id)_criteriaForRefreshJobOnDate:(id)a3;
- (void)_queue_cleanupTimeTriggers;
- (void)_queue_refreshResultsForAllHeuristicsWithCompletionHandler:(id)a3;
- (void)_queue_sendRelevantSuggestionsToBlending;
- (void)_queue_updateHeuristicName:(id)a3 withRefreshTriggers:(id)a4;
- (void)_removeRefreshCTSJob;
- (void)_setRefreshCTSJobForCriteria:(id)a3 fireDate:(id)a4 forHeuristics:(id)a5;
- (void)donateSuggestions:(id)a3 forHeuristic:(id)a4;
- (void)informationHeuristicRefreshTrigger:(id)a3 didTriggerRefreshForHeuristics:(id)a4;
- (void)refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ATXContextHeuristics

- (ATXContextHeuristics)initWithLocationManager:(id)a3
{
  location[15] = *(id *)MEMORY[0x263EF8340];
  id v61 = a3;
  v64.receiver = self;
  v64.super_class = (Class)ATXContextHeuristics;
  v5 = [(ATXContextHeuristics *)&v64 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_locationManager, a3);
    uint64_t v7 = objc_opt_new();
    resultsCache = v6->_resultsCache;
    v6->_resultsCache = (ATXContextHeuristicCache *)v7;

    uint64_t v9 = objc_opt_new();
    heuristicRefreshTriggers = v6->_heuristicRefreshTriggers;
    v6->_heuristicRefreshTriggers = (NSMutableSet *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    attr = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v12 = dispatch_queue_create("ATXContextHeuristicsRefresh", attr);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;

    v14 = (objc_class *)objc_opt_class();
    v60 = NSStringFromClass(v14);
    location[0] = v60;
    v15 = (objc_class *)objc_opt_class();
    v59 = NSStringFromClass(v15);
    location[1] = v59;
    v16 = (objc_class *)objc_opt_class();
    v58 = NSStringFromClass(v16);
    location[2] = v58;
    v17 = (objc_class *)objc_opt_class();
    v57 = NSStringFromClass(v17);
    location[3] = v57;
    v18 = (objc_class *)objc_opt_class();
    v56 = NSStringFromClass(v18);
    location[4] = v56;
    v19 = (objc_class *)objc_opt_class();
    v55 = NSStringFromClass(v19);
    location[5] = v55;
    v20 = (objc_class *)objc_opt_class();
    v53 = NSStringFromClass(v20);
    location[6] = v53;
    v21 = (objc_class *)objc_opt_class();
    v52 = NSStringFromClass(v21);
    location[7] = v52;
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    location[8] = v23;
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    location[9] = v25;
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    location[10] = v27;
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    location[11] = v29;
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    location[12] = v31;
    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    location[13] = v33;
    v34 = (objc_class *)objc_opt_class();
    v35 = NSStringFromClass(v34);
    location[14] = v35;
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:location count:15];
    v37 = (void *)[v36 mutableCopy];

    if (_os_feature_enabled_impl())
    {
      v38 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224B41000, v38, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: zkw_commute feature flag ON, making commute suggestions", buf, 2u);
      }

      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      [v37 addObject:v40];

      v41 = (objc_class *)objc_opt_class();
      v42 = NSStringFromClass(v41);
      [v37 addObject:v42];
    }
    v43 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v37];

    uint64_t v44 = [v43 mutableCopy];
    heuristicsPendingRefresh = v6->_heuristicsPendingRefresh;
    v6->_heuristicsPendingRefresh = (NSMutableSet *)v44;

    objc_initWeak(location, v6);
    id v46 = objc_alloc(MEMORY[0x263F61E98]);
    v47 = v6->_queue;
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __48__ATXContextHeuristics_initWithLocationManager___block_invoke;
    v62[3] = &unk_2646EE990;
    objc_copyWeak(&v63, location);
    uint64_t v48 = [v46 initWithQueue:v47 operation:v62];
    coalescedRefreshOperation = v6->_coalescedRefreshOperation;
    v6->_coalescedRefreshOperation = (_PASSimpleCoalescingTimer *)v48;

    v50 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224B41000, v50, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: initialized", buf, 2u);
    }

    objc_destroyWeak(&v63);
    objc_destroyWeak(location);
  }
  return v6;
}

void __48__ATXContextHeuristics_initWithLocationManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_queue_refreshResultsForAllHeuristicsWithCompletionHandler:", 0);
  }
  else
  {
    v3 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __48__ATXContextHeuristics_initWithLocationManager___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

- (void)refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__ATXContextHeuristics_refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler___block_invoke;
  v7[3] = &unk_2646EE9B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __90__ATXContextHeuristics_refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_refreshResultsForAllHeuristicsWithCompletionHandler:", *(void *)(a1 + 40));
}

- (void)donateSuggestions:(id)a3 forHeuristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ATXContextHeuristics_donateSuggestions_forHeuristic___block_invoke;
  block[3] = &unk_2646EE9E0;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __55__ATXContextHeuristics_donateSuggestions_forHeuristic___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_224B41000, v2, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: donating [%lu] to %@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 48) + 40) setSuggestions:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
  return objc_msgSend(*(id *)(a1 + 48), "_queue_sendRelevantSuggestionsToBlending");
}

- (void)informationHeuristicRefreshTrigger:(id)a3 didTriggerRefreshForHeuristics:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __90__ATXContextHeuristics_informationHeuristicRefreshTrigger_didTriggerRefreshForHeuristics___block_invoke;
  v8[3] = &unk_2646EEA08;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __90__ATXContextHeuristics_informationHeuristicRefreshTrigger_didTriggerRefreshForHeuristics___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_224B41000, v2, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: add refresh for %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 24) unionSet:*(void *)(a1 + 32)];
  return [*(id *)(*(void *)(a1 + 40) + 48) runAfterDelaySeconds:0 coalescingBehavior:0.5];
}

- (void)_queue_updateHeuristicName:(id)a3 withRefreshTriggers:(id)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v53 objects:v64 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v54;
    uint64_t v38 = 138412290;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v54 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if ((-[NSMutableSet containsObject:](self->_heuristicRefreshTriggers, "containsObject:", v13, v38) & 1) == 0)
        {
          v14 = __atxlog_handle_context_heuristic();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v38;
            id v60 = v13;
            _os_log_debug_impl(&dword_224B41000, v14, OS_LOG_TYPE_DEBUG, "ATXContextHeuristics: new trigger %@", buf, 0xCu);
          }

          [v13 setDelegate:self];
          [(NSMutableSet *)self->_heuristicRefreshTriggers addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v53 objects:v64 count:16];
    }
    while (v10);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v15 = self->_heuristicRefreshTriggers;
  uint64_t v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v49 objects:v63 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v50;
    uint64_t v39 = 138412546;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v50 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        int v21 = objc_msgSend(v8, "containsObject:", v20, v39);
        v22 = __atxlog_handle_context_heuristic();
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
        if (v21)
        {
          if (v23)
          {
            *(_DWORD *)buf = v39;
            id v60 = v6;
            __int16 v61 = 2112;
            v62 = v20;
            _os_log_debug_impl(&dword_224B41000, v22, OS_LOG_TYPE_DEBUG, "ATXContextHeuristics: start %@ for trigger %@", buf, 0x16u);
          }

          [v20 startTriggeringRefreshForHeuristicIfNotAlready:v6];
        }
        else
        {
          if (v23)
          {
            *(_DWORD *)buf = v39;
            id v60 = v6;
            __int16 v61 = 2112;
            v62 = v20;
            _os_log_debug_impl(&dword_224B41000, v22, OS_LOG_TYPE_DEBUG, "ATXContextHeuristics: stop %@ for trigger %@", buf, 0x16u);
          }

          [v20 stopTriggeringRefreshForHeuristicIfAlready:v6];
        }
      }
      uint64_t v17 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v49 objects:v63 count:16];
    }
    while (v17);
  }
  v40 = v6;

  v24 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v25 = self->_heuristicRefreshTriggers;
  uint64_t v26 = [(NSMutableSet *)v25 countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v46 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v45 + 1) + 8 * k);
        v31 = objc_msgSend(v30, "registeredHeuristics", v40);
        uint64_t v32 = [v31 count];

        if (!v32) {
          [v24 addObject:v30];
        }
      }
      uint64_t v27 = [(NSMutableSet *)v25 countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v27);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v33 = v24;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v41 objects:v57 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v42;
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(v33);
        }
        -[NSMutableSet removeObject:](self->_heuristicRefreshTriggers, "removeObject:", *(void *)(*((void *)&v41 + 1) + 8 * m), v40);
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v41 objects:v57 count:16];
    }
    while (v35);
  }
}

- (void)_queue_refreshResultsForAllHeuristicsWithCompletionHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, BOOL))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v5 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    heuristicsPendingRefresh = self->_heuristicsPendingRefresh;
    int v8 = 138412290;
    uint64_t v9 = heuristicsPendingRefresh;
    _os_log_impl(&dword_224B41000, v5, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: refresh %@", (uint8_t *)&v8, 0xCu);
  }

  BOOL v7 = [(ATXContextHeuristics *)self _queue_refreshResultsForHeuristics:self->_heuristicsPendingRefresh];
  if (v7) {
    [(NSMutableSet *)self->_heuristicsPendingRefresh removeAllObjects];
  }
  if (v4) {
    v4[2](v4, v7);
  }
}

- (BOOL)_queue_refreshResultsForHeuristics:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v5 count])
  {
    sel_getName(a2);
    id v6 = os_transaction_create();
    BOOL v7 = (ATXHeuristicDevice *)[objc_alloc(MEMORY[0x263F23390]) initWithLocationManager:self->_locationManager];
    heuristicDevice = self->_heuristicDevice;
    self->_heuristicDevice = v7;

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __59__ATXContextHeuristics__queue_refreshResultsForHeuristics___block_invoke;
    v18[3] = &unk_2646EEA30;
    v18[4] = self;
    [v5 enumerateObjectsUsingBlock:v18];
    [(ATXContextHeuristics *)self _queue_sendRelevantSuggestionsToBlending];
    uint64_t v9 = self->_heuristicDevice;
    self->_heuristicDevice = 0;
  }
  else
  {
    id v6 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXContextHeuristics _queue_refreshResultsForHeuristics:](v6, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  return 1;
}

void __59__ATXContextHeuristics__queue_refreshResultsForHeuristics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  if ([(NSString *)v3 isEqual:@"kRecomputeRelevant"])
  {
    uint64_t v4 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_224B41000, v4, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: asked to recompute relevant suggestions", (uint8_t *)&v24, 2u);
    }
  }
  else
  {
    Class v5 = NSClassFromString(v3);
    char v6 = [(objc_class *)v5 conformsToProtocol:&unk_26D7DA3B0];
    BOOL v7 = __atxlog_handle_context_heuristic();
    uint64_t v4 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412290;
        v25 = v3;
        _os_log_impl(&dword_224B41000, v4, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: _refreshResultsForHeuristics class %@", (uint8_t *)&v24, 0xCu);
      }

      uint64_t v4 = objc_alloc_init(v5);
      int v8 = (void *)MEMORY[0x22A61E450]();
      uint64_t v9 = [v4 heuristicResultWithEnvironment:*(void *)(a1 + 32)];
      uint64_t v10 = [v9 suggestions];
      uint64_t v11 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v10 count];
        int v24 = 138412546;
        v25 = v3;
        __int16 v26 = 2048;
        uint64_t v27 = v12;
        _os_log_impl(&dword_224B41000, v11, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: %@ produced %lu suggestions", (uint8_t *)&v24, 0x16u);
      }

      [*(id *)(*(void *)(a1 + 32) + 40) setSuggestions:v10 forKey:v3];
      uint64_t v13 = [v4 permanentRefreshTriggers];
      uint64_t v14 = [v9 additionalRefreshTriggers];
      uint64_t v15 = *(void **)(a1 + 32);
      uint64_t v16 = [v13 setByAddingObjectsFromSet:v14];
      objc_msgSend(v15, "_queue_updateHeuristicName:withRefreshTriggers:", v3, v16);
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __59__ATXContextHeuristics__queue_refreshResultsForHeuristics___block_invoke_cold_1(v4, v17, v18, v19, v20, v21, v22, v23);
    }
  }
}

- (void)_queue_cleanupTimeTriggers
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224B41000, v4, OS_LOG_TYPE_DEFAULT, "[Cache] Get date for next change", buf, 2u);
  }

  long long v48 = (void *)v3;
  uint64_t v5 = [(ATXContextHeuristicCache *)self->_resultsCache nextChangeAfterDate:v3];
  [(ATXInformationHeuristicRefreshTimeTrigger *)self->_earliestCacheRefreshTimeTrigger stopTriggeringRefreshForAllHeuristics];
  earliestCacheRefreshTimeTrigger = self->_earliestCacheRefreshTimeTrigger;
  self->_earliestCacheRefreshTimeTrigger = 0;

  BOOL v7 = __atxlog_handle_context_heuristic();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v59 = v5;
      _os_log_impl(&dword_224B41000, v7, OS_LOG_TYPE_DEFAULT, "[Cache] Create time trigger for date: %@", buf, 0xCu);
    }

    uint64_t v9 = (ATXInformationHeuristicRefreshTimeTrigger *)[objc_alloc(MEMORY[0x263F23408]) initWithFireDate:v5];
    uint64_t v10 = self->_earliestCacheRefreshTimeTrigger;
    self->_earliestCacheRefreshTimeTrigger = v9;

    [(ATXInformationHeuristicRefreshTimeTrigger *)self->_earliestCacheRefreshTimeTrigger setDelegate:self];
    [(ATXInformationHeuristicRefreshTimeTrigger *)self->_earliestCacheRefreshTimeTrigger startTriggeringRefreshForHeuristicIfNotAlready:@"kRecomputeRelevant"];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224B41000, v7, OS_LOG_TYPE_DEFAULT, "[Cache] No time trigger", buf, 2u);
    }
  }
  long long v47 = (void *)v5;
  uint64_t v11 = self->_earliestCacheRefreshTimeTrigger;
  long long v49 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v46 = self;
  uint64_t v12 = self->_heuristicRefreshTriggers;
  uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v54 objects:v63 count:16];
  uint64_t v14 = v48;
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = v18;
          uint64_t v20 = [v19 fireDate];
          uint64_t v21 = [v20 earlierDate:v14];

          if (v21 == v14)
          {
            if (!v11) {
              goto LABEL_21;
            }
            uint64_t v22 = [(ATXInformationHeuristicRefreshTimeTrigger *)v11 fireDate];
            uint64_t v23 = [v19 fireDate];
            [v22 earlierDate:v23];
            v25 = int v24 = v11;
            __int16 v26 = [v19 fireDate];

            BOOL v27 = v25 == v26;
            uint64_t v11 = v24;
            uint64_t v14 = v48;
            if (v27)
            {
LABEL_21:
              uint64_t v28 = (ATXInformationHeuristicRefreshTimeTrigger *)v19;
              v29 = v11;
              uint64_t v11 = v28;
            }
          }
          else
          {
            [v19 stopTriggeringRefreshForAllHeuristics];
            [v49 addObject:v19];
          }
        }
      }
      uint64_t v15 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v15);
  }
  v30 = v11;

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v31 = v49;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v50 objects:v62 count:16];
  p_isa = (id *)&v46->super.isa;
  if (v32)
  {
    uint64_t v34 = v32;
    uint64_t v35 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v51 != v35) {
          objc_enumerationMutation(v31);
        }
        objc_msgSend(p_isa[2], "removeObject:", *(void *)(*((void *)&v50 + 1) + 8 * j), v46);
      }
      uint64_t v34 = [v31 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v34);
  }

  v37 = __atxlog_handle_context_heuristic();
  BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
  uint64_t v39 = v30;
  if (v30)
  {
    if (v38)
    {
      v40 = [(ATXInformationHeuristicRefreshTimeTrigger *)v30 fireDate];
      long long v41 = [(ATXInformationHeuristicRefreshTimeTrigger *)v30 registeredHeuristics];
      *(_DWORD *)buf = 138412546;
      uint64_t v59 = (uint64_t)v40;
      __int16 v60 = 2112;
      __int16 v61 = v41;
      _os_log_impl(&dword_224B41000, v37, OS_LOG_TYPE_DEFAULT, "[CTS] Schedule refresh at %@ for [%@]", buf, 0x16u);

      uint64_t v39 = v30;
    }

    long long v42 = [(ATXInformationHeuristicRefreshTimeTrigger *)v39 fireDate];
    long long v43 = [p_isa _criteriaForRefreshJobOnDate:v42];
    long long v44 = [(ATXInformationHeuristicRefreshTimeTrigger *)v30 fireDate];
    long long v45 = [(ATXInformationHeuristicRefreshTimeTrigger *)v30 registeredHeuristics];
    [p_isa _setRefreshCTSJobForCriteria:v43 fireDate:v44 forHeuristics:v45];

    uint64_t v39 = v30;
    uint64_t v14 = v48;
  }
  else
  {
    if (v38)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224B41000, v37, OS_LOG_TYPE_DEFAULT, "[CTS] Remove refresh if exists", buf, 2u);
    }

    [p_isa _removeRefreshCTSJob];
  }
}

- (void)_queue_sendRelevantSuggestionsToBlending
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(ATXContextHeuristics *)self _queue_cleanupTimeTriggers];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = (uint64_t)v3;
    _os_log_impl(&dword_224B41000, v4, OS_LOG_TYPE_DEFAULT, "[Cache] Get relevant suggestions for date: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v5 = [(ATXContextHeuristicCache *)self->_resultsCache allRelevantSuggestionsForDate:v3];
  char v6 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 count];
    int v10 = 134217984;
    uint64_t v11 = v7;
    _os_log_impl(&dword_224B41000, v6, OS_LOG_TYPE_DEFAULT, "[Cache] Received %lu suggestions", (uint8_t *)&v10, 0xCu);
  }

  BOOL v8 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_224B41000, v8, OS_LOG_TYPE_DEFAULT, "[Cache] Evict past suggestions", (uint8_t *)&v10, 2u);
  }

  [(ATXContextHeuristicCache *)self->_resultsCache evictBefore:v3];
  uint64_t v9 = [(ATXContextHeuristics *)self delegate];
  [v9 contextHeuristics:self didUpdateSuggestions:v5];
}

- (void)_setRefreshCTSJobForCriteria:(id)a3 fireDate:(id)a4 forHeuristics:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __76__ATXContextHeuristics__setRefreshCTSJobForCriteria_fireDate_forHeuristics___block_invoke;
  handler[3] = &unk_2646EEA58;
  handler[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  xpc_activity_register("com.apple.duetexpertd.context-heuristic-refresh", a3, handler);
}

void __76__ATXContextHeuristics__setRefreshCTSJobForCriteria_fireDate_forHeuristics___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  if (xpc_activity_get_state(activity) == 2 && ([MEMORY[0x263F61E30] isClassCLocked] & 1) == 0)
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__ATXContextHeuristics__setRefreshCTSJobForCriteria_fireDate_forHeuristics___block_invoke_2;
    block[3] = &unk_2646EE9E0;
    id v7 = *(id *)(a1 + 40);
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = v4;
    uint64_t v9 = v5;
    dispatch_async(v3, block);
  }
}

void __76__ATXContextHeuristics__setRefreshCTSJobForCriteria_fireDate_forHeuristics___block_invoke_2(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  [v2 timeIntervalSinceDate:a1[4]];
  uint64_t v4 = v3;
  uint64_t v5 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[5];
    int v7 = 134218242;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_224B41000, v5, OS_LOG_TYPE_DEFAULT, "[CTS] Running refresh %0.1fs after date for [%@].", (uint8_t *)&v7, 0x16u);
  }

  [*(id *)(a1[6] + 24) unionSet:a1[5]];
  [*(id *)(a1[6] + 48) runAfterDelaySeconds:0 coalescingBehavior:0.5];
}

- (void)_removeRefreshCTSJob
{
}

- (id)_criteriaForRefreshJobOnDate:(id)a3
{
  [a3 timeIntervalSinceNow];
  double v4 = v3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x263EF81A0], (uint64_t)v4);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x263EF81C0], *MEMORY[0x263EF81F8]);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x263EF82B8], 1);
  xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x263EF8180], 1);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x263EF82A0], 0);

  return v5;
}

- (ATXHeuristicDevice)heuristicDevice
{
  return self->_heuristicDevice;
}

- (ATXContextHeuristicsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXContextHeuristicsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_heuristicDevice, 0);
  objc_storeStrong((id *)&self->_earliestCacheRefreshTimeTrigger, 0);
  objc_storeStrong((id *)&self->_coalescedRefreshOperation, 0);
  objc_storeStrong((id *)&self->_resultsCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_heuristicsPendingRefresh, 0);
  objc_storeStrong((id *)&self->_heuristicRefreshTriggers, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

void __48__ATXContextHeuristics_initWithLocationManager___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_queue_refreshResultsForHeuristics:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__ATXContextHeuristics__queue_refreshResultsForHeuristics___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end