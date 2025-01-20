@interface ATXInformationStore
+ (ATXInformationStore)sharedInstance;
- (ATXInformationStore)init;
- (ATXInformationStore)initWithDatabasePath:(id)a3 cachedSuggestionsPath:(id)a4;
- (BOOL)_configureDatabase;
- (BOOL)_handleCorruptionIfNeeded;
- (BOOL)_insertTimelineEntries:(id)a3 forWidget:(id)a4 storageLimit:(unint64_t)a5;
- (BOOL)_migrateDatabaseIfNeeded;
- (BOOL)_openDatabase;
- (BOOL)addAbuseControlOutcomeForSuggestion:(id)a3 forTimestamp:(int64_t)a4 outcome:(int64_t)a5;
- (BOOL)addAbuseControlOutcomes:(id)a3;
- (BOOL)addEngagementRecordForWidget:(id)a3 date:(id)a4 engagementType:(int64_t)a5;
- (BOOL)addStackConfigStatistics:(id)a3;
- (BOOL)appendDismissRecord:(id)a3;
- (BOOL)atomicallyDeleteInfoSuggestions:(id)a3 insertInfoSuggestions:(id)a4;
- (BOOL)clearOldAbuseControlOutcomeData;
- (BOOL)clearOutdatedSuggestedWidgetEntries;
- (BOOL)clearOutdatedWidgetEngagements;
- (BOOL)clearOutdatedWidgetReloadEntries;
- (BOOL)clearWidgetRemovalHistoryOlderThan:(id)a3;
- (BOOL)deleteAllInfoSuggestionsWithSourceIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteAllSuggestionsForSourceId:(id)a3 excludingSuggestionId:(id)a4;
- (BOOL)deleteExpiredProactiveStackRotations;
- (BOOL)deleteInfoSuggestion:(id)a3;
- (BOOL)didMostRecentReloadFailForExtension:(id)a3 kind:(id)a4 intent:(id)a5 cutoffDate:(id)a6;
- (BOOL)didSuggestionReachDurationLimit:(id)a3;
- (BOOL)insertOrIgnoreProactiveStackRotationRecord:(id)a3;
- (BOOL)insertTimelineEntries:(id)a3 forWidget:(id)a4;
- (BOOL)pruneInvalidSuggestions;
- (BOOL)pruneTimelineEntries;
- (BOOL)recordSuggestedWidgetUniqueIdIfNotExist:(id)a3;
- (BOOL)recordSuggestionPassedTimelineFiltersForTheFirstTime:(id)a3;
- (BOOL)recordUserRemovalOfSuggestedWidget:(id)a3 kind:(id)a4 intent:(id)a5 atDate:(id)a6 duration:(double)a7;
- (BOOL)recordWidgetReloadForSuggestion:(id)a3 date:(id)a4 readyForDisplay:(BOOL)a5;
- (BOOL)rotationExistsForSuggestionWithId:(id)a3 considerStalenessRotation:(BOOL)a4;
- (BOOL)updateEndDateForInfoSuggestions:(id)a3;
- (BOOL)updateMostRecentSignificantDwellOfWidget:(id)a3 date:(id)a4;
- (BOOL)updateMostRecentTapOfWidget:(id)a3 date:(id)a4;
- (BOOL)writeCacheWithNewSuggestions:(id)a3;
- (BOOL)writeInfoSuggestions:(id)a3;
- (id)_dateIntervalFromDismissStatement:(id)a3;
- (id)_openSqliteDatabaseAtPath:(id)a3;
- (id)criterionOfInfoSuggestionWithIdentifier:(id)a3;
- (id)databaseHandle;
- (id)dateIntervalsOfUserRemovalOfSuggestedWidget:(id)a3 kind:(id)a4 intent:(id)a5;
- (id)dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId:(id)a3;
- (id)dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent:(id)a3;
- (id)deleteExpiredSuggestions;
- (id)distinctScoresForWidget:(id)a3 kind:(id)a4;
- (id)earliestFutureSuggestionChangeDate;
- (id)engagementTimestampsForExtensionBundleId:(id)a3 kind:(id)a4 intent:(id)a5 engagementType:(int64_t)a6;
- (id)fetchAbuseControlOutcomesForSuggestion:(id)a3 sinceDate:(id)a4;
- (id)fetchAllTimelineEntriesForWidget:(id)a3;
- (id)fetchDistinctScoreCountForWidgets;
- (id)fetchDistinctWidgetsIgnoringIntentSinceDate:(id)a3;
- (id)fetchStackConfigStatisticsForWidgetBundleId:(id)a3 widgetKind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6;
- (id)fetchTimelineEntriesForWidget:(id)a3 sinceDate:(id)a4;
- (id)fetchWidgetEngagementRecords;
- (id)fetchWidgetTapEngagementCountSinceStartDate:(id)a3;
- (id)fetchWidgetTapEngagementsBetweenStartDate:(id)a3 endDate:(id)a4;
- (id)firstAppearDateOfSuggestedWidgetWithUniqueId:(id)a3;
- (id)firstEngagementOfWidget:(id)a3 kind:(id)a4 intent:(id)a5 sinceTimestamp:(id)a6;
- (id)firstTimeAtWhichSuggestionPassedTimelineFilters:(id)a3;
- (id)latestInfoSuggestionRelevantNowForSourceId:(id)a3;
- (id)latestUpdateDateForSourceId:(id)a3;
- (id)migrations;
- (id)mostRecentEngagementOfWidget:(id)a3;
- (id)mostRecentEngagementOfWidget:(id)a3 kind:(id)a4 ofType:(int64_t)a5;
- (id)mostRecentEngagementOfWidget:(id)a3 ofType:(int64_t)a4;
- (id)mostRecentRotationRecordForSuggestionIdentifier:(id)a3;
- (id)mostRecentRotationRecordForWidget:(id)a3 kind:(id)a4 intent:(id)a5 considerStalenessRotation:(BOOL)a6 filterByClientModelId:(id)a7;
- (id)mostRecentTimelineEntryWithScoreForWidget:(id)a3 kind:(id)a4 family:(int64_t)a5 intentIndexingHash:(int64_t)a6;
- (id)mostRecentTimelineUpdateDateOfWidget:(id)a3 kind:(id)a4;
- (id)nextImportantDateAmongTimelineInducedProactiveStackRotationRecords;
- (id)proactiveRotationsForWidgetInThePastDay:(id)a3 kind:(id)a4 intent:(id)a5 filterByClientModelId:(id)a6;
- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3;
- (id)readAllDismissRecords;
- (id)readAllInfoSuggestions;
- (id)readAllInfoSuggestionsWithSourceIdentifier:(id)a3;
- (id)readCachedSuggestions;
- (id)readCurrentlyRelevantSuggestions;
- (id)recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget:(id)a3 kind:(id)a4 family:(int64_t)a5 intent:(id)a6;
- (id)upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget:(id)a3 kind:(id)a4 familyMask:(unint64_t)a5 intent:(id)a6;
- (id)widgetSuggestionRemovalRecordsForDiagnostics;
- (int64_t)mostRecentAbuseControlOutcomeForSuggestionId:(id)a3;
- (unint64_t)numberOfInfoSuggestionsForAppBundleIdentifier:(id)a3;
- (unint64_t)numberOfInfoSuggestionsForSourceId:(id)a3;
- (unint64_t)numberOfSuggestedWidgetsInPastDay;
- (unint64_t)numberOfWidgetReloadForSuggestionInPastDay;
- (void)_handleCorruptionIfNeeded;
- (void)_migrateDatabaseIfNeeded;
- (void)_openDatabase;
- (void)close;
- (void)dealloc;
- (void)readCachedSuggestions;
@end

@implementation ATXInformationStore

+ (ATXInformationStore)sharedInstance
{
  if (sharedInstance__pasOnceToken2_1 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_1, &__block_literal_global_72);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_12;

  return (ATXInformationStore *)v2;
}

void __37__ATXInformationStore_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_12;
  sharedInstance__pasExprOnceResult_12 = v1;
}

- (ATXInformationStore)init
{
  v3 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"_ATXInfoSuggestionStore.db"];
  v4 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"InfoEngineCachedSuggestions"];
  v5 = [(ATXInformationStore *)self initWithDatabasePath:v3 cachedSuggestionsPath:v4];

  return v5;
}

- (ATXInformationStore)initWithDatabasePath:(id)a3 cachedSuggestionsPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXInformationStore;
  v8 = [(ATXInformationStore *)&v15 init];
  if (!v8) {
    goto LABEL_3;
  }
  uint64_t v9 = [v6 copy];
  databasePath = v8->_databasePath;
  v8->_databasePath = (NSString *)v9;

  uint64_t v11 = [v7 copy];
  cachedSuggestionsPath = v8->_cachedSuggestionsPath;
  v8->_cachedSuggestionsPath = (NSString *)v11;

  if (![(ATXInformationStore *)v8 _openDatabase]) {
    v13 = 0;
  }
  else {
LABEL_3:
  }
    v13 = v8;

  return v13;
}

- (void)dealloc
{
  db = self->_db;
  if (db)
  {
    [(_PASSqliteDatabase *)db closePermanently];
    v4 = self->_db;
    self->_db = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ATXInformationStore;
  [(ATXInformationStore *)&v5 dealloc];
}

- (BOOL)_openDatabase
{
  BOOL v3 = [(ATXInformationStore *)self _handleCorruptionIfNeeded];
  if (v3)
  {
    p_databasePath = &self->_databasePath;
    objc_super v5 = [(ATXInformationStore *)self _openSqliteDatabaseAtPath:self->_databasePath];
    db = self->_db;
    self->_db = v5;

    if (self->_db)
    {
      if ([(ATXInformationStore *)self _configureDatabase])
      {
        if ([(ATXInformationStore *)self _migrateDatabaseIfNeeded])
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        id v7 = __atxlog_handle_gi();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[ATXInformationStore _openDatabase]();
        }
      }
      else
      {
        id v7 = __atxlog_handle_gi();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[ATXInformationStore _openDatabase]();
        }
      }
    }
    else
    {
      id v7 = __atxlog_handle_gi();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(ATXInformationStore *)(uint64_t)p_databasePath _openDatabase];
      }
    }

    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)close
{
  [(_PASSqliteDatabase *)self->_db closePermanently];
  db = self->_db;
  self->_db = 0;
}

- (BOOL)_handleCorruptionIfNeeded
{
  BOOL v3 = [MEMORY[0x1E4F93BA0] corruptionMarkerPathForPath:self->_databasePath];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = __atxlog_handle_gi();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "ATXInformationStore was corrupted. Truncate and restart", buf, 2u);
    }

    db = self->_db;
    if (db) {
      [(_PASSqliteDatabase *)db closePermanently];
    }
    [MEMORY[0x1E4F93BA0] truncateDatabaseAtPath:self->_databasePath];
    uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v13 = 0;
    char v9 = [v8 removeItemAtPath:v3 error:&v13];
    id v10 = v13;

    if ((v9 & 1) == 0)
    {
      uint64_t v11 = __atxlog_handle_gi();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ATXInformationStore _handleCorruptionIfNeeded]((uint64_t)v3);
      }
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (id)_openSqliteDatabaseAtPath:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  v4 = [MEMORY[0x1E4F93BA0] sqliteDatabaseWithFilename:v3 contentProtection:3 errorHandler:0 error:&v9];
  id v5 = v9;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = __atxlog_handle_gi();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXInformationStore _openSqliteDatabaseAtPath:]((uint64_t)v3);
    }
  }

  return v4;
}

- (BOOL)_configureDatabase
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [&unk_1EFDF4BD8 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(&unk_1EFDF4BD8);
      }
      int v7 = [(_PASSqliteDatabase *)self->_db prepAndRunQuery:*(void *)(*((void *)&v9 + 1) + 8 * v6) onPrep:0 onRow:0 onError:&__block_literal_global_33_0];
      if (!v7) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [&unk_1EFDF4BD8 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

uint64_t __41__ATXInformationStore__configureDatabase__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __41__ATXInformationStore__configureDatabase__block_invoke_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (BOOL)_migrateDatabaseIfNeeded
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F93AF8]);
  v10[0] = self;
  BOOL v4 = 1;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v6 = (void *)[v3 initWithMigrationObjects:v5];

  switch([v6 migrateDatabases])
  {
    case 0u:
      int v7 = __atxlog_handle_gi();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[ATXInformationStore _migrateDatabaseIfNeeded]();
      }
      goto LABEL_8;
    case 1u:
      goto LABEL_18;
    case 2u:
      uint64_t v8 = __atxlog_handle_gi();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[ATXInformationStore _migrateDatabaseIfNeeded]();
      }
      goto LABEL_15;
    case 3u:
      int v7 = __atxlog_handle_gi();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ATXInformationStore _migrateDatabaseIfNeeded]();
      }
LABEL_8:

      goto LABEL_17;
    case 4u:
      uint64_t v8 = __atxlog_handle_gi();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[ATXInformationStore _migrateDatabaseIfNeeded].cold.4();
      }
      goto LABEL_15;
    case 5u:
      uint64_t v8 = __atxlog_handle_gi();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[ATXInformationStore _migrateDatabaseIfNeeded].cold.5();
      }
      goto LABEL_15;
    case 6u:
      uint64_t v8 = __atxlog_handle_gi();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[ATXInformationStore _migrateDatabaseIfNeeded].cold.6();
      }
LABEL_15:

      break;
    default:
      break;
  }
  [(_PASSqliteDatabase *)self->_db placeCorruptionMarker];
LABEL_17:
  BOOL v4 = 0;
LABEL_18:

  return v4;
}

- (id)databaseHandle
{
  return self->_db;
}

- (id)migrations
{
  v5[28] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1EFDF43F8;
  v4[1] = &unk_1EFDF4410;
  v5[0] = &unk_1EFDF4BF0;
  v5[1] = &unk_1EFDF4C08;
  v4[2] = &unk_1EFDF4428;
  v4[3] = &unk_1EFDF4440;
  v5[2] = &unk_1EFDF4C20;
  v5[3] = &unk_1EFDF4C38;
  v4[4] = &unk_1EFDF4458;
  v4[5] = &unk_1EFDF4470;
  v5[4] = &unk_1EFDF4C50;
  v5[5] = &unk_1EFDF4C68;
  v4[6] = &unk_1EFDF4488;
  v4[7] = &unk_1EFDF44A0;
  v5[6] = &unk_1EFDF4C80;
  v5[7] = &unk_1EFDF4C98;
  v4[8] = &unk_1EFDF44B8;
  v4[9] = &unk_1EFDF44D0;
  v5[8] = &unk_1EFDF4CB0;
  v5[9] = &unk_1EFDF4CC8;
  v4[10] = &unk_1EFDF44E8;
  v4[11] = &unk_1EFDF4500;
  v5[10] = &unk_1EFDF4CE0;
  v5[11] = &unk_1EFDF4CF8;
  v4[12] = &unk_1EFDF4518;
  v4[13] = &unk_1EFDF4530;
  v5[12] = &unk_1EFDF4D10;
  v5[13] = &unk_1EFDF4D28;
  v4[14] = &unk_1EFDF4548;
  v4[15] = &unk_1EFDF4560;
  v5[14] = &unk_1EFDF4D40;
  v5[15] = &unk_1EFDF4D58;
  v4[16] = &unk_1EFDF4578;
  v4[17] = &unk_1EFDF4590;
  v5[16] = &unk_1EFDF4D70;
  v5[17] = &unk_1EFDF4D88;
  v4[18] = &unk_1EFDF45A8;
  v4[19] = &unk_1EFDF45C0;
  v5[18] = &unk_1EFDF4DA0;
  v5[19] = &unk_1EFDF4DB8;
  v4[20] = &unk_1EFDF45D8;
  v4[21] = &unk_1EFDF45F0;
  v5[20] = &unk_1EFDF4DD0;
  v5[21] = &unk_1EFDF4DE8;
  v4[22] = &unk_1EFDF4608;
  v4[23] = &unk_1EFDF4620;
  v5[22] = &unk_1EFDF4E00;
  v5[23] = &unk_1EFDF4E18;
  v4[24] = &unk_1EFDF4638;
  v4[25] = &unk_1EFDF4650;
  v5[24] = &unk_1EFDF4E30;
  v5[25] = &unk_1EFDF4E48;
  v4[26] = &unk_1EFDF4668;
  v4[27] = &unk_1EFDF4680;
  v5[26] = &unk_1EFDF4E60;
  v5[27] = &unk_1EFDF4E78;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:28];

  return v2;
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)readCachedSuggestions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1AD0D3C30](self, a2);
  cachedSuggestionsPath = self->_cachedSuggestionsPath;
  p_cachedSuggestionsPath = &self->_cachedSuggestionsPath;
  int v6 = open([(NSString *)cachedSuggestionsPath UTF8String], 0);
  if (v6 == -1)
  {
    BOOL v8 = *__error() == 2;
    long long v9 = __atxlog_handle_gi();
    long long v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        long long v11 = *p_cachedSuggestionsPath;
        int buf = 138412290;
        *(void *)buf_4 = v11;
        _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "ATXInformationStore: No info engine cache file found at path %@.", (uint8_t *)&buf, 0xCu);
      }

      long long v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ATXInformationStore readCachedSuggestions]();
      }

      long long v12 = 0;
    }
  }
  else
  {
    int v7 = v6;
    id v21 = 0;
    ATXCacheFileRead();
    if ((v7 & 0x80000000) == 0) {
      close(v7);
    }
    id v13 = __atxlog_handle_gi();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(ATXInformationStore *)(uint64_t)p_cachedSuggestionsPath readCachedSuggestions];
    }
    long long v12 = 0;
  }

  return v12;
}

void __44__ATXInformationStore_readCachedSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 suggestionId];
  [v4 bindNamedParam:":suggestionId" toNSString:v5];

  id v6 = [*(id *)(a1 + 32) sourceId];
  [v4 bindNamedParam:":sourceId" toNSString:v6];
}

uint64_t __44__ATXInformationStore_readCachedSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSDataForColumnName:"data" table:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F938F0]) initWithData:v3];
  if (v4)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];
  }
  else
  {
    uint64_t v5 = __atxlog_handle_gi();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __44__ATXInformationStore_readCachedSuggestions__block_invoke_2_cold_1();
    }
  }
  id v6 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v6;
}

uint64_t __44__ATXInformationStore_readCachedSuggestions__block_invoke_358(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __44__ATXInformationStore_readCachedSuggestions__block_invoke_358_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  int v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (BOOL)writeCacheWithNewSuggestions:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v12 = objc_opt_new();
        id v13 = [v11 suggestionIdentifier];
        [v12 setSuggestionId:v13];

        uint64_t v14 = [v11 sourceIdentifier];
        [v12 setSourceId:v14];

        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  uint64_t v15 = objc_opt_new();
  [v15 setEntries:v5];
  uint64_t v16 = [v15 encodeAsProto];
  if (!v16)
  {
    id v21 = __atxlog_handle_gi();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ATXInformationStore writeCacheWithNewSuggestions:]();
    }

    goto LABEL_18;
  }
  uint64_t v17 = [(NSString *)self->_cachedSuggestionsPath UTF8String];
  int v18 = open(v17, 514, 384, context, (void)v25);
  if (v18 == -1)
  {
    v22 = __atxlog_handle_default();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ATXInformationStore writeCacheWithNewSuggestions:]();
    }

LABEL_18:
    char v20 = 0;
    goto LABEL_19;
  }
  int v19 = v18;
  char v20 = ATXCacheFileWrite();
  if ((v19 & 0x80000000) == 0) {
    close(v19);
  }
LABEL_19:

  return v20;
}

- (id)readAllInfoSuggestions
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__16;
  long long v12 = __Block_byref_object_dispose__16;
  id v13 = (id)objc_opt_new();
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__ATXInformationStore_readAllInfoSuggestions__block_invoke;
  v7[3] = &unk_1E5D09060;
  v7[4] = &v8;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_363;
  v6[3] = &unk_1E5D09038;
  v6[4] = &v8;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT suggestionId, sourceId, data FROM suggestions" onPrep:0 onRow:v7 onError:v6];
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

uint64_t __45__ATXInformationStore_readAllInfoSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F938F0]);
  uint64_t v5 = [v3 getNSDataForColumn:2];
  id v6 = (void *)[v4 initWithData:v5];

  if (v6)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
  }
  else
  {
    uint64_t v7 = __atxlog_handle_gi();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_cold_1();
    }
  }
  uint64_t v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v8;
}

uint64_t __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_363(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_363_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (id)readCurrentlyRelevantSuggestions
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__16;
  long long v12 = __Block_byref_object_dispose__16;
  id v13 = (id)objc_opt_new();
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_2;
  v7[3] = &unk_1E5D09060;
  v7[4] = &v8;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_371;
  v6[3] = &unk_1E5D09038;
  v6[4] = &v8;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT suggestionId, sourceId, data FROM suggestions WHERE startDate <= :now AND :now < endDate ORDER BY startDate" onPrep:&__block_literal_global_368 onRow:v7 onError:v6];
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  [v2 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":now" toInt64:(uint64_t)v3];
}

uint64_t __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F938F0]);
  uint64_t v5 = [v3 getNSDataForColumn:2];
  id v6 = (void *)[v4 initWithData:v5];

  if (v6)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
  }
  else
  {
    uint64_t v7 = __atxlog_handle_gi();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_2_cold_1();
    }
  }
  uint64_t v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v8;
}

uint64_t __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_371(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_363_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (id)readAllInfoSuggestionsWithSourceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__16;
  uint64_t v17 = __Block_byref_object_dispose__16;
  id v18 = (id)objc_opt_new();
  db = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__ATXInformationStore_readAllInfoSuggestionsWithSourceIdentifier___block_invoke;
  v11[3] = &unk_1E5D08FE8;
  id v6 = v4;
  id v12 = v6;
  v9[4] = &v13;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __66__ATXInformationStore_readAllInfoSuggestionsWithSourceIdentifier___block_invoke_2;
  v10[3] = &unk_1E5D09060;
  v10[4] = &v13;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__ATXInformationStore_readAllInfoSuggestionsWithSourceIdentifier___block_invoke_375;
  v9[3] = &unk_1E5D09038;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT suggestionId, sourceId, data FROM suggestions WHERE sourceId = :sourceId" onPrep:v11 onRow:v10 onError:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

uint64_t __66__ATXInformationStore_readAllInfoSuggestionsWithSourceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":sourceId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __66__ATXInformationStore_readAllInfoSuggestionsWithSourceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F938F0]);
  uint64_t v5 = [v3 getNSDataForColumn:2];
  id v6 = (void *)[v4 initWithData:v5];

  if (v6)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
  }
  else
  {
    id v7 = __atxlog_handle_gi();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_2_cold_1();
    }
  }
  uint64_t v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v8;
}

uint64_t __66__ATXInformationStore_readAllInfoSuggestionsWithSourceIdentifier___block_invoke_375(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_363_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (id)latestInfoSuggestionRelevantNowForSourceId:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__16;
  id v18 = __Block_byref_object_dispose__16;
  id v19 = 0;
  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke;
  v12[3] = &unk_1E5D08FE8;
  id v13 = v4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke_2;
  v11[3] = &unk_1E5D09060;
  void v11[4] = &v14;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke_380;
  v9[3] = &unk_1E5D090A8;
  id v6 = v13;
  id v10 = v6;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT suggestionId, sourceId, data from suggestions WHERE sourceId = :sourceId AND startDate < :nowInSecondsSinceReferenceDate AND endDate > :nowInSecondsSinceReferenceDate ORDER BY startDate DESC LIMIT 1" onPrep:v12 onRow:v11 onError:v9];
  id v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v7;
}

void __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a2;
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;
  [v6 bindNamedParam:":sourceId" toNSString:*(void *)(a1 + 32)];
  [v6 bindNamedParam:":nowInSecondsSinceReferenceDate" toInt64:(uint64_t)v5];
}

uint64_t __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F938F0]);
  double v5 = [v3 getNSDataForColumn:2];
  id v6 = (void *)[v4 initWithData:v5];

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
  }
  else
  {
    id v7 = __atxlog_handle_gi();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_2_cold_1();
    }
  }
  uint64_t v8 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v8;
}

uint64_t __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke_380(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke_380_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)criterionOfInfoSuggestionWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__16;
  uint64_t v16 = __Block_byref_object_dispose__16;
  id v17 = 0;
  db = self->_db;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __63__ATXInformationStore_criterionOfInfoSuggestionWithIdentifier___block_invoke;
  v10[3] = &unk_1E5D08FE8;
  id v6 = v4;
  id v11 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__ATXInformationStore_criterionOfInfoSuggestionWithIdentifier___block_invoke_2;
  v9[3] = &unk_1E5D09060;
  void v9[4] = &v12;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT criterion FROM suggestions WHERE suggestionId = :suggestionId" onPrep:v10 onRow:v9 onError:&__block_literal_global_385];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __63__ATXInformationStore_criterionOfInfoSuggestionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":suggestionId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __63__ATXInformationStore_criterionOfInfoSuggestionWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSStringForColumn:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C08];
}

uint64_t __63__ATXInformationStore_criterionOfInfoSuggestionWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __63__ATXInformationStore_criterionOfInfoSuggestionWithIdentifier___block_invoke_3_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)earliestFutureSuggestionChangeDate
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v4 = (uint64_t)v3;
  uint64_t v25 = 0;
  long long v26 = (double *)&v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  double v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v5 timeIntervalSinceReferenceDate];
  uint64_t v7 = v6;

  uint64_t v28 = v7;
  db = self->_db;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke;
  v24[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v24[4] = v4;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_2;
  v23[3] = &unk_1E5D09060;
  v23[4] = &v25;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT startDate FROM suggestions WHERE startDate > :now ORDER BY startDate LIMIT 1" onPrep:v24 onRow:v23 onError:&__block_literal_global_390];
  uint64_t v19 = 0;
  char v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v9 timeIntervalSinceReferenceDate];
  uint64_t v11 = v10;

  uint64_t v22 = v11;
  uint64_t v12 = self->_db;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_394;
  v18[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v18[4] = v4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_2_395;
  v17[3] = &unk_1E5D09060;
  v17[4] = &v19;
  [(_PASSqliteDatabase *)v12 prepAndRunQuery:@"SELECT endDate FROM suggestions WHERE endDate > :now ORDER BY endDate LIMIT 1" onPrep:v18 onRow:v17 onError:&__block_literal_global_398];
  if (v26[3] >= v20[3])
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    uint64_t v14 = v20;
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    uint64_t v14 = v26;
  }
  uint64_t v15 = (void *)[v13 initWithTimeIntervalSinceReferenceDate:v14[3]];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v15;
}

uint64_t __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":now" toInt64:*(void *)(a1 + 32)];
}

uint64_t __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_2(uint64_t a1, void *a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (double)[a2 getInt64ForColumn:0];
  return *MEMORY[0x1E4F93C08];
}

uint64_t __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_3_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

uint64_t __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_394(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":now" toInt64:*(void *)(a1 + 32)];
}

uint64_t __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_2_395(uint64_t a1, void *a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (double)[a2 getInt64ForColumn:0];
  return *MEMORY[0x1E4F93C08];
}

uint64_t __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_3_396(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_3_396_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)latestUpdateDateForSourceId:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__16;
  id v18 = __Block_byref_object_dispose__16;
  id v19 = 0;
  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke;
  v12[3] = &unk_1E5D08FE8;
  id v13 = v4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke_2;
  v11[3] = &unk_1E5D09060;
  void v11[4] = &v14;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke_3;
  v9[3] = &unk_1E5D090A8;
  id v6 = v13;
  id v10 = v6;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT lastUpdated FROM suggestions WHERE sourceId = :sourceId ORDER BY lastUpdated DESC LIMIT 1" onPrep:v12 onRow:v11 onError:v9];
  id v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v7;
}

uint64_t __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":sourceId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isColumnNull:0] & 1) == 0)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 0));
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v7;
}

uint64_t __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke_3_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (unint64_t)numberOfInfoSuggestionsForSourceId:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke;
  v12[3] = &unk_1E5D08FE8;
  id v13 = v4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke_2;
  v11[3] = &unk_1E5D09060;
  void v11[4] = &v14;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke_3;
  v9[3] = &unk_1E5D090A8;
  id v6 = v13;
  id v10 = v6;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT COUNT(*) FROM suggestions WHERE sourceId = :sourceId" onPrep:v12 onRow:v11 onError:v9];
  unint64_t v7 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":sourceId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (unint64_t)numberOfInfoSuggestionsForAppBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke;
  v12[3] = &unk_1E5D08FE8;
  id v13 = v4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke_2;
  v11[3] = &unk_1E5D09060;
  void v11[4] = &v14;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke_3;
  v9[3] = &unk_1E5D090A8;
  id v6 = v13;
  id v10 = v6;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT COUNT(*) FROM suggestions WHERE appBundleIdentifier = :appBundleIdentifier" onPrep:v12 onRow:v11 onError:v9];
  unint64_t v7 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":appBundleIdentifier" toNSString:*(void *)(a1 + 32)];
}

uint64_t __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (BOOL)writeInfoSuggestions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x1E4F93BB0];
    db = self->_db;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __44__ATXInformationStore_writeInfoSuggestions___block_invoke;
    v10[3] = &unk_1E5D09118;
    id v11 = v4;
    BOOL v8 = ([v6 writeTransactionWithHandle:db failableBlock:v10] & 1) == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __44__ATXInformationStore_writeInfoSuggestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = [v3 db];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __44__ATXInformationStore_writeInfoSuggestions___block_invoke_2;
        v14[3] = &unk_1E5D08FE8;
        v14[4] = v8;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __44__ATXInformationStore_writeInfoSuggestions___block_invoke_3;
        v13[3] = &unk_1E5D090F0;
        v13[4] = v8;
        v13[5] = &v19;
        [v9 prepAndRunQuery:@"INSERT OR REPLACE INTO suggestions (suggestionId, sourceId, data, criterion, appBundleIdentifier, widgetBundleIdentifier, widgetKind, layouts, intentIdentifier, startDate, endDate, lastUpdated, clientModelId, relevanceScore) VALUES (:suggestionId, :sourceId, :data, :criterion, :appBundleIdentifier, :widgetBundleIdentifier, :widgetKind, :layouts, :intentIdentifier, :startDate, :endDate, :lastUpdated, :clientModelId, :relevanceScore)", v14, 0, v13 onPrep onRow onError];

        if (*((unsigned char *)v20 + 24))
        {

          id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
LABEL_11:
  uint64_t v11 = *v10;
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __44__ATXInformationStore_writeInfoSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  id v20 = a2;
  id v3 = [*(id *)(a1 + 32) suggestionIdentifier];
  [v20 bindNamedParam:":suggestionId" toNSString:v3];

  id v4 = [*(id *)(a1 + 32) sourceIdentifier];
  [v20 bindNamedParam:":sourceId" toNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 32) data];
  [v20 bindNamedParam:":data" toNSData:v5];

  uint64_t v6 = [*(id *)(a1 + 32) criterion];
  [v20 bindNamedParam:":criterion" toNSString:v6];

  unint64_t v7 = [*(id *)(a1 + 32) appBundleIdentifier];
  [v20 bindNamedParam:":appBundleIdentifier" toNSString:v7];

  uint64_t v8 = [*(id *)(a1 + 32) widgetBundleIdentifier];
  [v20 bindNamedParam:":widgetBundleIdentifier" toNSString:v8];

  uint64_t v9 = [*(id *)(a1 + 32) widgetKind];
  [v20 bindNamedParam:":widgetKind" toNSString:v9];

  id v10 = [*(id *)(a1 + 32) clientModelId];
  [v20 bindNamedParam:":clientModelId" toNSString:v10];

  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(*(id *)(a1 + 32), "layouts"));
  [v20 bindNamedParam:":layouts" toNSString:v11];

  uint64_t v12 = [*(id *)(a1 + 32) intent];
  objc_msgSend(v20, "bindNamedParam:toInt64:", ":intentIdentifier", objc_msgSend(v12, "atx_indexingHash"));

  id v13 = [*(id *)(a1 + 32) startDate];
  [v13 timeIntervalSinceReferenceDate];
  [v20 bindNamedParam:":startDate" toInt64:(uint64_t)v14];

  long long v15 = [*(id *)(a1 + 32) endDate];
  [v15 timeIntervalSinceReferenceDate];
  [v20 bindNamedParam:":endDate" toInt64:(uint64_t)v16];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [v20 bindNamedParam:":lastUpdated" toInt64:(uint64_t)v17];
  long long v18 = [*(id *)(a1 + 32) relevanceScore];

  if (v18)
  {
    uint64_t v19 = [*(id *)(a1 + 32) relevanceScore];
    [v19 doubleValue];
    objc_msgSend(v20, "bindNamedParam:toDouble:", ":relevanceScore");
  }
  else
  {
    [v20 bindNamedParamToNull:":relevanceScore"];
  }
}

uint64_t __44__ATXInformationStore_writeInfoSuggestions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __44__ATXInformationStore_writeInfoSuggestions___block_invoke_3_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (BOOL)updateEndDateForInfoSuggestions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F93BB0];
    db = self->_db;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke;
    v10[3] = &unk_1E5D09118;
    id v11 = v4;
    BOOL v8 = ([v6 writeTransactionWithHandle:db failableBlock:v10] & 1) == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = [v3 db];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke_2;
        v14[3] = &unk_1E5D08FE8;
        v14[4] = v8;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke_3;
        v13[3] = &unk_1E5D090F0;
        v13[4] = v8;
        v13[5] = &v19;
        [v9 prepAndRunQuery:@"UPDATE suggestions SET data=:data, endDate=:endDate, lastUpdated=:lastUpdated WHERE suggestionId=:suggestionId", v14, 0, v13 onPrep onRow onError];

        if (*((unsigned char *)v20 + 24))
        {

          id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
LABEL_11:
  uint64_t v11 = *v10;
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v9 = a2;
  id v4 = [v3 suggestionIdentifier];
  [v9 bindNamedParam:":suggestionId" toNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 32) data];
  [v9 bindNamedParam:":data" toNSData:v5];

  uint64_t v6 = [*(id *)(a1 + 32) endDate];
  [v6 timeIntervalSinceReferenceDate];
  [v9 bindNamedParam:":endDate" toInt64:(uint64_t)v7];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [v9 bindNamedParam:":lastUpdated" toInt64:(uint64_t)v8];
}

uint64_t __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke_3_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (BOOL)atomicallyDeleteInfoSuggestions:(id)a3 insertInfoSuggestions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    double v8 = (void *)MEMORY[0x1E4F93BB0];
    db = self->_db;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke;
    v12[3] = &unk_1E5D09140;
    id v13 = v6;
    id v14 = v7;
    BOOL v10 = ([v8 writeTransactionWithHandle:db failableBlock:v12] & 1) == 0;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

uint64_t __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v18 = a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        double v8 = [v19 db];
        v26[5] = &v32;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_2;
        v27[3] = &unk_1E5D08FE8;
        v27[4] = v7;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_3;
        v26[3] = &unk_1E5D090F0;
        v26[4] = v7;
        [v8 prepAndRunQuery:@"DELETE FROM suggestions WHERE suggestionId = :suggestionId AND sourceId = :sourceId" onPrep:v27 onRow:0 onError:v26];

        if (*((unsigned char *)v33 + 24))
        {

LABEL_20:
          long long v15 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
          goto LABEL_21;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  long long v25 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  id v9 = *(id *)(v18 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * j);
        id v14 = [v19 db];
        v20[5] = &v32;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_435;
        v21[3] = &unk_1E5D08FE8;
        v21[4] = v13;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_2_436;
        v20[3] = &unk_1E5D090F0;
        v20[4] = v13;
        [v14 prepAndRunQuery:@"INSERT OR REPLACE INTO suggestions (suggestionId, sourceId, data, criterion, appBundleIdentifier, widgetBundleIdentifier, widgetKind, layouts, intentIdentifier, startDate, endDate, lastUpdated, clientModelId, relevanceScore) VALUES (:suggestionId, :sourceId, :data, :criterion, :appBundleIdentifier, :widgetBundleIdentifier, :widgetKind, :layouts, :intentIdentifier, :startDate, :endDate, :lastUpdated, :clientModelId, :relevanceScore)", v21, 0, v20 onPrep onRow onError];

        if (*((unsigned char *)v33 + 24))
        {

          goto LABEL_20;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v36 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  long long v15 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
LABEL_21:
  uint64_t v16 = *v15;
  _Block_object_dispose(&v32, 8);

  return v16;
}

void __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 suggestionIdentifier];
  [v4 bindNamedParam:":suggestionId" toNSString:v5];

  id v6 = [*(id *)(a1 + 32) sourceIdentifier];
  [v4 bindNamedParam:":sourceId" toNSString:v6];
}

uint64_t __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_3_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

void __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_435(uint64_t a1, void *a2)
{
  id v20 = a2;
  id v3 = [*(id *)(a1 + 32) suggestionIdentifier];
  [v20 bindNamedParam:":suggestionId" toNSString:v3];

  id v4 = [*(id *)(a1 + 32) sourceIdentifier];
  [v20 bindNamedParam:":sourceId" toNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 32) data];
  [v20 bindNamedParam:":data" toNSData:v5];

  id v6 = [*(id *)(a1 + 32) criterion];
  [v20 bindNamedParam:":criterion" toNSString:v6];

  uint64_t v7 = [*(id *)(a1 + 32) appBundleIdentifier];
  [v20 bindNamedParam:":appBundleIdentifier" toNSString:v7];

  double v8 = [*(id *)(a1 + 32) widgetBundleIdentifier];
  [v20 bindNamedParam:":widgetBundleIdentifier" toNSString:v8];

  id v9 = [*(id *)(a1 + 32) widgetKind];
  [v20 bindNamedParam:":widgetKind" toNSString:v9];

  uint64_t v10 = [*(id *)(a1 + 32) clientModelId];
  [v20 bindNamedParam:":clientModelId" toNSString:v10];

  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(*(id *)(a1 + 32), "layouts"));
  [v20 bindNamedParam:":layouts" toNSString:v11];

  uint64_t v12 = [*(id *)(a1 + 32) intent];
  objc_msgSend(v20, "bindNamedParam:toInt64:", ":intentIdentifier", objc_msgSend(v12, "atx_indexingHash"));

  uint64_t v13 = [*(id *)(a1 + 32) startDate];
  [v13 timeIntervalSinceReferenceDate];
  [v20 bindNamedParam:":startDate" toInt64:(uint64_t)v14];

  long long v15 = [*(id *)(a1 + 32) endDate];
  [v15 timeIntervalSinceReferenceDate];
  [v20 bindNamedParam:":endDate" toInt64:(uint64_t)v16];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [v20 bindNamedParam:":lastUpdated" toInt64:(uint64_t)v17];
  uint64_t v18 = [*(id *)(a1 + 32) relevanceScore];

  if (v18)
  {
    id v19 = [*(id *)(a1 + 32) relevanceScore];
    [v19 doubleValue];
    objc_msgSend(v20, "bindNamedParam:toDouble:", ":relevanceScore");
  }
  else
  {
    [v20 bindNamedParamToNull:":relevanceScore"];
  }
}

uint64_t __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_2_436(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_2_436_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (BOOL)deleteInfoSuggestion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v14 = 0;
    long long v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    db = self->_db;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__ATXInformationStore_deleteInfoSuggestion___block_invoke;
    v12[3] = &unk_1E5D08FE8;
    id v13 = v4;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__ATXInformationStore_deleteInfoSuggestion___block_invoke_2;
    v9[3] = &unk_1E5D090F0;
    id v10 = v13;
    uint64_t v11 = &v14;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"DELETE FROM suggestions WHERE suggestionId = :suggestionId AND sourceId = :sourceId" onPrep:v12 onRow:0 onError:v9];
    BOOL v7 = *((unsigned char *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __44__ATXInformationStore_deleteInfoSuggestion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 suggestionIdentifier];
  [v4 bindNamedParam:":suggestionId" toNSString:v5];

  id v6 = [*(id *)(a1 + 32) sourceIdentifier];
  [v4 bindNamedParam:":sourceId" toNSString:v6];
}

uint64_t __44__ATXInformationStore_deleteInfoSuggestion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __44__ATXInformationStore_deleteInfoSuggestion___block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (BOOL)deleteAllInfoSuggestionsWithSourceIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (v6)
  {
    uint64_t v23 = 0;
    long long v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 1;
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__16;
    uint64_t v21 = __Block_byref_object_dispose__16;
    id v22 = 0;
    db = self->_db;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__ATXInformationStore_deleteAllInfoSuggestionsWithSourceIdentifier_error___block_invoke;
    v15[3] = &unk_1E5D08FE8;
    id v16 = v6;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__ATXInformationStore_deleteAllInfoSuggestionsWithSourceIdentifier_error___block_invoke_2;
    v11[3] = &unk_1E5D09168;
    id v12 = v16;
    id v13 = &v23;
    uint64_t v14 = &v17;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"DELETE FROM suggestions WHERE sourceId = :sourceId" onPrep:v15 onRow:0 onError:v11];
    if (a4) {
      *a4 = (id) v18[5];
    }
    BOOL v9 = *((unsigned char *)v24 + 24) != 0;

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __74__ATXInformationStore_deleteAllInfoSuggestionsWithSourceIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":sourceId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __74__ATXInformationStore_deleteAllInfoSuggestionsWithSourceIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __74__ATXInformationStore_deleteAllInfoSuggestionsWithSourceIdentifier_error___block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

- (id)deleteExpiredSuggestions
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__16;
  id v13 = __Block_byref_object_dispose__16;
  id v14 = (id)objc_opt_new();
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__16;
  v7[4] = __Block_byref_object_dispose__16;
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  db = self->_db;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke;
  v6[3] = &unk_1E5D091B8;
  v6[4] = v7;
  void v6[5] = &v9;
  [MEMORY[0x1E4F93BB0] writeTransactionWithHandle:db failableBlock:v6];
  id v4 = (id)v10[5];
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(&v9, 8);

  return v4;
}

uint64_t __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_2;
  v9[3] = &unk_1E5D09190;
  void v9[4] = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_3;
  v8[3] = &unk_1E5D09060;
  v8[4] = *(void *)(a1 + 40);
  [v4 prepAndRunQuery:@"SELECT suggestionId, endDate FROM suggestions WHERE endDate <= :now", v9, v8, &__block_literal_global_447 onPrep onRow onError];

  uint64_t v5 = [v3 db];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_451;
  v7[3] = &unk_1E5D09190;
  v7[4] = *(void *)(a1 + 32);
  [v5 prepAndRunQuery:@"DELETE FROM suggestions WHERE endDate <= :now" onPrep:v7 onRow:0 onError:&__block_literal_global_454];

  return *MEMORY[0x1E4F93BE8];
}

void __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = a2;
  [v2 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":now" toInt64:(uint64_t)v3];
}

uint64_t __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (double)[v3 getInt64ForColumnName:"endDate" table:0];
  uint64_t v5 = (void *)MEMORY[0x1E4F939E0];
  id v6 = [v3 getNSStringForColumnName:"suggestionId" table:0];

  BOOL v7 = [v5 outcomeWithSuggestionId:v6 timestamp:21 abuseControlOutcome:v4];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v8;
}

uint64_t __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_4_cold_1();
  }

  double v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

void __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_451(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = a2;
  [v2 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":now" toInt64:(uint64_t)v3];
}

uint64_t __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_2_452(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_2_452_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (BOOL)deleteAllSuggestionsForSourceId:(id)a3 excludingSuggestionId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  db = self->_db;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__ATXInformationStore_deleteAllSuggestionsForSourceId_excludingSuggestionId___block_invoke;
  v16[3] = &unk_1E5D091E0;
  id v17 = v6;
  id v18 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__ATXInformationStore_deleteAllSuggestionsForSourceId_excludingSuggestionId___block_invoke_2;
  v12[3] = &unk_1E5D09208;
  id v9 = v17;
  id v13 = v9;
  id v10 = v18;
  id v14 = v10;
  long long v15 = &v19;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"DELETE FROM suggestions WHERE sourceId = :sourceId AND suggestionId <> :excludedSuggestionId" onPrep:v16 onRow:0 onError:v12];
  LOBYTE(v6) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)v6;
}

void __77__ATXInformationStore_deleteAllSuggestionsForSourceId_excludingSuggestionId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":sourceId" toNSString:v3];
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v4, "bindNamedParam:toNSString:", ":excludedSuggestionId");
  }
  else {
    [v4 bindNamedParamToNull:":excludedSuggestionId"];
  }
}

uint64_t __77__ATXInformationStore_deleteAllSuggestionsForSourceId_excludingSuggestionId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __77__ATXInformationStore_deleteAllSuggestionsForSourceId_excludingSuggestionId___block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (BOOL)recordSuggestionPassedTimelineFiltersForTheFirstTime:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  db = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__ATXInformationStore_recordSuggestionPassedTimelineFiltersForTheFirstTime___block_invoke;
  v11[3] = &unk_1E5D08FE8;
  id v12 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__ATXInformationStore_recordSuggestionPassedTimelineFiltersForTheFirstTime___block_invoke_2;
  v8[3] = &unk_1E5D090F0;
  id v6 = v12;
  id v9 = v6;
  id v10 = &v13;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"UPDATE suggestions SET firstPassOfTimelineFilters = :firstPassOfTimelineFilters WHERE suggestionId = :suggestionId AND sourceId = :sourceId" onPrep:v11 onRow:0 onError:v8];
  LOBYTE(db) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)db;
}

void __76__ATXInformationStore_recordSuggestionPassedTimelineFiltersForTheFirstTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  [v3 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":firstPassOfTimelineFilters" toInt64:(uint64_t)v5];
  id v6 = [*(id *)(a1 + 32) suggestionIdentifier];
  [v4 bindNamedParam:":suggestionId" toNSString:v6];

  id v7 = [*(id *)(a1 + 32) sourceIdentifier];
  [v4 bindNamedParam:":sourceId" toNSString:v7];
}

uint64_t __76__ATXInformationStore_recordSuggestionPassedTimelineFiltersForTheFirstTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __76__ATXInformationStore_recordSuggestionPassedTimelineFiltersForTheFirstTime___block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  double v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (id)firstTimeAtWhichSuggestionPassedTimelineFilters:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__16;
  id v18 = __Block_byref_object_dispose__16;
  id v19 = 0;
  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke;
  v12[3] = &unk_1E5D08FE8;
  id v13 = v4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke_2;
  v11[3] = &unk_1E5D09060;
  void v11[4] = &v14;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke_3;
  v9[3] = &unk_1E5D090A8;
  id v6 = v13;
  id v10 = v6;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT firstPassOfTimelineFilters FROM suggestions WHERE suggestionId = :suggestionId AND sourceId = :sourceId" onPrep:v12 onRow:v11 onError:v9];
  id v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v7;
}

void __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 suggestionIdentifier];
  [v4 bindNamedParam:":suggestionId" toNSString:v5];

  id v6 = [*(id *)(a1 + 32) sourceIdentifier];
  [v4 bindNamedParam:":sourceId" toNSString:v6];
}

uint64_t __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isNullForColumnName:"firstPassOfTimelineFilters" table:0] & 1) == 0)
  {
    double v4 = (double)[v3 getInt64ForColumnName:"firstPassOfTimelineFilters" table:0];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v8;
}

uint64_t __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke_3_cold_1();
  }

  double v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (BOOL)insertOrIgnoreProactiveStackRotationRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)os_transaction_create();
  id v6 = [v4 intent];

  if (!v6) {
    goto LABEL_6;
  }
  id v7 = (void *)MEMORY[0x1AD0D3C30]();
  id v8 = (void *)MEMORY[0x1E4F28DB0];
  id v9 = [v4 intent];
  id v26 = 0;
  id v6 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v26];
  id v10 = v26;

  if (v10)
  {
    uint64_t v11 = __atxlog_handle_gi();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXInformationStore insertOrIgnoreProactiveStackRotationRecord:](v4);
    }

    BOOL v12 = 0;
  }
  else
  {
LABEL_6:
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 1;
    db = self->_db;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__ATXInformationStore_insertOrIgnoreProactiveStackRotationRecord___block_invoke;
    v19[3] = &unk_1E5D091E0;
    id v20 = v4;
    id v6 = v6;
    id v21 = v6;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__ATXInformationStore_insertOrIgnoreProactiveStackRotationRecord___block_invoke_2;
    v16[3] = &unk_1E5D090F0;
    id v17 = v20;
    id v18 = &v22;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT OR IGNORE INTO proactiveStackRotations (suggestionId, criterion, widgetBundleId, widgetKind, intentHash, intent, isStalenessRotation, rotationTimestamp, relevancyDurationLimit, coolDownTimeInterval, clientModelId) VALUES (:suggestionId, :criterion, :widgetBundleId, :widgetKind, :intentHash, :intent, :isStalenessRotation, :rotationTimestamp, :relevancyDurationLimit, :coolDownTimeInterval, :clientModelId)" onPrep:v19 onRow:0 onError:v16];
    id v14 = self;
    BOOL v12 = *((unsigned char *)v23 + 24) != 0;

    _Block_object_dispose(&v22, 8);
  }

  return v12;
}

void __66__ATXInformationStore_insertOrIgnoreProactiveStackRotationRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 infoSuggestionId];
  [v4 bindNamedParam:":suggestionId" toNSString:v5];

  id v6 = [*(id *)(a1 + 32) criterion];
  [v4 bindNamedParam:":criterion" toNSString:v6];

  id v7 = [*(id *)(a1 + 32) extensionBundleId];
  [v4 bindNamedParam:":widgetBundleId" toNSString:v7];

  id v8 = [*(id *)(a1 + 32) widgetKind];
  [v4 bindNamedParam:":widgetKind" toNSString:v8];

  id v9 = [*(id *)(a1 + 32) intent];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(v9, "atx_indexingHash"));

  [v4 bindNamedParam:":intent" toNSData:*(void *)(a1 + 40)];
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":isStalenessRotation", objc_msgSend(*(id *)(a1 + 32), "isStalenessRotation"));
  id v10 = [*(id *)(a1 + 32) rotationDate];
  [v10 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":rotationTimestamp" toInt64:(uint64_t)v11];

  [*(id *)(a1 + 32) durationLimit];
  [v4 bindNamedParam:":relevancyDurationLimit" toInt64:(uint64_t)v12];
  [*(id *)(a1 + 32) coolDownInterval];
  [v4 bindNamedParam:":coolDownTimeInterval" toInt64:(uint64_t)v13];
  id v14 = [*(id *)(a1 + 32) clientModelId];
  [v4 bindNamedParam:":clientModelId" toNSString:v14];
}

uint64_t __66__ATXInformationStore_insertOrIgnoreProactiveStackRotationRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __66__ATXInformationStore_insertOrIgnoreProactiveStackRotationRecord___block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (id)mostRecentRotationRecordForWidget:(id)a3 kind:(id)a4 intent:(id)a5 considerStalenessRotation:(BOOL)a6 filterByClientModelId:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__16;
  v40 = __Block_byref_object_dispose__16;
  id v41 = 0;
  if (v8) {
    uint64_t v16 = @"SELECT suggestionId, criterion, isStalenessRotation, rotationTimestamp, relevancyDurationLimit, coolDownTimeInterval, clientModelId FROM proactiveStackRotations WHERE widgetBundleId = :widgetBundleId AND widgetKind = :widgetKind AND intentHash = :intentHash ORDER BY rotationTimestamp DESC LIMIT 1";
  }
  else {
    uint64_t v16 = @"SELECT suggestionId, criterion, isStalenessRotation, rotationTimestamp, relevancyDurationLimit, coolDownTimeInterval, clientModelId FROM proactiveStackRotations WHERE widgetBundleId = :widgetBundleId AND widgetKind = :widgetKind AND intentHash = :intentHash AND isStalenessRotation = 0 ORDER BY rotationTimestamp DESC LIMIT 1";
  }
  db = self->_db;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke;
  v32[3] = &unk_1E5D09230;
  id v33 = v12;
  id v34 = v13;
  id v35 = v14;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke_2;
  v26[3] = &unk_1E5D09258;
  id v18 = v15;
  id v27 = v18;
  long long v31 = &v36;
  id v28 = v33;
  id v19 = v34;
  id v29 = v19;
  id v20 = v35;
  id v30 = v20;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke_3;
  v24[3] = &unk_1E5D090A8;
  id v21 = v28;
  id v25 = v21;
  [(_PASSqliteDatabase *)db prepAndRunQuery:v16 onPrep:v32 onRow:v26 onError:v24];
  id v22 = (id)v37[5];

  _Block_object_dispose(&v36, 8);

  return v22;
}

void __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":widgetBundleId" toNSString:v3];
  [v4 bindNamedParam:":widgetKind" toNSString:*(void *)(a1 + 40)];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 48), "atx_indexingHash"));
}

uint64_t __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnName:"clientModelId" table:0];
  uint64_t v5 = v4;
  if (!a1[4] || objc_msgSend(v4, "isEqualToString:"))
  {
    id v6 = [v3 getNSStringForColumnName:"suggestionId" table:0];
    id v7 = [v3 getNSStringForColumnName:"criterion" table:0];
    BOOL v8 = [v3 getIntegerForColumnName:"isStalenessRotation" table:0] > 0;
    id v9 = (void *)MEMORY[0x1E4F1C9C8];
    [v3 getDoubleForColumnName:"rotationTimestamp" table:0];
    id v10 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    LOBYTE(v16) = v8;
    double v11 = -[ATXStackRotationRecord initWithInfoSuggestionId:clientModelId:criterion:widget:kind:intent:isStalenessRotation:rotationDate:durationLimit:coolDownInterval:]([ATXStackRotationRecord alloc], "initWithInfoSuggestionId:clientModelId:criterion:widget:kind:intent:isStalenessRotation:rotationDate:durationLimit:coolDownInterval:", v6, v5, v7, a1[5], a1[6], a1[7], (double)[v3 getInt64ForColumnName:"relevancyDurationLimit" table:0], (double)objc_msgSend(v3, "getInt64ForColumnName:table:", "coolDownTimeInterval", 0), v16, v10);
    uint64_t v12 = *(void *)(a1[8] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  id v14 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v14;
}

uint64_t __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)mostRecentRotationRecordForSuggestionIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__16;
  id v20 = __Block_byref_object_dispose__16;
  id v21 = 0;
  db = self->_db;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke;
  v14[3] = &unk_1E5D08FE8;
  id v15 = v4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke_2;
  v11[3] = &unk_1E5D09280;
  id v13 = &v16;
  id v12 = v15;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke_3;
  v9[3] = &unk_1E5D090A8;
  id v6 = v12;
  id v10 = v6;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT widgetBundleId, widgetKind, criterion, isStalenessRotation, rotationTimestamp, relevancyDurationLimit, coolDownTimeInterval, clientModelId FROM proactiveStackRotations WHERE suggestionId = :suggestionId" onPrep:v14 onRow:v11 onError:v9];
  id v7 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v7;
}

uint64_t __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":suggestionId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnName:"widgetBundleId" table:0];
  uint64_t v5 = [v3 getNSStringForColumnName:"widgetKind" table:0];
  id v6 = [v3 getNSStringForColumnName:"criterion" table:0];
  BOOL v7 = [v3 getIntegerForColumnName:"isStalenessRotation" table:0] > 0;
  BOOL v8 = (void *)MEMORY[0x1E4F1C9C8];
  [v3 getDoubleForColumnName:"rotationTimestamp" table:0];
  id v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  double v10 = (double)[v3 getInt64ForColumnName:"relevancyDurationLimit" table:0];
  double v11 = (double)[v3 getInt64ForColumnName:"coolDownTimeInterval" table:0];
  id v12 = [v3 getNSStringForColumnName:"clientModelId" table:0];

  LOBYTE(v18) = v7;
  id v13 = [[ATXStackRotationRecord alloc] initWithInfoSuggestionId:*(void *)(a1 + 32) clientModelId:v12 criterion:v6 widget:v4 kind:v5 intent:0 isStalenessRotation:v10 rotationDate:v11 durationLimit:v18 coolDownInterval:v9];
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v16;
}

uint64_t __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)nextImportantDateAmongTimelineInducedProactiveStackRotationRecords
{
  id v3 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:19];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v5 = v4;
  uint64_t v17 = 0;
  uint64_t v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v6 timeIntervalSinceReferenceDate];
  uint64_t v8 = v7;

  uint64_t v20 = v8;
  db = self->_db;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke;
  v14[3] = &unk_1E5D092A8;
  uint64_t v16 = v5;
  id v10 = v3;
  id v15 = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke_2;
  v13[3] = &unk_1E5D092D0;
  v13[5] = v5;
  v13[4] = &v17;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT rotationTimestamp + relevancyDurationLimit, rotationTimestamp + coolDownTimeInterval FROM proactiveStackRotations WHERE isStalenessRotation = 0 AND clientModelId = :timelineClientModelId AND (rotationTimestamp + relevancyDurationLimit > :now OR rotationTimestamp + coolDownTimeInterval > :now)" onPrep:v14 onRow:v13 onError:&__block_literal_global_503];
  double v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v18[3]];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (uint64_t)*(double *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":now" toInt64:v3];
  [v4 bindNamedParam:":timelineClientModelId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (double)[v3 getInt64ForColumn:0];
  uint64_t v5 = [v3 getInt64ForColumn:1];

  double v6 = *(double *)(a1 + 40);
  if (v6 < v4)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    double v8 = *(double *)(v7 + 24);
    if (v8 >= v4) {
      double v8 = v4;
    }
LABEL_8:
    *(double *)(v7 + 24) = v8;
    return *MEMORY[0x1E4F93C08];
  }
  double v8 = (double)v5;
  if (v6 < (double)v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(double *)(v7 + 24) < v8) {
      double v8 = *(double *)(v7 + 24);
    }
    goto LABEL_8;
  }
  return *MEMORY[0x1E4F93C08];
}

uint64_t __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke_3_cold_1();
  }

  double v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (BOOL)rotationExistsForSuggestionWithId:(id)a3 considerStalenessRotation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if (v4) {
    uint64_t v7 = @"SELECT rotationTimestamp FROM proactiveStackRotations WHERE suggestionId = :suggestionId";
  }
  else {
    uint64_t v7 = @"SELECT rotationTimestamp FROM proactiveStackRotations WHERE suggestionId = :suggestionId AND isStalenessRotation = 0";
  }
  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__ATXInformationStore_rotationExistsForSuggestionWithId_considerStalenessRotation___block_invoke;
  v12[3] = &unk_1E5D08FE8;
  id v9 = v6;
  id v13 = v9;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__ATXInformationStore_rotationExistsForSuggestionWithId_considerStalenessRotation___block_invoke_2;
  v11[3] = &unk_1E5D09060;
  void v11[4] = &v14;
  [(_PASSqliteDatabase *)db prepAndRunQuery:v7 onPrep:v12 onRow:v11 onError:&__block_literal_global_511];
  LOBYTE(db) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)db;
}

uint64_t __83__ATXInformationStore_rotationExistsForSuggestionWithId_considerStalenessRotation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":suggestionId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __83__ATXInformationStore_rotationExistsForSuggestionWithId_considerStalenessRotation___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C08];
}

uint64_t __83__ATXInformationStore_rotationExistsForSuggestionWithId_considerStalenessRotation___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke_3_cold_1();
  }

  BOOL v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (BOOL)didSuggestionReachDurationLimit:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ATXInformationStore_didSuggestionReachDurationLimit___block_invoke;
  v9[3] = &unk_1E5D08FE8;
  id v6 = v4;
  id v10 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__ATXInformationStore_didSuggestionReachDurationLimit___block_invoke_2;
  v8[3] = &unk_1E5D09060;
  void v8[4] = &v11;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT rotationTimestamp, relevancyDurationLimit FROM proactiveStackRotations WHERE suggestionId = :suggestionId AND isStalenessRotation = 0" onPrep:v9 onRow:v8 onError:&__block_literal_global_516];
  LOBYTE(db) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)db;
}

uint64_t __55__ATXInformationStore_didSuggestionReachDurationLimit___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":suggestionId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __55__ATXInformationStore_didSuggestionReachDurationLimit___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumn:0];
  uint64_t v5 = [v3 getInt64ForColumn:1];

  if ((v5 & 0x8000000000000000) == 0)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    if (v6 - (double)v4 > (double)v5) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  return *MEMORY[0x1E4F93C08];
}

uint64_t __55__ATXInformationStore_didSuggestionReachDurationLimit___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke_3_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)proactiveRotationsForWidgetInThePastDay:(id)a3 kind:(id)a4 intent:(id)a5 filterByClientModelId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__16;
  v37 = __Block_byref_object_dispose__16;
  id v38 = (id)objc_opt_new();
  db = self->_db;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke;
  v29[3] = &unk_1E5D09230;
  id v30 = v10;
  id v31 = v11;
  id v32 = v12;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke_2;
  v23[3] = &unk_1E5D092F8;
  id v15 = v13;
  id v24 = v15;
  id v25 = v30;
  id v16 = v31;
  id v26 = v16;
  id v17 = v32;
  id v27 = v17;
  id v28 = &v33;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke_3;
  v21[3] = &unk_1E5D090A8;
  id v18 = v25;
  id v22 = v18;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT suggestionId, criterion, isStalenessRotation, rotationTimestamp, relevancyDurationLimit, coolDownTimeInterval, clientModelId FROM proactiveStackRotations WHERE widgetBundleId = :widgetBundleId AND widgetKind = :widgetKind AND intentHash = :intentHash AND isStalenessRotation = 0 AND :now - rotationTimestamp < :time_window ORDER BY rotationTimestamp" onPrep:v29 onRow:v23 onError:v21];
  id v19 = (id)v34[5];

  _Block_object_dispose(&v33, 8);

  return v19;
}

void __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:":widgetBundleId" toNSString:v3];
  [v5 bindNamedParam:":widgetKind" toNSString:*(void *)(a1 + 40)];
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 48), "atx_indexingHash"));
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [v5 bindNamedParam:":now" toInt64:(uint64_t)v4];
  [v5 bindNamedParam:":time_window" toInt64:86400];
}

uint64_t __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 getNSStringForColumnName:"clientModelId" table:0];
  id v5 = v4;
  if (!a1[4] || objc_msgSend(v4, "isEqualToString:"))
  {
    double v6 = [v3 getNSStringForColumnName:"suggestionId" table:0];
    uint64_t v7 = [v3 getNSStringForColumnName:"criterion" table:0];
    double v8 = (void *)MEMORY[0x1E4F1C9C8];
    [v3 getDoubleForColumnName:"rotationTimestamp" table:0];
    id v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    LOBYTE(v13) = 0;
    id v10 = -[ATXStackRotationRecord initWithInfoSuggestionId:clientModelId:criterion:widget:kind:intent:isStalenessRotation:rotationDate:durationLimit:coolDownInterval:]([ATXStackRotationRecord alloc], "initWithInfoSuggestionId:clientModelId:criterion:widget:kind:intent:isStalenessRotation:rotationDate:durationLimit:coolDownInterval:", v6, v5, v7, a1[5], a1[6], a1[7], (double)[v3 getInt64ForColumnName:"relevancyDurationLimit" table:0], (double)objc_msgSend(v3, "getInt64ForColumnName:table:", "coolDownTimeInterval", 0), v13, v9);
    [*(id *)(*(void *)(a1[8] + 8) + 40) addObject:v10];
  }
  id v11 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v11;
}

uint64_t __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke_3_cold_1();
  }

  double v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (BOOL)deleteExpiredProactiveStackRotations
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  db = self->_db;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__ATXInformationStore_deleteExpiredProactiveStackRotations__block_invoke_2;
  v5[3] = &unk_1E5D09038;
  v5[4] = &v6;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"DELETE FROM proactiveStackRotations WHERE :now - rotationTimestamp > :quota_window AND :now - rotationTimestamp > coolDownTimeInterval" onPrep:&__block_literal_global_525 onRow:0 onError:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __59__ATXInformationStore_deleteExpiredProactiveStackRotations__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  [v2 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":now" toInt64:(uint64_t)v3];
  [v4 bindNamedParam:":quota_window" toInt64:86400];
}

uint64_t __59__ATXInformationStore_deleteExpiredProactiveStackRotations__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_2_452_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  id v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (BOOL)recordUserRemovalOfSuggestedWidget:(id)a3 kind:(id)a4 intent:(id)a5 atDate:(id)a6 duration:(double)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  [v15 timeIntervalSinceNow];
  if (v16 <= 0.0)
  {
    uint64_t v37 = 0;
    id v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 1;
    db = self->_db;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __86__ATXInformationStore_recordUserRemovalOfSuggestedWidget_kind_intent_atDate_duration___block_invoke;
    v31[3] = &unk_1E5D09320;
    id v32 = v12;
    id v33 = v13;
    id v34 = v14;
    id v35 = v15;
    double v36 = a7;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __86__ATXInformationStore_recordUserRemovalOfSuggestedWidget_kind_intent_atDate_duration___block_invoke_2;
    v26[3] = &unk_1E5D09348;
    id v20 = v32;
    id v27 = v20;
    id v21 = v33;
    id v28 = v21;
    id v22 = v34;
    id v29 = v22;
    id v30 = &v37;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO widgetSuggestionDismiss (extensionBundleId, kind, intentHash, date, duration) VALUES (:extensionBundleId, :kind, :intentHash, :date, :duration)" onPrep:v31 onRow:0 onError:v26];
    uint64_t v23 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = *((unsigned __int8 *)v38 + 24);
      *(_DWORD *)int buf = 138413058;
      id v42 = v20;
      __int16 v43 = 2112;
      id v44 = v21;
      __int16 v45 = 2112;
      id v46 = v22;
      __int16 v47 = 1024;
      LODWORD(v48) = v24;
      _os_log_impl(&dword_1A790D000, v23, OS_LOG_TYPE_DEFAULT, "ATXInformationStore: Writing user removal of suggested widget (extBundleId %@, kind %@, intent %@) - is successful: %{BOOL}d", buf, 0x26u);
    }

    BOOL v18 = *((unsigned char *)v38 + 24) != 0;
    _Block_object_dispose(&v37, 8);
  }
  else
  {
    id v17 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138413314;
      id v42 = v12;
      __int16 v43 = 2112;
      id v44 = v13;
      __int16 v45 = 2112;
      id v46 = v14;
      __int16 v47 = 2112;
      id v48 = v15;
      __int16 v49 = 2048;
      double v50 = a7;
      _os_log_error_impl(&dword_1A790D000, v17, OS_LOG_TYPE_ERROR, "ATXInformationStore: Received call to write user removal of suggested widget with a date in the future! (extBundleId %@, kind %@, intent %@, date %@, duration %f)", buf, 0x34u);
    }

    BOOL v18 = 0;
  }

  return v18;
}

void __86__ATXInformationStore_recordUserRemovalOfSuggestedWidget_kind_intent_atDate_duration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":extensionBundleId" toNSString:v3];
  [v4 bindNamedParam:":kind" toNSString:*(void *)(a1 + 40)];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 48), "atx_indexingHash"));
  [*(id *)(a1 + 56) timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":date");
  if (*(double *)(a1 + 64) == 0.0) {
    [v4 bindNamedParamToNull:":duration"];
  }
  else {
    objc_msgSend(v4, "bindNamedParam:toDouble:", ":duration");
  }
}

uint64_t __86__ATXInformationStore_recordUserRemovalOfSuggestedWidget_kind_intent_atDate_duration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __86__ATXInformationStore_recordUserRemovalOfSuggestedWidget_kind_intent_atDate_duration___block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  id v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (id)_dateIntervalFromDismissStatement:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  [v3 getDoubleForColumnName:"date" table:0];
  id v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
  if (([v3 isNullForColumnName:"duration" table:0] & 1) == 0)
  {
    [v3 getDoubleForColumnName:"duration" table:0];
    uint64_t v7 = objc_msgSend(v5, "dateByAddingTimeInterval:");

    uint64_t v6 = (void *)v7;
  }
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v6];

  return v8;
}

- (id)dateIntervalsOfUserRemovalOfSuggestedWidget:(id)a3 kind:(id)a4 intent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__16;
  id v31 = __Block_byref_object_dispose__16;
  id v32 = (id)objc_opt_new();
  db = self->_db;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke;
  v23[3] = &unk_1E5D09230;
  id v24 = v8;
  id v25 = v9;
  id v26 = v10;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke_2;
  v22[3] = &unk_1E5D09280;
  v22[4] = self;
  v22[5] = &v27;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke_3;
  v17[3] = &unk_1E5D09348;
  id v12 = v24;
  id v18 = v12;
  id v13 = v25;
  id v19 = v13;
  id v14 = v26;
  id v20 = v14;
  id v21 = &v27;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT date, duration FROM widgetSuggestionDismiss WHERE extensionBundleId = :extensionBundleId AND kind = :kind AND intentHash = :intentHash ORDER BY date ASC" onPrep:v23 onRow:v22 onError:v17];
  id v15 = (id)v28[5];

  _Block_object_dispose(&v27, 8);

  return v15;
}

void __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":extensionBundleId" toNSString:v3];
  [v4 bindNamedParam:":kind" toNSString:*(void *)(a1 + 40)];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 48), "atx_indexingHash"));
}

uint64_t __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [*(id *)(a1 + 32) _dateIntervalFromDismissStatement:a2];
  [v2 addObject:v3];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke_3_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (id)dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__16;
  id v19 = __Block_byref_object_dispose__16;
  id v20 = (id)objc_opt_new();
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke;
  v13[3] = &unk_1E5D08FE8;
  id v14 = v4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke_2;
  v12[3] = &unk_1E5D09280;
  void v12[4] = self;
  v12[5] = &v15;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke_3;
  v9[3] = &unk_1E5D090F0;
  id v6 = v14;
  id v10 = v6;
  id v11 = &v15;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT date, duration FROM widgetSuggestionDismiss WHERE extensionBundleId = :extensionBundleId ORDER BY date ASC" onPrep:v13 onRow:v12 onError:v9];
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v7;
}

uint64_t __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":extensionBundleId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v3 = [*(id *)(a1 + 32) _dateIntervalFromDismissStatement:a2];
  [v2 addObject:v3];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke_3_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (id)dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__16;
  id v19 = __Block_byref_object_dispose__16;
  id v20 = (id)objc_opt_new();
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke;
  v13[3] = &unk_1E5D08FE8;
  id v14 = v4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke_2;
  v12[3] = &unk_1E5D09280;
  void v12[4] = self;
  v12[5] = &v15;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke_3;
  v9[3] = &unk_1E5D090F0;
  id v6 = v14;
  id v10 = v6;
  id v11 = &v15;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT date, duration FROM widgetSuggestionDismiss WHERE intentHash = :intentHash ORDER BY date ASC" onPrep:v13 onRow:v12 onError:v9];
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v7;
}

void __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(v2, "atx_indexingHash"));
}

uint64_t __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v3 = [*(id *)(a1 + 32) _dateIntervalFromDismissStatement:a2];
  [v2 addObject:v3];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke_3_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (BOOL)clearWidgetRemovalHistoryOlderThan:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__ATXInformationStore_clearWidgetRemovalHistoryOlderThan___block_invoke;
  v9[3] = &unk_1E5D08FE8;
  id v6 = v4;
  id v10 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__ATXInformationStore_clearWidgetRemovalHistoryOlderThan___block_invoke_2;
  v8[3] = &unk_1E5D09038;
  void v8[4] = &v11;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"DELETE FROM widgetSuggestionDismiss WHERE date < :date" onPrep:v9 onRow:0 onError:v8];
  LOBYTE(db) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)db;
}

void __58__ATXInformationStore_clearWidgetRemovalHistoryOlderThan___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":date");
}

uint64_t __58__ATXInformationStore_clearWidgetRemovalHistoryOlderThan___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __58__ATXInformationStore_clearWidgetRemovalHistoryOlderThan___block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (id)widgetSuggestionRemovalRecordsForDiagnostics
{
  id v3 = objc_opt_new();
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ATXInformationStore_widgetSuggestionRemovalRecordsForDiagnostics__block_invoke;
  v7[3] = &unk_1E5D09370;
  id v5 = v3;
  id v8 = v5;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT * FROM widgetSuggestionDismiss" onPrep:0 onRow:v7 onError:&__block_literal_global_571];

  return v5;
}

uint64_t __67__ATXInformationStore_widgetSuggestionRemovalRecordsForDiagnostics__block_invoke(uint64_t a1, void *a2)
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnName:"extensionBundleId" table:0];
  id v5 = [v3 getNSStringForColumnName:"kind" table:0];
  [v3 getDoubleForColumnName:"date" table:0];
  double v7 = v6;
  [v3 getDoubleForColumnName:"duration" table:0];
  double v9 = v8;

  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = @"<missing>";
  v17[0] = @"bundleId";
  v17[1] = @"kind";
  if (v4) {
    id v12 = v4;
  }
  else {
    id v12 = @"<missing>";
  }
  if (v5) {
    uint64_t v11 = v5;
  }
  v18[0] = v12;
  v18[1] = v11;
  v17[2] = @"date";
  uint64_t v13 = [NSNumber numberWithDouble:v7];
  v18[2] = v13;
  v17[3] = @"duration";
  char v14 = [NSNumber numberWithDouble:v9];
  v18[3] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  [v10 addObject:v15];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __67__ATXInformationStore_widgetSuggestionRemovalRecordsForDiagnostics__block_invoke_2()
{
  return *MEMORY[0x1E4F93C10];
}

- (id)readAllDismissRecords
{
  id v3 = (void *)os_transaction_create();
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  double v16 = __Block_byref_object_copy__16;
  uint64_t v17 = __Block_byref_object_dispose__16;
  id v18 = (id)objc_opt_new();
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__ATXInformationStore_readAllDismissRecords__block_invoke;
  v12[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v12[4] = (uint64_t)v5;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"DELETE FROM dismissRecords WHERE blockWidgetUntil < :widgetCutoff AND blockCriterionUntil < :criterionCutoff" onPrep:v12 onRow:0 onError:&__block_literal_global_579];
  double v6 = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__ATXInformationStore_readAllDismissRecords__block_invoke_583;
  v11[3] = &unk_1E5D09060;
  void v11[4] = &v13;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __44__ATXInformationStore_readAllDismissRecords__block_invoke_2_585;
  v10[3] = &unk_1E5D09038;
  void v10[4] = &v13;
  [(_PASSqliteDatabase *)v6 prepAndRunQuery:@"SELECT widgetBundleId, criterion, blockWidgetUntil, blockCriterionUntil FROM dismissRecords" onPrep:0 onRow:v11 onError:v10];
  id v7 = self;
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __44__ATXInformationStore_readAllDismissRecords__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":widgetCutoff" toInt64:v3];
  [v4 bindNamedParam:":criterionCutoff" toInt64:*(void *)(a1 + 32)];
}

uint64_t __44__ATXInformationStore_readAllDismissRecords__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __44__ATXInformationStore_readAllDismissRecords__block_invoke_2_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

uint64_t __44__ATXInformationStore_readAllDismissRecords__block_invoke_583(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  id v4 = [ATXInformationDismissRecord alloc];
  double v5 = [v3 getNSStringForColumn:0];
  double v6 = [v3 getNSStringForColumn:1];
  id v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 2));
  id v8 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v9 = [v3 getInt64ForColumn:3];

  id v10 = [v8 dateWithTimeIntervalSinceReferenceDate:(double)v9];
  uint64_t v11 = [(ATXInformationDismissRecord *)v4 initWithWidgetBundleId:v5 criterion:v6 blockWidgetUntilDate:v7 blockCriterionUntilDate:v10];
  [v2 addObject:v11];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __44__ATXInformationStore_readAllDismissRecords__block_invoke_2_585(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __44__ATXInformationStore_readAllDismissRecords__block_invoke_2_585_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  double v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (BOOL)appendDismissRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)os_transaction_create();
    uint64_t v15 = 0;
    double v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 1;
    db = self->_db;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__ATXInformationStore_appendDismissRecord___block_invoke;
    v13[3] = &unk_1E5D08FE8;
    id v14 = v4;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __43__ATXInformationStore_appendDismissRecord___block_invoke_2;
    v10[3] = &unk_1E5D090F0;
    id v11 = v14;
    id v12 = &v15;
    [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO dismissRecords (widgetBundleId, criterion, blockWidgetUntil, blockCriterionUntil) VALUES (:widgetBundleId, :criterion, :blockWidgetUntil, :blockCriterionUntil)" onPrep:v13 onRow:0 onError:v10];
    id v7 = self;
    BOOL v8 = *((unsigned char *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __43__ATXInformationStore_appendDismissRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 widgetBundleId];
  [v4 bindNamedParam:":widgetBundleId" toNSString:v5];

  double v6 = [*(id *)(a1 + 32) criterion];
  [v4 bindNamedParam:":criterion" toNSString:v6];

  id v7 = [*(id *)(a1 + 32) blockWidgetUntilDate];
  [v7 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":blockWidgetUntil" toInt64:(uint64_t)v8];

  id v10 = [*(id *)(a1 + 32) blockCriterionUntilDate];
  [v10 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":blockCriterionUntil" toInt64:(uint64_t)v9];
}

uint64_t __43__ATXInformationStore_appendDismissRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __43__ATXInformationStore_appendDismissRecord___block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (id)mostRecentTimelineEntryWithScoreForWidget:(id)a3 kind:(id)a4 family:(int64_t)a5 intentIndexingHash:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__16;
  id v30 = __Block_byref_object_dispose__16;
  id v31 = 0;
  db = self->_db;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke;
  v21[3] = &unk_1E5D09398;
  id v22 = v10;
  id v23 = v11;
  int64_t v24 = a5;
  int64_t v25 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke_2;
  v20[3] = &unk_1E5D09060;
  v20[4] = &v26;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke_3;
  v17[3] = &unk_1E5D093C0;
  id v13 = v22;
  id v18 = v13;
  id v14 = v23;
  id v19 = v14;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT timestamp, score, duration FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND widgetFamily = :widgetFamily AND intentHash = :intentHash AND timestamp <= :now AND score IS NOT NULL ORDER BY timestamp DESC LIMIT 1" onPrep:v21 onRow:v20 onError:v17];
  id v15 = (id)v27[5];

  _Block_object_dispose(&v26, 8);

  return v15;
}

void __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v5 = a2;
  [v5 bindNamedParam:":extensionBundleId" toNSString:v3];
  [v5 bindNamedParam:":widgetKind" toNSString:a1[5]];
  [v5 bindNamedParam:":widgetFamily" toInt64:a1[6]];
  [v5 bindNamedParam:":intentHash" toInt64:a1[7]];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [v5 bindNamedParam:":now" toInt64:(uint64_t)v4];
}

uint64_t __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumnName:"timestamp" table:0];
  [v3 getDoubleForColumnName:"score" table:0];
  double v6 = v5;
  [v3 getDoubleForColumnName:"duration" table:0];
  double v8 = v7;

  double v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v4];
  id v10 = [MEMORY[0x1E4F93908] relevanceWithScore:v6 duration:v8];
  uint64_t v11 = [MEMORY[0x1E4F93900] entryWithDate:v9 relevance:v10];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  id v14 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v14;
}

uint64_t __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke_3_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget:(id)a3 kind:(id)a4 familyMask:(unint64_t)a5 intent:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v35 = 0;
  double v36 = (double *)&v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v14 = v13;
  db = self->_db;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke;
  v30[3] = &unk_1E5D093E8;
  id v31 = v10;
  id v32 = v11;
  id v16 = v12;
  id v33 = v16;
  uint64_t v34 = v14;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke_2;
  v29[3] = &unk_1E5D09410;
  v29[6] = v14;
  void v29[4] = &v35;
  v29[5] = a5;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  int64_t v24 = __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke_3;
  int64_t v25 = &unk_1E5D09438;
  uint64_t v28 = &v35;
  id v17 = v31;
  id v26 = v17;
  id v18 = v32;
  id v27 = v18;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT timestamp, duration, widgetFamily FROM timelineDonations WHERE score = 0 AND extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND intentHash = :intentHash AND timestamp + duration > :now" onPrep:v30 onRow:v29 onError:&v22];
  if (v36[3] == 0.0)
  {
    id v20 = 0;
  }
  else
  {
    id v19 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    id v20 = objc_msgSend(v19, "initWithTimeIntervalSinceReferenceDate:", v36[3], v22, v23, v24, v25, v26);
  }

  _Block_object_dispose(&v35, 8);

  return v20;
}

void __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":extensionBundleId" toNSString:v3];
  [v4 bindNamedParam:":widgetKind" toNSString:*(void *)(a1 + 40)];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 48), "atx_indexingHash"));
  [v4 bindNamedParam:":now" toInt64:(uint64_t)*(double *)(a1 + 56)];
}

uint64_t __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getInt64ForColumnName:"widgetFamily" table:0];
  if (CHSWidgetFamilyMaskContainsFamily())
  {
    uint64_t v4 = [v3 getInt64ForColumnName:"timestamp" table:0];
    [v3 getDoubleForColumnName:"duration" table:0];
    if (*(double *)(a1 + 48) <= (double)v4) {
      double v5 = -0.0;
    }
    double v6 = v5 + (double)v4;
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    double v8 = *(double *)(v7 + 24);
    if (v8 == 0.0 || v6 < v8) {
      *(double *)(v7 + 24) = v6;
    }
  }
  id v10 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v10;
}

uint64_t __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  uint64_t v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke_3_cold_1();
  }

  double v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v5;
}

- (id)recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget:(id)a3 kind:(id)a4 family:(int64_t)a5 intent:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__16;
  id v32 = __Block_byref_object_dispose__16;
  id v33 = (id)objc_opt_new();
  uint64_t v13 = objc_msgSend(v12, "atx_indexingHash");
  db = self->_db;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke;
  v24[3] = &unk_1E5D09460;
  id v25 = v10;
  id v26 = v11;
  int64_t v27 = a5;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke_2;
  v23[3] = &unk_1E5D092D0;
  void v23[4] = &v28;
  void v23[5] = v13;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke_3;
  v19[3] = &unk_1E5D09208;
  id v15 = v25;
  id v20 = v15;
  id v16 = v26;
  id v21 = v16;
  uint64_t v22 = &v28;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT timestamp, score, duration, intentHash FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND widgetFamily = :widgetFamily AND score IS NOT NULL ORDER BY score DESC" onPrep:v24 onRow:v23 onError:v19];
  id v17 = (id)v29[5];

  _Block_object_dispose(&v28, 8);

  return v17;
}

void __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 bindNamedParam:":extensionBundleId" toNSString:v3];
  [v4 bindNamedParam:":widgetKind" toNSString:a1[5]];
  [v4 bindNamedParam:":widgetFamily" toInt64:a1[6]];
}

uint64_t __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumnName:"intentHash" table:0];
  if (!v4 || v4 == *(void *)(a1 + 40))
  {
    double v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    double v6 = (void *)MEMORY[0x1E4F93900];
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 0));
    double v8 = (void *)MEMORY[0x1E4F93908];
    [v3 getDoubleForColumn:1];
    double v10 = v9;
    [v3 getDoubleForColumn:2];
    id v12 = [v8 relevanceWithScore:v10 duration:v11];
    uint64_t v13 = [v6 entryWithDate:v7 relevance:v12];
    [v5 addObject:v13];
  }
  uint64_t v14 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v14;
}

uint64_t __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke_3_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  double v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (id)mostRecentTimelineUpdateDateOfWidget:(id)a3 kind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__16;
  id v21 = __Block_byref_object_dispose__16;
  id v22 = 0;
  db = self->_db;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__ATXInformationStore_mostRecentTimelineUpdateDateOfWidget_kind___block_invoke;
  v14[3] = &unk_1E5D091E0;
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v16 = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__ATXInformationStore_mostRecentTimelineUpdateDateOfWidget_kind___block_invoke_2;
  v13[3] = &unk_1E5D09060;
  void v13[4] = &v17;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT timestamp FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND timestamp <= :now ORDER BY timestamp DESC LIMIT 1" onPrep:v14 onRow:v13 onError:&__block_literal_global_612];
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __65__ATXInformationStore_mostRecentTimelineUpdateDateOfWidget_kind___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:":extensionBundleId" toNSString:v3];
  [v5 bindNamedParam:":widgetKind" toNSString:*(void *)(a1 + 40)];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [v5 bindNamedParam:":now" toInt64:(uint64_t)v4];
}

uint64_t __65__ATXInformationStore_mostRecentTimelineUpdateDateOfWidget_kind___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 getInt64ForColumn:0];

  uint64_t v7 = [v5 initWithTimeIntervalSinceReferenceDate:(double)v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return *MEMORY[0x1E4F93C08];
}

uint64_t __65__ATXInformationStore_mostRecentTimelineUpdateDateOfWidget_kind___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __65__ATXInformationStore_mostRecentTimelineUpdateDateOfWidget_kind___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (BOOL)insertTimelineEntries:(id)a3 forWidget:(id)a4
{
  return [(ATXInformationStore *)self _insertTimelineEntries:a3 forWidget:a4 storageLimit:1000];
}

- (BOOL)_insertTimelineEntries:(id)a3 forWidget:(id)a4 storageLimit:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1E4F93BB0];
  db = self->_db;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke;
  v15[3] = &unk_1E5D09488;
  id v16 = v9;
  id v17 = v8;
  unint64_t v18 = a5;
  id v12 = v8;
  id v13 = v9;
  LOBYTE(db) = ([v10 writeTransactionWithHandle:db failableBlock:v15] & 1) == 0;

  return (char)db;
}

uint64_t __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  uint64_t v3 = [v16 db];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2;
  v33[3] = &unk_1E5D08FE8;
  id v34 = *(id *)(a1 + 32);
  [v3 prepAndRunQuery:@"DELETE FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND widgetFamily = :widgetFamily AND intentHash = :intentHash AND timestamp > :now" onPrep:v33 onRow:0 onError:&__block_literal_global_617];

  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v26;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * v7);
        id v9 = [v16 db];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_621;
        v23[3] = &unk_1E5D091E0;
        void v23[4] = v8;
        id v24 = *(id *)(a1 + 32);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2_626;
        v20[3] = &unk_1E5D090F0;
        id v21 = *(id *)(a1 + 32);
        id v22 = &v29;
        [v9 prepAndRunQuery:@"INSERT OR REPLACE INTO timelineDonations (timestamp, score, duration, extensionBundleId, containerBundleIdentifier, widgetKind, widgetFamily, intentHash, suggestionId, suggestionMappingReason) VALUES (:timestamp, :score, :duration, :extensionBundleId, :containerBundleIdentifier, :widgetKind, :widgetFamily, :intentHash, :suggestionId, :suggestionMappingReason)", v23, 0, v20 onPrep onRow onError];

        LOBYTE(v8) = *((unsigned char *)v30 + 24) == 0;
        if ((v8 & 1) == 0)
        {
          id v13 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v35 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v10 = [v16 db];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_630;
  v17[3] = &unk_1E5D092A8;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 48);
  id v18 = v11;
  uint64_t v19 = v12;
  [v10 prepAndRunQuery:@"DELETE FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND widgetFamily = :widgetFamily AND intentHash = :intentHash ORDER BY timestamp DESC LIMIT -1 OFFSET :offset" onPrep:v17 onRow:0 onError:&__block_literal_global_634];

  id v13 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  id v4 = v18;
LABEL_11:
  uint64_t v14 = *v13;

  _Block_object_dispose(&v29, 8);
  return v14;
}

void __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v10 = a2;
  id v4 = [v3 extensionIdentity];
  uint64_t v5 = [v4 extensionBundleIdentifier];
  [v10 bindNamedParam:":extensionBundleId" toNSString:v5];

  uint64_t v6 = [*(id *)(a1 + 32) kind];
  [v10 bindNamedParam:":widgetKind" toNSString:v6];

  objc_msgSend(v10, "bindNamedParam:toInt64:", ":widgetFamily", objc_msgSend(*(id *)(a1 + 32), "family"));
  uint64_t v7 = [*(id *)(a1 + 32) intentReference];
  uint64_t v8 = [v7 intent];
  objc_msgSend(v10, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(v8, "atx_indexingHash"));

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [v10 bindNamedParam:":now" toInt64:(uint64_t)v9];
}

uint64_t __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

void __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_621(uint64_t a1, void *a2)
{
  id v20 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) timelineEntry];
  id v4 = [v3 date];
  [v4 timeIntervalSinceReferenceDate];
  [v20 bindNamedParam:":timestamp" toInt64:(uint64_t)v5];

  uint64_t v6 = [*(id *)(a1 + 40) extensionIdentity];
  uint64_t v7 = [v6 extensionBundleIdentifier];
  [v20 bindNamedParam:":extensionBundleId" toNSString:v7];

  uint64_t v8 = [*(id *)(a1 + 40) kind];
  [v20 bindNamedParam:":widgetKind" toNSString:v8];

  objc_msgSend(v20, "bindNamedParam:toInt64:", ":widgetFamily", objc_msgSend(*(id *)(a1 + 40), "family"));
  double v9 = [*(id *)(a1 + 40) intentReference];
  id v10 = [v9 intent];
  objc_msgSend(v20, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(v10, "atx_indexingHash"));

  id v11 = [*(id *)(a1 + 40) extensionIdentity];
  uint64_t v12 = [v11 containerBundleIdentifier];
  [v20 bindNamedParam:":containerBundleIdentifier" toNSString:v12];

  id v13 = [*(id *)(a1 + 32) suggestionId];
  [v20 bindNamedParam:":suggestionId" toNSString:v13];

  objc_msgSend(v20, "bindNamedParam:toInt64:", ":suggestionMappingReason", objc_msgSend(*(id *)(a1 + 32), "suggestionMappingReason"));
  uint64_t v14 = [*(id *)(a1 + 32) timelineEntry];
  id v15 = [v14 relevance];

  if (v15)
  {
    id v16 = [*(id *)(a1 + 32) timelineEntry];
    id v17 = [v16 relevance];
    [v17 score];
    objc_msgSend(v20, "bindNamedParam:toDouble:", ":score");

    id v18 = [*(id *)(a1 + 32) timelineEntry];
    uint64_t v19 = [v18 relevance];
    [v19 duration];
    objc_msgSend(v20, "bindNamedParam:toDouble:", ":duration");
  }
  else
  {
    [v20 bindNamedParamToNull:":score"];
    [v20 bindNamedParamToNull:":duration"];
  }
}

uint64_t __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2_626(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2_626_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  double v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

void __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_630(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v9 = a2;
  id v4 = [v3 extensionIdentity];
  double v5 = [v4 extensionBundleIdentifier];
  [v9 bindNamedParam:":extensionBundleId" toNSString:v5];

  uint64_t v6 = [*(id *)(a1 + 32) kind];
  [v9 bindNamedParam:":widgetKind" toNSString:v6];

  objc_msgSend(v9, "bindNamedParam:toInt64:", ":widgetFamily", objc_msgSend(*(id *)(a1 + 32), "family"));
  uint64_t v7 = [*(id *)(a1 + 32) intentReference];
  uint64_t v8 = [v7 intent];
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(v8, "atx_indexingHash"));

  [v9 bindNamedParam:":offset" toInteger:*(void *)(a1 + 40)];
}

uint64_t __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2_632(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2_632_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (BOOL)pruneTimelineEntries
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  db = self->_db;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__ATXInformationStore_pruneTimelineEntries__block_invoke_641;
  v5[3] = &unk_1E5D09038;
  v5[4] = &v6;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"DELETE FROM timelineDonations WHERE (timestamp IS NULL OR timestamp < :timelineRelevanceDonationExpiredTimestamp)" onPrep:&__block_literal_global_639 onRow:0 onError:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__ATXInformationStore_pruneTimelineEntries__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v4 = [v2 dateWithTimeIntervalSinceNow:-7776000.0];
  double v5 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXInformationStore: Deleting all timeline donations older than: %@", (uint8_t *)&v7, 0xCu);
  }

  [v4 timeIntervalSinceReferenceDate];
  [v3 bindNamedParam:":timelineRelevanceDonationExpiredTimestamp" toInt64:(uint64_t)v6];
}

uint64_t __43__ATXInformationStore_pruneTimelineEntries__block_invoke_641(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __43__ATXInformationStore_pruneTimelineEntries__block_invoke_641_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  double v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (BOOL)pruneInvalidSuggestions
{
  [(_PASSqliteDatabase *)self->_db prepAndRunQuery:@"DELETE FROM suggestions WHERE endDate = :distantFuture" onPrep:&__block_literal_global_646 onRow:0 onError:&__block_literal_global_649];
  return 1;
}

void __46__ATXInformationStore_pruneInvalidSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v5 = [v2 distantFuture];
  [v5 timeIntervalSinceReferenceDate];
  [v3 bindNamedParam:":distantFuture" toInt64:(uint64_t)v4];
}

uint64_t __46__ATXInformationStore_pruneInvalidSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __46__ATXInformationStore_pruneInvalidSuggestions__block_invoke_2_cold_1();
  }

  double v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)distinctScoresForWidget:(id)a3 kind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__16;
  id v24 = __Block_byref_object_dispose__16;
  id v25 = (id)objc_opt_new();
  db = self->_db;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke;
  v17[3] = &unk_1E5D091E0;
  id v18 = v6;
  id v19 = v7;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke_2;
  v16[3] = &unk_1E5D09060;
  void v16[4] = &v20;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke_3;
  v13[3] = &unk_1E5D093C0;
  id v9 = v18;
  id v14 = v9;
  id v10 = v19;
  id v15 = v10;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT DISTINCT score FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND score IS NOT NULL ORDER BY score DESC" onPrep:v17 onRow:v16 onError:v13];
  id v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v11;
}

void __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":extensionBundleId" toNSString:v3];
  [v4 bindNamedParam:":widgetKind" toNSString:*(void *)(a1 + 40)];
}

uint64_t __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v3 = NSNumber;
  [a2 getDoubleForColumn:0];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  [v2 addObject:v4];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (BOOL)updateMostRecentTapOfWidget:(id)a3 date:(id)a4
{
  return [(ATXInformationStore *)self addEngagementRecordForWidget:a3 date:a4 engagementType:1];
}

- (BOOL)updateMostRecentSignificantDwellOfWidget:(id)a3 date:(id)a4
{
  return [(ATXInformationStore *)self addEngagementRecordForWidget:a3 date:a4 engagementType:2];
}

- (BOOL)clearOutdatedWidgetEngagements
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  db = self->_db;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__ATXInformationStore_clearOutdatedWidgetEngagements__block_invoke_2;
  v5[3] = &unk_1E5D09038;
  v5[4] = &v6;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"DELETE FROM widgetEngagements WHERE (date IS NULL OR date < :cutoffTimestamp)" onPrep:&__block_literal_global_657 onRow:0 onError:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __53__ATXInformationStore_clearOutdatedWidgetEngagements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v5 = [v2 dateWithTimeIntervalSinceNow:-86400.0];
  [v5 timeIntervalSinceReferenceDate];
  [v3 bindNamedParam:":cutoffTimestamp" toInt64:(uint64_t)v4];
}

uint64_t __53__ATXInformationStore_clearOutdatedWidgetEngagements__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __53__ATXInformationStore_clearOutdatedWidgetEngagements__block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  id v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (BOOL)addEngagementRecordForWidget:(id)a3 date:(id)a4 engagementType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  db = self->_db;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__ATXInformationStore_addEngagementRecordForWidget_date_engagementType___block_invoke;
  v15[3] = &unk_1E5D09460;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  int64_t v18 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__ATXInformationStore_addEngagementRecordForWidget_date_engagementType___block_invoke_2;
  v14[3] = &unk_1E5D094B0;
  void v14[4] = &v19;
  void v14[5] = a5;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO widgetEngagements (widgetUniqueId, extensionBundleId, widgetKind, size, intentHash, date, engagementType, containerBundleIdentifier) VALUES (:widgetUniqueId, :extensionBundleId, :widgetKind, :size, :intentHash, :date, :engagementType, :containerBundleIdentifier)" onPrep:v15 onRow:0 onError:v14];
  LOBYTE(a5) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return a5;
}

void __72__ATXInformationStore_addEngagementRecordForWidget_date_engagementType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 widgetUniqueId];
  [v4 bindNamedParam:":widgetUniqueId" toNSString:v5];

  uint64_t v6 = [*(id *)(a1 + 32) extensionBundleId];
  [v4 bindNamedParam:":extensionBundleId" toNSString:v6];

  id v7 = [*(id *)(a1 + 32) widgetKind];
  [v4 bindNamedParam:":widgetKind" toNSString:v7];

  objc_msgSend(v4, "bindNamedParam:toInteger:", ":size", objc_msgSend(*(id *)(a1 + 32), "size"));
  id v8 = [*(id *)(a1 + 32) intent];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(v8, "atx_indexingHash"));

  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":date" toInt64:(uint64_t)v9];
  [v4 bindNamedParam:":engagementType" toInteger:*(void *)(a1 + 48)];
  id v10 = [*(id *)(a1 + 32) appBundleId];
  [v4 bindNamedParam:":containerBundleIdentifier" toNSString:v10];
}

uint64_t __72__ATXInformationStore_addEngagementRecordForWidget_date_engagementType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_gi();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __72__ATXInformationStore_addEngagementRecordForWidget_date_engagementType___block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  id v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (id)mostRecentEngagementOfWidget:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__16;
  id v16 = __Block_byref_object_dispose__16;
  id v17 = 0;
  db = self->_db;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke;
  v10[3] = &unk_1E5D08FE8;
  id v6 = v4;
  id v11 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_2;
  v9[3] = &unk_1E5D09060;
  void v9[4] = &v12;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT date, engagementType FROM widgetEngagements WHERE widgetUniqueId = :widgetUniqueId ORDER BY date DESC LIMIT 1" onPrep:v10 onRow:v9 onError:&__block_literal_global_671];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 widgetUniqueId];
  [v3 bindNamedParam:":widgetUniqueId" toNSString:v4];
}

uint64_t __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v5 = objc_msgSend([v3 alloc], "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "getIntegerForColumnName:table:", "date", 0));
  uint64_t v6 = [v4 getIntegerForColumnName:"engagementType" table:0];

  id v7 = [[ATXWidgetEngagementRecord alloc] initWithDate:v5 type:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  double v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v10;
}

uint64_t __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)mostRecentEngagementOfWidget:(id)a3 ofType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  int64_t v18 = __Block_byref_object_copy__16;
  uint64_t v19 = __Block_byref_object_dispose__16;
  id v20 = 0;
  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__ATXInformationStore_mostRecentEngagementOfWidget_ofType___block_invoke;
  v12[3] = &unk_1E5D092A8;
  id v8 = v6;
  id v13 = v8;
  int64_t v14 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__ATXInformationStore_mostRecentEngagementOfWidget_ofType___block_invoke_2;
  v11[3] = &unk_1E5D092D0;
  void v11[4] = &v15;
  void v11[5] = a4;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT date FROM widgetEngagements WHERE widgetUniqueId = :widgetUniqueId AND engagementType = :engagementType ORDER BY date DESC LIMIT 1" onPrep:v12 onRow:v11 onError:&__block_literal_global_676];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

void __59__ATXInformationStore_mostRecentEngagementOfWidget_ofType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 widgetUniqueId];
  [v5 bindNamedParam:":widgetUniqueId" toNSString:v4];

  [v5 bindNamedParam:":engagementType" toInteger:*(void *)(a1 + 40)];
}

uint64_t __59__ATXInformationStore_mostRecentEngagementOfWidget_ofType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 getIntegerForColumnName:"date" table:0];

  id v7 = (void *)[v5 initWithTimeIntervalSinceReferenceDate:(double)v6];
  id v8 = [[ATXWidgetEngagementRecord alloc] initWithDate:v7 type:*(void *)(a1 + 40)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v11;
}

uint64_t __59__ATXInformationStore_mostRecentEngagementOfWidget_ofType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)mostRecentEngagementOfWidget:(id)a3 kind:(id)a4 ofType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__16;
  id v24 = __Block_byref_object_dispose__16;
  id v25 = 0;
  db = self->_db;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__ATXInformationStore_mostRecentEngagementOfWidget_kind_ofType___block_invoke;
  v16[3] = &unk_1E5D09460;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  int64_t v19 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__ATXInformationStore_mostRecentEngagementOfWidget_kind_ofType___block_invoke_2;
  v15[3] = &unk_1E5D092D0;
  void v15[4] = &v20;
  v15[5] = a5;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT date FROM widgetEngagements WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND engagementType = :engagementType ORDER BY date DESC LIMIT 1" onPrep:v16 onRow:v15 onError:&__block_literal_global_681];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v13;
}

void __64__ATXInformationStore_mostRecentEngagementOfWidget_kind_ofType___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 bindNamedParam:":extensionBundleId" toNSString:v3];
  [v4 bindNamedParam:":widgetKind" toNSString:a1[5]];
  [v4 bindNamedParam:":engagementType" toInteger:a1[6]];
}

uint64_t __64__ATXInformationStore_mostRecentEngagementOfWidget_kind_ofType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 getIntegerForColumnName:"date" table:0];

  id v7 = (void *)[v5 initWithTimeIntervalSinceReferenceDate:(double)v6];
  id v8 = [[ATXWidgetEngagementRecord alloc] initWithDate:v7 type:*(void *)(a1 + 40)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v11;
}

uint64_t __64__ATXInformationStore_mostRecentEngagementOfWidget_kind_ofType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)firstEngagementOfWidget:(id)a3 kind:(id)a4 intent:(id)a5 sinceTimestamp:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__16;
  uint64_t v31 = __Block_byref_object_dispose__16;
  id v32 = 0;
  db = self->_db;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__ATXInformationStore_firstEngagementOfWidget_kind_intent_sinceTimestamp___block_invoke;
  v22[3] = &unk_1E5D094D8;
  id v15 = v10;
  id v23 = v15;
  id v16 = v11;
  id v24 = v16;
  id v17 = v12;
  id v25 = v17;
  id v18 = v13;
  id v26 = v18;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__ATXInformationStore_firstEngagementOfWidget_kind_intent_sinceTimestamp___block_invoke_2;
  v21[3] = &unk_1E5D09060;
  void v21[4] = &v27;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT date, engagementType FROM widgetEngagements WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND intentHash = :intentHash AND engagementType <> 0 AND date >= :sinceTimestamp ORDER BY date DESC LIMIT 1" onPrep:v22 onRow:v21 onError:&__block_literal_global_687];
  id v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);

  return v19;
}

void __74__ATXInformationStore_firstEngagementOfWidget_kind_intent_sinceTimestamp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:":extensionBundleId" toNSString:v3];
  [v5 bindNamedParam:":widgetKind" toNSString:*(void *)(a1 + 40)];
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 48), "atx_indexingHash"));
  [*(id *)(a1 + 56) timeIntervalSinceReferenceDate];
  [v5 bindNamedParam:":sinceTimestamp" toInt64:(uint64_t)v4];
}

uint64_t __74__ATXInformationStore_firstEngagementOfWidget_kind_intent_sinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v5 = objc_msgSend([v3 alloc], "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "getIntegerForColumnName:table:", "date", 0));
  uint64_t v6 = [v4 getIntegerForColumnName:"engagementType" table:0];

  id v7 = [[ATXWidgetEngagementRecord alloc] initWithDate:v5 type:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v10;
}

uint64_t __74__ATXInformationStore_firstEngagementOfWidget_kind_intent_sinceTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)engagementTimestampsForExtensionBundleId:(id)a3 kind:(id)a4 intent:(id)a5 engagementType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy__16;
  uint64_t v29 = __Block_byref_object_dispose__16;
  id v30 = (id)objc_opt_new();
  db = self->_db;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__ATXInformationStore_engagementTimestampsForExtensionBundleId_kind_intent_engagementType___block_invoke;
  v20[3] = &unk_1E5D093E8;
  id v14 = v10;
  id v21 = v14;
  id v15 = v11;
  id v22 = v15;
  int64_t v24 = a6;
  id v16 = v12;
  id v23 = v16;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __91__ATXInformationStore_engagementTimestampsForExtensionBundleId_kind_intent_engagementType___block_invoke_2;
  v19[3] = &unk_1E5D09060;
  void v19[4] = &v25;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT date FROM widgetEngagements WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND intentHash = :intentHash AND engagementType = :engagementType AND :now - date < :quota_window ORDER BY date" onPrep:v20 onRow:v19 onError:&__block_literal_global_692];
  id v17 = (id)v26[5];

  _Block_object_dispose(&v25, 8);

  return v17;
}

void __91__ATXInformationStore_engagementTimestampsForExtensionBundleId_kind_intent_engagementType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:":extensionBundleId" toNSString:v3];
  [v5 bindNamedParam:":widgetKind" toNSString:*(void *)(a1 + 40)];
  [v5 bindNamedParam:":engagementType" toInteger:*(void *)(a1 + 56)];
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 48), "atx_indexingHash"));
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [v5 bindNamedParam:":now" toInt64:(uint64_t)v4];
  [v5 bindNamedParam:":quota_window" toInt64:86400];
}

uint64_t __91__ATXInformationStore_engagementTimestampsForExtensionBundleId_kind_intent_engagementType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 getIntegerForColumnName:"date" table:0];

  id v7 = (void *)[v5 initWithTimeIntervalSinceReferenceDate:(double)v6];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
  uint64_t v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v8;
}

uint64_t __91__ATXInformationStore_engagementTimestampsForExtensionBundleId_kind_intent_engagementType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __91__ATXInformationStore_engagementTimestampsForExtensionBundleId_kind_intent_engagementType___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)fetchWidgetEngagementRecords
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__16;
  id v12 = __Block_byref_object_dispose__16;
  id v13 = (id)objc_opt_new();
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__ATXInformationStore_fetchWidgetEngagementRecords__block_invoke;
  v7[3] = &unk_1E5D09060;
  void v7[4] = &v8;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__ATXInformationStore_fetchWidgetEngagementRecords__block_invoke_2;
  v6[3] = &unk_1E5D09038;
  v6[4] = &v8;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT date, engagementType, extensionBundleId, widgetKind, size, containerBundleIdentifier FROM widgetEngagements LIMIT 2000" onPrep:0 onRow:v7 onError:v6];
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

uint64_t __51__ATXInformationStore_fetchWidgetEngagementRecords__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v5 = objc_msgSend([v3 alloc], "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "getIntegerForColumnName:table:", "date", 0));
  uint64_t v6 = [v4 getInt64ForColumnName:"engagementType" table:0];
  id v7 = [v4 getNSStringForColumnName:"extensionBundleId" table:0];
  uint64_t v8 = [v4 getNSStringForColumnName:"containerBundleIdentifier" table:0];
  uint64_t v9 = [v4 getNSStringForColumnName:"widgetKind" table:0];
  uint64_t v10 = [v4 getIntegerForColumnName:"size" table:0];

  id v11 = [[ATXWidgetEngagementRecord alloc] initWithDate:v5 type:v6 widgetBundleId:v7 containerBundleIdentifier:v8 widgetKind:v9 layoutSize:v10];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v11];
  id v12 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v12;
}

uint64_t __51__ATXInformationStore_fetchWidgetEngagementRecords__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __51__ATXInformationStore_fetchWidgetEngagementRecords__block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (id)fetchWidgetTapEngagementsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__16;
  id v21 = __Block_byref_object_dispose__16;
  id v22 = (id)objc_opt_new();
  db = self->_db;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__ATXInformationStore_fetchWidgetTapEngagementsBetweenStartDate_endDate___block_invoke;
  v14[3] = &unk_1E5D091E0;
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v16 = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__ATXInformationStore_fetchWidgetTapEngagementsBetweenStartDate_endDate___block_invoke_2;
  v13[3] = &unk_1E5D09060;
  void v13[4] = &v17;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT date, engagementType, extensionBundleId, containerBundleIdentifier, widgetKind, size FROM widgetEngagements WHERE date >= :startTimestamp AND date <= :endTimestamp AND engagementType = :engagementType ORDER BY date DESC LIMIT 1000" onPrep:v14 onRow:v13 onError:&__block_literal_global_704];
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __73__ATXInformationStore_fetchWidgetTapEngagementsBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  [v3 timeIntervalSinceReferenceDate];
  [v6 bindNamedParam:":startTimestamp" toInt64:(uint64_t)v4];
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  [v6 bindNamedParam:":endTimestamp" toInt64:(uint64_t)v5];
  [v6 bindNamedParam:":engagementType" toInteger:1];
}

uint64_t __73__ATXInformationStore_fetchWidgetTapEngagementsBetweenStartDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  double v5 = objc_msgSend([v3 alloc], "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "getIntegerForColumnName:table:", "date", 0));
  uint64_t v6 = [v4 getInt64ForColumnName:"engagementType" table:0];
  id v7 = [v4 getNSStringForColumnName:"extensionBundleId" table:0];
  uint64_t v8 = [v4 getNSStringForColumnName:"widgetKind" table:0];
  id v9 = [v4 getNSStringForColumnName:"containerBundleIdentifier" table:0];
  uint64_t v10 = [v4 getIntegerForColumnName:"size" table:0];

  id v11 = [[ATXWidgetEngagementRecord alloc] initWithDate:v5 type:v6 widgetBundleId:v7 containerBundleIdentifier:v9 widgetKind:v8 layoutSize:v10];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v11];
  id v12 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v12;
}

uint64_t __73__ATXInformationStore_fetchWidgetTapEngagementsBetweenStartDate_endDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __73__ATXInformationStore_fetchWidgetTapEngagementsBetweenStartDate_endDate___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)fetchWidgetTapEngagementCountSinceStartDate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__16;
  id v16 = __Block_byref_object_dispose__16;
  id v17 = (id)objc_opt_new();
  db = self->_db;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __67__ATXInformationStore_fetchWidgetTapEngagementCountSinceStartDate___block_invoke;
  v10[3] = &unk_1E5D08FE8;
  id v6 = v4;
  id v11 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__ATXInformationStore_fetchWidgetTapEngagementCountSinceStartDate___block_invoke_2;
  v9[3] = &unk_1E5D09060;
  void v9[4] = &v12;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT extensionBundleId, containerBundleIdentifier, widgetKind, size, count(1) FROM widgetEngagements WHERE date >= :startTimestamp AND engagementType = 1 GROUP BY extensionBundleId, containerBundleIdentifier, widgetKind, size LIMIT 1000" onPrep:v10 onRow:v9 onError:&__block_literal_global_713];
  id v7 = (void *)[(id)v13[5] copy];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __67__ATXInformationStore_fetchWidgetTapEngagementCountSinceStartDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":startTimestamp" toInt64:(uint64_t)v3];
}

uint64_t __67__ATXInformationStore_fetchWidgetTapEngagementCountSinceStartDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CHSWidgetFamilyFromATXStackLayoutSize([v3 getIntegerForColumnName:"size" table:0]);
  id v5 = objc_alloc(MEMORY[0x1E4F58DD8]);
  id v6 = objc_alloc(MEMORY[0x1E4F58CC0]);
  id v7 = [v3 getNSStringForColumnName:"extensionBundleId" table:0];
  uint64_t v8 = [v3 getNSStringForColumnName:"containerBundleIdentifier" table:0];
  id v9 = (void *)[v6 initWithExtensionBundleIdentifier:v7 containerBundleIdentifier:v8 deviceIdentifier:0];
  uint64_t v10 = [v3 getNSStringForColumnName:"widgetKind" table:0];
  id v11 = (void *)[v5 initWithExtensionIdentity:v9 kind:v10 family:v4 intent:0 activityIdentifier:0];

  uint64_t v12 = NSNumber;
  uint64_t v13 = [v3 getInt64ForColumn:4];

  uint64_t v14 = [v12 numberWithLongLong:v13];
  id v15 = [[ATXWidgetModeEntity alloc] initWithWidget:v11];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v14 forKeyedSubscript:v15];
  id v16 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v16;
}

uint64_t __67__ATXInformationStore_fetchWidgetTapEngagementCountSinceStartDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __67__ATXInformationStore_fetchWidgetTapEngagementCountSinceStartDate___block_invoke_3_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)fetchDistinctScoreCountForWidgets
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__16;
  uint64_t v12 = __Block_byref_object_dispose__16;
  id v13 = (id)objc_opt_new();
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__ATXInformationStore_fetchDistinctScoreCountForWidgets__block_invoke;
  v7[3] = &unk_1E5D09060;
  void v7[4] = &v8;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__ATXInformationStore_fetchDistinctScoreCountForWidgets__block_invoke_2;
  v6[3] = &unk_1E5D09038;
  v6[4] = &v8;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT extensionBundleId, widgetKind, count(distinct(score)) FROM timelineDonations WHERE score IS NOT NULL group by extensionBundleId, widgetKind" onPrep:0 onRow:v7 onError:v6];
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

uint64_t __56__ATXInformationStore_fetchDistinctScoreCountForWidgets__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnName:"extensionBundleId" table:0];
  id v5 = [v3 getNSStringForColumnName:"widgetKind" table:0];
  id v6 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v4 second:v5];
  id v7 = NSNumber;
  [v3 getDoubleForColumn:2];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v10 forKeyedSubscript:v6];

  id v11 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v11;
}

uint64_t __56__ATXInformationStore_fetchDistinctScoreCountForWidgets__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __56__ATXInformationStore_fetchDistinctScoreCountForWidgets__block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (id)fetchDistinctWidgetsIgnoringIntentSinceDate:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__16;
  id v18 = __Block_byref_object_dispose__16;
  id v19 = (id)objc_opt_new();
  if (v4) {
    uint64_t v5 = @"SELECT DISTINCT extensionBundleId, containerBundleIdentifier, widgetKind, widgetFamily FROM timelineDonations WHERE suggestionMappingReason IS NOT NULL AND suggestionId IS NOT NULL AND timestamp > :date;";
  }
  else {
    uint64_t v5 = @"SELECT DISTINCT extensionBundleId, containerBundleIdentifier, widgetKind, widgetFamily FROM timelineDonations WHERE suggestionMappingReason IS NOT NULL AND suggestionId IS NOT NULL;";
  }
  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke;
  v12[3] = &unk_1E5D08FE8;
  id v7 = v4;
  id v13 = v7;
  void v10[4] = &v14;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke_2;
  v11[3] = &unk_1E5D09060;
  void v11[4] = &v14;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke_3;
  v10[3] = &unk_1E5D09038;
  [(_PASSqliteDatabase *)db prepAndRunQuery:v5 onPrep:v12 onRow:v11 onError:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

void __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = a2;
    [v2 timeIntervalSinceReferenceDate];
    [v4 bindNamedParam:":date" toInt64:(uint64_t)v3];
  }
}

uint64_t __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = (objc_class *)MEMORY[0x1E4F58DD8];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = objc_alloc(MEMORY[0x1E4F58CC0]);
  id v7 = [v4 getNSStringForColumnName:"extensionBundleId" table:0];
  id v8 = [v4 getNSStringForColumnName:"containerBundleIdentifier" table:0];
  double v9 = (void *)[v6 initWithExtensionBundleIdentifier:v7 containerBundleIdentifier:v8 deviceIdentifier:0];
  uint64_t v10 = [v4 getNSStringForColumnName:"widgetKind" table:0];
  uint64_t v11 = [v4 getInt64ForColumnName:"widgetFamily" table:0];

  uint64_t v12 = (void *)[v5 initWithExtensionIdentity:v9 kind:v10 family:v11 intent:0 activityIdentifier:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v12];
  id v13 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v13;
}

uint64_t __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke_3_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (id)fetchAllTimelineEntriesForWidget:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__16;
  id v19 = __Block_byref_object_dispose__16;
  id v20 = (id)objc_opt_new();
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__ATXInformationStore_fetchAllTimelineEntriesForWidget___block_invoke;
  v13[3] = &unk_1E5D08FE8;
  id v14 = v4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__ATXInformationStore_fetchAllTimelineEntriesForWidget___block_invoke_2;
  v12[3] = &unk_1E5D09060;
  void v12[4] = &v15;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__ATXInformationStore_fetchAllTimelineEntriesForWidget___block_invoke_3;
  v9[3] = &unk_1E5D090F0;
  id v6 = v14;
  id v10 = v6;
  uint64_t v11 = &v15;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT timestamp, score, duration, suggestionId, suggestionMappingReason FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND containerBundleIdentifier = :containerBundleIdentifier AND suggestionMappingReason IS NOT NULL ORDER BY timestamp" onPrep:v13 onRow:v12 onError:v9];
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v7;
}

void __56__ATXInformationStore_fetchAllTimelineEntriesForWidget___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 extensionIdentity];
  id v6 = [v5 extensionBundleIdentifier];
  [v4 bindNamedParam:":extensionBundleId" toNSString:v6];

  id v7 = [*(id *)(a1 + 32) kind];
  [v4 bindNamedParam:":widgetKind" toNSString:v7];

  id v9 = [*(id *)(a1 + 32) extensionIdentity];
  id v8 = [v9 containerBundleIdentifier];
  [v4 bindNamedParam:":containerBundleIdentifier" toNSString:v8];
}

uint64_t __56__ATXInformationStore_fetchAllTimelineEntriesForWidget___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getDoubleAsNSNumberForColumnName:"score" table:0];
  uint64_t v5 = (void *)MEMORY[0x1E4F93900];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 0));
  if (v4)
  {
    id v7 = (void *)MEMORY[0x1E4F93908];
    [v4 doubleValue];
    double v9 = v8;
    [v3 getDoubleForColumnName:"duration" table:0];
    uint64_t v11 = [v7 relevanceWithScore:v9 duration:v10];
    uint64_t v12 = [v5 entryWithDate:v6 relevance:v11];
  }
  else
  {
    uint64_t v12 = [v5 entryWithDate:v6 relevance:0];
  }

  id v13 = (void *)MEMORY[0x1E4F939D8];
  id v14 = [v3 getNSStringForColumnName:"suggestionId" table:0];
  uint64_t v15 = objc_msgSend(v13, "entryMappingWithTimelineEntry:suggestionId:withSuggestionMappingReason:", v12, v14, objc_msgSend(v3, "getInt64ForColumnName:table:", "suggestionMappingReason", 0));

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v15];
  uint64_t v16 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v16;
}

uint64_t __56__ATXInformationStore_fetchAllTimelineEntriesForWidget___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __56__ATXInformationStore_fetchAllTimelineEntriesForWidget___block_invoke_3_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (id)fetchTimelineEntriesForWidget:(id)a3 sinceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  int64_t v24 = __Block_byref_object_copy__16;
  uint64_t v25 = __Block_byref_object_dispose__16;
  id v26 = (id)objc_opt_new();
  if (v7) {
    double v8 = @"SELECT timestamp, score, duration, suggestionId, suggestionMappingReason FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND widgetFamily = :widgetFamily AND containerBundleIdentifier = :containerBundleIdentifier AND suggestionMappingReason IS NOT NULL AND timestamp > :date ORDER BY timestamp";
  }
  else {
    double v8 = @"SELECT timestamp, score, duration, suggestionId, suggestionMappingReason FROM timelineDonations WHERE extensionBundleId = :extensionBundleId AND widgetKind = :widgetKind AND widgetFamily = :widgetFamily AND containerBundleIdentifier = :containerBundleIdentifier AND suggestionMappingReason IS NOT NULL ORDER BY timestamp";
  }
  db = self->_db;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__ATXInformationStore_fetchTimelineEntriesForWidget_sinceDate___block_invoke;
  v18[3] = &unk_1E5D091E0;
  id v19 = v6;
  id v10 = v7;
  id v20 = v10;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__ATXInformationStore_fetchTimelineEntriesForWidget_sinceDate___block_invoke_2;
  v17[3] = &unk_1E5D09060;
  void v17[4] = &v21;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__ATXInformationStore_fetchTimelineEntriesForWidget_sinceDate___block_invoke_3;
  v14[3] = &unk_1E5D090F0;
  id v11 = v19;
  id v15 = v11;
  uint64_t v16 = &v21;
  [(_PASSqliteDatabase *)db prepAndRunQuery:v8 onPrep:v18 onRow:v17 onError:v14];
  id v12 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v12;
}

void __63__ATXInformationStore_fetchTimelineEntriesForWidget_sinceDate___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [*(id *)(a1 + 32) extensionIdentity];
  id v4 = [v3 extensionBundleIdentifier];
  [v10 bindNamedParam:":extensionBundleId" toNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 32) kind];
  [v10 bindNamedParam:":widgetKind" toNSString:v5];

  objc_msgSend(v10, "bindNamedParam:toInt64:", ":widgetFamily", objc_msgSend(*(id *)(a1 + 32), "family"));
  id v6 = [*(id *)(a1 + 32) extensionIdentity];
  id v7 = [v6 containerBundleIdentifier];
  [v10 bindNamedParam:":containerBundleIdentifier" toNSString:v7];

  double v8 = *(void **)(a1 + 40);
  if (v8)
  {
    [v8 timeIntervalSinceReferenceDate];
    [v10 bindNamedParam:":date" toInt64:(uint64_t)v9];
  }
}

uint64_t __63__ATXInformationStore_fetchTimelineEntriesForWidget_sinceDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getDoubleAsNSNumberForColumnName:"score" table:0];
  uint64_t v5 = (void *)MEMORY[0x1E4F93900];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 0));
  if (v4)
  {
    id v7 = (void *)MEMORY[0x1E4F93908];
    [v4 doubleValue];
    double v9 = v8;
    [v3 getDoubleForColumnName:"duration" table:0];
    id v11 = [v7 relevanceWithScore:v9 duration:v10];
    id v12 = [v5 entryWithDate:v6 relevance:v11];
  }
  else
  {
    id v12 = [v5 entryWithDate:v6 relevance:0];
  }

  id v13 = (void *)MEMORY[0x1E4F939D8];
  id v14 = [v3 getNSStringForColumnName:"suggestionId" table:0];
  id v15 = objc_msgSend(v13, "entryMappingWithTimelineEntry:suggestionId:withSuggestionMappingReason:", v12, v14, objc_msgSend(v3, "getInt64ForColumnName:table:", "suggestionMappingReason", 0));

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v15];
  uint64_t v16 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v16;
}

uint64_t __63__ATXInformationStore_fetchTimelineEntriesForWidget_sinceDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __56__ATXInformationStore_fetchAllTimelineEntriesForWidget___block_invoke_3_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (int64_t)mostRecentAbuseControlOutcomeForSuggestionId:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke;
  v12[3] = &unk_1E5D08FE8;
  id v13 = v4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke_2;
  v11[3] = &unk_1E5D09060;
  void v11[4] = &v14;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke_3;
  v9[3] = &unk_1E5D090A8;
  id v6 = v13;
  id v10 = v6;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT outcome FROM abuseControlOutcomes WHERE suggestionId = :suggestionId ORDER BY timestamp DESC LIMIT 1" onPrep:v12 onRow:v11 onError:v9];
  int64_t v7 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":suggestionId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumnName:"outcome" table:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (BOOL)addAbuseControlOutcomeForSuggestion:(id)a3 forTimestamp:(int64_t)a4 outcome:(int64_t)a5
{
  id v8 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  db = self->_db;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__ATXInformationStore_addAbuseControlOutcomeForSuggestion_forTimestamp_outcome___block_invoke;
  v15[3] = &unk_1E5D09500;
  id v16 = v8;
  int64_t v17 = a4;
  int64_t v18 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__ATXInformationStore_addAbuseControlOutcomeForSuggestion_forTimestamp_outcome___block_invoke_2;
  v12[3] = &unk_1E5D090F0;
  id v10 = v16;
  id v13 = v10;
  uint64_t v14 = &v19;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT OR REPLACE INTO abuseControlOutcomes (suggestionId, timestamp, outcome) VALUES (:suggestionId, :timestamp, :outcome)" onPrep:v15 onRow:0 onError:v12];
  LOBYTE(a4) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return a4;
}

void __80__ATXInformationStore_addAbuseControlOutcomeForSuggestion_forTimestamp_outcome___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 bindNamedParam:":suggestionId" toNSString:v3];
  [v4 bindNamedParam:":timestamp" toInt64:a1[5]];
  [v4 bindNamedParam:":outcome" toInt64:a1[6]];
}

uint64_t __80__ATXInformationStore_addAbuseControlOutcomeForSuggestion_forTimestamp_outcome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __80__ATXInformationStore_addAbuseControlOutcomeForSuggestion_forTimestamp_outcome___block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (BOOL)addAbuseControlOutcomes:(id)a3
{
  id v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  uint64_t v5 = (void *)MEMORY[0x1E4F93BB0];
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke;
  v9[3] = &unk_1E5D09528;
  id v7 = v4;
  id v10 = v7;
  id v11 = v12;
  LOBYTE(v5) = ([v5 writeTransactionWithHandle:db failableBlock:v9] & 1) == 0;

  _Block_object_dispose(v12, 8);
  return (char)v5;
}

uint64_t __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        double v9 = [v3 db];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke_2;
        v15[3] = &unk_1E5D08FE8;
        void v15[4] = v8;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke_3;
        v14[3] = &unk_1E5D090F0;
        uint64_t v10 = *(void *)(a1 + 40);
        void v14[4] = v8;
        void v14[5] = v10;
        [v9 prepAndRunQuery:@"INSERT OR REPLACE INTO abuseControlOutcomes (suggestionId, timestamp, outcome) VALUES (:suggestionId, :timestamp, :outcome)", v15, 0, v14 onPrep onRow onError];

        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
        {
          uint64_t v11 = *MEMORY[0x1E4F93BF0];

          goto LABEL_11;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v11 = *MEMORY[0x1E4F93BE8];
LABEL_11:

  return v11;
}

void __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v4 = [v3 suggestionId];
  [v6 bindNamedParam:":suggestionId" toNSString:v4];

  [*(id *)(a1 + 32) timestamp];
  [v6 bindNamedParam:":timestamp" toInt64:(uint64_t)v5];
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":outcome", objc_msgSend(*(id *)(a1 + 32), "abuseControlOutcome"));
}

uint64_t __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke_3_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  double v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (BOOL)clearOldAbuseControlOutcomeData
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  db = self->_db;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__ATXInformationStore_clearOldAbuseControlOutcomeData__block_invoke_2;
  v5[3] = &unk_1E5D09038;
  v5[4] = &v6;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"DELETE FROM abuseControlOutcomes WHERE timestamp < :timestamp" onPrep:&__block_literal_global_747 onRow:0 onError:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __54__ATXInformationStore_clearOldAbuseControlOutcomeData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  [v2 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":timestamp" toInt64:(uint64_t)(v3 + -1209600.0)];
}

uint64_t __54__ATXInformationStore_clearOldAbuseControlOutcomeData__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __54__ATXInformationStore_clearOldAbuseControlOutcomeData__block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  double v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (id)fetchAbuseControlOutcomesForSuggestion:(id)a3 sinceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  int64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__16;
  uint64_t v27 = __Block_byref_object_dispose__16;
  id v28 = (id)objc_opt_new();
  if (v7) {
    uint64_t v8 = @"SELECT timestamp, outcome FROM abuseControlOutcomes WHERE suggestionId = :suggestionId AND timestamp > :timestamp ORDER BY timestamp";
  }
  else {
    uint64_t v8 = @"SELECT timestamp, outcome FROM abuseControlOutcomes WHERE suggestionId = :suggestionId ORDER BY timestamp";
  }
  db = self->_db;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke;
  v20[3] = &unk_1E5D091E0;
  id v21 = v6;
  id v10 = v7;
  id v22 = v10;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke_2;
  v17[3] = &unk_1E5D09010;
  id v18 = v21;
  long long v19 = &v23;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke_3;
  v14[3] = &unk_1E5D090F0;
  id v11 = v18;
  id v15 = v11;
  long long v16 = &v23;
  [(_PASSqliteDatabase *)db prepAndRunQuery:v8 onPrep:v20 onRow:v17 onError:v14];
  id v12 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v12;
}

void __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 bindNamedParam:":suggestionId" toNSString:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 40);
  if (v3)
  {
    [v3 timeIntervalSinceReferenceDate];
    [v5 bindNamedParam:":timestamp" toInt64:(uint64_t)v4];
  }
}

uint64_t __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (double)[v3 getInt64ForColumnName:"timestamp" table:0];
  uint64_t v5 = [v3 getIntegerForColumnName:"outcome" table:0];

  id v6 = [MEMORY[0x1E4F939E0] outcomeWithSuggestionId:*(void *)(a1 + 32) timestamp:v5 abuseControlOutcome:v4];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v7;
}

uint64_t __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke_3_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (BOOL)addStackConfigStatistics:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 1;
  uint64_t v5 = (void *)MEMORY[0x1E4F93BB0];
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke;
  v9[3] = &unk_1E5D09550;
  id v7 = v4;
  id v10 = v7;
  id v11 = v13;
  id v12 = &v15;
  [v5 writeTransactionWithHandle:db failableBlock:v9];
  LOBYTE(v5) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);

  return (char)v5;
}

uint64_t __48__ATXInformationStore_addStackConfigStatistics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
  uint64_t v5 = [v3 db];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2;
  v32[3] = &unk_1E5D08FE8;
  id v33 = v4;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3;
  v30[3] = &unk_1E5D090A8;
  id v6 = v33;
  id v31 = v6;
  [v5 prepAndRunQuery:@"DELETE FROM stackConfigurationHistory WHERE timestamp < :cutoffTimestamp" onPrep:v32 onRow:0 onError:v30];

  id v7 = [v3 db];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke_760;
  v28[3] = &unk_1E5D08FE8;
  id v29 = *(id *)(a1 + 32);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2_761;
  v25[3] = &unk_1E5D09010;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v26 = v8;
  uint64_t v27 = v9;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3_766;
  v22[3] = &unk_1E5D090F0;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 48);
  id v23 = v10;
  uint64_t v24 = v11;
  [v7 prepAndRunQuery:@"SELECT countOfSmartStacksWithWidget, countOfNonSmartStacksWithWidget, countOfStandaloneWidgets, countOfWidgetsWithUnknownStackKind FROM stackConfigurationHistory WHERE (widgetBundleId = :widgetBundleId AND widgetKind = :widgetKind AND containerBundleIdentifier = :containerBundleIdentifier AND widgetFamily = :widgetFamily) ORDER BY timestamp DESC LIMIT 1", v28, v25, v22 onPrep onRow onError];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v12 = [v3 db];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke_770;
    v20[3] = &unk_1E5D08FE8;
    id v21 = *(id *)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2_775;
    v17[3] = &unk_1E5D090F0;
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 48);
    id v18 = v13;
    uint64_t v19 = v14;
    [v12 prepAndRunQuery:@"INSERT OR REPLACE INTO stackConfigurationHistory (widgetBundleId, widgetKind, containerBundleIdentifier, widgetFamily, timestamp, countOfSmartStacksWithWidget, countOfNonSmartStacksWithWidget, countOfStandaloneWidgets, countOfWidgetsWithUnknownStackKind) VALUES (:widgetBundleId, :widgetKind, :containerBundleIdentifier, :widgetFamily, :timestamp, :countOfSmartStacksWithWidget, :countOfNonSmartStacksWithWidget, :countOfStandaloneWidgets, :countOfWidgetsWithUnknownStackKind)", v20, 0, v17 onPrep onRow onError];
  }
  uint64_t v15 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];

  return *v15;
}

void __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":cutoffTimestamp" toInt64:(uint64_t)v3];
}

uint64_t __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

void __48__ATXInformationStore_addStackConfigStatistics___block_invoke_760(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v7 = a2;
  id v4 = [v3 widgetBundleId];
  [v7 bindNamedParam:":widgetBundleId" toNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 32) widgetKind];
  [v7 bindNamedParam:":widgetKind" toNSString:v5];

  id v6 = [*(id *)(a1 + 32) containerBundleIdentifier];
  [v7 bindNamedParam:":containerBundleIdentifier" toNSString:v6];

  objc_msgSend(v7, "bindNamedParam:toInt64:", ":widgetFamily", objc_msgSend(*(id *)(a1 + 32), "widgetFamily"));
}

uint64_t __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2_761(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumnName:"countOfSmartStacksWithWidget" table:0];
  uint64_t v5 = [v3 getInt64ForColumnName:"countOfNonSmartStacksWithWidget" table:0];
  uint64_t v6 = [v3 getInt64ForColumnName:"countOfStandaloneWidgets" table:0];
  uint64_t v7 = [v3 getInt64ForColumnName:"countOfWidgetsWithUnknownStackKind" table:0];

  if (v4 == [*(id *)(a1 + 32) countOfSmartStacksWithWidget]
    && v5 == [*(id *)(a1 + 32) countOfNonSmartStacksWithWidget]
    && v6 == [*(id *)(a1 + 32) countOfStandaloneWidgets]
    && v7 == [*(id *)(a1 + 32) countOfWidgetsWithUnknownStackKind])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return *MEMORY[0x1E4F93C10];
}

uint64_t __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3_766(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3_766_cold_1(a1);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

void __48__ATXInformationStore_addStackConfigStatistics___block_invoke_770(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v9 = a2;
  uint64_t v4 = [v3 widgetBundleId];
  [v9 bindNamedParam:":widgetBundleId" toNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 32) widgetKind];
  [v9 bindNamedParam:":widgetKind" toNSString:v5];

  uint64_t v6 = [*(id *)(a1 + 32) containerBundleIdentifier];
  [v9 bindNamedParam:":containerBundleIdentifier" toNSString:v6];

  objc_msgSend(v9, "bindNamedParam:toInt64:", ":widgetFamily", objc_msgSend(*(id *)(a1 + 32), "widgetFamily"));
  uint64_t v7 = [*(id *)(a1 + 32) timestamp];
  [v7 timeIntervalSinceReferenceDate];
  [v9 bindNamedParam:":timestamp" toInt64:(uint64_t)v8];

  objc_msgSend(v9, "bindNamedParam:toInt64:", ":countOfSmartStacksWithWidget", objc_msgSend(*(id *)(a1 + 32), "countOfSmartStacksWithWidget"));
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":countOfNonSmartStacksWithWidget", objc_msgSend(*(id *)(a1 + 32), "countOfNonSmartStacksWithWidget"));
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":countOfStandaloneWidgets", objc_msgSend(*(id *)(a1 + 32), "countOfStandaloneWidgets"));
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":countOfWidgetsWithUnknownStackKind", objc_msgSend(*(id *)(a1 + 32), "countOfWidgetsWithUnknownStackKind"));
}

uint64_t __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2_775(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2_775_cold_1(a1);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (id)fetchStackConfigStatisticsForWidgetBundleId:(id)a3 widgetKind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__16;
  char v40 = __Block_byref_object_dispose__16;
  id v41 = (id)objc_opt_new();
  db = self->_db;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke;
  v31[3] = &unk_1E5D093E8;
  id v32 = v10;
  id v33 = v11;
  id v34 = v12;
  int64_t v35 = a6;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_2;
  v25[3] = &unk_1E5D095A0;
  id v29 = &v36;
  id v26 = v32;
  id v27 = v33;
  id v28 = v34;
  int64_t v30 = a6;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_4;
  v19[3] = &unk_1E5D095C8;
  id v14 = v26;
  id v20 = v14;
  id v15 = v27;
  id v21 = v15;
  id v16 = v28;
  id v23 = &v36;
  int64_t v24 = a6;
  id v22 = v16;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT countOfSmartStacksWithWidget, countOfNonSmartStacksWithWidget, countOfStandaloneWidgets, countOfWidgetsWithUnknownStackKind, timestamp FROM stackConfigurationHistory WHERE (widgetBundleId = :widgetBundleId AND widgetKind = :widgetKind AND containerBundleIdentifier = :containerBundleIdentifier AND widgetFamily = :widgetFamily) ORDER BY timestamp" onPrep:v31 onRow:v25 onError:v19];
  id v17 = (id)v37[5];

  _Block_object_dispose(&v36, 8);

  return v17;
}

void __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 bindNamedParam:":widgetBundleId" toNSString:v3];
  [v4 bindNamedParam:":widgetKind" toNSString:a1[5]];
  [v4 bindNamedParam:":containerBundleIdentifier" toNSString:a1[6]];
  [v4 bindNamedParam:":widgetFamily" toInt64:a1[7]];
}

uint64_t __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void **)(*(void *)(a1[7] + 8) + 40);
  uint64_t v6 = (void *)MEMORY[0x1E4F939B8];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_3;
  v14[3] = &unk_1E5D09578;
  id v15 = v3;
  id v10 = v3;
  id v11 = [v6 stackConfigStatisticsWithWidgetBundleId:v7 widgetKind:v8 containerBundleIdentifier:v4 widgetFamily:v9 withBlock:v14];
  [v5 addObject:v11];

  id v12 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v12;
}

void __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  double v4 = (double)[v3 getInt64ForColumnName:"timestamp" table:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v4];
  [v6 setTimestamp:v5];

  objc_msgSend(v6, "setCountOfSmartStacksWithWidget:", objc_msgSend(*(id *)(a1 + 32), "getInt64ForColumnName:table:", "countOfSmartStacksWithWidget", 0));
  objc_msgSend(v6, "setCountOfNonSmartStacksWithWidget:", objc_msgSend(*(id *)(a1 + 32), "getInt64ForColumnName:table:", "countOfNonSmartStacksWithWidget", 0));
  objc_msgSend(v6, "setCountOfStandaloneWidgets:", objc_msgSend(*(id *)(a1 + 32), "getInt64ForColumnName:table:", "countOfStandaloneWidgets", 0));
  objc_msgSend(v6, "setCountOfWidgetsWithUnknownStackKind:", objc_msgSend(*(id *)(a1 + 32), "getInt64ForColumnName:table:", "countOfWidgetsWithUnknownStackKind", 0));
}

uint64_t __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_4_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

- (unint64_t)numberOfWidgetReloadForSuggestionInPastDay
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__ATXInformationStore_numberOfWidgetReloadForSuggestionInPastDay__block_invoke;
  v8[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&void v8[4] = v4 + -86400.0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__ATXInformationStore_numberOfWidgetReloadForSuggestionInPastDay__block_invoke_2;
  v7[3] = &unk_1E5D09060;
  void v7[4] = &v9;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT count(*) FROM widgetReloadForSuggestion WHERE timestamp > :cutoffTimestamp" onPrep:v8 onRow:v7 onError:&__block_literal_global_785];
  unint64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __65__ATXInformationStore_numberOfWidgetReloadForSuggestionInPastDay__block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":cutoffTimestamp" toDouble:*(double *)(a1 + 32)];
}

uint64_t __65__ATXInformationStore_numberOfWidgetReloadForSuggestionInPastDay__block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __65__ATXInformationStore_numberOfWidgetReloadForSuggestionInPastDay__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_blending();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __65__ATXInformationStore_numberOfWidgetReloadForSuggestionInPastDay__block_invoke_3_cold_1();
  }

  double v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (BOOL)didMostRecentReloadFailForExtension:(id)a3 kind:(id)a4 intent:(id)a5 cutoffDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  db = self->_db;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __82__ATXInformationStore_didMostRecentReloadFailForExtension_kind_intent_cutoffDate___block_invoke;
  v21[3] = &unk_1E5D094D8;
  id v15 = v13;
  id v22 = v15;
  id v16 = v10;
  id v23 = v16;
  id v17 = v11;
  id v24 = v17;
  id v18 = v12;
  id v25 = v18;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__ATXInformationStore_didMostRecentReloadFailForExtension_kind_intent_cutoffDate___block_invoke_2;
  v20[3] = &unk_1E5D09060;
  void v20[4] = &v26;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT readyForDisplay FROM widgetReloadForSuggestion WHERE timestamp > :cutoffTimestamp AND extensionBundleId = :extensionBundleId AND kind = :kind AND intentHash = :intentHash ORDER BY timestamp DESC LIMIT 1" onPrep:v21 onRow:v20 onError:&__block_literal_global_791];
  LOBYTE(v10) = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return (char)v10;
}

void __82__ATXInformationStore_didMostRecentReloadFailForExtension_kind_intent_cutoffDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":cutoffTimestamp");
  [v4 bindNamedParam:":extensionBundleId" toNSString:*(void *)(a1 + 40)];
  [v4 bindNamedParam:":kind" toNSString:*(void *)(a1 + 48)];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(*(id *)(a1 + 56), "atx_indexingHash"));
}

uint64_t __82__ATXInformationStore_didMostRecentReloadFailForExtension_kind_intent_cutoffDate___block_invoke_2(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumnName:"readyForDisplay" table:0] == 0;
  return *MEMORY[0x1E4F93C10];
}

uint64_t __82__ATXInformationStore_didMostRecentReloadFailForExtension_kind_intent_cutoffDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_blending();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __82__ATXInformationStore_didMostRecentReloadFailForExtension_kind_intent_cutoffDate___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (BOOL)recordWidgetReloadForSuggestion:(id)a3 date:(id)a4 readyForDisplay:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  db = self->_db;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__ATXInformationStore_recordWidgetReloadForSuggestion_date_readyForDisplay___block_invoke;
  v15[3] = &unk_1E5D095F0;
  id v11 = v9;
  id v16 = v11;
  BOOL v18 = a5;
  id v12 = v8;
  id v17 = v12;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__ATXInformationStore_recordWidgetReloadForSuggestion_date_readyForDisplay___block_invoke_2;
  v14[3] = &unk_1E5D09038;
  void v14[4] = &v19;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT INTO widgetReloadForSuggestion (timestamp, readyForDisplay, extensionBundleId, kind, family, intentHash) VALUES (:timestamp, :readyForDisplay, :extensionBundleId, :kind, :family, :intentHash)" onPrep:v15 onRow:0 onError:v14];
  LOBYTE(db) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)db;
}

void __76__ATXInformationStore_recordWidgetReloadForSuggestion_date_readyForDisplay___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":timestamp");
  [v4 bindNamedParam:":readyForDisplay" toInteger:*(unsigned __int8 *)(a1 + 48)];
  unint64_t v5 = [*(id *)(a1 + 40) extensionIdentity];
  id v6 = [v5 extensionBundleIdentifier];
  [v4 bindNamedParam:":extensionBundleId" toNSString:v6];

  uint64_t v7 = [*(id *)(a1 + 40) kind];
  [v4 bindNamedParam:":kind" toNSString:v7];

  objc_msgSend(v4, "bindNamedParam:toInteger:", ":family", objc_msgSend(*(id *)(a1 + 40), "family"));
  id v9 = [*(id *)(a1 + 40) intentReference];
  id v8 = [v9 intent];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":intentHash", objc_msgSend(v8, "atx_indexingHash"));
}

uint64_t __76__ATXInformationStore_recordWidgetReloadForSuggestion_date_readyForDisplay___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__ATXInformationStore_recordWidgetReloadForSuggestion_date_readyForDisplay___block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  unint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (BOOL)clearOutdatedWidgetReloadEntries
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__ATXInformationStore_clearOutdatedWidgetReloadEntries__block_invoke;
  v7[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&void v7[4] = v4 + -86400.0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__ATXInformationStore_clearOutdatedWidgetReloadEntries__block_invoke_2;
  v6[3] = &unk_1E5D09038;
  v6[4] = &v8;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"DELETE FROM widgetReloadForSuggestion WHERE timestamp < :cutoffTimestamp" onPrep:v7 onRow:0 onError:v6];
  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)self;
}

uint64_t __55__ATXInformationStore_clearOutdatedWidgetReloadEntries__block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":cutoffTimestamp" toDouble:*(double *)(a1 + 32)];
}

uint64_t __55__ATXInformationStore_clearOutdatedWidgetReloadEntries__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__ATXInformationStore_clearOutdatedWidgetReloadEntries__block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  unint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (unint64_t)numberOfSuggestedWidgetsInPastDay
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__ATXInformationStore_numberOfSuggestedWidgetsInPastDay__block_invoke;
  v8[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&void v8[4] = v4 + -86400.0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__ATXInformationStore_numberOfSuggestedWidgetsInPastDay__block_invoke_2;
  v7[3] = &unk_1E5D09060;
  void v7[4] = &v9;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT count(*) FROM suggestedWidgets WHERE firstAppearDate > :cutoffTimestamp" onPrep:v8 onRow:v7 onError:&__block_literal_global_804];
  unint64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __56__ATXInformationStore_numberOfSuggestedWidgetsInPastDay__block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":cutoffTimestamp" toDouble:*(double *)(a1 + 32)];
}

uint64_t __56__ATXInformationStore_numberOfSuggestedWidgetsInPastDay__block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __56__ATXInformationStore_numberOfSuggestedWidgetsInPastDay__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_blending();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __56__ATXInformationStore_numberOfSuggestedWidgetsInPastDay__block_invoke_3_cold_1();
  }

  double v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)firstAppearDateOfSuggestedWidgetWithUniqueId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__16;
  id v16 = __Block_byref_object_dispose__16;
  id v17 = 0;
  db = self->_db;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __68__ATXInformationStore_firstAppearDateOfSuggestedWidgetWithUniqueId___block_invoke;
  v10[3] = &unk_1E5D08FE8;
  id v6 = v4;
  id v11 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__ATXInformationStore_firstAppearDateOfSuggestedWidgetWithUniqueId___block_invoke_2;
  v9[3] = &unk_1E5D09060;
  void v9[4] = &v12;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"SELECT firstAppearDate FROM suggestedWidgets WHERE widgetUniqueId = :widgetUniqueId" onPrep:v10 onRow:v9 onError:&__block_literal_global_809];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __68__ATXInformationStore_firstAppearDateOfSuggestedWidgetWithUniqueId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":widgetUniqueId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __68__ATXInformationStore_firstAppearDateOfSuggestedWidgetWithUniqueId___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 getDoubleForColumn:0];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __68__ATXInformationStore_firstAppearDateOfSuggestedWidgetWithUniqueId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_blending();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __68__ATXInformationStore_firstAppearDateOfSuggestedWidgetWithUniqueId___block_invoke_3_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (BOOL)recordSuggestedWidgetUniqueIdIfNotExist:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v6 = v5;
  db = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__ATXInformationStore_recordSuggestedWidgetUniqueIdIfNotExist___block_invoke;
  v11[3] = &unk_1E5D092A8;
  id v8 = v4;
  id v12 = v8;
  uint64_t v13 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __63__ATXInformationStore_recordSuggestedWidgetUniqueIdIfNotExist___block_invoke_2;
  v10[3] = &unk_1E5D09038;
  void v10[4] = &v14;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"INSERT OR IGNORE INTO suggestedWidgets (widgetUniqueId, firstAppearDate) VALUES (:widgetUniqueId, :firstAppearDate)" onPrep:v11 onRow:0 onError:v10];
  LOBYTE(db) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)db;
}

void __63__ATXInformationStore_recordSuggestedWidgetUniqueIdIfNotExist___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":widgetUniqueId" toNSString:v3];
  [v4 bindNamedParam:":firstAppearDate" toDouble:*(double *)(a1 + 40)];
}

uint64_t __63__ATXInformationStore_recordSuggestedWidgetUniqueIdIfNotExist___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__ATXInformationStore_recordSuggestedWidgetUniqueIdIfNotExist___block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (BOOL)clearOutdatedSuggestedWidgetEntries
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ATXInformationStore_clearOutdatedSuggestedWidgetEntries__block_invoke;
  v7[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&void v7[4] = v4 + -86400.0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__ATXInformationStore_clearOutdatedSuggestedWidgetEntries__block_invoke_2;
  v6[3] = &unk_1E5D09038;
  v6[4] = &v8;
  [(_PASSqliteDatabase *)db prepAndRunQuery:@"DELETE FROM suggestedWidgets WHERE firstAppearDate < :cutoffTimestamp" onPrep:v7 onRow:0 onError:v6];
  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)self;
}

uint64_t __58__ATXInformationStore_clearOutdatedSuggestedWidgetEntries__block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":cutoffTimestamp" toDouble:*(double *)(a1 + 32)];
}

uint64_t __58__ATXInformationStore_clearOutdatedSuggestedWidgetEntries__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__ATXInformationStore_clearOutdatedSuggestedWidgetEntries__block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_cachedSuggestionsPath, 0);

  objc_storeStrong((id *)&self->_databasePath, 0);
}

- (void)_openDatabase
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "ATXInformationStore: Could not configure Sqlite database", v2, v3, v4, v5, v6);
}

- (void)_handleCorruptionIfNeeded
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_1_1(&dword_1A790D000, v1, v2, "ATXInformationStore failed to remove corruption marker at %@. Error: %{public}@", (void)v3, DWORD2(v3));
}

- (void)_openSqliteDatabaseAtPath:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_1_1(&dword_1A790D000, v1, v2, "ATXInformationStore failed to open a sqlite database at %@. Error: %{public}@)", (void)v3, DWORD2(v3));
}

void __41__ATXInformationStore__configureDatabase__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXInformationStore: Error configuring sqlite database: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_migrateDatabaseIfNeeded
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXInformationStore: unrecoverable failure", v2, v3, v4, v5, v6);
}

- (void)readCachedSuggestions
{
}

void __44__ATXInformationStore_readCachedSuggestions__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_27();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_19(v1) suggestionId];
  uint64_t v3 = [*(id *)(v0 + 32) sourceId];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_5(&dword_1A790D000, v4, v5, "ATXInformationStore: error reconstructing suggestion (id: %@, source: %@) from data blob in DB.", v6, v7, v8, v9, v10);
}

void __44__ATXInformationStore_readCachedSuggestions__block_invoke_358_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error reading most recently cached info suggestion from database - %{public}@", v2, v3, v4, v5, v6);
}

- (void)writeCacheWithNewSuggestions:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "ATXInformationStore: Error serializing suggestions to protobuf data", v2, v3, v4, v5, v6);
}

- (void)writeCacheWithNewSuggestions:.cold.2()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_34(&dword_1A790D000, v1, v2, "ATXInformationStore: Couldn't create info engine cache file at path %@: [%i] %s", v3, v4, v5, v6, v7);
}

void __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_35();
  objc_msgSend(v1, "getNSStringForColumn:");
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_24(), "getNSStringForColumn:");
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_5(&dword_1A790D000, v3, v4, "ATXInformationStore: error reconstructing suggestion (id: %@, source: %@) from data blob in DB.", v5, v6, v7, v8, v9);
}

void __45__ATXInformationStore_readAllInfoSuggestions__block_invoke_363_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error reading info suggestion from database - %@", v2, v3, v4, v5, v6);
}

void __55__ATXInformationStore_readCurrentlyRelevantSuggestions__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_35();
  objc_msgSend(v1, "getNSStringForColumn:");
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_24(), "getNSStringForColumn:");
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v3, v4, "ATXInformationStore: error reconstructing suggestion (id: %@, source: %@) from data blob in DB.", v5, v6, v7, v8, v9);
}

void __66__ATXInformationStore_latestInfoSuggestionRelevantNowForSourceId___block_invoke_380_cold_1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_3(&dword_1A790D000, v0, v1, "ATXInformationStore: error while fetching info suggestion with the latest date for source (id: %@) - %@");
}

void __63__ATXInformationStore_criterionOfInfoSuggestionWithIdentifier___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error reading criterion from database - %@", v2, v3, v4, v5, v6);
}

void __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error reading earliest future start date among suggestions from database - %@", v2, v3, v4, v5, v6);
}

void __57__ATXInformationStore_earliestFutureSuggestionChangeDate__block_invoke_3_396_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error reading earliest future end date among suggestions from database - %@", v2, v3, v4, v5, v6);
}

void __51__ATXInformationStore_latestUpdateDateForSourceId___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_3(&dword_1A790D000, v0, v1, "ATXInformationStore: error while fetching timeof last update for info suggestion for source (id: %@) - %@");
}

void __58__ATXInformationStore_numberOfInfoSuggestionsForSourceId___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_3(&dword_1A790D000, v0, v1, "ATXInformationStore: error while fetching count of timeline entries for source (id: %@) - %@");
}

void __69__ATXInformationStore_numberOfInfoSuggestionsForAppBundleIdentifier___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_3(&dword_1A790D000, v0, v1, "ATXInformationStore: error while fetching count of timeline entries for bundleId (id: %@) - %@");
}

void __44__ATXInformationStore_writeInfoSuggestions___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  os_log_t v1 = [(id)OUTLINED_FUNCTION_19(v0) suggestionIdentifier];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1_5(&dword_1A790D000, v2, v3, "ATXInformationStore: error writing info suggestion (id: %@) - %@", v4, v5, v6, v7, 2u);
}

void __55__ATXInformationStore_updateEndDateForInfoSuggestions___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  os_log_t v1 = [(id)OUTLINED_FUNCTION_19(v0) suggestionIdentifier];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1_5(&dword_1A790D000, v2, v3, "ATXInformationStore: error while updating the end date for Information Suggestion (id: %@) - %@", v4, v5, v6, v7, 2u);
}

void __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [(id)OUTLINED_FUNCTION_30(v3) suggestionIdentifier];
  uint64_t v5 = [*(id *)(v2 + 32) sourceIdentifier];
  int v7 = 138412802;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint8_t v10 = v5;
  __int16 v11 = 2114;
  uint64_t v12 = v1;
  OUTLINED_FUNCTION_12_0(&dword_1A790D000, v0, v6, "ATXInformationStore: error deleting info suggestion (id: %@, source: %@) - %{public}@", (uint8_t *)&v7);
}

void __77__ATXInformationStore_atomicallyDeleteInfoSuggestions_insertInfoSuggestions___block_invoke_2_436_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_19(v0) suggestionIdentifier];
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1_5(&dword_1A790D000, v2, v3, "ATXInformationStore: error writing info suggestion (id: %@) - %{public}@", v4, v5, v6, v7, v8);
}

void __44__ATXInformationStore_deleteInfoSuggestion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_30(v2) suggestionIdentifier];
  uint64_t v4 = [*(id *)(v1 + 32) sourceIdentifier];
  int v6 = 138412802;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_12_0(&dword_1A790D000, v0, v5, "ATXInformationStore: error deleting info suggestion (id: %@, source: %@) - %@", (uint8_t *)&v6);
}

void __74__ATXInformationStore_deleteAllInfoSuggestionsWithSourceIdentifier_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_3(&dword_1A790D000, v0, v1, "ATXInformationStore: error deleting info suggestions from source (id: %@) - %@");
}

void __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error reading the expired suggestions to be deleted - %{public}@", v2, v3, v4, v5, v6);
}

void __47__ATXInformationStore_deleteExpiredSuggestions__block_invoke_2_452_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error deleting expired suggestions - %@", v2, v3, v4, v5, v6);
}

void __77__ATXInformationStore_deleteAllSuggestionsForSourceId_excludingSuggestionId___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_28(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_9_0(&dword_1A790D000, v0, v1, "ATXInformationStore: error deleting suggestions for sourceIdentifier %@ (excluding %@) - %@");
}

void __76__ATXInformationStore_recordSuggestionPassedTimelineFiltersForTheFirstTime___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  os_log_t v1 = [(id)OUTLINED_FUNCTION_19(v0) suggestionIdentifier];
  OUTLINED_FUNCTION_8_1();
}

void __71__ATXInformationStore_firstTimeAtWhichSuggestionPassedTimelineFilters___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  os_log_t v1 = [(id)OUTLINED_FUNCTION_19(v0) suggestionIdentifier];
  OUTLINED_FUNCTION_8_1();
}

- (void)insertOrIgnoreProactiveStackRotationRecord:(void *)a1 .cold.1(void *a1)
{
  os_log_t v1 = [a1 intent];
  OUTLINED_FUNCTION_2(&dword_1A790D000, v2, v3, "ATXInformationStore: unable to serialize intent %@ due to %@", v4, v5, v6, v7, 2u);
}

void __66__ATXInformationStore_insertOrIgnoreProactiveStackRotationRecord___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  os_log_t v1 = [(id)OUTLINED_FUNCTION_19(v0) extensionBundleId];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1_5(&dword_1A790D000, v2, v3, "ATXInformationStore: error recording proactive stack rotation for widget %@ due to %@", v4, v5, v6, v7, 2u);
}

void __117__ATXInformationStore_mostRecentRotationRecordForWidget_kind_intent_considerStalenessRotation_filterByClientModelId___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_3(&dword_1A790D000, v0, v1, "ATXInformationStore: error recording proactive stack rotation for widget %@ due to %@");
}

void __71__ATXInformationStore_mostRecentRotationRecordForSuggestionIdentifier___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E4F143B8]);
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = "-[ATXInformationStore mostRecentRotationRecordForSuggestionIdentifier:]_block_invoke_3";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = v0;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_9_0(&dword_1A790D000, v1, v2, "%s: suggestionId %@, error %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], v1);
}

void __89__ATXInformationStore_nextImportantDateAmongTimelineInducedProactiveStackRotationRecords__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error reading proactive stack rotation table from database - %@", v2, v3, v4, v5, v6);
}

void __97__ATXInformationStore_proactiveRotationsForWidgetInThePastDay_kind_intent_filterByClientModelId___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_3(&dword_1A790D000, v0, v1, "ATXInformationStore: error fetching proactive stack rotations for widget %@ due to %@");
}

void __86__ATXInformationStore_recordUserRemovalOfSuggestedWidget_kind_intent_atDate_duration___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_29(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_32(&dword_1A790D000, v0, v1, "ATXInformationStore: Error writing user removal of suggested widget (extBundleId %@, kind %@, intent %@) - %@");
}

void __79__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidget_kind_intent___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_29(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_32(&dword_1A790D000, v0, v1, "ATXInformationStore: Error querying widgetSuggestionDismiss for widget (extBundleId %@, kind %@, intent %@) - %@");
}

void __88__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_3(&dword_1A790D000, v0, v1, "ATXInformationStore: Error querying widgetSuggestionDismiss for extensionBundleId %@ - %@");
}

void __77__ATXInformationStore_dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_3(&dword_1A790D000, v0, v1, "ATXInformationStore: Error querying widgetSuggestionDismiss for intent %@ - %@");
}

void __58__ATXInformationStore_clearWidgetRemovalHistoryOlderThan___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: Error removing entries from widgetSuggestionDismiss - %@", v2, v3, v4, v5, v6);
}

void __44__ATXInformationStore_readAllDismissRecords__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error removing dismiss record from database - %@", v2, v3, v4, v5, v6);
}

void __44__ATXInformationStore_readAllDismissRecords__block_invoke_2_585_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error reading dismiss record from database - %@", v2, v3, v4, v5, v6);
}

void __43__ATXInformationStore_appendDismissRecord___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_30(v2) widgetBundleId];
  uint64_t v4 = [*(id *)(v1 + 32) criterion];
  int v6 = 138412802;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_12_0(&dword_1A790D000, v0, v5, "ATXInformationStore: error inserting dismiss record (widget: %@, criterion: %@) - %@", (uint8_t *)&v6);
}

void __96__ATXInformationStore_mostRecentTimelineEntryWithScoreForWidget_kind_family_intentIndexingHash___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_28(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_9_0(&dword_1A790D000, v0, v1, "ATXInformationStore: error reading mostRecentTimelineEntryWithScore for extensionBundleId %@ and kind %@ - %{public}@");
}

void __104__ATXInformationStore_upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget_kind_familyMask_intent___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_28(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_9_0(&dword_1A790D000, v0, v1, "ATXInformationStore: error reading upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget for extensionBundleId %@ and kind %@ - %{public}@");
}

void __105__ATXInformationStore_recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget_kind_family_intent___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_28(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_9_0(&dword_1A790D000, v0, v1, "ATXInformationStore: error reading recent relevant timeline entries for extensionBundleId %@ and kind %@ - %@");
}

void __65__ATXInformationStore_mostRecentTimelineUpdateDateOfWidget_kind___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error reading mostRecentTimelineUpdateOfWidget - %@", v2, v3, v4, v5, v6);
}

void __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error expunging future entries from timelineDonations - %@", v2, v3, v4, v5, v6);
}

void __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2_626_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_30(v2) extensionIdentity];
  uint64_t v4 = [v3 extensionBundleIdentifier];
  uint64_t v5 = [*(id *)(v1 + 32) kind];
  int v7 = 138412802;
  uint8_t v8 = v4;
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_12_0(&dword_1A790D000, v0, v6, "ATXInformationStore: error writing entry for extensionBundleId %@ and kind %@ - %@", (uint8_t *)&v7);
}

void __69__ATXInformationStore__insertTimelineEntries_forWidget_storageLimit___block_invoke_2_632_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error expunging old entries from timelineDonations - %{public}@", v2, v3, v4, v5, v6);
}

void __43__ATXInformationStore_pruneTimelineEntries__block_invoke_641_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: Error encountered while pruning the timeline donations table - %{public}@", v2, v3, v4, v5, v6);
}

void __46__ATXInformationStore_pruneInvalidSuggestions__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error deleting invalid suggestions - %@", v2, v3, v4, v5, v6);
}

void __52__ATXInformationStore_distinctScoresForWidget_kind___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_28(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_9_0(&dword_1A790D000, v0, v1, "ATXInformationStore: error fetching distinct relevance scores for extensionBundleId %@ and widgetKind %@ - %@");
}

void __53__ATXInformationStore_clearOutdatedWidgetEngagements__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error expunging outdated entries from widgetEngagements - %{public}@", v2, v3, v4, v5, v6);
}

void __72__ATXInformationStore_addEngagementRecordForWidget_date_engagementType___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = NSStringForATXWidgetEngagementType(*(void *)(v0 + 40));
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1_5(&dword_1A790D000, v2, v3, "ATXInformationStore: error upserting event of type %{}@ for widget - %{public}@", v4, v5, v6, v7, v8);
}

void __52__ATXInformationStore_mostRecentEngagementOfWidget___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error reading most recent engagement for widget - %{public}@", v2, v3, v4, v5, v6);
}

void __91__ATXInformationStore_engagementTimestampsForExtensionBundleId_kind_intent_engagementType___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error reading widget engagement timestamps for widget - %{public}@", v2, v3, v4, v5, v6);
}

void __51__ATXInformationStore_fetchWidgetEngagementRecords__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore (fetchWidgetEngagementRecords): error fetching widget engagement records - %{public}@", v2, v3, v4, v5, v6);
}

void __73__ATXInformationStore_fetchWidgetTapEngagementsBetweenStartDate_endDate___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore (fetchWidgetTapEngagementsBetweenStartDate:endDate): error fetching widget engagement records - %{public}@", v2, v3, v4, v5, v6);
}

void __67__ATXInformationStore_fetchWidgetTapEngagementCountSinceStartDate___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore (fetchWidgetTapEngagementCountSinceStartDate): error fetching widget engagement counts - %{public}@", v2, v3, v4, v5, v6);
}

void __56__ATXInformationStore_fetchDistinctScoreCountForWidgets__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore (fetchDistinctScoreCountForWidgets): error fetching distinct count of scores for widgets - %{public}@", v2, v3, v4, v5, v6);
}

void __67__ATXInformationStore_fetchDistinctWidgetsIgnoringIntentSinceDate___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore (fetchDistinctWidgetsIgnoringIntentSinceDate): error reading distinct widgets - %{public}@", v2, v3, v4, v5, v6);
}

void __56__ATXInformationStore_fetchAllTimelineEntriesForWidget___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2_3(&dword_1A790D000, v1, v2, "ATXInformationStore: error reading relevant timeline entries for widget %@ - %{public}@", (void)v3, DWORD2(v3));
}

void __68__ATXInformationStore_mostRecentAbuseControlOutcomeForSuggestionId___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2_3(&dword_1A790D000, v1, v2, "ATXInformationStore: error reading most recent abuse control outcome for suggestionID %{public}@ - %{public}@", (void)v3, DWORD2(v3));
}

void __80__ATXInformationStore_addAbuseControlOutcomeForSuggestion_forTimestamp_outcome___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2_3(&dword_1A790D000, v1, v2, "ATXInformationStore: error inserting new abuse control outcome for suggestion %{public}@ - %{public}@", (void)v3, DWORD2(v3));
}

void __47__ATXInformationStore_addAbuseControlOutcomes___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_19(v0) suggestionId];
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1_5(&dword_1A790D000, v2, v3, "ATXInformationStore: error writing abuse control outcome for suggestionId %{public}@ - %{public}@", v4, v5, v6, v7, v8);
}

void __54__ATXInformationStore_clearOldAbuseControlOutcomeData__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXInformationStore: error clearing old abuse control outcome data - %{public}@", v2, v3, v4, v5, v6);
}

void __72__ATXInformationStore_fetchAbuseControlOutcomesForSuggestion_sinceDate___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2_3(&dword_1A790D000, v1, v2, "ATXInformationStore: error fetching relevant abuse control outcomes for suggestion %{public}@ - %{public}@", (void)v3, DWORD2(v3));
}

void __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  [(id)OUTLINED_FUNCTION_19(v0) timeIntervalSinceReferenceDate];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1_5(&dword_1A790D000, v1, v2, "ATXInformationStore: error removing rows from stackConfigurationHistory that are older than %f - %{public}@", v3, v4, v5, v6, 2u);
}

void __48__ATXInformationStore_addStackConfigStatistics___block_invoke_3_766_cold_1(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) widgetBundleId];
  uint64_t v3 = [*(id *)(a1 + 32) widgetKind];
  uint64_t v4 = [*(id *)(a1 + 32) containerBundleIdentifier];
  [*(id *)(a1 + 32) widgetFamily];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_33(&dword_1A790D000, v5, v6, "ATXInformationStore: error reading stackConfigurationHistory for widgetBundleId (%@) widgetKind (%@), containerBundleIdentifier (%@) widgetFamily(%ld) - %{public}@", v7, v8, v9, v10, v11);
}

void __48__ATXInformationStore_addStackConfigStatistics___block_invoke_2_775_cold_1(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) widgetBundleId];
  uint64_t v3 = [*(id *)(a1 + 32) widgetKind];
  uint64_t v4 = [*(id *)(a1 + 32) containerBundleIdentifier];
  [*(id *)(a1 + 32) widgetFamily];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_33(&dword_1A790D000, v5, v6, "ATXInformationStore: error inserting new stack configuration statistics for widgetBundleId (%@) widgetKind (%@), containerBundleIdentifier (%@) widgetFamily(%ld). Error: %{public}@", v7, v8, v9, v10, v11);
}

void __117__ATXInformationStore_fetchStackConfigStatisticsForWidgetBundleId_widgetKind_containerBundleIdentifier_widgetFamily___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_29(*MEMORY[0x1E4F143B8]);
  uint64_t v1 = *(void *)(v0 + 64);
  int v7 = 138413314;
  uint64_t v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = v3;
  __int16 v11 = 2112;
  uint64_t v12 = v4;
  __int16 v13 = 2048;
  uint64_t v14 = v1;
  __int16 v15 = 2112;
  uint64_t v16 = v5;
  _os_log_fault_impl(&dword_1A790D000, v6, OS_LOG_TYPE_FAULT, "ATXInformationStore: error fetching stack confiugration history for widgetBundleId %@, widgetKind: %@, containerBundleIdentifier: %@, widgetFamily: %lld. Error: %@", (uint8_t *)&v7, 0x34u);
}

void __65__ATXInformationStore_numberOfWidgetReloadForSuggestionInPastDay__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXInformationStore: Error numberOfWidgetReloadForSuggestionInPastDay - %{public}@", v2, v3, v4, v5, v6);
}

void __82__ATXInformationStore_didMostRecentReloadFailForExtension_kind_intent_cutoffDate___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXInformationStore: Error didReloadFailRecentlyForWidget - %{public}@", v2, v3, v4, v5, v6);
}

void __76__ATXInformationStore_recordWidgetReloadForSuggestion_date_readyForDisplay___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXInformationStore: Error recordWidgetReloadForSuggestionAtDate - %{public}@", v2, v3, v4, v5, v6);
}

void __55__ATXInformationStore_clearOutdatedWidgetReloadEntries__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXInformationStore: Error clearOutdatedWidgetReloadEntries - %{public}@", v2, v3, v4, v5, v6);
}

void __56__ATXInformationStore_numberOfSuggestedWidgetsInPastDay__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXInformationStore: Error numberOfSuggestedWidgetsInPastDay - %{public}@", v2, v3, v4, v5, v6);
}

void __68__ATXInformationStore_firstAppearDateOfSuggestedWidgetWithUniqueId___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXInformationStore: Error firstAppearDateOfSuggestedWidgetWithUniqueId - %{public}@", v2, v3, v4, v5, v6);
}

void __63__ATXInformationStore_recordSuggestedWidgetUniqueIdIfNotExist___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXInformationStore: Error recordSuggestedWidgetUniqueIdIfNotExist - %{public}@", v2, v3, v4, v5, v6);
}

void __58__ATXInformationStore_clearOutdatedSuggestedWidgetEntries__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXInformationStore: Error clearOutdatedSuggestedWidgetEntries - %{public}@", v2, v3, v4, v5, v6);
}

@end