@interface MapsSuggestionsVirtualGarageSource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (MapsSuggestionsVirtualGarageSource)initWithVirtualGarage:(id)a3 delegate:(id)a4 name:(id)a5;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation MapsSuggestionsVirtualGarageSource

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

+ (unint64_t)disposition
{
  return 1;
}

- (MapsSuggestionsVirtualGarageSource)initWithVirtualGarage:(id)a3 delegate:(id)a4 name:(id)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MapsSuggestionsVirtualGarageSource;
  v10 = [(MapsSuggestionsBaseSource *)&v15 initWithDelegate:a4 name:a5];
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("MapsSuggestionsVirtualGarageSourceQueue", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_virtualGarage, a3);
  }

  return v10;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    dispatch_queue_t v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v15 = 136446978;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarageSource.m";
    __int16 v17 = 1024;
    int v18 = 61;
    __int16 v19 = 2082;
    v20 = "-[MapsSuggestionsVirtualGarageSource initFromResourceDepot:name:]";
    __int16 v21 = 2082;
    v22 = "nil == (resourceDepot)";
    v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!";
LABEL_11:
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x26u);
    goto LABEL_12;
  }
  v8 = [v6 oneSourceDelegate];

  if (!v8)
  {
    dispatch_queue_t v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v15 = 136446978;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarageSource.m";
    __int16 v17 = 1024;
    int v18 = 62;
    __int16 v19 = 2082;
    v20 = "-[MapsSuggestionsVirtualGarageSource initFromResourceDepot:name:]";
    __int16 v21 = 2082;
    v22 = "nil == (resourceDepot.oneSourceDelegate)";
    v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One SourceDelegate";
    goto LABEL_11;
  }
  if (!v7)
  {
    dispatch_queue_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarageSource.m";
      __int16 v17 = 1024;
      int v18 = 63;
      __int16 v19 = 2082;
      v20 = "-[MapsSuggestionsVirtualGarageSource initFromResourceDepot:name:]";
      __int16 v21 = 2082;
      v22 = "nil == (name)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name";
      goto LABEL_11;
    }
LABEL_12:

    v11 = 0;
    goto LABEL_13;
  }
  id v9 = [v6 oneVirtualGarage];
  v10 = [v6 oneSourceDelegate];
  self = [(MapsSuggestionsVirtualGarageSource *)self initWithVirtualGarage:v9 delegate:v10 name:v7];

  v11 = self;
LABEL_13:

  return v11;
}

- (void)start
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "start", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__MapsSuggestionsVirtualGarageSource_start__block_invoke;
  v5[3] = &unk_1E5CB7BE0;
  objc_copyWeak(&v6, buf);
  v5[4] = self;
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __43__MapsSuggestionsVirtualGarageSource_start__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] openConnection];
    [v3[3] registerObserver:*(void *)(a1 + 32)];
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsVirtualGarageSource.m";
      __int16 v7 = 1026;
      int v8 = 76;
      __int16 v9 = 2082;
      v10 = "-[MapsSuggestionsVirtualGarageSource start]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)stop
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "stop", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__MapsSuggestionsVirtualGarageSource_stop__block_invoke;
  v5[3] = &unk_1E5CB7BE0;
  objc_copyWeak(&v6, buf);
  v5[4] = self;
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __42__MapsSuggestionsVirtualGarageSource_stop__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] unregisterObserver:*(void *)(a1 + 32)];
    [v3[3] closeConnection];
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsVirtualGarageSource.m";
      __int16 v7 = 1026;
      int v8 = 88;
      __int16 v9 = 2082;
      v10 = "-[MapsSuggestionsVirtualGarageSource stop]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(MapsSuggestionsBaseSource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    __int16 v17 = v6;
    __int16 v18 = 2080;
    __int16 v19 = "updateSuggestionEntriesWithHandler";
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  __int16 v7 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__MapsSuggestionsVirtualGarageSource_updateSuggestionEntriesWithHandler___block_invoke;
  v13[3] = &unk_1E5CB8A98;
  objc_copyWeak(&v15, (id *)buf);
  id v9 = v4;
  id v14 = v9;
  dispatch_async(queue, v13);
  GEOConfigGetDouble();
  double v11 = v10;

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

  return v11;
}

void __73__MapsSuggestionsVirtualGarageSource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)*((void *)WeakRetained + 3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__MapsSuggestionsVirtualGarageSource_updateSuggestionEntriesWithHandler___block_invoke_135;
    v6[3] = &unk_1E5CB7F40;
    v6[4] = WeakRetained;
    id v7 = *(id *)(a1 + 32);
    [v4 entriesForUnpairedVehiclesWithHandler:v6];
  }
  else
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v9 = "MapsSuggestionsVirtualGarageSource.m";
      __int16 v10 = 1026;
      int v11 = 105;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsVirtualGarageSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __73__MapsSuggestionsVirtualGarageSource_updateSuggestionEntriesWithHandler___block_invoke_135(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!a2 || v5)
  {
    int v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "Error while creating Entries: %@", (uint8_t *)&v15, 0xCu);
    }

    [*(id *)(a1 + 32) addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = [*(id *)(a1 + 32) uniqueName];
      int v15 = 138412546;
      v16 = v14;
      __int16 v17 = 2080;
      __int16 v18 = "updateSuggestionEntriesWithHandler";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v15, 0x16u);
    }
    __int16 v10 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v15) = 0;
      goto LABEL_17;
    }
  }
  else
  {
    [*(id *)(a1 + 32) addOrUpdateMySuggestionEntries:a2];
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
    int v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [*(id *)(a1 + 32) uniqueName];
      int v15 = 138412546;
      v16 = v9;
      __int16 v17 = 2080;
      __int16 v18 = "updateSuggestionEntriesWithHandler";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v15, 0x16u);
    }
    __int16 v10 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v15) = 0;
LABEL_17:
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", (uint8_t *)&v15, 2u);
    }
  }
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 20;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_virtualGarage, 0);
}

@end