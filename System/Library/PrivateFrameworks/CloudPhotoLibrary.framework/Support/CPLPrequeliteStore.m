@interface CPLPrequeliteStore
+ (BOOL)shouldDoCleanUpImmediately;
+ (BOOL)shouldPreventWipeOnUpgrade;
+ (BOOL)shouldWarnUserBeforeWipeOnUpgrade;
+ (id)_wipeStoreMarkerURLWithCloudLibraryStateStorageURL:(id)a3;
+ (void)_writeStoreMarkerAtURL:(id)a3 reason:(id)a4;
+ (void)setShouldDoCleanUpImmediately:(BOOL)a3;
+ (void)setShouldPreventWipeOnUpgrade:(BOOL)a3;
+ (void)setShouldWarnUserBeforeWipeOnUpgrade:(BOOL)a3;
+ (void)wipeStoreAtNextOpeningWithCloudLibraryStorageURL:(id)a3 reason:(id)a4;
- (BOOL)_closeWipeAndReOpenWithReason:(id)a3 warnUserIfPossible:(BOOL)a4 createRadar:(BOOL)a5 error:(id *)a6;
- (BOOL)_fix22666940;
- (BOOL)_fixStoreAfterAnyVersionChange;
- (BOOL)_hasDeactivateMarker;
- (BOOL)_initializeDB;
- (BOOL)_openWithError:(id *)a3;
- (BOOL)_performWithFlags:(unsigned int)a3 action:(id)a4;
- (BOOL)_postUpgradeToVersion:(int64_t)a3;
- (BOOL)_setupDBIfNeeded;
- (BOOL)_setupPragmasAndFunctions;
- (BOOL)_upgradeDB:(int64_t)a3;
- (BOOL)_upgradeToVersion:(int64_t)a3;
- (BOOL)_wipeIfDeactivated:(int64_t)a3 didWipeDatabase:(BOOL *)a4 error:(id *)a5;
- (BOOL)addGlobalVariable:(id)a3 defaultValue:(id)a4 error:(id *)a5;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)createStoragesDynamically:(id)a3 error:(id *)a4;
- (BOOL)deleteDynamicallyCreatedStorages:(id)a3 error:(id *)a4;
- (BOOL)executePostOpenWithError:(id *)a3;
- (BOOL)hasStoredChangeSessionUpdate;
- (BOOL)hasTable:(id)a3;
- (BOOL)isClientInSyncWithClientCache;
- (BOOL)markDatabaseAsDeactivatedWithError:(id *)a3;
- (BOOL)openWithError:(id *)a3;
- (BOOL)performPostUpgradeMigrationsWithError:(id *)a3;
- (BOOL)resetValueForGlobalVariable:(id)a3 error:(id *)a4;
- (BOOL)setShouldUpdateDisabledFeaturesWithError:(id *)a3;
- (BOOL)setValue:(id)a3 forGlobalVariable:(id)a4 error:(id *)a5;
- (BOOL)shouldUpdateDisabledFeatures;
- (BOOL)storeChangeSessionUpdate:(id)a3 error:(id *)a4;
- (BOOL)storeClientCacheIdentifier:(id)a3 error:(id *)a4;
- (BOOL)storeClientIsInSyncWithClientCacheWithError:(id *)a3;
- (BOOL)storeClientIsNotInSyncWithClientCacheWithError:(id *)a3;
- (BOOL)storeDerivativesFilter:(id)a3 error:(id *)a4;
- (BOOL)storeDisabledFeatures:(id)a3 error:(id *)a4;
- (BOOL)storeLastQuarantineCountReportDate:(id)a3 error:(id *)a4;
- (BOOL)storeLibraryVersion:(id)a3 withError:(id *)a4;
- (BOOL)storePushPullGatekeepers:(id)a3 error:(id *)a4;
- (BOOL)storeUserIdentifier:(id)a3 error:(id *)a4;
- (BOOL)table:(id)a3 hasColumnWithName:(id)a4;
- (BOOL)table:(id)a3 hasRecordsMatchingQuery:(id)a4;
- (BOOL)tableHasRecords:(id)a3;
- (BOOL)updateLibraryOptions:(unint64_t)a3 error:(id *)a4;
- (CPLChangeSessionUpdate)storedChangeSessionUpdate;
- (CPLPrequeliteStore)initWithAbstractObject:(id)a3;
- (Class)_userIdentifierClass;
- (NSArray)pushPullGatekeepers;
- (NSDate)libraryCreationDate;
- (NSString)description;
- (NSURL)deactivateMarkerURL;
- (id)_corruptionMarkerURL;
- (id)_transactionStatsDescription;
- (id)_wipeReasonFromCorruptionInfo:(id)a3;
- (id)_wipeStoreMarkerURL;
- (id)clientCache;
- (id)clientCacheIdentifier;
- (id)cloudCache;
- (id)corruptionInfo;
- (id)createNewClientCacheIdentifier;
- (id)createNewLibraryVersion;
- (id)derivativesFilter;
- (id)disabledFeatures;
- (id)lastQuarantineCountReportDate;
- (id)libraryVersion;
- (id)pqlConnection;
- (id)redactedDescription;
- (id)status;
- (id)transientPullRepository;
- (id)userIdentifier;
- (id)valueForGlobalVariable:(id)a3;
- (id)wipeReason;
- (int64_t)_sizeInBytes;
- (unint64_t)libraryOptions;
- (unint64_t)table:(id)a3 countOfRecordsMatchingQuery:(id)a4;
- (unint64_t)tableCountOfRecords:(id)a3;
- (void)_addPostUpgradeMigration:(id)a3;
- (void)_cacheValue:(id)a3 forVariable:(id)a4;
- (void)_closeUpgradeJournal;
- (void)_deleteCorruptionInfo;
- (void)_deleteWipeReason;
- (void)_markLibraryAsCorruptedWithInfo:(id)a3;
- (void)_notifyVacuumDidComplete;
- (void)_openUpgradeJournal;
- (void)_scheduleClientCacheDrop;
- (void)_scheduleClientCacheDropIfNecessary;
- (void)_setupProfilingHooks;
- (void)_unsetupProfilingHooks;
- (void)_vacuum:(int64_t)a3 withInitialDatabaseSize:(int64_t)a4;
- (void)_wipeBeforeOpeningIfNecessary;
- (void)_wipeWithReason:(id)a3;
- (void)blockWriteTransactionsWithCompletionHandler:(id)a3;
- (void)emergencyClose;
- (void)markAsCorrupted;
- (void)performBarrier;
- (void)performBarrierTransaction:(id)a3 withBlock:(id)a4;
- (void)performReadTransaction:(id)a3 withBlock:(id)a4;
- (void)performWriteTransaction:(id)a3 withBlock:(id)a4 completionHandler:(id)a5;
- (void)recordUpgradeEvent:(id)a3;
- (void)recordUpgradeEvent:(id)a3 arguments:(char *)a4;
- (void)startVacuumWithCompletionHandler:(id)a3;
- (void)stopVacuum;
- (void)table:(id)a3 enumerateCountGroupedByProperty:(id)a4 block:(id)a5;
- (void)table:(id)a3 enumerateCountGroupedByUnsignedIntegerProperty:(id)a4 block:(id)a5;
- (void)triggerResetAfterUpgrade:(unint64_t)a3 withReason:(id)a4;
- (void)wipeStoreAtNextOpeningWithReason:(id)a3 completionBlock:(id)a4;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLPrequeliteStore

- (void)_addPostUpgradeMigration:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (!self->_postUpgradeMigrations)
  {
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    postUpgradeMigrations = self->_postUpgradeMigrations;
    self->_postUpgradeMigrations = v5;

    id v4 = v8;
  }
  v7 = [v4 migrationDescription];
  [(CPLPrequeliteStore *)self recordUpgradeEvent:@"Will need to perform %@", v7];

  [(NSMutableArray *)self->_postUpgradeMigrations addObject:v8];
}

+ (BOOL)shouldPreventWipeOnUpgrade
{
  int has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
  {
    if ((byte_1002DBFA8 & 1) == 0)
    {
      id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobileslideshow"];
      byte_1002DBFA9 = [v3 BOOLForKey:@"com.apple.Photos.PreventRebuild"];
      byte_1002DBFA8 = 1;
    }
    LOBYTE(has_internal_content) = byte_1002DBFA9 != 0;
  }
  return has_internal_content;
}

+ (void)setShouldPreventWipeOnUpgrade:(BOOL)a3
{
  byte_1002DBFA9 = a3;
  byte_1002DBFA8 = 1;
}

+ (BOOL)shouldWarnUserBeforeWipeOnUpgrade
{
  return byte_1002DBFAA;
}

+ (void)setShouldWarnUserBeforeWipeOnUpgrade:(BOOL)a3
{
  byte_1002DBFAA = a3;
}

+ (void)setShouldDoCleanUpImmediately:(BOOL)a3
{
  byte_1002DBFAB = a3;
}

+ (BOOL)shouldDoCleanUpImmediately
{
  return byte_1002DBFAB;
}

- (CPLPrequeliteStore)initWithAbstractObject:(id)a3
{
  v77.receiver = self;
  v77.super_class = (Class)CPLPrequeliteStore;
  id v3 = [(CPLPrequeliteStore *)&v77 initWithAbstractObject:a3];
  id v4 = v3;
  if (v3)
  {
    v5 = [(CPLPrequeliteStore *)v3 abstractObject];
    v6 = [v5 engineLibrary];
    v7 = [v6 cloudLibraryStateStorageURL];

    id v8 = [v7 URLByAppendingPathComponent:@"store.cloudphotodb" isDirectory:0];
    v9 = (NSURL *)[v8 copy];
    dbURL = v4->_dbURL;
    v4->_dbURL = v9;

    v11 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.cplenginestore.sqlite", v11);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v12;

    v14 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v15 = dispatch_queue_create_with_target_V2("com.apple.cplenginestore.sqlite.write", v14, (dispatch_queue_t)v4->_queue);
    writeQueue = v4->_writeQueue;
    v4->_writeQueue = (OS_dispatch_queue *)v15;

    v4->_emergencyCloseLock._os_unfair_lock_opaque = 0;
    v17 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.cplenginestore.sqlite.vacuum", v17);
    vacuumQueue = v4->_vacuumQueue;
    v4->_vacuumQueue = (OS_dispatch_queue *)v18;

    v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    modifiedVariables = v4->_modifiedVariables;
    v4->_modifiedVariables = v20;

    id v22 = objc_alloc_init((Class)NSObject);
    id globalVariableCacheIdentifier = v4->_globalVariableCacheIdentifier;
    v4->_id globalVariableCacheIdentifier = v22;

    uint64_t v24 = +[CPLPrequeliteTable tableWithName:@"globals"];
    globals = v4->_globals;
    v4->_globals = (CPLPrequeliteTable *)v24;

    v26 = +[CPLPrequeliteType stringType];
    uint64_t v27 = +[CPLPrequeliteVariable variableWithName:@"libraryVersion" type:v26];
    libraryVersionVar = v4->_libraryVersionVar;
    v4->_libraryVersionVar = (CPLPrequeliteVariable *)v27;

    v29 = +[CPLPrequeliteType dataType];
    uint64_t v30 = +[CPLPrequeliteVariable variableWithName:@"userIdentifier" type:v29];
    userIdentifierVar = v4->_userIdentifierVar;
    v4->_userIdentifierVar = (CPLPrequeliteVariable *)v30;

    v32 = +[CPLPrequeliteType dateType];
    uint64_t v33 = +[CPLPrequeliteVariable variableWithName:@"lastQuarantineCountReportDate" type:v32];
    lastQuarantineCountReportDateVar = v4->_lastQuarantineCountReportDateVar;
    v4->_lastQuarantineCountReportDateVar = (CPLPrequeliteVariable *)v33;

    v35 = +[CPLPrequeliteType stringType];
    uint64_t v36 = +[CPLPrequeliteVariable variableWithName:@"clientCacheIdentifier" type:v35];
    clientCacheIdentifierVar = v4->_clientCacheIdentifierVar;
    v4->_clientCacheIdentifierVar = (CPLPrequeliteVariable *)v36;

    v38 = +[CPLPrequeliteType stringType];
    uint64_t v39 = +[CPLPrequeliteVariable variableWithName:@"clientCacheIdentifierClientSide" type:v38];
    clientCacheIdentifierAsKnownByClient = v4->_clientCacheIdentifierAsKnownByClient;
    v4->_clientCacheIdentifierAsKnownByClient = (CPLPrequeliteVariable *)v39;

    v41 = +[CPLPrequeliteType dateType];
    uint64_t v42 = +[CPLPrequeliteVariable variableWithName:@"libraryCreationDate" type:v41];
    libraryCreationDateVar = v4->_libraryCreationDateVar;
    v4->_libraryCreationDateVar = (CPLPrequeliteVariable *)v42;

    v44 = +[CPLPrequeliteType dataType];
    uint64_t v45 = +[CPLPrequeliteVariable variableWithName:@"changeSessionUpdate" type:v44];
    changeSessionUpdateVar = v4->_changeSessionUpdateVar;
    v4->_changeSessionUpdateVar = (CPLPrequeliteVariable *)v45;

    v47 = +[CPLPrequeliteType dataType];
    uint64_t v48 = +[CPLPrequeliteVariable variableWithName:@"pushPullGatekeeper" type:v47];
    pushPullGatekeepersVar = v4->_pushPullGatekeepersVar;
    v4->_pushPullGatekeepersVar = (CPLPrequeliteVariable *)v48;

    v50 = +[CPLPrequeliteType integerType];
    uint64_t v51 = +[CPLPrequeliteVariable variableWithName:@"libraryOptions" type:v50];
    libraryOptionsVar = v4->_libraryOptionsVar;
    v4->_libraryOptionsVar = (CPLPrequeliteVariable *)v51;

    v53 = +[CPLPrequeliteType integerType];
    uint64_t v54 = +[CPLPrequeliteVariable variableWithName:@"shouldUpdateDisabledFeatures" type:v53];
    shouldUpdateDisabledFeaturesVar = v4->_shouldUpdateDisabledFeaturesVar;
    v4->_shouldUpdateDisabledFeaturesVar = (CPLPrequeliteVariable *)v54;

    v56 = +[CPLPrequeliteType dataType];
    uint64_t v57 = +[CPLPrequeliteVariable variableWithName:@"disabledFeatures" type:v56];
    disabledFeaturesDataVar = v4->_disabledFeaturesDataVar;
    v4->_disabledFeaturesDataVar = (CPLPrequeliteVariable *)v57;

    v59 = +[CPLPrequeliteType dataType];
    uint64_t v60 = +[CPLPrequeliteVariable variableWithName:@"derivativesFilter" type:v59];
    derivativesFilterVar = v4->_derivativesFilterVar;
    v4->_derivativesFilterVar = (CPLPrequeliteVariable *)v60;

    v62 = +[CPLPrequeliteType integerType];
    uint64_t v63 = +[CPLPrequeliteVariable variableWithName:@"deactivated" type:v62];
    deactivatedVar = v4->_deactivatedVar;
    v4->_deactivatedVar = (CPLPrequeliteVariable *)v63;

    v65 = +[CPLPrequeliteType stringType];
    uint64_t v66 = +[CPLPrequeliteVariable variableWithName:@"mainScopeIdentifier" type:v65];
    mainScopeIdentifierVar = v4->_mainScopeIdentifierVar;
    v4->_mainScopeIdentifierVar = (CPLPrequeliteVariable *)v66;

    [(CPLPrequeliteVariable *)v4->_mainScopeIdentifierVar setShouldNotCacheValue:1];
    [(CPLPrequeliteVariable *)v4->_changeSessionUpdateVar setShouldNotCacheValue:1];
    v68 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v69 = dispatch_queue_create("com.apple.cplenginestore.sqlite.clientsync", v68);
    isClientInSyncWithClientCacheQueue = v4->_isClientInSyncWithClientCacheQueue;
    v4->_isClientInSyncWithClientCacheQueue = (OS_dispatch_queue *)v69;

    v4->_upgradeEventJournal = -1;
    v71 = +[NSUserDefaults standardUserDefaults];
    v4->_showStatsForAllTransactions = [v71 BOOLForKey:@"CPLShowStatsForAllTransactions"];

    if (v4->_showStatsForAllTransactions)
    {
      v4->_shouldProfile = 1;
    }
    else
    {
      char has_internal_content = os_variant_has_internal_content();
      v4->_shouldProfile = has_internal_content;
      if ((has_internal_content & 1) == 0) {
        goto LABEL_14;
      }
    }
    if (v4->_showStatsForAllTransactions)
    {
      if (!_CPLSilentLogging)
      {
        v73 = sub_10018796C();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          v76[0] = 0;
          v74 = "Will logs statistics for all transactions";
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, v74, (uint8_t *)v76, 2u);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else if (!_CPLSilentLogging)
    {
      v73 = sub_10018796C();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        v76[0] = 0;
        v74 = "Will try to catch long transactions";
        goto LABEL_12;
      }
LABEL_13:
    }
LABEL_14:
  }
  return v4;
}

- (void)triggerResetAfterUpgrade:(unint64_t)a3 withReason:(id)a4
{
  id v7 = a4;
  if (self->_didWipeLibrary) {
    goto LABEL_2;
  }
  if (!_CPLSilentLogging)
  {
    id v8 = sub_10018796C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v14 = a3;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Was requested to schedule a reset (option #%lu) after upgrade for reason '%@'", buf, 0x16u);
    }
  }
  [(CPLPrequeliteStore *)self recordUpgradeEvent:@"Reset option %ld requested. Reason: %@", a3, v7];
  if (!self->_needsToReset)
  {
    self->_needsToReset = 1;
    self->_unint64_t resetOption = a3;
    v11 = (NSString *)[v7 copy];
    resetReason = self->_resetReason;
    self->_resetReason = v11;

    goto LABEL_2;
  }
  unint64_t resetOption = self->_resetOption;
  if (!resetOption)
  {
    if (a3 - 1 > 1) {
      goto LABEL_2;
    }
LABEL_20:
    objc_storeStrong((id *)&self->_resetReason, a4);
    self->_unint64_t resetOption = a3;
    goto LABEL_2;
  }
  if (resetOption == 3)
  {
    if (a3 == 3) {
      goto LABEL_2;
    }
    goto LABEL_20;
  }
  if (resetOption == 1 && a3 == 2) {
    goto LABEL_20;
  }
LABEL_2:
}

- (BOOL)_initializeDB
{
  if (!_CPLSilentLogging)
  {
    id v3 = sub_10018796C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Initializing %@", buf, 0xCu);
    }
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100187C74;
  v5[3] = &unk_10027F0D8;
  v5[4] = self;
  return [(CPLPrequeliteStore *)self _performWithFlags:10 action:v5];
}

- (id)_transactionStatsDescription
{
  id v3 = [(NSMutableDictionary *)self->_transactionStatistics count];
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v3];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = [(NSMutableDictionary *)self->_transactionStatistics allValues];
    v6 = [v5 sortedArrayUsingSelector:"compare:"];

    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) description];
          [v4 addObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    dispatch_queue_t v12 = [v4 componentsJoinedByString:@"\n  "];
  }
  else
  {
    dispatch_queue_t v12 = @"no SQL statements";
  }
  return v12;
}

- (void)_setupProfilingHooks
{
  if (!self->_transactionStatistics)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    transactionStatistics = self->_transactionStatistics;
    self->_transactionStatistics = v3;

    objc_initWeak(&location, self);
    db = self->_db;
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_100188618;
    long long v14 = &unk_10027F100;
    objc_copyWeak(&v15, &location);
    [(PQLConnection *)db setProfilingHook:&v11];
    int v6 = sqlite3_trace_v2((sqlite3 *)[(PQLConnection *)self->_db dbHandle], 2u, (int (__cdecl *)(unsigned int, void *, void *, void *))sub_1001889B0, self);
    if (v6) {
      BOOL v7 = _CPLSilentLogging == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      id v8 = sub_10018796C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = [(PQLConnection *)self->_db dbHandle];
        v10 = sqlite3_errstr(v6);
        *(_DWORD *)buf = 134218242;
        id v18 = v9;
        __int16 v19 = 2080;
        v20 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to setup SQL tracing on %p hook: %s", buf, 0x16u);
      }
    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)_unsetupProfilingHooks
{
  if (self->_transactionStatistics)
  {
    [(PQLConnection *)self->_db setProfilingHook:0];
    sqlite3_trace_v2((sqlite3 *)[(PQLConnection *)self->_db dbHandle], 2u, 0, 0);
    transactionStatistics = self->_transactionStatistics;
    self->_transactionStatistics = 0;
  }
}

- (BOOL)_performWithFlags:(unsigned int)a3 action:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (self->_shouldProfile)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    unsigned __int8 v8 = [(PQLConnection *)self->_db performWithFlags:v4 action:v6];
    CFAbsoluteTime v9 = CFAbsoluteTimeGetCurrent();
    double v10 = v9 - Current;
    if (self->_transactionStatistics)
    {
      if (!self->_showStatsForAllTransactions && v10 <= 10.0)
      {
        if (v9 - self->_lastLongTransactionDate > 3600.0)
        {
          if (!_CPLSilentLogging)
          {
            id v15 = sub_10018895C();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v17) = 0;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No other long transactions did happen for a long time, stop monitoring long transactions", (uint8_t *)&v17, 2u);
            }
          }
          [(CPLPrequeliteStore *)self _unsetupProfilingHooks];
        }
      }
      else
      {
        self->_lastLongTransactionDate = v9;
        if (!_CPLSilentLogging)
        {
          uint64_t v12 = sub_10018895C();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = [(CPLPrequeliteStore *)self _transactionStatsDescription];
            int v17 = 134218242;
            double v18 = v10;
            __int16 v19 = 2114;
            v20 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Transaction took %.3fs. Sorted statements:\n  %{public}@", (uint8_t *)&v17, 0x16u);
          }
        }
      }
      [(NSMutableDictionary *)self->_transactionStatistics removeAllObjects];
    }
    else if (v10 > 10.0)
    {
      self->_lastLongTransactionDate = v9;
      if (!_CPLSilentLogging)
      {
        long long v14 = sub_10018895C();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 134217984;
          double v18 = v10;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Detected a long transaction (%.3fs) - start monitoring all long transactions", (uint8_t *)&v17, 0xCu);
        }
      }
      [(CPLPrequeliteStore *)self _setupProfilingHooks];
    }
  }
  else
  {
    unsigned __int8 v8 = [(PQLConnection *)self->_db performWithFlags:v4 action:v6];
  }

  return v8 & 1;
}

- (BOOL)_fix22666940
{
  id v3 = [(CPLPrequeliteStore *)self abstractObject];
  v44 = self;
  uint64_t v4 = [(CPLPrequeliteStore *)self clientCache];
  v5 = [v3 cloudCache];
  uint64_t v6 = [v5 platformObject];

  BOOL v7 = [v3 idMapping];
  uint64_t v51 = [v7 platformObject];

  unsigned __int8 v8 = [v3 remappedRecords];
  v43 = [v8 platformObject];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v45 = (void *)v4;
  CFAbsoluteTime v9 = (void *)v4;
  double v10 = (void *)v6;
  id obj = [v9 _badContainerRelationsIdentifiers];
  v11 = (char *)[obj countByEnumeratingWithState:&v53 objects:v57 count:16];
  unsigned __int8 v12 = v11 == 0;
  if (!v11)
  {
LABEL_36:

    goto LABEL_37;
  }
  v13 = v11;
  BOOL v40 = v11 == 0;
  v41 = v3;
  v46 = 0;
  long long v14 = 0;
  uint64_t v15 = *(void *)v54;
  uint64_t v50 = CPLPrimaryScopeIdentifier;
  do
  {
    long long v16 = 0;
    uint64_t v17 = -(uint64_t)v14;
    uint64_t v42 = &v13[(void)v14];
    uint64_t v47 = -(uint64_t)v14;
    uint64_t v48 = v13;
    do
    {
      if (*(void *)v54 != v15) {
        objc_enumerationMutation(obj);
      }
      double v18 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v16);
      if ((char *)v17 == v16 && !_CPLSilentLogging)
      {
        v20 = sub_10018796C();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found some bad container relations to fix", buf, 2u);
        }
      }
      buf[0] = 0;
      if (v18)
      {
        id v21 = v18;
        id v22 = [objc_alloc((Class)CPLScopedIdentifier) initWithScopeIdentifier:v50 identifier:v21];
      }
      else
      {
        id v22 = 0;
      }
      v23 = [v51 cloudScopedIdentifierForLocalScopedIdentifier:v22 isFinal:buf];

      if (v23)
      {
        uint64_t v24 = [v23 identifier];
        v25 = [v10 _relatedIdentifierForRecordWithIdentifier:v24];

        if (v25)
        {
          uint64_t v26 = v15;
          id v27 = objc_alloc((Class)CPLScopedIdentifier);
          v28 = [v23 identifier];
          v29 = v10;
          uint64_t v30 = [v10 _relatedIdentifierForRecordWithIdentifier:v28];
          id v31 = [v27 initWithScopeIdentifier:v50 identifier:v30];

          if (!v31) {
            goto LABEL_20;
          }
          v32 = [v51 localScopedIdentifierForCloudScopedIdentifier:v31 isFinal:buf];
          if (v32) {
            goto LABEL_18;
          }
          v35 = [v43 realScopedIdentifierForRemappedScopedIdentifier:v31];
          double v10 = v29;
          if (v35)
          {
            uint64_t v36 = [v51 localScopedIdentifierForCloudScopedIdentifier:v35 isFinal:buf];
            if (v36)
            {
              v32 = (void *)v36;
              if ([v45 hasRecordWithScopedIdentifier:v36])
              {
                [(CPLPrequeliteStore *)v44 recordUpgradeEvent:@"FIX: Cloud %@'s item: %@ => %@", v23, v31, v35];
                unsigned int v37 = [v29 remapAllRecordsWithPreviousScopedIdentifier:v31 newScopedIdentifier:v35 error:0];

                if (!v37)
                {

LABEL_35:
                  id v3 = v41;
                  double v10 = v29;
                  unsigned __int8 v12 = v40;
                  goto LABEL_36;
                }
LABEL_18:
                [(CPLPrequeliteStore *)v44 recordUpgradeEvent:@"FIX: Client %@'s item: %@", v18, v32];
                uint64_t v33 = [v32 identifier];
                unsigned __int8 v34 = [v45 _updateRelatedIdentifier:v33 forRecordWithIdentifier:v18];

                if ((v34 & 1) == 0) {
                  goto LABEL_35;
                }
                ++v46;
LABEL_20:
                double v10 = v29;
LABEL_21:
                uint64_t v15 = v26;
                uint64_t v17 = v47;
                v13 = v48;
                goto LABEL_22;
              }
            }
          }

          goto LABEL_21;
        }
      }
LABEL_22:

      ++v16;
    }
    while (v13 != v16);
    v38 = (char *)[obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    v13 = v38;
    long long v14 = v42;
  }
  while (v38);

  if (v42)
  {
    id v3 = v41;
    if (v42 == v46)
    {
      [(CPLPrequeliteStore *)v44 recordUpgradeEvent:@"Fixed %lu relations", v42];
      unsigned __int8 v12 = 1;
    }
    else
    {
      unsigned __int8 v12 = [v45 _deleteBadRelations];
      [(CPLPrequeliteStore *)v44 recordUpgradeEvent:@"Fixed %lu relations and deleted %lu", v42, v42 - v46];
    }
  }
  else
  {
    unsigned __int8 v12 = 1;
    id v3 = v41;
  }
LABEL_37:

  return v12;
}

- (void)_scheduleClientCacheDrop
{
  if (self->_hasScheduledClientCacheDrop) {
    sub_1001D164C((uint64_t)a2, (uint64_t)self);
  }
  self->_hasScheduledClientCacheDrop = 1;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100189444;
  v6[3] = &unk_100275EA0;
  v6[4] = self;
  id v3 = objc_retainBlock(v6);
  uint64_t v4 = v3;
  if (byte_1002DBFAB)
  {
    ((void (*)(void *))v3[2])(v3);
  }
  else
  {
    dispatch_time_t v5 = dispatch_time(0, 10000000000);
    dispatch_after(v5, (dispatch_queue_t)self->_queue, v4);
  }
}

- (void)_scheduleClientCacheDropIfNecessary
{
  if (!self->_hasScheduledClientCacheDrop)
  {
    id v3 = [(PQLConnection *)self->_db cplFetchObjectOfClass:objc_opt_class() sql:@"SELECT name FROM sqlite_master WHERE type='table' AND name='clientCache'"];

    if (v3)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v4 = sub_10018796C();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)dispatch_time_t v5 = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client cache has not been properly dropped yet. Scheduling it soon", v5, 2u);
        }
      }
      [(CPLPrequeliteStore *)self _scheduleClientCacheDrop];
    }
  }
}

- (BOOL)_upgradeToVersion:(int64_t)a3
{
  clientCacheMigrator = self->_clientCacheMigrator;
  if (a3 >= 64 && clientCacheMigrator)
  {
    uint64_t v6 = 0;
LABEL_7:
    self->_clientCacheMigrator = v6;

    goto LABEL_8;
  }
  if (a3 <= 63 && !clientCacheMigrator)
  {
    uint64_t v6 = [[CPLPrequeliteClientCacheMigrator alloc] initWithStore:self];
    clientCacheMigrator = self->_clientCacheMigrator;
    goto LABEL_7;
  }
LABEL_8:
  BOOL v7 = 1;
  if (a3 <= 43)
  {
    if (a3 > 28)
    {
      if (a3 == 29)
      {
        self->_mustFix22666940 = 1;
      }
      else if (a3 == 36)
      {
        uint64_t v8 = 128;
        goto LABEL_27;
      }
    }
    else if (a3 == 21)
    {
      dbURL = self->_dbURL;
      id v22 = 0;
      id v21 = 0;
      unsigned __int8 v14 = [(NSURL *)dbURL getResourceValue:&v22 forKey:NSURLCreationDateKey error:&v21];
      id v15 = v22;
      id v16 = v21;
      if ((v14 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v17 = sub_10018796C();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            double v18 = [(NSURL *)self->_dbURL path];
            *(_DWORD *)buf = 138412546;
            uint64_t v24 = v18;
            __int16 v25 = 2112;
            id v26 = v16;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Can't get creation date for %@: %@", buf, 0x16u);
          }
        }
        uint64_t v19 = +[NSDate date];

        id v15 = (id)v19;
      }
      BOOL v7 = [(CPLPrequeliteStore *)self addGlobalVariable:self->_libraryCreationDateVar defaultValue:v15 error:0];
    }
    else if (a3 == 28)
    {
      uint64_t v8 = 96;
      goto LABEL_27;
    }
    return v7;
  }
  if (a3 <= 50)
  {
    if (a3 == 44)
    {
      uint64_t v9 = 176;
    }
    else
    {
      if (a3 != 50) {
        return v7;
      }
      uint64_t v9 = 216;
    }
    uint64_t v10 = *(void *)&self->CPLPlatformObject_opaque[v9];
    unsigned __int8 v12 = &off_100292118;
    v11 = self;
    goto LABEL_37;
  }
  if (a3 == 51)
  {
    if ([(CPLPrequeliteStore *)self addGlobalVariable:self->_shouldUpdateDisabledFeaturesVar defaultValue:&off_100292118 error:0])
    {
      uint64_t v8 = 192;
      goto LABEL_27;
    }
    return 0;
  }
  if (a3 == 61)
  {
    uint64_t v8 = 208;
    goto LABEL_27;
  }
  if (a3 != 81) {
    return v7;
  }
  uint64_t v8 = 136;
LABEL_27:
  uint64_t v10 = *(void *)&self->CPLPlatformObject_opaque[v8];
  v11 = self;
  unsigned __int8 v12 = 0;
LABEL_37:
  return [(CPLPrequeliteStore *)v11 addGlobalVariable:v10 defaultValue:v12 error:0];
}

- (BOOL)_postUpgradeToVersion:(int64_t)a3
{
  if (a3 > 81)
  {
    switch(a3)
    {
      case 'R':
        unsigned __int8 v14 = CPLStoreMigrationAssistant_101386451;
        break;
      case 'V':
        unsigned __int8 v14 = CPLStoreMigrationAssistant_107137447;
        break;
      case 'W':
        dispatch_time_t v5 = [CPLStoreMigrationAssistant_110019222 alloc];
        uint64_t v6 = [(CPLPrequeliteStore *)self abstractObject];
        BOOL v7 = [(CPLStoreMigrationAssistant_110019222 *)v5 initWithStore:v6];

        [(CPLPrequeliteStore *)self _addPostUpgradeMigration:v7];
LABEL_21:

        return 1;
      default:
        return 1;
    }
    id v15 = [v14 alloc];
    id v16 = [(CPLPrequeliteStore *)self abstractObject];
    id v17 = [v15 initWithStore:v16];

    [(CPLPrequeliteStore *)self _addPostUpgradeMigration:v17];
    return 1;
  }
  if (a3 == 31)
  {
    self->_mustMigratePushQueue = 1;
    return 1;
  }
  if (a3 != 40)
  {
    if (a3 == 63)
    {
      clientCacheMigrator = self->_clientCacheMigrator;
      self->_clientCacheMigrator = 0;

      [(CPLPrequeliteStore *)self _scheduleClientCacheDrop];
    }
    return 1;
  }
  if (self->_mustFix22666940) {
    [(CPLPrequeliteStore *)self _fix22666940];
  }
  if (self->_mustMigratePushQueue)
  {
    uint64_t v8 = [(CPLPrequeliteStore *)self abstractObject];
    BOOL v7 = [v8 resourceStorage];

    id v9 = [(CPLStoreMigrationAssistant_110019222 *)v7 shouldCheckFilesForUpload];
    [(CPLStoreMigrationAssistant_110019222 *)v7 setShouldCheckFilesForUpload:0];
    uint64_t v10 = [[CPLPrequeliteFlattentPipelineMigrator alloc] initWithStore:self];
    if (![(CPLPrequeliteFlattentPipelineMigrator *)v10 migrate])
    {
      if (!_CPLSilentLogging)
      {
        v11 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v12 = [(CPLPrequeliteFlattentPipelineMigrator *)v10 lastError];
          int v19 = 138412290;
          v20 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to migrate to new pipeline (will trigger a reset sync): %@", (uint8_t *)&v19, 0xCu);
        }
      }
      [(CPLPrequeliteStore *)self triggerResetAfterUpgrade:0 withReason:@"failed to migrate to flat push pipeline"];
    }
    [(CPLStoreMigrationAssistant_110019222 *)v7 setShouldCheckFilesForUpload:v9];

    goto LABEL_21;
  }
  return 1;
}

- (BOOL)_fixStoreAfterAnyVersionChange
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v3 = [(CPLPrequeliteStore *)self abstractObject];
  uint64_t v4 = [v3 storages];

  id v5 = [v4 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v29 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v28 + 1) + 8 * v8);
      id v10 = [v9 platformObject];
      if (([v10 fixStorageAfterAnyVersionChange] & 1) == 0) {
        break;
      }

      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    if (_CPLSilentLogging)
    {
      LOBYTE(v13) = 0;
      goto LABEL_16;
    }
    unsigned __int8 v14 = sub_10018796C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = [(PQLConnection *)self->_db lastCPLError];
      id v16 = [v15 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v33 = v9;
      __int16 v34 = 2112;
      v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to fix %@ after version change: %@", buf, 0x16u);
    }
    LOBYTE(v13) = 0;
  }
  else
  {
LABEL_9:

    globals = self->_globals;
    unsigned __int8 v12 = [(CPLPrequeliteVariable *)self->_mainScopeIdentifierVar variableName];
    LOBYTE(globals) = [(CPLPrequeliteStore *)self table:globals hasColumnWithName:v12];

    if (globals)
    {
      LOBYTE(v13) = 1;
      return v13;
    }
    uint64_t v4 = [(CPLPrequeliteStore *)self pqlConnection];
    id v18 = [v4 fetchObjectOfClass:objc_opt_class() sql:@"SELECT universeName FROM globals"];
    int v19 = v18;
    uint64_t v20 = CPLPrimaryScopeIdentifier;
    if (v18) {
      id v21 = v18;
    }
    else {
      id v21 = (void *)CPLPrimaryScopeIdentifier;
    }
    id v10 = v21;

    unsigned int v22 = [v10 isEqualToString:v20];
    if (v22)
    {
      unsigned int v23 = v22;
      if (!_CPLSilentLogging)
      {
        uint64_t v24 = sub_10018796C();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v10;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Add new mainScopeIdentifier column. Store is considered created for mainScopeIdentifier %@", buf, 0xCu);
        }
      }
      unsigned int v13 = [(CPLPrequeliteStore *)self addGlobalVariable:self->_mainScopeIdentifierVar defaultValue:v10 error:0];

      if ((v23 & v13) != 1) {
        return v13;
      }
      uint64_t v4 = [(CPLPrequeliteStore *)self abstractObject];
      id v10 = [v4 engineLibrary];
      unsigned __int8 v14 = [v10 store];
      __int16 v25 = [v14 scopes];
      LOBYTE(v13) = [v25 clearAllQuotaFlagsForMainScopeWithReason:@"fix store after any version change" error:0];
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v26 = sub_10018796C();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v10;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Database is bound to %@ and need to be wiped before opening", buf, 0xCu);
        }
      }
      id v27 = 0;
      LOBYTE(v13) = [(CPLPrequeliteStore *)self _closeWipeAndReOpenWithReason:@"upgrading parallel universe database" warnUserIfPossible:0 createRadar:0 error:&v27];
      unsigned __int8 v14 = v27;
      if ((v13 & 1) == 0) {
        [v4 setLastError:v14];
      }
    }
  }

LABEL_16:
  return v13;
}

- (BOOL)performPostUpgradeMigrationsWithError:(id *)a3
{
  if (self->_postUpgradeMigrations)
  {
    [(CPLPrequeliteStore *)self _openUpgradeJournal];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = self->_postUpgradeMigrations;
    id v36 = [(NSMutableArray *)obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v36)
    {
      v32 = a3;
      id v5 = 0;
      uint64_t v35 = *(void *)v39;
      id v6 = &_CPLSilentLogging;
      while (2)
      {
        uint64_t v7 = 0;
        uint64_t v8 = v5;
        do
        {
          if (*(void *)v39 != v35) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v7);
          if (!*v6)
          {
            v11 = sub_10018796C();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              unsigned __int8 v12 = [v9 migrationDescription];
              *(_DWORD *)buf = 138412290;
              v43 = v12;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Start migration '%@'", buf, 0xCu);
            }
          }
          unsigned int v13 = +[NSDate date];
          unsigned __int8 v14 = +[CPLDateFormatter stringFromDate:v13];
          id v15 = [v9 migrationDescription];
          [(CPLPrequeliteStore *)self recordUpgradeEvent:@"%@: Performing migration '%@'", v14, v15];

          id v16 = +[NSDate date];
          id v37 = v8;
          unsigned __int8 v17 = [v9 performMigrationWithError:&v37];
          id v5 = v37;

          if ((v17 & 1) == 0 && v5)
          {
            if (!*v6)
            {
              long long v28 = sub_10018796C();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                long long v29 = [v9 migrationDescription];
                *(_DWORD *)buf = 138412546;
                v43 = v29;
                __int16 v44 = 2112;
                id v45 = v5;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Migration '%@' failed: %@", buf, 0x16u);
              }
            }
            [(PQLConnection *)self->_db setLastError:v5];

            BOOL v27 = 0;
            a3 = v32;
            goto LABEL_27;
          }
          unsigned __int8 v34 = v17;
          +[NSDate date];
          id v18 = v10;
          id v19 = v5;
          id v21 = v20 = v6;
          unsigned int v22 = +[CPLDateFormatter stringFromDate:v21];
          unsigned int v23 = [v9 migrationDescription];
          [v16 timeIntervalSinceNow];
          [(CPLPrequeliteStore *)self recordUpgradeEvent:@"%@: Performed migration '%@' in %.1fs: Done", v22, v23, -v24];

          id v6 = v20;
          id v5 = v19;
          if (!*v6)
          {
            __int16 v25 = sub_10018796C();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              id v26 = [v9 migrationDescription];
              *(_DWORD *)buf = 138412290;
              v43 = v26;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Migration '%@' completed successfully", buf, 0xCu);
            }
          }

          uint64_t v7 = (char *)v7 + 1;
          uint64_t v8 = v19;
        }
        while (v36 != v7);
        id v36 = [(NSMutableArray *)obj countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v36) {
          continue;
        }
        break;
      }
      a3 = v32;
      BOOL v27 = v34;
    }
    else
    {
      id v5 = 0;
      BOOL v27 = 1;
    }
LABEL_27:

    [(CPLPrequeliteStore *)self _closeUpgradeJournal];
    postUpgradeMigrations = self->_postUpgradeMigrations;
    self->_postUpgradeMigrations = 0;

    if (a3 && !v27)
    {
      id v5 = v5;
      BOOL v27 = 0;
      *a3 = v5;
    }
  }
  else
  {
    id v5 = 0;
    BOOL v27 = 1;
  }

  return v27;
}

- (void)_wipeWithReason:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  wipeReason = self->_wipeReason;
  self->_wipeReason = v4;

  self->_didWipeLibrary = 1;
  [(CPLSimpleUpgradeHistory *)self->_history resetVersionHasChanged];
  id v6 = [(CPLPrequeliteStore *)self abstractObject];
  uint64_t v7 = [v6 engineLibrary];
  uint64_t v8 = [v7 cloudLibraryStateStorageURL];

  id v9 = +[NSFileManager defaultManager];
  id v14 = 0;
  unsigned __int8 v10 = [v9 removeItemAtURL:v8 error:&v14];
  id v11 = v14;

  if ((v10 & 1) == 0 && !_CPLSilentLogging)
  {
    unsigned __int8 v12 = sub_10018796C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unsigned int v13 = [v8 path];
      *(_DWORD *)buf = 138412546;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error trying to delete %@: %@", buf, 0x16u);
    }
  }
}

- (NSURL)deactivateMarkerURL
{
  v2 = [(CPLPrequeliteStore *)self abstractObject];
  id v3 = [v2 engineLibrary];
  uint64_t v4 = [v3 clientLibraryBaseURL];
  id v5 = [v4 URLByDeletingLastPathComponent];
  id v6 = [v5 URLByAppendingPathComponent:@"disableICloudPhotos" isDirectory:0];

  return (NSURL *)v6;
}

- (BOOL)_hasDeactivateMarker
{
  id v3 = +[NSFileManager defaultManager];
  uint64_t v4 = [(CPLPrequeliteStore *)self deactivateMarkerURL];
  id v5 = [v4 path];
  unsigned __int8 v6 = [v3 fileExistsAtPath:v5];

  return v6;
}

- (BOOL)_closeWipeAndReOpenWithReason:(id)a3 warnUserIfPossible:(BOOL)a4 createRadar:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  unsigned __int8 v10 = (CPLPrequelitePreventWipeNotification *)a3;
  BOOL failInsteadOfWipe = self->_failInsteadOfWipe;
  unsigned __int8 v12 = [(CPLPrequeliteStore *)self _hasDeactivateMarker];
  if (failInsteadOfWipe && (v12 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      unsigned int v13 = sub_10018796C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v39 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Trying to wipe database for reason '%@' but we were asked to prevent wipes", buf, 0xCu);
      }
    }
    id v14 = +[CPLErrors preventWipeErrorWithReason:v10 preventedByUser:0];
    [(PQLConnection *)self->_db setLastError:v14];
    if (a6)
    {
      id v14 = v14;
      BOOL v15 = 0;
      *a6 = v14;
      goto LABEL_43;
    }
LABEL_28:
    BOOL v15 = 0;
    goto LABEL_43;
  }
  if ((v12 & 1) == 0
    && v8
    && +[CPLPrequeliteStore shouldWarnUserBeforeWipeOnUpgrade])
  {
    id v16 = [CPLPrequelitePreventWipeNotification alloc];
    __int16 v17 = [(CPLPrequeliteStore *)self abstractObject];
    id v18 = [v17 engineLibrary];
    id v19 = [v18 libraryIdentifier];
    uint64_t v20 = v10;
    if (qword_1002DBFD8 != -1) {
      dispatch_once(&qword_1002DBFD8, &stru_10027F268);
    }
    id v21 = [(id)qword_1002DBFD0 objectForKeyedSubscript:v20];
    if (!v21)
    {
      uint64_t v35 = v16;
      if ([(CPLPrequelitePreventWipeNotification *)v20 length]
        && (+[NSCharacterSet lowercaseLetterCharacterSet],
            unsigned int v22 = objc_claimAutoreleasedReturnValue(),
            unsigned int v23 = objc_msgSend(v22, "characterIsMember:", -[CPLPrequelitePreventWipeNotification characterAtIndex:](v20, "characterAtIndex:", 0)), v22, v23))
      {
        id v21 = (CPLPrequelitePreventWipeNotification *)[(CPLPrequelitePreventWipeNotification *)v20 mutableCopy];
        unsigned __int8 v34 = [(CPLPrequelitePreventWipeNotification *)v20 substringToIndex:1];
        double v24 = [v34 uppercaseString];
        -[CPLPrequelitePreventWipeNotification replaceCharactersInRange:withString:](v21, "replaceCharactersInRange:withString:", 0, 1, v24);
      }
      else
      {
        id v21 = v20;
      }
      id v16 = v35;
    }

    id v14 = [(CPLPrequelitePreventWipeNotification *)v16 initWithLibraryIdentifier:v19 reason:v21];
    if ([(CPLPrequelitePreventWipeNotification *)v14 shouldPreventWipeOnUpgradeCreateRadar:v7])
    {
      if (!_CPLSilentLogging)
      {
        __int16 v25 = sub_10018796C();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          long long v39 = v20;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Trying to wipe database for reason '%@' but user asked to prevent wipes", buf, 0xCu);
        }
      }
      id v26 = +[CPLErrors preventWipeErrorWithReason:v20 preventedByUser:1];
      [(PQLConnection *)self->_db setLastError:v26];
      if (a6) {
        *a6 = v26;
      }

      goto LABEL_28;
    }
  }
  db = self->_db;
  id v37 = 0;
  unsigned __int8 v28 = [(PQLConnection *)db close:&v37];
  id v14 = (CPLPrequelitePreventWipeNotification *)v37;
  if ((v28 & 1) == 0 && !_CPLSilentLogging)
  {
    long long v29 = sub_10018796C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v39 = v14;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Some trouble closing the stale db: %@", buf, 0xCu);
    }
  }
  long long v30 = self->_db;
  self->_db = 0;

  [(CPLPrequeliteStore *)self _wipeWithReason:v10];
  self->_reentrencyGuard = 1;
  id v36 = 0;
  BOOL v15 = [(CPLPrequeliteStore *)self _openWithError:&v36];
  long long v31 = (CPLPrequelitePreventWipeNotification *)v36;
  if (!v15)
  {
    if (!_CPLSilentLogging)
    {
      v32 = sub_10018796C();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v39 = v31;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Unable to create the database: %@", buf, 0xCu);
      }
    }
    if (a6) {
      *a6 = v31;
    }
  }
  self->_reentrencyGuard = 0;

LABEL_43:
  return v15;
}

- (id)_wipeReasonFromCorruptionInfo:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"comment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v4) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v4 = @"corrupted database";
LABEL_7:

  return v4;
}

- (void)_wipeBeforeOpeningIfNecessary
{
  id v3 = [(CPLPrequeliteStore *)self corruptionInfo];
  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v4 = sub_10018796C();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Database has been marked as corrupted - wiping everything - corruption info: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    id v5 = [(CPLPrequeliteStore *)self _wipeReasonFromCorruptionInfo:v3];
    [(CPLPrequeliteStore *)self _wipeWithReason:v5];

    [(CPLPrequeliteStore *)self _deleteCorruptionInfo];
  }
  unsigned __int8 v6 = [(CPLPrequeliteStore *)self wipeReason];
  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      BOOL v7 = sub_10018796C();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        id v9 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CPL has been requested to wipe database: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    [(CPLPrequeliteStore *)self _wipeWithReason:v6];
    [(CPLPrequeliteStore *)self _deleteWipeReason];
  }
}

- (BOOL)_wipeIfDeactivated:(int64_t)a3 didWipeDatabase:(BOOL *)a4 error:(id *)a5
{
  if (a3 < 50
    || self->_reentrencyGuard
    || ([(CPLPrequeliteStore *)self valueForGlobalVariable:self->_deactivatedVar],
        int v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 integerValue],
        v8,
        !v9))
  {
    *a4 = 0;
    return 1;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      unsigned __int8 v10 = sub_10018796C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unsigned __int8 v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Database has been marked as deactivated - wiping everything", v12, 2u);
      }
    }
    *a4 = 1;
    return [(CPLPrequeliteStore *)self _closeWipeAndReOpenWithReason:@"wiping database because it has been marked as deactivated but not deleted afterwards" warnUserIfPossible:0 createRadar:0 error:a5];
  }
}

- (BOOL)_upgradeDB:(int64_t)a3
{
  [(PQLConnection *)self->_db setLastError:0];
  if (self->_reentrencyGuard)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_10018796C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Re-opening database triggered an upgrade again. Bailing out.", buf, 2u);
      }
    }
    return 0;
  }
  if (a3 < 0)
  {
    if (!_CPLSilentLogging)
    {
      unsigned __int8 v10 = sub_10018796C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v30 = a3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Database in version %lld is too old. Wiping everything. This will require a reset sync.", buf, 0xCu);
      }
    }
    [(CPLPrequeliteStore *)self recordUpgradeEvent:@"Will need to wipe everything because the current version is really too old."];
    CFStringRef v11 = @"wiping everything because the current version is really too old";
    unsigned __int8 v12 = self;
    BOOL v13 = 0;
    return [(CPLPrequeliteStore *)v12 _closeWipeAndReOpenWithReason:v11 warnUserIfPossible:v13 createRadar:0 error:0];
  }
  if ((unint64_t)(a3 - 93) <= 0xFFFFFFFFFFFFFFB2)
  {
    if ((unint64_t)a3 <= 0xF)
    {
      if (_CPLSilentLogging)
      {
        CFStringRef v8 = @"wiping database because the current version is really too old";
        CFStringRef v9 = @"Will need to wipe database because the current version is really too old.";
        goto LABEL_40;
      }
      BOOL v7 = sub_10018796C();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v30 = a3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Database in version %lld is too old. Let's clear it and request a reset sync.", buf, 0xCu);
      }
      CFStringRef v8 = @"wiping database because the current version is really too old";
      CFStringRef v9 = @"Will need to wipe database because the current version is really too old.";
    }
    else
    {
      if (_CPLSilentLogging)
      {
        CFStringRef v8 = @"wiping database because the current version is too new";
        CFStringRef v9 = @"Will need to wipe database because the current version is too new.";
        goto LABEL_40;
      }
      BOOL v7 = sub_10018796C();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v30 = a3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Database in version %lld is too new for this engine. Let's clear it, request a reset sync and cross our fingers.", buf, 0xCu);
      }
      CFStringRef v8 = @"wiping database because the current version is too new";
      CFStringRef v9 = @"Will need to wipe database because the current version is too new.";
    }

LABEL_40:
    [(CPLPrequeliteStore *)self recordUpgradeEvent:v9];
    unsigned __int8 v12 = self;
    CFStringRef v11 = v8;
    BOOL v13 = (unint64_t)a3 > 0xF;
    return [(CPLPrequeliteStore *)v12 _closeWipeAndReOpenWithReason:v11 warnUserIfPossible:v13 createRadar:0 error:0];
  }
  if (!_CPLSilentLogging)
  {
    id v14 = sub_10018796C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      int64_t v30 = (int64_t)self;
      __int16 v31 = 2048;
      int64_t v32 = a3;
      __int16 v33 = 2048;
      int64_t v34 = 92;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Upgrading %@ from version %lld to %lld", buf, 0x20u);
    }
  }
  BOOL v15 = [(CPLPrequeliteStore *)self abstractObject];
  id v16 = [v15 storages];

  if (a3 <= 92) {
    int64_t v17 = 92;
  }
  else {
    int64_t v17 = a3;
  }
  do
  {
    if (v17 == a3)
    {
      BOOL v6 = 1;
      goto LABEL_34;
    }
    ++a3;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10018B3A0;
    v26[3] = &unk_10027F148;
    v26[4] = self;
    int64_t v28 = a3;
    id v27 = v16;
    unsigned __int8 v19 = [(CPLPrequeliteStore *)self _performWithFlags:10 action:v26];
  }
  while ((v19 & 1) != 0);
  if (!_CPLSilentLogging)
  {
    uint64_t v20 = sub_10018796C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      int64_t v30 = (int64_t)self;
      __int16 v31 = 2048;
      int64_t v32 = a3 - 1;
      __int16 v33 = 2048;
      int64_t v34 = a3;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to upgrade %@ from version %lld to %lld - will need to wipe the database", buf, 0x20u);
    }
  }
  [(CPLPrequeliteStore *)self recordUpgradeEvent:@"Will need to wipe everything because failed to upgrade from version %lld to %lld.", a3 - 1, a3];
  id v21 = [(PQLConnection *)self->_db lastCPLError];
  id v22 = objc_alloc((Class)NSString);
  unsigned int v23 = [v21 domain];
  id v24 = [v22 initWithFormat:@"wiping everything because database failed to upgrade from version %lld to %lld (%@/%ld)", a3 - 1, a3, v23, objc_msgSend(v21, "code")];

  BOOL v6 = [(CPLPrequeliteStore *)self _closeWipeAndReOpenWithReason:v24 warnUserIfPossible:1 createRadar:1 error:0];
LABEL_34:

  return v6;
}

- (void)_openUpgradeJournal
{
  if (self->_upgradeEventJournal != -1) {
    sub_1001D1704((uint64_t)a2, (uint64_t)self);
  }
  id v3 = [(CPLPrequeliteStore *)self abstractObject];
  uint64_t v4 = [v3 engineLibrary];
  id v6 = [v4 cloudLibraryStateStorageURL];

  id v5 = [v6 URLByAppendingPathComponent:@"cpl-upgrade-events.log"];
  self->_upgradeEventJournal = open((const char *)[v5 fileSystemRepresentation], 521, 420);
}

- (void)_closeUpgradeJournal
{
  int upgradeEventJournal = self->_upgradeEventJournal;
  if (upgradeEventJournal != -1)
  {
    close(upgradeEventJournal);
    self->_int upgradeEventJournal = -1;
  }
}

- (BOOL)_setupDBIfNeeded
{
  self->_configuringDB = 1;
  id v3 = [(PQLConnection *)self->_db userVersion];
  id v4 = [v3 longLongValue];

  if (!v4)
  {
    LOBYTE(v5) = [(CPLPrequeliteStore *)self _initializeDB];
LABEL_26:
    self->_configuringDB = 0;
    return v5;
  }
  char v25 = 0;
  BOOL v5 = [(CPLPrequeliteStore *)self _wipeIfDeactivated:v4 didWipeDatabase:&v25 error:0];
  if (v5)
  {
    if (v25 || v4 == (id)92)
    {
      if (!v25
        && [(CPLSimpleUpgradeHistory *)self->_history versionHasChanged]
        && ![(CPLPrequeliteStore *)self _fixStoreAfterAnyVersionChange])
      {
        goto LABEL_24;
      }
    }
    else
    {
      [(CPLPrequeliteStore *)self _openUpgradeJournal];
      id v6 = +[NSDate date];
      BOOL v7 = +[CPLDateFormatter stringFromDate:v6];
      [(CPLPrequeliteStore *)self recordUpgradeEvent:@"%@: Upgrading from %lld to %lld...", v7, v4, 92];

      [(CPLSimpleUpgradeHistory *)self->_history noteDatabaseWasUpgradedToVersion:92 fromVersion:v4];
      self->_BOOL failInsteadOfWipe = [(id)objc_opt_class() shouldPreventWipeOnUpgrade];
      unsigned __int8 v8 = [(CPLPrequeliteStore *)self _upgradeDB:v4];
      self->_BOOL failInsteadOfWipe = 0;
      if ((v8 & 1) == 0)
      {
        id v21 = +[NSDate date];
        id v22 = +[CPLDateFormatter stringFromDate:v21];
        unsigned int v23 = [(PQLConnection *)self->_db lastCPLError];
        [(CPLPrequeliteStore *)self recordUpgradeEvent:@"%@: Upgrade from %lld to %lld: Failed (%@)", v22, v4, 92, v23];

        [(CPLPrequeliteStore *)self _closeUpgradeJournal];
LABEL_24:
        unsigned int v20 = 0;
        goto LABEL_25;
      }
      [(PQLConnection *)self->_db setUserVersion:92];
      CFStringRef v9 = +[NSDate date];
      unsigned __int8 v10 = +[CPLDateFormatter stringFromDate:v9];
      [(CPLPrequeliteStore *)self recordUpgradeEvent:@"%@: Upgrade from %lld to %lld: Done", v10, v4, 92];

      unsigned __int8 v11 = [(CPLPrequeliteStore *)self _fixStoreAfterAnyVersionChange];
      [(CPLPrequeliteStore *)self _closeUpgradeJournal];
      if ((v11 & 1) == 0) {
        goto LABEL_24;
      }
    }
    unsigned __int8 v12 = [(CPLPrequeliteStore *)self abstractObject];
    BOOL v13 = [v12 mainScopeIdentifier];

    unint64_t v14 = v13;
    BOOL v15 = [(CPLPrequeliteStore *)self valueForGlobalVariable:self->_mainScopeIdentifierVar];
    unint64_t v16 = (unint64_t)v15;
    if (v14 && v15)
    {
      unsigned __int8 v17 = [(id)v14 isEqual:v15];

      if ((v17 & 1) == 0)
      {
LABEL_15:
        if (!_CPLSilentLogging)
        {
          id v18 = sub_10018796C();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            unsigned __int8 v19 = [(CPLPrequeliteStore *)self valueForGlobalVariable:self->_mainScopeIdentifierVar];
            *(_DWORD *)buf = 138412546;
            id v27 = v19;
            __int16 v28 = 2112;
            unint64_t v29 = v14;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Main scope identifier has changed (from %@ to %@)", buf, 0x16u);
          }
        }
        unsigned int v20 = [(CPLPrequeliteStore *)self _closeWipeAndReOpenWithReason:@"main scope identifier has changed" warnUserIfPossible:1 createRadar:0 error:0];
        goto LABEL_22;
      }
    }
    else
    {

      if (v14 | v16) {
        goto LABEL_15;
      }
    }
    unsigned int v20 = 1;
LABEL_22:

LABEL_25:
    LOBYTE(v5) = v20 != 0;
    goto LABEL_26;
  }
  return v5;
}

- (id)_corruptionMarkerURL
{
  v2 = [(CPLPrequeliteStore *)self abstractObject];
  id v3 = [v2 engineLibrary];
  id v4 = [v3 cloudLibraryStateStorageURL];

  BOOL v5 = [v4 URLByAppendingPathComponent:@"corruption_marker"];

  return v5;
}

- (id)corruptionInfo
{
  v2 = [(CPLPrequeliteStore *)self _corruptionMarkerURL];
  id v3 = +[NSFileManager defaultManager];
  id v4 = [v2 path];
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = +[NSDictionary dictionaryWithContentsOfURL:v2];
    if (!v6)
    {
      id v6 = +[NSString stringWithContentsOfURL:v2 encoding:4 error:0];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_deleteCorruptionInfo
{
  v2 = [(CPLPrequeliteStore *)self _corruptionMarkerURL];
  id v3 = +[NSFileManager defaultManager];
  id v9 = 0;
  unsigned __int8 v4 = [v3 removeItemAtURL:v2 error:&v9];
  id v5 = v9;
  if (v4)
  {
LABEL_6:

    goto LABEL_7;
  }
  id v6 = +[NSFileManager defaultManager];
  unsigned __int8 v7 = [v6 cplIsFileDoesNotExistError:v5];

  if ((v7 & 1) == 0 && !_CPLSilentLogging)
  {
    id v3 = sub_10018796C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v8 = [v2 path];
      *(_DWORD *)buf = 138412546;
      unsigned __int8 v11 = v8;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to remove corruption info at %@: %@", buf, 0x16u);
    }
    goto LABEL_6;
  }
LABEL_7:
}

- (BOOL)markDatabaseAsDeactivatedWithError:(id *)a3
{
  return [(CPLPrequeliteStore *)self setValue:&off_100292130 forGlobalVariable:self->_deactivatedVar error:a3];
}

- (BOOL)_setupPragmasAndFunctions
{
  return [(PQLConnection *)self->_db cplRegisterIndexSetMatch];
}

- (void)_markLibraryAsCorruptedWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLPrequeliteStore *)self _corruptionMarkerURL];
  [v4 writeToURL:v5 atomically:1];

  id v7 = [(CPLPrequeliteStore *)self abstractObject];
  id v6 = [v7 engineLibrary];
  [v6 reportLibraryCorrupted];
}

- (BOOL)_openWithError:(id *)a3
{
  [(CPLPrequeliteStore *)self _wipeBeforeOpeningIfNecessary];
  id v5 = (PQLConnection *)objc_alloc_init((Class)PQLConnection);
  db = self->_db;
  self->_db = v5;

  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_db);
  id v7 = self->_db;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_10018CA8C;
  v68[3] = &unk_10027F170;
  objc_copyWeak(&v69, &location);
  v70[1] = (id)a2;
  objc_copyWeak(v70, &from);
  [(PQLConnection *)v7 setSqliteErrorHandler:v68];
  unsigned __int8 v8 = self->_db;
  id v9 = [(PQLConnection *)v8 sqliteErrorHandler];
  [(PQLConnection *)v8 setAutoRollbackHandler:v9];

  unsigned __int8 v10 = [(NSURL *)self->_dbURL URLByDeletingLastPathComponent];
  unsigned __int8 v11 = +[NSFileManager defaultManager];
  __int16 v12 = [v10 path];
  unsigned __int8 v13 = [v11 fileExistsAtPath:v12];

  if ((v13 & 1) == 0)
  {
    id v67 = 0;
    unsigned __int8 v14 = [v11 createDirectoryAtURL:v10 withIntermediateDirectories:0 attributes:0 error:&v67];
    id v15 = v67;
    if (v14)
    {
      if (!_CPLSilentLogging)
      {
        unint64_t v16 = sub_10018796C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          unsigned __int8 v17 = [v10 path];
          *(_DWORD *)buf = 138412290;
          v74 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Created store folder at %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v18 = sub_10018796C();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v19 = [v10 path];
          *(_DWORD *)buf = 138412546;
          v74 = v19;
          __int16 v75 = 2112;
          id v76 = v15;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Can't create store folder at %@: %@", buf, 0x16u);
        }
      }
      if (v15) {
        goto LABEL_29;
      }
    }
  }
  unsigned int v20 = self->_db;
  dbURL = self->_dbURL;
  id v66 = 0;
  unsigned __int8 v22 = [(PQLConnection *)v20 openAtURL:dbURL sharedCache:0 error:&v66];
  id v15 = v66;
  if (v22)
  {
    if (self->_showStatsForAllTransactions) {
      [(CPLPrequeliteStore *)self _setupProfilingHooks];
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      unsigned int v23 = sub_10018796C();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = [(NSURL *)self->_dbURL path];
        *(_DWORD *)buf = 138412546;
        v74 = v24;
        __int16 v75 = 2112;
        id v76 = v15;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Can't open store at %@: %@: error", buf, 0x16u);
      }
    }
    char v25 = self->_db;
    self->_db = 0;

    if (v15) {
      goto LABEL_29;
    }
  }
  if ([(PQLConnection *)self->_db setupPragmas]
    && [(CPLPrequeliteStore *)self _setupPragmasAndFunctions])
  {
    if ([(CPLPrequeliteStore *)self _setupDBIfNeeded]) {
      goto LABEL_30;
    }
    id v15 = [(PQLConnection *)self->_db lastCPLError];
    if (v15)
    {
LABEL_29:
      char v27 = 0;
      goto LABEL_44;
    }
    uint64_t v26 = +[CPLErrors underlyingErrorWithReason:@"Impossible to setup database"];
  }
  else
  {
    uint64_t v26 = [(PQLConnection *)self->_db lastCPLError];
  }
  id v15 = (id)v26;
  if (v26) {
    goto LABEL_29;
  }
LABEL_30:
  __int16 v28 = [(CPLPrequeliteStore *)self clientCacheIdentifier];
  unint64_t v29 = [(CPLPrequeliteStore *)self valueForGlobalVariable:self->_clientCacheIdentifierAsKnownByClient];
  unint64_t v30 = v28;
  unint64_t v31 = v29;
  int64_t v32 = (void *)v31;
  if (!v30 || !v31)
  {
    BOOL v36 = (v30 | v31) != 0;

    if (v36) {
      goto LABEL_33;
    }
LABEL_38:
    if (_CPLSilentLogging)
    {
      BOOL v35 = 1;
      goto LABEL_43;
    }
    int64_t v34 = sub_10018796C();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Client is in sync with client cache", buf, 2u);
    }
    BOOL v35 = 1;
    goto LABEL_42;
  }
  unsigned __int8 v33 = [(id)v30 isEqual:v31];

  if (v33) {
    goto LABEL_38;
  }
LABEL_33:
  if (_CPLSilentLogging)
  {
    BOOL v35 = 0;
    goto LABEL_43;
  }
  int64_t v34 = sub_10018796C();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Client is not in sync with client cache", buf, 2u);
  }
  BOOL v35 = 0;
LABEL_42:

LABEL_43:
  self->_isClientInSyncWithClientCache = v35;

  id v15 = 0;
  char v27 = 1;
LABEL_44:
  id v37 = [(CPLPrequeliteStore *)self valueForGlobalVariable:self->_libraryCreationDateVar];
  libraryCreationDate = self->_libraryCreationDate;
  self->_libraryCreationDate = v37;

  if ((v27 & 1) == 0)
  {
    v43 = [(CPLPrequeliteStore *)self corruptionInfo];
    if (v43)
    {
      if (!_CPLSilentLogging)
      {
        __int16 v44 = sub_10018796C();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v74 = v43;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Library has been marked as corrupted. Can't open. Extra information:\n%@", buf, 0xCu);
        }
      }
      uint64_t v45 = +[CPLErrors cplErrorWithCode:3 description:@"Library is corrupted"];

      id v15 = (id)v45;
    }
    if (a3) {
      *a3 = v15;
    }

    goto LABEL_78;
  }
  if (![(CPLSimpleUpgradeHistory *)self->_history versionHasChanged])
  {
    v46 = +[NSUserDefaults standardUserDefaults];
    unsigned int v47 = [v46 BOOLForKey:@"CPLAlwaysCheckDisabledFeatures"];

    if (v47)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v48 = sub_10018796C();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Will request an update of disabled features (at each launch)", buf, 2u);
        }
      }
      if (![(CPLPrequeliteStore *)self setShouldUpdateDisabledFeaturesWithError:a3])goto LABEL_77; {
    }
      }
    goto LABEL_70;
  }
  long long v39 = [(CPLPrequeliteStore *)self disabledFeatures];
  if (![v39 count])
  {

    goto LABEL_70;
  }
  if (!_CPLSilentLogging)
  {
    long long v40 = sub_10018796C();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      long long v41 = [v39 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412290;
      v74 = v41;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Previously disabled features: %@ - will request an update of disabled features", buf, 0xCu);
    }
  }
  unsigned __int8 v42 = [(CPLPrequeliteStore *)self setShouldUpdateDisabledFeaturesWithError:a3];

  if (v42)
  {
LABEL_70:
    if (![(CPLSimpleUpgradeHistory *)self->_history versionHasChanged])
    {
      v49 = +[NSUserDefaults standardUserDefaults];
      unsigned int v50 = [v49 BOOLForKey:@"CPLAlwaysReidentifyScopes"];

      if (!v50) {
        goto LABEL_87;
      }
    }
    uint64_t v51 = [(CPLPrequeliteStore *)self abstractObject];
    v52 = [v51 scopes];
    long long v53 = [v52 platformObject];

    unsigned __int8 v54 = [v53 forceIdentifyUknownScopesWithError:a3];
    if (v54)
    {
LABEL_87:
      if (!self->_reentrencyGuard && self->_didWipeLibrary)
      {
        long long v55 = [(CPLPrequeliteStore *)self abstractObject];
        [v55 noteOtherResetEvent:@"wipe" cause:self->_wipeReason];

        long long v56 = [(CPLPrequeliteStore *)self abstractObject];
        uint64_t v57 = [v56 engineLibrary];
        [v57 notifyAttachedObjectsPullQueueIsFull];

        wipeReason = self->_wipeReason;
        self->_wipeReason = 0;

        self->_didWipeLibrary = 0;
      }
      v59 = [(CPLPrequeliteStore *)self abstractObject];
      uint64_t v60 = [v59 engineLibrary];
      v61 = [v60 libraryIdentifier];
      +[CPLPrequelitePreventWipeNotification resetNotificationForLibraryIdentifier:v61];

      id v15 = 0;
      BOOL v62 = 1;
      goto LABEL_80;
    }
  }
LABEL_77:
  id v15 = 0;
LABEL_78:
  uint64_t v63 = self->_db;
  if (!v63)
  {
    BOOL v62 = 0;
    goto LABEL_82;
  }
  [(PQLConnection *)v63 close:0];
  BOOL v62 = 0;
  v59 = self->_db;
  self->_db = 0;
LABEL_80:

LABEL_82:
  objc_destroyWeak(v70);
  objc_destroyWeak(&v69);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v62;
}

- (BOOL)openWithError:(id *)a3
{
  id v5 = [CPLSimpleUpgradeHistory alloc];
  id v6 = [(CPLPrequeliteStore *)self abstractObject];
  id v7 = [v6 engineLibrary];
  unsigned __int8 v8 = [v7 libraryIdentifier];
  id v9 = [(CPLSimpleUpgradeHistory *)v5 initWithLibraryIdentifier:v8];
  history = self->_history;
  self->_history = v9;

  id v18 = 0;
  BOOL v11 = [(CPLPrequeliteStore *)self _openWithError:&v18];
  id v12 = v18;
  if (v11)
  {
    if (!_CPLSilentLogging)
    {
      unsigned __int8 v13 = sub_10018796C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v14 = [(PQLConnection *)self->_db userVersion];
        id v15 = [v14 longLongValue];
        *(_DWORD *)buf = 134217984;
        id v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Opened storage with version %lld", buf, 0xCu);
      }
    }
    [(CPLPrequeliteStore *)self _scheduleClientCacheDropIfNecessary];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      unint64_t v16 = sub_10018796C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to open database: %@", buf, 0xCu);
      }
    }
    if (a3) {
      *a3 = v12;
    }
  }

  return v11;
}

- (BOOL)executePostOpenWithError:(id *)a3
{
  if (self->_needsToReset)
  {
    id v5 = [(CPLPrequeliteStore *)self abstractObject];
    id v6 = v5;
    switch(self->_resetOption)
    {
      case 0uLL:
        unsigned __int8 v7 = [v5 resetLocalSyncStateWithCause:self->_resetReason error:a3];
        goto LABEL_9;
      case 1uLL:
        unsigned __int8 v7 = [v5 resetCompleteSyncStateWithCause:self->_resetReason error:a3];
        goto LABEL_9;
      case 2uLL:
        unsigned __int8 v7 = [v5 resetCompleteSyncStateIncludingIDMappingWithCause:self->_resetReason error:a3];
        goto LABEL_9;
      case 3uLL:
        unsigned __int8 v7 = [v5 resetSyncAnchorWithCause:self->_resetReason error:a3];
LABEL_9:
        BOOL v8 = v7;
        break;
      default:
        BOOL v8 = 1;
        break;
    }
  }
  else
  {
    BOOL v8 = 1;
  }
  self->_needsToReset = 0;
  resetReason = self->_resetReason;
  self->_resetReason = 0;

  self->_unint64_t resetOption = 0;
  return v8;
}

- (void)performReadTransaction:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10018D45C;
  v14[3] = &unk_100275D40;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100192E24;
  block[3] = &unk_100275DF8;
  id v18 = v9;
  unsigned __int8 v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

- (void)performWriteTransaction:(id)a3 withBlock:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 blocker];
  id v12 = v11;
  if (v11)
  {
    dispatch_block_t v13 = [v11 bypassQueue];
  }
  else
  {
    dispatch_block_t v13 = self->_writeQueue;
  }
  unsigned __int8 v14 = v13;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10018D9A0;
  v21[3] = &unk_1002772B8;
  v21[4] = self;
  id v22 = v8;
  id v23 = v10;
  id v24 = v9;
  id v15 = v21;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100192E24;
  block[3] = &unk_100275DF8;
  id v26 = v15;
  id v16 = v14;
  id v17 = v9;
  id v18 = v10;
  id v19 = v8;
  dispatch_block_t v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v16, v20);
}

- (void)blockWriteTransactionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  writeQueue = self->_writeQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10018DDFC;
  v10[3] = &unk_100276288;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100192E24;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  id v7 = writeQueue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (BOOL)closeWithError:(id *)a3
{
  unsigned __int8 v4 = [(PQLConnection *)self->_db close:a3];
  db = self->_db;
  self->_db = 0;

  return v4;
}

- (void)performBarrierTransaction:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10018DFE0;
  v11[3] = &unk_100275DF8;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100192E24;
  block[3] = &unk_100275DF8;
  id v14 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)performBarrier
{
}

- (unint64_t)libraryOptions
{
  v2 = [(CPLPrequeliteStore *)self valueForGlobalVariable:self->_libraryOptionsVar];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (BOOL)updateLibraryOptions:(unint64_t)a3 error:(id *)a4
{
  unint64_t v7 = [(CPLPrequeliteStore *)self libraryOptions];
  unint64_t v8 = v7;
  if ((v7 & ~a3) != 0)
  {
    id v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"downgrading library options from 0x%lx to 0x%lx", v7, a3);
    if ([(id)objc_opt_class() shouldPreventWipeOnUpgrade]
      && ![(CPLPrequeliteStore *)self _hasDeactivateMarker])
    {
      if (a4)
      {
        *a4 = +[CPLErrors preventWipeErrorWithReason:v16 preventedByUser:0];
      }
    }
    else if (a4)
    {
      uint64_t v18 = CPLErrorWipeReasonKey;
      id v19 = v16;
      id v17 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      *a4 = +[CPLErrors cplErrorWithCode:2003, 0, v17, @"Downgrading options of a library (from 0x%lx to 0x%lx)", v8, a3 underlyingError userInfo description];
    }
  }
  else
  {
    unint64_t v9 = a3 & ~v7;
    if (!v9) {
      return 1;
    }
    dispatch_block_t v10 = +[NSNumber numberWithUnsignedInteger:a3];
    unsigned int v11 = [(CPLPrequeliteStore *)self setValue:v10 forGlobalVariable:self->_libraryOptionsVar error:a4];

    if (v11)
    {
      id v12 = [(CPLPrequeliteStore *)self abstractObject];
      id v13 = [v12 scopes];
      unsigned __int8 v14 = [v13 upgradeScopesWithNewLibraryOptions:v9 error:a4];

      return v14;
    }
  }
  return 0;
}

- (id)libraryVersion
{
  return [(CPLPrequeliteStore *)self valueForGlobalVariable:self->_libraryVersionVar];
}

- (BOOL)storeLibraryVersion:(id)a3 withError:(id *)a4
{
  return [(CPLPrequeliteStore *)self setValue:a3 forGlobalVariable:self->_libraryVersionVar error:a4];
}

- (id)createNewLibraryVersion
{
  v2 = +[NSUUID UUID];
  id v3 = [v2 UUIDString];

  return v3;
}

- (id)pqlConnection
{
  return self->_db;
}

- (void)_cacheValue:(id)a3 forVariable:(id)a4
{
  modifiedVariables = self->_modifiedVariables;
  id v7 = a4;
  id v8 = a3;
  [(NSMutableSet *)modifiedVariables addObject:v7];
  [v7 setCachedValue:v8 forIdentifier:self->_globalVariableCacheIdentifier];
}

- (BOOL)addGlobalVariable:(id)a3 defaultValue:(id)a4 error:(id *)a5
{
  id v8 = (CPLPrequeliteStore *)a3;
  id v9 = a4;
  if (!_CPLSilentLogging)
  {
    dispatch_block_t v10 = sub_10018796C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v11 = [(CPLPrequeliteStore *)v8 type];
      *(_DWORD *)buf = 138413058;
      id v26 = self;
      __int16 v27 = 2112;
      __int16 v28 = v8;
      __int16 v29 = 2112;
      id v30 = v11;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@ adding global variable %@ (%@ - default:%@)", buf, 0x2Au);
    }
  }
  db = self->_db;
  id v13 = [(CPLPrequeliteStore *)v8 columnDefinition];
  LODWORD(db) = [(PQLConnection *)db cplExecute:@"ALTER TABLE globals ADD COLUMN %@", v13];

  if (db)
  {
    unint64_t v14 = (unint64_t)v9;
    id v15 = [(CPLPrequeliteStore *)v8 defaultValue];
    unint64_t v16 = (unint64_t)v15;
    if (v14 && v15)
    {
      unsigned __int8 v17 = [(id)v14 isEqual:v15];

      if (v17) {
        goto LABEL_12;
      }
    }
    else
    {

      if (!(v14 | v16))
      {
LABEL_12:
        [(CPLPrequeliteStore *)self _cacheValue:v14 forVariable:v8];
        BOOL v20 = 1;
        goto LABEL_20;
      }
    }
    uint64_t v18 = self->_db;
    id v19 = [(CPLPrequeliteStore *)v8 bindableValueForValue:v14];
    LOBYTE(v18) = [(PQLConnection *)v18 cplExecute:@"UPDATE globals SET %@ = %@", v8, v19];

    if (v18) {
      goto LABEL_12;
    }
  }
  if (!_CPLSilentLogging)
  {
    id v21 = sub_10018796C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = [(CPLPrequeliteStore *)v8 type];
      id v23 = [(PQLConnection *)self->_db lastCPLError];
      *(_DWORD *)buf = 138413058;
      id v26 = v8;
      __int16 v27 = 2112;
      __int16 v28 = v22;
      __int16 v29 = 2112;
      id v30 = v9;
      __int16 v31 = 2112;
      id v32 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unable to add global variable %@ (%@ - default: %@) to database: %@", buf, 0x2Au);
    }
  }
  if (a5)
  {
    [(PQLConnection *)self->_db lastCPLError];
    BOOL v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_20:

  return v20;
}

- (BOOL)setValue:(id)a3 forGlobalVariable:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  db = self->_db;
  unsigned int v11 = [v9 bindableValueForValue:v8];
  unsigned __int8 v12 = [(PQLConnection *)db cplExecute:@"UPDATE globals SET %@ = %@", v9, v11];

  if (v12)
  {
    [(CPLPrequeliteStore *)self _cacheValue:v8 forVariable:v9];
  }
  else if (a5)
  {
    *a5 = [(PQLConnection *)self->_db lastCPLError];
  }

  return v12;
}

- (id)valueForGlobalVariable:(id)a3
{
  id v4 = a3;
  if ([v4 hasCachedValueForIdentifier:self->_globalVariableCacheIdentifier])
  {
    id v5 = [v4 cachedValueForIdentifier:self->_globalVariableCacheIdentifier];
  }
  else
  {
    db = self->_db;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10018E7F8;
    v9[3] = &unk_10027EE80;
    id v7 = v4;
    id v10 = v7;
    id v5 = [(PQLConnection *)db cplFetchObject:v9, @"SELECT %@ FROM globals", v7 sql];
    [(CPLPrequeliteStore *)self _cacheValue:v5 forVariable:v7];
  }
  return v5;
}

- (BOOL)resetValueForGlobalVariable:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 defaultValue];
  LOBYTE(a4) = [(CPLPrequeliteStore *)self setValue:v7 forGlobalVariable:v6 error:a4];

  return (char)a4;
}

- (Class)_userIdentifierClass
{
  Class userIdentifierClass = self->_userIdentifierClass;
  if (!userIdentifierClass)
  {
    id v5 = [(CPLPrequeliteStore *)self abstractObject];
    id v6 = [v5 engineLibrary];
    id v7 = [v6 transport];
    self->_Class userIdentifierClass = (Class)[v7 userIdentifierClass];

    Class userIdentifierClass = self->_userIdentifierClass;
    if (!userIdentifierClass) {
      sub_1001D185C((uint64_t)a2, (uint64_t)self);
    }
  }
  return userIdentifierClass;
}

- (id)userIdentifier
{
  id v3 = [(CPLPrequeliteStore *)self valueForGlobalVariable:self->_userIdentifierVar];
  if (v3)
  {
    id v4 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:v3 class:[(CPLPrequeliteStore *)self _userIdentifierClass]];
    if (!v4)
    {
      id v5 = +[NSUUID UUID];
      id v4 = [v5 UUIDString];

      if (!_CPLSilentLogging)
      {
        id v6 = sub_10018796C();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          int v8 = 138412290;
          id v9 = v4;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Can't decode user identifier, will use a fake user identifier (%@) and we will reset everything", (uint8_t *)&v8, 0xCu);
        }
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)storeUserIdentifier:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    int v8 = +[NSKeyedArchiver cpl_archivedDataWithRootObject:v7];
    if (!v8) {
      sub_1001D1914((uint64_t)v7, (uint64_t)a2, (uint64_t)self);
    }
  }
  else
  {
    int v8 = 0;
  }
  userIdentifierVar = self->_userIdentifierVar;
  id v14 = 0;
  BOOL v10 = [(CPLPrequeliteStore *)self setValue:v8 forGlobalVariable:userIdentifierVar error:&v14];
  id v11 = v14;
  if (!v10)
  {
    if (!_CPLSilentLogging)
    {
      unsigned __int8 v12 = sub_10018796C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v16 = v7;
        __int16 v17 = 2112;
        id v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Can't save user identifier %@: %@", buf, 0x16u);
      }
    }
    if (a4) {
      *a4 = v11;
    }
  }

  return v10;
}

- (id)lastQuarantineCountReportDate
{
  v2 = [(CPLPrequeliteStore *)self valueForGlobalVariable:self->_lastQuarantineCountReportDateVar];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[NSDate distantPast];
  }
  id v5 = v4;

  return v5;
}

- (BOOL)storeLastQuarantineCountReportDate:(id)a3 error:(id *)a4
{
  return [(CPLPrequeliteStore *)self setValue:a3 forGlobalVariable:self->_lastQuarantineCountReportDateVar error:a4];
}

- (id)clientCacheIdentifier
{
  return [(CPLPrequeliteStore *)self valueForGlobalVariable:self->_clientCacheIdentifierVar];
}

- (BOOL)storeClientCacheIdentifier:(id)a3 error:(id *)a4
{
  return [(CPLPrequeliteStore *)self setValue:a3 forGlobalVariable:self->_clientCacheIdentifierVar error:a4];
}

- (id)createNewClientCacheIdentifier
{
  v2 = +[NSUUID UUID];
  id v3 = [v2 UUIDString];

  return v3;
}

- (BOOL)storeClientIsInSyncWithClientCacheWithError:(id *)a3
{
  if (self->_isClientInSyncWithClientCache) {
    return 1;
  }
  id v5 = [(CPLPrequeliteStore *)self clientCacheIdentifier];
  LODWORD(a3) = [(CPLPrequeliteStore *)self setValue:v5 forGlobalVariable:self->_clientCacheIdentifierAsKnownByClient error:a3];

  if (a3)
  {
    id v6 = [(CPLPrequeliteStore *)self abstractObject];
    id v7 = [v6 engineLibrary];
    int v8 = [v7 scheduler];
    [v8 noteClientIsInSyncWithClientCache];

    isClientInSyncWithClientCacheQueue = self->_isClientInSyncWithClientCacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10018EEA8;
    block[3] = &unk_100275EA0;
    void block[4] = self;
    dispatch_sync((dispatch_queue_t)isClientInSyncWithClientCacheQueue, block);
    return 1;
  }
  return 0;
}

- (BOOL)storeClientIsNotInSyncWithClientCacheWithError:(id *)a3
{
  if (!self->_isClientInSyncWithClientCache) {
    return 1;
  }
  id v5 = [(CPLPrequeliteStore *)self abstractObject];
  id v6 = [v5 engineLibrary];
  id v7 = [v6 scheduler];
  [v7 noteClientIsNotInSyncWithClientCache];

  isClientInSyncWithClientCacheQueue = self->_isClientInSyncWithClientCacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018F034;
  block[3] = &unk_100275EA0;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)isClientInSyncWithClientCacheQueue, block);
  return [(CPLPrequeliteStore *)self setValue:0 forGlobalVariable:self->_clientCacheIdentifierAsKnownByClient error:a3];
}

- (BOOL)isClientInSyncWithClientCache
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isClientInSyncWithClientCacheQueue = self->_isClientInSyncWithClientCacheQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10018F170;
  v5[3] = &unk_100275F88;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)isClientInSyncWithClientCacheQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)storePushPullGatekeepers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  self->_hasCachedPushPullGatekeepers = 1;
  self->_hasModifiedPushPullGatekeepers = 1;
  if (![v6 count])
  {
    cachedPushPullGatekeepers = self->_cachedPushPullGatekeepers;
    self->_cachedPushPullGatekeepers = 0;

    if ([(CPLPrequeliteStore *)self setValue:0 forGlobalVariable:self->_pushPullGatekeepersVar error:a4])
    {
      goto LABEL_13;
    }
LABEL_15:
    self->_hasCachedPushPullGatekeepers = 0;
    self->_hasModifiedPushPullGatekeepers = 0;
    id v22 = self->_cachedPushPullGatekeepers;
    self->_cachedPushPullGatekeepers = 0;

    BOOL v21 = 0;
    goto LABEL_16;
  }
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v6;
  char v9 = (char *)[v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    BOOL v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (objc_class *)objc_opt_class();
        id v14 = NSStringFromClass(v13);
        [v7 addObject:v14];
      }
      BOOL v10 = (char *)[v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  id v15 = (NSArray *)[v8 copy];
  id v16 = self->_cachedPushPullGatekeepers;
  self->_cachedPushPullGatekeepers = v15;

  uint64_t v17 = +[NSPropertyListSerialization dataWithPropertyList:v7 format:200 options:0 error:a4];
  if (!v17)
  {

    goto LABEL_15;
  }
  id v18 = (void *)v17;
  unsigned __int8 v19 = [(CPLPrequeliteStore *)self setValue:v17 forGlobalVariable:self->_pushPullGatekeepersVar error:a4];

  if ((v19 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  BOOL v21 = 1;
LABEL_16:

  return v21;
}

- (NSArray)pushPullGatekeepers
{
  v2 = self;
  if (self->_hasCachedPushPullGatekeepers)
  {
    char v3 = self->_cachedPushPullGatekeepers;
    goto LABEL_34;
  }
  self->_hasCachedPushPullGatekeepers = 1;
  self->_hasModifiedPushPullGatekeepers = 0;
  id v4 = [(CPLPrequeliteStore *)self valueForGlobalVariable:self->_pushPullGatekeepersVar];
  if ([v4 length])
  {
    id v30 = 0;
    id v5 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v30];
    id v6 = (NSArray *)v30;
    id v7 = v6;
    if (v5)
    {
      id v22 = v6;
      long long v24 = v4;
      long long v25 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
      id v23 = v2;
      id v8 = [(CPLPrequeliteStore *)v2 abstractObject];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      BOOL v21 = v5;
      id v9 = v5;
      id v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (!v10) {
        goto LABEL_24;
      }
      id v11 = v10;
      uint64_t v12 = *(void *)v27;
      while (1)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(NSString **)(*((void *)&v26 + 1) + 8 * i);
          Class v15 = NSClassFromString(v14);
          if (v15
            && (id v16 = v15, [(objc_class *)v15 isSubclassOfClass:objc_opt_class()]))
          {
            uint64_t v17 = [[v16 alloc] initWithStore:v8];
            if (v17)
            {
              [(NSArray *)v25 addObject:v17];
            }
            else if (!_CPLSilentLogging)
            {
              id v18 = sub_10018796C();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                unsigned __int8 v33 = v16;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Ignoring push/pull gatekeeper %@", buf, 0xCu);
              }
            }
          }
          else
          {
            if (_CPLSilentLogging) {
              continue;
            }
            uint64_t v17 = sub_10018796C();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              unsigned __int8 v33 = v14;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Invalid push/pull gatekeeper class: %{public}@", buf, 0xCu);
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (!v11)
        {
LABEL_24:

          char v3 = v25;
          if ([(NSArray *)v25 count])
          {
            objc_storeStrong((id *)&v23->_cachedPushPullGatekeepers, v25);

            id v4 = v24;
            cachedPushPullGatekeepers = v22;
            goto LABEL_33;
          }

          v2 = v23;
          id v4 = v24;
          id v5 = v21;
          id v7 = v22;
LABEL_30:

          goto LABEL_31;
        }
      }
    }
    if (!_CPLSilentLogging)
    {
      sub_10018796C();
      char v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        unsigned __int8 v33 = v7;
        _os_log_impl((void *)&_mh_execute_header, &v3->super, OS_LOG_TYPE_ERROR, "Invalid plist for push/pull gatekeepers: %@", buf, 0xCu);
      }
      goto LABEL_30;
    }
LABEL_31:
  }
  char v3 = 0;
  cachedPushPullGatekeepers = v2->_cachedPushPullGatekeepers;
  v2->_cachedPushPullGatekeepers = 0;
LABEL_33:

LABEL_34:
  return v3;
}

- (BOOL)hasStoredChangeSessionUpdate
{
  if (self->_hasCachedChangeSessionUpdate) {
    return self->_cachedChangeSessionUpdate != 0;
  }
  id v3 = [(PQLConnection *)self->_db fetchObjectOfClass:objc_opt_class(), @"SELECT count(*) FROM globals WHERE %@ IS NOT NULL", self->_changeSessionUpdateVar sql];
  BOOL v2 = [v3 unsignedIntegerValue] != 0;

  return v2;
}

- (CPLChangeSessionUpdate)storedChangeSessionUpdate
{
  if (self->_hasCachedChangeSessionUpdate)
  {
    id v3 = self->_cachedChangeSessionUpdate;
    goto LABEL_11;
  }
  id v5 = [(CPLPrequeliteStore *)self valueForGlobalVariable:self->_changeSessionUpdateVar];
  if (!v5) {
    goto LABEL_9;
  }
  id v3 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:v5 class:objc_opt_class()];
  if (!v3)
  {
    if (!_CPLSilentLogging)
    {
      id v6 = sub_10018796C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Can't decode stored change session update", v8, 2u);
      }
    }
LABEL_9:
    id v3 = 0;
  }
  self->_hasCachedChangeSessionUpdate = 1;
  objc_storeStrong((id *)&self->_cachedChangeSessionUpdate, v3);

LABEL_11:
  return v3;
}

- (BOOL)storeChangeSessionUpdate:(id)a3 error:(id *)a4
{
  id v8 = a3;
  if (v8)
  {
    uint64_t v10 = +[NSKeyedArchiver cpl_archivedDataWithRootObject:v8];
    if (!v10) {
      sub_1001D1AC0((uint64_t)v8, (uint64_t)a2, (uint64_t)self);
    }
    id v11 = (void *)v10;
    changeSessionUpdateVar = self->_changeSessionUpdateVar;
    id v20 = 0;
    unsigned __int8 v13 = [(CPLPrequeliteStore *)self setValue:v10 forGlobalVariable:changeSessionUpdateVar error:&v20];
    id v14 = v20;

    if (v13) {
      goto LABEL_4;
    }
  }
  else
  {
    id v16 = self->_changeSessionUpdateVar;
    id v19 = 0;
    unsigned __int8 v17 = [(CPLPrequeliteStore *)self setValue:0 forGlobalVariable:v16 error:&v19];
    id v14 = v19;
    if (v17)
    {
LABEL_4:
      BOOL v15 = 1;
      self->_hasCachedChangeSessionUpdate = 1;
      objc_storeStrong((id *)&self->_cachedChangeSessionUpdate, a3);
      goto LABEL_9;
    }
  }
  if (a4)
  {
    id v14 = v14;
    BOOL v15 = 0;
    *a4 = v14;
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_9:

  return v15;
}

- (BOOL)shouldUpdateDisabledFeatures
{
  BOOL v2 = [(CPLPrequeliteStore *)self valueForGlobalVariable:self->_shouldUpdateDisabledFeaturesVar];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)setShouldUpdateDisabledFeaturesWithError:(id *)a3
{
  return [(CPLPrequeliteStore *)self setValue:&off_100292130 forGlobalVariable:self->_shouldUpdateDisabledFeaturesVar error:a3];
}

- (BOOL)storeDisabledFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:a4];
    if (!v7) {
      goto LABEL_7;
    }
  }
  else
  {
    id v7 = 0;
  }
  if (![(CPLPrequeliteStore *)self setValue:v7 forGlobalVariable:self->_disabledFeaturesDataVar error:a4])
  {
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  BOOL v8 = [(CPLPrequeliteStore *)self setValue:&off_100292118 forGlobalVariable:self->_shouldUpdateDisabledFeaturesVar error:0];
LABEL_8:

  return v8;
}

- (id)disabledFeatures
{
  BOOL v2 = [(CPLPrequeliteStore *)self valueForGlobalVariable:self->_disabledFeaturesDataVar];
  if (v2)
  {
    unsigned __int8 v3 = +[NSPropertyListSerialization propertyListWithData:v2 options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  unsigned __int8 v3 = 0;
LABEL_5:
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = &__NSArray0__struct;
  }
  id v5 = v4;

  return v5;
}

- (id)derivativesFilter
{
  BOOL v2 = [(CPLPrequeliteStore *)self valueForGlobalVariable:self->_derivativesFilterVar];
  if (v2)
  {
    unsigned __int8 v3 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:v2 class:objc_opt_class()];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)storeDerivativesFilter:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v8 = +[NSKeyedArchiver cpl_archivedDataWithRootObject:v7];
  if (!v8) {
    sub_1001D1BA0((uint64_t)v7, (uint64_t)a2, (uint64_t)self);
  }
  id v9 = (void *)v8;
  BOOL v10 = [(CPLPrequeliteStore *)self setValue:v8 forGlobalVariable:self->_derivativesFilterVar error:a4];

  return v10;
}

+ (id)_wipeStoreMarkerURLWithCloudLibraryStateStorageURL:(id)a3
{
  return [a3 URLByAppendingPathComponent:@"wipe_marker"];
}

- (id)_wipeStoreMarkerURL
{
  BOOL v2 = [(CPLPrequeliteStore *)self abstractObject];
  unsigned __int8 v3 = [v2 engineLibrary];
  id v4 = [v3 cloudLibraryStateStorageURL];
  id v5 = +[CPLPrequeliteStore _wipeStoreMarkerURLWithCloudLibraryStateStorageURL:v4];

  return v5;
}

+ (void)_writeStoreMarkerAtURL:(id)a3 reason:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSFileManager defaultManager];
  uint64_t v8 = [v5 path];
  unsigned __int8 v9 = [v7 fileExistsAtPath:v8];

  if ((v9 & 1) == 0)
  {
    id v15 = 0;
    unsigned __int8 v10 = [v6 writeToURL:v5 atomically:1 encoding:4 error:&v15];
    id v11 = v15;
    if (v10)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v12 = sub_10018796C();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v13 = [v5 URLByDeletingLastPathComponent];
          id v14 = [v13 path];
          *(_DWORD *)buf = 138412546;
          unsigned __int8 v17 = v14;
          __int16 v18 = 2114;
          id v19 = v6;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Will wipe CPL database at %@ at next launch: %{public}@", buf, 0x16u);

LABEL_9:
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (!_CPLSilentLogging)
    {
      uint64_t v12 = sub_10018796C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v13 = [v5 path];
        *(_DWORD *)buf = 138412802;
        unsigned __int8 v17 = v13;
        __int16 v18 = 2114;
        id v19 = v6;
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to store wipe marker at %@ (reason: %{public}@): %@", buf, 0x20u);
        goto LABEL_9;
      }
LABEL_10:
    }
  }
}

+ (void)wipeStoreAtNextOpeningWithCloudLibraryStorageURL:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _wipeStoreMarkerURLWithCloudLibraryStateStorageURL:a3];
  [a1 _writeStoreMarkerAtURL:v7 reason:v6];
}

- (id)wipeReason
{
  BOOL v2 = [(CPLPrequeliteStore *)self _wipeStoreMarkerURL];
  id v3 = [objc_alloc((Class)NSString) initWithContentsOfURL:v2 encoding:4 error:0];
  id v4 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return v5;
}

- (void)_deleteWipeReason
{
  BOOL v2 = [(CPLPrequeliteStore *)self _wipeStoreMarkerURL];
  id v3 = +[NSFileManager defaultManager];
  id v9 = 0;
  unsigned __int8 v4 = [v3 removeItemAtURL:v2 error:&v9];
  id v5 = v9;
  if (v4)
  {
LABEL_6:

    goto LABEL_7;
  }
  id v6 = +[NSFileManager defaultManager];
  unsigned __int8 v7 = [v6 cplIsFileDoesNotExistError:v5];

  if ((v7 & 1) == 0 && !_CPLSilentLogging)
  {
    id v3 = sub_10018796C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [v2 path];
      *(_DWORD *)buf = 138412546;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to remove wipe reason at %@: %@", buf, 0x16u);
    }
    goto LABEL_6;
  }
LABEL_7:
}

- (void)wipeStoreAtNextOpeningWithReason:(id)a3 completionBlock:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = a3;
  id v8 = [(CPLPrequeliteStore *)self _wipeStoreMarkerURL];
  +[CPLPrequeliteStore _writeStoreMarkerAtURL:v8 reason:v7];

  v6[2](v6);
}

- (void)writeTransactionDidSucceed
{
}

- (void)writeTransactionDidFail
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_modifiedVariables;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v7), "discardCachedValue", (void)v10);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_modifiedVariables removeAllObjects];
  self->_hasCachedChangeSessionUpdate = 0;
  cachedChangeSessionUpdate = self->_cachedChangeSessionUpdate;
  self->_cachedChangeSessionUpdate = 0;

  if (self->_hasModifiedPushPullGatekeepers)
  {
    self->_hasCachedPushPullGatekeepers = 0;
    cachedPushPullGatekeepers = self->_cachedPushPullGatekeepers;
    self->_cachedPushPullGatekeepers = 0;
  }
}

- (id)status
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = [(PQLConnection *)self->_db userVersion];
  id v5 = [v3 initWithFormat:@"db version: %@", v4];

  uint64_t v6 = [(CPLSimpleUpgradeHistory *)self->_history status];
  if ([v6 length]) {
    [v5 appendFormat:@"\n%@", v6];
  }

  return v5;
}

- (void)recordUpgradeEvent:(id)a3
{
  [(CPLPrequeliteStore *)self recordUpgradeEvent:a3 arguments:&v3];
}

- (void)recordUpgradeEvent:(id)a3 arguments:(char *)a4
{
  if (self->_upgradeEventJournal != -1)
  {
    id v6 = a3;
    id v7 = [objc_alloc((Class)NSString) initWithFormat:v6 arguments:a4];

    id v11 = v7;
    id v8 = (const char *)[v11 UTF8String];
    if (v8)
    {
      id v9 = v8;
      size_t v10 = strlen(v8);
      write(self->_upgradeEventJournal, v9, v10);
      write(self->_upgradeEventJournal, "\n", 1uLL);
    }
  }
}

- (BOOL)tableHasRecords:(id)a3
{
  db = self->_db;
  id v4 = a3;
  id v5 = [(PQLConnection *)db cplFetchObjectOfClass:objc_opt_class(), @"SELECT rowid FROM %@ LIMIT 1", v4 sql];

  return v5 != 0;
}

- (BOOL)table:(id)a3 hasRecordsMatchingQuery:(id)a4
{
  db = self->_db;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PQLConnection *)db cplFetchObjectOfClass:objc_opt_class(), @"SELECT rowid FROM %@ WHERE %@ LIMIT 1", v7, v6 sql];

  return v8 != 0;
}

- (unint64_t)tableCountOfRecords:(id)a3
{
  db = self->_db;
  id v4 = a3;
  id v5 = [(PQLConnection *)db cplFetchObjectOfClass:objc_opt_class(), @"SELECT COUNT(rowid) FROM %@", v4 sql];

  id v6 = [v5 unsignedIntegerValue];
  return (unint64_t)v6;
}

- (unint64_t)table:(id)a3 countOfRecordsMatchingQuery:(id)a4
{
  db = self->_db;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PQLConnection *)db cplFetchObjectOfClass:objc_opt_class(), @"SELECT COUNT(rowid) FROM %@ WHERE %@", v7, v6 sql];

  id v9 = [v8 unsignedIntegerValue];
  return (unint64_t)v9;
}

- (void)table:(id)a3 enumerateCountGroupedByUnsignedIntegerProperty:(id)a4 block:(id)a5
{
  id v11 = a3;
  id v8 = (void (**)(id, void, id))a5;
  id v9 = +[PQLNameInjection nameWithString:a4];
  id v10 = [(PQLConnection *)self->_db cplFetch:@"SELECT %@, count(%@) FROM %@ GROUP BY %@", v9, v9, v11, v9];
  if ([v10 next])
  {
    do
      v8[2](v8, (int)[v10 intAtIndex:0], objc_msgSend(v10, "unsignedIntegerAtIndex:", 1));
    while (([v10 next] & 1) != 0);
  }
}

- (void)table:(id)a3 enumerateCountGroupedByProperty:(id)a4 block:(id)a5
{
  id v12 = a3;
  id v8 = (void (**)(id, void *, id))a5;
  id v9 = +[PQLNameInjection nameWithString:a4];
  id v10 = [(PQLConnection *)self->_db cplFetch:@"SELECT %@, count(%@) FROM %@ GROUP BY %@", v9, v9, v12, v9];
  if ([v10 next])
  {
    do
    {
      id v11 = [v10 objectAtIndex:0];
      v8[2](v8, v11, [v10 unsignedIntegerAtIndex:1]);
    }
    while (([v10 next] & 1) != 0);
  }
}

- (BOOL)table:(id)a3 hasColumnWithName:(id)a4
{
  unint64_t v6 = (unint64_t)a4;
  id v7 = [(PQLConnection *)self->_db fetch:@"PRAGMA table_info(%@)", a3];
  do
  {
    unsigned int v8 = [v7 next];
    if (!v8) {
      break;
    }
    id v9 = [v7 stringAtIndex:1];
    unint64_t v10 = (unint64_t)v9;
    if (v6 && v9 && ([v9 isEqual:v6] & 1) != 0)
    {

      break;
    }
  }
  while (v6 | v10);

  return v8;
}

- (BOOL)hasTable:(id)a3
{
  id v3 = [(PQLConnection *)self->_db fetch:@"PRAGMA table_info(%@)", a3];
  unsigned __int8 v4 = [v3 next];

  return v4;
}

- (id)clientCache
{
  clientCacheMigrator = self->_clientCacheMigrator;
  if (!clientCacheMigrator) {
    sub_1001D1C80((uint64_t)a2, (uint64_t)self);
  }
  return [(CPLPrequeliteClientCacheMigrator *)clientCacheMigrator platformObject];
}

- (id)cloudCache
{
  BOOL v2 = [(CPLPrequeliteStore *)self abstractObject];
  id v3 = [v2 cloudCache];
  unsigned __int8 v4 = [v3 platformObject];

  return v4;
}

- (id)transientPullRepository
{
  BOOL v2 = [(CPLPrequeliteStore *)self abstractObject];
  id v3 = [v2 transientPullRepository];
  unsigned __int8 v4 = [v3 platformObject];

  return v4;
}

- (void)_notifyVacuumDidComplete
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = self->_vacuumCompletionHandlers;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v7) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v7));
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  vacuumCompletionHandlers = self->_vacuumCompletionHandlers;
  self->_vacuumCompletionHandlers = 0;
}

- (int64_t)_sizeInBytes
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(PQLConnection *)self->_db fetchObjectOfClass:objc_opt_class() sql:@"PRAGMA page_count"];
  id v4 = [(PQLConnection *)self->_db fetchObjectOfClass:objc_opt_class() sql:@"PRAGMA page_size"];
  id v5 = [v3 longLongValue];
  int64_t v6 = (void)[v4 longLongValue] * (void)v5;

  return v6;
}

- (void)_vacuum:(int64_t)a3 withInitialDatabaseSize:(int64_t)a4
{
  vacuumQueue = self->_vacuumQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100190FF8;
  v8[3] = &unk_10027F208;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  id v5 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100192E24;
  block[3] = &unk_100275DF8;
  id v10 = v5;
  int64_t v6 = vacuumQueue;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);
}

- (void)startVacuumWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100191620;
  v10[3] = &unk_100276288;
  v10[4] = self;
  id v11 = v4;
  int64_t v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100192E24;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  dispatch_block_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)stopVacuum
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001918F0;
  v6[3] = &unk_100275EA0;
  v6[4] = self;
  id v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100192E24;
  block[3] = &unk_100275DF8;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)emergencyClose
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  p_emergencyCloseLock = &self->_emergencyCloseLock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  id v16 = sub_100191BE4;
  unsigned __int8 v17 = &unk_1002768A8;
  __int16 v18 = self;
  id v19 = &v20;
  id v4 = v15;
  os_unfair_lock_lock(p_emergencyCloseLock);
  v16((uint64_t)v4);
  os_unfair_lock_unlock(p_emergencyCloseLock);

  if (*((unsigned char *)v21 + 24))
  {
    if (!_CPLSilentLogging)
    {
      dispatch_block_t v5 = sub_10018796C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        queue = self->_queue;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = queue;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting emergency close of %@ - suspending %@", buf, 0x16u);
      }
    }
    dispatch_block_t v7 = dispatch_queue_create("com.apple.cpl.emergencyclose", 0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    char v25 = 0;
    dispatch_time_t v8 = dispatch_time(0, 10000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100191C14;
    block[3] = &unk_100275F88;
    void block[4] = self;
    void block[5] = buf;
    dispatch_after(v8, v7, block);
    dispatch_block_t v9 = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100191CE8;
    v11[3] = &unk_100277D10;
    void v11[4] = self;
    long long v12 = v7;
    id v13 = buf;
    id v10 = v7;
    dispatch_sync((dispatch_queue_t)v9, v11);

    _Block_object_dispose(buf, 8);
  }
  _Block_object_dispose(&v20, 8);
}

- (void)markAsCorrupted
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100191F34;
  v6[3] = &unk_100275EA0;
  v6[4] = self;
  id v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100192E24;
  block[3] = &unk_100275DF8;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (BOOL)createStoragesDynamically:(id)a3 error:(id *)a4
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = a3;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v12, "shouldBeCreatedDynamically", (void)v19) & 1) == 0) {
          sub_1001D1D38((uint64_t)v12, (uint64_t)a2, (uint64_t)self);
        }
        id v13 = [v12 platformObject];
        if (([v13 createStorage] & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            id v15 = sub_10018796C();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              id v16 = [(PQLConnection *)self->_db lastCPLError];
              unsigned __int8 v17 = [v16 localizedDescription];
              *(_DWORD *)buf = 138412546;
              long long v24 = v12;
              __int16 v25 = 2112;
              long long v26 = v17;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Unable to initialize %@: %@", buf, 0x16u);
            }
          }

          if (a4)
          {
            [(PQLConnection *)self->_db lastError];
            BOOL v14 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v14 = 0;
          }
          goto LABEL_18;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = 1;
LABEL_18:

  return v14;
}

- (BOOL)deleteDynamicallyCreatedStorages:(id)a3 error:(id *)a4
{
  SEL v19 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    while (2)
    {
      id v8 = v4;
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v8);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v10 shouldBeCreatedDynamically] & 1) == 0) {
          sub_1001D1E18((uint64_t)v10, (uint64_t)v19, (uint64_t)self);
        }
        id v11 = [v10 platformObject];
        db = self->_db;
        id v13 = [v11 mainTable];
        LOBYTE(db) = [(PQLConnection *)db cplExecute:@"DROP TABLE IF EXISTS %@", v13, v19];

        if ((db & 1) == 0)
        {
          id v4 = v8;
          if (!_CPLSilentLogging)
          {
            id v15 = sub_10018796C();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              id v16 = [(PQLConnection *)self->_db lastCPLError];
              unsigned __int8 v17 = [v16 localizedDescription];
              *(_DWORD *)buf = 138412546;
              long long v27 = v10;
              __int16 v28 = 2112;
              long long v29 = v17;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Unable to delete %@: %@", buf, 0x16u);
            }
          }

          if (a4)
          {
            [(PQLConnection *)self->_db lastError];
            BOOL v14 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v14 = 0;
          }
          goto LABEL_18;
        }
      }
      id v4 = v8;
      id v6 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = 1;
LABEL_18:

  return v14;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = [(NSURL *)self->_dbURL path];
  id v5 = [v4 stringByAbbreviatingWithTildeInPath];
  id v6 = [(CPLPrequeliteStore *)self abstractObject];
  uint64_t v7 = [v6 engineLibrary];
  id v8 = [v7 libraryIdentifier];
  id v9 = [v3 initWithFormat:@"<SQLDatabase %@ - %@>", v5, v8];

  return (NSString *)v9;
}

- (id)redactedDescription
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = [(NSURL *)self->_dbURL path];
  id v5 = [v4 lastPathComponent];
  id v6 = [(CPLPrequeliteStore *)self abstractObject];
  uint64_t v7 = [v6 engineLibrary];
  id v8 = [v7 libraryIdentifier];
  id v9 = [v3 initWithFormat:@"<SQLDatabase %@ - %@>", v5, v8];

  return v9;
}

- (NSDate)libraryCreationDate
{
  return (NSDate *)objc_getProperty(self, a2, 368, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryCreationDate, 0);
  objc_storeStrong((id *)&self->_transactionStatistics, 0);
  objc_storeStrong((id *)&self->_vacuumCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_vacuumQueue, 0);
  objc_storeStrong((id *)&self->_clientCacheMigrator, 0);
  objc_storeStrong((id *)&self->_postUpgradeMigrations, 0);
  objc_storeStrong((id *)&self->_wipeReason, 0);
  objc_storeStrong((id *)&self->_resetReason, 0);
  objc_storeStrong((id *)&self->_isClientInSyncWithClientCacheQueue, 0);
  objc_storeStrong((id *)&self->_mainScopeIdentifierVar, 0);
  objc_storeStrong((id *)&self->_deactivatedVar, 0);
  objc_storeStrong((id *)&self->_derivativesFilterVar, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_disabledFeaturesDataVar, 0);
  objc_storeStrong((id *)&self->_shouldUpdateDisabledFeaturesVar, 0);
  objc_storeStrong((id *)&self->_libraryOptionsVar, 0);
  objc_storeStrong((id *)&self->_cachedPushPullGatekeepers, 0);
  objc_storeStrong((id *)&self->_cachedChangeSessionUpdate, 0);
  objc_storeStrong((id *)&self->_pushPullGatekeepersVar, 0);
  objc_storeStrong((id *)&self->_changeSessionUpdateVar, 0);
  objc_storeStrong((id *)&self->_libraryCreationDateVar, 0);
  objc_storeStrong((id *)&self->_clientCacheIdentifierAsKnownByClient, 0);
  objc_storeStrong((id *)&self->_clientCacheIdentifierVar, 0);
  objc_storeStrong((id *)&self->_lastQuarantineCountReportDateVar, 0);
  objc_storeStrong((id *)&self->_userIdentifierVar, 0);
  objc_storeStrong((id *)&self->_libraryVersionVar, 0);
  objc_storeStrong((id *)&self->_globals, 0);
  objc_storeStrong(&self->_globalVariableCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_modifiedVariables, 0);
  objc_storeStrong((id *)&self->_dbURL, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end