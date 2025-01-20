@interface ATXInformationHeuristics
+ (id)sourceIdentifierForHeuristicWithName:(id)a3;
- (ATXInformationHeuristics)init;
- (ATXInformationHeuristicsDelegate)delegate;
- (BOOL)_refreshResultsForHeuristics:(id)a3;
- (id)_criteriaForRefreshJobOnDate:(id)a3;
- (id)getResultsFromHeuristicInterpreter:(id)a3;
- (void)_refreshResultsForAllHeuristics:(BOOL)a3 completionHandler:(id)a4;
- (void)_setRefreshCTSJobForCriteria:(id)a3 forHeuristics:(id)a4;
- (void)informationHeuristicRefreshTrigger:(id)a3 didTriggerRefreshForHeuristics:(id)a4;
- (void)refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler:(id)a3;
- (void)refreshResultsForAllHeuristicsWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ATXInformationHeuristics

- (ATXInformationHeuristics)init
{
  v22.receiver = self;
  v22.super_class = (Class)ATXInformationHeuristics;
  v2 = [(ATXInformationHeuristics *)&v22 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    heuristicRefreshTriggers = v2->_heuristicRefreshTriggers;
    v2->_heuristicRefreshTriggers = (NSMutableSet *)v3;

    v5 = allInfoHeuristics();
    uint64_t v6 = [v5 mutableCopy];
    heuristicsPendingRefresh = v2->_heuristicsPendingRefresh;
    v2->_heuristicsPendingRefresh = (NSMutableSet *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v10 = dispatch_queue_create("ATXInformationHeuristicsRefresh", v9);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

    objc_initWeak(&location, v2);
    id v12 = objc_alloc(MEMORY[0x263F61E98]);
    v13 = v2->_queue;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __32__ATXInformationHeuristics_init__block_invoke;
    v19[3] = &unk_2646EE990;
    objc_copyWeak(&v20, &location);
    uint64_t v14 = [v12 initWithQueue:v13 operation:v19];
    coalescedRefreshOperation = v2->_coalescedRefreshOperation;
    v2->_coalescedRefreshOperation = (_PASSimpleCoalescingTimer *)v14;

    v16 = __atxlog_handle_gi();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_224B41000, v16, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristics: initialized", v18, 2u);
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__ATXInformationHeuristics_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler:0];
  }
  else
  {
    uint64_t v3 = __atxlog_handle_gi();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __32__ATXInformationHeuristics_init__block_invoke_cold_1(v3);
    }
  }
}

- (void)_refreshResultsForAllHeuristics:(BOOL)a3 completionHandler:(id)a4
{
  id v7 = a4;
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__ATXInformationHeuristics__refreshResultsForAllHeuristics_completionHandler___block_invoke;
  v10[3] = &unk_2646EEAB0;
  id v11 = v7;
  SEL v12 = a2;
  BOOL v13 = a3;
  v10[4] = self;
  id v9 = v7;
  dispatch_async(queue, v10);
}

void __78__ATXInformationHeuristics__refreshResultsForAllHeuristics_completionHandler___block_invoke(uint64_t a1)
{
  sel_getName(*(SEL *)(a1 + 48));
  uint64_t v2 = os_transaction_create();
  uint64_t v3 = *(void **)(a1 + 32);
  id v8 = (id)v2;
  if (*(unsigned char *)(a1 + 56))
  {
    v4 = allInfoHeuristics();
    int v5 = [v3 _refreshResultsForHeuristics:v4];

    if (v5)
    {
LABEL_3:
      [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
      uint64_t v6 = 1;
      goto LABEL_6;
    }
  }
  else if ([v3 _refreshResultsForHeuristics:v3[2]])
  {
    goto LABEL_3;
  }
  uint64_t v6 = 0;
LABEL_6:
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v6);
  }
}

- (void)refreshResultsForAllHeuristicsWithCompletionHandler:(id)a3
{
}

- (void)refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler:(id)a3
{
}

+ (id)sourceIdentifierForHeuristicWithName:(id)a3
{
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a3;
  int v5 = (void *)[[v3 alloc] initWithFormat:@"%@.%@", @"com.apple.proactive", v4];

  return v5;
}

- (void)informationHeuristicRefreshTrigger:(id)a3 didTriggerRefreshForHeuristics:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __94__ATXInformationHeuristics_informationHeuristicRefreshTrigger_didTriggerRefreshForHeuristics___block_invoke;
  v8[3] = &unk_2646EEA08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __94__ATXInformationHeuristics_informationHeuristicRefreshTrigger_didTriggerRefreshForHeuristics___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) unionSet:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v2 runAfterDelaySeconds:0 coalescingBehavior:0.5];
}

- (BOOL)_refreshResultsForHeuristics:(id)a3
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    uint64_t v6 = [(ATXInformationHeuristics *)self getResultsFromHeuristicInterpreter:v4];
    BOOL v7 = v6 != 0;
    id v8 = __atxlog_handle_gi();
    id v9 = v8;
    if (v6)
    {
      id v69 = v4;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v101 = [v6 count];
        _os_log_impl(&dword_224B41000, v9, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristics: received %lu results from HeuristicInterpreter", buf, 0xCu);
      }

      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      v68 = v6;
      obuint64_t j = v6;
      id v74 = (id)[obj countByEnumeratingWithState:&v92 objects:v104 count:16];
      if (v74)
      {
        uint64_t v72 = *(void *)v93;
        do
        {
          for (i = 0; i != v74; i = (char *)i + 1)
          {
            if (*(void *)v93 != v72) {
              objc_enumerationMutation(obj);
            }
            id v11 = *(void **)(*((void *)&v92 + 1) + 8 * i);
            SEL v12 = __atxlog_handle_gi();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v13 = [v11 heuristicName];
              uint64_t v14 = [v11 suggestions];
              uint64_t v15 = [v14 count];
              *(_DWORD *)buf = 138412546;
              uint64_t v101 = (uint64_t)v13;
              __int16 v102 = 2048;
              uint64_t v103 = v15;
              _os_log_impl(&dword_224B41000, v12, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristics: update heuristics %@, got %lu new suggestions", buf, 0x16u);
            }
            if ([v11 hasFailed])
            {
              v16 = __atxlog_handle_gi();
              if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_17;
              }
              v17 = [v11 heuristicName];
              *(_DWORD *)buf = 138412290;
              uint64_t v101 = (uint64_t)v17;
              _os_log_impl(&dword_224B41000, v16, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristics: updating heuristic %@ has failed in a non-trivial manner; bypassing the suggestions update",
                buf,
                0xCu);
            }
            else
            {
              v16 = objc_loadWeakRetained((id *)&self->_delegate);
              v17 = [v11 suggestions];
              v18 = [v11 heuristicName];
              [v16 informationHeuristics:self didUpdateSuggestions:v17 forHeuristic:v18];
            }
LABEL_17:

            long long v90 = 0u;
            long long v91 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            v19 = [v11 refreshTriggers];
            uint64_t v20 = [v19 countByEnumeratingWithState:&v88 objects:v99 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v89;
              do
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v89 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  v24 = *(void **)(*((void *)&v88 + 1) + 8 * j);
                  if (([(NSMutableSet *)self->_heuristicRefreshTriggers containsObject:v24] & 1) == 0)
                  {
                    [v24 setDelegate:self];
                    [(NSMutableSet *)self->_heuristicRefreshTriggers addObject:v24];
                  }
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v88 objects:v99 count:16];
              }
              while (v21);
            }

            long long v86 = 0u;
            long long v87 = 0u;
            long long v84 = 0u;
            long long v85 = 0u;
            v25 = self->_heuristicRefreshTriggers;
            uint64_t v26 = [(NSMutableSet *)v25 countByEnumeratingWithState:&v84 objects:v98 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v85;
              do
              {
                for (uint64_t k = 0; k != v27; ++k)
                {
                  if (*(void *)v85 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  v30 = *(void **)(*((void *)&v84 + 1) + 8 * k);
                  v31 = [v11 refreshTriggers];
                  int v32 = [v31 containsObject:v30];

                  v33 = [v11 heuristicName];
                  if (v32) {
                    [v30 startTriggeringRefreshForHeuristicIfNotAlready:v33];
                  }
                  else {
                    [v30 stopTriggeringRefreshForHeuristicIfAlready:v33];
                  }
                }
                uint64_t v27 = [(NSMutableSet *)v25 countByEnumeratingWithState:&v84 objects:v98 count:16];
              }
              while (v27);
            }
          }
          id v74 = (id)[obj countByEnumeratingWithState:&v92 objects:v104 count:16];
        }
        while (v74);
      }

      v34 = objc_opt_new();
      v35 = [MEMORY[0x263EFF910] date];
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      v75 = self->_heuristicRefreshTriggers;
      uint64_t v36 = [(NSMutableSet *)v75 countByEnumeratingWithState:&v80 objects:v97 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        v38 = 0;
        uint64_t v39 = *(void *)v81;
        id obja = v35;
        do
        {
          for (uint64_t m = 0; m != v37; ++m)
          {
            if (*(void *)v81 != v39) {
              objc_enumerationMutation(v75);
            }
            v41 = *(void **)(*((void *)&v80 + 1) + 8 * m);
            v42 = [v41 registeredHeuristics];
            uint64_t v43 = [v42 count];

            if (v43)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v44 = v41;
                v45 = [v44 fireDate];
                v46 = [v45 earlierDate:v35];

                if (v46 == v35)
                {
                  if (!v38) {
                    goto LABEL_51;
                  }
                  v47 = [v38 fireDate];
                  v48 = [v44 fireDate];
                  [v47 earlierDate:v48];
                  v49 = v73 = v38;
                  [v44 fireDate];
                  v51 = v50 = v34;

                  BOOL v52 = v49 == v51;
                  v34 = v50;
                  v35 = obja;
                  v38 = v73;
                  if (v52)
                  {
LABEL_51:
                    id v53 = v44;

                    v38 = v53;
                  }
                }
                else
                {
                  [v44 stopTriggeringRefreshForAllHeuristics];
                  [v34 addObject:v44];
                }
              }
            }
            else
            {
              [v34 addObject:v41];
            }
          }
          uint64_t v37 = [(NSMutableSet *)v75 countByEnumeratingWithState:&v80 objects:v97 count:16];
        }
        while (v37);
      }
      else
      {
        v38 = 0;
      }

      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v9 = v34;
      uint64_t v60 = [v9 countByEnumeratingWithState:&v76 objects:v96 count:16];
      if (v60)
      {
        uint64_t v61 = v60;
        uint64_t v62 = *(void *)v77;
        do
        {
          for (uint64_t n = 0; n != v61; ++n)
          {
            if (*(void *)v77 != v62) {
              objc_enumerationMutation(v9);
            }
            [(NSMutableSet *)self->_heuristicRefreshTriggers removeObject:*(void *)(*((void *)&v76 + 1) + 8 * n)];
          }
          uint64_t v61 = [v9 countByEnumeratingWithState:&v76 objects:v96 count:16];
        }
        while (v61);
      }

      if (v38)
      {
        v64 = [v38 fireDate];
        v65 = [(ATXInformationHeuristics *)self _criteriaForRefreshJobOnDate:v64];
        v66 = [v38 registeredHeuristics];
        [(ATXInformationHeuristics *)self _setRefreshCTSJobForCriteria:v65 forHeuristics:v66];

        [v38 stopTriggeringRefreshForAllHeuristics];
        [(NSMutableSet *)self->_heuristicRefreshTriggers removeObject:v38];
      }

      uint64_t v6 = v68;
      id v4 = v69;
      BOOL v7 = 1;
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[ATXInformationHeuristics _refreshResultsForHeuristics:](v9);
    }
  }
  else
  {
    uint64_t v6 = __atxlog_handle_gi();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXInformationHeuristics _refreshResultsForHeuristics:]((uint64_t)v4, v6, v54, v55, v56, v57, v58, v59);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (id)getResultsFromHeuristicInterpreter:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.proactive.HeuristicInterpreter"];
  uint64_t v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D7DA410];
  BOOL v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v6 setClasses:v9 forSelector:sel_resultsForInformationHeuristics_bundlePath_now_dataSourcesEndpoint_reply_ argumentIndex:0 ofReply:1];

  [v5 setRemoteObjectInterface:v6];
  [v5 resume];
  dispatch_queue_t v10 = (void *)[objc_alloc(MEMORY[0x263F23390]) initWithLocationManager:0];
  id v11 = (void *)[objc_alloc(MEMORY[0x263F23388]) initWithDevice:v10];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  SEL v12 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global];
  BOOL v13 = ATXHeuristicsBundlePath();
  uint64_t v14 = [v10 now];
  uint64_t v15 = [v11 listenerEndpoint];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __63__ATXInformationHeuristics_getResultsFromHeuristicInterpreter___block_invoke_54;
  v18[3] = &unk_2646EEAF8;
  v18[4] = &v19;
  [v12 resultsForInformationHeuristics:v4 bundlePath:v13 now:v14 dataSourcesEndpoint:v15 reply:v18];

  [v5 invalidate];
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

void __63__ATXInformationHeuristics_getResultsFromHeuristicInterpreter___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __63__ATXInformationHeuristics_getResultsFromHeuristicInterpreter___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __63__ATXInformationHeuristics_getResultsFromHeuristicInterpreter___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  if (!v5)
  {
    uint64_t v9 = __atxlog_handle_gi();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __63__ATXInformationHeuristics_getResultsFromHeuristicInterpreter___block_invoke_54_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)_setRefreshCTSJobForCriteria:(id)a3 forHeuristics:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__ATXInformationHeuristics__setRefreshCTSJobForCriteria_forHeuristics___block_invoke;
  v8[3] = &unk_2646EEB20;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  xpc_activity_register("com.apple.duetexpertd.info-heuristic-refresh", a3, v8);
}

void __71__ATXInformationHeuristics__setRefreshCTSJobForCriteria_forHeuristics___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  if (xpc_activity_get_state(activity) == 2 && ([MEMORY[0x263F61E30] isClassCLocked] & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(NSObject **)(v3 + 24);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __71__ATXInformationHeuristics__setRefreshCTSJobForCriteria_forHeuristics___block_invoke_2;
    v5[3] = &unk_2646EEA08;
    v5[4] = v3;
    id v6 = *(id *)(a1 + 40);
    dispatch_async(v4, v5);
  }
}

uint64_t __71__ATXInformationHeuristics__setRefreshCTSJobForCriteria_forHeuristics___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) unionSet:*(void *)(a1 + 40)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v2 runAfterDelaySeconds:0 coalescingBehavior:0.5];
}

- (id)_criteriaForRefreshJobOnDate:(id)a3
{
  [a3 timeIntervalSinceNow];
  double v4 = v3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x263EF81A0], (uint64_t)v4);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x263EF81C0], 300);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x263EF82B8], 1);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x263EF8180], 1);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x263EF82A0], 0);

  return v5;
}

- (ATXInformationHeuristicsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXInformationHeuristicsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_coalescedRefreshOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_heuristicsPendingRefresh, 0);

  objc_storeStrong((id *)&self->_heuristicRefreshTriggers, 0);
}

void __32__ATXInformationHeuristics_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224B41000, log, OS_LOG_TYPE_ERROR, "ATXInformationHeuristics: couldn't perform refresh operation because swelf is nil", v1, 2u);
}

- (void)_refreshResultsForHeuristics:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_refreshResultsForHeuristics:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224B41000, log, OS_LOG_TYPE_ERROR, "ATXInformationHeuristics: received nil results from HeuristicInterpreter", v1, 2u);
}

void __63__ATXInformationHeuristics_getResultsFromHeuristicInterpreter___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __63__ATXInformationHeuristics_getResultsFromHeuristicInterpreter___block_invoke_54_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end