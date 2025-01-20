@interface _ATXDataStore
+ (BOOL)isSqliteData:(id)a3;
+ (BOOL)pareDownForBackup:(sqlite3 *)a3;
+ (_ATXDataStore)sharedInstance;
+ (id)defaultPath;
+ (id)loadDataFromFile:(id)a3;
+ (id)removeSensitiveInformationFromModeEntityScoresFile:(id)a3 shouldBackupContacts:(BOOL)a4;
+ (id)stringForHistogramType:(int64_t)a3;
+ (void)_simulateCrashForMigrationFailure:(id)a3;
- (BOOL)_removeActionsWithoutTitle;
- (BOOL)_reset;
- (BOOL)actionExistsForBundleId:(id)a3 actionType:(id)a4;
- (BOOL)alogContainsActionUUID:(id)a3;
- (BOOL)containsActionType:(id)a3;
- (BOOL)hasOrphanSlotSetKeys;
- (BOOL)migrationUpdateOrInsertTimestamp:(int64_t)a3 intoColumn:(id)a4 forBundleId:(id)a5;
- (BOOL)restoreFromBackup:(id)a3;
- (BOOL)writeSlotSetKeyParameters:(id)a3 rowId:(id)a4 slotSet:(id)a5 success:(int64_t *)a6;
- (_ATXDataStore)init;
- (_ATXDataStore)initWithInMemoryDataStore;
- (_ATXDataStore)initWithPath:(id)a3 andDuetHelper:(id)a4;
- (_PASDBIterAction_)_deserializeActionLogRowWithStmt:(id)a3 invokingBlock:(id)a4;
- (_PASSqliteDatabase)db;
- (id)_allAppsRequireInstallDate:(BOOL)a3;
- (id)_appInfoForBundleIdNoSync:(id)a3;
- (id)_databaseSchema;
- (id)_lastAppLaunchDateOfType:(int64_t)a3;
- (id)_trimMigrationPlan:(id)a3 toSchema:(unint64_t)a4;
- (id)actionAndSlotsForRowId:(id)a3;
- (id)actionFeedbackLogKeys;
- (id)actionForSlotUUID:(id)a3;
- (id)actionLogKeys;
- (id)allActionsAndSlots;
- (id)allApps;
- (id)allAppsLaunchedOrInstalledWithin30Days;
- (id)allAppsWithInstallDate;
- (id)appInfoForBundleId:(id)a3;
- (id)appIntentDuetEventsForActionsBetweenStartDate:(id)a3 endDate:(id)a4;
- (id)appLaunchSequence;
- (id)averageSecondsBetweenAppActionsForAppAction:(id)a3;
- (id)blobOfType:(int64_t)a3;
- (id)categoricalHistogramDataForHistogramType:(int64_t)a3;
- (id)filenamesAndDataForBackupShouldPareDown:(BOOL)a3 transport:(unint64_t)a4;
- (id)filenamesAndDataForBackupWithTransport:(unint64_t)a3;
- (id)histogramDataForHistogramType:(int64_t)a3;
- (id)isEligibleForWidgetsForCacheKey:(id)a3;
- (id)lastAppActionLaunchDateForAppAction:(id)a3;
- (id)lastLaunchDate;
- (id)lastLaunchedApp;
- (id)lastMessageToRecipient:(id)a3;
- (id)lastSpotlightLaunchDate;
- (id)loadAppActionInfo;
- (id)loadAppActionLaunchesFollowing:(id)a3;
- (id)loadAppActionsFromAppActionInfo;
- (id)loadAppInfo;
- (id)loadLaunchesFollowingBundle:(id)a3;
- (id)loadTopNAppActionsByPredictions:(unint64_t)a3;
- (id)medianSecondsBetweenAppActionsForAppAction:(id)a3;
- (id)minimalActionParametersforActionsBetweenStartDate:(id)a3 endDate:(id)a4 limit:(unint64_t)a5;
- (id)nthMostRecentAppLaunch:(int64_t)a3;
- (id)numActionKeyOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4;
- (id)subtitleForCacheKey:(id)a3;
- (id)supportsBackgroundExecutionForCacheKey:(id)a3;
- (id)titleForCacheKey:(id)a3;
- (id)totalNumberOfActionTypesForBundleId:(id)a3;
- (id)totalSlotsInDatastore;
- (id)validParameterCombinationsWithSchemaForCacheKey:(id)a3;
- (id)webClipsForAppClipBundleId:(id)a3;
- (int64_t)_regenerateSlotSetKeyForBundleId:(id)a3;
- (int64_t)_regenerateSlotSetKeys;
- (int64_t)configureDatabase;
- (int64_t)currentSchemaVersion;
- (int64_t)launchedAppCount;
- (int64_t)migrateToVersion:(unint64_t)a3 withMigrationPlan:(id)a4;
- (int64_t)migration_AddEnterpriseAppInfo;
- (int64_t)migration_AddExtensionInfo;
- (int64_t)migration_AddFeedbackColumns;
- (int64_t)migration_AppLaunchHistogramToTable;
- (int64_t)migration_DelinkFromCoreLocationVisitMonitoring;
- (int64_t)migration_DeprecateGenericAppIntentModels;
- (int64_t)migration_DeprecateIntentForAllAppsHistograms;
- (int64_t)migration_InstallDateToAppTable;
- (int64_t)migration_LaunchHistoriesToAppTable;
- (int64_t)migration_PrefillActionHistograms;
- (int64_t)migration_RecreatePredictionFeedbackInfo;
- (int64_t)migration_RemoveActionsWithoutTitle;
- (int64_t)migration_RemoveAllSubsequentLaunches;
- (int64_t)migration_RemoveCachedConsumerDB;
- (int64_t)migration_RemoveDeprecatedStartCallIntents;
- (int64_t)migration_RemoveFeedbackForUninstalledApps;
- (int64_t)migration_RemoveRestoreUserDefault;
- (int64_t)migration_SlotSetKeyCreation;
- (int64_t)migration_deleteAllTrainedRelevanceModels;
- (int64_t)migration_deleteFocusSpaceCaches;
- (int64_t)migration_failForTests;
- (int64_t)migration_forceUpdateNewAzulSystemAppsInstallDate;
- (int64_t)migration_forceUpdateNewCrystalSystemAppsInstallDate;
- (int64_t)migration_moveCacheFiles;
- (int64_t)migration_overrideNilInstallDateToDistantOldTime;
- (int64_t)migration_populateModeCaches;
- (int64_t)migration_purgeExpensiveCachesFromUserDefaults;
- (int64_t)migration_removeAnchorModelDirectory;
- (int64_t)migration_removeBrokenBlendingStream;
- (int64_t)migration_removeHomeScreenWidgetBlacklistFile;
- (int64_t)migration_removeOldStackStateTrackerFile;
- (int64_t)migration_updateNewAzulSystemAppsInstallDate;
- (int64_t)migration_updateNewCrystalSystemAppsInstallDate;
- (int64_t)runMigrationPlan:(id)a3;
- (int64_t)skipFromZeroSchema;
- (int64_t)updateAlog:(id)a3 slotsToMigrate:(id)a4;
- (unint64_t)actionHistoryLengthPerAppAction;
- (unint64_t)numActionKeyOccurrencesForActionKey:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (unint64_t)numActionParameterHashOccurrencesForActionKey:(id)a3 parameterHash:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6;
- (unint64_t)numBundleIdOccurrencesForBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (void)_disconnectFromDb;
- (void)_doAsync:(id)a3;
- (void)_doSync:(id)a3;
- (void)_enumerateAppInfoAppActionsExecutingBlock:(id)a3;
- (void)_enumerateAppInfoBundlesExecutingBlock:(id)a3;
- (void)_markBundleId:(id)a3 asEnterpriseApp:(BOOL)a4;
- (void)_markBundleIdAsExtension:(id)a3;
- (void)_markBundleIdsAsExtension:(id)a3;
- (void)_removeFeedbackForBundleId:(id)a3;
- (void)_reset;
- (void)_testMigrate;
- (void)_testMigrateToSchema:(unint64_t)a3;
- (void)addAppActionLaunchForAppAction:(id)a3 date:(id)a4;
- (void)addAppInstallForBundleId:(id)a3 date:(id)a4 genreId:(id)a5 subGenreIds:(id)a6;
- (void)addAppInstallForBundleId:(id)a3 date:(id)a4 genreId:(id)a5 subGenreIds:(id)a6 app2VecCluster:(id)a7;
- (void)addAppLaunchForAppLaunchSequence:(id)a3 date:(id)a4;
- (void)addAppLaunchForBundleId:(id)a3 date:(id)a4 withLaunchType:(int64_t)a5;
- (void)addCategoricalHistogramData:(id)a3 forHistogramOfType:(int64_t)a4;
- (void)addExtensionLaunchForBundleId:(id)a3 date:(id)a4;
- (void)addHistogramData:(id)a3 forHistogramOfType:(int64_t)a4;
- (void)clearAppInstallInfo;
- (void)clearAppLaunchInfo;
- (void)clearDatabase;
- (void)currentSchemaVersion;
- (void)deleteLaunchesFollowingAppAction:(id)a3;
- (void)deleteLaunchesFollowingBundle:(id)a3;
- (void)enumerateActionOfType:(id)a3 bundleId:(id)a4 block:(id)a5;
- (void)enumerateActionTypesOlderThan:(id)a3 block:(id)a4;
- (void)enumerateActionsInUUIDSet:(id)a3 block:(id)a4;
- (void)enumerateAppInfoAppActionsExecutingBlock:(id)a3;
- (void)enumerateAppInfoBundlesExecutingBlock:(id)a3;
- (void)enumerateFeedbackForActionOfType:(id)a3 bundleId:(id)a4 block:(id)a5;
- (void)enumerateSlotUuidsOfType:(id)a3 bundleId:(id)a4 block:(id)a5;
- (void)enumerateStateForApps:(id)a3 withGlobalBlock:(id)a4 thenWithPerAppBlock:(id)a5;
- (void)enumerateStateForApps:(id)a3 withGlobalBlock:(id)a4 thenWithPerAppBlock:(id)a5 readOnly:(BOOL)a6;
- (void)enumerateStateForAppsReadOnly:(id)a3 withGlobalBlock:(id)a4 thenWithPerAppBlock:(id)a5;
- (void)integrityCheckOrAbort;
- (void)migrate;
- (void)migrateWithMigrationPlan:(id)a3;
- (void)migrationPre44WriteActionType:(id)a3 bundleId:(id)a4 date:(id)a5 action:(id)a6 slotSets:(id)a7 timeZone:(id)a8 prevLocationUUID:(id)a9 locationUUID:(id)a10 weight:(double)a11 actionUUID:(id)a12 motionType:(int64_t)a13;
- (void)migration_DeprecateGenericAppIntentModels;
- (void)migration_InstallDateToAppTable;
- (void)migration_removeAnchorModelDirectory;
- (void)migration_removeBrokenBlendingStream;
- (void)migration_removeHomeScreenWidgetBlacklistFile;
- (void)migration_removeOldStackStateTrackerFile;
- (void)pruneMessageRecipientsAddedBefore:(id)a3;
- (void)recordConfirms:(double)a3 rejects:(double)a4 forFeedbackType:(unint64_t)a5 forActionType:(id)a6 bundleId:(id)a7 action:(id)a8 slotSet:(id)a9 actionUUID:(id)a10 date:(id)a11 consumerSubType:(unsigned __int8)a12 geohash:(int64_t)a13 coarseGeohash:(int64_t)a14;
- (void)regenerateSlotSetKeyForBundleId:(id)a3;
- (void)removeActionDataForActionUUID:(id)a3;
- (void)removeActionDataForActionUUIDs:(id)a3;
- (void)removeActionDataForBundleId:(id)a3;
- (void)removeActionsWithoutTitle;
- (void)removeAllAppActionPredictionFeedbackCounts;
- (void)removeAllCachedIntents;
- (void)removeAllFeedback;
- (void)removeAllSlotsFromActionFeedback;
- (void)removeAllSlotsFromActionLog;
- (void)removeAllSlotsFromSlotSetKey;
- (void)removeAppInfoForBundleId:(id)a3;
- (void)removeAppInfoForBundleIdsNotInSet:(id)a3;
- (void)removeAppLaunchesForBundleId:(id)a3;
- (void)removeCachedIntentsWithBundleId:(id)a3;
- (void)removeFeedbackForBundleId:(id)a3;
- (void)setActionHistoryLengthPerAppAction:(unint64_t)a3;
- (void)skipFromZeroSchema;
- (void)swapInDuetHelperStub:(id)a3;
- (void)trimActionHistoryWithAppWhitelist:(id)a3;
- (void)updateOrInsertApp2VecCluster:(id)a3 forBundleId:(id)a4;
- (void)updateOrInsertAverageSecondsBetweenAppActions:(id)a3 forAppAction:(id)a4;
- (void)updateOrInsertAverageSecondsBetweenLaunches:(id)a3 forBundleId:(id)a4;
- (void)updateOrInsertCategoricalHistogramData:(id)a3 forHistogram:(int64_t)a4;
- (void)updateOrInsertGenreId:(id)a3 subGenreIds:(id)a4 forBundleId:(id)a5;
- (void)updateOrInsertHistogramData:(id)a3 forHistogram:(int64_t)a4;
- (void)updateOrInsertInstallTimestamp:(int64_t)a3 genreId:(id)a4 subGenreIds:(id)a5 app2VecCluster:(id)a6 forBundleId:(id)a7 isExtension:(BOOL)a8 isEnterpriseApp:(BOOL)a9;
- (void)updateOrInsertMedianSecondsBetweenAppActions:(id)a3 forAppAction:(id)a4;
- (void)updateOrInsertMedianSecondsBetweenLaunches:(id)a3 forBundleId:(id)a4;
- (void)updateOrInsertMessageRecipient:(id)a3 dateMessaged:(id)a4;
- (void)updateOrInsertPredictionsAndFeedbackForAppAction:(id)a3 feedbackReceived:(BOOL)a4 forUIType:(id)a5;
- (void)updateOrInsertSubsequentAppActionLaunchCountData:(id)a3 forAppAction:(id)a4;
- (void)updateOrInsertSubsequentLaunchCountData:(id)a3 forBundleId:(id)a4;
- (void)updateOrInsertTimestamp:(int64_t)a3 forAppAction:(id)a4;
- (void)updateOrInsertTimestamp:(int64_t)a3 intoColumn:(id)a4 forBundleId:(id)a5 isExtension:(BOOL)a6;
- (void)updateSchemaVersionNumberTo:(int64_t)a3;
- (void)vacuumDatabaseWithActivity:(id)a3;
- (void)writeActionType:(id)a3 bundleId:(id)a4 date:(id)a5 action:(id)a6 slotSets:(id)a7 timeZone:(id)a8 prevLocationUUID:(id)a9 locationUUID:(id)a10 weight:(double)a11 actionUUID:(id)a12 motionType:(int64_t)a13 appSessionStartDate:(id)a14 appSessionEndDate:(id)a15 geohash:(int64_t)a16 coarseGeohash:(int64_t)a17;
- (void)writeApp2VecCluster:(id)a3 forBundleId:(id)a4;
- (void)writeAppActionLaunches:(id)a3 followingAppAction:(id)a4;
- (void)writeAverageSecondsBetweenAppActions:(id)a3 forAppAction:(id)a4;
- (void)writeAverageSecondsBetweenLaunches:(id)a3 forBundleId:(id)a4;
- (void)writeBlob:(id)a3 type:(int64_t)a4 expirationDate:(id)a5;
- (void)writeEligibleForWidgets:(BOOL)a3 cacheKey:(id)a4;
- (void)writeGenreId:(id)a3 subGenreIds:(id)a4 forBundleId:(id)a5;
- (void)writeLaunches:(id)a3 followingBundle:(id)a4;
- (void)writeMedianSecondsBetweenAppActions:(id)a3 forAppAction:(id)a4;
- (void)writeMedianSecondsBetweenLaunches:(id)a3 forBundleId:(id)a4;
- (void)writeSubtitle:(id)a3 cacheKey:(id)a4;
- (void)writeSupportsBackgroundExecution:(BOOL)a3 cacheKey:(id)a4;
- (void)writeTitle:(id)a3 cacheKey:(id)a4;
- (void)writeValidParameterCombinationsWithSchema:(id)a3 cacheKey:(id)a4;
- (void)writeWebClip:(id)a3 appClip:(id)a4;
@end

@implementation _ATXDataStore

- (id)_appInfoForBundleIdNoSync:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__50;
  v19 = __Block_byref_object_dispose__50;
  id v20 = 0;
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43___ATXDataStore__appInfoForBundleIdNoSync___block_invoke;
  v13[3] = &unk_1E68AD200;
  id v14 = v4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43___ATXDataStore__appInfoForBundleIdNoSync___block_invoke_2;
  v10[3] = &unk_1E68B0D70;
  id v6 = v14;
  id v11 = v6;
  v12 = &v15;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43___ATXDataStore__appInfoForBundleIdNoSync___block_invoke_218;
  v9[3] = &unk_1E68AD250;
  v9[4] = self;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT installDate, lastLaunchDate, lastSpotlightLaunchDate, genreId, subGenreIds, isExtension, isEnterpriseApp, app2VecCluster, averageSecondsBetweenLaunches, medianSecondsBetweenLaunches FROM appInfo WHERE bundleId=?" onPrep:v13 onRow:v10 onError:v9];
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (void)updateOrInsertCategoricalHistogramData:(id)a3 forHistogram:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    db = self->_db;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69___ATXDataStore_updateOrInsertCategoricalHistogramData_forHistogram___block_invoke;
    v9[3] = &unk_1E68AE780;
    int64_t v11 = a4;
    id v10 = v6;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO categoricalHistograms (histogramType, histogramData) VALUES (:histogram_type, :histogram_data) ON CONFLICT(histogramType) DO UPDATE SET histogramData=excluded.histogramData" onPrep:v9 onRow:0 onError:0];
  }
}

- (void)updateOrInsertHistogramData:(id)a3 forHistogram:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    db = self->_db;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58___ATXDataStore_updateOrInsertHistogramData_forHistogram___block_invoke;
    v9[3] = &unk_1E68AE780;
    int64_t v11 = a4;
    id v10 = v6;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO histograms (histogramType, histogramData) VALUES (:histogram_type, :histogram_data) ON CONFLICT(histogramType) DO UPDATE SET histogramData=excluded.histogramData" onPrep:v9 onRow:0 onError:0];
  }
}

- (void)addCategoricalHistogramData:(id)a3 forHistogramOfType:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64___ATXDataStore_addCategoricalHistogramData_forHistogramOfType___block_invoke;
  v8[3] = &unk_1E68AE7A8;
  v8[4] = self;
  id v9 = v6;
  int64_t v10 = a4;
  id v7 = v6;
  [(_ATXDataStore *)self _doAsync:v8];
}

- (void)_doAsync:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&_doAsync__txnLock);
  if (!_doAsync__txn)
  {
    uint64_t v5 = os_transaction_create();
    id v6 = (void *)_doAsync__txn;
    _doAsync__txn = v5;
  }
  ++_doAsync__txnCount;
  pthread_mutex_unlock(&_doAsync__txnLock);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26___ATXDataStore__doAsync___block_invoke;
  block[3] = &unk_1E68AB618;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(queue, block);
}

- (void)addHistogramData:(id)a3 forHistogramOfType:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53___ATXDataStore_addHistogramData_forHistogramOfType___block_invoke;
  v8[3] = &unk_1E68AE7A8;
  v8[4] = self;
  id v9 = v6;
  int64_t v10 = a4;
  id v7 = v6;
  [(_ATXDataStore *)self _doAsync:v8];
}

- (id)appInfoForBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__50;
  v16 = __Block_byref_object_dispose__50;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36___ATXDataStore_appInfoForBundleId___block_invoke;
  block[3] = &unk_1E68AF258;
  id v10 = v4;
  int64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)writeValidParameterCombinationsWithSchema:(id)a3 cacheKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D25F6CC0]();
  id v16 = 0;
  id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v16];
  id v10 = v16;
  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (v11)
  {
    uint64_t v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore(IntentCache) writeValidParameterCombinationsWithSchema:cacheKey:]();
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81___ATXDataStore_IntentCache__writeValidParameterCombinationsWithSchema_cacheKey___block_invoke;
    v13[3] = &unk_1E68AC320;
    void v13[4] = self;
    id v14 = v7;
    id v15 = v9;
    [(_ATXDataStore *)self _doSync:v13];
  }
}

- (id)validParameterCombinationsWithSchemaForCacheKey:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__13;
  v25 = __Block_byref_object_dispose__13;
  id v26 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke;
  v18[3] = &unk_1E68AD278;
  v18[4] = self;
  id v5 = v4;
  id v19 = v5;
  id v20 = &v21;
  [(_ATXDataStore *)self _doSync:v18];
  if (v22[5])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v6, "initWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = v22[5];
    id v17 = 0;
    uint64_t v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v10 fromData:v11 error:&v17];
    id v13 = v17;
    if (v13)
    {
      id v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[_ATXDataStore(IntentCache) validParameterCombinationsWithSchemaForCacheKey:]((uint64_t)v13, v14);
      }

      id v15 = 0;
    }
    else
    {
      id v15 = v12;
    }
  }
  else
  {
    id v15 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v15;
}

- (void)writeSupportsBackgroundExecution:(BOOL)a3 cacheKey:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72___ATXDataStore_IntentCache__writeSupportsBackgroundExecution_cacheKey___block_invoke;
  v8[3] = &unk_1E68AD4C0;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a3;
  id v7 = v6;
  [(_ATXDataStore *)self _doSync:v8];
}

- (id)supportsBackgroundExecutionForCacheKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__13;
  id v15 = __Block_byref_object_dispose__13;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke;
  v8[3] = &unk_1E68AD278;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  BOOL v10 = &v11;
  [(_ATXDataStore *)self _doSync:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)writeTitle:(id)a3 cacheKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50___ATXDataStore_IntentCache__writeTitle_cacheKey___block_invoke;
  v10[3] = &unk_1E68AC320;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(_ATXDataStore *)self _doSync:v10];
}

- (id)titleForCacheKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__13;
  id v15 = __Block_byref_object_dispose__13;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke;
  v8[3] = &unk_1E68AD278;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  BOOL v10 = &v11;
  [(_ATXDataStore *)self _doSync:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)writeSubtitle:(id)a3 cacheKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53___ATXDataStore_IntentCache__writeSubtitle_cacheKey___block_invoke;
  v10[3] = &unk_1E68AC320;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(_ATXDataStore *)self _doSync:v10];
}

- (id)subtitleForCacheKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__13;
  id v15 = __Block_byref_object_dispose__13;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke;
  v8[3] = &unk_1E68AD278;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  BOOL v10 = &v11;
  [(_ATXDataStore *)self _doSync:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)writeEligibleForWidgets:(BOOL)a3 cacheKey:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63___ATXDataStore_IntentCache__writeEligibleForWidgets_cacheKey___block_invoke;
  v8[3] = &unk_1E68AD4C0;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a3;
  id v7 = v6;
  [(_ATXDataStore *)self _doSync:v8];
}

- (id)isEligibleForWidgetsForCacheKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__13;
  id v15 = __Block_byref_object_dispose__13;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke;
  v8[3] = &unk_1E68AD278;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  BOOL v10 = &v11;
  [(_ATXDataStore *)self _doSync:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)removeCachedIntentsWithBundleId:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62___ATXDataStore_IntentCache__removeCachedIntentsWithBundleId___block_invoke;
  v6[3] = &unk_1E68AB870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(_ATXDataStore *)self _doSync:v6];
}

- (void)removeAllCachedIntents
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52___ATXDataStore_IntentCache__removeAllCachedIntents__block_invoke;
  v2[3] = &unk_1E68AB818;
  v2[4] = self;
  [(_ATXDataStore *)self _doSync:v2];
}

- (id)webClipsForAppClipBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__21;
  id v15 = __Block_byref_object_dispose__21;
  id v16 = (id)objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke;
  v8[3] = &unk_1E68AD278;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  BOOL v10 = &v11;
  [(_ATXDataStore *)self _doSync:v8];
  id v6 = (void *)[(id)v12[5] copy];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)writeWebClip:(id)a3 appClip:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47___ATXDataStore_WebClip__writeWebClip_appClip___block_invoke;
  v10[3] = &unk_1E68AC320;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_ATXDataStore *)self _doSync:v10];
}

+ (_ATXDataStore)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_103);
  }
  v2 = (void *)sharedInstance_instance;
  return (_ATXDataStore *)v2;
}

- (_ATXDataStore)initWithInMemoryDataStore
{
  v3 = +[_ATXDuetHelper sharedInstance];
  id v4 = [(_ATXDataStore *)self initWithPath:@":memory:" andDuetHelper:v3];

  return v4;
}

+ (id)defaultPath
{
  return (id)[MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"_ATXDataStore.db"];
}

- (_ATXDataStore)init
{
  v3 = +[_ATXDataStore defaultPath];
  id v4 = +[_ATXDuetHelper sharedInstance];
  id v5 = [(_ATXDataStore *)self initWithPath:v3 andDuetHelper:v4];

  return v5;
}

- (_ATXDataStore)initWithPath:(id)a3 andDuetHelper:(id)a4
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v7 = (__CFString *)a3;
  id v8 = a4;
  if (!v7)
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 121, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore initWithPath:andDuetHelper:]();
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Cannot call _ATXDataStore init until class c unlocked"];
    [MEMORY[0x1E4F93AE8] simulateCrashWithDescription:@"Cannot call _ATXDataStore init until class c unlocked"];
  }
  if (([MEMORY[0x1E4F93BA0] isInMemoryPath:v7] & 1) == 0)
  {
    BOOL v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v11 = [v10 attributesOfFileSystemForPath:v7 error:0];

    id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F283A0]];
    uint64_t v13 = v12;
    if (v12 && [v12 longLongValue] < 0x8000)
    {
      id v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[_ATXDataStore initWithPath:andDuetHelper:]();
      }

      id v7 = @":memory:";
    }
  }
  v45.receiver = self;
  v45.super_class = (Class)_ATXDataStore;
  id v15 = [(_ATXDataStore *)&v45 init];
  id v16 = v15;
  if (v15)
  {
    id v43 = v8;
    objc_storeStrong((id *)&v15->_path, v7);
    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.duetexpertd._ATXDataStore", v17);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v18;

    v16->_actionHistoryLengthPerAppAction = 200;
    objc_storeStrong((id *)&v16->_duetHelper, a4);
    uint64_t v20 = [MEMORY[0x1E4F4AE98] featureIdentifier];
    uint64_t v21 = (void *)v20;
    v22 = @"DEC";
    if (v20) {
      v22 = (__CFString *)v20;
    }
    uint64_t v23 = v22;

    v24 = +[_ATXDataStoreMigrations migrations];
    uint64_t v25 = [v24 count];

    id v26 = objc_alloc(MEMORY[0x1E4F93738]);
    v27 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:", @"from_version", 0, ++v25);
    v46[0] = v27;
    v28 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:", @"to_version", 0, v25);
    v46[1] = v28;
    v29 = [MEMORY[0x1E4F93720] propertyWithName:@"result" possibleValues:&unk_1F27F2C88 autoSanitizeValues:0];
    v46[2] = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
    uint64_t v31 = [v26 initWithFeatureId:v23 event:@"db_migrate" registerProperties:v30];

    dbMigrationTracker = v16->_dbMigrationTracker;
    v16->_dbMigrationTracker = (PETScalarEventTracker *)v31;

    v33 = [MEMORY[0x1E4F93BA0] corruptionMarkerPathForPath:v16->_path];
    if (([MEMORY[0x1E4F93BA0] isInMemoryPath:v16->_path] & 1) == 0)
    {
      v34 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v35 = [v34 fileExistsAtPath:v33];

      if (v35)
      {
        v36 = __atxlog_handle_default();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0FA3000, v36, OS_LOG_TYPE_DEFAULT, "Corruption marker detected; flushing data store.",
            buf,
            2u);
        }

        [MEMORY[0x1E4F93BA0] truncateDatabaseAtPath:v16->_path];
        v37 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v37 removeItemAtPath:v33 error:0];
      }
    }
    v38 = __atxlog_handle_default();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v38, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Initializing the data store.", buf, 2u);
    }

    id v8 = v43;
    if (![(_ATXDataStore *)v16 _reset])
    {

      v40 = 0;
      goto LABEL_30;
    }
    v39 = __atxlog_handle_default();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v39, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Done initializing the data store.", buf, 2u);
    }
  }
  v40 = v16;
LABEL_30:

  return v40;
}

- (void)_disconnectFromDb
{
  db = self->_db;
  if (db)
  {
    [(_PASSqliteDatabase *)db closePermanently];
    id v4 = self->_db;
    self->_db = 0;
  }
}

- (BOOL)_reset
{
  if (self->_db) {
    [(_ATXDataStore *)self _disconnectFromDb];
  }
  path = self->_path;
  id v10 = 0;
  id v4 = [MEMORY[0x1E4F93BA0] sqliteDatabaseWithFilename:path contentProtection:3 errorHandler:0 error:&v10];
  id v5 = v10;
  db = self->_db;
  self->_db = v4;

  if (self->_db)
  {
    [(_ATXDataStore *)self configureDatabase];
    [(_ATXDataStore *)self migrate];
  }
  else
  {
    id v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore _reset](&self->_path);
    }

    [(_ATXDataStore *)self _disconnectFromDb];
  }
  BOOL v8 = self->_db != 0;

  return v8;
}

- (void)_doSync:(id)a3
{
}

- (void)removeFeedbackForBundleId:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43___ATXDataStore_removeFeedbackForBundleId___block_invoke;
  v6[3] = &unk_1E68AB870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(_ATXDataStore *)self _doAsync:v6];
}

- (void)removeAllFeedback
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34___ATXDataStore_removeAllFeedback__block_invoke;
  block[3] = &unk_1E68AB818;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)removeAllAppActionPredictionFeedbackCounts
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59___ATXDataStore_removeAllAppActionPredictionFeedbackCounts__block_invoke;
  block[3] = &unk_1E68AB818;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)pruneMessageRecipientsAddedBefore:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51___ATXDataStore_pruneMessageRecipientsAddedBefore___block_invoke;
  v7[3] = &unk_1E68AB870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)_removeFeedbackForBundleId:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44___ATXDataStore__removeFeedbackForBundleId___block_invoke;
  v8[3] = &unk_1E68AD200;
  id v9 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44___ATXDataStore__removeFeedbackForBundleId___block_invoke_2;
  v7[3] = &unk_1E68AD250;
  v7[4] = self;
  id v6 = v4;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"DELETE FROM app WHERE bundleId=?" onPrep:v8 onRow:0 onError:v7];
}

- (void)enumerateStateForApps:(id)a3 withGlobalBlock:(id)a4 thenWithPerAppBlock:(id)a5 readOnly:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke;
  block[3] = &unk_1E68B0CF8;
  id v18 = v10;
  id v19 = self;
  BOOL v22 = a6;
  id v20 = v11;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(queue, block);
}

- (void)enumerateStateForApps:(id)a3 withGlobalBlock:(id)a4 thenWithPerAppBlock:(id)a5
{
}

- (void)enumerateStateForAppsReadOnly:(id)a3 withGlobalBlock:(id)a4 thenWithPerAppBlock:(id)a5
{
}

- (void)vacuumDatabaseWithActivity:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(_PASSqliteDatabase *)self->_db isInMemory] & 1) == 0)
  {
    db = self->_db;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44___ATXDataStore_vacuumDatabaseWithActivity___block_invoke;
    v12[3] = &unk_1E68B0D20;
    id v13 = v4;
    id v11 = 0;
    uint64_t v6 = [(_PASSqliteDatabase *)db vacuumWithShouldContinueBlock:v12 error:&v11];
    id v7 = v11;
    if (v7)
    {
      id v8 = __atxlog_handle_default();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_ATXDataStore vacuumDatabaseWithActivity:]();
      }
    }
    id v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [NSNumber numberWithBool:v6];
      *(_DWORD *)buf = 138412290;
      id v15 = v10;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "ATXDataStore: vacuum completed: %@", buf, 0xCu);
    }
  }
}

- (void)addAppInstallForBundleId:(id)a3 date:(id)a4 genreId:(id)a5 subGenreIds:(id)a6
{
}

- (void)addAppInstallForBundleId:(id)a3 date:(id)a4 genreId:(id)a5 subGenreIds:(id)a6 app2VecCluster:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82___ATXDataStore_addAppInstallForBundleId_date_genreId_subGenreIds_app2VecCluster___block_invoke;
  v22[3] = &unk_1E68B0D48;
  id v23 = v12;
  id v24 = v13;
  uint64_t v25 = self;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  [(_ATXDataStore *)self _doAsync:v22];
}

- (void)addAppLaunchForBundleId:(id)a3 date:(id)a4 withLaunchType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61___ATXDataStore_addAppLaunchForBundleId_date_withLaunchType___block_invoke;
  v12[3] = &unk_1E68AE970;
  void v12[4] = self;
  id v13 = v9;
  id v14 = v8;
  int64_t v15 = a5;
  id v10 = v8;
  id v11 = v9;
  [(_ATXDataStore *)self _doAsync:v12];
}

- (void)addAppActionLaunchForAppAction:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53___ATXDataStore_addAppActionLaunchForAppAction_date___block_invoke;
  v10[3] = &unk_1E68AC320;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(_ATXDataStore *)self _doAsync:v10];
}

- (void)addExtensionLaunchForBundleId:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52___ATXDataStore_addExtensionLaunchForBundleId_date___block_invoke;
  v10[3] = &unk_1E68AC320;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(_ATXDataStore *)self _doAsync:v10];
}

- (id)allAppsLaunchedOrInstalledWithin30Days
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__50;
  id v11 = __Block_byref_object_dispose__50;
  id v12 = (id)objc_opt_new();
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke;
  v6[3] = &unk_1E68AB898;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)allApps
{
  return [(_ATXDataStore *)self _allAppsRequireInstallDate:0];
}

- (id)allAppsWithInstallDate
{
  return [(_ATXDataStore *)self _allAppsRequireInstallDate:1];
}

- (id)_allAppsRequireInstallDate:(BOOL)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__50;
  id v14 = __Block_byref_object_dispose__50;
  id v15 = (id)objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___ATXDataStore__allAppsRequireInstallDate___block_invoke;
  block[3] = &unk_1E68B0D98;
  BOOL v9 = a3;
  void block[4] = self;
  void block[5] = &v10;
  dispatch_sync(queue, block);
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)nthMostRecentAppLaunch:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__50;
  id v11 = __Block_byref_object_dispose__50;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke;
  block[3] = &unk_1E68AD2C8;
  void block[5] = &v7;
  void block[6] = a3;
  void block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)lastLaunchDate
{
  return [(_ATXDataStore *)self _lastAppLaunchDateOfType:0];
}

- (id)lastSpotlightLaunchDate
{
  return [(_ATXDataStore *)self _lastAppLaunchDateOfType:1];
}

- (id)_lastAppLaunchDateOfType:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__50;
  id v11 = __Block_byref_object_dispose__50;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___ATXDataStore__lastAppLaunchDateOfType___block_invoke;
  block[3] = &unk_1E68AD2C8;
  void block[5] = &v7;
  void block[6] = a3;
  void block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)lastLaunchedApp
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__50;
  uint64_t v10 = __Block_byref_object_dispose__50;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32___ATXDataStore_lastLaunchedApp__block_invoke;
  v5[3] = &unk_1E68AB898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)removeAppInfoForBundleIdsNotInSet:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51___ATXDataStore_removeAppInfoForBundleIdsNotInSet___block_invoke;
    v6[3] = &unk_1E68AB870;
    v6[4] = self;
    id v7 = v4;
    [(_ATXDataStore *)self _doAsync:v6];
  }
  else
  {
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore removeAppInfoForBundleIdsNotInSet:]();
    }
  }
}

- (void)removeAppInfoForBundleId:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_deletions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "_ATXDataStore: Removing appInfo for bundleId: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42___ATXDataStore_removeAppInfoForBundleId___block_invoke;
  v7[3] = &unk_1E68AB870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(_ATXDataStore *)self _doAsync:v7];
}

- (void)removeAppLaunchesForBundleId:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke;
  v6[3] = &unk_1E68AB870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(_ATXDataStore *)self _doAsync:v6];
}

- (void)clearAppLaunchInfo
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35___ATXDataStore_clearAppLaunchInfo__block_invoke;
  block[3] = &unk_1E68AB818;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)clearAppInstallInfo
{
  id v3 = __atxlog_handle_app_install();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Clearing all app install dates", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36___ATXDataStore_clearAppInstallInfo__block_invoke;
  block[3] = &unk_1E68AB818;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (int64_t)launchedAppCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33___ATXDataStore_launchedAppCount__block_invoke;
  v5[3] = &unk_1E68AB898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)loadAppInfo
{
  int64_t v3 = objc_opt_new();
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28___ATXDataStore_loadAppInfo__block_invoke;
  v9[3] = &unk_1E68AB870;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(queue, v9);
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

- (id)loadAppActionInfo
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__50;
  id v17 = __Block_byref_object_dispose__50;
  id v18 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__50;
  uint64_t v11 = __Block_byref_object_dispose__50;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34___ATXDataStore_loadAppActionInfo__block_invoke;
  block[3] = &unk_1E68AEDD8;
  void block[4] = self;
  void block[5] = &v13;
  void block[6] = &v7;
  dispatch_sync(queue, block);
  id v3 = objc_alloc(MEMORY[0x1E4F93BB8]);
  id v4 = (void *)[v3 initWithFirst:v14[5] second:v8[5]];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

- (id)lastMessageToRecipient:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__50;
  id v16 = __Block_byref_object_dispose__50;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40___ATXDataStore_lastMessageToRecipient___block_invoke;
  block[3] = &unk_1E68AD278;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)loadTopNAppActionsByPredictions:(unint64_t)a3
{
  id v5 = objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke;
  block[3] = &unk_1E68AE7A8;
  void block[4] = self;
  unint64_t v13 = a3;
  id v7 = v5;
  id v12 = v7;
  dispatch_sync(queue, block);
  uint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

- (void)writeLaunches:(id)a3 followingBundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 1017, @"Invalid parameter not satisfying: %@", @"launches" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 1018, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

LABEL_3:
  id v10 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v11 = (void *)MEMORY[0x1D25F6CC0]();
  id v22 = 0;
  id v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v22];
  id v13 = v22;
  if (!v12)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 1022, @"Archiver error: %@", v13 object file lineNumber description];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __47___ATXDataStore_writeLaunches_followingBundle___block_invoke;
  v19[3] = &unk_1E68AC320;
  v19[4] = self;
  id v20 = v12;
  id v14 = v9;
  id v21 = v14;
  id v15 = v12;
  [(_ATXDataStore *)self _doAsync:v19];
}

- (void)writeAppActionLaunches:(id)a3 followingAppAction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 1031, @"Invalid parameter not satisfying: %@", @"appActionlaunches" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 1032, @"Invalid parameter not satisfying: %@", @"appAction" object file lineNumber description];

LABEL_3:
  id v10 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v11 = (void *)MEMORY[0x1D25F6CC0]();
  id v22 = 0;
  id v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v22];
  id v13 = v22;
  if (!v12)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 1036, @"Archiver error: %@", v13 object file lineNumber description];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59___ATXDataStore_writeAppActionLaunches_followingAppAction___block_invoke;
  v19[3] = &unk_1E68AC320;
  v19[4] = self;
  id v20 = v12;
  id v14 = v9;
  id v21 = v14;
  id v15 = v12;
  [(_ATXDataStore *)self _doAsync:v19];
}

- (void)writeAverageSecondsBetweenLaunches:(id)a3 forBundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64___ATXDataStore_writeAverageSecondsBetweenLaunches_forBundleId___block_invoke;
  v10[3] = &unk_1E68AC320;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_ATXDataStore *)self _doAsync:v10];
}

- (void)writeMedianSecondsBetweenLaunches:(id)a3 forBundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63___ATXDataStore_writeMedianSecondsBetweenLaunches_forBundleId___block_invoke;
  v10[3] = &unk_1E68AC320;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_ATXDataStore *)self _doAsync:v10];
}

- (void)writeAverageSecondsBetweenAppActions:(id)a3 forAppAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67___ATXDataStore_writeAverageSecondsBetweenAppActions_forAppAction___block_invoke;
  v10[3] = &unk_1E68AC320;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_ATXDataStore *)self _doAsync:v10];
}

- (void)writeMedianSecondsBetweenAppActions:(id)a3 forAppAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66___ATXDataStore_writeMedianSecondsBetweenAppActions_forAppAction___block_invoke;
  v10[3] = &unk_1E68AC320;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_ATXDataStore *)self _doAsync:v10];
}

- (void)writeGenreId:(id)a3 subGenreIds:(id)a4 forBundleId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54___ATXDataStore_writeGenreId_subGenreIds_forBundleId___block_invoke;
  v14[3] = &unk_1E68AC3B8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(_ATXDataStore *)self _doAsync:v14];
}

- (void)writeApp2VecCluster:(id)a3 forBundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49___ATXDataStore_writeApp2VecCluster_forBundleId___block_invoke;
  v10[3] = &unk_1E68AC320;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_ATXDataStore *)self _doAsync:v10];
}

- (id)loadLaunchesFollowingBundle:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__50;
  id v18 = __Block_byref_object_dispose__50;
  id v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke;
  block[3] = &unk_1E68AD278;
  void block[4] = self;
  id v6 = v4;
  id v12 = v6;
  id v13 = &v14;
  dispatch_sync(queue, block);
  id v7 = (void *)v15[5];
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)loadAppActionLaunchesFollowing:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__50;
  id v19 = __Block_byref_object_dispose__50;
  id v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke;
  block[3] = &unk_1E68AD278;
  id v6 = v4;
  id v12 = v6;
  id v13 = self;
  uint64_t v14 = &v15;
  dispatch_sync(queue, block);
  id v7 = (void *)v16[5];
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)deleteLaunchesFollowingBundle:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke;
  v6[3] = &unk_1E68AB870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(_ATXDataStore *)self _doAsync:v6];
}

- (void)deleteLaunchesFollowingAppAction:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke;
  v6[3] = &unk_1E68AB870;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(_ATXDataStore *)self _doAsync:v6];
}

- (void)enumerateAppInfoBundlesExecutingBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55___ATXDataStore_enumerateAppInfoBundlesExecutingBlock___block_invoke;
  v7[3] = &unk_1E68AB528;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)enumerateAppInfoAppActionsExecutingBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58___ATXDataStore_enumerateAppInfoAppActionsExecutingBlock___block_invoke;
  v7[3] = &unk_1E68AB528;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)_enumerateAppInfoBundlesExecutingBlock:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56___ATXDataStore__enumerateAppInfoBundlesExecutingBlock___block_invoke;
  v7[3] = &unk_1E68B0DE0;
  id v8 = v4;
  id v6 = v4;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT bundleId FROM appInfo" onPrep:0 onRow:v7 onError:&__block_literal_global_353];
}

- (void)_enumerateAppInfoAppActionsExecutingBlock:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59___ATXDataStore__enumerateAppInfoAppActionsExecutingBlock___block_invoke;
  v7[3] = &unk_1E68B0DE0;
  id v8 = v4;
  id v6 = v4;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT appAction FROM appActionInfo" onPrep:0 onRow:v7 onError:&__block_literal_global_361];
}

- (id)loadAppActionsFromAppActionInfo
{
  id v3 = objc_opt_new();
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48___ATXDataStore_loadAppActionsFromAppActionInfo__block_invoke;
  v9[3] = &unk_1E68AB870;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(queue, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (id)totalSlotsInDatastore
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__50;
  id v10 = __Block_byref_object_dispose__50;
  id v11 = &unk_1F27F0E40;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38___ATXDataStore_totalSlotsInDatastore__block_invoke;
  v5[3] = &unk_1E68AB898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)totalNumberOfActionTypesForBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__50;
  uint64_t v16 = __Block_byref_object_dispose__50;
  id v17 = &unk_1F27F0E40;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke;
  block[3] = &unk_1E68AD278;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)actionExistsForBundleId:(id)a3 actionType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke;
  v12[3] = &unk_1E68B0E08;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  uint64_t v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v12);
  LOBYTE(queue) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)queue;
}

- (BOOL)containsActionType:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36___ATXDataStore_containsActionType___block_invoke;
  block[3] = &unk_1E68AD278;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (id)lastAppActionLaunchDateForAppAction:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__50;
  uint64_t v16 = __Block_byref_object_dispose__50;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke;
  block[3] = &unk_1E68AD278;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)averageSecondsBetweenAppActionsForAppAction:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__50;
  uint64_t v16 = __Block_byref_object_dispose__50;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke;
  block[3] = &unk_1E68AD278;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)medianSecondsBetweenAppActionsForAppAction:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__50;
  uint64_t v16 = __Block_byref_object_dispose__50;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke;
  block[3] = &unk_1E68AD278;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)filenamesAndDataForBackupWithTransport:(unint64_t)a3
{
  return [(_ATXDataStore *)self filenamesAndDataForBackupShouldPareDown:1 transport:a3];
}

- (id)filenamesAndDataForBackupShouldPareDown:(BOOL)a3 transport:(unint64_t)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v44 = 0;
  objc_super v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__50;
  v48 = __Block_byref_object_dispose__50;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__50;
  v42 = __Block_byref_object_dispose__50;
  id v43 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke;
  block[3] = &unk_1E68B0E30;
  void block[4] = self;
  void block[5] = &v44;
  char v37 = 1;
  void block[6] = &v38;
  dispatch_sync(queue, block);
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v45[5] && v39[5]) {
    objc_msgSend(v26, "setObject:forKeyedSubscript:");
  }
  if (a3) {
    goto LABEL_34;
  }
  id v7 = [MEMORY[0x1E4F4B650] modeCachesRootDirectory];
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v35 = 0;
  id v9 = [v8 contentsOfDirectoryAtPath:v7 error:&v35];
  id obj = v35;

  if (obj)
  {
    id v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore filenamesAndDataForBackupShouldPareDown:transport:]();
    }
    goto LABEL_32;
  }
  BOOL v27 = +[ATXCloudStorageSettingsListener isBackupForContactsEnabled];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v54 count:16];
  if (!v11) {
    goto LABEL_22;
  }
  uint64_t v12 = *(void *)v32;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      uint64_t v15 = [v7 stringByAppendingPathComponent:v14];
      id v16 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      id v30 = 0;
      id v17 = (void *)[v16 initWithContentsOfFile:v15 options:1 error:&v30];
      id v18 = v30;
      if (v18)
      {
        char v19 = __atxlog_handle_default();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v51 = v14;
          __int16 v52 = 2112;
          id v53 = v18;
          _os_log_error_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_ERROR, "Error while converting mode entity score file: %@ into NSData. Error: %@", buf, 0x16u);
        }
        id v20 = v17;
      }
      else
      {
        id v20 = [(id)objc_opt_class() removeSensitiveInformationFromModeEntityScoresFile:v17 shouldBackupContacts:v27];

        if (!v20) {
          goto LABEL_20;
        }
        char v19 = [@"mode_" stringByAppendingString:v14];
        [v26 setObject:v20 forKeyedSubscript:v19];
      }

LABEL_20:
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v54 count:16];
  }
  while (v11);
LABEL_22:

  if (a4 == 1)
  {
    id v9 = [MEMORY[0x1E4F4B650] onboardingStackWidgetCacheFilePath];
    id v21 = __atxlog_handle_backup();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v9;
      _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "onboarding stacks cache file being backed up: %@", buf, 0xCu);
    }

    id v29 = 0;
    id v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v9 options:1 error:&v29];
    id v10 = v29;
    if (v10)
    {
      id v23 = __atxlog_handle_backup();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[_ATXDataStore filenamesAndDataForBackupShouldPareDown:transport:]();
      }
    }
    else if (v22)
    {
      [v26 setObject:v22 forKeyedSubscript:@"onboardingStacks"];
    }

LABEL_32:
  }

LABEL_34:
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v26;
}

+ (id)removeSensitiveInformationFromModeEntityScoresFile:(id)a3 shouldBackupContacts:(BOOL)a4
{
  id v5 = a3;
  if (!v5)
  {
    id v28 = 0;
    goto LABEL_21;
  }
  BOOL v35 = a4;
  v36 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v6 = MEMORY[0x1D25F6CC0]();
  char v37 = (void *)MEMORY[0x1E4F28DC0];
  context = (void *)v6;
  id v7 = (void *)MEMORY[0x1D25F6CC0]();
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = v5;
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v34 = v13;
  id v5 = v12;
  id v17 = objc_msgSend(v8, "initWithObjects:", v9, v10, v11, v34, v14, v15, v16, objc_opt_class(), 0);
  v47[0] = 0;
  id v18 = [v37 unarchivedObjectOfClasses:v17 fromData:v12 error:v47];
  id v19 = v47[0];

  if (!v18)
  {
    id v29 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      +[_ATXDataStore removeSensitiveInformationFromModeEntityScoresFile:shouldBackupContacts:]();
    }

    id v28 = 0;
    goto LABEL_20;
  }
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__50;
  objc_super v45 = __Block_byref_object_dispose__50;
  id v46 = (id)objc_opt_new();
  id v20 = [v18 allValues];
  id v21 = [v20 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (v35)
    {
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __89___ATXDataStore_removeSensitiveInformationFromModeEntityScoresFile_shouldBackupContacts___block_invoke;
      v40[3] = &unk_1E68B0E58;
      v40[4] = &v41;
      id v23 = (void *)MEMORY[0x1D25F6CC0]([v18 enumerateKeysAndObjectsUsingBlock:v40]);
      uint64_t v24 = v42[5];
      id v39 = 0;
      uint64_t v25 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v24 requiringSecureCoding:1 error:&v39];
      id v26 = v39;
      if (v25 || !v26)
      {
        id v28 = v25;
      }
      else
      {
        BOOL v27 = __atxlog_handle_notification_management();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
          +[_ATXDataStore removeSensitiveInformationFromModeEntityScoresFile:shouldBackupContacts:]();
        }

        id v28 = 0;
      }

      goto LABEL_19;
    }
  }
  else
  {
    id v30 = [v18 allValues];
    long long v31 = [v30 firstObject];
    objc_opt_class();
    char v32 = objc_opt_isKindOfClass();

    if ((v32 & 1) == 0)
    {
      id v28 = v5;
      goto LABEL_19;
    }
  }
  id v28 = 0;
LABEL_19:
  _Block_object_dispose(&v41, 8);

LABEL_20:
LABEL_21:

  return v28;
}

+ (BOOL)pareDownForBackup:(sqlite3 *)a3
{
  unint64_t v4 = 0;
  BOOL v5 = 0;
  while (1)
  {
    uint64_t v6 = (void *)MEMORY[0x1D25F6CC0](a1, a2);
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %s", off_1E68B0E78[v4]);
    errmsg = 0;
    id v8 = v7;
    if (sqlite3_exec(a3, (const char *)[v8 UTF8String], 0, 0, &errmsg)) {
      break;
    }

    BOOL v5 = v4++ > 9;
    if (v4 == 11)
    {
      sqlite3_exec(a3, "VACUUM", 0, 0, 0);
      return 1;
    }
  }
  uint64_t v9 = __atxlog_handle_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[_ATXDataStore pareDownForBackup:]();
  }

  return v5;
}

+ (BOOL)isSqliteData:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] < 0x10)
  {
    BOOL v6 = 0;
  }
  else
  {
    unint64_t v4 = (void *)[v3 bytes];
    BOOL v6 = *v4 == 0x66206574694C5153 && v4[1] == 0x332074616D726FLL;
  }

  return v6;
}

- (BOOL)restoreFromBackup:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35___ATXDataStore_restoreFromBackup___block_invoke;
  block[3] = &unk_1E68AFB40;
  id v6 = v4;
  v47 = self;
  v48 = &v49;
  id v46 = v6;
  dispatch_sync(queue, block);
  uint64_t v38 = [MEMORY[0x1E4F4B650] modeCachesRootDirectory];
  uint64_t v37 = [@"mode_" length];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v57 count:16];
  if (v8)
  {
    uint64_t v10 = *(void *)v42;
    *(void *)&long long v9 = 138412546;
    long long v36 = v9;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasPrefix:", @"mode_", v36))
        {
          uint64_t v13 = [v12 substringFromIndex:v37];
          uint64_t v14 = [v38 stringByAppendingPathComponent:v13];

          uint64_t v15 = [v7 objectForKeyedSubscript:v12];
          id v40 = 0;
          char v16 = [v15 writeToFile:v14 options:1073741825 error:&v40];
          id v17 = v40;
          if ((v16 & 1) == 0)
          {
            id v18 = __atxlog_handle_backup();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v36;
              v54 = v12;
              __int16 v55 = 2112;
              id v56 = v17;
              _os_log_error_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_ERROR, "Error restoring to mode file %@: %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v57 count:16];
    }
    while (v8);
  }

  id v19 = [MEMORY[0x1E4F4B650] onboardingStackWidgetCacheFilePath];
  id v20 = [v7 objectForKeyedSubscript:@"onboardingStacks"];
  id v21 = v20;
  if (v20)
  {
    id v39 = 0;
    char v22 = [v20 writeToFile:v19 options:1073741825 error:&v39];
    id v23 = v39;
    if (v22)
    {
      uint64_t v24 = __atxlog_handle_backup();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_DEFAULT, "Successfully restored onboarding stacks cache.", buf, 2u);
      }
    }
    else
    {
      uint64_t v24 = __atxlog_handle_backup();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[_ATXDataStore restoreFromBackup:]((uint64_t)v19);
      }
    }
  }
  else
  {
    uint64_t v24 = __atxlog_handle_backup();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore restoreFromBackup:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
    id v23 = 0;
  }

  id v32 = objc_alloc(MEMORY[0x1E4F1CB18]);
  long long v33 = (void *)[v32 initWithSuiteName:*MEMORY[0x1E4F936E0]];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v33, "setDouble:forKey:", *MEMORY[0x1E4F936B8]);
  BOOL v34 = *((unsigned char *)v50 + 24) != 0;

  _Block_object_dispose(&v49, 8);
  return v34;
}

- (void)addAppLaunchForAppLaunchSequence:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke;
  block[3] = &unk_1E68AC320;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

- (id)appLaunchSequence
{
  id v3 = objc_opt_new();
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34___ATXDataStore_appLaunchSequence__block_invoke;
  v9[3] = &unk_1E68AB870;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(queue, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (id)histogramDataForHistogramType:(int64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__50;
  uint64_t v11 = __Block_byref_object_dispose__50;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47___ATXDataStore_histogramDataForHistogramType___block_invoke;
  block[3] = &unk_1E68AD2C8;
  void block[5] = &v7;
  void block[6] = a3;
  void block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)categoricalHistogramDataForHistogramType:(int64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__50;
  uint64_t v11 = __Block_byref_object_dispose__50;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke;
  block[3] = &unk_1E68AD2C8;
  void block[5] = &v7;
  void block[6] = a3;
  void block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)blobOfType:(int64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__50;
  uint64_t v11 = __Block_byref_object_dispose__50;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28___ATXDataStore_blobOfType___block_invoke;
  block[3] = &unk_1E68AD2C8;
  void block[5] = &v7;
  void block[6] = a3;
  void block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)writeBlob:(id)a3 type:(int64_t)a4 expirationDate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47___ATXDataStore_writeBlob_type_expirationDate___block_invoke;
  v13[3] = &unk_1E68AE970;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(queue, v13);
}

- (BOOL)alogContainsActionUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40___ATXDataStore_alogContainsActionUUID___block_invoke;
  block[3] = &unk_1E68AD278;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (void)writeActionType:(id)a3 bundleId:(id)a4 date:(id)a5 action:(id)a6 slotSets:(id)a7 timeZone:(id)a8 prevLocationUUID:(id)a9 locationUUID:(id)a10 weight:(double)a11 actionUUID:(id)a12 motionType:(int64_t)a13 appSessionStartDate:(id)a14 appSessionEndDate:(id)a15 geohash:(int64_t)a16 coarseGeohash:(int64_t)a17
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v24 = a4;
  id v25 = a5;
  id v79 = a6;
  id v26 = a7;
  id v75 = a8;
  id v27 = a9;
  id v71 = a10;
  id v28 = a12;
  id v69 = a14;
  id v68 = a15;
  if (v23)
  {
    if (v24) {
      goto LABEL_3;
    }
  }
  else
  {
    id v56 = [MEMORY[0x1E4F28B00] currentHandler];
    [v56 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 1984, @"Invalid parameter not satisfying: %@", @"actionType" object file lineNumber description];

    if (v24) {
      goto LABEL_3;
    }
  }
  v57 = [MEMORY[0x1E4F28B00] currentHandler];
  [v57 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 1985, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

LABEL_3:
  uint64_t v29 = (uint64_t)v25;
  if (!v79)
  {
    uint64_t v58 = [MEMORY[0x1E4F28B00] currentHandler];
    [v58 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 1986, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];
  }
  if (!v26)
  {
    v59 = [MEMORY[0x1E4F28B00] currentHandler];
    [v59 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 1987, @"Invalid parameter not satisfying: %@", @"slotSets" object file lineNumber description];
  }
  if (a11 <= 0.0)
  {
    v60 = [MEMORY[0x1E4F28B00] currentHandler];
    [v60 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 1988, @"Invalid parameter not satisfying: %@", @"0.0 < weight" object file lineNumber description];
  }
  if (a11 > 1.0)
  {
    v61 = [MEMORY[0x1E4F28B00] currentHandler];
    [v61 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 1989, @"Invalid parameter not satisfying: %@", @"weight <= 1.0" object file lineNumber description];

    if (v28) {
      goto LABEL_11;
    }
  }
  else if (v28)
  {
    goto LABEL_11;
  }
  v62 = [MEMORY[0x1E4F28B00] currentHandler];
  [v62 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 1990, @"Invalid parameter not satisfying: %@", @"actionUUID" object file lineNumber description];

LABEL_11:
  uint64_t v30 = __atxlog_handle_default();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    double v103 = a11;
    __int16 v104 = 2112;
    id v105 = v23;
    __int16 v106 = 2112;
    id v107 = v24;
    __int16 v108 = 2112;
    id v109 = v79;
    _os_log_debug_impl(&dword_1D0FA3000, v30, OS_LOG_TYPE_DEBUG, "Recording action (* %0.2f) of type %@ for %@: %@", buf, 0x2Au);
  }
  v70 = v28;
  v73 = v24;
  v74 = v23;

  if (!v25) {
    uint64_t v29 = objc_opt_new();
  }
  v72 = (void *)v29;
  uint64_t v31 = +[_ATXActionUtils timeOfDayAndDayOfWeekForDate:v29 timeZone:v75];
  id v32 = [v31 first];
  uint64_t v65 = [v32 integerValue];

  v67 = v31;
  long long v33 = [v31 second];
  uint64_t v64 = [v33 integerValue];

  v78 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v26, "count"));
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obja = v26;
  uint64_t v34 = [obja countByEnumeratingWithState:&v97 objects:v101 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v98;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v98 != v36) {
          objc_enumerationMutation(obja);
        }
        uint64_t v38 = *(void **)(*((void *)&v97 + 1) + 8 * i);
        id v39 = objc_opt_new();
        [v38 setUuid:v39];
        id v40 = (void *)[objc_alloc(MEMORY[0x1E4F4B300]) initWithAction:v79 slots:v38];
        long long v41 = [ATXMinimalSlotResolutionParameters alloc];
        uint64_t v42 = [v40 hash];
        uint64_t v43 = [v38 hash];
        long long v44 = [v38 parameters];
        objc_super v45 = -[ATXMinimalSlotResolutionParameters initWithParameterHash:slotHash:uuid:paramCount:](v41, "initWithParameterHash:slotHash:uuid:paramCount:", v42, v43, v39, [v44 count]);
        [v78 setObject:v45 forKeyedSubscript:v39];
      }
      uint64_t v35 = [obja countByEnumeratingWithState:&v97 objects:v101 count:16];
    }
    while (v35);
  }

  id v46 = ATXSlotSetsSerialize();
  if (v46)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke;
    block[3] = &unk_1E68B0F78;
    void block[4] = self;
    id v81 = v73;
    v47 = v74;
    id v82 = v74;
    id v83 = v46;
    v48 = v72;
    id v84 = v72;
    uint64_t v91 = v65;
    uint64_t v92 = v64;
    id v85 = v27;
    uint64_t v49 = v71;
    id v86 = v71;
    double v93 = a11;
    v50 = v70;
    id v87 = v70;
    int64_t v94 = a13;
    uint64_t v51 = v73;
    char v52 = v69;
    id v88 = v69;
    id v53 = v68;
    id v89 = v68;
    int64_t v95 = a16;
    int64_t v96 = a17;
    v54 = v78;
    id v90 = v78;
    dispatch_sync(queue, block);
  }
  else
  {
    __int16 v55 = __atxlog_handle_default();
    v47 = v74;
    v48 = v72;
    uint64_t v49 = v71;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore writeActionType:bundleId:date:action:slotSets:timeZone:prevLocationUUID:locationUUID:weight:actionUUID:motionType:appSessionStartDate:appSessionEndDate:geohash:coarseGeohash:]((uint64_t)obja);
    }

    uint64_t v51 = v73;
    char v52 = v69;
    v50 = v70;
    id v53 = v68;
    v54 = v78;
  }
}

- (_PASDBIterAction_)_deserializeActionLogRowWithStmt:(id)a3 invokingBlock:(id)a4
{
  id v5 = a3;
  id v6 = (uint64_t (**)(id, void *, void *, void *, void *, uint64_t, uint64_t, void *, double, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))a4;
  uint64_t v41 = MEMORY[0x1D25F6CC0]();
  uint64_t v42 = [v5 getNSStringForColumn:0];
  uint64_t v7 = [v5 getNSDataForColumn:1];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v5, "getInt64ForColumn:", 2));
  uint64_t v39 = [v5 getIntegerForColumn:3];
  uint64_t v38 = [v5 getIntegerForColumn:4];
  uint64_t v9 = [v5 getNSDataForColumn:5];
  long long v44 = [v5 getNSDataForColumn:6];
  uint64_t v37 = [v5 getIntegerForColumn:7];
  if ([v5 isColumnNull:8]) {
    uint64_t v40 = 0;
  }
  else {
    uint64_t v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v5, "getInt64ForColumn:", 8));
  }
  objc_super v45 = (void *)v9;
  if ([v5 isColumnNull:9]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v5, "getInt64ForColumn:", 9));
  }
  uint64_t v11 = [v5 getInt64ForColumn:10];
  uint64_t v12 = [v5 getInt64ForColumn:11];
  [v5 getDoubleForColumn:12];
  double v14 = v13;
  if (v7 && (ATXSlotSetsDeserialize(), (id v15 = [v5 getInt64ForColumn:13];
  {
    uint64_t v34 = v11;
    uint64_t v36 = v8;
    if ([v45 length] == 16) {
      long long v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v45, "bytes"));
    }
    else {
      long long v33 = 0;
    }
    int64_t v16 = (void *)v42;
    uint64_t v17 = v12;
    uint64_t v43 = v7;
    id v18 = v16;
    id v19 = v6;
    if ([v44 length] == 16) {
      uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v44, "bytes"));
    }
    else {
      uint64_t v20 = 0;
    }
    id v32 = (void *)v20;
    id v21 = [v15 first];
    char v22 = [v15 second];
    uint64_t v30 = v34;
    uint64_t v31 = v17;
    uint64_t v35 = v15;
    id v23 = (void *)v10;
    id v24 = (void *)v40;
    int v25 = v19[2](v19, v16, v21, v22, v36, v39, v38, v33, v14, v20, v37, v40, v10, v30, v31);

    id v6 = v19;
    id v26 = (BOOL *)MEMORY[0x1E4F93C08];
    if (!v25) {
      id v26 = (BOOL *)MEMORY[0x1E4F93C10];
    }
    v27.var0 = *v26;

    id v8 = v36;
    id v28 = (void *)v41;
    uint64_t v7 = v43;
  }
  else
  {
    v27.var0 = *MEMORY[0x1E4F93C08];
    id v23 = (void *)v10;
    id v18 = (void *)v42;
    id v24 = (void *)v40;
    id v28 = (void *)v41;
  }

  return v27;
}

- (void)enumerateActionOfType:(id)a3 bundleId:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2234, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2235, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_4;
  }
  int64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2233, @"Invalid parameter not satisfying: %@", @"actionType" object file lineNumber description];

  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke;
  block[3] = &unk_1E68AF208;
  void block[4] = self;
  id v20 = v10;
  id v21 = v9;
  id v22 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_sync(queue, block);
}

- (void)enumerateSlotUuidsOfType:(id)a3 bundleId:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2279, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2280, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_4;
  }
  int64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2278, @"Invalid parameter not satisfying: %@", @"actionType" object file lineNumber description];

  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v54[3] = -1;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__50;
  v52[4] = __Block_byref_object_dispose__50;
  id v53 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__50;
  v50[4] = __Block_byref_object_dispose__50;
  id v51 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v49[3] = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__50;
  void v46[4] = __Block_byref_object_dispose__50;
  id v47 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__50;
  v44[4] = __Block_byref_object_dispose__50;
  id v45 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__50;
  v40[4] = __Block_byref_object_dispose__50;
  id v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__50;
  v38[4] = __Block_byref_object_dispose__50;
  id v39 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke;
  block[3] = &unk_1E68B1018;
  void block[4] = self;
  id v20 = v10;
  id v23 = v54;
  id v24 = v52;
  int v25 = v50;
  id v26 = v49;
  _PASDBIterAction_ v27 = v48;
  id v28 = v46;
  uint64_t v29 = v44;
  uint64_t v30 = v43;
  uint64_t v31 = v42;
  id v32 = v40;
  long long v33 = v38;
  uint64_t v34 = v37;
  uint64_t v35 = v36;
  id v21 = v9;
  id v22 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_sync(queue, block);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v44, 8);

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(v54, 8);
}

- (void)enumerateActionsInUUIDSet:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2373, @"Invalid parameter not satisfying: %@", @"uuidSet" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2374, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

LABEL_3:
  if ([v7 count])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49___ATXDataStore_enumerateActionsInUUIDSet_block___block_invoke;
    block[3] = &unk_1E68AF2D0;
    id v14 = v7;
    id v15 = self;
    id v16 = v9;
    dispatch_sync(queue, block);
  }
}

- (id)appIntentDuetEventsForActionsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2397, @"Invalid parameter not satisfying: %@", @"startDate" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2398, @"Invalid parameter not satisfying: %@", @"endDate" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71___ATXDataStore_appIntentDuetEventsForActionsBetweenStartDate_endDate___block_invoke;
  block[3] = &unk_1E68AC3B8;
  void block[4] = self;
  id v21 = v7;
  id v22 = v9;
  id v12 = v10;
  id v23 = v12;
  id v13 = v9;
  id v14 = v7;
  dispatch_sync(queue, block);
  id v15 = v23;
  id v16 = v12;

  return v16;
}

- (id)minimalActionParametersforActionsBetweenStartDate:(id)a3 endDate:(id)a4 limit:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2452, @"Invalid parameter not satisfying: %@", @"startDate" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2453, @"Invalid parameter not satisfying: %@", @"endDate" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  id v12 = objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81___ATXDataStore_minimalActionParametersforActionsBetweenStartDate_endDate_limit___block_invoke;
  block[3] = &unk_1E68AE738;
  void block[4] = self;
  id v23 = v9;
  id v24 = v11;
  unint64_t v26 = a5;
  id v14 = v12;
  id v25 = v14;
  id v15 = v11;
  id v16 = v9;
  dispatch_sync(queue, block);
  uint64_t v17 = v25;
  id v18 = v14;

  return v18;
}

- (id)numActionKeyOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2502, @"Invalid parameter not satisfying: %@", @"startDate" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2503, @"Invalid parameter not satisfying: %@", @"endDate" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65___ATXDataStore_numActionKeyOccurrencesBetweenStartDate_endDate___block_invoke;
  block[3] = &unk_1E68AC3B8;
  void block[4] = self;
  id v21 = v7;
  id v22 = v9;
  id v12 = v10;
  id v23 = v12;
  id v13 = v9;
  id v14 = v7;
  dispatch_sync(queue, block);
  id v15 = v23;
  id v16 = v12;

  return v16;
}

- (unint64_t)numActionKeyOccurrencesForActionKey:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2537, @"Invalid parameter not satisfying: %@", @"startDate" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2538, @"Invalid parameter not satisfying: %@", @"endDate" object file lineNumber description];

    goto LABEL_4;
  }
  id v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2536, @"Invalid parameter not satisfying: %@", @"actionKey" object file lineNumber description];

  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  id v12 = +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:v9];
  id v13 = [v12 first];
  id v14 = [v12 second];
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71___ATXDataStore_numActionKeyOccurrencesForActionKey_startDate_endDate___block_invoke;
  block[3] = &unk_1E68B1068;
  void block[4] = self;
  id v26 = v10;
  id v27 = v11;
  id v28 = v13;
  id v29 = v14;
  uint64_t v30 = &v31;
  id v16 = v14;
  id v17 = v13;
  id v18 = v11;
  id v19 = v10;
  dispatch_sync(queue, block);
  unint64_t v20 = v32[3];

  _Block_object_dispose(&v31, 8);
  return v20;
}

- (unint64_t)numBundleIdOccurrencesForBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2571, @"Invalid parameter not satisfying: %@", @"startDate" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2572, @"Invalid parameter not satisfying: %@", @"endDate" object file lineNumber description];

    goto LABEL_4;
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2570, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69___ATXDataStore_numBundleIdOccurrencesForBundleId_startDate_endDate___block_invoke;
  block[3] = &unk_1E68B1090;
  void block[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v9;
  id v25 = &v26;
  id v13 = v9;
  id v14 = v11;
  id v15 = v10;
  dispatch_sync(queue, block);
  unint64_t v16 = v27[3];

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (unint64_t)numActionParameterHashOccurrencesForActionKey:(id)a3 parameterHash:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_6:
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2604, @"Invalid parameter not satisfying: %@", @"startDate" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2605, @"Invalid parameter not satisfying: %@", @"endDate" object file lineNumber description];

    goto LABEL_4;
  }
  id v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2603, @"Invalid parameter not satisfying: %@", @"actionKey" object file lineNumber description];

  if (!v12) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v13) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  id v14 = +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:v11];
  id v15 = [v14 first];
  unint64_t v16 = [v14 second];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95___ATXDataStore_numActionParameterHashOccurrencesForActionKey_parameterHash_startDate_endDate___block_invoke;
  block[3] = &unk_1E68B10E0;
  void block[4] = self;
  id v28 = v12;
  id v29 = v13;
  id v30 = v15;
  id v31 = v16;
  id v32 = &v34;
  unint64_t v33 = a4;
  id v18 = v16;
  id v19 = v15;
  id v20 = v13;
  id v21 = v12;
  dispatch_sync(queue, block);
  unint64_t v22 = v35[3];

  _Block_object_dispose(&v34, 8);
  return v22;
}

- (id)actionForSlotUUID:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x3032000000;
    uint64_t v38 = __Block_byref_object_copy__50;
    id v39 = __Block_byref_object_dispose__50;
    id v40 = 0;
    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x3032000000;
    id v32 = __Block_byref_object_copy__50;
    unint64_t v33 = __Block_byref_object_dispose__50;
    id v34 = 0;
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__50;
    id v27 = __Block_byref_object_dispose__50;
    id v28 = 0;
    db = self->_db;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __35___ATXDataStore_actionForSlotUUID___block_invoke;
    v21[3] = &unk_1E68AD200;
    id v22 = v4;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __35___ATXDataStore_actionForSlotUUID___block_invoke_2;
    v20[3] = &unk_1E68AEF30;
    v20[4] = &v29;
    v20[5] = &v35;
    v20[6] = &v23;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __35___ATXDataStore_actionForSlotUUID___block_invoke_3;
    id v18 = &unk_1E68AD250;
    id v19 = v22;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT l.slots FROM alog AS l, slotSetKey AS s WHERE l.id = s.alogId AND s.uuid = ?" onPrep:v21 onRow:v20 onError:&v15];
    id v7 = (void *)v36[5];
    if (!v7)
    {
      if (!v30[5])
      {
        id v8 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v41 = *MEMORY[0x1E4F28568];
        v42[0] = @"Database has no action data for given slot UUID";
        id v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1, v15, v16, v17, v18);
        uint64_t v10 = [v8 errorWithDomain:@"ATXSlotResolutionSerialization" code:0 userInfo:v9];
        id v11 = (void *)v24[5];
        v24[5] = v10;
      }
      id v12 = __atxlog_handle_default();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[_ATXDataStore actionForSlotUUID:]();
      }

      id v7 = (void *)v36[5];
    }
    id v13 = v7;

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)removeActionDataForActionUUIDs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2706, @"Invalid parameter not satisfying: %@", @"actionUUIDs" object file lineNumber description];
  }
  id v6 = __atxlog_handle_deletions();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Deleting actions with actionUUIDs: %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke;
  block[3] = &unk_1E68AB870;
  id v11 = v5;
  id v12 = self;
  id v8 = v5;
  dispatch_sync(queue, block);
}

- (void)removeActionDataForActionUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2743, @"Invalid parameter not satisfying: %@", @"actionUUID" object file lineNumber description];
  }
  id v6 = __atxlog_handle_deletions();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Deleting actions with actionUUID: %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47___ATXDataStore_removeActionDataForActionUUID___block_invoke;
  block[3] = &unk_1E68AB870;
  void block[4] = self;
  id v11 = v5;
  id v8 = v5;
  dispatch_sync(queue, block);
}

- (BOOL)hasOrphanSlotSetKeys
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37___ATXDataStore_hasOrphanSlotSetKeys__block_invoke;
  v5[3] = &unk_1E68AB898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)removeActionDataForBundleId:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2792, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];
  }
  uint64_t v6 = __atxlog_handle_deletions();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Deleting actions with bundleId: %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___ATXDataStore_removeActionDataForBundleId___block_invoke;
  block[3] = &unk_1E68AB870;
  void block[4] = self;
  id v11 = v5;
  id v8 = v5;
  dispatch_sync(queue, block);
}

- (id)actionAndSlotsForRowId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__50;
  uint64_t v16 = __Block_byref_object_dispose__50;
  id v17 = 0;
  db = self->_db;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40___ATXDataStore_actionAndSlotsForRowId___block_invoke;
  v10[3] = &unk_1E68AD200;
  id v6 = v4;
  id v11 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40___ATXDataStore_actionAndSlotsForRowId___block_invoke_2;
  v9[3] = &unk_1E68AD228;
  void v9[4] = &v12;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT slots FROM alog WHERE id=?" onPrep:v10 onRow:v9 onError:&__block_literal_global_601];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (int64_t)_regenerateSlotSetKeyForBundleId:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v57 = 0;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = -1;
  db = self->_db;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke;
  v55[3] = &unk_1E68AD200;
  id v28 = v4;
  id v56 = v28;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_2;
  v54[3] = &unk_1E68AD228;
  void v54[4] = &v57;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT id FROM alogBundleId WHERE bundleId=?" onPrep:v55 onRow:v54 onError:0];
  if (v58[3] == -1)
  {
    int64_t v30 = 3;
  }
  else
  {
    id v6 = self->_db;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_3;
    v53[3] = &unk_1E68B0ED8;
    v53[4] = &v57;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_4;
    v51[3] = &unk_1E68AD250;
    id v52 = v28;
    [(_PASSqliteDatabase *)v6 prepAndRunQuery:@"DELETE FROM slotSetKey WHERE alogId in (SELECT id FROM alog WHERE bundleId=?)" onPrep:v53 onRow:0 onError:v51];
    id v7 = objc_opt_new();
    id v8 = self->_db;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_608;
    v50[3] = &unk_1E68B0ED8;
    v50[4] = &v57;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_2_609;
    v48[3] = &unk_1E68AE948;
    id v9 = v7;
    id v49 = v9;
    [(_PASSqliteDatabase *)v8 prepAndRunQuery:@"SELECT id FROM alog WHERE bundleId=?" onPrep:v50 onRow:v48 onError:0];
    uint64_t v31 = objc_opt_new();
    int64_t v47 = 3;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v62 count:16];
    if (v10)
    {
      uint64_t v32 = *(void *)v44;
LABEL_4:
      uint64_t v11 = 0;
      uint64_t v33 = v10;
      while (1)
      {
        if (*(void *)v44 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v11;
        uint64_t v12 = *(void *)(*((void *)&v43 + 1) + 8 * v11);
        context = (void *)MEMORY[0x1D25F6CC0]();
        id v34 = [(_ATXDataStore *)self actionAndSlotsForRowId:v12];
        id v13 = [v34 first];
        if (v13
          && +[_ATXActionUtils shouldAcceptAudioOrVideoCallIntent:v13])
        {
          uint64_t v14 = +[_ATXActionUtils slotSetsForAction:v13 intentCache:0];
          uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v13 second:v14];
          [v31 setObject:v15 forKeyedSubscript:v12];

          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v16 = v14;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v61 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v38 != v18) {
                  objc_enumerationMutation(v16);
                }
                id v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                id v21 = objc_opt_new();
                [v20 setUuid:v21];
                id v22 = [[ATXMinimalSlotResolutionParameters alloc] initWithAction:v13 slots:v20];
                [(_ATXDataStore *)self writeSlotSetKeyParameters:v22 rowId:v12 slotSet:v20 success:&v47];
              }
              uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v61 count:16];
            }
            while (v17);
          }

          if (v47) {
            int64_t v47 = [(_ATXDataStore *)self updateAlog:v12 slotsToMigrate:v31];
          }
          [v31 removeAllObjects];
          int v23 = v47 != 3;
          int64_t v24 = v30;
          if (v47 != 3) {
            int64_t v24 = v47;
          }
          int64_t v30 = v24;
        }
        else
        {
          uint64_t v25 = __atxlog_handle_deletions();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "_ATXDataStore: Deleting INStartAudioCallIntent or INStartVideoCallIntent", buf, 2u);
          }

          uint64_t v26 = self->_db;
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_610;
          v41[3] = &unk_1E68AD200;
          v41[4] = v12;
          [(_PASSqliteDatabase *)v26 prepAndRunQuery:@"DELETE FROM alog WHERE id=?" onPrep:v41 onRow:&__block_literal_global_613 onError:0];
          int v23 = 3;
        }

        if (v23 != 3)
        {
          if (v23) {
            break;
          }
        }
        uint64_t v11 = v36 + 1;
        if (v36 + 1 == v33)
        {
          uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v62 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_28;
        }
      }
    }
    else
    {
LABEL_28:
      int64_t v30 = 3;
    }
  }
  _Block_object_dispose(&v57, 8);

  return v30;
}

- (void)regenerateSlotSetKeyForBundleId:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 2920, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49___ATXDataStore_regenerateSlotSetKeyForBundleId___block_invoke;
  v8[3] = &unk_1E68AB870;
  void v8[4] = self;
  id v9 = v5;
  id v6 = v5;
  [(_ATXDataStore *)self _doAsync:v8];
}

- (void)trimActionHistoryWithAppWhitelist:(id)a3
{
  id v4 = a3;
  id v5 = __atxlog_handle_default();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = __atxlog_handle_default();
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "trimActionHistoryWithAppWhitelist", " enableTelemetry=YES ", buf, 2u);
  }

  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke;
  v13[3] = &unk_1E68AB870;
  void v13[4] = self;
  id v14 = v4;
  id v10 = v4;
  dispatch_sync(queue, v13);
  uint64_t v11 = __atxlog_handle_default();
  uint64_t v12 = v11;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v12, OS_SIGNPOST_INTERVAL_END, v6, "trimActionHistoryWithAppWhitelist", " enableTelemetry=YES ", buf, 2u);
  }
}

- (id)actionLogKeys
{
  char v3 = objc_opt_new();
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30___ATXDataStore_actionLogKeys__block_invoke;
  v7[3] = &unk_1E68AE948;
  id v5 = v3;
  id v8 = v5;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT DISTINCT b.bundleId, i.actionType FROM alog AS l, alogBundleId AS b, alogAction AS i WHERE b.id = l.bundleId AND i.id = l.actionType" onPrep:0 onRow:v7 onError:0];

  return v5;
}

- (void)recordConfirms:(double)a3 rejects:(double)a4 forFeedbackType:(unint64_t)a5 forActionType:(id)a6 bundleId:(id)a7 action:(id)a8 slotSet:(id)a9 actionUUID:(id)a10 date:(id)a11 consumerSubType:(unsigned __int8)a12 geohash:(int64_t)a13 coarseGeohash:(int64_t)a14
{
  id v32 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  if (!v24) {
    id v24 = (id)[objc_alloc(MEMORY[0x1E4F4B308]) initWithOpaqueParameters];
  }
  id v27 = [MEMORY[0x1E4F1CAD0] setWithObject:v24];
  id v28 = ATXSlotSetsSerialize();

  if (v28)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke;
    block[3] = &unk_1E68B11A8;
    void block[4] = self;
    id v34 = v22;
    uint64_t v29 = v32;
    id v35 = v32;
    id v36 = v28;
    double v39 = a3;
    double v40 = a4;
    id v37 = v25;
    unsigned __int8 v44 = a12;
    id v38 = v26;
    unint64_t v41 = a5;
    int64_t v42 = a13;
    int64_t v43 = a14;
    dispatch_sync(queue, block);
  }
  else
  {
    int64_t v30 = __atxlog_handle_default();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore recordConfirms:rejects:forFeedbackType:forActionType:bundleId:action:slotSet:actionUUID:date:consumerSubType:geohash:coarseGeohash:]((uint64_t)v24, (uint64_t)v23, v30);
    }

    uint64_t v29 = v32;
  }
}

- (void)enumerateFeedbackForActionOfType:(id)a3 bundleId:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 3170, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 3171, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_4;
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 3169, @"Invalid parameter not satisfying: %@", @"actionType" object file lineNumber description];

  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke;
  block[3] = &unk_1E68AF208;
  void block[4] = self;
  id v20 = v10;
  id v21 = v9;
  id v22 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_sync(queue, block);
}

- (void)removeAllSlotsFromActionLog
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___ATXDataStore_removeAllSlotsFromActionLog__block_invoke;
  block[3] = &unk_1E68AB818;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)removeAllSlotsFromActionFeedback
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49___ATXDataStore_removeAllSlotsFromActionFeedback__block_invoke;
  block[3] = &unk_1E68AB818;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)removeAllSlotsFromSlotSetKey
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___ATXDataStore_removeAllSlotsFromSlotSetKey__block_invoke;
  block[3] = &unk_1E68AB818;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (id)actionFeedbackLogKeys
{
  char v3 = objc_opt_new();
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38___ATXDataStore_actionFeedbackLogKeys__block_invoke;
  v7[3] = &unk_1E68AE948;
  id v5 = v3;
  id v8 = v5;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT DISTINCT b.bundleId, i.actionType FROM afeedback AS l, alogBundleId AS b, alogAction AS i WHERE b.id = l.bundleId AND i.id = l.actionType" onPrep:0 onRow:v7 onError:0];

  return v5;
}

- (void)removeActionsWithoutTitle
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___ATXDataStore_removeActionsWithoutTitle__block_invoke;
  block[3] = &unk_1E68AB818;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)_removeActionsWithoutTitle
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  db = self->_db;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43___ATXDataStore__removeActionsWithoutTitle__block_invoke;
  v5[3] = &unk_1E68AB898;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASSqliteDatabase *)db writeTransaction:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)currentSchemaVersion
{
  db = self->_db;
  if (!db) {
    -[_ATXDataStore currentSchemaVersion]();
  }
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37___ATXDataStore_currentSchemaVersion__block_invoke;
  v5[3] = &unk_1E68AD228;
  v5[4] = &v6;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT version FROM meta" onPrep:0 onRow:v5 onError:&__block_literal_global_699];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)migrate
{
  id v3 = +[_ATXDataStoreMigrations migrations];
  [(_ATXDataStore *)self migrateWithMigrationPlan:v3];
}

- (void)migrateWithMigrationPlan:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  unint64_t v31 = [v33 count];
  id v34 = self;
  unint64_t v32 = [(_ATXDataStore *)self currentSchemaVersion];
  self->_unint64_t schemaVersion = v32;
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v45 = v31;
    __int16 v46 = 2048;
    unint64_t v47 = v32;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_INFO, "ATXDataStore: Migrating with maxDBVersion in migration plan: %ld. Current schema version: %lu.", buf, 0x16u);
  }

  unint64_t schemaVersion = self->_schemaVersion;
  if (schemaVersion - 35 <= 3)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v6 = [&unk_1F27F2CD0 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v37;
      uint64_t v8 = MEMORY[0x1E4F143A8];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v37 != v7) {
            objc_enumerationMutation(&unk_1F27F2CD0);
          }
          id v10 = [NSString stringWithFormat:@"DELETE FROM %@ WHERE histogramType>5", *(void *)(*((void *)&v36 + 1) + 8 * i)];
          db = self->_db;
          v35[0] = v8;
          v35[1] = 3221225472;
          v35[2] = __42___ATXDataStore_migrateWithMigrationPlan___block_invoke;
          v35[3] = &unk_1E68AD250;
          v35[4] = self;
          [(_PASSqliteDatabase *)db prepAndRunQuery:v10 onPrep:0 onRow:0 onError:v35];
        }
        uint64_t v6 = [&unk_1F27F2CD0 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v6);
    }
    unint64_t schemaVersion = self->_schemaVersion;
  }
  if (schemaVersion <= 2)
  {
    uint64_t v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_INFO, "Migrating _ATXDataStore schema. Since previous _schemaVersion is from before migrations started, reset to current schema", buf, 2u);
    }

    [(_ATXDataStore *)self clearDatabase];
    uint64_t v13 = [(_ATXDataStore *)self skipFromZeroSchema];
LABEL_22:
    switch(v13)
    {
      case 2:
        dbMigrationTracker = v34->_dbMigrationTracker;
        id v28 = [NSNumber numberWithUnsignedInteger:v32];
        v40[0] = v28;
        uint64_t v29 = [NSNumber numberWithUnsignedInteger:v34->_schemaVersion];
        v40[1] = v29;
        v40[2] = @"unsupported";
        int64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
        [(PETScalarEventTracker *)dbMigrationTracker trackEventWithPropertyValues:v30];

        break;
      case 1:
        id v23 = v34->_dbMigrationTracker;
        id v24 = [NSNumber numberWithUnsignedInteger:v32];
        v41[0] = v24;
        id v25 = [NSNumber numberWithUnsignedInteger:v34->_schemaVersion];
        v41[1] = v25;
        v41[2] = @"success";
        id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];
        [(PETScalarEventTracker *)v23 trackEventWithPropertyValues:v26];

        break;
      case 0:
        uint64_t v18 = __atxlog_handle_default();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_INFO, "_ATXDataStore migration failed!", buf, 2u);
        }

        id v19 = v34->_dbMigrationTracker;
        id v20 = [NSNumber numberWithUnsignedInteger:v32];
        v42[0] = v20;
        id v21 = [NSNumber numberWithUnsignedInteger:v34->_schemaVersion];
        v42[1] = v21;
        void v42[2] = @"failed";
        id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:3];
        [(PETScalarEventTracker *)v19 trackEventWithPropertyValues:v22];

        [(_PASSqliteDatabase *)v34->_db placeCorruptionMarker];
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F93C00] format:@"_ATXDataStore migration failed. Marking as corrupt."];
        break;
    }
    goto LABEL_33;
  }
  BOOL v14 = schemaVersion < v31;
  id v15 = __atxlog_handle_default();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_INFO, "ATXDataStore: Migrating _ATXDataStore schema since current schema version is smaller than maxDbVersion in migration plan.", buf, 2u);
    }

    uint64_t v17 = (void *)os_transaction_create();
    do
      uint64_t v13 = [(_ATXDataStore *)v34 migrateToVersion:v34->_schemaVersion + 1 withMigrationPlan:v33];
    while (v13 == 3);

    goto LABEL_22;
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_INFO, "ATXDataStore: Not migrating _ATXDataStore since the current schema version is greater than or equal to the maxDBVersion in the migration plan.", buf, 2u);
  }

LABEL_33:
}

- (int64_t)skipFromZeroSchema
{
  id v3 = +[_ATXDataStoreMigrations skipFromZeroSchema:&self->_schemaVersion];
  int64_t v4 = [(_ATXDataStore *)self runMigrationPlan:v3];

  if (v4 == 3) {
    return 1;
  }
  uint64_t v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[_ATXDataStore skipFromZeroSchema]();
  }

  return 0;
}

- (int64_t)configureDatabase
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = [&unk_1F27F2CE8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v16;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(&unk_1F27F2CE8);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * v5);
        uint64_t v11 = 0;
        uint64_t v12 = &v11;
        uint64_t v13 = 0x2020000000;
        char v14 = 0;
        db = self->_db;
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __34___ATXDataStore_configureDatabase__block_invoke;
        v10[3] = &unk_1E68AEB20;
        void v10[4] = &v11;
        [(_PASSqliteDatabase *)db prepAndRunQuery:v6 onPrep:0 onRow:0 onError:v10];
        int v8 = *((unsigned __int8 *)v12 + 24);
        _Block_object_dispose(&v11, 8);
        if (v8) {
          return 0;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [&unk_1F27F2CE8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (int64_t)migrateToVersion:(unint64_t)a3 withMigrationPlan:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_schemaVersion == a3 - 1)
  {
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
    int v8 = [v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      ++self->_schemaVersion;
      int64_t v9 = [(_ATXDataStore *)self runMigrationPlan:v8];
      id v10 = __atxlog_handle_default();
      uint64_t v11 = v10;
      if (v9 == 3)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v14 = 134217984;
          unint64_t v15 = a3;
          _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_INFO, "ATXDataStore: Migration to version %lu completed.", (uint8_t *)&v14, 0xCu);
        }
        int64_t v12 = 3;
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[_ATXDataStore migrateToVersion:withMigrationPlan:]();
        }
        int64_t v12 = 0;
      }
    }
    else
    {
      int64_t v12 = 1;
    }
  }
  else
  {
    int v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore migrateToVersion:withMigrationPlan:]();
    }
    int64_t v12 = 2;
  }

  return v12;
}

- (int64_t)runMigrationPlan:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34___ATXDataStore_runMigrationPlan___block_invoke;
  v9[3] = &unk_1E68B11F8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = self;
  int64_t v12 = &v13;
  [(_PASSqliteDatabase *)db frailWriteTransaction:v9];
  int64_t v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)updateSchemaVersionNumberTo:(int64_t)a3
{
  db = self->_db;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45___ATXDataStore_updateSchemaVersionNumberTo___block_invoke;
  v4[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v4[4] = a3;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"UPDATE meta SET version=? WHERE id=1" onPrep:v4 onRow:0 onError:&__block_literal_global_735];
}

- (void)clearDatabase
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  db = self->_db;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __30___ATXDataStore_clearDatabase__block_invoke;
  v19[3] = &unk_1E68AE948;
  id v5 = v3;
  id v20 = v5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __30___ATXDataStore_clearDatabase__block_invoke_2;
  v18[3] = &unk_1E68AD250;
  v18[4] = self;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT name FROM sqlite_master WHERE type='table' AND NOT name LIKE 'sqlite_%'" onPrep:0 onRow:v19 onError:v18];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [NSString stringWithFormat:@"DROP TABLE IF EXISTS %@", *(void *)(*((void *)&v14 + 1) + 8 * v10)];
        int64_t v12 = self->_db;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __30___ATXDataStore_clearDatabase__block_invoke_3;
        v13[3] = &unk_1E68AD250;
        void v13[4] = self;
        [(_PASSqliteDatabase *)v12 prepAndRunQuery:v11 onPrep:0 onRow:0 onError:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v21 count:16];
    }
    while (v8);
  }
}

- (int64_t)migration_LaunchHistoriesToAppTable
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 3;
  db = self->_db;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke;
  v5[3] = &unk_1E68AB898;
  v5[4] = self;
  void v5[5] = &v6;
  [(_PASSqliteDatabase *)db writeTransaction:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)migration_InstallDateToAppTable
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"_ATXAppInstallDate.plist"];
  id v38 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v3 options:2 error:&v38];
  id v5 = v38;
  if (v4)
  {
    uint64_t v6 = (void *)MEMORY[0x1D25F6CC0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    id v37 = v5;
    uint64_t v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v10 fromData:v4 error:&v37];
    id v12 = v37;

    if (v11)
    {
      id v30 = v12;
      unint64_t v31 = v4;

      uint64_t v13 = __atxlog_handle_app_install();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Converting install date plist to app table", buf, 2u);
      }

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v14 = v11;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v34 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            id v20 = [v14 objectForKeyedSubscript:v19];
            id v21 = __atxlog_handle_app_install();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              double v40 = v20;
              __int16 v41 = 2112;
              id v42 = v19;
              _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Setting date: %{public}@ for bundle id: %@", buf, 0x16u);
            }

            [v20 timeIntervalSinceReferenceDate];
            [(_ATXDataStore *)self migrationUpdateOrInsertTimestamp:(uint64_t)v22 intoColumn:@"installDate" forBundleId:v19];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v43 count:16];
        }
        while (v16);
      }

      id v4 = v31;
      id v12 = v30;
    }
    else
    {
      id v24 = __atxlog_handle_default();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[_ATXDataStore migration_InstallDateToAppTable]();
      }
    }
  }
  else
  {
    id v23 = __atxlog_handle_default();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore migration_InstallDateToAppTable]();
    }

    id v12 = v5;
  }
  id v25 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v32 = v12;
  char v26 = [v25 removeItemAtPath:v3 error:&v32];
  id v27 = v32;

  if ((v26 & 1) == 0)
  {
    id v28 = __atxlog_handle_default();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      double v40 = v3;
      __int16 v41 = 2112;
      id v42 = v27;
      _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "Unable to remove %@: %@", buf, 0x16u);
    }
  }
  return 3;
}

- (int64_t)migration_AppLaunchHistogramToTable
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D25F6CC0](self, a2);
  int64_t v3 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"_ATXAppLaunchHistogram.v2.dat"];
  id v4 = +[_ATXDataStore loadDataFromFile:v3];

  [(_ATXDataStore *)self updateOrInsertHistogramData:v4 forHistogram:0];
  id v5 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"_ATXSpotlightAppLaunchHistogram.v2.dat"];
  uint64_t v6 = +[_ATXDataStore loadDataFromFile:v5];

  v50 = (void *)v6;
  [(_ATXDataStore *)self updateOrInsertHistogramData:v6 forHistogram:1];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v7 = [&unk_1F27F2D00 countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v65 != v9) {
          objc_enumerationMutation(&unk_1F27F2D00);
        }
        uint64_t v11 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:*(void *)(*((void *)&v64 + 1) + 8 * i)];
        id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v63 = 0;
        char v13 = [v12 removeItemAtPath:v11 error:&v63];
        id v14 = v63;

        if ((v13 & 1) == 0)
        {
          uint64_t v15 = __atxlog_handle_default();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v71 = v11;
            __int16 v72 = 2112;
            id v73 = v14;
            _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "Unable to remove %@: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [&unk_1F27F2D00 countByEnumeratingWithState:&v64 objects:v74 count:16];
    }
    while (v8);
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v16 = [&unk_1F27F2D18 countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    char v18 = 0;
    uint64_t v19 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v60 != v19) {
          objc_enumerationMutation(&unk_1F27F2D18);
        }
        id v21 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:*(void *)(*((void *)&v59 + 1) + 8 * j)];
        double v22 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v58 = 0;
        char v23 = [v22 removeItemAtPath:v21 error:&v58];
        id v24 = v58;

        if (v23)
        {
          char v18 = 1;
        }
        else
        {
          id v25 = __atxlog_handle_default();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v71 = v21;
            __int16 v72 = 2112;
            id v73 = v24;
            _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "Unable to remove %@: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v17 = [&unk_1F27F2D18 countByEnumeratingWithState:&v59 objects:v69 count:16];
    }
    while (v17);
    if (v18)
    {
      char v26 = [[_ATXAppLaunchHistogramWithPersistentBackup alloc] initWithDataStore:self histogramType:0 loadFromDataStore:0 saveOnBackgroundQueue:0];
      id v53 = [[_ATXAppLaunchHistogramWithPersistentBackup alloc] initWithDataStore:self histogramType:1 loadFromDataStore:0 saveOnBackgroundQueue:0];
      id v27 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v48 = [v27 dateByAddingTimeInterval:-1209600.0];
      id v49 = v27;
      id v28 = -[_ATXDuetHelper getAppLaunchesBetweenStartDate:endDate:](self->_duetHelper, "getAppLaunchesBetweenStartDate:endDate:");
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v68 count:16];
      if (!v29) {
        goto LABEL_38;
      }
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v55;
      uint64_t v32 = *MEMORY[0x1E4FA6E38];
      uint64_t v52 = *MEMORY[0x1E4FA6E48];
      while (1)
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v55 != v31) {
            objc_enumerationMutation(v28);
          }
          long long v34 = *(void **)(*((void *)&v54 + 1) + 8 * k);
          uint64_t v35 = [v34 bundleId];
          if (v35)
          {
            long long v36 = (void *)v35;
            id v37 = [v34 startDate];

            if (v37)
            {
              id v38 = [v34 bundleId];
              long long v39 = [v34 startDate];
              double v40 = [v34 timeZone];
              [(_ATXAppLaunchHistogramWithPersistentBackup *)v26 addLaunchWithBundleId:v38 date:v39 timeZone:v40];

              __int16 v41 = [v34 reason];
              if ([v41 isEqualToString:v32])
              {
              }
              else
              {
                id v42 = [v34 reason];
                int v43 = [v42 isEqualToString:v52];

                if (!v43) {
                  continue;
                }
              }
              uint64_t v44 = [v34 bundleId];
              unint64_t v45 = [v34 startDate];
              __int16 v46 = [v34 timeZone];
              [(_ATXAppLaunchHistogramWithPersistentBackup *)v53 addLaunchWithBundleId:v44 date:v45 timeZone:v46];
            }
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v54 objects:v68 count:16];
        if (!v30)
        {
LABEL_38:
          [(_ATXAppLaunchHistogramWithPersistentBackup *)v26 flush];
          [(_ATXAppLaunchHistogramWithPersistentBackup *)v53 flush];

          break;
        }
      }
    }
  }

  return 3;
}

- (int64_t)migration_RemoveFeedbackForUninstalledApps
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int64_t v3 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v16 + 1) + 8 * v8) bundleIdentifier];
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59___ATXDataStore_migration_RemoveFeedbackForUninstalledApps__block_invoke;
  v13[3] = &unk_1E68AEB98;
  id v14 = v3;
  uint64_t v15 = self;
  id v11 = v3;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT bundleId FROM app" onPrep:0 onRow:v13 onError:&__block_literal_global_775];

  return 3;
}

- (int64_t)migration_RemoveAllSubsequentLaunches
{
  [(_PASSqliteDatabase *)self->_db prepAndRunQuery:@"UPDATE appInfo SET subsequentLaunchCounts = NULL" onPrep:0 onRow:0 onError:&__block_literal_global_780];
  return 3;
}

- (int64_t)migration_RemoveRestoreUserDefault
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  int64_t v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v3 removeObjectForKey:@"RecentRestoreDate"];

  return 3;
}

- (int64_t)migration_DelinkFromCoreLocationVisitMonitoring
{
  id v2 = MEMORY[0x1E4F14428];
  id v3 = MEMORY[0x1E4F14428];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64___ATXDataStore_migration_DelinkFromCoreLocationVisitMonitoring__block_invoke;
  block[3] = &unk_1E68AB818;
  uint64_t v6 = v2;
  dispatch_async(v2, block);

  return 3;
}

- (int64_t)migration_AddExtensionInfo
{
  id v3 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43___ATXDataStore_migration_AddExtensionInfo__block_invoke;
  v6[3] = &unk_1E68B1220;
  id v7 = v3;
  id v4 = v3;
  [(_ATXDataStore *)self _enumerateAppInfoBundlesExecutingBlock:v6];
  [(_ATXDataStore *)self _markBundleIdsAsExtension:v4];

  return 3;
}

- (int64_t)migration_AddEnterpriseAppInfo
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47___ATXDataStore_migration_AddEnterpriseAppInfo__block_invoke;
  v3[3] = &unk_1E68B1220;
  v3[4] = self;
  [(_ATXDataStore *)self _enumerateAppInfoBundlesExecutingBlock:v3];
  return 3;
}

- (int64_t)migration_DeprecateGenericAppIntentModels
{
  id v3 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"_APRParzenModel"];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = 0;
  [v4 removeItemAtPath:v3 error:&v8];
  id v5 = v8;

  if (v5)
  {
    uint64_t v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore migration_DeprecateGenericAppIntentModels]();
    }
  }
  [(_PASSqliteDatabase *)self->_db prepAndRunQuery:@"DELETE FROM categoricalHistograms WHERE histogramType = :histogram_type" onPrep:&__block_literal_global_808 onRow:0 onError:&__block_literal_global_810];

  return 3;
}

- (int64_t)migration_PrefillActionHistograms
{
  return 3;
}

- (int64_t)migration_failForTests
{
  return 0;
}

- (int64_t)migration_moveCacheFiles
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (([(_PASSqliteDatabase *)self->_db isInMemory] & 1) == 0)
  {
    id v2 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", 0);
    id v4 = [v3 contentsOfDirectoryAtPath:v2 error:0];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      char v7 = 0;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v10 hasPrefix:@"ATXCacheFile-"])
          {
            id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v12 = [v2 stringByAppendingPathComponent:v10];
            [v11 removeItemAtPath:v12 error:0];

            char v7 = 1;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);

      if (v7) {
        ATXUpdatePredictions(18, 1.0);
      }
    }
    else
    {
    }
  }
  return 3;
}

- (int64_t)migration_DeprecateIntentForAllAppsHistograms
{
  [(_PASSqliteDatabase *)self->_db prepAndRunQuery:@"DELETE FROM categoricalHistograms WHERE histogramType = :h1" onPrep:&__block_literal_global_831 onRow:0 onError:&__block_literal_global_834];
  return 3;
}

- (int64_t)migration_RemoveActionsWithoutTitle
{
  return 3;
}

- (id)allActionsAndSlots
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__50;
  id v12 = __Block_byref_object_dispose__50;
  id v13 = (id)objc_opt_new();
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35___ATXDataStore_allActionsAndSlots__block_invoke;
  v7[3] = &unk_1E68AD228;
  void v7[4] = &v8;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35___ATXDataStore_allActionsAndSlots__block_invoke_2;
  v6[3] = &unk_1E68AEB20;
  void v6[4] = &v8;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT slots, id FROM alog" onPrep:0 onRow:v7 onError:v6];
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (BOOL)writeSlotSetKeyParameters:(id)a3 rowId:(id)a4 slotSet:(id)a5 success:(int64_t *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 uuid];

  if (v13)
  {
    db = self->_db;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65___ATXDataStore_writeSlotSetKeyParameters_rowId_slotSet_success___block_invoke;
    v22[3] = &unk_1E68AED38;
    id v23 = v11;
    id v24 = v12;
    id v25 = v10;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65___ATXDataStore_writeSlotSetKeyParameters_rowId_slotSet_success___block_invoke_2;
    v18[3] = &unk_1E68B1248;
    id v19 = v24;
    id v20 = v23;
    uint64_t v21 = a6;
    char v15 = [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT OR IGNORE INTO slotSetKey (alogId, uuid, paramHash, slotHash, paramCount) VALUES (?, ?, ?, ?, ?)" onPrep:v22 onRow:0 onError:v18];
  }
  else
  {
    long long v16 = __atxlog_handle_default();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore writeSlotSetKeyParameters:rowId:slotSet:success:]((uint64_t)v12);
    }

    char v15 = 0;
    *a6 = 0;
  }

  return v15;
}

- (int64_t)updateAlog:(id)a3 slotsToMigrate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];
  uint64_t v9 = [v8 first];

  id v10 = [v7 objectForKeyedSubscript:v6];

  id v11 = [v10 second];

  id v12 = ATXSlotSetsSerialize();
  id v13 = v12;
  if (v12)
  {
    db = self->_db;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __43___ATXDataStore_updateAlog_slotsToMigrate___block_invoke;
    v20[3] = &unk_1E68AD1B0;
    uint64_t v21 = v12;
    id v22 = v6;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __43___ATXDataStore_updateAlog_slotsToMigrate___block_invoke_2;
    v18[3] = &unk_1E68AD250;
    id v19 = v22;
    if ([(_PASSqliteDatabase *)db prepAndRunQuery:@"UPDATE alog SET slots = ? WHERE id = ?" onPrep:v20 onRow:0 onError:v18])int64_t v15 = 3; {
    else
    }
      int64_t v15 = 0;

    long long v16 = v21;
  }
  else
  {
    long long v16 = __atxlog_handle_default();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore updateAlog:slotsToMigrate:]((uint64_t)v11);
    }
    int64_t v15 = 0;
  }

  return v15;
}

- (int64_t)migration_SlotSetKeyCreation
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [(_ATXDataStore *)self allActionsAndSlots];
  id v4 = v3;
  if (v3)
  {
    int64_t v32 = 3;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v22 = [v3 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v22)
    {
      uint64_t v20 = *(void *)v29;
      uint64_t v21 = v4;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v4);
          }
          uint64_t v23 = v5;
          uint64_t v6 = *(void *)(*((void *)&v28 + 1) + 8 * v5);
          id v7 = objc_msgSend(v4, "objectForKeyedSubscript:", v6, v20);
          uint64_t v8 = [v7 first];

          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v9 = [v4 objectForKeyedSubscript:v6];
          id v10 = [v9 second];

          uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v25 != v13) {
                  objc_enumerationMutation(v10);
                }
                int64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                long long v16 = objc_opt_new();
                [v15 setUuid:v16];
                long long v17 = [[ATXMinimalSlotResolutionParameters alloc] initWithAction:v8 slots:v15];
                [(_ATXDataStore *)self writeSlotSetKeyParameters:v17 rowId:v6 slotSet:v15 success:&v32];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
            }
            while (v12);
          }

          id v4 = v21;
          if (v32 == 3) {
            int64_t v32 = [(_ATXDataStore *)self updateAlog:v6 slotsToMigrate:v21];
          }

          uint64_t v5 = v23 + 1;
        }
        while (v23 + 1 != v22);
        uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v22);
    }
    int64_t v18 = v32;
  }
  else
  {
    int64_t v18 = 0;
  }

  return v18;
}

- (int64_t)_regenerateSlotSetKeys
{
  [(_PASSqliteDatabase *)self->_db prepAndRunNonDataQueries:&unk_1F27F2D30 onError:0];
  return [(_ATXDataStore *)self migration_SlotSetKeyCreation];
}

- (int64_t)migration_RemoveCachedConsumerDB
{
  id v2 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"cachedDataStore"];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v3 removeItemAtPath:v2 error:0];
  id v4 = [v2 stringByAppendingString:@"-shm"];
  [v3 removeItemAtPath:v4 error:0];

  uint64_t v5 = [v2 stringByAppendingString:@"-wal"];
  [v3 removeItemAtPath:v5 error:0];

  return 3;
}

- (int64_t)migration_AddFeedbackColumns
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  db = self->_db;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __45___ATXDataStore_migration_AddFeedbackColumns__block_invoke;
  v22[3] = &unk_1E68AD228;
  void v22[4] = &v23;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __45___ATXDataStore_migration_AddFeedbackColumns__block_invoke_2;
  v21[3] = &unk_1E68AEB20;
  void v21[4] = &v23;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT name FROM pragma_table_info('afeedback') WHERE name IN ('consumerSubType', 'feedbackType')" onPrep:0 onRow:v22 onError:v21];
  int v4 = *((_DWORD *)v24 + 6);
  if (v4)
  {
    if (v4 == 2) {
      int64_t v5 = 3;
    }
    else {
      int64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
    int64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 3;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [&unk_1F27F2D48 countByEnumeratingWithState:&v13 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(&unk_1F27F2D48);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
          id v10 = self->_db;
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __45___ATXDataStore_migration_AddFeedbackColumns__block_invoke_3;
          v12[3] = &unk_1E68AEB20;
          void v12[4] = &v17;
          [(_PASSqliteDatabase *)v10 prepAndRunQuery:v9 onPrep:0 onRow:0 onError:v12];
          if (!v18[3])
          {
            int64_t v5 = 0;
            goto LABEL_15;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [&unk_1F27F2D48 countByEnumeratingWithState:&v13 objects:v27 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    int64_t v5 = v18[3];
LABEL_15:
    _Block_object_dispose(&v17, 8);
  }
  _Block_object_dispose(&v23, 8);
  return v5;
}

- (int64_t)migration_RecreatePredictionFeedbackInfo
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x3032000000;
  id v51 = __Block_byref_object_copy__50;
  uint64_t v52 = __Block_byref_object_dispose__50;
  id v53 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  db = self->_db;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  id v47[2] = __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke;
  v47[3] = &unk_1E68AD228;
  v47[4] = &v48;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT appAction, predictionsCount, feedbackCount, uiType FROM predictionFeedbackInfo WHERE uiType IS NOT NULL" onPrep:0 onRow:v47 onError:&__block_literal_global_863];
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 3;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v4 = [&unk_1F27F2D60 countByEnumeratingWithState:&v39 objects:v55 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v40 != v5) {
          objc_enumerationMutation(&unk_1F27F2D60);
        }
        uint64_t v7 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v8 = self->_db;
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke_3;
        v38[3] = &unk_1E68AEB20;
        v38[4] = &v43;
        [(_PASSqliteDatabase *)v8 prepAndRunQuery:v7 onPrep:0 onRow:0 onError:v38];
        if (!v44[3])
        {
LABEL_19:
          int64_t v24 = 0;
          goto LABEL_20;
        }
      }
      uint64_t v4 = [&unk_1F27F2D60 countByEnumeratingWithState:&v39 objects:v55 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = (id)v49[5];
  uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v54 count:16];
  if (v9)
  {
    uint64_t v27 = *(void *)v35;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    while (2)
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        long long v13 = [v12 first];
        long long v14 = [v12 second];
        long long v15 = [(id)v49[5] objectForKeyedSubscript:v12];
        long long v16 = [v15 first];

        uint64_t v17 = [(id)v49[5] objectForKeyedSubscript:v12];
        int64_t v18 = [v17 second];

        uint64_t v19 = self->_db;
        v29[0] = v10;
        v29[1] = 3221225472;
        v29[2] = __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke_4;
        v29[3] = &unk_1E68B1040;
        id v20 = v13;
        id v30 = v20;
        id v21 = v16;
        id v31 = v21;
        id v22 = v18;
        id v32 = v22;
        id v23 = v14;
        id v33 = v23;
        v28[0] = v10;
        v28[1] = 3221225472;
        v28[2] = __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke_5;
        v28[3] = &unk_1E68AEB20;
        v28[4] = &v43;
        [(_PASSqliteDatabase *)v19 prepAndRunQuery:@"INSERT INTO predictionFeedbackInfo (appAction, predictionsCount, feedbackCount, uiType) VALUES (:appAction, :predictionsCount, :feedbackCount, :uiType)" onPrep:v29 onRow:0 onError:v28];
        LOBYTE(v19) = v44[3] == 0;

        if (v19)
        {

          goto LABEL_19;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v54 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  int64_t v24 = v44[3];
LABEL_20:
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v48, 8);

  return v24;
}

- (int64_t)migration_RemoveDeprecatedStartCallIntents
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"com.apple.mobilephone", @"com.apple.facetime", 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        int64_t v8 = [(_ATXDataStore *)self _regenerateSlotSetKeyForBundleId:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
        if (v8 != 3)
        {
          int64_t v9 = v8;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  int64_t v9 = 3;
LABEL_11:

  return v9;
}

- (int64_t)migration_removeBrokenBlendingStream
{
  id v2 = __atxlog_handle_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[_ATXDataStore migration_removeBrokenBlendingStream]();
  }

  id v3 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"streams"];
  uint64_t v5 = [v4 stringByAppendingPathComponent:@"blending"];

  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = 0;
  [v6 removeItemAtPath:v5 error:&v10];
  id v7 = v10;

  if (v7)
  {
    int64_t v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore migration_removeBrokenBlendingStream]();
    }
  }
  return 3;
}

- (void)updateOrInsertSubsequentLaunchCountData:(id)a3 forBundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = v7;
  if (v7)
  {
    db = self->_db;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69___ATXDataStore_updateOrInsertSubsequentLaunchCountData_forBundleId___block_invoke;
    v11[3] = &unk_1E68AD1B0;
    long long v12 = v7;
    id v13 = v6;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO appInfo (bundleId, subsequentLaunchCounts) VALUES (:bundle_id, :launch_count) ON CONFLICT(bundleId) DO UPDATE SET subsequentLaunchCounts=excluded.subsequentLaunchCounts" onPrep:v11 onRow:0 onError:0];

    id v10 = v12;
  }
  else
  {
    id v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[_ATXDataStore updateOrInsertSubsequentLaunchCountData:forBundleId:]();
    }
  }
}

- (int64_t)migration_removeAnchorModelDirectory
{
  id v2 = __atxlog_handle_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "Removing Anchor Model Directory", buf, 2u);
  }

  id v3 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"AnchorModel"];

  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  [v5 removeItemAtPath:v4 error:&v9];
  id v6 = v9;

  if (v6)
  {
    id v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore migration_removeAnchorModelDirectory]();
    }
  }
  return 3;
}

- (int64_t)migration_updateNewAzulSystemAppsInstallDate
{
  id v2 = __atxlog_handle_app_install();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Setting Azul migration key", v6, 2u);
  }

  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  uint64_t v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v4 setBool:1 forKey:@"azulMigration"];

  return 3;
}

- (int64_t)migration_forceUpdateNewAzulSystemAppsInstallDate
{
  id v3 = __atxlog_handle_app_install();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Force updating install date of newly added system apps", buf, 2u);
  }

  *(void *)buf = 0;
  id v9 = buf;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 3;
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66___ATXDataStore_migration_forceUpdateNewAzulSystemAppsInstallDate__block_invoke_2;
  v7[3] = &unk_1E68AEB20;
  void v7[4] = buf;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"UPDATE appInfo SET installDate = :new_timestamp WHERE bundleId IN (:translate_app, :magnifier_app)" onPrep:&__block_literal_global_903 onRow:0 onError:v7];
  int64_t v5 = *((void *)v9 + 3);
  _Block_object_dispose(buf, 8);
  return v5;
}

- (int64_t)migration_updateNewCrystalSystemAppsInstallDate
{
  id v2 = __atxlog_handle_app_install();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Setting Crystal migration key", v6, 2u);
  }

  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  uint64_t v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v4 setBool:1 forKey:@"crystalMigration"];

  return 3;
}

- (int64_t)migration_forceUpdateNewCrystalSystemAppsInstallDate
{
  id v3 = __atxlog_handle_app_install();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Force updating install date of newly added system apps in Crystal", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v11 = buf;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 3;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2;
  v9[3] = &unk_1E68AEB20;
  void v9[4] = buf;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"UPDATE appInfo SET installDate = :new_timestamp WHERE bundleId IN (:generativePlayground_app, :printCenter_app, :tvRemote_app, :passwords_app)" onPrep:&__block_literal_global_920 onRow:0 onError:v9];
  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    int64_t v5 = self->_db;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2_944;
    v8[3] = &unk_1E68AEB20;
    void v8[4] = buf;
    [(_PASSqliteDatabase *)v5 prepAndRunQuery:@"UPDATE appInfo SET installDate = :new_timestamp WHERE bundleId IN (:calculator_app)" onPrep:&__block_literal_global_939 onRow:0 onError:v8];
  }
  int64_t v6 = *((void *)v11 + 3);
  _Block_object_dispose(buf, 8);
  return v6;
}

- (int64_t)migration_overrideNilInstallDateToDistantOldTime
{
  id v3 = __atxlog_handle_app_install();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Overriding apps with nil install date with distant old install date", buf, 2u);
  }

  *(void *)buf = 0;
  id v9 = buf;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 3;
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65___ATXDataStore_migration_overrideNilInstallDateToDistantOldTime__block_invoke_2;
  v7[3] = &unk_1E68AEB20;
  void v7[4] = buf;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"UPDATE appInfo SET installDate = :new_timestamp WHERE installDate IS NULL" onPrep:&__block_literal_global_949 onRow:0 onError:v7];
  int64_t v5 = *((void *)v9 + 3);
  _Block_object_dispose(buf, 8);
  return v5;
}

- (int64_t)migration_removeOldStackStateTrackerFile
{
  id v2 = __atxlog_handle_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "Removing old Stack State Tracker file", buf, 2u);
  }

  id v3 = [MEMORY[0x1E4F4B650] appPredictionCacheDirectory];
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"ATXStackStates"];

  int64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  [v5 removeItemAtPath:v4 error:&v9];
  id v6 = v9;

  if (v6)
  {
    id v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore migration_removeOldStackStateTrackerFile]();
    }
  }
  return 3;
}

- (int64_t)migration_removeHomeScreenWidgetBlacklistFile
{
  id v2 = __atxlog_handle_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "Removing home screen widget blacklist file", buf, 2u);
  }

  id v3 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"ATXHomeScreenWidgetBlacklist"];
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = 0;
  [v4 removeItemAtPath:v3 error:&v8];
  id v5 = v8;

  if (v5)
  {
    id v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore migration_removeHomeScreenWidgetBlacklistFile]();
    }
  }
  return 3;
}

- (int64_t)migration_populateModeCaches
{
  id v2 = dispatch_get_global_queue(17, 0);
  dispatch_async(v2, &__block_literal_global_957);

  return 3;
}

- (int64_t)migration_deleteFocusSpaceCaches
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v2 = __atxlog_handle_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "Removing focus space layout cache files", buf, 2u);
  }

  long long v43 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  uint64_t v3 = [&unk_1F27F2D78 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (!v3)
  {
    id v6 = 0;
    goto LABEL_19;
  }
  uint64_t v5 = v3;
  id v6 = 0;
  uint64_t v7 = *(void *)v41;
  *(void *)&long long v4 = 138412290;
  long long v32 = v4;
  do
  {
    uint64_t v8 = 0;
    id v9 = v6;
    do
    {
      if (*(void *)v41 != v7) {
        objc_enumerationMutation(&unk_1F27F2D78);
      }
      uint64_t v10 = *(void *)(*((void *)&v40 + 1) + 8 * v8);
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F4B650], "uiCachesRootDirectory", v32);
      uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

      uint64_t v13 = __atxlog_handle_default();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v32;
        id v46 = v12;
        _os_log_debug_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEBUG, "Deleting deprecated UI cache file: %@", buf, 0xCu);
      }

      long long v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v39 = v9;
      char v15 = [v14 removeItemAtPath:v12 error:&v39];
      id v6 = v39;

      if ((v15 & 1) == 0)
      {
        uint64_t v16 = [v6 code];

        if (v16 == 4) {
          goto LABEL_15;
        }
        long long v14 = __atxlog_handle_default();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v32;
          id v46 = v6;
          _os_log_error_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_ERROR, "Failed to delete deprecated UI cache file: %@", buf, 0xCu);
        }
      }

LABEL_15:
      ++v8;
      id v9 = v6;
    }
    while (v5 != v8);
    uint64_t v5 = [&unk_1F27F2D78 countByEnumeratingWithState:&v40 objects:v47 count:16];
  }
  while (v5);
LABEL_19:
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v17 = [&unk_1F27F2D90 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (!v17) {
    goto LABEL_33;
  }
  uint64_t v19 = v17;
  uint64_t v20 = *(void *)v36;
  *(void *)&long long v18 = 138412290;
  long long v33 = v18;
  while (2)
  {
    uint64_t v21 = 0;
    id v22 = v6;
    while (2)
    {
      if (*(void *)v36 != v20) {
        objc_enumerationMutation(&unk_1F27F2D90);
      }
      uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 8 * v21);
      int64_t v24 = objc_msgSend(MEMORY[0x1E4F4B650], "clientModelCachesRootDirectory", v33);
      uint64_t v25 = [v24 stringByAppendingPathComponent:v23];

      int v26 = __atxlog_handle_default();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v33;
        id v46 = v25;
        _os_log_debug_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEBUG, "Deleting deprecated client model file: %@", buf, 0xCu);
      }

      uint64_t v27 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v34 = v22;
      char v28 = [v27 removeItemAtPath:v25 error:&v34];
      id v6 = v34;

      if (v28)
      {
LABEL_30:
      }
      else
      {
        uint64_t v29 = [v6 code];

        if (v29 != 4)
        {
          uint64_t v27 = __atxlog_handle_default();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v33;
            id v46 = v6;
            _os_log_error_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_ERROR, "Failed to delete deprecated client model file: %@", buf, 0xCu);
          }
          goto LABEL_30;
        }
      }

      ++v21;
      id v22 = v6;
      if (v19 != v21) {
        continue;
      }
      break;
    }
    uint64_t v19 = [&unk_1F27F2D90 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v19) {
      continue;
    }
    break;
  }
LABEL_33:
  id v30 = __atxlog_handle_default();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v30, OS_LOG_TYPE_DEFAULT, "Done removing focus space layout cache files", buf, 2u);
  }

  return 3;
}

- (int64_t)migration_deleteAllTrainedRelevanceModels
{
  uint64_t v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "Deleting all trained relevance models for migration", buf, 2u);
  }

  [(_PASSqliteDatabase *)self->_db prepAndRunNonDataQueries:&unk_1F27F2DA8 onError:0];
  long long v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "Done deleting all trained relevance models for migration.", v6, 2u);
  }

  return 3;
}

- (int64_t)migration_purgeExpensiveCachesFromUserDefaults
{
  id v2 = __atxlog_handle_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "Purging expensive caches from user defaults", v6, 2u);
  }

  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  long long v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v4 removeObjectForKey:@"cachedFamilyCircle"];
  [v4 removeObjectForKey:@"com.apple.duetexpertd.AnchorModelScheduler.CurrentPredictions"];

  return 3;
}

- (void)updateOrInsertSubsequentAppActionLaunchCountData:(id)a3 forAppAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    if ([v7 hasSuffix:@"#AppLaunched"])
    {
      id v9 = [v8 substringWithRange:0, objc_msgSend(v8, "length") - objc_msgSend(@":#AppLaunched", "length")];
      uint64_t v10 = @"INSERT INTO appInfo (bundleId, subsequentAppActionLaunchCounts) VALUES (:key, :launch_count) ON CONFLICT(bundleId) DO UPDATE SET subsequentAppActionLaunchCounts=excluded.subsequentAppActionLaunchCounts";
    }
    else
    {
      id v9 = v8;
      uint64_t v10 = @"INSERT INTO appActionInfo (appAction, subsequentAppActionLaunchCounts) VALUES (:key, :launch_count) ON CONFLICT(appAction) DO UPDATE SET subsequentAppActionLaunchCounts=excluded.subsequentAppActionLaunchCounts";
    }
    db = self->_db;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79___ATXDataStore_updateOrInsertSubsequentAppActionLaunchCountData_forAppAction___block_invoke;
    v13[3] = &unk_1E68AD1B0;
    id v14 = v9;
    id v15 = v6;
    uint64_t v11 = v9;
    [(_PASSqliteDatabase *)db prepAndRunQuery:v10 onPrep:v13 onRow:0 onError:0];
  }
  else
  {
    uint64_t v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[_ATXDataStore updateOrInsertSubsequentAppActionLaunchCountData:forAppAction:]();
    }
  }
}

- (void)updateOrInsertPredictionsAndFeedbackForAppAction:(id)a3 feedbackReceived:(BOOL)a4 forUIType:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    db = self->_db;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __93___ATXDataStore_updateOrInsertPredictionsAndFeedbackForAppAction_feedbackReceived_forUIType___block_invoke;
    v12[3] = &unk_1E68B1270;
    uint64_t v13 = v8;
    id v14 = v9;
    BOOL v15 = a4;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO predictionFeedbackInfo (appAction, predictionsCount, feedbackCount, uiType) VALUES (:app_action, 1, :feedback_count, :ui_type) ON CONFLICT(appAction, uiType) DO UPDATE SET predictionsCount = predictionsCount + 1, feedbackCount = feedbackCount + :feedback_count" onPrep:v12 onRow:0 onError:0];

    uint64_t v11 = v13;
  }
  else
  {
    uint64_t v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[_ATXDataStore updateOrInsertPredictionsAndFeedbackForAppAction:feedbackReceived:forUIType:]();
    }
  }
}

- (void)updateOrInsertMessageRecipient:(id)a3 dateMessaged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    db = self->_db;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61___ATXDataStore_updateOrInsertMessageRecipient_dateMessaged___block_invoke;
    v10[3] = &unk_1E68AD1B0;
    uint64_t v11 = v6;
    id v12 = v7;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO messageRecipients (recipientName, lastDateMessaged) VALUES (:recipient, :date_messaged) ON CONFLICT(recipientName) DO UPDATE SET lastDateMessaged=excluded.lastDateMessaged" onPrep:v10 onRow:0 onError:0];

    id v9 = v11;
  }
  else
  {
    id v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_ATXDataStore updateOrInsertMessageRecipient:dateMessaged:]();
    }
  }
}

- (void)updateOrInsertAverageSecondsBetweenLaunches:(id)a3 forBundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    db = self->_db;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73___ATXDataStore_updateOrInsertAverageSecondsBetweenLaunches_forBundleId___block_invoke;
    v10[3] = &unk_1E68AD1B0;
    id v11 = v7;
    id v12 = v6;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO appInfo (bundleId, averageSecondsBetweenLaunches) VALUES (:bundle_id, :average_seconds_between_launches) ON CONFLICT(bundleId) DO UPDATE SET averageSecondsBetweenLaunches=excluded.averageSecondsBetweenLaunches" onPrep:v10 onRow:0 onError:0];
  }
}

- (void)updateOrInsertMedianSecondsBetweenLaunches:(id)a3 forBundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    db = self->_db;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72___ATXDataStore_updateOrInsertMedianSecondsBetweenLaunches_forBundleId___block_invoke;
    v10[3] = &unk_1E68AD1B0;
    id v11 = v7;
    id v12 = v6;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO appInfo (bundleId, medianSecondsBetweenLaunches) VALUES (:bundle_id, :median_seconds_between_launches) ON CONFLICT(bundleId) DO UPDATE SET medianSecondsBetweenLaunches=excluded.medianSecondsBetweenLaunches" onPrep:v10 onRow:0 onError:0];
  }
}

- (void)updateOrInsertAverageSecondsBetweenAppActions:(id)a3 forAppAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    db = self->_db;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76___ATXDataStore_updateOrInsertAverageSecondsBetweenAppActions_forAppAction___block_invoke;
    v10[3] = &unk_1E68AD1B0;
    id v11 = v7;
    id v12 = v6;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO appActionInfo (appAction, averageSecondsBetweenAppActions) VALUES (:app_action, :average_seconds_between_app_actions) ON CONFLICT(appAction) DO UPDATE SET averageSecondsBetweenAppActions=excluded.averageSecondsBetweenAppActions" onPrep:v10 onRow:0 onError:0];
  }
}

- (void)updateOrInsertMedianSecondsBetweenAppActions:(id)a3 forAppAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    db = self->_db;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75___ATXDataStore_updateOrInsertMedianSecondsBetweenAppActions_forAppAction___block_invoke;
    v10[3] = &unk_1E68AD1B0;
    id v11 = v7;
    id v12 = v6;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO appActionInfo (appAction, medianSecondsBetweenAppActions) VALUES (:app_action, :median_seconds_between_app_actions) ON CONFLICT(appAction) DO UPDATE SET medianSecondsBetweenAppActions=excluded.medianSecondsBetweenAppActions" onPrep:v10 onRow:0 onError:0];
  }
}

- (void)updateOrInsertGenreId:(id)a3 subGenreIds:(id)a4 forBundleId:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if ([v10 count])
    {
      id v12 = (void *)MEMORY[0x1D25F6CC0]();
      id v23 = 0;
      uint64_t v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v23];
      id v14 = v23;
      if (v14)
      {
        BOOL v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 4579, @"Archiver error: %@", v14 object file lineNumber description];

        uint64_t v16 = v14;
LABEL_7:
        db = self->_db;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __63___ATXDataStore_updateOrInsertGenreId_subGenreIds_forBundleId___block_invoke;
        v19[3] = &unk_1E68AED38;
        id v20 = v11;
        id v21 = v9;
        id v22 = v13;
        id v18 = v13;
        [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO appInfo (bundleId, genreId, subGenreIds) VALUES (:bundle_id, :genreId_data, :subGenreIdsData) ON CONFLICT(bundleId) DO UPDATE SET genreId=excluded.genreId, subGenreIds=excluded.subGenreIds" onPrep:v19 onRow:0 onError:0];

        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v16 = 0;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)updateOrInsertApp2VecCluster:(id)a3 forBundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    db = self->_db;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58___ATXDataStore_updateOrInsertApp2VecCluster_forBundleId___block_invoke;
    v10[3] = &unk_1E68AD1B0;
    id v11 = v7;
    id v12 = v6;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO appInfo (bundleId, app2VecCluster) VALUES (:bundle_id, :app2vec_cluster) ON CONFLICT(bundleId) DO UPDATE SET app2VecCluster=excluded.app2VecCluster" onPrep:v10 onRow:0 onError:0];
  }
}

- (void)updateOrInsertTimestamp:(int64_t)a3 intoColumn:(id)a4 forBundleId:(id)a5 isExtension:(BOOL)a6
{
  id v10 = a5;
  if (v10)
  {
    id v11 = [NSString stringWithFormat:@"INSERT INTO appInfo (bundleId, %1$@, isExtension) VALUES (:bundle_id, :new_timestamp, :is_extension) ON CONFLICT(bundleId) DO UPDATE SET %1$@ = CASE WHEN %1$@<:new_timestamp OR %1$@ IS NULL THEN :new_timestamp ELSE %1$@ END, isExtension=:is_extension", a4];
    db = self->_db;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76___ATXDataStore_updateOrInsertTimestamp_intoColumn_forBundleId_isExtension___block_invoke;
    v13[3] = &unk_1E68B1298;
    id v14 = v10;
    int64_t v15 = a3;
    BOOL v16 = a6;
    [(_PASSqliteDatabase *)db prepAndRunQuery:v11 onPrep:v13 onRow:0 onError:0];
  }
  else
  {
    id v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[_ATXDataStore updateOrInsertSubsequentLaunchCountData:forBundleId:]();
    }
  }
}

- (void)updateOrInsertTimestamp:(int64_t)a3 forAppAction:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    db = self->_db;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54___ATXDataStore_updateOrInsertTimestamp_forAppAction___block_invoke;
    v10[3] = &unk_1E68AE780;
    id v11 = v6;
    int64_t v12 = a3;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO appActionInfo (appAction, lastAppActionLaunchDate) VALUES (:app_action, :new_timestamp) ON CONFLICT(appAction) DO UPDATE SET lastAppActionLaunchDate=excluded.lastAppActionLaunchDate" onPrep:v10 onRow:0 onError:0];
    id v9 = v11;
  }
  else
  {
    id v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_ATXDataStore updateOrInsertTimestamp:forAppAction:]();
    }
  }
}

- (void)updateOrInsertInstallTimestamp:(int64_t)a3 genreId:(id)a4 subGenreIds:(id)a5 app2VecCluster:(id)a6 forBundleId:(id)a7 isExtension:(BOOL)a8 isEnterpriseApp:(BOOL)a9
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  if (v19)
  {
    long long v41 = v16;
    BOOL v42 = a8;
    if ([v17 count])
    {
      int64_t v20 = a3;
      id v21 = (void *)MEMORY[0x1D25F6CC0]();
      id v53 = 0;
      id v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v17 requiringSecureCoding:1 error:&v53];
      id v23 = v53;
      if (v23)
      {
        long long v38 = [MEMORY[0x1E4F28B00] currentHandler];
        [v38 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 4671, @"Archiver error: %@", v23 object file lineNumber description];

        int64_t v24 = v23;
      }
      else
      {
        int64_t v24 = 0;
      }
      a3 = v20;
    }
    else
    {
      int64_t v24 = 0;
      id v22 = 0;
    }
    BOOL v25 = a9;
    if ([MEMORY[0x1E4F93B08] isInternalBuild])
    {
      long long v40 = v24;
      uint64_t v26 = a3;
      uint64_t v27 = (void *)MEMORY[0x1D25F6CC0]();
      char v28 = [(_ATXDataStore *)self _appInfoForBundleIdNoSync:v19];
      uint64_t v29 = __atxlog_handle_app_install();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v39 = v22;
        id v30 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:(double)v26];
        [v28 installDate];
        v32 = id v31 = v27;
        *(_DWORD *)buf = 138543874;
        long long v55 = v30;
        __int16 v56 = 2114;
        id v57 = v32;
        __int16 v58 = 2112;
        id v59 = v19;
        _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Updating install date: %{public}@ from %{public}@ for bundle id: %@", buf, 0x20u);

        uint64_t v27 = v31;
        BOOL v25 = a9;
        id v22 = v39;
      }

      a3 = v26;
      int64_t v24 = v40;
    }
    else
    {
      long long v33 = __atxlog_handle_app_install();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:(double)a3];
        *(_DWORD *)buf = 138543618;
        long long v55 = v34;
        __int16 v56 = 2112;
        id v57 = v19;
        _os_log_impl(&dword_1D0FA3000, v33, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Updating install date: %{public}@ for bundle id: %@", buf, 0x16u);
      }
    }
    db = self->_db;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __123___ATXDataStore_updateOrInsertInstallTimestamp_genreId_subGenreIds_app2VecCluster_forBundleId_isExtension_isEnterpriseApp___block_invoke;
    v45[3] = &unk_1E68B12C0;
    id v46 = v19;
    int64_t v50 = a3;
    id v47 = v41;
    id v48 = v22;
    BOOL v51 = v42;
    BOOL v52 = v25;
    id v49 = v18;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __123___ATXDataStore_updateOrInsertInstallTimestamp_genreId_subGenreIds_app2VecCluster_forBundleId_isExtension_isEnterpriseApp___block_invoke_2;
    v43[3] = &unk_1E68AD250;
    id v44 = v46;
    id v36 = v22;
    id v16 = v41;
    id v37 = v36;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO appInfo (bundleId, installDate, genreId, subGenreIds, isExtension, isEnterpriseApp, app2VecCluster) VALUES (:bundle_id, :new_timestamp, :genreId_data, :subGenreIds_data, :is_extension, :is_enterprise_app, :app2vec_cluster) ON CONFLICT(bundleId) DO UPDATE SET installDate = CASE WHEN installDate IS NULL THEN :new_timestamp ELSE installDate END, genreId=:genreId_data, subGenreIds=:subGenreIds_data, isExtension=:is_extension, isEnterpriseApp=:is_enterprise_app, app2VecCluster=:app2vec_cluster" onPrep:v45 onRow:0 onError:v43];
  }
}

- (void)_markBundleIdsAsExtension:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(_ATXDataStore *)self _markBundleIdAsExtension:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_markBundleIdAsExtension:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42___ATXDataStore__markBundleIdAsExtension___block_invoke;
  v7[3] = &unk_1E68AD200;
  id v8 = v4;
  id v6 = v4;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", @"UPDATE appInfo SET isExtension=1, lastSpotlightLaunchDate=0 WHERE bundleId=:bundle_id;",
    v7,
    0,
    &__block_literal_global_1065);
}

- (void)_markBundleId:(id)a3 asEnterpriseApp:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v4;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Mark app: %@ as enterprise: %{BOOL}u", buf, 0x12u);
  }

  db = self->_db;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47___ATXDataStore__markBundleId_asEnterpriseApp___block_invoke;
  v10[3] = &unk_1E68AD498;
  id v11 = v6;
  BOOL v12 = v4;
  id v9 = v6;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", @"UPDATE appInfo SET isEnterpriseApp=:is_enterprise_app WHERE bundleId=:bundle_id;",
    v10,
    0,
    &__block_literal_global_1070);
}

+ (void)_simulateCrashForMigrationFailure:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F93AE8];
  id v4 = [NSString stringWithFormat:@"Error in migration: %@", a3];
  [v3 simulateCrashWithDescription:v4];
}

+ (id)loadDataFromFile:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v10 = 0;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v3 options:1 error:&v10];
    id v7 = v10;
    if (!v6)
    {
      id v8 = __atxlog_handle_default();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        +[_ATXDataStore loadDataFromFile:]((uint64_t)v3);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)migrationUpdateOrInsertTimestamp:(int64_t)a3 intoColumn:(id)a4 forBundleId:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    uint64_t v19 = 0;
    int64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 1;
    id v10 = [NSString stringWithFormat:@"INSERT INTO appInfo (bundleId, %1$@) VALUES (:bundle_id, :new_timestamp) ON CONFLICT(bundleId) DO UPDATE SET %1$@ = CASE WHEN %1$@<:new_timestamp OR %1$@ IS NULL THEN :new_timestamp ELSE %1$@ END WHERE bundleId=:bundle_id", v8];
    db = self->_db;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73___ATXDataStore_migrationUpdateOrInsertTimestamp_intoColumn_forBundleId___block_invoke;
    v16[3] = &unk_1E68AE780;
    id v17 = v9;
    int64_t v18 = a3;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73___ATXDataStore_migrationUpdateOrInsertTimestamp_intoColumn_forBundleId___block_invoke_2;
    v15[3] = &unk_1E68AEB20;
    v15[4] = &v19;
    [(_PASSqliteDatabase *)db prepAndRunQuery:v10 onPrep:v16 onRow:0 onError:v15];
    BOOL v12 = *((unsigned char *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    uint64_t v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[_ATXDataStore updateOrInsertSubsequentLaunchCountData:forBundleId:]();
    }

    BOOL v12 = 0;
  }

  return v12;
}

- (void)migrationPre44WriteActionType:(id)a3 bundleId:(id)a4 date:(id)a5 action:(id)a6 slotSets:(id)a7 timeZone:(id)a8 prevLocationUUID:(id)a9 locationUUID:(id)a10 weight:(double)a11 actionUUID:(id)a12 motionType:(int64_t)a13
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  dispatch_queue_t queue = (dispatch_queue_t)a7;
  id v53 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a12;
  if (v19)
  {
    if (v20) {
      goto LABEL_3;
    }
LABEL_19:
    long long v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 4807, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    if (v22) {
      goto LABEL_4;
    }
    goto LABEL_20;
  }
  long long v40 = [MEMORY[0x1E4F28B00] currentHandler];
  [v40 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 4806, @"Invalid parameter not satisfying: %@", @"actionType" object file lineNumber description];

  if (!v20) {
    goto LABEL_19;
  }
LABEL_3:
  if (v22) {
    goto LABEL_4;
  }
LABEL_20:
  BOOL v42 = [MEMORY[0x1E4F28B00] currentHandler];
  [v42 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 4808, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

LABEL_4:
  if (a11 <= 0.0)
  {
    long long v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 4809, @"Invalid parameter not satisfying: %@", @"0.0 < weight" object file lineNumber description];
  }
  if (a11 > 1.0)
  {
    id v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 4810, @"Invalid parameter not satisfying: %@", @"weight <= 1.0" object file lineNumber description];

    if (v25) {
      goto LABEL_8;
    }
  }
  else if (v25)
  {
    goto LABEL_8;
  }
  uint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
  [v45 handleFailureInMethod:a2, self, @"_ATXDataStore.m", 4811, @"Invalid parameter not satisfying: %@", @"actionUUID" object file lineNumber description];

LABEL_8:
  id v47 = v25;
  id v48 = v24;
  BOOL v52 = v23;
  uint64_t v26 = v19;
  if (!v21) {
    id v21 = (id)objc_opt_new();
  }
  uint64_t v27 = +[_ATXActionUtils timeOfDayAndDayOfWeekForDate:v21 timeZone:v53];
  char v28 = [v27 first];
  uint64_t v29 = [v28 integerValue];

  id v30 = [v27 second];
  uint64_t v31 = [v30 integerValue];

  long long v32 = queue;
  if (!queue)
  {
    long long v33 = (void *)MEMORY[0x1E4F1CAD0];
    id v34 = (void *)[objc_alloc(MEMORY[0x1E4F4B308]) initWithOpaqueParameters];
    long long v32 = [v33 setWithObject:v34];
  }
  long long v35 = ATXSlotSetsSerialize();
  if (v35)
  {
    queuea = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke;
    block[3] = &unk_1E68B1310;
    void block[4] = self;
    id v55 = v20;
    id v56 = v26;
    id v57 = v35;
    id v58 = v21;
    uint64_t v62 = v29;
    uint64_t v63 = v31;
    id v36 = v52;
    id v59 = v52;
    id v37 = v48;
    id v60 = v48;
    double v64 = a11;
    long long v38 = v47;
    id v61 = v47;
    int64_t v65 = a13;
    dispatch_sync(queuea, block);
  }
  else
  {
    id v39 = __atxlog_handle_default();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[_ATXDataStore migrationPre44WriteActionType:bundleId:date:action:slotSets:timeZone:prevLocationUUID:locationUUID:weight:actionUUID:motionType:]((uint64_t)v32);
    }

    id v36 = v52;
    long long v38 = v47;
    id v37 = v48;
  }
}

- (void)_testMigrate
{
  dispatch_queue_t queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29___ATXDataStore__testMigrate__block_invoke;
  block[3] = &unk_1E68AB818;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_testMigrateToSchema:(unint64_t)a3
{
  dispatch_queue_t queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38___ATXDataStore__testMigrateToSchema___block_invoke;
  v4[3] = &unk_1E68ACD10;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (id)_trimMigrationPlan:(id)a3 toSchema:(unint64_t)a4
{
  id v5 = a3;
  id v6 = (void *)[v5 mutableCopy];
  unint64_t v7 = [v5 count];
  unint64_t v8 = a4 + 1;
  if (v8 <= v7)
  {
    unint64_t v9 = v7;
    do
    {
      id v10 = [NSNumber numberWithUnsignedInteger:v8];
      [v6 removeObjectForKey:v10];

      ++v8;
    }
    while (v8 <= v9);
  }

  return v6;
}

- (void)swapInDuetHelperStub:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38___ATXDataStore_swapInDuetHelperStub___block_invoke;
  v6[3] = &unk_1E68AB870;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(_ATXDataStore *)self _doAsync:v6];
}

- (id)_databaseSchema
{
  id v3 = objc_opt_new();
  dispatch_queue_t queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32___ATXDataStore__databaseSchema__block_invoke;
  v9[3] = &unk_1E68AB870;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(queue, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (void)integrityCheckOrAbort
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Sqlite integrity check failed! Aborting.", v2, v3, v4, v5, v6);
}

+ (id)stringForHistogramType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x62) {
    return @"_ATXHistogramTypeAnyLaunch";
  }
  else {
    return off_1E68B1330[a3 - 1];
  }
}

- (_PASSqliteDatabase)db
{
  return self->_db;
}

- (unint64_t)actionHistoryLengthPerAppAction
{
  return self->_actionHistoryLengthPerAppAction;
}

- (void)setActionHistoryLengthPerAppAction:(unint64_t)a3
{
  self->_actionHistoryLengthPerAppAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_dbMigrationTracker, 0);
  objc_storeStrong((id *)&self->_duetHelper, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)enumerateActionTypesOlderThan:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_ATXDataStore+ActionTypes.m", 17, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];
  }
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__74;
  void v20[4] = __Block_byref_object_dispose__74;
  id v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__74;
  void v18[4] = __Block_byref_object_dispose__74;
  id v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke;
  v12[3] = &unk_1E68B3B00;
  void v12[4] = self;
  id v9 = v7;
  id v13 = v9;
  __int16 v15 = v22;
  BOOL v16 = v20;
  id v17 = v18;
  id v10 = v8;
  id v14 = v10;
  [(_ATXDataStore *)self _doSync:v12];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(v22, 8);
}

- (void)initWithPath:andDuetHelper:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "Not enough space on volume. Opening in-memory datastore.", v2, v3, v4, v5, v6);
}

- (void)initWithPath:andDuetHelper:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Cannot call _ATXDataStore init until class c unlocked", v2, v3, v4, v5, v6);
}

- (void)_reset
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, v1, v2, "Could not open sqlite database at %@: %@", (void)v3, DWORD2(v3));
}

- (void)vacuumDatabaseWithActivity:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "ATXDataStore: unable to vacuum database: %@", v2, v3, v4, v5, v6);
}

- (void)removeAppInfoForBundleIdsNotInSet:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Not removing any apps because the install set is empty", v2, v3, v4, v5, v6);
}

- (void)filenamesAndDataForBackupShouldPareDown:transport:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error while serializing onboarding stack widget cache file into NSData: %@", v2, v3, v4, v5, v6);
}

- (void)filenamesAndDataForBackupShouldPareDown:transport:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error while reading mode entity files for backup. Error: %@", v2, v3, v4, v5, v6);
}

+ (void)removeSensitiveInformationFromModeEntityScoresFile:shouldBackupContacts:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Couldn't deserialize mode entity scores file data. Error: %@", v2, v3, v4, v5, v6);
}

+ (void)removeSensitiveInformationFromModeEntityScoresFile:shouldBackupContacts:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "FAILURE: Unable to archive mode entity scores. Error: %@", v1, 0xCu);
}

+ (void)pareDownForBackup:.cold.1()
{
  OUTLINED_FUNCTION_1();
  WORD2(v4) = 2080;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, v1, v2, "Error deleting %s: %s", v3, v4);
}

- (void)restoreFromBackup:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)restoreFromBackup:(uint64_t)a1 .cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, v1, v2, "Error restoring onboarding stacks cache file to path %@: %@", (void)v3, DWORD2(v3));
}

- (void)writeActionType:(uint64_t)a1 bundleId:date:action:slotSets:timeZone:prevLocationUUID:locationUUID:weight:actionUUID:motionType:appSessionStartDate:appSessionEndDate:geohash:coarseGeohash:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, v1, v2, "Could not serialize slotSets: %@ and action: %@, not writing action type", (void)v3, DWORD2(v3));
}

- (void)actionForSlotUUID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "Unable to get action for slot UUID (<rdar://problem/48254976>): %@", v1, 0xCu);
}

- (void)recordConfirms:(NSObject *)a3 rejects:forFeedbackType:forActionType:bundleId:action:slotSet:actionUUID:date:consumerSubType:geohash:coarseGeohash:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:a1];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "Could not serialize slotSets: %@ and action: %@, not recording feedback", (uint8_t *)&v6, 0x16u);
}

- (void)currentSchemaVersion
{
}

- (void)migrateWithMigrationPlan:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Exception getting schema version. Marking as corrupt: %@", v2, v3, v4, v5, v6);
}

- (void)skipFromZeroSchema
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "failed to migrate database from zero to %ld", v2, v3, v4, v5, v6);
}

- (void)migrateToVersion:withMigrationPlan:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "ATXDataStore: failed to migrate entity db to %ld", v2, v3, v4, v5, v6);
}

- (void)migrateToVersion:withMigrationPlan:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXDataStore: attempt to skip or repeat a migration", v2, v3, v4, v5, v6);
}

- (void)migration_InstallDateToAppTable
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error unarchiving install dates: %@", v2, v3, v4, v5, v6);
}

- (void)migration_DeprecateGenericAppIntentModels
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error deleting data associated with old generic app intent parzen model: %@", v2, v3, v4, v5, v6);
}

- (void)writeSlotSetKeyParameters:(uint64_t)a1 rowId:slotSet:success:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, v1, v2, "Missing slotSet UUID for slotSet: %@ alog rowId: %@", (void)v3, DWORD2(v3));
}

- (void)updateAlog:(uint64_t)a1 slotsToMigrate:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, v1, v2, "Could not serialize slotSets: %@ and action: %@, not updating alog during migration", (void)v3, DWORD2(v3));
}

- (void)migration_removeBrokenBlendingStream
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "Removing blending stream", v1, 2u);
}

- (void)updateOrInsertSubsequentLaunchCountData:forBundleId:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "rdar://28434856 Caught appInfo entry with nil bundleId", v2, v3, v4, v5, v6);
}

- (void)migration_removeAnchorModelDirectory
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Cannot remove Anchor Model Directory. Error: %@", v2, v3, v4, v5, v6);
}

- (void)migration_removeOldStackStateTrackerFile
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Cannot remove old Stack State Tracker file. Error: %@", v2, v3, v4, v5, v6);
}

- (void)migration_removeHomeScreenWidgetBlacklistFile
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Cannot remove home screen widget blacklist file. Error: %@", v2, v3, v4, v5, v6);
}

- (void)updateOrInsertSubsequentAppActionLaunchCountData:forAppAction:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "Caught appActionInfo entry with nil appAction", v2, v3, v4, v5, v6);
}

- (void)updateOrInsertPredictionsAndFeedbackForAppAction:feedbackReceived:forUIType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "Caught predictionFeedbackInfo entry with nil appAction", v2, v3, v4, v5, v6);
}

- (void)updateOrInsertMessageRecipient:dateMessaged:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "Caught messageRecipients entry with nil recipient", v2, v3, v4, v5, v6);
}

- (void)updateOrInsertTimestamp:forAppAction:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "rdar://28434856 Caught appActionInfo entry with nil appAction", v2, v3, v4, v5, v6);
}

+ (void)loadDataFromFile:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_3_4();
  _os_log_debug_impl(&dword_1D0FA3000, v1, OS_LOG_TYPE_DEBUG, "Unable to open %@: %@", (uint8_t *)&v2, 0x16u);
}

- (void)migrationPre44WriteActionType:(uint64_t)a1 bundleId:date:action:slotSets:timeZone:prevLocationUUID:locationUUID:weight:actionUUID:motionType:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, v1, v2, "Could not serialize slotSets: %@ and action: %@, not writing action type for migration", (void)v3, DWORD2(v3));
}

@end