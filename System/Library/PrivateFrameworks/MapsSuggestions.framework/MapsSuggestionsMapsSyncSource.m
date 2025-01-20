@interface MapsSuggestionsMapsSyncSource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (MapsSuggestionsMapsSyncSource)initWithMapsSync:(id)a3 delegate:(id)a4 name:(id)a5;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (void)_q_updateRecentHistoryEntriesWithHandler:(uint64_t)a1;
- (void)awaitQueue;
- (void)mapsSync:(id)a3 didChangeForContentType:(int64_t)a4;
- (void)start;
- (void)stop;
@end

@implementation MapsSuggestionsMapsSyncSource

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [(MapsSuggestionsBaseSource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v15 = v6;
    __int16 v16 = 2080;
    v17 = "updateSuggestionEntries";
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  v7 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__MapsSuggestionsMapsSyncSource_updateSuggestionEntriesWithHandler___block_invoke;
  v11[3] = &unk_1E5CB8A98;
  objc_copyWeak(&v13, (id *)buf);
  id v12 = v4;
  id v9 = v4;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
  return 0.0;
}

void __68__MapsSuggestionsMapsSyncSource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
{
  *(void *)&v10[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsMapsSyncSource _q_updateRecentHistoryEntriesWithHandler:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = [v3 uniqueName];
      int v7 = 138412546;
      v8 = v5;
      __int16 v9 = 2080;
      *(void *)v10 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v7, 0x16u);
    }
    v6 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v6))
    {
      LOWORD(v7) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", "", (uint8_t *)&v7, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      v8 = "MapsSuggestionsMapsSyncSource.m";
      __int16 v9 = 1026;
      *(_DWORD *)v10 = 113;
      v10[2] = 2082;
      *(void *)&v10[3] = "-[MapsSuggestionsMapsSyncSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)_q_updateRecentHistoryEntriesWithHandler:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = [(id)a1 uniqueName];
    v6 = NSStringFromMapsSuggestionsEntryType(5uLL);
    int v7 = NSStringFromMapsSuggestionsCurrentBestLocation();
    *(_DWORD *)buf = 138412802;
    __int16 v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    __int16 v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);
  }
  objc_initWeak((id *)buf, (id)a1);
  v8 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__MapsSuggestionsMapsSyncSource__q_updateRecentHistoryEntriesWithHandler___block_invoke;
  v12[3] = &unk_1E5CB8C98;
  objc_copyWeak(&v14, (id *)buf);
  __int16 v9 = (void (**)(void))v3;
  id v13 = v9;
  if (([v8 entriesFromHistoryWithHandler:v12] & 1) == 0)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "MapsSuggestionsMapsSync did not call back?", v11, 2u);
    }

    [(id)a1 addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
    if (v9) {
      v9[2](v9);
    }
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __74__MapsSuggestionsMapsSyncSource__q_updateRecentHistoryEntriesWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = GEOFindOrCreateLog();
  __int16 v9 = v8;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v10 = [v5 count];
      v11 = &stru_1EFC640F8;
      if (v6) {
        v11 = v6;
      }
      int v15 = 67109378;
      *(_DWORD *)__int16 v16 = v10;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v11;
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "Received %u entries%@", (uint8_t *)&v15, 0x12u);
    }

    id v12 = (void *)[v5 copy];
    [WeakRetained addOrUpdateMySuggestionEntries:v12];

    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      (*(void (**)(void))(v13 + 16))();
    }
  }
  else
  {
    id v14 = v8;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446722;
      *(void *)__int16 v16 = "MapsSuggestionsMapsSyncSource.m";
      *(_WORD *)&v16[8] = 1026;
      *(_DWORD *)&v16[10] = 197;
      __int16 v17 = 2082;
      uint64_t v18 = "-[MapsSuggestionsMapsSyncSource _q_updateRecentHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)start
{
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "start", v4, 2u);
  }

  [(MapsSuggestionsMapsSync *)self->_mapsSync addMapsSyncObserver:self forContentType:1];
  [(MapsSuggestionsMapsSyncSource *)self updateSuggestionEntriesWithHandler:0];
}

+ (unint64_t)disposition
{
  return 2;
}

- (MapsSuggestionsMapsSyncSource)initWithMapsSync:(id)a3 delegate:(id)a4 name:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (v9)
  {
    v17.receiver = self;
    v17.super_class = (Class)MapsSuggestionsMapsSyncSource;
    int v10 = [(MapsSuggestionsBaseSource *)&v17 initWithDelegate:a4 name:a5];
    if (v10)
    {
      v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v12 = dispatch_queue_create("MapsSuggestionsMapsSyncSourceQueue", v11);
      queue = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)v12;

      objc_storeStrong((id *)&v10->_mapsSync, a3);
    }
    self = v10;
    id v14 = self;
  }
  else
  {
    int v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
      __int16 v20 = 1024;
      int v21 = 59;
      __int16 v22 = 2082;
      v23 = "-[MapsSuggestionsMapsSyncSource initWithMapsSync:delegate:name:]";
      __int16 v24 = 2082;
      v25 = "nil == (mapsSync)";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This version requires a MapsSync", buf, 0x26u);
    }

    id v14 = 0;
  }

  return v14;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v13 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v16 = 136446978;
    objc_super v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
    __int16 v18 = 1024;
    int v19 = 76;
    __int16 v20 = 2082;
    int v21 = "-[MapsSuggestionsMapsSyncSource initFromResourceDepot:name:]";
    __int16 v22 = 2082;
    v23 = "nil == (resourceDepot)";
    id v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_11:
    _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    goto LABEL_12;
  }
  v8 = [v6 oneSourceDelegate];

  if (!v8)
  {
    uint64_t v13 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v16 = 136446978;
    objc_super v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
    __int16 v18 = 1024;
    int v19 = 77;
    __int16 v20 = 2082;
    int v21 = "-[MapsSuggestionsMapsSyncSource initFromResourceDepot:name:]";
    __int16 v22 = 2082;
    v23 = "nil == (resourceDepot.oneSourceDelegate)";
    id v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!";
    goto LABEL_11;
  }
  id v9 = [v6 oneMapsSync];

  if (!v9)
  {
    uint64_t v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      objc_super v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
      __int16 v18 = 1024;
      int v19 = 78;
      __int16 v20 = 2082;
      int v21 = "-[MapsSuggestionsMapsSyncSource initFromResourceDepot:name:]";
      __int16 v22 = 2082;
      v23 = "nil == (resourceDepot.oneMapsSync)";
      id v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one MapsSync!";
      goto LABEL_11;
    }
LABEL_12:

    dispatch_queue_t v12 = 0;
    goto LABEL_13;
  }
  int v10 = [v6 oneMapsSync];
  v11 = [v6 oneSourceDelegate];
  self = [(MapsSuggestionsMapsSyncSource *)self initWithMapsSync:v10 delegate:v11 name:v7];

  dispatch_queue_t v12 = self;
LABEL_13:

  return v12;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void)stop
{
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "stop", v4, 2u);
  }

  [(MapsSuggestionsMapsSync *)self->_mapsSync removeMapsSyncObserver:self forContentType:1];
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 >= 0x19)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
      __int16 v8 = 1024;
      int v9 = 156;
      __int16 v10 = 2082;
      v11 = "-[MapsSuggestionsMapsSyncSource canProduceEntriesOfType:]";
      __int16 v12 = 2082;
      uint64_t v13 = "YES";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v6, 0x26u);
    }

    LOBYTE(v3) = 0;
  }
  else
  {
    return (0x820u >> a3) & 1;
  }
  return v3;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "removeEntry", buf, 2u);
  }

  if (!v9)
  {
    uint64_t v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      int v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
      __int16 v20 = 1024;
      int v21 = 165;
      __int16 v22 = 2082;
      v23 = "-[MapsSuggestionsMapsSyncSource removeEntry:behavior:handler:]";
      __int16 v24 = 2082;
      v25 = "nil == (handler)";
      uint64_t v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. handler cannot be nil";
LABEL_13:
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x26u);
    }
LABEL_14:
    char v12 = 0;
    goto LABEL_15;
  }
  if (!v8)
  {
    uint64_t v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      int v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
      __int16 v20 = 1024;
      int v21 = 166;
      __int16 v22 = 2082;
      v23 = "-[MapsSuggestionsMapsSyncSource removeEntry:behavior:handler:]";
      __int16 v24 = 2082;
      v25 = "nil == (entry)";
      uint64_t v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (a4 == 8
    && -[MapsSuggestionsMapsSyncSource canProduceEntriesOfType:](self, "canProduceEntriesOfType:", [v8 type]))
  {
    mapsSync = self->_mapsSync;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__MapsSuggestionsMapsSyncSource_removeEntry_behavior_handler___block_invoke;
    v16[3] = &unk_1E5CB8FB0;
    objc_super v17 = v9;
    char v12 = [(MapsSuggestionsMapsSync *)mapsSync deleteEntry:v8 handler:v16];
    uint64_t v13 = v17;
LABEL_15:

    goto LABEL_16;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

void __62__MapsSuggestionsMapsSyncSource_removeEntry_behavior_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "Deleted with error: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)mapsSync:(id)a3 didChangeForContentType:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = GEOFindOrCreateLog();
  uint64_t v7 = v6;
  if (a4 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "Detected changes in MapsSuggestionsMapsSyncTypeHistory", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__MapsSuggestionsMapsSyncSource_mapsSync_didChangeForContentType___block_invoke;
    block[3] = &unk_1E5CB8058;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      char v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
      __int16 v13 = 1024;
      int v14 = 215;
      __int16 v15 = 2082;
      int v16 = "-[MapsSuggestionsMapsSyncSource mapsSync:didChangeForContentType:]";
      __int16 v17 = 2082;
      __int16 v18 = "MapsSuggestionsMapsSyncTypeHistory != type";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. We shouldn't get changes we're not interested in", buf, 0x26u);
    }
  }
}

void __66__MapsSuggestionsMapsSyncSource_mapsSync_didChangeForContentType___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsMapsSyncSource _q_updateRecentHistoryEntriesWithHandler:]((uint64_t)WeakRetained, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      int v5 = "MapsSuggestionsMapsSyncSource.m";
      __int16 v6 = 1026;
      int v7 = 221;
      __int16 v8 = 2082;
      id v9 = "-[MapsSuggestionsMapsSyncSource mapsSync:didChangeForContentType:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)awaitQueue
{
}

void __43__MapsSuggestionsMapsSyncSource_awaitQueue__block_invoke()
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsSync, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end