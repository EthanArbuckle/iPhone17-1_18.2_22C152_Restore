@interface NavdVenueAnnouncer
- (NSString)uniqueName;
- (char)_airportMapItemForEntry:(id)a3 completion:(id)a4;
- (char)_terminalMapItemForEntry:(id)a3 completion:(id)a4;
- (id)_shouldTreatArrivalAirport:(id)a3 over:(id)a4;
- (id)initFromResourceDepot:(id)a3 sharedRegister:(id)a4;
- (id)readBudgetState;
- (void)_cleanup;
- (void)_fireNotificationIfAtEntry:(id)a3;
- (void)_logStateForStep:(id)a3;
- (void)_logStateForStep:(id)a3 stopReason:(id)a4;
- (void)_processEntries:(id)a3;
- (void)_setupOfflineDownloadNotificationCircuitForEntry:(id)a3;
- (void)_startStreamersWithNotificationName:(id)a3 resourceDepot:(id)a4;
- (void)_startTrackingLeavingTheAirport:(id)a3;
- (void)_trackArrivalAirportForEntry:(id)a3;
- (void)_treatAirportEntry:(id)a3;
- (void)_treatGateEntry:(id)a3;
- (void)_treatTerminalEntry:(id)a3;
- (void)cleanupAirportArrival;
- (void)engineRunner:(id)a3 startedBecauseOfTrigger:(id)a4;
- (void)engineRunner:(id)a3 step:(id)a4 jsonDict:(id)a5;
- (void)engineRunner:(id)a3 stoppedWithEntries:(id)a4;
- (void)writeBudgetState:(id)a3;
@end

@implementation NavdVenueAnnouncer

- (id)initFromResourceDepot:(id)a3 sharedRegister:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v58 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v65 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/VenueAnnouncer/NavdVenueAnnouncer.mm";
      __int16 v66 = 1024;
      int v67 = 263;
      __int16 v68 = 2082;
      v69 = "-[NavdVenueAnnouncer initFromResourceDepot:sharedRegister:]";
      __int16 v70 = 2082;
      v71 = "nil == (resourceDepot)";
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot", buf, 0x26u);
    }
    goto LABEL_17;
  }
  v8 = [v6 oneNetworkRequester];

  if (!v8)
  {
    v58 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v65 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/VenueAnnouncer/NavdVenueAnnouncer.mm";
      __int16 v66 = 1024;
      int v67 = 264;
      __int16 v68 = 2082;
      v69 = "-[NavdVenueAnnouncer initFromResourceDepot:sharedRegister:]";
      __int16 v70 = 2082;
      v71 = "nil == (resourceDepot.oneNetworkRequester)";
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a network requester", buf, 0x26u);
    }
    goto LABEL_17;
  }
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    v58 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "NavdVenueAnnouncer is Disabled", buf, 2u);
    }
LABEL_17:

    v57 = 0;
    goto LABEL_18;
  }
  v63.receiver = self;
  v63.super_class = (Class)NavdVenueAnnouncer;
  v9 = [(NavdVenueAnnouncer *)&v63 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("NavdVenueAnnouncerQueue", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [v6 oneNetworkRequester];
    network = v9->_network;
    v9->_network = (MapsSuggestionsNetworkRequester *)v13;

    id v15 = objc_alloc_init((Class)MapsSuggestionsShortcutFilter);
    v60 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, 0);

    id v16 = objc_alloc_init((Class)MapsSuggestionsExpiredFilter);
    v61 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, 0);

    id v17 = objc_alloc((Class)MapsSuggestionsEngineRunner);
    v62 = +[MapsSuggestionsEngineBuilder forDevice];
    v18 = +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
    v19 = [v62 withLocationUpdater:v18];
    v20 = [v19 withoutTracker];
    v21 = [v20 withPreFilters:v60];
    v22 = [v21 withoutPreFilters:v61];
    GEOConfigGetDouble();
    double v24 = v23;
    GEOConfigGetDouble();
    double v26 = v25;
    GEOConfigGetDouble();
    double v28 = v27;
    GEOConfigGetDouble();
    double v30 = v29;
    GEOConfigGetDouble();
    v32 = (MapsSuggestionsEngineRunner *)[v17 initWithEngineBuilder:v22 name:@"NavdVenueAnnouncerRunner" minRunTime:GEOConfigGetInteger() maxRunTime:1 minSleepTime:v24 runTimeLeeway:v26 sleepTimeLeeway:v28 maxEntries:v30 nilledWhenAsleep:v31];
    engineRunner = v9->_engineRunner;
    v9->_engineRunner = v32;

    [(MapsSuggestionsEngineRunner *)v9->_engineRunner registerObserver:v9];
    objc_storeStrong((id *)&v9->_networkReachableTrigger, a4);
    id v34 = objc_alloc_init((Class)MapsSuggestionsAirportArrivalBudget);
    v35 = *(void **)&v9->_state.skipScoring;
    *(void *)&v9->_state.skipScoring = v34;

    v36 = (MapsSuggestionsLocationChangedTrigger *)objc_alloc_init((Class)MapsSuggestionsDefaultLocationUpdater);
    locationChangedTrigger = v9->_locationChangedTrigger;
    v9->_locationChangedTrigger = v36;

    id v38 = [objc_alloc((Class)MapsSuggestionsDarwinNotificationTrigger) initWithNotificationName:objc_msgSend(@"AirportAnnouncerNotification", "UTF8String")];
    [(MapsSuggestionsEngineRunner *)v9->_engineRunner addTrigger:v38];
    v39 = objc_alloc_init(NavdVenueNavigationSessionTrigger);
    origin = v9->_state.origin;
    v9->_state.origin = (GEOComposedWaypoint *)v39;

    [(MapsSuggestionsEngineRunner *)v9->_engineRunner addCondition:v9->_state.origin];
    v41 = v9->_engineRunner;
    networkReachableTrigger = v9->_networkReachableTrigger;
    v43 = +[MapsSuggestionsMapsInstalledTriggeringToggle description];
    v44 = [(MapsSuggestionsNetworkReachableTrigger *)networkReachableTrigger objectForKeyedSubscript:v43];
    [(MapsSuggestionsEngineRunner *)v41 addCondition:v44];

    v45 = v9->_engineRunner;
    v46 = v9->_networkReachableTrigger;
    v47 = +[MapsSuggestionsSiri isEnabledCondition];
    v48 = [v47 uniqueName];
    v49 = [(MapsSuggestionsNetworkReachableTrigger *)v46 objectForKeyedSubscript:v48];
    [(MapsSuggestionsEngineRunner *)v45 addCondition:v49];

    v50 = v9->_engineRunner;
    v51 = v9->_networkReachableTrigger;
    v52 = +[MapsSuggestionsFirstUnlockTrigger description];
    v53 = [(MapsSuggestionsNetworkReachableTrigger *)v51 objectForKeyedSubscript:v52];
    [(MapsSuggestionsEngineRunner *)v50 addCondition:v53];

    id v54 = [objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:&stru_10008C450];
    [(MapsSuggestionsEngineRunner *)v9->_engineRunner addPostFilter:v54];
    id v55 = [objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:&stru_10008C470];
    [(MapsSuggestionsEngineRunner *)v9->_engineRunner addPostFilter:v55];
    [(MapsSuggestionsEngineRunner *)v9->_engineRunner runASAP];
    [(NavdVenueAnnouncer *)v9 _startStreamersWithNotificationName:@"AirportAnnouncerNotification" resourceDepot:v6];
    v56 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "initialized", buf, 2u);
    }

    [(NavdVenueAnnouncer *)v9 _logStateForStep:@"featureInitialized"];
  }
  self = v9;
  v57 = self;
LABEL_18:

  return v57;
}

- (void)_startStreamersWithNotificationName:(id)a3 resourceDepot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = objc_alloc((Class)MapsSuggestionsBlockAction);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10004AE50;
  v26[3] = &unk_10008AD98;
  objc_copyWeak(&v29, &location);
  id v9 = v7;
  id v27 = v9;
  id v10 = v6;
  id v28 = v10;
  id v11 = [v8 initWithName:@"startStreamerAction" block:v26];
  if (!self->_state.locations)
  {
    id v12 = objc_alloc((Class)MapsSuggestionsLocationChangedTrigger);
    uint64_t v13 = +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
    v14 = (NSMutableArray *)[v12 initWithLocationUpdater:v13 forcingLocationUpdater:self->_locationChangedTrigger];
    locations = self->_state.locations;
    self->_state.locations = v14;
  }
  id v16 = objc_alloc((Class)MapsSuggestionsActionCircuit);
  double v31 = self->_state.locations;
  id v17 = +[NSArray arrayWithObjects:&v31 count:1];
  id v18 = [v16 initWithTriggers:v17 action:v11];
  v19 = *(void **)&self->_state.triggerLocation.currentSession;
  *(void *)&self->_state.triggerLocation.currentSession = v18;

  v20 = self->_state.locations;
  GEOConfigGetDouble();
  double v22 = v21;
  GEOConfigGetDouble();
  [(NSMutableArray *)v20 startWithMinimumUpdateTime:v22 minimumDistance:v23];
  double v24 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "_startStreamersActionCircut started. Once we get a location, we should start the streamers.", v25, 2u);
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)_cleanup
{
  self->_state.queue._innerQueue = 0;
  +[NavdVenueNotification hide];
  [(NavdRouteGeniusRoute *)self->_state.route stop];
  routes = self->_state.routes;
  self->_state.routes = 0;

  if (self->_state.startTime)
  {
    -[MapsSuggestionsEngineRunner removeCondition:](self->_engineRunner, "removeCondition:");
    startTime = self->_state.startTime;
    self->_state.startTime = 0;
  }
}

- (void)engineRunner:(id)a3 stoppedWithEntries:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B208;
  block[3] = &unk_100089798;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_processEntries:(id)a3
{
  id v50 = a3;
  v49 = MapsSuggestionsCurrentBestLocation();
  if (v49)
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      [v49 coordinate];
      uint64_t v6 = v5;
      [v49 coordinate];
      *(_DWORD *)buf = 134218240;
      uint64_t v61 = v6;
      __int16 v62 = 2048;
      uint64_t v63 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "current location : %f %f", buf, 0x16u);
    }

    [(NavdVenueAnnouncer *)self _cleanup];
    lastKnownLocation = self->_state.lastKnownLocation;
    id location = (id *)&self->_state.lastKnownLocation;
    if (lastKnownLocation)
    {
      id v9 = [(CLLocation *)lastKnownLocation dateForKey:@"MapsSuggestionsFlightDepartureTimeKey"];
      id v10 = MapsSuggestionsNowWithOffset(86400.0);
      BOOL v11 = [v9 compare:v10] == (id)1;

      if (v11)
      {
        [(NavdVenueAnnouncer *)self cleanupAirportArrival];
        id v12 = *location;
        *id location = 0;
      }
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v50;
    id v13 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (!v13)
    {
      char v51 = 0;
      id v52 = 0;
      goto LABEL_46;
    }
    char v51 = 0;
    id v52 = 0;
    uint64_t v14 = *(void *)v56;
    while (1)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v56 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if ([v16 type] != (id)15)
        {
          [(NavdVenueAnnouncer *)self _logStateForStep:@"entrySkipped" stopReason:@"not a Flight!"];
          continue;
        }
        id v17 = [(NavdVenueAnnouncer *)self _shouldTreatArrivalAirport:v16 over:self->_state.lastKnownLocation];
        if (*location != v17)
        {
          objc_storeStrong(location, v17);
          char v51 = 1;
        }
        id v18 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "receiving Flight entry", buf, 2u);
        }

        v19 = [v16 geoMapItem];
        char IsVenue = MapsSuggestionsMapItemIsVenue();

        if (IsVenue)
        {
          id v21 = v52;
          id v22 = v16;
          double v23 = v22;
          if (v21)
          {
            if (v22)
            {
              uint64_t v24 = MapsSuggestionsLocationForEntry();
              uint64_t v25 = MapsSuggestionsLocationForEntry();
              if (v24 | v25)
              {
                id v27 = MapsSuggestionsCurrentBestLocation();
                id v28 = v27;
                if (v27)
                {
                  [v27 distanceFromLocation:v24];
                  double v30 = v29;
                  [v28 distanceFromLocation:v25];
                  if (v30 <= v31) {
                    v32 = v21;
                  }
                  else {
                    v32 = v23;
                  }
                  id v52 = v32;
                }
                else
                {
                  id v52 = 0;
                }
              }
              else
              {
                id v52 = 0;
              }

              goto LABEL_35;
            }
            id v26 = v21;
          }
          else
          {
            id v26 = v22;
          }
          id v52 = v26;
LABEL_35:

          goto LABEL_36;
        }
        [(NavdVenueAnnouncer *)self _logStateForStep:@"entrySkipped" stopReason:@"not a Venue!"];
LABEL_36:
      }
      id v13 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (!v13)
      {
LABEL_46:

        v42 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "About to check for Airport Arrival Announcer", buf, 2u);
        }

        if (v51) {
          [(NavdVenueAnnouncer *)self _trackArrivalAirportForEntry:self->_state.lastKnownLocation];
        }
        if (v52)
        {
          [(NavdVenueAnnouncer *)self _logStateForStep:@"entriesProcessed" stopReason:@"Found a flight at a Venue!"];
          v43 = [v52 geoMapItem];
          int IsAirport = MapsSuggestionsMapItemIsAirport();

          if (IsAirport)
          {
            [(NavdVenueAnnouncer *)self _treatAirportEntry:v52];
          }
          else
          {
            v45 = [v52 geoMapItem];
            int IsTerminal = MapsSuggestionsMapItemIsTerminal();

            if (IsTerminal)
            {
              [(NavdVenueAnnouncer *)self _treatTerminalEntry:v52];
            }
            else
            {
              v47 = [v52 geoMapItem];
              int IsGate = MapsSuggestionsMapItemIsGate();

              if (IsGate) {
                [(NavdVenueAnnouncer *)self _treatGateEntry:v52];
              }
            }
          }
        }
        else
        {
          [(NavdVenueAnnouncer *)self _logStateForStep:@"entriesProcessed" stopReason:@"no flight at a Venue!"];
        }

        goto LABEL_59;
      }
    }
  }
  v33 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "current location is nil, nothing we can do now!", buf, 2u);
  }

  route = self->_state.route;
  if (!route)
  {
    id v35 = objc_alloc((Class)MapsSuggestionsLocationChangedTrigger);
    v36 = +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
    v37 = (NavdRouteGeniusRoute *)[v35 initWithLocationUpdater:v36 forcingLocationUpdater:self->_locationChangedTrigger];
    id v38 = self->_state.route;
    self->_state.route = v37;

    [(MapsSuggestionsEngineRunner *)self->_engineRunner addTrigger:self->_state.route];
    route = self->_state.route;
  }
  GEOConfigGetDouble();
  double v40 = v39;
  GEOConfigGetDouble();
  [(NavdRouteGeniusRoute *)route startWithMinimumUpdateTime:v40 minimumDistance:v41];
LABEL_59:
}

- (id)_shouldTreatArrivalAirport:(id)a3 over:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 stringForKey:@"MapsSuggestionsFlightArrivalAirportCodeKey"];

  if (v8)
  {
    if ([*(id *)&self->_state.skipScoring hasBudgetLeft])
    {
      id v9 = [v7 dateForKey:@"MapsSuggestionsFlightDepartureTimeKey"];
      if (!v7)
      {
        id v17 = v6;
        goto LABEL_16;
      }
      id v10 = [v6 dateForKey:@"MapsSuggestionsFlightDepartureTimeKey"];
      id v11 = [v9 compare:v10];
      if (v11 == (id)-1)
      {
        id v21 = [v7 stringForKey:@"MapsSuggestionsFlightDepartureAirportCodeKey"];
        id v22 = [v6 stringForKey:@"MapsSuggestionsFlightArrivalAirportCodeKey"];
        unsigned __int8 v23 = [v21 isEqualToString:v22];

        id v12 = v7;
        if (v23) {
          goto LABEL_8;
        }
      }
      else
      {
        id v12 = v7;
        if (v11 != (id)1) {
          goto LABEL_8;
        }
        id v13 = [v7 stringForKey:@"MapsSuggestionsFlightArrivalAirportCodeKey"];
        uint64_t v14 = [v6 stringForKey:@"MapsSuggestionsFlightDepartureAirportCodeKey"];
        unsigned __int8 v15 = [v13 isEqualToString:v14];

        id v12 = v7;
        if ((v15 & 1) == 0) {
          goto LABEL_8;
        }
      }
      etaCanKicker = self->_state.etaCanKicker;
      self->_state.etaCanKicker = 0;

      id v12 = v6;
LABEL_8:
      id v17 = v12;

LABEL_16:
      goto LABEL_17;
    }
    v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "No budget left for arrival airport", v24, 2u);
    }

    id v17 = 0;
  }
  else
  {
    id v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "No arrival airport, sticking with what we have", buf, 2u);
    }

    id v17 = v7;
  }
LABEL_17:

  return v17;
}

- (void)_startTrackingLeavingTheAirport:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 numberForKey:@"MapsSuggestionsFlightArrivalAirportLatitudeKey"];
  [v5 doubleValue];
  double v7 = v6;

  id v8 = [v4 numberForKey:@"MapsSuggestionsFlightArrivalAirportLongitudeKey"];
  [v8 doubleValue];
  double v10 = v9;

  GEOFindOrCreateLog();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [v4 departingAirportCode];
    *(_DWORD *)buf = 138412290;
    v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Start tracking Leaving Airport:%@", buf, 0xCu);
  }
  id v13 = [objc_alloc((Class)CLLocation) initWithLatitude:v7 longitude:v10];
  id v14 = objc_alloc((Class)MapsSuggestionsRangeTrigger);
  GEOConfigGetDouble();
  double v16 = v15;
  GEOConfigGetDouble();
  double v18 = v17;
  v19 = +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
  id v20 = [v14 initWithLocation:v13 radius:0 onEnter:v19 minUpdateTime:self->_locationChangedTrigger locationUpdater:v16 forcingLocationUpdater:v18];

  objc_initWeak((id *)buf, self);
  id v21 = objc_alloc((Class)MapsSuggestionsBlockAction);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10004C118;
  v28[3] = &unk_10008ADC0;
  objc_copyWeak(&v30, (id *)buf);
  id v22 = v4;
  id v29 = v22;
  id v23 = [v21 initWithName:@"departureAction" block:v28];
  id v24 = objc_alloc((Class)MapsSuggestionsActionCircuit);
  id v31 = v20;
  uint64_t v25 = +[NSArray arrayWithObjects:&v31 count:1];
  id v26 = (NSData *)[v24 initWithTriggers:v25 conditions:&__NSArray0__struct action:v23];
  sessionState = self->_state.sessionState;
  self->_state.sessionState = v26;

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
}

- (void)cleanupAirportArrival
{
  etaCanKicker = self->_state.etaCanKicker;
  self->_state.etaCanKicker = 0;

  sessionState = self->_state.sessionState;
  self->_state.sessionState = 0;

  id location = self->_state.triggerLocation.location;
  self->_state.triggerLocation.id location = 0;

  lastEngineRunnerState = self->_lastEngineRunnerState;
  self->_lastEngineRunnerState = 0;
}

- (void)_setupOfflineDownloadNotificationCircuitForEntry:(id)a3
{
  id v41 = a3;
  if (self->_state.locationHistory)
  {
    objc_initWeak((id *)location, self);
    id v4 = [MapsSuggestionsOfflineDownloadNotificationAction alloc];
    uint64_t v5 = *(void *)&self->_state.skipScoring;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10004C904;
    v42[3] = &unk_1000896E8;
    objc_copyWeak(&v43, (id *)location);
    double v40 = [(MapsSuggestionsOfflineDownloadNotificationAction *)v4 initWithEntry:v41 budget:v5 completion:v42];
    networkReachableTrigger = self->_networkReachableTrigger;
    v37 = +[MapsSuggestionsMapsInstalledTriggeringToggle description];
    double v7 = -[MapsSuggestionsNetworkReachableTrigger objectForKeyedSubscript:](networkReachableTrigger, "objectForKeyedSubscript:");
    v45[0] = v7;
    id v8 = self->_networkReachableTrigger;
    double v9 = +[MapsSuggestionsFirstUnlockTrigger description];
    double v10 = [(MapsSuggestionsNetworkReachableTrigger *)v8 objectForKeyedSubscript:v9];
    v45[1] = v10;
    id v11 = self->_networkReachableTrigger;
    id v12 = +[MapsSuggestionsDestinationdTrigger description];
    id v13 = [(MapsSuggestionsNetworkReachableTrigger *)v11 objectForKeyedSubscript:v12];
    v45[2] = v13;
    id v14 = self->_networkReachableTrigger;
    double v15 = +[MapsSuggestionsEventKitChangedTrigger description];
    double v16 = [(MapsSuggestionsNetworkReachableTrigger *)v14 objectForKeyedSubscript:v15];
    v45[3] = v16;
    double v17 = self->_networkReachableTrigger;
    double v18 = +[MapsSuggestionsNetworkReachableTrigger description];
    v19 = [(MapsSuggestionsNetworkReachableTrigger *)v17 objectForKeyedSubscript:v18];
    locationHistory = self->_state.locationHistory;
    v45[4] = v19;
    v45[5] = locationHistory;
    double v39 = +[NSArray arrayWithObjects:v45 count:6];

    id v21 = self->_networkReachableTrigger;
    id v38 = +[MapsSuggestionsMapsInstalledTriggeringToggle description];
    id v22 = [(MapsSuggestionsNetworkReachableTrigger *)v21 objectForKeyedSubscript:v38];
    v44[0] = v22;
    id v23 = self->_networkReachableTrigger;
    id v24 = +[MapsSuggestionsNoCellularDataCondition description];
    uint64_t v25 = [(MapsSuggestionsNetworkReachableTrigger *)v23 objectForKeyedSubscript:v24];
    v44[1] = v25;
    id v26 = self->_networkReachableTrigger;
    id v27 = +[MapsSuggestionsSiri isEnabledCondition];
    id v28 = [v27 uniqueName];
    id v29 = [(MapsSuggestionsNetworkReachableTrigger *)v26 objectForKeyedSubscript:v28];
    v44[2] = v29;
    id v30 = self->_networkReachableTrigger;
    id v31 = +[MapsSuggestionsFirstUnlockTrigger description];
    v32 = [(MapsSuggestionsNetworkReachableTrigger *)v30 objectForKeyedSubscript:v31];
    v44[3] = v32;
    v33 = +[NSArray arrayWithObjects:v44 count:4];

    id v34 = (CLLocation *)[objc_alloc((Class)MapsSuggestionsActionCircuit) initWithTriggers:v39 conditions:v33 action:v40];
    id v35 = self->_state.triggerLocation.location;
    self->_state.triggerLocation.id location = v34;

    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v36 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/VenueAnnouncer/NavdVenueAnnouncer.mm";
      __int16 v47 = 1024;
      int v48 = 567;
      __int16 v49 = 2082;
      id v50 = "-[NavdVenueAnnouncer _setupOfflineDownloadNotificationCircuitForEntry:]";
      __int16 v51 = 2082;
      id v52 = "nil == (_simpleTrigger)";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. SimpleTrigger should not be nil", location, 0x26u);
    }
  }
}

- (void)_trackArrivalAirportForEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 numberForKey:@"MapsSuggestionsFlightArrivalAirportLatitudeKey"];
  [v5 doubleValue];
  double v7 = v6;

  id v8 = [v4 numberForKey:@"MapsSuggestionsFlightArrivalAirportLongitudeKey"];
  [v8 doubleValue];
  double v10 = v9;

  GEOFindOrCreateLog();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [v4 arrivingAirportCode];
    *(_DWORD *)buf = 138412290;
    __int16 v49 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Start tracking arriving at Airport:%@", buf, 0xCu);
  }
  id v13 = [objc_alloc((Class)CLLocation) initWithLatitude:v7 longitude:v10];
  id v14 = objc_alloc((Class)MapsSuggestionsRangeTrigger);
  GEOConfigGetDouble();
  double v16 = v15;
  GEOConfigGetDouble();
  double v18 = v17;
  v19 = +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
  id v20 = [v14 initWithLocation:v13 radius:1 onEnter:v19 minUpdateTime:self->_locationChangedTrigger locationUpdater:v16 forcingLocationUpdater:v18];

  if (!self->_state.locationHistory)
  {
    id v21 = (NavdBucketizedLocations *)[objc_alloc((Class)MapsSuggestionsSimpleTrigger) initWithName:@"AirportArrivalSimpleTrigger"];
    locationHistory = self->_state.locationHistory;
    self->_state.locationHistory = v21;
  }
  objc_initWeak((id *)buf, self);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10004CF44;
  v43[3] = &unk_10008AD98;
  objc_copyWeak(&v46, (id *)buf);
  id v23 = v4;
  id v44 = v23;
  v45 = self;
  id v24 = v43;
  id v25 = [objc_alloc((Class)MapsSuggestionsBlockAction) initWithName:@"NavdVenueAnnouncerAirportArrivalAction" block:v24];

  id v26 = objc_alloc((Class)MapsSuggestionsGCDTimer);
  queue = self->_queue;
  v37 = _NSConcreteStackBlock;
  uint64_t v38 = 3221225472;
  double v39 = sub_10004D13C;
  double v40 = &unk_100089798;
  objc_copyWeak(&v42, (id *)buf);
  id v28 = v23;
  id v41 = v28;
  id v29 = (NSDictionary *)[v26 initWithName:@"AirportArrivalTimer" queue:queue block:&v37];
  lastEngineRunnerState = self->_lastEngineRunnerState;
  self->_lastEngineRunnerState = v29;

  id v31 = self->_lastEngineRunnerState;
  GEOConfigGetDouble();
  -[NSDictionary scheduleWithInterval:leeway:](v31, "scheduleWithInterval:leeway:", (uint64_t)(v32 * 1000000000.0), 60000000000, v37, v38, v39, v40);
  id v33 = objc_alloc((Class)MapsSuggestionsActionCircuit);
  id v47 = v20;
  id v34 = +[NSArray arrayWithObjects:&v47 count:1];
  id v35 = (MapsSuggestionsCanKicker *)[v33 initWithTriggers:v34 conditions:&__NSArray0__struct action:v25];
  etaCanKicker = self->_state.etaCanKicker;
  self->_state.etaCanKicker = v35;

  objc_destroyWeak(&v42);
  objc_destroyWeak(&v46);
  objc_destroyWeak((id *)buf);
}

- (void)_treatAirportEntry:(id)a3
{
  id v4 = a3;
  [(NavdVenueAnnouncer *)self _logStateForStep:@"got Airport" stopReason:0];
  uint64_t v5 = [v4 geoMapItem];
  double v6 = [v5 _browseCategories];
  id v7 = [v6 count];

  if (v7)
  {
    [(NavdVenueAnnouncer *)self _fireNotificationIfAtEntry:v4];
  }
  else
  {
    [(NavdVenueAnnouncer *)self _logStateForStep:@"Airport has no browse categories" stopReason:0];
    id v8 = [v4 stringForKey:@"MapsSuggestionsFlightTerminalSearchKey"];

    if (v8)
    {
      objc_initWeak(&location, self);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10004D4B0;
      v9[3] = &unk_1000897E8;
      objc_copyWeak(&v12, &location);
      id v10 = v4;
      id v11 = self;
      [(NavdVenueAnnouncer *)self _terminalMapItemForEntry:v10 completion:v9];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else
    {
      [(NavdVenueAnnouncer *)self _logStateForStep:@"no Terminal name to search for" stopReason:0];
    }
  }
}

- (void)_treatTerminalEntry:(id)a3
{
  id v4 = a3;
  [(NavdVenueAnnouncer *)self _logStateForStep:@"got Terminal" stopReason:0];
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004D798;
  v6[3] = &unk_10008C498;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(NavdVenueAnnouncer *)self _airportMapItemForEntry:v5 completion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_treatGateEntry:(id)a3
{
  id v4 = a3;
  [(NavdVenueAnnouncer *)self _logStateForStep:@"got Gate" stopReason:0];
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004DB4C;
  v6[3] = &unk_10008C498;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(NavdVenueAnnouncer *)self _airportMapItemForEntry:v5 completion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (char)_airportMapItemForEntry:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [v6 stringForKey:@"MapsSuggestionsFlightDepartureAirportCodeKey"];
  double v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    double v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Looking for airport with code %@", buf, 0xCu);
  }

  id v12 = v7;
  objc_copyWeak(&v13, &location);
  char v10 = MapsSuggestionsSearchAirport();
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return v10;
}

- (char)_terminalMapItemForEntry:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [v6 stringForKey:@"MapsSuggestionsFlightTerminalSearchKey"];
  double v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    double v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Looking for terminal name '%@'", buf, 0xCu);
  }

  id v12 = v7;
  objc_copyWeak(&v13, &location);
  char v10 = MapsSuggestionsSearchTerminal();
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return v10;
}

- (void)_fireNotificationIfAtEntry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 geoMapItem];

  if (!v5)
  {
    id v75 = [objc_alloc((Class)NSString) initWithFormat:@"There is no mapItem?!"];
    v76 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v129 = v75;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "Aborted location check: %@", buf, 0xCu);
    }
    goto LABEL_30;
  }
  id v6 = [v4 geoMapItem];
  char IsVenue = MapsSuggestionsMapItemIsVenue();

  if ((IsVenue & 1) == 0)
  {
    id v77 = objc_alloc((Class)NSString);
    v78 = [v4 geoMapItem];
    id v75 = [v77 initWithFormat:@"'%@' is not a not an Venue!", v78];

    v76 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v129 = v75;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "Aborted location check: %@", buf, 0xCu);
    }
LABEL_30:

    [(NavdVenueAnnouncer *)self _logStateForStep:@"locationSkipped" stopReason:v75];
LABEL_58:

    goto LABEL_59;
  }
  id v8 = [v4 geoMapItem];
  double v9 = [v8 _browseCategories];
  id v10 = [v9 count];

  if (v10)
  {
    id v11 = [v4 geoMapItem];
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "VBB:-- Start Venue BoundingBox --", buf, 2u);
    }

    GEOFindOrCreateLog();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v14 = [v11 _venueInfo];
      double v15 = [v14 venueIdentifier];
      *(_DWORD *)buf = 138412290;
      id v129 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "VBB:VenueIdentifier: %@", buf, 0xCu);
    }
    GEOFindOrCreateLog();
    double v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      double v17 = [v11 name];
      *(_DWORD *)buf = 138412290;
      id v129 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "VBB:Venue name: %@", buf, 0xCu);
    }
    double v18 = [v11 geoFenceMapRegion];
    if ([v18 hasEastLng])
    {
      v19 = [v11 geoFenceMapRegion];
      if ([v19 hasWestLng])
      {
        id v20 = [v11 geoFenceMapRegion];
        if ([v20 hasNorthLat])
        {
          id v21 = [v11 geoFenceMapRegion];
          unsigned __int8 v22 = [v21 hasSouthLat];

          if (v22)
          {
            GEOFindOrCreateLog();
            id v23 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              id v24 = [v11 geoFenceMapRegion];
              [v24 centerLat];
              id v26 = v25;
              id v27 = [v11 geoFenceMapRegion];
              [v27 centerLng];
              *(_DWORD *)buf = 134218240;
              id v129 = v26;
              __int16 v130 = 2048;
              uint64_t v131 = v28;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "VBB:Venue center <%.6f,%.6f>", buf, 0x16u);
            }
            GEOFindOrCreateLog();
            id v29 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              id v30 = [v11 geoFenceMapRegion];
              [v30 northLat];
              double v32 = v31;
              id v33 = [v11 geoFenceMapRegion];
              [v33 westLng];
              *(_DWORD *)buf = 134218240;
              id v129 = v32;
              __int16 v130 = 2048;
              uint64_t v131 = v34;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "VBB:Venue topLeft <%.6f,%.6f>", buf, 0x16u);
            }
            GEOFindOrCreateLog();
            id v35 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              v36 = [v11 geoFenceMapRegion];
              [v36 northLat];
              uint64_t v38 = v37;
              double v39 = [v11 geoFenceMapRegion];
              [v39 eastLng];
              *(_DWORD *)buf = 134218240;
              id v129 = v38;
              __int16 v130 = 2048;
              uint64_t v131 = v40;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "VBB:Venue topRight <%.6f,%.6f>", buf, 0x16u);
            }
            GEOFindOrCreateLog();
            id v41 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              id v42 = [v11 geoFenceMapRegion];
              [v42 southLat];
              id v44 = v43;
              v45 = [v11 geoFenceMapRegion];
              [v45 westLng];
              *(_DWORD *)buf = 134218240;
              id v129 = v44;
              __int16 v130 = 2048;
              uint64_t v131 = v46;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "VBB:Venue bottomLeft <%.6f,%.6f>", buf, 0x16u);
            }
            GEOFindOrCreateLog();
            id v47 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              int v48 = [v11 geoFenceMapRegion];
              [v48 southLat];
              id v50 = v49;
              __int16 v51 = [v11 geoFenceMapRegion];
              [v51 eastLng];
              *(_DWORD *)buf = 134218240;
              id v129 = v50;
              __int16 v130 = 2048;
              uint64_t v131 = v52;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "VBB:Venue bottomRight <%.6f,%.6f>", buf, 0x16u);
            }
            GEOFindOrCreateLog();
            v53 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              v127 = [v11 geoFenceMapRegion];
              [v127 northLat];
              long long v55 = v54;
              v126 = [v11 geoFenceMapRegion];
              [v126 westLng];
              uint64_t v57 = v56;
              v125 = [v11 geoFenceMapRegion];
              [v125 northLat];
              uint64_t v59 = v58;
              v60 = [v11 geoFenceMapRegion];
              [v60 eastLng];
              uint64_t v62 = v61;
              uint64_t v63 = [v11 geoFenceMapRegion];
              [v63 southLat];
              uint64_t v65 = v64;
              __int16 v66 = [v11 geoFenceMapRegion];
              [v66 eastLng];
              uint64_t v68 = v67;
              v69 = [v11 geoFenceMapRegion];
              [v69 southLat];
              uint64_t v71 = v70;
              v72 = [v11 geoFenceMapRegion];
              [v72 westLng];
              *(_DWORD *)buf = 134219776;
              id v129 = v55;
              __int16 v130 = 2048;
              uint64_t v131 = v57;
              __int16 v132 = 2048;
              uint64_t v133 = v59;
              __int16 v134 = 2048;
              uint64_t v135 = v62;
              __int16 v136 = 2048;
              uint64_t v137 = v65;
              __int16 v138 = 2048;
              uint64_t v139 = v68;
              __int16 v140 = 2048;
              uint64_t v141 = v71;
              __int16 v142 = 2048;
              uint64_t v143 = v73;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "\n#polygon 0\n%.6f,%.6f\n%.6f,%.6f\n%.6f,%.6f\n%.6f,%.6f\n", buf, 0x52u);
            }
            v74 = GEOFindOrCreateLog();
            if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_43;
            }
            *(_WORD *)buf = 0;
LABEL_42:
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "VBB:-- End Venue BoundingBox --", buf, 2u);
LABEL_43:

            MapsSuggestionsCurrentBestLocation();
            id v75 = (id)objc_claimAutoreleasedReturnValue();
            [v75 coordinate];
            double v81 = v80;
            [v75 coordinate];
            double v83 = v82;
            [(NavdVenueAnnouncer *)self _logStateForStep:@"checkLocation" stopReason:0];
            v84 = [v4 geoMapItem];
            v85 = [v84 geoFenceMapRegion];
            unsigned int v86 = objc_msgSend(v85, "containsCoordinate:", v81, v83);

            if (v86)
            {
              v87 = self;
              objc_sync_enter(v87);
              [(NavdVenueAnnouncer *)v87 _logStateForStep:@"showNotification" stopReason:0];
              v88 = [v4 geoMapItem];
              v89 = [v88 _venueInfo];
              v90 = [v89 venueIdentifier];
              v87->_state.queue._innerQueue = (OS_dispatch_queue *)[v90 venueID];

              id v91 = objc_alloc((Class)MapsSuggestionsBudget);
              v92 = [v4 geoMapItem];
              v93 = [v92 name];
              id v94 = [v91 initWithDelegate:v87 name:v93];
              v95 = *(void **)&v87->_state.active;
              *(void *)&v87->_state.active = v94;

              v96 = *(void **)&v87->_state.active;
              uint64_t Integer = GEOConfigGetInteger();
              GEOConfigGetDouble();
              objc_msgSend(v96, "addRollingWindowOfCount:perTimeInterval:name:", Integer, @"shortWindow");
              v98 = *(void **)&v87->_state.active;
              uint64_t v99 = GEOConfigGetInteger();
              GEOConfigGetDouble();
              objc_msgSend(v98, "addRollingWindowOfCount:perTimeInterval:name:", v99, @"longWindow");
              if ([*(id *)&v87->_state.active hasBudgetLeft])
              {
                v100 = [v4 geoMapItem];
                v101 = [v4 stringForKey:@"MapsSuggestionsFlightDepartureAirportCodeKey"];
                +[NavdVenueNotification showWithMapItem:v100 airport:v101];

                v102 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEBUG, "Spending Bugdet", buf, 2u);
                }

                [*(id *)&v87->_state.active spendNow];
              }
              else
              {
                v120 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEBUG, "No Budget left", buf, 2u);
                }
              }
              id v121 = objc_alloc((Class)MapsSuggestionsOutsideOfMapItemFenceCondition);
              v122 = [v4 geoMapItem];
              GEOConfigGetDouble();
              v123 = (NSDate *)objc_msgSend(v121, "initWithMapItem:radius:", v122);
              startTime = v87->_state.startTime;
              v87->_state.startTime = v123;

              [(MapsSuggestionsEngineRunner *)v87->_engineRunner addCondition:v87->_state.startTime];
              [(NavdRouteGeniusRoute *)v87->_state.route stop];
              objc_sync_exit(v87);
            }
            else
            {
              v103 = [v4 geoMapItem];
              MapsSuggestionsLocationForMapItem();
              v87 = (NavdVenueAnnouncer *)objc_claimAutoreleasedReturnValue();

              if (!self->_state.routes)
              {
                networkReachableTrigger = self->_networkReachableTrigger;
                v105 = +[MapsSuggestionsNetworkReachableTrigger description];
                v106 = [(MapsSuggestionsNetworkReachableTrigger *)networkReachableTrigger objectForKeyedSubscript:v105];
                routes = self->_state.routes;
                self->_state.routes = v106;

                [(MapsSuggestionsEngineRunner *)self->_engineRunner addTrigger:self->_state.routes];
              }
              route = self->_state.route;
              if (!route)
              {
                id v109 = objc_alloc((Class)MapsSuggestionsLocationChangedTrigger);
                v110 = +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
                v111 = (NavdRouteGeniusRoute *)[v109 initWithLocationUpdater:v110 forcingLocationUpdater:self->_locationChangedTrigger];
                v112 = self->_state.route;
                self->_state.route = v111;

                [(MapsSuggestionsEngineRunner *)self->_engineRunner addTrigger:self->_state.route];
                route = self->_state.route;
              }
              [v75 distanceFromLocation:v87];
              double v114 = v113;
              GEOConfigGetDouble();
              double v116 = v115;
              [v75 distanceFromLocation:v87];
              double v118 = v117;
              GEOConfigGetDouble();
              [(NavdRouteGeniusRoute *)route startWithMinimumUpdateTime:v114 / v116 minimumDistance:v118 * v119];
            }

            goto LABEL_58;
          }
LABEL_38:
          v79 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "VBB:Venue missing lat/long", buf, 2u);
          }

          v74 = GEOFindOrCreateLog();
          if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_43;
          }
          *(_WORD *)buf = 0;
          goto LABEL_42;
        }
      }
    }

    goto LABEL_38;
  }
  [(NavdVenueAnnouncer *)self _logStateForStep:@"locationSkipped" stopReason:@"No browse categories"];
LABEL_59:
}

- (void)engineRunner:(id)a3 startedBecauseOfTrigger:(id)a4
{
  id v5 = a4;
  [(NavdRouteGeniusRoute *)self->_state.route stop];
  GEOFindOrCreateLog();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [v5 uniqueName];
    int v8 = 138412290;
    double v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Triggered by %@", (uint8_t *)&v8, 0xCu);
  }
  [(NavdVenueAnnouncer *)self _logStateForStep:@"didStart" stopReason:0];
}

- (void)engineRunner:(id)a3 step:(id)a4 jsonDict:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  int v8 = self;
  objc_sync_enter(v8);
  double v9 = (NSString *)[v7 copy];
  name = v8->_state.queue._name;
  v8->_state.queue._name = v9;

  objc_sync_exit(v8);
  [(NavdVenueAnnouncer *)v8 _logStateForStep:v11];
}

- (void)_logStateForStep:(id)a3
{
}

- (void)_logStateForStep:(id)a3 stopReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = self;
  objc_sync_enter(v8);
  v19[0] = @"step";
  double v9 = MSg::jsonFor();
  v20[0] = v9;
  v19[1] = @"stopReason";
  id v10 = MSg::jsonFor();
  v20[1] = v10;
  v19[2] = @"engineRunner";
  id v11 = MSg::jsonFor();
  v20[2] = v11;
  v19[3] = @"feature";
  CFStringRef v21 = @"displayedMapItem";
  id v12 = +[NSNumber numberWithUnsignedLongLong:v8->_state.queue._innerQueue];
  id v13 = MSg::jsonFor();
  *(void *)double v18 = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:v18 forKeys:&v21 count:1];

  v20[3] = v14;
  double v15 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];

  GEOFindOrCreateLog();
  double v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    double v17 = NSStringFromMapsSuggestionsJSON();
    *(_DWORD *)double v18 = 138412290;
    *(void *)&v18[4] = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "EVAL{Welcome}=%@", v18, 0xCu);
  }
  objc_sync_exit(v8);
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (id)readBudgetState
{
  return (id)_GEOConfigGetDictionary(GEOConfigMapsSuggestionsNavdAnnouncerBudgetState[0], GEOConfigMapsSuggestionsNavdAnnouncerBudgetState[1]);
}

- (void)writeBudgetState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkReachableTrigger, 0);
  objc_storeStrong((id *)&self->_locationChangedTrigger, 0);
  objc_storeStrong((id *)&self->_lastEngineRunnerState, 0);
  objc_storeStrong((id *)&self->_state.skipScoring, 0);
  objc_storeStrong((id *)&self->_state.triggerLocation.currentSession, 0);
  objc_storeStrong((id *)&self->_state.triggerLocation.location, 0);
  objc_storeStrong((id *)&self->_state.sessionState, 0);
  objc_storeStrong((id *)&self->_state.etaCanKicker, 0);
  objc_storeStrong((id *)&self->_state.lastKnownLocation, 0);
  objc_storeStrong((id *)&self->_state.active, 0);
  objc_storeStrong((id *)&self->_state.startTime, 0);
  objc_storeStrong((id *)&self->_state.locations, 0);
  objc_storeStrong((id *)&self->_state.locationHistory, 0);
  objc_storeStrong((id *)&self->_state.origin, 0);
  objc_storeStrong((id *)&self->_state.routes, 0);
  objc_storeStrong((id *)&self->_state.route, 0);
  objc_storeStrong((id *)&self->_state.queue._name, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_network, 0);

  objc_storeStrong((id *)&self->_engineRunner, 0);
}

@end