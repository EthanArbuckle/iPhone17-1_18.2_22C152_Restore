@interface MapsSuggestionsManager
- (BOOL)loadStorageFromFile:(id)a3;
- (GEOAutomobileOptions)automobileOptions;
- (MapsSuggestionsLocationUpdater)locationUpdater;
- (MapsSuggestionsManager)initWithStrategy:(id)a3 locationUpdater:(id)a4 network:(id)a5 flightUpdater:(id)a6 ETARequirements:(id)a7 virtualGarage:(id)a8;
- (MapsSuggestionsStrategy)strategy;
- (NSString)uniqueName;
- (char)loadStorageFromFile:(id)a3 callback:(id)a4 callbackQueue:(id)a5;
- (char)oneShotTopSuggestionsForSink:(id)a3 count:(unint64_t)a4 queue:(id)a5 handler:(id)a6;
- (char)oneShotTopSuggestionsForSink:(id)a3 count:(unint64_t)a4 transportType:(int)a5 callback:(id)a6 onQueue:(id)a7;
- (char)oneShotTopSuggestionsForSink:(id)a3 transportType:(int)a4 count:(unint64_t)a5 queue:(id)a6 handler:(id)a7;
- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (char)saveStorageToFile:(id)a3 callback:(id)a4;
- (char)topSuggestionsForSink:(id)a3 count:(unint64_t)a4 queue:(id)a5 handler:(id)a6;
- (char)topSuggestionsForSink:(id)a3 count:(unint64_t)a4 transportType:(int)a5 callback:(id)a6 onQueue:(id)a7;
- (char)topSuggestionsForSink:(id)a3 transportType:(int)a4 count:(unint64_t)a5 queue:(id)a6 handler:(id)a7;
- (id)_pruneExpiredFromEntries:(dispatch_queue_t *)a1;
- (id)additionalFiltersPerSink;
- (id)sinks;
- (id)sources;
- (id)storage;
- (id)storageForSource:(id)a3;
- (id)storageQueue;
- (id)tracker;
- (int)mapType;
- (uint64_t)_loadStorageFromFile:(uint64_t)a1;
- (uint64_t)_removeEntry:(void *)a3 sourceName:;
- (unint64_t)addOrUpdateSuggestionEntries:(id)a3 source:(id)a4;
- (void)_addOrUpdateSuggestionEntries:(void *)a3 source:;
- (void)_sendInvalidateToAllSinks;
- (void)_sq_deleteEntries:(void *)a3 source:;
- (void)_startSource:(uint64_t)a1;
- (void)_stopAllSources;
- (void)_updateAllSourcesOnceWithHandler:(uint64_t)a1;
- (void)_updateCurrentLocation:(uint64_t)a1;
- (void)_updateResult;
- (void)_updateSource:(void *)a3 forType:(int)a4 repeat:(void *)a5 handler:;
- (void)_wipeStaleETAs;
- (void)addAdditionalFilter:(id)a3 forSink:(id)a4;
- (void)attachSink:(id)a3;
- (void)attachSource:(id)a3;
- (void)awaitGatheringQueue;
- (void)awaitStorageQueue;
- (void)dealloc;
- (void)detachSink:(id)a3;
- (void)detachSource:(id)a3;
- (void)didLoseLocationPermission;
- (void)didUpdateLocation:(id)a3;
- (void)feedbackForContact:(id)a3 action:(int64_t)a4;
- (void)feedbackForEntry:(id)a3 action:(int64_t)a4;
- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4;
- (void)hintRefreshOfType:(int64_t)a3;
- (void)removeAdditionalFilter:(id)a3 forSink:(id)a4;
- (void)removeEntry:(id)a3;
- (void)removeEntry:(void *)a3 sourceName:;
- (void)setAutomobileOptions:(id)a3;
- (void)setLocationUpdater:(id)a3;
- (void)setMapType:(int)a3;
- (void)setStrategy:(id)a3;
- (void)setTitleFormatter:(void *)a3 forType:;
- (void)trackerRefreshedETAsUntil:(id)a3;
@end

@implementation MapsSuggestionsManager

void __37__MapsSuggestionsManager_attachSink___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v2 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      [*((id *)WeakRetained + 5) scheduleRefresh];
      v5 = v4[1];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__MapsSuggestionsManager_attachSink___block_invoke_158;
      block[3] = &unk_1E5CB7E78;
      objc_copyWeak(&v8, v2);
      dispatch_async(v5, block);
      objc_destroyWeak(&v8);
    }
    else
    {
      GEOFindOrCreateLog();
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v10 = "MapsSuggestionsManager.mm";
        __int16 v11 = 1026;
        int v12 = 614;
        __int16 v13 = 2082;
        v14 = "-[MapsSuggestionsManager attachSink:]_block_invoke_2";
        _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }
    }
  }
}

- (MapsSuggestionsManager)initWithStrategy:(id)a3 locationUpdater:(id)a4 network:(id)a5 flightUpdater:(id)a6 ETARequirements:(id)a7 virtualGarage:(id)a8
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id obj = a4;
  id v52 = a5;
  id v53 = a6;
  id v16 = a7;
  id v17 = a8;
  if (v15)
  {
    v61.receiver = self;
    v61.super_class = (Class)MapsSuggestionsManager;
    v18 = [(MapsSuggestionsManager *)&v61 init];
    if (v18)
    {
      objc_initWeak((id *)location, v18);
      v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      attr = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_USER_INITIATED, 0);

      dispatch_queue_t v20 = dispatch_queue_create("MapsSuggestionsManagerGatheringQueue", attr);
      gatheringQueue = v18->_gatheringQueue;
      v18->_gatheringQueue = (OS_dispatch_queue *)v20;

      dispatch_queue_t v22 = dispatch_queue_create("MapsSuggestionsManagerStorageQueue", attr);
      storageQueue = v18->_storageQueue;
      v18->_storageQueue = (OS_dispatch_queue *)v22;

      [(MapsSuggestionsCanKicker *)v18->_deferredSourcesUpdater cancel];
      objc_storeStrong((id *)&v18->_strategy, a3);
      [(MapsSuggestionsStrategy *)v18->_strategy setManager:v18];
      objc_storeWeak((id *)&v18->_locationUpdater, obj);
      if (v16)
      {
        v24 = [[MapsSuggestionsTracker alloc] initWithManager:v18 requirements:v16 network:v52 flightUpdater:v53 virtualGarage:v17];
        tracker = v18->_tracker;
        v18->_tracker = v24;
      }
      v26 = [[MapsSuggestionsCompositeSource alloc] initWithDelegate:v18 name:@"MapsSuggestionsBuiltinCompositeSource"];
      compositeSource = v18->_compositeSource;
      v18->_compositeSource = v26;

      v28 = [[MapsSuggestionsObservers alloc] initWithCallbackQueue:v18->_storageQueue name:@"MapsSuggestionsManagerSinks"];
      sinks = v18->_sinks;
      v18->_sinks = v28;

      v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      storage = v18->_storage;
      v18->_storage = v30;

      v18->_defaultTansportType = GEOTransportTypeFromUserPreference();
      uint64_t v32 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      additionalFiltersPerSink = v18->_additionalFiltersPerSink;
      v18->_additionalFiltersPerSink = (NSMutableDictionary *)v32;

      v34 = [MapsSuggestionsCanKicker alloc];
      v35 = v18->_storageQueue;
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __111__MapsSuggestionsManager_initWithStrategy_locationUpdater_network_flightUpdater_ETARequirements_virtualGarage___block_invoke;
      v59[3] = &unk_1E5CB7E78;
      objc_copyWeak(&v60, (id *)location);
      uint64_t v36 = [(MapsSuggestionsCanKicker *)v34 initWithName:@"MapsSuggestionsManagerExpiredEntryInvalidator" queue:v35 block:v59];
      expiredEntryInvalidator = v18->_expiredEntryInvalidator;
      v18->_expiredEntryInvalidator = (MapsSuggestionsCanKicker *)v36;

      v38 = [MapsSuggestionsCanKicker alloc];
      v39 = v18->_storageQueue;
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __111__MapsSuggestionsManager_initWithStrategy_locationUpdater_network_flightUpdater_ETARequirements_virtualGarage___block_invoke_134;
      v57[3] = &unk_1E5CB7E78;
      objc_copyWeak(&v58, (id *)location);
      uint64_t v40 = [(MapsSuggestionsCanKicker *)v38 initWithName:@"MapsSuggestionsManagerETAWiper" queue:v39 block:v57];
      wipeStaleETAWiper = v18->_wipeStaleETAWiper;
      v18->_wipeStaleETAWiper = (MapsSuggestionsCanKicker *)v40;

      GEOConfigGetDouble();
      double v43 = v42;
      v44 = [MapsSuggestionsCanKicker alloc];
      v45 = v18->_gatheringQueue;
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __111__MapsSuggestionsManager_initWithStrategy_locationUpdater_network_flightUpdater_ETARequirements_virtualGarage___block_invoke_138;
      v55[3] = &unk_1E5CB7E78;
      objc_copyWeak(&v56, (id *)location);
      uint64_t v46 = [(MapsSuggestionsCanKicker *)v44 initWithName:@"MapsSuggestionsManagerDeferredUpdater" time:v45 queue:v55 block:v43];
      deferredSourcesUpdater = v18->_deferredSourcesUpdater;
      v18->_deferredSourcesUpdater = (MapsSuggestionsCanKicker *)v46;

      v18->_mapType = 0;
      v18->_sourcesRunning = 0;
      objc_destroyWeak(&v56);
      objc_destroyWeak(&v58);
      objc_destroyWeak(&v60);

      objc_destroyWeak((id *)location);
    }
    self = v18;
    v48 = self;
  }
  else
  {
    v49 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v63 = 1024;
      int v64 = 114;
      __int16 v65 = 2082;
      v66 = "-[MapsSuggestionsManager initWithStrategy:locationUpdater:network:flightUpdater:ETARequirements:virtualGarage:]";
      __int16 v67 = 2082;
      v68 = "nil == (strategy)";
      _os_log_impl(&dword_1A70DF000, v49, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. A strategy is required.", location, 0x26u);
    }

    v48 = 0;
  }

  return v48;
}

- (id)_pruneExpiredFromEntries:(dispatch_queue_t *)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v17 = a1;
  dispatch_assert_queue_V2(a1[2]);
  if ([v4 count])
  {
    id v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v19;
      id v16 = v4;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
          if (([v9 deleted] & 1) != 0 || objc_msgSend(v9, "hasExpired"))
          {
            [v9 setDeleted:1];
            GEOFindOrCreateLog();
            v10 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              __int16 v11 = [(dispatch_queue_t *)v17 uniqueName];
              if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
                dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
              }
              int v12 = s_verbose;
              if (s_verbose)
              {
                v2 = [v9 serializedBase64String];
                __int16 v13 = v2;
              }
              else
              {
                __int16 v13 = &stru_1EFC640F8;
              }
              *(_DWORD *)buf = 138413058;
              v23 = v11;
              __int16 v24 = 2048;
              v25 = v9;
              __int16 v26 = 2112;
              v27 = v13;
              __int16 v28 = 2112;
              v29 = v9;
              _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} PRUNED by OBJECT{%@} {%p:%@}:\n%@", buf, 0x2Au);
              if (v12) {

              }
              id v4 = v16;
            }
          }
          else
          {
            [v15 addObject:v9];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v30 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v15 = v4;
  }

  return v15;
}

- (void)_updateResult
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 24))
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    GEOFindOrCreateLog();
    v1 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      v2 = [(id)a1 uniqueName];
      *(_DWORD *)buf = 138412546;
      v90 = v2;
      __int16 v91 = 2080;
      *(void *)v92 = "_updateResult";
      _os_log_impl(&dword_1A70DF000, v1, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    v3 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_updateResult", "", buf, 2u);
    }

    v70 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v4 = *(id *)(a1 + 72);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v77 objects:v88 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v78 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v77 + 1) + 8 * i);
          v9 = [*(id *)(a1 + 72) objectForKeyedSubscript:v8];
          v10 = (void *)[v9 mutableCopy];
          [v70 setObject:v10 forKeyedSubscript:v8];
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v77 objects:v88 count:16];
      }
      while (v5);
    }

    __int16 v67 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:*(void *)(a1 + 80) copyItems:1];
    __int16 v11 = *(void **)(a1 + 24);
    id v76 = 0;
    int v12 = [v11 topSuggestionsWithSourceEntries:v70 error:&v76];
    id v68 = v76;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obj = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v72 objects:v87 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v73;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v73 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v72 + 1) + 8 * j);
          if ([v16 containsKey:@"MapsSuggestionsNewSourceKey"])
          {
            id v17 = [v16 originatingSourceName];
            long long v18 = [v16 stringForKey:@"MapsSuggestionsNewSourceKey"];
            if (([v17 isEqualToString:v18] & 1) == 0)
            {
              long long v19 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v90 = v17;
                __int16 v91 = 2112;
                *(void *)v92 = v18;
                *(_WORD *)&v92[8] = 2112;
                *(void *)&v92[10] = v16;
                _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "RELINKING from %@ to %@: %@", buf, 0x20u);
              }

              long long v20 = [*(id *)(a1 + 72) objectForKeyedSubscript:v17];
              [v20 removeObjectIdenticalTo:v16];

              long long v21 = [*(id *)(a1 + 72) objectForKeyedSubscript:v18];
              [v21 addObject:v16];

              [v16 setOriginatingSourceName:v18];
            }
            [v16 setString:0 forKey:@"MapsSuggestionsNewSourceKey"];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v72 objects:v87 count:16];
      }
      while (v13);
    }

    if (v68)
    {
      GEOFindOrCreateLog();
      dispatch_queue_t v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__updateResult);
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v90 = v23;
        __int16 v91 = 2112;
        *(void *)v92 = v68;
        _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "%@ received error: %@", buf, 0x16u);
      }
      GEOFindOrCreateLog();
      __int16 v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v25 = [(id)a1 uniqueName];
        *(_DWORD *)buf = 138412546;
        v90 = v25;
        __int16 v91 = 2080;
        *(void *)v92 = "_updateResult";
        _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      __int16 v26 = GEOFindOrCreateLog();
      if (!os_signpost_enabled(v26)) {
        goto LABEL_79;
      }
      *(_WORD *)buf = 0;
    }
    else
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
      id v28 = *(id *)(a1 + 72);
      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v30 = v28;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v83 objects:buf count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v84;
        do
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v84 != v32) {
              objc_enumerationMutation(v30);
            }
            uint64_t v34 = *(void *)(*((void *)&v83 + 1) + 8 * k);
            v35 = [v30 objectForKeyedSubscript:v34];
            uint64_t v36 = -[MapsSuggestionsManager _pruneExpiredFromEntries:]((dispatch_queue_t *)a1, v35);
            v37 = (void *)[v36 mutableCopy];
            [v29 setObject:v37 forKeyedSubscript:v34];
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v83 objects:buf count:16];
        }
        while (v31);
      }

      v38 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v29;

      v66 = -[MapsSuggestionsManager _pruneExpiredFromEntries:]((dispatch_queue_t *)a1, obj);

      id obj = v66;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
      id v65 = *(id *)(a1 + 72);
      v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v40 = v65;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v83 objects:buf count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v84;
        do
        {
          for (uint64_t m = 0; m != v41; ++m)
          {
            if (*(void *)v84 != v42) {
              objc_enumerationMutation(v40);
            }
            uint64_t v44 = *(void *)(*((void *)&v83 + 1) + 8 * m);
            v45 = [v40 objectForKeyedSubscript:v44];
            v81[0] = MEMORY[0x1E4F143A8];
            v81[1] = 3221225472;
            v81[2] = __62__MapsSuggestionsManager__pruneSourceEntriesNotRepresentedIn___block_invoke;
            v81[3] = &unk_1E5CB8540;
            id v82 = obj;
            uint64_t v46 = objc_msgSend(v45, "MSg_mutableCopyIf:", v81);
            [v39 setObject:v46 forKeyedSubscript:v44];
          }
          uint64_t v41 = [v40 countByEnumeratingWithState:&v83 objects:buf count:16];
        }
        while (v41);
      }

      v47 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v39;

      if ([v67 isEqualToArray:obj])
      {
        GEOFindOrCreateLog();
        v48 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(sel__updateResult);
          v49 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v90 = v49;
          _os_log_impl(&dword_1A70DF000, v48, OS_LOG_TYPE_DEBUG, "%@ found no changes to previous result.", buf, 0xCu);
        }
        GEOFindOrCreateLog();
        v50 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          v51 = [(id)a1 uniqueName];
          *(_DWORD *)buf = 138412546;
          v90 = v51;
          __int16 v91 = 2080;
          *(void *)v92 = "_updateResult";
          _os_log_impl(&dword_1A70DF000, v50, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
        }
        __int16 v26 = GEOFindOrCreateLog();
        if (!os_signpost_enabled(v26)) {
          goto LABEL_79;
        }
        *(_WORD *)buf = 0;
      }
      else
      {
        objc_storeStrong((id *)(a1 + 80), v66);
        id v52 = *(id *)(a1 + 80);
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
        if ([v52 count])
        {
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          id v53 = v52;
          v54 = 0;
          uint64_t v55 = [v53 countByEnumeratingWithState:&v83 objects:buf count:16];
          if (v55)
          {
            uint64_t v56 = *(void *)v84;
            while (2)
            {
              for (uint64_t n = 0; n != v55; ++n)
              {
                if (*(void *)v84 != v56) {
                  objc_enumerationMutation(v53);
                }
                id v58 = *(void **)(*((void *)&v83 + 1) + 8 * n);
                if ([v58 deleted])
                {
                  id v60 = v58;

                  v54 = v60;
                  goto LABEL_70;
                }
                if (!v54 || [v58 expiresBeforeEntry:v54])
                {
                  id v59 = v58;

                  v54 = v59;
                }
              }
              uint64_t v55 = [v53 countByEnumeratingWithState:&v83 objects:buf count:16];
              if (v55) {
                continue;
              }
              break;
            }
          }
LABEL_70:

          objc_super v61 = [v54 expires];
          v62 = v61;
          if (v61) {
            [*(id *)(a1 + 96) kickCanByTime:MapsSuggestionsSecondsTo(v61)];
          }
        }
        else
        {
          [*(id *)(a1 + 96) cancel];
        }

        [*(id *)(a1 + 40) trackSuggestionEntries:obj transportType:*(unsigned int *)(a1 + 88)];
        -[MapsSuggestionsManager _sendInvalidateToAllSinks](a1);
        GEOFindOrCreateLog();
        __int16 v63 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          int v64 = [(id)a1 uniqueName];
          *(_DWORD *)buf = 138412546;
          v90 = v64;
          __int16 v91 = 2080;
          *(void *)v92 = "_updateResult";
          _os_log_impl(&dword_1A70DF000, v63, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
        }
        __int16 v26 = GEOFindOrCreateLog();
        if (!os_signpost_enabled(v26)) {
          goto LABEL_79;
        }
        *(_WORD *)buf = 0;
      }
    }
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateResult", "", buf, 2u);
LABEL_79:

    v27 = v70;
    goto LABEL_80;
  }
  v27 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v90 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
    __int16 v91 = 1024;
    *(_DWORD *)v92 = 482;
    *(_WORD *)&v92[4] = 2082;
    *(void *)&v92[6] = "-[MapsSuggestionsManager _updateResult]";
    *(_WORD *)&v92[14] = 2082;
    *(void *)&v92[16] = "nil == (_strategy)";
    _os_log_impl(&dword_1A70DF000, v27, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Cannot do anything without a Strategy.", buf, 0x26u);
  }
LABEL_80:
}

- (unint64_t)addOrUpdateSuggestionEntries:(id)a3 source:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  GEOFindOrCreateLog();
  uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v7;
    __int16 v31 = 1024;
    LODWORD(v32) = [v6 count];
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "addOrUpdate from SOURCE{%@} with %u entries", buf, 0x12u);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v12++) setDeleted:0];
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v10);
  }

  GEOFindOrCreateLog();
  uint64_t v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [(MapsSuggestionsManager *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    id v30 = v14;
    __int16 v31 = 2080;
    uint64_t v32 = "addOrUpdateSuggestionEntries";
    _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  id v15 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "addOrUpdateSuggestionEntries", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  storageQueue = self->_storageQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MapsSuggestionsManager_addOrUpdateSuggestionEntries_source___block_invoke;
  block[3] = &unk_1E5CB86F8;
  objc_copyWeak(&v24, (id *)buf);
  id v17 = v7;
  id v22 = v17;
  id v18 = v9;
  id v23 = v18;
  dispatch_async(storageQueue, block);
  unint64_t v19 = [v18 count];

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

  return v19;
}

void __62__MapsSuggestionsManager_addOrUpdateSuggestionEntries_source___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v19 = (dispatch_queue_t *)WeakRetained;
  if (WeakRetained)
  {
    uint64_t v23 = a1;
    id v18 = [*((id *)WeakRetained + 9) objectForKeyedSubscript:*(void *)(a1 + 32)];
    if ([v18 count])
    {
      long long v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id obj = v18;
      uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v3)
      {
        uint64_t v22 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v3; ++i)
          {
            if (*(void *)v29 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v5 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            long long v24 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            id v6 = *(id *)(v23 + 40);
            uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v7)
            {
              uint64_t v8 = *(void *)v25;
              while (2)
              {
                for (uint64_t j = 0; j != v7; ++j)
                {
                  if (*(void *)v25 != v8) {
                    objc_enumerationMutation(v6);
                  }
                  uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * j);
                  uint64_t v11 = [v5 type];
                  if (v11 == [v10 type])
                  {
                    uint64_t v12 = [v5 uniqueIdentifier];
                    uint64_t v13 = [v10 uniqueIdentifier];
                    char v14 = [v12 isEqualToString:v13];

                    if (v14)
                    {

                      goto LABEL_19;
                    }
                  }
                }
                uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
                if (v7) {
                  continue;
                }
                break;
              }
            }

            [v20 addObject:v5];
LABEL_19:
            ;
          }
          uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v3);
      }

      if ([v20 count]) {
        -[MapsSuggestionsManager _sq_deleteEntries:source:](v19, v20, *(void **)(v23 + 32));
      }
    }
    if ([*(id *)(v23 + 40) count]) {
      -[MapsSuggestionsManager _addOrUpdateSuggestionEntries:source:]((uint64_t)v19, *(void **)(v23 + 40), *(void **)(v23 + 32));
    }
    GEOFindOrCreateLog();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v16 = [(dispatch_queue_t *)v19 uniqueName];
      *(_DWORD *)buf = 138412546;
      v35 = v16;
      __int16 v36 = 2080;
      *(void *)v37 = "addOrUpdateSuggestionEntries";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    id v17 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "addOrUpdateSuggestionEntries", "", buf, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v35 = "MapsSuggestionsManager.mm";
      __int16 v36 = 1026;
      *(_DWORD *)v37 = 1120;
      *(_WORD *)&v37[4] = 2082;
      *(void *)&v37[6] = "-[MapsSuggestionsManager addOrUpdateSuggestionEntries:source:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    id v18 = v17;
  }
}

BOOL __62__MapsSuggestionsManager__pruneSourceEntriesNotRepresentedIn___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) indexOfObjectIdenticalTo:v3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Kicking out non-result sourceEntry: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_sendInvalidateToAllSinks
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "_sendInvalidateToAllSinks", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, (id)a1);
  id v3 = *(void **)(a1 + 56);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__MapsSuggestionsManager__sendInvalidateToAllSinks__block_invoke;
  v4[3] = &unk_1E5CB8568;
  objc_copyWeak(&v5, buf);
  [v3 callBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

void __59__MapsSuggestionsManager__updateAllSourcesOnceWithHandler___block_invoke_142(uint64_t a1)
{
  *(void *)&v11[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = [WeakRetained uniqueName];
      int v8 = 138412546;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      *(void *)uint64_t v11 = "_updateAllSourcesOnce";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
    }
    id v5 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateAllSourcesOnce", "", (uint8_t *)&v8, 2u);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      uint64_t v9 = "MapsSuggestionsManager.mm";
      __int16 v10 = 1026;
      *(_DWORD *)uint64_t v11 = 308;
      v11[2] = 2082;
      *(void *)&v11[3] = "-[MapsSuggestionsManager _updateAllSourcesOnceWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)setTitleFormatter:(void *)a3 forType:
{
  id v5 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    uint64_t v6 = a1[2];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__MapsSuggestionsManager_setTitleFormatter_forType___block_invoke;
    v7[3] = &unk_1E5CB7E50;
    objc_copyWeak(v9, &location);
    id v8 = v5;
    v9[1] = a3;
    dispatch_async(v6, v7);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (void)attachSource:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [v4 uniqueName];
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "attachSource:%@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    gatheringQueue = self->_gatheringQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    id v9[2] = __39__MapsSuggestionsManager_attachSource___block_invoke;
    v9[3] = &unk_1E5CB85B8;
    objc_copyWeak(&v11, (id *)buf);
    id v10 = v4;
    dispatch_async(gatheringQueue, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v14 = 1024;
      int v15 = 572;
      __int16 v16 = 2082;
      id v17 = "-[MapsSuggestionsManager attachSource:]";
      __int16 v18 = 2082;
      unint64_t v19 = "nil == (source)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source to attach to.", buf, 0x26u);
    }
  }
}

void __52__MapsSuggestionsManager_setTitleFormatter_forType___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[5] setTitleFormatter:*(void *)(a1 + 32) forType:*(void *)(a1 + 48)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      uint64_t v6 = "MapsSuggestionsManager.mm";
      __int16 v7 = 1026;
      int v8 = 1260;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsManager setTitleFormatter:forType:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void __82__MapsSuggestionsManager_topSuggestionsForSink_transportType_count_queue_handler___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 64);
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v42 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (uint64_t)WeakRetained;
    frouint64_t m = v2;
    uint64_t v5 = -[MapsSuggestionsManager _pruneExpiredFromEntries:]((dispatch_queue_t *)WeakRetained, WeakRetained[10]);
    uint64_t v6 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = v5;

    -[MapsSuggestionsManager _wipeStaleETAs](v4);
    __int16 v7 = *(void **)(v4 + 80);
    v35 = *(void **)(v1 + 32);
    int v8 = [*(id *)(v1 + 40) uniqueName];
    unint64_t v41 = *(void *)(v1 + 72);
    id v37 = v7;
    id v43 = v8;
    if ([v43 length])
    {
      if (v41)
      {
        dispatch_assert_queue_V2((dispatch_queue_t)v42[2]);
        if ([v37 count])
        {
          uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v41];
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id obj = v37;
          uint64_t v40 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v40)
          {
            unint64_t v10 = 0;
            uint64_t v39 = *(void *)v50;
            *(void *)&long long v9 = 138413058;
            long long v33 = v9;
LABEL_7:
            uint64_t v11 = 0;
            while (1)
            {
              if (*(void *)v50 != v39) {
                objc_enumerationMutation(obj);
              }
              if (v10 >= v41) {
                break;
              }
              uint64_t v12 = *(void **)(*((void *)&v49 + 1) + 8 * v11);
              id v13 = v43;
              id v14 = v12;
              if ([v13 length])
              {
                if (v14)
                {
                  dispatch_assert_queue_V2((dispatch_queue_t)v42[2]);
                  int v15 = [v42[4] objectForKeyedSubscript:v13];
                  if (v15)
                  {
                    uint64_t v16 = v1;
                    long long v55 = 0u;
                    long long v56 = 0u;
                    long long v53 = 0u;
                    long long v54 = 0u;
                    id v17 = v15;
                    uint64_t v18 = [v17 countByEnumeratingWithState:&v53 objects:v62 count:16];
                    if (v18)
                    {
                      uint64_t v19 = *(void *)v54;
                      while (2)
                      {
                        for (uint64_t i = 0; i != v18; ++i)
                        {
                          if (*(void *)v54 != v19) {
                            objc_enumerationMutation(v17);
                          }
                          long long v21 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                          if ((objc_msgSend(v21, "shouldKeepEntry:", v14, v33) & 1) == 0)
                          {
                            GEOFindOrCreateLog();
                            long long v25 = (id)objc_claimAutoreleasedReturnValue();
                            uint64_t v1 = v16;
                            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                            {
                              long long v26 = [v21 uniqueName];
                              if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
                                dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
                              }
                              int v27 = s_verbose;
                              if (s_verbose)
                              {
                                long long v28 = [v14 serializedBase64String];
                              }
                              else
                              {
                                long long v28 = &stru_1EFC640F8;
                              }
                              *(_DWORD *)buf = v33;
                              id v59 = v26;
                              __int16 v60 = 2048;
                              *(void *)objc_super v61 = v14;
                              *(_WORD *)&v61[8] = 2112;
                              *(void *)&v61[10] = v28;
                              *(_WORD *)&v61[18] = 2112;
                              *(void *)&v61[20] = v14;
                              _os_log_impl(&dword_1A70DF000, v25, OS_LOG_TYPE_DEBUG, "{MSgDebug} FILTERED by FILTER{%@} {%p:%@}:\n%@", buf, 0x2Au);
                              if (v27) {

                              }
                              uint64_t v1 = v16;
                            }

                            goto LABEL_41;
                          }
                        }
                        uint64_t v18 = [v17 countByEnumeratingWithState:&v53 objects:v62 count:16];
                        if (v18) {
                          continue;
                        }
                        break;
                      }
                    }

                    uint64_t v1 = v16;
                  }
                  else
                  {
                  }
                  objc_msgSend(v34, "addObject:", v14, v33);
                  ++v10;
                  goto LABEL_41;
                }
                uint64_t v22 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446978;
                  id v59 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
                  __int16 v60 = 1024;
                  *(_DWORD *)objc_super v61 = 892;
                  *(_WORD *)&v61[4] = 2082;
                  *(void *)&v61[6] = "-[MapsSuggestionsManager _sink:allowsEntry:]";
                  *(_WORD *)&v61[14] = 2082;
                  *(void *)&v61[16] = "nil == (entry)";
                  uint64_t v23 = v22;
                  long long v24 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry";
                  goto LABEL_27;
                }
              }
              else
              {
                uint64_t v22 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446978;
                  id v59 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
                  __int16 v60 = 1024;
                  *(_DWORD *)objc_super v61 = 891;
                  *(_WORD *)&v61[4] = 2082;
                  *(void *)&v61[6] = "-[MapsSuggestionsManager _sink:allowsEntry:]";
                  *(_WORD *)&v61[14] = 2082;
                  *(void *)&v61[16] = "0u == sinkName.length";
                  uint64_t v23 = v22;
                  long long v24 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sinkName";
LABEL_27:
                  _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x26u);
                }
              }

LABEL_41:
              if (++v11 == v40)
              {
                uint64_t v40 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
                if (v40) {
                  goto LABEL_7;
                }
                break;
              }
            }
          }

          id v29 = (id)[v34 copy];
        }
        else
        {
          id v29 = v37;
        }
        goto LABEL_53;
      }
      long long v31 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v62 = 136446978;
        __int16 v63 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
        __int16 v64 = 1024;
        int v65 = 920;
        __int16 v66 = 2082;
        __int16 v67 = "-[MapsSuggestionsManager _filteredEntries:forSink:limit:]";
        __int16 v68 = 2082;
        uint64_t v69 = "0u == limit";
        _os_log_impl(&dword_1A70DF000, v31, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires limit > 0", v62, 0x26u);
      }
    }
    else
    {
      long long v31 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v62 = 136446978;
        __int16 v63 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
        __int16 v64 = 1024;
        int v65 = 919;
        __int16 v66 = 2082;
        __int16 v67 = "-[MapsSuggestionsManager _filteredEntries:forSink:limit:]";
        __int16 v68 = 2082;
        uint64_t v69 = "0u == sinkName.length";
        _os_log_impl(&dword_1A70DF000, v31, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sinkName", v62, 0x26u);
      }
    }

    id v29 = 0;
LABEL_53:

    [v35 addObjectsFromArray:v29];
    uint64_t v32 = *(NSObject **)(v1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__MapsSuggestionsManager_topSuggestionsForSink_transportType_count_queue_handler___block_invoke_173;
    block[3] = &unk_1E5CB8658;
    objc_copyWeak(&v48, from);
    id v45 = *(id *)(v1 + 32);
    id v47 = *(id *)(v1 + 56);
    id v46 = *(id *)(v1 + 40);
    dispatch_async(v32, block);

    objc_destroyWeak(&v48);
    goto LABEL_54;
  }
  GEOFindOrCreateLog();
  long long v30 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v62 = 136446722;
    __int16 v63 = "MapsSuggestionsManager.mm";
    __int16 v64 = 1026;
    int v65 = 761;
    __int16 v66 = 2082;
    __int16 v67 = "-[MapsSuggestionsManager topSuggestionsForSink:transportType:count:queue:handler:]_block_invoke";
    _os_log_impl(&dword_1A70DF000, v30, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", v62, 0x1Cu);
  }

LABEL_54:
}

- (void)_wipeStaleETAs
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    if (!MapsSuggestionsIsInTheFuture(v2))
    {
      objc_initWeak(&location, (id)a1);
      id v3 = *(NSObject **)(a1 + 16);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __40__MapsSuggestionsManager__wipeStaleETAs__block_invoke;
      v4[3] = &unk_1E5CB7E78;
      objc_copyWeak(&v5, &location);
      dispatch_async(v3, v4);
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }
}

void __82__MapsSuggestionsManager_topSuggestionsForSink_transportType_count_queue_handler___block_invoke_173(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v4 = *(id *)(a1 + 32);
    [v4 sortUsingComparator:&__block_literal_global_369];
    id v5 = [v4 copy];

    uint64_t v18 = v5;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    GEOFindOrCreateLog();
    uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      __int16 v7 = [WeakRetained uniqueName];
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v20 = v7;
      *(_WORD *)&v20[8] = 2080;
      *(void *)&v20[10] = "topSuggestionsForSink";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    int v8 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsForSink", "", buf, 2u);
    }

    context = (void *)MEMORY[0x1AD0C8E80]();
    for (unint64_t i = 0; i < objc_msgSend(*(id *)(a1 + 32), "count", context); ++i)
    {
      GEOFindOrCreateLog();
      unint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = [*(id *)(a1 + 40) uniqueName];
        uint64_t v12 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        }
        int v13 = s_verbose;
        if (s_verbose)
        {
          uint64_t v1 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
          v2 = [v1 serializedBase64String];
          id v14 = v2;
        }
        else
        {
          id v14 = &stru_1EFC640F8;
        }
        int v15 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)uint64_t v20 = i;
        *(_WORD *)&v20[4] = 2112;
        *(void *)&v20[6] = v11;
        *(_WORD *)&v20[14] = 2048;
        *(void *)&v20[16] = v12;
        __int16 v21 = 2112;
        uint64_t v22 = v14;
        __int16 v23 = 2112;
        long long v24 = v15;
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} SERVED as #%u to SINK{%@} {%p:%@}:\n%@", buf, 0x30u);

        id v5 = v18;
        if (v13)
        {
        }
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)uint64_t v20 = "MapsSuggestionsManager.mm";
      *(_WORD *)&v20[8] = 1026;
      *(_DWORD *)&v20[10] = 769;
      *(_WORD *)&v20[14] = 2082;
      *(void *)&v20[16] = "-[MapsSuggestionsManager topSuggestionsForSink:transportType:count:queue:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __39__MapsSuggestionsManager_attachSource___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[8] attachSource:*(void *)(a1 + 32)];
    -[MapsSuggestionsManager _startSource:]((uint64_t)v3, v3[8]);
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      uint64_t v6 = "MapsSuggestionsManager.mm";
      __int16 v7 = 1026;
      int v8 = 579;
      __int16 v9 = 2082;
      unint64_t v10 = "-[MapsSuggestionsManager attachSource:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)_startSource:(uint64_t)a1
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  GEOFindOrCreateLog();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = [v3 uniqueName];
    int v6 = 138412290;
    __int16 v7 = v5;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Starting SOURCE{%@}", (uint8_t *)&v6, 0xCu);
  }
  [v3 start];
}

void __51__MapsSuggestionsManager__sendInvalidateToAllSinks__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [v3 invalidateForMapsSuggestionsManager:WeakRetained];
  }
  else
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      __int16 v7 = "MapsSuggestionsManager.mm";
      __int16 v8 = 1026;
      int v9 = 442;
      __int16 v10 = 2082;
      uint64_t v11 = "-[MapsSuggestionsManager _sendInvalidateToAllSinks]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)didUpdateLocation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  gatheringQueue = self->_gatheringQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MapsSuggestionsManager_didUpdateLocation___block_invoke;
  block[3] = &unk_1E5CB85B8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(gatheringQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __37__MapsSuggestionsManager_attachSink___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__MapsSuggestionsManager_attachSink___block_invoke_2;
  v3[3] = &unk_1E5CB8238;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  [v1 registerObserver:v2 handler:v3];
  objc_destroyWeak(&v4);
}

uint64_t __69__MapsSuggestionsManager_loadStorageFromFile_callback_callbackQueue___block_invoke_189(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setMapType:(int)a3
{
  if (self->_mapType != a3)
  {
    self->_mapType = a3;
    -[MapsSuggestionsTracker setMapType:](self->_tracker, "setMapType:");
  }
}

void __59__MapsSuggestionsManager__updateAllSourcesOnceWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__MapsSuggestionsManager__updateAllSourcesOnceWithHandler___block_invoke_2;
  v3[3] = &unk_1E5CB84F0;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

- (char)oneShotTopSuggestionsForSink:(id)a3 transportType:(int)a4 count:(unint64_t)a5 queue:(id)a6 handler:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (!v14)
  {
    uint64_t v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v30 = 1024;
      *(_DWORD *)long long v31 = 816;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[MapsSuggestionsManager oneShotTopSuggestionsForSink:transportType:count:queue:handler:]";
      __int16 v32 = 2082;
      long long v33 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    goto LABEL_21;
  }
  if (!v12)
  {
    uint64_t v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v30 = 1024;
      *(_DWORD *)long long v31 = 817;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[MapsSuggestionsManager oneShotTopSuggestionsForSink:transportType:count:queue:handler:]";
      __int16 v32 = 2082;
      long long v33 = "nil == (sink)";
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a sink", buf, 0x26u);
    }
    goto LABEL_21;
  }
  if (!v13)
  {
    uint64_t v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v30 = 1024;
      *(_DWORD *)long long v31 = 818;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[MapsSuggestionsManager oneShotTopSuggestionsForSink:transportType:count:queue:handler:]";
      __int16 v32 = 2082;
      long long v33 = "nil == (queue)";
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a callback queue", buf, 0x26u);
    }
    goto LABEL_21;
  }
  if (!a5)
  {
    uint64_t v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v30 = 1024;
      *(_DWORD *)long long v31 = 819;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[MapsSuggestionsManager oneShotTopSuggestionsForSink:transportType:count:queue:handler:]";
      __int16 v32 = 2082;
      long long v33 = "0u == count";
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. A count of zero doesn't make sense", buf, 0x26u);
    }
LABEL_21:

    char v19 = 0;
    goto LABEL_22;
  }
  GEOFindOrCreateLog();
  int v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = [(MapsSuggestionsManager *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    id v29 = v16;
    __int16 v30 = 2080;
    *(void *)long long v31 = "oneShotTopSuggestionsForSink";
    _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  id v17 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "oneShotTopSuggestionsForSink", "", buf, 2u);
  }

  [(MapsSuggestionsManager *)self attachSink:v12];
  objc_initWeak((id *)buf, self);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __89__MapsSuggestionsManager_oneShotTopSuggestionsForSink_transportType_count_queue_handler___block_invoke;
  v22[3] = &unk_1E5CB86D0;
  objc_copyWeak(v26, (id *)buf);
  id v18 = v12;
  int v27 = a4;
  id v23 = v18;
  v26[1] = (id)a5;
  id v24 = v13;
  id v25 = v14;
  -[MapsSuggestionsManager _updateAllSourcesOnceWithHandler:]((uint64_t)self, v22);

  objc_destroyWeak(v26);
  objc_destroyWeak((id *)buf);
  char v19 = 1;
LABEL_22:

  return v19;
}

- (void)attachSink:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [v4 uniqueName];
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "attachSink:%@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    __int16 v7 = self->_sinks;
    storageQueue = self->_storageQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__MapsSuggestionsManager_attachSink___block_invoke;
    block[3] = &unk_1E5CB86F8;
    id v12 = v7;
    id v13 = v4;
    id v9 = v7;
    objc_copyWeak(&v14, (id *)buf);
    dispatch_async(storageQueue, block);
    objc_destroyWeak(&v14);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    __int16 v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v17 = 1024;
      int v18 = 603;
      __int16 v19 = 2082;
      uint64_t v20 = "-[MapsSuggestionsManager attachSink:]";
      __int16 v21 = 2082;
      uint64_t v22 = "nil == (sink)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a sink to attach to.", buf, 0x26u);
    }
  }
}

void __111__MapsSuggestionsManager_initWithStrategy_locationUpdater_network_flightUpdater_ETARequirements_virtualGarage___block_invoke_138(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsManager _updateAllSourcesOnceWithHandler:]((uint64_t)WeakRetained, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsManager.mm";
      __int16 v6 = 1026;
      int v7 = 164;
      __int16 v8 = 2082;
      id v9 = "-[MapsSuggestionsManager initWithStrategy:locationUpdater:network:flightUpdater:ETARequirements:virtualGarage:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)_updateAllSourcesOnceWithHandler:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(id *)(a1 + 8);
    objc_initWeak(&location, (id)a1);
    id v5 = *(NSObject **)(a1 + 16);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__MapsSuggestionsManager__updateAllSourcesOnceWithHandler___block_invoke;
    v7[3] = &unk_1E5CB8518;
    id v8 = v4;
    id v6 = v4;
    objc_copyWeak(&v10, &location);
    id v9 = v3;
    dispatch_async(v5, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (char)oneShotTopSuggestionsForSink:(id)a3 count:(unint64_t)a4 transportType:(int)a5 callback:(id)a6 onQueue:(id)a7
{
  return [(MapsSuggestionsManager *)self oneShotTopSuggestionsForSink:a3 transportType:*(void *)&a5 count:a4 queue:a7 handler:a6];
}

- (char)topSuggestionsForSink:(id)a3 transportType:(int)a4 count:(unint64_t)a5 queue:(id)a6 handler:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = (void (**)(id, void, void *))a7;
  if (!v14)
  {
    uint64_t v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v35 = 1024;
      *(_DWORD *)__int16 v36 = 737;
      *(_WORD *)&v36[4] = 2082;
      *(void *)&v36[6] = "-[MapsSuggestionsManager topSuggestionsForSink:transportType:count:queue:handler:]";
      __int16 v37 = 2082;
      uint64_t v38 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    goto LABEL_27;
  }
  if (!v12)
  {
    uint64_t v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v35 = 1024;
      *(_DWORD *)__int16 v36 = 738;
      *(_WORD *)&v36[4] = 2082;
      *(void *)&v36[6] = "-[MapsSuggestionsManager topSuggestionsForSink:transportType:count:queue:handler:]";
      __int16 v37 = 2082;
      uint64_t v38 = "nil == (sink)";
      _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a sink", buf, 0x26u);
    }
    goto LABEL_27;
  }
  if (!v13)
  {
    uint64_t v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v35 = 1024;
      *(_DWORD *)__int16 v36 = 739;
      *(_WORD *)&v36[4] = 2082;
      *(void *)&v36[6] = "-[MapsSuggestionsManager topSuggestionsForSink:transportType:count:queue:handler:]";
      __int16 v37 = 2082;
      uint64_t v38 = "nil == (queue)";
      _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a callback queue", buf, 0x26u);
    }
    goto LABEL_27;
  }
  if (!a5)
  {
    uint64_t v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v35 = 1024;
      *(_DWORD *)__int16 v36 = 740;
      *(_WORD *)&v36[4] = 2082;
      *(void *)&v36[6] = "-[MapsSuggestionsManager topSuggestionsForSink:transportType:count:queue:handler:]";
      __int16 v37 = 2082;
      uint64_t v38 = "0u == count";
      _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. A count of zero doesn't make sense", buf, 0x26u);
    }
    goto LABEL_27;
  }
  self->_defaultTansportType = a4;
  GEOFindOrCreateLog();
  int v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = [(MapsSuggestionsManager *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = v16;
    __int16 v35 = 2080;
    *(void *)__int16 v36 = "topSuggestionsForSink";
    _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  __int16 v17 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsForSink", "", buf, 2u);
  }

  if (!self->_strategy)
  {
    uint64_t v23 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"Cannot do anything without a Strategy."];
    v14[2](v14, 0, v23);

    GEOFindOrCreateLog();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      id v25 = [(MapsSuggestionsManager *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      uint64_t v34 = v25;
      __int16 v35 = 2080;
      *(void *)__int16 v36 = "topSuggestionsForSink";
      _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
    }
    uint64_t v22 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsForSink", "", buf, 2u);
    }
LABEL_27:

    char v21 = 0;
    goto LABEL_28;
  }
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a5];
  objc_initWeak((id *)buf, self);
  storageQueue = self->_storageQueue;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __82__MapsSuggestionsManager_topSuggestionsForSink_transportType_count_queue_handler___block_invoke;
  v27[3] = &unk_1E5CB8680;
  objc_copyWeak(v32, (id *)buf);
  id v28 = v18;
  id v29 = v12;
  v32[1] = (id)a5;
  id v30 = v13;
  long long v31 = v14;
  id v20 = v18;
  dispatch_async(storageQueue, v27);

  objc_destroyWeak(v32);
  objc_destroyWeak((id *)buf);
  char v21 = 1;
LABEL_28:

  return v21;
}

- (char)topSuggestionsForSink:(id)a3 count:(unint64_t)a4 transportType:(int)a5 callback:(id)a6 onQueue:(id)a7
{
  return [(MapsSuggestionsManager *)self topSuggestionsForSink:a3 transportType:*(void *)&a5 count:a4 queue:a7 handler:a6];
}

void __44__MapsSuggestionsManager_hintRefreshOfType___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained[8] canProduceEntriesOfType:*(void *)(a1 + 40)]) {
      -[MapsSuggestionsManager _updateSource:forType:repeat:handler:]((dispatch_queue_t *)v3, v3[8], *(void **)(a1 + 40), 0, 0);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsManager.mm";
      __int16 v7 = 1026;
      int v8 = 563;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsManager hintRefreshOfType:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void __59__MapsSuggestionsManager__updateAllSourcesOnceWithHandler___block_invoke_2(uint64_t a1)
{
  *(void *)&v15[13] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = [WeakRetained uniqueName];
      *(_DWORD *)buf = 138412546;
      id v13 = v5;
      __int16 v14 = 2080;
      *(void *)int v15 = "_updateAllSourcesOnce";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    id v6 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_updateAllSourcesOnce", "", buf, 2u);
    }

    __int16 v7 = (void *)WeakRetained[8];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    id v9[2] = __59__MapsSuggestionsManager__updateAllSourcesOnceWithHandler___block_invoke_142;
    v9[3] = &unk_1E5CB84F0;
    objc_copyWeak(&v11, v2);
    id v10 = *(id *)(a1 + 32);
    -[MapsSuggestionsManager _updateSource:forType:repeat:handler:]((dispatch_queue_t *)WeakRetained, v7, 0, 0, v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    GEOFindOrCreateLog();
    int v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v13 = "MapsSuggestionsManager.mm";
      __int16 v14 = 1026;
      *(_DWORD *)int v15 = 301;
      v15[2] = 2082;
      *(void *)&v15[3] = "-[MapsSuggestionsManager _updateAllSourcesOnceWithHandler:]_block_invoke_2";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)_updateSource:(void *)a3 forType:(int)a4 repeat:(void *)a5 handler:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a5;
  dispatch_assert_queue_V2(a1[1]);
  id v11 = NSStringFromMapsSuggestionsEntryType((unint64_t)a3);
  GEOFindOrCreateLog();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [v9 uniqueName];
    __int16 v14 = NSStringFromMapsSuggestionsCurrentBestLocation();
    *(_DWORD *)buf = 138412802;
    uint64_t v23 = v13;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    int v27 = v14;
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);
  }
  [v9 updateSuggestionEntriesOfType:a3 handler:v10];
  if (a4)
  {
    double v16 = v15;
    if (v15 > 0.0)
    {
      objc_initWeak((id *)buf, a1);
      dispatch_time_t v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
      int v18 = a1[1];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__MapsSuggestionsManager__updateSource_forType_repeat_handler___block_invoke;
      block[3] = &unk_1E5CB7E50;
      objc_copyWeak(v21, (id *)buf);
      id v20 = v9;
      v21[1] = a3;
      dispatch_after(v17, v18, block);

      objc_destroyWeak(v21);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_addOrUpdateSuggestionEntries:(void *)a3 source:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v35 = a3;
  if (![v35 length])
  {
    __int16 v24 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_70;
    }
    *(_DWORD *)buf = 136446978;
    unint64_t v41 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
    __int16 v42 = 1024;
    *(_DWORD *)id v43 = 1056;
    *(_WORD *)&v43[4] = 2082;
    *(void *)&v43[6] = "-[MapsSuggestionsManager _addOrUpdateSuggestionEntries:source:]";
    *(_WORD *)&v43[14] = 2082;
    *(void *)&v43[16] = "0u == sourceName.length";
    id v25 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source name.";
LABEL_69:
    _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_ERROR, v25, buf, 0x26u);
    goto LABEL_70;
  }
  if (!v4)
  {
    __int16 v24 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_70;
    }
    *(_DWORD *)buf = 136446978;
    unint64_t v41 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
    __int16 v42 = 1024;
    *(_DWORD *)id v43 = 1057;
    *(_WORD *)&v43[4] = 2082;
    *(void *)&v43[6] = "-[MapsSuggestionsManager _addOrUpdateSuggestionEntries:source:]";
    *(_WORD *)&v43[14] = 2082;
    *(void *)&v43[16] = "nil == (entries)";
    id v25 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a list of entries.";
    goto LABEL_69;
  }
  if (![v4 count])
  {
    __int16 v24 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_70;
    }
    *(_DWORD *)buf = 136446978;
    unint64_t v41 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
    __int16 v42 = 1024;
    *(_DWORD *)id v43 = 1058;
    *(_WORD *)&v43[4] = 2082;
    *(void *)&v43[6] = "-[MapsSuggestionsManager _addOrUpdateSuggestionEntries:source:]";
    *(_WORD *)&v43[14] = 2082;
    *(void *)&v43[16] = "0 == entries.count";
    id v25 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires at least one entry";
    goto LABEL_69;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  int v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v41 = (const char *)v35;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Adding/Updating for %@", buf, 0xCu);
  }

  id v6 = [*(id *)(a1 + 72) objectForKey:v35];
  if (!v6)
  {
    id v6 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:");
  }
  uint64_t v34 = v6;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v33 = *(void *)v37;
    id v30 = v4;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
        GEOFindOrCreateLog();
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          }
          int v12 = s_verbose;
          if (s_verbose)
          {
            id v6 = [v10 serializedBase64String];
            id v13 = v6;
          }
          else
          {
            id v13 = &stru_1EFC640F8;
          }
          *(_DWORD *)buf = 138413058;
          unint64_t v41 = (const char *)v35;
          __int16 v42 = 2048;
          *(void *)id v43 = v10;
          *(_WORD *)&v43[8] = 2112;
          *(void *)&v43[10] = v13;
          *(_WORD *)&v43[18] = 2112;
          *(void *)&v43[20] = v10;
          _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} NEW INJECT from SOURCE{%@} {%p:%@}:\n%@", buf, 0x2Au);
          if (v12) {
        }
          }
        [v10 setOriginatingSourceName:v35];
        if ([v10 deleted])
        {
          [v34 addObject:v10];
          GEOFindOrCreateLog();
          ++v8;
          __int16 v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_60;
          }
          double v15 = [(id)a1 uniqueName];
          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          }
          int v16 = s_verbose;
          if (s_verbose)
          {
            id v29 = [v10 serializedBase64String];
            dispatch_time_t v17 = v29;
          }
          else
          {
            dispatch_time_t v17 = &stru_1EFC640F8;
          }
          *(_DWORD *)buf = 136316162;
          unint64_t v41 = "ADDDEL";
          __int16 v42 = 2112;
          *(void *)id v43 = v15;
          *(_WORD *)&v43[8] = 2048;
          *(void *)&v43[10] = v10;
          *(_WORD *)&v43[18] = 2112;
          *(void *)&v43[20] = v17;
          __int16 v44 = 2112;
          id v45 = v10;
          _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} %s by OBJECT{%@} {%p:%@}:\n%@", buf, 0x34u);
          if (v16) {
        }
          }
        else if ([v34 containsObject:v10])
        {
          GEOFindOrCreateLog();
          __int16 v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_60;
          }
          double v15 = [(id)a1 uniqueName];
          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          }
          int v18 = s_verbose;
          if (s_verbose)
          {
            uint64_t v28 = [v10 serializedBase64String];
            __int16 v19 = v28;
          }
          else
          {
            __int16 v19 = &stru_1EFC640F8;
          }
          *(_DWORD *)buf = 136316162;
          unint64_t v41 = "SKIPPED";
          __int16 v42 = 2112;
          *(void *)id v43 = v15;
          *(_WORD *)&v43[8] = 2048;
          *(void *)&v43[10] = v10;
          *(_WORD *)&v43[18] = 2112;
          *(void *)&v43[20] = v19;
          __int16 v44 = 2112;
          id v45 = v10;
          _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} %s by OBJECT{%@} {%p:%@}:\n%@", buf, 0x34u);
          if (v18) {
        }
          }
        else if ([*(id *)(a1 + 24) preFiltersKept:v10])
        {
          [v34 addObject:v10];
          GEOFindOrCreateLog();
          ++v8;
          __int16 v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_60;
          }
          double v15 = [(id)a1 uniqueName];
          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          }
          int v20 = s_verbose;
          if (s_verbose)
          {
            __int16 v26 = [v10 serializedBase64String];
            char v21 = v26;
          }
          else
          {
            char v21 = &stru_1EFC640F8;
          }
          *(_DWORD *)buf = 136316162;
          unint64_t v41 = "ADDED";
          __int16 v42 = 2112;
          *(void *)id v43 = v15;
          *(_WORD *)&v43[8] = 2048;
          *(void *)&v43[10] = v10;
          *(_WORD *)&v43[18] = 2112;
          *(void *)&v43[20] = v21;
          __int16 v44 = 2112;
          id v45 = v10;
          _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} %s by OBJECT{%@} {%p:%@}:\n%@", buf, 0x34u);
          if (v20) {
        }
          }
        else
        {
          GEOFindOrCreateLog();
          __int16 v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_60;
          }
          double v15 = [*(id *)(a1 + 24) uniqueName];
          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          }
          int v22 = s_verbose;
          if (s_verbose)
          {
            int v27 = [v10 serializedBase64String];
            uint64_t v23 = v27;
          }
          else
          {
            uint64_t v23 = &stru_1EFC640F8;
          }
          *(_DWORD *)buf = 136316162;
          unint64_t v41 = "UNKEPT";
          __int16 v42 = 2112;
          *(void *)id v43 = v15;
          *(_WORD *)&v43[8] = 2048;
          *(void *)&v43[10] = v10;
          *(_WORD *)&v43[18] = 2112;
          *(void *)&v43[20] = v23;
          __int16 v44 = 2112;
          id v45 = v10;
          _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} %s by OBJECT{%@} {%p:%@}:\n%@", buf, 0x34u);
          if (v22) {
        }
          }
        id v4 = v30;
LABEL_60:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v7);
  }

  __int16 v24 = v34;
  -[MapsSuggestionsManager _updateResult](a1);
LABEL_70:
}

- (void)removeEntry:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  if (!v4)
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      char v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v22 = 1024;
      int v23 = 1161;
      __int16 v24 = 2082;
      id v25 = "-[MapsSuggestionsManager removeEntry:]";
      __int16 v26 = 2082;
      int v27 = "nil == (entry)";
      int v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry";
      id v13 = v11;
      uint32_t v14 = 38;
LABEL_21:
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    }
LABEL_22:

    goto LABEL_23;
  }
  int v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    char v21 = v4;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "REMOVE %@", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageQueue);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->_storage;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v7)
  {

    goto LABEL_19;
  }
  char v8 = 0;
  uint64_t v9 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      if (v8) {
        char v8 = 1;
      }
      else {
        char v8 = -[MapsSuggestionsManager _removeEntry:sourceName:]((uint64_t)self, v4, *(void **)(*((void *)&v15 + 1) + 8 * i));
      }
    }
    uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v7);

  if ((v8 & 1) == 0)
  {
LABEL_19:
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      char v21 = v4;
      int v12 = "Could not find entry %@";
      id v13 = v11;
      uint32_t v14 = 12;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
LABEL_23:
}

- (uint64_t)_removeEntry:(void *)a3 sourceName:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!a1) {
    goto LABEL_13;
  }
  if (!v5)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      id v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v14 = 1024;
      int v15 = 1178;
      __int16 v16 = 2082;
      long long v17 = "-[MapsSuggestionsManager _removeEntry:sourceName:]";
      __int16 v18 = 2082;
      __int16 v19 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", (uint8_t *)&v12, 0x26u);
    }
    goto LABEL_12;
  }
  if (![v6 length])
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      id v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v14 = 1024;
      int v15 = 1179;
      __int16 v16 = 2082;
      long long v17 = "-[MapsSuggestionsManager _removeEntry:sourceName:]";
      __int16 v18 = 2082;
      __int16 v19 = "0u == sourceName.length";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source name", (uint8_t *)&v12, 0x26u);
    }
LABEL_12:

    a1 = 0;
    goto LABEL_13;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  char v8 = [*(id *)(a1 + 72) objectForKeyedSubscript:v7];
  uint64_t v9 = [v8 indexOfObjectIdenticalTo:v5];
  a1 = v9 != 0x7FFFFFFFFFFFFFFFLL;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
    [v8 removeObjectAtIndex:v9];
  }

LABEL_13:
  return a1;
}

- (void)addAdditionalFilter:(id)a3 forSink:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = v7;
  if (!v6)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)locatiouint64_t n = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v16 = 1024;
      int v17 = 860;
      __int16 v18 = 2082;
      __int16 v19 = "-[MapsSuggestionsManager addAdditionalFilter:forSink:]";
      __int16 v20 = 2082;
      char v21 = "nil == (filter)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires filter", location, 0x26u);
    }
    goto LABEL_9;
  }
  if (![v7 length])
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)locatiouint64_t n = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v16 = 1024;
      int v17 = 861;
      __int16 v18 = 2082;
      __int16 v19 = "-[MapsSuggestionsManager addAdditionalFilter:forSink:]";
      __int16 v20 = 2082;
      char v21 = "0u == sinkName.length";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sinkName", location, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  objc_initWeak((id *)location, self);
  storageQueue = self->_storageQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MapsSuggestionsManager_addAdditionalFilter_forSink___block_invoke;
  block[3] = &unk_1E5CB86F8;
  objc_copyWeak(&v14, (id *)location);
  id v12 = v8;
  id v13 = v6;
  dispatch_async(storageQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)location);
LABEL_10:
}

void __54__MapsSuggestionsManager_addAdditionalFilter_forSink___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained[4] objectForKeyedSubscript:*(void *)(a1 + 32)];
    if (!v4)
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
      objc_msgSend(v3[4], "setObject:forKeyedSubscript:");
    }
    [v4 addObject:*(void *)(a1 + 40)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsManager.mm";
      __int16 v8 = 1026;
      int v9 = 866;
      __int16 v10 = 2082;
      id v11 = "-[MapsSuggestionsManager addAdditionalFilter:forSink:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void __44__MapsSuggestionsManager_didUpdateLocation___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsManager _updateCurrentLocation:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      int v6 = "MapsSuggestionsManager.mm";
      __int16 v7 = 1026;
      int v8 = 1352;
      __int16 v9 = 2082;
      __int16 v10 = "-[MapsSuggestionsManager didUpdateLocation:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void __37__MapsSuggestionsManager_attachSink___block_invoke_158(uint64_t a1)
{
  *(void *)&v17[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[1]);
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Starting location updater", (uint8_t *)&v14, 2u);
    }

    id v4 = objc_loadWeakRetained((id *)(v2 + 144));
    int v5 = [v4 startLocationUpdatesForDelegate:v2];

    if (MapsSuggestionsIsInCoarseLocation()) {
      [(id)v2 didLoseLocationPermission];
    }
    -[MapsSuggestionsManager _updateCurrentLocation:](v2, v5);

    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 8));
    int v6 = *(unsigned __int8 *)(v2 + 128);
    __int16 v7 = GEOFindOrCreateLog();
    int v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Sources already started. No need to start again", (uint8_t *)&v14, 2u);
      }
    }
    else
    {
      __int16 v9 = v7;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        __int16 v10 = [(id)v2 uniqueName];
        int v14 = 138412546;
        int v15 = v10;
        __int16 v16 = 2080;
        *(void *)int v17 = "Start Sources";
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v14, 0x16u);
      }
      uint64_t v11 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v11))
      {
        LOWORD(v14) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Start Sources", "", (uint8_t *)&v14, 2u);
      }

      -[MapsSuggestionsManager _startSource:](v2, *(void **)(v2 + 64));
      *(unsigned char *)(v2 + 128) = 1;
      GEOFindOrCreateLog();
      uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v13 = [(id)v2 uniqueName];
        int v14 = 138412546;
        int v15 = v13;
        __int16 v16 = 2080;
        *(void *)int v17 = "Start Sources";
        _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v14, 0x16u);
      }
      int v8 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v8))
      {
        LOWORD(v14) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Start Sources", "", (uint8_t *)&v14, 2u);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446722;
      int v15 = "MapsSuggestionsManager.mm";
      __int16 v16 = 1026;
      *(_DWORD *)int v17 = 619;
      v17[2] = 2082;
      *(void *)&v17[3] = "-[MapsSuggestionsManager attachSink:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: gatheringStrongSelf went away in %{public}s", (uint8_t *)&v14, 0x1Cu);
    }
  }
}

- (void)_updateCurrentLocation:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138412290;
      id v17 = v3;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "LOCATION UPDATE %@", (uint8_t *)&v16, 0xCu);
    }
  }
  if (v3)
  {
    MapsSuggestionsSetMostRecentLocation(v3);
    IsUsableLocatiouint64_t n = MapsSuggestionsTrackerIsUsableLocation(*(void **)(a1 + 120));
    [v3 distanceFromLocation:*(void *)(a1 + 120)];
    double v7 = v6;
    uint64_t v8 = MapsSuggestionsCurrentBestLocation();
    __int16 v9 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = v8;

    __int16 v10 = *(void **)(a1 + 40);
    uint64_t v11 = MapsSuggestionsCurrentBestLocation();
    [v10 setLocation:v11];

    if ([*(id *)(a1 + 56) count])
    {
      if ((IsUsableLocation & 1) == 0 && MapsSuggestionsTrackerIsUsableLocation(v3))
      {
        uint64_t v12 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v16) = 0;
          id v13 = "_updateAllSourcesOnce schedule (usability)";
LABEL_16:
          _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v16, 2u);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
      GEOConfigGetDouble();
      if (v7 > v14)
      {
        uint64_t v12 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v16) = 0;
          id v13 = "_updateAllSourcesOnce schedule (distance)";
          goto LABEL_16;
        }
LABEL_17:

        [*(id *)(a1 + 112) kickCanBySameTime];
      }
    }
    else
    {
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      }
      if (s_verbose)
      {
        int v15 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "No Sinks are watching.", (uint8_t *)&v16, 2u);
        }
      }
    }
  }
}

- (void)setAutomobileOptions:(id)a3
{
  int v5 = (GEOAutomobileOptions *)a3;
  if (self->_automobileOptions != v5)
  {
    objc_storeStrong((id *)&self->_automobileOptions, a3);
    [(MapsSuggestionsTracker *)self->_tracker setAutomobileOptions:v5];
  }
}

void __53__MapsSuggestionsManager_saveStorageToFile_callback___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    BOOL v3 = +[MapsSuggestionsCache saveToFilePath:*(void *)(a1 + 32) storage:WeakRetained[9] ETAValidUntilDate:WeakRetained[6]];
    if (!v3)
    {
      id v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = *(char **)(a1 + 32);
        int v8 = 138412290;
        __int16 v9 = v5;
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "Failed to write to %@.", (uint8_t *)&v8, 0xCu);
      }
    }
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    double v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      __int16 v9 = "MapsSuggestionsManager.mm";
      __int16 v10 = 1026;
      int v11 = 957;
      __int16 v12 = 2082;
      id v13 = "-[MapsSuggestionsManager saveStorageToFile:callback:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (char)saveStorageToFile:(id)a3 callback:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "saveStorageToFile:%@", buf, 0xCu);
  }

  if ([v6 length])
  {
    objc_initWeak((id *)buf, self);
    storageQueue = self->_storageQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MapsSuggestionsManager_saveStorageToFile_callback___block_invoke;
    block[3] = &unk_1E5CB8720;
    objc_copyWeak(&v14, (id *)buf);
    id v12 = v6;
    id v13 = v7;
    dispatch_async(storageQueue, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }

  return v7 != 0;
}

void __69__MapsSuggestionsManager_loadStorageFromFile_callback_callbackQueue___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    char v4 = -[MapsSuggestionsManager _loadStorageFromFile:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__MapsSuggestionsManager_loadStorageFromFile_callback_callbackQueue___block_invoke_189;
    v7[3] = &unk_1E5CB8770;
    int v5 = *(NSObject **)(a1 + 40);
    int v8 = *(id *)(a1 + 48);
    char v9 = v4;
    dispatch_async(v5, v7);
    id v6 = v8;
  }
  else
  {
    GEOFindOrCreateLog();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v11 = "MapsSuggestionsManager.mm";
      __int16 v12 = 1026;
      int v13 = 997;
      __int16 v14 = 2082;
      int v15 = "-[MapsSuggestionsManager loadStorageFromFile:callback:callbackQueue:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (uint64_t)_loadStorageFromFile:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a2;
  char v4 = v3;
  if (a1)
  {
    if ([v3 length])
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
      int v5 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v6 = [v5 fileExistsAtPath:v4];

      if (v6)
      {
        if ([*(id *)(a1 + 72) count])
        {
          id v7 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Already loaded from Storage. Aborting this load", buf, 2u);
          }

          goto LABEL_15;
        }
        __int16 v12 = (void *)MEMORY[0x1AD0C8E80]([*(id *)(a1 + 24) clearData]);
        id v21 = 0;
        id v22 = 0;
        BOOL v13 = +[MapsSuggestionsCache loadFromFilePath:v4 storage:&v22 ETAValidUntilDate:&v21];
        id v14 = v22;
        id v15 = v21;
        uint64_t v16 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = v14;
        id v17 = v14;

        uint64_t v18 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = v15;

        if (v13)
        {
LABEL_15:
          -[MapsSuggestionsManager _updateResult](a1);
          a1 = 1;
          goto LABEL_16;
        }
        id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        int v8 = *(NSObject **)(a1 + 72);
        *(void *)(a1 + 72) = v20;
        goto LABEL_13;
      }
      int v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v24 = v4;
        char v9 = "File does not exist: %@";
        __int16 v10 = v8;
        uint32_t v11 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      int v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
        __int16 v25 = 1024;
        int v26 = 1009;
        __int16 v27 = 2082;
        uint64_t v28 = "-[MapsSuggestionsManager _loadStorageFromFile:]";
        __int16 v29 = 2082;
        id v30 = "0u == path.length";
        char v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Needs a file path";
        __int16 v10 = v8;
        uint32_t v11 = 38;
LABEL_12:
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
      }
    }
LABEL_13:

    a1 = 0;
  }
LABEL_16:

  return a1;
}

- (char)loadStorageFromFile:(id)a3 callback:(id)a4 callbackQueue:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v8 = (char *)a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v23 = 1024;
      int v24 = 990;
      __int16 v25 = 2082;
      int v26 = "-[MapsSuggestionsManager loadStorageFromFile:callback:callbackQueue:]";
      __int16 v27 = 2082;
      uint64_t v28 = "nil == (callback)";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a callback block", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v10)
  {
    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v23 = 1024;
      int v24 = 991;
      __int16 v25 = 2082;
      int v26 = "-[MapsSuggestionsManager loadStorageFromFile:callback:callbackQueue:]";
      __int16 v27 = 2082;
      uint64_t v28 = "NULL == callbackQueue";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a callback queue", buf, 0x26u);
    }
LABEL_11:

    char v13 = 0;
    goto LABEL_12;
  }
  uint32_t v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v8;
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "loadStorageFromFile:%@ async", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  storageQueue = self->_storageQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__MapsSuggestionsManager_loadStorageFromFile_callback_callbackQueue___block_invoke;
  v16[3] = &unk_1E5CB8798;
  objc_copyWeak(&v20, (id *)buf);
  id v17 = v8;
  id v18 = v10;
  id v19 = v9;
  dispatch_async(storageQueue, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
  char v13 = 1;
LABEL_12:

  return v13;
}

- (void)hintRefreshOfType:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  int v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    char v6 = NSStringFromMapsSuggestionsEntryType(a3);
    *(_DWORD *)buf = 138412290;
    uint32_t v11 = v6;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "hintRefreshOfType:%@", buf, 0xCu);
  }
  if (a3)
  {
    objc_initWeak((id *)buf, self);
    gatheringQueue = self->_gatheringQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__MapsSuggestionsManager_hintRefreshOfType___block_invoke;
    v8[3] = &unk_1E5CB8590;
    objc_copyWeak(v9, (id *)buf);
    v9[1] = (id)a3;
    dispatch_async(gatheringQueue, v8);
    objc_destroyWeak(v9);
    objc_destroyWeak((id *)buf);
  }
}

void __89__MapsSuggestionsManager_oneShotTopSuggestionsForSink_transportType_count_queue_handler___block_invoke_175(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) detachSink:*(void *)(a1 + 40)];
  GEOFindOrCreateLog();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = [*(id *)(a1 + 32) uniqueName];
    int v10 = 138412546;
    uint32_t v11 = v8;
    __int16 v12 = 2080;
    char v13 = "oneShotTopSuggestionsForSink";
    _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v10, 0x16u);
  }
  id v9 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v9))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "oneShotTopSuggestionsForSink", "", (uint8_t *)&v10, 2u);
  }
}

void __89__MapsSuggestionsManager_oneShotTopSuggestionsForSink_transportType_count_queue_handler___block_invoke(uint64_t a1)
{
  *(void *)&v19[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 72);
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__MapsSuggestionsManager_oneShotTopSuggestionsForSink_transportType_count_queue_handler___block_invoke_175;
    v13[3] = &unk_1E5CB86A8;
    id v15 = *(id *)(a1 + 48);
    v13[4] = WeakRetained;
    id v14 = *(id *)(a1 + 32);
    if (![WeakRetained topSuggestionsForSink:v5 transportType:v3 count:v4 queue:v6 handler:v13])
    {
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"topSuggestionsForSink failed with ContractForbids"];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, MEMORY[0x1E4F1CBF0], v8);

      [WeakRetained detachSink:*(void *)(a1 + 32)];
      GEOFindOrCreateLog();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v10 = [WeakRetained uniqueName];
        *(_DWORD *)buf = 138412546;
        id v17 = v10;
        __int16 v18 = 2080;
        *(void *)id v19 = "oneShotTopSuggestionsForSink";
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      uint32_t v11 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "oneShotTopSuggestionsForSink", "", buf, 2u);
      }
    }
    __int16 v12 = v15;
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v17 = "MapsSuggestionsManager.mm";
      __int16 v18 = 1026;
      *(_DWORD *)id v19 = 828;
      v19[2] = 2082;
      *(void *)&v19[3] = "-[MapsSuggestionsManager oneShotTopSuggestionsForSink:transportType:count:queue:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __37__MapsSuggestionsManager_detachSink___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [*(id *)(a1 + 32) uniqueName];
    *(_DWORD *)buf = 138412290;
    __int16 v12 = v5;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Removed Sink: '%@'", buf, 0xCu);
  }
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v6 = (uint64_t *)(a1 + 40);
    [*(id *)(v7 + 40) unschedule];
    uint64_t v8 = *v6;
    id v9 = *(NSObject **)(*v6 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__MapsSuggestionsManager_detachSink___block_invoke_160;
    block[3] = &unk_1E5CB85E0;
    void block[4] = v8;
    dispatch_async(v9, block);
  }
}

void __37__MapsSuggestionsManager_detachSink___block_invoke_160(uint64_t a1)
{
  -[MapsSuggestionsManager _stopAllSources](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Stopping location updater", v5, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 144));
    [WeakRetained stopLocationUpdatesForDelegate:v2];
  }
}

void __37__MapsSuggestionsManager_detachSink___block_invoke(void *a1)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v2 = (void *)a1[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__MapsSuggestionsManager_detachSink___block_invoke_2;
  v6[3] = &unk_1E5CB8608;
  id v4 = v2;
  uint64_t v5 = a1[6];
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 unregisterObserver:v4 handler:v6];
}

- (void)detachSink:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [v4 uniqueName];
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "detachSink:%@", buf, 0xCu);
    }
    id v7 = self->_sinks;
    storageQueue = self->_storageQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__MapsSuggestionsManager_detachSink___block_invoke;
    block[3] = &unk_1E5CB8630;
    uint32_t v11 = v7;
    id v12 = v4;
    uint64_t v13 = self;
    id v9 = v7;
    dispatch_async(storageQueue, block);
  }
  else
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v16 = 1024;
      int v17 = 630;
      __int16 v18 = 2082;
      id v19 = "-[MapsSuggestionsManager detachSink:]";
      __int16 v20 = 2082;
      id v21 = "nil == (sink)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a sink to detach from.", buf, 0x26u);
    }
  }
}

- (void)_stopAllSources
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    GEOFindOrCreateLog();
    uint64_t v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = [(id)a1 uniqueName];
      int v10 = 138412546;
      uint32_t v11 = v3;
      __int16 v12 = 2080;
      uint64_t v13 = "Stop Sources";
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v10, 0x16u);
    }
    id v4 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v4))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Stop Sources", "", (uint8_t *)&v10, 2u);
    }

    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [*(id *)(a1 + 64) uniqueName];
      int v10 = 138412290;
      uint32_t v11 = v6;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Stopping SOURCE{%@}", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 64) stop];
    *(unsigned char *)(a1 + 128) = 0;
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [(id)a1 uniqueName];
      int v10 = 138412546;
      uint32_t v11 = v8;
      __int16 v12 = 2080;
      uint64_t v13 = "Stop Sources";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v10, 0x16u);
    }
    id v9 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Stop Sources", "", (uint8_t *)&v10, 2u);
    }
  }
}

void __111__MapsSuggestionsManager_initWithStrategy_locationUpdater_network_flightUpdater_ETARequirements_virtualGarage___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsManager _sendInvalidateToAllSinks]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      uint64_t v5 = "MapsSuggestionsManager.mm";
      __int16 v6 = 1026;
      int v7 = 151;
      __int16 v8 = 2082;
      id v9 = "-[MapsSuggestionsManager initWithStrategy:locationUpdater:network:flightUpdater:ETARequirements:virtualGarage:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void __111__MapsSuggestionsManager_initWithStrategy_locationUpdater_network_flightUpdater_ETARequirements_virtualGarage___block_invoke_134(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsManager _wipeStaleETAs]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      uint64_t v5 = "MapsSuggestionsManager.mm";
      __int16 v6 = 1026;
      int v7 = 157;
      __int16 v8 = 2082;
      id v9 = "-[MapsSuggestionsManager initWithStrategy:locationUpdater:network:flightUpdater:ETARequirements:virtualGarage:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)dealloc
{
  [(MapsSuggestionsCanKicker *)self->_expiredEntryInvalidator cancel];
  [(MapsSuggestionsCanKicker *)self->_wipeStaleETAWiper cancel];
  [(MapsSuggestionsCanKicker *)self->_deferredSourcesUpdater cancel];
  -[MapsSuggestionsManager _stopAllSources]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsManager;
  [(MapsSuggestionsManager *)&v3 dealloc];
}

- (NSString)uniqueName
{
  uint64_t v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

void __63__MapsSuggestionsManager__updateSource_forType_repeat_handler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsManager _updateSource:forType:repeat:handler:](WeakRetained, *(void *)(a1 + 32), *(void *)(a1 + 48), 1, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    int v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      __int16 v6 = "MapsSuggestionsManager.mm";
      __int16 v7 = 1026;
      int v8 = 282;
      __int16 v9 = 2082;
      uint64_t v10 = "-[MapsSuggestionsManager _updateSource:forType:repeat:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)detachSource:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      __int16 v6 = [v4 uniqueName];
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "detachSource:%@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    gatheringQueue = self->_gatheringQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    id v9[2] = __39__MapsSuggestionsManager_detachSource___block_invoke;
    v9[3] = &unk_1E5CB85B8;
    objc_copyWeak(&v11, (id *)buf);
    id v10 = v4;
    dispatch_async(gatheringQueue, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    int v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v14 = 1024;
      int v15 = 587;
      __int16 v16 = 2082;
      int v17 = "-[MapsSuggestionsManager detachSource:]";
      __int16 v18 = 2082;
      id v19 = "nil == (source)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source to detach from.", buf, 0x26u);
    }
  }
}

void __39__MapsSuggestionsManager_detachSource___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    objc_super v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = [*(id *)(a1 + 32) uniqueName];
      int v6 = 138412290;
      __int16 v7 = v4;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Stopping SOURCE{%@} (because of detach)", (uint8_t *)&v6, 0xCu);
    }
    [WeakRetained[8] detachSource:*(void *)(a1 + 32)];
  }
  else
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      __int16 v7 = "MapsSuggestionsManager.mm";
      __int16 v8 = 1026;
      int v9 = 594;
      __int16 v10 = 2082;
      id v11 = "-[MapsSuggestionsManager detachSource:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void __40__MapsSuggestionsManager__wipeStaleETAs__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Wiping out a previous, stale ETA UPDATE", buf, 2u);
    }

    [*((id *)WeakRetained + 5) resetAllTitleFormatting];
    id v4 = MapsSuggestionsCurrentBestLocation();
    IsUsableLocatiouint64_t n = MapsSuggestionsTrackerIsUsableLocation(v4);
    int v6 = (void *)*((void *)WeakRetained + 5);
    if (IsUsableLocation)
    {
      [v6 setLocation:v4];
      [*((id *)WeakRetained + 5) rescheduleRefreshOnlyIfAlreadyRunning];
    }
    else
    {
      [v6 setLocation:0];
      __int16 v7 = *((void *)WeakRetained + 1);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__MapsSuggestionsManager__wipeStaleETAs__block_invoke_161;
      block[3] = &unk_1E5CB7E78;
      objc_copyWeak(&v9, v1);
      dispatch_async(v7, block);
      objc_destroyWeak(&v9);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v11 = "MapsSuggestionsManager.mm";
      __int16 v12 = 1026;
      int v13 = 694;
      __int16 v14 = 2082;
      int v15 = "-[MapsSuggestionsManager _wipeStaleETAs]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __40__MapsSuggestionsManager__wipeStaleETAs__block_invoke_161(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (id *)WeakRetained;
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      __int16 v7 = "MapsSuggestionsManager.mm";
      __int16 v8 = 1026;
      int v9 = 712;
      __int16 v10 = 2082;
      id v11 = "-[MapsSuggestionsManager _wipeStaleETAs]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

    goto LABEL_13;
  }
  dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
  if ([v2[7] count])
  {
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    }
    if (s_verbose)
    {
      objc_super v3 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v6) = 0;
        _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Restarting location updater", (uint8_t *)&v6, 2u);
      }
    }
    id v4 = objc_loadWeakRetained(v2 + 18);
    int v5 = [v4 restartLocationUpdatesForDelegate:v2];

    MapsSuggestionsSetMostRecentLocation(v5);
LABEL_13:
  }
}

- (char)topSuggestionsForSink:(id)a3 count:(unint64_t)a4 queue:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  LOBYTE(a4) = [(MapsSuggestionsManager *)self topSuggestionsForSink:v10 transportType:GEOTransportTypeFromUserPreference() count:a4 queue:v11 handler:v12];

  return a4;
}

- (char)oneShotTopSuggestionsForSink:(id)a3 count:(unint64_t)a4 queue:(id)a5 handler:(id)a6
{
  objc_initWeak(&location, a3);
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_loadWeakRetained(&location);
  LOBYTE(a4) = [(MapsSuggestionsManager *)self oneShotTopSuggestionsForSink:v12 transportType:GEOTransportTypeFromUserPreference() count:a4 queue:v10 handler:v11];

  objc_destroyWeak(&location);
  return a4;
}

- (void)removeAdditionalFilter:(id)a3 forSink:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = v7;
  if (!v6)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)locatiouint64_t n = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v16 = 1024;
      int v17 = 879;
      __int16 v18 = 2082;
      id v19 = "-[MapsSuggestionsManager removeAdditionalFilter:forSink:]";
      __int16 v20 = 2082;
      id v21 = "nil == (filter)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires filter", location, 0x26u);
    }
    goto LABEL_9;
  }
  if (![v7 length])
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)locatiouint64_t n = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v16 = 1024;
      int v17 = 880;
      __int16 v18 = 2082;
      id v19 = "-[MapsSuggestionsManager removeAdditionalFilter:forSink:]";
      __int16 v20 = 2082;
      id v21 = "0u == sinkName.length";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sinkName", location, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  objc_initWeak((id *)location, self);
  storageQueue = self->_storageQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MapsSuggestionsManager_removeAdditionalFilter_forSink___block_invoke;
  block[3] = &unk_1E5CB86F8;
  objc_copyWeak(&v14, (id *)location);
  id v12 = v8;
  id v13 = v6;
  dispatch_async(storageQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)location);
LABEL_10:
}

void __57__MapsSuggestionsManager_removeAdditionalFilter_forSink___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained[4] objectForKeyedSubscript:*(void *)(a1 + 32)];
    [v4 removeObject:*(void *)(a1 + 40)];
  }
  else
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsManager.mm";
      __int16 v8 = 1026;
      int v9 = 884;
      __int16 v10 = 2082;
      id v11 = "-[MapsSuggestionsManager removeAdditionalFilter:forSink:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (BOOL)loadStorageFromFile:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    int v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "loadStorageFromFile:%@ sync", buf, 0xCu);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    buf[24] = 1;
    storageQueue = self->_storageQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__MapsSuggestionsManager_loadStorageFromFile___block_invoke;
    block[3] = &unk_1E5CB8748;
    uint64_t v12 = buf;
    void block[4] = self;
    id v11 = v4;
    dispatch_sync(storageQueue, block);
    BOOL v7 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    __int16 v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 973;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsManager loadStorageFromFile:]";
      __int16 v14 = 2082;
      int v15 = "0u == path.length";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Needs a file path", buf, 0x26u);
    }

    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __46__MapsSuggestionsManager_loadStorageFromFile___block_invoke(uint64_t a1)
{
  uint64_t result = -[MapsSuggestionsManager _loadStorageFromFile:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_sq_deleteEntries:(void *)a3 source:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  id v22 = a3;
  if (![v22 length])
  {
    __int16 v18 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 136446978;
    uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
    __int16 v32 = 1024;
    *(_DWORD *)uint64_t v33 = 1220;
    *(_WORD *)&v33[4] = 2082;
    *(void *)&v33[6] = "-[MapsSuggestionsManager _sq_deleteEntries:source:]";
    *(_WORD *)&v33[14] = 2082;
    *(void *)&v33[16] = "0u == sourceName.length";
    id v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source name";
LABEL_32:
    _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0x26u);
    goto LABEL_38;
  }
  if (!v23)
  {
    __int16 v18 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 136446978;
    uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
    __int16 v32 = 1024;
    *(_DWORD *)uint64_t v33 = 1221;
    *(_WORD *)&v33[4] = 2082;
    *(void *)&v33[6] = "-[MapsSuggestionsManager _sq_deleteEntries:source:]";
    *(_WORD *)&v33[14] = 2082;
    *(void *)&v33[16] = "nil == (entries)";
    id v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a list of entries";
    goto LABEL_32;
  }
  dispatch_assert_queue_V2(a1[2]);
  GEOFindOrCreateLog();
  int v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [(dispatch_queue_t *)a1 uniqueName];
    *(_DWORD *)buf = 138412546;
    uint64_t v31 = v6;
    __int16 v32 = 2080;
    *(void *)uint64_t v33 = "deleteEntries";
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  BOOL v7 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "deleteEntries", "", buf, 2u);
  }

  if ([v23 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v23;
    uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v27;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
          GEOFindOrCreateLog();
          uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            id v13 = [(dispatch_queue_t *)a1 uniqueName];
            if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
              dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
            }
            int v14 = s_verbose;
            if (s_verbose)
            {
              objc_super v3 = [v11 serializedBase64String];
              int v15 = v3;
            }
            else
            {
              int v15 = &stru_1EFC640F8;
            }
            *(_DWORD *)buf = 138413058;
            uint64_t v31 = v13;
            __int16 v32 = 2048;
            *(void *)uint64_t v33 = v11;
            *(_WORD *)&v33[8] = 2112;
            *(void *)&v33[10] = v15;
            *(_WORD *)&v33[18] = 2112;
            *(void *)&v33[20] = v11;
            _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} DELETED by OBJECT{%@} {%p:%@}:\n%@", buf, 0x2Au);
            if (v14) {
          }
            }
          [v11 setDeleted:1];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v8);
    }

    -[MapsSuggestionsManager _addOrUpdateSuggestionEntries:source:]((uint64_t)a1, obj, v22);
    GEOFindOrCreateLog();
    uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v17 = [(dispatch_queue_t *)a1 uniqueName];
      *(_DWORD *)buf = 138412546;
      uint64_t v31 = v17;
      __int16 v32 = 2080;
      *(void *)uint64_t v33 = "deleteEntries";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    __int16 v18 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
LABEL_37:
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "deleteEntries", "", buf, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v21 = [(dispatch_queue_t *)a1 uniqueName];
      *(_DWORD *)buf = 138412546;
      uint64_t v31 = v21;
      __int16 v32 = 2080;
      *(void *)uint64_t v33 = "deleteEntries";
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    __int16 v18 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      goto LABEL_37;
    }
  }
LABEL_38:
}

- (void)removeEntry:(void *)a3 sourceName:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = v6;
  if (a1)
  {
    if (v5)
    {
      if ([v6 length])
      {
        objc_initWeak((id *)location, a1);
        uint64_t v8 = a1[2];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__MapsSuggestionsManager_removeEntry_sourceName___block_invoke;
        block[3] = &unk_1E5CB86F8;
        objc_copyWeak(&v13, (id *)location);
        id v11 = v5;
        id v12 = v7;
        dispatch_async(v8, block);

        objc_destroyWeak(&v13);
        objc_destroyWeak((id *)location);
        goto LABEL_11;
      }
      uint64_t v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)locatiouint64_t n = 136446978;
        *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
        __int16 v15 = 1024;
        int v16 = 1198;
        __int16 v17 = 2082;
        __int16 v18 = "-[MapsSuggestionsManager removeEntry:sourceName:]";
        __int16 v19 = 2082;
        __int16 v20 = "0u == sourceName.length";
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source name", location, 0x26u);
      }
    }
    else
    {
      uint64_t v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)locatiouint64_t n = 136446978;
        *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
        __int16 v15 = 1024;
        int v16 = 1197;
        __int16 v17 = 2082;
        __int16 v18 = "-[MapsSuggestionsManager removeEntry:sourceName:]";
        __int16 v19 = 2082;
        __int16 v20 = "nil == (entry)";
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", location, 0x26u);
      }
    }
  }
LABEL_11:
}

void __49__MapsSuggestionsManager_removeEntry_sourceName___block_invoke(void **a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsManager _removeEntry:sourceName:]((uint64_t)WeakRetained, a1[4], a1[5]);
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsManager.mm";
      __int16 v7 = 1026;
      int v8 = 1202;
      __int16 v9 = 2082;
      uint64_t v10 = "-[MapsSuggestionsManager removeEntry:sourceName:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void __48__MapsSuggestionsManager__deleteEntries_source___block_invoke(void **a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(a1 + 6);
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsManager _sq_deleteEntries:source:](WeakRetained, a1[4], a1[5]);
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsManager.mm";
      __int16 v7 = 1026;
      int v8 = 1212;
      __int16 v9 = 2082;
      uint64_t v10 = "-[MapsSuggestionsManager _deleteEntries:source:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)trackerRefreshedETAsUntil:(id)a3
{
  id v6 = a3;
  id v4 = (NSDate *)[v6 copy];
  etaValidUntil = self->_etaValidUntil;
  self->_etaValidUntil = v4;

  [(MapsSuggestionsCanKicker *)self->_wipeStaleETAWiper kickCanByTime:MapsSuggestionsSecondsTo(v6)];
}

- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = v9;
  if (!v8)
  {
    int v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v24 = 1024;
      *(_DWORD *)__int16 v25 = 1272;
      *(_WORD *)&v25[4] = 2082;
      *(void *)&v25[6] = "-[MapsSuggestionsManager removeEntry:behavior:handler:]";
      *(_WORD *)&v25[14] = 2082;
      *(void *)&v25[16] = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. entry cannot be nil", buf, 0x26u);
    }
    goto LABEL_15;
  }
  if (!v9)
  {
    int v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v24 = 1024;
      *(_DWORD *)__int16 v25 = 1273;
      *(_WORD *)&v25[4] = 2082;
      *(void *)&v25[6] = "-[MapsSuggestionsManager removeEntry:behavior:handler:]";
      *(_WORD *)&v25[14] = 2082;
      *(void *)&v25[16] = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. handler cannot be nil", buf, 0x26u);
    }
    goto LABEL_15;
  }
  uint64_t v11 = [v8 availableRemovalBehaviors];
  GEOFindOrCreateLog();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = NSStringFromMapsSuggestionsRemovalBehavior(a4);
    *(_DWORD *)buf = 136315650;
    id v23 = "-[MapsSuggestionsManager removeEntry:behavior:handler:]";
    __int16 v24 = 2112;
    *(void *)__int16 v25 = v8;
    *(_WORD *)&v25[8] = 2112;
    *(void *)&v25[10] = v13;
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "%s User removed Entry %@ (using %@)", buf, 0x20u);
  }
  if ((v11 & a4) == 0)
  {
    int v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v24 = 1024;
      *(_DWORD *)__int16 v25 = 1277;
      *(_WORD *)&v25[4] = 2082;
      *(void *)&v25[6] = "-[MapsSuggestionsManager removeEntry:behavior:handler:]";
      *(_WORD *)&v25[14] = 2082;
      *(void *)&v25[16] = "0 == (supportedRemovalBehavior & behavior)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requested Suppression behavior is not supported by the entry", buf, 0x26u);
    }
LABEL_15:

    char v15 = 0;
    goto LABEL_16;
  }
  objc_initWeak((id *)buf, self);
  gatheringQueue = self->_gatheringQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__MapsSuggestionsManager_removeEntry_behavior_handler___block_invoke;
  v18[3] = &unk_1E5CB87C0;
  objc_copyWeak(v21, (id *)buf);
  id v19 = v8;
  v21[1] = (id)a4;
  id v20 = v10;
  dispatch_async(gatheringQueue, v18);

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);
  char v15 = 1;
LABEL_16:

  return v15;
}

void __55__MapsSuggestionsManager_removeEntry_behavior_handler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    int v5 = (void *)*((void *)WeakRetained + 8);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    id v9[2] = __55__MapsSuggestionsManager_removeEntry_behavior_handler___block_invoke_201;
    v9[3] = &unk_1E5CB8720;
    objc_copyWeak(&v12, v2);
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    if (![v5 removeEntry:v6 behavior:v7 handler:v9]) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }

    objc_destroyWeak(&v12);
  }
  else
  {
    GEOFindOrCreateLog();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v14 = "MapsSuggestionsManager.mm";
      __int16 v15 = 1026;
      int v16 = 1284;
      __int16 v17 = 2082;
      __int16 v18 = "-[MapsSuggestionsManager removeEntry:behavior:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __55__MapsSuggestionsManager_removeEntry_behavior_handler___block_invoke_201(uint64_t a1)
{
  v17[1] = *(id *)MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    id v4 = [*(id *)(a1 + 32) originatingSourceName];
    id v5 = v3;
    id v6 = v4;
    objc_initWeak(__p, WeakRetained);
    uint64_t v7 = WeakRetained[2];
    *(void *)blocuint64_t k = MEMORY[0x1E4F143A8];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = __48__MapsSuggestionsManager__deleteEntries_source___block_invoke;
    *(void *)&block[24] = &unk_1E5CB86F8;
    objc_copyWeak(v17, __p);
    id v8 = v5;
    id v15 = v8;
    id v9 = v6;
    id v16 = v9;
    dispatch_async(v7, block);

    objc_destroyWeak(v17);
    objc_destroyWeak(__p);

    objc_msgSend(WeakRetained, "hintRefreshOfType:", objc_msgSend(*(id *)(a1 + 32), "type"));
    std::string::basic_string[abi:ne180100]<0>(__p, "com.apple.maps.userdeleted");
    MSg::NotificationSender::NotificationSender((std::string *)block, (long long *)__p);
    MSg::NotificationSender::notify((MSg::NotificationSender *)block, 0);
    if ((block[23] & 0x80000000) != 0) {
      operator delete(*(void **)block);
    }
    if (v12 < 0) {
      operator delete(__p[0]);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)blocuint64_t k = 136446722;
      *(void *)&void block[4] = "MapsSuggestionsManager.mm";
      *(_WORD *)&block[12] = 1026;
      *(_DWORD *)&block[14] = 1287;
      *(_WORD *)&block[18] = 2082;
      *(void *)&block[20] = "-[MapsSuggestionsManager removeEntry:behavior:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: removedStrongSelf went away in %{public}s", block, 0x1Cu);
    }
  }
}

- (void)feedbackForEntry:(id)a3 action:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = NSStringFromMapsSuggestionsEntryEngagement(a4);
      *(_DWORD *)buf = 136315650;
      id v15 = "-[MapsSuggestionsManager feedbackForEntry:action:]";
      __int16 v16 = 2112;
      *(void *)__int16 v17 = v8;
      *(_WORD *)&v17[8] = 2112;
      *(void *)&v17[10] = v6;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "%s UserAction %@ on entry %@", buf, 0x20u);
    }
    objc_initWeak((id *)buf, self);
    gatheringQueue = self->_gatheringQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__MapsSuggestionsManager_feedbackForEntry_action___block_invoke;
    block[3] = &unk_1E5CB7E50;
    objc_copyWeak(v13, (id *)buf);
    id v12 = v6;
    v13[1] = (id)a4;
    dispatch_async(gatheringQueue, block);

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v16 = 1024;
      *(_DWORD *)__int16 v17 = 1308;
      *(_WORD *)&v17[4] = 2082;
      *(void *)&v17[6] = "-[MapsSuggestionsManager feedbackForEntry:action:]";
      *(_WORD *)&v17[14] = 2082;
      *(void *)&v17[16] = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. entry cannot be nil", buf, 0x26u);
    }
  }
}

void __50__MapsSuggestionsManager_feedbackForEntry_action___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[8] feedbackForEntry:*(void *)(a1 + 32) action:*(void *)(a1 + 48)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsManager.mm";
      __int16 v7 = 1026;
      int v8 = 1312;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsManager feedbackForEntry:action:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    __int16 v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = [v6 name];
      *(_DWORD *)buf = 136315394;
      id v15 = "-[MapsSuggestionsManager feedbackForMapItem:action:]";
      __int16 v16 = 2112;
      *(void *)__int16 v17 = v8;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "%s:%@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    gatheringQueue = self->_gatheringQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__MapsSuggestionsManager_feedbackForMapItem_action___block_invoke;
    block[3] = &unk_1E5CB7E50;
    objc_copyWeak(v13, (id *)buf);
    id v12 = v6;
    v13[1] = (id)a4;
    dispatch_async(gatheringQueue, block);

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v16 = 1024;
      *(_DWORD *)__int16 v17 = 1322;
      *(_WORD *)&v17[4] = 2082;
      *(void *)&v17[6] = "-[MapsSuggestionsManager feedbackForMapItem:action:]";
      __int16 v18 = 2082;
      uint64_t v19 = "nil == (mapItem)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires mapItem", buf, 0x26u);
    }
  }
}

void __52__MapsSuggestionsManager_feedbackForMapItem_action___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[8] feedbackForMapItem:*(void *)(a1 + 32) action:*(void *)(a1 + 48)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsManager.mm";
      __int16 v7 = 1026;
      int v8 = 1326;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsManager feedbackForMapItem:action:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)feedbackForContact:(id)a3 action:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    __int16 v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      int v14 = "-[MapsSuggestionsManager feedbackForContact:action:]";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    gatheringQueue = self->_gatheringQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__MapsSuggestionsManager_feedbackForContact_action___block_invoke;
    block[3] = &unk_1E5CB7E50;
    objc_copyWeak(v12, (id *)buf);
    id v11 = v6;
    v12[1] = (id)a4;
    dispatch_async(gatheringQueue, block);

    objc_destroyWeak(v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    __int16 v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      int v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      __int16 v15 = 1024;
      int v16 = 1335;
      __int16 v17 = 2082;
      __int16 v18 = "-[MapsSuggestionsManager feedbackForContact:action:]";
      __int16 v19 = 2082;
      uint64_t v20 = "nil == (contact)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires contact", buf, 0x26u);
    }
  }
}

void __52__MapsSuggestionsManager_feedbackForContact_action___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[8] feedbackForContact:*(void *)(a1 + 32) action:*(void *)(a1 + 48)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsManager.mm";
      __int16 v7 = 1026;
      int v8 = 1339;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsManager feedbackForContact:action:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)didLoseLocationPermission
{
  objc_initWeak(&location, self);
  gatheringQueue = self->_gatheringQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__MapsSuggestionsManager_didLoseLocationPermission__block_invoke;
  v4[3] = &unk_1E5CB7E78;
  objc_copyWeak(&v5, &location);
  dispatch_async(gatheringQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__MapsSuggestionsManager_didLoseLocationPermission__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[5] clearLocationAndETAs];
  }
  else
  {
    GEOFindOrCreateLog();
    objc_super v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsManager.mm";
      __int16 v6 = 1026;
      int v7 = 1361;
      __int16 v8 = 2082;
      __int16 v9 = "-[MapsSuggestionsManager didLoseLocationPermission]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (id)storage
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  storageQueue = self->_storageQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__MapsSuggestionsManager_storage__block_invoke;
  v5[3] = &unk_1E5CB87E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(storageQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__MapsSuggestionsManager_storage__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)storageForSource:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__3;
  int v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  storageQueue = self->_storageQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MapsSuggestionsManager_storageForSource___block_invoke;
  block[3] = &unk_1E5CB8748;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(storageQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__MapsSuggestionsManager_storageForSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 72);
  id v6 = [*(id *)(a1 + 40) uniqueName];
  uint64_t v3 = objc_msgSend(v2, "objectForKeyedSubscript:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)sources
{
  return [(MapsSuggestionsCompositeSource *)self->_compositeSource sources];
}

- (id)sinks
{
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[MapsSuggestionsObservers count](self->_sinks, "count"));
  sinks = self->_sinks;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__MapsSuggestionsManager_sinks__block_invoke;
  v8[3] = &unk_1E5CB8810;
  id v5 = v3;
  id v9 = v5;
  [(MapsSuggestionsObservers *)sinks synchronouslyCallBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

uint64_t __31__MapsSuggestionsManager_sinks__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)awaitGatheringQueue
{
  dispatch_barrier_sync((dispatch_queue_t)self->_gatheringQueue, &__block_literal_global_4);
  compositeSource = self->_compositeSource;
  [(MapsSuggestionsCompositeSource *)compositeSource test_awaitQueue];
}

void __45__MapsSuggestionsManager_awaitGatheringQueue__block_invoke()
{
}

- (void)awaitStorageQueue
{
}

void __43__MapsSuggestionsManager_awaitStorageQueue__block_invoke()
{
}

- (id)storageQueue
{
  return self->_storageQueue;
}

- (id)tracker
{
  return self->_tracker;
}

- (id)additionalFiltersPerSink
{
  return self->_additionalFiltersPerSink;
}

- (MapsSuggestionsStrategy)strategy
{
  return self->_strategy;
}

- (void)setStrategy:(id)a3
{
}

- (int)mapType
{
  return self->_mapType;
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (MapsSuggestionsLocationUpdater)locationUpdater
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationUpdater);
  return (MapsSuggestionsLocationUpdater *)WeakRetained;
}

- (void)setLocationUpdater:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_locationUpdater);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_oldLocation, 0);
  objc_storeStrong((id *)&self->_deferredSourcesUpdater, 0);
  objc_storeStrong((id *)&self->_wipeStaleETAWiper, 0);
  objc_storeStrong((id *)&self->_expiredEntryInvalidator, 0);
  objc_storeStrong((id *)&self->_latestResults, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_compositeSource, 0);
  objc_storeStrong((id *)&self->_sinks, 0);
  objc_storeStrong((id *)&self->_etaValidUntil, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_additionalFiltersPerSink, 0);
  objc_storeStrong((id *)&self->_strategy, 0);
  objc_storeStrong((id *)&self->_storageQueue, 0);
  objc_storeStrong((id *)&self->_gatheringQueue, 0);
}

@end