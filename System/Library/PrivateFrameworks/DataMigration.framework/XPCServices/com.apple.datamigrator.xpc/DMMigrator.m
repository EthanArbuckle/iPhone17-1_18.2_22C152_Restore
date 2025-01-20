@interface DMMigrator
+ (id)_dispositionDictFromContext:(id)a3 buildVersion:(id)a4 lastBuildVersion:(id)a5;
+ (id)_userDataDispositionDictionaryWithBuildVersion:(id)a3 lastBuildVersion:(id)a4;
+ (id)mainQueue;
- (BOOL)_canDisplayStatus_progressLocked;
- (BOOL)_performMigrationWithPreliminaryTasks:(id)a3 pluginsProvider:(id)a4 pluginCategories:(unsigned int)a5 userCategory:(unsigned int)a6 buildVersion:(id)a7 lastBuildVersion:(id)a8;
- (BOOL)isMigrationNeeded:(int)a3;
- (DMMigrator)init;
- (NSArray)preliminaryTasksCacheForUnitTesting;
- (NSDictionary)migrationPluginResults;
- (NSString)migrationPhaseDescription;
- (PUIProgressWindow)progressWindow;
- (__MKBAssertion)_unlockKeyBagUseOfForceIsAuthorized;
- (double)_artificialHangTimeIntervalForPlugin:(id)a3;
- (id)_createProgressWindow;
- (id)_pluginAllowedList;
- (id)_userDataDispositionDictionary;
- (id)orderedPluginIdentifiers;
- (id)previousBuildVersion;
- (unsigned)_pluginCategoriesWithEnvironment:(id)a3 lastBuildVersion:(id)a4;
- (unsigned)_userCategoryWithEnvironment:(id)a3;
- (unsigned)userDataDisposition;
- (void)_didReceiveHIDEvent:(id)a3;
- (void)_logReasonWithContext:(id)a3;
- (void)_migrateWithTestMigrationInfrastructureOnly:(BOOL)a3 buildVersion:(id)a4 lastBuildVersion:(id)a5;
- (void)_waitForExecutePluginsSignal_engineerCurrentlyDebuggingMigrationPlugins;
- (void)currentProgressInfo:(id)a3;
- (void)forceMigrationOnNextRebootWithUserDataDisposition:(unsigned int)a3;
- (void)migrateCheckingNecessity:(BOOL)a3 lastRelevantPlugin:(id)a4 testMigrationInfrastructureOnly:(BOOL)a5 connection:(id)a6 migrationResultHandler:(id)a7;
- (void)progressHostIsReady;
- (void)reportMigrationFailure;
- (void)setPreliminaryTasksCacheForUnitTesting:(id)a3;
- (void)setProgressWindow:(id)a3;
- (void)testMigrationUIWithProgress:(BOOL)a3 forceInvert:(BOOL)a4 completion:(id)a5;
@end

@implementation DMMigrator

- (unsigned)userDataDisposition
{
  v2 = [(DMMigrator *)self _userDataDispositionDictionary];
  unsigned int v3 = +[DMUserDataDispositionManager dispositionFlagsFromDispositionDict:v2];

  return v3;
}

- (id)previousBuildVersion
{
  v2 = [(DMMigrator *)self _userDataDispositionDictionary];
  unsigned int v3 = [v2 objectForKeyedSubscript:@"previousBuildVersion"];

  return v3;
}

- (id)_userDataDispositionDictionary
{
  v2 = +[DMEnvironment sharedInstance];
  unsigned int v3 = [v2 buildVersion];

  v4 = +[DMEnvironment sharedInstance];
  v5 = [v4 lastBuildVersionPref];

  v6 = +[DMMigrator _userDataDispositionDictionaryWithBuildVersion:v3 lastBuildVersion:v5];

  return v6;
}

+ (id)_userDataDispositionDictionaryWithBuildVersion:(id)a3 lastBuildVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100030C88 != -1) {
    dispatch_once(&qword_100030C88, &stru_100024BE0);
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_100005360;
  v19 = sub_1000122B0;
  id v20 = 0;
  if (v5)
  {
    v7 = qword_100030C80;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000054C4;
    block[3] = &unk_100024C08;
    v14 = &v15;
    id v12 = v5;
    id v13 = v6;
    dispatch_sync(v7, block);

    v8 = (void *)v16[5];
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (DMMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)DMMigrator;
  v2 = [(DMMigrator *)&v6 init];
  if (v2)
  {
    unsigned int v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    progressLock = v2->_progressLock;
    v2->_progressLock = v3;

    v2->_lastStatusButtonPressTime = 0;
  }
  return v2;
}

- (NSString)migrationPhaseDescription
{
  v2 = +[DMMigrationState sharedInstance];
  unsigned int v3 = [v2 migrationPhaseDescription];

  return (NSString *)v3;
}

- (NSDictionary)migrationPluginResults
{
  v2 = +[DMMigrationState sharedInstance];
  unsigned int v3 = [v2 pluginResults];

  return (NSDictionary *)v3;
}

- (unsigned)_userCategoryWithEnvironment:(id)a3
{
  if ([a3 userSessionIsLoginWindow]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (unsigned)_pluginCategoriesWithEnvironment:(id)a3 lastBuildVersion:(id)a4
{
  id v5 = a3;
  BOOL v6 = ![v5 deviceModeIsSharediPad]
    || [v5 userSessionIsLoginWindow];
  if (((a4 == 0) & [v5 deviceModeIsSharediPad]) != 0) {
    int v7 = 4;
  }
  else {
    int v7 = 2;
  }
  unsigned int v8 = v7 | v6;

  return v8;
}

- (id)_pluginAllowedList
{
  v2 = objc_alloc_init(DMPluginAllowedList);

  return v2;
}

- (void)currentProgressInfo:(id)a3
{
  v4 = (void (**)(id, void *, float))a3;
  [(NSLock *)self->_progressLock lock];
  if (!self->_firstWorkItemStartTimestamp) {
    goto LABEL_23;
  }
  +[DMTimeManager intervalSinceTimestamp:](DMTimeManager, "intervalSinceTimestamp:");
  double v6 = v5;
  float estimatedTotalDuration = self->_estimatedTotalDuration;
  if (v5 <= estimatedTotalDuration)
  {
    double v10 = 0.04 / estimatedTotalDuration + self->_progressFraction;
  }
  else
  {
    double v8 = (float)(estimatedTotalDuration * 3.0);
    if (v6 <= v8)
    {
      double v10 = 0.04 / (float)(estimatedTotalDuration + estimatedTotalDuration) + self->_progressFraction;
    }
    else
    {
      float progressFractionPriorToAsymptoticDecay = self->_progressFractionPriorToAsymptoticDecay;
      if (progressFractionPriorToAsymptoticDecay == 0.0)
      {
        float progressFractionPriorToAsymptoticDecay = self->_progressFraction;
        self->_float progressFractionPriorToAsymptoticDecay = progressFractionPriorToAsymptoticDecay;
      }
      double v10 = progressFractionPriorToAsymptoticDecay
          + (1.0 - progressFractionPriorToAsymptoticDecay) * tanh((v6 - v8) / 3600.0 * 2.5);
    }
  }
  float v11 = v10;
  self->_float progressFraction = v11;
  if ([(DMMigrator *)self _canDisplayStatus_progressLocked])
  {
    if (!self->_statusTimeFormatter)
    {
      id v12 = (NSDateComponentsFormatter *)objc_alloc_init((Class)NSDateComponentsFormatter);
      statusTimeFormatter = self->_statusTimeFormatter;
      self->_statusTimeFormatter = v12;

      [(NSDateComponentsFormatter *)self->_statusTimeFormatter setUnitsStyle:1];
      [(NSDateComponentsFormatter *)self->_statusTimeFormatter setAllowedUnits:224];
    }
    v30 = v4;
    v14 = +[DMEnvironment sharedInstance];
    uint64_t v15 = [v14 buildVersion];
    v16 = [(NSDateComponentsFormatter *)self->_statusTimeFormatter stringFromTimeInterval:v6];
    uint64_t v17 = +[NSString stringWithFormat:@"Internal Only %@\nTotal Migration Time: %@", v15, v16];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v31 = self;
    v18 = self->_currentProgressWorkItems;
    id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v24 = [v23 name];
          v25 = +[NSString stringWithFormat:@"%@\n%@", v17, v24];

          +[DMTimeManager intervalSinceTimestamp:](DMTimeManager, "intervalSinceTimestamp:", [v23 startTimestamp]);
          if (v26 <= 1.0)
          {
            uint64_t v17 = v25;
          }
          else
          {
            v27 = -[NSDateComponentsFormatter stringFromTimeInterval:](v31->_statusTimeFormatter, "stringFromTimeInterval:");
            uint64_t v17 = +[NSString stringWithFormat:@"%@: %@", v25, v27];
          }
        }
        id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v20);
    }

    v4 = v30;
    self = v31;
  }
  else
  {
LABEL_23:
    uint64_t v17 = 0;
  }
  float progressFraction = self->_progressFraction;
  double v29 = progressFraction;
  if (progressFraction > 0.99)
  {
    self->_float progressFraction = 0.99;
    float progressFraction = 0.99;
  }
  [(NSLock *)self->_progressLock unlock];
  v4[2](v4, v17, progressFraction);
}

- (BOOL)_canDisplayStatus_progressLocked
{
  int has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
  {
    if (self->_lastStatusButtonPressTime)
    {
      +[DMTimeManager intervalSinceTimestamp:](DMTimeManager, "intervalSinceTimestamp:");
      LOBYTE(has_internal_content) = v4 <= 30.0;
    }
    else
    {
      LOBYTE(has_internal_content) = 0;
    }
  }
  return has_internal_content;
}

- (void)_logReasonWithContext:(id)a3
{
  uint64_t v3 = [a3 objectForKey:@"Reason"];
  if (!v3)
  {
    double v4 = (void *)_CFCopySystemVersionDictionary();
    double v5 = [v4 objectForKey:_kCFSystemVersionBuildVersionKey];
    id v6 = +[NSString stringWithFormat:@"Migrating for unknown reason with %@", v5];

    uint64_t v3 = (uint64_t)v6;
  }
  id v7 = (id)v3;
  _DMLogFunc();
}

- (void)_waitForExecutePluginsSignal_engineerCurrentlyDebuggingMigrationPlugins
{
  if (qword_100030C70 != -1) {
    dispatch_once(&qword_100030C70, &stru_100024B78);
  }
  _DMLogFunc();
  v2 = _executePluginsSemaphore();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)_performMigrationWithPreliminaryTasks:(id)a3 pluginsProvider:(id)a4 pluginCategories:(unsigned int)a5 userCategory:(unsigned int)a6 buildVersion:(id)a7 lastBuildVersion:(id)a8
{
  id v11 = a3;
  id v98 = a4;
  id v96 = a7;
  id v97 = a8;
  uint64_t v148 = 0;
  v149 = &v148;
  uint64_t v150 = 0x2020000000;
  char v151 = 1;
  id v12 = +[DMMigrationState sharedInstance];
  id v13 = [v98 allPlugins];
  [v12 willRunPlugins:v13];

  v109 = +[DMMigrator _userDataDispositionDictionaryWithBuildVersion:v96 lastBuildVersion:v97];
  -[DMMigrator _logReasonWithContext:](self, "_logReasonWithContext:");
  v95 = +[DMPluginParameters backupDeviceUUIDFromDispositionSupersetOfContext:v109];
  id v103 = [objc_alloc((Class)DMPluginParameters) initWithDispositionSupersetOfContext:v109 backupDeviceUUID:v95];
  _DMLogFunc();
  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  v14 = [v98 allPluginsInRunOrder];
  id v15 = [v14 countByEnumeratingWithState:&v144 objects:v157 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v145;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v145 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v144 + 1) + 8 * i);
        if (objc_msgSend(v18, "existsAndShouldRun", v85))
        {
          v85 = v18;
          _DMLogFunc();
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v144 objects:v157 count:16];
    }
    while (v15);
  }

  id v19 = +[DMEnvironment sharedInstance];
  unsigned int v20 = [v19 waitForExecutePluginsSignalMarkerPref];

  if (v20) {
    [(DMMigrator *)self _waitForExecutePluginsSignal_engineerCurrentlyDebuggingMigrationPlugins];
  }
  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  id v21 = v11;
  id v22 = [v21 countByEnumeratingWithState:&v140 objects:v156 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v141;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v141 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = *(void **)(*((void *)&v140 + 1) + 8 * (void)j);
        double v26 = objc_msgSend(v25, "name", v85);
        [v25 estimatedDurationTimeInterval];
        v87 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        _DMLogFunc();

        objc_msgSend(v25, "estimatedDurationTimeInterval", v26, v87);
        *(float *)&double v27 = v27 + *(float *)&dword_100030C78;
        dword_100030C78 = LODWORD(v27);
      }
      id v22 = [v21 countByEnumeratingWithState:&v140 objects:v156 count:16];
    }
    while (v22);
  }

  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  v28 = [v98 allPluginsInRunOrder];
  id v29 = [v28 countByEnumeratingWithState:&v136 objects:v155 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v137;
    do
    {
      for (k = 0; k != v29; k = (char *)k + 1)
      {
        if (*(void *)v137 != v30) {
          objc_enumerationMutation(v28);
        }
        long long v32 = *(void **)(*((void *)&v136 + 1) + 8 * (void)k);
        if (objc_msgSend(v32, "existsAndShouldRun", v85))
        {
          [v32 timeEstimate];
          double v88 = v33;
          _DMLogFunc();
          objc_msgSend(v32, "timeEstimate", v32, *(void *)&v88);
          *(float *)&dword_100030C78 = v34 + *(float *)&dword_100030C78;
        }
      }
      id v29 = [v28 countByEnumeratingWithState:&v136 objects:v155 count:16];
    }
    while (v29);
  }

  getpid();
  proc_set_cpumon_params();
  double v86 = *(float *)&dword_100030C78;
  _DMLogFunc();
  [(NSLock *)self->_progressLock lock];
  float v35 = *(float *)&dword_100030C78;
  LODWORD(self->_estimatedTotalRemainingDuration) = dword_100030C78;
  self->_float estimatedTotalDuration = v35;
  self->_firstWorkItemStartTimestamp = 0;
  v36 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  currentProgressWorkItems = self->_currentProgressWorkItems;
  self->_currentProgressWorkItems = v36;

  *(void *)&self->_float progressFraction = 0;
  [(NSLock *)self->_progressLock unlock];
  v38 = objc_alloc_init(DMWrapperProcessWatchdogCoordinator);
  v39 = [v98 concurrentPlugins];
  id v108 = [v39 mutableCopy];

  v40 = dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, QOS_CLASS_USER_INITIATED, 0);
  queue = dispatch_queue_create("com.apple.datamigrator.concurrentPluginQueue", v40);

  uint64_t v132 = 0;
  v133 = &v132;
  uint64_t v134 = 0x2020000000;
  char v135 = 0;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id obj = v21;
  id v41 = [obj countByEnumeratingWithState:&v128 objects:v154 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v129;
    do
    {
      for (m = 0; m != v41; m = (char *)m + 1)
      {
        if (*(void *)v129 != v42) {
          objc_enumerationMutation(obj);
        }
        v44 = *(void **)(*((void *)&v128 + 1) + 8 * (void)m);
        v45 = +[DMMigrationState sharedInstance];
        v46 = [v44 name];
        [v45 setMigrationPhaseDescription:v46];

        [(NSLock *)self->_progressLock lock];
        v47 = [DMProgressWorkItem alloc];
        v48 = [v44 name];
        v49 = [(DMProgressWorkItem *)v47 initWithName:v48 startTimestamp:+[DMTimeManager currentTimestamp]];

        [(NSMutableArray *)self->_currentProgressWorkItems addObject:v49];
        if (!*((unsigned char *)v133 + 24)) {
          self->_firstWorkItemStartTimestamp = [(DMProgressWorkItem *)v49 startTimestamp];
        }
        [(NSLock *)self->_progressLock unlock];
        unint64_t v50 = +[DMTimeManager currentTimestamp];
        v51 = [v44 name];
        [v44 estimatedDurationTimeInterval];
        v89 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        _DMLogFunc();

        v52 = objc_msgSend(v44, "workBlock", v51, v89);

        if (v52)
        {
          v53 = [v44 workBlock];
          ((void (**)(void, void *))v53)[2](v53, v109);
        }
        +[DMTimeManager intervalSinceTimestamp:v50];
        double v55 = v54;
        v56 = [v44 name];
        v90 = +[NSNumber numberWithDouble:v55];
        _DMLogFunc();

        [(NSLock *)self->_progressLock lock];
        [v44 estimatedDurationTimeInterval];
        *(float *)&double v57 = self->_estimatedTotalRemainingDuration - v57;
        self->_estimatedTotalRemainingDuration = *(float *)&v57;
        [(NSMutableArray *)self->_currentProgressWorkItems removeObject:v49];
        *((unsigned char *)v133 + 24) = 1;
        [(NSLock *)self->_progressLock unlock];
        v58 = +[DMMigrationState sharedInstance];
        v59 = [v44 telemetryIdentifier];
        [v58 reportTelemetryForPluginIdentifier:v59 duration:0 incident:1 countOfAttempts:v109 userDataDisposition:a6 userCategory:v55];
      }
      id v41 = [obj countByEnumeratingWithState:&v128 objects:v154 count:16];
    }
    while (v41);
  }

  v121[0] = _NSConcreteStackBlock;
  v121[1] = 3221225472;
  v121[2] = sub_1000118B8;
  v121[3] = &unk_100024BA0;
  v121[4] = self;
  v125 = &v132;
  id v94 = v109;
  id v122 = v94;
  id v91 = v103;
  id v123 = v91;
  v92 = v38;
  v124 = v92;
  v126 = &v148;
  unsigned int v127 = a6;
  v110 = objc_retainBlock(v121);
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v99 = [v98 serialPluginsInRunOrder];
  id v101 = [v99 countByEnumeratingWithState:&v117 objects:v153 count:16];
  if (v101)
  {
    uint64_t v100 = *(void *)v118;
    do
    {
      for (n = 0; n != v101; n = (char *)n + 1)
      {
        if (*(void *)v118 != v100) {
          objc_enumerationMutation(v99);
        }
        v60 = *(void **)(*((void *)&v117 + 1) + 8 * (void)n);
        ((void (*)(void *, void *))v110[2])(v110, v60);
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        id v61 = [v108 copy];
        id v62 = [v61 countByEnumeratingWithState:&v113 objects:v152 count:16];
        if (v62)
        {
          uint64_t v63 = *(void *)v114;
          do
          {
            for (ii = 0; ii != v62; ii = (char *)ii + 1)
            {
              if (*(void *)v114 != v63) {
                objc_enumerationMutation(v61);
              }
              v65 = *(void **)(*((void *)&v113 + 1) + 8 * (void)ii);
              v66 = [v65 identifierOfDependency];
              v67 = [v60 identifier];
              unsigned int v68 = [v66 isEqualToString:v67];

              if (v68)
              {
                _DMLogFunc();
                objc_msgSend(v108, "removeObject:", v65, v65);
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472;
                block[2] = sub_100011DE4;
                block[3] = &unk_100024880;
                v69 = v110;
                void block[4] = v65;
                id v112 = v69;
                dispatch_async(queue, block);
              }
            }
            id v62 = [v61 countByEnumeratingWithState:&v113 objects:v152 count:16];
          }
          while (v62);
        }
      }
      id v101 = [v99 countByEnumeratingWithState:&v117 objects:v153 count:16];
    }
    while (v101);
  }

  _DMLogFunc();
  dispatch_barrier_sync(queue, &stru_100024BC0);
  getpid();
  proc_set_cpumon_defaults();
  unint64_t v70 = +[DMTimeManager currentTimestamp];
  v71 = +[DMMigrationState sharedInstance];
  +[DMTimeManager intervalSinceTimestamp:self->_firstWorkItemStartTimestamp];
  double v73 = v72;
  v74 = +[DMEnvironment sharedInstance];
  id v75 = [v74 inAppleStore];
  v76 = +[DMEnvironment sharedInstance];
  id v77 = [v76 isFromFactory];
  +[DMTimeManager intervalFromStart:0 toEnd:self->_migrationStartTimestamp];
  double v79 = v78;
  +[DMTimeManager intervalFromStart:0 toEnd:self->_firstWorkItemStartTimestamp];
  double v81 = v80;
  +[DMTimeManager intervalFromStart:0 toEnd:v70];
  [v71 reportTelemetryWithMigrationDuration:v94 userDataDisposition:a5 pluginCategories:a6 userCategory:v75 inAppleStore:v77 isFromFactory:v73 startInterval:v79 firstPluginStartInterval:v81 endInterval:v82];

  v83 = +[DMMigrationState sharedInstance];
  [v83 persistIfNecessary];

  LOBYTE(v71) = *((unsigned char *)v149 + 24) != 0;
  _Block_object_dispose(&v132, 8);

  _Block_object_dispose(&v148, 8);
  return (char)v71;
}

- (double)_artificialHangTimeIntervalForPlugin:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  if (os_variant_has_internal_content())
  {
    double v5 = +[DMEnvironment sharedInstance];
    if ([v5 shouldImposePluginArtificialHang])
    {
      id v6 = [v3 identifier];
      unsigned int v7 = [v6 isEqualToString:@"com.apple.MobileInstallation.SystemAppMigrator"];

      if (v7)
      {
        [v3 setTimeIntervalBeforeWatchdog:0.0];
        [v3 setTimeIntervalBeforeReboot:60.0];
        [v3 timeIntervalBeforeReboot];
        double v4 = v8 + 60.0;
      }
    }
    else
    {
    }
  }

  return v4;
}

- (__MKBAssertion)_unlockKeyBagUseOfForceIsAuthorized
{
  v2 = (__MKBAssertion *)MKBDeviceLockAssertionConsume();
  uint64_t v10 = (uint64_t)v2;
  _DMLogFunc();
  uint64_t v3 = MKBKeyBagKeyStashLoad();
  int v4 = v3;
  if (v3) {
    uint64_t v10 = v3;
  }
  _DMLogFunc();
  int v5 = MKBGetDeviceLockState();
  if (v4 && v5 != 3 && v5)
  {
    id v6 = +[DMMigrationState sharedInstance];
    [v6 setMigrationPhaseDescription:@"Waiting for user unlock"];

    _DMLogFunc();
    id v7 = [objc_alloc((Class)BKSAlternateSystemApp) initWithBundleId:@"com.apple.PreBoard"];
    double v8 = objc_alloc_init(MigratorAlternateAppDelegate);
    [v7 setDelegate:v8];
    [v7 activate];
    [(MigratorAlternateAppDelegate *)v8 waitUntilPreboardDidFinishUnlock];
    _DMLogFunc();
    id v11 = +[NSNumber numberWithInt:MKBKeyBagKeyStashLoad()];
    _DMLogFunc();

    objc_msgSend(v7, "terminate", v11);
    [v7 setDelegate:0];
    _DMLogFunc();
  }
  return v2;
}

- (BOOL)isMigrationNeeded:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v4 = +[DMEnvironment sharedInstance];
  unsigned int v5 = [v4 isDeviceUsingEphemeralStorage];

  if (v5)
  {
    _DMLogFunc();
    return 0;
  }
  else
  {
    id v7 = +[DMEnvironment sharedInstance];
    double v8 = [v7 buildVersion];

    id v9 = +[DMEnvironment sharedInstance];
    uint64_t v10 = [v9 lastBuildVersionPref];

    id v11 = +[DMMigrationState sharedInstance];
    unsigned __int8 v12 = [v11 isMigrationNeededWithBuildVersion:v8 lastBuildVersion:v10 clientPID:v3];

    return v12;
  }
}

+ (id)_dispositionDictFromContext:(id)a3 buildVersion:(id)a4 lastBuildVersion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  if (v8 && v9) {
    uint64_t v11 = +[DMEnvironment isBuildVersion:v8 equalToBuildVersion:v9] ^ 1;
  }
  if (!v7 || v11) {
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
  }
  else {
    id v12 = [v7 mutableCopy];
  }
  id v13 = v12;
  v14 = +[NSNumber numberWithBool:v11];
  [v13 setValue:v14 forKey:@"SyntheticDidUpgrade"];

  [v13 setValue:v8 forKey:@"buildVersion"];
  if (v10) {
    [v13 setValue:v10 forKey:@"previousBuildVersion"];
  }
  id v15 = [v13 copy];

  return v15;
}

- (void)reportMigrationFailure
{
  v2 = +[DMEnvironment sharedInstance];
  id v4 = [v2 continuousIntegrationMarkerPref];

  if (v4)
  {
    _DMLogFunc();
  }
  else
  {
    uint64_t v3 = +[DMMigrationState sharedInstance];
    [v3 setNeedsMigrationFailureReport];
  }
}

+ (id)mainQueue
{
  id v2 = &_dispatch_main_q;
  return &_dispatch_main_q;
}

- (void)migrateCheckingNecessity:(BOOL)a3 lastRelevantPlugin:(id)a4 testMigrationInfrastructureOnly:(BOOL)a5 connection:(id)a6 migrationResultHandler:(id)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = (void (**)(id, uint64_t))a7;
  id v15 = +[DMEnvironment sharedInstance];
  unsigned int v16 = [v15 isDeviceUsingEphemeralStorage];

  if (v16)
  {
    _DMLogFunc();
    v14[2](v14, 2);
  }
  else
  {
    uint64_t v17 = objc_alloc_init(DMClientInvocation);
    [(DMClientInvocation *)v17 setConnection:v13];
    [(DMClientInvocation *)v17 setCheckNecessity:v10];
    [(DMClientInvocation *)v17 setEarlyResultsPluginIdentifier:v12];
    [(DMClientInvocation *)v17 setResultsHandler:v14];

    v18 = +[DMEnvironment sharedInstance];
    id v19 = [v18 buildVersion];

    unsigned int v20 = +[DMMigrationState sharedInstance];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100012554;
    v22[3] = &unk_100024C30;
    BOOL v24 = a5;
    v22[4] = self;
    id v23 = v19;
    id v21 = v19;
    [v20 startMigrationAndOrBlockIfNecessaryWithClientInvocation:v17 buildVersion:v21 migrationStarterBlock:v22];

    v14 = (void (**)(id, uint64_t))v17;
  }
}

- (void)_migrateWithTestMigrationInfrastructureOnly:(BOOL)a3 buildVersion:(id)a4 lastBuildVersion:(id)a5
{
  BOOL v58 = a3;
  id v61 = a4;
  id v63 = a5;
  id v7 = +[DMEnvironment sharedInstance];
  unsigned int v55 = [(DMMigrator *)self _userCategoryWithEnvironment:v7];

  self->_migrationStartTimestamp = +[DMTimeManager currentTimestamp];
  id v8 = +[DMMigrationState sharedInstance];
  [v8 willStartMigration];

  id v9 = +[DMMigrationState sharedInstance];
  [v9 setMigrationPhaseDescription:@"Preparing to migrate"];

  _DMLogFunc();
  cf = [(DMMigrator *)self _unlockKeyBagUseOfForceIsAuthorized];
  id v10 = objc_alloc_init((Class)DMMigrationDeferredExitManager);
  [v10 migrationDidStart];

  uint64_t v11 = +[DMEnvironment sharedInstance];
  id v62 = +[DMRebootAnalyticsUploader createRebootAnalyticsUploaderIfAppropriateWithEnvironment:v11];

  [v62 start];
  id v12 = +[DMMigrationState sharedInstance];
  [v12 setMigrationPhaseDescription:@"Gathering plugins"];

  double v57 = +[DMPluginFileSystemRep allReps];
  id v13 = +[DMEnvironment sharedInstance];
  uint64_t v14 = [(DMMigrator *)self _pluginCategoriesWithEnvironment:v13 lastBuildVersion:v63];

  id v15 = [DMPluginsProvider alloc];
  unsigned int v16 = [(DMMigrator *)self _pluginAllowedList];
  v56 = [(DMPluginsProvider *)v15 initWithReps:v57 categories:v14 pluginAllowedList:v16];

  id v54 = [v57 count];
  if (v54)
  {
    uint64_t v17 = +[DMMigrationState sharedInstance];
    [v17 blockUntilProgressHostIsReadyWithTimeoutTimeInterval:60.0];

    id location = 0;
    p_id location = (uint64_t)&location;
    uint64_t v73 = 0x3032000000;
    v74 = sub_100005360;
    id v75 = sub_1000122B0;
    id v76 = 0;
    _DMLogFunc();
    v18 = +[DMMigrator mainQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013024;
    block[3] = &unk_100024C58;
    void block[4] = self;
    void block[5] = &location;
    dispatch_sync(v18, block);

    if (*(void *)(p_location + 40))
    {
      v60 = +[DMIncident incidentWithKind:responsiblePluginRep:userDataDisposition:details:](DMIncident, "incidentWithKind:responsiblePluginRep:userDataDisposition:details:", 5, 0, 0);
      id v19 = +[DMDiagnostics sharedInstance];
      [v19 captureDiagnosticsForIncident:v60 async:1];

      unsigned int v20 = +[DMMigrationState sharedInstance];
      [v20 progressWindowHadIncident:v60];
    }
    else
    {
      v60 = 0;
    }
    _Block_object_dispose(&location, 8);
  }
  else
  {
    _DMLogFunc();
    v60 = 0;
  }
  id v21 = +[DMMigrator mainQueue];
  id v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v21);

  dispatch_source_set_timer(v22, 0, 0x5F5E100uLL, 0x5F5E100uLL);
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  int v69 = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100013124;
  handler[3] = &unk_100024C58;
  handler[4] = self;
  handler[5] = v68;
  dispatch_source_set_event_handler(v22, handler);
  [(NSLock *)self->_progressLock lock];
  self->_firstWorkItemStartTimestamp = 0;
  [(NSLock *)self->_progressLock unlock];
  dispatch_resume(v22);
  uint64_t v77 = 0;
  double v78 = &v77;
  uint64_t v79 = 0x2050000000;
  id v23 = (void *)qword_100030C90;
  uint64_t v80 = qword_100030C90;
  if (!qword_100030C90)
  {
    id location = _NSConcreteStackBlock;
    p_id location = 3221225472;
    uint64_t v73 = (uint64_t)sub_100013B48;
    v74 = (uint64_t (*)(uint64_t, uint64_t))&unk_100024790;
    id v75 = (void (*)(uint64_t))&v77;
    sub_100013B48((uint64_t)&location);
    id v23 = (void *)v78[3];
  }
  BOOL v24 = v23;
  _Block_object_dispose(&v77, 8);
  id v25 = [[v24 alloc] initWithType:1];
  double v26 = v25;
  if (v25)
  {
    [v25 setMatching:&off_100028DA8];
    double v27 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v28 = dispatch_queue_create("com.apple.datamigrator.hidEventQueue", v27);
    [v26 setDispatchQueue:v28];

    objc_initWeak(&location, self);
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_100013240;
    v65[3] = &unk_100024CA8;
    objc_copyWeak(&v66, &location);
    [v26 setEventHandler:v65];
    [v26 activate];
    _DMLogFunc();
    objc_destroyWeak(&v66);
    objc_destroyWeak(&location);
  }
  else
  {
    _DMLogFunc();
  }
  if (v58)
  {
    id v29 = +[DMEnvironment sharedInstance];
    [v29 setTestMigrationInfrastructureOnly:1];
  }
  uint64_t v30 = +[DMEnvironment sharedInstance];
  v31 = +[DMUserVolumeMigrationTask createTaskIfAppropriateWithEnvironment:v30];

  if (v31)
  {
    long long v32 = [&__NSArray0__struct arrayByAddingObject:v31];
  }
  else
  {
    long long v32 = &__NSArray0__struct;
  }
  float v33 = +[DMEnvironment sharedInstance];
  float v34 = +[DMLoggingTask createTaskIfAppropriateWithEnvironment:v33 lastBuildVersion:v63];

  if (v34)
  {
    uint64_t v35 = [v32 arrayByAddingObject:v34];

    long long v32 = (void *)v35;
  }
  v36 = +[DMEnvironment sharedInstance];
  v37 = +[DMLockdownModeTask createTaskIfAppropriateWithEnvironment:v36];

  if (v37)
  {
    uint64_t v38 = [v32 arrayByAddingObject:v37];

    long long v32 = (void *)v38;
  }
  [(DMMigrator *)self setPreliminaryTasksCacheForUnitTesting:v32];
  BOOL v39 = [(DMMigrator *)self _performMigrationWithPreliminaryTasks:v32 pluginsProvider:v56 pluginCategories:v14 userCategory:v55 buildVersion:v61 lastBuildVersion:v63];
  if (v60)
  {
    _DMLogFunc();
    BOOL v40 = 0;
  }
  else
  {
    BOOL v40 = v39;
  }
  if (v58)
  {
    id v41 = +[DMEnvironment sharedInstance];
    [v41 setTestMigrationInfrastructureOnly:0];
  }
  uint64_t v42 = +[DMEnvironment sharedInstance];
  [v42 clearContext];

  [v62 waitForCompletionWithTimeoutTimeInterval:60.0];
  if (v26) {
    [v26 cancel];
  }
  dispatch_source_cancel(v22);
  if (v54)
  {
    v43 = +[DMMigrator mainQueue];
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_10001329C;
    v64[3] = &unk_100024768;
    v64[4] = self;
    dispatch_sync(v43, v64);
  }
  v44 = +[DMMigrationState sharedInstance];
  [v44 setMigrationPhaseDescription:@"Notifying clients of completion"];

  v45 = +[DMMigrationState sharedInstance];
  [v45 sendMigrationResultsToClientInvocationsWithSuccess:v40 buildVersion:v61];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.datamigrator.migrationDidFinish", 0, 0, 0);
  id v47 = objc_alloc_init((Class)DMMigrationDeferredExitManager);
  [v47 migrationDidEnd];

  _DMLogFunc();
  v48 = [(DMMigrator *)self progressWindow];
  [v48 setVisible:0];

  [(DMMigrator *)self setProgressWindow:0];
  v49 = +[DMMigrationState sharedInstance];
  [v49 setMigrationPhaseDescription:0];

  if (cf)
  {
    v52 = cf;
    _DMLogFunc();
    CFRelease(cf);
  }
  unint64_t v50 = +[DMEnvironment sharedInstance];
  unsigned __int8 v51 = [v50 deviceModeIsSharediPad];

  if ((v51 & 1) == 0)
  {
    CFStringRef v81 = @"LockDeviceNow";
    CFBooleanRef v82 = kCFBooleanTrue;
    +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    v53 = +[NSNumber numberWithInt:MKBLockDevice()];
    _DMLogFunc();
  }
  _Block_object_dispose(v68, 8);
}

- (id)_createProgressWindow
{
  id v2 = objc_alloc((Class)PUIProgressWindow);
  LODWORD(v3) = kPUIDefaultContextLevel;
  id v4 = [v2 initWithOptions:5 contextLevel:0 appearance:v3];

  return v4;
}

- (void)_didReceiveHIDEvent:(id)a3
{
  id v6 = a3;
  if (IOHIDEventGetType() == 3 && IOHIDEventGetIntegerValue())
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    if (IntegerValue > 232)
    {
      if ((unint64_t)(IntegerValue - 233) > 1) {
        goto LABEL_10;
      }
    }
    else if (IntegerValue != 48 && IntegerValue != 64 && IntegerValue != 149)
    {
      goto LABEL_10;
    }
    uint64_t v5 = IntegerValue;
    _DMLogFunc();
    [(NSLock *)self->_progressLock lock];
    self->_lastStatusButtonPressTime = +[DMTimeManager currentTimestamp];
    [(NSLock *)self->_progressLock unlock];
  }
LABEL_10:
}

- (void)progressHostIsReady
{
  id v2 = +[DMMigrationState sharedInstance];
  [v2 progressHostIsReady];
}

- (id)orderedPluginIdentifiers
{
  double v3 = +[DMPluginFileSystemRep allReps];
  id v4 = +[DMEnvironment sharedInstance];
  uint64_t v5 = +[DMEnvironment sharedInstance];
  id v6 = [v5 lastBuildVersionPref];
  uint64_t v7 = [(DMMigrator *)self _pluginCategoriesWithEnvironment:v4 lastBuildVersion:v6];

  id v8 = [DMPluginsProvider alloc];
  id v9 = [(DMMigrator *)self _pluginAllowedList];
  id v10 = [(DMPluginsProvider *)v8 initWithReps:v3 categories:v7 pluginAllowedList:v9];

  uint64_t v11 = [(DMPluginsProvider *)v10 allPluginsInRunOrder];
  id v12 = [v11 indexesOfObjectsPassingTest:&stru_100024CE8];
  id v13 = [v11 objectsAtIndexes:v12];

  uint64_t v14 = [v13 valueForKey:@"description"];

  return v14;
}

- (void)testMigrationUIWithProgress:(BOOL)a3 forceInvert:(BOOL)a4 completion:(id)a5
{
  uint64_t v7 = (void (**)(void))a5;
  _DMLogFunc();
  uint64_t v23 = 0;
  BOOL v24 = &v23;
  uint64_t v25 = 0x3032000000;
  double v26 = sub_100005360;
  double v27 = sub_1000122B0;
  id v28 = 0;
  if (objc_opt_class())
  {
    id v8 = +[DMMigrator mainQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000138A0;
    block[3] = &unk_100024D10;
    void block[4] = &v23;
    BOOL v21 = a3;
    BOOL v22 = a4;
    dispatch_sync(v8, block);
  }
  unint64_t v9 = +[DMTimeManager currentTimestamp];
  float v10 = 0.0;
  do
  {
    uint64_t v11 = +[DMMigrator mainQueue];
    dispatch_sync(v11, &stru_100024D30);

    +[DMTimeManager intervalSinceTimestamp:v9];
    double v13 = v12;
    float v14 = v12 / 15.0;
    if (v10 != v14)
    {
      id v15 = +[DMMigrator mainQueue];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100013960;
      v18[3] = &unk_100024D58;
      v18[4] = &v23;
      float v19 = v14;
      dispatch_sync(v15, v18);

      float v10 = v14;
    }
  }
  while (v13 < 15.0);
  unsigned int v16 = +[DMMigrator mainQueue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100013978;
  v17[3] = &unk_100024790;
  v17[4] = &v23;
  dispatch_sync(v16, v17);

  [(id)v24[5] setVisible:0];
  v7[2](v7);
  _Block_object_dispose(&v23, 8);
}

- (void)forceMigrationOnNextRebootWithUserDataDisposition:(unsigned int)a3
{
  if ((a3 & 2) != 0)
  {
    _DMLogFunc();
    id v4 = +[DMEnvironment sharedInstance];
    [v4 setLastBuildVersionPref:@"1A999"];

    double v3 = +[DMEnvironment sharedInstance];
    [v3 setUserDataDispositionPref:0];
  }
  else
  {
    _DMLogFunc();
    double v3 = +[DMEnvironment sharedInstance];
    [v3 setLastBuildVersionPref:0];
  }

  uint64_t v5 = +[DMEnvironment sharedInstance];
  [v5 setLastMigrationResultsPref:0];

  id v6 = +[DMEnvironment sharedInstance];
  [v6 blockUntilPreferencesFlush];
}

- (PUIProgressWindow)progressWindow
{
  return self->_progressWindow;
}

- (void)setProgressWindow:(id)a3
{
}

- (NSArray)preliminaryTasksCacheForUnitTesting
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPreliminaryTasksCacheForUnitTesting:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preliminaryTasksCacheForUnitTesting, 0);
  objc_storeStrong((id *)&self->_progressWindow, 0);
  objc_storeStrong((id *)&self->_statusTimeFormatter, 0);
  objc_storeStrong((id *)&self->_currentProgressWorkItems, 0);

  objc_storeStrong((id *)&self->_progressLock, 0);
}

@end