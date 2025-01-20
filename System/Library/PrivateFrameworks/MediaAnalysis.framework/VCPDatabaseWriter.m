@interface VCPDatabaseWriter
+ (double)_ageOutIntervalForChangeTokenType:(unint64_t)a3;
+ (id)assetTypePredicatesStringWithMediaType:(int64_t)a3 mediaSubtypes:(unint64_t)a4 imageOnlyAnalysis:(BOOL)a5;
+ (id)databaseForPhotoLibrary:(id)a3;
+ (id)databaseWithFilepath:(id)a3;
+ (id)initializationCommand:(int)a3;
- (BOOL)exists;
- (BOOL)hasOutstandingTransactions;
- (BOOL)isPrioritizedLocalIdentifier:(id)a3;
- (BOOL)keyExistsInKeyValueStore:(id)a3;
- (BOOL)shouldPropagateError:(int *)a3 finalAttempt:(BOOL)a4;
- (VCPDatabaseWriter)initWithFilepath:(id)a3;
- (VCPDatabaseWriter)initWithPhotoLibrary:(id)a3;
- (id)creationDate;
- (id)photoLibrary;
- (id)queryPrioritizedLocalIdentifiersWithMediaType:(int64_t)a3 mediaSubtypes:(unint64_t)a4 shouldNegateSubtypes:(BOOL)a5 limit:(unint64_t)a6;
- (int)_deleteAsset:(id)a3;
- (int)_deleteResult:(id)a3 forAssetId:(int64_t)a4;
- (int)_getBlacklistCountForLocalIdentifier:(id)a3 count:(int *)a4;
- (int)_getBlacklistExpiredCount:(id)a3 count:(int *)a4;
- (int)_queryPropertiesForAsset:(id)a3 assetId:(int64_t *)a4 analysis:(id *)a5;
- (int)_queryResultsForAssetId:(int64_t)a3 analysis:(id)a4;
- (int)_queryValue:(int64_t *)a3 forKey:(id)a4;
- (int)_removeAllProcessingStatusForTaskID:(unint64_t)a3;
- (int)_removeKey:(id)a3;
- (int)_removeProgressRecordsBeforeDate:(id)a3;
- (int)_removeProgressRecordsBeyondMaximum:(unint64_t)a3;
- (int)_removeSchedulingHistoryForStartTimeBefore:(id)a3;
- (int)_setValue:(int64_t)a3 forKey:(id)a4;
- (int)_storeAnalysis:(id)a3 forLocalIdentifier:(id)a4;
- (int)_storeProgressForActivityID:(unint64_t)a3 withAnalysisSubtype:(unint64_t)a4 version:(unint64_t)a5 processedAssetCount:(unint64_t)a6 totalAssetCount:(unint64_t)a7;
- (int)_storeProperties:(id)a3 forLocalIdentifier:(id)a4 assetId:(int64_t *)a5;
- (int)_storeResult:(id)a3 withKey:(id)a4 forAssetId:(int64_t)a5;
- (int)_storeSchedulingHistoryForActivityID:(unint64_t)a3 andStartTime:(id)a4;
- (int)_updateAnalysis:(id)a3 withAnalysis:(id)a4 forAsset:(id)a5 withAssetId:(int64_t)a6;
- (int)_updateAnalysisInfoOnAnalysisVersionChange;
- (int)_updateAnalysisInfoWithCurrentVersion:(int)a3 andTimestamp:(int64_t)a4 forTaskID:(unint64_t)a5;
- (int)_updateOperatingSystemVersion;
- (int)_updateProperties:(id)a3 forAssetId:(int64_t)a4;
- (int)addAssetToBlacklist:(id)a3;
- (int)ageOutBlacklistBefore:(id)a3 count:(int *)a4;
- (int)analysisForAsset:(id)a3 analysis:(id *)a4;
- (int)beginTransaction;
- (int)bumpAnalysisVersionForAsset:(id)a3;
- (int)cacheCurrentFaceProgress;
- (int)cacheProcessedAssetCountAfterPromoter:(unint64_t)a3;
- (int)clearPrioritizedAssets;
- (int)commit;
- (int)commitTransaction;
- (int)containsAsset:(id)a3 result:(BOOL *)a4;
- (int)decrementBlacklistCountForLocalIdentifier:(id)a3;
- (int)deleteAnalysisForAsset:(id)a3;
- (int)executeDatabaseBlock:(id)a3 fallbackBlock:(id)a4 write:(BOOL)a5;
- (int)fetchAllMomentsScheduledAssets:(id *)a3;
- (int)fetchEligibleToRetryLocalIdentifiers:(id *)a3 processingStatus:(unint64_t)a4 taskID:(unint64_t)a5 fetchLimit:(unint64_t)a6 additionalPredicates:(id)a7;
- (int)fetchEligibleToRetryLocalIdentifiers:(id *)a3 withProcessingStatus:(unint64_t)a4 andTaskID:(unint64_t)a5 andFetchLimit:(unint64_t)a6;
- (int)fetchLocalIdentifiers:(id *)a3 processingStatus:(unint64_t)a4 taskID:(unint64_t)a5 attempts:(int)a6 fetchLimit:(unint64_t)a7 additionalPredicates:(id)a8;
- (int)fetchLocalIdentifiers:(id *)a3 taskID:(unint64_t)a4 processingStatus:(unint64_t)a5 additionalPredicates:(id)a6;
- (int)fetchLocalIdentifiers:(id *)a3 taskID:(unint64_t)a4 processingStatus:(unint64_t)a5 errorCode:(int64_t)a6 sinceDate:(id)a7 additionalPredicates:(id)a8;
- (int)fetchLocalIdentifiers:(id *)a3 withProcessingStatus:(unint64_t)a4 andTaskID:(unint64_t)a5 andAttempts:(int)a6 andFetchLimit:(unint64_t)a7;
- (int)fetchLocalIdentifiers:(id *)a3 withTaskID:(unint64_t)a4 andProcessingStatus:(unint64_t)a5;
- (int)fetchLocalIdentifiers:(id *)a3 withTaskID:(unint64_t)a4 andProcessingStatus:(unint64_t)a5 errorCode:(int64_t)a6 sinceDate:(id)a7;
- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 taskID:(unint64_t)a4 excludingStatuses:(id)a5 fetchLimit:(unint64_t)a6 additionalPredicates:(id)a7;
- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 taskID:(unint64_t)a4 includingStatuses:(id)a5 fetchLimit:(unint64_t)a6 additionalPredicates:(id)a7;
- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 withTaskID:(unint64_t)a4 andFetchLimit:(unint64_t)a5;
- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 withTaskID:(unint64_t)a4 excludingStatuses:(id)a5 andFetchLimit:(unint64_t)a6;
- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 withTaskID:(unint64_t)a4 includingStatuses:(id)a5 andFetchLimit:(unint64_t)a6;
- (int)fetchMomentsScheduledAssetEntries:(id *)a3 forTaskID:(unint64_t)a4;
- (int)fetchProcessingErrorCode:(unint64_t *)a3 errorLine:(unint64_t *)a4 taskID:(unint64_t)a5 localIndentifier:(id)a6;
- (int)fetchProcessingErrorCodeCounts:(id *)a3 withTaskID:(unint64_t)a4 sinceDate:(id)a5 additionalPredicates:(id)a6;
- (int)flushWAL;
- (int)getBlacklistCountForLocalIdentifier:(id)a3;
- (int)getBlacklistSizeForThreshold:(int)a3 size:(unint64_t *)a4;
- (int)getBlacklistedAssetsWithCount:(int)a3 localIdentifiers:(id *)a4;
- (int)getUserVersion:(int *)a3;
- (int)hardFailAllRunningProcessingStatusForTaskID:(unint64_t)a3;
- (int)hardFailAllRunningProcessingStatusForTaskID:(unint64_t)a3 additionalPredicates:(id)a4;
- (int)loadAllKeyValuePairs:(id)a3;
- (int)openDatabase;
- (int)parseHeader:(sqlite3_stmt *)a3 startColumn:(int)a4 analysis:(id)a5;
- (int)purgeExcessiveSchedulingRecordsForActivityID:(unint64_t)a3;
- (int)queryAnalysisResultWithType:(unint64_t)a3 forAsset:(id)a4 result:(id *)a5;
- (int)queryAnalysisResultsForAssets:(id)a3 results:(id *)a4;
- (int)queryAssetCountForTaskID:(unint64_t)a3;
- (int)queryAssetCountForTaskID:(unint64_t)a3 withStatus:(unint64_t)a4;
- (int)queryAssetCountForTaskID:(unint64_t)a3 withStatus:(unint64_t)a4 andAttempts:(int)a5;
- (int)queryAssetWithLocalIdentifier:(id)a3 forMediaAnalysisVersion:(id *)a4;
- (int)queryAttemptsForLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4;
- (int)queryChangeToken:(id *)a3 forTaskID:(unint64_t)a4 andChangeTokenType:(unint64_t)a5;
- (int)queryHeadersForAssets:(id)a3 analyses:(id)a4;
- (int)queryProcessingStatus:(unint64_t *)a3 attempts:(int *)a4 lastAttemptDate:(id *)a5 andNextAttemptDate:(id *)a6 forLocalIdentifier:(id)a7 andTaskID:(unint64_t)a8;
- (int)querySchedulingHistoryRecords:(id *)a3 forActivityID:(unint64_t)a4 sinceDate:(id)a5;
- (int)removeAllChangeTokensForTaskID:(unint64_t)a3;
- (int)removeAllProcessingStatusForTaskID:(unint64_t)a3;
- (int)removeChangeTokenForTaskID:(unint64_t)a3 andChangeTokenType:(unint64_t)a4;
- (int)removeKey:(id)a3;
- (int)removeLocalIdentifierFromBlacklist:(id)a3;
- (int)removeMomentsScheduledAssetWithLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4;
- (int)removePrioritizedLocalIdentifier:(id)a3;
- (int)removeProcessingStatusForLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4;
- (int)removeProcessingStatusForTaskID:(unint64_t)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5;
- (int)removeProgressEntriesBeyondLimits;
- (int)restoreAnalysis:(id)a3 forLocalIdentifier:(id)a4;
- (int)setAttempts:(unint64_t)a3 asset:(id)a4 taskID:(unint64_t)a5 status:(unint64_t)a6 lastAttemptDate:(id)a7;
- (int)setAttempts:(unint64_t)a3 asset:(id)a4 taskID:(unint64_t)a5 status:(unint64_t)a6 lastAttemptDate:(id)a7 mediaType:(int64_t)a8 mediaSubtypes:(unint64_t)a9;
- (int)setAttempts:(unint64_t)a3 asset:(id)a4 taskID:(unint64_t)a5 status:(unint64_t)a6 lastAttemptDate:(id)a7 mediaType:(int64_t)a8 mediaSubtypes:(unint64_t)a9 errorCode:(unint64_t)a10 errorLine:(unint64_t)a11;
- (int)setChangeToken:(id)a3 forTaskID:(unint64_t)a4 andChangeTokenType:(unint64_t)a5;
- (int)setDeletePendingFlag:(BOOL)a3 localIdentifier:(id)a4;
- (int)setMomentsScheduledAssetWithLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4;
- (int)setPrioritizedLocalIdentifier:(id)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5;
- (int)setValue:(int64_t)a3 forKey:(id)a4;
- (int)storeAnalysisForAsset:(id)a3 analysis:(id)a4;
- (int)storeProgressForActivityID:(unint64_t)a3 withAnalysisSubtype:(unint64_t)a4 version:(unint64_t)a5 processedAssetCount:(unint64_t)a6 totalAssetCount:(unint64_t)a7;
- (int)storeSchedulingHistoryForActivityID:(unint64_t)a3 andStartTime:(id)a4;
- (int)storeStatsFlags:(unint64_t)a3 forLocalIdentifier:(id)a4;
- (int)updateChangeToken:(id)a3 forTaskID:(unint64_t)a4 andChangeTokenType:(unint64_t)a5;
- (int)updateDateModifiedForAsset:(id)a3;
- (int)updateFingerprint:(id)a3 forAsset:(id)a4;
- (int)updateLocalIdentifer:(id)a3 to:(id)a4;
- (int)updateProcessingStatus:(unint64_t)a3 andNextAttemptDate:(id)a4 andErrorCode:(unint64_t)a5 andErrorLine:(unint64_t)a6 forLocalIdentifier:(id)a7 andTaskID:(unint64_t)a8;
- (int)updateProcessingStatus:(unint64_t)a3 andNextAttemptDate:(id)a4 forLocalIdentifier:(id)a5 andTaskID:(unint64_t)a6;
- (int)updateResultsForAsset:(id)a3 results:(id)a4;
- (int)updateSchedulingHistoryForActivityID:(unint64_t)a3 startTime:(id)a4 duration:(double)a5 exitStatus:(int)a6 sessionLog:(id)a7;
- (int64_t)compareExistingAnalysis:(id)a3 toNewAnalysis:(id)a4 forAsset:(id)a5;
- (int64_t)valueForKey:(id)a3;
- (unint64_t)analysisRecordsModifiedSinceDate:(id)a3;
- (unint64_t)countOfAssetsWithMediaAnalysisResultsType:(unint64_t)a3;
- (unint64_t)getAssetCountMatchingAllFlags:(unint64_t)a3;
- (unint64_t)getAssetCountMatchingAllFlags:(unint64_t)a3 andAnyFlags:(unint64_t)a4;
- (unint64_t)getAssetCountMatchingStatsFlags:(unint64_t)a3 andAnalysisTypes:(unint64_t)a4;
- (unint64_t)queryEligibleToRetryAssetCountWithProcessingStatus:(unint64_t)a3 andTaskID:(unint64_t)a4;
- (unint64_t)queryEligibleToRetryAssetCountWithTaskID:(unint64_t)a3;
- (unint64_t)sizeBytes;
- (void)closeDatabase;
- (void)dealloc;
- (void)flush;
@end

@implementation VCPDatabaseWriter

- (VCPDatabaseWriter)initWithFilepath:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VCPDatabaseWriter;
  v6 = [(VCPDatabaseWriter *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_filepath, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mediaanalysisd.sql", 0);
    sqlSerialQueue = v7->_sqlSerialQueue;
    v7->_sqlSerialQueue = (OS_dispatch_queue *)v8;

    v7->_database = 0;
    v7->_transaction = 0;
    v10 = v7;
  }

  return v7;
}

- (VCPDatabaseWriter)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VCPDatabaseWriter;
  v6 = [(VCPDatabaseWriter *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    uint64_t v8 = objc_msgSend(v5, "vcp_mediaAnalysisDatabaseFilepath");
    filepath = v7->_filepath;
    v7->_filepath = (NSString *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mediaanalysisd.sql", 0);
    sqlSerialQueue = v7->_sqlSerialQueue;
    v7->_sqlSerialQueue = (OS_dispatch_queue *)v10;

    v7->_database = 0;
    v7->_transaction = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(VCPDatabaseWriter *)self flush];
  v3.receiver = self;
  v3.super_class = (Class)VCPDatabaseWriter;
  [(VCPDatabaseWriter *)&v3 dealloc];
}

+ (id)databaseForPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v3];

  return v4;
}

- (int)beginTransaction
{
  if (self->_transaction && (int)MediaAnalysisLogLevel() >= 4)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Attempting to re-entrantly begin transaction", v6, 2u);
    }
  }
  int result = sqlite3_exec(self->_database, "BEGIN TRANSACTION;", 0, 0, 0);
  if (!result) {
    self->_transaction = 1;
  }
  return result;
}

- (int)commitTransaction
{
  if (!self->_transaction && (int)MediaAnalysisLogLevel() >= 4)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Attempting to commit unpaired transaction", v6, 2u);
    }
  }
  int result = sqlite3_exec(self->_database, "COMMIT TRANSACTION;", 0, 0, 0);
  self->_transaction = 0;
  return result;
}

- (void)closeDatabase
{
  if (self->_transaction) {
    [(VCPDatabaseWriter *)self commitTransaction];
  }
  sqlite3_close(self->_database);
  self->_database = 0;
}

- (int)getUserVersion:(int *)a3
{
  ppStmt = 0;
  int v4 = sqlite3_prepare_v2(self->_database, "PRAGMA user_version;", -1, &ppStmt, 0);
  if (!v4)
  {
    int v4 = sqlite3_step(ppStmt);
    if (v4 == 100)
    {
      int v4 = 0;
      *a3 = sqlite3_column_int(ppStmt, 0);
    }
  }
  sqlite3_finalize(ppStmt);
  return v4;
}

+ (id)initializationCommand:(int)a3
{
  if (a3 > 0xB)
  {
    id v3 = 0;
    goto LABEL_35;
  }
  if (a3 != 11 && (int)MediaAnalysisLogLevel() >= 5)
  {
    id v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 67109376;
      int v10 = a3;
      __int16 v11 = 1024;
      int v12 = 11;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[VCPDatabaseWriter] Upgrading database schema user_version (%d -> %d)", buf, 0xEu);
    }
  }
  id v3 = +[NSMutableString string];
  objc_msgSend(v3, "appendString:", @"PRAGMA foreign_keys=ON;CREATE TABLE IF NOT EXISTS Assets(   id                  INTEGER PRIMARY KEY AUTOINCREMENT,    localIdentifier     TEXT,    version             INTEGER,    dateModified        REAL,    dateAnalyzed        REAL,    analysisTypes       INTEGER,    flags               INTEGER,    quality             REAL,");
  if (a3)
  {
    [v3 appendString:@"    masterFingerprint   TEXT, adjustedFingerprint TEXT,"];
    if (a3 >= 2) {
      [v3 appendString:@"  statsFlags   INTEGER,"];
    }
  }
  [v3 appendString:@"    UNIQUE (localIdentifier);CREATE TABLE IF NOT EXISTS Results(   assetId          INTEGER, resultsType      INTEGER, results          BLOB, FOREIGN KEY(assetId) REFERENCES Assets(id) ON DELETE CASCADE, UNIQUE (assetId, resultsType));CREATE TABLE IF NOT EXISTS Blacklist(   id               INTEGER PRIMARY KEY AUTOINCREMENT, localIdentifier  TEXT, date             REAL, count            INTEGER, UNIQUE (localIdentifier));CREATE TABLE IF NOT EXISTS KeyValueStore(   id               INTEGER PRIMARY KEY AUTOINCREMENT, key              TEXT, value            INTEGER, UNIQUE (key));"]);
  if (a3 <= 4) {
    [v3 appendString:@"DROP TABLE IF EXISTS ChangeTokens;"];
  }
  objc_msgSend(v3, "appendString:", @"CREATE TABLE IF NOT EXISTS ChangeTokens(   id               INTEGER PRIMARY KEY AUTOINCREMENT,    tokenID          INTEGER,    tokenType        INTEGER,    tokenData        BLOB,    date             REAL,    version          INTEGER,    UNIQUE (tokenID, tokenType));CREATE TABLE IF NOT EXISTS ProcessingStatus(   id               INTEGER PRIMARY KEY AUTOINCREMENT,    taskID           INTEGER,    localIdentifier  TEXT,");
  if (a3 >= 3)
  {
    [v3 appendString:@"    lastAttemptDate  REAL, nextAttemptDate  REAL,"];
    if (a3 < 0xB)
    {
      if (a3 < 9) {
        goto LABEL_20;
      }
    }
    else
    {
      [v3 appendString:@"    errorCode   INTEGER, errorLine   INTEGER,"];
    }
    CFStringRef v7 = @"    mediaType       INTEGER,    mediaSubtypes   INTEGER,";
  }
  else
  {
    CFStringRef v7 = @"    date             REAL,";
  }
  [v3 appendString:v7];
LABEL_20:
  [v3 appendString:@"    attempts         INTEGER, status           INTEGER, UNIQUE (taskID, localIdentifier);CREATE TABLE IF NOT EXISTS BackgroundActivitySchedulingHistory(   id               INTEGER PRIMARY KEY AUTOINCREMENT, activityID       INTEGER, startTime        REAL, duration         REAL, exitStatus       INTEGER,")];
  if (a3 >= 0xA) {
    [v3 appendString:@"sessionLog       TEXT,"];
  }
  [v3 appendString:@"    UNIQUE (activityID, startTime);CREATE TABLE IF NOT EXISTS BackgroundAnalysisProgressHistory(   id                  INTEGER PRIMARY KEY AUTOINCREMENT, activityID          INTEGER, analysisSubtype     INTEGER, storeDate           REAL, version             INTEGER, processedAssetCount INTEGER, totalAssetCount     INTEGER);"]);
  objc_msgSend(v3, "appendString:", @"CREATE TABLE IF NOT EXISTS MomentsScheduledAssets(   id               INTEGER PRIMARY KEY AUTOINCREMENT,    taskID           INTEGER,    localIdentifier  TEXT,");
  if (a3 >= 7) {
    [v3 appendString:@"    requestDate      REAL,"];
  }
  [v3 appendString:@"    UNIQUE (taskID, localIdentifier);"]);
  [v3 appendString:@"CREATE TABLE IF NOT EXISTS PrioritizedAssets(   id              INTEGER PRIMARY KEY AUTOINCREMENT, localIdentifier TEXT, mediaType       INTEGER, mediaSubtype    INTEGER);"];
  if (a3 == 1) {
    goto LABEL_27;
  }
  if (!a3)
  {
    [v3 appendString:@"ALTER TABLE Assets ADD COLUMN masterFingerprint TEXT;ALTER TABLE Assets ADD COLUMN adjustedFingerprint TEXT;"];
LABEL_27:
    [v3 appendString:@"ALTER TABLE Assets ADD COLUMN statsFlags INTEGER;"];
LABEL_29:
    [v3 appendString:@"ALTER TABLE ProcessingStatus RENAME COLUMN date TO lastAttemptDate;"];
    [v3 appendString:@"ALTER TABLE ProcessingStatus ADD COLUMN nextAttemptDate REAL DEFAULT 0.0;"];
LABEL_30:
    [v3 appendString:@"ALTER TABLE MomentsScheduledAssets ADD COLUMN requestDate REAL DEFAULT 0.0;"];
LABEL_31:
    [v3 appendString:@"ALTER TABLE ProcessingStatus ADD COLUMN mediaType INTEGER DEFAULT 0;ALTER TABLE ProcessingStatus ADD COLUMN mediaSubtypes INTEGER DEFAULT 0;"];
    goto LABEL_32;
  }
  if (a3 <= 2) {
    goto LABEL_29;
  }
  if (a3 <= 6) {
    goto LABEL_30;
  }
  if (a3 <= 8) {
    goto LABEL_31;
  }
  if (a3 != 9)
  {
    if (a3 > 0xA) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 appendString:@"ALTER TABLE BackgroundActivitySchedulingHistory ADD COLUMN sessionLog TEXT;"];
LABEL_33:
  [v3 appendString:@"ALTER TABLE ProcessingStatus ADD COLUMN errorCode INTEGER DEFAULT 0;ALTER TABLE ProcessingStatus ADD COLUMN errorLine INTEGER DEFAULT 0;"];
LABEL_34:
  objc_msgSend(v3, "appendFormat:", @"PRAGMA user_version=%lu;", 11);
  [v3 appendString:@"PRAGMA journal_mode=WAL;PRAGMA page_size=4096;PRAGMA max_page_count=524288;"];
LABEL_35:
  return v3;
}

- (int)openDatabase
{
  char v40 = 0;
  id v3 = +[NSFileManager defaultManager];
  int v4 = [(NSString *)self->_filepath stringByDeletingLastPathComponent];
  if ([v3 fileExistsAtPath:v4 isDirectory:&v40]) {
    goto LABEL_3;
  }
  NSFileAttributeKey v45 = NSFilePosixPermissions;
  id v5 = +[NSNumber numberWithShort:493];
  v46 = v5;
  os_log_type_t v6 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  unsigned __int8 v7 = [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v6 error:0];

  if (v7)
  {
LABEL_3:
    unsigned int v8 = [v3 fileExistsAtPath:self->_filepath];
    if (v8) {
      goto LABEL_10;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v9, v10))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "[VCPDatabaseWriter] Database file does not exist, creating one", buf, 2u);
      }
    }
    NSFileAttributeKey v43 = NSFileProtectionKey;
    NSFileProtectionType v44 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    __int16 v11 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    if ([v3 createFileAtPath:self->_filepath contents:0 attributes:v11])
    {

LABEL_10:
      unsigned int v39 = 11;
      p_database = &self->_database;
      unsigned int busy = sqlite3_open([(NSString *)self->_filepath UTF8String], &self->_database);
      if (busy)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v14 = VCPLogInstance();
          os_log_type_t v15 = VCPLogToOSLogType[3];
          if (!os_log_type_enabled(v14, v15))
          {
LABEL_22:
            id v19 = 0;
            goto LABEL_23;
          }
          *(_DWORD *)buf = 67109120;
          LODWORD(v42) = busy;
          v16 = "[VCPDatabaseWriter] Failed to open database: %d";
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v14, v15, v16, buf, 8u);
          goto LABEL_22;
        }
        goto LABEL_35;
      }
      unsigned int busy = sqlite3_busy_handler(*p_database, (int (__cdecl *)(void *, int))sub_1000316BC, 0);
      if (busy)
      {
        v14 = VCPLogInstance();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          sub_10004B6BC(busy, v14);
        }
        goto LABEL_22;
      }
      if (v8)
      {
        unsigned int busy = [(VCPDatabaseWriter *)self getUserVersion:&v39];
        if (busy)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v14 = VCPLogInstance();
            os_log_type_t v15 = VCPLogToOSLogType[3];
            if (!os_log_type_enabled(v14, v15)) {
              goto LABEL_22;
            }
            *(_DWORD *)buf = 67109120;
            LODWORD(v42) = busy;
            v16 = "[VCPDatabaseWriter] Failed to query database version: %d";
            goto LABEL_14;
          }
LABEL_35:
          id v19 = 0;
          goto LABEL_36;
        }
      }
      v25 = +[VCPDatabaseWriter initializationCommand:v39];
      if (!v25)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          id v19 = 0;
          unsigned int busy = -23;
          goto LABEL_36;
        }
        v14 = VCPLogInstance();
        os_log_type_t v32 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v14, v32))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v42) = v39;
          _os_log_impl((void *)&_mh_execute_header, v14, v32, "[VCPDatabaseWriter] Invalid database version %d", buf, 8u);
        }
        id v19 = 0;
        unsigned int busy = -23;
        goto LABEL_23;
      }
      v26 = *p_database;
      id v19 = v25;
      int v27 = sqlite3_exec(v26, (const char *)[v19 UTF8String], 0, 0, 0);
      if (v27 && (int)MediaAnalysisLogLevel() >= 3)
      {
        v28 = VCPLogInstance();
        os_log_type_t v29 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v28, v29))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v42) = v27;
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "[VCPDatabaseWriter] Failed to create database tables: %d", buf, 8u);
        }
      }
      if (v8) {
        goto LABEL_50;
      }
      unsigned int busy = [(VCPDatabaseWriter *)self beginTransaction];
      if (busy)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_36;
        }
        v14 = VCPLogInstance();
        os_log_type_t v30 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v14, v30)) {
          goto LABEL_23;
        }
        *(_WORD *)buf = 0;
        v31 = "[VCPDatabaseWriter] Failed to begin transaction for analytic metrics table initialization";
        goto LABEL_67;
      }
      unsigned int busy = [(VCPDatabaseWriter *)self _setValue:0 forKey:@"NumberOfTimesScheduledDatabaseCreation"];
      if (busy)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_36;
        }
        v14 = VCPLogInstance();
        os_log_type_t v36 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v14, v36)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v42 = @"NumberOfTimesScheduledDatabaseCreation";
        v31 = "[VCPDatabaseWriter] Failed to set %@ to 0";
      }
      else
      {
        unsigned int busy = [(VCPDatabaseWriter *)self _setValue:0 forKey:@"TotalAnalyzingTimeDatabaseCreation"];
        if (busy)
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_36;
          }
          v14 = VCPLogInstance();
          os_log_type_t v36 = VCPLogToOSLogType[3];
          if (!os_log_type_enabled(v14, v36)) {
            goto LABEL_23;
          }
          *(_DWORD *)buf = 138412290;
          CFStringRef v42 = @"TotalAnalyzingTimeDatabaseCreation";
          v31 = "[VCPDatabaseWriter] Failed to set %@ to 0";
        }
        else
        {
          v37 = +[NSDate now];
          [v37 timeIntervalSinceReferenceDate];
          unsigned int busy = [(VCPDatabaseWriter *)self _setValue:(uint64_t)v38 forKey:@"DailyProcessTimeStamp"];

          if (!busy)
          {
            unsigned int busy = [(VCPDatabaseWriter *)self commitTransaction];
            if (!busy)
            {
LABEL_50:
              unsigned int busy = [(VCPDatabaseWriter *)self _updateAnalysisInfoOnAnalysisVersionChange];
              if (busy)
              {
                if ((int)MediaAnalysisLogLevel() < 3) {
                  goto LABEL_36;
                }
                v14 = VCPLogInstance();
                os_log_type_t v30 = VCPLogToOSLogType[3];
                if (!os_log_type_enabled(v14, v30)) {
                  goto LABEL_23;
                }
                *(_WORD *)buf = 0;
                v31 = "[VCPDatabaseWriter] Failed to check/update analysis versions";
              }
              else
              {
                unsigned int busy = [(VCPDatabaseWriter *)self _updateOperatingSystemVersion];
                if (!busy)
                {
                  if (!v27)
                  {
                    unsigned int busy = 0;
LABEL_41:

                    goto LABEL_42;
                  }
                  unsigned int busy = v27;
LABEL_36:
                  if ((int)MediaAnalysisLogLevel() >= 3)
                  {
                    v22 = VCPLogInstance();
                    os_log_type_t v23 = VCPLogToOSLogType[3];
                    if (os_log_type_enabled(v22, v23))
                    {
                      *(_DWORD *)buf = 67109120;
                      LODWORD(v42) = busy;
                      _os_log_impl((void *)&_mh_execute_header, v22, v23, "[VCPDatabaseWriter] Error occurred when opening database: %d", buf, 8u);
                    }
                  }
                  [(VCPDatabaseWriter *)self closeDatabase];
                  goto LABEL_41;
                }
                if ((int)MediaAnalysisLogLevel() < 3) {
                  goto LABEL_36;
                }
                v14 = VCPLogInstance();
                os_log_type_t v30 = VCPLogToOSLogType[3];
                if (!os_log_type_enabled(v14, v30))
                {
LABEL_23:

                  goto LABEL_36;
                }
                *(_WORD *)buf = 0;
                v31 = "[VCPDatabaseWriter] Failed to check/update OS version";
              }
              goto LABEL_67;
            }
            if ((int)MediaAnalysisLogLevel() < 3) {
              goto LABEL_36;
            }
            v14 = VCPLogInstance();
            os_log_type_t v30 = VCPLogToOSLogType[3];
            if (!os_log_type_enabled(v14, v30)) {
              goto LABEL_23;
            }
            *(_WORD *)buf = 0;
            v31 = "[VCPDatabaseWriter] Failed to commit transaction for analytic metrics table initialization";
LABEL_67:
            v33 = v14;
            os_log_type_t v34 = v30;
            uint32_t v35 = 2;
LABEL_68:
            _os_log_impl((void *)&_mh_execute_header, v33, v34, v31, buf, v35);
            goto LABEL_23;
          }
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_36;
          }
          v14 = VCPLogInstance();
          os_log_type_t v36 = VCPLogToOSLogType[3];
          if (!os_log_type_enabled(v14, v36)) {
            goto LABEL_23;
          }
          *(_DWORD *)buf = 138412290;
          CFStringRef v42 = @"DailyProcessTimeStamp";
          v31 = "[VCPDatabaseWriter] Failed to set %@ as now";
        }
      }
      v33 = v14;
      os_log_type_t v34 = v36;
      uint32_t v35 = 12;
      goto LABEL_68;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v20, v21))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "Failed to create database", buf, 2u);
      }
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v17 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v17, v18))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Failed to create database directory", buf, 2u);
    }
  }
  unsigned int busy = -23;
LABEL_42:

  return busy;
}

- (int)_updateAnalysisInfoWithCurrentVersion:(int)a3 andTimestamp:(int64_t)a4 forTaskID:(unint64_t)a5
{
  v9 = VCPVersionKeyForTask(a5);
  os_log_type_t v10 = VCPStartTimestampKeyForTask(a5);
  __int16 v11 = VCPCompleteTimestampKeyForTask(a5, 0);
  int v12 = VCPCompleteTimestampKeyForTask(a5, 1);
  objc_super v13 = VCPBGSTCheckpointTimestampKeyForTask(a5, 0);
  NSFileAttributeKey v43 = VCPBGSTCheckpointTimestampKeyForTask(a5, 1);
  if (!v9 || !v10 || !v11 || !v12)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      char v40 = v13;
      os_log_type_t v21 = VCPLogInstance();
      os_log_type_t v22 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v21, v22))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v46 = a5;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "No corresponding keys found for taskID %lu", buf, 0xCu);
      }

      objc_super v13 = v40;
    }
    int v14 = -50;
    goto LABEL_29;
  }
  uint64_t v44 = 0;
  int v14 = [(VCPDatabaseWriter *)self _queryValue:&v44 forKey:v9];
  if (!v14)
  {
    if (v44 == a3)
    {
LABEL_17:
      int v14 = 0;
      goto LABEL_29;
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v41 = v13;
      os_log_type_t v23 = VCPLogInstance();
      os_log_type_t v24 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)v46 = v44;
        *(_WORD *)&v46[8] = 1024;
        *(_DWORD *)&v46[10] = a3;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "Analysis version changed from %lld to %d", buf, 0x12u);
      }

      objc_super v13 = v41;
    }
    int v14 = [(VCPDatabaseWriter *)self _setValue:a3 forKey:v9];
    if (v14)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_29;
      }
      CFStringRef v42 = v13;
      os_log_type_t v15 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v15, v25))
      {
LABEL_27:
        objc_super v13 = v42;
        goto LABEL_28;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v46 = a3;
      *(_WORD *)&v46[4] = 2112;
      *(void *)&v46[6] = v9;
      v26 = "[VCPDatabaseWriter] Failed to set analysis version %d for %@";
      int v27 = v15;
      os_log_type_t v28 = v25;
      uint32_t v29 = 18;
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v27, v28, v26, buf, v29);
      goto LABEL_27;
    }
    int v14 = [(VCPDatabaseWriter *)self _setValue:a4 forKey:v10];
    if (v14)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_29;
      }
      os_log_type_t v15 = VCPLogInstance();
      os_log_type_t v31 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v15, v31)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 134218242;
      *(void *)v46 = a4;
      *(_WORD *)&v46[8] = 2112;
      *(void *)&v46[10] = v10;
      v17 = "[VCPDatabaseWriter] Failed to set timestamp %lld for %@";
      os_log_type_t v18 = v15;
      os_log_type_t v19 = v31;
      uint32_t v20 = 22;
      goto LABEL_10;
    }
    int v14 = [(VCPDatabaseWriter *)self _removeKey:v11];
    if (v14)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_29;
      }
      os_log_type_t v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v15, v16)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v46 = v11;
      v17 = "[VCPDatabaseWriter] Failed to remove complete timestamp for %@";
LABEL_9:
      os_log_type_t v18 = v15;
      os_log_type_t v19 = v16;
      uint32_t v20 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, v20);
      goto LABEL_28;
    }
    int v14 = [(VCPDatabaseWriter *)self _removeKey:v13];
    if (v14)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_29;
      }
      os_log_type_t v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v15, v16)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v46 = v13;
      v17 = "[VCPDatabaseWriter] Failed to remove checkpoint timestamp for %@";
      goto LABEL_9;
    }
    int v14 = [(VCPDatabaseWriter *)self _removeKey:v12];
    if (v14)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_29;
      }
      os_log_type_t v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v15, v16)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v46 = v12;
      v17 = "[VCPDatabaseWriter] Failed to remove complete_with_failure timestamp for %@";
      goto LABEL_9;
    }
    int v14 = [(VCPDatabaseWriter *)self _removeKey:v43];
    if (v14)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_29;
      }
      os_log_type_t v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v15, v16)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v46 = v43;
      v17 = "[VCPDatabaseWriter] Failed to remove checkpoint_with_failure timestamp for %@";
      goto LABEL_9;
    }
    CFStringRef v42 = v13;
    if (a5 == 1)
    {
      int v14 = [(VCPDatabaseWriter *)self _removeKey:@"MediaAnalysisImagePriority1MCEnableTimestamp"];
      if (v14)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_114;
        }
        os_log_type_t v15 = VCPLogInstance();
        os_log_type_t v32 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v15, v32)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v46 = @"MediaAnalysisImagePriority1MCEnableTimestamp";
        v26 = "[VCPDatabaseWriter] Failed to remove enablement timestamp for %@";
LABEL_96:
        int v27 = v15;
        os_log_type_t v28 = v32;
        uint32_t v29 = 12;
        goto LABEL_26;
      }
      int v14 = [(VCPDatabaseWriter *)self _removeKey:@"MediaAnalysisImagePriority1CompleteTimestamp"];
      if (v14)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_114;
        }
        os_log_type_t v15 = VCPLogInstance();
        os_log_type_t v32 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v15, v32)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v46 = @"MediaAnalysisImagePriority1CompleteTimestamp";
        v26 = "[VCPDatabaseWriter] Failed to remove complete timestamp for %@";
        goto LABEL_96;
      }
      int v14 = [(VCPDatabaseWriter *)self _removeKey:@"MediaAnalysisImagePriority1CheckpointReportedTimestamp"];
      if (v14)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_114;
        }
        os_log_type_t v15 = VCPLogInstance();
        os_log_type_t v32 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v15, v32)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v46 = @"MediaAnalysisImagePriority1CheckpointReportedTimestamp";
        v26 = "[VCPDatabaseWriter] Failed to remove checkpoint timestamp for %@";
        goto LABEL_96;
      }
      int v14 = [(VCPDatabaseWriter *)self _removeKey:@"MediaAnalysisImagePriority1CheckpointWithFailureReportedTimestamp"];
      if (v14)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_114;
        }
        os_log_type_t v15 = VCPLogInstance();
        os_log_type_t v32 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v15, v32)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v46 = @"MediaAnalysisImagePriority1CheckpointWithFailureReportedTimestamp";
        v26 = "[VCPDatabaseWriter] Failed to remove checkpoint_with_failure timestamp for %@";
        goto LABEL_96;
      }
      int v14 = [(VCPDatabaseWriter *)self _removeKey:@"MediaAnalysisImageCheckpointReportedTimestamp"];
      if (v14)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_114;
        }
        os_log_type_t v15 = VCPLogInstance();
        os_log_type_t v32 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v15, v32)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v46 = @"MediaAnalysisImageCheckpointReportedTimestamp";
        v26 = "[VCPDatabaseWriter] Failed to remove complete timestamp for %@";
        goto LABEL_96;
      }
      int v14 = -[VCPDatabaseWriter _removeKey:](self, "_removeKey:");
      if (v14)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_114;
        }
        os_log_type_t v15 = VCPLogInstance();
        os_log_type_t v32 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v15, v32)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v46 = @"MediaAnalysisImageCheckpointWithFailureReportedTimestamp";
        v26 = "[VCPDatabaseWriter] Failed to remove checkpoint_with_failure timestamp for %@";
        goto LABEL_96;
      }
    }
    else if (a5 == 3)
    {
      int v14 = [(VCPDatabaseWriter *)self _removeKey:@"PrioritizedFaceAnalysisCompleteTimestamp"];
      if (v14)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          os_log_type_t v15 = VCPLogInstance();
          os_log_type_t v32 = VCPLogToOSLogType[3];
          if (!os_log_type_enabled(v15, v32)) {
            goto LABEL_27;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)v46 = @"PrioritizedFaceAnalysisCompleteTimestamp";
          v26 = "[VCPDatabaseWriter] Failed to remove complete timestamp for %@";
          goto LABEL_96;
        }
        goto LABEL_114;
      }
      int v14 = [(VCPDatabaseWriter *)self _removeKey:@"PrioritizedFaceAnalysisCheckpointReportedTimestamp"];
      if (v14)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_114;
        }
        os_log_type_t v15 = VCPLogInstance();
        os_log_type_t v32 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v15, v32)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v46 = @"PrioritizedFaceAnalysisCheckpointReportedTimestamp";
        v26 = "[VCPDatabaseWriter] Failed to remove checkpoint timestamp for %@";
        goto LABEL_96;
      }
      int v14 = [(VCPDatabaseWriter *)self _removeKey:@"PrioritizedFaceAnalysisCompleteWithFailureTimestamp"];
      if (v14)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_114;
        }
        os_log_type_t v15 = VCPLogInstance();
        os_log_type_t v32 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v15, v32)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v46 = @"PrioritizedFaceAnalysisCompleteWithFailureTimestamp";
        v26 = "[VCPDatabaseWriter] Failed to remove complete_with_failure timestamp for %@";
        goto LABEL_96;
      }
      int v14 = -[VCPDatabaseWriter _removeKey:](self, "_removeKey:");
      if (v14)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_114;
        }
        os_log_type_t v15 = VCPLogInstance();
        os_log_type_t v32 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v15, v32)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v46 = @"PrioritizedFaceAnalysisCheckpointWithFailureReportedTimestamp";
        v26 = "[VCPDatabaseWriter] Failed to remove checkpoint_with_failure timestamp for %@";
        goto LABEL_96;
      }
      int v14 = [(VCPDatabaseWriter *)self _removeKey:@"PersonalizationCheckpointReportedTimestamp"];
      if (v14)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_114;
        }
        os_log_type_t v15 = VCPLogInstance();
        os_log_type_t v32 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v15, v32)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v46 = @"PrioritizedFaceAnalysisCheckpointWithFailureReportedTimestamp";
        v26 = "[VCPDatabaseWriter] Failed to remove personalization checkpoint timestamp for %@";
        goto LABEL_96;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v33 = VCPLogInstance();
      os_log_type_t v34 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v33, v34))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v46 = v9;
        *(_WORD *)&v46[8] = 1024;
        *(_DWORD *)&v46[10] = a3;
        *(_WORD *)&v46[14] = 2048;
        *(void *)&v46[16] = a4;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "Updated %@ with %d (timestamp: %lld)", buf, 0x1Cu);
      }
    }
    int v14 = [(VCPDatabaseWriter *)self _removeAllProcessingStatusForTaskID:a5];
    if (v14)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        os_log_type_t v15 = VCPLogInstance();
        os_log_type_t v35 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v15, v35))
        {
          os_log_type_t v36 = VCPTaskIDDescription(a5);
          *(_DWORD *)buf = 138412290;
          *(void *)v46 = v36;
          _os_log_impl((void *)&_mh_execute_header, v15, v35, "[VCPDatabaseWriter] Unable to drop processing status for %@", buf, 0xCu);

          objc_super v13 = v42;
          goto LABEL_28;
        }
        goto LABEL_27;
      }
      goto LABEL_114;
    }
    if (a5 != 1) {
      goto LABEL_115;
    }
    int v14 = [(VCPDatabaseWriter *)self _removeAllProcessingStatusForTaskID:255];
    if (v14)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        os_log_type_t v15 = VCPLogInstance();
        os_log_type_t v37 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v15, v37))
        {
          double v38 = VCPTaskIDDescription(1);
          *(_DWORD *)buf = 138412290;
          *(void *)v46 = v38;
          _os_log_impl((void *)&_mh_execute_header, v15, v37, "[VCPDatabaseWriter] Unable to drop processing status for %@", buf, 0xCu);

          objc_super v13 = v42;
          goto LABEL_28;
        }
        goto LABEL_27;
      }
      goto LABEL_114;
    }
    int v14 = [(VCPDatabaseWriter *)self _removeKey:@"PrioritizedAssetCollectionFinishTimestamp"];
    if (!v14)
    {
LABEL_115:
      objc_super v13 = v42;
      +[MADProgressManager resetProcessingCheckpointForTask:a5];
      goto LABEL_17;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      os_log_type_t v15 = VCPLogInstance();
      os_log_type_t v39 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v15, v39)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      v26 = "[VCPDatabaseWriter] Failed to remove prioritized asset collection finish timestamp";
      int v27 = v15;
      os_log_type_t v28 = v39;
      uint32_t v29 = 2;
      goto LABEL_26;
    }
LABEL_114:
    objc_super v13 = v42;
    goto LABEL_29;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    os_log_type_t v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[3];
    if (!os_log_type_enabled(v15, v16))
    {
LABEL_28:

      goto LABEL_29;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v46 = v9;
    v17 = "[VCPDatabaseWriter] Failed to query analysis version for %@";
    goto LABEL_9;
  }
LABEL_29:

  return v14;
}

- (int)_updateAnalysisInfoOnAnalysisVersionChange
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Checking KeyValueStore for analysis versions ...", buf, 2u);
    }
  }
  id v5 = +[NSDate now];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  int v8 = [(VCPDatabaseWriter *)self beginTransaction];
  if (v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v9, v10))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "[VCPDatabaseWriter] Failed to begin transaction for analysis version check/update", buf, 2u);
      }
    }
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = [&off_100230338 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(&off_100230338);
          }
          uint64_t v14 = (int)[*(id *)(*((void *)&v19 + 1) + 8 * i) intValue];
          int v8 = [(VCPDatabaseWriter *)self _updateAnalysisInfoWithCurrentVersion:VCPVersionForTask(v14) andTimestamp:(uint64_t)v7 forTaskID:v14];
          if (v8)
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              os_log_type_t v15 = VCPLogInstance();
              os_log_type_t v16 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v15, v16))
              {
                v17 = VCPTaskIDDescription(v14);
                *(_DWORD *)buf = 138412290;
                os_log_type_t v24 = v17;
                _os_log_impl((void *)&_mh_execute_header, v15, v16, "[VCPDatabaseWriter] Failed to check/update analysis version for %@", buf, 0xCu);
              }
            }
            return v8;
          }
        }
        id v11 = [&off_100230338 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    return [(VCPDatabaseWriter *)self commitTransaction];
  }
  return v8;
}

- (int)_updateOperatingSystemVersion
{
  CFStringRef v43 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  id v3 = +[NSProcessInfo processInfo];
  os_log_type_t v4 = v3;
  if (v3)
  {
    [v3 operatingSystemVersion];
  }
  else
  {
    CFStringRef v43 = 0;
    uint64_t v44 = 0;
    uint64_t v45 = 0;
  }

  CFStringRef v6 = v43;
  uint64_t v5 = v44;
  CFStringRef v42 = 0;
  int v7 = [(VCPDatabaseWriter *)self _queryValue:&v42 forKey:@"MajorOSVersionNumber"];
  if (v7)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v8 = VCPLogInstance();
      os_log_type_t v9 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v48 = @"MajorOSVersionNumber";
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "[VCPDatabaseWriter] Failed to query major os version for %@", buf, 0xCu);
      }
    }
    return v7;
  }
  uint64_t v41 = 0;
  int v7 = [(VCPDatabaseWriter *)self _queryValue:&v41 forKey:@"MinorOSVersionNumber"];
  if (v7)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      return v7;
    }
    os_log_type_t v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v48 = @"MinorOSVersionNumber";
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[VCPDatabaseWriter] Failed to query minor os version for %@", buf, 0xCu);
    }
LABEL_35:

    return v7;
  }
  if (v42 == v6 && v41 == v5) {
    return 0;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 134218752;
      CFStringRef v48 = v42;
      __int16 v49 = 2048;
      uint64_t v50 = v41;
      __int16 v51 = 2048;
      CFStringRef v52 = v6;
      __int16 v53 = 2048;
      uint64_t v54 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[VCPDatabaseWriter] Operating System version changed from %lld.%lld to %lld.%lld", buf, 0x2Au);
    }
  }
  int v7 = [(VCPDatabaseWriter *)self beginTransaction];
  if (v7)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      return v7;
    }
    os_log_type_t v10 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v10, v14))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v14, "[VCPDatabaseWriter] Failed to begin transaction for os version check/update", buf, 2u);
    }
    goto LABEL_35;
  }
  int v7 = [(VCPDatabaseWriter *)self _setValue:v6 forKey:@"MajorOSVersionNumber"];
  if (v7)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      return v7;
    }
    os_log_type_t v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v48 = @"MajorOSVersionNumber";
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[VCPDatabaseWriter] Failed to set major os version for %@", buf, 0xCu);
    }
LABEL_30:

    return v7;
  }
  int v7 = [(VCPDatabaseWriter *)self _setValue:v5 forKey:@"MinorOSVersionNumber"];
  if (v7)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      return v7;
    }
    os_log_type_t v10 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v10, v17))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v48 = @"MinorOSVersionNumber";
      _os_log_impl((void *)&_mh_execute_header, v10, v17, "[VCPDatabaseWriter] Failed to set minor os version for %@", buf, 0xCu);
    }
    goto LABEL_35;
  }
  os_log_type_t v18 = +[NSDate now];
  [v18 timeIntervalSinceReferenceDate];
  int v7 = [(VCPDatabaseWriter *)self _setValue:(uint64_t)v19 forKey:@"OSVersionUpdateTimestamp"];

  if (v7)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      return v7;
    }
    os_log_type_t v15 = VCPLogInstance();
    os_log_type_t v20 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v15, v20))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v48 = @"OSVersionUpdateTimestamp";
      _os_log_impl((void *)&_mh_execute_header, v15, v20, "[VCPDatabaseWriter] Failed to set os version timestamp for %@", buf, 0xCu);
    }
    goto LABEL_30;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v21 = [&off_100230350 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (!v21) {
    goto LABEL_64;
  }
  uint64_t v23 = *(void *)v38;
  os_log_type_t type = VCPLogToOSLogType[3];
  *(void *)&long long v22 = 134217984;
  long long v35 = v22;
  while (2)
  {
    for (i = 0; i != v21; i = (char *)i + 1)
    {
      if (*(void *)v38 != v23) {
        objc_enumerationMutation(&off_100230350);
      }
      signed int v25 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "intValue", v35);
      VCPBGSTCheckpointTimestampKeyForTask(v25, 0);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v26 && (int)MediaAnalysisLogLevel() >= 3)
      {
        int v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, type))
        {
          *(_DWORD *)buf = v35;
          CFStringRef v48 = (const __CFString *)v25;
          _os_log_impl((void *)&_mh_execute_header, v27, type, "No corresponding checkpoint key found for taskID %lu", buf, 0xCu);
        }
      }
      int v7 = [(VCPDatabaseWriter *)self _removeKey:v26];
      if (v7)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          os_log_type_t v28 = VCPLogInstance();
          if (os_log_type_enabled(v28, type))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v48 = v26;
            _os_log_impl((void *)&_mh_execute_header, v28, type, "[VCPDatabaseWriter] Failed to remove checkpoint timestamp for %@", buf, 0xCu);
          }
          goto LABEL_84;
        }
LABEL_85:

        return v7;
      }
      os_log_type_t v28 = VCPBGSTCheckpointTimestampKeyForTask(v25, 1);
      if (!v28 && (int)MediaAnalysisLogLevel() >= 3)
      {
        uint32_t v29 = VCPLogInstance();
        if (os_log_type_enabled(v29, type))
        {
          *(_DWORD *)buf = v35;
          CFStringRef v48 = (const __CFString *)v25;
          _os_log_impl((void *)&_mh_execute_header, v29, type, "No corresponding checkpoint_with_failure key found for taskID %lu", buf, 0xCu);
        }
      }
      int v7 = [(VCPDatabaseWriter *)self _removeKey:v28];
      if (v7)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          os_log_type_t v30 = VCPLogInstance();
          if (os_log_type_enabled(v30, type))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v48 = (const __CFString *)v28;
            os_log_type_t v31 = "[VCPDatabaseWriter] Failed to remove checkpoint_with_failure timestamp for %@";
            os_log_type_t v32 = v30;
            os_log_type_t v33 = type;
            goto LABEL_82;
          }
LABEL_83:
        }
LABEL_84:

        goto LABEL_85;
      }
      if (v25 == 3)
      {
        int v7 = [(VCPDatabaseWriter *)self _removeKey:@"PrioritizedFaceAnalysisCheckpointReportedTimestamp"];
        if (v7)
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_84;
          }
          os_log_type_t v30 = VCPLogInstance();
          if (!os_log_type_enabled(v30, type)) {
            goto LABEL_83;
          }
          *(_DWORD *)buf = 138412290;
          CFStringRef v48 = @"PrioritizedFaceAnalysisCheckpointReportedTimestamp";
          os_log_type_t v31 = "[VCPDatabaseWriter] Failed to remove complete timestamp for %@";
        }
        else
        {
          int v7 = [(VCPDatabaseWriter *)self _removeKey:@"PrioritizedFaceAnalysisCheckpointWithFailureReportedTimestamp"];
          if (v7)
          {
            if ((int)MediaAnalysisLogLevel() < 3) {
              goto LABEL_84;
            }
            os_log_type_t v30 = VCPLogInstance();
            if (!os_log_type_enabled(v30, type)) {
              goto LABEL_83;
            }
            *(_DWORD *)buf = 138412290;
            CFStringRef v48 = @"PrioritizedFaceAnalysisCheckpointWithFailureReportedTimestamp";
            os_log_type_t v31 = "[VCPDatabaseWriter] Failed to remove complete_with_failure timestamp for %@";
          }
          else
          {
            int v7 = [(VCPDatabaseWriter *)self _removeKey:@"PersonalizationCheckpointReportedTimestamp"];
            if (!v7) {
              goto LABEL_62;
            }
            if ((int)MediaAnalysisLogLevel() < 3) {
              goto LABEL_84;
            }
            os_log_type_t v30 = VCPLogInstance();
            if (!os_log_type_enabled(v30, type)) {
              goto LABEL_83;
            }
            *(_DWORD *)buf = 138412290;
            CFStringRef v48 = @"PrioritizedFaceAnalysisCheckpointWithFailureReportedTimestamp";
            os_log_type_t v31 = "[VCPDatabaseWriter] Failed to remove personalization checkpoint timestamp for %@";
          }
        }
        os_log_type_t v32 = v30;
        os_log_type_t v33 = type;
LABEL_82:
        _os_log_impl((void *)&_mh_execute_header, v32, v33, v31, buf, 0xCu);
        goto LABEL_83;
      }
LABEL_62:
    }
    id v21 = [&off_100230350 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v21) {
      continue;
    }
    break;
  }
LABEL_64:
  int v7 = [(VCPDatabaseWriter *)self commitTransaction];
  if (!v7) {
    return 0;
  }
  return v7;
}

- (int)_queryValue:(int64_t *)a3 forKey:(id)a4
{
  id v6 = a4;
  ppStmt = 0;
  *a3 = 0;
  int v7 = sqlite3_prepare_v2(self->_database, "SELECT value FROM KeyValueStore WHERE key = (?);", -1, &ppStmt, 0);
  if (v7) {
    goto LABEL_6;
  }
  int v8 = ppStmt;
  id v9 = v6;
  os_log_type_t v10 = v9;
  int v11 = v9
      ? sqlite3_bind_text(v8, 1, (const char *)[v9 UTF8String], -1, 0)
      : sqlite3_bind_null(v8, 1);
  int v7 = v11;

  if (v7) {
    goto LABEL_6;
  }
  os_log_type_t v16 = sqlite3_expanded_sql(ppStmt);
  if (v16)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      os_log_type_t v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        os_log_type_t v20 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v21 = 1024;
        int v22 = 659;
        __int16 v23 = 2080;
        os_log_type_t v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    sqlite3_free(v16);
  }
  int v7 = sqlite3_step(ppStmt);
  if (v7 == 100)
  {
    *a3 = sqlite3_column_int64(ppStmt, 0);
    int v7 = sqlite3_step(ppStmt);
  }
  int v14 = 0;
  if (v7)
  {
    if (v7 != 101)
    {
LABEL_6:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v12 = VCPLogInstance();
        os_log_type_t v13 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v12, v13))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "Failed to query KeyValueStore", buf, 2u);
        }
      }
      int v14 = v7;
    }
  }
  sqlite3_finalize(ppStmt);

  return v14;
}

- (int)_setValue:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    ppStmt = 0;
    int v7 = sqlite3_prepare_v2(self->_database, "REPLACE INTO KeyValueStore (key, value) VALUES ((?), (?));",
           -1,
           &ppStmt,
           0);
    if (v7) {
      goto LABEL_5;
    }
    int v8 = ppStmt;
    id v9 = v6;
    int v7 = sqlite3_bind_text(v8, 1, (const char *)[v9 UTF8String], -1, 0);

    if (v7) {
      goto LABEL_5;
    }
    int v7 = sqlite3_bind_int64(ppStmt, 2, a3);
    if (v7) {
      goto LABEL_5;
    }
    int v14 = sqlite3_expanded_sql(ppStmt);
    if (v14)
    {
      if (MediaAnalysisEnableDatabaseLog())
      {
        os_log_type_t v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          double v19 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
          __int16 v20 = 1024;
          int v21 = 684;
          __int16 v22 = 2080;
          __int16 v23 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
        }
      }
      sqlite3_free(v14);
    }
    int v16 = sqlite3_step(ppStmt);
    int v7 = v16;
    int v12 = 0;
    if (v16)
    {
      if (v16 != 101)
      {
LABEL_5:
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          os_log_type_t v10 = VCPLogInstance();
          os_log_type_t v11 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v10, v11))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to update KeyValueStore", buf, 2u);
          }
        }
        int v12 = v7;
      }
    }
    sqlite3_finalize(ppStmt);
  }
  else
  {
    int v12 = -50;
  }

  return v12;
}

- (int)_removeKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    ppStmt = 0;
    int v5 = sqlite3_prepare_v2(self->_database, "DELETE FROM KeyValueStore WHERE key=(?);", -1, &ppStmt, 0);
    if (!v5)
    {
      id v6 = ppStmt;
      id v7 = v4;
      int v5 = sqlite3_bind_text(v6, 1, (const char *)[v7 UTF8String], -1, 0);

      if (!v5)
      {
        int v8 = sqlite3_expanded_sql(ppStmt);
        if (v8)
        {
          if (MediaAnalysisEnableDatabaseLog())
          {
            id v9 = VCPLogInstance();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              int v14 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
              __int16 v15 = 1024;
              int v16 = 699;
              __int16 v17 = 2080;
              os_log_type_t v18 = v8;
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
            }
          }
          sqlite3_free(v8);
        }
        int v10 = sqlite3_step(ppStmt);
        if (v10 == 101) {
          int v5 = 0;
        }
        else {
          int v5 = v10;
        }
      }
    }
    sqlite3_finalize(ppStmt);
  }
  else
  {
    int v5 = -50;
  }

  return v5;
}

- (int)_removeAllProcessingStatusForTaskID:(unint64_t)a3
{
  ppStmt = 0;
  int v4 = sqlite3_prepare_v2(self->_database, "DELETE FROM ProcessingStatus WHERE taskID=(?);", -1, &ppStmt, 0);
  if (!v4)
  {
    int v4 = sqlite3_bind_int64(ppStmt, 1, a3);
    if (!v4)
    {
      int v5 = sqlite3_expanded_sql(ppStmt);
      if (v5)
      {
        id v6 = v5;
        if (MediaAnalysisEnableDatabaseLog())
        {
          id v7 = VCPLogInstance();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            int v12 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
            __int16 v13 = 1024;
            int v14 = 713;
            __int16 v15 = 2080;
            int v16 = v6;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
          }
        }
        sqlite3_free(v6);
      }
      int v8 = sqlite3_step(ppStmt);
      if (v8 == 101) {
        int v4 = 0;
      }
      else {
        int v4 = v8;
      }
    }
  }
  sqlite3_finalize(ppStmt);
  return v4;
}

- (BOOL)shouldPropagateError:(int *)a3 finalAttempt:(BOOL)a4
{
  int v6 = *a3;
  switch(*a3)
  {
    case 7:
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_26;
      }
      id v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v7, v8)) {
        goto LABEL_25;
      }
      LOWORD(v24[0]) = 0;
      id v9 = "Database allocation failed";
      goto LABEL_24;
    case 8:
    case 9:
    case 12:
    case 15:
    case 16:
    case 17:
      goto LABEL_7;
    case 10:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        __int16 v13 = VCPLogInstance();
        os_log_type_t v14 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v13, v14))
        {
          LOWORD(v24[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, v14, "Database I/O error; disk may be full",
            (uint8_t *)v24,
            2u);
        }
      }
      int v15 = -36;
      goto LABEL_32;
    case 11:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v16 = VCPLogInstance();
        os_log_type_t v17 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v16, v17))
        {
          LOWORD(v24[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "Database is corrupted", (uint8_t *)v24, 2u);
        }
      }
      return 0;
    case 13:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v7 = VCPLogInstance();
        os_log_type_t v8 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v7, v8))
        {
          LOWORD(v24[0]) = 0;
          id v9 = "Database or disk full";
LABEL_24:
          _os_log_impl((void *)&_mh_execute_header, v7, v8, v9, (uint8_t *)v24, 2u);
        }
LABEL_25:
      }
LABEL_26:
      int v18 = -108;
      goto LABEL_38;
    case 14:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        double v19 = VCPLogInstance();
        os_log_type_t v20 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v19, v20))
        {
          LOWORD(v24[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "Database open failure; disk may be full",
            (uint8_t *)v24,
            2u);
        }
      }
      int v15 = -23;
LABEL_32:
      *a3 = v15;
      return a4;
    case 18:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v21 = VCPLogInstance();
        os_log_type_t v22 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v21, v22))
        {
          LOWORD(v24[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "Database data size is too big", (uint8_t *)v24, 2u);
        }
      }
      int v18 = -50;
LABEL_38:
      *a3 = v18;
      return 1;
    default:
      if (v6 == -50) {
        return 1;
      }
      if (v6 != -23)
      {
LABEL_7:
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          int v10 = VCPLogInstance();
          os_log_type_t v11 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v10, v11))
          {
            int v12 = *a3;
            v24[0] = 67109120;
            v24[1] = v12;
            _os_log_impl((void *)&_mh_execute_header, v10, v11, "Unexpected database error (%d)", (uint8_t *)v24, 8u);
          }
        }
        return 0;
      }
      return a4;
  }
}

- (int)executeDatabaseBlock:(id)a3 fallbackBlock:(id)a4 write:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  os_log_type_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  sqlSerialQueue = self->_sqlSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033F0C;
  block[3] = &unk_10021A748;
  BOOL v18 = a5;
  block[4] = self;
  id v15 = v8;
  id v16 = v9;
  os_log_type_t v17 = &v19;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(sqlSerialQueue, block);
  LODWORD(sqlSerialQueue) = *((_DWORD *)v20 + 6);

  _Block_object_dispose(&v19, 8);
  return (int)sqlSerialQueue;
}

- (int)commit
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003470C;
  v3[3] = &unk_10021A770;
  v3[4] = self;
  return [(VCPDatabaseWriter *)self executeDatabaseBlock:v3 fallbackBlock:0 write:0];
}

- (void)flush
{
  sqlSerialQueue = self->_sqlSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000347A8;
  block[3] = &unk_100219FC8;
  block[4] = self;
  dispatch_sync(sqlSerialQueue, block);
}

- (unint64_t)sizeBytes
{
  id v3 = +[NSFileManager defaultManager];
  int v4 = [v3 attributesOfItemAtPath:self->_filepath error:0];
  id v5 = [v4 fileSize];

  return (unint64_t)v5;
}

- (id)creationDate
{
  id v3 = +[NSFileManager defaultManager];
  int v4 = [v3 attributesOfItemAtPath:self->_filepath error:0];
  id v5 = [v4 objectForKey:NSFileCreationDate];

  return v5;
}

- (BOOL)exists
{
  id v3 = +[NSFileManager defaultManager];
  if ([v3 fileExistsAtPath:self->_filepath])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
    int v6 = objc_msgSend(v5, "vcp_mediaAnalysisBackupFilepath");
    unsigned __int8 v4 = [v3 fileExistsAtPath:v6];
  }
  return v4;
}

- (BOOL)hasOutstandingTransactions
{
  return self->_transaction;
}

- (id)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_sqlSerialQueue, 0);
  objc_storeStrong((id *)&self->_filepath, 0);
}

+ (double)_ageOutIntervalForChangeTokenType:(unint64_t)a3
{
  return dbl_1001F2050[(a3 & 0xFFFFFFFFFFFFFFFELL) == 2];
}

- (int)setChangeToken:(id)a3 forTaskID:(unint64_t)a4 andChangeTokenType:(unint64_t)a5
{
  id v8 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 946;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(ChangeTokenOrBookmark) setChangeToken:forTaskID:andChangeTokenType:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_100034C88;
  uint64_t v19 = sub_100034C98;
  id v20 = 0;
  if (a5 == 2)
  {
    uint64_t v10 = [v8 base64EncodedDataWithOptions:0];
    id v11 = 0;
    id v12 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v10;
  }
  else
  {
    id v17 = 0;
    uint64_t v13 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v17];
    id v11 = v17;
    id v12 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v13;
  }

  if (*(void *)(*(void *)&buf[8] + 40))
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100034CA0;
    v16[3] = &unk_10021A798;
    v16[6] = a4;
    v16[7] = a5;
    v16[4] = self;
    v16[5] = buf;
    int v14 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v16 fallbackBlock:0 write:1];
  }
  else
  {
    int v14 = -50;
  }
  _Block_object_dispose(buf, 8);

  return v14;
}

- (int)updateChangeToken:(id)a3 forTaskID:(unint64_t)a4 andChangeTokenType:(unint64_t)a5
{
  id v8 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 979;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(ChangeTokenOrBookmark) updateChangeToken:forTaskID:andChangeTokenType:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_100034C88;
  uint64_t v19 = sub_100034C98;
  id v20 = 0;
  if (a5 == 2)
  {
    uint64_t v10 = [v8 base64EncodedDataWithOptions:0];
    id v11 = 0;
    id v12 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v10;
  }
  else
  {
    id v17 = 0;
    uint64_t v13 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v17];
    id v11 = v17;
    id v12 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v13;
  }

  if (*(void *)(*(void *)&buf[8] + 40))
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000351F4;
    v16[3] = &unk_10021A798;
    v16[4] = self;
    v16[5] = buf;
    v16[6] = a4;
    v16[7] = a5;
    int v14 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v16 fallbackBlock:0 write:1];
  }
  else
  {
    int v14 = -50;
  }
  _Block_object_dispose(buf, 8);

  return v14;
}

- (int)queryChangeToken:(id *)a3 forTaskID:(unint64_t)a4 andChangeTokenType:(unint64_t)a5
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v13 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v14 = 1024;
      int v15 = 1009;
      __int16 v16 = 2080;
      id v17 = "-[VCPDatabaseWriter(ChangeTokenOrBookmark) queryChangeToken:forTaskID:andChangeTokenType:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *a3 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100035548;
  v11[3] = &unk_10021A7C0;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = a5;
  v11[7] = a3;
  return [(VCPDatabaseWriter *)self executeDatabaseBlock:v11 fallbackBlock:0 write:0];
}

- (int)removeChangeTokenForTaskID:(unint64_t)a3 andChangeTokenType:(unint64_t)a4
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v11 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v12 = 1024;
      int v13 = 1056;
      __int16 v14 = 2080;
      int v15 = "-[VCPDatabaseWriter(ChangeTokenOrBookmark) removeChangeTokenForTaskID:andChangeTokenType:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100035C1C;
  v9[3] = &unk_10021A7E8;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  return [(VCPDatabaseWriter *)self executeDatabaseBlock:v9 fallbackBlock:0 write:1];
}

- (int)removeAllChangeTokensForTaskID:(unint64_t)a3
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v9 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v10 = 1024;
      int v11 = 1073;
      __int16 v12 = 2080;
      int v13 = "-[VCPDatabaseWriter(ChangeTokenOrBookmark) removeAllChangeTokensForTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100035EC4;
  v7[3] = &unk_10021A810;
  v7[4] = self;
  v7[5] = a3;
  return [(VCPDatabaseWriter *)self executeDatabaseBlock:v7 fallbackBlock:0 write:1];
}

- (int)setDeletePendingFlag:(BOOL)a3 localIdentifier:(id)a4
{
  id v6 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v15 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v16 = 1024;
      int v17 = 1096;
      __int16 v18 = 2080;
      uint64_t v19 = "-[VCPDatabaseWriter(Maintenance) setDeletePendingFlag:localIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000361A4;
  v11[3] = &unk_10021A838;
  BOOL v13 = a3;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  int v9 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v11 fallbackBlock:0 write:1];

  return v9;
}

- (int)updateFingerprint:(id)a3 forAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v18 = 1024;
      int v19 = 1122;
      __int16 v20 = 2080;
      uint64_t v21 = "-[VCPDatabaseWriter(Maintenance) updateFingerprint:forAsset:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000365B0;
  v13[3] = &unk_10021A860;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  int v11 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v13 fallbackBlock:0 write:1];

  return v11;
}

- (int)updateLocalIdentifer:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v18 = 1024;
      int v19 = 1141;
      __int16 v20 = 2080;
      uint64_t v21 = "-[VCPDatabaseWriter(Maintenance) updateLocalIdentifer:to:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000369F4;
  v13[3] = &unk_10021A860;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  int v11 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v13 fallbackBlock:0 write:1];

  return v11;
}

- (int)updateDateModifiedForAsset:(id)a3
{
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v13 = 1024;
      int v14 = 1161;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCPDatabaseWriter(Maintenance) updateDateModifiedForAsset:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100036E20;
  v9[3] = &unk_10021A888;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  int v7 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v9 fallbackBlock:0 write:1];

  return v7;
}

- (int)containsAsset:(id)a3 result:(BOOL *)a4
{
  id v6 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v17 = 1024;
      int v18 = 1180;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCPDatabaseWriter(Maintenance) containsAsset:result:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000372AC;
  v12[3] = &unk_10021A8B0;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  int v14 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100037474;
  v11[3] = &unk_10021A8D0;
  v11[4] = a4;
  int v9 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v12 fallbackBlock:v11 write:0];

  return v9;
}

- (int)queryAssetWithLocalIdentifier:(id)a3 forMediaAnalysisVersion:(id *)a4
{
  id v6 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1203;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(Maintenance) queryAssetWithLocalIdentifier:forMediaAnalysisVersion:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_100034C88;
  __int16 v16 = sub_100034C98;
  __int16 v17 = &off_10022DA20;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000376A8;
  v12[3] = &unk_10021A8F8;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  int v14 = buf;
  unsigned int v9 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v12 fallbackBlock:&stru_10021A938 write:0];
  int v10 = v9;
  if (a4 && !v9) {
    *a4 = *(id *)(*(void *)&buf[8] + 40);
  }

  _Block_object_dispose(buf, 8);
  return v10;
}

- (int64_t)compareExistingAnalysis:(id)a3 toNewAnalysis:(id)a4 forAsset:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((objc_msgSend(v9, "vcp_isAnalysisValid:", v7) & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() < 6) {
      goto LABEL_28;
    }
    int v11 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v18))
    {
      __int16 v19 = objc_msgSend(v7, "vcp_dateModified");
      __int16 v20 = objc_msgSend(v8, "vcp_dateModified");
      int v29 = 138412546;
      *(void *)os_log_type_t v30 = v19;
      *(_WORD *)&v30[8] = 2112;
      os_log_type_t v31 = v20;
      _os_log_impl((void *)&_mh_execute_header, v11, v18, "    Existing analysis from previous modification (%@ vs %@); discarding",
        (uint8_t *)&v29,
        0x16u);
    }
    goto LABEL_11;
  }
  int v10 = objc_msgSend(v7, "vcp_version");
  if (v10 <= (int)objc_msgSend(v8, "vcp_version"))
  {
    if (!objc_msgSend(v7, "vcp_degraded") || (objc_msgSend(v8, "vcp_degraded") & 1) != 0)
    {
      if ((objc_msgSend(v7, "vcp_degraded") & 1) != 0 || !objc_msgSend(v8, "vcp_degraded"))
      {
        int64_t v17 = 0;
        goto LABEL_33;
      }
      int v21 = objc_msgSend(v7, "vcp_version");
      if (v21 >= (int)objc_msgSend(v8, "vcp_version"))
      {
        if ([v9 isPhoto])
        {
          unint64_t v22 = (unint64_t)objc_msgSend(v7, "vcp_types");
          unint64_t v23 = (unint64_t)objc_msgSend(v8, "vcp_types");
          if ((v23 & ~v22 & (unint64_t)+[PHAsset vcp_fullAnalysisGenerativeModelAdditionalTypes]) != 0)
          {
            if ((int)MediaAnalysisLogLevel() < 6)
            {
              int64_t v17 = 2;
              goto LABEL_33;
            }
            int v11 = VCPLogInstance();
            os_log_type_t v24 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v11, v24))
            {
              signed int v25 = MediaAnalysisTypeDescription((unint64_t)objc_msgSend(v8, "vcp_types") & ~(unint64_t)objc_msgSend(v7, "vcp_types") & (unint64_t)+[PHAsset vcp_fullAnalysisGenerativeModelAdditionalTypes](PHAsset, "vcp_fullAnalysisGenerativeModelAdditionalTypes"));
              int v29 = 138412290;
              *(void *)os_log_type_t v30 = v25;
              _os_log_impl((void *)&_mh_execute_header, v11, v24, "    Existing analysis version up-to-date but missing %@; Update missing GM additional analysis only from"
                " new degraded analysis",
                (uint8_t *)&v29,
                0xCu);
            }
            int64_t v17 = 2;
            goto LABEL_12;
          }
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          int v11 = VCPLogInstance();
          os_log_type_t v27 = VCPLogToOSLogType[6];
          if (!os_log_type_enabled(v11, v27)) {
            goto LABEL_7;
          }
          LOWORD(v29) = 0;
          id v13 = "    New analysis degraded; discarding";
          int v14 = v11;
          os_log_type_t v15 = v27;
          uint32_t v16 = 2;
          goto LABEL_6;
        }
LABEL_32:
        int64_t v17 = -1;
        goto LABEL_33;
      }
LABEL_28:
      int64_t v17 = 1;
      goto LABEL_33;
    }
    if ((int)MediaAnalysisLogLevel() < 6) {
      goto LABEL_28;
    }
    int v11 = VCPLogInstance();
    os_log_type_t v26 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v26))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v26, "    Existing analysis degraded; discarding",
        (uint8_t *)&v29,
        2u);
    }
LABEL_11:
    int64_t v17 = 1;
    goto LABEL_12;
  }
  if ((int)MediaAnalysisLogLevel() < 6) {
    goto LABEL_32;
  }
  int v11 = VCPLogInstance();
  os_log_type_t v12 = VCPLogToOSLogType[6];
  if (os_log_type_enabled(v11, v12))
  {
    int v29 = 67109376;
    *(_DWORD *)os_log_type_t v30 = objc_msgSend(v7, "vcp_version");
    *(_WORD *)&v30[4] = 1024;
    *(_DWORD *)&v30[6] = objc_msgSend(v8, "vcp_version");
    id v13 = "    New analysis version outdated (%d vs %d); discarding";
    int v14 = v11;
    os_log_type_t v15 = v12;
    uint32_t v16 = 14;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, (uint8_t *)&v29, v16);
  }
LABEL_7:
  int64_t v17 = -1;
LABEL_12:

LABEL_33:
  return v17;
}

- (int)_deleteAsset:(id)a3
{
  id v4 = a3;
  ppStmt = 0;
  int v5 = sqlite3_prepare_v2(self->_database, "DELETE FROM Assets WHERE localIdentifier=(?);", -1, &ppStmt, 0);
  if (!v5)
  {
    id v6 = ppStmt;
    id v7 = v4;
    id v8 = v7;
    int v9 = v7
       ? sqlite3_bind_text(v6, 1, (const char *)[v7 UTF8String], -1, 0)
       : sqlite3_bind_null(v6, 1);
    int v5 = v9;

    if (!v5)
    {
      int v10 = sqlite3_expanded_sql(ppStmt);
      if (v10)
      {
        if (MediaAnalysisEnableDatabaseLog())
        {
          int v11 = VCPLogInstance();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            uint32_t v16 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
            __int16 v17 = 1024;
            int v18 = 1289;
            __int16 v19 = 2080;
            __int16 v20 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
          }
        }
        sqlite3_free(v10);
      }
      int v12 = sqlite3_step(ppStmt);
      if (v12 == 101) {
        int v5 = 0;
      }
      else {
        int v5 = v12;
      }
    }
  }
  sqlite3_finalize(ppStmt);

  return v5;
}

- (int)_storeProperties:(id)a3 forLocalIdentifier:(id)a4 assetId:(int64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  ppStmt = 0;
  int v10 = objc_msgSend(v8, "vcp_fingerprint");
  int v11 = sqlite3_prepare_v2(self->_database, "REPLACE INTO Assets (localIdentifier, version, dateModified, dateAnalyzed, analysisTypes, flags, quality, masterFingerprint, adjustedFingerprint, statsFlags) VALUES ((?), (?), (?), (?), (?), (?), (?), (?), (?), (?));",
          -1,
          &ppStmt,
          0);
  if (!v11)
  {
    int v12 = ppStmt;
    id v13 = v9;
    int v14 = v13;
    int v15 = v13
        ? sqlite3_bind_text(v12, 1, (const char *)[v13 UTF8String], -1, 0)
        : sqlite3_bind_null(v12, 1);
    int v11 = v15;

    if (!v11)
    {
      int v11 = sqlite3_bind_int(ppStmt, 2, (int)objc_msgSend(v8, "vcp_version"));
      if (!v11)
      {
        uint32_t v16 = ppStmt;
        objc_msgSend(v8, "vcp_dateModified");
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        int v18 = v17;
        if (v17)
        {
          [v17 timeIntervalSinceReferenceDate];
          int v20 = sqlite3_bind_double(v16, 3, v19);
        }
        else
        {
          int v20 = sqlite3_bind_null(v16, 3);
        }
        int v11 = v20;

        if (!v11)
        {
          int v21 = ppStmt;
          unint64_t v22 = objc_msgSend(v8, "vcp_dateAnalyzed");
          int v11 = sub_100034EF8(v21, 4, v22);

          if (!v11)
          {
            int v11 = sqlite3_bind_int64(ppStmt, 5, (sqlite3_int64)objc_msgSend(v8, "vcp_types"));
            if (!v11)
            {
              int v11 = sqlite3_bind_int(ppStmt, 6, (int)objc_msgSend(v8, "vcp_flags"));
              if (!v11)
              {
                unint64_t v23 = ppStmt;
                objc_msgSend(v8, "vcp_quality");
                int v11 = sqlite3_bind_double(v23, 7, v24);
                if (!v11)
                {
                  signed int v25 = ppStmt;
                  os_log_type_t v26 = [v10 master];
                  int v11 = sub_1000334B8(v25, 8, v26);

                  if (!v11)
                  {
                    os_log_type_t v27 = ppStmt;
                    os_log_type_t v28 = [v10 adjusted];
                    int v11 = sub_1000334B8(v27, 9, v28);

                    if (!v11)
                    {
                      int v11 = sqlite3_bind_int64(ppStmt, 10, (sqlite3_int64)objc_msgSend(v8, "vcp_statsFlags"));
                      if (!v11)
                      {
                        int v29 = sqlite3_expanded_sql(ppStmt);
                        if (v29)
                        {
                          if (MediaAnalysisEnableDatabaseLog())
                          {
                            os_log_type_t v30 = VCPLogInstance();
                            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                            {
                              *(_DWORD *)buf = 136315650;
                              long long v35 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
                              __int16 v36 = 1024;
                              int v37 = 1319;
                              __int16 v38 = 2080;
                              long long v39 = v29;
                              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
                            }
                          }
                          sqlite3_free(v29);
                        }
                        int v31 = sqlite3_step(ppStmt);
                        if (v31 == 101) {
                          int v11 = 0;
                        }
                        else {
                          int v11 = v31;
                        }
                        if (a5 && v31 == 101) {
                          *a5 = sqlite3_last_insert_rowid(self->_database);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  sqlite3_finalize(ppStmt);

  return v11;
}

- (int)_storeResult:(id)a3 withKey:(id)a4 forAssetId:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 isEqualToString:@"KeyFrameResourceResults"])
  {
LABEL_2:
    int v10 = 0;
    goto LABEL_24;
  }
  id v11 = MediaAnalysisResultsKeyToType(v9);
  int v12 = (int)v11;
  if (!v11)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint32_t v16 = VCPLogInstance();
      os_log_type_t v17 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v16, v17))
      {
        *(_DWORD *)buf = 138412290;
        int v21 = (const char *)v9;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "No results type for %@; dropping result", buf, 0xCu);
      }
    }
    goto LABEL_2;
  }
  if (v8)
  {
    ppStmt = 0;
    int v10 = sqlite3_prepare_v2(self->_database, "REPLACE INTO Results (assetId, resultsType, results) VALUES ((?), (?), (?));",
            -1,
            &ppStmt,
            0);
    if (!v10)
    {
      int v10 = sqlite3_bind_int64(ppStmt, 1, a5);
      if (!v10)
      {
        int v10 = sqlite3_bind_int(ppStmt, 2, v12);
        if (!v10)
        {
          int v10 = sub_100038538(ppStmt, (uint64_t)v8);
          if (!v10)
          {
            id v13 = sqlite3_expanded_sql(ppStmt);
            if (v13)
            {
              if (MediaAnalysisEnableDatabaseLog())
              {
                int v14 = VCPLogInstance();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  int v21 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
                  __int16 v22 = 1024;
                  int v23 = 1351;
                  __int16 v24 = 2080;
                  signed int v25 = v13;
                  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
                }
              }
              sqlite3_free(v13);
            }
            int v15 = sqlite3_step(ppStmt);
            if (v15 == 101) {
              int v10 = 0;
            }
            else {
              int v10 = v15;
            }
          }
        }
      }
    }
    sqlite3_finalize(ppStmt);
  }
  else
  {
    int v10 = -50;
  }
LABEL_24:

  return v10;
}

- (int)_storeAnalysis:(id)a3 forLocalIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "vcp_results");
  uint64_t v21 = 0;
  unsigned int v9 = sqlite3_exec(self->_database, "SAVEPOINT Analysis;", 0, 0, 0);
  if (v9) {
    goto LABEL_14;
  }
  unsigned int v9 = [(VCPDatabaseWriter *)self _storeProperties:v6 forLocalIdentifier:v7 assetId:&v21];
  if (v9) {
    goto LABEL_14;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v10 = objc_msgSend(v8, "allKeys", 0);
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        int v15 = [v8 objectForKey:v14];
        unsigned int v9 = [(VCPDatabaseWriter *)self _storeResult:v15 withKey:v14 forAssetId:v21];

        if (v9)
        {

          goto LABEL_14;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  unsigned int v9 = sqlite3_exec(self->_database, "RELEASE Analysis;", 0, 0, 0);
  if (v9) {
LABEL_14:
  }
    sqlite3_exec(self->_database, "ROLLBACK TO Analysis;", 0, 0, 0);

  return v9;
}

- (int)_deleteResult:(id)a3 forAssetId:(int64_t)a4
{
  id v6 = a3;
  id v7 = MediaAnalysisResultsKeyToType(v6);
  int v8 = (int)v7;
  if (v7)
  {
    ppStmt = 0;
    int v9 = sqlite3_prepare_v2(self->_database, "DELETE FROM Results WHERE assetId=(?) AND resultsType=(?);",
           -1,
           &ppStmt,
           0);
    if (!v9)
    {
      int v9 = sqlite3_bind_int64(ppStmt, 1, a4);
      if (!v9)
      {
        int v9 = sqlite3_bind_int(ppStmt, 2, v8);
        if (!v9)
        {
          int v10 = sqlite3_expanded_sql(ppStmt);
          if (v10)
          {
            if (MediaAnalysisEnableDatabaseLog())
            {
              id v11 = VCPLogInstance();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                long long v18 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
                __int16 v19 = 1024;
                int v20 = 1396;
                __int16 v21 = 2080;
                __int16 v22 = v10;
                _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
              }
            }
            sqlite3_free(v10);
          }
          int v12 = sqlite3_step(ppStmt);
          if (v12 == 101) {
            int v9 = 0;
          }
          else {
            int v9 = v12;
          }
        }
      }
    }
    sqlite3_finalize(ppStmt);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v13 = VCPLogInstance();
      os_log_type_t v14 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 138412290;
        long long v18 = (const char *)v6;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "No results type for %@; can't delete", buf, 0xCu);
      }
    }
    int v9 = 0;
  }

  return v9;
}

- (int)_updateProperties:(id)a3 forAssetId:(int64_t)a4
{
  id v6 = a3;
  ppStmt = 0;
  int v7 = sqlite3_prepare_v2(self->_database, "UPDATE Assets SET version=(?), dateModified=(?), dateAnalyzed=(?), analysisTypes=(?), flags=(?), quality=(?), statsFlags=(?) WHERE id=(?);",
         -1,
         &ppStmt,
         0);
  if (!v7)
  {
    int v7 = sqlite3_bind_int(ppStmt, 1, (int)objc_msgSend(v6, "vcp_version"));
    if (!v7)
    {
      int v8 = ppStmt;
      objc_msgSend(v6, "vcp_dateModified");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      int v10 = v9;
      if (v9)
      {
        [v9 timeIntervalSinceReferenceDate];
        int v12 = sqlite3_bind_double(v8, 2, v11);
      }
      else
      {
        int v12 = sqlite3_bind_null(v8, 2);
      }
      int v7 = v12;

      if (!v7)
      {
        id v13 = ppStmt;
        objc_msgSend(v6, "vcp_dateAnalyzed");
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        int v15 = v14;
        if (v14)
        {
          [v14 timeIntervalSinceReferenceDate];
          int v17 = sqlite3_bind_double(v13, 3, v16);
        }
        else
        {
          int v17 = sqlite3_bind_null(v13, 3);
        }
        int v7 = v17;

        if (!v7)
        {
          int v7 = sqlite3_bind_int64(ppStmt, 4, (sqlite3_int64)objc_msgSend(v6, "vcp_types"));
          if (!v7)
          {
            int v7 = sqlite3_bind_int(ppStmt, 5, (int)objc_msgSend(v6, "vcp_flags"));
            if (!v7)
            {
              long long v18 = ppStmt;
              objc_msgSend(v6, "vcp_quality");
              int v7 = sqlite3_bind_double(v18, 6, v19);
              if (!v7)
              {
                int v7 = sqlite3_bind_int64(ppStmt, 7, (sqlite3_int64)objc_msgSend(v6, "vcp_statsFlags"));
                if (!v7)
                {
                  int v7 = sqlite3_bind_int64(ppStmt, 8, a4);
                  if (!v7)
                  {
                    int v20 = sqlite3_expanded_sql(ppStmt);
                    if (v20)
                    {
                      if (MediaAnalysisEnableDatabaseLog())
                      {
                        __int16 v21 = VCPLogInstance();
                        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 136315650;
                          os_log_type_t v26 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
                          __int16 v27 = 1024;
                          int v28 = 1421;
                          __int16 v29 = 2080;
                          os_log_type_t v30 = v20;
                          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
                        }
                      }
                      sqlite3_free(v20);
                    }
                    int v22 = sqlite3_step(ppStmt);
                    if (v22 == 101) {
                      int v7 = 0;
                    }
                    else {
                      int v7 = v22;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  sqlite3_finalize(ppStmt);

  return v7;
}

- (int)_updateAnalysis:(id)a3 withAnalysis:(id)a4 forAsset:(id)a5 withAssetId:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v59 = v10;
  v60 = v12;
  uint64_t v62 = MediaAnalysisTypesUpdatedSince(objc_msgSend(v10, "vcp_version"), v12);
  unint64_t v13 = (unint64_t)objc_msgSend(v10, "vcp_types");
  unint64_t v14 = (unint64_t)objc_msgSend(v11, "vcp_types");
  unint64_t v57 = (unint64_t)objc_msgSend(v10, "vcp_types");
  unint64_t v55 = (unint64_t)objc_msgSend(v11, "vcp_types");
  unint64_t v15 = (unint64_t)objc_msgSend(v11, "vcp_types");
  unint64_t v16 = (unint64_t)objc_msgSend(v10, "vcp_types");
  unint64_t v53 = (unint64_t)objc_msgSend(v11, "vcp_types");
  unint64_t v52 = (unint64_t)objc_msgSend(v10, "vcp_types");
  uint64_t v54 = v15 & ~v16;
  uint64_t v17 = v54 | v62;
  uint64_t v61 = MediaAnalysisFlagsForTypes(v54 | v62);
  if (objc_msgSend(v12, "vcp_isLivePhoto") && (VCPMAFullAnalysisTypesLivePhoto & v17) != 0
    || [v12 isVideo] && (VCPMAFullAnalysisTypesMovie & v17) != 0)
  {
    v61 |= 0x20000000uLL;
  }
  unint64_t v51 = (unint64_t)objc_msgSend(v10, "vcp_flags");
  unint64_t v50 = (unint64_t)objc_msgSend(v11, "vcp_flags");
  if ((v17 & 0x100000) != 0) {
    long long v18 = v11;
  }
  else {
    long long v18 = v10;
  }
  id v49 = objc_msgSend(v18, "vcp_statsFlags");
  objc_msgSend(v11, "vcp_quality");
  double v19 = v11;
  if (v20 == -1.0)
  {
    if ((int)objc_msgSend(v10, "vcp_version") >= 3) {
      double v19 = v10;
    }
    else {
      double v19 = v11;
    }
  }
  objc_msgSend(v19, "vcp_quality");
  double v22 = v21;
  v64 = MediaAnalysisResultsUpdatedSince(objc_msgSend(v10, "vcp_version"), v12);
  unsigned int v23 = sqlite3_exec(self->_database, "SAVEPOINT Analysis;", 0, 0, 0);
  if (v23) {
    goto LABEL_51;
  }
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  __int16 v24 = MediaAnalysisResultsKeysForAnalysisTypes(v13 & ~v14 & v62);
  id v25 = [v24 countByEnumeratingWithState:&v73 objects:v81 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v74;
LABEL_16:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v74 != v26) {
        objc_enumerationMutation(v24);
      }
      unsigned int v23 = [(VCPDatabaseWriter *)self _deleteResult:*(void *)(*((void *)&v73 + 1) + 8 * v27) forAssetId:a6];
      if (v23) {
        goto LABEL_50;
      }
      if (v25 == (id)++v27)
      {
        id v25 = [v24 countByEnumeratingWithState:&v73 objects:v81 count:16];
        if (v25) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  __int16 v24 = MediaAnalysisResultsKeysForAnalysisTypes(v57 & v55 & v62);
  id v28 = [v24 countByEnumeratingWithState:&v69 objects:v80 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v70;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v70 != v29) {
          objc_enumerationMutation(v24);
        }
        uint64_t v31 = *(void *)(*((void *)&v69 + 1) + 8 * i);
        if ([v64 containsObject:v31])
        {
          os_log_type_t v32 = objc_msgSend(v11, "vcp_results");
          os_log_type_t v33 = [v32 objectForKey:v31];

          if (v33) {
            unsigned int v34 = [(VCPDatabaseWriter *)self _storeResult:v33 withKey:v31 forAssetId:a6];
          }
          else {
            unsigned int v34 = [(VCPDatabaseWriter *)self _deleteResult:v31 forAssetId:a6];
          }
          unsigned int v23 = v34;
          if (v34) {
            goto LABEL_49;
          }
        }
      }
      id v28 = [v24 countByEnumeratingWithState:&v69 objects:v80 count:16];
    }
    while (v28);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  __int16 v24 = MediaAnalysisResultsKeysForAnalysisTypes(v54);
  id v35 = [v24 countByEnumeratingWithState:&v65 objects:v79 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v66;
LABEL_37:
    uint64_t v37 = 0;
    while (1)
    {
      if (*(void *)v66 != v36) {
        objc_enumerationMutation(v24);
      }
      uint64_t v38 = *(void *)(*((void *)&v65 + 1) + 8 * v37);
      long long v39 = objc_msgSend(v11, "vcp_results");
      os_log_type_t v33 = [v39 objectForKey:v38];

      unsigned int v40 = v33
          ? [(VCPDatabaseWriter *)self _storeResult:v33 withKey:v38 forAssetId:a6]: [(VCPDatabaseWriter *)self _deleteResult:v38 forAssetId:a6];
      unsigned int v23 = v40;
      if (v40) {
        break;
      }

      if (v35 == (id)++v37)
      {
        id v35 = [v24 countByEnumeratingWithState:&v65 objects:v79 count:16];
        if (v35) {
          goto LABEL_37;
        }
        goto LABEL_46;
      }
    }
LABEL_49:

LABEL_50:
LABEL_51:
    sqlite3_exec(self->_database, "ROLLBACK TO Analysis;", 0, 0, 0);
    goto LABEL_52;
  }
LABEL_46:

  v77[0] = @"version";
  v56 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v11, "vcp_version"));
  v78[0] = v56;
  v77[1] = @"dateModified";
  v58 = objc_msgSend(v11, "vcp_dateModified");
  v78[1] = v58;
  v77[2] = @"dateAnalyzed";
  uint64_t v41 = objc_msgSend(v11, "vcp_dateAnalyzed");
  unint64_t v42 = v52 & ~v62 | v53;
  v63 = (void *)v41;
  v78[2] = v41;
  v77[3] = @"performedAnalysisTypes";
  CFStringRef v43 = +[NSNumber numberWithUnsignedLongLong:v42];
  v78[3] = v43;
  v77[4] = @"flags";
  uint64_t v44 = +[NSNumber numberWithUnsignedLongLong:v50 | v51 & ~v61];
  v78[4] = v44;
  v77[5] = @"statsFlags";
  uint64_t v45 = +[NSNumber numberWithUnsignedInteger:v49];
  v78[5] = v45;
  v77[6] = @"quality";
  v46 = +[NSNumber numberWithDouble:v22];
  v78[6] = v46;
  v47 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:7];
  unsigned int v23 = [(VCPDatabaseWriter *)self _updateProperties:v47 forAssetId:a6];

  if (v23) {
    goto LABEL_51;
  }
  unsigned int v23 = sqlite3_exec(self->_database, "RELEASE Analysis;", 0, 0, 0);
  if (v23) {
    goto LABEL_51;
  }
LABEL_52:

  return v23;
}

- (int)updateResultsForAsset:(id)a3 results:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 localIdentifier];
  ppStmt = 0;
  id v9 = +[NSMutableString stringWithString:@"SELECT id FROM Assets WHERE localIdentifier=?"];
  database = self->_database;
  id v11 = v9;
  unsigned int v12 = sqlite3_prepare_v2(database, (const char *)[v11 UTF8String], -1, &ppStmt, 0);
  if (!v12)
  {
    unint64_t v13 = ppStmt;
    id v14 = v8;
    unint64_t v15 = v14;
    int v16 = v14
        ? sqlite3_bind_text(v13, 1, (const char *)[v14 UTF8String], -1, 0)
        : sqlite3_bind_null(v13, 1);
    unsigned int v12 = v16;

    if (!v12)
    {
      uint64_t v17 = sqlite3_expanded_sql(ppStmt);
      if (v17)
      {
        if (MediaAnalysisEnableDatabaseLog())
        {
          long long v18 = VCPLogInstance();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v37 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
            __int16 v38 = 1024;
            int v39 = 1519;
            __int16 v40 = 2080;
            uint64_t v41 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
          }
        }
        sqlite3_free(v17);
      }
      unsigned int v12 = sqlite3_step(ppStmt);
      if (v12 != 100) {
        goto LABEL_24;
      }
      int v19 = sqlite3_column_int(ppStmt, 0);
      unsigned int v12 = sqlite3_step(ppStmt);
      if (v12 != 101) {
        goto LABEL_24;
      }
      unsigned int v12 = sqlite3_exec(self->_database, "SAVEPOINT Analysis;", 0, 0, 0);
      if (!v12)
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id obj = [v7 allKeys];
        id v20 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v20)
        {
          uint64_t v28 = v19;
          uint64_t v29 = *(void *)v31;
          while (2)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v31 != v29) {
                objc_enumerationMutation(obj);
              }
              uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * i);
              unsigned int v23 = [v7 objectForKey:v22];
              unsigned int v12 = [(VCPDatabaseWriter *)self _storeResult:v23 withKey:v22 forAssetId:v28];

              if (v12)
              {

                goto LABEL_25;
              }
            }
            id v20 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }

        unsigned int v12 = sqlite3_exec(self->_database, "RELEASE Analysis;", 0, 0, 0);
LABEL_24:
        if (!v12) {
          goto LABEL_29;
        }
      }
    }
  }
LABEL_25:
  sqlite3_exec(self->_database, "ROLLBACK TO Analysis;", 0, 0, 0);
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    __int16 v24 = VCPLogInstance();
    os_log_type_t v25 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v24, v25))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v37 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Failed to update results for asset %@", buf, 0xCu);
    }
  }
LABEL_29:

  return v12;
}

- (int)storeAnalysisForAsset:(id)a3 analysis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      os_log_type_t v25 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v26 = 1024;
      int v27 = 1543;
      __int16 v28 = 2080;
      uint64_t v29 = "-[VCPDatabaseWriter(MediaAnalysis) storeAnalysisForAsset:analysis:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  id v9 = [v6 localIdentifier];
  if (objc_msgSend(v6, "vcp_isAnalysisValid:", v7))
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100039E58;
    v20[3] = &unk_10021A960;
    v20[4] = self;
    id v21 = v9;
    id v22 = v7;
    id v23 = v6;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10003A138;
    v16[3] = &unk_10021A960;
    v16[4] = self;
    id v17 = v22;
    id v18 = v23;
    id v19 = v21;
    int v10 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v20 fallbackBlock:v16 write:1];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v11, v12))
      {
        unsigned int v13 = objc_msgSend(v7, "vcp_version");
        objc_msgSend(v7, "vcp_dateModified");
        id v14 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        os_log_type_t v25 = (const char *)v9;
        __int16 v26 = 1024;
        int v27 = v13;
        __int16 v28 = 2112;
        uint64_t v29 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%@] Cannot store invalid analysis (v%d) with %@", buf, 0x1Cu);
      }
    }
    int v10 = -18;
  }

  return v10;
}

- (int)bumpAnalysisVersionForAsset:(id)a3
{
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      os_log_type_t v12 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v13 = 1024;
      int v14 = 1603;
      __int16 v15 = 2080;
      int v16 = "-[VCPDatabaseWriter(MediaAnalysis) bumpAnalysisVersionForAsset:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003A3DC;
  v9[3] = &unk_10021A888;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  int v7 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v9 fallbackBlock:0 write:1];

  return v7;
}

- (int)_queryPropertiesForAsset:(id)a3 assetId:(int64_t *)a4 analysis:(id *)a5
{
  id v8 = a3;
  ppStmt = 0;
  int v9 = sqlite3_prepare_v2(self->_database, "SELECT id, version, dateModified, dateAnalyzed, analysisTypes, flags, quality, masterFingerprint, adjustedFingerprint, statsFlags FROM Assets WHERE localIdentifier=(?);",
         -1,
         &ppStmt,
         0);
  if (v9) {
    goto LABEL_40;
  }
  id v10 = ppStmt;
  id v11 = v8;
  os_log_type_t v12 = v11;
  int v13 = v11
      ? sqlite3_bind_text(v10, 1, (const char *)[v11 UTF8String], -1, 0)
      : sqlite3_bind_null(v10, 1);
  int v9 = v13;

  if (v9) {
    goto LABEL_40;
  }
  int v14 = sqlite3_expanded_sql(ppStmt);
  if (v14)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      __int16 v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v45 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v46 = 1024;
        int v47 = 1633;
        __int16 v48 = 2080;
        id v49 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    sqlite3_free(v14);
  }
  int v16 = sqlite3_step(ppStmt);
  if (v16 != 100) {
    goto LABEL_37;
  }
  id v17 = ppStmt;
  if (sqlite3_column_type(ppStmt, 2) == 5)
  {
    id v18 = 0;
  }
  else
  {
    id v18 = +[NSDate dateWithTimeIntervalSinceReferenceDate:sqlite3_column_double(v17, 2)];
  }
  id v19 = ppStmt;
  if (sqlite3_column_type(ppStmt, 3) != 5)
  {
    uint64_t v23 = +[NSDate dateWithTimeIntervalSinceReferenceDate:sqlite3_column_double(v19, 3)];
    id v20 = (void *)v23;
    if (!v18 || !v23) {
      goto LABEL_18;
    }
    *a4 = sqlite3_column_int(ppStmt, 0);
    id v24 = +[NSMutableDictionary dictionary];
    *a5 = v24;
    os_log_type_t v25 = +[NSNumber numberWithInt:sqlite3_column_int(ppStmt, 1)];
    [v24 setObject:v25 forKey:@"version"];

    [*a5 setObject:v18 forKey:@"dateModified"];
    [*a5 setObject:v20 forKey:@"dateAnalyzed"];
    id v26 = *a5;
    int v27 = +[NSNumber numberWithLongLong:sqlite3_column_int64(ppStmt, 4)];
    [v26 setObject:v27 forKey:@"performedAnalysisTypes"];

    id v28 = *a5;
    uint64_t v29 = +[NSNumber numberWithInt:sqlite3_column_int(ppStmt, 5)];
    [v28 setObject:v29 forKey:@"flags"];

    if (sqlite3_column_double(ppStmt, 6) != -1.0)
    {
      id v30 = *a5;
      long long v31 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v30 setObject:v31 forKey:@"quality"];
    }
    id v32 = *a5;
    long long v33 = ppStmt;
    if (sqlite3_column_type(ppStmt, 7) == 5)
    {
      unsigned int v34 = 0;
    }
    else
    {
      unsigned int v34 = +[NSString stringWithUTF8String:sqlite3_column_text(v33, 7)];
    }
    id v35 = ppStmt;
    if (sqlite3_column_type(ppStmt, 8) == 5)
    {
      uint64_t v36 = 0;
    }
    else
    {
      uint64_t v36 = +[NSString stringWithUTF8String:sqlite3_column_text(v35, 8)];
    }
    uint64_t v37 = +[VCPFingerprint fingerprintWithMaster:v34 adjusted:v36];
    objc_msgSend(v32, "vcp_setFingerprint:", v37);

    id v38 = *a5;
    int v39 = +[NSNumber numberWithLongLong:sqlite3_column_int64(ppStmt, 9)];
    [v38 setObject:v39 forKey:@"statsFlags"];

    if ((int)objc_msgSend(*a5, "vcp_version") < 3 && (objc_msgSend(*a5, "vcp_types") & 4) != 0)
    {
      id v40 = *a5;
      uint64_t v41 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*a5, "vcp_types") | 8);
      [v40 setObject:v41 forKey:@"performedAnalysisTypes"];
    }
    int v16 = sqlite3_step(ppStmt);

LABEL_37:
    if (v16 == 101) {
      int v9 = 0;
    }
    else {
      int v9 = v16;
    }
    goto LABEL_40;
  }
  id v20 = 0;
LABEL_18:
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v21 = VCPLogInstance();
    os_log_type_t v22 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v21, v22))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v45 = (const char *)v12;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "[%@] Existing analysis contains nil date; ignoring ...",
        buf,
        0xCu);
    }
  }
  int v9 = 0;
LABEL_40:
  sqlite3_finalize(ppStmt);
  if (v9) {
    *a5 = 0;
  }

  return v9;
}

- (int)_queryResultsForAssetId:(int64_t)a3 analysis:(id)a4
{
  id v6 = a4;
  int v7 = +[NSMutableDictionary dictionary];
  ppStmt = 0;
  int v8 = sqlite3_prepare_v2(self->_database, "SELECT resultsType, results FROM Results WHERE assetId=(?);",
         -1,
         &ppStmt,
         0);
  if (!v8)
  {
    int v8 = sqlite3_bind_int64(ppStmt, 1, a3);
    if (!v8)
    {
      id v10 = sqlite3_expanded_sql(ppStmt);
      if (v10)
      {
        if (MediaAnalysisEnableDatabaseLog())
        {
          id v11 = VCPLogInstance();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            id v21 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
            __int16 v22 = 1024;
            int v23 = 1691;
            __int16 v24 = 2080;
            os_log_type_t v25 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
          }
        }
        sqlite3_free(v10);
      }
      int v8 = sqlite3_step(ppStmt);
      while (v8 == 100)
      {
        int v12 = sqlite3_column_int(ppStmt, 0);
        int v13 = sub_10003AFD0(ppStmt, 1);
        uint64_t v14 = v12;
        if (!v13)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            int v16 = VCPLogInstance();
            os_log_type_t v17 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v16, v17))
            {
              MediaAnalysisResultsTypeToKey(v14);
              id v18 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              id v21 = v18;
              _os_log_impl((void *)&_mh_execute_header, v16, v17, "Cannot load result type: %@", buf, 0xCu);
            }
          }
          int v8 = -18;
          goto LABEL_3;
        }
        __int16 v15 = MediaAnalysisResultsTypeToKey(v12);
        if (v15) {
          [v7 setObject:v13 forKey:v15];
        }
        int v8 = sqlite3_step(ppStmt);
      }
      if (v8 == 101)
      {
        if ([v7 count]) {
          [v6 setObject:v7 forKey:@"metadataRanges"];
        }
        int v8 = 0;
      }
    }
  }
LABEL_3:
  sqlite3_finalize(ppStmt);

  return v8;
}

- (int)analysisForAsset:(id)a3 analysis:(id *)a4
{
  id v6 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v16 = 1024;
      int v17 = 1724;
      __int16 v18 = 2080;
      id v19 = "-[VCPDatabaseWriter(MediaAnalysis) analysisForAsset:analysis:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003B340;
  v11[3] = &unk_10021A8B0;
  int v13 = a4;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  int v9 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v11 fallbackBlock:0 write:0];

  return v9;
}

- (int)deleteAnalysisForAsset:(id)a3
{
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v13 = 1024;
      int v14 = 1746;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCPDatabaseWriter(MediaAnalysis) deleteAnalysisForAsset:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003B5F4;
  v9[3] = &unk_10021A888;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  int v7 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v9 fallbackBlock:0 write:1];

  return v7;
}

- (int)queryAnalysisResultWithType:(unint64_t)a3 forAsset:(id)a4 result:(id *)a5
{
  id v8 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v19 = 1024;
      int v20 = 1757;
      __int16 v21 = 2080;
      __int16 v22 = "-[VCPDatabaseWriter(MediaAnalysis) queryAnalysisResultWithType:forAsset:result:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003B87C;
  v13[3] = &unk_10021A988;
  v13[4] = self;
  unint64_t v15 = a3;
  id v10 = v8;
  id v14 = v10;
  __int16 v16 = a5;
  int v11 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v13 fallbackBlock:0 write:0];

  return v11;
}

- (int)queryAnalysisResultsForAssets:(id)a3 results:(id *)a4
{
  id v6 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v18 = 1024;
      int v19 = 1789;
      __int16 v20 = 2080;
      __int16 v21 = "-[VCPDatabaseWriter(MediaAnalysis) queryAnalysisResultsForAssets:results:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  if ([v6 count])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003BD04;
    v12[3] = &unk_10021A8B0;
    __int16 v13 = v6;
    id v14 = self;
    unint64_t v15 = a4;
    int v8 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v12 fallbackBlock:0 write:0];
    int v9 = v13;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 4)
    {
      int v8 = 0;
      goto LABEL_12;
    }
    int v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v9, v10))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "No local identifiers provided; return empty analyses",
        buf,
        2u);
    }
    int v8 = 0;
  }

LABEL_12:
  return v8;
}

- (int)_getBlacklistExpiredCount:(id)a3 count:(int *)a4
{
  id v6 = a3;
  ppStmt = 0;
  int v7 = sqlite3_prepare_v2(self->_database, "SELECT count(*) FROM Blacklist WHERE date<=(?);", -1, &ppStmt, 0);
  if (!v7)
  {
    int v8 = ppStmt;
    id v9 = v6;
    os_log_type_t v10 = v9;
    if (v9)
    {
      [v9 timeIntervalSinceReferenceDate];
      int v12 = sqlite3_bind_double(v8, 1, v11);
    }
    else
    {
      int v12 = sqlite3_bind_null(v8, 1);
    }
    int v7 = v12;

    if (!v7)
    {
      __int16 v13 = sqlite3_expanded_sql(ppStmt);
      if (v13)
      {
        if (MediaAnalysisEnableDatabaseLog())
        {
          id v14 = VCPLogInstance();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
            __int16 v19 = 1024;
            int v20 = 1866;
            __int16 v21 = 2080;
            __int16 v22 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
          }
        }
        sqlite3_free(v13);
      }
      int v7 = sqlite3_step(ppStmt);
      if (v7 == 100)
      {
        int v7 = 0;
        *a4 = sqlite3_column_int(ppStmt, 0);
      }
    }
  }
  sqlite3_finalize(ppStmt);

  return v7;
}

- (int)ageOutBlacklistBefore:(id)a3 count:(int *)a4
{
  id v6 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      unint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v16 = 1024;
      int v17 = 1876;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCPDatabaseWriter(Blacklist) ageOutBlacklistBefore:count:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003C664;
  v11[3] = &unk_10021A8B0;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  __int16 v13 = a4;
  int v9 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v11 fallbackBlock:0 write:1];

  return v9;
}

- (int)_getBlacklistCountForLocalIdentifier:(id)a3 count:(int *)a4
{
  id v6 = a3;
  ppStmt = 0;
  int v7 = sqlite3_prepare_v2(self->_database, "SELECT count FROM Blacklist WHERE localIdentifier=(?);", -1, &ppStmt, 0);
  if (!v7)
  {
    id v8 = ppStmt;
    id v9 = v6;
    os_log_type_t v10 = v9;
    int v11 = v9
        ? sqlite3_bind_text(v8, 1, (const char *)[v9 UTF8String], -1, 0)
        : sqlite3_bind_null(v8, 1);
    int v7 = v11;

    if (!v7)
    {
      id v12 = sqlite3_expanded_sql(ppStmt);
      if (v12)
      {
        if (MediaAnalysisEnableDatabaseLog())
        {
          __int16 v13 = VCPLogInstance();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
            __int16 v19 = 1024;
            int v20 = 1901;
            __int16 v21 = 2080;
            __int16 v22 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
          }
        }
        sqlite3_free(v12);
      }
      int v14 = sqlite3_step(ppStmt);
      int v7 = v14;
      if (v14 == 101)
      {
        *a4 = 0;
      }
      else
      {
        if (v14 != 100) {
          goto LABEL_18;
        }
        *a4 = sqlite3_column_int(ppStmt, 0);
        int v7 = sqlite3_step(ppStmt);
        if (v7 != 101) {
          goto LABEL_18;
        }
      }
      int v7 = 0;
    }
  }
LABEL_18:
  sqlite3_finalize(ppStmt);

  return v7;
}

- (int)getBlacklistCountForLocalIdentifier:(id)a3
{
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1920;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(Blacklist) getBlacklistCountForLocalIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(_DWORD *)&buf[24] = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003CBDC;
  v9[3] = &unk_10021A8F8;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  int v11 = buf;
  [(VCPDatabaseWriter *)self executeDatabaseBlock:v9 fallbackBlock:0 write:0];
  int v7 = *(_DWORD *)(*(void *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v7;
}

- (int)addAssetToBlacklist:(id)a3
{
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v18 = 1024;
      int v19 = 1929;
      __int16 v20 = 2080;
      __int16 v21 = "-[VCPDatabaseWriter(Blacklist) addAssetToBlacklist:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_10003CD98;
  __int16 v13 = &unk_10021A888;
  int v14 = self;
  id v6 = v4;
  id v15 = v6;
  int v7 = objc_retainBlock(&v10);
  int v8 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:](self, "executeDatabaseBlock:fallbackBlock:write:", v7, v7, 1, v10, v11, v12, v13, v14);

  return v8;
}

- (int)decrementBlacklistCountForLocalIdentifier:(id)a3
{
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v13 = 1024;
      int v14 = 1957;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCPDatabaseWriter(Blacklist) decrementBlacklistCountForLocalIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003D194;
  v9[3] = &unk_10021A888;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  int v7 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v9 fallbackBlock:0 write:1];

  return v7;
}

- (int)removeLocalIdentifierFromBlacklist:(id)a3
{
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v13 = 1024;
      int v14 = 1991;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCPDatabaseWriter(Blacklist) removeLocalIdentifierFromBlacklist:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003D6AC;
  v9[3] = &unk_10021A888;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  int v7 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v9 fallbackBlock:0 write:1];

  return v7;
}

- (int)getBlacklistSizeForThreshold:(int)a3 size:(unint64_t *)a4
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v13 = 1024;
      int v14 = 2008;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCPDatabaseWriter(Blacklist) getBlacklistSizeForThreshold:size:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003D99C;
  v9[3] = &unk_10021A9B0;
  int v10 = a3;
  v9[4] = self;
  void v9[5] = a4;
  return [(VCPDatabaseWriter *)self executeDatabaseBlock:v9 fallbackBlock:&stru_10021A9D0 write:0];
}

- (int)getBlacklistedAssetsWithCount:(int)a3 localIdentifiers:(id *)a4
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2026;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(Blacklist) getBlacklistedAssetsWithCount:localIdentifiers:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_100034C88;
  __int16 v13 = sub_100034C98;
  id v14 = +[NSMutableArray array];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003DD04;
  v10[3] = &unk_10021A9F8;
  int v11 = a3;
  v10[4] = self;
  v10[5] = buf;
  int v8 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v10 fallbackBlock:0 write:0];
  *a4 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v8;
}

+ (id)assetTypePredicatesStringWithMediaType:(int64_t)a3 mediaSubtypes:(unint64_t)a4 imageOnlyAnalysis:(BOOL)a5
{
  int v5 = 0;
  if ((unint64_t)(a3 - 3) >= 0xFFFFFFFFFFFFFFFELL && !a5)
  {
    char v6 = a4;
    int v8 = +[NSMutableString stringWithFormat:@"AND mediaType=(%ld) ", a3];
    int v5 = v8;
    if (a3 == 1)
    {
      [v8 appendString:@"AND "];
      if ((v6 & 8) == 0) {
        [v5 appendString:@"NOT "];
      }
      objc_msgSend(v5, "appendFormat:", @"(mediaSubtypes & (%lu)) ", 8);
    }
  }
  return v5;
}

- (int)queryAssetCountForTaskID:(unint64_t)a3
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2083;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(ProcessingStatus) queryAssetCountForTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(_DWORD *)&buf[24] = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003E1E8;
  v8[3] = &unk_10021AA20;
  v8[5] = buf;
  v8[6] = a3;
  v8[4] = self;
  [(VCPDatabaseWriter *)self executeDatabaseBlock:v8 fallbackBlock:0 write:0];
  int v6 = *(_DWORD *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v6;
}

- (int)queryAssetCountForTaskID:(unint64_t)a3 withStatus:(unint64_t)a4
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2108;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(ProcessingStatus) queryAssetCountForTaskID:withStatus:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(_DWORD *)&buf[24] = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003E4F8;
  v10[3] = &unk_10021A798;
  void v10[6] = a3;
  v10[7] = a4;
  v10[4] = self;
  v10[5] = buf;
  [(VCPDatabaseWriter *)self executeDatabaseBlock:v10 fallbackBlock:0 write:0];
  int v8 = *(_DWORD *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v8;
}

- (int)queryAssetCountForTaskID:(unint64_t)a3 withStatus:(unint64_t)a4 andAttempts:(int)a5
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2134;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(ProcessingStatus) queryAssetCountForTaskID:withStatus:andAttempts:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(_DWORD *)&buf[24] = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003E830;
  v12[3] = &unk_10021AA48;
  v12[6] = a3;
  v12[7] = a4;
  int v13 = a5;
  void v12[4] = self;
  void v12[5] = buf;
  [(VCPDatabaseWriter *)self executeDatabaseBlock:v12 fallbackBlock:0 write:0];
  int v10 = *(_DWORD *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v10;
}

- (int)queryAttemptsForLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4
{
  id v6 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2161;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(ProcessingStatus) queryAttemptsForLocalIdentifier:andTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(_DWORD *)&buf[24] = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003EBA4;
  v11[3] = &unk_10021AA70;
  v11[4] = self;
  unint64_t v14 = a4;
  id v8 = v6;
  id v12 = v8;
  int v13 = buf;
  [(VCPDatabaseWriter *)self executeDatabaseBlock:v11 fallbackBlock:0 write:0];
  int v9 = *(_DWORD *)(*(void *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v9;
}

- (int)queryProcessingStatus:(unint64_t *)a3 attempts:(int *)a4 lastAttemptDate:(id *)a5 andNextAttemptDate:(id *)a6 forLocalIdentifier:(id)a7 andTaskID:(unint64_t)a8
{
  id v14 = a7;
  if (MediaAnalysisEnableDatabaseLog())
  {
    __int16 v15 = VCPLogInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v27 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v28 = 1024;
      int v29 = 2195;
      __int16 v30 = 2080;
      long long v31 = "-[VCPDatabaseWriter(ProcessingStatus) queryProcessingStatus:attempts:lastAttemptDate:andNextAttemptDate:forL"
            "ocalIdentifier:andTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003EF6C;
  v19[3] = &unk_10021AA98;
  v19[4] = self;
  unint64_t v21 = a8;
  id v16 = v14;
  id v20 = v16;
  __int16 v22 = a3;
  int v23 = a4;
  __int16 v24 = a5;
  os_log_type_t v25 = a6;
  int v17 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v19 fallbackBlock:0 write:0];

  return v17;
}

- (unint64_t)queryEligibleToRetryAssetCountWithTaskID:(unint64_t)a3
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315650;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v16 = 1024;
      int v17 = 2228;
      __int16 v18 = 2080;
      int v19 = "-[VCPDatabaseWriter(ProcessingStatus) queryEligibleToRetryAssetCountWithTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", (uint8_t *)&v14, 0x1Cu);
    }
  }
  unint64_t v6 = [(VCPDatabaseWriter *)self queryEligibleToRetryAssetCountWithProcessingStatus:0 andTaskID:a3];
  unint64_t v7 = [(VCPDatabaseWriter *)self queryEligibleToRetryAssetCountWithProcessingStatus:1 andTaskID:a3];
  unint64_t v8 = [(VCPDatabaseWriter *)self queryEligibleToRetryAssetCountWithProcessingStatus:2 andTaskID:a3];
  unint64_t v9 = [(VCPDatabaseWriter *)self queryEligibleToRetryAssetCountWithProcessingStatus:3 andTaskID:a3];
  unint64_t v10 = [(VCPDatabaseWriter *)self queryEligibleToRetryAssetCountWithProcessingStatus:4 andTaskID:a3];
  unint64_t v11 = [(VCPDatabaseWriter *)self queryEligibleToRetryAssetCountWithProcessingStatus:5 andTaskID:a3];
  unint64_t v12 = [(VCPDatabaseWriter *)self queryEligibleToRetryAssetCountWithProcessingStatus:6 andTaskID:a3];
  return [(VCPDatabaseWriter *)self queryEligibleToRetryAssetCountWithProcessingStatus:7 andTaskID:a3]+ v7+ v6+ v8+ v9+ v10+ v11+ v12;
}

- (unint64_t)queryEligibleToRetryAssetCountWithProcessingStatus:(unint64_t)a3 andTaskID:(unint64_t)a4
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    unint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2240;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(ProcessingStatus) queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(void *)&buf[24] = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003F574;
  v10[3] = &unk_10021A798;
  void v10[6] = a4;
  v10[7] = a3;
  v10[4] = self;
  v10[5] = buf;
  [(VCPDatabaseWriter *)self executeDatabaseBlock:v10 fallbackBlock:0 write:0];
  unint64_t v8 = *(void *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v8;
}

- (int)fetchEligibleToRetryLocalIdentifiers:(id *)a3 processingStatus:(unint64_t)a4 taskID:(unint64_t)a5 fetchLimit:(unint64_t)a6 additionalPredicates:(id)a7
{
  id v12 = a7;
  if (a3)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      int v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v25 = 1024;
        int v26 = 2274;
        __int16 v27 = 2080;
        __int16 v28 = "-[VCPDatabaseWriter(ProcessingStatus) fetchEligibleToRetryLocalIdentifiers:processingStatus:taskID:fetchLi"
              "mit:additionalPredicates:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10003F9A0;
    v16[3] = &unk_10021AAC0;
    id v17 = v12;
    __int16 v18 = self;
    unint64_t v19 = a5;
    unint64_t v20 = a4;
    unint64_t v21 = a6;
    __int16 v22 = a3;
    int v14 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v16 fallbackBlock:0 write:0];
  }
  else
  {
    int v14 = -50;
  }

  return v14;
}

- (int)fetchEligibleToRetryLocalIdentifiers:(id *)a3 withProcessingStatus:(unint64_t)a4 andTaskID:(unint64_t)a5 andFetchLimit:(unint64_t)a6
{
  return [(VCPDatabaseWriter *)self fetchEligibleToRetryLocalIdentifiers:a3 processingStatus:a4 taskID:a5 fetchLimit:a6 additionalPredicates:0];
}

- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 withTaskID:(unint64_t)a4 andFetchLimit:(unint64_t)a5
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    unint64_t v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v13 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v14 = 1024;
      int v15 = 2328;
      __int16 v16 = 2080;
      id v17 = "-[VCPDatabaseWriter(ProcessingStatus) fetchLocalIdentifiersEligibleForRetry:withTaskID:andFetchLimit:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003FEF0;
  v11[3] = &unk_10021A7C0;
  v11[4] = self;
  void v11[5] = a4;
  v11[6] = a5;
  v11[7] = a3;
  return [(VCPDatabaseWriter *)self executeDatabaseBlock:v11 fallbackBlock:0 write:0];
}

- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 taskID:(unint64_t)a4 includingStatuses:(id)a5 fetchLimit:(unint64_t)a6 additionalPredicates:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  if (a3)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      __int16 v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v26 = 1024;
        int v27 = 2367;
        __int16 v28 = 2080;
        int v29 = "-[VCPDatabaseWriter(ProcessingStatus) fetchLocalIdentifiersEligibleForRetry:taskID:includingStatuses:fetch"
              "Limit:additionalPredicates:]";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100040448;
    v17[3] = &unk_10021AAE8;
    id v18 = v12;
    id v19 = v13;
    unint64_t v20 = self;
    unint64_t v21 = a4;
    unint64_t v22 = a6;
    int v23 = a3;
    int v15 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v17 fallbackBlock:0 write:0];
  }
  else
  {
    int v15 = -50;
  }

  return v15;
}

- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 withTaskID:(unint64_t)a4 includingStatuses:(id)a5 andFetchLimit:(unint64_t)a6
{
  return [(VCPDatabaseWriter *)self fetchLocalIdentifiersEligibleForRetry:a3 taskID:a4 includingStatuses:a5 fetchLimit:a6 additionalPredicates:0];
}

- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 taskID:(unint64_t)a4 excludingStatuses:(id)a5 fetchLimit:(unint64_t)a6 additionalPredicates:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  if (a3)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      __int16 v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v26 = 1024;
        int v27 = 2428;
        __int16 v28 = 2080;
        int v29 = "-[VCPDatabaseWriter(ProcessingStatus) fetchLocalIdentifiersEligibleForRetry:taskID:excludingStatuses:fetch"
              "Limit:additionalPredicates:]";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100040B40;
    v17[3] = &unk_10021AAE8;
    id v18 = v12;
    id v19 = v13;
    unint64_t v20 = self;
    unint64_t v21 = a4;
    unint64_t v22 = a6;
    int v23 = a3;
    int v15 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v17 fallbackBlock:0 write:0];
  }
  else
  {
    int v15 = -50;
  }

  return v15;
}

- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 withTaskID:(unint64_t)a4 excludingStatuses:(id)a5 andFetchLimit:(unint64_t)a6
{
  return [(VCPDatabaseWriter *)self fetchLocalIdentifiersEligibleForRetry:a3 taskID:a4 excludingStatuses:a5 fetchLimit:a6 additionalPredicates:0];
}

- (int)fetchLocalIdentifiers:(id *)a3 processingStatus:(unint64_t)a4 taskID:(unint64_t)a5 attempts:(int)a6 fetchLimit:(unint64_t)a7 additionalPredicates:(id)a8
{
  id v14 = a8;
  if (a3)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      int v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        int v27 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v28 = 1024;
        int v29 = 2490;
        __int16 v30 = 2080;
        long long v31 = "-[VCPDatabaseWriter(ProcessingStatus) fetchLocalIdentifiers:processingStatus:taskID:attempts:fetchLimit:ad"
              "ditionalPredicates:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100041218;
    v18[3] = &unk_10021AB10;
    id v19 = v14;
    unint64_t v20 = self;
    unint64_t v21 = a5;
    unint64_t v22 = a4;
    int v25 = a6;
    unint64_t v23 = a7;
    __int16 v24 = a3;
    int v16 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v18 fallbackBlock:0 write:0];
  }
  else
  {
    int v16 = -50;
  }

  return v16;
}

- (int)fetchLocalIdentifiers:(id *)a3 withProcessingStatus:(unint64_t)a4 andTaskID:(unint64_t)a5 andAttempts:(int)a6 andFetchLimit:(unint64_t)a7
{
  return [(VCPDatabaseWriter *)self fetchLocalIdentifiers:a3 processingStatus:a4 taskID:a5 attempts:*(void *)&a6 fetchLimit:a7 additionalPredicates:0];
}

- (int)fetchLocalIdentifiers:(id *)a3 taskID:(unint64_t)a4 processingStatus:(unint64_t)a5 additionalPredicates:(id)a6
{
  id v10 = a6;
  if (a3)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      unint64_t v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        unint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v22 = 1024;
        int v23 = 2547;
        __int16 v24 = 2080;
        int v25 = "-[VCPDatabaseWriter(ProcessingStatus) fetchLocalIdentifiers:taskID:processingStatus:additionalPredicates:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100041770;
    v14[3] = &unk_10021AB38;
    id v15 = v10;
    int v16 = self;
    unint64_t v17 = a4;
    unint64_t v18 = a5;
    id v19 = a3;
    int v12 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v14 fallbackBlock:0 write:0];
  }
  else
  {
    int v12 = -50;
  }

  return v12;
}

- (int)fetchLocalIdentifiers:(id *)a3 withTaskID:(unint64_t)a4 andProcessingStatus:(unint64_t)a5
{
  return [(VCPDatabaseWriter *)self fetchLocalIdentifiers:a3 taskID:a4 processingStatus:a5 additionalPredicates:0];
}

- (int)fetchLocalIdentifiers:(id *)a3 taskID:(unint64_t)a4 processingStatus:(unint64_t)a5 errorCode:(int64_t)a6 sinceDate:(id)a7 additionalPredicates:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  if (a3)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      int v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v29 = 1024;
        int v30 = 2600;
        __int16 v31 = 2080;
        id v32 = "-[VCPDatabaseWriter(ProcessingStatus) fetchLocalIdentifiers:taskID:processingStatus:errorCode:sinceDate:ad"
              "ditionalPredicates:]";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100041CCC;
    v19[3] = &unk_10021AB60;
    id v20 = v15;
    unint64_t v21 = self;
    unint64_t v23 = a4;
    unint64_t v24 = a5;
    int64_t v25 = a6;
    id v22 = v14;
    __int16 v26 = a3;
    int v17 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v19 fallbackBlock:0 write:0];
  }
  else
  {
    int v17 = -50;
  }

  return v17;
}

- (int)fetchLocalIdentifiers:(id *)a3 withTaskID:(unint64_t)a4 andProcessingStatus:(unint64_t)a5 errorCode:(int64_t)a6 sinceDate:(id)a7
{
  return [(VCPDatabaseWriter *)self fetchLocalIdentifiers:a3 taskID:a4 processingStatus:a5 errorCode:a6 sinceDate:a7 additionalPredicates:0];
}

- (int)fetchProcessingErrorCode:(unint64_t *)a3 errorLine:(unint64_t *)a4 taskID:(unint64_t)a5 localIndentifier:(id)a6
{
  id v10 = a6;
  int v11 = -50;
  if (a3 && a4)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      int v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        id v20 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v21 = 1024;
        int v22 = 2658;
        __int16 v23 = 2080;
        unint64_t v24 = "-[VCPDatabaseWriter(ProcessingStatus) fetchProcessingErrorCode:errorLine:taskID:localIndentifier:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100042228;
    v14[3] = &unk_10021AB38;
    void v14[4] = self;
    unint64_t v16 = a5;
    id v15 = v10;
    int v17 = a3;
    unint64_t v18 = a4;
    int v11 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v14 fallbackBlock:0 write:0];
  }
  return v11;
}

- (int)fetchProcessingErrorCodeCounts:(id *)a3 withTaskID:(unint64_t)a4 sinceDate:(id)a5 additionalPredicates:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (a3)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      int v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        int v22 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v23 = 1024;
        int v24 = 2691;
        __int16 v25 = 2080;
        __int16 v26 = "-[VCPDatabaseWriter(ProcessingStatus) fetchProcessingErrorCodeCounts:withTaskID:sinceDate:additionalPredicates:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100042600;
    v15[3] = &unk_10021AB88;
    id v16 = v11;
    int v17 = self;
    unint64_t v19 = a4;
    id v18 = v10;
    id v20 = a3;
    int v13 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v15 fallbackBlock:0 write:0];
  }
  else
  {
    int v13 = -50;
  }

  return v13;
}

- (int)setAttempts:(unint64_t)a3 asset:(id)a4 taskID:(unint64_t)a5 status:(unint64_t)a6 lastAttemptDate:(id)a7 mediaType:(int64_t)a8 mediaSubtypes:(unint64_t)a9 errorCode:(unint64_t)a10 errorLine:(unint64_t)a11
{
  id v17 = a4;
  id v26 = a7;
  __int16 v25 = objc_msgSend(v17, "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:", a6, v17);
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v18 = VCPLogInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v39 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v40 = 1024;
      int v41 = 2741;
      __int16 v42 = 2080;
      CFStringRef v43 = "-[VCPDatabaseWriter(ProcessingStatus) setAttempts:asset:taskID:status:lastAttemptDate:mediaType:mediaSubtype"
            "s:errorCode:errorLine:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100042C54;
  v27[3] = &unk_10021ABB0;
  v27[4] = self;
  unint64_t v31 = a5;
  id v19 = v17;
  id v28 = v19;
  id v20 = v26;
  id v29 = v20;
  id v21 = v25;
  id v30 = v21;
  unint64_t v32 = a10;
  unint64_t v33 = a11;
  int64_t v34 = a8;
  unint64_t v35 = a9;
  unint64_t v36 = a3;
  unint64_t v37 = a6;
  int v22 = objc_retainBlock(v27);
  int v23 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v22 fallbackBlock:v22 write:1];

  return v23;
}

- (int)setAttempts:(unint64_t)a3 asset:(id)a4 taskID:(unint64_t)a5 status:(unint64_t)a6 lastAttemptDate:(id)a7 mediaType:(int64_t)a8 mediaSubtypes:(unint64_t)a9
{
  return [(VCPDatabaseWriter *)self setAttempts:a3 asset:a4 taskID:a5 status:a6 lastAttemptDate:a7 mediaType:a8 mediaSubtypes:a9 errorCode:98 errorLine:0];
}

- (int)setAttempts:(unint64_t)a3 asset:(id)a4 taskID:(unint64_t)a5 status:(unint64_t)a6 lastAttemptDate:(id)a7
{
  return [(VCPDatabaseWriter *)self setAttempts:a3 asset:a4 taskID:a5 status:a6 lastAttemptDate:a7 mediaType:0 mediaSubtypes:0 errorCode:98 errorLine:0];
}

- (int)removeProcessingStatusForLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4
{
  id v6 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    unint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v16 = 1024;
      int v17 = 2804;
      __int16 v18 = 2080;
      id v19 = "-[VCPDatabaseWriter(ProcessingStatus) removeProcessingStatusForLocalIdentifier:andTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100043110;
  v11[3] = &unk_10021A8B0;
  v11[4] = self;
  unint64_t v13 = a4;
  id v8 = v6;
  id v12 = v8;
  int v9 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v11 fallbackBlock:0 write:1];

  return v9;
}

- (int)removeAllProcessingStatusForTaskID:(unint64_t)a3
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v9 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v10 = 1024;
      int v11 = 2822;
      __int16 v12 = 2080;
      unint64_t v13 = "-[VCPDatabaseWriter(ProcessingStatus) removeAllProcessingStatusForTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004340C;
  v7[3] = &unk_10021A810;
  v7[4] = self;
  v7[5] = a3;
  return [(VCPDatabaseWriter *)self executeDatabaseBlock:v7 fallbackBlock:0 write:1];
}

- (int)removeProcessingStatusForTaskID:(unint64_t)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      unint64_t v13 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v14 = 1024;
      int v15 = 2831;
      __int16 v16 = 2080;
      int v17 = "-[VCPDatabaseWriter(ProcessingStatus) removeProcessingStatusForTaskID:mediaType:mediaSubtypes:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100043574;
  v11[3] = &unk_10021A7C0;
  v11[4] = self;
  void v11[5] = a3;
  v11[6] = a4;
  v11[7] = a5;
  return [(VCPDatabaseWriter *)self executeDatabaseBlock:v11 fallbackBlock:0 write:1];
}

- (int)updateProcessingStatus:(unint64_t)a3 andNextAttemptDate:(id)a4 andErrorCode:(unint64_t)a5 andErrorLine:(unint64_t)a6 forLocalIdentifier:(id)a7 andTaskID:(unint64_t)a8
{
  id v14 = a4;
  id v15 = a7;
  if (MediaAnalysisEnableDatabaseLog())
  {
    __int16 v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v30 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v31 = 1024;
      int v32 = 2855;
      __int16 v33 = 2080;
      int64_t v34 = "-[VCPDatabaseWriter(ProcessingStatus) updateProcessingStatus:andNextAttemptDate:andErrorCode:andErrorLine:fo"
            "rLocalIdentifier:andTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000438EC;
  v22[3] = &unk_10021AB60;
  v22[4] = self;
  unint64_t v25 = a3;
  id v17 = v14;
  id v23 = v17;
  unint64_t v26 = a5;
  unint64_t v27 = a6;
  unint64_t v28 = a8;
  id v18 = v15;
  id v24 = v18;
  id v19 = objc_retainBlock(v22);
  int v20 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v19 fallbackBlock:v19 write:1];

  return v20;
}

- (int)updateProcessingStatus:(unint64_t)a3 andNextAttemptDate:(id)a4 forLocalIdentifier:(id)a5 andTaskID:(unint64_t)a6
{
  return [(VCPDatabaseWriter *)self updateProcessingStatus:a3 andNextAttemptDate:a4 andErrorCode:98 andErrorLine:0 forLocalIdentifier:a5 andTaskID:a6];
}

- (int)hardFailAllRunningProcessingStatusForTaskID:(unint64_t)a3 additionalPredicates:(id)a4
{
  id v6 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    unint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v17 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v18 = 1024;
      int v19 = 2892;
      __int16 v20 = 2080;
      id v21 = "-[VCPDatabaseWriter(ProcessingStatus) hardFailAllRunningProcessingStatusForTaskID:additionalPredicates:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100043CB4;
  v12[3] = &unk_10021A8B0;
  id v8 = v6;
  id v13 = v8;
  id v14 = self;
  unint64_t v15 = a3;
  int v9 = objc_retainBlock(v12);
  int v10 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v9 fallbackBlock:v9 write:1];

  return v10;
}

- (int)hardFailAllRunningProcessingStatusForTaskID:(unint64_t)a3
{
  return [(VCPDatabaseWriter *)self hardFailAllRunningProcessingStatusForTaskID:a3 additionalPredicates:0];
}

- (int)_removeSchedulingHistoryForStartTimeBefore:(id)a3
{
  id v4 = a3;
  ppStmt = 0;
  int v5 = sqlite3_prepare_v2(self->_database, "DELETE FROM BackgroundActivitySchedulingHistory WHERE startTime<(?);",
         -1,
         &ppStmt,
         0);
  if (v5) {
    goto LABEL_6;
  }
  id v6 = ppStmt;
  id v7 = v4;
  id v8 = v7;
  if (v7)
  {
    [v7 timeIntervalSinceReferenceDate];
    int v10 = sqlite3_bind_double(v6, 1, v9);
  }
  else
  {
    int v10 = sqlite3_bind_null(v6, 1);
  }
  int v5 = v10;

  if (v5) {
    goto LABEL_6;
  }
  unint64_t v15 = sqlite3_expanded_sql(ppStmt);
  if (v15)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      __int16 v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v21 = 1024;
        int v22 = 2938;
        __int16 v23 = 2080;
        id v24 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    sqlite3_free(v15);
  }
  int v17 = sqlite3_step(ppStmt);
  int v5 = v17;
  int v13 = 0;
  if (v17)
  {
    if (v17 != 101)
    {
LABEL_6:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v11 = VCPLogInstance();
        os_log_type_t v12 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v11, v12))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v20 = (const char *)v4;
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "Failed to remove background activity scheduling history with start time before %@", buf, 0xCu);
        }
      }
      int v13 = v5;
    }
  }
  sqlite3_finalize(ppStmt);

  return v13;
}

- (int)_storeSchedulingHistoryForActivityID:(unint64_t)a3 andStartTime:(id)a4
{
  id v6 = a4;
  ppStmt = 0;
  int v7 = sqlite3_prepare_v2(self->_database, "REPLACE INTO BackgroundActivitySchedulingHistory (activityID, startTime, duration, exitStatus) VALUES ((?), (?), (?), (?));",
         -1,
         &ppStmt,
         0);
  if (v7) {
    goto LABEL_9;
  }
  int v7 = sqlite3_bind_int64(ppStmt, 1, a3);
  if (v7) {
    goto LABEL_9;
  }
  id v8 = ppStmt;
  id v9 = v6;
  int v10 = v9;
  if (v9)
  {
    [v9 timeIntervalSinceReferenceDate];
    int v12 = sqlite3_bind_double(v8, 2, v11);
  }
  else
  {
    int v12 = sqlite3_bind_null(v8, 2);
  }
  int v7 = v12;

  if (v7) {
    goto LABEL_9;
  }
  int v7 = sqlite3_bind_double(ppStmt, 3, -1.0);
  if (v7) {
    goto LABEL_9;
  }
  int v7 = sqlite3_bind_int64(ppStmt, 4, 0);
  if (v7) {
    goto LABEL_9;
  }
  __int16 v18 = sqlite3_expanded_sql(ppStmt);
  if (v18)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      int v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v24 = 1024;
        LODWORD(v25[0]) = 2958;
        WORD2(v25[0]) = 2080;
        *(void *)((char *)v25 + 6) = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    sqlite3_free(v18);
  }
  int v20 = sqlite3_step(ppStmt);
  int v7 = v20;
  int v16 = 0;
  if (v20)
  {
    if (v20 != 101)
    {
LABEL_9:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v13 = VCPLogInstance();
        os_log_type_t v14 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v13, v14))
        {
          VCPTaskIDDescription(a3);
          unint64_t v15 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          __int16 v23 = v15;
          __int16 v24 = 2112;
          v25[0] = v6;
          _os_log_impl((void *)&_mh_execute_header, v13, v14, "Failed to store history for background activity %@ and start time %@", buf, 0x16u);
        }
      }
      int v16 = v7;
    }
  }
  sqlite3_finalize(ppStmt);

  return v16;
}

- (int)storeSchedulingHistoryForActivityID:(unint64_t)a3 andStartTime:(id)a4
{
  id v6 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v19 = 1024;
      int v20 = 2969;
      __int16 v21 = 2080;
      int v22 = "-[VCPDatabaseWriter(BackgroundActivitySchedulingHistory) storeSchedulingHistoryForActivityID:andStartTime:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000445E4;
  v14[3] = &unk_10021A8B0;
  void v14[4] = self;
  unint64_t v16 = a3;
  id v15 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100044668;
  v11[3] = &unk_10021A8B0;
  v11[4] = self;
  unint64_t v13 = a3;
  id v8 = v15;
  id v12 = v8;
  int v9 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v14 fallbackBlock:v11 write:1];

  return v9;
}

- (int)updateSchedulingHistoryForActivityID:(unint64_t)a3 startTime:(id)a4 duration:(double)a5 exitStatus:(int)a6 sessionLog:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  if (MediaAnalysisEnableDatabaseLog())
  {
    os_log_type_t v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v32 = 1024;
      int v33 = 2992;
      __int16 v34 = 2080;
      unint64_t v35 = "-[VCPDatabaseWriter(BackgroundActivitySchedulingHistory) updateSchedulingHistoryForActivityID:startTime:dura"
            "tion:exitStatus:sessionLog:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  int v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  int v22 = sub_100044874;
  __int16 v23 = &unk_10021ABD8;
  __int16 v24 = self;
  unint64_t v27 = a3;
  id v15 = v12;
  id v25 = v15;
  double v28 = a5;
  int v29 = a6;
  id v16 = v13;
  id v26 = v16;
  int v17 = objc_retainBlock(&v20);
  int v18 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:](self, "executeDatabaseBlock:fallbackBlock:write:", v17, v17, 1, v20, v21, v22, v23, v24);

  return v18;
}

- (int)querySchedulingHistoryRecords:(id *)a3 forActivityID:(unint64_t)a4 sinceDate:(id)a5
{
  id v8 = a5;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3022;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(BackgroundActivitySchedulingHistory) querySchedulingHistoryRecords:forAc"
                            "tivityID:sinceDate:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_100034C88;
  int v18 = sub_100034C98;
  id v19 = +[NSMutableArray array];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100044D6C;
  v13[3] = &unk_10021AA70;
  v13[4] = self;
  unint64_t v16 = a4;
  id v10 = v8;
  id v14 = v10;
  id v15 = buf;
  int v11 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v13 fallbackBlock:0 write:0];
  *a3 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v11;
}

- (int)purgeExcessiveSchedulingRecordsForActivityID:(unint64_t)a3
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v9 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v10 = 1024;
      int v11 = 3063;
      __int16 v12 = 2080;
      id v13 = "-[VCPDatabaseWriter(BackgroundActivitySchedulingHistory) purgeExcessiveSchedulingRecordsForActivityID:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100045264;
  v7[3] = &unk_10021A810;
  v7[4] = self;
  v7[5] = a3;
  return [(VCPDatabaseWriter *)self executeDatabaseBlock:v7 fallbackBlock:0 write:1];
}

- (int)_storeProgressForActivityID:(unint64_t)a3 withAnalysisSubtype:(unint64_t)a4 version:(unint64_t)a5 processedAssetCount:(unint64_t)a6 totalAssetCount:(unint64_t)a7
{
  ppStmt = 0;
  id v13 = +[NSDate now];
  int v14 = sqlite3_prepare_v2(self->_database, "REPLACE INTO BackgroundAnalysisProgressHistory (activityID, analysisSubtype, storeDate, version, processedAssetCount, totalAssetCount) VALUES ((?), (?), (?), (?), (?), (?));",
          -1,
          &ppStmt,
          0);
  if (v14) {
    goto LABEL_11;
  }
  int v14 = sqlite3_bind_int64(ppStmt, 1, a3);
  if (v14) {
    goto LABEL_11;
  }
  int v14 = sqlite3_bind_int64(ppStmt, 2, a4);
  if (v14) {
    goto LABEL_11;
  }
  id v15 = ppStmt;
  id v16 = v13;
  int v17 = v16;
  if (v16)
  {
    [v16 timeIntervalSinceReferenceDate];
    int v19 = sqlite3_bind_double(v15, 3, v18);
  }
  else
  {
    int v19 = sqlite3_bind_null(v15, 3);
  }
  int v14 = v19;

  if (v14) {
    goto LABEL_11;
  }
  int v14 = sqlite3_bind_int64(ppStmt, 4, a5);
  if (v14) {
    goto LABEL_11;
  }
  int v14 = sqlite3_bind_int64(ppStmt, 5, a6);
  if (v14) {
    goto LABEL_11;
  }
  int v14 = sqlite3_bind_int64(ppStmt, 6, a7);
  if (v14) {
    goto LABEL_11;
  }
  __int16 v24 = sqlite3_expanded_sql(ppStmt);
  if (v24)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      id v25 = VCPLogInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)int v29 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        *(_WORD *)&v29[8] = 1024;
        *(_DWORD *)id v30 = 3117;
        *(_WORD *)&v30[4] = 2080;
        __int16 v31 = v24;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    sqlite3_free(v24);
  }
  int v26 = sqlite3_step(ppStmt);
  int v14 = v26;
  int v22 = 0;
  if (v26)
  {
    if (v26 != 101)
    {
LABEL_11:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v20 = VCPLogInstance();
        os_log_type_t v21 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v20, v21))
        {
          *(_DWORD *)buf = 67110658;
          *(_DWORD *)int v29 = v14;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a3;
          *(_WORD *)id v30 = 1024;
          *(_DWORD *)&v30[2] = a4;
          LOWORD(v31) = 1024;
          *(_DWORD *)((char *)&v31 + 2) = a5;
          HIWORD(v31) = 1024;
          int v32 = a6;
          __int16 v33 = 1024;
          int v34 = a7;
          __int16 v35 = 2112;
          unint64_t v36 = v13;
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "Error: %d -- Failed to store progress for activity %d subtype %d version %d processed asset count %d total asset count %d on datetime %@. ", buf, 0x30u);
        }
      }
      int v22 = v14;
    }
  }
  sqlite3_finalize(ppStmt);

  return v22;
}

- (int)_removeProgressRecordsBeforeDate:(id)a3
{
  id v4 = a3;
  ppStmt = 0;
  int v5 = sqlite3_prepare_v2(self->_database, "DELETE FROM BackgroundAnalysisProgressHistory WHERE storeDate<(?);",
         -1,
         &ppStmt,
         0);
  if (v5) {
    goto LABEL_6;
  }
  id v6 = ppStmt;
  id v7 = v4;
  id v8 = v7;
  if (v7)
  {
    [v7 timeIntervalSinceReferenceDate];
    int v10 = sqlite3_bind_double(v6, 1, v9);
  }
  else
  {
    int v10 = sqlite3_bind_null(v6, 1);
  }
  int v5 = v10;

  if (v5) {
    goto LABEL_6;
  }
  id v15 = sqlite3_expanded_sql(ppStmt);
  if (v15)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      id v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        int v20 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v21 = 1024;
        int v22 = 3133;
        __int16 v23 = 2080;
        __int16 v24 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    sqlite3_free(v15);
  }
  int v17 = sqlite3_step(ppStmt);
  int v5 = v17;
  int v13 = 0;
  if (v17)
  {
    if (v17 != 101)
    {
LABEL_6:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v11 = VCPLogInstance();
        os_log_type_t v12 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v11, v12))
        {
          *(_DWORD *)buf = 138412290;
          int v20 = (const char *)v4;
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "Failed to remove background analysis progress history with storage date before %@", buf, 0xCu);
        }
      }
      int v13 = v5;
    }
  }
  sqlite3_finalize(ppStmt);

  return v13;
}

- (int)_removeProgressRecordsBeyondMaximum:(unint64_t)a3
{
  ppStmt = 0;
  int v4 = sqlite3_prepare_v2(self->_database, "DELETE FROM BackgroundAnalysisProgressHistory WHERE id NOT IN(    SELECT id FROM BackgroundAnalysisProgressHistory      ORDER BY storeDate DESC LIMIT (?));",
         -1,
         &ppStmt,
         0);
  if (v4) {
    goto LABEL_3;
  }
  int v4 = sqlite3_bind_int64(ppStmt, 1, a3);
  if (v4) {
    goto LABEL_3;
  }
  double v9 = sqlite3_expanded_sql(ppStmt);
  if (v9)
  {
    int v10 = v9;
    if (MediaAnalysisEnableDatabaseLog())
    {
      int v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        id v15 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v16 = 1024;
        int v17 = 3152;
        __int16 v18 = 2080;
        int v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    sqlite3_free(v10);
  }
  int v12 = sqlite3_step(ppStmt);
  int v7 = 0;
  if (v12)
  {
    int v4 = v12;
    if (v12 != 101)
    {
LABEL_3:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v5 = VCPLogInstance();
        os_log_type_t v6 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v5, v6))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v15) = a3;
          _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to remove background analysis progress history past max count %d", buf, 8u);
        }
      }
      int v7 = v4;
    }
  }
  sqlite3_finalize(ppStmt);
  return v7;
}

- (int)storeProgressForActivityID:(unint64_t)a3 withAnalysisSubtype:(unint64_t)a4 version:(unint64_t)a5 processedAssetCount:(unint64_t)a6 totalAssetCount:(unint64_t)a7
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v19 = 1024;
      int v20 = 3166;
      __int16 v21 = 2080;
      int v22 = "-[VCPDatabaseWriter(BackgroundAnalysisProgressHistory) storeProgressForActivityID:withAnalysisSubtype:versio"
            "n:processedAssetCount:totalAssetCount:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100045D54;
  v16[3] = &unk_10021AC00;
  void v16[4] = self;
  void v16[5] = a3;
  v16[6] = a4;
  v16[7] = a5;
  void v16[8] = a6;
  v16[9] = a7;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100045D68;
  v15[3] = &unk_10021AC00;
  void v15[4] = self;
  v15[5] = a3;
  v15[6] = a4;
  v15[7] = a5;
  v15[8] = a6;
  v15[9] = a7;
  return [(VCPDatabaseWriter *)self executeDatabaseBlock:v16 fallbackBlock:v15 write:1];
}

- (int)removeProgressEntriesBeyondLimits
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v7 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v8 = 1024;
      int v9 = 3188;
      __int16 v10 = 2080;
      int v11 = "-[VCPDatabaseWriter(BackgroundAnalysisProgressHistory) removeProgressEntriesBeyondLimits]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100045EB8;
  v5[3] = &unk_10021A770;
  v5[4] = self;
  return [(VCPDatabaseWriter *)self executeDatabaseBlock:v5 fallbackBlock:0 write:1];
}

- (int)setPrioritizedLocalIdentifier:(id)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5
{
  id v8 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v24 = 1024;
      int v25 = 3214;
      __int16 v26 = 2080;
      unint64_t v27 = "-[VCPDatabaseWriter(PrioritizedAssets) setPrioritizedLocalIdentifier:mediaType:mediaSubtypes:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  int v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  __int16 v16 = sub_1000460F4;
  int v17 = &unk_10021A988;
  __int16 v18 = self;
  id v10 = v8;
  id v19 = v10;
  int64_t v20 = a4;
  unint64_t v21 = a5;
  int v11 = objc_retainBlock(&v14);
  int v12 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:](self, "executeDatabaseBlock:fallbackBlock:write:", v11, v11, 1, v14, v15, v16, v17, v18);

  return v12;
}

- (int)removePrioritizedLocalIdentifier:(id)a3
{
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v18 = 1024;
      int v19 = 3236;
      __int16 v20 = 2080;
      unint64_t v21 = "-[VCPDatabaseWriter(PrioritizedAssets) removePrioritizedLocalIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  int v12 = sub_10004646C;
  int v13 = &unk_10021A888;
  int v14 = self;
  id v6 = v4;
  id v15 = v6;
  int v7 = objc_retainBlock(&v10);
  int v8 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:](self, "executeDatabaseBlock:fallbackBlock:write:", v7, v7, 1, v10, v11, v12, v13, v14);

  return v8;
}

- (id)queryPrioritizedLocalIdentifiersWithMediaType:(int64_t)a3 mediaSubtypes:(unint64_t)a4 shouldNegateSubtypes:(BOOL)a5 limit:(unint64_t)a6
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    uint64_t v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3258;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(PrioritizedAssets) queryPrioritizedLocalIdentifiersWithMediaType:mediaSu"
                            "btypes:shouldNegateSubtypes:limit:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_100034C88;
  int v17 = sub_100034C98;
  id v18 = +[NSMutableArray array];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004681C;
  v14[3] = &unk_10021AC28;
  BOOL v15 = a5;
  v14[6] = a3;
  v14[7] = a4;
  v14[8] = a6;
  void v14[4] = self;
  void v14[5] = buf;
  [(VCPDatabaseWriter *)self executeDatabaseBlock:v14 fallbackBlock:0 write:0];
  id v12 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v12;
}

- (BOOL)isPrioritizedLocalIdentifier:(id)a3
{
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3290;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(PrioritizedAssets) isPrioritizedLocalIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(_DWORD *)&buf[24] = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100046C84;
  v9[3] = &unk_10021A8F8;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = buf;
  [(VCPDatabaseWriter *)self executeDatabaseBlock:v9 fallbackBlock:0 write:0];
  BOOL v7 = *(_DWORD *)(*(void *)&buf[8] + 24) == 1;

  _Block_object_dispose(buf, 8);
  return v7;
}

- (int)clearPrioritizedAssets
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v9 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v10 = 1024;
      int v11 = 3317;
      __int16 v12 = 2080;
      int v13 = "-[VCPDatabaseWriter(PrioritizedAssets) clearPrioritizedAssets]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100046FB4;
  v7[3] = &unk_10021A770;
  v7[4] = self;
  id v4 = objc_retainBlock(v7);
  int v5 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v4 fallbackBlock:v4 write:1];

  return v5;
}

- (int)parseHeader:(sqlite3_stmt *)a3 startColumn:(int)a4 analysis:(id)a5
{
  id v7 = a5;
  int v8 = +[NSNumber numberWithInt:sqlite3_column_int(a3, a4)];
  [v7 setObject:v8 forKeyedSubscript:@"version"];

  if (sqlite3_column_type(a3, a4 + 1) == 5)
  {
    int v9 = 0;
  }
  else
  {
    int v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:sqlite3_column_double(a3, a4 + 1)];
  }
  [v7 setObject:v9 forKeyedSubscript:@"dateModified"];

  if (sqlite3_column_type(a3, a4 + 2) == 5)
  {
    __int16 v10 = 0;
  }
  else
  {
    __int16 v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:sqlite3_column_double(a3, a4 + 2)];
  }
  [v7 setObject:v10 forKeyedSubscript:@"dateAnalyzed"];

  int v11 = +[NSNumber numberWithLongLong:sqlite3_column_int64(a3, a4 + 3)];
  [v7 setObject:v11 forKeyedSubscript:@"performedAnalysisTypes"];

  __int16 v12 = +[NSNumber numberWithInt:sqlite3_column_int(a3, a4 + 4)];
  [v7 setObject:v12 forKeyedSubscript:@"flags"];

  int v13 = +[NSNumber numberWithLongLong:sqlite3_column_int64(a3, a4 + 5)];
  [v7 setObject:v13 forKeyedSubscript:@"statsFlags"];

  if (sqlite3_column_double(a3, a4 + 6) != -1.0)
  {
    int v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v7 setObject:v14 forKeyedSubscript:@"quality"];
  }
  if (sqlite3_column_type(a3, a4 + 7) == 5)
  {
    BOOL v15 = 0;
  }
  else
  {
    BOOL v15 = +[NSString stringWithUTF8String:sqlite3_column_text(a3, a4 + 7)];
  }
  int v16 = a4 + 8;
  if (sqlite3_column_type(a3, v16) == 5)
  {
    int v17 = 0;
  }
  else
  {
    int v17 = +[NSString stringWithUTF8String:sqlite3_column_text(a3, v16)];
  }
  id v18 = +[VCPFingerprint fingerprintWithMaster:v15 adjusted:v17];
  objc_msgSend(v7, "vcp_setFingerprint:", v18);

  if ((int)objc_msgSend(v7, "vcp_version") < 3 && (objc_msgSend(v7, "vcp_types") & 4) != 0)
  {
    int v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(v7, "vcp_types") | 8);
    [v7 setObject:v19 forKeyedSubscript:@"performedAnalysisTypes"];
  }
  return 0;
}

- (int)queryHeadersForAssets:(id)a3 analyses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v19 = 1024;
      int v20 = 3368;
      __int16 v21 = 2080;
      int v22 = "-[VCPDatabaseWriter(DataCollection) queryHeadersForAssets:analyses:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  if ([v6 count])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100047708;
    v13[3] = &unk_10021A860;
    int v14 = v6;
    BOOL v15 = self;
    id v16 = v7;
    int v9 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v13 fallbackBlock:0 write:0];

    __int16 v10 = v14;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 4)
    {
      int v9 = 0;
      goto LABEL_12;
    }
    __int16 v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "No local identifiers provided; return empty analyses",
        buf,
        2u);
    }
    int v9 = 0;
  }

LABEL_12:
  return v9;
}

- (int)loadAllKeyValuePairs:(id)a3
{
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v12 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v13 = 1024;
      int v14 = 3415;
      __int16 v15 = 2080;
      id v16 = "-[VCPDatabaseWriter(DataCollection) loadAllKeyValuePairs:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100047C70;
  v9[3] = &unk_10021A888;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  int v7 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v9 fallbackBlock:0 write:0];

  return v7;
}

- (BOOL)keyExistsInKeyValueStore:(id)a3
{
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3444;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(DataCollection) keyExistsInKeyValueStore:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  if (v4)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    buf[24] = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10004812C;
    v8[3] = &unk_10021A8F8;
    v8[4] = self;
    id v9 = v4;
    id v10 = buf;
    [(VCPDatabaseWriter *)self executeDatabaseBlock:v8 fallbackBlock:0 write:0];
    BOOL v6 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)valueForKey:(id)a3
{
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3474;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(DataCollection) valueForKey:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  if (v4)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    *(void *)&buf[24] = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100048544;
    v8[3] = &unk_10021AC50;
    v8[4] = self;
    id v10 = buf;
    id v9 = v4;
    [(VCPDatabaseWriter *)self executeDatabaseBlock:v8 fallbackBlock:0 write:0];
    int64_t v6 = *(void *)(*(void *)&buf[8] + 24);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (int)setValue:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v14 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v15 = 1024;
      int v16 = 3486;
      __int16 v17 = 2080;
      id v18 = "-[VCPDatabaseWriter(DataCollection) setValue:forKey:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000486FC;
    v10[3] = &unk_10021A8B0;
    v10[4] = self;
    int64_t v12 = a3;
    id v11 = v6;
    int v8 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v10 fallbackBlock:0 write:1];
  }
  else
  {
    int v8 = -50;
  }

  return v8;
}

- (int)removeKey:(id)a3
{
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v11 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v12 = 1024;
      int v13 = 3494;
      __int16 v14 = 2080;
      __int16 v15 = "-[VCPDatabaseWriter(DataCollection) removeKey:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000488A4;
    v8[3] = &unk_10021A888;
    v8[4] = self;
    id v9 = v4;
    int v6 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v8 fallbackBlock:0 write:1];
  }
  else
  {
    int v6 = -50;
  }

  return v6;
}

- (int)storeStatsFlags:(unint64_t)a3 forLocalIdentifier:(id)a4
{
  id v6 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v15 = 1024;
      int v16 = 3502;
      __int16 v17 = 2080;
      id v18 = "-[VCPDatabaseWriter(DataCollection) storeStatsFlags:forLocalIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100048A50;
    v10[3] = &unk_10021A8B0;
    v10[4] = self;
    unint64_t v12 = a3;
    id v11 = v6;
    int v8 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v10 fallbackBlock:0 write:1];
  }
  else
  {
    int v8 = -50;
  }

  return v8;
}

- (unint64_t)getAssetCountMatchingAllFlags:(unint64_t)a3
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3521;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(DataCollection) getAssetCountMatchingAllFlags:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(void *)&buf[24] = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100048D98;
  v8[3] = &unk_10021AA20;
  void v8[5] = buf;
  v8[6] = a3;
  v8[4] = self;
  [(VCPDatabaseWriter *)self executeDatabaseBlock:v8 fallbackBlock:0 write:0];
  unint64_t v6 = *(void *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v6;
}

- (unint64_t)getAssetCountMatchingAllFlags:(unint64_t)a3 andAnyFlags:(unint64_t)a4
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3543;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(DataCollection) getAssetCountMatchingAllFlags:andAnyFlags:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(void *)&buf[24] = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000490BC;
  v10[3] = &unk_10021A798;
  void v10[6] = a3;
  v10[7] = a4;
  v10[4] = self;
  void v10[5] = buf;
  [(VCPDatabaseWriter *)self executeDatabaseBlock:v10 fallbackBlock:0 write:0];
  unint64_t v8 = *(void *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v8;
}

- (unint64_t)getAssetCountMatchingStatsFlags:(unint64_t)a3 andAnalysisTypes:(unint64_t)a4
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3566;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(DataCollection) getAssetCountMatchingStatsFlags:andAnalysisTypes:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(void *)&buf[24] = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000493F8;
  v10[3] = &unk_10021A798;
  void v10[6] = a3;
  v10[7] = a4;
  v10[4] = self;
  void v10[5] = buf;
  [(VCPDatabaseWriter *)self executeDatabaseBlock:v10 fallbackBlock:0 write:0];
  unint64_t v8 = *(void *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v8;
}

- (int)cacheCurrentFaceProgress
{
  id v17 = 0;
  int v3 = +[VCPAnalysisProgressQuery queryProgressDetail:&v17 photoLibrary:self->_photoLibrary taskID:3 cancelOrExtendTimeoutBlock:&stru_10021AC70];
  id v4 = v17;
  int v5 = v4;
  if (!v3)
  {
    unint64_t v6 = [v4 objectForKeyedSubscript:@"total-allowed"];
    int v3 = -[VCPDatabaseWriter setValue:forKey:](self, "setValue:forKey:", [v6 longLongValue], @"NumberOfAssetsAllowedForPhotosFaceProcessing");

    if (!v3)
    {
      int v7 = [v5 objectForKeyedSubscript:@"processed"];
      int v3 = -[VCPDatabaseWriter setValue:forKey:](self, "setValue:forKey:", [v7 longLongValue], @"NumberOfAssetsAnalyzedForPhotosFaceProcessing");

      if (!v3)
      {
        unint64_t v8 = [v5 objectForKeyedSubscript:@"prioritized-processed"];
        int v3 = -[VCPDatabaseWriter setValue:forKey:](self, "setValue:forKey:", [v8 longLongValue], @"NumberOfPrioritizedAssetsAnalyzedForPhotosFaceProcessing");

        if (!v3)
        {
          id v9 = [v5 objectForKeyedSubscript:@"prioritized-total-allowed"];
          int v3 = -[VCPDatabaseWriter setValue:forKey:](self, "setValue:forKey:", [v9 longLongValue], @"NumberOfPrioritizedAssetsAllowedForPhotosFaceProcessing");

          if (!v3)
          {
            int v3 = [(VCPDatabaseWriter *)self commit];
            if (!v3)
            {
              if ((int)MediaAnalysisLogLevel() >= 5)
              {
                id v10 = VCPLogInstance();
                os_log_type_t v11 = VCPLogToOSLogType[5];
                if (os_log_type_enabled(v10, v11))
                {
                  unint64_t v12 = [v5 objectForKeyedSubscript:@"processed"];
                  int v13 = [v5 objectForKeyedSubscript:@"total-allowed"];
                  __int16 v14 = [v5 objectForKeyedSubscript:@"prioritized-processed"];
                  __int16 v15 = [v5 objectForKeyedSubscript:@"prioritized-total-allowed"];
                  *(_DWORD *)buf = 138413058;
                  __int16 v19 = v12;
                  __int16 v20 = 2112;
                  __int16 v21 = v13;
                  __int16 v22 = 2112;
                  __int16 v23 = v14;
                  __int16 v24 = 2112;
                  int v25 = v15;
                  _os_log_impl((void *)&_mh_execute_header, v10, v11, "Cached face progress: %@ out of %@, and prioritized %@ out of %@", buf, 0x2Au);
                }
              }
              int v3 = 0;
            }
          }
        }
      }
    }
  }

  return v3;
}

- (int)cacheProcessedAssetCountAfterPromoter:(unint64_t)a3
{
  int v5 = [(VCPDatabaseWriter *)self setValue:a3 forKey:@"NumberOfProcessedAssetsAfterPromoterForPhotosFaceProcessing"];
  if (!v5)
  {
    unint64_t v6 = +[NSDate now];
    [v6 timeIntervalSinceReferenceDate];
    int v5 = [(VCPDatabaseWriter *)self setValue:(uint64_t)v7 forKey:@"VCPKeyValueLastPromoterTimestamp"];
    if (!v5)
    {
      int v5 = [(VCPDatabaseWriter *)self commit];
      if (!v5)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          unint64_t v8 = VCPLogInstance();
          os_log_type_t v9 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v8, v9))
          {
            int v11 = 134218242;
            unint64_t v12 = a3;
            __int16 v13 = 2112;
            __int16 v14 = v6;
            _os_log_impl((void *)&_mh_execute_header, v8, v9, "Cache processed asset count after promoter: %lu (promoter date: %@)", (uint8_t *)&v11, 0x16u);
          }
        }
        int v5 = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)countOfAssetsWithMediaAnalysisResultsType:(unint64_t)a3
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3626;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(DataCollection) countOfAssetsWithMediaAnalysisResultsType:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(void *)&buf[24] = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100049CCC;
  v11[3] = &unk_10021AA20;
  void v11[5] = buf;
  v11[6] = a3;
  v11[4] = self;
  unsigned int v6 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v11 fallbackBlock:0 write:0];
  if (v6)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      double v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)unint64_t v12 = 67109120;
        unsigned int v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Failed to query countOfAssetsWithMediaAnalysisResultsType - %d", v12, 8u);
      }
    }
    unint64_t v9 = 0;
  }
  else
  {
    unint64_t v9 = *(void *)(*(void *)&buf[8] + 24);
  }
  _Block_object_dispose(buf, 8);
  return v9;
}

+ (id)databaseWithFilepath:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithFilepath:v3];

  return v4;
}

- (int)restoreAnalysis:(id)a3 forLocalIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    os_log_type_t v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v17 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v18 = 1024;
      int v19 = 3665;
      __int16 v20 = 2080;
      __int16 v21 = "-[VCPDatabaseWriter(BackupRestore) restoreAnalysis:forLocalIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004A074;
  v13[3] = &unk_10021A860;
  void v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  int v11 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v13 fallbackBlock:&stru_10021AC90 write:1];

  return v11;
}

- (int)flushWAL
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3674;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(BackupRestore) flushWAL]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  int v4 = [(VCPDatabaseWriter *)self commit];
  if (!v4)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    *(_DWORD *)&buf[24] = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004A220;
    v6[3] = &unk_10021ACB8;
    v6[4] = self;
    v6[5] = buf;
    [(VCPDatabaseWriter *)self executeDatabaseBlock:v6 fallbackBlock:0 write:0];
    int v4 = *(_DWORD *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
  }
  return v4;
}

- (unint64_t)analysisRecordsModifiedSinceDate:(id)a3
{
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3687;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(BackupRestore) analysisRecordsModifiedSinceDate:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(void *)&buf[24] = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004A42C;
  v9[3] = &unk_10021A8F8;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  int v11 = buf;
  [(VCPDatabaseWriter *)self executeDatabaseBlock:v9 fallbackBlock:0 write:0];
  unint64_t v7 = *(void *)(*(void *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v7;
}

- (int)fetchMomentsScheduledAssetEntries:(id *)a3 forTaskID:(unint64_t)a4
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    unint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v11 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v12 = 1024;
      int v13 = 3718;
      __int16 v14 = 2080;
      id v15 = "-[VCPDatabaseWriter(MomentsScheduledAssets) fetchMomentsScheduledAssetEntries:forTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004A798;
  v9[3] = &unk_10021A7E8;
  v9[4] = self;
  void v9[5] = a4;
  void v9[6] = a3;
  return [(VCPDatabaseWriter *)self executeDatabaseBlock:v9 fallbackBlock:0 write:0];
}

- (int)fetchAllMomentsScheduledAssets:(id *)a3
{
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v9 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v10 = 1024;
      int v11 = 3753;
      __int16 v12 = 2080;
      int v13 = "-[VCPDatabaseWriter(MomentsScheduledAssets) fetchAllMomentsScheduledAssets:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004AC48;
  v7[3] = &unk_10021A810;
  v7[4] = self;
  void v7[5] = a3;
  return [(VCPDatabaseWriter *)self executeDatabaseBlock:v7 fallbackBlock:0 write:0];
}

- (int)setMomentsScheduledAssetWithLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4
{
  id v6 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    unint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v16 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v17 = 1024;
      int v18 = 3792;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCPDatabaseWriter(MomentsScheduledAssets) setMomentsScheduledAssetWithLocalIdentifier:andTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004B158;
  v12[3] = &unk_10021A8B0;
  uint8_t v12[4] = self;
  unint64_t v14 = a4;
  id v8 = v6;
  id v13 = v8;
  id v9 = objc_retainBlock(v12);
  int v10 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v9 fallbackBlock:v9 write:1];

  return v10;
}

- (int)removeMomentsScheduledAssetWithLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4
{
  id v6 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    unint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v16 = 1024;
      int v17 = 3813;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCPDatabaseWriter(MomentsScheduledAssets) removeMomentsScheduledAssetWithLocalIdentifier:andTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004B508;
  v11[3] = &unk_10021A8B0;
  v11[4] = self;
  unint64_t v13 = a4;
  id v8 = v6;
  id v12 = v8;
  int v9 = [(VCPDatabaseWriter *)self executeDatabaseBlock:v11 fallbackBlock:0 write:1];

  return v9;
}

@end