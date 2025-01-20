@interface MapsSuggestionsRatingRequestSource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (MapsSuggestionsRatingRequestSource)initWithMapsSync:(id)a3 routine:(id)a4 delegate:(id)a5 name:(id)a6;
- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (id)readBudgetState;
- (void)start;
- (void)writeBudgetState:(id)a3;
@end

@implementation MapsSuggestionsRatingRequestSource

+ (BOOL)isEnabled
{
  if (MapsFeature_IsEnabled_LagunaBeach()
    && (GEODoesUserHaveValidAccountForMakingContributions() & 1) != 0
    || (int BOOL = GEOConfigGetBOOL()) != 0)
  {
    LOBYTE(BOOL) = GEOConfigGetBOOL();
  }
  return BOOL;
}

+ (unint64_t)disposition
{
  return 1;
}

- (MapsSuggestionsRatingRequestSource)initWithMapsSync:(id)a3 routine:(id)a4 delegate:(id)a5 name:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)MapsSuggestionsRatingRequestSource;
  v15 = [(MapsSuggestionsBaseSource *)&v34 initWithDelegate:v13 name:v14];
  if (v15)
  {
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("MapsSuggestionsRatingRequestSourceQueue", v16);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v15->_mapsSync, a3);
    objc_storeStrong((id *)&v15->_routine, a4);
    v19 = [[MapsSuggestionsBudget alloc] initWithDelegate:v15 name:@"MapsSuggestionsRatingRequestSource"];
    budget = v15->_budget;
    v15->_budget = v19;

    v21 = v15->_budget;
    uint64_t Integer = GEOConfigGetInteger();
    GEOConfigGetDouble();
    id location = (id)(uint64_t)(v23 * 1000000000.0);
    [(MapsSuggestionsBudget *)v21 addRollingWindowOfCount:Integer perDuration:&location name:@"Short"];
    v24 = v15->_budget;
    uint64_t v25 = GEOConfigGetInteger();
    GEOConfigGetDouble();
    id location = (id)(uint64_t)(v26 * 1000000000.0);
    [(MapsSuggestionsBudget *)v24 addRollingWindowOfCount:v25 perDuration:&location name:@"Long"];
    objc_initWeak(&location, v15);
    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v28 = *MEMORY[0x1E4F63F28];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __77__MapsSuggestionsRatingRequestSource_initWithMapsSync_routine_delegate_name___block_invoke;
    v31[3] = &unk_1E5CBA558;
    objc_copyWeak(&v32, &location);
    id v29 = (id)[v27 addObserverForName:v28 object:0 queue:0 usingBlock:v31];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __77__MapsSuggestionsRatingRequestSource_initWithMapsSync_routine_delegate_name___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      [WeakRetained updateSuggestionEntriesWithHandler:0];
      goto LABEL_15;
    }
    unsigned int v6 = [MEMORY[0x1E4F647B8] activeStateForCohortId:*MEMORY[0x1E4F64320]];
    if (v6 >= 2)
    {
      if (v6 == 2)
      {
        v7 = @"YES";
LABEL_13:
        int v10 = 138412290;
        id v11 = (char *)v7;
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_INFO, "Offline state changed: %@", (uint8_t *)&v10, 0xCu);
        goto LABEL_14;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v17 = v6;
        _os_log_fault_impl(&dword_1A70DF000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
      }
    }
    v7 = @"NO";
    goto LABEL_13;
  }
  GEOFindOrCreateLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136446722;
    id v11 = "MapsSuggestionsRatingRequestSource.mm";
    __int16 v12 = 1026;
    int v13 = 96;
    __int16 v14 = 2082;
    v15 = "-[MapsSuggestionsRatingRequestSource initWithMapsSync:routine:delegate:name:]_block_invoke";
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
  }

LABEL_15:
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446978;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestSource.mm";
      __int16 v19 = 1024;
      int v20 = 108;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsRatingRequestSource initFromResourceDepot:name:]";
      __int16 v23 = 2082;
      v24 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!", (uint8_t *)&v17, 0x26u);
    }
    goto LABEL_17;
  }
  v8 = [v6 oneSourceDelegate];

  if (!v8)
  {
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446978;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestSource.mm";
      __int16 v19 = 1024;
      int v20 = 109;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsRatingRequestSource initFromResourceDepot:name:]";
      __int16 v23 = 2082;
      v24 = "nil == (resourceDepot.oneSourceDelegate)";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!", (uint8_t *)&v17, 0x26u);
    }
    goto LABEL_17;
  }
  v9 = [v6 oneMapsSync];

  if (!v9)
  {
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446978;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestSource.mm";
      __int16 v19 = 1024;
      int v20 = 110;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsRatingRequestSource initFromResourceDepot:name:]";
      __int16 v23 = 2082;
      v24 = "nil == (resourceDepot.oneMapsSync)";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one MapsSync!", (uint8_t *)&v17, 0x26u);
    }
    goto LABEL_17;
  }
  int v10 = [v6 oneRoutine];

  if (!v10)
  {
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446978;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestSource.mm";
      __int16 v19 = 1024;
      int v20 = 111;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsRatingRequestSource initFromResourceDepot:name:]";
      __int16 v23 = 2082;
      v24 = "nil == (resourceDepot.oneRoutine)";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Routine!", (uint8_t *)&v17, 0x26u);
    }
LABEL_17:

    __int16 v14 = 0;
    goto LABEL_18;
  }
  id v11 = [v6 oneMapsSync];
  __int16 v12 = [v6 oneRoutine];
  int v13 = [v6 oneSourceDelegate];
  self = [(MapsSuggestionsRatingRequestSource *)self initWithMapsSync:v11 routine:v12 delegate:v13 name:v7];

  __int16 v14 = self;
LABEL_18:

  return v14;
}

- (void)start
{
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MapsSuggestionsRatingRequestSource_updateSuggestionEntriesWithHandler___block_invoke;
  block[3] = &unk_1E5CB84F0;
  objc_copyWeak(&v12, &location);
  id v11 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
  GEOConfigGetDouble();
  double v8 = v7;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v8;
}

void __73__MapsSuggestionsRatingRequestSource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
{
  v40[3] = *(id *)MEMORY[0x1E4F143B8];
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(id *)(a1 + 32);
    dispatch_assert_queue_V2(WeakRetained[3]);
    unsigned int v4 = [MEMORY[0x1E4F647B8] activeStateForCohortId:*MEMORY[0x1E4F64320]];
    if (v4 >= 2)
    {
      if (v4 == 2)
      {
        v5 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Maps is Offline. Not running Ratings Request Source.", buf, 2u);
        }

        objc_initWeak(location, WeakRetained);
        id v6 = WeakRetained[3];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke;
        *(void *)&buf[24] = &unk_1E5CB84F0;
        objc_copyWeak(v39, location);
        id v38 = v3;
        dispatch_async(v6, buf);

        objc_destroyWeak(v39);
        objc_destroyWeak(location);
        goto LABEL_22;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v4;
        _os_log_fault_impl(&dword_1A70DF000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
      }
    }
    if (GEOConfigGetBOOL())
    {
      if (+[MapsSuggestionsSiri isEnabled]
        && !MapsSuggestionsIsInCoarseLocation())
      {
        int v13 = MapsSuggestionsCurrentBestLocation();
        BOOL v14 = v13 == 0;

        if (v14)
        {
          uint64_t v28 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A70DF000, v28, OS_LOG_TYPE_DEBUG, "Current location is nil", buf, 2u);
          }

          objc_initWeak(location, WeakRetained);
          id v29 = WeakRetained[3];
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_230;
          *(void *)&buf[24] = &unk_1E5CB84F0;
          objc_copyWeak(v39, location);
          id v38 = v3;
          dispatch_async(v29, buf);

          objc_destroyWeak(v39);
          objc_destroyWeak(location);
        }
        else
        {
          GEOFindOrCreateLog();
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            v16 = [(dispatch_queue_t *)WeakRetained uniqueName];
            int v17 = NSStringFromMapsSuggestionsEntryType(0x15uLL);
            uint64_t v18 = NSStringFromMapsSuggestionsCurrentBestLocation();
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v16;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v17;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v18;
            _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);
          }
          GEOConfigGetDouble();
          double v20 = v19;
          GEOConfigGetDouble();
          v22 = v21;
          GEOConfigGetDouble();
          v24 = v23;
          location[0] = 0;
          location[1] = location;
          location[2] = (id)0x3032000000;
          location[3] = __Block_byref_object_copy__18;
          location[4] = __Block_byref_object_dispose__18;
          MapsSuggestionsNowWithOffset(-v20);
          id v36 = (id)objc_claimAutoreleasedReturnValue();
          v33[0] = 0;
          v33[1] = v33;
          v33[2] = 0x3032000000;
          v33[3] = __Block_byref_object_copy__18;
          v33[4] = __Block_byref_object_dispose__18;
          id v34 = 0;
          v31[0] = 0;
          v31[1] = v31;
          v31[2] = 0x2020000000;
          char v32 = 0;
          objc_initWeak(&from, WeakRetained);
          dispatch_queue_t v25 = WeakRetained[4];
          GEOConfigGetDouble();
          double v27 = v26;
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_231;
          *(void *)&buf[24] = &unk_1E5CBA6E8;
          objc_copyWeak(v40, &from);
          id v38 = v3;
          v39[0] = location;
          v39[1] = v33;
          v39[2] = v31;
          v40[1] = v24;
          v40[2] = v22;
          [v25 mapItemsForHistoricPlaces:1 routes:1 maxAge:buf handler:v27];

          objc_destroyWeak(v40);
          objc_destroyWeak(&from);
          _Block_object_dispose(v31, 8);
          _Block_object_dispose(v33, 8);

          _Block_object_dispose(location, 8);
        }
      }
      else
      {
        v9 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "User turned off Siri for Maps or is in coarse location", buf, 2u);
        }

        objc_initWeak(location, WeakRetained);
        int v10 = WeakRetained[3];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_229;
        *(void *)&buf[24] = &unk_1E5CB84F0;
        objc_copyWeak(v39, location);
        id v38 = v3;
        dispatch_async(v10, buf);

        objc_destroyWeak(v39);
        objc_destroyWeak(location);
      }
    }
    else
    {
      id v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "Laguna Beach Suggestions has been disabled in the Maps Settings!", buf, 2u);
      }

      objc_initWeak(location, WeakRetained);
      id v12 = WeakRetained[3];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_227;
      *(void *)&buf[24] = &unk_1E5CB84F0;
      objc_copyWeak(v39, location);
      id v38 = v3;
      dispatch_async(v12, buf);

      objc_destroyWeak(v39);
      objc_destroyWeak(location);
    }
LABEL_22:

    goto LABEL_23;
  }
  GEOFindOrCreateLog();
  double v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "MapsSuggestionsRatingRequestSource.mm";
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = 130;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "-[MapsSuggestionsRatingRequestSource updateSuggestionEntriesWithHandler:]_block_invoke";
    _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
  }

LABEL_23:
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 21;
}

- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      double v7 = "MapsSuggestionsRatingRequestSource.mm";
      __int16 v8 = 1026;
      int v9 = 255;
      __int16 v10 = 2082;
      id v11 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_227(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      double v7 = "MapsSuggestionsRatingRequestSource.mm";
      __int16 v8 = 1026;
      int v9 = 261;
      __int16 v10 = 2082;
      id v11 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_229(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      double v7 = "MapsSuggestionsRatingRequestSource.mm";
      __int16 v8 = 1026;
      int v9 = 266;
      __int16 v10 = 2082;
      id v11 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_230(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      double v7 = "MapsSuggestionsRatingRequestSource.mm";
      __int16 v8 = 1026;
      int v9 = 271;
      __int16 v10 = 2082;
      id v11 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_231(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  GEOFindOrCreateLog();
  double v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = [v5 count];
    _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "Received %u mapItems from MapsSync", buf, 8u);
  }

  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  int v9 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v10 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_232;
    block[3] = &unk_1E5CBA6C0;
    objc_copyWeak(&v18, (id *)(a1 + 64));
    id v13 = v6;
    id v14 = v5;
    id v15 = *(id *)(a1 + 32);
    long long v16 = *(_OWORD *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 56);
    long long v19 = *(_OWORD *)(a1 + 72);
    dispatch_async(v10, block);

    objc_destroyWeak(&v18);
  }
  else
  {
    GEOFindOrCreateLog();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v21 = "MapsSuggestionsRatingRequestSource.mm";
      __int16 v22 = 1026;
      int v23 = 291;
      __int16 v24 = 2082;
      dispatch_queue_t v25 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_232(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id from = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v49 = "MapsSuggestionsRatingRequestSource.mm";
      __int16 v50 = 1026;
      int v51 = 293;
      __int16 v52 = 2082;
      v53 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
    id v6 = v5;
    goto LABEL_28;
  }
  uint64_t v24 = a1;
  if (!*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    dispatch_group_t v7 = dispatch_group_create();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_233;
    aBlock[3] = &unk_1E5CBA5D0;
    id v6 = v7;
    v42 = v6;
    v43 = WeakRetained;
    v46[1] = *(id *)(a1 + 88);
    objc_copyWeak(v46, from);
    long long v44 = *(_OWORD *)(a1 + 56);
    uint64_t v45 = *(void *)(a1 + 72);
    __int16 v22 = _Block_copy(aBlock);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v38 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(char **)(*((void *)&v37 + 1) + 8 * i);
          if ([v11 _hasMUID])
          {
            dispatch_group_enter(v6);
            uint64_t v12 = (void *)WeakRetained[4];
            double v13 = *(double *)(v24 + 96);
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_238;
            v33[3] = &unk_1E5CBA620;
            objc_copyWeak(&v36, from);
            v33[4] = v11;
            id v14 = v6;
            id v34 = v14;
            id v35 = v22;
            if (![v12 canProduceRatingRequestForMapItem:v11 maxAge:v33 handler:v13])
            {
              id v15 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v49 = v11;
                _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "We got no response from MSgMapsSync for %@", buf, 0xCu);
              }

              dispatch_group_leave(v14);
            }

            objc_destroyWeak(&v36);
          }
          else
          {
            GEOFindOrCreateLog();
            long long v16 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v17 = [v11 name];
              *(_DWORD *)buf = 138412290;
              v49 = v17;
              _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "We're skipping mapItem: %@ without MUIDs", buf, 0xCu);
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v8);
    }

    id v18 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_241;
    block[3] = &unk_1E5CBA698;
    objc_copyWeak(&v32, from);
    uint64_t v29 = *(void *)(v24 + 64);
    id v19 = *(id *)(v24 + 48);
    uint64_t v20 = *(void *)(v24 + 72);
    id v28 = v19;
    uint64_t v21 = *(void *)(v24 + 56);
    uint64_t v30 = v20;
    uint64_t v31 = v21;
    dispatch_group_notify(v6, v18, block);

    objc_destroyWeak(&v32);
    objc_destroyWeak(v46);
    id v5 = v42;
LABEL_28:

    goto LABEL_29;
  }
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = *(char **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v49 = v3;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_ERROR, "Error reading MapsSync: %@", buf, 0xCu);
  }

  [WeakRetained addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
LABEL_29:
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_233(uint64_t a1, void *a2, char a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  GEOFindOrCreateLog();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    dispatch_group_t v7 = [v5 name];
    *(_DWORD *)buf = 138412290;
    id v20 = v7;
    _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "fetchLastVisitAtMapItem: %@", buf, 0xCu);
  }
  uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 40);
  double v9 = *(double *)(a1 + 80);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_234;
  v12[3] = &unk_1E5CBA5A8;
  objc_copyWeak(&v17, (id *)(a1 + 72));
  id v13 = *(id *)(a1 + 32);
  id v10 = v5;
  id v14 = v10;
  long long v15 = *(_OWORD *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 64);
  char v18 = a3;
  if (![v8 fetchLastVisitAtMapItem:v10 withinDistance:v12 handler:v9])
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v10;
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "We got no response from MSgRoutine for %@", buf, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

  objc_destroyWeak(&v17);
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_234(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 72));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v12 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_235;
    block[3] = &unk_1E5CBA580;
    long long v15 = v9;
    id v16 = *(id *)(a1 + 32);
    id v17 = v7;
    id v18 = v8;
    id v19 = *(id *)(a1 + 40);
    long long v20 = *(_OWORD *)(a1 + 48);
    uint64_t v21 = *(void *)(a1 + 64);
    char v22 = *(unsigned char *)(a1 + 80);
    dispatch_async(v12, block);

    id v13 = v15;
  }
  else
  {
    GEOFindOrCreateLog();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v24 = "MapsSuggestionsRatingRequestSource.mm";
      __int16 v25 = 1026;
      int v26 = 311;
      __int16 v27 = 2082;
      id v28 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf3 went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_235(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v2 = *(void *)(a1 + 32) == 0;
  id v3 = GEOFindOrCreateLog();
  uint64_t v4 = v3;
  if (v2)
  {
    id v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v8 = *(void **)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 56);
      int v9 = [*(id *)(a1 + 64) _hasPlaceQuestionnaire];
      id v10 = [*(id *)(a1 + 64) name];
      int v18 = 138413058;
      id v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v7;
      __int16 v22 = 1024;
      int v23 = v9;
      __int16 v24 = 2112;
      __int16 v25 = v10;
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "lastVisitStartTime: %@; lastVisitEndTime: %@; _hasPlaceQuestionnaire: %d for mapItem: %@",
        (uint8_t *)&v18,
        0x26u);
    }
    uint64_t v11 = 56;
    if (!*(void *)(a1 + 56)) {
      uint64_t v11 = 48;
    }
    uint64_t v12 = *(void **)(a1 + v11);
    id v13 = v12;
    if (v13)
    {
      id v14 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) laterDate:v13];
      if (v14 == v13)
      {
        int v15 = [*(id *)(a1 + 64) _hasPlaceQuestionnaire];

        if (v15)
        {
          GEOFindOrCreateLog();
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            id v17 = [*(id *)(a1 + 64) name];
            int v18 = 138412290;
            id v19 = v17;
            _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "Updating mostRecentDate/MapItem/IsBrandNew for mapItem: %@", (uint8_t *)&v18, 0xCu);
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v12);
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(id *)(a1 + 64));
          *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(a1 + 96);
        }
      }
      else
      {
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v5 = *(void **)(a1 + 32);
      int v18 = 138412290;
      id v19 = v5;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "Error getting last visit: %@", (uint8_t *)&v18, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_238(uint64_t a1, char a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_239;
    block[3] = &unk_1E5CBA5F8;
    char v15 = a2;
    int v9 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v12 = v9;
    id v14 = *(id *)(a1 + 48);
    id v13 = v5;
    dispatch_async(v8, block);
  }
  else
  {
    GEOFindOrCreateLog();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v17 = "MapsSuggestionsRatingRequestSource.mm";
      __int16 v18 = 1026;
      int v19 = 350;
      __int16 v20 = 2082;
      uint64_t v21 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf3 went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_239(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(a1 + 56);
    id v3 = MapsSuggestionsMapItemConvertIfNeeded(*(void **)(a1 + 32));
    (*(void (**)(uint64_t, void *, BOOL))(v2 + 16))(v2, v3, *(void *)(a1 + 48) == 0);

    uint64_t v4 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v4);
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [*(id *)(a1 + 32) name];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "canProduceRatingRequestForMapItem returned NO. We should not suggest a RatingRequest for %@", (uint8_t *)&v7, 0xCu);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_241(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    uint64_t v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "MapsSuggestionsRatingRequestSource.mm";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 372;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v26, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfNotify went away in %{public}s", buf, 0x1Cu);
    }

    goto LABEL_52;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    GEOFindOrCreateLog();
    uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) name];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Winning mapItem being sent for RatingRequest entry creation is: %@", buf, 0xCu);
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
      || ([*((id *)WeakRetained + 6) hasBudgetLeft] & 1) != 0)
    {
      id v6 = MapsSuggestionsMapItemConvertIfNeeded(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      int v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      id v8 = v6;
      id v46 = v7;
      uint64_t v9 = [MapsSuggestionsEntry alloc];
      id v10 = [v8 name];
      uint64_t v11 = [(MapsSuggestionsEntry *)v9 initWithType:21 title:v10];

      id v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"RatingRequest_%llu", objc_msgSend(v8, "_muid"));
      [(MapsSuggestionsEntry *)v11 setString:v12 forKey:@"MapsSuggestionsMapsSyncSourcePK"];

      [(MapsSuggestionsEntry *)v11 setString:@"MapsSuggestionsMapsSyncSourcePK" forKey:@"MapsSuggestionsPrimaryKey"];
      [(MapsSuggestionsEntry *)v11 setBoolean:1 forKey:@"MapsSuggestionsIsNotADestinationKey"];
      [(MapsSuggestionsEntry *)v11 setDate:v46 forKey:@"MapsSuggestionsCoreRoutineLastVisit"];
      [(MapsSuggestionsEntry *)v11 setGeoMapItem:v8];
      GEOConfigGetDouble();
      -[MapsSuggestionsEntry setWeight:](v11, "setWeight:");
      id v13 = v11;
      id v14 = v13;
      if (v13)
      {
        char v15 = [(MapsSuggestionsEntry *)v13 geoMapItem];
        BOOL v16 = v15 == 0;

        if (!v16)
        {
          id v17 = [(MapsSuggestionsEntry *)v14 geoMapItem];
          id v18 = MapsSuggestionsSetLocationFromMapItem(v14, v17, 6);

          id v19 = [(MapsSuggestionsEntry *)v14 geoMapItem];
          __int16 v20 = v19;
          if (!v19)
          {
            __int16 v24 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestSource.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 166;
              *(_WORD *)&buf[18] = 2082;
              *(void *)&buf[20] = "NSArray<NSString *> *_extractTitleAndSubtitleFromMapItem(MapsSuggestionsMapItem *__strong)";
              *(_WORD *)&buf[28] = 2082;
              *(void *)&buf[30] = "nil == (mapItem)";
              _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", buf, 0x26u);
            }
            goto LABEL_36;
          }
          uint64_t v21 = [v19 name];
          BOOL v22 = [v21 length] == 0;

          if (v22)
          {
            __int16 v24 = 0;
          }
          else
          {
            int v23 = [v20 name];
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            *(void *)&buf[24] = __Block_byref_object_copy__18;
            *(void *)&unsigned char buf[32] = __Block_byref_object_dispose__18;
            id v54 = 0;
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = ___ZL18_firstLineOfStringP8NSString_block_invoke_0;
            v52[3] = &unk_1E5CBA430;
            v52[4] = buf;
            [v23 enumerateLinesUsingBlock:v52];
            __int16 v24 = *(id *)(*(void *)&buf[8] + 40);
            _Block_object_dispose(buf, 8);

            if (v24)
            {
              __int16 v25 = [v20 shortAddress];
              int v45 = [v25 containsString:v24];

              if (!v45)
              {
LABEL_34:
                if ([v24 length])
                {
                  *(void *)buf = v24;
                  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
LABEL_37:

                  if ([v31 count])
                  {
                    id v34 = [v31 firstObject];
                    [(MapsSuggestionsEntry *)v14 setUndecoratedTitle:v34];

                    if ((unint64_t)[v31 count] >= 2)
                    {
                      id v35 = [v31 lastObject];
                      [(MapsSuggestionsEntry *)v14 setUndecoratedSubtitle:v35];
                    }
                  }
                  goto LABEL_40;
                }
LABEL_36:
                uint64_t v31 = 0;
                goto LABEL_37;
              }
            }
          }
          uint64_t v33 = [v20 shortAddress];

          __int16 v24 = v33;
          goto LABEL_34;
        }
        uint64_t v31 = GEOFindOrCreateLog();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
LABEL_40:

          if (v14)
          {
            id v36 = (void *)*((void *)WeakRetained + 4);
            uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_242;
            v48[3] = &unk_1E5CBA670;
            objc_copyWeak(&v51, v2);
            long long v47 = *(_OWORD *)(a1 + 32);
            id v38 = (id)v47;
            long long v50 = v47;
            uint64_t v26 = v14;
            v49 = v26;
            if (![v36 didProduceRatingRequestForMapItem:v37 handler:v48])
            {
              long long v39 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                uint64_t v40 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v40;
                _os_log_impl(&dword_1A70DF000, v39, OS_LOG_TYPE_ERROR, "Could not write the RatingRequest for MapItem %@", buf, 0xCu);
              }

              [WeakRetained addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
              uint64_t v41 = *(void *)(a1 + 32);
              if (v41) {
                (*(void (**)(void))(v41 + 16))();
              }
            }

            objc_destroyWeak(&v51);
          }
          else
          {
            v42 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              uint64_t v43 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v43;
              _os_log_impl(&dword_1A70DF000, v42, OS_LOG_TYPE_ERROR, "Could not make Entry out of MapItem %@", buf, 0xCu);
            }

            [WeakRetained addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
            uint64_t v44 = *(void *)(a1 + 32);
            if (v44) {
              (*(void (**)(void))(v44 + 16))();
            }
            uint64_t v26 = 0;
          }
LABEL_52:

          goto LABEL_53;
        }
        *(_DWORD *)buf = 136446978;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestSource.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 188;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = "BOOL _addFieldsToSuggestionsEntry(MapsSuggestionsEntry *__strong)";
        *(_WORD *)&buf[28] = 2082;
        *(void *)&buf[30] = "nil == (entry.geoMapItem)";
        id v32 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem to be set in advance";
      }
      else
      {
        uint64_t v31 = GEOFindOrCreateLog();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 136446978;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestSource.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 187;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = "BOOL _addFieldsToSuggestionsEntry(MapsSuggestionsEntry *__strong)";
        *(_WORD *)&buf[28] = 2082;
        *(void *)&buf[30] = "nil == (entry)";
        id v32 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry";
      }
      _os_log_impl(&dword_1A70DF000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x26u);
      goto LABEL_40;
    }
    GEOFindOrCreateLog();
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) name];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v29;
      _os_log_impl(&dword_1A70DF000, v28, OS_LOG_TYPE_DEBUG, "No budget left to suggest this RatingRequest : %@", buf, 0xCu);
    }
    [WeakRetained addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    __int16 v27 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v27, OS_LOG_TYPE_DEBUG, "Found no suitable MapItem to generate RatingRequest entry", buf, 2u);
    }

    [WeakRetained addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
  }
  uint64_t v30 = *(void *)(a1 + 32);
  if (v30) {
    (*(void (**)(void))(v30 + 16))();
  }
LABEL_53:
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_242(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_243;
    block[3] = &unk_1E5CBA648;
    id v14 = v6;
    id v15 = v5;
    long long v12 = *(_OWORD *)(a1 + 40);
    id v10 = (id)v12;
    long long v18 = v12;
    id v16 = *(id *)(a1 + 32);
    id v17 = v8;
    dispatch_async(v9, block);

    uint64_t v11 = v14;
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v20 = "MapsSuggestionsRatingRequestSource.mm";
      __int16 v21 = 1026;
      int v22 = 397;
      __int16 v23 = 2082;
      __int16 v24 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_243(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) || (int v7 = *(void **)(a1 + 40)) == 0)
  {
    GEOFindOrCreateLog();
    uint64_t v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void **)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 40);
      id v5 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) name];
      *(_DWORD *)buf = 138412802;
      id v19 = v4;
      __int16 v20 = 2112;
      uint64_t v21 = v3;
      __int16 v22 = 2112;
      __int16 v23 = v5;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_ERROR, "Error during the writing of the RatingRequest: %@ ; timeWritten: %@ ; for mapItem:%@",
        buf,
        0x20u);
    }
    uint64_t v6 = *(void *)(a1 + 64);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
  else
  {
    GEOConfigGetDouble();
    id v8 = objc_msgSend(v7, "dateByAddingTimeInterval:");
    [*(id *)(a1 + 48) setExpires:v8];

    uint64_t v9 = *(void **)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 48);
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    [v9 addOrUpdateMySuggestionEntries:v10];

    uint64_t v11 = [*(id *)(a1 + 48) uniqueIdentifier];
    long long v12 = GEOConfigGetString();
    id v13 = v12;
    if (!v12 || ([v12 isEqualToString:v11] & 1) == 0)
    {
      GEOFindOrCreateLog();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = [*(id *)(a1 + 48) title];
        *(_DWORD *)buf = 138412290;
        id v19 = v15;
        _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "We will spend budget on this new Entry: %@", buf, 0xCu);
      }
      [*(id *)(*(void *)(a1 + 56) + 48) spendNow];
      GEOConfigSetString();
    }
    uint64_t v16 = *(void *)(a1 + 64);
    if (v16) {
      (*(void (**)(void))(v16 + 16))();
    }
  }
}

- (id)readBudgetState
{
  return (id)MEMORY[0x1F411C088](GEOConfigMapsSuggestionsRollingWindowBudgetRuleState, off_1E96EF548);
}

- (void)writeBudgetState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budget, 0);
  objc_storeStrong((id *)&self->_routine, 0);
  objc_storeStrong((id *)&self->_mapsSync, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end