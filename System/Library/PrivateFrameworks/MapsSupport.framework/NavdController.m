@interface NavdController
- (void)_clearNavTracesDirectory;
- (void)_main;
- (void)_migrate;
- (void)_startListeningToMemoryPressureEvents;
- (void)_startMapsSuggestionsControllerIfUnlocked;
- (void)_stopMonitoringSignificantLocationChanges;
- (void)_turnOffCoreRoutineMonitoringOn3DTouchDevices;
- (void)dealloc;
- (void)protectedDataDidBecomeAvailable:(id)a3;
- (void)start;
@end

@implementation NavdController

- (void)_main
{
  v3 = (GEONavdServer *)objc_alloc_init((Class)GEONavdServer);
  navigationServer = self->_navigationServer;
  self->_navigationServer = v3;

  v5 = objc_alloc_init(NAVDaemonServer);
  predictionsTTLServer = self->_predictionsTTLServer;
  self->_predictionsTTLServer = v5;

  v7 = +[MNNavigationServer sharedServer];
  navServer = self->_navServer;
  self->_navServer = v7;

  v9 = +[GEOPlatform sharedPlatform];
  v10 = [v9 hardwareIdentifier];

  v11 = +[GEOMapService sharedService];
  [v11 setDefaultTraitsHardwareIdentifier:v10];

  v12 = +[GEOPlatform sharedPlatform];
  [v12 setClientCapabilitiesHardwareIdentifier:v10];

  +[GEOUserSession setInitialShareSessionWithMaps:1];
  v13 = objc_alloc_init(NavdRecentLocationsServer);
  recentLocationsServer = self->_recentLocationsServer;
  self->_recentLocationsServer = v13;

  [(NavdController *)self _startMapsSuggestionsControllerIfUnlocked];
  notify_post("com.apple.navd.wakeUpForHypothesisUpdate");
  notify_post("com.apple.navd.restarted");
  v15 = sub_100013F74();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "navd: will start hosting virtual garage server", v17, 2u);
  }

  objc_opt_class();
  if (GEOConfigGetBOOL()) {
    objc_opt_class();
  }
  v16 = objc_opt_new();
  startHostingVirtualGarageServiceWithPersister();

  [(NavdController *)self _startListeningToMemoryPressureEvents];
}

- (void)_turnOffCoreRoutineMonitoringOn3DTouchDevices
{
  v3 = +[GEOPlatform sharedPlatform];
  unsigned int v4 = [v3 supportsForceTouch];

  if (v4)
  {
    v5 = (RTRoutineManager *)[objc_alloc((Class)RTRoutineManager) initWithRestorationIdentifier:@"com.apple.navd.routine"];
    routineManager = self->_routineManager;
    self->_routineManager = v5;

    v7 = self->_routineManager;
    [(RTRoutineManager *)v7 stopMonitoringNextPredictedLocationsOfInterest];
  }
}

- (void)_stopMonitoringSignificantLocationChanges
{
  id v2 = objc_alloc((Class)CLLocationManager);
  v3 = +[CLLocationManager navdLocationBundleSource];
  unsigned int v4 = +[NSBundle bundleWithPath:v3];
  id v5 = [v2 initWithEffectiveBundle:v4];

  [v5 stopMonitoringSignificantLocationChanges];
}

- (void)_clearNavTracesDirectory
{
  id v2 = +[GEOPlatform sharedPlatform];
  unsigned __int8 v3 = [v2 isInternalInstall];

  if ((v3 & 1) == 0)
  {
    unsigned int v4 = +[NSFileManager defaultManager];
    id v5 = +[MNFilePaths navTracesDirectoryPath];
    id v10 = 0;
    unsigned int v6 = [v4 removeItemAtPath:v5 error:&v10];
    id v7 = v10;

    if (v6)
    {
      v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Successfully removed traces directory.", buf, 2u);
      }
    }
    if (v7)
    {
      v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error removing traces directory: %@", buf, 0xCu);
      }
    }
  }
}

- (void)_migrate
{
  unsigned __int8 v3 = +[MNFilePaths navdCacheDirectoryPath];
  id v9 = [v3 stringByAppendingPathComponent:@"migration.plist"];

  unsigned int v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v9];

  if (!v5
    || (+[NSMutableDictionary dictionaryWithContentsOfFile:v9], (unsigned int v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    unsigned int v6 = +[NSMutableDictionary dictionary];
  }
  id v7 = [v6 objectForKeyedSubscript:@"MigrationVersion"];
  id v8 = [v7 integerValue];

  if (v8 != (id)1)
  {
    if (v8) {
      goto LABEL_8;
    }
    [(NavdController *)self _stopMonitoringSignificantLocationChanges];
    [(NavdController *)self _turnOffCoreRoutineMonitoringOn3DTouchDevices];
    [v6 setObject:&off_100090960 forKeyedSubscript:@"MigrationVersion"];
    [v6 writeToFile:v9 atomically:1];
  }
  [(NavdController *)self _clearNavTracesDirectory];
  [v6 setObject:&off_100090978 forKeyedSubscript:@"MigrationVersion"];
  [v6 writeToFile:v9 atomically:1];
LABEL_8:
}

- (void)_startMapsSuggestionsControllerIfUnlocked
{
  unsigned __int8 v3 = +[GEOKeyBagNotification sharedObject];
  unsigned __int8 v4 = [v3 addDataDidBecomeAvailableAfterFirstUnlockObserver:self];

  if (v4)
  {
    unsigned int v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Unable to access protected files, waiting for first unlock.", v9, 2u);
    }
  }
  else
  {
    if (!self->_mapsSuggestionsController)
    {
      unsigned int v6 = objc_alloc_init(NavdMapsSuggestionsController);
      mapsSuggestionsController = self->_mapsSuggestionsController;
      self->_mapsSuggestionsController = v6;
    }
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "first unlock, starting MapsSuggestionsController", buf, 2u);
    }

    [(NavdMapsSuggestionsController *)self->_mapsSuggestionsController startDoomIfNotStarted];
  }
}

- (void)protectedDataDidBecomeAvailable:(id)a3
{
  unsigned __int8 v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "First unlock received, launching MSg features ...", v5, 2u);
  }

  [(NavdController *)self _startMapsSuggestionsControllerIfUnlocked];
}

- (void)start
{
  [(NavdController *)self _migrate];

  [(NavdController *)self _main];
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_systemMemoryPressureWarningSource);
  dispatch_source_cancel((dispatch_source_t)self->_systemMemoryPressureCriticalSource);
  dispatch_source_cancel((dispatch_source_t)self->_processMemoryPressureWarningSource);
  dispatch_source_cancel((dispatch_source_t)self->_processMemoryPressureCriticalSource);
  v3.receiver = self;
  v3.super_class = (Class)NavdController;
  [(NavdController *)&v3 dealloc];
}

- (void)_startListeningToMemoryPressureEvents
{
  objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  queue = dispatch_queue_create("com.apple.navd.memoryPresure", v3);

  unsigned __int8 v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 2uLL, queue);
  dispatch_source_set_event_handler(v4, &stru_10008C1D8);
  systemMemoryPressureWarningSource = self->_systemMemoryPressureWarningSource;
  self->_systemMemoryPressureWarningSource = (OS_dispatch_source *)v4;
  unsigned int v6 = v4;

  id v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 4uLL, queue);
  dispatch_source_set_event_handler(v7, &stru_10008C1F8);
  systemMemoryPressureCriticalSource = self->_systemMemoryPressureCriticalSource;
  self->_systemMemoryPressureCriticalSource = (OS_dispatch_source *)v7;
  id v9 = v7;

  id v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 0x10uLL, queue);
  dispatch_source_set_event_handler(v10, &stru_10008C218);
  processMemoryPressureWarningSource = self->_processMemoryPressureWarningSource;
  self->_processMemoryPressureWarningSource = (OS_dispatch_source *)v10;
  id v12 = v10;

  v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 0x20uLL, queue);
  dispatch_source_set_event_handler(v13, &stru_10008C238);
  processMemoryPressureCriticalSource = self->_processMemoryPressureCriticalSource;
  self->_processMemoryPressureCriticalSource = (OS_dispatch_source *)v13;
  v15 = v13;

  dispatch_activate(v6);
  dispatch_activate(v9);

  dispatch_activate(v12);
  dispatch_activate(v15);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processMemoryPressureWarningSource, 0);
  objc_storeStrong((id *)&self->_processMemoryPressureCriticalSource, 0);
  objc_storeStrong((id *)&self->_systemMemoryPressureCriticalSource, 0);
  objc_storeStrong((id *)&self->_systemMemoryPressureWarningSource, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_mapsSuggestionsController, 0);
  objc_storeStrong((id *)&self->_recentLocationsServer, 0);
  objc_storeStrong((id *)&self->_navServer, 0);
  objc_storeStrong((id *)&self->_predictionsTTLServer, 0);

  objc_storeStrong((id *)&self->_navigationServer, 0);
}

@end