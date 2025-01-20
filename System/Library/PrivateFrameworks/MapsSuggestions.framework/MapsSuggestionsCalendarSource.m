@interface MapsSuggestionsCalendarSource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (BOOL)suggestionsEntriesAtLocation:(id)a3 period:(id)a4 handler:(id)a5;
- (MapsSuggestionsCalendarSource)initWithDelegate:(id)a3 eventKit:(id)a4 guardian:(id)a5 name:(id)a6;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (void)eventKitDidChange:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MapsSuggestionsCalendarSource

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [(MapsSuggestionsBaseSource *)self uniqueName];
    v7 = NSStringFromMapsSuggestionsCurrentBestLocation();
    *(_DWORD *)buf = 138412802;
    v41 = v6;
    __int16 v42 = 2112;
    v43 = (const char *)@"ALL";
    __int16 v44 = 2112;
    v45 = v7;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);
  }
  v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = [(MapsSuggestionsBaseSource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v41 = v9;
    __int16 v42 = 2080;
    v43 = "updateSuggestionEntries";
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  v10 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  if ([(MapsSuggestionsAppGuardian *)self->_guardian isBundleIDLocked:MapsSuggestionsCalendarAppBundleID forSource:self])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke;
    block[3] = &unk_1E5CB8A98;
    objc_copyWeak(&v39, (id *)buf);
    id v38 = v4;
    dispatch_async(queue, block);

    objc_destroyWeak(&v39);
LABEL_14:
    double v18 = 0.0;
    goto LABEL_23;
  }
  if (!+[MapsSuggestionsSiri canLearnFromBundleID:MapsSuggestionsCalendarAppBundleID])
  {
    v17 = self->_queue;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_555;
    v34[3] = &unk_1E5CB8A98;
    objc_copyWeak(&v36, (id *)buf);
    id v35 = v4;
    dispatch_async(v17, v34);

    objc_destroyWeak(&v36);
    goto LABEL_14;
  }
  v12 = MapsSuggestionsCurrentBestLocation();
  if (v12)
  {
    if (+[MapsSuggestionsSiri isEnabled])
    {
      v13 = self->_queue;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_558;
      v24[3] = &unk_1E5CB8A98;
      v14 = &v26;
      objc_copyWeak(&v26, (id *)buf);
      v15 = &v25;
      id v25 = v4;
      v16 = v24;
    }
    else
    {
      v22 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_DEBUG, "User turned off Siri: we're not using our suggestions", v33, 2u);
      }

      v13 = self->_queue;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_557;
      v27[3] = &unk_1E5CB8A98;
      v14 = &v29;
      objc_copyWeak(&v29, (id *)buf);
      v15 = &v28;
      id v28 = v4;
      v16 = v27;
    }
    dispatch_async(v13, v16);
    double v18 = 0.0;
  }
  else
  {
    v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "No current location to work with.", v33, 2u);
    }

    v20 = self->_queue;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_556;
    v30[3] = &unk_1E5CB8A98;
    v14 = &v32;
    objc_copyWeak(&v32, (id *)buf);
    id v31 = v4;
    dispatch_async(v20, v30);
    GEOConfigGetDouble();
    double v18 = v21;
    v15 = &v31;
  }

  objc_destroyWeak(v14);
LABEL_23:
  objc_destroyWeak((id *)buf);

  return v18;
}

void __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_558(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_559;
    double v18 = &unk_1E5CB7F40;
    id v19 = WeakRetained;
    id v20 = *(id *)(a1 + 32);
    id v4 = &v15;
    dispatch_assert_queue_V2(*((dispatch_queue_t *)v3 + 5));
    MapsSuggestionsCurrentBestLocation();
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    v6 = GEOFindOrCreateLog();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v5;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "Current Location: %@", buf, 0xCu);
      }

      GEOConfigGetDouble();
      v7 = MapsSuggestionsNowWithOffset(-v8);
      GEOConfigGetDouble();
      v10 = MapsSuggestionsNowWithOffset(v9);
      id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
      v12 = objc_msgSend(v11, "initWithStartDate:endDate:", v7, v10, v15, v16);
      if (([*((id *)v3 + 3) entriesForEventsAtLocation:v5 period:v12 fetchMapItems:1 handler:v4] & 1) == 0)
      {
        v13 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"Was not called back from MapsSuggestionsEventKit"];
        v17((uint64_t)v4, 0, v13);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
      __int16 v23 = 1024;
      int v24 = 115;
      __int16 v25 = 2082;
      id v26 = "-[MapsSuggestionsCalendarSource _q_updateSuggestionEntriesWithHandler:]";
      __int16 v27 = 2082;
      id v28 = "nil == (currentLocation)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This should never be called without current location", buf, 0x26u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v22 = "MapsSuggestionsCalendarSource.m";
      __int16 v23 = 1026;
      int v24 = 174;
      __int16 v25 = 2082;
      id v26 = "-[MapsSuggestionsCalendarSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_559(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      uint64_t v16 = v6;
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
      v14 = [*(id *)(a1 + 32) uniqueName];
      int v15 = 138412546;
      uint64_t v16 = v14;
      __int16 v17 = 2080;
      double v18 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v15, 0x16u);
    }
    v10 = GEOFindOrCreateLog();
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
    double v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      double v9 = [*(id *)(a1 + 32) uniqueName];
      int v15 = 138412546;
      uint64_t v16 = v9;
      __int16 v17 = 2080;
      double v18 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v15, 0x16u);
    }
    v10 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v15) = 0;
LABEL_17:
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", "", (uint8_t *)&v15, 2u);
    }
  }
}

void __38__MapsSuggestionsCalendarSource_start__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[5]);
    [(dispatch_queue_t *)v2 updateSuggestionEntriesWithHandler:0];
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsCalendarSource.m";
      __int16 v6 = 1026;
      int v7 = 91;
      __int16 v8 = 2082;
      double v9 = "-[MapsSuggestionsCalendarSource start]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)start
{
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "start, adding self observer for EKEventStoreChangedNotification", (uint8_t *)buf, 2u);
  }

  [(MapsSuggestionsEventKit *)self->_eventKit registerObserver:self];
  [(MapsSuggestionsAppGuardian *)self->_guardian registerBundleID:MapsSuggestionsCalendarAppBundleID withSource:self];
  objc_initWeak(buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MapsSuggestionsCalendarSource_start__block_invoke;
  block[3] = &unk_1E5CB8058;
  objc_copyWeak(&v6, buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

+ (unint64_t)disposition
{
  return 2;
}

- (MapsSuggestionsCalendarSource)initWithDelegate:(id)a3 eventKit:(id)a4 guardian:(id)a5 name:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MapsSuggestionsCalendarSource;
  v13 = [(MapsSuggestionsBaseSource *)&v18 initWithDelegate:a3 name:a6];
  if (v13)
  {
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("MapsSuggestionsCalendarSourceQueue", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_eventKit, a4);
    objc_storeStrong((id *)&v13->_guardian, a5);
  }

  return v13;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v17 = 136446978;
    objc_super v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
    __int16 v19 = 1024;
    int v20 = 62;
    __int16 v21 = 2082;
    v22 = "-[MapsSuggestionsCalendarSource initFromResourceDepot:name:]";
    __int16 v23 = 2082;
    int v24 = "nil == (resourceDepot)";
    dispatch_queue_t v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_11:
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0x26u);
    goto LABEL_12;
  }
  __int16 v8 = [v6 oneSourceDelegate];

  if (!v8)
  {
    v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v17 = 136446978;
    objc_super v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
    __int16 v19 = 1024;
    int v20 = 63;
    __int16 v21 = 2082;
    v22 = "-[MapsSuggestionsCalendarSource initFromResourceDepot:name:]";
    __int16 v23 = 2082;
    int v24 = "nil == (resourceDepot.oneSourceDelegate)";
    dispatch_queue_t v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!";
    goto LABEL_11;
  }
  double v9 = [v6 oneEventKit];

  if (!v9)
  {
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446978;
      objc_super v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
      __int16 v19 = 1024;
      int v20 = 64;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsCalendarSource initFromResourceDepot:name:]";
      __int16 v23 = 2082;
      int v24 = "nil == (resourceDepot.oneEventKit)";
      dispatch_queue_t v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one EventKit!";
      goto LABEL_11;
    }
LABEL_12:

    v13 = 0;
    goto LABEL_13;
  }
  uint64_t v10 = [v6 oneSourceDelegate];
  id v11 = [v6 oneEventKit];
  id v12 = [v6 oneAppGuardian];
  self = [(MapsSuggestionsCalendarSource *)self initWithDelegate:v10 eventKit:v11 guardian:v12 name:v7];

  v13 = self;
LABEL_13:

  return v13;
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
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "stop, removing self as observer for EKEventStoreChangedNotification", v4, 2u);
  }

  [(MapsSuggestionsAppGuardian *)self->_guardian unregisterBundleID:MapsSuggestionsCalendarAppBundleID withSource:self];
  [(MapsSuggestionsEventKit *)self->_eventKit unregisterObserver:self];
}

void __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
{
  *(void *)&v11[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [v3 uniqueName];
      int v8 = 138412546;
      double v9 = v6;
      __int16 v10 = 2080;
      *(void *)id v11 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
    }
    id v7 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", "", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      double v9 = "MapsSuggestionsCalendarSource.m";
      __int16 v10 = 1026;
      *(_DWORD *)id v11 = 154;
      v11[2] = 2082;
      *(void *)&v11[3] = "-[MapsSuggestionsCalendarSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

void __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_555(uint64_t a1)
{
  *(void *)&v11[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [v3 uniqueName];
      int v8 = 138412546;
      double v9 = v6;
      __int16 v10 = 2080;
      *(void *)id v11 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
    }
    id v7 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", "", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      double v9 = "MapsSuggestionsCalendarSource.m";
      __int16 v10 = 1026;
      *(_DWORD *)id v11 = 158;
      v11[2] = 2082;
      *(void *)&v11[3] = "-[MapsSuggestionsCalendarSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

void __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_556(uint64_t a1)
{
  *(void *)&v11[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [v3 uniqueName];
      int v8 = 138412546;
      double v9 = v6;
      __int16 v10 = 2080;
      *(void *)id v11 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
    }
    id v7 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", "", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      double v9 = "MapsSuggestionsCalendarSource.m";
      __int16 v10 = 1026;
      *(_DWORD *)id v11 = 164;
      v11[2] = 2082;
      *(void *)&v11[3] = "-[MapsSuggestionsCalendarSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

void __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_557(uint64_t a1)
{
  *(void *)&v11[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained addOrUpdateMySuggestionEntries:MEMORY[0x1E4F1CBF0]];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [v3 uniqueName];
      int v8 = 138412546;
      double v9 = v6;
      __int16 v10 = 2080;
      *(void *)id v11 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
    }
    id v7 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", "", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      double v9 = "MapsSuggestionsCalendarSource.m";
      __int16 v10 = 1026;
      *(_DWORD *)id v11 = 170;
      v11[2] = 2082;
      *(void *)&v11[3] = "-[MapsSuggestionsCalendarSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (BOOL)suggestionsEntriesAtLocation:(id)a3 period:(id)a4 handler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v8)
  {
    v13 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v16 = 136446978;
    int v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
    __int16 v18 = 1024;
    int v19 = 196;
    __int16 v20 = 2082;
    __int16 v21 = "-[MapsSuggestionsCalendarSource suggestionsEntriesAtLocation:period:handler:]";
    __int16 v22 = 2082;
    __int16 v23 = "nil == (location)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location";
LABEL_11:
    _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    goto LABEL_12;
  }
  if (!v9)
  {
    v13 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v16 = 136446978;
    int v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
    __int16 v18 = 1024;
    int v19 = 197;
    __int16 v20 = 2082;
    __int16 v21 = "-[MapsSuggestionsCalendarSource suggestionsEntriesAtLocation:period:handler:]";
    __int16 v22 = 2082;
    __int16 v23 = "nil == (period)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a period";
    goto LABEL_11;
  }
  if (!v10)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
      __int16 v18 = 1024;
      int v19 = 198;
      __int16 v20 = 2082;
      __int16 v21 = "-[MapsSuggestionsCalendarSource suggestionsEntriesAtLocation:period:handler:]";
      __int16 v22 = 2082;
      __int16 v23 = "nil == (handler)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler";
      goto LABEL_11;
    }
LABEL_12:

    BOOL v12 = 0;
    goto LABEL_13;
  }
  BOOL v12 = [(MapsSuggestionsEventKit *)self->_eventKit entriesForEventsAtLocation:v8 period:v9 fetchMapItems:1 handler:v10];
LABEL_13:

  return v12;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return [(MapsSuggestionsEventKit *)self->_eventKit canProduceEntriesOfType:a3];
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446978;
      dispatch_queue_t v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
      __int16 v16 = 1024;
      int v17 = 215;
      __int16 v18 = 2082;
      int v19 = "-[MapsSuggestionsCalendarSource removeEntry:behavior:handler:]";
      __int16 v20 = 2082;
      __int16 v21 = "nil == (handler)";
      BOOL v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. handler cannot be nil";
LABEL_9:
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 0x26u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (!v8)
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446978;
      dispatch_queue_t v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
      __int16 v16 = 1024;
      int v17 = 216;
      __int16 v18 = 2082;
      int v19 = "-[MapsSuggestionsCalendarSource removeEntry:behavior:handler:]";
      __int16 v20 = 2082;
      __int16 v21 = "nil == (entry)";
      BOOL v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (a4 != 8)
  {
LABEL_11:
    BOOL v10 = 0;
    goto LABEL_12;
  }
  BOOL v10 = [(MapsSuggestionsEventKit *)self->_eventKit deleteOrDeclineEntry:v8 handler:v9];
LABEL_12:

  return v10;
}

- (void)eventKitDidChange:(id)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__MapsSuggestionsCalendarSource_eventKitDidChange___block_invoke;
  v5[3] = &unk_1E5CB8058;
  objc_copyWeak(&v6, &location);
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __51__MapsSuggestionsCalendarSource_eventKitDidChange___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = GEOFindOrCreateLog();
  id v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Reloading because of detected change", (uint8_t *)&v5, 2u);
    }

    dispatch_assert_queue_V2(WeakRetained[5]);
    [(dispatch_queue_t *)WeakRetained updateSuggestionEntriesWithHandler:0];
  }
  else
  {
    uint64_t v4 = v2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsCalendarSource.m";
      __int16 v7 = 1026;
      int v8 = 233;
      __int16 v9 = 2082;
      BOOL v10 = "-[MapsSuggestionsCalendarSource eventKitDidChange:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_guardian, 0);
  objc_storeStrong((id *)&self->_eventKit, 0);
}

@end