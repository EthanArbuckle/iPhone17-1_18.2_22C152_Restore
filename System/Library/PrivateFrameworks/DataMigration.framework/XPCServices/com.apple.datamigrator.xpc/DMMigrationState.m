@interface DMMigrationState
+ (BOOL)_shouldSuppressMigrationFailureAlert;
+ (id)sharedInstance;
- (BOOL)_showIgnoreTapToRadarAlertOption;
- (BOOL)isMigrationNeededWithBuildVersion:(id)a3 lastBuildVersion:(id)a4 clientPID:(int)a5;
- (BOOL)startMigrationAndOrBlockIfNecessaryWithClientInvocation:(id)a3 buildVersion:(id)a4 migrationStarterBlock:(id)a5;
- (DMMigrationSentinelManager)migrationSentinelManager;
- (DMMigrationState)initWithMigrationSentinelManager:(id)a3;
- (NSDictionary)pluginResults;
- (NSString)migrationPhaseDescription;
- (id)_telemetryDictionaryForPluginIdentifier:(id)a3 duration:(double)a4 incident:(id)a5 countOfAttempts:(unint64_t)a6 previousBuildVersion:(id)a7 userDataDisposition:(unsigned int)a8 userCategory:(unsigned int)a9;
- (id)_telemetryDictionaryMigrationDidCompleteWithDuration:(double)a3 fastPluginDuration:(double)a4 pluginCrashCount:(unsigned int)a5 pluginWatchdogCount:(unsigned int)a6 pluginReturnedFalseCount:(unsigned int)a7 previousBuildVersion:(id)a8 userDataDisposition:(unsigned int)a9 pluginCategories:(unsigned int)a10 userCategory:(unsigned int)a11 inAppleStore:(BOOL)a12 isFromFactory:(BOOL)a13;
- (void)_clearPluginResults;
- (void)_createRecursiveMutex;
- (void)_releaseMigrationFailureNotification;
- (void)_reportMigrationFailureIfApplicable;
- (void)_userDidRespondToMigrationFailureNotificationToFileRadar:(BOOL)a3;
- (void)blockUntilProgressHostIsReadyWithTimeoutTimeInterval:(double)a3;
- (void)dealloc;
- (void)persistIfNecessary;
- (void)pluginDidFinish:(id)a3 withSuccess:(BOOL)a4 duration:(double)a5 incident:(id)a6 migrationPhaseDescription:(id)a7;
- (void)pluginWillRun:(id)a3 migrationPhaseDescription:(id)a4;
- (void)progressHostIsReady;
- (void)progressWindowHadIncident:(id)a3;
- (void)reportTelemetryForPluginIdentifier:(id)a3 duration:(double)a4 incident:(id)a5 countOfAttempts:(unint64_t)a6 userDataDisposition:(id)a7 userCategory:(unsigned int)a8;
- (void)reportTelemetryWithMigrationDuration:(double)a3 userDataDisposition:(id)a4 pluginCategories:(unsigned int)a5 userCategory:(unsigned int)a6 inAppleStore:(BOOL)a7 isFromFactory:(BOOL)a8 startInterval:(double)a9 firstPluginStartInterval:(double)a10 endInterval:(double)a11;
- (void)sendMigrationResultsToClientInvocationsInterestedInEarlyResultsForPluginIdentifier:(id)a3;
- (void)sendMigrationResultsToClientInvocationsWithSuccess:(BOOL)a3 buildVersion:(id)a4;
- (void)setMigrationPhaseDescription:(id)a3;
- (void)setMigrationSentinelManager:(id)a3;
- (void)setNeedsMigrationFailureReport;
- (void)willRunPlugins:(id)a3;
- (void)willStartMigration;
@end

@implementation DMMigrationState

+ (id)sharedInstance
{
  if (qword_100030BA8 != -1) {
    dispatch_once(&qword_100030BA8, &stru_100024830);
  }
  v2 = (void *)qword_100030BA0;

  return v2;
}

- (DMMigrationState)initWithMigrationSentinelManager:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DMMigrationState;
  v6 = [(DMMigrationState *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_migrationSentinelManager, a3);
    [(DMMigrationState *)v7 _createRecursiveMutex];
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    migrationPhaseDescriptionsByConcurrentPluginIdentifiers = v7->_migrationPhaseDescriptionsByConcurrentPluginIdentifiers;
    v7->_migrationPhaseDescriptionsByConcurrentPluginIdentifiers = v8;

    uint64_t v10 = +[NSMutableArray arrayWithCapacity:1];
    waitingClientInvocations = v7->_waitingClientInvocations;
    v7->_waitingClientInvocations = (NSMutableArray *)v10;

    v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completedPluginIdentifiers = v7->_completedPluginIdentifiers;
    v7->_completedPluginIdentifiers = v12;

    pluginResults = v7->_pluginResults;
    v7->_pluginResults = 0;

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    incidents = v7->_incidents;
    v7->_incidents = v15;

    v7->_needsMigrationFailureReport = 0;
    migrationFailureNotificationTransaction = v7->_migrationFailureNotificationTransaction;
    v7->_migrationFailureNotification = 0;
    v7->_migrationFailureNotificationTransaction = 0;

    v7->_fastPluginMigrationDuration = 0.0;
    v18 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.datamigrator.migration", v18);
    migrationSerialQueue = v7->_migrationSerialQueue;
    v7->_migrationSerialQueue = (OS_dispatch_queue *)v19;
  }
  return v7;
}

- (void)_createRecursiveMutex
{
  v3.__sig = 0;
  *(void *)v3.__opaque = 0;
  if (pthread_mutexattr_init(&v3)
    || pthread_mutexattr_settype(&v3, 2)
    || pthread_mutex_init(&self->_recursiveMutex, &v3))
  {
    abort();
  }
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_recursiveMutex);
  v3.receiver = self;
  v3.super_class = (Class)DMMigrationState;
  [(DMMigrationState *)&v3 dealloc];
}

- (NSString)migrationPhaseDescription
{
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  v4 = (__CFString *)[(NSString *)self->_migrationPhaseDescription copy];
  if (!v4) {
    goto LABEL_11;
  }
  id v5 = v4;
  if (![(NSMutableDictionary *)self->_migrationPhaseDescriptionsByConcurrentPluginIdentifiers count]) {
    goto LABEL_20;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v6 = [(NSMutableDictionary *)self->_migrationPhaseDescriptionsByConcurrentPluginIdentifiers allKeys];
  v7 = [v6 sortedArrayUsingSelector:"caseInsensitiveCompare:"];

  id obj = v7;
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v8) {
    goto LABEL_19;
  }
  id v9 = v8;
  v24 = p_recursiveMutex;
  uint64_t v10 = *(void *)v27;
  do
  {
    v11 = 0;
    v12 = v5;
    do
    {
      if (*(void *)v27 != v10) {
        objc_enumerationMutation(v7);
      }
      v13 = [(NSMutableDictionary *)self->_migrationPhaseDescriptionsByConcurrentPluginIdentifiers objectForKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * (void)v11)];
      v14 = +[NSString stringWithFormat:@" (Concurrent: %@)", v13];
      id v5 = [(__CFString *)v12 stringByAppendingString:v14];

      v11 = (char *)v11 + 1;
      v12 = v5;
    }
    while (v9 != v11);
    id v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v9);

  p_recursiveMutex = v24;
  if (!v5)
  {
LABEL_11:
    v15 = +[DMEnvironment sharedInstance];
    uint64_t v16 = [v15 buildVersion];

    v17 = +[DMEnvironment sharedInstance];
    v18 = [v17 lastMigrationResultsPref];

    dispatch_queue_t v19 = objc_msgSend(v18, "dmlmr_buildVersion");
    id obj = (id)v16;
    if (+[DMEnvironment isBuildVersion:v16 equalToBuildVersion:v19])
    {
      v20 = objc_msgSend(v18, "dmlmr_success");

      if (v20)
      {
        v21 = objc_msgSend(v18, "dmlmr_success");
        unsigned int v22 = [v21 BOOLValue];

        if (v22) {
          id v5 = @"kDMMigrationPhaseDescriptionDidFinishWithSuccess";
        }
        else {
          id v5 = @"kDMMigrationPhaseDescriptionDidFinishWithFailure";
        }
        goto LABEL_18;
      }
    }
    else
    {
    }
    id v5 = 0;
LABEL_18:

LABEL_19:
  }
LABEL_20:
  pthread_mutex_unlock(p_recursiveMutex);

  return (NSString *)v5;
}

- (NSDictionary)pluginResults
{
  objc_super v3 = +[DMEnvironment sharedInstance];
  unsigned int v4 = [v3 implementMigrationPluginResults];

  if (v4)
  {
    p_recursiveMutex = &self->_recursiveMutex;
    pthread_mutex_lock(&self->_recursiveMutex);
    id v6 = [(NSMutableDictionary *)self->_pluginResults copy];
    if (!v6)
    {
      v7 = +[DMEnvironment sharedInstance];
      id v6 = [v7 migrationPluginResultsPref];
    }
    pthread_mutex_unlock(p_recursiveMutex);
  }
  else
  {
    id v6 = 0;
  }

  return (NSDictionary *)v6;
}

- (void)setMigrationPhaseDescription:(id)a3
{
  p_recursiveMutex = &self->_recursiveMutex;
  id v5 = a3;
  pthread_mutex_lock(p_recursiveMutex);
  id v6 = (NSString *)[v5 copy];

  migrationPhaseDescription = self->_migrationPhaseDescription;
  self->_migrationPhaseDescription = v6;

  pthread_mutex_unlock(p_recursiveMutex);
}

- (BOOL)isMigrationNeededWithBuildVersion:(id)a3 lastBuildVersion:(id)a4 clientPID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    if ((+[DMEnvironment isBuildVersion:v8 equalToBuildVersion:v9] & 1) == 0)goto LABEL_6; {
  }
    }
  else
  {
    v15 = +[NSNumber numberWithInt:v5];
    _DMLogFunc();
  }
  uint64_t v10 = [(DMMigrationState *)self migrationSentinelManager];
  unsigned int v11 = [v10 isSentinelPresent];

  if (!v11)
  {
    BOOL v13 = 0;
    goto LABEL_8;
  }
LABEL_6:
  v12 = +[NSNumber numberWithInt:v5];
  _DMLogFunc();

  BOOL v13 = 1;
LABEL_8:

  return v13;
}

- (BOOL)startMigrationAndOrBlockIfNecessaryWithClientInvocation:(id)a3 buildVersion:(id)a4 migrationStarterBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(DMMigrationState *)self _lastPointBeforeEnteringPotentialStartOfMigrationCriticalSection];
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  v12 = +[DMEnvironment sharedInstance];
  BOOL v13 = [v12 lastBuildVersionPref];

  if ([v8 checkNecessity]
    && !-[DMMigrationState isMigrationNeededWithBuildVersion:lastBuildVersion:clientPID:](self, "isMigrationNeededWithBuildVersion:lastBuildVersion:clientPID:", v9, v13, [v8 pid]))
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000BF54;
    v36[3] = &unk_100024858;
    v20 = &v37;
    id v37 = v9;
    id v38 = v8;
    uint64_t v21 = objc_retainBlock(v36);
  }
  else
  {
    id v14 = v9;
    v15 = v10;
    uint64_t v16 = [v8 earlyResultsPluginIdentifier];
    if (!v16
      || (v17 = (void *)v16,
          completedPluginIdentifiers = self->_completedPluginIdentifiers,
          [v8 earlyResultsPluginIdentifier],
          dispatch_queue_t v19 = objc_claimAutoreleasedReturnValue(),
          LODWORD(completedPluginIdentifiers) = [(NSMutableSet *)completedPluginIdentifiers containsObject:v19], v19, v17, !completedPluginIdentifiers))
    {
      id v22 = [(NSMutableArray *)self->_waitingClientInvocations count];
      BOOL v23 = v22 == 0;
      [(NSMutableArray *)self->_waitingClientInvocations addObject:v8];
      long long v28 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 pid]);
      _DMLogFunc();

      if (v22)
      {
        id v10 = v15;
      }
      else
      {
        migrationSerialQueue = self->_migrationSerialQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000C0C0;
        block[3] = &unk_100024880;
        id v10 = v15;
        id v33 = v15;
        id v32 = v13;
        dispatch_async(migrationSerialQueue, block);
      }
      pthread_mutex_unlock(&self->_recursiveMutex);
      id v9 = v14;
      if (objc_msgSend(v8, "isProgressHost", v28))
      {
        dispatch_time_t v25 = dispatch_time(0, 1000000000);
        long long v26 = dispatch_get_global_queue(25, 0);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10000C134;
        v30[3] = &unk_100024768;
        v30[4] = self;
        dispatch_after(v25, v26, v30);
      }
      long long v29 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 pid]);
      _DMLogFunc();

      dispatch_sync((dispatch_queue_t)self->_migrationSerialQueue, &stru_1000248A0);
      uint64_t v21 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v8, "pid", v29));
      _DMLogFunc();
      goto LABEL_15;
    }
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10000C000;
    v34[3] = &unk_100024768;
    v20 = &v35;
    id v35 = v8;
    uint64_t v21 = objc_retainBlock(v34);
    id v10 = v15;
    id v9 = v14;
  }

  pthread_mutex_unlock(p_recursiveMutex);
  if (!v21)
  {
    BOOL v23 = 0;
    goto LABEL_16;
  }
  (*(void (**)(uint64_t))(v21 + 16))(v21);
  BOOL v23 = 0;
LABEL_15:

LABEL_16:
  return v23;
}

- (void)willStartMigration
{
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  pluginResults = self->_pluginResults;
  self->_pluginResults = 0;

  [(NSMutableArray *)self->_incidents removeAllObjects];
  self->_fastPluginMigrationDuration = 0.0;
  id blockWaitingUntilProgressHostIsReady = self->_blockWaitingUntilProgressHostIsReady;
  self->_id blockWaitingUntilProgressHostIsReady = 0;

  pthread_mutex_unlock(p_recursiveMutex);
}

- (void)progressHostIsReady
{
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  _DMLogFunc();
  unsigned int v4 = +[DMEnvironment sharedInstance];
  [v4 setProgressHostIsReady];

  id blockWaitingUntilProgressHostIsReady = (void (**)(void))self->_blockWaitingUntilProgressHostIsReady;
  if (blockWaitingUntilProgressHostIsReady)
  {
    blockWaitingUntilProgressHostIsReady[2]();
    id v6 = self->_blockWaitingUntilProgressHostIsReady;
    self->_id blockWaitingUntilProgressHostIsReady = 0;
  }

  pthread_mutex_unlock(p_recursiveMutex);
}

- (void)blockUntilProgressHostIsReadyWithTimeoutTimeInterval:(double)a3
{
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  id v6 = +[DMEnvironment sharedInstance];
  unsigned int v7 = [v6 isProgressHostReady];

  if (v7)
  {
    _DMLogFunc();
    pthread_mutex_unlock(p_recursiveMutex);
  }
  else
  {
    _DMLogFunc();
    dispatch_block_t v8 = dispatch_block_create((dispatch_block_flags_t)0, &stru_1000248C0);
    id blockWaitingUntilProgressHostIsReady = self->_blockWaitingUntilProgressHostIsReady;
    self->_id blockWaitingUntilProgressHostIsReady = v8;

    id block = objc_retainBlock(self->_blockWaitingUntilProgressHostIsReady);
    pthread_mutex_unlock(p_recursiveMutex);
    if (block)
    {
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      unsigned int v11 = +[NSNumber numberWithInt:dispatch_block_wait(block, v10) != 0];
      _DMLogFunc();
    }
  }
}

- (void)progressWindowHadIncident:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&self->_recursiveMutex);
  if (v4) {
    [(NSMutableArray *)self->_incidents addObject:v4];
  }
  pthread_mutex_unlock(&self->_recursiveMutex);
}

- (void)willRunPlugins:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[DMEnvironment sharedInstance];
  unsigned int v6 = [v5 implementMigrationPluginResults];

  if (v6)
  {
    p_recursiveMutex = &self->_recursiveMutex;
    pthread_mutex_lock(&self->_recursiveMutex);
    unsigned int v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
    pluginResults = self->_pluginResults;
    self->_pluginResults = v7;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v14, "existsAndShouldRun", p_recursiveMutex))
          {
            v25[0] = @"kDMMigrationPluginResultsBundlePathKey";
            v15 = [v14 rep];
            uint64_t v16 = [v15 path];
            v25[1] = @"kDMMigrationPluginResultsPhaseDescription";
            v26[0] = v16;
            v26[1] = @"kDMMigrationPhaseDescriptionRunPending";
            v17 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

            v18 = self->_pluginResults;
            dispatch_queue_t v19 = [v14 identifier];
            [(NSMutableDictionary *)v18 setObject:v17 forKey:v19];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v11);
    }

    pthread_mutex_unlock(p_recursiveMutex);
  }
}

- (void)sendMigrationResultsToClientInvocationsInterestedInEarlyResultsForPluginIdentifier:(id)a3
{
  id v4 = a3;
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  [(NSMutableSet *)self->_completedPluginIdentifiers addObject:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned int v6 = self->_waitingClientInvocations;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "earlyResultsPluginIdentifier", (void)v15);
        if ([v12 isEqualToString:v4])
        {
          BOOL v13 = [v11 resultsHandler];

          if (v13)
          {
            id v14 = [v11 resultsHandler];
            v14[2](v14, 3);

            [v11 setResultsHandler:0];
          }
        }
        else
        {
        }
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  pthread_mutex_unlock(p_recursiveMutex);
}

- (void)sendMigrationResultsToClientInvocationsWithSuccess:(BOOL)a3 buildVersion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  pthread_mutex_lock(&self->_recursiveMutex);
  [(DMMigrationState *)self _firstPointAfterEnteringEndOfMigrationCriticalSection];
  id v7 = [(DMMigrationState *)self migrationSentinelManager];
  [v7 removeSentinelIfPresent];

  if (v6)
  {
    id v8 = +[DMEnvironment sharedInstance];
    [v8 setLastBuildVersionPref:v6];

    uint64_t v9 = +[NSDictionary dmlmr_lastMigrationResultsWithSuccess:v4 buildVersion:v6];
    id v10 = +[DMEnvironment sharedInstance];
    [v10 setLastMigrationResultsPref:v9];
  }
  long long v26 = v6;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = self->_waitingClientInvocations;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v17 = [v16 resultsHandler];

        if (v17)
        {
          uint64_t v18 = [v16 earlyResultsPluginIdentifier];
          if (v18)
          {
            dispatch_queue_t v19 = (void *)v18;
            completedPluginIdentifiers = self->_completedPluginIdentifiers;
            long long v21 = [v16 earlyResultsPluginIdentifier];
            LOBYTE(completedPluginIdentifiers) = [(NSMutableSet *)completedPluginIdentifiers containsObject:v21];

            if ((completedPluginIdentifiers & 1) == 0)
            {
              long long v22 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v16 pid]);
              [v16 earlyResultsPluginIdentifier];
              dispatch_time_t v25 = v24 = v22;
              _DMLogFunc();
            }
          }
          objc_msgSend(v16, "resultsHandler", v24, v25);
          long long v23 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
          v23[2](v23, v4);
        }
      }
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v13);
  }

  [(NSMutableArray *)self->_waitingClientInvocations removeAllObjects];
  [(NSMutableSet *)self->_completedPluginIdentifiers removeAllObjects];
  [(DMMigrationState *)self _reportMigrationFailureIfApplicable];
  pthread_mutex_unlock(&self->_recursiveMutex);
}

- (void)pluginWillRun:(id)a3 migrationPhaseDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  uint64_t v9 = +[DMEnvironment sharedInstance];
  unsigned int v10 = [v9 implementMigrationPluginResults];

  if (v10)
  {
    v32[0] = @"kDMMigrationPluginResultsBundlePathKey";
    id v11 = [v6 rep];
    id v12 = [v11 path];
    v33[0] = v12;
    v33[1] = &off_100027978;
    v32[1] = @"kDMMigrationPluginResultsDuration";
    v32[2] = @"kDMMigrationPluginResultsPhaseDescription";
    v33[2] = @"kDMMigrationPhaseDescriptionRunning";
    id v13 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];

    pluginResults = self->_pluginResults;
    long long v15 = [v6 identifier];
    [(NSMutableDictionary *)pluginResults setObject:v13 forKey:v15];

    long long v16 = +[NSDate date];
    long long v17 = dispatch_get_global_queue(21, 0);
    uint64_t v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v17);

    dispatch_time_t v19 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v18, v19, 0x3B9ACA00uLL, 0x1DCD6500uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000CD8C;
    handler[3] = &unk_1000248E8;
    handler[4] = self;
    id v29 = v6;
    id v30 = v16;
    v31 = v18;
    v20 = v18;
    id v21 = v16;
    dispatch_source_set_event_handler(v20, handler);
    dispatch_resume(v20);
  }
  unsigned int v22 = [v6 isConcurrent];
  long long v23 = (NSString *)[v7 copy];
  long long v24 = v23;
  if (v22)
  {
    migrationPhaseDescriptionsByConcurrentPluginIdentifiers = self->_migrationPhaseDescriptionsByConcurrentPluginIdentifiers;
    long long v26 = [v6 identifier];
    [(NSMutableDictionary *)migrationPhaseDescriptionsByConcurrentPluginIdentifiers setObject:v24 forKeyedSubscript:v26];
  }
  else
  {
    migrationPhaseDescription = self->_migrationPhaseDescription;
    self->_migrationPhaseDescription = v23;
    long long v24 = migrationPhaseDescription;
  }

  pthread_mutex_unlock(p_recursiveMutex);
}

- (void)pluginDidFinish:(id)a3 withSuccess:(BOOL)a4 duration:(double)a5 incident:(id)a6 migrationPhaseDescription:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  [v12 timeIntervalBeforeWatchdog];
  if (v16 > 0.0) {
    self->_fastPluginMigrationDuration = self->_fastPluginMigrationDuration + a5;
  }
  if (v13) {
    [(NSMutableArray *)self->_incidents addObject:v13];
  }
  long long v17 = +[DMEnvironment sharedInstance];
  unsigned int v18 = [v17 implementMigrationPluginResults];

  if (v18)
  {
    v30[0] = @"kDMMigrationPluginResultsBundlePathKey";
    dispatch_time_t v19 = [v12 rep];
    v20 = [v19 path];
    v31[0] = v20;
    v30[1] = @"kDMMigrationPluginResultsDuration";
    uint64_t v21 = +[NSNumber numberWithDouble:a5];
    unsigned int v22 = (void *)v21;
    v30[2] = @"kDMMigrationPluginResultsPhaseDescription";
    CFStringRef v23 = @"kDMMigrationPhaseDescriptionDidFinishWithFailure";
    if (v10) {
      CFStringRef v23 = @"kDMMigrationPhaseDescriptionDidFinishWithSuccess";
    }
    v31[1] = v21;
    v31[2] = v23;
    long long v24 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];

    pluginResults = self->_pluginResults;
    long long v26 = [v12 identifier];
    [(NSMutableDictionary *)pluginResults setObject:v24 forKey:v26];
  }
  if ([v12 isConcurrent])
  {
    migrationPhaseDescriptionsByConcurrentPluginIdentifiers = self->_migrationPhaseDescriptionsByConcurrentPluginIdentifiers;
    migrationPhaseDescription = [v12 identifier];
    [(NSMutableDictionary *)migrationPhaseDescriptionsByConcurrentPluginIdentifiers removeObjectForKey:migrationPhaseDescription];
  }
  else
  {
    id v29 = (NSString *)[v14 copy];
    migrationPhaseDescription = self->_migrationPhaseDescription;
    self->_migrationPhaseDescription = v29;
  }

  pthread_mutex_unlock(p_recursiveMutex);
}

- (void)persistIfNecessary
{
  objc_super v3 = +[DMEnvironment sharedInstance];
  unsigned int v4 = [v3 implementMigrationPluginResults];

  if (v4)
  {
    pthread_mutex_lock(&self->_recursiveMutex);
    if (self->_pluginResults)
    {
      uint64_t v5 = +[DMEnvironment sharedInstance];
      [v5 setMigrationPluginResultsPref:self->_pluginResults];
    }
    pthread_mutex_unlock(&self->_recursiveMutex);
  }
}

- (void)_clearPluginResults
{
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  pluginResults = self->_pluginResults;
  self->_pluginResults = 0;

  pthread_mutex_unlock(p_recursiveMutex);
}

+ (BOOL)_shouldSuppressMigrationFailureAlert
{
  if (qword_100030BB8 != -1) {
    dispatch_once(&qword_100030BB8, &stru_100024908);
  }
  return byte_100030BB0;
}

- (void)setNeedsMigrationFailureReport
{
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  if (+[DMMigrationState _shouldSuppressMigrationFailureAlert])
  {
    _DMLogFunc();
  }
  else
  {
    unsigned int v4 = +[NSNumber numberWithBool:self->_needsMigrationFailureReport];
    _DMLogFunc();

    if (!self->_needsMigrationFailureReport)
    {
      self->_needsMigrationFailureReport = 1;
      [(DMMigrationState *)self _reportMigrationFailureIfApplicable];
    }
  }

  pthread_mutex_unlock(p_recursiveMutex);
}

- (void)_reportMigrationFailureIfApplicable
{
  p_recursiveMutex = &self->_recursiveMutex;
  pthread_mutex_lock(&self->_recursiveMutex);
  if (self->_needsMigrationFailureReport
    && !self->_migrationFailureNotification
    && ![(NSMutableArray *)self->_waitingClientInvocations count])
  {
    _DMLogFunc();
    v12[0] = kCFUserNotificationAlertHeaderKey;
    v12[1] = kCFUserNotificationDefaultButtonTitleKey;
    v13[0] = @"Data Migration Failed";
    v13[1] = @"Tap-to-Radar";
    unsigned int v4 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    uint64_t v5 = +[NSMutableDictionary dictionaryWithDictionary:v4];
    if ([(DMMigrationState *)self _showIgnoreTapToRadarAlertOption]) {
      [v5 setObject:@"Ignore" forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];
    }
    CFDictionaryRef v6 = (const __CFDictionary *)[v5 copy];
    self->_migrationFailureNotification = CFUserNotificationCreate(0, 0.0, 0, 0, v6);

    if (self->_migrationFailureNotification)
    {
      id v7 = (OS_os_transaction *)os_transaction_create();
      migrationFailureNotificationTransaction = self->_migrationFailureNotificationTransaction;
      self->_migrationFailureNotificationTransaction = v7;

      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, self->_migrationFailureNotification, (CFUserNotificationCallBack)sub_10000D62C, 0);
      if (RunLoopSource)
      {
        BOOL v10 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v10, kCFRunLoopCommonModes);
        CFRelease(v10);
      }
    }
  }
  pthread_mutex_unlock(p_recursiveMutex);
}

- (void)_userDidRespondToMigrationFailureNotificationToFileRadar:(BOOL)a3
{
  unsigned int v4 = self;
  [(DMMigrationState *)self _releaseMigrationFailureNotification];
  if (a3)
  {
    p_recursiveMutex = &v4->_recursiveMutex;
    pthread_mutex_lock(&v4->_recursiveMutex);
    _DMLogFunc();
    CFDictionaryRef v6 = +[DMEnvironment sharedInstance];
    id v7 = [v6 buildVersion];

    id v8 = +[NSString stringWithFormat:@"Data Migration failed on %@", v7];
    if ([(NSMutableArray *)v4->_incidents count])
    {
      v39 = v7;
      v40 = &v4->_recursiveMutex;
      id v38 = v8;
      if ([(NSMutableArray *)v4->_incidents count] == (id)1)
      {
        uint64_t v9 = [(NSMutableArray *)v4->_incidents firstObject];
        BOOL v10 = [v9 responsiblePluginRep];
        id v11 = [v10 bundleIdentifier];

        if ([v11 length])
        {
          CFStringRef v12 = +[NSString stringWithFormat:@" (%@)", v11];
        }
        else
        {
          long long v15 = [v9 details];
          id v16 = [v15 length];

          if (v16)
          {
            long long v17 = [v9 details];
            CFStringRef v12 = +[NSString stringWithFormat:@" (%@)", v17];
          }
          else
          {
            CFStringRef v12 = @" (single reason)";
          }
        }
        CFStringRef v37 = v12;
      }
      else
      {
        CFStringRef v37 = @" (multiple reasons)";
      }
      id v18 = objc_alloc_init((Class)NSDateFormatter);
      [v18 setDateStyle:1];
      [v18 setDateFormat:@"yyyy-MM-dd-HHmmss"];
      id v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](v4->_incidents, "count"));
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v41 = v4;
      id obj = v4->_incidents;
      id v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v45;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v45 != v22) {
              objc_enumerationMutation(obj);
            }
            long long v24 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            dispatch_time_t v25 = [v24 details];
            long long v26 = [v24 date];
            long long v27 = [v18 stringFromDate:v26];
            long long v28 = +[NSString stringWithFormat:@"%@ (%@)", v25, v27];

            [v19 addObject:v28];
          }
          id v21 = [(NSMutableArray *)obj countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v21);
      }

      id v29 = [v19 componentsJoinedByString:@"\n"];
      id v8 = +[NSString stringWithFormat:@"%@\nReasons:\n%@", v38, v29];

      p_recursiveMutex = v40;
      unsigned int v4 = v41;
      id v7 = v39;
      id v14 = (__CFString *)v37;
    }
    else
    {
      id v14 = &stru_1000259A0;
    }
    id v30 = +[NSString stringWithFormat:@"%@\n\nAdditional diagnostic info in stackshots with prefixes:\nstacks+com.apple.datamigrator\ncom.apple.migrationpluginwrapper (for plugin crashes, if any)", v8];

    id v31 = objc_alloc_init((Class)RadarDraft);
    id v32 = +[NSString stringWithFormat:@"Data Migration failed on %@%@", v7, v14];
    [v31 setTitle:v32];

    [v31 setProblemDescription:v30];
    [v31 setClassification:2];
    [v31 setReproducibility:5];
    id v33 = [objc_alloc((Class)RadarComponent) initWithName:@"Data Migrator" version:@"iOS" identifier:396123];
    [v31 setComponent:v33];

    [v31 setIsUserInitiated:1];
    v34 = +[TapToRadarService shared];
    id v43 = 0;
    [v34 createDraft:v31 forProcessNamed:@"Data Migrator" withDisplayReason:0 error:&v43];
    id v35 = v43;

    _DMLogFunc();
    migrationFailureNotificationTransaction = v4->_migrationFailureNotificationTransaction;
    v4->_migrationFailureNotificationTransaction = 0;

    pthread_mutex_unlock(p_recursiveMutex);
  }
  else
  {
    _DMLogFunc();
    id v13 = v4->_migrationFailureNotificationTransaction;
    v4->_migrationFailureNotificationTransaction = 0;
  }
}

- (void)_releaseMigrationFailureNotification
{
  self->_migrationFailureNotification = 0;
  self->_needsMigrationFailureReport = 0;
}

- (BOOL)_showIgnoreTapToRadarAlertOption
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_incidents;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "kind", (void)v9) != 5)
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (id)_telemetryDictionaryForPluginIdentifier:(id)a3 duration:(double)a4 incident:(id)a5 countOfAttempts:(unint64_t)a6 previousBuildVersion:(id)a7 userDataDisposition:(unsigned int)a8 userCategory:(unsigned int)a9
{
  uint64_t v9 = *(void *)&a8;
  id v14 = a3;
  id v15 = a5;
  CFStringRef v16 = (const __CFString *)a7;
  CFStringRef v17 = @"(null)";
  if (v16) {
    CFStringRef v17 = v16;
  }
  CFStringRef v37 = (__CFString *)v17;
  id v18 = +[DMUserDataDispositionManager basicDispositionFlagsFromDispositionFlags:v9];
  id v19 = +[DMUserDataDispositionManager backupSourceDispositionFlagsFromDispositionFlags:v9];
  v36 = v14;
  v47[0] = v14;
  v38[0] = @"pluginIdentifier";
  v38[1] = @"durationInSeconds";
  id v35 = +[NSNumber numberWithUnsignedInt:a4];
  v47[1] = v35;
  v38[2] = @"attempts";
  id v20 = +[NSNumber numberWithUnsignedInteger:a6];
  v47[2] = v20;
  v38[3] = @"didSucceed";
  id v21 = +[NSNumber numberWithInt:v15 == 0];
  v47[3] = v21;
  v38[4] = @"didReportFailure";
  if (v15)
  {
    id v33 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v15 kind] == 1);
    v48 = v33;
    CFStringRef v39 = @"didHaveTooManyXPCFailures";
    id v32 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v15 kind] == 2);
    v49 = v32;
    CFStringRef v40 = @"didExceedAllowableTime";
    uint64_t v22 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v15 kind] == 3);
  }
  else
  {
    uint64_t v22 = &__kCFBooleanFalse;
    v48 = &__kCFBooleanFalse;
    v49 = &__kCFBooleanFalse;
    CFStringRef v39 = @"didHaveTooManyXPCFailures";
    CFStringRef v40 = @"didExceedAllowableTime";
  }
  uint64_t v23 = (v9 >> 7) & 1;
  uint64_t v24 = (v9 >> 3) & 1;
  v50 = v22;
  v51 = v37;
  CFStringRef v41 = @"previousBuildVersion";
  CFStringRef v42 = @"userDataDispositionBasic";
  dispatch_time_t v25 = +[NSNumber numberWithUnsignedInt:v18];
  v52 = v25;
  CFStringRef v43 = @"userDataDispositionBackupSource";
  long long v26 = +[NSNumber numberWithUnsignedInt:v19];
  v53 = v26;
  CFStringRef v44 = @"userDataDispositionBackupSourceWasDifferentDevice";
  long long v27 = +[NSNumber numberWithBool:v24];
  v54 = v27;
  CFStringRef v45 = @"userDataDispositionBackupSourceIsMegaBackup";
  long long v28 = +[NSNumber numberWithBool:v23];
  v55 = v28;
  CFStringRef v46 = @"userCategory";
  id v29 = +[NSNumber numberWithUnsignedInt:a9];
  v56 = v29;
  id v30 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v38 count:13];

  if (v15)
  {
  }

  return v30;
}

- (void)reportTelemetryForPluginIdentifier:(id)a3 duration:(double)a4 incident:(id)a5 countOfAttempts:(unint64_t)a6 userDataDisposition:(id)a7 userCategory:(unsigned int)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  CFStringRef v17 = [v16 objectForKeyedSubscript:@"previousBuildVersion"];
  unsigned int v18 = +[DMUserDataDispositionManager dispositionFlagsFromDispositionDict:v16];

  id v19 = +[DMAnalytics sharedInstance];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000E204;
  v23[3] = &unk_100024930;
  v23[4] = self;
  id v24 = v14;
  double v27 = a4;
  unint64_t v28 = a6;
  id v25 = v15;
  id v26 = v17;
  unsigned int v29 = v18;
  unsigned int v30 = a8;
  id v20 = v17;
  id v21 = v15;
  id v22 = v14;
  [v19 sendLazyEventWithName:@"com.apple.migration.pluginDidComplete" payloadBuilder:v23];
}

- (id)_telemetryDictionaryMigrationDidCompleteWithDuration:(double)a3 fastPluginDuration:(double)a4 pluginCrashCount:(unsigned int)a5 pluginWatchdogCount:(unsigned int)a6 pluginReturnedFalseCount:(unsigned int)a7 previousBuildVersion:(id)a8 userDataDisposition:(unsigned int)a9 pluginCategories:(unsigned int)a10 userCategory:(unsigned int)a11 inAppleStore:(BOOL)a12 isFromFactory:(BOOL)a13
{
  uint64_t v13 = *(void *)&a9;
  uint64_t v14 = *(void *)&a7;
  uint64_t v15 = *(void *)&a6;
  uint64_t v16 = *(void *)&a5;
  CFStringRef v19 = (const __CFString *)a8;
  if (v19) {
    CFStringRef v20 = v19;
  }
  else {
    CFStringRef v20 = @"(null)";
  }
  v36 = (__CFString *)v20;
  id v21 = +[DMUserDataDispositionManager basicDispositionFlagsFromDispositionFlags:v13];
  id v22 = +[DMUserDataDispositionManager backupSourceDispositionFlagsFromDispositionFlags:v13];
  v40[0] = @"durationInSeconds";
  CFStringRef v39 = +[NSNumber numberWithUnsignedInt:a3];
  v41[0] = v39;
  v40[1] = @"fastPluginDurationInSeconds";
  id v38 = +[NSNumber numberWithUnsignedInt:a4];
  v41[1] = v38;
  v40[2] = @"countOfPluginsCrashing";
  CFStringRef v37 = +[NSNumber numberWithUnsignedInt:v16];
  v41[2] = v37;
  v40[3] = @"countOfPluginsExceedingAllowableTime";
  id v35 = +[NSNumber numberWithUnsignedInt:v15];
  v41[3] = v35;
  v40[4] = @"countOfPluginsReportingFailure";
  id v33 = +[NSNumber numberWithUnsignedInt:v14];
  v41[4] = v33;
  v41[5] = v20;
  v40[5] = @"previousBuildVersion";
  v40[6] = @"userDataDispositionBasic";
  uint64_t v23 = +[NSNumber numberWithUnsignedInt:v21];
  v41[6] = v23;
  v40[7] = @"userDataDispositionBackupSource";
  id v24 = +[NSNumber numberWithUnsignedInt:v22];
  v41[7] = v24;
  v40[8] = @"userDataDispositionBackupSourceWasDifferentDevice";
  id v25 = +[NSNumber numberWithBool:(v13 >> 3) & 1];
  v41[8] = v25;
  v40[9] = @"userDataDispositionBackupSourceIsMegaBackup";
  id v26 = +[NSNumber numberWithBool:(v13 >> 7) & 1];
  v41[9] = v26;
  v40[10] = @"pluginCategories";
  double v27 = +[NSNumber numberWithUnsignedInt:a10];
  v41[10] = v27;
  v40[11] = @"userCategory";
  unint64_t v28 = +[NSNumber numberWithUnsignedInt:a11];
  v41[11] = v28;
  v40[12] = @"inAppleStore";
  unsigned int v29 = +[NSNumber numberWithBool:a12];
  v41[12] = v29;
  v40[13] = @"isFromFactory";
  unsigned int v30 = +[NSNumber numberWithBool:a13];
  v41[13] = v30;
  id v31 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:14];

  return v31;
}

- (void)reportTelemetryWithMigrationDuration:(double)a3 userDataDisposition:(id)a4 pluginCategories:(unsigned int)a5 userCategory:(unsigned int)a6 inAppleStore:(BOOL)a7 isFromFactory:(BOOL)a8 startInterval:(double)a9 firstPluginStartInterval:(double)a10 endInterval:(double)a11
{
  uint64_t v33 = *(void *)&a5;
  uint64_t v34 = *(void *)&a6;
  id v16 = a4;
  pthread_mutex_lock(&self->_recursiveMutex);
  _DMLogFunc();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  CFStringRef v17 = self->_incidents;
  id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)v49;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v49 != v23) {
          objc_enumerationMutation(v17);
        }
        unsigned int v25 = [*(id *)(*((void *)&v48 + 1) + 8 * i) kind];
        switch(v25)
        {
          case 3u:
            uint64_t v21 = (v21 + 1);
            break;
          case 2u:
            uint64_t v22 = (v22 + 1);
            break;
          case 1u:
            uint64_t v20 = (v20 + 1);
            break;
        }
      }
      id v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v19);
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
  }

  id v26 = [v16 objectForKeyedSubscript:@"previousBuildVersion"];
  unsigned int v27 = +[DMUserDataDispositionManager dispositionFlagsFromDispositionDict:v16];
  double fastPluginMigrationDuration = self->_fastPluginMigrationDuration;
  if (v26) {
    unsigned int v29 = (const char *)[v26 UTF8String];
  }
  else {
    unsigned int v29 = "(null)";
  }
  id v32 = v29;
  _DMLogFunc();
  unsigned int v30 = +[DMAnalytics sharedInstance];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10000E894;
  v37[3] = &unk_100024958;
  double v39 = a3;
  int v40 = v22;
  int v41 = v21;
  v37[4] = self;
  id v38 = v26;
  int v42 = v20;
  unsigned int v43 = v27;
  int v44 = v33;
  int v45 = v34;
  BOOL v46 = a7;
  BOOL v47 = a8;
  id v31 = v26;
  [v30 sendLazyEventWithName:@"com.apple.migration.didComplete" payloadBuilder:v37];

  _DMLogFunc();
  pthread_mutex_unlock(&self->_recursiveMutex);
}

- (DMMigrationSentinelManager)migrationSentinelManager
{
  return self->_migrationSentinelManager;
}

- (void)setMigrationSentinelManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationSentinelManager, 0);
  objc_storeStrong(&self->_blockWaitingUntilProgressHostIsReady, 0);
  objc_storeStrong((id *)&self->_migrationSerialQueue, 0);
  objc_storeStrong((id *)&self->_migrationFailureNotificationTransaction, 0);
  objc_storeStrong((id *)&self->_incidents, 0);
  objc_storeStrong((id *)&self->_pluginResults, 0);
  objc_storeStrong((id *)&self->_completedPluginIdentifiers, 0);
  objc_storeStrong((id *)&self->_waitingClientInvocations, 0);
  objc_storeStrong((id *)&self->_migrationPhaseDescriptionsByConcurrentPluginIdentifiers, 0);

  objc_storeStrong((id *)&self->_migrationPhaseDescription, 0);
}

@end