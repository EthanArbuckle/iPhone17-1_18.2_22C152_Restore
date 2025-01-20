@interface NavdDoom
- (NSString)uniqueName;
- (NavdDoomStorage)internalStorage;
- (id)initFromResourceDepot:(id)a3 triggers:(id)a4 conditions:(id)a5 storage:(id)a6 routesUpdater:(id)a7 guard:(id)a8 alerter:(id)a9 visitMonitor:(id)a10;
- (id)nameForJSON;
- (id)objectForJSON;
- (void)actionCircuit:(id)a3 step:(id)a4 jsonDict:(id)a5;
- (void)actionCircuitDidAct:(id)a3;
- (void)engineRunner:(id)a3 receivedEntries:(id)a4;
- (void)engineRunner:(id)a3 startedBecauseOfTrigger:(id)a4;
- (void)engineRunner:(id)a3 step:(id)a4 jsonDict:(id)a5;
- (void)engineRunner:(id)a3 stoppedWithEntries:(id)a4;
- (void)registerObserver:(id)a3;
- (void)setInternalStorage:(id)a3;
- (void)triggerFired:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation NavdDoom

- (id)initFromResourceDepot:(id)a3 triggers:(id)a4 conditions:(id)a5 storage:(id)a6 routesUpdater:(id)a7 guard:(id)a8 alerter:(id)a9 visitMonitor:(id)a10
{
  id v17 = a3;
  id v83 = a4;
  id v82 = a5;
  id v81 = a6;
  id obj = a7;
  id v87 = a7;
  id v86 = a8;
  id v85 = a9;
  id v84 = a10;
  v88 = v17;
  if (!v17)
  {
    v75 = GEOFindOrCreateLog();
    v20 = v82;
    v19 = v83;
    v21 = self;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoom.mm";
      __int16 v96 = 1024;
      int v97 = 102;
      __int16 v98 = 2082;
      v99 = "-[NavdDoom initFromResourceDepot:triggers:conditions:storage:routesUpdater:guard:alerter:visitMonitor:]";
      __int16 v100 = 2082;
      v101 = "nil == (resourceDepot)";
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a Resource Depot", location, 0x26u);
    }
    goto LABEL_37;
  }
  v18 = v17;
  v20 = v82;
  v19 = v83;
  v21 = self;
  v22 = [v18 oneNetworkRequester];

  if (!v22)
  {
    v75 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoom.mm";
      __int16 v96 = 1024;
      int v97 = 103;
      __int16 v98 = 2082;
      v99 = "-[NavdDoom initFromResourceDepot:triggers:conditions:storage:routesUpdater:guard:alerter:visitMonitor:]";
      __int16 v100 = 2082;
      v101 = "nil == (resourceDepot.oneNetworkRequester)";
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a Network Requester in Resource Depot", location, 0x26u);
    }
    goto LABEL_37;
  }
  v23 = [v88 oneRoutine];

  if (!v23)
  {
    v75 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoom.mm";
      __int16 v96 = 1024;
      int v97 = 104;
      __int16 v98 = 2082;
      v99 = "-[NavdDoom initFromResourceDepot:triggers:conditions:storage:routesUpdater:guard:alerter:visitMonitor:]";
      __int16 v100 = 2082;
      v101 = "nil == (resourceDepot.oneRoutine)";
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires Routine in Resource Depot", location, 0x26u);
    }
    goto LABEL_37;
  }
  if (!v87)
  {
    v75 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoom.mm";
      __int16 v96 = 1024;
      int v97 = 105;
      __int16 v98 = 2082;
      v99 = "-[NavdDoom initFromResourceDepot:triggers:conditions:storage:routesUpdater:guard:alerter:visitMonitor:]";
      __int16 v100 = 2082;
      v101 = "nil == (routesUpdater)";
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a Routes Updater", location, 0x26u);
    }
    goto LABEL_37;
  }
  if (!v86)
  {
    v75 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoom.mm";
      __int16 v96 = 1024;
      int v97 = 106;
      __int16 v98 = 2082;
      v99 = "-[NavdDoom initFromResourceDepot:triggers:conditions:storage:routesUpdater:guard:alerter:visitMonitor:]";
      __int16 v100 = 2082;
      v101 = "nil == (guard)";
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a Request Guard", location, 0x26u);
    }
    goto LABEL_37;
  }
  if (!v85)
  {
    v75 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoom.mm";
      __int16 v96 = 1024;
      int v97 = 107;
      __int16 v98 = 2082;
      v99 = "-[NavdDoom initFromResourceDepot:triggers:conditions:storage:routesUpdater:guard:alerter:visitMonitor:]";
      __int16 v100 = 2082;
      v101 = "nil == (alerter)";
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an Alerter", location, 0x26u);
    }
    goto LABEL_37;
  }
  if (!v84)
  {
    v75 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoom.mm";
      __int16 v96 = 1024;
      int v97 = 108;
      __int16 v98 = 2082;
      v99 = "-[NavdDoom initFromResourceDepot:triggers:conditions:storage:routesUpdater:guard:alerter:visitMonitor:]";
      __int16 v100 = 2082;
      v101 = "nil == (visitMonitor)";
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an MSgVisitMonitor", location, 0x26u);
    }
    goto LABEL_37;
  }
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    v75 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)location = 0;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEBUG, "NavdDoom is disabled", location, 2u);
    }
LABEL_37:

    v74 = 0;
    goto LABEL_38;
  }
  v94.receiver = self;
  v94.super_class = (Class)NavdDoom;
  v24 = [(NavdDoom *)&v94 init];
  if (v24)
  {
    v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v26 = dispatch_queue_create("NavdDoomQueue", v25);
    queue = v24->_queue;
    val = v24;
    v24->_queue = (OS_dispatch_queue *)v26;

    objc_storeStrong((id *)&v24->_resourceDepot, a3);
    v28 = (MapsSuggestionsObservers *)[objc_alloc((Class)MapsSuggestionsObservers) initWithName:@"NavdDoom.MSgObservers"];
    observers = v24->_observers;
    v24->_observers = v28;

    objc_storeStrong((id *)&v24->_internalStorage, a6);
    objc_storeStrong((id *)&v24->_visitMonitor, a10);
    v30 = [(MapsSuggestionsVisitMonitor *)v24->_visitMonitor onEnterTrigger];
    [v30 registerObserver:v24];

    objc_initWeak((id *)location, v24);
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_100051610;
    v92[3] = &unk_10008C538;
    objc_copyWeak(&v93, (id *)location);
    v31 = v92;
    v32 = (MapsSuggestionsBlockAction *)[objc_alloc((Class)MapsSuggestionsBlockAction) initWithName:@"NavdDoom.updateExitTimesAction" block:v31];

    updateExitTimesAction = v24->_updateExitTimesAction;
    v24->_updateExitTimesAction = v32;

    v34 = (MapsSuggestionsXPCActivityTimer *)[objc_alloc((Class)MapsSuggestionsXPCActivityTimer) initWithName:@"NavdDoom.xpcActivityTimer" queue:v24->_queue block:&stru_10008C558];
    xpcTimer = v24->_xpcTimer;
    v24->_xpcTimer = v34;

    id v36 = objc_alloc((Class)MapsSuggestionsActionCircuit);
    v37 = sub_100052004((uint64_t)v24, v83);
    v38 = sub_100052108((uint64_t)v24, v82);
    v39 = (MapsSuggestionsActionCircuit *)[v36 initWithTriggers:v37 conditions:v38 action:v24->_updateExitTimesAction];
    updateExitTimeActionCircuit = v24->_updateExitTimeActionCircuit;
    v24->_updateExitTimeActionCircuit = v39;

    [(MapsSuggestionsActionCircuit *)v24->_updateExitTimeActionCircuit registerObserver:v24];
    id v41 = objc_alloc((Class)NSSet);
    v42 = sub_1000521C4();
    id v78 = objc_msgSend(v41, "initWithObjects:", v42, 0);

    v43 = v24;
    id v77 = objc_alloc((Class)MapsSuggestionsEngineRunner);
    v44 = +[MapsSuggestionsEngineBuilder forDevice];
    +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
    v46 = v45 = v44;
    v47 = [v44 withLocationUpdater:v46];
    v48 = [v47 withoutTracker];
    v49 = [v48 withPreFilters:v78];
    GEOConfigGetDouble();
    double v51 = v50;
    GEOConfigGetDouble();
    double v53 = v52;
    GEOConfigGetDouble();
    double v55 = v54;
    GEOConfigGetDouble();
    double v57 = v56;
    GEOConfigGetDouble();
    double v59 = v58;
    GEOConfigGetDouble();
    double v61 = v60;
    uint64_t Integer = GEOConfigGetInteger();
    v63 = (MapsSuggestionsEngineRunner *)[v77 initWithEngineBuilder:v49 name:@"NavdDoomEngineRunner" minRunTime:Integer maxRunTime:1 minSleepTime:objc_opt_class() maxSleepTime:v51 runTimeLeeway:v53 sleepTimeLeeway:v55 maxEntries:v57 nilledWhenAsleep:v59 wakeUpTimerClass:v61];
    engineRunner = v43->_engineRunner;
    v43->_engineRunner = v63;

    v65 = (MapsSuggestionsSimpleTrigger *)[objc_alloc((Class)MapsSuggestionsSimpleTrigger) initWithName:@"NavdDoom.exitTimesUpdatedTrigger"];
    exitTimesUpdatedTrigger = v43->_exitTimesUpdatedTrigger;
    v43->_exitTimesUpdatedTrigger = v65;

    [(MapsSuggestionsEngineRunner *)v43->_engineRunner addTrigger:v43->_exitTimesUpdatedTrigger];
    objc_storeStrong((id *)&v43->_guard, a8);
    [(MapsSuggestionsEngineRunner *)v43->_engineRunner addCondition:v43->_guard];
    id v67 = [objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:&stru_10008C578];
    [(MapsSuggestionsEngineRunner *)v43->_engineRunner addPostFilter:v67];
    v68 = v43->_queue;
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_100052270;
    v90[3] = &unk_10008ADE8;
    objc_copyWeak(&v91, (id *)location);
    v69 = v68;
    v70 = v90;
    v71 = (MapsSuggestionsBlockCondition *)[objc_alloc((Class)MapsSuggestionsBlockCondition) initWithName:@"NavdDoom.isWithinWindowCondition" queue:v69 block:v70];

    isWithinWindowCondition = v43->_isWithinWindowCondition;
    v43->_isWithinWindowCondition = v71;

    [(MapsSuggestionsEngineRunner *)v43->_engineRunner addCondition:v43->_isWithinWindowCondition];
    [(MapsSuggestionsEngineRunner *)v43->_engineRunner registerObserver:v43];
    [(MapsSuggestionsEngineRunner *)v43->_engineRunner scheduleNextRun];
    objc_storeStrong((id *)&v43->_routesUpdater, obj);
    objc_storeStrong((id *)&v43->_alerter, a9);
    v73 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "NavdDoom with EngineRunner initialized", buf, 2u);
    }

    objc_destroyWeak(&v91);
    objc_destroyWeak(&v93);
    objc_destroyWeak((id *)location);
    v24 = val;
  }
  v21 = v24;
  v74 = v21;
LABEL_38:

  return v74;
}

- (void)triggerFired:(id)a3
{
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Trigger fired: VisitMonitor.onEnter. This should check all the Actions in the Circuit.", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052F68;
  block[3] = &unk_1000892D8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (void)actionCircuitDidAct:(id)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100053110;
  v5[3] = &unk_1000896E8;
  objc_copyWeak(&v6, &location);
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)actionCircuit:(id)a3 step:(id)a4 jsonDict:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100053418;
  v12[3] = &unk_100089810;
  objc_copyWeak(&v15, &location);
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)engineRunner:(id)a3 startedBecauseOfTrigger:(id)a4
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100053604;
  v6[3] = &unk_1000896E8;
  objc_copyWeak(&v7, &location);
  dispatch_async(queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)engineRunner:(id)a3 receivedEntries:(id)a4
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000537DC;
  v6[3] = &unk_1000896E8;
  objc_copyWeak(&v7, &location);
  dispatch_async(queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)engineRunner:(id)a3 step:(id)a4 jsonDict:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000539FC;
  v12[3] = &unk_100089810;
  objc_copyWeak(&v15, &location);
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)engineRunner:(id)a3 stoppedWithEntries:(id)a4
{
}

- (id)objectForJSON
{
  v9[0] = @"engineRunner";
  v3 = MSg::jsonFor();
  v10[0] = v3;
  v9[1] = @"actionCircuit";
  v4 = MSg::jsonFor();
  v10[1] = v4;
  v9[2] = @"currentExitTime";
  id v6 = MSg::jsonFor((MSg *)self->_currentExitTime, v5);
  v10[2] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (id)nameForJSON
{
  v2 = objc_opt_class();

  return [v2 description];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(MapsSuggestionsObservers *)self->_observers registerObserver:v4 handler:0];
  }
  else
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoom.mm";
      __int16 v8 = 1024;
      int v9 = 721;
      __int16 v10 = 2082;
      id v11 = "-[NavdDoom registerObserver:]";
      __int16 v12 = 2082;
      id v13 = "nil == (observer)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an observer", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(MapsSuggestionsObservers *)self->_observers unregisterObserver:v4 handler:0];
  }
  else
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoom.mm";
      __int16 v8 = 1024;
      int v9 = 727;
      __int16 v10 = 2082;
      id v11 = "-[NavdDoom unregisterObserver:]";
      __int16 v12 = 2082;
      id v13 = "nil == (observer)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an observer", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (NavdDoomStorage)internalStorage
{
  return (NavdDoomStorage *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInternalStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalStorage, 0);
  objc_storeStrong((id *)&self->_lastActionCircuitState, 0);
  objc_storeStrong((id *)&self->_lastEngineRunnerState, 0);
  objc_storeStrong((id *)&self->_routesUpdater, 0);
  objc_storeStrong((id *)&self->_alerter, 0);
  objc_storeStrong((id *)&self->_guard, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentExitTime, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_resourceDepot, 0);
  objc_storeStrong((id *)&self->_visitMonitor, 0);
  objc_storeStrong((id *)&self->_xpcTimer, 0);
  objc_storeStrong((id *)&self->_isWithinWindowCondition, 0);
  objc_storeStrong((id *)&self->_exitTimesUpdatedTrigger, 0);
  objc_storeStrong((id *)&self->_updateExitTimeActionCircuit, 0);
  objc_storeStrong((id *)&self->_updateExitTimesAction, 0);

  objc_storeStrong((id *)&self->_engineRunner, 0);
}

@end