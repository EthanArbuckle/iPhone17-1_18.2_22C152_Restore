@interface MapsSuggestionsRoutineRelevanceScoreProvider
- (MapsSuggestionsRoutineRelevanceScoreProvider)initWithRoutine:(id)a3;
- (NSString)uniqueName;
- (char)relevanceScoreForNames:(id)a3 addresses:(id)a4 mapItems:(id)a5 completion:(id)a6;
- (id).cxx_construct;
- (void)preLoad;
@end

@implementation MapsSuggestionsRoutineRelevanceScoreProvider

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (MapsSuggestionsRoutineRelevanceScoreProvider)initWithRoutine:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsRoutineRelevanceScoreProvider;
  v6 = [(MapsSuggestionsRoutineRelevanceScoreProvider *)&v20 init];
  if (v6)
  {
    GEOConfigGetDouble();
    uint64_t v8 = MapsSuggestionsNowWithOffset(-v7);
    fetchEntriesFromDate = v6->_fetchEntriesFromDate;
    v6->_fetchEntriesFromDate = (NSDate *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue(&v18, @"MapsSuggestionsRoutineRelevanceScoreProviderQueue", v10);
    dispatch_queue_t v11 = v18;
    dispatch_queue_t v18 = 0;
    innerQueue = v6->_queue._innerQueue;
    v6->_queue._innerQueue = (OS_dispatch_queue *)v11;

    v13 = v19;
    v19 = 0;
    name = v6->_queue._name;
    v6->_queue._name = v13;

    v15 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    routineLocations = v6->_routineLocations;
    v6->_routineLocations = v15;

    objc_storeStrong((id *)&v6->_routine, a3);
  }

  return v6;
}

- (char)relevanceScoreForNames:(id)a3 addresses:(id)a4 mapItems:(id)a5 completion:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = a5;
  id v13 = a6;
  if (!v13)
  {
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineRelevanceScoreProvider.mm";
      __int16 v25 = 1024;
      int v26 = 67;
      __int16 v27 = 2082;
      v28 = "-[MapsSuggestionsRoutineRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
      __int16 v29 = 2082;
      v30 = "nil == (completion)";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. nil completion", buf, 0x26u);
    }
    goto LABEL_12;
  }
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[MapsSuggestionsRoutineRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }
  }
  if (!v12)
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "mapItems was nil", buf, 2u);
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineRelevanceScoreProvider.mm";
      __int16 v25 = 1024;
      int v26 = 75;
      __int16 v27 = 2082;
      v28 = "-[MapsSuggestionsRoutineRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
      __int16 v29 = 2082;
      v30 = "[mapItems isKindOfClass:[NSMutableArray class]]";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Passing a mutable array for mapItems results in undefined behaviour", buf, 0x26u);
    }
LABEL_12:

LABEL_18:
    char v16 = 0;
    goto LABEL_19;
  }
  dispatch_queue_t v18 = [v12 copy];

  if ([v18 count])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __101__MapsSuggestionsRoutineRelevanceScoreProvider_relevanceScoreForNames_addresses_mapItems_completion___block_invoke;
    v20[3] = &unk_1E5CB80F8;
    v21 = v18;
    id v22 = v13;
    v12 = v18;
    MSg::Queue::async<MapsSuggestionsRoutineRelevanceScoreProvider>((NSObject **)&self->_queue, self, v20);

    char v16 = 1;
  }
  else
  {
    v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineRelevanceScoreProvider.mm";
      __int16 v25 = 1024;
      int v26 = 80;
      __int16 v27 = 2082;
      v28 = "-[MapsSuggestionsRoutineRelevanceScoreProvider relevanceScoreForNames:addresses:mapItems:completion:]";
      __int16 v29 = 2082;
      v30 = "0u == [mapItems count]";
      _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. 0 mapItems passed", buf, 0x26u);
    }

    char v16 = 0;
    v12 = v18;
  }
LABEL_19:

  return v16;
}

void __101__MapsSuggestionsRoutineRelevanceScoreProvider_relevanceScoreForNames_addresses_mapItems_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v35 = *(void *)(a1 + 40);
  id v36 = *(id *)(a1 + 32);
  if (a2)
  {
    uint64_t v3 = [*(id *)(a2 + 40) count];
    if (v3 == [*(id *)(a2 + 48) count])
    {
      v4 = *(id *)(a2 + 40);
      objc_sync_enter(v4);
      if (v3)
      {
        objc_sync_exit(v4);

        v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v36, "count"));
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id obj = v36;
        uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v5)
        {
          id v38 = *(id *)v42;
          do
          {
            uint64_t v6 = 0;
            do
            {
              if (*(id *)v42 != v38) {
                objc_enumerationMutation(obj);
              }
              double v7 = *(void **)(*((void *)&v41 + 1) + 8 * v6);
              uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v35);
              if (v7) {
                BOOL v9 = v8 == v7;
              }
              else {
                BOOL v9 = 1;
              }
              int v10 = v9;

              if (v10)
              {
                id v11 = [[MapsSuggestionsRelevanceScore alloc] initWithConfidence:MapsSuggestionsConfidenceDontKnow()];
                [v40 addObject:v11];
              }
              else
              {
                id v12 = v7;
                id v11 = objc_alloc_init(MapsSuggestionsRelevanceScore);
                id v13 = [v12 geoFenceMapRegionOrNil];
                GEOMapRectForMapRegion();

                id v14 = *(id *)(a2 + 40);
                objc_sync_enter(v14);
                uint64_t v15 = [*(id *)(a2 + 40) count];
                if (v15)
                {
                  char v16 = 0;
                  unint64_t v17 = 0;
                  while (1)
                  {
                    dispatch_queue_t v18 = [*(id *)(a2 + 40) objectAtIndexedSubscript:v17];

                    [v18 coordinate];
                    [v18 coordinate];
                    GEOMapPointForCoordinate();
                    if (GEOMapRectContainsPoint()) {
                      break;
                    }
                    ++v17;
                    char v16 = v18;
                    if (v15 == v17) {
                      goto LABEL_23;
                    }
                  }
                  GEOFindOrCreateLog();
                  v19 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                  {
                    objc_super v20 = [v12 name];
                    [v12 coordinate];
                    uint64_t v22 = v21;
                    [v12 coordinate];
                    *(_DWORD *)buf = 138412802;
                    v46 = v20;
                    __int16 v47 = 2048;
                    *(void *)v48 = v22;
                    *(_WORD *)&v48[8] = 2048;
                    *(void *)&v48[10] = v23;
                    _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "mapItem %@ , %f , %f was found in CoreRoutine. Setting High Confidence", buf, 0x20u);
                  }
                  [(MapsSuggestionsRelevanceScore *)v11 setConfidence:MapsSuggestionsConfidenceDefinitelyTrue()];
                  id v24 = *(id *)(a2 + 48);
                  objc_sync_enter(v24);
                  if ([*(id *)(a2 + 48) count] > v17)
                  {
                    __int16 v25 = [*(id *)(a2 + 48) objectAtIndexedSubscript:v17];
                    [(MapsSuggestionsRelevanceScore *)v11 setLastInteractionTime:v25];
                  }
                  objc_sync_exit(v24);

                  objc_sync_exit(v14);
                }
                else
                {
                  dispatch_queue_t v18 = 0;
LABEL_23:
                  objc_sync_exit(v14);

                  [(MapsSuggestionsRelevanceScore *)v11 setConfidence:MapsSuggestionsConfidenceDontKnow()];
                }

                [(MapsSuggestionsRelevanceScore *)v11 confidence];
                if (v26 == MapsSuggestionsConfidenceDontKnow())
                {
                  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
                    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
                  }
                  if (s_verbose)
                  {
                    GEOFindOrCreateLog();
                    __int16 v27 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                    {
                      v28 = [v12 name];
                      [v12 coordinate];
                      uint64_t v30 = v29;
                      [v12 coordinate];
                      *(_DWORD *)buf = 138412802;
                      v46 = v28;
                      __int16 v47 = 2048;
                      *(void *)v48 = v30;
                      *(_WORD *)&v48[8] = 2048;
                      *(void *)&v48[10] = v31;
                      _os_log_impl(&dword_1A70DF000, v27, OS_LOG_TYPE_DEBUG, "mapItem %@ , %f , %f was NOT found in CoreRoutine", buf, 0x20u);
                    }
                  }
                }
                [v40 addObject:v11];
              }

              ++v6;
            }
            while (v6 != v5);
            uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v5);
        }

        uint64_t v32 = [v40 count];
        if (v32 == [obj count])
        {
          v4 = v40;
          v39 = v4;
        }
        else
        {
          v34 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v46 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineRelevanceScoreProvider.mm";
            __int16 v47 = 1024;
            *(_DWORD *)v48 = 145;
            *(_WORD *)&v48[4] = 2082;
            *(void *)&v48[6] = "-[MapsSuggestionsRoutineRelevanceScoreProvider _confidencesForMapItems:]";
            *(_WORD *)&v48[14] = 2082;
            *(void *)&v48[16] = "[confidences count] != [mapItems count]";
            _os_log_impl(&dword_1A70DF000, v34, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Return count must be same as input count!", buf, 0x26u);
          }

          v39 = 0;
          v4 = v40;
        }
        goto LABEL_47;
      }
      v33 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v49 = 0;
        _os_log_impl(&dword_1A70DF000, v33, OS_LOG_TYPE_DEBUG, "No routine locations. Returning nil", v49, 2u);
      }

      objc_sync_exit(v4);
    }
    else
    {
      v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v49 = 136446978;
        v50 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineRelevanceScoreProvider.mm";
        __int16 v51 = 1024;
        int v52 = 124;
        __int16 v53 = 2082;
        v54 = "-[MapsSuggestionsRoutineRelevanceScoreProvider _confidencesForMapItems:]";
        __int16 v55 = 2082;
        v56 = "locationCount != [_routineVisits count]";
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Number of routine locations and visits are different. This is not allowed. Returning nil", v49, 0x26u);
      }
    }
    v39 = 0;
LABEL_47:

    goto LABEL_48;
  }
  v39 = 0;
LABEL_48:

  (*(void (**)(uint64_t, NSObject *, void))(v35 + 16))(v35, v39, 0);
}

- (void)preLoad
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    uint64_t v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v6 = "-[MapsSuggestionsRoutineRelevanceScoreProvider preLoad]";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__MapsSuggestionsRoutineRelevanceScoreProvider_preLoad__block_invoke;
  v4[3] = &unk_1E5CB8148;
  v4[4] = self;
  MSg::Queue::async<MapsSuggestionsRoutineRelevanceScoreProvider>((NSObject **)&self->_queue, self, v4);
}

void __55__MapsSuggestionsRoutineRelevanceScoreProvider_preLoad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__MapsSuggestionsRoutineRelevanceScoreProvider_preLoad__block_invoke_2;
  v16[3] = &unk_1E5CB8120;
  uint64_t v5 = v4;
  unint64_t v17 = v5;
  objc_copyWeak(&v18, &location);
  uint64_t v6 = v16;
  if (v3)
  {
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    }
    if (s_verbose)
    {
      uint64_t v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "Calling CoreRoutine SPI", buf, 2u);
      }
    }
    objc_initWeak(&from, v3);
    uint64_t v8 = [MEMORY[0x1E4F647A0] sharedManager];
    int v9 = [v8 isEnabledForSubTestWithName:@"MSGPPTTest_Insights_ACRanking_RoutineCall"];

    if (v9)
    {
      int v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 postNotificationName:@"MSGPPTTest_Insights_ACRanking_RoutineCallBEGIN" object:0];
    }
    id v11 = (void *)v3[4];
    uint64_t v12 = v3[1];
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __71__MapsSuggestionsRoutineRelevanceScoreProvider__fetchLOIsWithCallback___block_invoke;
    uint64_t v23 = &unk_1E5CB8170;
    objc_copyWeak(v25, &from);
    id v24 = v6;
    [v11 fetchLocationsSinceDate:v12 handler:buf];

    objc_destroyWeak(v25);
    objc_destroyWeak(&from);
  }

  GEOConfigGetDouble();
  dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
  if (dispatch_semaphore_wait(v5, v14))
  {
    uint64_t v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "RoutineRelevanceScoreProvider preload timed out", buf, 2u);
    }
  }
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

void __55__MapsSuggestionsRoutineRelevanceScoreProvider_preLoad__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    id v11 = WeakRetained;
    if (WeakRetained)
    {
      id v12 = WeakRetained[5];
      objc_sync_enter(v12);
      uint64_t v13 = [v7 copy];
      id v14 = v11[5];
      v11[5] = (id)v13;

      objc_sync_exit(v12);
      id v15 = v11[6];
      objc_sync_enter(v15);
      uint64_t v16 = [v8 copy];
      id v17 = v11[6];
      v11[6] = (id)v16;

      objc_sync_exit(v15);
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
    else
    {
      GEOFindOrCreateLog();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136446722;
        objc_super v20 = "MapsSuggestionsRoutineRelevanceScoreProvider.mm";
        __int16 v21 = 1026;
        int v22 = 103;
        __int16 v23 = 2082;
        id v24 = "-[MapsSuggestionsRoutineRelevanceScoreProvider preLoad]_block_invoke_2";
        _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v19, 0x1Cu);
      }
    }
  }
}

void __71__MapsSuggestionsRoutineRelevanceScoreProvider__fetchLOIsWithCallback___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = [MEMORY[0x1E4F647A0] sharedManager];
  int v11 = [v10 isEnabledForSubTestWithName:@"MSGPPTTest_Insights_ACRanking_RoutineCall"];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"MSGPPTTest_Insights_ACRanking_RoutineCallEND" object:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v9)
    {
      id v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412290;
        objc_super v20 = v9;
        _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "Error while fetching locations: %@", (uint8_t *)&v19, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      GEOFindOrCreateLog();
      uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 67109120;
        LODWORD(v20) = [v7 count];
        _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "CoreRoutine returned %u locations", (uint8_t *)&v19, 8u);
      }

      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      }
      if (s_verbose)
      {
        id v17 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          int v19 = 138412290;
          objc_super v20 = (char *)v7;
          _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "Locations: %@", (uint8_t *)&v19, 0xCu);
        }

        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        }
      }
      if (s_verbose)
      {
        id v18 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          int v19 = 138412290;
          objc_super v20 = v8;
          _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_DEBUG, "Visits: %@", (uint8_t *)&v19, 0xCu);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136446722;
      objc_super v20 = "MapsSuggestionsRoutineRelevanceScoreProvider.mm";
      __int16 v21 = 1026;
      int v22 = 192;
      __int16 v23 = 2082;
      id v24 = "-[MapsSuggestionsRoutineRelevanceScoreProvider _fetchLOIsWithCallback:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v19, 0x1Cu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineVisits, 0);
  objc_storeStrong((id *)&self->_routineLocations, 0);
  objc_storeStrong((id *)&self->_routine, 0);

  objc_storeStrong((id *)&self->_fetchEntriesFromDate, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end