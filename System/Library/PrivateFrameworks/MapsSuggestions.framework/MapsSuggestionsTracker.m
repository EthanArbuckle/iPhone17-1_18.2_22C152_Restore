@interface MapsSuggestionsTracker
- (CLLocation)currentLocation;
- (GEOAutomobileOptions)automobileOptions;
- (MapsSuggestionsMutableWeakEntries)trackedEntries;
- (MapsSuggestionsNetworkRequester)networkRequester;
- (MapsSuggestionsPredictor)predictor;
- (MapsSuggestionsTracker)initWithManager:(id)a3 requirements:(id)a4 network:(id)a5 flightUpdater:(id)a6 virtualGarage:(id)a7;
- (NSString)uniqueName;
- (id)_q_etaTitleFormatterForType:(uint64_t)a1;
- (int)mapType;
- (uint64_t)_q_isUnusableETA:(uint64_t)a1;
- (uint64_t)_q_scheduleRefresh;
- (void)_q_decorateETA:(void *)a3 forEntry:;
- (void)_q_decorateEntry:(void *)a3 eta:(void *)a4 requiredChargeLevel:(void *)a5 currentChargeLevel:;
- (void)_q_rememberETA:(void *)a3 forEntry:;
- (void)_q_resetAllTitleFormatting;
- (void)_unschedule;
- (void)clearLocationAndETAs;
- (void)dealloc;
- (void)rescheduleRefreshOnlyIfAlreadyRunning;
- (void)resetAllTitleFormatting;
- (void)scheduleRefresh;
- (void)setAutomobileOptions:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMapType:(int)a3;
- (void)setNetworkRequester:(id)a3;
- (void)setPredictor:(id)a3;
- (void)setTitleFormatter:(id)a3 forType:(int64_t)a4;
- (void)setTrackedEntries:(id)a3;
- (void)trackSuggestionEntries:(id)a3 transportType:(int)a4;
- (void)unschedule;
@end

@implementation MapsSuggestionsTracker

- (MapsSuggestionsTracker)initWithManager:(id)a3 requirements:(id)a4 network:(id)a5 flightUpdater:(id)a6 virtualGarage:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v61.receiver = self;
  v61.super_class = (Class)MapsSuggestionsTracker;
  v17 = [(MapsSuggestionsTracker *)&v61 init];
  if (v17)
  {
    id v54 = v14;
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("MapsSuggestionsTrackerQueue", v18);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v19;

    objc_storeWeak((id *)&v17->_manager, v12);
    uint64_t v21 = [v13 copy];
    requirements = v17->_requirements;
    v17->_requirements = (MapsSuggestionsETARequirements *)v21;

    GEOConfigGetDouble();
    v17->_refreshInterval = v23;
    GEOConfigGetDouble();
    v17->_refreshLeeway = v24;
    GEOConfigGetDouble();
    double v26 = v25;
    GEOConfigGetDouble();
    v17->_refreshDeferTime = v27;
    v17->_transportType = GEOTransportTypeFromUserPreference();
    v17->_mapType = 0;
    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    etaTitleFormatters = v17->_etaTitleFormatters;
    v17->_etaTitleFormatters = v28;

    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    distanceTitleFormatters = v17->_distanceTitleFormatters;
    v17->_distanceTitleFormatters = v30;

    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    etaChargeTitleFormatters = v17->_etaChargeTitleFormatters;
    v17->_etaChargeTitleFormatters = v32;

    uint64_t v34 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
    previousETAs = v17->_previousETAs;
    v17->_previousETAs = (NSMutableDictionary *)v34;

    v36 = objc_alloc_init(MapsSuggestionsDonater);
    donater = v17->_donater;
    v17->_donater = v36;

    objc_initWeak(&location, v17);
    v58[1] = (id)MEMORY[0x1E4F143A8];
    v58[2] = (id)3221225472;
    v58[3] = __91__MapsSuggestionsTracker_initWithManager_requirements_network_flightUpdater_virtualGarage___block_invoke;
    v58[4] = &unk_1E5CB7F18;
    objc_copyWeak(&v59, &location);
    uint64_t v38 = _GEOConfigAddBlockListenerForKey();
    id transportTypeChangedListener = v17->_transportTypeChangedListener;
    v17->_id transportTypeChangedListener = (id)v38;

    objc_storeStrong((id *)&v17->_networkRequester, a5);
    uint64_t v40 = +[MapsSuggestionsPredictor sharedPredictor];
    predictor = v17->_predictor;
    v17->_predictor = (MapsSuggestionsPredictor *)v40;

    v42 = [[MapsSuggestionsETARequester alloc] initWithNetworkRequester:v17->_networkRequester transportModePredictor:v17->_predictor requirements:v13];
    etaRequester = v17->_etaRequester;
    v17->_etaRequester = v42;

    objc_storeStrong((id *)&v17->_virtualGarage, a7);
    objc_storeStrong((id *)&v17->_flightUpdater, a6);
    v44 = [MapsSuggestionsGCDTimer alloc];
    v45 = v17->_queue;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __91__MapsSuggestionsTracker_initWithManager_requirements_network_flightUpdater_virtualGarage___block_invoke_207;
    v57[3] = &unk_1E5CB8058;
    objc_copyWeak(v58, &location);
    uint64_t v46 = [(MapsSuggestionsGCDTimer *)v44 initWithName:@"MapsSuggestionsTrackerRefreshTimer" queue:v45 block:v57];
    refreshTimer = v17->_refreshTimer;
    v17->_refreshTimer = (MapsSuggestionsTimer *)v46;

    v48 = [MapsSuggestionsCanKicker alloc];
    v49 = v17->_queue;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __91__MapsSuggestionsTracker_initWithManager_requirements_network_flightUpdater_virtualGarage___block_invoke_213;
    v55[3] = &unk_1E5CB8058;
    objc_copyWeak(&v56, &location);
    uint64_t v50 = [(MapsSuggestionsCanKicker *)v48 initWithName:@"MapsSuggestionsTrackerLocationWiper" time:v49 queue:v55 block:v26];
    currentLocationWiper = v17->_currentLocationWiper;
    v17->_currentLocationWiper = (MapsSuggestionsCanKicker *)v50;

    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v17, (CFNotificationCallback)onLocaleCurrentLocaleDidChangeNotification, (CFStringRef)*MEMORY[0x1E4F1D200], 0, CFNotificationSuspensionBehaviorCoalesce);
    objc_destroyWeak(&v56);
    objc_destroyWeak(v58);
    objc_destroyWeak(&v59);
    objc_destroyWeak(&location);
    id v14 = v54;
  }

  return v17;
}

void __41__MapsSuggestionsTracker_scheduleRefresh__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 96) = 1;
    -[MapsSuggestionsTracker _q_scheduleRefresh]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      v5 = "MapsSuggestionsTracker.m";
      __int16 v6 = 1026;
      int v7 = 913;
      __int16 v8 = 2082;
      v9 = "-[MapsSuggestionsTracker scheduleRefresh]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (uint64_t)_q_scheduleRefresh
{
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 8));
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "_refresh schedule", v3, 2u);
    }

    return [*(id *)(v1 + 24) scheduleWithTimeInterval:*(double *)(v1 + 48) repeatAfter:*(double *)(v1 + 32) leeway:*(double *)(v1 + 40)];
  }
  return result;
}

- (void)trackSuggestionEntries:(id)a3 transportType:(int)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MapsSuggestionsTracker_trackSuggestionEntries_transportType___block_invoke;
  block[3] = &unk_1E5CB93E0;
  block[4] = self;
  id v8 = v6;
  int v14 = a4;
  id v12 = v8;
  id v13 = &v15;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v16 + 24))
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "New entries contained one or more previously-untracked entries. Forcing immediate update.", v10, 2u);
    }

    [(MapsSuggestionsTracker *)self scheduleRefresh];
  }

  _Block_object_dispose(&v15, 8);
}

- (void)scheduleRefresh
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "scheduleRefresh", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MapsSuggestionsTracker_scheduleRefresh__block_invoke;
  block[3] = &unk_1E5CB8058;
  objc_copyWeak(&v6, buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)setTitleFormatter:(id)a3 forType:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = v6;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__MapsSuggestionsTracker_setTitleFormatter_forType___block_invoke;
    block[3] = &unk_1E5CB9390;
    v11 = v6;
    id v12 = self;
    int64_t v13 = a4;
    dispatch_sync(queue, block);
    v9 = v11;
  }
  else
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
      __int16 v16 = 1024;
      int v17 = 202;
      __int16 v18 = 2082;
      dispatch_queue_t v19 = "-[MapsSuggestionsTracker setTitleFormatter:forType:]";
      __int16 v20 = 2082;
      uint64_t v21 = "nil == (titleFormatter)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a title formatter", buf, 0x26u);
    }
  }
}

void __52__MapsSuggestionsTracker_setTitleFormatter_forType___block_invoke(uint64_t *a1)
{
  if ([(id)a1[4] conformsToProtocol:&unk_1EFC8CFF8])
  {
    uint64_t v2 = a1[4];
    v3 = *(void **)(a1[5] + 72);
    int v4 = [NSNumber numberWithInteger:a1[6]];
    [v3 setObject:v2 forKeyedSubscript:v4];
  }
  if ([(id)a1[4] conformsToProtocol:&unk_1EFC8E9F0])
  {
    uint64_t v5 = a1[4];
    id v6 = *(void **)(a1[5] + 80);
    int v7 = [NSNumber numberWithInteger:a1[6]];
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
  if ([(id)a1[4] conformsToProtocol:&unk_1EFC95D78])
  {
    uint64_t v8 = a1[4];
    v9 = *(void **)(a1[5] + 88);
    id v10 = [NSNumber numberWithInteger:a1[6]];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
}

void __38__MapsSuggestionsTracker_setLocation___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    uint64_t v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(void **)(a1 + 32);
      int v22 = 138412290;
      double v23 = v3;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "LOCATION received: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  if (MapsSuggestionsTrackerIsUsableLocation(*(void **)(a1 + 32)))
  {
    int v4 = [*(id *)(a1 + 40) currentLocation];
    [*(id *)(*(void *)(a1 + 40) + 120) kickCanBySameTime];
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    }
    if (s_verbose)
    {
      uint64_t v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = *(void **)(a1 + 32);
        int v22 = 138412290;
        double v23 = v6;
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "LOCATION accepted: %@", (uint8_t *)&v22, 0xCu);
      }
    }
    [*(id *)(a1 + 40) setCurrentLocation:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = v4;
    if (v7)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 8));
      if (*(unsigned char *)(v7 + 96))
      {
        v9 = [(id)v7 currentLocation];
        int IsUsableLocation = MapsSuggestionsTrackerIsUsableLocation(v9);

        if (IsUsableLocation)
        {
          v11 = [(id)v7 currentLocation];
          [v11 distanceFromLocation:v8];
          double v13 = v12;
          GEOConfigGetDouble();
          double v15 = v14;

          if (v13 >= v15 || (MapsSuggestionsTrackerIsUsableLocation(v8) & 1) == 0)
          {
            __int16 v16 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v22) = 0;
              _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "LOCATION caused a Tracker REFRESH", (uint8_t *)&v22, 2u);
            }

            -[MapsSuggestionsTracker _q_scheduleRefresh](v7);
          }
        }
      }
    }
  }
  else
  {
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    }
    if (s_verbose)
    {
      int v17 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        __int16 v18 = [*(id *)(a1 + 40) currentLocation];
        int v22 = 138412290;
        double v23 = v18;
        _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "LOCATION dropped for current one: %@", (uint8_t *)&v22, 0xCu);
      }
    }
    dispatch_queue_t v19 = [*(id *)(a1 + 40) currentLocation];
    char v20 = MapsSuggestionsTrackerIsUsableLocation(v19);

    if ((v20 & 1) == 0)
    {
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      }
      if (s_verbose)
      {
        uint64_t v21 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v22) = 0;
          _os_log_impl(&dword_1A70DF000, v21, OS_LOG_TYPE_DEBUG, "LOCATION reset to nil", (uint8_t *)&v22, 2u);
        }
      }
      [*(id *)(a1 + 40) setCurrentLocation:0];
    }
  }
}

void __63__MapsSuggestionsTracker_trackSuggestionEntries_transportType___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 8));
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v59 = v3;
    obuint64_t j = v3;
    uint64_t v4 = [obj countByEnumeratingWithState:&v71 objects:buf count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v72 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          v9 = [v8 geoMapItem];

          if (v9)
          {
            id v10 = [(id)v2 currentLocation];
            [v10 coordinate];
            v11 = +[MapsSuggestionsSignalPack extractFromDestinationEntry:originCoordinate:](MapsSuggestionsSignalPack, "extractFromDestinationEntry:originCoordinate:", v8);

            double v12 = *(void **)(v2 + 200);
            double v13 = (void *)[v11 copy];
            double v14 = [v8 geoMapItem];
            [v12 storeSignalPack:v13 forMapItem:v14 andEntry:v8];
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v71 objects:buf count:16];
      }
      while (v5);
    }

    id v3 = v59;
  }

  v60 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(v1 + 40), "count"));
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v58 = *(id *)(v1 + 40);
  id obja = (id)[v58 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (obja)
  {
    uint64_t v15 = *(void *)v68;
    unint64_t v16 = 0x1E4F28000uLL;
    uint64_t v57 = *(void *)v68;
    do
    {
      int v17 = 0;
      do
      {
        if (*(void *)v68 != v15) {
          objc_enumerationMutation(v58);
        }
        __int16 v18 = *(void **)(*((void *)&v67 + 1) + 8 * (void)v17);
        uint64_t v19 = v1;
        uint64_t v20 = *(void *)(v1 + 32);
        uint64_t v21 = objc_msgSend(v18, "type", v57);
        if (v20)
        {
          uint64_t v22 = v21;
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(v20 + 8));
          double v23 = *(void **)(v20 + 72);
          unint64_t v24 = v16;
          double v25 = [*(id *)(v16 + 3792) numberWithInteger:v22];
          double v26 = [v23 objectForKeyedSubscript:v25];
          if (v26) {
            goto LABEL_21;
          }
          double v27 = *(void **)(v20 + 80);
          v28 = [*(id *)(v24 + 3792) numberWithInteger:v22];
          v29 = [v27 objectForKeyedSubscript:v28];
          if (v29)
          {

            double v26 = 0;
            uint64_t v15 = v57;
LABEL_21:

            unint64_t v16 = v24;
LABEL_22:
            [v60 addObject:v18];
            goto LABEL_23;
          }
          v30 = *(void **)(v20 + 88);
          v31 = [*(id *)(v24 + 3792) numberWithInteger:v22];
          v32 = [v30 objectForKeyedSubscript:v31];

          unint64_t v16 = v24;
          uint64_t v15 = v57;
          if (v32) {
            goto LABEL_22;
          }
        }
LABEL_23:
        int v17 = (char *)v17 + 1;
        uint64_t v1 = v19;
      }
      while (obja != v17);
      uint64_t v33 = [v58 countByEnumeratingWithState:&v67 objects:v76 count:16];
      id obja = (id)v33;
    }
    while (v33);
  }

  int v34 = *(_DWORD *)(v1 + 56);
  uint64_t v35 = *(void *)(v1 + 32);
  if (v34 != *(_DWORD *)(v35 + 56))
  {
    *(_DWORD *)(v35 + 56) = v34;
    uint64_t v35 = *(void *)(v1 + 32);
    int v34 = *(_DWORD *)(v35 + 56);
  }
  if (v34 != 4) {
    goto LABEL_34;
  }
  v36 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v36, OS_LOG_TYPE_DEBUG, "Resetting tracker transportType with the user preference.", buf, 2u);
  }

  *(_DWORD *)(*(void *)(v1 + 32) + 56) = GEOTransportTypeFromUserPreference();
  uint64_t v35 = *(void *)(v1 + 32);
  if (v35)
  {
LABEL_34:
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v35 + 8));
    v37 = *(void **)(v35 + 128);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __46__MapsSuggestionsTracker__q_prunePreviousETAs__block_invoke;
    *(void *)&buf[24] = &unk_1E5CB93B8;
    *(void *)&buf[32] = v35;
    uint64_t v38 = objc_msgSend(v37, "MSg_mutableCopyIf:", buf);
    v39 = *(void **)(v35 + 128);
    *(void *)(v35 + 128) = v38;
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v40 = v60;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v64 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void **)(*((void *)&v63 + 1) + 8 * j);
        uint64_t v46 = -[MapsSuggestionsTracker _q_etaTitleFormatterForType:](*(void *)(v1 + 32), [v45 type]);

        if (v46)
        {
          v47 = MapsSuggestionsDestinationKey(v45);
          v48 = *(NSObject **)(v1 + 32);
          id v49 = v45;
          id v50 = v47;
          if (!v48) {
            goto LABEL_61;
          }
          dispatch_assert_queue_V2((dispatch_queue_t)v48[1].isa);
          if (v49)
          {
            if (v50)
            {
              v51 = [(objc_class *)v48[16].isa objectForKeyedSubscript:v50];
              if (-[MapsSuggestionsTracker _q_isUnusableETA:]((uint64_t)v48, v51))
              {

                v51 = 0;
              }
              if ([v49 containsKey:@"MapsSuggestionsETAKey"])
              {
                v52 = [v49 ETAForKey:@"MapsSuggestionsETAKey"];
                if (-[MapsSuggestionsTracker _q_isUnusableETA:]((uint64_t)v48, v52))
                {

                  goto LABEL_49;
                }
              }
              else
              {
LABEL_49:
                v52 = 0;
              }
              if ([v51 isBetterThanETA:v52 requirements:v48[2].isa])v53 = v51; {
              else
              }
                v53 = v52;
              v48 = v53;

LABEL_60:
LABEL_61:

              -[MapsSuggestionsTracker _q_rememberETA:forEntry:](*(void *)(v1 + 32), v48, v49);
              if (v48)
              {
                if ((MapsSuggestionsIsInCoarseLocation() & 1) == 0) {
                  -[MapsSuggestionsTracker _q_decorateETA:forEntry:](*(void *)(v1 + 32), v48, v49);
                }
              }
              else
              {
                *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
              }

              continue;
            }
            v51 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 301;
              *(_WORD *)&buf[18] = 2082;
              *(void *)&buf[20] = "-[MapsSuggestionsTracker _q_bestValidOfflineETAForEntry:destinationKey:]";
              *(_WORD *)&buf[28] = 2082;
              *(void *)&buf[30] = "nil == (destinationKey)";
              id v54 = v51;
              v55 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destinationKey";
LABEL_58:
              _os_log_impl(&dword_1A70DF000, v54, OS_LOG_TYPE_ERROR, v55, buf, 0x26u);
            }
          }
          else
          {
            v51 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 300;
              *(_WORD *)&buf[18] = 2082;
              *(void *)&buf[20] = "-[MapsSuggestionsTracker _q_bestValidOfflineETAForEntry:destinationKey:]";
              *(_WORD *)&buf[28] = 2082;
              *(void *)&buf[30] = "nil == (entry)";
              id v54 = v51;
              v55 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
              goto LABEL_58;
            }
          }
          v48 = 0;
          goto LABEL_60;
        }
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v63 objects:v75 count:16];
    }
    while (v42);
  }

  id v56 = [[MapsSuggestionsMutableWeakEntries alloc] initWithEntries:v40];
  [*(id *)(v1 + 32) setTrackedEntries:v56];
}

- (CLLocation)currentLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTrackedEntries:(id)a3
{
}

- (void)_q_rememberETA:(void *)a3 forEntry:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (v6)
    {
      [v6 setETA:v5 forKey:@"MapsSuggestionsETAKey"];
      uint64_t v7 = MapsSuggestionsDestinationKey(v6);
      id v8 = *(void **)(a1 + 128);
      if (v5) {
        [v8 setObject:v5 forKeyedSubscript:v7];
      }
      else {
        [v8 removeObjectForKey:v7];
      }
    }
    else
    {
      v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136446978;
        v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
        __int16 v12 = 1024;
        int v13 = 257;
        __int16 v14 = 2082;
        uint64_t v15 = "-[MapsSuggestionsTracker _q_rememberETA:forEntry:]";
        __int16 v16 = 2082;
        int v17 = "nil == (entry)";
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an Entry", (uint8_t *)&v10, 0x26u);
      }
    }
  }
}

- (uint64_t)_q_isUnusableETA:(uint64_t)a1
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  int v4 = [v3 transportType];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  int v5 = *(_DWORD *)(a1 + 56);
  if (v5 == 4 || v5 == v4) {
    uint64_t v7 = [v3 isValidForLocation:*(void *)(a1 + 176) requirements:*(void *)(a1 + 16)] ^ 1;
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_q_etaTitleFormatterForType:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    int v4 = *(void **)(a1 + 72);
    int v5 = [NSNumber numberWithInteger:a2];
    id v6 = [v4 objectForKeyedSubscript:v5];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)setCurrentLocation:(id)a3
{
}

uint64_t __37__MapsSuggestionsTracker_setMapType___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(result + 40);
  if (*(_DWORD *)(v1 + 160) != v2)
  {
    uint64_t v3 = result;
    *(_DWORD *)(v1 + 160) = v2;
    [*(id *)(*(void *)(result + 32) + 104) setMapType:*(unsigned int *)(result + 40)];
    int v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "MAP TYPE caused a Tracker REFRESH", v5, 2u);
    }

    return -[MapsSuggestionsTracker _q_scheduleRefresh](*(void *)(v3 + 32));
  }
  return result;
}

- (void)setLocation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MapsSuggestionsTracker_setLocation___block_invoke;
  v7[3] = &unk_1E5CB8C20;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __47__MapsSuggestionsTracker_setAutomobileOptions___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 168);
  if (result != v2)
  {
    uint64_t result = objc_msgSend((id)result, "isEqual:");
    if ((result & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), *(id *)(a1 + 40));
      [*(id *)(*(void *)(a1 + 32) + 104) setAutomobileOptions:*(void *)(a1 + 40)];
      id v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        int v6 = 138412290;
        uint64_t v7 = v5;
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "AUTOMOBILE OPTIONS caused a Tracker REFRESH with values: %@", (uint8_t *)&v6, 0xCu);
      }

      return -[MapsSuggestionsTracker _q_scheduleRefresh](*(void *)(a1 + 32));
    }
  }
  return result;
}

- (void)setAutomobileOptions:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__MapsSuggestionsTracker_setAutomobileOptions___block_invoke;
  v7[3] = &unk_1E5CB8C20;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)setMapType:(int)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__MapsSuggestionsTracker_setMapType___block_invoke;
  v4[3] = &unk_1E5CB7D98;
  v4[4] = self;
  int v5 = a3;
  dispatch_sync(queue, v4);
}

void __91__MapsSuggestionsTracker_initWithManager_requirements_network_flightUpdater_virtualGarage___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsTracker _q_scheduleRefresh]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      int v5 = "MapsSuggestionsTracker.m";
      __int16 v6 = 1026;
      int v7 = 141;
      __int16 v8 = 2082;
      v9 = "-[MapsSuggestionsTracker initWithManager:requirements:network:flightUpdater:virtualGarage:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void __91__MapsSuggestionsTracker_initWithManager_requirements_network_flightUpdater_virtualGarage___block_invoke_207(uint64_t a1)
{
  v10[1] = *(id *)MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
    uint64_t v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = [v2 uniqueName];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "_refresh";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    int v5 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_refresh", "", buf, 2u);
    }

    objc_initWeak(&location, v2);
    __int16 v6 = v2[1];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __36__MapsSuggestionsTracker__q_refresh__block_invoke;
    *(void *)&buf[24] = &unk_1E5CB8058;
    objc_copyWeak(v10, &location);
    dispatch_async(v6, buf);
    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
  else
  {
    GEOFindOrCreateLog();
    int v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "MapsSuggestionsTracker.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 157;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsTracker initWithManager:requirements:network:flightUpdater:virtualGarage:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __91__MapsSuggestionsTracker_initWithManager_requirements_network_flightUpdater_virtualGarage___block_invoke_213(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained resetAllTitleFormatting];
    [v2 setCurrentLocation:0];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      int v5 = "MapsSuggestionsTracker.m";
      __int16 v6 = 1026;
      int v7 = 165;
      __int16 v8 = 2082;
      v9 = "-[MapsSuggestionsTracker initWithManager:requirements:network:flightUpdater:virtualGarage:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)dealloc
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  [(MapsSuggestionsVirtualGarage *)self->_virtualGarage closeConnection];
  -[MapsSuggestionsTracker _unschedule](self);
  [(MapsSuggestionsTracker *)self setTrackedEntries:0];
  [(MapsSuggestionsCanKicker *)self->_currentLocationWiper cancel];
  queue = self->_queue;
  self->_queue = 0;

  GEOConfigRemoveBlockListener();
  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsTracker;
  [(MapsSuggestionsTracker *)&v5 dealloc];
}

- (void)_unschedule
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3[0] = 0;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "_unschedule", (uint8_t *)v3, 2u);
    }

    uint64_t result = (void *)v1[3];
    if (result) {
      return (void *)[result unschedule];
    }
  }
  return result;
}

- (NSString)uniqueName
{
  uint64_t v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

uint64_t __46__MapsSuggestionsTracker__q_prunePreviousETAs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isValidForLocation:*(void *)(*(void *)(a1 + 32) + 176) requirements:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (void)_q_decorateETA:(void *)a3 forEntry:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (a1)
  {
    if (v6)
    {
      if (v5)
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
        GEOConfigGetDouble();
        v9 = MapsSuggestionsNowWithOffset(v8);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        [WeakRetained trackerRefreshedETAsUntil:v9];

        v11 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromMapsSuggestionsEntryType([v7 type]);
          __int16 v12 = (char *)objc_claimAutoreleasedReturnValue();
          int v27 = 138412290;
          v28 = v12;
          _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "_decorateETA:forEntry:%@", (uint8_t *)&v27, 0xCu);
        }
        int v13 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          __int16 v14 = [(id)a1 uniqueName];
          int v27 = 138412546;
          v28 = v14;
          __int16 v29 = 2080;
          *(void *)v30 = "_decorateETA";
          _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v27, 0x16u);
        }
        uint64_t v15 = GEOFindOrCreateLog();
        if (os_signpost_enabled(v15))
        {
          LOWORD(v27) = 0;
          _os_signpost_emit_with_name_impl(&dword_1A70DF000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_decorateETA", "", (uint8_t *)&v27, 2u);
        }

        __int16 v16 = -[MapsSuggestionsTracker _q_etaTitleFormatterForType:](a1, [v7 type]);
        if (v16)
        {
          [v7 setBoolean:1 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
          [v7 setNumber:0 forKey:@"MapsSuggestionsRoutingNotAvailableKey"];
          if ([v16 formatTitlesForEntry:v7 eta:v5])
          {
            int v17 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v18 = [(id)a1 uniqueName];
              if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
                dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
              }
              int v19 = s_verbose;
              if (s_verbose)
              {
                uint64_t v20 = [v7 serializedBase64String];
              }
              else
              {
                uint64_t v20 = &stru_1EFC640F8;
              }
              int v27 = 138413058;
              v28 = v18;
              __int16 v29 = 2048;
              *(void *)v30 = v7;
              *(_WORD *)&v30[8] = 2112;
              *(void *)&v30[10] = v20;
              *(_WORD *)&v30[18] = 2112;
              *(void *)&v30[20] = v7;
              _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} ETA UPDATE by TRACKER{%@} {%p:%@}:\n%@", (uint8_t *)&v27, 0x2Au);
              if (v19) {
            }
              }
          }
          double v25 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            double v26 = [(id)a1 uniqueName];
            int v27 = 138412546;
            v28 = v26;
            __int16 v29 = 2080;
            *(void *)v30 = "_decorateETA";
            _os_log_impl(&dword_1A70DF000, v25, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v27, 0x16u);
          }
          unint64_t v24 = GEOFindOrCreateLog();
          if (!os_signpost_enabled(v24)) {
            goto LABEL_36;
          }
          LOWORD(v27) = 0;
        }
        else
        {
          uint64_t v22 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            double v23 = [(id)a1 uniqueName];
            int v27 = 138412546;
            v28 = v23;
            __int16 v29 = 2080;
            *(void *)v30 = "_decorateETA";
            _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v27, 0x16u);
          }
          unint64_t v24 = GEOFindOrCreateLog();
          if (!os_signpost_enabled(v24)) {
            goto LABEL_36;
          }
          LOWORD(v27) = 0;
        }
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_decorateETA", "", (uint8_t *)&v27, 2u);
LABEL_36:

        goto LABEL_37;
      }
      v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v27 = 136446978;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
        __int16 v29 = 1024;
        *(_DWORD *)v30 = 412;
        *(_WORD *)&v30[4] = 2082;
        *(void *)&v30[6] = "-[MapsSuggestionsTracker _q_decorateETA:forEntry:]";
        *(_WORD *)&v30[14] = 2082;
        *(void *)&v30[16] = "nil == (eta)";
        uint64_t v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
        goto LABEL_21;
      }
    }
    else
    {
      v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v27 = 136446978;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
        __int16 v29 = 1024;
        *(_DWORD *)v30 = 411;
        *(_WORD *)&v30[4] = 2082;
        *(void *)&v30[6] = "-[MapsSuggestionsTracker _q_decorateETA:forEntry:]";
        *(_WORD *)&v30[14] = 2082;
        *(void *)&v30[16] = "nil == (entry)";
        uint64_t v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_21:
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v27, 0x26u);
      }
    }
LABEL_37:
  }
}

- (void)_q_decorateEntry:(void *)a3 eta:(void *)a4 requiredChargeLevel:(void *)a5 currentChargeLevel:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v9)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    int v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      __int16 v14 = [(id)a1 uniqueName];
      int v27 = 138412546;
      v28 = v14;
      __int16 v29 = 2080;
      *(void *)v30 = "_decorateEntryEV";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v27, 0x16u);
    }
    uint64_t v15 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v15))
    {
      LOWORD(v27) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_decorateEntryEV", "", (uint8_t *)&v27, 2u);
    }

    uint64_t v16 = [v9 type];
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    int v17 = *(void **)(a1 + 88);
    uint64_t v18 = [NSNumber numberWithInteger:v16];
    int v19 = [v17 objectForKeyedSubscript:v18];

    if (v19)
    {
      if ([v19 formatTitlesForEntry:v9 eta:v10 requiredChargeLevel:v11 currentChargeLevel:v12])
      {
        uint64_t v20 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = [v9 title];
          int v27 = 138412290;
          v28 = v21;
          _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_INFO, "Update EV Resume Route entry title to %@", (uint8_t *)&v27, 0xCu);
        }
      }
      uint64_t v22 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        double v23 = [(id)a1 uniqueName];
        int v27 = 138412546;
        v28 = v23;
        __int16 v29 = 2080;
        *(void *)v30 = "_decorateEntryEV";
        _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v27, 0x16u);
      }
      unint64_t v24 = GEOFindOrCreateLog();
      if (!os_signpost_enabled(v24)) {
        goto LABEL_22;
      }
      LOWORD(v27) = 0;
    }
    else
    {
      double v25 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        double v26 = [(id)a1 uniqueName];
        int v27 = 138412546;
        v28 = v26;
        __int16 v29 = 2080;
        *(void *)v30 = "_decorateEntryEV";
        _os_log_impl(&dword_1A70DF000, v25, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v27, 0x16u);
      }
      unint64_t v24 = GEOFindOrCreateLog();
      if (!os_signpost_enabled(v24)) {
        goto LABEL_22;
      }
      LOWORD(v27) = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_decorateEntryEV", "", (uint8_t *)&v27, 2u);
LABEL_22:

    goto LABEL_23;
  }
  int v19 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    int v27 = 136446978;
    v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
    __int16 v29 = 1024;
    *(_DWORD *)v30 = 494;
    *(_WORD *)&v30[4] = 2082;
    *(void *)&v30[6] = "-[MapsSuggestionsTracker _q_decorateEntry:eta:requiredChargeLevel:currentChargeLevel:]";
    __int16 v31 = 2082;
    v32 = "nil == (entry)";
    _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v27, 0x26u);
  }
LABEL_23:
}

uint64_t __40__MapsSuggestionsTracker__q_requestETAs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 BOOLeanForKey:@"MapsSuggestionsNeedsETATrackingKey" is:1];
}

void __40__MapsSuggestionsTracker__q_requestETAs__block_invoke_291(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (v3)
  {
    int v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "Error while getting ETAs: %@", buf, 0xCu);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      int v4 = WeakRetained;
      id v6 = *((void *)WeakRetained + 1);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __40__MapsSuggestionsTracker__q_requestETAs__block_invoke_292;
      v8[3] = &unk_1E5CB7BE0;
      objc_copyWeak(&v10, (id *)(a1 + 40));
      id v9 = *(id *)(a1 + 32);
      dispatch_async(v6, v8);

      objc_destroyWeak(&v10);
    }
    else
    {
      GEOFindOrCreateLog();
      int v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        id v12 = "MapsSuggestionsTracker.m";
        __int16 v13 = 1026;
        int v14 = 606;
        __int16 v15 = 2082;
        uint64_t v16 = "-[MapsSuggestionsTracker _q_requestETAs]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
      }

      int v4 = 0;
    }
  }
}

void __40__MapsSuggestionsTracker__q_requestETAs__block_invoke_292(uint64_t a1)
{
  v26[2] = *(id *)MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v17 != v5) {
            objc_enumerationMutation(v3);
          }
          int v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v7, "BOOLeanForKey:is:", @"MapsSuggestionsIsNotADestinationKey", 1, (void)v16) & 1) == 0
            && [v7 BOOLeanForKey:@"MapsSuggestionsNeedsETATrackingKey"]
            && [v7 containsKey:@"MapsSuggestionsETAKey"])
          {
            double v8 = [v7 ETAForKey:@"MapsSuggestionsETAKey"];
            [*((id *)WeakRetained + 14) donateETA:v8 entry:v7];
            -[MapsSuggestionsTracker _q_rememberETA:forEntry:]((uint64_t)WeakRetained, v8, v7);
            if ([v7 containsKey:@"MapsSuggestionsIsResumingAnEVRoute"])
            {
              id v10 = v7;
              id v9 = v8;
              dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
              id v11 = [v10 numberForKey:@"MapsSuggestionsRequiredChargeForEVKey"];
              uint64_t v12 = [v10 stringForKey:@"MapsSuggestionsVehicleIdentifierKey"];
              __int16 v13 = (void *)v12;
              if (v11 && v12)
              {
                [*((id *)WeakRetained + 18) openConnection];
                objc_initWeak(&location, WeakRetained);
                int v14 = (void *)*((void *)WeakRetained + 18);
                *(void *)buf = MEMORY[0x1E4F143A8];
                *(void *)&buf[8] = 3221225472;
                *(void *)&buf[16] = __67__MapsSuggestionsTracker__q_requestChargeInfoAndDecorateEntry_eta___block_invoke;
                *(void *)&buf[24] = &unk_1E5CB9458;
                objc_copyWeak(v26, &location);
                id v23 = v10;
                unint64_t v24 = v9;
                id v25 = v11;
                [v14 stateOfChargeForVehicleWithIdentifier:v13 handler:buf];

                objc_destroyWeak(v26);
                objc_destroyWeak(&location);
              }
              else
              {
                __int16 v15 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_INFO, "This is a regular ResumeRoute entry.", buf, 2u);
                }

                -[MapsSuggestionsTracker _q_decorateEntry:eta:requiredChargeLevel:currentChargeLevel:]((uint64_t)WeakRetained, v10, v9, 0, 0);
              }

              goto LABEL_25;
            }
            -[MapsSuggestionsTracker _q_decorateETA:forEntry:]((uint64_t)WeakRetained, v8, v7);
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "MapsSuggestionsTracker.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 608;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsTracker _q_requestETAs]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    uint64_t v3 = v9;
LABEL_25:
  }
}

void __67__MapsSuggestionsTracker__q_requestChargeInfoAndDecorateEntry_eta___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 7);
  double v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__MapsSuggestionsTracker__q_requestChargeInfoAndDecorateEntry_eta___block_invoke_294;
    v11[3] = &unk_1E5CB9430;
    objc_copyWeak(&v17, a1 + 7);
    id v12 = v6;
    id v13 = a1[4];
    id v14 = a1[5];
    id v15 = a1[6];
    id v16 = v5;
    dispatch_async(v9, v11);

    objc_destroyWeak(&v17);
  }
  else
  {
    GEOFindOrCreateLog();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      long long v19 = "MapsSuggestionsTracker.m";
      __int16 v20 = 1026;
      int v21 = 667;
      __int16 v22 = 2082;
      id v23 = "-[MapsSuggestionsTracker _q_requestChargeInfoAndDecorateEntry:eta:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __67__MapsSuggestionsTracker__q_requestChargeInfoAndDecorateEntry_eta___block_invoke_294(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446722;
      id v10 = "MapsSuggestionsTracker.m";
      __int16 v11 = 1026;
      int v12 = 670;
      __int16 v13 = 2082;
      id v14 = "-[MapsSuggestionsTracker _q_requestChargeInfoAndDecorateEntry:eta:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v9, 0x1Cu);
    }

    goto LABEL_10;
  }
  if (!*(void *)(a1 + 32))
  {
    id v6 = *(void **)(a1 + 40);
    int v7 = *(void **)(a1 + 48);
    double v8 = *(void **)(a1 + 56);
    id v5 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "displayedBatteryPercentage") / 100.0);
    -[MapsSuggestionsTracker _q_decorateEntry:eta:requiredChargeLevel:currentChargeLevel:]((uint64_t)WeakRetained, v6, v7, v8, v5);
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(char **)(a1 + 32);
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "VirtualGarage returned an error while trying to fetch the charge status for the car: %@. Falling back to normal ResumeRoute", (uint8_t *)&v9, 0xCu);
  }

  -[MapsSuggestionsTracker _q_decorateEntry:eta:requiredChargeLevel:currentChargeLevel:]((uint64_t)WeakRetained, *(void **)(a1 + 40), *(void **)(a1 + 48), 0, 0);
LABEL_11:
}

void __46__MapsSuggestionsTracker__q_requestFlightInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = (id *)(a1 + 40);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  int v9 = WeakRetained;
  if (WeakRetained)
  {
    if (*(id *)(a1 + 32) == v5)
    {
      if (!v6)
      {
        int v12 = WeakRetained[1];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __46__MapsSuggestionsTracker__q_requestFlightInfo__block_invoke_297;
        v13[3] = &unk_1E5CB7BE0;
        objc_copyWeak(&v15, v7);
        id v14 = v5;
        dispatch_async(v12, v13);

        objc_destroyWeak(&v15);
        goto LABEL_9;
      }
      id v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        __int16 v11 = [v5 uniqueIdentifier];
        *(_DWORD *)buf = 138412546;
        id v17 = v11;
        __int16 v18 = 2112;
        *(void *)long long v19 = v6;
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "Error when updating Flight for Entry %@: %@", buf, 0x16u);
      }
    }
    else
    {
      id v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        id v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
        __int16 v18 = 1024;
        *(_DWORD *)long long v19 = 721;
        *(_WORD *)&v19[4] = 2082;
        *(void *)&v19[6] = "-[MapsSuggestionsTracker _q_requestFlightInfo]_block_invoke";
        __int16 v20 = 2082;
        int v21 = "returnedEntry != entry";
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. The returned Entry must always equal the one we asked for", buf, 0x26u);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v17 = "MapsSuggestionsTracker.m";
      __int16 v18 = 1026;
      *(_DWORD *)long long v19 = 720;
      *(_WORD *)&v19[4] = 2082;
      *(void *)&v19[6] = "-[MapsSuggestionsTracker _q_requestFlightInfo]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
LABEL_9:
}

void __46__MapsSuggestionsTracker__q_requestFlightInfo__block_invoke_297(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(id *)(a1 + 32);
    if (v3)
    {
      dispatch_assert_queue_V2(WeakRetained[1]);
      if ([v3 containsKey:@"MapsSuggestionsETAKey"])
      {
        uint64_t v4 = [v3 ETAForKey:@"MapsSuggestionsETAKey"];
      }
      else
      {
        uint64_t v4 = 0;
      }
      id v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = [v3 stringForKey:@"MapsSuggestionsFullFlightNumberKey"];
        int v21 = 138412290;
        uint64_t v22 = v6;
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "_decorateFlightInfoForEntry:%@", (uint8_t *)&v21, 0xCu);
      }
      int v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        double v8 = [(dispatch_queue_t *)WeakRetained uniqueName];
        int v21 = 138412546;
        uint64_t v22 = v8;
        __int16 v23 = 2080;
        *(void *)uint64_t v24 = "_decorateFlightInfoForEntry";
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v21, 0x16u);
      }
      int v9 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v9))
      {
        LOWORD(v21) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_decorateFlightInfoForEntry", "", (uint8_t *)&v21, 2u);
      }

      id v10 = -[MapsSuggestionsTracker _q_etaTitleFormatterForType:]((uint64_t)WeakRetained, [v3 type]);
      __int16 v11 = v10;
      if (v10)
      {
        if ([v10 formatTitlesForEntry:v3 eta:v4])
        {
          int v12 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            __int16 v13 = [(dispatch_queue_t *)WeakRetained uniqueName];
            if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
              dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
            }
            int v14 = s_verbose;
            if (s_verbose)
            {
              id v15 = [v3 serializedBase64String];
            }
            else
            {
              id v15 = &stru_1EFC640F8;
            }
            int v21 = 138413058;
            uint64_t v22 = v13;
            __int16 v23 = 2048;
            *(void *)uint64_t v24 = v3;
            *(_WORD *)&v24[8] = 2112;
            *(void *)&v24[10] = v15;
            *(_WORD *)&v24[18] = 2112;
            *(void *)&v24[20] = v3;
            _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} FLIGHT UPDATE by TRACKER{%@} {%p:%@}:\n%@", (uint8_t *)&v21, 0x2Au);
            if (v14) {
          }
            }
        }
        long long v19 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          __int16 v20 = [(dispatch_queue_t *)WeakRetained uniqueName];
          int v21 = 138412546;
          uint64_t v22 = v20;
          __int16 v23 = 2080;
          *(void *)uint64_t v24 = "_decorateFlightInfoForEntry";
          _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v21, 0x16u);
        }
        __int16 v18 = GEOFindOrCreateLog();
        if (!os_signpost_enabled(v18)) {
          goto LABEL_38;
        }
        LOWORD(v21) = 0;
      }
      else
      {
        id v16 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          id v17 = [(dispatch_queue_t *)WeakRetained uniqueName];
          int v21 = 138412546;
          uint64_t v22 = v17;
          __int16 v23 = 2080;
          *(void *)uint64_t v24 = "_decorateFlightInfoForEntry";
          _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v21, 0x16u);
        }
        __int16 v18 = GEOFindOrCreateLog();
        if (!os_signpost_enabled(v18)) {
          goto LABEL_38;
        }
        LOWORD(v21) = 0;
      }
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_decorateFlightInfoForEntry", "", (uint8_t *)&v21, 2u);
LABEL_38:

      goto LABEL_39;
    }
    uint64_t v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136446978;
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
      __int16 v23 = 1024;
      *(_DWORD *)uint64_t v24 = 457;
      *(_WORD *)&v24[4] = 2082;
      *(void *)&v24[6] = "-[MapsSuggestionsTracker _q_decorateFlightInfoForEntry:]";
      *(_WORD *)&v24[14] = 2082;
      *(void *)&v24[16] = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v21, 0x26u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136446722;
      uint64_t v22 = "MapsSuggestionsTracker.m";
      __int16 v23 = 1026;
      *(_DWORD *)uint64_t v24 = 728;
      *(_WORD *)&v24[4] = 2082;
      *(void *)&v24[6] = "-[MapsSuggestionsTracker _q_requestFlightInfo]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v21, 0x1Cu);
    }
    uint64_t v3 = v4;
  }
LABEL_39:
}

void __36__MapsSuggestionsTracker__q_refresh__block_invoke(uint64_t a1)
{
  v82[12] = *(id *)MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id val = WeakRetained;
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    int v27 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "MapsSuggestionsTracker.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 865;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsTracker _q_refresh]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v27, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

    goto LABEL_86;
  }
  uint64_t v2 = [WeakRetained currentLocation];

  if (!v2)
  {
    v28 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v28, OS_LOG_TYPE_DEBUG, "_refresh had no location", buf, 2u);
    }

    __int16 v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v30 = [val uniqueName];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "_refresh";
      _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    int v27 = GEOFindOrCreateLog();
    if (!os_signpost_enabled(v27)) {
      goto LABEL_86;
    }
    *(_WORD *)buf = 0;
LABEL_85:
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_refresh", "", buf, 2u);
    goto LABEL_86;
  }
  uint64_t v3 = [val trackedEntries];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    __int16 v31 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v31, OS_LOG_TYPE_DEBUG, "_refresh had nothing to track", buf, 2u);
    }

    v32 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = [val uniqueName];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v33;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "_refresh";
      _os_log_impl(&dword_1A70DF000, v32, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    int v27 = GEOFindOrCreateLog();
    if (!os_signpost_enabled(v27)) {
      goto LABEL_86;
    }
    *(_WORD *)buf = 0;
    goto LABEL_85;
  }
  if (MapsSuggestionsIsInCoarseLocation()) {
    goto LABEL_57;
  }
  dispatch_assert_queue_V2(*((dispatch_queue_t *)val + 1));
  id v5 = [val currentLocation];

  if (!v5)
  {
    int v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "No current location, can't calculate distance.", buf, 2u);
    }
    goto LABEL_44;
  }
  id v6 = [val currentLocation];
  [v6 coordinate];
  BOOL v7 = CLLocationCoordinate2DIsValid(v83);

  if (v7 && [*((id *)val + 10) count])
  {
    double v8 = [val currentLocation];
    [v8 coordinate];
    int v9 = [val currentLocation];
    [v9 coordinate];

    id v10 = [val trackedEntries];
    __int16 v11 = [v10 strongArray];

    long long v73 = 0u;
    long long v74 = 0u;
    *(_OWORD *)id location = 0u;
    long long v72 = 0u;
    int v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:location objects:buf count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v72 != v14) {
            objc_enumerationMutation(v12);
          }
          id v16 = (void *)*((void *)location[1] + i);
          if (v16)
          {
            uint64_t v17 = [*((id *)location[1] + i) type];
            dispatch_assert_queue_V2(*((dispatch_queue_t *)val + 1));
            __int16 v18 = (void *)*((void *)val + 10);
            long long v19 = [NSNumber numberWithInteger:v17];
            __int16 v20 = [v18 objectForKeyedSubscript:v19];

            if (v20)
            {
              if ([v16 BOOLeanForKey:@"MapsSuggestionsNeedsDistanceTrackingKey"])
              {
                if ([v16 containsKey:@"MapsSuggestionsLatitudeKey"])
                {
                  if ([v16 containsKey:@"MapsSuggestionsLongitudeKey"])
                  {
                    int v21 = [v16 numberForKey:@"MapsSuggestionsLatitudeKey"];
                    [v21 doubleValue];
                    double v23 = v22;
                    uint64_t v24 = [v16 numberForKey:@"MapsSuggestionsLongitudeKey"];
                    [v24 doubleValue];
                    double v26 = v25;

                    if (v26 >= -180.0 && v26 <= 180.0 && v23 >= -90.0 && v23 <= 90.0)
                    {
                      GEOCalculateDistance();
                      objc_msgSend(v20, "formatTitlesForEntry:distance:trafficString:", v16, 0);
                    }
                  }
                }
              }
            }
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:location objects:buf count:16];
      }
      while (v13);
    }

LABEL_44:
  }
  dispatch_assert_queue_V2(*((dispatch_queue_t *)val + 1));
  int v34 = [val currentLocation];

  if (!v34)
  {
    v39 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v39, OS_LOG_TYPE_DEBUG, "No current location, can't make an ETA request.", buf, 2u);
    }
    goto LABEL_56;
  }
  uint64_t v35 = [val currentLocation];
  [v35 coordinate];
  BOOL v36 = CLLocationCoordinate2DIsValid(v84);

  if (v36 && [*((id *)val + 9) count])
  {
    v37 = [val trackedEntries];
    uint64_t v38 = [v37 strongArray];
    v39 = objc_msgSend(v38, "MSg_copyIf:", &__block_literal_global_14);

    if ([v39 count])
    {
      id v40 = [val currentLocation];
      char IsUsableLocation = MapsSuggestionsTrackerIsUsableLocation(v40);

      if (IsUsableLocation)
      {
        objc_initWeak(location, val);
        uint64_t v42 = (void *)*((void *)val + 13);
        uint64_t v43 = [val currentLocation];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __40__MapsSuggestionsTracker__q_requestETAs__block_invoke_291;
        *(void *)&buf[24] = &unk_1E5CB9408;
        objc_copyWeak(v82, location);
        v39 = v39;
        v81 = v39;
        [v42 ETAsFromLocation:v43 toEntries:v39 completion:buf];

        objc_destroyWeak(v82);
        objc_destroyWeak(location);
      }
      else
      {
        v44 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          v45 = [val currentLocation];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v45;
          _os_log_impl(&dword_1A70DF000, v44, OS_LOG_TYPE_DEBUG, "Can't use location for ETA Requests: %@", buf, 0xCu);
        }
      }
    }
LABEL_56:
  }
LABEL_57:
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    id v49 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_INFO)) {
      goto LABEL_81;
    }
    *(_WORD *)buf = 0;
    objc_super v61 = "Live flight updates have been disabled";
    v62 = v49;
    os_log_type_t v63 = OS_LOG_TYPE_INFO;
LABEL_80:
    _os_log_impl(&dword_1A70DF000, v62, v63, v61, buf, 2u);
    goto LABEL_81;
  }
  dispatch_assert_queue_V2(*((dispatch_queue_t *)val + 1));
  if (![*((id *)val + 9) count])
  {
    id v49 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_81;
    }
    *(_WORD *)buf = 0;
    objc_super v61 = "Cannot show flight status updates without ETA Title Formatters";
    v62 = v49;
    os_log_type_t v63 = OS_LOG_TYPE_ERROR;
    goto LABEL_80;
  }
  uint64_t v46 = [val trackedEntries];
  v47 = [v46 strongArray];
  v48 = [v47 copy];

  id v49 = v48;
  if ([v48 count])
  {
    objc_initWeak(&from, val);
    long long v73 = 0u;
    long long v74 = 0u;
    *(_OWORD *)id location = 0u;
    long long v72 = 0u;
    obuint64_t j = v48;
    uint64_t v50 = [obj countByEnumeratingWithState:location objects:buf count:16];
    if (v50)
    {
      uint64_t v52 = *(void *)v72;
      *(void *)&long long v51 = 138412290;
      long long v66 = v51;
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v72 != v52) {
            objc_enumerationMutation(obj);
          }
          id v54 = (void *)*((void *)location[1] + j);
          if (objc_msgSend(v54, "hasEssentialFlightInfo", v66))
          {
            GEOFindOrCreateLog();
            v55 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              id v56 = [v54 uniqueIdentifier];
              uint64_t v57 = [v54 stringForKey:@"MapsSuggestionsFullFlightNumberKey"];
              *(_DWORD *)v76 = 138412546;
              v77 = v56;
              __int16 v78 = 2112;
              v79 = v57;
              _os_log_impl(&dword_1A70DF000, v55, OS_LOG_TYPE_DEBUG, "Updating flight info on Entry %@ (Flight %@)", v76, 0x16u);
            }
            id v58 = (void *)*((void *)val + 19);
            v69[0] = MEMORY[0x1E4F143A8];
            v69[1] = 3221225472;
            v69[2] = __46__MapsSuggestionsTracker__q_requestFlightInfo__block_invoke;
            v69[3] = &unk_1E5CB9480;
            objc_copyWeak(&v70, &from);
            v69[4] = v54;
            if (([v58 updateFlightsForEntry:v54 handler:v69] & 1) == 0)
            {
              GEOFindOrCreateLog();
              id v59 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                v60 = [v54 uniqueIdentifier];
                *(_DWORD *)v76 = v66;
                v77 = v60;
                _os_log_impl(&dword_1A70DF000, v59, OS_LOG_TYPE_ERROR, "Cannot update Flight for Entry %@", v76, 0xCu);
              }
            }
            objc_destroyWeak(&v70);
          }
        }
        uint64_t v50 = [obj countByEnumeratingWithState:location objects:buf count:16];
      }
      while (v50);
    }

    objc_destroyWeak(&from);
    id v49 = obj;
  }
LABEL_81:

  long long v64 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    long long v65 = [val uniqueName];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v65;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "_refresh";
    _os_log_impl(&dword_1A70DF000, v64, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
  }
  int v27 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    goto LABEL_85;
  }
LABEL_86:
}

- (void)rescheduleRefreshOnlyIfAlreadyRunning
{
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "rescheduleRefreshOnlyIfAlreadyRunning", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MapsSuggestionsTracker_rescheduleRefreshOnlyIfAlreadyRunning__block_invoke;
  block[3] = &unk_1E5CB8058;
  objc_copyWeak(&v6, buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __63__MapsSuggestionsTracker_rescheduleRefreshOnlyIfAlreadyRunning__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 96)) {
      -[MapsSuggestionsTracker _q_scheduleRefresh]((uint64_t)WeakRetained);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsTracker.m";
      __int16 v6 = 1026;
      int v7 = 925;
      __int16 v8 = 2082;
      int v9 = "-[MapsSuggestionsTracker rescheduleRefreshOnlyIfAlreadyRunning]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)unschedule
{
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "unschedule", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MapsSuggestionsTracker_unschedule__block_invoke;
  block[3] = &unk_1E5CB8D10;
  void block[4] = self;
  dispatch_async(queue, block);
}

void *__36__MapsSuggestionsTracker_unschedule__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 96) = 0;
  return -[MapsSuggestionsTracker _unschedule](*(void **)(a1 + 32));
}

- (void)clearLocationAndETAs
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MapsSuggestionsTracker_clearLocationAndETAs__block_invoke;
  v4[3] = &unk_1E5CB8058;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__MapsSuggestionsTracker_clearLocationAndETAs__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
    uint64_t v3 = (void *)WeakRetained[16];
    WeakRetained[16] = v2;

    [WeakRetained setCurrentLocation:0];
    -[MapsSuggestionsTracker _q_resetAllTitleFormatting]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    int v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      __int16 v6 = "MapsSuggestionsTracker.m";
      __int16 v7 = 1026;
      int v8 = 962;
      __int16 v9 = 2082;
      uint64_t v10 = "-[MapsSuggestionsTracker clearLocationAndETAs]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)_q_resetAllTitleFormatting
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "_resetAllTitleFormatting", buf, 2u);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 184), "strongArray", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v8 setETA:0 forKey:@"MapsSuggestionsETAKey"];
        __int16 v9 = *(void **)(a1 + 72);
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "type"));
        uint64_t v11 = [v9 objectForKeyedSubscript:v10];
        [v11 resetTitlesForEntry:v8];

        int v12 = *(void **)(a1 + 80);
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "type"));
        uint64_t v14 = [v12 objectForKeyedSubscript:v13];
        [v14 resetTitlesForEntry:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v5);
  }
}

- (void)resetAllTitleFormatting
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__MapsSuggestionsTracker_resetAllTitleFormatting__block_invoke;
  v4[3] = &unk_1E5CB8058;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__MapsSuggestionsTracker_resetAllTitleFormatting__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsTracker _q_resetAllTitleFormatting]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsTracker.m";
      __int16 v6 = 1026;
      int v7 = 988;
      __int16 v8 = 2082;
      __int16 v9 = "-[MapsSuggestionsTracker resetAllTitleFormatting]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (int)mapType
{
  return self->_mapType;
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (MapsSuggestionsMutableWeakEntries)trackedEntries
{
  return self->_trackedEntries;
}

- (MapsSuggestionsNetworkRequester)networkRequester
{
  return self->_networkRequester;
}

- (void)setNetworkRequester:(id)a3
{
}

- (MapsSuggestionsPredictor)predictor
{
  return self->_predictor;
}

- (void)setPredictor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_trackedEntries, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_flightUpdater, 0);
  objc_storeStrong((id *)&self->_virtualGarage, 0);
  objc_storeStrong(&self->_transportTypeChangedListener, 0);
  objc_storeStrong((id *)&self->_previousETAs, 0);
  objc_storeStrong((id *)&self->_currentLocationWiper, 0);
  objc_storeStrong((id *)&self->_donater, 0);
  objc_storeStrong((id *)&self->_etaRequester, 0);
  objc_storeStrong((id *)&self->_etaChargeTitleFormatters, 0);
  objc_storeStrong((id *)&self->_distanceTitleFormatters, 0);
  objc_storeStrong((id *)&self->_etaTitleFormatters, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_requirements, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end