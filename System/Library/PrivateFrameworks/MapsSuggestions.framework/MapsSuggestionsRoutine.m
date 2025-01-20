@interface MapsSuggestionsRoutine
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (MapsSuggestionsEntry)_suggestionEntryForPLOI:(void *)a1;
- (MapsSuggestionsRoutine)initWithRoutineConnector:(id)a3 networkRequester:(id)a4;
- (NSString)uniqueName;
- (char)fetchAllSuggestedLOIsExcludingTypes:(id)a3 minVisits:(unint64_t)a4 maxAge:(double)a5 maxResults:(unint64_t)a6 handler:(id)a7;
- (char)fetchEntriesForLocation:(id)a3 period:(id)a4 handler:(id)a5;
- (char)fetchLOIsSinceDate:(id)a3 handler:(id)a4;
- (char)fetchLastVisitAtLocation:(id)a3 handler:(id)a4;
- (char)fetchLastVisitAtMapItem:(id)a3 withinDistance:(double)a4 handler:(id)a5;
- (char)fetchLocationsSinceDate:(id)a3 handler:(id)a4;
- (char)fetchMostRecentVisitWithinDistance:(double)a3 ofMapItem:(id)a4 handler:(id)a5;
- (char)fetchSuggestedLOIsForTypes:(id)a3 minVisits:(unint64_t)a4 maxAge:(double)a5 maxResults:(unint64_t)a6 handler:(id)a7;
- (char)fetchSuggestedShortcutsForType:(int64_t)a3 minVisits:(unint64_t)a4 maxAge:(double)a5 handler:(id)a6;
- (char)predictedExitTimeFromLocation:(id)a3 date:(id)a4 handler:(id)a5;
- (char)readMeCardWithMinVisits:(unint64_t)a3 maxAge:(double)a4 handler:(id)a5;
- (char)touristBitForLocation:(id)a3 handler:(id)a4;
- (id).cxx_construct;
- (id)capLocationsOfInterest:(unint64_t)a3 maxResults:;
- (id)initFromResourceDepot:(id)a3;
- (uint64_t)_addParkedCarFieldsToSuggestionsEntry:(void *)a1 vehicleEvent:(void *)a2;
- (unint64_t)countHomeLOIs;
- (unint64_t)countSchoolLOIs;
- (unint64_t)countWorkLOIs;
- (void)_addMapItemToShortcut:(void *)a3 fromLOI:(void *)a4 group:;
- (void)_cacheEntryExitDatesFromVisit:(void *)a3 forMapItemIdentifier:(void *)a4 name:;
- (void)addParkedCarObserver:(id)a3;
- (void)forgetLocationOfInterest:(id)a3 handler:(id)a4;
- (void)removeParkedCarObserver:(id)a3;
- (void)removeParkedCarsAllowingFeature:(BOOL)a3 handler:(id)a4;
- (void)updateFixedLOIs;
@end

@implementation MapsSuggestionsRoutine

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (id)initFromResourceDepot:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v15 = 1024;
      int v16 = 244;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsRoutine initFromResourceDepot:]";
      __int16 v19 = 2082;
      v20 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!", (uint8_t *)&v13, 0x26u);
    }
    goto LABEL_13;
  }
  v6 = [v4 oneRoutineConnector];

  if (!v6)
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v15 = 1024;
      int v16 = 245;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsRoutine initFromResourceDepot:]";
      __int16 v19 = 2082;
      v20 = "nil == (resourceDepot.oneRoutineConnector)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One RoutineConnector!", (uint8_t *)&v13, 0x26u);
    }
    goto LABEL_13;
  }
  v7 = [v5 oneNetworkRequester];

  if (!v7)
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v15 = 1024;
      int v16 = 246;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsRoutine initFromResourceDepot:]";
      __int16 v19 = 2082;
      v20 = "nil == (resourceDepot.oneNetworkRequester)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Network!", (uint8_t *)&v13, 0x26u);
    }
LABEL_13:

    v10 = 0;
    goto LABEL_14;
  }
  v8 = [v5 oneRoutineConnector];
  v9 = [v5 oneNetworkRequester];
  self = [(MapsSuggestionsRoutine *)self initWithRoutineConnector:v8 networkRequester:v9];

  v10 = self;
LABEL_14:

  return v10;
}

- (MapsSuggestionsRoutine)initWithRoutineConnector:(id)a3 networkRequester:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v36 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 212;
      __int16 v40 = 2082;
      v41 = "-[MapsSuggestionsRoutine initWithRoutineConnector:networkRequester:]";
      __int16 v42 = 2082;
      v43 = "nil == (routineConnector)";
      _os_log_impl(&dword_1A70DF000, v36, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a RoutineInterface", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v8)
  {
    v36 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 213;
      __int16 v40 = 2082;
      v41 = "-[MapsSuggestionsRoutine initWithRoutineConnector:networkRequester:]";
      __int16 v42 = 2082;
      v43 = "nil == (networkRequester)";
      _os_log_impl(&dword_1A70DF000, v36, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a NetworkRequester", buf, 0x26u);
    }
LABEL_11:

    v35 = 0;
    goto LABEL_12;
  }
  v38.receiver = self;
  v38.super_class = (Class)MapsSuggestionsRoutine;
  v10 = [(MapsSuggestionsRoutine *)&v38 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_connector, a3);
    objc_storeStrong((id *)&v11->_networkRequester, a4);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue((dispatch_queue_t *)buf, @"MapsSuggestionsRoutineQueue", v12);
    int v13 = *(OS_dispatch_queue **)buf;
    *(void *)buf = 0;
    innerQueue = v11->_queue._innerQueue;
    v11->_queue._innerQueue = v13;

    __int16 v15 = *(NSString **)&buf[8];
    *(void *)&buf[8] = 0;
    name = v11->_queue._name;
    v11->_queue._name = v15;

    __int16 v17 = [MapsSuggestionsObservers alloc];
    v18 = v11->_queue._innerQueue;
    uint64_t v19 = [(MapsSuggestionsObservers *)v17 initWithCallbackQueue:v18 name:@"MapsSuggestionsParkedCarObservers"];
    parkedCarObservers = v11->_parkedCarObservers;
    v11->_parkedCarObservers = (MapsSuggestionsObservers *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    loiLocationsForHome = v11->_loiLocationsForHome;
    v11->_loiLocationsForHome = (NSMutableDictionary *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    loiLocationsForWork = v11->_loiLocationsForWork;
    v11->_loiLocationsForWork = (NSMutableDictionary *)v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    loiLocationsForSchool = v11->_loiLocationsForSchool;
    v11->_loiLocationsForSchool = (NSMutableDictionary *)v25;

    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    loiVisits = v11->_loiVisits;
    v11->_loiVisits = (NSMutableDictionary *)v27;

    GEOConfigGetDouble();
    v11->_requeryInterval = v29;
    uint64_t Integer = GEOConfigGetInteger();
    v31 = [[MapsSuggestionsLimitedDictionary alloc] initWithMaximumCapacity:Integer];
    mapItemCache = v11->_mapItemCache;
    v11->_mapItemCache = v31;

    v33 = [[MapsSuggestionsLimitedDictionary alloc] initWithMaximumCapacity:Integer];
    mapItemCacheOrigin = v11->_mapItemCacheOrigin;
    v11->_mapItemCacheOrigin = v33;

    v11->_areFrequentLocationsAvailable = GEOConfigGetBOOL();
  }
  self = v11;
  v35 = self;
LABEL_12:

  return v35;
}

- (char)fetchEntriesForLocation:(id)a3 period:(id)a4 handler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    int v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      double v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v30 = 1024;
      *(_DWORD *)v31 = 700;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]";
      *(_WORD *)&v31[14] = 2082;
      *(void *)&v31[16] = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler", buf, 0x26u);
    }
    goto LABEL_20;
  }
  if (!v8)
  {
    int v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      double v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v30 = 1024;
      *(_DWORD *)v31 = 701;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]";
      *(_WORD *)&v31[14] = 2082;
      *(void *)&v31[16] = "nil == (location)";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location", buf, 0x26u);
    }
    goto LABEL_20;
  }
  if (!v9)
  {
    int v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      double v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v30 = 1024;
      *(_DWORD *)v31 = 702;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]";
      *(_WORD *)&v31[14] = 2082;
      *(void *)&v31[16] = "nil == (period)";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a period", buf, 0x26u);
    }
    goto LABEL_20;
  }
  v11 = [v9 startDate];

  if (!v11)
  {
    int v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      double v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v30 = 1024;
      *(_DWORD *)v31 = 703;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]";
      *(_WORD *)&v31[14] = 2082;
      *(void *)&v31[16] = "nil == (period.startDate)";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a startDate", buf, 0x26u);
    }
    goto LABEL_20;
  }
  [v9 duration];
  if (v12 == 0.0)
  {
    int v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      double v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v30 = 1024;
      *(_DWORD *)v31 = 704;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]";
      *(_WORD *)&v31[14] = 2082;
      *(void *)&v31[16] = "0.0 == period.duration";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an interval", buf, 0x26u);
    }
LABEL_20:

    char v14 = 0;
    goto LABEL_21;
  }
  if (+[MapsSuggestionsSiri isEnabled])
  {
    int v16 = (const char *)-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]::s_stepCounter++;
    __int16 v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v29 = v16;
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "FindAllPLOIEntries %lu BEGIN", buf, 0xCu);
    }

    objc_initWeak(&location, self);
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      double v29 = v16;
      __int16 v30 = 2112;
      *(void *)v31 = v9;
      *(_WORD *)&v31[8] = 2112;
      *(void *)&v31[10] = v8;
      _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_DEBUG, "FindAllPLOIEntries %lu uses %@ location=%@", buf, 0x20u);
    }

    connector = self->_connector;
    v20 = [v9 startDate];
    [v9 duration];
    double v22 = v21;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __65__MapsSuggestionsRoutine_fetchEntriesForLocation_period_handler___block_invoke;
    v24[3] = &unk_1E5CBA230;
    objc_copyWeak(v26, &location);
    id v25 = v10;
    v26[1] = (id)v16;
    [(MapsSuggestionsRoutineConnector *)connector fetchNextPLOIsFromLocation:v8 startDate:v20 timeInterval:v24 withHandler:v22];

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v23 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to fetch entries", buf, 2u);
    }

    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
  char v14 = 1;
LABEL_21:

  return v14;
}

void __65__MapsSuggestionsRoutine_fetchEntriesForLocation_period_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (v6)
  {
    if (WeakRetained)
    {
      id v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "Could not get PLOIs: %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = *(char **)(a1 + 48);
        *(_DWORD *)buf = 134217984;
        v20 = v11;
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "FindAllPLOIEntries %lu FAIL", buf, 0xCu);
      }
    }
    else
    {
      GEOFindOrCreateLog();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v20 = "MapsSuggestionsRoutine.mm";
        __int16 v21 = 1026;
        int v22 = 729;
        __int16 v23 = 2082;
        v24 = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }
    }
  }
  else if (WeakRetained)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__MapsSuggestionsRoutine_fetchEntriesForLocation_period_handler___block_invoke_355;
    v15[3] = &unk_1E5CB87C0;
    objc_copyWeak(v18, (id *)(a1 + 40));
    id v16 = v5;
    id v12 = *(id *)(a1 + 32);
    int v13 = *(void **)(a1 + 48);
    id v17 = v12;
    v18[1] = v13;
    dispatch_async(v8[3], v15);

    objc_destroyWeak(v18);
  }
  else
  {
    GEOFindOrCreateLog();
    char v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "MapsSuggestionsRoutine.mm";
      __int16 v21 = 1026;
      int v22 = 736;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __64__MapsSuggestionsRoutine__resolveMapItemsAndAddEntries_handler___block_invoke_348(uint64_t a1)
{
  *(void *)&v9[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = [WeakRetained uniqueName];
      int v6 = 138412546;
      id v7 = v4;
      __int16 v8 = 2080;
      *(void *)id v9 = "_resolveMapItemsAndAddEntries";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v6, 0x16u);
    }
    id v5 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v6) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_resolveMapItemsAndAddEntries", "", (uint8_t *)&v6, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsRoutine.mm";
      __int16 v8 = 1026;
      *(_DWORD *)id v9 = 689;
      v9[2] = 2082;
      *(void *)&v9[3] = "-[MapsSuggestionsRoutine _resolveMapItemsAndAddEntries:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void __47__MapsSuggestionsRoutine_addParkedCarObserver___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      id v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v6) = 0;
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "First ParkedCarObserver. Start monitoring Routine.", (uint8_t *)&v6, 2u);
      }

      [WeakRetained[1] startMonitoringVehicleEventsWithHandler:*(void *)(a1 + 32)];
    }
    else
    {
      GEOFindOrCreateLog();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136446722;
        id v7 = "MapsSuggestionsRoutine.mm";
        __int16 v8 = 1026;
        int v9 = 1596;
        __int16 v10 = 2082;
        v11 = "-[MapsSuggestionsRoutine addParkedCarObserver:]_block_invoke_2";
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
      }
    }
  }
}

void __65__MapsSuggestionsRoutine_fetchEntriesForLocation_period_handler___block_invoke_355(uint64_t a1)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v57 = (char *)-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]::s_stepCounter;
    uint64_t v51 = a1;
    v3 = *(void **)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    id v55 = v3;
    id v54 = v4;
    dispatch_assert_queue_V2((dispatch_queue_t)WeakRetained[3]);
    id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!*((unsigned char *)WeakRetained + 144))
    {
      GEOConfigSetBOOL();
      *((unsigned char *)WeakRetained + 144) = 1;
    }
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v82 = "-[MapsSuggestionsRoutine _treatPLOIs:stepCounter:handler:]";
      __int16 v83 = 1024;
      *(_DWORD *)v84 = [v55 count];
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "%s: about to process %u routine LOIs", buf, 0x12u);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = v55;
    uint64_t v6 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
    if (v6)
    {
      char v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v62 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          uint64_t v12 = -[MapsSuggestionsRoutine _suggestionEntryForPLOI:](WeakRetained, v11);
          int v13 = v12;
          if (v12)
          {
            if ([v12 type] == 1)
            {
              [v11 confidence];
              double v15 = v14;
              if ((v7 & 1) != 0 && v14 <= 0.0 && GEOConfigGetBOOL())
              {
                id v16 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v82 = (char *)v11;
                  _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "We already had a high-confidence Home, we don't need a low-confidence one: %@", buf, 0xCu);
                }
LABEL_22:

                goto LABEL_23;
              }
              v7 |= v15 > 0.0;
            }
            id v17 = [NSNumber numberWithUnsignedInteger:++v8];
            [v13 setNumber:v17 forKey:@"MapsSuggestionsOriginalPositionKey"];

            [v60 addObject:v13];
            GEOFindOrCreateLog();
            id v16 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              v18 = [v13 fullDescription];
              *(_DWORD *)buf = 134218242;
              v82 = v57;
              __int16 v83 = 2112;
              *(void *)v84 = v18;
              _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "FindAllPLOIEntries %lu yielded MapsSuggestionEntry: %@", buf, 0x16u);
            }
            goto LABEL_22;
          }
LABEL_23:
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
      }
      while (v6);
    }

    id v53 = v60;
    id v52 = v54;
    dispatch_assert_queue_V2((dispatch_queue_t)WeakRetained[3]);
    GEOFindOrCreateLog();
    uint64_t v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = [WeakRetained uniqueName];
      *(_DWORD *)buf = 138412546;
      v82 = v20;
      __int16 v83 = 2080;
      *(void *)v84 = "_resolveMapItemsAndAddEntries";
      _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    __int16 v21 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_resolveMapItemsAndAddEntries", "", buf, 2u);
    }

    objc_initWeak(&location, WeakRetained);
    group = dispatch_group_create();
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v58 = v53;
    uint64_t v22 = [v58 countByEnumeratingWithState:&v70 objects:buf count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v71;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v71 != v23) {
            objc_enumerationMutation(v58);
          }
          uint64_t v25 = *(void **)(*((void *)&v70 + 1) + 8 * v24);
          if ([v25 type])
          {
            v26 = MapsSuggestionsDestinationKey(v25);
            if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
              dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
            }
            if (s_verbose)
            {
              uint64_t v27 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v28 = WeakRetained[15];
                *(_DWORD *)block = 138412546;
                *(void *)&block[4] = v26;
                *(_WORD *)&block[12] = 2112;
                *(void *)&block[14] = v28;
                _os_log_impl(&dword_1A70DF000, v27, OS_LOG_TYPE_DEBUG, "Trying destination key %@ on %@", block, 0x16u);
              }
            }
            double v29 = [(id)WeakRetained[15] objectForKeyedSubscript:v26];
            if (v29)
            {
              GEOFindOrCreateLog();
              __int16 v30 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                int v31 = [(id)WeakRetained[15] hitsOnKey:v26];
                [(id)WeakRetained[15] totalHitRatio];
                uint64_t v33 = v32;
                int v34 = [(id)WeakRetained[15] count];
                *(_DWORD *)block = 67109632;
                *(_DWORD *)&block[4] = v31;
                *(_WORD *)&block[8] = 2048;
                *(void *)&block[10] = v33;
                *(_WORD *)&block[18] = 1024;
                *(_DWORD *)&block[20] = v34;
                _os_log_impl(&dword_1A70DF000, v30, OS_LOG_TYPE_DEBUG, "Cache hit (%ux) (ratio: %.2f on %u elements)", block, 0x18u);
              }

              [v25 setGeoMapItem:v29];
              uint64_t v35 = [(id)WeakRetained[16] objectForKeyedSubscript:v26];
              v36 = (void *)v35;
              v37 = &unk_1EFC898A0;
              if (v35) {
                v37 = (void *)v35;
              }
              objc_super v38 = v37;

              [v25 setNumber:v38 forKey:@"MapsSuggestionsGEOMapItemOriginKey"];
            }
            else
            {
              GEOFindOrCreateLog();
              v39 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              {
                [(id)WeakRetained[15] totalHitRatio];
                uint64_t v41 = v40;
                int v42 = [(id)WeakRetained[15] count];
                *(_DWORD *)block = 134218240;
                *(void *)&block[4] = v41;
                *(_WORD *)&block[12] = 1024;
                *(_DWORD *)&block[14] = v42;
                _os_log_impl(&dword_1A70DF000, v39, OS_LOG_TYPE_DEBUG, "Cache miss (ratio: %.2f on %u elements)", block, 0x12u);
              }

              dispatch_group_enter(group);
              v43 = (void *)WeakRetained[2];
              v65[0] = MEMORY[0x1E4F143A8];
              v65[1] = 3221225472;
              v65[2] = __64__MapsSuggestionsRoutine__resolveMapItemsAndAddEntries_handler___block_invoke;
              v65[3] = &unk_1E5CBA0A8;
              uint64_t v44 = group;
              v66 = v44;
              objc_copyWeak(&v69, &location);
              id v67 = v26;
              v68 = v25;
              if (!GEOMapItemFromMapsSuggestionsEntry(v25, v43, 1, v65)) {
                dispatch_group_leave(v44);
              }

              objc_destroyWeak(&v69);
              objc_super v38 = v66;
            }
          }
          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v58 countByEnumeratingWithState:&v70 objects:buf count:16];
      }
      while (v22);
    }

    v45 = (void *)WeakRetained[3];
    *(void *)block = MEMORY[0x1E4F143A8];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = __64__MapsSuggestionsRoutine__resolveMapItemsAndAddEntries_handler___block_invoke_348;
    v77 = &unk_1E5CBA0D0;
    v46 = v45;
    objc_copyWeak(v80, &location);
    id v47 = v52;
    id v79 = v47;
    id v48 = v58;
    id v78 = v48;
    dispatch_group_notify(group, v46, block);

    objc_destroyWeak(v80);
    objc_destroyWeak(&location);

    v49 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      v50 = *(char **)(v51 + 56);
      *(_DWORD *)buf = 134217984;
      v82 = v50;
      _os_log_impl(&dword_1A70DF000, v49, OS_LOG_TYPE_DEBUG, "FindAllPLOIEntries %lu END", buf, 0xCu);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v49 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v82 = "MapsSuggestionsRoutine.mm";
      __int16 v83 = 1026;
      *(_DWORD *)v84 = 738;
      *(_WORD *)&v84[4] = 2082;
      *(void *)&v84[6] = "-[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v49, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)addParkedCarObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__MapsSuggestionsRoutine_addParkedCarObserver___block_invoke;
  aBlock[3] = &unk_1E5CBA340;
  aBlock[4] = self;
  objc_copyWeak(&v12, &location);
  id v5 = _Block_copy(aBlock);
  parkedCarObservers = self->_parkedCarObservers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__MapsSuggestionsRoutine_addParkedCarObserver___block_invoke_2;
  v8[3] = &unk_1E5CBA368;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  [(MapsSuggestionsObservers *)parkedCarObservers registerObserver:v4 handler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 > 0x18)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v8 = 1024;
      int v9 = 396;
      __int16 v10 = 2082;
      v11 = "-[MapsSuggestionsRoutine canProduceEntriesOfType:]";
      __int16 v12 = 2082;
      int v13 = "YES";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v6, 0x26u);
    }

    goto LABEL_3;
  }
  if (((1 << a3) & 0x1F7FF68) != 0)
  {
LABEL_3:
    LOBYTE(self) = 0;
    return (char)self;
  }
  if (((1 << a3) & 0x80096) != 0)
  {
    if (self)
    {
      v3 = (void *)*MEMORY[0x1E4F64320];
      LOBYTE(self) = MapsSuggestionsIsLocationAllowedForBundleID(v3);
    }
  }
  else
  {
    if (qword_1EB6F02D8 != -1) {
      dispatch_once(&qword_1EB6F02D8, &__block_literal_global_505);
    }
    LOBYTE(self) = _MergedGlobals_43 != 0;
  }
  return (char)self;
}

- (uint64_t)_addParkedCarFieldsToSuggestionsEntry:(void *)a1 vehicleEvent:(void *)a2
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (!v3)
  {
    id v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v21 = 1024;
      int v22 = 439;
      __int16 v23 = 2082;
      uint64_t v24 = "-[MapsSuggestionsRoutine _addParkedCarFieldsToSuggestionsEntry:vehicleEvent:]";
      __int16 v25 = 2082;
      v26 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry", (uint8_t *)&v19, 0x26u);
    }
    goto LABEL_15;
  }
  if ([v3 type] != 7)
  {
    id v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v21 = 1024;
      int v22 = 440;
      __int16 v23 = 2082;
      uint64_t v24 = "-[MapsSuggestionsRoutine _addParkedCarFieldsToSuggestionsEntry:vehicleEvent:]";
      __int16 v25 = 2082;
      v26 = "MapsSuggestionsEntryTypeParkedCar != entry.type";
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Suggestion entry needs to be ParkedCar", (uint8_t *)&v19, 0x26u);
    }
LABEL_15:

    uint64_t v16 = 0;
    goto LABEL_16;
  }
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  GEOConfigGetDouble();
  int v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  [v3 setExpires:v6];

  GEOConfigGetDouble();
  objc_msgSend(v3, "setWeight:");
  if (v4)
  {
    [v3 setBoolean:1 forKey:@"MapsSuggestionsRoutineIsBackedByVehicleEventKey"];
    id v7 = [v4 date];
    [v3 setDate:v7 forKey:@"MapsSuggestionsWhenItHappenedKey"];

    __int16 v8 = [v4 nearbyLocationOfInterest];

    if (v8)
    {
      int v9 = NSNumber;
      __int16 v10 = [v4 nearbyLocationOfInterest];
      v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "type"));
      [v3 setNumber:v11 forKey:@"MapsSuggestionsCoreRoutineTypeSource"];

      __int16 v12 = [v4 nearbyLocationOfInterest];
      uint64_t v13 = [v12 customLabel];
      uint64_t v14 = (void *)v13;
      if (v13) {
        double v15 = (__CFString *)v13;
      }
      else {
        double v15 = &stru_1EFC640F8;
      }
      [v3 setString:v15 forKey:@"MapsSuggestionsCoreRoutineCustomLabel"];
    }
  }
  uint64_t v16 = 1;
LABEL_16:

  return v16;
}

- (MapsSuggestionsEntry)_suggestionEntryForPLOI:(void *)a1
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v129 = a2;
  v130 = [v129 locationOfInterest];
  v123 = [v129 sources];
  v124 = a1;
  v126 = [v130 mapItem];
  uint64_t v3 = [v130 type];
  id v127 = v123;
  GEOFindOrCreateLog();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = [v127 count];
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Treating Routine entry of %u types", buf, 8u);
  }
  uint64_t v122 = v3;

  long long v148 = 0u;
  memset(v147, 0, sizeof(v147));
  id obj = v127;
  uint64_t v5 = [obj countByEnumeratingWithState:v147 objects:v143 count:16];
  if (v5)
  {
    uint64_t v6 = **(void **)&v147[16];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (**(void **)&v147[16] != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*(void *)&v147[8] + 8 * i);
        GEOFindOrCreateLog();
        int v9 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          __int16 v10 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v8;
          id v11 = v10;
          _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, " . %@: %@", buf, 0x16u);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:v147 objects:v143 count:16];
    }
    while (v5);
  }

  if (v122)
  {
    if (v122 != 1)
    {
      if (v122 == 2)
      {
        if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1) {
          dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
        }
        unint64_t v12 = 19;
        goto LABEL_112;
      }
      id v13 = obj;
      uint64_t v14 = objc_opt_class();
      if (v13)
      {
        if (v14)
        {
          if ([v14 isSubclassOfClass:objc_opt_class()])
          {
            long long v141 = 0u;
            long long v142 = 0u;
            long long v139 = 0u;
            long long v140 = 0u;
            double v15 = v13;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v139 objects:buf count:16];
            if (v16)
            {
              uint64_t v17 = *(void *)v140;
LABEL_29:
              uint64_t v18 = 0;
              while (1)
              {
                if (*(void *)v140 != v17) {
                  objc_enumerationMutation(v15);
                }
                id v19 = *(id *)(*((void *)&v139 + 1) + 8 * v18);
                if (objc_opt_isKindOfClass()) {
                  break;
                }

                if (v16 == ++v18)
                {
                  uint64_t v16 = [v15 countByEnumeratingWithState:&v139 objects:buf count:16];
                  if (v16) {
                    goto LABEL_29;
                  }
                  goto LABEL_43;
                }
              }
LABEL_44:

              if (!v19) {
                goto LABEL_67;
              }
              id v21 = v13;
              int v22 = objc_opt_class();
              if (v13)
              {
                if (v22)
                {
                  if ([v22 isSubclassOfClass:objc_opt_class()])
                  {
                    long long v141 = 0u;
                    long long v142 = 0u;
                    long long v139 = 0u;
                    long long v140 = 0u;
                    __int16 v23 = v21;
                    uint64_t v24 = [v23 countByEnumeratingWithState:&v139 objects:buf count:16];
                    if (v24)
                    {
                      uint64_t v25 = *(void *)v140;
LABEL_50:
                      uint64_t v26 = 0;
                      while (1)
                      {
                        if (*(void *)v140 != v25) {
                          objc_enumerationMutation(v23);
                        }
                        id v27 = *(id *)(*((void *)&v139 + 1) + 8 * v26);
                        if (objc_opt_isKindOfClass()) {
                          break;
                        }

                        if (v24 == ++v26)
                        {
                          uint64_t v24 = [v23 countByEnumeratingWithState:&v139 objects:buf count:16];
                          if (v24) {
                            goto LABEL_50;
                          }
                          goto LABEL_64;
                        }
                      }
LABEL_65:

                      if (v27)
                      {
                        unint64_t v12 = 4;
                        goto LABEL_112;
                      }
LABEL_67:
                      id v29 = v13;
                      __int16 v30 = objc_opt_class();
                      if (v13)
                      {
                        if (v30)
                        {
                          if ([v30 isSubclassOfClass:objc_opt_class()])
                          {
                            long long v141 = 0u;
                            long long v142 = 0u;
                            long long v139 = 0u;
                            long long v140 = 0u;
                            int v31 = v29;
                            uint64_t v32 = [v31 countByEnumeratingWithState:&v139 objects:buf count:16];
                            if (v32)
                            {
                              uint64_t v33 = *(void *)v140;
LABEL_72:
                              uint64_t v34 = 0;
                              while (1)
                              {
                                if (*(void *)v140 != v33) {
                                  objc_enumerationMutation(v31);
                                }
                                id v35 = *(id *)(*((void *)&v139 + 1) + 8 * v34);
                                if (objc_opt_isKindOfClass()) {
                                  break;
                                }

                                if (v32 == ++v34)
                                {
                                  uint64_t v32 = [v31 countByEnumeratingWithState:&v139 objects:buf count:16];
                                  if (v32) {
                                    goto LABEL_72;
                                  }
                                  goto LABEL_86;
                                }
                              }
LABEL_87:

                              if (v35)
                              {
                                unint64_t v12 = 7;
                                goto LABEL_112;
                              }
                              id v37 = v29;
                              objc_super v38 = objc_opt_class();
                              if (v13)
                              {
                                if (v38)
                                {
                                  if ([v38 isSubclassOfClass:objc_opt_class()])
                                  {
                                    long long v141 = 0u;
                                    long long v142 = 0u;
                                    long long v139 = 0u;
                                    long long v140 = 0u;
                                    v39 = v37;
                                    uint64_t v40 = [v39 countByEnumeratingWithState:&v139 objects:buf count:16];
                                    if (v40)
                                    {
                                      uint64_t v41 = *(void *)v140;
LABEL_94:
                                      uint64_t v42 = 0;
                                      while (1)
                                      {
                                        if (*(void *)v140 != v41) {
                                          objc_enumerationMutation(v39);
                                        }
                                        id v43 = *(id *)(*((void *)&v139 + 1) + 8 * v42);
                                        if (objc_opt_isKindOfClass()) {
                                          goto LABEL_109;
                                        }

                                        if (v40 == ++v42)
                                        {
                                          uint64_t v40 = [v39 countByEnumeratingWithState:&v139 objects:buf count:16];
                                          if (v40) {
                                            goto LABEL_94;
                                          }
                                          break;
                                        }
                                      }
                                    }
LABEL_108:
                                    id v43 = 0;
LABEL_109:

                                    if (v43) {
                                      unint64_t v12 = 4;
                                    }
                                    else {
                                      unint64_t v12 = 0;
                                    }
                                    goto LABEL_112;
                                  }
                                  v39 = GEOFindOrCreateLog();
                                  if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                                    goto LABEL_108;
                                  }
                                  *(_DWORD *)buf = 136446978;
                                  *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSu"
                                                       "ggestionsRoutine.mm";
                                  *(_WORD *)&buf[12] = 1024;
                                  *(_DWORD *)&buf[14] = 280;
                                  *(_WORD *)&unsigned char buf[18] = 2082;
                                  *(void *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutine]";
                                  *(_WORD *)&buf[28] = 2082;
                                  *(void *)&buf[30] = "! [rtSourceClass isSubclassOfClass:[RTSource class]]";
                                  uint64_t v44 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a RTSource-derived class";
                                }
                                else
                                {
                                  v39 = GEOFindOrCreateLog();
                                  if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                                    goto LABEL_108;
                                  }
                                  *(_DWORD *)buf = 136446978;
                                  *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSu"
                                                       "ggestionsRoutine.mm";
                                  *(_WORD *)&buf[12] = 1024;
                                  *(_DWORD *)&buf[14] = 279;
                                  *(_WORD *)&unsigned char buf[18] = 2082;
                                  *(void *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutine]";
                                  *(_WORD *)&buf[28] = 2082;
                                  *(void *)&buf[30] = "nil == (rtSourceClass)";
                                  uint64_t v44 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a class";
                                }
                              }
                              else
                              {
                                v39 = GEOFindOrCreateLog();
                                if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                                  goto LABEL_108;
                                }
                                *(_DWORD *)buf = 136446978;
                                *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSugg"
                                                     "estionsRoutine.mm";
                                *(_WORD *)&buf[12] = 1024;
                                *(_DWORD *)&buf[14] = 278;
                                *(_WORD *)&unsigned char buf[18] = 2082;
                                *(void *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutine]";
                                *(_WORD *)&buf[28] = 2082;
                                *(void *)&buf[30] = "nil == (rtSources)";
                                uint64_t v44 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sources";
                              }
                              _os_log_impl(&dword_1A70DF000, v39, OS_LOG_TYPE_ERROR, v44, buf, 0x26u);
                              goto LABEL_108;
                            }
LABEL_86:
                            id v35 = 0;
                            goto LABEL_87;
                          }
                          int v31 = GEOFindOrCreateLog();
                          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                            goto LABEL_86;
                          }
                          *(_DWORD *)buf = 136446978;
                          *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
                          *(_WORD *)&buf[12] = 1024;
                          *(_DWORD *)&buf[14] = 280;
                          *(_WORD *)&unsigned char buf[18] = 2082;
                          *(void *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutineVehicleEvent]";
                          *(_WORD *)&buf[28] = 2082;
                          *(void *)&buf[30] = "! [rtSourceClass isSubclassOfClass:[RTSource class]]";
                          v36 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a RTSource-derived class";
                        }
                        else
                        {
                          int v31 = GEOFindOrCreateLog();
                          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                            goto LABEL_86;
                          }
                          *(_DWORD *)buf = 136446978;
                          *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
                          *(_WORD *)&buf[12] = 1024;
                          *(_DWORD *)&buf[14] = 279;
                          *(_WORD *)&unsigned char buf[18] = 2082;
                          *(void *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutineVehicleEvent]";
                          *(_WORD *)&buf[28] = 2082;
                          *(void *)&buf[30] = "nil == (rtSourceClass)";
                          v36 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a class";
                        }
                      }
                      else
                      {
                        int v31 = GEOFindOrCreateLog();
                        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_86;
                        }
                        *(_DWORD *)buf = 136446978;
                        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
                        *(_WORD *)&buf[12] = 1024;
                        *(_DWORD *)&buf[14] = 278;
                        *(_WORD *)&unsigned char buf[18] = 2082;
                        *(void *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutineVehicleEvent]";
                        *(_WORD *)&buf[28] = 2082;
                        *(void *)&buf[30] = "nil == (rtSources)";
                        v36 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sources";
                      }
                      _os_log_impl(&dword_1A70DF000, v31, OS_LOG_TYPE_ERROR, v36, buf, 0x26u);
                      goto LABEL_86;
                    }
LABEL_64:
                    id v27 = 0;
                    goto LABEL_65;
                  }
                  __int16 v23 = GEOFindOrCreateLog();
                  if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_64;
                  }
                  *(_DWORD *)buf = 136446978;
                  *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 280;
                  *(_WORD *)&unsigned char buf[18] = 2082;
                  *(void *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutine]";
                  *(_WORD *)&buf[28] = 2082;
                  *(void *)&buf[30] = "! [rtSourceClass isSubclassOfClass:[RTSource class]]";
                  uint64_t v28 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a RTSource-derived class";
                }
                else
                {
                  __int16 v23 = GEOFindOrCreateLog();
                  if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_64;
                  }
                  *(_DWORD *)buf = 136446978;
                  *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 279;
                  *(_WORD *)&unsigned char buf[18] = 2082;
                  *(void *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutine]";
                  *(_WORD *)&buf[28] = 2082;
                  *(void *)&buf[30] = "nil == (rtSourceClass)";
                  uint64_t v28 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a class";
                }
              }
              else
              {
                __int16 v23 = GEOFindOrCreateLog();
                if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_64;
                }
                *(_DWORD *)buf = 136446978;
                *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 278;
                *(_WORD *)&unsigned char buf[18] = 2082;
                *(void *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutine]";
                *(_WORD *)&buf[28] = 2082;
                *(void *)&buf[30] = "nil == (rtSources)";
                uint64_t v28 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sources";
              }
              _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_ERROR, v28, buf, 0x26u);
              goto LABEL_64;
            }
LABEL_43:
            id v19 = 0;
            goto LABEL_44;
          }
          double v15 = GEOFindOrCreateLog();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            goto LABEL_43;
          }
          *(_DWORD *)buf = 136446978;
          *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 280;
          *(_WORD *)&unsigned char buf[18] = 2082;
          *(void *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceEventKit]";
          *(_WORD *)&buf[28] = 2082;
          *(void *)&buf[30] = "! [rtSourceClass isSubclassOfClass:[RTSource class]]";
          v20 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a RTSource-derived class";
        }
        else
        {
          double v15 = GEOFindOrCreateLog();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            goto LABEL_43;
          }
          *(_DWORD *)buf = 136446978;
          *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 279;
          *(_WORD *)&unsigned char buf[18] = 2082;
          *(void *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceEventKit]";
          *(_WORD *)&buf[28] = 2082;
          *(void *)&buf[30] = "nil == (rtSourceClass)";
          v20 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a class";
        }
      }
      else
      {
        double v15 = GEOFindOrCreateLog();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          goto LABEL_43;
        }
        *(_DWORD *)buf = 136446978;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 278;
        *(_WORD *)&unsigned char buf[18] = 2082;
        *(void *)&buf[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceEventKit]";
        *(_WORD *)&buf[28] = 2082;
        *(void *)&buf[30] = "nil == (rtSources)";
        v20 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sources";
      }
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, v20, buf, 0x26u);
      goto LABEL_43;
    }
    if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1) {
      dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
    }
    unint64_t v12 = 2;
  }
  else
  {
    if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1) {
      dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
    }
    unint64_t v12 = 1;
  }
LABEL_112:

  if ([v124 canProduceEntriesOfType:v12])
  {
    char v45 = [v130 typeSource];
    log = [[MapsSuggestionsEntry alloc] initWithType:v12 title:&stru_1EFC640F8];
    v46 = [v130 location];
    [v46 latitude];
    double v48 = v47;
    v49 = [v130 location];
    [v49 longitude];
    double v51 = v50;

    *(void *)&long long v139 = 0;
    *((void *)&v139 + 1) = &v139;
    *(void *)&long long v140 = 0x4012000000;
    *((void *)&v140 + 1) = __Block_byref_object_copy__15;
    *(void *)&long long v141 = __Block_byref_object_dispose__15;
    *((void *)&v141 + 1) = &unk_1A727D1A1;
    *(double *)&long long v142 = v48;
    *((double *)&v142 + 1) = v51;
    if (objc_msgSend(MEMORY[0x1E4F64670], "isLocationShiftRequiredForCoordinate:", v48, v51))
    {
      id v52 = [v130 location];
      BOOL v53 = [v52 referenceFrame] == 2;

      if (!v53)
      {
        id v54 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A70DF000, v54, OS_LOG_TYPE_DEBUG, "Entry needs location shift.", buf, 2u);
        }

        id v55 = v124;
        if (!v124[17])
        {
          id v56 = objc_alloc_init(MEMORY[0x1E4F64670]);
          v57 = (void *)v124[17];
          v124[17] = v56;

          id v55 = v124;
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        buf[24] = 0;
        dispatch_semaphore_t v58 = dispatch_semaphore_create(0);
        v59 = (void *)v55[17];
        v135[0] = MEMORY[0x1E4F143A8];
        v135[1] = 3221225472;
        v135[2] = __50__MapsSuggestionsRoutine__suggestionEntryForPLOI___block_invoke;
        v135[3] = &unk_1E5CBA058;
        v137 = &v139;
        v138 = buf;
        v136 = v58;
        v133[0] = MEMORY[0x1E4F143A8];
        v133[1] = 3221225472;
        v133[2] = __50__MapsSuggestionsRoutine__suggestionEntryForPLOI___block_invoke_340;
        v133[3] = &unk_1E5CBA080;
        id v60 = v136;
        v134 = v60;
        long long v61 = dispatch_get_global_queue(17, 0);
        objc_msgSend(v59, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v135, 0, v133, v61, v48, v51, 0.0);

        GEOConfigGetDouble();
        dispatch_time_t v63 = dispatch_time(0, (uint64_t)(v62 * 1000000000.0));
        dispatch_semaphore_wait(v60, v63);
        if (!*(unsigned char *)(*(void *)&buf[8] + 24))
        {
          v117 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v143 = 0;
            _os_log_impl(&dword_1A70DF000, v117, OS_LOG_TYPE_ERROR, "Entry required location shift, but could not shift it. This entry will be dropped until the location shift completes successfully", v143, 2u);
          }

          _Block_object_dispose(buf, 8);
          long long v70 = 0;
LABEL_184:
          _Block_object_dispose(&v139, 8);
          goto LABEL_185;
        }

        _Block_object_dispose(buf, 8);
      }
    }
    long long v64 = log;
    id v65 = v126;
    v66 = v65;
    if (v64)
    {
      if (v65)
      {
        [(MapsSuggestionsEntry *)v64 setGeoMapItem:0];
        id v67 = [v66 name];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        *(void *)&buf[24] = __Block_byref_object_copy__404;
        *(void *)&buf[32] = __Block_byref_object_dispose__405;
        id v150 = 0;
        *(void *)v143 = MEMORY[0x1E4F143A8];
        *(void *)&v143[8] = 3221225472;
        *(void *)&long long v144 = ___ZL18_firstLineOfStringP8NSString_block_invoke;
        *((void *)&v144 + 1) = &unk_1E5CBA430;
        *(void *)&long long v145 = buf;
        [v67 enumerateLinesUsingBlock:v143];
        id v68 = *(id *)(*(void *)&buf[8] + 40);
        _Block_object_dispose(buf, 8);

        [(MapsSuggestionsEntry *)v64 setUndecoratedTitle:v68];
        [(MapsSuggestionsEntry *)v64 setUndecoratedSubtitle:0];
      }
    }
    else
    {
      long long v71 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 424;
        *(_WORD *)&unsigned char buf[18] = 2082;
        *(void *)&buf[20] = "-[MapsSuggestionsRoutine _addFieldsToSuggestionsEntry:fromRTMapItem:]";
        *(_WORD *)&buf[28] = 2082;
        *(void *)&buf[30] = "nil == (entry)";
        _os_log_impl(&dword_1A70DF000, v71, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry", buf, 0x26u);
      }
    }
    long long v72 = [v130 identifier];
    v128 = [v72 UUIDString];

    [(MapsSuggestionsEntry *)v64 setString:v128 forKey:@"MapsSuggestionsCoreRoutinePK"];
    [(MapsSuggestionsEntry *)v64 setString:@"MapsSuggestionsCoreRoutinePK" forKey:@"MapsSuggestionsPrimaryKey"];
    long long v73 = [NSNumber numberWithDouble:*(double *)(*((void *)&v139 + 1) + 48)];
    [(MapsSuggestionsEntry *)v64 setNumber:v73 forKey:@"MapsSuggestionsLatitudeKey"];

    v74 = [NSNumber numberWithDouble:*(double *)(*((void *)&v139 + 1) + 56)];
    [(MapsSuggestionsEntry *)v64 setNumber:v74 forKey:@"MapsSuggestionsLongitudeKey"];

    v75 = NSNumber;
    v76 = [v130 location];
    [v76 horizontalUncertainty];
    v77 = objc_msgSend(v75, "numberWithDouble:");
    [(MapsSuggestionsEntry *)v64 setNumber:v77 forKey:@"MapsSuggestionsCoreRoutineLocationUncertainty"];

    [(MapsSuggestionsEntry *)v64 setInteger:0 forKey:@"MapsSuggestionsGEOMapItemOriginKey"];
    id v78 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v130, "type"));
    [(MapsSuggestionsEntry *)v64 setNumber:v78 forKey:@"MapsSuggestionsCoreRoutineType"];

    id v79 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v130, "typeSource"));
    [(MapsSuggestionsEntry *)v64 setNumber:v79 forKey:@"MapsSuggestionsCoreRoutineTypeSource"];

    uint64_t v80 = [v130 customLabel];
    v81 = (void *)v80;
    if (v80) {
      v82 = (__CFString *)v80;
    }
    else {
      v82 = &stru_1EFC640F8;
    }
    [(MapsSuggestionsEntry *)v64 setString:v82 forKey:@"MapsSuggestionsCoreRoutineCustomLabel"];

    __int16 v83 = [v130 identifier];
    [(MapsSuggestionsEntry *)v64 setUUID:v83 forKey:@"MapsSuggestionsCoreRoutineIdentifier"];

    v84 = [v129 nextEntryTime];
    [(MapsSuggestionsEntry *)v64 setDate:v84 forKey:@"MapsSuggestionsScheduledTimeKey"];

    uint64_t v85 = NSNumber;
    v86 = [v130 visits];
    v87 = objc_msgSend(v85, "numberWithUnsignedInteger:", objc_msgSend(v86, "count"));
    [(MapsSuggestionsEntry *)v64 setNumber:v87 forKey:@"MapsSuggestionsCoreRoutineVisitsCountKey"];

    [(MapsSuggestionsEntry *)v64 setBoolean:v45 & 1 forKey:@"MapsSuggestionsCoreRoutineFromMeCardKey"];
    v88 = [v66 geoMapItemHandle];
    [(MapsSuggestionsEntry *)v64 setMapItemHandleData:v88];

    v89 = [v129 nextEntryTime];
    v90 = v89;
    if (!v89)
    {
      v91 = (void *)MEMORY[0x1E4F1C9C8];
      GEOConfigGetDouble();
      v90 = objc_msgSend(v91, "dateWithTimeIntervalSinceNow:");
    }
    [(MapsSuggestionsEntry *)v64 setExpires:v90];
    if (!v89) {

    }
    v92 = [v130 visits];
    v93 = [v92 firstObject];

    v94 = [v93 entryDate];
    [(MapsSuggestionsEntry *)v64 setDate:v94 forKey:@"MapsSuggestionsCoreRoutineFirstVisit"];

    v95 = [v130 visits];
    v96 = [v95 lastObject];

    v97 = [v96 entryDate];
    [(MapsSuggestionsEntry *)v64 setDate:v97 forKey:@"MapsSuggestionsCoreRoutineLastVisit"];

    [v129 confidence];
    double v99 = v98;
    v100 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = v99;
      _os_log_impl(&dword_1A70DF000, v100, OS_LOG_TYPE_DEBUG, "Got a confidence of %.2f", buf, 0xCu);
    }

    switch(v12)
    {
      case 1uLL:
        GEOConfigGetDouble();
        [(MapsSuggestionsEntry *)v64 setWeight:v99 * v101];
        if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1) {
          goto LABEL_192;
        }
        goto LABEL_155;
      case 2uLL:
        GEOConfigGetDouble();
        [(MapsSuggestionsEntry *)v64 setWeight:v99 * v104];
        if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken == -1) {
          goto LABEL_155;
        }
        goto LABEL_192;
      case 3uLL:
      case 5uLL:
      case 6uLL:
        goto LABEL_149;
      case 4uLL:
        GEOConfigGetDouble();
        [(MapsSuggestionsEntry *)v64 setWeight:v99 * v105];
        goto LABEL_155;
      case 7uLL:
        id v125 = obj;
        v111 = objc_opt_class();
        if (v125)
        {
          if (v111)
          {
            if ([v111 isSubclassOfClass:objc_opt_class()])
            {
              long long v145 = 0u;
              long long v146 = 0u;
              *(_OWORD *)v143 = 0u;
              long long v144 = 0u;
              v112 = v125;
              uint64_t v113 = [v112 countByEnumeratingWithState:v143 objects:buf count:16];
              if (!v113) {
                goto LABEL_178;
              }
              uint64_t v114 = *(void *)v144;
LABEL_161:
              uint64_t v115 = 0;
              while (1)
              {
                if (*(void *)v144 != v114) {
                  objc_enumerationMutation(v112);
                }
                id v116 = *(id *)(*(void *)&v143[8] + 8 * v115);
                if (objc_opt_isKindOfClass()) {
                  break;
                }

                if (v113 == ++v115)
                {
                  uint64_t v113 = [v112 countByEnumeratingWithState:v143 objects:buf count:16];
                  if (!v113)
                  {
LABEL_178:

                    goto LABEL_179;
                  }
                  goto LABEL_161;
                }
              }

              if (!v116)
              {
LABEL_179:
                v103 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446978;
                  *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 569;
                  *(_WORD *)&unsigned char buf[18] = 2082;
                  *(void *)&buf[20] = "-[MapsSuggestionsRoutine _suggestionEntryForPLOI:]";
                  *(_WORD *)&buf[28] = 2082;
                  *(void *)&buf[30] = "nil == (rtSource)";
                  _os_log_impl(&dword_1A70DF000, v103, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. ParkedCar needs to be a VehicleEvent", buf, 0x26u);
                }
                goto LABEL_181;
              }
              v120 = [v116 vehicleEvent];
              char v121 = -[MapsSuggestionsRoutine _addParkedCarFieldsToSuggestionsEntry:vehicleEvent:](v64, v120);

              if (v121) {
                goto LABEL_155;
              }
LABEL_182:
              long long v70 = 0;
LABEL_183:

              goto LABEL_184;
            }
            v112 = GEOFindOrCreateLog();
            if (!os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
              goto LABEL_178;
            }
            *(_DWORD *)v147 = 136446978;
            *(void *)&v147[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
            *(_WORD *)&v147[12] = 1024;
            *(_DWORD *)&v147[14] = 280;
            *(_WORD *)&v147[18] = 2082;
            *(void *)&v147[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutineVehicleEvent]";
            *(_WORD *)&v147[28] = 2082;
            *(void *)&v147[30] = "! [rtSourceClass isSubclassOfClass:[RTSource class]]";
            v118 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a RTSource-derived class";
          }
          else
          {
            v112 = GEOFindOrCreateLog();
            if (!os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
              goto LABEL_178;
            }
            *(_DWORD *)v147 = 136446978;
            *(void *)&v147[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
            *(_WORD *)&v147[12] = 1024;
            *(_DWORD *)&v147[14] = 279;
            *(_WORD *)&v147[18] = 2082;
            *(void *)&v147[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutineVehicleEvent]";
            *(_WORD *)&v147[28] = 2082;
            *(void *)&v147[30] = "nil == (rtSourceClass)";
            v118 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a class";
          }
        }
        else
        {
          v112 = GEOFindOrCreateLog();
          if (!os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
            goto LABEL_178;
          }
          *(_DWORD *)v147 = 136446978;
          *(void *)&v147[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
          *(_WORD *)&v147[12] = 1024;
          *(_DWORD *)&v147[14] = 278;
          *(_WORD *)&v147[18] = 2082;
          *(void *)&v147[20] = "T *_get(NSArray<RTSource *> *__strong) [T = RTSourceCoreRoutineVehicleEvent]";
          *(_WORD *)&v147[28] = 2082;
          *(void *)&v147[30] = "nil == (rtSources)";
          v118 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sources";
        }
        _os_log_impl(&dword_1A70DF000, v112, OS_LOG_TYPE_ERROR, v118, v147, 0x26u);
        goto LABEL_178;
      default:
        if (v12 == 19)
        {
          GEOConfigGetDouble();
          [(MapsSuggestionsEntry *)v64 setWeight:v99 * v102];
          if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1) {
LABEL_192:
          }
            dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
LABEL_155:
          v106 = v64;
          v107 = [(MapsSuggestionsEntry *)v106 stringForKey:@"MapsSuggestionsCoreRoutineCustomLabel"];
          v108 = [(MapsSuggestionsEntry *)v106 numberForKey:@"MapsSuggestionsCoreRoutineType"];
          uint64_t v109 = [v108 integerValue];

          v110 = MapsSuggestionsRoutineLocalizedLabelLOIType(v109, v107);
          [(MapsSuggestionsEntry *)v106 setString:v110 forKey:@"MapsSuggestionsCoreRoutineLabel"];

          long long v70 = v106;
          goto LABEL_183;
        }
LABEL_149:
        v103 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 577;
          *(_WORD *)&unsigned char buf[18] = 2082;
          *(void *)&buf[20] = "-[MapsSuggestionsRoutine _suggestionEntryForPLOI:]";
          *(_WORD *)&buf[28] = 2082;
          *(void *)&buf[30] = "type == type";
          _os_log_impl(&dword_1A70DF000, v103, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. We converted into an EntryType we can't handle?!", buf, 0x26u);
        }
LABEL_181:

        goto LABEL_182;
    }
  }
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (!s_verbose)
  {
    long long v70 = 0;
    goto LABEL_186;
  }
  GEOFindOrCreateLog();
  log = (MapsSuggestionsEntry *)(id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&log->super, OS_LOG_TYPE_DEBUG))
  {
    id v69 = NSStringFromMapsSuggestionsEntryType(v12);
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v69;
    _os_log_impl(&dword_1A70DF000, &log->super, OS_LOG_TYPE_DEBUG, "RoutineSource drops type of %@", buf, 0xCu);
  }
  long long v70 = 0;
LABEL_185:

LABEL_186:
  return v70;
}

intptr_t __50__MapsSuggestionsRoutine__suggestionEntryForPLOI___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v4 + 48) = a2;
  *(double *)(v4 + 56) = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Successfully shifted entry's coordinate.", v7, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __50__MapsSuggestionsRoutine__suggestionEntryForPLOI___block_invoke_340(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "Failed to shift entry's coordinate: %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64__MapsSuggestionsRoutine__resolveMapItemsAndAddEntries_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "Could not get MapItem: %@", (uint8_t *)&v13, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
    int v9 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained[15] setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
      __int16 v10 = [*(id *)(a1 + 48) numberForKey:@"MapsSuggestionsGEOMapItemOriginKey"];
      [v9[16] setObject:v10 forKeyedSubscript:*(void *)(a1 + 40)];

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
    else
    {
      GEOFindOrCreateLog();
      unint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136446722;
        uint64_t v14 = "MapsSuggestionsRoutine.mm";
        __int16 v15 = 1026;
        int v16 = 673;
        __int16 v17 = 2082;
        uint64_t v18 = "-[MapsSuggestionsRoutine _resolveMapItemsAndAddEntries:handler:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v13, 0x1Cu);
      }
    }
  }
}

- (void)_addMapItemToShortcut:(void *)a3 fromLOI:(void *)a4 group:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  int v9 = a4;
  __int16 v10 = v9;
  if (!v7)
  {
    unint64_t v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136446978;
    uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
    __int16 v20 = 1024;
    int v21 = 753;
    __int16 v22 = 2082;
    __int16 v23 = "-[MapsSuggestionsRoutine _addMapItemToShortcut:fromLOI:group:]";
    __int16 v24 = 2082;
    uint64_t v25 = "nil == (shortcut)";
    uint64_t v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a shortcut";
LABEL_11:
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, v14, buf, 0x26u);
    goto LABEL_12;
  }
  if (!v8)
  {
    unint64_t v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136446978;
    uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
    __int16 v20 = 1024;
    int v21 = 754;
    __int16 v22 = 2082;
    __int16 v23 = "-[MapsSuggestionsRoutine _addMapItemToShortcut:fromLOI:group:]";
    __int16 v24 = 2082;
    uint64_t v25 = "nil == (loi)";
    uint64_t v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a LOI";
    goto LABEL_11;
  }
  if (!v9)
  {
    unint64_t v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136446978;
    uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
    __int16 v20 = 1024;
    int v21 = 755;
    __int16 v22 = 2082;
    __int16 v23 = "-[MapsSuggestionsRoutine _addMapItemToShortcut:fromLOI:group:]";
    __int16 v24 = 2082;
    uint64_t v25 = "nil == (group)";
    uint64_t v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a dispatch group";
    goto LABEL_11;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  dispatch_group_enter(v10);
  id v11 = *(void **)(a1 + 16);
  unint64_t v12 = [v8 mapItem];
  int v13 = [v12 geoMapItemHandle];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__MapsSuggestionsRoutine__addMapItemToShortcut_fromLOI_group___block_invoke;
  v15[3] = &unk_1E5CB8F68;
  int v16 = v10;
  id v17 = v7;
  [v11 resolveMapItemHandleData:v13 completion:v15];

LABEL_12:
}

void __62__MapsSuggestionsRoutine__addMapItemToShortcut_fromLOI_group___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Could not resolve Shortcut mapItem, error: %@", (uint8_t *)&v13, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    id v8 = [v5 firstObject];
    int v9 = MapsSuggestionsMapItemConvertIfNeeded(v8);
    [*(id *)(a1 + 40) setGeoMapItem:v9];

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    id v10 = *(id *)(a1 + 40);
    id v11 = v10;
    if (v10 && ([v10 isSetupPlaceholder] & 1) == 0)
    {
      unint64_t v12 = [v11 type] & 0xFFFFFFFFFFFFFFFELL;

      if (v12 == 2 && MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1) {
        dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
      }
    }
    else
    {
    }
  }
}

- (id)capLocationsOfInterest:(unint64_t)a3 maxResults:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    if ([v5 count] <= a3)
    {
      id v8 = v6;
    }
    else
    {
      id v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_361];
      objc_msgSend(v7, "subarrayWithRange:", 0, a3);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __60__MapsSuggestionsRoutine_capLocationsOfInterest_maxResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = NSNumber;
  id v6 = [a2 visits];
  id v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  id v8 = NSNumber;
  int v9 = [v4 visits];
  id v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

- (char)fetchAllSuggestedLOIsExcludingTypes:(id)a3 minVisits:(unint64_t)a4 maxAge:(double)a5 maxResults:(unint64_t)a6 handler:(id)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v30 = a7;
  if (+[MapsSuggestionsSiri isEnabled])
  {
    dispatch_group_t v26 = dispatch_group_create();
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke;
    aBlock[3] = &unk_1E5CBA118;
    unint64_t v12 = v26;
    double v51 = v12;
    unint64_t v54 = a4;
    id v52 = v31;
    id v29 = v11;
    id v53 = v29;
    int v13 = _Block_copy(aBlock);
    objc_initWeak(location, self);
    dispatch_group_enter(v12);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_368;
    block[3] = &unk_1E5CB9AE8;
    objc_copyWeak(v48, location);
    v48[1] = *(id *)&a5;
    id v28 = v13;
    id v47 = v28;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);
    dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    id v27 = -[MapsSuggestionsRoutine capLocationsOfInterest:maxResults:]((uint64_t)self, v29, a6);
    id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v27, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v27;
    uint64_t v15 = [obj countByEnumeratingWithState:&v42 objects:v55 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v43 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = [[MapsSuggestionsLocationOfInterest alloc] initWithLOI:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          dispatch_group_enter(v12);
          networkRequester = self->_networkRequester;
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_370;
          v37[3] = &unk_1E5CBA140;
          objc_copyWeak(&v41, location);
          __int16 v20 = v12;
          objc_super v38 = v20;
          id v39 = v14;
          int v21 = v18;
          uint64_t v40 = v21;
          if (![(MapsSuggestionsLocationOfInterest *)v21 hydrateMapItemWithNetworkRequester:networkRequester completion:v37])dispatch_group_leave(v20); {

          }
          objc_destroyWeak(&v41);
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v42 objects:v55 count:16];
      }
      while (v15);
    }

    innerQueue = self->_queue._innerQueue;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_372;
    v34[3] = &unk_1E5CB8EA0;
    id v35 = v14;
    id v36 = v30;
    id v23 = v14;
    dispatch_group_notify(v12, innerQueue, v34);

    objc_destroyWeak(v48);
    objc_destroyWeak(location);

    char v24 = 1;
  }
  else
  {
    unint64_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to fetch shortcuts", (uint8_t *)location, 2u);
    }
    char v24 = 0;
  }

  return v24;
}

void __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v31 = v6;
  uint64_t v32 = v5;
  if (!v5 || v6)
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v30 = @"NO";
      if (!v5) {
        id v30 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      long long v45 = v30;
      __int16 v46 = 2112;
      id v47 = v31;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "LOIs: Error fetching LOIs. is LOIs nil? %@, Error: %@", buf, 0x16u);
    }
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v36;
      uint64_t v33 = a1;
      do
      {
        uint64_t v34 = v8;
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          unint64_t v12 = objc_msgSend(v11, "visits", v31);
          unint64_t v13 = [v12 count];

          if (v13 < *(void *)(a1 + 56))
          {
            GEOFindOrCreateLog();
            id v14 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v15 = [v11 identifier];
              *(_DWORD *)buf = 138412546;
              long long v45 = v15;
              __int16 v46 = 1024;
              LODWORD(v47) = v13;
              _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "Skipping %@: only %u visits", buf, 0x12u);
            }
LABEL_11:

            continue;
          }
          uint64_t v16 = [v11 mapItem];
          BOOL v17 = v16 == 0;

          if (v17)
          {
            GEOFindOrCreateLog();
            id v14 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              id v29 = [v11 identifier];
              *(_DWORD *)buf = 138412290;
              long long v45 = v29;
              _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "Skipping %@: no mapItem", buf, 0xCu);
            }
            goto LABEL_11;
          }
          uint64_t v18 = *(void **)(a1 + 40);
          if (v18 && [v18 count])
          {
            uint64_t v19 = *(void **)(a1 + 40);
            id v20 = v11;
            id v21 = v19;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            id v22 = v21;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:buf count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v40;
              while (2)
              {
                for (uint64_t j = 0; j != v23; ++j)
                {
                  if (*(void *)v40 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  dispatch_group_t v26 = v7;
                  uint64_t v27 = [*(id *)(*((void *)&v39 + 1) + 8 * j) integerValue];
                  if (shortcutTypeForRTLOIType([v20 type]) == v27)
                  {

                    id v7 = v26;
                    a1 = v33;

                    goto LABEL_29;
                  }
                  id v7 = v26;
                }
                uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:buf count:16];
                a1 = v33;
                if (v23) {
                  continue;
                }
                break;
              }
            }
          }
          id v28 = *(id *)(a1 + 48);
          objc_sync_enter(v28);
          [*(id *)(a1 + 48) addObject:v11];
          objc_sync_exit(v28);

LABEL_29:
          ;
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v8);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_368(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = MapsSuggestionsNowWithOffset(-*(double *)(a1 + 48));
    [WeakRetained[1] fetchLocationsOfInterestVisitedSinceDate:v3 withHandler:*(void *)(a1 + 32)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsRoutine.mm";
      __int16 v7 = 1026;
      int v8 = 832;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsRoutine fetchAllSuggestedLOIsExcludingTypes:minVisits:maxAge:maxResults:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_370(id *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_371;
    v6[3] = &unk_1E5CB9AC0;
    __int16 v7 = v3;
    id v8 = a1[4];
    id v9 = a1[5];
    id v10 = a1[6];
    dispatch_async(WeakRetained[3], v6);

    int v5 = v7;
  }
  else
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      unint64_t v12 = "MapsSuggestionsRoutine.mm";
      __int16 v13 = 1026;
      int v14 = 850;
      __int16 v15 = 2082;
      uint64_t v16 = "-[MapsSuggestionsRoutine fetchAllSuggestedLOIsExcludingTypes:minVisits:maxAge:maxResults:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_371(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_ERROR, "returnedError: %@", (uint8_t *)&v5, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 56)];
    id v4 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v4);
  }
}

void __98__MapsSuggestionsRoutine_fetchAllSuggestedLOIsExcludingTypes_minVisits_maxAge_maxResults_handler___block_invoke_372(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (char)fetchSuggestedLOIsForTypes:(id)a3 minVisits:(unint64_t)a4 maxAge:(double)a5 maxResults:(unint64_t)a6 handler:(id)a7
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v34 = a7;
  if (!v34)
  {
    id v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v66 = 1024;
      int v67 = 881;
      __int16 v68 = 2082;
      id v69 = "-[MapsSuggestionsRoutine fetchSuggestedLOIsForTypes:minVisits:maxAge:maxResults:handler:]";
      __int16 v70 = 2082;
      long long v71 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }

    goto LABEL_31;
  }
  if (!+[MapsSuggestionsSiri isEnabled])
  {
    id v30 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id location = 0;
      _os_log_impl(&dword_1A70DF000, v30, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to fetch shortcuts", location, 2u);
    }
    goto LABEL_30;
  }
  if (!v35 || ![v35 count])
  {
    id v30 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id location = 0;
      _os_log_impl(&dword_1A70DF000, v30, OS_LOG_TYPE_DEBUG, "No types give to fetch. Not attempting to fetch shortcuts", location, 2u);
    }
LABEL_30:

LABEL_31:
    char v28 = 0;
    goto LABEL_32;
  }
  objc_initWeak((id *)location, self);
  dispatch_group_t v32 = dispatch_group_create();
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke;
  aBlock[3] = &unk_1E5CBA168;
  __int16 v13 = v32;
  id v60 = v13;
  unint64_t v62 = a4;
  id v33 = v12;
  id v61 = v33;
  long long v39 = _Block_copy(aBlock);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v35;
  uint64_t v14 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v56 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * i) integerValue];
        dispatch_group_enter(v13);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_373;
        block[3] = &unk_1E5CBA190;
        objc_copyWeak(v54, (id *)location);
        v54[1] = v17;
        id v53 = v39;
        v54[2] = *(id *)&a5;
        dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

        objc_destroyWeak(v54);
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v14);
  }

  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v18 = -[MapsSuggestionsRoutine capLocationsOfInterest:maxResults:]((uint64_t)self, v33, a6);
  id obja = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count", v18, v32));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v36 = v18;
  uint64_t v19 = [v36 countByEnumeratingWithState:&v48 objects:v63 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v49 != v20) {
          objc_enumerationMutation(v36);
        }
        id v22 = [[MapsSuggestionsLocationOfInterest alloc] initWithLOI:*(void *)(*((void *)&v48 + 1) + 8 * j)];
        dispatch_group_enter(v13);
        networkRequester = self->_networkRequester;
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_374;
        v43[3] = &unk_1E5CBA140;
        objc_copyWeak(&v47, (id *)location);
        uint64_t v24 = v13;
        long long v44 = v24;
        id v45 = obja;
        uint64_t v25 = v22;
        __int16 v46 = v25;
        if (![(MapsSuggestionsLocationOfInterest *)v25 hydrateMapItemWithNetworkRequester:networkRequester completion:v43])dispatch_group_leave(v24); {

        }
        objc_destroyWeak(&v47);
      }
      uint64_t v19 = [v36 countByEnumeratingWithState:&v48 objects:v63 count:16];
    }
    while (v19);
  }

  innerQueue = self->_queue._innerQueue;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_376;
  v40[3] = &unk_1E5CB8EA0;
  id v41 = obja;
  id v42 = v34;
  id v27 = obja;
  dispatch_group_notify(v13, innerQueue, v40);

  objc_destroyWeak((id *)location);
  char v28 = 1;
LABEL_32:

  return v28;
}

void __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v21 = v6;
  id v22 = v5;
  if (!v5 || v6)
  {
    uint64_t v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = @"NO";
      if (!v5) {
        uint64_t v20 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v29 = v20;
      __int16 v30 = 2112;
      id v31 = v21;
      uint64_t v7 = v19;
      _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_ERROR, "LOIs: Error fetching LOIs. is LOIs nil? %@, Error: %@", buf, 0x16u);
    }
    else
    {
      uint64_t v7 = v19;
    }
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "visits", v21);
          unint64_t v13 = [v12 count];

          if (v13 >= *(void *)(a1 + 48))
          {
            uint64_t v16 = [v11 mapItem];
            BOOL v17 = v16 == 0;

            if (!v17)
            {
              uint64_t v14 = *(id *)(a1 + 40);
              objc_sync_enter(v14);
              [*(id *)(a1 + 40) addObject:v11];
              objc_sync_exit(v14);
              goto LABEL_17;
            }
            GEOFindOrCreateLog();
            uint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v18 = [v11 identifier];
              *(_DWORD *)buf = 138412290;
              id v29 = v18;
              _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "Skipping %@: no mapItem", buf, 0xCu);
            }
          }
          else
          {
            GEOFindOrCreateLog();
            uint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v15 = [v11 identifier];
              *(_DWORD *)buf = 138412546;
              id v29 = v15;
              __int16 v30 = 1024;
              LODWORD(v31) = v13;
              _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "Skipping %@: only %u visits", buf, 0x12u);
            }
          }

LABEL_17:
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_373(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = 0;
    switch(*(void *)(a1 + 48))
    {
      case 0:
      case 1:
      case 6:
        id v5 = MapsSuggestionsNowWithOffset(-*(double *)(a1 + 56));
        [v3[1] fetchLocationsOfInterestVisitedSinceDate:v5 withHandler:*(void *)(a1 + 32)];

        break;
      case 2:
        goto LABEL_9;
      case 3:
        uint64_t v4 = 1;
        goto LABEL_9;
      case 5:
        uint64_t v4 = 2;
LABEL_9:
        [WeakRetained[1] fetchLocationsOfInterestOfType:v4 withHandler:*(void *)(a1 + 32)];
        break;
      default:
        break;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      uint64_t v8 = "MapsSuggestionsRoutine.mm";
      __int16 v9 = 1026;
      int v10 = 924;
      __int16 v11 = 2082;
      id v12 = "-[MapsSuggestionsRoutine fetchSuggestedLOIsForTypes:minVisits:maxAge:maxResults:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_374(id *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_375;
    v6[3] = &unk_1E5CB9AC0;
    int v7 = v3;
    id v8 = a1[4];
    id v9 = a1[5];
    id v10 = a1[6];
    dispatch_async(WeakRetained[3], v6);

    id v5 = v7;
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v12 = "MapsSuggestionsRoutine.mm";
      __int16 v13 = 1026;
      int v14 = 957;
      __int16 v15 = 2082;
      uint64_t v16 = "-[MapsSuggestionsRoutine fetchSuggestedLOIsForTypes:minVisits:maxAge:maxResults:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_375(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_ERROR, "returnedError: %@", (uint8_t *)&v5, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 56)];
    uint64_t v4 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v4);
  }
}

void __89__MapsSuggestionsRoutine_fetchSuggestedLOIsForTypes_minVisits_maxAge_maxResults_handler___block_invoke_376(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (char)fetchSuggestedShortcutsForType:(int64_t)a3 minVisits:(unint64_t)a4 maxAge:(double)a5 handler:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  if (v10)
  {
    if (+[MapsSuggestionsSiri isEnabled])
    {
      if ((unint64_t)a3 <= 1) {
        int64_t v11 = 1;
      }
      else {
        int64_t v11 = a3;
      }
      objc_initWeak((id *)location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke;
      aBlock[3] = &unk_1E5CBA1E0;
      id v26 = v10;
      objc_copyWeak(v27, (id *)location);
      v27[1] = (id)a4;
      v27[2] = (id)v11;
      id v12 = _Block_copy(aBlock);
      __int16 v13 = MapsSuggestionsNowWithOffset(-a5);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke_2;
      v21[3] = &unk_1E5CBA208;
      objc_copyWeak(v24, (id *)location);
      v24[1] = (id)v11;
      id v22 = v13;
      id v23 = v12;
      innerQueue = self->_queue._innerQueue;
      id v15 = v13;
      id v16 = v12;
      dispatch_async(innerQueue, v21);

      objc_destroyWeak(v24);
      objc_destroyWeak(v27);

      objc_destroyWeak((id *)location);
    }
    else
    {
      uint64_t v19 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id location = 0;
        _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to fetch shortcuts", location, 2u);
      }

      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
    char v18 = 1;
  }
  else
  {
    uint64_t v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v29 = 1024;
      int v30 = 988;
      __int16 v31 = 2082;
      uint64_t v32 = "-[MapsSuggestionsRoutine fetchSuggestedShortcutsForType:minVisits:maxAge:handler:]";
      __int16 v33 = 2082;
      id v34 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }

    char v18 = 0;
  }

  return v18;
}

void __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v20[13] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = @"NO";
      if (!v5) {
        id v10 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      char v18 = (char *)v10;
      __int16 v19 = 2112;
      *(void *)uint64_t v20 = v7;
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "Shortcuts: Error fetching LOIs. is LOIs nil? %@, Error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke_377;
      block[3] = &unk_1E5CBA1B8;
      objc_copyWeak(&v15, (id *)(a1 + 40));
      id v13 = v5;
      long long v16 = *(_OWORD *)(a1 + 48);
      id v14 = *(id *)(a1 + 32);
      dispatch_async(WeakRetained[3], block);

      objc_destroyWeak(&v15);
    }
    else
    {
      GEOFindOrCreateLog();
      int64_t v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        char v18 = "MapsSuggestionsRoutine.mm";
        __int16 v19 = 1026;
        *(_DWORD *)uint64_t v20 = 1011;
        v20[2] = 2082;
        *(void *)&v20[3] = "-[MapsSuggestionsRoutine fetchSuggestedShortcutsForType:minVisits:maxAge:handler:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
      }
    }
  }
}

void __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke_377(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    group = dispatch_group_create();
    uint64_t v2 = [*(id *)(a1 + 32) count];
    long long v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v2];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v3 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (!v3) {
      goto LABEL_17;
    }
    uint64_t v5 = *(void *)v32;
    *(void *)&long long v4 = 138412290;
    long long v23 = v4;
    while (1)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v32 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "visits", v23);
        unint64_t v9 = [v8 count];

        if (v9 >= *(void *)(a1 + 56))
        {
          id v12 = [v7 mapItem];
          BOOL v13 = v12 == 0;

          if (!v13)
          {
            id v14 = [MapsSuggestionsShortcut alloc];
            uint64_t v15 = *(void *)(a1 + 64);
            long long v16 = [v7 identifier];
            uint64_t v17 = [v16 UUIDString];
            char v18 = [v7 preferredName];
            id v10 = [(MapsSuggestionsShortcut *)v14 initWithType:v15 identifier:v17 geoMapItem:0 customName:v18];

            [v24 addObject:v10];
            -[MapsSuggestionsRoutine _addMapItemToShortcut:fromLOI:group:]((uint64_t)WeakRetained, v10, v7, group);
            goto LABEL_15;
          }
          GEOFindOrCreateLog();
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            __int16 v19 = [v7 identifier];
            *(_DWORD *)buf = v23;
            long long v37 = v19;
            _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "Skipping %@: no mapItem", buf, 0xCu);
          }
        }
        else
        {
          GEOFindOrCreateLog();
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            int64_t v11 = [v7 identifier];
            *(_DWORD *)buf = 138412546;
            long long v37 = v11;
            __int16 v38 = 1024;
            int v39 = v9;
            _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "Skipping %@: only %u visits", buf, 0x12u);
          }
        }

LABEL_15:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (!v3)
      {
LABEL_17:

        uint64_t v20 = WeakRetained[3];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke_379;
        block[3] = &unk_1E5CB8EA0;
        id v21 = *(id *)(a1 + 40);
        id v29 = v24;
        id v30 = v21;
        id v22 = v24;
        dispatch_group_notify(group, v20, block);

        goto LABEL_21;
      }
    }
  }
  GEOFindOrCreateLog();
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    long long v37 = "MapsSuggestionsRoutine.mm";
    __int16 v38 = 1026;
    int v39 = 1013;
    __int16 v40 = 2082;
    id v41 = "-[MapsSuggestionsRoutine fetchSuggestedShortcutsForType:minVisits:maxAge:handler:]_block_invoke";
    _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
  }
  group = v22;
LABEL_21:
}

uint64_t __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke_379(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __82__MapsSuggestionsRoutine_fetchSuggestedShortcutsForType_minVisits_maxAge_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = 0;
    switch(*(void *)(a1 + 56))
    {
      case 0:
      case 1:
      case 6:
        [WeakRetained[1] fetchLocationsOfInterestVisitedSinceDate:*(void *)(a1 + 32) withHandler:*(void *)(a1 + 40)];
        break;
      case 2:
        goto LABEL_9;
      case 3:
        uint64_t v4 = 1;
        goto LABEL_9;
      case 5:
        uint64_t v4 = 2;
LABEL_9:
        [WeakRetained[1] fetchLocationsOfInterestOfType:v4 withHandler:*(void *)(a1 + 40)];
        break;
      default:
        break;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      uint64_t v7 = "MapsSuggestionsRoutine.mm";
      __int16 v8 = 1026;
      int v9 = 1045;
      __int16 v10 = 2082;
      int64_t v11 = "-[MapsSuggestionsRoutine fetchSuggestedShortcutsForType:minVisits:maxAge:handler:]_block_invoke_2";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (char)readMeCardWithMinVisits:(unint64_t)a3 maxAge:(double)a4 handler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  int v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Entering method readMeCardWithMinVisits", buf, 2u);
  }

  if (v8)
  {
    if (+[MapsSuggestionsSiri isEnabled])
    {
      objc_initWeak((id *)buf, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke;
      aBlock[3] = &unk_1E5CBA230;
      id v26 = v8;
      objc_copyWeak(v27, (id *)buf);
      v27[1] = (id)a3;
      __int16 v10 = _Block_copy(aBlock);
      int64_t v11 = MapsSuggestionsNowWithOffset(-a4);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke_383;
      block[3] = &unk_1E5CB8720;
      objc_copyWeak(&v24, (id *)buf);
      id v22 = v11;
      id v12 = v10;
      id v23 = v12;
      innerQueue = self->_queue._innerQueue;
      id v14 = v11;
      dispatch_async(innerQueue, block);
      uint64_t v15 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Calling back", v20, 2u);
      }

      objc_destroyWeak(&v24);
      objc_destroyWeak(v27);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      char v18 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to fetch shortcuts for MeCard", buf, 2u);
      }

      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
    char v17 = 1;
  }
  else
  {
    long long v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v30 = 1024;
      int v31 = 1072;
      __int16 v32 = 2082;
      long long v33 = "-[MapsSuggestionsRoutine readMeCardWithMinVisits:maxAge:handler:]";
      __int16 v34 = 2082;
      uint64_t v35 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

    char v17 = 0;
  }

  return v17;
}

void __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v22[13] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = @"NO";
      if (!v5) {
        BOOL v13 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = (char *)v13;
      __int16 v21 = 2112;
      *(void *)id v22 = v7;
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "MeCard: Error fetching LOIs. is LOIs nil? %@, Error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      int v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Entering queue", buf, 2u);
      }

      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke_380;
      v15[3] = &unk_1E5CB87C0;
      objc_copyWeak(v18, (id *)(a1 + 40));
      id v10 = v5;
      int64_t v11 = *(void **)(a1 + 48);
      id v16 = v10;
      v18[1] = v11;
      id v17 = *(id *)(a1 + 32);
      dispatch_async(WeakRetained[3], v15);

      objc_destroyWeak(v18);
    }
    else
    {
      GEOFindOrCreateLog();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v20 = "MapsSuggestionsRoutine.mm";
        __int16 v21 = 1026;
        *(_DWORD *)id v22 = 1090;
        v22[2] = 2082;
        *(void *)&v22[3] = "-[MapsSuggestionsRoutine readMeCardWithMinVisits:maxAge:handler:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
      }
    }
  }
}

void __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke_380(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    group = dispatch_group_create();
    uint64_t v2 = [*(id *)(a1 + 32) count];
    id v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v2];
    uint64_t v3 = GEOFindOrCreateLog();
    uint64_t v27 = a1;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Starting to loop over shortcuts", buf, 2u);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v4)
    {
      uint64_t v6 = *(void *)v32;
      *(void *)&long long v5 = 138412546;
      long long v22 = v5;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v32 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          int v9 = objc_msgSend(v8, "visits", v22);
          unint64_t v10 = [v9 count];

          if (v10 >= *(void *)(v27 + 56))
          {
            id v14 = [MapsSuggestionsShortcut alloc];
            uint64_t v15 = shortcutTypeForRTLOIType([v8 type]);
            id v16 = [v8 identifier];
            id v17 = [v16 UUIDString];
            char v18 = [v8 preferredName];
            BOOL v13 = [(MapsSuggestionsShortcut *)v14 initWithType:v15 identifier:v17 geoMapItem:0 customName:v18];

            __int16 v19 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v37 = (char *)v13;
              _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Shortcut %@ created", buf, 0xCu);
            }

            [v23 addObject:v13];
            -[MapsSuggestionsRoutine _addMapItemToShortcut:fromLOI:group:]((uint64_t)WeakRetained, v13, v8, group);
            int64_t v11 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v37 = (char *)v13;
              _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Added MapItem to shortcut: %@", buf, 0xCu);
            }
          }
          else
          {
            GEOFindOrCreateLog();
            int64_t v11 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              id v12 = [v8 identifier];
              *(_DWORD *)buf = v22;
              long long v37 = v12;
              __int16 v38 = 1024;
              int v39 = v10;
              _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "Skipping %@: only %u visits", buf, 0x12u);
            }
            BOOL v13 = (MapsSuggestionsShortcut *)v11;
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v4);
    }

    uint64_t v20 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke_381;
    block[3] = &unk_1E5CB8198;
    id v29 = v23;
    id v30 = *(id *)(v27 + 40);
    __int16 v21 = v23;
    dispatch_group_notify(group, v20, block);
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      long long v37 = "MapsSuggestionsRoutine.mm";
      __int16 v38 = 1026;
      int v39 = 1093;
      __int16 v40 = 2082;
      id v41 = "-[MapsSuggestionsRoutine readMeCardWithMinVisits:maxAge:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    group = v21;
  }
}

void __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke_381(uint64_t a1)
{
  uint64_t v2 = [[MapsSuggestionsMeCard alloc] initWithShortcuts:*(void *)(a1 + 32) hasCorrected:1 hasGeocoded:1];
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Calling Handler", v4, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __65__MapsSuggestionsRoutine_readMeCardWithMinVisits_maxAge_handler___block_invoke_383(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Beginning to fetch locations of interest", (uint8_t *)&v5, 2u);
    }

    [WeakRetained[1] fetchLocationsOfInterestVisitedSinceDate:*(void *)(a1 + 32) withHandler:*(void *)(a1 + 40)];
    uint64_t v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "ASYNC FAILURE INVESTIGATION: Just fetched locations of interest", (uint8_t *)&v5, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      uint64_t v6 = "MapsSuggestionsRoutine.mm";
      __int16 v7 = 1026;
      int v8 = 1128;
      __int16 v9 = 2082;
      unint64_t v10 = "-[MapsSuggestionsRoutine readMeCardWithMinVisits:maxAge:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)updateFixedLOIs
{
  objc_initWeak(&location, self);
  if (+[MapsSuggestionsSiri isEnabled])
  {
    uint64_t v3 = self->_loiVisits;
    connector = self->_connector;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke;
    v16[3] = &unk_1E5CBA340;
    objc_copyWeak(&v18, &location);
    int v5 = v3;
    id v17 = v5;
    [(MapsSuggestionsRoutineConnector *)connector fetchLocationsOfInterestOfType:0 withHandler:v16];
    uint64_t v6 = self->_connector;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_2;
    v13[3] = &unk_1E5CBA340;
    objc_copyWeak(&v15, &location);
    __int16 v7 = v5;
    id v14 = v7;
    [(MapsSuggestionsRoutineConnector *)v6 fetchLocationsOfInterestOfType:1 withHandler:v13];
    int v8 = self->_connector;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_2_387;
    v10[3] = &unk_1E5CBA340;
    objc_copyWeak(&v12, &location);
    __int16 v9 = v7;
    uint64_t v11 = v9;
    [(MapsSuggestionsRoutineConnector *)v8 fetchLocationsOfInterestOfType:2 withHandler:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&v18);
  }
  else
  {
    __int16 v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to update LOIs", buf, 2u);
    }
  }

  objc_destroyWeak(&location);
}

void __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      __int16 v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v6;
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "Error getting Home LOIs: %@", buf, 0xCu);
      }
    }
    else
    {
      id v10 = *((id *)WeakRetained + 6);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_384;
      block[3] = &unk_1E5CB8630;
      id v13 = v10;
      id v14 = v5;
      id v15 = *(id *)(a1 + 32);
      uint64_t v11 = v8[3];
      __int16 v9 = v10;
      dispatch_async(v11, block);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v17 = "MapsSuggestionsRoutine.mm";
      __int16 v18 = 1026;
      int v19 = 1150;
      __int16 v20 = 2082;
      __int16 v21 = "-[MapsSuggestionsRoutine updateFixedLOIs]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_384(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) removeAllObjects];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v22;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v22 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v21 + 1) + 8 * v4);
        uint64_t v6 = *(void **)(a1 + 32);
        id v7 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        int v8 = [v5 location];
        [v8 latitude];
        double v10 = v9;
        uint64_t v11 = [v5 location];
        [v11 longitude];
        id v13 = (void *)[v7 initWithLatitude:v10 longitude:v12];
        id v14 = [v5 identifier];
        [v6 setObject:v13 forKey:v14];

        id v15 = *(void **)(a1 + 48);
        id v16 = NSNumber;
        id v17 = [v5 visits];
        __int16 v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        int v19 = [v5 identifier];
        [v15 setObject:v18 forKey:v19];

        if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1) {
          dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v2);
  }
}

void __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      double v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v6;
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "Error getting Work LOIs: %@", buf, 0xCu);
      }
    }
    else
    {
      id v10 = *((id *)WeakRetained + 7);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_386;
      block[3] = &unk_1E5CB8630;
      id v13 = v10;
      id v14 = v5;
      id v15 = *(id *)(a1 + 32);
      uint64_t v11 = v8[3];
      double v9 = v10;
      dispatch_async(v11, block);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    double v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v17 = "MapsSuggestionsRoutine.mm";
      __int16 v18 = 1026;
      int v19 = 1170;
      __int16 v20 = 2082;
      long long v21 = "-[MapsSuggestionsRoutine updateFixedLOIs]_block_invoke_2";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_386(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) removeAllObjects];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v22;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v22 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v21 + 1) + 8 * v4);
        uint64_t v6 = *(void **)(a1 + 32);
        id v7 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        int v8 = [v5 location];
        [v8 latitude];
        double v10 = v9;
        uint64_t v11 = [v5 location];
        [v11 longitude];
        id v13 = (void *)[v7 initWithLatitude:v10 longitude:v12];
        id v14 = [v5 identifier];
        [v6 setObject:v13 forKey:v14];

        id v15 = *(void **)(a1 + 48);
        id v16 = NSNumber;
        id v17 = [v5 visits];
        __int16 v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        int v19 = [v5 identifier];
        [v15 setObject:v18 forKey:v19];

        if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1) {
          dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v2);
  }
}

void __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_2_387(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      double v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v6;
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "Error getting School LOIs: %@", buf, 0xCu);
      }
    }
    else
    {
      id v10 = *((id *)WeakRetained + 8);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_388;
      block[3] = &unk_1E5CB8630;
      id v13 = v10;
      id v14 = v5;
      id v15 = *(id *)(a1 + 32);
      uint64_t v11 = v8[3];
      double v9 = v10;
      dispatch_async(v11, block);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    double v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v17 = "MapsSuggestionsRoutine.mm";
      __int16 v18 = 1026;
      int v19 = 1190;
      __int16 v20 = 2082;
      long long v21 = "-[MapsSuggestionsRoutine updateFixedLOIs]_block_invoke_2";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __41__MapsSuggestionsRoutine_updateFixedLOIs__block_invoke_388(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) removeAllObjects];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v22;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v22 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v21 + 1) + 8 * v4);
        uint64_t v6 = *(void **)(a1 + 32);
        id v7 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        int v8 = [v5 location];
        [v8 latitude];
        double v10 = v9;
        uint64_t v11 = [v5 location];
        [v11 longitude];
        id v13 = (void *)[v7 initWithLatitude:v10 longitude:v12];
        id v14 = [v5 identifier];
        [v6 setObject:v13 forKey:v14];

        id v15 = *(void **)(a1 + 48);
        id v16 = NSNumber;
        id v17 = [v5 visits];
        __int16 v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        int v19 = [v5 identifier];
        [v15 setObject:v18 forKey:v19];

        if (MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1) {
          dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v2);
  }
}

- (unint64_t)countHomeLOIs
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__MapsSuggestionsRoutine_countHomeLOIs__block_invoke;
  v3[3] = &unk_1E5CBA258;
  v3[4] = self;
  return MSg::Queue::sync<unsigned long>((NSObject **)&self->_queue, v3);
}

uint64_t __39__MapsSuggestionsRoutine_countHomeLOIs__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) count];
}

- (unint64_t)countWorkLOIs
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__MapsSuggestionsRoutine_countWorkLOIs__block_invoke;
  v3[3] = &unk_1E5CBA258;
  v3[4] = self;
  return MSg::Queue::sync<unsigned long>((NSObject **)&self->_queue, v3);
}

uint64_t __39__MapsSuggestionsRoutine_countWorkLOIs__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) count];
}

- (unint64_t)countSchoolLOIs
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__MapsSuggestionsRoutine_countSchoolLOIs__block_invoke;
  v3[3] = &unk_1E5CBA258;
  v3[4] = self;
  return MSg::Queue::sync<unsigned long>((NSObject **)&self->_queue, v3);
}

uint64_t __41__MapsSuggestionsRoutine_countSchoolLOIs__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) count];
}

- (char)fetchLastVisitAtLocation:(id)a3 handler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v7)
  {
    if (v6)
    {
      objc_initWeak((id *)location, self);
      connector = self->_connector;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_2;
      v13[3] = &unk_1E5CBA280;
      objc_copyWeak(&v16, (id *)location);
      id v14 = v6;
      id v15 = v8;
      [(MapsSuggestionsRoutineConnector *)connector fetchLocationOfInterestAtLocation:v14 withHandler:v13];

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)location);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke;
      block[3] = &unk_1E5CB8368;
      id v18 = v7;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);
    }
    char v11 = 1;
  }
  else
  {
    double v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v20 = 1024;
      int v21 = 1232;
      __int16 v22 = 2082;
      long long v23 = "-[MapsSuggestionsRoutine fetchLastVisitAtLocation:handler:]";
      __int16 v24 = 2082;
      long long v25 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }

    char v11 = 0;
  }

  return v11;
}

void __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"The location was nil; We have not visited nil."];
  (*(void (**)(uint64_t, void, void))(v1 + 16))(v1, 0, 0);
}

void __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      int v8 = (char *)[[NSString alloc] initWithFormat:@"Error getting LOI at %@: %@", *(void *)(a1 + 32), v6];
      double v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v24 = v8;
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_398;
      block[3] = &unk_1E5CB8EA0;
      double v10 = *(id *)(a1 + 40);
      int v21 = v8;
      __int16 v22 = v10;
      char v11 = WeakRetained[3];
      double v12 = v8;
      dispatch_async(v11, block);

      id v13 = v22;
    }
    else
    {
      double v12 = [v5 visits];
      if ([v12 count])
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_3;
        v15[3] = &unk_1E5CB8EA0;
        id v17 = *(id *)(a1 + 40);
        id v16 = v12;
        dispatch_async(WeakRetained[3], v15);

        id v14 = &v17;
      }
      else
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        id v18[2] = __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_2_399;
        v18[3] = &unk_1E5CB8368;
        id v14 = &v19;
        id v19 = *(id *)(a1 + 40);
        dispatch_async(WeakRetained[3], v18);
      }
      id v13 = *v14;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v24 = "MapsSuggestionsRoutine.mm";
      __int16 v25 = 1026;
      int v26 = 1245;
      __int16 v27 = 2082;
      char v28 = "-[MapsSuggestionsRoutine fetchLastVisitAtLocation:handler:]_block_invoke_2";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    double v12 = (char *)v13;
  }
}

void __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_398(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void, void))(v1 + 16))(v1, 0, 0);
}

uint64_t __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_2_399(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__MapsSuggestionsRoutine_fetchLastVisitAtLocation_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) lastObject];
  uint64_t v3 = [v6 entryDate];
  uint64_t v4 = [*(id *)(a1 + 32) lastObject];
  id v5 = [v4 exitDate];
  (*(void (**)(uint64_t, void *, void *, void))(v2 + 16))(v2, v3, v5, 0);
}

- (void)_cacheEntryExitDatesFromVisit:(void *)a3 forMapItemIdentifier:(void *)a4 name:
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  char BOOL = GEOConfigGetBOOL();
  char v11 = *(void **)(a1 + 80);
  if (BOOL)
  {
    if (!v11)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v13 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v12;
    }
    if (!*(void *)(a1 + 88))
    {
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
      id v15 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v7;
      id v17 = [v16 entry];
      id v18 = [v16 exit];

      if (v17 && v18)
      {
        v31[0] = v17;
        v31[1] = v18;
        id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
        [*(id *)(a1 + 80) setObject:v19 forKeyedSubscript:v8];

        GEOFindOrCreateLog();
        __int16 v20 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          int v21 = [*(id *)(a1 + 80) objectForKeyedSubscript:v8];
          __int16 v22 = [v8 description];
          int v25 = 138412802;
          int v26 = v21;
          __int16 v27 = 2112;
          id v28 = v9;
          __int16 v29 = 2112;
          id v30 = v22;
          _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_DEBUG, "Caching dates %@ for %@, %@", (uint8_t *)&v25, 0x20u);
        }
        goto LABEL_16;
      }
    }
    else
    {
      id v18 = 0;
      id v17 = 0;
    }
    __int16 v24 = [MEMORY[0x1E4F1CA98] null];
    [*(id *)(a1 + 80) setObject:v24 forKeyedSubscript:v8];

LABEL_16:
    goto LABEL_17;
  }
  *(void *)(a1 + 80) = 0;

  long long v23 = *(void **)(a1 + 88);
  *(void *)(a1 + 88) = 0;

  id v17 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "Caching of visits from Routine is disabled. Returning.", (uint8_t *)&v25, 2u);
  }
LABEL_17:
}

void __44__MapsSuggestionsRoutine__fetchStoredVisits__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    GEOFindOrCreateLog();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "count"));
      int v10 = 138412290;
      char v11 = v9;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Got %@ visits from CoreRoutine. About to Signal the Semaphore.", (uint8_t *)&v10, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (char)fetchLastVisitAtMapItem:(id)a3 withinDistance:(double)a4 handler:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (!v8
      || ([v8 _identifier], int v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
    {
      id v17 = [v8 _identifier];

      if (!v17)
      {
        GEOFindOrCreateLog();
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          id v19 = [v8 name];
          *(_DWORD *)id v45 = 138412290;
          *(void *)&v45[4] = v19;
          _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "mapItemIdentifier is nil for %@", v45, 0xCu);
        }
      }
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke;
      v39[3] = &unk_1E5CB8368;
      id v40 = v9;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v39);

      goto LABEL_19;
    }
    if (GEOConfigGetBOOL())
    {
      GEOConfigGetDouble();
      uint64_t v12 = v11;
      uint64_t v35 = 0;
      uint64_t v36 = &v35;
      uint64_t v37 = 0x2020000000;
      char v38 = 0;
      *(void *)id v45 = 0;
      *(void *)&v45[8] = v45;
      *(void *)&v45[16] = 0x3032000000;
      *(void *)&v45[24] = __Block_byref_object_copy__404;
      *(void *)&v45[32] = __Block_byref_object_dispose__405;
      id v46 = 0;
      dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue._innerQueue);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke_2;
      block[3] = &unk_1E5CBA2D0;
      void block[4] = self;
      uint64_t v34 = v12;
      id v13 = v8;
      id v31 = v13;
      long long v32 = v45;
      long long v33 = &v35;
      dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, block);
      if (*((unsigned char *)v36 + 24))
      {
        GEOFindOrCreateLog();
        uint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          id v15 = [v13 name];
          uint64_t v16 = *(void *)(*(void *)&v45[8] + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v42 = v15;
          __int16 v43 = 2112;
          uint64_t v44 = v16;
          _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "Returning cached dates for the visit to %@ instead of querying Routine. %@", buf, 0x16u);
        }
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        id v27[2] = __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke_409;
        id v27[3] = &unk_1E5CB7EC8;
        __int16 v29 = v45;
        id v28 = v9;
        dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v27);

        _Block_object_dispose(v45, 8);
        _Block_object_dispose(&v35, 8);
        goto LABEL_19;
      }

      _Block_object_dispose(v45, 8);
      _Block_object_dispose(&v35, 8);
    }
    objc_initWeak((id *)v45, self);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke_2_410;
    v23[3] = &unk_1E5CB87C0;
    objc_copyWeak(v26, (id *)v45);
    id v24 = v8;
    id v25 = v9;
    v26[1] = *(id *)&a4;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v23);

    objc_destroyWeak(v26);
    objc_destroyWeak((id *)v45);
LABEL_19:
    char v21 = 1;
    goto LABEL_20;
  }
  __int16 v20 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id v45 = 136446978;
    *(void *)&v45[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
    *(_WORD *)&v45[12] = 1024;
    *(_DWORD *)&v45[14] = 1407;
    *(_WORD *)&v45[18] = 2082;
    *(void *)&v45[20] = "-[MapsSuggestionsRoutine fetchLastVisitAtMapItem:withinDistance:handler:]";
    *(_WORD *)&v45[28] = 2082;
    *(void *)&v45[30] = "nil == (handler)";
    _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", v45, 0x26u);
  }

  char v21 = 0;
LABEL_20:

  return v21;
}

void __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"The mapItem was nil; We have not visited nil."];
  (*(void (**)(uint64_t, void, void))(v1 + 16))(v1, 0, 0);
}

void __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  if (v2 && MapsSuggestionsSecondsSince(v2) > *(double *)(a1 + 64))
  {
    uint64_t v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 64);
      int v15 = 134217984;
      uint64_t v16 = v4;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Resetting the cache. We do this every %g seconds", (uint8_t *)&v15, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
    id v5 = *(void **)(*(void *)(a1 + 32) + 88);
    *(void *)(*(void *)(a1 + 32) + 88) = 0;
  }
  if (*(void *)(*(void *)(a1 + 32) + 88))
  {
    id v6 = [*(id *)(a1 + 40) _identifier];
    if (v6)
    {
      id v7 = *(void **)(*(void *)(a1 + 32) + 80);
      id v8 = [*(id *)(a1 + 40) _identifier];
      id v9 = [v7 objectForKeyedSubscript:v8];
      LOBYTE(v7) = v9 == 0;

      if ((v7 & 1) == 0)
      {
        int v10 = *(void **)(*(void *)(a1 + 32) + 80);
        uint64_t v11 = [*(id *)(a1 + 40) _identifier];
        uint64_t v12 = [v10 objectForKeyedSubscript:v11];
        uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] == 2)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        }
      }
    }
  }
}

void __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke_409(uint64_t a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count] == 2
    && ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:0],
        (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v7 = (id)v2,
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:1],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v7,
        v3))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:0];
    id v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:1];
    (*(void (**)(uint64_t, id, void *, void))(v4 + 16))(v4, v8, v5, 0);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
}

void __73__MapsSuggestionsRoutine_fetchLastVisitAtMapItem_withinDistance_handler___block_invoke_2_410(uint64_t a1)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = (double *)WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 3));
    *(void *)&long long v79 = 0;
    *((void *)&v79 + 1) = &v79;
    *(void *)&long long v80 = 0x3032000000;
    *((void *)&v80 + 1) = __Block_byref_object_copy__404;
    *(void *)&long long v81 = __Block_byref_object_dispose__405;
    *((void *)&v81 + 1) = 0;
    *(void *)&long long v87 = 0;
    *((void *)&v87 + 1) = &v87;
    uint64_t v88 = 0x3032000000;
    v89 = __Block_byref_object_copy__404;
    v90 = __Block_byref_object_dispose__405;
    id v91 = 0;
    uint64_t v4 = (void *)*((void *)v3 + 12);
    uint64_t v78 = a1;
    if (!v4 || MapsSuggestionsSecondsSince(v4) > v3[13])
    {
      id v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = *((void *)v3 + 13);
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v6;
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Calling fetchStoredVisitsWithOptions again. We do this every %g seconds", buf, 0xCu);
      }

      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
      uint64_t v8 = MapsSuggestionsNow();
      id v9 = (void *)*((void *)v3 + 12);
      *((void *)v3 + 12) = v8;

      int v10 = (void *)*((void *)v3 + 1);
      GEOConfigGetDouble();
      double v12 = v11;
      uint64_t Integer = GEOConfigGetInteger();
      id v14 = objc_alloc(MEMORY[0x1E4F28C18]);
      int v15 = MapsSuggestionsNowWithOffset(-v12);
      uint64_t v16 = MapsSuggestionsNow();
      uint64_t v17 = (void *)[v14 initWithStartDate:v15 endDate:v16];

      id v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1EFC898B8, &unk_1EFC898D0, 0);
      id v19 = objc_alloc(MEMORY[0x1E4F5CF58]);
      __int16 v20 = [NSNumber numberWithDouble:*MEMORY[0x1E4F5D010]];
      char v21 = [NSNumber numberWithInteger:Integer];
      __int16 v22 = (void *)[v19 initWithAscending:1 confidence:v20 dateInterval:v17 labelVisit:1 limit:v21 sources:v18];

      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&buf[16] = __44__MapsSuggestionsRoutine__fetchStoredVisits__block_invoke;
      *(void *)&buf[24] = &unk_1E5CBA2A8;
      uint64_t v85 = &v79;
      long long v23 = v7;
      v84 = v23;
      v86 = &v87;
      [v10 fetchStoredVisitsWithOptions:v22 handler:buf];

      dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
      id v24 = *(void **)(*((void *)&v87 + 1) + 40);
      if (v24)
      {
        uint64_t v25 = [v24 copy];
        int v26 = (void *)*((void *)v3 + 14);
        *((void *)v3 + 14) = v25;
      }
    }
    v77 = *(id *)(*((void *)&v79 + 1) + 40);
    _Block_object_dispose(&v87, 8);

    _Block_object_dispose(&v79, 8);
    __int16 v27 = (void *)*((void *)v3 + 14);
    if (v77)
    {
      v3[14] = 0.0;

      id v28 = [NSString alloc];
      __int16 v29 = [*(id *)(v78 + 32) name];
      id v30 = (void *)[v28 initWithFormat:@"Error getting visits at %@, %@", v29, v77];

      id v31 = [MEMORY[0x1E4F1CA98] null];
      long long v32 = [*(id *)(v78 + 32) _identifier];
      long long v33 = [*(id *)(v78 + 32) name];
      -[MapsSuggestionsRoutine _cacheEntryExitDatesFromVisit:forMapItemIdentifier:name:]((uint64_t)v3, v31, v32, v33);

      uint64_t v34 = *(void *)(v78 + 40);
      uint64_t v35 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:v30];
      (*(void (**)(uint64_t, void, void, void *))(v34 + 16))(v34, 0, 0, v35);

      uint64_t v36 = v77;
    }
    else
    {
      double v38 = *(double *)(v78 + 56);
      int v39 = *(void **)(v78 + 32);
      id v40 = v27;
      id v41 = v39;
      v76 = v40;
      if (v40)
      {
        uint64_t v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v40, "count"));
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v43 = v40;
        uint64_t v44 = [v43 countByEnumeratingWithState:&v79 objects:buf count:16];
        if (v44)
        {
          uint64_t v45 = *(void *)v80;
          do
          {
            for (uint64_t i = 0; i != v44; ++i)
            {
              if (*(void *)v80 != v45) {
                objc_enumerationMutation(v43);
              }
              uint64_t v47 = *(void **)(*((void *)&v79 + 1) + 8 * i);
              double v48 = CLLocationCoordinate2DFromGEOLocationCoordinate2D([v41 coordinate]);
              double v50 = v49;
              long long v51 = [v47 location];
              [v51 latitude];
              CLLocationDegrees v53 = v52;
              unint64_t v54 = [v47 location];
              [v54 longitude];
              CLLocationCoordinate2D v56 = CLLocationCoordinate2DMake(v53, v55);

              MapsSuggestionsDistanceBetweenCoordinates(v48, v50, v56.latitude, v56.longitude);
              if (v57 <= v38)
              {
                long long v58 = [v47 placeInference];
                v59 = [v58 mapItem];
                BOOL v60 = v59 == 0;

                if (!v60) {
                  [v42 addObject:v47];
                }
              }
            }
            uint64_t v44 = [v43 countByEnumeratingWithState:&v79 objects:buf count:16];
          }
          while (v44);
        }

        if ([v42 count])
        {
          GEOFindOrCreateLog();
          id v61 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v62 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject count](v42, "count"));
            LODWORD(v87) = 138412290;
            *(void *)((char *)&v87 + 4) = v62;
            _os_log_impl(&dword_1A70DF000, v61, OS_LOG_TYPE_DEBUG, "RefinedVisits now contains %@ places", (uint8_t *)&v87, 0xCu);
          }
        }
        id v63 = [v42 copy];
      }
      else
      {
        uint64_t v42 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A70DF000, v42, OS_LOG_TYPE_ERROR, "_allVisits are nil", buf, 2u);
        }
        id v63 = 0;
      }

      long long v64 = _findMatchingVisit(*(void **)(v78 + 32), v63);
      if (v64)
      {
        id v65 = [*(id *)(v78 + 32) _identifier];
        __int16 v66 = [*(id *)(v78 + 32) name];
        -[MapsSuggestionsRoutine _cacheEntryExitDatesFromVisit:forMapItemIdentifier:name:]((uint64_t)v3, v64, v65, v66);

        uint64_t v67 = *(void *)(v78 + 40);
        __int16 v68 = [v64 entry];
        id v69 = [v64 exit];
        (*(void (**)(uint64_t, void *, void *, void))(v67 + 16))(v67, v68, v69, 0);
      }
      else
      {
        GEOFindOrCreateLog();
        __int16 v70 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        {
          long long v71 = [*(id *)(v78 + 32) name];
          uint64_t v72 = *(void *)(v78 + 56);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v71;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v72;
          _os_log_impl(&dword_1A70DF000, v70, OS_LOG_TYPE_DEBUG, "No matching LOI visit found in CR for %@ within a distance of %f", buf, 0x16u);
        }
        long long v73 = [MEMORY[0x1E4F1CA98] null];
        v74 = [*(id *)(v78 + 32) _identifier];
        v75 = [*(id *)(v78 + 32) name];
        -[MapsSuggestionsRoutine _cacheEntryExitDatesFromVisit:forMapItemIdentifier:name:]((uint64_t)v3, v73, v74, v75);

        (*(void (**)(void))(*(void *)(v78 + 40) + 16))();
      }

      uint64_t v36 = 0;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v37 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "MapsSuggestionsRoutine.mm";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 1467;
      *(_WORD *)&unsigned char buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsRoutine fetchLastVisitAtMapItem:withinDistance:handler:]_block_invoke_2";
      _os_log_impl(&dword_1A70DF000, v37, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

    uint64_t v36 = v37;
  }
}

- (char)fetchMostRecentVisitWithinDistance:(double)a3 ofMapItem:(id)a4 handler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  int v10 = v9;
  if (v9)
  {
    if (v8)
    {
      [v8 coordinate];
      uint64_t v13 = CLLocationFromGEOLocationCoordinate2D(v11, v12);
      objc_initWeak((id *)location, self);
      connector = self->_connector;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_2;
      v19[3] = &unk_1E5CBA2F8;
      objc_copyWeak(&v22, (id *)location);
      id v20 = v13;
      id v21 = v10;
      id v15 = v13;
      [(MapsSuggestionsRoutineConnector *)connector fetchLocationsOfInterestWithinDistance:v15 ofLocation:v19 withHandler:a3];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)location);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke;
      block[3] = &unk_1E5CB8368;
      id v24 = v9;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);
    }
    char v17 = 1;
  }
  else
  {
    uint64_t v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v26 = 1024;
      int v27 = 1501;
      __int16 v28 = 2082;
      __int16 v29 = "-[MapsSuggestionsRoutine fetchMostRecentVisitWithinDistance:ofMapItem:handler:]";
      __int16 v30 = 2082;
      id v31 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }

    char v17 = 0;
  }

  return v17;
}

void __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"The mapItem was nil; We have not visited nil."];
  (*(void (**)(uint64_t, void, void))(v1 + 16))(v1, 0, 0);
}

void __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v32 = a2;
  id v5 = a3;
  long long v33 = v5;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5)
    {
      uint64_t v6 = (char *)[[NSString alloc] initWithFormat:@"Error getting LOIs at %@: %@", *(void *)(a1 + 32), v5];
      dispatch_semaphore_t v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        double v52 = v6;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_417;
      block[3] = &unk_1E5CB8EA0;
      id v8 = *(id *)(a1 + 40);
      double v49 = v6;
      double v50 = v8;
      id v9 = WeakRetained[3];
      unint64_t v36 = v6;
      dispatch_async(v9, block);

      int v10 = v50;
    }
    else
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id obj = v32;
      uint64_t v11 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
      uint64_t v31 = a1;
      if (v11)
      {
        unint64_t v36 = 0;
        int v10 = 0;
        uint64_t v12 = *(void *)v45;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v45 != v12) {
              objc_enumerationMutation(obj);
            }
            id v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            id v15 = [v14 visits];
            BOOL v16 = [v15 count] == 0;

            if (!v16)
            {
              char v17 = [v14 visits];
              id v18 = [v17 lastObject];
              id v19 = [v18 entryDate];

              id v20 = [v14 visits];
              id v21 = [v20 lastObject];
              id v22 = [v21 exitDate];

              GEOFindOrCreateLog();
              long long v23 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                id v24 = [v14 identifier];
                *(_DWORD *)buf = 138412802;
                double v52 = v24;
                __int16 v53 = 2112;
                *(void *)unint64_t v54 = v19;
                *(_WORD *)&v54[8] = 2112;
                *(void *)&v54[10] = v22;
                _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_DEBUG, "%@ : {entry:%@} {exit:%@}", buf, 0x20u);
              }
              if (v19)
              {
                if (!v22)
                {
                  v41[0] = MEMORY[0x1E4F143A8];
                  v41[1] = 3221225472;
                  v41[2] = __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_418;
                  v41[3] = &unk_1E5CB8EA0;
                  id v27 = *(id *)(v31 + 40);
                  id v42 = v19;
                  id v43 = v27;
                  __int16 v28 = WeakRetained[3];
                  id v29 = v19;
                  dispatch_async(v28, v41);

                  __int16 v30 = obj;
                  goto LABEL_30;
                }
                if (v36 | (unint64_t)v10)
                {
                  if ([v22 compare:v10] == 1)
                  {
                    id v25 = v19;

                    __int16 v26 = v22;
                    unint64_t v36 = (unint64_t)v25;
                    int v10 = v26;
                  }
                }
                else
                {
                  unint64_t v36 = v19;
                  int v10 = v22;
                }
              }
            }
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
      else
      {
        unint64_t v36 = 0;
        int v10 = 0;
      }

      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_2_419;
      v37[3] = &unk_1E5CB8E50;
      id v40 = *(id *)(v31 + 40);
      unint64_t v36 = (unint64_t)(id)v36;
      id v38 = (id)v36;
      int v10 = v10;
      id v39 = v10;
      dispatch_async(WeakRetained[3], v37);

      __int16 v30 = v40;
LABEL_30:
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      double v52 = "MapsSuggestionsRoutine.mm";
      __int16 v53 = 1026;
      *(_DWORD *)unint64_t v54 = 1515;
      *(_WORD *)&v54[4] = 2082;
      *(void *)&v54[6] = "-[MapsSuggestionsRoutine fetchMostRecentVisitWithinDistance:ofMapItem:handler:]_block_invoke_2";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    unint64_t v36 = (unint64_t)v10;
  }
}

void __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_417(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void, void))(v1 + 16))(v1, 0, 0);
}

uint64_t __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_418(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0);
}

uint64_t __79__MapsSuggestionsRoutine_fetchMostRecentVisitWithinDistance_ofMapItem_handler___block_invoke_2_419(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

void __47__MapsSuggestionsRoutine_addParkedCarObserver___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  if (*(void *)(a1 + 32)
    && MapsSuggestionsIsLocationAllowedForBundleID((void *)*MEMORY[0x1E4F64320])
    && +[MapsSuggestionsSiri isEnabled])
  {
    if (v6)
    {
      dispatch_semaphore_t v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        uint64_t v12 = v6;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Error on VehicleEvent update: %@", (uint8_t *)&v11, 0xCu);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = WeakRetained;
    if (WeakRetained)
    {
      [(objc_class *)WeakRetained[5].isa callBlock:&__block_literal_global_423];
    }
    else
    {
      GEOFindOrCreateLog();
      int v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136446722;
        uint64_t v12 = "MapsSuggestionsRoutine.mm";
        __int16 v13 = 1026;
        int v14 = 1587;
        __int16 v15 = 2082;
        BOOL v16 = "-[MapsSuggestionsRoutine addParkedCarObserver:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v11, 0x1Cu);
      }

      id v9 = 0;
    }
  }
  else
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "We are not allowed to send out VehicleEvents right now.", (uint8_t *)&v11, 2u);
    }
  }
}

uint64_t __47__MapsSuggestionsRoutine_addParkedCarObserver___block_invoke_420(uint64_t a1, void *a2)
{
  return [a2 updatedParkedCar];
}

- (void)removeParkedCarObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  parkedCarObservers = self->_parkedCarObservers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__MapsSuggestionsRoutine_removeParkedCarObserver___block_invoke;
  v6[3] = &unk_1E5CB8238;
  objc_copyWeak(&v7, &location);
  [(MapsSuggestionsObservers *)parkedCarObservers unregisterObserver:v4 handler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __50__MapsSuggestionsRoutine_removeParkedCarObserver___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      uint64_t v3 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v5) = 0;
        _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Last ParkedCarObserver. Stop monitoring Routine.", (uint8_t *)&v5, 2u);
      }

      [WeakRetained[1] stopMonitoringVehicleEvents];
    }
    else
    {
      GEOFindOrCreateLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136446722;
        uint64_t v6 = "MapsSuggestionsRoutine.mm";
        __int16 v7 = 1026;
        int v8 = 1609;
        __int16 v9 = 2082;
        int v10 = "-[MapsSuggestionsRoutine removeParkedCarObserver:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }
    }
  }
}

- (void)removeParkedCarsAllowingFeature:(BOOL)a3 handler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(void))a4;
  if (v4)
  {
    [(MapsSuggestionsRoutineConnector *)self->_connector clearAllVehicleEventsWithHandler:v6];
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2050000000;
    __int16 v7 = (void *)qword_1EB6F02E0;
    uint64_t v14 = qword_1EB6F02E0;
    if (!qword_1EB6F02E0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = ___ZL27getMCProfileConnectionClassv_block_invoke;
      v10[3] = &unk_1E5CBA458;
      void v10[4] = &v11;
      ___ZL27getMCProfileConnectionClassv_block_invoke((uint64_t)v10);
      __int16 v7 = (void *)v12[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v11, 8);
    __int16 v9 = [v8 sharedConnection];
    [v9 setFindMyCarAllowed:0];

    v6[2](v6);
  }
}

- (char)touristBitForLocation:(id)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    int v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v19 = 1024;
      int v20 = 1635;
      __int16 v21 = 2082;
      id v22 = "-[MapsSuggestionsRoutine touristBitForLocation:handler:]";
      __int16 v23 = 2082;
      id v24 = "nil == (handler)";
      uint64_t v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler";
LABEL_9:
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x26u);
    }
LABEL_10:
    char v9 = 0;
    goto LABEL_14;
  }
  if (!v6)
  {
    int v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v19 = 1024;
      int v20 = 1636;
      __int16 v21 = 2082;
      id v22 = "-[MapsSuggestionsRoutine touristBitForLocation:handler:]";
      __int16 v23 = 2082;
      id v24 = "nil == (location)";
      uint64_t v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (+[MapsSuggestionsSiri isEnabled])
  {
    connector = self->_connector;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__MapsSuggestionsRoutine_touristBitForLocation_handler___block_invoke;
    v15[3] = &unk_1E5CBA390;
    BOOL v16 = v7;
    [(MapsSuggestionsRoutineConnector *)connector fetchRoutineModeFromLocation:v6 withHandler:v15];
    char v9 = 1;
    int v10 = v16;
  }
  else
  {
    uint64_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to get tourist bit", buf, 2u);
    }

    int v10 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"User turned off Siri Suggestions for Maps. We cannot go to CoreRoutine"];
    double v13 = MapsSuggestionsConfidenceDontKnow();
    (*((void (**)(id, NSObject *, double))v7 + 2))(v7, v10, v13);
    char v9 = 1;
  }
LABEL_14:

  return v9;
}

void __56__MapsSuggestionsRoutine_touristBitForLocation_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    if (a2 == 2)
    {
      v5.n128_f64[0] = MapsSuggestionsConfidenceDefinitelyTrue();
    }
    else
    {
      v5.n128_u64[0] = 0;
      if (a2 == 1) {
        v5.n128_f64[0] = MapsSuggestionsConfidenceDefinitelyFalse();
      }
    }
  }
  else
  {
    v5.n128_f64[0] = MapsSuggestionsConfidenceDontKnow();
  }
  (*(void (**)(__n128))(*(void *)(a1 + 32) + 16))(v5);
}

- (char)fetchLOIsSinceDate:(id)a3 handler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v22 = 1024;
      *(_DWORD *)__int16 v23 = 1667;
      *(_WORD *)&void v23[4] = 2082;
      *(void *)&v23[6] = "-[MapsSuggestionsRoutine fetchLOIsSinceDate:handler:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    goto LABEL_14;
  }
  if (!v6)
  {
    uint64_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v22 = 1024;
      *(_DWORD *)__int16 v23 = 1668;
      *(_WORD *)&void v23[4] = 2082;
      *(void *)&v23[6] = "-[MapsSuggestionsRoutine fetchLOIsSinceDate:handler:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (sinceDate)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a date", buf, 0x26u);
    }
LABEL_14:

    char v13 = 0;
    goto LABEL_19;
  }
  if (+[MapsSuggestionsSiri isEnabled])
  {
    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      char v9 = [(MapsSuggestionsRoutine *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      __int16 v21 = v9;
      __int16 v22 = 2080;
      *(void *)__int16 v23 = "fetchLocationsSinceDate";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    int v10 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "fetchLocationsSinceDate", "", buf, 2u);
    }

    connector = self->_connector;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke;
    v16[3] = &unk_1E5CB8E78;
    objc_copyWeak(&v18, &location);
    id v17 = v7;
    [(MapsSuggestionsRoutineConnector *)connector fetchLocationsOfInterestVisitedSinceDate:v6 withHandler:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to fetch locations", buf, 2u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  char v13 = 1;
LABEL_19:

  return v13;
}

void __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v21[13] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (!v6)
  {
    if (WeakRetained)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke_431;
      block[3] = &unk_1E5CB8720;
      objc_copyWeak(&v17, (id *)(a1 + 40));
      id v15 = v5;
      id v16 = *(id *)(a1 + 32);
      dispatch_async(v8[3], block);

      objc_destroyWeak(&v17);
      goto LABEL_18;
    }
    GEOFindOrCreateLog();
    char v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v19 = "MapsSuggestionsRoutine.mm";
      __int16 v20 = 1026;
      *(_DWORD *)__int16 v21 = 1689;
      v21[2] = 2082;
      *(void *)&v21[3] = "-[MapsSuggestionsRoutine fetchLOIsSinceDate:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    char v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v19 = "MapsSuggestionsRoutine.mm";
      __int16 v20 = 1026;
      *(_DWORD *)__int16 v21 = 1682;
      v21[2] = 2082;
      *(void *)&v21[3] = "-[MapsSuggestionsRoutine fetchLOIsSinceDate:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    goto LABEL_17;
  }
  char v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v19 = v6;
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "Could not get LOIs: %@", buf, 0xCu);
  }

  GEOFindOrCreateLog();
  int v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [(dispatch_queue_t *)v8 uniqueName];
    *(_DWORD *)buf = 138412546;
    __int16 v19 = v11;
    __int16 v20 = 2080;
    *(void *)__int16 v21 = "fetchLocationsSinceDate";
    _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
  }
  uint64_t v12 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchLocationsSinceDate", "", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_18:
}

void __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke_431(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    id v2 = dispatch_group_create();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v12 = a1;
    id obj = *(id *)(a1 + 32);
    uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v24 != v4) {
            objc_enumerationMutation(obj);
          }
          id v6 = -[MapsSuggestionsLocationOfInterest initWithLOI:]([MapsSuggestionsLocationOfInterest alloc], "initWithLOI:", *(void *)(*((void *)&v23 + 1) + 8 * i), v12);
          if (v6)
          {
            dispatch_group_enter(v2);
            uint64_t v7 = WeakRetained[2];
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke_432;
            v19[3] = &unk_1E5CBA3B8;
            id v8 = v2;
            __int16 v20 = v8;
            char v9 = v14;
            __int16 v21 = v9;
            int v10 = v6;
            __int16 v22 = v10;
            if (![(MapsSuggestionsLocationOfInterest *)v10 hydrateMapItemWithNetworkRequester:v7 completion:v19])
            {
              dispatch_group_leave(v8);

              goto LABEL_17;
            }
          }
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }

    uint64_t v11 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke_433;
    block[3] = &unk_1E5CBA3E0;
    void block[4] = WeakRetained;
    id v18 = *(id *)(v12 + 40);
    char v9 = v14;
    id v17 = v9;
    dispatch_group_notify(v2, v11, block);

    id v8 = v2;
  }
  else
  {
    GEOFindOrCreateLog();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v29 = "MapsSuggestionsRoutine.mm";
      __int16 v30 = 1026;
      int v31 = 1691;
      __int16 v32 = 2082;
      long long v33 = "-[MapsSuggestionsRoutine fetchLOIsSinceDate:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    char v9 = v8;
  }
LABEL_17:
}

void __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke_432(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "returnedError: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 40) addObject:*(void *)(a1 + 48)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __53__MapsSuggestionsRoutine_fetchLOIsSinceDate_handler___block_invoke_433(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [*(id *)(a1 + 32) uniqueName];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2080;
    char v9 = "fetchLocationsSinceDate";
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v4 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v4))
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchLocationsSinceDate", "", (uint8_t *)&v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (char)fetchLocationsSinceDate:(id)a3 handler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v22 = 1024;
      *(_DWORD *)long long v23 = 1732;
      *(_WORD *)&void v23[4] = 2082;
      *(void *)&v23[6] = "-[MapsSuggestionsRoutine fetchLocationsSinceDate:handler:]";
      __int16 v24 = 2082;
      long long v25 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    goto LABEL_14;
  }
  if (!v6)
  {
    uint64_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v22 = 1024;
      *(_DWORD *)long long v23 = 1733;
      *(_WORD *)&void v23[4] = 2082;
      *(void *)&v23[6] = "-[MapsSuggestionsRoutine fetchLocationsSinceDate:handler:]";
      __int16 v24 = 2082;
      long long v25 = "nil == (sinceDate)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a date", buf, 0x26u);
    }
LABEL_14:

    char v13 = 0;
    goto LABEL_19;
  }
  if (+[MapsSuggestionsSiri isEnabled])
  {
    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      char v9 = [(MapsSuggestionsRoutine *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      __int16 v21 = v9;
      __int16 v22 = 2080;
      *(void *)long long v23 = "fetchLocationsSinceDate";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    uint64_t v10 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "fetchLocationsSinceDate", "", buf, 2u);
    }

    connector = self->_connector;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__MapsSuggestionsRoutine_fetchLocationsSinceDate_handler___block_invoke;
    v16[3] = &unk_1E5CB8E78;
    objc_copyWeak(&v18, &location);
    id v17 = v7;
    [(MapsSuggestionsRoutineConnector *)connector fetchLocationsOfInterestVisitedSinceDate:v6 withHandler:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to fetch locations", buf, 2u);
    }

    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
  }
  char v13 = 1;
LABEL_19:

  return v13;
}

void __58__MapsSuggestionsRoutine_fetchLocationsSinceDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v21[13] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  __int16 v8 = WeakRetained;
  if (!v6)
  {
    if (WeakRetained)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__MapsSuggestionsRoutine_fetchLocationsSinceDate_handler___block_invoke_434;
      block[3] = &unk_1E5CB8720;
      objc_copyWeak(&v17, (id *)(a1 + 40));
      id v15 = v5;
      id v16 = *(id *)(a1 + 32);
      dispatch_async(v8[3], block);

      objc_destroyWeak(&v17);
      goto LABEL_18;
    }
    GEOFindOrCreateLog();
    char v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v19 = "MapsSuggestionsRoutine.mm";
      __int16 v20 = 1026;
      *(_DWORD *)__int16 v21 = 1754;
      v21[2] = 2082;
      *(void *)&v21[3] = "-[MapsSuggestionsRoutine fetchLocationsSinceDate:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    char v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v19 = "MapsSuggestionsRoutine.mm";
      __int16 v20 = 1026;
      *(_DWORD *)__int16 v21 = 1747;
      v21[2] = 2082;
      *(void *)&v21[3] = "-[MapsSuggestionsRoutine fetchLocationsSinceDate:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    goto LABEL_17;
  }
  char v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v19 = v6;
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "Could not get LOIs: %@", buf, 0xCu);
  }

  GEOFindOrCreateLog();
  uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [(dispatch_queue_t *)v8 uniqueName];
    *(_DWORD *)buf = 138412546;
    __int16 v19 = v11;
    __int16 v20 = 2080;
    *(void *)__int16 v21 = "fetchLocationsSinceDate";
    _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
  }
  uint64_t v12 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchLocationsSinceDate", "", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_18:
}

void __58__MapsSuggestionsRoutine_fetchLocationsSinceDate_handler___block_invoke_434(uint64_t a1)
{
  *(void *)((char *)&v42[14] + 2) = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  __int16 v32 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (dispatch_queue_t *)WeakRetained;
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    id v6 = v4;
    int v31 = v5;
    __int16 v30 = v6;
    dispatch_assert_queue_V2(v3[3]);
    uint64_t v7 = [v6 count];
    __int16 v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v40 = "-[MapsSuggestionsRoutine _treatLOIs:handler:]";
      __int16 v41 = 1024;
      LODWORD(v42[0]) = v7;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "%s: about to process %u routine LOIs", buf, 0x12u);
    }

    uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
    char v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v30;
    uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:buf count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(obj);
          }
          char v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v14 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          id v15 = [v13 location];
          [v15 latitude];
          double v17 = v16;
          id v18 = [v13 location];
          [v18 longitude];
          __int16 v20 = (void *)[v14 initWithLatitude:v17 longitude:v19];

          if (v20)
          {
            [v9 addObject:v20];
            __int16 v21 = [MEMORY[0x1E4F1CA98] null];
            __int16 v22 = [v13 visits];
            long long v23 = [v22 lastObject];
            __int16 v24 = [v23 exitDate];

            if (v24) {
              long long v25 = v24;
            }
            else {
              long long v25 = v21;
            }
            id v26 = v25;
            [v34 addObject:v26];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:buf count:16];
      }
      while (v10);
    }

    v31[2](v31, v9, v34, 0);
    GEOFindOrCreateLog();
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      __int16 v28 = [v32 uniqueName];
      *(_DWORD *)buf = 138412546;
      id v40 = v28;
      __int16 v41 = 2080;
      v42[0] = "fetchLocationsSinceDate";
      _os_log_impl(&dword_1A70DF000, v27, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    id v29 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "fetchLocationsSinceDate", "", buf, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v40 = "MapsSuggestionsRoutine.mm";
      __int16 v41 = 1026;
      LODWORD(v42[0]) = 1756;
      WORD2(v42[0]) = 2082;
      *(void *)((char *)v42 + 6) = "-[MapsSuggestionsRoutine fetchLocationsSinceDate:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)forgetLocationOfInterest:(id)a3 handler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__MapsSuggestionsRoutine_forgetLocationOfInterest_handler___block_invoke;
  v15[3] = &unk_1E5CBA408;
  id v16 = v6;
  id v17 = v7;
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = self;
  uint64_t v11 = v15;
  if (v10)
  {
    uint64_t v12 = v10;
    innerQueue = v10->_queue._innerQueue;
    *(void *)block = MEMORY[0x1E4F143A8];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = ___ZNK3MSg5Queue5asyncI22MapsSuggestionsRoutineEEvPT_U13block_pointerFvS4_E_block_invoke;
    *(void *)&unsigned char block[24] = &unk_1E5CB8198;
    *(void *)&block[32] = v12;
    double v19 = v11;
    dispatch_async(innerQueue, block);

    id v14 = *(NSObject **)&block[32];
  }
  else
  {
    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)block = 136446978;
      *(void *)&void block[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsQueue.hpp";
      *(_WORD *)&block[12] = 1024;
      *(_DWORD *)&block[14] = 208;
      *(_WORD *)&block[18] = 2082;
      *(void *)&block[20] = "void MSg::Queue::async(S *, void (^__strong)(S *)) const [S = MapsSuggestionsRoutine]";
      *(_WORD *)&block[28] = 2082;
      *(void *)&block[30] = "nil == (callerSelf)";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires self", block, 0x26u);
    }
  }
}

void __59__MapsSuggestionsRoutine_forgetLocationOfInterest_handler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v5 = (void *)[v3 initWithUUIDString:v4];

  [v6[1] removeLocationOfInterestWithIdentifier:v5 handler:*(void *)(a1 + 40)];
}

- (char)predictedExitTimeFromLocation:(id)a3 date:(id)a4 handler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = (char *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    long long v23 = v8;
    __int16 v24 = 2112;
    *(void *)long long v25 = v9;
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "Getting ExitTime of %@ at %@", buf, 0x16u);
  }

  if (!v10)
  {
    id v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136446978;
    long long v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
    __int16 v24 = 1024;
    *(_DWORD *)long long v25 = 1820;
    *(_WORD *)&v25[4] = 2082;
    *(void *)&v25[6] = "-[MapsSuggestionsRoutine predictedExitTimeFromLocation:date:handler:]";
    __int16 v26 = 2082;
    id v27 = "nil == (handler)";
    id v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_14:
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0x26u);
    goto LABEL_15;
  }
  if (!v8)
  {
    id v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136446978;
    long long v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
    __int16 v24 = 1024;
    *(_DWORD *)long long v25 = 1821;
    *(_WORD *)&v25[4] = 2082;
    *(void *)&v25[6] = "-[MapsSuggestionsRoutine predictedExitTimeFromLocation:date:handler:]";
    __int16 v26 = 2082;
    id v27 = "nil == (location)";
    id v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location";
    goto LABEL_14;
  }
  if (!v9)
  {
    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      long long v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v24 = 1024;
      *(_DWORD *)long long v25 = 1822;
      *(_WORD *)&v25[4] = 2082;
      *(void *)&v25[6] = "-[MapsSuggestionsRoutine predictedExitTimeFromLocation:date:handler:]";
      __int16 v26 = 2082;
      id v27 = "nil == (date)";
      id v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a date";
      goto LABEL_14;
    }
LABEL_15:
    char v13 = 0;
    goto LABEL_16;
  }
  if (+[MapsSuggestionsSiri isEnabled])
  {
    connector = self->_connector;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v18[2] = __69__MapsSuggestionsRoutine_predictedExitTimeFromLocation_date_handler___block_invoke;
    v18[3] = &unk_1E5CB8390;
    double v19 = v8;
    id v20 = v9;
    id v21 = v10;
    [(MapsSuggestionsRoutineConnector *)connector fetchPredictedExitDatesFromLocation:v19 onDate:v20 withHandler:v18];

    char v13 = 1;
    id v14 = v19;
  }
  else
  {
    id v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not attempting to get exit times", buf, 2u);
    }

    id v14 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"User turned off Siri Suggestions for Maps. We cannot go to CoreRoutine"];
    (*((void (**)(id, void, NSObject *))v10 + 2))(v10, 0, v14);
    char v13 = 1;
  }
LABEL_16:

  return v13;
}

void __69__MapsSuggestionsRoutine_predictedExitTimeFromLocation_date_handler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      int v15 = 138412802;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Error getting ExitTime for %@ at %@: %@", (uint8_t *)&v15, 0x20u);
    }
LABEL_9:

    (*(void (**)(void))(a1[6] + 16))();
    goto LABEL_10;
  }
  if (![v5 count])
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = a1[4];
      uint64_t v14 = a1[5];
      int v15 = 138412546;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "Unknown ExitTime for %@ at %@", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_9;
  }
  uint64_t v10 = a1[6];
  uint64_t v11 = [v5 firstObject];
  uint64_t v12 = [v11 date];
  (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v12, 0);

LABEL_10:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_mapItemCacheOrigin, 0);
  objc_storeStrong((id *)&self->_mapItemCache, 0);
  objc_storeStrong((id *)&self->_allVisits, 0);
  objc_storeStrong((id *)&self->_visitQueryTimeStamp, 0);
  objc_storeStrong((id *)&self->_cacheTimeStamp, 0);
  objc_storeStrong((id *)&self->_identifierToDatesMapping, 0);
  objc_storeStrong((id *)&self->_loiVisits, 0);
  objc_storeStrong((id *)&self->_loiLocationsForSchool, 0);
  objc_storeStrong((id *)&self->_loiLocationsForWork, 0);
  objc_storeStrong((id *)&self->_loiLocationsForHome, 0);
  objc_storeStrong((id *)&self->_parkedCarObservers, 0);

  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

@end