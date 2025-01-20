@interface MapsSuggestionsVisitMonitor
- (BOOL)isInVisit;
- (CLVisit)latestVisit;
- (MapsSuggestionsCondition)isInVisitCondition;
- (MapsSuggestionsTrigger)onEnterTrigger;
- (MapsSuggestionsTrigger)onExitTrigger;
- (MapsSuggestionsVisitMonitor)initWithLocationUpdater:(id)a3 startInVisit:(BOOL)a4;
- (NSString)uniqueName;
- (void)didEnterVisit:(id)a3;
- (void)didLeaveVisit:(id)a3;
- (void)didLoseLocationPermission;
- (void)didUpdateLocation:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation MapsSuggestionsVisitMonitor

- (void)didUpdateLocation:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 136315394;
      v6 = "-[MapsSuggestionsVisitMonitor didUpdateLocation:]";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (MapsSuggestionsVisitMonitor)initWithLocationUpdater:(id)a3 startInVisit:(BOOL)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    v22.receiver = self;
    v22.super_class = (Class)MapsSuggestionsVisitMonitor;
    id v8 = [(MapsSuggestionsVisitMonitor *)&v22 init];
    uint64_t v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_locationUpdater, a3);
      latestVisit = v9->_latestVisit;
      v9->_latestVisit = 0;

      v9->_isInVisit = a4;
      objc_initWeak((id *)location, v9);
      v11 = [[MapsSuggestionsSimpleTrigger alloc] initWithName:@"onVisitEnter"];
      onEnterTrigger = v9->_onEnterTrigger;
      v9->_onEnterTrigger = v11;

      v13 = [[MapsSuggestionsSimpleTrigger alloc] initWithName:@"onVisitExit"];
      onExitTrigger = v9->_onExitTrigger;
      v9->_onExitTrigger = v13;

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __68__MapsSuggestionsVisitMonitor_initWithLocationUpdater_startInVisit___block_invoke;
      v20[3] = &unk_1E5CB9520;
      objc_copyWeak(&v21, (id *)location);
      uint64_t v15 = MapsSuggestionsCondition(@"isInVisit", v20);
      isInVisitCondition = v9->_isInVisitCondition;
      v9->_isInVisitCondition = (MapsSuggestionsBlockCondition *)v15;

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)location);
    }
    self = v9;
    v17 = self;
  }
  else
  {
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVisitMonitor.m";
      __int16 v24 = 1024;
      int v25 = 40;
      __int16 v26 = 2082;
      v27 = "-[MapsSuggestionsVisitMonitor initWithLocationUpdater:startInVisit:]";
      __int16 v28 = 2082;
      v29 = "nil == (locationUpdater)";
      _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location updater", location, 0x26u);
    }

    v17 = 0;
  }

  return v17;
}

uint64_t __68__MapsSuggestionsVisitMonitor_initWithLocationUpdater_startInVisit___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained isInVisit];
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsVisitMonitor.m";
      __int16 v8 = 1026;
      int v9 = 53;
      __int16 v10 = 2082;
      v11 = "-[MapsSuggestionsVisitMonitor initWithLocationUpdater:startInVisit:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

    uint64_t v3 = 0;
  }

  return v3;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (CLVisit)latestVisit
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_latestVisit;
  objc_sync_exit(v2);

  return v3;
}

- (void)startMonitoring
{
  id v2 = (id)[(MapsSuggestionsLocationUpdater *)self->_locationUpdater startLocationUpdatesForDelegate:self];
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Started visit monitoring", v4, 2u);
  }
}

- (void)stopMonitoring
{
  [(MapsSuggestionsLocationUpdater *)self->_locationUpdater stopLocationUpdatesForDelegate:self];
  id v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "Stopped visit monitoring", v3, 2u);
  }
}

- (BOOL)isInVisit
{
  if (GEOConfigGetBOOL())
  {
    uint64_t v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "DEBUG: We're always in a Visit", v7, 2u);
    }

    return 1;
  }
  else
  {
    int v5 = self;
    objc_sync_enter(v5);
    BOOL isInVisit = v5->_isInVisit;
    objc_sync_exit(v5);
  }
  return isInVisit;
}

- (void)didEnterVisit:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [v5 hasArrivalDate];
  id v7 = GEOFindOrCreateLog();
  __int16 v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315394;
      v11 = "-[MapsSuggestionsVisitMonitor didEnterVisit:]";
      __int16 v12 = 2112;
      *(void *)v13 = v5;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v10, 0x16u);
    }

    int v9 = self;
    objc_sync_enter(v9);
    objc_storeStrong((id *)&v9->_latestVisit, a3);
    v9->_BOOL isInVisit = 1;
    objc_sync_exit(v9);

    [(MapsSuggestionsSimpleTrigger *)v9->_onEnterTrigger fire];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVisitMonitor.m";
      __int16 v12 = 1024;
      *(_DWORD *)v13 = 102;
      *(_WORD *)&v13[4] = 2082;
      *(void *)&v13[6] = "-[MapsSuggestionsVisitMonitor didEnterVisit:]";
      __int16 v14 = 2082;
      uint64_t v15 = "!visit.hasArrivalDate";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. An Enter CLVisit must have an arrival date", (uint8_t *)&v10, 0x26u);
    }
  }
}

- (void)didLeaveVisit:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 hasArrivalDate] & 1) == 0)
  {
    __int16 v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      __int16 v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVisitMonitor.m";
      __int16 v13 = 1024;
      *(_DWORD *)__int16 v14 = 115;
      *(_WORD *)&v14[4] = 2082;
      *(void *)&v14[6] = "-[MapsSuggestionsVisitMonitor didLeaveVisit:]";
      __int16 v15 = 2082;
      uint64_t v16 = "!visit.hasArrivalDate";
      int v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. An Exit CLVisit must have an arrival date";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0x26u);
    }
LABEL_11:

    goto LABEL_12;
  }
  char v6 = [v5 hasDepartureDate];
  id v7 = GEOFindOrCreateLog();
  __int16 v8 = v7;
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      __int16 v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVisitMonitor.m";
      __int16 v13 = 1024;
      *(_DWORD *)__int16 v14 = 116;
      *(_WORD *)&v14[4] = 2082;
      *(void *)&v14[6] = "-[MapsSuggestionsVisitMonitor didLeaveVisit:]";
      __int16 v15 = 2082;
      uint64_t v16 = "!visit.hasDepartureDate";
      int v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. An Exit CLVisit must have a departure date";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315394;
    __int16 v12 = "-[MapsSuggestionsVisitMonitor didLeaveVisit:]";
    __int16 v13 = 2112;
    *(void *)__int16 v14 = v5;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  int v9 = self;
  objc_sync_enter(v9);
  objc_storeStrong((id *)&v9->_latestVisit, a3);
  v9->_BOOL isInVisit = 0;
  objc_sync_exit(v9);

  [(MapsSuggestionsSimpleTrigger *)v9->_onExitTrigger fire];
LABEL_12:
}

- (void)didLoseLocationPermission
{
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Lost our permission to have locations; wiping what we know.",
      v6,
      2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  latestVisit = v4->_latestVisit;
  v4->_latestVisit = 0;

  v4->_BOOL isInVisit = 0;
  objc_sync_exit(v4);
}

- (MapsSuggestionsTrigger)onEnterTrigger
{
  return (MapsSuggestionsTrigger *)self->_onEnterTrigger;
}

- (MapsSuggestionsTrigger)onExitTrigger
{
  return (MapsSuggestionsTrigger *)self->_onExitTrigger;
}

- (MapsSuggestionsCondition)isInVisitCondition
{
  return (MapsSuggestionsCondition *)self->_isInVisitCondition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isInVisitCondition, 0);
  objc_storeStrong((id *)&self->_onExitTrigger, 0);
  objc_storeStrong((id *)&self->_onEnterTrigger, 0);
  objc_storeStrong((id *)&self->_latestVisit, 0);
  objc_storeStrong((id *)&self->_locationUpdater, 0);
}

@end