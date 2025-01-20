@interface NavdDoomHost
- (BOOL)_loadFromCache;
- (BOOL)sleepUntilTime:(id)a3;
- (NSString)uniqueName;
- (NavdDoomStorage)snapshot;
- (id)_conditionsForActionCircuitUsingRegister:(id)a3;
- (id)initFromResourceDepot:(id)a3 sharedRegister:(id)a4;
- (void)_notifyObserversWithTrigger:(id)a3;
- (void)dealloc;
- (void)didEndUpdate;
- (void)willStartUpdate;
@end

@implementation NavdDoomHost

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (id)initFromResourceDepot:(id)a3 sharedRegister:(id)a4
{
  id v6 = a3;
  id v59 = a4;
  if (v6)
  {
    v62.receiver = self;
    v62.super_class = (Class)NavdDoomHost;
    v7 = [(NavdDoomHost *)&v62 init];
    v8 = v7;
    if (v7)
    {
      [(NavdDoomHost *)v7 _loadFromCache];
      v9 = [NavdDoomRoutineExitTimeUpdater alloc];
      v10 = [v6 oneRoutine];
      v11 = [(NavdDoomRoutineExitTimeUpdater *)v9 initWithRoutine:v10];
      exitTimeUpdater = v8->_exitTimeUpdater;
      v8->_exitTimeUpdater = (NavdDoomExitTimeUpdater *)v11;

      v13 = [NavdDoomMapsSuggestionsUpdater alloc];
      v14 = +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
      v15 = [(NavdDoomMapsSuggestionsUpdater *)v13 initWithLocationUpdater:v14];
      destinationsUpdater = v8->_destinationsUpdater;
      v8->_destinationsUpdater = (NavdDoomDestinationsUpdater *)v15;

      v17 = objc_alloc_init(NavdDoomGEORoutesUpdater);
      routesUpdater = v8->_routesUpdater;
      v8->_routesUpdater = (NavdDoomRoutesUpdater *)v17;

      v19 = [[NavdDoomConfigurableGuard alloc] initWithStorage:v8->_storage];
      guard = v8->_guard;
      v8->_guard = (NavdDoomGuard *)v19;

      v21 = [[NavdDoomBulletinAlerter alloc] initWithDoomStorage:v8->_storage];
      alerter = v8->_alerter;
      v8->_alerter = (NavdDoomAlerter *)v21;

      id v23 = objc_alloc((Class)MapsSuggestionsVisitMonitor);
      v24 = +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
      v25 = (MapsSuggestionsVisitMonitor *)[v23 initWithLocationUpdater:v24 startInVisit:0];
      visitMonitor = v8->_visitMonitor;
      v8->_visitMonitor = v25;

      v27 = [NavdDoom alloc];
      v28 = +[MapsSuggestionsFirstUnlockTrigger description];
      v29 = [v59 objectForKeyedSubscript:v28];
      v63 = v29;
      v30 = +[NSArray arrayWithObjects:&v63 count:1];
      v31 = [(NavdDoomHost *)v8 _conditionsForActionCircuitUsingRegister:v59];
      v32 = [(NavdDoom *)v27 initFromResourceDepot:v6 triggers:v30 conditions:v31 storage:v8->_storage routesUpdater:v8->_routesUpdater guard:v8->_guard alerter:v8->_alerter visitMonitor:v8->_visitMonitor];
      doom = v8->_doom;
      v8->_doom = v32;

      v34 = objc_alloc_init(NavdDoomPowerLogger);
      powerLogger = v8->_powerLogger;
      v8->_powerLogger = v34;

      [(NavdDoomPowerLogger *)v8->_powerLogger setSnapshotDataSource:v8];
      [(NavdDoom *)v8->_doom registerObserver:v8->_powerLogger];
      v36 = objc_alloc_init(NavdDoomEvalDumper);
      evalDumper = v8->_evalDumper;
      v8->_evalDumper = v36;

      [(NavdDoomEvalDumper *)v8->_evalDumper setSnapshotDataSource:v8];
      [(NavdDoom *)v8->_doom registerObserver:v8->_evalDumper];
      v38 = objc_alloc_init(NavdDoomCache);
      cache = v8->_cache;
      v8->_cache = v38;

      [(NavdDoomCache *)v8->_cache setSnapshotDataSource:v8];
      [(NavdDoom *)v8->_doom registerObserver:v8->_cache];
      v40 = objc_alloc_init(NavdDoomAnalytics);
      analytics = v8->_analytics;
      v8->_analytics = v40;

      [(NavdDoomAnalytics *)v8->_analytics setSnapshotDataSource:v8];
      [(NavdDoom *)v8->_doom registerObserver:v8->_analytics];
      v42 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v43 = dispatch_queue_create("com.apple.navd.doom.NavdDoomUpdateQueue", v42);
      updateQueue = v8->_updateQueue;
      v8->_updateQueue = (OS_dispatch_queue *)v43;

      uint64_t v45 = +[NSHashTable weakObjectsHashTable];
      triggerObservers = v8->_triggerObservers;
      v8->_triggerObservers = (NSHashTable *)v45;

      [(NSHashTable *)v8->_triggerObservers addObject:v8->_powerLogger];
      v47 = [(MapsSuggestionsVisitMonitor *)v8->_visitMonitor onEnterTrigger];
      [v47 registerObserver:v8->_powerLogger];

      [(MapsSuggestionsVisitMonitor *)v8->_visitMonitor startMonitoring];
      v48 = [NavdDoomLaunchTrigger alloc];
      v49 = MapsSuggestionsNow();
      v50 = [(NavdDoomLaunchTrigger *)v48 initWithTriggerDate:v49];

      [(NavdDoomHost *)v8 _notifyObserversWithTrigger:v50];
      objc_initWeak((id *)location, v8);
      id v51 = objc_alloc((Class)MapsSuggestionsXPCActivityTimer);
      v52 = [(NavdDoomHost *)v8 uniqueName];
      v53 = v8->_updateQueue;
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_100024F10;
      v60[3] = &unk_1000893C0;
      objc_copyWeak(&v61, (id *)location);
      v54 = (MapsSuggestionsXPCActivityTimer *)[v51 initWithName:v52 queue:v53 block:v60];
      xpcTimer = v8->_xpcTimer;
      v8->_xpcTimer = v54;

      objc_destroyWeak(&v61);
      objc_destroyWeak((id *)location);
    }
    self = v8;
    v56 = self;
  }
  else
  {
    v57 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomHost.m";
      __int16 v65 = 1024;
      int v66 = 97;
      __int16 v67 = 2082;
      v68 = "-[NavdDoomHost initFromResourceDepot:sharedRegister:]";
      __int16 v69 = 2082;
      v70 = "nil == (resourceDepot)";
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. We need a resource depot to build from!", location, 0x26u);
    }

    v56 = 0;
  }

  return v56;
}

- (id)_conditionsForActionCircuitUsingRegister:(id)a3
{
  id v3 = a3;
  v16 = +[NavdMapsSuggestionsLBALocationAccessAllowedCondition description];
  v15 = [v3 objectForKeyedSubscript:v16];
  v17[0] = v15;
  v4 = +[MapsSuggestionsTransportTypePreferenceCondition description];
  v5 = [v3 objectForKeyedSubscript:v4];
  v17[1] = v5;
  id v6 = +[MapsSuggestionsSiri isEnabledCondition];
  v7 = [v6 uniqueName];
  v8 = [v3 objectForKeyedSubscript:v7];
  v17[2] = v8;
  v9 = +[MapsSuggestionsFirstUnlockTrigger description];
  v10 = [v3 objectForKeyedSubscript:v9];
  v17[3] = v10;
  v11 = +[MapsSuggestionsMapsInstalledTriggeringToggle description];
  v12 = [v3 objectForKeyedSubscript:v11];

  v17[4] = v12;
  v13 = +[NSArray arrayWithObjects:v17 count:5];

  return v13;
}

- (void)dealloc
{
  [(NavdDoom *)self->_doom unregisterObserver:self->_evalDumper];
  [(NavdDoom *)self->_doom unregisterObserver:self->_cache];
  [(NavdDoom *)self->_doom unregisterObserver:self->_powerLogger];
  [(NavdDoom *)self->_doom unregisterObserver:self->_analytics];
  v3.receiver = self;
  v3.super_class = (Class)NavdDoomHost;
  [(NavdDoomHost *)&v3 dealloc];
}

- (BOOL)_loadFromCache
{
  objc_super v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Loading Storage from Cache", v10, 2u);
  }

  v4 = +[NavdDoomCache loadFromFilePath:0];
  storage = self->_storage;
  self->_storage = v4;

  id v6 = self->_storage;
  if (v6)
  {
    v7 = [(NavdDoomStorage *)self->_storage mostRecentLocation];
    MapsSuggestionsSetMostRecentLocation();
  }
  else
  {
    v8 = objc_alloc_init(NavdDoomStorage);
    v7 = self->_storage;
    self->_storage = v8;
  }

  return v6 != 0;
}

- (void)_notifyObserversWithTrigger:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_triggerObservers;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "didReceiveTrigger:", v4, (void)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)sleepUntilTime:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v12 = 136446978;
      long long v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomHost.m";
      __int16 v14 = 1024;
      int v15 = 227;
      __int16 v16 = 2082;
      v17 = "-[NavdDoomHost sleepUntilTime:]";
      __int16 v18 = 2082;
      v19 = "time == nil";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. No date received", (uint8_t *)&v12, 0x26u);
    }
    goto LABEL_7;
  }
  if (MapsSuggestionsIsInThePast(v4))
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      MapsSuggestionsStringFromDate(v5);
      id v7 = (char *)objc_claimAutoreleasedReturnValue();
      int v12 = 138412290;
      long long v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Schedule time is in the past, ignoring: %@", (uint8_t *)&v12, 0xCu);
    }
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_11;
  }
  GEOConfigGetDouble();
  xpcTimer = self->_xpcTimer;
  [v5 timeIntervalSinceNow];
  -[MapsSuggestionsXPCActivityTimer scheduleWithTimeInterval:leeway:](xpcTimer, "scheduleWithTimeInterval:leeway:");
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    MapsSuggestionsStringFromDate(v5);
    long long v10 = (char *)objc_claimAutoreleasedReturnValue();
    int v12 = 138412290;
    long long v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Scheduled refresh activity block for %@", (uint8_t *)&v12, 0xCu);
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (void)willStartUpdate
{
  self->_osTransaction = [[NavdOsTransaction alloc] initWithTransactionName:"com.apple.navd.doom.refreshTransaction"];

  _objc_release_x1();
}

- (void)didEndUpdate
{
  [(NavdOsTransaction *)self->_osTransaction endTransaction];
  osTransaction = self->_osTransaction;
  self->_osTransaction = 0;
}

- (NavdDoomStorage)snapshot
{
  id v2 = [(NavdDoomStorage *)self->_storage copy];

  return (NavdDoomStorage *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcTimer, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_powerLogger, 0);
  objc_storeStrong((id *)&self->_evalDumper, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_doom, 0);
  objc_storeStrong((id *)&self->_alerter, 0);
  objc_storeStrong((id *)&self->_guard, 0);
  objc_storeStrong((id *)&self->_routesUpdater, 0);
  objc_storeStrong((id *)&self->_destinationsUpdater, 0);
  objc_storeStrong((id *)&self->_exitTimeUpdater, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_triggerObservers, 0);

  objc_storeStrong((id *)&self->_visitMonitor, 0);
}

@end