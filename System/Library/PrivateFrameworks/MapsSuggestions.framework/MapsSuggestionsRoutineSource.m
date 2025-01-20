@interface MapsSuggestionsRoutineSource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (MapsSuggestionsRoutineSource)initWithRoutine:(id)a3 delegate:(id)a4 name:(id)a5;
- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (char)suggestionsEntriesAtLocation:(id)a3 period:(id)a4 handler:(id)a5;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id).cxx_construct;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (void)_q_updateSuggestionEntriesWithHandler:(uint64_t)a1;
- (void)dealloc;
- (void)start;
- (void)stop;
- (void)updatedParkedCar;
@end

@implementation MapsSuggestionsRoutineSource

void __67__MapsSuggestionsRoutineSource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)_q_updateSuggestionEntriesWithHandler:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (+[MapsSuggestionsSiri isEnabled]
      && !MapsSuggestionsIsInCoarseLocation())
    {
      GEOFindOrCreateLog();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = [(id)a1 uniqueName];
        v9 = NSStringFromMapsSuggestionsCurrentBestLocation();
        *(_DWORD *)buf = 138412802;
        v27 = v8;
        __int16 v28 = 2112;
        v29 = (const char *)@"ALL";
        __int16 v30 = 2112;
        v31 = v9;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);
      }
      id v10 = objc_alloc(MEMORY[0x1E4F28C18]);
      v11 = MapsSuggestionsNow();
      GEOConfigGetDouble();
      v12 = objc_msgSend(v10, "initWithStartDate:duration:", v11);

      v13 = MapsSuggestionsCurrentBestLocation();
      if (v13)
      {
        GEOFindOrCreateLog();
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v15 = [(id)a1 uniqueName];
          *(_DWORD *)buf = 138412546;
          v27 = v15;
          __int16 v28 = 2080;
          v29 = "_updateSuggestionEntries";
          _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
        }
        v16 = GEOFindOrCreateLog();
        if (os_signpost_enabled(v16))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A70DF000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_updateSuggestionEntries", "", buf, 2u);
        }

        objc_initWeak((id *)buf, (id)a1);
        v17 = *(void **)(a1 + 24);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __70__MapsSuggestionsRoutineSource__q_updateSuggestionEntriesWithHandler___block_invoke_179;
        v20[3] = &unk_1E5CB8E78;
        objc_copyWeak(&v22, (id *)buf);
        v21 = v3;
        [v17 fetchEntriesForLocation:v13 period:v12 handler:v20];

        objc_destroyWeak(&v22);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        }
        if (s_verbose)
        {
          GEOFindOrCreateLog();
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = [(id)a1 uniqueName];
            *(_DWORD *)buf = 138412290;
            v27 = v19;
            _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "%@ did not have a current location fix to query with.", buf, 0xCu);
          }
        }
        [(id)a1 addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
        if (v3) {
          v3[2](v3);
        }
      }
    }
    else
    {
      v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "User does not allow us to run.", buf, 2u);
      }

      objc_initWeak((id *)buf, (id)a1);
      v5 = *(void **)(a1 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__MapsSuggestionsRoutineSource__q_updateSuggestionEntriesWithHandler___block_invoke;
      block[3] = &unk_1E5CB84F0;
      v6 = v5;
      objc_copyWeak(&v25, (id *)buf);
      v24 = v3;
      dispatch_async(v6, block);

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  id v4 = a3;
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "updateSuggestionEntriesWithHandler", buf, 2u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__MapsSuggestionsRoutineSource_updateSuggestionEntriesWithHandler___block_invoke;
  v10[3] = &unk_1E5CBA878;
  id v6 = v4;
  id v11 = v6;
  MSg::Queue::async<MapsSuggestionsRoutineSource>((NSObject **)&self->_queue, self, v10);
  GEOConfigGetDouble();
  double v8 = v7;

  return v8;
}

void __70__MapsSuggestionsRoutineSource__q_updateSuggestionEntriesWithHandler___block_invoke_179(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v21[13] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v8 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138412290;
        v19 = v6;
        _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "Error while fetching entries: %@", (uint8_t *)&v18, 0xCu);
      }

      if (v5) {
        id v14 = v5;
      }
      else {
        id v14 = (id)MEMORY[0x1E4F1CBF0];
      }
      [v8 addOrUpdateMySuggestionEntries:v14];
      GEOFindOrCreateLog();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = [v8 uniqueName];
        int v18 = 138412546;
        v19 = v16;
        __int16 v20 = 2080;
        *(void *)v21 = "_updateSuggestionEntries";
        _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v18, 0x16u);
      }
      id v11 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v11))
      {
        LOWORD(v18) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateSuggestionEntries", "", (uint8_t *)&v18, 2u);
      }
    }
    else
    {
      [WeakRetained addOrUpdateMySuggestionEntries:v5];
      GEOFindOrCreateLog();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = [v8 uniqueName];
        int v18 = 138412546;
        v19 = v10;
        __int16 v20 = 2080;
        *(void *)v21 = "_updateSuggestionEntries";
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v18, 0x16u);
      }
      id v11 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v11))
      {
        LOWORD(v18) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateSuggestionEntries", "", (uint8_t *)&v18, 2u);
      }
    }

    uint64_t v17 = *(void *)(a1 + 32);
    if (v17) {
      (*(void (**)(void))(v17 + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446722;
      v19 = "MapsSuggestionsRoutineSource.mm";
      __int16 v20 = 1026;
      *(_DWORD *)v21 = 117;
      v21[2] = 2082;
      *(void *)&v21[3] = "-[MapsSuggestionsRoutineSource _q_updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v18, 0x1Cu);
    }
  }
}

- (void)start
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "start", v4, 2u);
  }

  [(MapsSuggestionsRoutine *)self->_routine addParkedCarObserver:self];
}

+ (unint64_t)disposition
{
  return 1;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (MapsSuggestionsRoutineSource)initWithRoutine:(id)a3 delegate:(id)a4 name:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MapsSuggestionsRoutineSource;
  id v11 = [(MapsSuggestionsBaseSource *)&v21 initWithDelegate:a4 name:v10];
  if (v11)
  {
    v12 = [v10 stringByAppendingFormat:@"Queue"];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue(&v19, v12, v13);
    dispatch_queue_t v14 = v19;
    dispatch_queue_t v19 = 0;
    innerQueue = v11->_queue._innerQueue;
    v11->_queue._innerQueue = (OS_dispatch_queue *)v14;

    v16 = v20;
    __int16 v20 = 0;
    name = v11->_queue._name;
    v11->_queue._name = v16;

    objc_storeStrong((id *)&v11->_routine, a3);
  }

  return v11;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineSource.mm";
      __int16 v17 = 1024;
      int v18 = 68;
      __int16 v19 = 2082;
      __int16 v20 = "-[MapsSuggestionsRoutineSource initFromResourceDepot:name:]";
      __int16 v21 = 2082;
      id v22 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!", (uint8_t *)&v15, 0x26u);
    }
    goto LABEL_13;
  }
  double v8 = [v6 oneSourceDelegate];

  if (!v8)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineSource.mm";
      __int16 v17 = 1024;
      int v18 = 69;
      __int16 v19 = 2082;
      __int16 v20 = "-[MapsSuggestionsRoutineSource initFromResourceDepot:name:]";
      __int16 v21 = 2082;
      id v22 = "nil == (resourceDepot.oneSourceDelegate)";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!", (uint8_t *)&v15, 0x26u);
    }
    goto LABEL_13;
  }
  id v9 = [v6 oneRoutine];

  if (!v9)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineSource.mm";
      __int16 v17 = 1024;
      int v18 = 70;
      __int16 v19 = 2082;
      __int16 v20 = "-[MapsSuggestionsRoutineSource initFromResourceDepot:name:]";
      __int16 v21 = 2082;
      id v22 = "nil == (resourceDepot.oneRoutine)";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Routine!", (uint8_t *)&v15, 0x26u);
    }
LABEL_13:

    v12 = 0;
    goto LABEL_14;
  }
  id v10 = [v6 oneRoutine];
  id v11 = [v6 oneSourceDelegate];
  self = [(MapsSuggestionsRoutineSource *)self initWithRoutine:v10 delegate:v11 name:v7];

  v12 = self;
LABEL_14:

  return v12;
}

- (void)dealloc
{
  [(MapsSuggestionsRoutine *)self->_routine removeParkedCarObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsRoutineSource;
  [(MapsSuggestionsRoutineSource *)&v3 dealloc];
}

void __70__MapsSuggestionsRoutineSource__q_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = WeakRetained;
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
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsRoutineSource.mm";
      __int16 v8 = 1026;
      int v9 = 90;
      __int16 v10 = 2082;
      id v11 = "-[MapsSuggestionsRoutineSource _q_updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)stop
{
  objc_super v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "stop", v4, 2u);
  }

  [(MapsSuggestionsRoutine *)self->_routine removeParkedCarObserver:self];
}

- (char)suggestionsEntriesAtLocation:(id)a3 period:(id)a4 handler:(id)a5
{
  return [(MapsSuggestionsRoutine *)self->_routine fetchEntriesForLocation:a3 period:a4 handler:a5];
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return [(MapsSuggestionsRoutine *)self->_routine canProduceEntriesOfType:a3];
}

- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = NSStringFromMapsSuggestionsRemovalBehavior(a4);
  if ([v8 type] == 7)
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v10;
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "About to %@ Parked Car entry in Source", buf, 0xCu);
    }

    if (a4 == 8)
    {
      uint64_t v13 = 0;
      goto LABEL_14;
    }
    char v12 = 0;
    if (a4 == 4)
    {
      uint64_t v13 = 1;
LABEL_14:
      [(MapsSuggestionsRoutine *)self->_routine removeParkedCarsAllowingFeature:v13 handler:v9];
LABEL_15:
      char v12 = 1;
    }
  }
  else
  {
    if (a4 == 4 && [v8 wasEverOfType:4])
    {
      GEOFindOrCreateLog();
      dispatch_queue_t v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v15 = [v8 uniqueIdentifier];
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = v10;
        __int16 v24 = 2112;
        id v25 = v15;
        _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "About to %@ FrequentLocation '%@' in the actual CR", buf, 0x16u);
      }
      routine = self->_routine;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __61__MapsSuggestionsRoutineSource_removeEntry_behavior_handler___block_invoke;
      v18[3] = &unk_1E5CBA8A0;
      id v19 = v10;
      id v20 = v8;
      id v21 = v9;
      [(MapsSuggestionsRoutine *)routine forgetLocationOfInterest:v20 handler:v18];

      goto LABEL_15;
    }
    char v12 = 0;
  }

  return v12;
}

void __61__MapsSuggestionsRoutineSource_removeEntry_behavior_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    GEOFindOrCreateLog();
    uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = [*(id *)(a1 + 40) uniqueIdentifier];
      int v10 = 138412802;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "Error during %@ of '%@': %@", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = [*(id *)(a1 + 40) uniqueIdentifier];
      int v10 = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Successful %@ of '%@'", (uint8_t *)&v10, 0x16u);
    }
  }

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

- (void)updatedParkedCar
{
}

void __48__MapsSuggestionsRoutineSource_updatedParkedCar__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void).cxx_destruct
{
  p_queue = &self->_queue;

  objc_storeStrong((id *)&self->_routine, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end