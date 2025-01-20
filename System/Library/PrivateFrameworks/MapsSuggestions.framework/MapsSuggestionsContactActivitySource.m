@interface MapsSuggestionsContactActivitySource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (MapsSuggestionsContactActivitySource)initWithContactActivity:(id)a3 delegate:(id)a4 guardian:(id)a5 name:(id)a6;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (void)contactActivityUpdated;
- (void)start;
- (void)stop;
@end

@implementation MapsSuggestionsContactActivitySource

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void))a3;
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [(MapsSuggestionsBaseSource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v24 = v6;
    __int16 v25 = 2080;
    v26 = "updateSuggestionEntriesWithHandler";
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  v7 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", buf, 2u);
  }

  if (!+[MapsSuggestionsSiri isEnabled])
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_INFO, "Siri is not enabled. Returning.", buf, 2u);
    }

    [(MapsSuggestionsBaseSource *)self addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
    if (v4) {
      v4[2](v4);
    }
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = [(MapsSuggestionsBaseSource *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      v24 = v14;
      __int16 v25 = 2080;
      v26 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    v11 = GEOFindOrCreateLog();
    if (!os_signpost_enabled(v11)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    goto LABEL_33;
  }
  if ([(MapsSuggestionsAppGuardian *)self->_guardian isBundleIDLocked:MapsSuggestionsFindMyAppBundleID forSource:self])
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_INFO, "App is locked. Returning.", buf, 2u);
    }

    [(MapsSuggestionsBaseSource *)self addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
    if (v4) {
      v4[2](v4);
    }
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = [(MapsSuggestionsBaseSource *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      __int16 v25 = 2080;
      v26 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    v11 = GEOFindOrCreateLog();
    if (!os_signpost_enabled(v11)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
LABEL_33:
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", "", buf, 2u);
LABEL_34:

    goto LABEL_35;
  }
  if (!+[MapsSuggestionsSiri canLearnFromBundleID:MapsSuggestionsFindMyAppBundleID])
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_INFO, "App prevents us from Learning. Returning.", buf, 2u);
    }

    [(MapsSuggestionsBaseSource *)self addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
    if (v4) {
      v4[2](v4);
    }
    v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = [(MapsSuggestionsBaseSource *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      v24 = v18;
      __int16 v25 = 2080;
      v26 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    v11 = GEOFindOrCreateLog();
    if (!os_signpost_enabled(v11)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    goto LABEL_33;
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__MapsSuggestionsContactActivitySource_updateSuggestionEntriesWithHandler___block_invoke;
  block[3] = &unk_1E5CB8930;
  objc_copyWeak(&v22, (id *)buf);
  block[4] = self;
  v21 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
LABEL_35:

  return 0.0;
}

void __75__MapsSuggestionsContactActivitySource_updateSuggestionEntriesWithHandler___block_invoke_548(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v24[13] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = [v6 localizedDescription];
        int v21 = 138412290;
        id v22 = v9;
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "Received an error inside contactActivityEntriesWith: %@", (uint8_t *)&v21, 0xCu);
      }
      v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = [*(id *)(a1 + 32) uniqueName];
        int v21 = 138412546;
        id v22 = v11;
        __int16 v23 = 2080;
        *(void *)v24 = "updateSuggestionEntriesWithHandler";
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v21, 0x16u);
      }
      v12 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v12))
      {
        LOWORD(v21) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", (uint8_t *)&v21, 2u);
      }
    }
    v13 = (void *)MEMORY[0x1E4F1CBF0];
    if (v5) {
      v13 = v5;
    }
    v14 = v13;
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromMapsSuggestionsEntries(v14);
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      int v21 = 138412290;
      id v22 = v16;
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "Sending: %@", (uint8_t *)&v21, 0xCu);
    }
    [WeakRetained addOrUpdateMySuggestionEntries:v14];
    v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = [WeakRetained uniqueName];
      int v21 = 138412546;
      id v22 = v18;
      __int16 v23 = 2080;
      *(void *)v24 = "updateSuggestionEntriesWithHandler";
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v21, 0x16u);
    }
    v19 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v19))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", (uint8_t *)&v21, 2u);
    }

    uint64_t v20 = *(void *)(a1 + 40);
    if (v20) {
      (*(void (**)(void))(v20 + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136446722;
      id v22 = "MapsSuggestionsContactActivitySource.m";
      __int16 v23 = 1026;
      *(_DWORD *)v24 = 117;
      v24[2] = 2082;
      *(void *)&v24[3] = "-[MapsSuggestionsContactActivitySource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v21, 0x1Cu);
    }
  }
}

void __75__MapsSuggestionsContactActivitySource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = GEOFindOrCreateLog();
  id v5 = v4;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [WeakRetained uniqueName];
      v7 = NSStringFromMapsSuggestionsCurrentBestLocation();
      *(_DWORD *)buf = 138412802;
      v15 = v6;
      __int16 v16 = 2112;
      *(void *)v17 = @"ALL";
      *(_WORD *)&v17[8] = 2112;
      *(void *)&v17[10] = v7;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);
    }
    v8 = (void *)WeakRetained[3];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__MapsSuggestionsContactActivitySource_updateSuggestionEntriesWithHandler___block_invoke_548;
    v11[3] = &unk_1E5CB9200;
    objc_copyWeak(&v13, v2);
    v9 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v9;
    [v8 contactActivityEntriesWith:v11];

    objc_destroyWeak(&v13);
  }
  else
  {
    v10 = v4;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v15 = "MapsSuggestionsContactActivitySource.m";
      __int16 v16 = 1026;
      *(_DWORD *)v17 = 113;
      *(_WORD *)&v17[4] = 2082;
      *(void *)&v17[6] = "-[MapsSuggestionsContactActivitySource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)start
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "start", v4, 2u);
  }

  [(MapsSuggestionsAppGuardian *)self->_guardian registerBundleID:MapsSuggestionsFindMyAppBundleID withSource:self];
}

+ (unint64_t)disposition
{
  return 2;
}

- (MapsSuggestionsContactActivitySource)initWithContactActivity:(id)a3 delegate:(id)a4 guardian:(id)a5 name:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MapsSuggestionsContactActivitySource;
  id v13 = [(MapsSuggestionsBaseSource *)&v18 initWithDelegate:a4 name:a6];
  if (v13)
  {
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("MapsSuggestionsContactActivitySource", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_contactActivity, a3);
    [(MapsSuggestionsContactActivity *)v13->_contactActivity setContactActivityDelegate:v13];
    objc_storeStrong((id *)&v13->_guardian, a5);
  }

  return v13;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContactActivitySource.m";
      __int16 v18 = 1024;
      int v19 = 49;
      __int16 v20 = 2082;
      int v21 = "-[MapsSuggestionsContactActivitySource initFromResourceDepot:name:]";
      __int16 v22 = 2082;
      __int16 v23 = "nil == (resourceDepot)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    }
LABEL_9:

    id v12 = 0;
    goto LABEL_10;
  }
  v8 = [v6 oneContactActivity];

  if (!v8)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContactActivitySource.m";
      __int16 v18 = 1024;
      int v19 = 50;
      __int16 v20 = 2082;
      int v21 = "-[MapsSuggestionsContactActivitySource initFromResourceDepot:name:]";
      __int16 v22 = 2082;
      __int16 v23 = "nil == (resourceDepot.oneContactActivity)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one ContactActivity!";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v9 = [v6 oneContactActivity];
  v10 = [v6 oneSourceDelegate];
  id v11 = [v6 oneAppGuardian];
  self = [(MapsSuggestionsContactActivitySource *)self initWithContactActivity:v9 delegate:v10 guardian:v11 name:v7];

  id v12 = self;
LABEL_10:

  return v12;
}

+ (BOOL)isEnabled
{
  int BOOL = GEOConfigGetBOOL();
  if (BOOL)
  {
    LOBYTE(BOOL) = MEMORY[0x1F411C4D0]();
  }
  return BOOL;
}

- (void)stop
{
  [(MapsSuggestionsAppGuardian *)self->_guardian unregisterBundleID:MapsSuggestionsFindMyAppBundleID withSource:self];
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "stop", v3, 2u);
  }
}

- (void)contactActivityUpdated
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_INFO, "Received a real-time update from Biome. New SmartReplies/FindMy activity. Checking with Biome.", v4, 2u);
  }

  [(MapsSuggestionsContactActivitySource *)self updateSuggestionEntriesWithHandler:0];
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 24;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guardian, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_contactActivity, 0);
}

@end