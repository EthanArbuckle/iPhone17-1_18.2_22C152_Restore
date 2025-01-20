@interface MapsSuggestionsRealEventKitConnector
- (BOOL)removeEvent:(id)a3 span:(int64_t)a4 error:(id *)a5;
- (MapsSuggestionsEventKitConnectorDelegate)delegate;
- (MapsSuggestionsRealEventKitConnector)init;
- (NSString)uniqueName;
- (id)calendarsForEntityType:(unint64_t)a3;
- (id)eventWithIdentifier:(id)a3;
- (id)eventsMatchingPredicate:(id)a3;
- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5;
- (id)visibleCalendars;
- (void)_eventStoreDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startListeningForChanges;
- (void)stopListeningForChanges;
@end

@implementation MapsSuggestionsRealEventKitConnector

- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[MapsSuggestionsSharedEventStore sharedEventStore];
  v11 = [v10 predicateForEventsWithStartDate:v9 endDate:v8 calendars:v7];

  return v11;
}

- (id)eventsMatchingPredicate:(id)a3
{
  id v3 = a3;
  v4 = +[MapsSuggestionsSharedEventStore sharedEventStore];
  v5 = [v4 eventsMatchingPredicate:v3];

  return v5;
}

- (id)visibleCalendars
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__MapsSuggestionsRealEventKitConnector_calVisibilityManager__block_invoke;
    block[3] = &unk_1E5CB8D10;
    block[4] = self;
    if (qword_1EB6F0298 != -1) {
      dispatch_once(&qword_1EB6F0298, block);
    }
    v2 = (void *)_MergedGlobals_41;
    if (_MergedGlobals_41)
    {
      id v3 = (id)_MergedGlobals_41;
    }
    else
    {
      v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        id v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealEventKitConnector.m";
        __int16 v10 = 1024;
        int v11 = 61;
        __int16 v12 = 2082;
        v13 = "-[MapsSuggestionsRealEventKitConnector calVisibilityManager]";
        __int16 v14 = 2082;
        v15 = "nil == (s_calVisibilityManager)";
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. EKCalendarVisibilityManager cannot be nil!", buf, 0x26u);
      }
    }
  }
  else
  {
    v2 = 0;
  }
  v5 = [v2 visibleCalendars];

  return v5;
}

void __61__MapsSuggestionsRealEventKitConnector__eventStoreDidChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[1]);
    id v3 = [(dispatch_queue_t *)v2 delegate];
    v4 = v3;
    if (v3)
    {
      [v3 eventKitDidChange:v2];
    }
    else
    {
      GEOFindOrCreateLog();
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136446722;
        id v7 = "MapsSuggestionsRealEventKitConnector.m";
        __int16 v8 = 1026;
        int v9 = 134;
        __int16 v10 = 2082;
        int v11 = "-[MapsSuggestionsRealEventKitConnector _q_eventStoreDidChange]";
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsRealEventKitConnector.m";
      __int16 v8 = 1026;
      int v9 = 125;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsRealEventKitConnector _eventStoreDidChange:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (MapsSuggestionsEventKitConnectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (MapsSuggestionsEventKitConnectorDelegate *)WeakRetained;
}

- (void)_eventStoreDidChange:(id)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__MapsSuggestionsRealEventKitConnector__eventStoreDidChange___block_invoke;
  v5[3] = &unk_1E5CB8058;
  objc_copyWeak(&v6, &location);
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)startListeningForChanges
{
  id v3 = +[MapsSuggestionsSharedEventStore sharedEventStore];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__eventStoreDidChange_ name:*MEMORY[0x1E4F25460] object:0];
}

- (MapsSuggestionsRealEventKitConnector)init
{
  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsRealEventKitConnector;
  v2 = [(MapsSuggestionsRealEventKitConnector *)&v7 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MapsSuggestionsRealEventKitConnectorQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

void __60__MapsSuggestionsRealEventKitConnector_calVisibilityManager__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, *(id *)(a1 + 32));
  GEOFindOrCreateLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [*(id *)(a1 + 32) uniqueName];
    *(_DWORD *)buf = 138412546;
    v20 = v3;
    __int16 v21 = 2080;
    v22 = "EKCalendarVisibilityManagerInit";
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  dispatch_queue_t v4 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EKCalendarVisibilityManagerInit", "", buf, 2u);
  }

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __60__MapsSuggestionsRealEventKitConnector_calVisibilityManager__block_invoke_10;
  uint64_t v16 = &unk_1E5CB8058;
  objc_copyWeak(&v17, &location);
  v5 = _Block_copy(&v13);
  id v6 = objc_alloc(MEMORY[0x1E4F254E8]);
  objc_super v7 = +[MapsSuggestionsSharedEventStore sharedEventStore];
  uint64_t v8 = [v6 initWithEventStore:v7 visibilityChangedCallback:v5 queue:*(void *)(*(void *)(a1 + 32) + 8)];
  int v9 = (void *)_MergedGlobals_41;
  _MergedGlobals_41 = v8;

  GEOFindOrCreateLog();
  __int16 v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = [*(id *)(a1 + 32) uniqueName];
    *(_DWORD *)buf = 138412546;
    v20 = v11;
    __int16 v21 = 2080;
    v22 = "EKCalendarVisibilityManagerInit";
    _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
  }
  uint64_t v12 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EKCalendarVisibilityManagerInit", "", buf, 2u);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __60__MapsSuggestionsRealEventKitConnector_calVisibilityManager__block_invoke_10(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = GEOFindOrCreateLog();
  id v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Received a visibility change callback from EKCalendarVisibilityManager", (uint8_t *)&v5, 2u);
    }

    [WeakRetained _eventStoreDidChange:0];
  }
  else
  {
    dispatch_queue_t v4 = v2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsRealEventKitConnector.m";
      __int16 v7 = 1026;
      int v8 = 50;
      __int16 v9 = 2082;
      __int16 v10 = "-[MapsSuggestionsRealEventKitConnector calVisibilityManager]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (id)calendarsForEntityType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v4 = +[MapsSuggestionsSharedEventStore sharedEventStore];

  if (v4)
  {
    int v5 = +[MapsSuggestionsSharedEventStore sharedEventStore];
    id v6 = [v5 calendarsForEntityType:a3];
  }
  else
  {
    __int16 v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446978;
      __int16 v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealEventKitConnector.m";
      __int16 v11 = 1024;
      int v12 = 75;
      __int16 v13 = 2082;
      uint64_t v14 = "-[MapsSuggestionsRealEventKitConnector calendarsForEntityType:]";
      __int16 v15 = 2082;
      uint64_t v16 = "nil == ([MapsSuggestionsSharedEventStore sharedEventStore])";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. EKEventStore cannot be nil!", (uint8_t *)&v9, 0x26u);
    }

    id v6 = 0;
  }
  return v6;
}

- (id)eventWithIdentifier:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = +[MapsSuggestionsSharedEventStore sharedEventStore];
  int v5 = [v4 eventWithIdentifier:v3];

  return v5;
}

- (BOOL)removeEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  int v8 = +[MapsSuggestionsSharedEventStore sharedEventStore];
  LOBYTE(a5) = [v8 removeEvent:v7 span:a4 error:a5];

  return (char)a5;
}

- (void)stopListeningForChanges
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F25460] object:0];
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end