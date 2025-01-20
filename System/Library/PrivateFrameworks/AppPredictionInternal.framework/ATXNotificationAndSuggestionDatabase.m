@interface ATXNotificationAndSuggestionDatabase
- (ATXNotificationAndSuggestionDatabase)init;
- (ATXNotificationAndSuggestionDatastorePerfMetrics)notificationAndSuggestionDatastorePerfMetrics;
- (BOOL)_anyColumnWithNameFromColumnNames:(id)a3 existsOnTable:(id)a4;
- (BOOL)_hasColumnOnTable:(id)a3 named:(id)a4;
- (BOOL)_hasIndexNamed:(id)a3;
- (BOOL)_runMigrationSteps:(id)a3;
- (BOOL)hasSuggestionBeenShownForEntityId:(id)a3 suggestionType:(int64_t)a4 scope:(int64_t)a5 sinceTimestamp:(double)a6;
- (BOOL)migrate;
- (double)receiveTimeStampOfFirstNotification;
- (id)_countNotificationsPerAppWithFilters:(id)a3 stmtBinder:(id)a4;
- (id)_makeNotificationTelemetryQueryResultFromDatabaseResult:(id)a3;
- (id)allBundleIdsOfNotificationsOnLockscreen;
- (id)allNotificationsBetweenStartTimestamp:(id)a3 endTimestamp:(id)a4 limit:(unint64_t)a5;
- (id)allNotificationsFromBundleId:(id)a3 sinceTimestamp:(double)a4;
- (id)appSortedByNumOfNotificationsSinceTimestamp:(double)a3;
- (id)currentActiveSuggestions;
- (id)deleteAllData;
- (id)engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp:(double)a3;
- (id)engagementStatusOfActiveAndProminentNotificationsSinceTimestamp:(double)a3;
- (id)engagementStatusOfActiveAndProminentNotificationsWithUrgency:(int64_t)a3 sinceTimestamp:(double)a4;
- (id)feedbackHistoriesForKeys:(id)a3;
- (id)getBookmarkDataFromName:(id)a3;
- (id)getSmartPauseFeaturesForBundleIds:(id)a3 sinceTimestamp:(double)a4 positiveEngagementEnums:(id)a5;
- (id)getTopOfNonProminentStackNotificationsWithLimit:(unint64_t)a3;
- (id)getTopOfProminentStackNotificationsWithLimit:(unint64_t)a3;
- (id)messageNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4;
- (id)metricsForSuggestionsSinceCompletionTimestamp:(double)a3;
- (id)mostRecentActiveNotifications;
- (id)notificationsReceivedPerBundleIdSinceDate:(id)a3;
- (id)numProminentActiveNotificationsByGroupingColumn:(id)a3;
- (id)pruneNotificationsBeforeTimestamp:(double)a3;
- (id)pruneSuggestionsBeforeTimestamp:(double)a3;
- (id)resolutionsForNotifications:(id)a3;
- (id)suggestionEventTypeShownForEntityId:(id)a3 suggestionType:(int64_t)a4 scope:(int64_t)a5 sinceTimestamp:(double)a6;
- (id)telemetryDataForNotificationWithBundleId:(id)a3 notificationId:(id)a4 recordTimestamp:(double)a5;
- (id)telemetryDataForNotificationsFromTimestamp:(double)a3 endTimestamp:(double)a4;
- (id)timeSensitiveNonmessageNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4;
- (id)totalNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4;
- (id)vacuumDatabase;
- (int64_t)latestVersion;
- (void)_pruneNotificationsBasedOnHardLimitsForBundleId:(id)a3 XPCActivity:(id)a4;
- (void)analyze;
- (void)insertNotificationFromEvent:(id)a3 deliveryMethod:(int64_t)a4 modeIdentifier:(id)a5 deliveryReason:(id)a6;
- (void)insertSuggestion:(id)a3;
- (void)numberOfActiveNotificationsWithCompletionHandler:(id)a3;
- (void)prepAndRunQuery:(id)a3 batchSize:(int64_t)a4 XPCActivity:(id)a5 onPrep:(id)a6 onRow:(id)a7 onError:(id)a8;
- (void)pruneNotificationsBasedOnHardLimitsWithXPCActivity:(id)a3;
- (void)pruneSuggestionsBasedOnHardLimitsWithXPCActivity:(id)a3;
- (void)setAllNotificationsToClearedExceptProminent;
- (void)setAllNotificationsToModified;
- (void)setBookmarkData:(id)a3 forName:(id)a4;
- (void)updateNotificationFromEvent:(id)a3;
- (void)updateNotificationUIForNotifications:(id)a3 nextUI:(unint64_t)a4;
- (void)updateSuggestionFromEvent:(id)a3;
@end

@implementation ATXNotificationAndSuggestionDatabase

- (ATXNotificationAndSuggestionDatabase)init
{
  v3 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"notificationAndSuggestionDB.db"];
  v8.receiver = self;
  v8.super_class = (Class)ATXNotificationAndSuggestionDatabase;
  v4 = [(ATXAbstractVersionedDatabase *)&v8 initWithDbPath:v3];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F4B1D0] sharedInstance];
    mobileAssetConstants = v4->_mobileAssetConstants;
    v4->_mobileAssetConstants = (ATXNotificationManagementMAConstants *)v5;
  }
  return v4;
}

- (int64_t)latestVersion
{
  return 23;
}

- (BOOL)migrate
{
  v44[3] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(ATXAbstractVersionedDatabase *)self currentSchemaVersion];
  if (v3 == [(ATXNotificationAndSuggestionDatabase *)self latestVersion]) {
    return 1;
  }
  switch(v3)
  {
    case 0:
      v44[0] = @"CREATE TABLE IF NOT EXISTS notifications( uuid TEXT PRIMARY KEY,   receiveTimestamp REAL NOT NULL,   deliveryMethod INTEGER NOT NULL,   urgency INTEGER NOT NULL,   bundleId TEXT,   threadId TEXT,   contactId TEXT,   isGroupMessage INTEGER NOT NULL,   isMessage INTEGER NOT NULL,   latestOutcome INTEGER,   latestOutcomeTimestamp REAL,   isProminent INTEGER NOT NULL,   isActive INTEGER NOT NULL) WITHOUT ROWID";
      v44[1] = @"CREATE TABLE IF NOT EXISTS suggestions( uuid TEXT PRIMARY KEY,   createdTimestamp REAL NOT NULL,   triggerNotificationUUID TEXT,   deliverySuggestion BLOB NOT NULL,   suggestionType INTEGER NOT NULL,   scope INTEGER NOT NULL,   entityIdentifier TEXT,   shownTimestamp REAL,   latestOutcome INTEGER NOT NULL,   latestOutcomeTimestamp REAL NOT NULL,   isActive INTEGER NOT NULL) WITHOUT ROWID";
      v44[2] = @"CREATE TABLE IF NOT EXISTS biome_bookmark( bookmarkName TEXT PRIMARY KEY,   updatedTimestamp REAL NOT NULL,   bookmarkData BLOB) WITHOUT ROWID";
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
      BOOL v13 = [(ATXNotificationAndSuggestionDatabase *)self _runMigrationSteps:v12];

      if (v13) {
        goto LABEL_20;
      }
      return 0;
    case 1:
LABEL_20:
      v43 = @"ALTER TABLE notifications ADD COLUMN numExpansions INTEGER NOT NULL DEFAULT 0";
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
      BOOL v15 = [(ATXNotificationAndSuggestionDatabase *)self _runMigrationSteps:v14];

      if (v15) {
        goto LABEL_21;
      }
      return 0;
    case 2:
LABEL_21:
      v42 = @"ALTER TABLE notifications ADD COLUMN rawIdentifier TEXT";
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
      BOOL v17 = [(ATXNotificationAndSuggestionDatabase *)self _runMigrationSteps:v16];

      if (v17) {
        goto LABEL_22;
      }
      return 0;
    case 3:
LABEL_22:
      v41[0] = @"CREATE INDEX smartPauseIndex ON notifications (bundleId, threadId, receiveTimestamp)";
      v41[1] = @"CREATE INDEX urgencyTuningIndex ON notifications (urgency, deliveryMethod, bundleId, receiveTimestamp)";
      v41[2] = @"CREATE INDEX candidateSelectionIndex ON notifications (bundleId, threadId, receiveTimestamp) WHERE isActive=1 AND isProminent=1";
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];
      BOOL v19 = [(ATXNotificationAndSuggestionDatabase *)self _runMigrationSteps:v18];

      if (v19) {
        goto LABEL_23;
      }
      return 0;
    case 4:
LABEL_23:
      v40[0] = @"ALTER TABLE suggestions ADD COLUMN feedbackKey TEXT";
      v40[1] = @"CREATE INDEX feedbackIndex ON suggestions (feedbackKey, shownTimestamp)";
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
      BOOL v21 = [(ATXNotificationAndSuggestionDatabase *)self _runMigrationSteps:v20];

      if (v21) {
        goto LABEL_24;
      }
      return 0;
    case 5:
LABEL_24:
      v39 = @"CREATE INDEX nonprominentCandidateSelectionIndex ON notifications (bundleId, threadId, receiveTimestamp) WHERE isActive=1 AND isProminent=0";
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
      BOOL v23 = [(ATXNotificationAndSuggestionDatabase *)self _runMigrationSteps:v22];

      if (v23) {
        goto LABEL_25;
      }
      return 0;
    case 6:
LABEL_25:
      v38[0] = @"ALTER TABLE notifications ADD COLUMN receivedMode TEXT";
      v38[1] = @"ALTER TABLE notifications ADD COLUMN firstUI INTEGER";
      v38[2] = @"ALTER TABLE notifications ADD COLUMN mostRecentUI INTEGER";
      v38[3] = @"ALTER TABLE notifications ADD COLUMN deliveryReason INTEGER";
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
      BOOL v25 = [(ATXNotificationAndSuggestionDatabase *)self _runMigrationSteps:v24];

      if (v25) {
        goto LABEL_26;
      }
      return 0;
    case 7:
LABEL_26:
      v37[0] = @"CREATE INDEX sendMessagesToDigestIndex ON notifications(bundleId, receiveTimestamp)";
      v37[1] = @"CREATE INDEX receiveTimestampIndex ON notifications(receiveTimestamp)";
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      BOOL v27 = [(ATXNotificationAndSuggestionDatabase *)self _runMigrationSteps:v26];

      if (v27) {
        goto LABEL_27;
      }
      return 0;
    case 8:
LABEL_27:
      v36 = @"CREATE INDEX feedbackAndCreatedTimestamp ON suggestions (feedbackKey, createdTimestamp)";
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      BOOL v29 = [(ATXNotificationAndSuggestionDatabase *)self _runMigrationSteps:v28];

      if (!v29) {
        return 0;
      }
      goto LABEL_4;
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
LABEL_4:
      if ([(ATXNotificationAndSuggestionDatabase *)self _hasIndexNamed:@"latestOutcomeIndex"]) {
        goto LABEL_6;
      }
      v35 = @"CREATE INDEX IF NOT EXISTS latestOutcomeIndex ON notifications (latestOutcome);";
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      BOOL v6 = [(ATXNotificationAndSuggestionDatabase *)self _runMigrationSteps:v5];

      if (v6) {
        goto LABEL_6;
      }
      return 0;
    case 19:
LABEL_6:
      if ([(ATXNotificationAndSuggestionDatabase *)self _hasColumnOnTable:@"notifications" named:@"recordTimestamp"])
      {
        goto LABEL_9;
      }
      if ([(ATXNotificationAndSuggestionDatabase *)self _hasColumnOnTable:@"notifications" named:@"notificationID"])
      {
        goto LABEL_9;
      }
      v34[0] = @"ALTER TABLE notifications ADD COLUMN recordTimestamp REAL";
      v34[1] = @"ALTER TABLE notifications ADD COLUMN notificationID TEXT";
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
      BOOL v8 = [(ATXNotificationAndSuggestionDatabase *)self _runMigrationSteps:v7];

      if (v8) {
        goto LABEL_9;
      }
      return 0;
    case 20:
LABEL_9:
      if ([(ATXNotificationAndSuggestionDatabase *)self _hasColumnOnTable:@"notifications" named:@"notificationBodyLength"])
      {
        goto LABEL_11;
      }
      v33 = @"ALTER TABLE notifications ADD COLUMN notificationBodyLength INTEGER";
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
      BOOL v10 = [(ATXNotificationAndSuggestionDatabase *)self _runMigrationSteps:v9];

      if (v10) {
        goto LABEL_11;
      }
      return 0;
    case 21:
LABEL_11:
      v32[0] = @"ALTER TABLE notifications ADD COLUMN notificationTitleLength INTEGER";
      v32[1] = @"ALTER TABLE notifications ADD COLUMN notificationSubtitleLength INTEGER";
      v32[2] = @"ALTER TABLE notifications ADD COLUMN summaryLength INTEGER";
      v32[3] = @"ALTER TABLE notifications ADD COLUMN isDeliveredInPrioritySection INTEGER NOT NULL DEFAULT 0";
      v32[4] = @"ALTER TABLE notifications ADD COLUMN isSummarized INTEGER NOT NULL DEFAULT 0";
      v32[5] = @"ALTER TABLE notifications ADD COLUMN isPartOfStack INTEGER NOT NULL DEFAULT 0";
      v32[6] = @"ALTER TABLE notifications ADD COLUMN isStackSummary INTEGER NOT NULL DEFAULT 0";
      v32[7] = @"ALTER TABLE notifications ADD COLUMN isDeterminedUrgentByModel INTEGER NOT NULL DEFAULT 0";
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:8];
      if ([(ATXNotificationAndSuggestionDatabase *)self _anyColumnWithNameFromColumnNames:&unk_1F27F2B68 existsOnTable:@"notifications"]|| [(ATXNotificationAndSuggestionDatabase *)self _runMigrationSteps:v11])
      {

LABEL_14:
        v31[0] = @"ALTER TABLE notifications ADD COLUMN numberOfNotificationsInStack INTEGER NOT NULL DEFAULT 0";
        v31[1] = @"ALTER TABLE notifications ADD COLUMN notificationPriorityStatus INTEGER NOT NULL DEFAULT 0";
        v31[2] = @"ALTER TABLE notifications ADD COLUMN notificationSummaryStatus INTEGER NOT NULL DEFAULT 0";
        v31[3] = @"ALTER TABLE notifications ADD COLUMN isPriorityNotificationEnabled INTEGER NOT NULL DEFAULT 0";
        v31[4] = @"ALTER TABLE notifications ADD COLUMN isNotificationSummaryEnabled INTEGER NOT NULL DEFAULT 0";
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:5];
        BOOL v4 = [(ATXNotificationAndSuggestionDatabase *)self _anyColumnWithNameFromColumnNames:&unk_1F27F2B80 existsOnTable:@"notifications"]|| [(ATXNotificationAndSuggestionDatabase *)self _runMigrationSteps:v11];
      }
      else
      {
        BOOL v4 = 0;
      }

      break;
    case 22:
      goto LABEL_14;
    default:
      return 1;
  }
  return v4;
}

- (BOOL)_runMigrationSteps:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        BOOL v8 = [(ATXAbstractVersionedDatabase *)self db];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __59__ATXNotificationAndSuggestionDatabase__runMigrationSteps___block_invoke;
        v12[3] = &unk_1E68AD188;
        v12[4] = v7;
        v12[5] = &v17;
        [v8 prepAndRunQuery:v7 onPrep:0 onRow:0 onError:v12];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v4);
  }

  BOOL v9 = *((unsigned char *)v18 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  return v9;
}

uint64_t __59__ATXNotificationAndSuggestionDatabase__runMigrationSteps___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __59__ATXNotificationAndSuggestionDatabase__runMigrationSteps___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (BOOL)_hasColumnOnTable:(id)a3 named:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(ATXAbstractVersionedDatabase *)self db];
  char v9 = [v8 hasColumnOnTable:v7 named:v6];

  return v9;
}

- (BOOL)_anyColumnWithNameFromColumnNames:(id)a3 existsOnTable:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        long long v14 = [(ATXAbstractVersionedDatabase *)self db];
        LOBYTE(v13) = [v14 hasColumnOnTable:v7 named:v13];

        if (v13)
        {
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)_hasIndexNamed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXAbstractVersionedDatabase *)self db];
  char v6 = [v5 hasIndexNamed:v4];

  return v6;
}

- (id)getBookmarkDataFromName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = __Block_byref_object_copy__31;
  queue = self->super._queue;
  long long v16 = __Block_byref_object_dispose__31;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke;
  v9[3] = &unk_1E68AD278;
  v9[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync_notxn_0(queue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_2;
  v6[3] = &unk_1E68AD200;
  id v7 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_3;
  v5[3] = &unk_1E68AD228;
  v5[4] = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT bookmarkData FROM biome_bookmark WHERE bookmarkName = :bookmarkName" onPrep:v6 onRow:v5 onError:v3];
}

uint64_t __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":bookmarkName" toNSString:*(void *)(a1 + 32)];
}

uint64_t __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSDataForColumn:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C08];
}

uint64_t __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_4_cold_1(a1, (uint64_t)v3);
  }

  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v5;
}

- (void)setBookmarkData:(id)a3 forName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->super._queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke;
  v11[3] = &unk_1E68AC320;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync_notxn_0(queue, v11);
}

void __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke(id *a1)
{
  v2 = [a1[4] db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke_2;
  v5[3] = &unk_1E68AD1B0;
  id v6 = a1[5];
  id v7 = a1[6];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke_3;
  v3[3] = &unk_1E68AD250;
  id v4 = a1[5];
  [v2 prepAndRunQuery:@"INSERT OR REPLACE INTO biome_bookmark VALUES (:bookmarkName, :ts, :bookmarkData)", v5, 0, v3 onPrep onRow onError];
}

void __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":bookmarkName" toNSString:v3];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":ts");
  [v4 bindNamedParam:":bookmarkData" toNSData:*(void *)(a1 + 40)];
}

uint64_t __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke_3_cold_1(a1, (uint64_t)v3);
  }

  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v5;
}

- (void)insertNotificationFromEvent:(id)a3 deliveryMethod:(int64_t)a4 modeIdentifier:(id)a5 deliveryReason:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->super._queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke;
  v17[3] = &unk_1E68AE738;
  v17[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync_notxn_0(queue, v17);
}

void __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke_2;
  v7[3] = &unk_1E68AE710;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  id v8 = v3;
  uint64_t v11 = v4;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke_3;
  v5[3] = &unk_1E68AD250;
  id v6 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"INSERT OR IGNORE INTO notifications VALUES (:uuid, :receiveTimestamp, :deliveryMethod, :urgency, :bundleId, :threadId, :contactId, :isGroupMessage, :isMessage, :latestOutcome, :latestOutcomeTimestamp, :isProminent, :isActive, 0, :rawIdentifier, :receivedMode, NULL, NULL, :deliveryReason, :recordTimestamp, :notificationID, :notificationBodyLength, :notificationTitleLength, :notificationSubtitleLength, :summaryLength, :isDeliveredInPrioritySection, :isSummarized, :isPartOfStack, :isStackSummary, 0, :numberOfNotificationsInStack, :notificationPriorityStatus, :notificationSummaryStatus, :isPriorityNotificationEnabled, :isNotificationSummaryEnabled)", v7, 0, v5 onPrep onRow onError];
}

void __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v41 = a2;
  id v3 = [*(id *)(a1 + 32) notification];
  uint64_t v4 = [v3 uuid];
  uint64_t v5 = [v4 UUIDString];
  [v41 bindNamedParam:":uuid" toNSString:v5];

  [*(id *)(a1 + 32) timestamp];
  objc_msgSend(v41, "bindNamedParam:toDouble:", ":receiveTimestamp");
  [v41 bindNamedParam:":deliveryMethod" toInteger:*(void *)(a1 + 56)];
  id v6 = [*(id *)(a1 + 32) notification];
  objc_msgSend(v41, "bindNamedParam:toInteger:", ":urgency", objc_msgSend(v6, "urgency"));

  id v7 = [*(id *)(a1 + 32) notification];
  id v8 = [v7 bundleID];
  [v41 bindNamedParam:":bundleId" toNSString:v8];

  id v9 = [*(id *)(a1 + 32) notification];
  id v10 = [v9 threadID];
  [v41 bindNamedParam:":threadId" toNSString:v10];

  uint64_t v11 = [*(id *)(a1 + 32) notification];
  id v12 = [v11 contactIDs];
  if (v12)
  {
    id v13 = [*(id *)(a1 + 32) notification];
    id v14 = [v13 contactIDs];
    id v15 = [v14 firstObject];
  }
  else
  {
    id v15 = 0;
  }

  [v41 bindNamedParam:":contactId" toNSString:v15];
  id v16 = [*(id *)(a1 + 32) notification];
  objc_msgSend(v41, "bindNamedParam:toInt64:", ":isGroupMessage", objc_msgSend(v16, "isGroupMessage"));

  id v17 = [*(id *)(a1 + 32) notification];
  objc_msgSend(v41, "bindNamedParam:toInt64:", ":isMessage", objc_msgSend(v17, "isMessage"));

  objc_msgSend(v41, "bindNamedParam:toInteger:", ":latestOutcome", objc_msgSend(*(id *)(a1 + 32), "eventType"));
  [*(id *)(a1 + 32) timestamp];
  objc_msgSend(v41, "bindNamedParam:toDouble:", ":latestOutcomeTimestamp");
  objc_msgSend(v41, "bindNamedParam:toInt64:", ":isProminent", objc_msgSend(*(id *)(a1 + 32), "eventCausesNotificationNonprominence") ^ 1);
  [v41 bindNamedParam:":isActive" toInt64:1];
  id v18 = [*(id *)(a1 + 32) notification];
  id v19 = [v18 rawIdentifiers];
  if (v19)
  {
    id v20 = [*(id *)(a1 + 32) notification];
    int64_t v21 = [v20 rawIdentifiers];
    uint64_t v22 = [v21 firstObject];
  }
  else
  {
    uint64_t v22 = 0;
  }

  [v41 bindNamedParam:":rawIdentifier" toNSString:v22];
  [v41 bindNamedParam:":receivedMode" toNSString:*(void *)(a1 + 40)];
  [v41 bindNamedParam:":deliveryReason" toInt64AsNSNumber:*(void *)(a1 + 48)];
  BOOL v23 = [*(id *)(a1 + 32) notification];
  v24 = [v23 recordDate];

  if (v24)
  {
    BOOL v25 = [*(id *)(a1 + 32) notification];
    v26 = [v25 recordDate];
    [v26 timeIntervalSinceReferenceDate];
    objc_msgSend(v41, "bindNamedParam:toDouble:", ":recordTimestamp");
  }
  BOOL v27 = [*(id *)(a1 + 32) notification];
  v28 = [v27 notificationID];
  [v41 bindNamedParam:":notificationID" toNSString:v28];

  BOOL v29 = [*(id *)(a1 + 32) notification];
  objc_msgSend(v41, "bindNamedParam:toInteger:", ":notificationBodyLength", objc_msgSend(v29, "bodyLength"));

  v30 = [*(id *)(a1 + 32) notification];
  objc_msgSend(v41, "bindNamedParam:toInteger:", ":notificationTitleLength", objc_msgSend(v30, "titleLength"));

  v31 = [*(id *)(a1 + 32) notification];
  objc_msgSend(v41, "bindNamedParam:toInteger:", ":notificationSubtitleLength", objc_msgSend(v31, "subtitleLength"));

  v32 = [*(id *)(a1 + 32) notification];
  objc_msgSend(v41, "bindNamedParam:toInteger:", ":summaryLength", objc_msgSend(v32, "summaryLength"));

  objc_msgSend(v41, "bindNamedParam:toInt64:", ":isDeliveredInPrioritySection", objc_msgSend(*(id *)(a1 + 32), "isDeliveredInPrioritySection"));
  v33 = [*(id *)(a1 + 32) notification];
  objc_msgSend(v41, "bindNamedParam:toInt64:", ":isSummarized", objc_msgSend(v33, "isSummarized"));

  v34 = [*(id *)(a1 + 32) notification];
  objc_msgSend(v41, "bindNamedParam:toInt64:", ":isPartOfStack", objc_msgSend(v34, "isPartOfStack"));

  v35 = [*(id *)(a1 + 32) notification];
  objc_msgSend(v41, "bindNamedParam:toInt64:", ":isStackSummary", objc_msgSend(v35, "isStackSummary"));

  v36 = [*(id *)(a1 + 32) notification];
  objc_msgSend(v41, "bindNamedParam:toInteger:", ":numberOfNotificationsInStack", objc_msgSend(v36, "numberOfNotificationsInStack"));

  v37 = [*(id *)(a1 + 32) notification];
  objc_msgSend(v41, "bindNamedParam:toInteger:", ":notificationPriorityStatus", objc_msgSend(v37, "priorityStatus"));

  v38 = [*(id *)(a1 + 32) notification];
  objc_msgSend(v41, "bindNamedParam:toInteger:", ":notificationSummaryStatus", objc_msgSend(v38, "summaryStatus"));

  v39 = [*(id *)(a1 + 32) notification];
  objc_msgSend(v41, "bindNamedParam:toInt64:", ":isPriorityNotificationEnabled", objc_msgSend(v39, "isPriorityNotificationEnabled"));

  v40 = [*(id *)(a1 + 32) notification];
  objc_msgSend(v41, "bindNamedParam:toInt64:", ":isNotificationSummaryEnabled", objc_msgSend(v40, "isNotificationSummaryEnabled"));
}

uint64_t __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke_3_cold_1(a1, (uint64_t)v3);
  }

  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v5;
}

- (void)updateNotificationFromEvent:(id)a3
{
  id v4 = a3;
  if ([v4 eventType] == 5)
  {
    uint64_t v5 = [v4 notification];
    id v6 = [v5 uuid];

    id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    id v8 = [(ATXNotificationAndSuggestionDatabase *)self resolutionsForNotifications:v7];
    id v9 = [v8 objectForKeyedSubscript:v6];

    if (v9) {
      BOOL v10 = [v9 resolutionType] != 3;
    }
    else {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  uint64_t v11 = [v4 eventType];
  queue = self->super._queue;
  if (v11 == 19)
  {
    id v13 = (id *)v17;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke;
    v17[3] = &unk_1E68AB870;
    v17[4] = self;
  }
  else
  {
    id v13 = (id *)v15;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_118;
    v15[3] = &unk_1E68AD4C0;
    v15[4] = self;
    BOOL v16 = v10;
  }
  v13[5] = v4;
  id v14 = v4;
  dispatch_sync_notxn_0(queue, v13);
}

void __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_2;
  v5[3] = &unk_1E68AD200;
  id v6 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_3;
  v3[3] = &unk_1E68AD250;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"UPDATE notifications SET numExpansions = numExpansions + 1 WHERE uuid = :uuid" onPrep:v5 onRow:0 onError:v3];
}

void __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 notification];
  id v4 = [v6 uuid];
  uint64_t v5 = [v4 UUIDString];
  [v3 bindNamedParam:":uuid" toNSString:v5];
}

uint64_t __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_3_cold_1(a1, (uint64_t)v3);
  }

  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v5;
}

void __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_118(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  char v3 = *(unsigned char *)(a1 + 48);
  id v4 = (uint64_t *)&kATXUpdateNotificationExcludingLatestOutcomeQuery;
  if (!v3) {
    id v4 = (uint64_t *)&kATXUpdateNotificationIncludingLatestOutcomeQuery;
  }
  uint64_t v5 = *v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_2_119;
  v8[3] = &unk_1E68AD498;
  char v10 = v3;
  id v9 = *(id *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_3_120;
  v6[3] = &unk_1E68AD250;
  id v7 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:v5 onPrep:v8 onRow:0 onError:v6];
}

void __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_2_119(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (!*(unsigned char *)(a1 + 40))
  {
    objc_msgSend(v6, "bindNamedParam:toInteger:", ":latestOutcome", objc_msgSend(*(id *)(a1 + 32), "eventType"));
    [*(id *)(a1 + 32) timestamp];
    objc_msgSend(v6, "bindNamedParam:toDouble:", ":latestOutcomeTimestamp");
  }
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":isProminent", objc_msgSend(*(id *)(a1 + 32), "eventCausesNotificationNonprominence") ^ 1);
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":isActive", objc_msgSend(*(id *)(a1 + 32), "eventCausesNotificationInactivity") ^ 1);
  char v3 = [*(id *)(a1 + 32) notification];
  id v4 = [v3 uuid];
  uint64_t v5 = [v4 UUIDString];
  [v6 bindNamedParam:":uuid" toNSString:v5];
}

uint64_t __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_3_120(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_3_cold_1(a1, (uint64_t)v3);
  }

  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v5;
}

- (void)updateNotificationUIForNotifications:(id)a3 nextUI:(unint64_t)a4
{
  id v6 = a3;
  queue = self->super._queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke;
  v9[3] = &unk_1E68AE7A8;
  id v10 = v6;
  unint64_t v11 = a4;
  v9[4] = self;
  id v8 = v6;
  dispatch_sync_notxn_0(queue, v9);
}

void __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke_2;
  v4[3] = &unk_1E68AE780;
  id v3 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v5 = v3;
  [v2 prepAndRunQuery:@" UPDATE notifications SET   firstUI = COALESCE(firstUI, :nextUI), mostRecentUI = :nextUI WHERE   uuid IN _pas_nsarray(:notificationUUIDs) ", v4, 0, &__block_literal_global_125 onPrep onRow onError];
}

void __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 bindNamedParam:":nextUI" toInteger:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_62);
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  [v5 bindNamedParam:":notificationUUIDs" toNSArray:v4];
}

uint64_t __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

uint64_t __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke_4_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v10;
}

- (void)insertSuggestion:(id)a3
{
  id v4 = a3;
  queue = self->super._queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke;
  v7[3] = &unk_1E68AB870;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync_notxn_0(queue, v7);
}

void __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke_2;
  v5[3] = &unk_1E68AD200;
  id v6 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke_3;
  v3[3] = &unk_1E68AD250;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"INSERT OR IGNORE INTO suggestions VALUES (:uuid, :createdTimestamp, :triggerNotificationUUID, :deliverySuggestion, :suggestionType, :scope, :entityIdentifier, :shownTimestamp, :latestOutcome, :latestOutcomeTimestamp, :isActive, :feedbackKey)", v5, 0, v3 onPrep onRow onError];
}

void __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 uuid];
  id v6 = [v5 UUIDString];
  [v4 bindNamedParam:":uuid" toNSString:v6];

  uint64_t v7 = [*(id *)(a1 + 32) timestamp];
  [v7 timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":createdTimestamp");

  id v8 = [*(id *)(a1 + 32) triggerNotificationUUID];
  uint64_t v9 = [v8 UUIDString];
  [v4 bindNamedParam:":triggerNotificationUUID" toNSString:v9];

  id v10 = [*(id *)(a1 + 32) encodeAsProto];
  [v4 bindNamedParam:":deliverySuggestion" toNSData:v10];

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":suggestionType", objc_msgSend(*(id *)(a1 + 32), "subtype"));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":scope", objc_msgSend(*(id *)(a1 + 32), "scope"));
  unint64_t v11 = [*(id *)(a1 + 32) entityIdentifier];
  [v4 bindNamedParam:":entityIdentifier" toNSString:v11];

  [v4 bindNamedParamToNull:":shownTimestamp"];
  [v4 bindNamedParam:":latestOutcome" toInt64:7];
  id v12 = [*(id *)(a1 + 32) timestamp];
  [v12 timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":latestOutcomeTimestamp");

  [v4 bindNamedParam:":isActive" toInt64:1];
  id v13 = [*(id *)(a1 + 32) feedbackKey];
  [v4 bindNamedParam:":feedbackKey" toNSString:v13];
}

uint64_t __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke_3_cold_1(a1, (uint64_t)v3);
  }

  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v5;
}

- (void)updateSuggestionFromEvent:(id)a3
{
  id v4 = a3;
  queue = self->super._queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke;
  v7[3] = &unk_1E68AB870;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync_notxn_0(queue, v7);
}

void __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke_2;
  v5[3] = &unk_1E68AD200;
  id v6 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke_3;
  v3[3] = &unk_1E68AD250;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"UPDATE suggestions SET shownTimestamp = COALESCE(shownTimestamp, :shownTimestamp), latestOutcome = :latestOutcome, latestOutcomeTimestamp = :latestOutcomeTimestamp, isActive = (isActive & :isActive) WHERE uuid = :uuid", v5, 0, v3 onPrep onRow onError];
}

void __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) eventType] == 3)
  {
    id v3 = [*(id *)(a1 + 32) eventDate];
    [v3 timeIntervalSinceReferenceDate];
    objc_msgSend(v7, "bindNamedParam:toDouble:", ":shownTimestamp");
  }
  else
  {
    [v7 bindNamedParamToNull:":shownTimestamp"];
  }
  objc_msgSend(v7, "bindNamedParam:toInt64:", ":latestOutcome", objc_msgSend(*(id *)(a1 + 32), "eventType"));
  id v4 = [*(id *)(a1 + 32) eventDate];
  [v4 timeIntervalSinceReferenceDate];
  objc_msgSend(v7, "bindNamedParam:toDouble:", ":latestOutcomeTimestamp");

  objc_msgSend(v7, "bindNamedParam:toInt64:", ":isActive", objc_msgSend(*(id *)(a1 + 32), "eventCausesSuggestionInactivity") ^ 1);
  uint64_t v5 = [*(id *)(a1 + 32) suggestionUUID];
  id v6 = [v5 UUIDString];
  [v7 bindNamedParam:":uuid" toNSString:v6];
}

uint64_t __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke_3_cold_1(a1, (uint64_t)v3);
  }

  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v5;
}

- (BOOL)hasSuggestionBeenShownForEntityId:(id)a3 suggestionType:(int64_t)a4 scope:(int64_t)a5 sinceTimestamp:(double)a6
{
  id v11 = a3;
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  queue = self->super._queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke;
  v15[3] = &unk_1E68AE820;
  int64_t v18 = a4;
  int64_t v19 = a5;
  v15[4] = self;
  id v16 = v11;
  double v20 = a6;
  id v17 = &v22;
  SEL v21 = a2;
  id v13 = v11;
  dispatch_sync_notxn_0(queue, v15);
  LOBYTE(a4) = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return a4;
}

void __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_2;
  v9[3] = &unk_1E68AE7D0;
  long long v11 = *(_OWORD *)(a1 + 56);
  id v10 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 72);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_3;
  v8[3] = &unk_1E68AD228;
  void v8[4] = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4;
  v5[3] = &unk_1E68AE7F8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 80);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 prepAndRunQuery:@"SELECT count(*) AS numOfSuggestions FROM suggestions WHERE suggestionType = :suggestionType AND scope = :scope AND entityIdentifier = :entityId AND createdTimestamp >= :timestamp" onPrep:v9 onRow:v8 onError:v5];
}

void __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":suggestionType" toInteger:v3];
  [v4 bindNamedParam:":scope" toInteger:*(void *)(a1 + 48)];
  [v4 bindNamedParam:":entityId" toNSString:*(void *)(a1 + 32)];
  [v4 bindNamedParam:":timestamp" toDouble:*(double *)(a1 + 56)];
}

uint64_t __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumnAlias:"numOfSuggestions"] > 0;
  return *MEMORY[0x1E4F93C08];
}

uint64_t __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)suggestionEventTypeShownForEntityId:(id)a3 suggestionType:(int64_t)a4 scope:(int64_t)a5 sinceTimestamp:(double)a6
{
  id v11 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__31;
  BOOL v27 = __Block_byref_object_dispose__31;
  id v28 = 0;
  queue = self->super._queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke;
  v16[3] = &unk_1E68AE820;
  int64_t v19 = a4;
  int64_t v20 = a5;
  v16[4] = self;
  id v17 = v11;
  double v21 = a6;
  int64_t v18 = &v23;
  SEL v22 = a2;
  id v13 = v11;
  dispatch_sync_notxn_0(queue, v16);
  id v14 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_2;
  v9[3] = &unk_1E68AE7D0;
  long long v11 = *(_OWORD *)(a1 + 56);
  id v10 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 72);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_3;
  v8[3] = &unk_1E68AD228;
  void v8[4] = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4;
  v5[3] = &unk_1E68AE7F8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 80);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 prepAndRunQuery:@"SELECT latestOutcome AS eventType FROM suggestions WHERE suggestionType = :suggestionType AND scope = :scope AND entityIdentifier = :entityId AND createdTimestamp >= :timestamp ORDER BY createdTimestamp DESC LIMIT 1" onPrep:v9 onRow:v8 onError:v5];
}

void __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":suggestionType" toInteger:v3];
  [v4 bindNamedParam:":scope" toInteger:*(void *)(a1 + 48)];
  [v4 bindNamedParam:":entityId" toNSString:*(void *)(a1 + 32)];
  [v4 bindNamedParam:":timestamp" toDouble:*(double *)(a1 + 56)];
}

uint64_t __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)NSNumber;
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 getIntegerForColumnAlias:"eventType"];

  uint64_t v7 = [v5 initWithLong:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return *MEMORY[0x1E4F93C08];
}

uint64_t __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)engagementStatusOfActiveAndProminentNotificationsWithUrgency:(int64_t)a3 sinceTimestamp:(double)a4
{
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__31;
  v25[4] = __Block_byref_object_dispose__31;
  id v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__31;
  v23[4] = __Block_byref_object_dispose__31;
  id v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__31;
  v21[4] = __Block_byref_object_dispose__31;
  id v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__31;
  v19[4] = __Block_byref_object_dispose__31;
  id v20 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__31;
  id v17 = __Block_byref_object_dispose__31;
  uint64_t v8 = objc_opt_new();
  queue = self->super._queue;
  id v18 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke;
  v12[3] = &unk_1E68AE8B0;
  *(double *)&v12[10] = a4;
  v12[4] = self;
  v12[5] = v25;
  void v12[6] = v23;
  v12[7] = v21;
  v12[8] = v19;
  v12[9] = &v13;
  v12[11] = a3;
  v12[12] = a2;
  dispatch_sync_notxn_0(queue, v12);
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  return v10;
}

void __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_2;
  v9[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  void v9[4] = *(void *)(a1 + 80);
  void v9[5] = *(void *)(a1 + 88);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_3;
  v5[3] = &unk_1E68AE868;
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  long long v7 = v3;
  uint64_t v8 = *(void *)(a1 + 72);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v4[4] = *(void *)(a1 + 96);
  [v2 prepAndRunQuery:@"SELECT MAX(IIF(isActive=1, receiveTimestamp, 0)) AS latestTimestamp, uuid, SUM(IIF(latestOutcome IN (:defaultAction, :supplementaryAction, :longLook, :appLaunch), 1, 0)) AS numEngagedNotifications, SUM(1) AS numNotifications, bundleId FROM notifications WHERE receiveTimestamp >= :timestamp AND deliveryMethod = :deliveryMethod AND urgency = :urgency GROUP BY bundleId LIMIT :limit", v9, v5, v4 onPrep onRow onError];
}

void __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindNamedParam:":defaultAction" toInteger:1];
  [v3 bindNamedParam:":supplementaryAction" toInteger:2];
  [v3 bindNamedParam:":longLook" toInteger:7];
  [v3 bindNamedParam:":appLaunch" toInteger:9];
  [v3 bindNamedParam:":limit" toInt64:1000];
  [v3 bindNamedParam:":timestamp" toDouble:*(double *)(a1 + 32)];
  [v3 bindNamedParam:":deliveryMethod" toInteger:1];
  [v3 bindNamedParam:":urgency" toInteger:*(void *)(a1 + 40)];
}

uint64_t __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_3(void *a1, void *a2)
{
  id v3 = NSNumber;
  id v4 = a2;
  uint64_t v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "getIntegerForColumnAlias:", "numEngagedNotifications"));
  uint64_t v6 = *(void *)(a1[4] + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "getIntegerForColumnAlias:", "numNotifications")- objc_msgSend(*(id *)(*(void *)(a1[4] + 8) + 40), "integerValue"));
  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v12 = [v4 getNSStringForColumnAlias:"uuid"];
  uint64_t v13 = [v11 initWithUUIDString:v12];
  uint64_t v14 = *(void *)(a1[6] + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = [v4 getNSStringForColumnAlias:"bundleId"];

  uint64_t v17 = *(void *)(a1[7] + 8);
  id v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  int64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:*(void *)(*(void *)(a1[4] + 8) + 40) second:*(void *)(*(void *)(a1[5] + 8) + 40)];
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:*(void *)(*(void *)(a1[6] + 8) + 40) second:v19];
  [*(id *)(*(void *)(a1[8] + 8) + 40) setObject:v20 forKey:*(void *)(*(void *)(a1[7] + 8) + 40)];
  double v21 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v21;
}

uint64_t __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp:(double)a3
{
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__31;
  v25[4] = __Block_byref_object_dispose__31;
  id v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__31;
  v23[4] = __Block_byref_object_dispose__31;
  id v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__31;
  v21[4] = __Block_byref_object_dispose__31;
  id v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__31;
  v19[4] = __Block_byref_object_dispose__31;
  id v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__31;
  v17[4] = __Block_byref_object_dispose__31;
  id v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__31;
  uint64_t v15 = __Block_byref_object_dispose__31;
  uint64_t v6 = objc_opt_new();
  queue = self->super._queue;
  id v16 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke;
  v10[3] = &unk_1E68AE920;
  *(double *)&v10[11] = a3;
  v10[4] = self;
  v10[5] = v25;
  v10[6] = v23;
  v10[7] = v19;
  v10[8] = v21;
  v10[9] = v17;
  v10[10] = &v11;
  v10[12] = a2;
  dispatch_sync_notxn_0(queue, v10);
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
  return v8;
}

void __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke_2;
  v9[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v9[4] = *(void *)(a1 + 88);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke_3;
  v5[3] = &unk_1E68AE8F8;
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  long long v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 72);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke_4;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v4[4] = *(void *)(a1 + 96);
  [v2 prepAndRunQuery:@"SELECT MAX(IIF(isActive=1 AND isProminent=1, receiveTimestamp, 0)) AS latestTimestamp, IIF(isActive=1 AND isProminent=1, uuid, NULL) AS uuid, SUM(IIF(latestOutcome IN (:defaultAction, :supplementaryAction, :longLook, :appLaunch), 1, 0)) AS numEngagedNotifications, SUM(1) AS numNotifications, bundleId FROM notifications WHERE receiveTimestamp >= :timestamp AND deliveryMethod = :deliveryMethod AND isMessage = 1 GROUP BY bundleId LIMIT :limit", v9, v5, v4 onPrep onRow onError];
}

void __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindNamedParam:":defaultAction" toInteger:1];
  [v3 bindNamedParam:":supplementaryAction" toInteger:2];
  [v3 bindNamedParam:":longLook" toInteger:7];
  [v3 bindNamedParam:":appLaunch" toInteger:9];
  [v3 bindNamedParam:":limit" toInt64:1000];
  [v3 bindNamedParam:":timestamp" toDouble:*(double *)(a1 + 32)];
  [v3 bindNamedParam:":deliveryMethod" toInteger:1];
}

uint64_t __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumnAlias:", "numEngagedNotifications"));
  uint64_t v5 = *(void *)(a1[4] + 8);
  long long v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumnAlias:", "numNotifications")- objc_msgSend(*(id *)(*(void *)(a1[4] + 8) + 40), "integerValue"));
  uint64_t v8 = *(void *)(a1[5] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = [v3 getNSStringForColumnAlias:"uuid"];
  uint64_t v11 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(*(void *)(a1[6] + 8) + 40)];
    uint64_t v14 = *(void *)(a1[7] + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v16 = [v3 getNSStringForColumnAlias:"bundleId"];
    uint64_t v17 = *(void *)(a1[8] + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    int64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:*(void *)(*(void *)(a1[4] + 8) + 40) second:*(void *)(*(void *)(a1[5] + 8) + 40)];
    id v20 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:*(void *)(*(void *)(a1[7] + 8) + 40) second:v19];
    [*(id *)(*(void *)(a1[9] + 8) + 40) setObject:v20 forKey:*(void *)(*(void *)(a1[8] + 8) + 40)];
    uint64_t v21 = *MEMORY[0x1E4F93C08];
  }
  else
  {
    uint64_t v21 = *MEMORY[0x1E4F93C08];
  }

  return v21;
}

uint64_t __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)engagementStatusOfActiveAndProminentNotificationsSinceTimestamp:(double)a3
{
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__31;
  v25[4] = __Block_byref_object_dispose__31;
  id v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__31;
  v23[4] = __Block_byref_object_dispose__31;
  id v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__31;
  v21[4] = __Block_byref_object_dispose__31;
  id v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__31;
  v19[4] = __Block_byref_object_dispose__31;
  id v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__31;
  v17[4] = __Block_byref_object_dispose__31;
  id v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__31;
  uint64_t v15 = __Block_byref_object_dispose__31;
  long long v6 = objc_opt_new();
  queue = self->super._queue;
  id v16 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke;
  v10[3] = &unk_1E68AE920;
  *(double *)&v10[11] = a3;
  v10[4] = self;
  v10[5] = v25;
  v10[6] = v23;
  v10[7] = v19;
  v10[8] = v21;
  v10[9] = v17;
  v10[10] = &v11;
  v10[12] = a2;
  dispatch_sync_notxn_0(queue, v10);
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
  return v8;
}

void __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke_2;
  v9[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v9[4] = *(void *)(a1 + 88);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke_3;
  v5[3] = &unk_1E68AE8F8;
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  long long v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 72);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke_4;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v4[4] = *(void *)(a1 + 96);
  [v2 prepAndRunQuery:@"SELECT MAX(IIF(isActive=1 AND isProminent=1, receiveTimestamp, 0)) AS latestTimestamp, IIF(isActive=1 AND isProminent=1, uuid, NULL) AS uuid, SUM(IIF(latestOutcome IN (:defaultAction, :supplementaryAction, :longLook, :appLaunch), 1, 0)) AS numEngagedNotifications, SUM(1) AS numNotifications, bundleId FROM notifications WHERE receiveTimestamp >= :timestamp AND deliveryMethod = :deliveryMethod GROUP BY bundleId LIMIT :limit", v9, v5, v4 onPrep onRow onError];
}

void __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindNamedParam:":defaultAction" toInteger:1];
  [v3 bindNamedParam:":supplementaryAction" toInteger:2];
  [v3 bindNamedParam:":longLook" toInteger:7];
  [v3 bindNamedParam:":appLaunch" toInteger:9];
  [v3 bindNamedParam:":limit" toInt64:1000];
  [v3 bindNamedParam:":timestamp" toDouble:*(double *)(a1 + 32)];
  [v3 bindNamedParam:":deliveryMethod" toInteger:1];
}

uint64_t __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumnAlias:", "numEngagedNotifications"));
  uint64_t v5 = *(void *)(a1[4] + 8);
  long long v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumnAlias:", "numNotifications")- objc_msgSend(*(id *)(*(void *)(a1[4] + 8) + 40), "integerValue"));
  uint64_t v8 = *(void *)(a1[5] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = [v3 getNSStringForColumnAlias:"uuid"];
  uint64_t v11 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(*(void *)(a1[6] + 8) + 40)];
    uint64_t v14 = *(void *)(a1[7] + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v16 = [v3 getNSStringForColumnAlias:"bundleId"];
    uint64_t v17 = *(void *)(a1[8] + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    int64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:*(void *)(*(void *)(a1[4] + 8) + 40) second:*(void *)(*(void *)(a1[5] + 8) + 40)];
    id v20 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:*(void *)(*(void *)(a1[7] + 8) + 40) second:v19];
    [*(id *)(*(void *)(a1[9] + 8) + 40) setObject:v20 forKey:*(void *)(*(void *)(a1[8] + 8) + 40)];
    uint64_t v21 = *MEMORY[0x1E4F93C08];
  }
  else
  {
    uint64_t v21 = *MEMORY[0x1E4F93C08];
  }

  return v21;
}

uint64_t __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)mostRecentActiveNotifications
{
  uint64_t v4 = objc_opt_new();
  queue = self->super._queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__ATXNotificationAndSuggestionDatabase_mostRecentActiveNotifications__block_invoke;
  v10[3] = &unk_1E68AE7A8;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  SEL v12 = a2;
  dispatch_sync_notxn_0(queue, v10);
  uint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

void __69__ATXNotificationAndSuggestionDatabase_mostRecentActiveNotifications__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__ATXNotificationAndSuggestionDatabase_mostRecentActiveNotifications__block_invoke_2;
  v4[3] = &unk_1E68AE948;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__ATXNotificationAndSuggestionDatabase_mostRecentActiveNotifications__block_invoke_3;
  v3[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v3[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT uuid, receiveTimestamp, urgency, bundleId, threadId, contactId, rawIdentifier, isGroupMessage FROM notifications WHERE isActive=1 ORDER BY receiveTimestamp DESC LIMIT 100", 0, v4, v3 onPrep onRow onError];
}

uint64_t __69__ATXNotificationAndSuggestionDatabase_mostRecentActiveNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 getNSStringForColumnName:"uuid" table:0];
  id v6 = (void *)[v4 initWithUUIDString:v5];

  [v3 getDoubleForColumnName:"receiveTimestamp" table:0];
  double v8 = v7;
  uint64_t v9 = [v3 getIntegerForColumnName:"urgency" table:0];
  uint64_t v10 = [v3 getNSStringForColumnName:"bundleId" table:0];
  id v11 = [v3 getNSStringForColumnName:"threadId" table:0];
  SEL v12 = [v3 getNSStringForColumnName:"contactId" table:0];
  uint64_t v13 = [v3 getNSStringForColumnName:"rawIdentifier" table:0];
  uint64_t v14 = [v3 getIntegerForColumnName:"isGroupMessage" table:0];

  id v15 = objc_alloc(MEMORY[0x1E4F4B3F8]);
  if (v12)
  {
    v27[0] = v12;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  }
  else
  {
    uint64_t v16 = 0;
  }
  if (!v13)
  {
    LOBYTE(v24) = v14 == 1;
    id v22 = (void *)[v15 initFromNotificationData:v6 timestamp:0 title:0 subtitle:0 body:0 badge:0 userInfo:v8 bundleID:v10 threadID:v11 categoryID:0 sectionID:0 contactIDs:v16 rawIdentifiers:0 isGroupMessage:v24 derivedData:0 urgency:v9];
    if (!v12) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v17 = v11;
  id v18 = v10;
  int64_t v19 = v6;
  BOOL v20 = v14 == 1;
  id v26 = v13;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  LOBYTE(v24) = v20;
  id v6 = v19;
  uint64_t v10 = v18;
  id v11 = v17;
  id v22 = (void *)[v15 initFromNotificationData:v6 timestamp:0 title:0 subtitle:0 body:0 badge:0 userInfo:v8 bundleID:v10 threadID:v17 categoryID:0 sectionID:0 contactIDs:v16 rawIdentifiers:v21 isGroupMessage:v24 derivedData:0 urgency:v9];

  if (v12) {
LABEL_6:
  }

LABEL_7:
  [*(id *)(a1 + 32) addObject:v22];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __69__ATXNotificationAndSuggestionDatabase_mostRecentActiveNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)numProminentActiveNotificationsByGroupingColumn:(id)a3
{
  id v5 = (objc_class *)NSString;
  id v6 = a3;
  double v7 = (void *)[[v5 alloc] initWithFormat:@"    SELECT %@ as groupVal, uuid, MAX(receiveTimestamp), COUNT(*) as groupCount     FROM notifications     WHERE isActive=1 AND isProminent=1 AND groupVal IS NOT NULL     GROUP BY groupVal    LIMIT 1000    ", v6];

  double v8 = objc_opt_new();
  queue = self->super._queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__ATXNotificationAndSuggestionDatabase_numProminentActiveNotificationsByGroupingColumn___block_invoke;
  v15[3] = &unk_1E68AE970;
  v15[4] = self;
  id v16 = v7;
  id v10 = v8;
  id v17 = v10;
  SEL v18 = a2;
  id v11 = v7;
  dispatch_sync_notxn_0(queue, v15);
  SEL v12 = v17;
  id v13 = v10;

  return v13;
}

void __88__ATXNotificationAndSuggestionDatabase_numProminentActiveNotificationsByGroupingColumn___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__ATXNotificationAndSuggestionDatabase_numProminentActiveNotificationsByGroupingColumn___block_invoke_2;
  v5[3] = &unk_1E68AE948;
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__ATXNotificationAndSuggestionDatabase_numProminentActiveNotificationsByGroupingColumn___block_invoke_3;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v4[4] = *(void *)(a1 + 56);
  [v2 prepAndRunQuery:v3 onPrep:0 onRow:v5 onError:v4];
}

uint64_t __88__ATXNotificationAndSuggestionDatabase_numProminentActiveNotificationsByGroupingColumn___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnAlias:"groupVal"];
  id v5 = [v3 getNSStringForColumnName:"uuid" table:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
  uint64_t v7 = [v3 getIntegerForColumnAlias:"groupCount"];

  id v8 = objc_alloc(MEMORY[0x1E4F93BB8]);
  uint64_t v9 = [NSNumber numberWithInteger:v7];
  id v10 = (void *)[v8 initWithFirst:v9 second:v6];

  [*(id *)(a1 + 32) setObject:v10 forKey:v4];
  id v11 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v11;
}

uint64_t __88__ATXNotificationAndSuggestionDatabase_numProminentActiveNotificationsByGroupingColumn___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (void)numberOfActiveNotificationsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  queue = self->super._queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E68ACDB0;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_opt_new();
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__31;
  v11[4] = __Block_byref_object_dispose__31;
  id v12 = 0;
  id v3 = [*(id *)(a1 + 32) db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E68AE948;
  id v4 = v2;
  id v10 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E68AD2A0;
  uint64_t v5 = *(void *)(a1 + 48);
  void v8[4] = v11;
  void v8[5] = v5;
  char v6 = [v3 prepAndRunQuery:@"SELECT bundleId FROM notifications WHERE isActive = 1" onPrep:0 onRow:v9 onError:v8];

  if (v6)
  {
    [v4 count];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];
    [v7 count];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  _Block_object_dispose(v11, 8);
}

uint64_t __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumnAlias:"bundleId"];
  if ([v3 length]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

uint64_t __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  uint64_t v5 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke_3_cold_1();
  }

  char v6 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v6;
}

- (void)setAllNotificationsToClearedExceptProminent
{
  queue = self->super._queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__ATXNotificationAndSuggestionDatabase_setAllNotificationsToClearedExceptProminent__block_invoke;
  v3[3] = &unk_1E68AB818;
  void v3[4] = self;
  dispatch_sync_notxn_0(queue, v3);
}

void __83__ATXNotificationAndSuggestionDatabase_setAllNotificationsToClearedExceptProminent__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) db];
  [v1 prepAndRunQuery:@"UPDATE notifications SET latestOutcome = :latestOutcome, isActive = :isActive WHERE isProminent = :isProminent", &__block_literal_global_174, 0, &__block_literal_global_176 onPrep onRow onError];
}

void __83__ATXNotificationAndSuggestionDatabase_setAllNotificationsToClearedExceptProminent__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 bindNamedParam:":isActive" toInt64:0];
  [v2 bindNamedParam:":latestOutcome" toInteger:3];
  [v2 bindNamedParam:":isProminent" toInt64:0];
}

uint64_t __83__ATXNotificationAndSuggestionDatabase_setAllNotificationsToClearedExceptProminent__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __83__ATXNotificationAndSuggestionDatabase_setAllNotificationsToClearedExceptProminent__block_invoke_3_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v10;
}

- (void)setAllNotificationsToModified
{
  queue = self->super._queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__ATXNotificationAndSuggestionDatabase_setAllNotificationsToModified__block_invoke;
  v3[3] = &unk_1E68AB818;
  void v3[4] = self;
  dispatch_sync_notxn_0(queue, v3);
}

void __69__ATXNotificationAndSuggestionDatabase_setAllNotificationsToModified__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) db];
  [v1 prepAndRunQuery:@"UPDATE notifications SET latestOutcome = :latestOutcome, isActive = :isActive, isProminent = (isProminent & :isActive) WHERE isActive != :isActive ", &__block_literal_global_178, 0, &__block_literal_global_180 onPrep onRow onError];
}

void __69__ATXNotificationAndSuggestionDatabase_setAllNotificationsToModified__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 bindNamedParam:":isActive" toInt64:0];
  [v2 bindNamedParam:":latestOutcome" toInteger:18];
}

uint64_t __69__ATXNotificationAndSuggestionDatabase_setAllNotificationsToModified__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __69__ATXNotificationAndSuggestionDatabase_setAllNotificationsToModified__block_invoke_3_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v10;
}

- (id)currentActiveSuggestions
{
  uint64_t v4 = objc_opt_new();
  queue = self->super._queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke;
  v10[3] = &unk_1E68AE970;
  v10[4] = self;
  id v11 = @"    SELECT entityIdentifier, deliverySuggestion     FROM suggestions     WHERE isActive=1 LIMIT 1000";
  SEL v13 = a2;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync_notxn_0(queue, v10);
  uint64_t v7 = v12;
  id v8 = v6;

  return v8;
}

void __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke_2;
  v7[3] = &unk_1E68AE9B8;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v8 = v5;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke_187;
  v6[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v6[4] = *(void *)(a1 + 56);
  [v2 prepAndRunQuery:v3 onPrep:0 onRow:v7 onError:v6];
}

uint64_t __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnName:"entityIdentifier" table:0];
  if (v4)
  {
    long long v5 = [v3 getNSDataForColumnName:"deliverySuggestion" table:0];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F4B1B0]) initWithProtoData:v5];
    if (v6)
    {
      [*(id *)(a1 + 32) setObject:v6 forKey:v4];
    }
    else
    {
      id v10 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke_2_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    uint64_t v9 = *MEMORY[0x1E4F93C08];
  }
  else
  {
    uint64_t v7 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      long long v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v19 = 138412290;
      BOOL v20 = v8;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Encountered nil entityIdentifier in %@. Skipping result.", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v9 = *MEMORY[0x1E4F93C08];
  }

  return v9;
}

uint64_t __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke_187(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)getTopOfProminentStackNotificationsWithLimit:(unint64_t)a3
{
  id v6 = objc_opt_new();
  queue = self->super._queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke;
  v12[3] = &unk_1E68AE9E0;
  v12[4] = self;
  unint64_t v14 = a3;
  id v8 = v6;
  id v13 = v8;
  SEL v15 = a2;
  dispatch_sync_notxn_0(queue, v12);
  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_2;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v6[4] = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_3;
  v4[3] = &unk_1E68AE948;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_4;
  v3[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v3[4] = *(void *)(a1 + 56);
  [v2 prepAndRunQuery:@"SELECT     bundleId, threadId, MAX(receiveTimestamp) AS receiveTimestamp, uuid, contactId, urgency, isMessage, isGroupMessage FROM notifications WHERE     isActive = 1 AND     isProminent = 1 GROUP BY     bundleId, threadId ORDER BY     receiveTimestamp DESC LIMIT     :numStacksLimit ", v6, v4, v3 onPrep onRow onError];
}

uint64_t __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":numStacksLimit" toInt64:*(void *)(a1 + 32)];
}

uint64_t __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_3(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnAlias:"bundleId"];
  id v5 = [v3 getNSStringForColumnAlias:"threadId"];
  [v3 getDoubleForColumnAlias:"receiveTimestamp"];
  double v7 = v6;
  id v8 = [v3 getNSStringForColumnAlias:"uuid"];
  uint64_t v9 = [v3 getNSStringForColumnAlias:"contactId"];
  uint64_t v10 = [v3 getIntegerForColumnAlias:"urgency"];
  uint64_t v11 = [v3 getIntegerForColumnAlias:"isMessage"];
  uint64_t v12 = [v3 getIntegerForColumnAlias:"isGroupMessage"];

  id v13 = objc_alloc(MEMORY[0x1E4F4B3F8]);
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
  SEL v15 = (void *)[v13 initWithUUID:v14 timestamp:v7];

  [v15 setBundleID:v4];
  [v15 setThreadID:v5];
  if (v9)
  {
    v18[0] = v9;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v15 setContactIDs:v16];
  }
  [v15 setUrgency:v10];
  [v15 setIsMessage:v11 != 0];
  [v15 setIsGroupMessage:v12 != 0];
  [*(id *)(a1 + 32) addObject:v15];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)getTopOfNonProminentStackNotificationsWithLimit:(unint64_t)a3
{
  double v6 = objc_opt_new();
  queue = self->super._queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke;
  v12[3] = &unk_1E68AE9E0;
  v12[4] = self;
  unint64_t v14 = a3;
  id v8 = v6;
  id v13 = v8;
  SEL v15 = a2;
  dispatch_sync_notxn_0(queue, v12);
  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke_2;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v6[4] = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke_3;
  v4[3] = &unk_1E68AE948;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke_4;
  v3[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v3[4] = *(void *)(a1 + 56);
  [v2 prepAndRunQuery:@"SELECT     bundleId, threadId, MAX(receiveTimestamp) AS receiveTimestamp, uuid, contactId, urgency, isMessage, isGroupMessage FROM notifications WHERE     isActive = 1 AND     isProminent = 0 GROUP BY     bundleId, threadId ORDER BY     receiveTimestamp DESC LIMIT     :numStacksLimit ", v6, v4, v3 onPrep onRow onError];
}

uint64_t __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":numStacksLimit" toInt64:*(void *)(a1 + 32)];
}

uint64_t __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke_3(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnAlias:"bundleId"];
  id v5 = [v3 getNSStringForColumnAlias:"threadId"];
  [v3 getDoubleForColumnAlias:"receiveTimestamp"];
  double v7 = v6;
  id v8 = [v3 getNSStringForColumnAlias:"uuid"];
  uint64_t v9 = [v3 getNSStringForColumnAlias:"contactId"];
  uint64_t v10 = [v3 getIntegerForColumnAlias:"urgency"];
  uint64_t v11 = [v3 getIntegerForColumnAlias:"isMessage"];
  uint64_t v12 = [v3 getIntegerForColumnAlias:"isGroupMessage"];

  id v13 = objc_alloc(MEMORY[0x1E4F4B3F8]);
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
  SEL v15 = (void *)[v13 initWithUUID:v14 timestamp:v7];

  [v15 setBundleID:v4];
  [v15 setThreadID:v5];
  if (v9)
  {
    v18[0] = v9;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v15 setContactIDs:v16];
  }
  [v15 setUrgency:v10];
  [v15 setIsMessage:v11 != 0];
  [v15 setIsGroupMessage:v12 != 0];
  [*(id *)(a1 + 32) addObject:v15];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)getSmartPauseFeaturesForBundleIds:(id)a3 sinceTimestamp:(double)a4 positiveEngagementEnums:(id)a5
{
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = objc_opt_new();
  uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v9) {
    id v13 = v9;
  }
  else {
    id v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v14 = v13;

  if (v10) {
    SEL v15 = v10;
  }
  else {
    SEL v15 = v12;
  }
  id v16 = v15;

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v18 = v17 + -300.0;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v20 = v19 + -3600.0;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v22 = v21 + -86400.0;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  queue = self->super._queue;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke;
  v31[3] = &unk_1E68AEA30;
  double v35 = v18;
  double v36 = v20;
  double v37 = v22;
  double v38 = v24 + -604800.0;
  double v39 = a4;
  v31[4] = self;
  id v32 = v14;
  id v33 = v16;
  id v25 = v11;
  id v34 = v25;
  SEL v40 = a2;
  id v26 = v16;
  id v27 = v14;
  dispatch_sync_notxn_0(queue, v31);
  id v28 = v34;
  id v29 = v25;

  return v29;
}

void __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke_2;
  v7[3] = &unk_1E68AEA08;
  long long v3 = *(_OWORD *)(a1 + 80);
  long long v10 = *(_OWORD *)(a1 + 64);
  long long v11 = v3;
  uint64_t v12 = *(void *)(a1 + 96);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke_3;
  v5[3] = &unk_1E68AE948;
  id v6 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke_4;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v4[4] = *(void *)(a1 + 104);
  [v2 prepAndRunQuery:@"SELECT bundleId, threadId, SUM(IIF(notifications.receiveTimestamp > :lastFiveMinutesTimestamp, 1, 0)) AS lastFiveMinutesNotifications, SUM(IIF(notifications.receiveTimestamp > :lastFiveMinutesTimestamp AND latestOutcome IN _pas_nsarray(:positiveEngagementOutcomes), 1, 0)) AS lastFiveMinutesPositiveEngagements, SUM(IIF(notifications.receiveTimestamp > :lastHourTimestamp, 1, 0)) AS lastHourNotifications, SUM(IIF(notifications.receiveTimestamp > :lastHourTimestamp AND latestOutcome IN _pas_nsarray(:positiveEngagementOutcomes), 1, 0)) AS lastHourPositiveEngagements, SUM(IIF(notifications.receiveTimestamp > :lastDayTimestamp, 1, 0)) AS lastDayNotifications, SUM(IIF(notifications.receiveTimestamp > :lastDayTimestamp AND latestOutcome IN _pas_nsarray(:positiveEngagementOutcomes), 1, 0)) AS lastDayPositiveEngagements, SUM(IIF(notifications.receiveTimestamp > :lastWeekTimestamp, 1, 0)) AS lastWeekNotifications, SUM(IIF(notifications.receiveTimestamp > :lastWeekTimestamp AND latestOutcome IN _pas_nsarray(:positiveEngagementOutcomes), 1, 0)) AS lastWeekPositiveEngagements, SUM(IIF(notifications.receiveTimestamp > :cutoffTimestamp, 1, 0)) AS allNotifications, SUM(IIF(notifications.receiveTimestamp > :cutoffTimestamp AND latestOutcome IN _pas_nsarray(:positiveEngagementOutcomes), 1, 0)) AS allPositiveEngagements FROM notifications WHERE bundleId IN _pas_nsarray(:candidateNotificationBundleIds) AND receiveTimestamp > :cutoffTimestamp GROUP BY bundleId, threadId ", v7, v5, v4 onPrep onRow onError];
}

void __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 48);
  id v4 = a2;
  [v4 bindNamedParam:":lastFiveMinutesTimestamp" toDouble:v3];
  [v4 bindNamedParam:":lastHourTimestamp" toDouble:*(double *)(a1 + 56)];
  [v4 bindNamedParam:":lastDayTimestamp" toDouble:*(double *)(a1 + 64)];
  [v4 bindNamedParam:":lastWeekTimestamp" toDouble:*(double *)(a1 + 72)];
  [v4 bindNamedParam:":cutoffTimestamp" toDouble:*(double *)(a1 + 80)];
  [v4 bindNamedParam:":positiveEngagementOutcomes" toNSArray:*(void *)(a1 + 32)];
  [v4 bindNamedParam:":candidateNotificationBundleIds" toNSArray:*(void *)(a1 + 40)];
}

uint64_t __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnAlias:"bundleId"];
  id v5 = [v3 getNSStringForColumnAlias:"threadId"];
  id v6 = [[ATXSmartPauseDatabaseQueryResult alloc] initWithBundleId:v4 threadId:v5];
  -[ATXSmartPauseDatabaseQueryResult setCountLastFiveMinutesNotifications:](v6, "setCountLastFiveMinutesNotifications:", [v3 getIntegerForColumnAlias:"lastFiveMinutesNotifications"]);
  -[ATXSmartPauseDatabaseQueryResult setCountLastFiveMinutesPositiveEngagements:](v6, "setCountLastFiveMinutesPositiveEngagements:", [v3 getIntegerForColumnAlias:"lastFiveMinutesPositiveEngagements"]);
  -[ATXSmartPauseDatabaseQueryResult setCountLastHourNotifications:](v6, "setCountLastHourNotifications:", [v3 getIntegerForColumnAlias:"lastHourNotifications"]);
  -[ATXSmartPauseDatabaseQueryResult setCountLastHourPositiveEngagements:](v6, "setCountLastHourPositiveEngagements:", [v3 getIntegerForColumnAlias:"lastHourPositiveEngagements"]);
  -[ATXSmartPauseDatabaseQueryResult setCountLastDayNotifications:](v6, "setCountLastDayNotifications:", [v3 getIntegerForColumnAlias:"lastDayNotifications"]);
  -[ATXSmartPauseDatabaseQueryResult setCountLastDayPositiveEngagements:](v6, "setCountLastDayPositiveEngagements:", [v3 getIntegerForColumnAlias:"lastDayPositiveEngagements"]);
  -[ATXSmartPauseDatabaseQueryResult setCountLastWeekNotifications:](v6, "setCountLastWeekNotifications:", [v3 getIntegerForColumnAlias:"lastWeekNotifications"]);
  -[ATXSmartPauseDatabaseQueryResult setCountLastWeekPositiveEngagements:](v6, "setCountLastWeekPositiveEngagements:", [v3 getIntegerForColumnAlias:"lastWeekPositiveEngagements"]);
  -[ATXSmartPauseDatabaseQueryResult setCountNotifications:](v6, "setCountNotifications:", [v3 getIntegerForColumnAlias:"allNotifications"]);
  uint64_t v7 = [v3 getIntegerForColumnAlias:"allPositiveEngagements"];

  [(ATXSmartPauseDatabaseQueryResult *)v6 setCountPositiveEngagements:v7];
  [*(id *)(a1 + 32) addObject:v6];
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v8;
}

uint64_t __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)allNotificationsBetweenStartTimestamp:(id)a3 endTimestamp:(id)a4 limit:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  long long v11 = objc_opt_new();
  queue = self->super._queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke;
  v19[3] = &unk_1E68AEA80;
  v19[4] = self;
  id v20 = v9;
  id v21 = v10;
  unint64_t v23 = a5;
  id v13 = v11;
  id v22 = v13;
  SEL v24 = a2;
  id v14 = v10;
  id v15 = v9;
  dispatch_sync_notxn_0(queue, v19);
  id v16 = v22;
  id v17 = v13;

  return v17;
}

void __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke_2;
  v8[3] = &unk_1E68AEA58;
  id v9 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  id v10 = v3;
  uint64_t v11 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke_3;
  v6[3] = &unk_1E68AE948;
  id v7 = *(id *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke_4;
  v5[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v5[4] = *(void *)(a1 + 72);
  [v2 prepAndRunQuery:@"SELECT uuid, receiveTimestamp, urgency, bundleId, threadId, contactId, rawIdentifier, isGroupMessage, isMessage   FROM notifications   WHERE receiveTimestamp > :startTimestamp AND receiveTimestamp < :endTimestamp   LIMIT :limit", v8, v6, v5 onPrep onRow onError];
}

void __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":startTimestamp");
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":endTimestamp");
  [v4 bindNamedParam:":limit" toInt64:*(void *)(a1 + 48)];
}

uint64_t __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke_3(uint64_t a1, void *a2)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 getNSStringForColumnAlias:"uuid"];
  id v7 = (void *)[v5 initWithUUIDString:v6];

  [v4 getDoubleForColumnAlias:"receiveTimestamp"];
  double v9 = v8;
  uint64_t v10 = [v4 getIntegerForColumnAlias:"urgency"];
  uint64_t v11 = [v4 getNSStringForColumnAlias:"bundleId"];
  uint64_t v12 = [v4 getNSStringForColumnAlias:"threadId"];
  id v13 = [v4 getNSStringForColumnAlias:"contactId"];
  uint64_t v14 = [v4 getIntegerForColumnAlias:"isGroupMessage"];
  uint64_t v15 = [v4 getIntegerForColumnAlias:"isMessage"];

  id v16 = objc_alloc(MEMORY[0x1E4F4B3F8]);
  id v17 = v16;
  if (v13)
  {
    BOOL v18 = v14 == 1;
    v23[0] = v13;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    LOBYTE(v22) = v18;
    id v20 = (void *)[v17 initFromNotificationData:v7 timestamp:0 title:0 subtitle:0 body:0 badge:0 userInfo:v9 bundleID:v11 threadID:v12 sectionID:0 contactIDs:v19 isGroupMessage:v22 derivedData:0 urgency:v10];
  }
  else
  {
    LOBYTE(v22) = v14 == 1;
    id v20 = (void *)[v16 initFromNotificationData:v7 timestamp:0 title:0 subtitle:0 body:0 badge:0 userInfo:v9 bundleID:v11 threadID:v12 sectionID:0 contactIDs:MEMORY[0x1E4F1CBF0] isGroupMessage:v22 derivedData:0 urgency:v10];
  }
  [v20 setIsMessage:v15 == 1];
  [*(id *)(a1 + 32) addObject:v20];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)notificationsReceivedPerBundleIdSinceDate:(id)a3
{
  id v5 = a3;
  id v6 = objc_opt_new();
  queue = self->super._queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke;
  v13[3] = &unk_1E68AE970;
  v13[4] = self;
  id v14 = v5;
  id v8 = v6;
  id v15 = v8;
  SEL v16 = a2;
  id v9 = v5;
  dispatch_sync_notxn_0(queue, v13);
  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

void __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke_2;
  v6[3] = &unk_1E68AD200;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke_3;
  v4[3] = &unk_1E68AE948;
  id v5 = *(id *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke_4;
  v3[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v3[4] = *(void *)(a1 + 56);
  [v2 prepAndRunQuery:@"SELECT count(*) AS received, bundleId FROM notifications WHERE receiveTimestamp > :startTimestamp GROUP BY bundleId", v6, v4, v3 onPrep onRow onError];
}

void __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":startTimestamp");
}

uint64_t __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnAlias:"bundleId"];
  id v5 = NSNumber;
  uint64_t v6 = [v3 getIntegerForColumnAlias:"received"];

  id v7 = [v5 numberWithInteger:v6];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v4];
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v8;
}

uint64_t __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)resolutionsForNotifications:(id)a3
{
  id v5 = [a3 allObjects];
  uint64_t v6 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_212);
  id v7 = (void *)v6;
  id v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    id v8 = (void *)v6;
  }
  id v9 = v8;

  uint64_t v10 = objc_opt_new();
  queue = self->super._queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_2;
  v17[3] = &unk_1E68AE970;
  v17[4] = self;
  id v18 = v9;
  id v12 = v10;
  id v19 = v12;
  SEL v20 = a2;
  id v13 = v9;
  dispatch_sync_notxn_0(queue, v17);
  id v14 = v19;
  id v15 = v12;

  return v15;
}

uint64_t __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

void __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_3;
  v6[3] = &unk_1E68AD200;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_4;
  v4[3] = &unk_1E68AE948;
  id v5 = *(id *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_5;
  v3[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v3[4] = *(void *)(a1 + 56);
  [v2 prepAndRunQuery:@"SELECT uuid, numExpansions, latestOutcome, latestOutcomeTimestamp FROM notifications WHERE uuid IN _pas_nsarray(:notificationUUIDs) LIMIT :limit", v6, v4, v3 onPrep onRow onError];
}

void __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 bindNamedParam:":notificationUUIDs" toNSArray:v2];
  [v3 bindNamedParam:":limit" toInt64:1000];
}

uint64_t __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 getNSStringForColumnAlias:"uuid"];
  id v7 = (void *)[v5 initWithUUIDString:v6];

  [v4 getDoubleForColumnAlias:"latestOutcomeTimestamp"];
  id v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v9 = [v4 getInt64ForColumnAlias:"numExpansions"];
  unint64_t v10 = [v4 getIntegerForColumnAlias:"latestOutcome"];

  id v11 = [[ATXUserNotificationResolution alloc] initWithNotificationUUID:v7 numExpansions:v9 resolutionType:ATXUserNotificationResolutionTypeForNotificationEventType(v10) resolutionTimestamp:v8];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v7];
  id v12 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v12;
}

uint64_t __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_5_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)_countNotificationsPerAppWithFilters:(id)a3 stmtBinder:(id)a4
{
  id v7 = a4;
  id v8 = [a3 componentsJoinedByString:@" AND "];
  uint64_t v9 = [NSString stringWithFormat:@"SELECT bundleId, COUNT(*) AS numNotifications FROM notifications WHERE %@ GROUP BY bundleId LIMIT :numRowsLimit", v8];
  unint64_t v10 = objc_opt_new();
  queue = self->super._queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke;
  v18[3] = &unk_1E68AEAD0;
  v18[4] = self;
  id v19 = v9;
  id v21 = v7;
  id v12 = v10;
  id v20 = v12;
  SEL v22 = a2;
  id v13 = v7;
  id v14 = v9;
  dispatch_sync_notxn_0(queue, v18);
  id v15 = v20;
  id v16 = v12;

  return v16;
}

void __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_2;
  v7[3] = &unk_1E68AEAA8;
  id v8 = *(id *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_3;
  v5[3] = &unk_1E68AE948;
  id v6 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_4;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v4[4] = *(void *)(a1 + 64);
  [v2 prepAndRunQuery:v3 onPrep:v7 onRow:v5 onError:v4];
}

void __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void (**)(uint64_t, id))(v2 + 16);
  id v4 = a2;
  v3(v2, v4);
  [v4 bindNamedParam:":numRowsLimit" toInt64:1000];
}

uint64_t __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnAlias:"bundleId"];
  id v5 = [v3 getInt64AsNSNumberForColumnAlias:"numNotifications"];

  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
  id v6 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v6;
}

uint64_t __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)messageNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__ATXNotificationAndSuggestionDatabase_messageNotificationsPerAppFromStartTime_toEndTime___block_invoke;
  v8[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&void v8[4] = a3;
  *(double *)&void v8[5] = a4;
  id v5 = _Block_copy(v8);
  id v6 = [(ATXNotificationAndSuggestionDatabase *)self _countNotificationsPerAppWithFilters:&unk_1F27F2B98 stmtBinder:v5];

  return v6;
}

void __90__ATXNotificationAndSuggestionDatabase_messageNotificationsPerAppFromStartTime_toEndTime___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":startTime" toDouble:v3];
  [v4 bindNamedParam:":endTime" toDouble:*(double *)(a1 + 40)];
}

- (id)timeSensitiveNonmessageNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __106__ATXNotificationAndSuggestionDatabase_timeSensitiveNonmessageNotificationsPerAppFromStartTime_toEndTime___block_invoke;
  v8[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&void v8[4] = a3;
  *(double *)&void v8[5] = a4;
  id v5 = _Block_copy(v8);
  id v6 = [(ATXNotificationAndSuggestionDatabase *)self _countNotificationsPerAppWithFilters:&unk_1F27F2BB0 stmtBinder:v5];

  return v6;
}

void __106__ATXNotificationAndSuggestionDatabase_timeSensitiveNonmessageNotificationsPerAppFromStartTime_toEndTime___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":startTime" toDouble:v3];
  [v4 bindNamedParam:":endTime" toDouble:*(double *)(a1 + 40)];
  [v4 bindNamedParam:":timeSensitiveUrgency" toInt64:1];
}

- (id)totalNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__ATXNotificationAndSuggestionDatabase_totalNotificationsPerAppFromStartTime_toEndTime___block_invoke;
  v8[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&void v8[4] = a3;
  *(double *)&void v8[5] = a4;
  id v5 = _Block_copy(v8);
  id v6 = [(ATXNotificationAndSuggestionDatabase *)self _countNotificationsPerAppWithFilters:&unk_1F27F2BC8 stmtBinder:v5];

  return v6;
}

void __88__ATXNotificationAndSuggestionDatabase_totalNotificationsPerAppFromStartTime_toEndTime___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":startTime" toDouble:v3];
  [v4 bindNamedParam:":endTime" toDouble:*(double *)(a1 + 40)];
}

- (id)appSortedByNumOfNotificationsSinceTimestamp:(double)a3
{
  id v6 = objc_opt_new();
  queue = self->super._queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke;
  v12[3] = &unk_1E68AE9E0;
  v12[4] = self;
  double v14 = a3;
  id v8 = v6;
  id v13 = v8;
  SEL v15 = a2;
  dispatch_sync_notxn_0(queue, v12);
  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke_2;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v6[4] = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke_3;
  v4[3] = &unk_1E68AE948;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke_4;
  v3[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v3[4] = *(void *)(a1 + 56);
  [v2 prepAndRunQuery:@"SELECT bundleId, SUM(IIF(isMessage = 0 AND urgency != :urgency, 1, 0)) AS numBasicNotifications, SUM(IIF(isMessage = 1, 1, 0)) AS numMessageNotifications, SUM(IIF(isMessage = 0 AND urgency = :urgency, 1, 0)) AS numTimeSenstiveNonMessageNotifications FROM notifications WHERE receiveTimestamp >= :startTime GROUP BY bundleId ORDER BY numBasicNotifications DESC", v6, v4, v3 onPrep onRow onError];
}

void __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 32);
  id v3 = a2;
  [v3 bindNamedParam:":startTime" toDouble:v2];
  [v3 bindNamedParam:":urgency" toInteger:1];
}

uint64_t __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnAlias:"bundleId"];
  uint64_t v5 = [v3 getIntegerForColumnAlias:"numBasicNotifications"];
  uint64_t v6 = [v3 getIntegerForColumnAlias:"numMessageNotifications"];
  uint64_t v7 = [v3 getIntegerForColumnAlias:"numTimeSenstiveNonMessageNotifications"];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F4AEA8]) initWithBundleId:v4 numBasicNotifications:v5 numMessageNotifications:v6 numTimeSenstiveNonMessageNotifications:v7];
  [*(id *)(a1 + 32) addObject:v8];
  uint64_t v9 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v9;
}

uint64_t __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_5_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (double)receiveTimeStampOfFirstNotification
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  queue = self->super._queue;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke;
  v5[3] = &unk_1E68AD2C8;
  void v5[4] = self;
  void v5[5] = &v6;
  v5[6] = a2;
  dispatch_sync_notxn_0(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke_2;
  v4[3] = &unk_1E68AD228;
  void v4[4] = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke_3;
  v3[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v3[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT receiveTimestamp FROM notifications WHERE receiveTimestamp != 0 ORDER BY receiveTimestamp ASC LIMIT 1" onPrep:0 onRow:v4 onError:v3];
}

uint64_t __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke_2(uint64_t a1, void *a2)
{
  [a2 getDoubleForColumnAlias:"receiveTimestamp"];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  return *MEMORY[0x1E4F93C10];
}

uint64_t __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)allNotificationsFromBundleId:(id)a3 sinceTimestamp:(double)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  queue = self->super._queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke;
  v14[3] = &unk_1E68AE970;
  double v17 = a4;
  v14[4] = self;
  id v15 = v6;
  id v9 = v7;
  id v16 = v9;
  id v10 = v6;
  dispatch_sync_notxn_0(queue, v14);
  id v11 = v16;
  id v12 = v9;

  return v12;
}

void __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_2;
  v7[3] = &unk_1E68AE780;
  uint64_t v9 = *(void *)(a1 + 56);
  id v8 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_3;
  v5[3] = &unk_1E68AE948;
  id v6 = *(id *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_259;
  v3[3] = &unk_1E68AD250;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT uuid, isActive FROM notifications WHERE receiveTimestamp > :timestamp and bundleId == :bundleId ORDER BY receiveTimestamp ASC", v7, v5, v3 onPrep onRow onError];
}

void __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":timestamp" toDouble:v3];
  [v4 bindNamedParam:":bundleId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnAlias:"uuid"];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
  if (!v5)
  {
    id v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_3_cold_1();
    }
  }
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumnAlias:", "isActive"));
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v5 second:v7];
  [v8 addObject:v9];

  id v10 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v10;
}

uint64_t __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_259(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_259_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)allBundleIdsOfNotificationsOnLockscreen
{
  id v3 = objc_opt_new();
  queue = self->super._queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke;
  v9[3] = &unk_1E68AB870;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync_notxn_0(queue, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_3;
  v3[3] = &unk_1E68AE948;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT DISTINCT bundleId FROM notifications WHERE isActive = 1 AND receiveTimestamp > :cutoff AND latestOutcome IN (:receivedAndDeliveredProminently, :receivedAndDeliveredNonprominently) ORDER BY receiveTimestamp LIMIT 100", &__block_literal_global_265, v3, &__block_literal_global_271 onPrep onRow onError];
}

void __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindNamedParam:":receivedAndDeliveredProminently" toInteger:16];
  [v3 bindNamedParam:":receivedAndDeliveredNonprominently" toInteger:17];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [v3 bindNamedParam:":cutoff" toDouble:v2 + -86400.0];
}

uint64_t __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumnAlias:"bundleId"];
  if (v3)
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
  else
  {
    id v4 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_3_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  id v12 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v12;
}

uint64_t __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_269(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_269_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)deleteAllData
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__31;
  queue = self->super._queue;
  uint64_t v10 = __Block_byref_object_dispose__31;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke;
  v5[3] = &unk_1E68AD2C8;
  void v5[4] = self;
  void v5[5] = &v6;
  v5[6] = a2;
  dispatch_sync_notxn_0(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_2;
  v9[3] = &unk_1E68AD2A0;
  long long v10 = *(_OWORD *)(a1 + 40);
  [v2 prepAndRunQuery:@"DELETE FROM suggestions" onPrep:0 onRow:0 onError:v9];

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v3 = [*(id *)(a1 + 32) db];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_272;
    v7[3] = &unk_1E68AD2A0;
    long long v8 = *(_OWORD *)(a1 + 40);
    [v3 prepAndRunQuery:@"DELETE FROM notifications" onPrep:0 onRow:0 onError:v7];

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v4 = [*(id *)(a1 + 32) db];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_273;
      v5[3] = &unk_1E68AD2A0;
      long long v6 = *(_OWORD *)(a1 + 40);
      [v4 prepAndRunQuery:@"DELETE FROM biome_bookmark" onPrep:0 onRow:0 onError:v5];
    }
  }
}

uint64_t __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_2_cold_1();
  }

  long long v8 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v8;
}

uint64_t __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_272(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_272_cold_1();
  }

  long long v8 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v8;
}

uint64_t __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_273(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_273_cold_1();
  }

  long long v8 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v8;
}

- (id)pruneNotificationsBeforeTimestamp:(double)a3
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__31;
  id v11 = __Block_byref_object_dispose__31;
  id v12 = 0;
  queue = self->super._queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke;
  v6[3] = &unk_1E68AEAF8;
  *(double *)&v6[6] = a3;
  void v6[4] = self;
  void v6[5] = &v7;
  v6[7] = a2;
  dispatch_sync_notxn_0(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke_2;
  v5[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v5[4] = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke_3;
  v4[3] = &unk_1E68AD2A0;
  uint64_t v3 = *(void *)(a1 + 56);
  void v4[4] = *(void *)(a1 + 40);
  void v4[5] = v3;
  [v2 prepAndRunQuery:@"DELETE FROM notifications WHERE bundleId != :excludeBundleId AND (receiveTimestamp < :deletionCutoffTimestamp OR receiveTimestamp > :nowTimestamp)" onPrep:v5 onRow:0 onError:v4];
}

void __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":deletionCutoffTimestamp" toDouble:v2];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
  [v3 timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":nowTimestamp");

  [v4 bindNamedParam:":excludeBundleId" toNonnullNSString:@"com.apple.tips"];
}

uint64_t __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke_3_cold_1();
  }

  long long v8 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v8;
}

- (id)pruneSuggestionsBeforeTimestamp:(double)a3
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__31;
  id v11 = __Block_byref_object_dispose__31;
  id v12 = 0;
  queue = self->super._queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke;
  v6[3] = &unk_1E68AEAF8;
  *(double *)&v6[6] = a3;
  void v6[4] = self;
  void v6[5] = &v7;
  v6[7] = a2;
  dispatch_sync_notxn_0(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke_2;
  v5[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v5[4] = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke_3;
  v4[3] = &unk_1E68AD2A0;
  uint64_t v3 = *(void *)(a1 + 56);
  void v4[4] = *(void *)(a1 + 40);
  void v4[5] = v3;
  [v2 prepAndRunQuery:@"DELETE FROM suggestions WHERE createdTimestamp < :deletionCutoffTimestamp" onPrep:v5 onRow:0 onError:v4];
}

uint64_t __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":deletionCutoffTimestamp" toDouble:*(double *)(a1 + 32)];
}

uint64_t __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke_3_cold_1();
  }

  long long v8 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v8;
}

- (void)pruneNotificationsBasedOnHardLimitsWithXPCActivity:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  queue = self->super._queue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  long long v10 = __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke;
  id v11 = &unk_1E68AB870;
  id v12 = self;
  id v6 = v4;
  id v13 = v6;
  dispatch_sync_notxn_0(queue, &v8);
  if (objc_msgSend(v6, "didDefer", v8, v9, v10, v11, v12))
  {
    uint64_t v7 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[ATXNotificationAndSuggestionDatabase pruneNotificationsBasedOnHardLimitsWithXPCActivity:]";
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%s: XPC Activity deferred, skipping remaining work.", buf, 0xCu);
    }
  }
  else
  {
    [(ATXNotificationAndSuggestionDatabase *)self analyze];
  }
}

void __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v38 = 0;
  double v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__31;
  v42 = __Block_byref_object_dispose__31;
  id v43 = 0;
  double v2 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[ATXNotificationAndSuggestionDatabase pruneNotificationsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "%s: Pruning notifications", buf, 0xCu);
  }

  id v3 = objc_opt_new();
  id v4 = [*(id *)(a1 + 32) db];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_283;
  v36[3] = &unk_1E68AE948;
  id v5 = v3;
  id v37 = v5;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_2;
  v35[3] = &unk_1E68AEB20;
  v35[4] = &v38;
  [v4 prepAndRunQuery:@"SELECT DISTINCT bundleId FROM notifications GROUP BY bundleId ORDER BY count(*) DESC " onPrep:0 onRow:v36 onError:v35];

  if (v39[5] && ![v5 count])
  {
    uint64_t v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_cold_2(v9, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  else
  {
    id v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_cold_1();
    }

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v8 = v7;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v48 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v32;
LABEL_9:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * v12);
        double v14 = (void *)MEMORY[0x1D25F6CC0]();
        [*(id *)(a1 + 32) _pruneNotificationsBasedOnHardLimitsForBundleId:v13 XPCActivity:*(void *)(a1 + 40)];
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        if (v15 - v8 > 5.0 && [*(id *)(a1 + 40) didDefer])
        {
          uint64_t v16 = __atxlog_handle_notification_management();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v45 = "-[ATXNotificationAndSuggestionDatabase pruneNotificationsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
            _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "%s: XPC Activity deferred, skipping remaining work.", buf, 0xCu);
          }

          int v17 = 0;
        }
        else
        {
          int v17 = 1;
        }
        if (!v17) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v48 count:16];
          if (v10) {
            goto LABEL_9;
          }
          goto LABEL_21;
        }
      }
    }
    else
    {
LABEL_21:

      uint64_t v18 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "ATXNotificationAndSuggestionDatabase_maxNumberOfNotifications");
      id v19 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "-[ATXNotificationAndSuggestionDatabase pruneNotificationsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
        __int16 v46 = 2048;
        uint64_t v47 = v18;
        _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "%s: Pruning notifications table to max %ld rows", buf, 0x16u);
      }

      id v20 = *(id **)(a1 + 32);
      uint64_t v21 = objc_msgSend(v20[5], "ATXNotificationAndSuggestionDatabase_pruningBatchSize");
      uint64_t v22 = *(void *)(a1 + 40);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_287;
      v30[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
      v30[4] = v18;
      [v20 prepAndRunQuery:@"DELETE FROM notifications RETURNING 1 ORDER BY receiveTimestamp DESC LIMIT :batchSize OFFSET :maxNumberOfNotifications " batchSize:v21 XPCActivity:v22 onPrep:v30 onRow:0 onError:&__block_literal_global_291];
      uint64_t v9 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[ATXNotificationAndSuggestionDatabase pruneNotificationsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
        _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "%s: Finished pruning notifications", buf, 0xCu);
      }
    }
  }

  _Block_object_dispose(&v38, 8);
}

uint64_t __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_283(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumnAlias:"bundleId"];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

uint64_t __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  double v7 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_2_cold_1();
  }

  double v8 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v8;
}

uint64_t __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_287(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":maxNumberOfNotifications" toInteger:*(void *)(a1 + 32)];
}

uint64_t __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_2_289(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_2_289_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (void)prepAndRunQuery:(id)a3 batchSize:(int64_t)a4 XPCActivity:(id)a5 onPrep:(id)a6 onRow:(id)a7 onError:(id)a8
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v35 = a5;
  id v12 = a6;
  id v13 = a7;
  id v39 = a8;
  double v14 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    [(ATXNotificationAndSuggestionDatabase *)a4 prepAndRunQuery:v15 batchSize:v16 XPCActivity:v17 onPrep:v18 onRow:v19 onError:v20];
  }

  uint64_t v21 = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v23 = v22;
  uint64_t v24 = 1000;
  do
  {
    uint64_t v25 = (void *)MEMORY[0x1D25F6CC0](v21);
    *(void *)v50 = 0;
    *(void *)&v50[8] = v50;
    *(void *)&v50[16] = 0x2020000000;
    int v51 = 0;
    uint64_t v26 = [(ATXAbstractVersionedDatabase *)self db];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __99__ATXNotificationAndSuggestionDatabase_prepAndRunQuery_batchSize_XPCActivity_onPrep_onRow_onError___block_invoke;
    v43[3] = &unk_1E68AEB48;
    id v27 = v12;
    id v44 = v27;
    int64_t v45 = a4;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    void v40[2] = __99__ATXNotificationAndSuggestionDatabase_prepAndRunQuery_batchSize_XPCActivity_onPrep_onRow_onError___block_invoke_2;
    v40[3] = &unk_1E68AEB70;
    id v28 = v13;
    id v41 = v28;
    v42 = v50;
    [v26 prepAndRunQuery:v38 onPrep:v43 onRow:v40 onError:v39];

    if (!*(_DWORD *)(*(void *)&v50[8] + 24))
    {
      long long v32 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[ATXNotificationAndSuggestionDatabase prepAndRunQuery:batchSize:XPCActivity:onPrep:onRow:onError:](v32);
      }
      goto LABEL_18;
    }
    uint64_t v29 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      int v31 = *(_DWORD *)(*(void *)&v50[8] + 24);
      *(_DWORD *)buf = 136315394;
      uint64_t v47 = "-[ATXNotificationAndSuggestionDatabase prepAndRunQuery:batchSize:XPCActivity:onPrep:onRow:onError:]";
      __int16 v48 = 1024;
      int v49 = v31;
      _os_log_debug_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEBUG, "%s: Deleted %d rows", buf, 0x12u);
    }

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    if (v30 - v23 > 5.0 && [v35 didDefer])
    {
      long long v32 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v47 = "-[ATXNotificationAndSuggestionDatabase prepAndRunQuery:batchSize:XPCActivity:onPrep:onRow:onError:]";
        _os_log_impl(&dword_1D0FA3000, v32, OS_LOG_TYPE_DEFAULT, "%s: XPC deferral, unable to finish batched deletion", buf, 0xCu);
      }
LABEL_18:

      _Block_object_dispose(v50, 8);
      goto LABEL_19;
    }

    _Block_object_dispose(v50, 8);
    --v24;
  }
  while (v24);
  long long v33 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v50 = 136315394;
    *(void *)&v50[4] = "-[ATXNotificationAndSuggestionDatabase prepAndRunQuery:batchSize:XPCActivity:onPrep:onRow:onError:]";
    *(_WORD *)&v50[12] = 2048;
    *(void *)&v50[14] = 1000 * a4;
    _os_log_impl(&dword_1D0FA3000, v33, OS_LOG_TYPE_DEFAULT, "%s: Reached maximum number of rows to delete: %ld", v50, 0x16u);
  }

LABEL_19:
}

void __99__ATXNotificationAndSuggestionDatabase_prepAndRunQuery_batchSize_XPCActivity_onPrep_onRow_onError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    id v3 = v5;
  }
  [v3 bindNamedParam:":batchSize" toInteger:*(void *)(a1 + 40)];
}

uint64_t __99__ATXNotificationAndSuggestionDatabase_prepAndRunQuery_batchSize_XPCActivity_onPrep_onRow_onError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return *MEMORY[0x1E4F93C08];
}

- (void)_pruneNotificationsBasedOnHardLimitsForBundleId:(id)a3 XPCActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ATXNotificationAndSuggestionDatabase _pruneNotificationsBasedOnHardLimitsForBundleId:XPCActivity:]();
  }

  uint64_t v9 = [(ATXNotificationManagementMAConstants *)self->_mobileAssetConstants ATXNotificationAndSuggestionDatabase_pruningBatchSize];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __100__ATXNotificationAndSuggestionDatabase__pruneNotificationsBasedOnHardLimitsForBundleId_XPCActivity___block_invoke;
  v14[3] = &unk_1E68AD1B0;
  id v15 = v6;
  uint64_t v16 = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __100__ATXNotificationAndSuggestionDatabase__pruneNotificationsBasedOnHardLimitsForBundleId_XPCActivity___block_invoke_2;
  v12[3] = &unk_1E68AD250;
  id v10 = v15;
  id v13 = v10;
  [(ATXNotificationAndSuggestionDatabase *)self prepAndRunQuery:@"DELETE FROM notifications WHERE bundleId = :bundleId RETURNING 1 ORDER BY receiveTimestamp DESC LIMIT :batchSize OFFSET :maxNumberOfNotificationsPerApp " batchSize:v9 XPCActivity:v7 onPrep:v14 onRow:0 onError:v12];

  uint64_t v11 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ATXNotificationAndSuggestionDatabase _pruneNotificationsBasedOnHardLimitsForBundleId:XPCActivity:]();
  }
}

void __100__ATXNotificationAndSuggestionDatabase__pruneNotificationsBasedOnHardLimitsForBundleId_XPCActivity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":bundleId" toNSString:v3];
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":maxNumberOfNotificationsPerApp", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "ATXNotificationAndSuggestionDatabase_maxNumberOfNotificationsPerApp"));
}

uint64_t __100__ATXNotificationAndSuggestionDatabase__pruneNotificationsBasedOnHardLimitsForBundleId_XPCActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __100__ATXNotificationAndSuggestionDatabase__pruneNotificationsBasedOnHardLimitsForBundleId_XPCActivity___block_invoke_2_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (void)pruneSuggestionsBasedOnHardLimitsWithXPCActivity:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  queue = self->super._queue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke;
  uint64_t v11 = &unk_1E68AB870;
  id v12 = self;
  id v6 = v4;
  id v13 = v6;
  dispatch_sync_notxn_0(queue, &v8);
  if (objc_msgSend(v6, "didDefer", v8, v9, v10, v11, v12))
  {
    id v7 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]";
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%s: XPC Activity deferred, skipping remaining work.", buf, 0xCu);
    }
  }
  else
  {
    [(ATXNotificationAndSuggestionDatabase *)self analyze];
  }
}

void __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v14 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "%s: Pruning suggestions", buf, 0xCu);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3 + -2419200.0;
  id v5 = [*(id *)(a1 + 32) db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_300;
  v12[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&void v12[4] = v4;
  [v5 prepAndRunQuery:@"DELETE FROM suggestions WHERE latestOutcome = :latestOutcomeCreated     AND triggerNotificationUUID IN(        SELECT triggerNotificationUUID         FROM suggestions         WHERE latestOutcome = :latestOutcomeCouldNotShow             AND latestOutcomeTimestamp < :timestamp28DaysAgo    ) " onPrep:v12 onRow:0 onError:&__block_literal_global_305];

  if ([*(id *)(a1 + 40) didDefer])
  {
    id v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v14 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
      id v7 = "%s: XPC Activity deferred, skipping remaining work.";
LABEL_11:
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) db];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_309;
    v11[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
    *(double *)&v11[4] = v4;
    [v8 prepAndRunQuery:@"DELETE FROM suggestions WHERE latestOutcome = :latestOutcomeCouldNotShow     AND latestOutcomeTimestamp < :timestamp28DaysAgo " onPrep:v11 onRow:0 onError:&__block_literal_global_312];

    if ([*(id *)(a1 + 40) didDefer])
    {
      id v6 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        double v14 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
        id v7 = "%s: XPC Activity deferred, skipping remaining work.";
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 32) db];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_316;
      v10[3] = &unk_1E68AD200;
      v10[4] = *(void *)(a1 + 32);
      [v9 prepAndRunQuery:@"DELETE FROM suggestions ORDER BY latestOutcomeTimestamp DESC LIMIT -1 OFFSET :maxNumberOfSuggestions" onPrep:v10 onRow:0 onError:&__block_literal_global_320];

      id v6 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        double v14 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
        id v7 = "%s: Finished pruning suggestions";
        goto LABEL_11;
      }
    }
  }
}

void __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_300(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindNamedParam:":latestOutcomeCreated" toInteger:7];
  [v3 bindNamedParam:":latestOutcomeCouldNotShow" toInteger:8];
  [v3 bindNamedParam:":timestamp28DaysAgo" toInteger:(uint64_t)*(double *)(a1 + 32)];
}

uint64_t __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_cold_1();
  }

  double v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

void __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_309(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindNamedParam:":latestOutcomeCouldNotShow" toInteger:8];
  [v3 bindNamedParam:":timestamp28DaysAgo" toInteger:(uint64_t)*(double *)(a1 + 32)];
}

uint64_t __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_310(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_310_cold_1();
  }

  double v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

void __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_316(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":maxNumberOfSuggestions", objc_msgSend(v2, "ATXNotificationAndSuggestionDatabase_maxNumberOfSuggestions"));
}

uint64_t __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_318(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_318_cold_1();
  }

  double v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (void)analyze
{
  queue = self->super._queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__ATXNotificationAndSuggestionDatabase_analyze__block_invoke;
  v3[3] = &unk_1E68AB818;
  void v3[4] = self;
  dispatch_sync_notxn_0(queue, v3);
}

void __47__ATXNotificationAndSuggestionDatabase_analyze__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[ATXNotificationAndSuggestionDatabase analyze]_block_invoke";
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "%s: Analyzing the db", (uint8_t *)&v5, 0xCu);
  }

  id v3 = [*(id *)(a1 + 32) db];
  [v3 prepAndRunQuery:@"ANALYZE" onPrep:0 onRow:0 onError:&__block_literal_global_326];

  double v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[ATXNotificationAndSuggestionDatabase analyze]_block_invoke";
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%s: Finished analyzing the db", (uint8_t *)&v5, 0xCu);
  }
}

uint64_t __47__ATXNotificationAndSuggestionDatabase_analyze__block_invoke_324(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __47__ATXNotificationAndSuggestionDatabase_analyze__block_invoke_324_cold_1();
  }

  double v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)vacuumDatabase
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__31;
  queue = self->super._queue;
  id v10 = __Block_byref_object_dispose__31;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__ATXNotificationAndSuggestionDatabase_vacuumDatabase__block_invoke;
  v5[3] = &unk_1E68AD2C8;
  void v5[4] = self;
  void v5[5] = &v6;
  v5[6] = a2;
  dispatch_sync_notxn_0(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__ATXNotificationAndSuggestionDatabase_vacuumDatabase__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__ATXNotificationAndSuggestionDatabase_vacuumDatabase__block_invoke_2;
  v3[3] = &unk_1E68AD2A0;
  long long v4 = *(_OWORD *)(a1 + 40);
  [v2 prepAndRunQuery:@"VACUUM" onPrep:0 onRow:0 onError:v3];
}

uint64_t __54__ATXNotificationAndSuggestionDatabase_vacuumDatabase__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    __54__ATXNotificationAndSuggestionDatabase_vacuumDatabase__block_invoke_2_cold_1();
  }

  uint64_t v8 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v8;
}

- (id)metricsForSuggestionsSinceCompletionTimestamp:(double)a3
{
  uint64_t v6 = objc_opt_new();
  queue = self->super._queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke;
  v12[3] = &unk_1E68AE9E0;
  void v12[4] = self;
  double v14 = a3;
  id v8 = v6;
  id v13 = v8;
  SEL v15 = a2;
  dispatch_sync_notxn_0(queue, v12);
  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke_2;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v6[4] = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke_3;
  v4[3] = &unk_1E68AE948;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke_4;
  v3[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v3[4] = *(void *)(a1 + 56);
  [v2 prepAndRunQuery:@"SELECT suggestions.latestOutcome, suggestions.createdTimestamp, suggestions.latestOutcomeTimestamp, suggestions.deliverySuggestion, notifications.bundleId FROM suggestions INNER JOIN notifications ON suggestions.triggerNotificationUUID = notifications.uuid WHERE suggestions.isActive = 0 AND suggestions.latestOutcomeTimestamp > :previouslyLoggedOutcomeTimestamp ORDER BY suggestions.latestOutcomeTimestamp ASC ", v6, v4, v3 onPrep onRow onError];
}

uint64_t __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":previouslyLoggedOutcomeTimestamp" toDouble:*(double *)(a1 + 32)];
}

uint64_t __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getDoubleForColumnAlias:"latestOutcomeTimestamp"];
  double v5 = v4;
  [v3 getDoubleForColumnAlias:"createdTimestamp"];
  double v7 = v6;
  id v8 = [v3 getNSStringForColumnAlias:"bundleId"];
  [v3 getIntegerForColumnAlias:"latestOutcome"];
  uint64_t v9 = [v3 getNSDataForColumnAlias:"deliverySuggestion"];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F4B1B0]) initWithProtoData:v9];
  id v11 = objc_opt_new();
  [v11 setBundleId:v8];
  [v11 setTimeToOutcome:v5 - v7];
  [v11 setTargetMode:0];
  [v11 setIsAddToMode:0];
  id v12 = [v10 subObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v14 = [v10 subObject];
    objc_msgSend(v11, "setIsAddToMode:", objc_msgSend(v14, "tuningSuggestionType") == 1);
  }
  [v10 subtype];
  SEL v15 = ATXSuggestionTypeToString();
  [v11 setSuggestionType:v15];

  [v10 scope];
  uint64_t v16 = ATXNotificationSuggestionScopeToString();
  [v11 setSuggestionScope:v16];

  uint64_t v17 = ATXNotificationSuggestionEventTypeToString();
  [v11 setSuggestionOutcome:v17];

  [v11 setSuggestionCompletionTimestamp:v5];
  [*(id *)(a1 + 32) addObject:v11];
  uint64_t v18 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v18;
}

uint64_t __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();
  }

  double v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (ATXNotificationAndSuggestionDatastorePerfMetrics)notificationAndSuggestionDatastorePerfMetrics
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  id v11 = &unk_1D14E1507;
  queue = self->super._queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__ATXNotificationAndSuggestionDatabase_notificationAndSuggestionDatastorePerfMetrics__block_invoke;
  v7[3] = &unk_1E68ACBD0;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync_notxn_0(queue, v7);
  int64_t v3 = v9[4];
  int64_t v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  int64_t v5 = v3;
  int64_t v6 = v4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

void __85__ATXNotificationAndSuggestionDatabase_notificationAndSuggestionDatastorePerfMetrics__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) db];
  uint64_t v2 = objc_msgSend(v6, "atx_countRowsOfTable:returnValueOnError:", @"notifications", -1);
  int64_t v3 = [*(id *)(a1 + 32) db];
  uint64_t v4 = objc_msgSend(v3, "atx_countRowsOfTable:returnValueOnError:", @"suggestions", -1);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v5 + 32) = v2;
  *(void *)(v5 + 40) = v4;
}

- (id)feedbackHistoriesForKeys:(id)a3
{
  id v5 = a3;
  id v6 = objc_opt_new();
  double v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    double v7 = v5;
  }
  id v8 = v7;

  queue = self->super._queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke;
  v15[3] = &unk_1E68AE970;
  v15[4] = self;
  id v16 = v8;
  id v10 = v6;
  id v17 = v10;
  SEL v18 = a2;
  id v11 = v8;
  dispatch_sync_notxn_0(queue, v15);
  uint64_t v12 = v17;
  id v13 = v10;

  return v13;
}

void __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_2;
  v6[3] = &unk_1E68AD200;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_3;
  v4[3] = &unk_1E68AE948;
  id v5 = *(id *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_4;
  v3[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v3[4] = *(void *)(a1 + 56);
  [v2 prepAndRunQuery:@"SELECT     feedbackKey, latestOutcome, createdTimestamp FROM suggestions WHERE     feedbackKey IN _pas_nsarray(:feedbackKeyArray) AND     isActive = 0 ORDER BY     feedbackKey DESC, createdTimestamp DESC ", v6, v4, v3 onPrep onRow onError];
}

uint64_t __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":feedbackKeyArray" toNSArray:*(void *)(a1 + 32)];
}

uint64_t __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumnAlias:"feedbackKey"];
  uint64_t v5 = [v3 getInt64ForColumnAlias:"latestOutcome"];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  [v3 getDoubleForColumnAlias:"createdTimestamp"];
  double v8 = v7;

  uint64_t v9 = [v6 dateWithTimeIntervalSinceReferenceDate:v8];
  id v10 = [[ATXNotificationSuggestionFeedbackHistoryQueryResult alloc] initWithFeedbackKey:v4 latestOutcome:v5 createdTimestamp:v9];
  id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];

  if (!v11)
  {
    uint64_t v12 = objc_opt_new();
    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v4];
  }
  id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  [v13 addObject:v10];

  double v14 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v14;
}

uint64_t __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_4_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)_makeNotificationTelemetryQueryResultFromDatabaseResult:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);
  id v6 = [v3 getNSStringForColumnAlias:"uuid"];
  double v7 = (void *)[v5 initWithUUIDString:v6];
  [v4 setNotificationUUID:v7];

  double v8 = (void *)MEMORY[0x1E4F1C9C8];
  [v3 getDoubleForColumnAlias:"receiveTimestamp"];
  uint64_t v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  [v4 setReceiveTimestamp:v9];

  objc_msgSend(v4, "setDeliveryMethod:", objc_msgSend(v3, "getIntegerForColumnAlias:", "deliveryMethod"));
  objc_msgSend(v4, "setUrgency:", objc_msgSend(v3, "getIntegerForColumnAlias:", "urgency"));
  id v10 = [v3 getNSStringForColumnAlias:"bundleId"];
  [v4 setBundleId:v10];

  id v11 = [v3 getInt64AsNSNumberForColumnAlias:"isMessage"];
  objc_msgSend(v4, "setIsMessage:", objc_msgSend(v11, "BOOLValue"));

  [v3 getIntegerForColumnAlias:"deliveryReason"];
  uint64_t v12 = ATXUserNotificationDeliveryReasonToString();
  [v4 setDestinationReason:v12];

  if ([v3 isNullForColumnAlias:"firstUI"])
  {
    [v4 setOriginalDestination:@"Unknown"];
  }
  else
  {
    [v3 getIntegerForColumnAlias:"firstUI"];
    id v13 = ATXNotificationDeliveryUIToString();
    [v4 setOriginalDestination:v13];
  }
  if ([v3 isNullForColumnAlias:"mostRecentUI"])
  {
    [v4 setFinalDestination:@"Unknown"];
  }
  else
  {
    [v3 getIntegerForColumnAlias:"mostRecentUI"];
    double v14 = ATXNotificationDeliveryUIToString();
    [v4 setFinalDestination:v14];
  }
  SEL v15 = [v3 getNSStringForColumnAlias:"receivedMode"];
  [v4 setReceiveModeIdentifier:v15];

  id v16 = (void *)MEMORY[0x1E4F1C9C8];
  [v3 getDoubleForColumnAlias:"latestOutcomeTimestamp"];
  id v17 = objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v18 = [v3 getInt64ForColumnAlias:"numExpansions"];
  unint64_t v19 = [v3 getIntegerForColumnAlias:"latestOutcome"];
  objc_msgSend(v4, "setBodyLength:", objc_msgSend(v3, "getIntegerForColumnAlias:", "notificationBodyLength"));
  objc_msgSend(v4, "setTitleLength:", objc_msgSend(v3, "getIntegerForColumnAlias:", "notificationTitleLength"));
  objc_msgSend(v4, "setSubtitleLength:", objc_msgSend(v3, "getIntegerForColumnAlias:", "notificationSubtitleLength"));
  objc_msgSend(v4, "setSummaryLength:", objc_msgSend(v3, "getIntegerForColumnAlias:", "summaryLength"));
  uint64_t v20 = [v3 getInt64AsNSNumberForColumnAlias:"isSummarized"];
  objc_msgSend(v4, "setIsSummarized:", objc_msgSend(v20, "BOOLValue"));

  uint64_t v21 = [v3 getInt64AsNSNumberForColumnAlias:"isPartOfStack"];
  objc_msgSend(v4, "setIsPartOfStack:", objc_msgSend(v21, "BOOLValue"));

  double v22 = [v3 getInt64AsNSNumberForColumnAlias:"isStackSummary"];
  objc_msgSend(v4, "setIsStackSummary:", objc_msgSend(v22, "BOOLValue"));

  double v23 = [v3 getInt64AsNSNumberForColumnAlias:"isDeliveredInPrioritySection"];
  objc_msgSend(v4, "setIsDeliveredInPrioritySection:", objc_msgSend(v23, "BOOLValue"));

  objc_msgSend(v4, "setNumberOfNotificationsInStack:", objc_msgSend(v3, "getIntegerForColumnAlias:", "numberOfNotificationsInStack"));
  objc_msgSend(v4, "setNotificationPriorityStatus:", objc_msgSend(v3, "getIntegerForColumnAlias:", "notificationPriorityStatus"));
  objc_msgSend(v4, "setNotificationSummaryStatus:", objc_msgSend(v3, "getIntegerForColumnAlias:", "notificationSummaryStatus"));
  uint64_t v24 = [v3 getInt64AsNSNumberForColumnAlias:"isPriorityNotificationEnabled"];
  objc_msgSend(v4, "setIsPriorityNotificationEnabled:", objc_msgSend(v24, "BOOLValue"));

  uint64_t v25 = [v3 getInt64AsNSNumberForColumnAlias:"isNotificationSummaryEnabled"];
  objc_msgSend(v4, "setIsNotificationSummaryEnabled:", objc_msgSend(v25, "BOOLValue"));

  uint64_t v26 = ATXUserNotificationResolutionTypeForNotificationEventType(v19);
  id v27 = [ATXUserNotificationResolution alloc];
  id v28 = [v4 notificationUUID];
  uint64_t v29 = [(ATXUserNotificationResolution *)v27 initWithNotificationUUID:v28 numExpansions:v18 resolutionType:v26 resolutionTimestamp:v17];

  [v4 setResolution:v29];
  return v4;
}

- (id)telemetryDataForNotificationsFromTimestamp:(double)a3 endTimestamp:(double)a4
{
  double v8 = objc_opt_new();
  queue = self->super._queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke;
  v14[3] = &unk_1E68AEBC0;
  void v14[4] = self;
  double v16 = a3;
  double v17 = a4;
  id v10 = v8;
  id v15 = v10;
  SEL v18 = a2;
  dispatch_sync_notxn_0(queue, v14);
  id v11 = v15;
  id v12 = v10;

  return v12;
}

void __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_2;
  v9[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  long long v10 = *(_OWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_3;
  v6[3] = &unk_1E68AEB98;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_4;
  v5[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v5[4] = *(void *)(a1 + 64);
  [v2 prepAndRunQuery:@"SELECT     uuid, receiveTimestamp, deliveryMethod, urgency, bundleId, isMessage, latestOutcome, latestOutcomeTimestamp, numExpansions, receivedMode, firstUI, mostRecentUI, deliveryReason, notificationBodyLength, notificationTitleLength, notificationSubtitleLength, summaryLength, isDeliveredInPrioritySection, isSummarized, isPartOfStack, isStackSummary, numberOfNotificationsInStack, notificationPriorityStatus, notificationSummaryStatus, isPriorityNotificationEnabled, isNotificationSummaryEnabled FROM notifications WHERE     receiveTimestamp > :startTimestamp AND     receiveTimestamp < :endTimestamp ", v9, v6, v5 onPrep onRow onError];
}

void __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":startTimestamp" toDouble:v3];
  [v4 bindNamedParam:":endTimestamp" toDouble:*(double *)(a1 + 40)];
}

uint64_t __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) _makeNotificationTelemetryQueryResultFromDatabaseResult:a2];
  [v2 addObject:v3];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)telemetryDataForNotificationWithBundleId:(id)a3 notificationId:(id)a4 recordTimestamp:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__31;
  uint64_t v26 = __Block_byref_object_dispose__31;
  id v27 = 0;
  queue = self->super._queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke;
  v16[3] = &unk_1E68AEC10;
  v16[4] = self;
  id v17 = v9;
  double v20 = a5;
  id v18 = v10;
  unint64_t v19 = &v22;
  SEL v21 = a2;
  id v12 = v10;
  id v13 = v9;
  dispatch_sync_notxn_0(queue, v16);
  id v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke_2;
  v6[3] = &unk_1E68AEA58;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 64);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke_3;
  v5[3] = &unk_1E68AEBE8;
  uint64_t v3 = *(void *)(a1 + 56);
  void v5[4] = *(void *)(a1 + 32);
  void v5[5] = v3;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke_4;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v4[4] = *(void *)(a1 + 72);
  [v2 prepAndRunQuery:@"SELECT     uuid, receiveTimestamp, deliveryMethod, urgency, bundleId, isMessage, latestOutcome, latestOutcomeTimestamp, numExpansions, receivedMode, firstUI, mostRecentUI, deliveryReason, notificationBodyLength, notificationTitleLength, notificationSubtitleLength, summaryLength, isDeliveredInPrioritySection, isSummarized, isPartOfStack, isStackSummary, numberOfNotificationsInStack, notificationPriorityStatus, notificationSummaryStatus, isPriorityNotificationEnabled, isNotificationSummaryEnabled FROM notifications WHERE     bundleId = :bundleId AND     notificationId = :notificationId AND     recordTimestamp = :recordTimestamp ORDER BY recordTimestamp DESC LIMIT 1 ", v6, v5, v4 onPrep onRow onError];
}

void __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":bundleId" toNSString:v3];
  [v4 bindNamedParam:":notificationId" toNSString:*(void *)(a1 + 40)];
  [v4 bindNamedParam:":recordTimestamp" toDouble:*(double *)(a1 + 48)];
}

uint64_t __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _makeNotificationTelemetryQueryResultFromDatabaseResult:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C08];
}

uint64_t __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_4_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (void).cxx_destruct
{
}

void __59__ATXNotificationAndSuggestionDatabase__runMigrationSteps___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_6_1(&dword_1D0FA3000, a3, (uint64_t)a3, "Error running migration query: %@ %@", (uint8_t *)&v4);
}

void __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_4_cold_1(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "localizedDescription");
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error fetching Biome bookmark %@ from table: %@", v5, v6, v7, v8, 2u);
}

void __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke_3_cold_1(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "localizedDescription");
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error updating bookmark %@: %@", v5, v6, v7, v8, 2u);
}

void __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke_3_cold_1(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "localizedDescription");
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error inserting notification event %@: %@", v5, v6, v7, v8, 2u);
}

void __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_3_cold_1(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "localizedDescription");
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error updating notification event %@: %@", v5, v6, v7, v8, 2u);
}

void __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke_3_cold_1(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "localizedDescription");
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error inserting suggestion %@: %@", v5, v6, v7, v8, 2u);
}

void __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke_3_cold_1(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "localizedDescription");
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error updating suggestion from event %@: %@", v5, v6, v7, v8, 2u);
}

void __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  id v1 = NSStringFromSelector(*(SEL *)(v0 + 40));
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_1D0FA3000, v2, v3, "Error fetching suggestions for entity %@ in %@. Error: %@", v4, v5, v6, v7, v8);
}

void __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  id v1 = NSStringFromSelector(*(SEL *)(v0 + 40));
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_1D0FA3000, v2, v3, "Error fetching event type for entity %@ in %@. Error: %@", v4, v5, v6, v7, v8);
}

void __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  id v1 = (const char *)OUTLINED_FUNCTION_4_5(v0);
  uint64_t v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error fetching notifications in %@. Error: %@", v5, v6, v7, v8, v9);
}

void __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  id v1 = (const char *)OUTLINED_FUNCTION_11(v0);
  uint64_t v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error fetching active notifications in %@. Error: %@", v5, v6, v7, v8, v9);
}

void __83__ATXNotificationAndSuggestionDatabase_setAllNotificationsToClearedExceptProminent__block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __69__ATXNotificationAndSuggestionDatabase_setAllNotificationsToModified__block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  id v1 = (const char *)OUTLINED_FUNCTION_4_5(v0);
  uint64_t v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v3, v4, "Error fetching notifications in %@. Error: %@", v5, v6, v7, v8, v9);
}

void __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  id v1 = (const char *)OUTLINED_FUNCTION_4_5(v0);
  uint64_t v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error fetching notification resolutions in %@. Error: %@", v5, v6, v7, v8, v9);
}

void __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  id v1 = (const char *)OUTLINED_FUNCTION_4_5(v0);
  uint64_t v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error fetching notification counts by bundle ID in %@. Error: %@", v5, v6, v7, v8, v9);
}

void __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  id v1 = (const char *)OUTLINED_FUNCTION_4_5(v0);
  uint64_t v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error fetching receive time stamp of first notification %@. Error: %@", v5, v6, v7, v8, v9);
}

void __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_3_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  uint64_t v2 = "-[ATXNotificationAndSuggestionDatabase allNotificationsFromBundleId:sinceTimestamp:]_block_invoke_3";
  OUTLINED_FUNCTION_2_4();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "%s: Unable to build NSUUID from string uuid %@ fetched from database. Continuing anyway", (uint8_t *)&v1, 0x16u);
}

void __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_259_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_14(&dword_1D0FA3000, v0, v1, "%s: Error fetching notifications for bundleId: %@. Error: %@", v2);
}

void __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_269_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[ATXNotificationAndSuggestionDatabase allBundleIdsOfNotificationsOnLockscreen]_block_invoke";
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_1(&dword_1D0FA3000, v0, v1, "%s: Error fetching bundleIds. Error: %@", (uint8_t *)&v2);
}

void __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = (const char *)OUTLINED_FUNCTION_11(v0);
  int v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error deleting suggestions in %@. Error: %@", v5, v6, v7, v8, v9);
}

void __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_272_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = (const char *)OUTLINED_FUNCTION_11(v0);
  int v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error deleting notifications in %@. Error: %@", v5, v6, v7, v8, v9);
}

void __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_273_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = (const char *)OUTLINED_FUNCTION_11(v0);
  int v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error deleting bookmarks in %@. Error: %@", v5, v6, v7, v8, v9);
}

void __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = (const char *)OUTLINED_FUNCTION_11(v0);
  int v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v3, v4, "Error deleting notifications in %@. Error: %@", v5, v6, v7, v8, v9);
}

void __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = (const char *)OUTLINED_FUNCTION_11(v0);
  int v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v3, v4, "Error deleting suggestions in %@. Error: %@", v5, v6, v7, v8, v9);
}

void __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_9(&dword_1D0FA3000, v0, v1, "%s: Processing bundleIds in order: %@", v2, v3, v4, v5, 2u);
}

void __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_2_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[ATXNotificationAndSuggestionDatabase pruneNotificationsBasedOnHardLimitsWithXPCActivity:]_block_invoke_2";
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_1(&dword_1D0FA3000, v0, v1, "%s: Error fetching bundleIds from db. Error: %@", (uint8_t *)&v2);
}

void __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_2_289_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[ATXNotificationAndSuggestionDatabase pruneNotificationsBasedOnHardLimitsWithXPCActivity:]_block_invoke_2";
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_1(&dword_1D0FA3000, v0, v1, "%s: Error running deletion across all apps. Error: %@", (uint8_t *)&v2);
}

- (void)prepAndRunQuery:(os_log_t)log batchSize:XPCActivity:onPrep:onRow:onError:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[ATXNotificationAndSuggestionDatabase prepAndRunQuery:batchSize:XPCActivity:onPrep:onRow:onError:]";
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "%s: Finished batched deletion", (uint8_t *)&v1, 0xCu);
}

- (void)prepAndRunQuery:(uint64_t)a3 batchSize:(uint64_t)a4 XPCActivity:(uint64_t)a5 onPrep:(uint64_t)a6 onRow:(uint64_t)a7 onError:(uint64_t)a8 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_pruneNotificationsBasedOnHardLimitsForBundleId:XPCActivity:.cold.1()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_9(&dword_1D0FA3000, v0, v1, "%s: Finished deletion for bundleId %@", v2, v3, v4, v5, 2u);
}

- (void)_pruneNotificationsBasedOnHardLimitsForBundleId:XPCActivity:.cold.2()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_9(&dword_1D0FA3000, v0, v1, "%s: Deleting rows from notifications table for bundleId %@", v2, v3, v4, v5, 2u);
}

void __100__ATXNotificationAndSuggestionDatabase__pruneNotificationsBasedOnHardLimitsForBundleId_XPCActivity___block_invoke_2_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_14(&dword_1D0FA3000, v0, v1, "%s: Error deleting entries from notifications table for bundleId: %@. Error: %@", v2);
}

void __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]_block_invoke_2";
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_1(&dword_1D0FA3000, v0, v1, "%s: Error deleting suggestions with Created latestOutcome from the suggestions table. Error: %@", (uint8_t *)&v2);
}

void __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_310_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]_block_invoke_2";
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_1(&dword_1D0FA3000, v0, v1, "%s: Error deleting suggestions with CouldNotShow latestOutcome from the suggestions table. Error: %@", (uint8_t *)&v2);
}

void __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_318_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]_block_invoke_2";
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_1(&dword_1D0FA3000, v0, v1, "%s: Error deleting entries from suggestions table. Error: %@", (uint8_t *)&v2);
}

void __47__ATXNotificationAndSuggestionDatabase_analyze__block_invoke_324_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[ATXNotificationAndSuggestionDatabase analyze]_block_invoke";
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_1(&dword_1D0FA3000, v0, v1, "%s: Error analyzing database. Error: %@", (uint8_t *)&v2);
}

void __54__ATXNotificationAndSuggestionDatabase_vacuumDatabase__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = (const char *)OUTLINED_FUNCTION_11(v0);
  int v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v3, v4, "Error vacuuming database in %@. Error: %@", v5, v6, v7, v8, v9);
}

void __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = (const char *)OUTLINED_FUNCTION_4_5(v0);
  int v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error fetching suggestion feedback in %@. Error: %@", v5, v6, v7, v8, v9);
}

void __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = (const char *)OUTLINED_FUNCTION_4_5(v0);
  int v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v3, v4, "Error fetching telemetry data in %@. Error: %@", v5, v6, v7, v8, v9);
}

@end