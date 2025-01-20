@interface ATXActionPredictionHeuristics
+ (id)actionsWithLocationManager:(id)a3;
+ (id)addCacheExpirerNotification:(id)a3;
+ (id)nextCacheExpirationDate;
@end

@implementation ATXActionPredictionHeuristics

+ (id)actionsWithLocationManager:(id)a3
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v49 = a3;
  context = (void *)MEMORY[0x22A61E450]();
  v56 = [MEMORY[0x263F233E0] sharedInstance];
  v50 = [v56 heuristicsCached];
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__0;
  v82 = __Block_byref_object_dispose__0;
  id v83 = 0;
  v3 = (void *)MEMORY[0x22A61E450]();
  v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.proactive.HeuristicInterpreter"];
  v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D7DA410];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  [v5 setClasses:v9 forSelector:sel_actionsAndExpirersForHeuristicsExcept_bundlePath_now_dataSourcesEndpoint_reply_ argumentIndex:0 ofReply:1];

  [v4 setRemoteObjectInterface:v5];
  [v4 resume];
  v10 = (void *)[objc_alloc(MEMORY[0x263F23390]) initWithLocationManager:v49];
  v11 = (void *)[objc_alloc(MEMORY[0x263F23388]) initWithDevice:v10];
  v12 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_31];
  v13 = ATXHeuristicsBundlePath();
  v14 = [v10 now];
  v15 = [v11 listenerEndpoint];
  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = __60__ATXActionPredictionHeuristics_actionsWithLocationManager___block_invoke_32;
  v77[3] = &unk_2646EEB68;
  v77[4] = &v78;
  [v12 actionsAndExpirersForHeuristicsExcept:v50 bundlePath:v13 now:v14 dataSourcesEndpoint:v15 reply:v77];

  [v4 invalidate];
  if (v79[5])
  {
    v16 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(id)v79[5] allKeys];
      *(_DWORD *)buf = 138412290;
      v93 = v17;
      _os_log_impl(&dword_224B41000, v16, OS_LOG_TYPE_DEFAULT, "Received results from HeuristicInterpreter: %@", buf, 0xCu);
    }
    v18 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v93 = v50;
      _os_log_impl(&dword_224B41000, v18, OS_LOG_TYPE_DEFAULT, "Using cached results: %@", buf, 0xCu);
    }

    v19 = objc_opt_new();
    v20 = objc_opt_new();
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    obuint64_t j = (id)v79[5];
    uint64_t v54 = [obj countByEnumeratingWithState:&v73 objects:v91 count:16];
    if (v54)
    {
      id v52 = *(id *)v74;
      do
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(id *)v74 != v52) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v73 + 1) + 8 * i);
          v57 = [(id)v79[5] objectForKeyedSubscript:v21];
          id v22 = [v57 actionMakers];
          v23 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v22, "count"));
          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          id v24 = v22;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v84 objects:buf count:16];
          if (v25)
          {
            uint64_t v26 = *(void *)v85;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v85 != v26) {
                  objc_enumerationMutation(v24);
                }
                v28 = [*(id *)(*((void *)&v84 + 1) + 8 * j) action];
                if (v28) {
                  [v23 addObject:v28];
                }
              }
              uint64_t v25 = [v24 countByEnumeratingWithState:&v84 objects:buf count:16];
            }
            while (v25);
          }

          v29 = [v57 expirers];
          [v56 setObject:v23 expirers:v29 forKey:v21];

          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          id v30 = v23;
          uint64_t v31 = [v30 countByEnumeratingWithState:&v69 objects:v90 count:16];
          if (v31)
          {
            uint64_t v32 = *(void *)v70;
            do
            {
              for (uint64_t k = 0; k != v31; ++k)
              {
                if (*(void *)v70 != v32) {
                  objc_enumerationMutation(v30);
                }
                v34 = *(void **)(*((void *)&v69 + 1) + 8 * k);
                v35 = [v34 criteria];
                int v36 = [v35 isRelevant:v20];

                if (v36)
                {
                  [v19 addObject:v34];
                }
                else
                {
                  v37 = __atxlog_handle_heuristic();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v93 = v34;
                    _os_log_impl(&dword_224B41000, v37, OS_LOG_TYPE_DEFAULT, "Action is not relevant: %@", buf, 0xCu);
                  }
                }
              }
              uint64_t v31 = [v30 countByEnumeratingWithState:&v69 objects:v90 count:16];
            }
            while (v31);
          }
        }
        uint64_t v54 = [obj countByEnumeratingWithState:&v73 objects:v91 count:16];
      }
      while (v54);
    }

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v53 = v50;
    uint64_t v58 = [v53 countByEnumeratingWithState:&v65 objects:v89 count:16];
    if (v58)
    {
      uint64_t v55 = *(void *)v66;
      do
      {
        for (uint64_t m = 0; m != v58; ++m)
        {
          if (*(void *)v66 != v55) {
            objc_enumerationMutation(v53);
          }
          v38 = [v56 objectForKey:*(void *)(*((void *)&v65 + 1) + 8 * m) found:0];
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id v39 = v38;
          uint64_t v40 = [v39 countByEnumeratingWithState:&v61 objects:v88 count:16];
          if (v40)
          {
            uint64_t v41 = *(void *)v62;
            do
            {
              for (uint64_t n = 0; n != v40; ++n)
              {
                if (*(void *)v62 != v41) {
                  objc_enumerationMutation(v39);
                }
                v43 = *(void **)(*((void *)&v61 + 1) + 8 * n);
                v44 = [v43 criteria];
                int v45 = [v44 isRelevant:v20];

                if (v45)
                {
                  [v19 addObject:v43];
                }
                else
                {
                  v46 = __atxlog_handle_heuristic();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v93 = v43;
                    _os_log_impl(&dword_224B41000, v46, OS_LOG_TYPE_DEFAULT, "Action is no longer relevant: %@", buf, 0xCu);
                  }
                }
              }
              uint64_t v40 = [v39 countByEnumeratingWithState:&v61 objects:v88 count:16];
            }
            while (v40);
          }
        }
        uint64_t v58 = [v53 countByEnumeratingWithState:&v65 objects:v89 count:16];
      }
      while (v58);
    }

    [v19 sortWithOptions:16 usingComparator:&__block_literal_global_39];
  }
  else
  {
    v19 = 0;
  }
  _Block_object_dispose(&v78, 8);

  return v19;
}

void __60__ATXActionPredictionHeuristics_actionsWithLocationManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_224B41000, v3, OS_LOG_TYPE_DEFAULT, "Error getting heuristic results - unable to establish XPC connection: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __60__ATXActionPredictionHeuristics_actionsWithLocationManager___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  if (!v5)
  {
    v9 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_224B41000, v9, OS_LOG_TYPE_DEFAULT, "Error getting heuristic results - failed to compute actions and expirers for heuristics: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

uint64_t __60__ATXActionPredictionHeuristics_actionsWithLocationManager___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 heuristic];
  id v6 = [v4 heuristic];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)addCacheExpirerNotification:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A00];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  id v6 = [MEMORY[0x263F233E0] sharedInstance];
  uint64_t v7 = [v5 addObserverForName:@"com.apple.duetexpertd.heuristic.cache-expired" object:v6 queue:0 usingBlock:v4];

  return v7;
}

+ (id)nextCacheExpirationDate
{
  id v2 = [MEMORY[0x263F233E0] sharedInstance];
  v3 = [v2 firstExpirationDate];

  return v3;
}

@end