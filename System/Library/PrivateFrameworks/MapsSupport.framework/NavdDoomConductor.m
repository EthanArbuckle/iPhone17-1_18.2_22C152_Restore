@interface NavdDoomConductor
- (BOOL)_updateExitTime;
- (BOOL)hasCurrentDoomWindow;
- (BOOL)hasDestinations;
- (BOOL)hasDoomWindow;
- (BOOL)isInTripMode;
- (BOOL)update;
- (BOOL)updateDestinationsForWindow:(id)a3;
- (BOOL)updateRoutesForDestinations:(id)a3;
- (NSString)uniqueName;
- (NavdDoomAlerter)alerter;
- (NavdDoomConductor)initWithStorage:(id)a3 exitTimeUpdater:(id)a4 destinationsUpdater:(id)a5 routesUpdater:(id)a6 guard:(id)a7 alerter:(id)a8 scheduler:(id)a9;
- (NavdDoomDestinationsUpdater)destinationsUpdater;
- (NavdDoomExitTimeUpdater)exitTimeUpdater;
- (NavdDoomGuard)guard;
- (NavdDoomRoutesUpdater)routesUpdater;
- (NavdDoomScheduler)scheduler;
- (NavdDoomStorage)internalStorage;
- (double)defaultDoomWindowMaxSecondsAfterExitTime;
- (double)defaultDoomWindowMaxSecondsBeforeExitTime;
- (double)defaultTimeToRunDestinationsUpdater;
- (double)defaultWakeupTimeBeforeWindow;
- (double)defaultWakeupTimeWithinWindow;
- (double)defaultWakeupWithoutWindow;
- (id)_wakeupTimeForWindow:(id)a3;
- (void)_didEndUpdate;
- (void)_didFireAlert:(id)a3;
- (void)_didInvalidateWindowForReason:(unint64_t)a3;
- (void)_didScheduleWakeup:(id)a3;
- (void)_didUpdateDestinations:(id)a3;
- (void)_didUpdateExitTime:(id)a3;
- (void)_didUpdateRoutes:(id)a3 incidents:(id)a4;
- (void)_didUpdateWindowForDoom:(id)a3;
- (void)_scheduleRunAt:(id)a3;
- (void)_setWindowFromExitTime:(id)a3;
- (void)_willFireAlert;
- (void)_willStartUpdate;
- (void)_willUpdateDestinations;
- (void)_willUpdateExitTime;
- (void)_willUpdateRoutes;
- (void)registerObserver:(id)a3;
- (void)setAlerter:(id)a3;
- (void)setDestinationsUpdater:(id)a3;
- (void)setExitTimeUpdater:(id)a3;
- (void)setGuard:(id)a3;
- (void)setInternalStorage:(id)a3;
- (void)setRoutesUpdater:(id)a3;
- (void)setScheduler:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation NavdDoomConductor

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (NavdDoomConductor)initWithStorage:(id)a3 exitTimeUpdater:(id)a4 destinationsUpdater:(id)a5 routesUpdater:(id)a6 guard:(id)a7 alerter:(id)a8 scheduler:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v33.receiver = self;
  v33.super_class = (Class)NavdDoomConductor;
  v23 = [(NavdDoomConductor *)&v33 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_internalStorage, a3);
    objc_storeWeak((id *)&v24->_exitTimeUpdater, v17);
    objc_storeWeak((id *)&v24->_guard, v20);
    objc_storeWeak((id *)&v24->_destinationsUpdater, v18);
    id v25 = objc_storeWeak((id *)&v24->_routesUpdater, v19);
    [v19 registerObserver:v24];

    objc_storeWeak((id *)&v24->_alerter, v21);
    objc_storeWeak((id *)&v24->_scheduler, v22);
    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("NavdDoomQueue", v26);
    queue = v24->_queue;
    v24->_queue = (OS_dispatch_queue *)v27;

    v29 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:517 capacity:1];
    observers = v24->_observers;
    v24->_observers = v29;

    v31 = v24;
  }

  return v24;
}

- (BOOL)update
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Conductor update started", (uint8_t *)&buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A5AC;
  block[3] = &unk_100088EE0;
  block[4] = self;
  dispatch_sync(queue, block);
  objc_initWeak(&buf, self);
  v5 = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A5B4;
  v7[3] = &unk_1000893C0;
  objc_copyWeak(&v8, &buf);
  dispatch_async(v5, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&buf);
  return 1;
}

- (BOOL)_updateExitTime
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exitTimeUpdater);

  v4 = GEOFindOrCreateLog();
  v5 = v4;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = [(NavdDoomConductor *)self uniqueName];
      *(_DWORD *)id buf = 138412546;
      *(void *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "STEP 1: Updating ExitTimes";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    v7 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "STEP 1: Updating ExitTimes", "", buf, 2u);
    }

    [(NavdDoomConductor *)self _willUpdateExitTime];
    id v8 = [(NavdDoomStorage *)self->_internalStorage mostRecentDoomWindow];
    v5 = v8;
    if (v8)
    {
      v9 = [v8 endDate];
      BOOL v10 = MapsSuggestionsIsInThePast(v9);

      if (v10)
      {
        [(NavdDoomConductor *)self _didInvalidateWindowForReason:1];
        [(NavdDoomConductor *)self _didUpdateWindowForDoom:0];
      }
    }
    v11 = MapsSuggestionsMostRecentLocation();
    BOOL v12 = v11 != 0;
    v13 = GEOFindOrCreateLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      if (v14)
      {
        *(_DWORD *)id buf = 138412290;
        *(void *)&buf[4] = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Our current leeched location is %@", buf, 0xCu);
      }

      v15 = MapsSuggestionsNow();
      *(void *)id buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      buf[24] = 0;
      objc_initWeak(&location, self);
      queue = self->_queue;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10002AB84;
      v22[3] = &unk_10008AB78;
      id v25 = buf;
      v22[4] = self;
      id v23 = v11;
      id v24 = v15;
      id v17 = v15;
      objc_copyWeak(&v26, &location);
      dispatch_async(queue, v22);
      objc_destroyWeak(&v26);

      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (v14)
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Got no location to work with. Keeping window we have.", buf, 2u);
      }

      [(NavdDoomConductor *)self _didUpdateExitTime:0];
      id v18 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v19 = [(NavdDoomConductor *)self uniqueName];
        *(_DWORD *)id buf = 138412546;
        *(void *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "STEP 1: Updating ExitTimes";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      id v20 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v20))
      {
        *(_WORD *)id buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 1: Updating ExitTimes", "", buf, 2u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomConductor.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 114;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[NavdDoomConductor _updateExitTime]";
      __int16 v29 = 2082;
      v30 = "nil == (_exitTimeUpdater)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an exit time updater to be set.", buf, 0x26u);
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)updateDestinationsForWindow:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_destinationsUpdater);
  BOOL v6 = WeakRetained == 0;

  v7 = GEOFindOrCreateLog();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id buf = 136446978;
      id v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomConductor.m";
      __int16 v26 = 1024;
      *(_DWORD *)dispatch_queue_t v27 = 186;
      *(_WORD *)&v27[4] = 2082;
      *(void *)&v27[6] = "-[NavdDoomConductor updateDestinationsForWindow:]";
      __int16 v28 = 2082;
      __int16 v29 = "nil == (_destinationsUpdater)";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destinations updater to be set", buf, 0x26u);
    }

    goto LABEL_19;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "STEP 2: Updating Destinations", buf, 2u);
  }

  [(NavdDoomConductor *)self _willUpdateDestinations];
  if (!v4
    || (MapsSuggestionsNow(),
        v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v4 containsDate:v9],
        v9,
        (v10 & 1) == 0))
  {
    id v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      MapsSuggestionsNow();
      id v17 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)id buf = 138412546;
      id v25 = v17;
      __int16 v26 = 2112;
      *(void *)dispatch_queue_t v27 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "We are not currently in a window (%@ not in %@).", buf, 0x16u);
    }
    id v18 = [(NavdDoomConductor *)self _wakeupTimeForWindow:v4];
    [(NavdDoomConductor *)self _scheduleRunAt:v18];

    [(NavdDoomConductor *)self _didUpdateDestinations:0];
    id v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "STEP 2: Updating Destinations FAIL", buf, 2u);
    }

LABEL_19:
    unsigned __int8 v14 = 0;
    goto LABEL_20;
  }
  objc_initWeak((id *)buf, self);
  id v11 = objc_loadWeakRetained((id *)&self->_destinationsUpdater);
  [(NavdDoomConductor *)self defaultTimeToRunDestinationsUpdater];
  double v13 = v12;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002B768;
  v22[3] = &unk_10008ABC8;
  v22[4] = self;
  objc_copyWeak(&v23, (id *)buf);
  unsigned __int8 v14 = [v11 updateDestinationsForDuration:v22 completionHandler:v13];

  if ((v14 & 1) == 0)
  {
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "STEP 2: Updating Destinations FAIL", v21, 2u);
    }

    [(NavdDoomConductor *)self _didUpdateDestinations:0];
  }
  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
LABEL_20:

  return v14;
}

- (BOOL)updateRoutesForDestinations:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_guard);

  if (!WeakRetained)
  {
    v40 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id buf = 136446978;
      v68 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomConductor.m";
      __int16 v69 = 1024;
      *(_DWORD *)v70 = 233;
      *(_WORD *)&v70[4] = 2082;
      *(void *)&v70[6] = "-[NavdDoomConductor updateRoutesForDestinations:]";
      __int16 v71 = 2082;
      v72 = "nil == (_guard)";
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a guard to be set.", buf, 0x26u);
    }
    goto LABEL_60;
  }
  id v6 = objc_loadWeakRetained((id *)&self->_routesUpdater);

  if (!v6)
  {
    v40 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id buf = 136446978;
      v68 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomConductor.m";
      __int16 v69 = 1024;
      *(_DWORD *)v70 = 234;
      *(_WORD *)&v70[4] = 2082;
      *(void *)&v70[6] = "-[NavdDoomConductor updateRoutesForDestinations:]";
      __int16 v71 = 2082;
      v72 = "nil == (_routesUpdater)";
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a routes updater to be set", buf, 0x26u);
    }
    goto LABEL_60;
  }
  id v7 = objc_loadWeakRetained((id *)&self->_alerter);

  if (!v7)
  {
    v40 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id buf = 136446978;
      v68 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomConductor.m";
      __int16 v69 = 1024;
      *(_DWORD *)v70 = 235;
      *(_WORD *)&v70[4] = 2082;
      *(void *)&v70[6] = "-[NavdDoomConductor updateRoutesForDestinations:]";
      __int16 v71 = 2082;
      v72 = "nil == (_alerter)";
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an alerter to be set", buf, 0x26u);
    }
    goto LABEL_60;
  }
  char CanRequestDirections = NavdDoomCanRequestDirections();
  v9 = GEOFindOrCreateLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if ((CanRequestDirections & 1) == 0)
  {
    if (v10)
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "We're not allowed to do DirectionRequests.", buf, 2u);
    }

    [(NavdDoomConductor *)self _didEndUpdate];
    goto LABEL_61;
  }
  if (v10)
  {
    id v11 = [(NavdDoomConductor *)self uniqueName];
    *(_DWORD *)id buf = 138412546;
    v68 = v11;
    __int16 v69 = 2080;
    *(void *)v70 = "STEP 3: Updating Routes";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  double v12 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", buf, 2u);
  }

  [(NavdDoomConductor *)self _willUpdateRoutes];
  double v13 = [(NavdDoomConductor *)self internalStorage];
  unsigned __int8 v14 = [v13 mostRecentDestinations];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    v41 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "Got no destinations to work with.", buf, 2u);
    }

    [(NavdDoomConductor *)self _didUpdateRoutes:0 incidents:0];
    [(NavdDoomConductor *)self _didEndUpdate];
    v42 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      v43 = [(NavdDoomConductor *)self uniqueName];
      *(_DWORD *)id buf = 138412546;
      v68 = v43;
      __int16 v69 = 2080;
      *(void *)v70 = "STEP 3: Updating Routes";
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
    }
    v40 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v40))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", buf, 2u);
    }
    goto LABEL_60;
  }
  id v16 = [v4 copy];
  id v17 = [(NavdDoomConductor *)self internalStorage];
  [v17 setMostRecentDestinations:v16];

  if (![v4 count])
  {
    v44 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "There are currently no predicted destinations.", buf, 2u);
    }

    [(NavdDoomConductor *)self _didUpdateRoutes:0 incidents:0];
    [(NavdDoomConductor *)self _didEndUpdate];
    v45 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      v46 = [(NavdDoomConductor *)self uniqueName];
      *(_DWORD *)id buf = 138412546;
      v68 = v46;
      __int16 v69 = 2080;
      *(void *)v70 = "STEP 3: Updating Routes";
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
    }
    v40 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v40))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", buf, 2u);
    }
    goto LABEL_60;
  }
  id v18 = [(NavdDoomConductor *)self internalStorage];
  id v19 = [v18 mostRecentDoomWindow];
  id v20 = MapsSuggestionsNow();
  unsigned __int8 v21 = [v19 containsDate:v20];

  if ((v21 & 1) == 0)
  {
    v47 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      MapsSuggestionsNow();
      v48 = (char *)objc_claimAutoreleasedReturnValue();
      v49 = [(NavdDoomConductor *)self internalStorage];
      v50 = [v49 mostRecentDoomWindow];
      *(_DWORD *)id buf = 138412546;
      v68 = v48;
      __int16 v69 = 2112;
      *(void *)v70 = v50;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "We are not currently in a window (%@ not in %@).", buf, 0x16u);
    }
    [(NavdDoomConductor *)self _didUpdateRoutes:0 incidents:0];
    [(NavdDoomConductor *)self _didEndUpdate];
    v51 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      v52 = [(NavdDoomConductor *)self uniqueName];
      *(_DWORD *)id buf = 138412546;
      v68 = v52;
      __int16 v69 = 2080;
      *(void *)v70 = "STEP 3: Updating Routes";
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
    }
    v40 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v40))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", buf, 2u);
    }
    goto LABEL_60;
  }
  id v22 = objc_loadWeakRetained((id *)&self->_guard);
  unsigned __int8 v23 = [v22 canRequestRoute];

  if ((v23 & 1) == 0)
  {
    v53 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "We should not do routing requests right now.", buf, 2u);
    }

    [(NavdDoomConductor *)self _didUpdateRoutes:0 incidents:0];
    [(NavdDoomConductor *)self _didEndUpdate];
    v54 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      v55 = [(NavdDoomConductor *)self uniqueName];
      *(_DWORD *)id buf = 138412546;
      v68 = v55;
      __int16 v69 = 2080;
      *(void *)v70 = "STEP 3: Updating Routes";
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
    }
    v40 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v40))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", buf, 2u);
    }
LABEL_60:

LABEL_61:
    unsigned __int8 v33 = 0;
    goto LABEL_62;
  }
  id v24 = MapsSuggestionsMostRecentLocation();
  if (v24)
  {
    objc_initWeak(&location, self);
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_10002C994;
    v63[3] = &unk_10008AC18;
    v63[4] = self;
    v61 = &v65;
    objc_copyWeak(&v65, &location);
    id v64 = v4;
    v62 = objc_retainBlock(v63);
    [v24 coordinate];
    double v26 = v25;
    [v24 coordinate];
    id v28 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithGEOCoordinate:", v26, v27);
    internalStorage = self->_internalStorage;
    v30 = [(NavdDoomStorage *)internalStorage mostRecentDestinations];
    -[NavdDoomStorage setNumberOfDirectionRequests:](internalStorage, "setNumberOfDirectionRequests:", (char *)[v30 count]+ -[NavdDoomStorage numberOfDirectionRequests](internalStorage, "numberOfDirectionRequests"));

    id v31 = objc_loadWeakRetained((id *)&self->_routesUpdater);
    v32 = [(NavdDoomStorage *)self->_internalStorage mostRecentDestinations];
    unsigned __int8 v33 = [v31 updateRoutesForDestinations:v32 withOrigin:v28 completionHandler:v62];

    id v34 = objc_loadWeakRetained((id *)&self->_guard);
    [v34 didRequestRoute];

    id v35 = objc_loadWeakRetained((id *)&self->_guard);
    v36 = [v35 nextAllowedRequestTime];
    [(NavdDoomConductor *)self _scheduleRunAt:v36];

    if ((v33 & 1) == 0)
    {
      -[NavdDoomConductor _didUpdateRoutes:incidents:](self, "_didUpdateRoutes:incidents:", 0, 0, &v65);
      [(NavdDoomConductor *)self _didEndUpdate];
      GEOFindOrCreateLog();
      v37 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v38 = [(NavdDoomConductor *)self uniqueName];
        *(_DWORD *)id buf = 138412546;
        v68 = v38;
        __int16 v69 = 2080;
        *(void *)v70 = "STEP 3: Updating Routes";
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      v39 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v39))
      {
        *(_WORD *)id buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", buf, 2u);
      }
    }
    objc_destroyWeak(v61);
    objc_destroyWeak(&location);
  }
  else
  {
    v57 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "Cannot get Routes without Location", buf, 2u);
    }

    [(NavdDoomConductor *)self _didUpdateRoutes:0 incidents:0];
    [(NavdDoomConductor *)self _didEndUpdate];
    v58 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      v59 = [(NavdDoomConductor *)self uniqueName];
      *(_DWORD *)id buf = 138412546;
      v68 = v59;
      __int16 v69 = 2080;
      *(void *)v70 = "STEP 3: Updating Routes";
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
    }
    v60 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v60))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v60, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", buf, 2u);
    }

    unsigned __int8 v33 = 0;
  }

LABEL_62:
  return v33;
}

- (void)_scheduleRunAt:(id)a3
{
  id v4 = a3;
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = MapsSuggestionsStringFromDate(v4);
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "_scheduleRunAt:%@", (uint8_t *)&v13, 0xCu);
  }
  GEOConfigGetDouble();
  id v8 = MapsSuggestionsNowWithOffset(v7);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scheduler);
  BOOL v10 = [v4 laterDate:v8];
  unsigned __int8 v11 = [WeakRetained sleepUntilTime:v10];

  if (v11)
  {
    [(NavdDoomConductor *)self _didScheduleWakeup:v4];
  }
  else
  {
    double v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Could not set scheduled wakeup to %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (BOOL)hasDoomWindow
{
  v2 = [(NavdDoomConductor *)self internalStorage];
  id v3 = [v2 mostRecentDoomWindow];
  id v4 = v3;
  if (!v3)
  {
LABEL_4:
    LOBYTE(v5) = 0;
    goto LABEL_6;
  }
  v5 = [v3 startDate];

  if (v5)
  {
    id v6 = [v4 endDate];
    BOOL v7 = MapsSuggestionsIsInThePast(v6);

    if (!v7)
    {
      id v8 = [v4 startDate];
      v9 = [v4 endDate];
      BOOL v10 = [v8 earlierDate:v9];
      unsigned __int8 v11 = [v4 endDate];
      LOBYTE(v5) = v10 != v11;

      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return (char)v5;
}

- (BOOL)hasCurrentDoomWindow
{
  v2 = [(NavdDoomConductor *)self internalStorage];
  id v3 = [v2 mostRecentDoomWindow];
  id v4 = v3;
  if (!v3)
  {
    id v8 = 0;
    LOBYTE(v5) = 0;
    goto LABEL_9;
  }
  v5 = [v3 startDate];

  if (!v5) {
    goto LABEL_5;
  }
  id v6 = [v4 endDate];
  BOOL v7 = MapsSuggestionsIsInThePast(v6);

  if (v7)
  {
    LOBYTE(v5) = 0;
LABEL_5:
    id v8 = v4;
    goto LABEL_9;
  }
  v9 = [v4 startDate];
  BOOL v10 = [v4 endDate];
  unsigned __int8 v11 = [v9 earlierDate:v10];
  double v12 = [v4 endDate];

  if (v11 == v12)
  {
    LOBYTE(v5) = 0;
    goto LABEL_10;
  }
  id v8 = MapsSuggestionsNow();
  LOBYTE(v5) = [v4 containsDate:v8];
LABEL_9:

LABEL_10:
  return (char)v5;
}

- (BOOL)hasDestinations
{
  v2 = [(NavdDoomConductor *)self internalStorage];
  id v3 = [v2 mostRecentDestinations];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002D654;
    v8[3] = &unk_1000891A8;
    v8[4] = self;
    id v9 = v4;
    dispatch_sync(queue, v8);
  }
  else
  {
    BOOL v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id buf = 136446978;
      unsigned __int8 v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomConductor.m";
      __int16 v12 = 1024;
      int v13 = 440;
      __int16 v14 = 2082;
      BOOL v15 = "-[NavdDoomConductor registerObserver:]";
      __int16 v16 = 2082;
      id v17 = "nil == (observer)";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an observer", buf, 0x26u);
    }
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002D7D8;
    v8[3] = &unk_1000891A8;
    v8[4] = self;
    id v9 = v4;
    dispatch_sync(queue, v8);
  }
  else
  {
    BOOL v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id buf = 136446978;
      unsigned __int8 v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomConductor.m";
      __int16 v12 = 1024;
      int v13 = 449;
      __int16 v14 = 2082;
      BOOL v15 = "-[NavdDoomConductor unregisterObserver:]";
      __int16 v16 = 2082;
      id v17 = "nil == (observer)";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an observer", buf, 0x26u);
    }
  }
}

- (void)_willStartUpdate
{
  id v3 = MapsSuggestionsNow();
  id v4 = [v3 copy];
  [(NavdDoomStorage *)self->_internalStorage setMostRecentStart:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_observers;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v9);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002D964;
        block[3] = &unk_100088EE0;
        block[4] = v10;
        dispatch_async(queue, block);
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_willUpdateExitTime
{
  [(NavdDoomStorage *)self->_internalStorage setNumberOfUpdatesToExitTime:(char *)[(NavdDoomStorage *)self->_internalStorage numberOfUpdatesToExitTime] + 1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_observers;
  id v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002DB28;
        block[3] = &unk_100088EE0;
        block[4] = v8;
        dispatch_async(queue, block);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_didUpdateExitTime:(id)a3
{
  id v4 = [a3 copy];
  [(NavdDoomStorage *)self->_internalStorage setMostRecentExitTime:v4];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_observers;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002DD6C;
        block[3] = &unk_100088EE0;
        block[4] = v10;
        dispatch_async(queue, block);
      }
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  objc_initWeak(&location, self);
  long long v12 = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002DDC0;
  v13[3] = &unk_1000893C0;
  objc_copyWeak(&v14, &location);
  dispatch_async(v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_didInvalidateWindowForReason:(unint64_t)a3
{
  [(NavdDoomStorage *)self->_internalStorage completeWindowBecause:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_observers;
  id v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002E05C;
        block[3] = &unk_100088EE0;
        block[4] = v9;
        dispatch_async(queue, block);
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [(NavdDoomStorage *)self->_internalStorage clear];
}

- (void)_didUpdateWindowForDoom:(id)a3
{
  id v4 = [a3 copy];
  [(NavdDoomStorage *)self->_internalStorage setMostRecentDoomWindow:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_observers;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v9);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002E224;
        block[3] = &unk_100088EE0;
        block[4] = v10;
        dispatch_async(queue, block);
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_willUpdateDestinations
{
  [(NavdDoomStorage *)self->_internalStorage setNumberOfUpdatesToDestinations:(char *)[(NavdDoomStorage *)self->_internalStorage numberOfUpdatesToDestinations]+ 1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_observers;
  id v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002E3E8;
        block[3] = &unk_100088EE0;
        block[4] = v8;
        dispatch_async(queue, block);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_didUpdateDestinations:(id)a3
{
  id v4 = [a3 copy];
  [(NavdDoomStorage *)self->_internalStorage setMostRecentDestinations:v4];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_observers;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002E6A8;
        block[3] = &unk_100088EE0;
        block[4] = v10;
        dispatch_async(queue, block);
      }
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  if (NavdDoomCanRequestDirections())
  {
    objc_initWeak(&location, self);
    long long v12 = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002E6FC;
    v14[3] = &unk_1000893C0;
    objc_copyWeak(&v15, &location);
    dispatch_async(v12, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    long long v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "We are not allowd to get DirectionRequests, so no STEP 3.", (uint8_t *)&location, 2u);
    }

    [(NavdDoomConductor *)self _didUpdateRoutes:0 incidents:0];
    [(NavdDoomConductor *)self _didEndUpdate];
  }
}

- (void)_willUpdateRoutes
{
  [(NavdDoomStorage *)self->_internalStorage setNumberOfUpdatesToRoutes:(char *)[(NavdDoomStorage *)self->_internalStorage numberOfUpdatesToRoutes] + 1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_observers;
  id v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002E9A0;
        block[3] = &unk_100088EE0;
        block[4] = v8;
        dispatch_async(queue, block);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_didUpdateRoutes:(id)a3 incidents:(id)a4
{
  id v6 = a4;
  id v7 = [a3 copy];
  [(NavdDoomStorage *)self->_internalStorage setMostRecentRoutesPerDestination:v7];

  [(NavdDoomStorage *)self->_internalStorage updateWithIncidents:v6];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_observers;
  id v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v12);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002EB84;
        block[3] = &unk_100088EE0;
        block[4] = v13;
        dispatch_async(queue, block);
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)_willFireAlert
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_observers;
  id v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002ED30;
        block[3] = &unk_100088EE0;
        block[4] = v8;
        dispatch_async(queue, block);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_didFireAlert:(id)a3
{
  [(NavdDoomStorage *)self->_internalStorage setMostRecentAlert:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_observers;
  id v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002EEE4;
        block[3] = &unk_100088EE0;
        block[4] = v9;
        dispatch_async(queue, block);
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_didScheduleWakeup:(id)a3
{
  [(NavdDoomStorage *)self->_internalStorage setNextWakeup:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_observers;
  id v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002F098;
        block[3] = &unk_100088EE0;
        block[4] = v9;
        dispatch_async(queue, block);
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_didEndUpdate
{
  id v3 = [(NavdDoomStorage *)self->_internalStorage nextWakeup];
  BOOL v4 = MapsSuggestionsIsInTheFuture(v3);

  if (!v4)
  {
    GEOConfigGetDouble();
    id v6 = MapsSuggestionsNowWithOffset(v5);
    [(NavdDoomConductor *)self _scheduleRunAt:v6];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = self->_observers;
  id v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v11);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002F290;
        block[3] = &unk_100088EE0;
        block[4] = v12;
        dispatch_async(queue, block);
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (id)_wakeupTimeForWindow:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!v4
    || ([v4 endDate],
        id v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = MapsSuggestionsIsInTheFuture(v6),
        v6,
        !v7))
  {
    [(NavdDoomConductor *)self defaultWakeupWithoutWindow];
    goto LABEL_6;
  }
  id v8 = MapsSuggestionsNow();
  unsigned int v9 = [v5 containsDate:v8];

  if (v9)
  {
    [(NavdDoomConductor *)self defaultWakeupTimeWithinWindow];
LABEL_6:
    long long v11 = MapsSuggestionsNowWithOffset(v10);
    goto LABEL_7;
  }
  long long v13 = [v5 startDate];
  [(NavdDoomConductor *)self defaultWakeupTimeBeforeWindow];
  long long v11 = [v13 dateByAddingTimeInterval:-v14];

LABEL_7:

  return v11;
}

- (void)_setWindowFromExitTime:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scheduler);

  if (WeakRetained)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (v4
      && ([(NavdDoomStorage *)self->_internalStorage mostRecentExitTime],
          id v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v4 isEqualToDate:v6],
          v6,
          !v7))
    {
      id v12 = objc_alloc((Class)NSDateInterval);
      [(NavdDoomConductor *)self defaultDoomWindowMaxSecondsBeforeExitTime];
      double v14 = [v4 dateByAddingTimeInterval:-v13];
      [(NavdDoomConductor *)self defaultDoomWindowMaxSecondsAfterExitTime];
      long long v15 = objc_msgSend(v4, "dateByAddingTimeInterval:");
      unsigned int v9 = [v12 initWithStartDate:v14 endDate:v15];

      [(NavdDoomConductor *)self _didInvalidateWindowForReason:2];
      [(NavdDoomConductor *)self _didUpdateWindowForDoom:v9];
      long long v16 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        long long v17 = [(NavdDoomConductor *)self internalStorage];
        long long v18 = [v17 mostRecentDoomWindow];
        int v21 = 138412290;
        id v22 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Updating DOoM window: %@", (uint8_t *)&v21, 0xCu);
      }
      long long v11 = [(NavdDoomConductor *)self internalStorage];
      long long v19 = [v11 mostRecentDoomWindow];
      long long v20 = [(NavdDoomConductor *)self _wakeupTimeForWindow:v19];
      [(NavdDoomConductor *)self _scheduleRunAt:v20];
    }
    else
    {
      id v8 = [(NavdDoomConductor *)self internalStorage];
      unsigned int v9 = [v8 mostRecentDoomWindow];

      double v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v21 = 138412546;
        id v22 = (const char *)v9;
        __int16 v23 = 2112;
        *(void *)id v24 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Keeping DOoM window: %@, for exit time: %@", (uint8_t *)&v21, 0x16u);
      }

      long long v11 = [(NavdDoomConductor *)self _wakeupTimeForWindow:v9];
      [(NavdDoomConductor *)self _scheduleRunAt:v11];
    }
  }
  else
  {
    unsigned int v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v21 = 136446978;
      id v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomConductor.m";
      __int16 v23 = 1024;
      *(_DWORD *)id v24 = 609;
      *(_WORD *)&v24[4] = 2082;
      *(void *)&v24[6] = "-[NavdDoomConductor _setWindowFromExitTime:]";
      __int16 v25 = 2082;
      double v26 = "nil == (_scheduler)";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a scheduler to be set", (uint8_t *)&v21, 0x26u);
    }
  }
}

- (double)defaultDoomWindowMaxSecondsBeforeExitTime
{
  GEOConfigGetDouble();
  return result;
}

- (double)defaultDoomWindowMaxSecondsAfterExitTime
{
  GEOConfigGetDouble();
  return result;
}

- (double)defaultWakeupTimeBeforeWindow
{
  GEOConfigGetDouble();
  return result;
}

- (double)defaultWakeupTimeWithinWindow
{
  GEOConfigGetDouble();
  return result;
}

- (double)defaultWakeupWithoutWindow
{
  GEOConfigGetDouble();
  return result;
}

- (double)defaultTimeToRunDestinationsUpdater
{
  GEOConfigGetDouble();
  return result;
}

- (BOOL)isInTripMode
{
  return self->_inTripMode;
}

- (NavdDoomStorage)internalStorage
{
  return (NavdDoomStorage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInternalStorage:(id)a3
{
}

- (NavdDoomGuard)guard
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_guard);

  return (NavdDoomGuard *)WeakRetained;
}

- (void)setGuard:(id)a3
{
}

- (NavdDoomExitTimeUpdater)exitTimeUpdater
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exitTimeUpdater);

  return (NavdDoomExitTimeUpdater *)WeakRetained;
}

- (void)setExitTimeUpdater:(id)a3
{
}

- (NavdDoomDestinationsUpdater)destinationsUpdater
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_destinationsUpdater);

  return (NavdDoomDestinationsUpdater *)WeakRetained;
}

- (void)setDestinationsUpdater:(id)a3
{
}

- (NavdDoomRoutesUpdater)routesUpdater
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routesUpdater);

  return (NavdDoomRoutesUpdater *)WeakRetained;
}

- (void)setRoutesUpdater:(id)a3
{
}

- (NavdDoomAlerter)alerter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alerter);

  return (NavdDoomAlerter *)WeakRetained;
}

- (void)setAlerter:(id)a3
{
}

- (NavdDoomScheduler)scheduler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scheduler);

  return (NavdDoomScheduler *)WeakRetained;
}

- (void)setScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scheduler);
  objc_destroyWeak((id *)&self->_alerter);
  objc_destroyWeak((id *)&self->_routesUpdater);
  objc_destroyWeak((id *)&self->_destinationsUpdater);
  objc_destroyWeak((id *)&self->_exitTimeUpdater);
  objc_destroyWeak((id *)&self->_guard);
  objc_storeStrong((id *)&self->_internalStorage, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end