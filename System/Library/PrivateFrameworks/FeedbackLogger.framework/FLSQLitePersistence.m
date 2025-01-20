@interface FLSQLitePersistence
+ (id)batchStatusDescription:(int)a3;
+ (id)uploadStatusDescription:(int)a3;
- (BOOL)__deleteStatementHelper:(const char *)a3 forUploadId:(id)a4;
- (BOOL)__purgeStatementHelper:(const char *)a3 forBatchId:(id)a4;
- (BOOL)_updateMetadataHelperForBatch:(id)a3 query:(const char *)a4;
- (BOOL)_updateMetadataHelperForUpload:(id)a3 query:(const char *)a4;
- (BOOL)_updateStatusHelperForBatch:(id)a3 toStatus:(int)a4;
- (BOOL)_updateStatusHelperForUpload:(id)a3 toStatus:(int)a4;
- (BOOL)closeOpenBatch;
- (BOOL)closeOrphanedBatches;
- (BOOL)configured;
- (BOOL)createDatabase;
- (BOOL)deleteAllUploads;
- (BOOL)deleteAllUploadsQueuedBefore:(id)a3;
- (BOOL)deleteDatabase;
- (BOOL)deleteUploadWithIdentifier:(id)a3;
- (BOOL)executeInTransactionMultipleSQLStatements:(id)a3;
- (BOOL)executeSQLStatement:(const char *)a3;
- (BOOL)executeSQLStatement:(const char *)a3 usingTransaction:(BOOL)a4;
- (BOOL)forceCloseOpenBatches;
- (BOOL)getIntValueForPragma:(id)a3 into:(int *)a4;
- (BOOL)initializeConnectionForUseBy:(int)a3;
- (BOOL)initializeNewBatch;
- (BOOL)isSchemaReady;
- (BOOL)iteratePayloadForBatch:(id)a3 codeblock:(id)a4;
- (BOOL)iterateUploadsWithCodeblock:(id)a3;
- (BOOL)markBatchesforPurge;
- (BOOL)markUploadsForPurge;
- (BOOL)open;
- (BOOL)prepareSchema;
- (BOOL)purgeAllBatches;
- (BOOL)purgeBatch:(id)a3;
- (BOOL)recoverOrphanedProcessingBatches;
- (BOOL)recoverOrphanedProcessingUploads;
- (BOOL)setDatabaseSizeLimit;
- (BOOL)shouldIgnoreQuota;
- (BOOL)tryPrepare:(const char *)a3 preparedStatement:(sqlite3_stmt *)a4;
- (BOOL)tryRolloverBatchIfNecessary:(unint64_t)a3 preferredBatchSize:(unint64_t)a4;
- (BOOL)updateSchema;
- (BOOL)updateStatusForBatch:(id)a3 toStatus:(int)a4;
- (BOOL)updateStatusForUpload:(id)a3 toStatus:(int)a4;
- (BOOL)vacuum;
- (FLLoggingContext)context;
- (FLSQLiteDatabaseConnection)dbConnection;
- (FLSQLitePersistence)initWithStoreId:(id)a3 dbConnection:(id)a4 loggingContext:(id)a5;
- (FLSQLitePersistence)initWithStoreId:(id)a3 loggingContext:(id)a4;
- (NSDate)currentBatchCreationDate;
- (NSString)currentBatchIdentifier;
- (NSString)databasePath;
- (NSString)storeIdentifier;
- (OS_os_log)log;
- (double)batchMaximumDuration;
- (id)_getBatchIdsHelper:(sqlite3_stmt *)a3;
- (id)_getUploadIdsHelper:(sqlite3_stmt *)a3;
- (id)getBatchIdsWithAllStatuses;
- (id)getBatchIdsWithStatus:(int)a3;
- (id)getPurgableBatchIds;
- (id)getPurgableUploadIds;
- (id)getRecordsRangeStart:(int64_t)a3 end:(int64_t)a4;
- (id)getUploadIdsWithAllStatuses;
- (id)getUploadIdsWithStatus:(int)a3;
- (id)getUploadRecordWithId:(id)a3;
- (id)getUploadsRangeStart:(int64_t)a3 end:(int64_t)a4;
- (id)metadataForBatch:(id)a3 bundleID:(id)a4;
- (id)persist:(id)a3;
- (id)persist:(id)a3 preferredBatchSize:(unint64_t)a4;
- (id)persistUploadPayload:(id)a3;
- (id)registerInsertionObserver:(id)a3;
- (int)getDataVersion;
- (int)getSchemaVersion;
- (int)user;
- (int64_t)cleanupPurgableUploads;
- (int64_t)doBatchesHousekeeping;
- (int64_t)doUploadHousekeeping;
- (int64_t)maxRowId;
- (sqlite3)db;
- (sqlite3_stmt)insertRecordsStatement;
- (sqlite3_stmt)iteratePayloadStatement;
- (sqlite3_stmt)maxRowIdStatement;
- (unint64_t)currentBatchEventCount;
- (unint64_t)currentBatchPayloadSize;
- (unint64_t)getCurrentDatabaseSize;
- (unint64_t)maxAllowedDatabaseSizeInBytes;
- (unint64_t)maxBatchPayloadInBytes;
- (void)closeDatabase;
- (void)dealloc;
- (void)finalizeObserver;
- (void)observeInsertionAtRow:(int64_t)a3 observer:(id)a4;
- (void)setBatchMaximumDuration:(double)a3;
- (void)setConfigured:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setCurrentBatchCreationDate:(id)a3;
- (void)setCurrentBatchEventCount:(unint64_t)a3;
- (void)setCurrentBatchIdentifier:(id)a3;
- (void)setCurrentBatchPayloadSize:(unint64_t)a3;
- (void)setDb:(sqlite3 *)a3;
- (void)setDbConnection:(id)a3;
- (void)setInsertRecordsStatement:(sqlite3_stmt *)a3;
- (void)setIteratePayloadStatement:(sqlite3_stmt *)a3;
- (void)setLog:(id)a3;
- (void)setMaxAllowedDatabaseSizeInBytes:(unint64_t)a3;
- (void)setMaxBatchPayloadInBytes:(unint64_t)a3;
- (void)setMaxRowIdStatement:(sqlite3_stmt *)a3;
- (void)setUser:(int)a3;
@end

@implementation FLSQLitePersistence

- (BOOL)deleteAllUploads
{
  if ([(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    return [(FLSQLitePersistence *)self executeInTransactionMultipleSQLStatements:&unk_1F13BBA80];
  }
  else
  {
    v4 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1BA2B8000, v4, OS_LOG_TYPE_ERROR, "deleteAllUploads: initializeConnection failed", v5, 2u);
    }

    return 0;
  }
}

- (BOOL)__deleteStatementHelper:(const char *)a3 forUploadId:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)MEMORY[0x1BA9E8750]();
  pStmt = 0;
  if (![(FLSQLitePersistence *)self tryPrepare:a3 preparedStatement:&pStmt])
  {
    v14 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = a3;
      v15 = "Can't deleteUpload (%s), statement prep failed";
      v16 = v14;
      uint32_t v17 = 12;
      goto LABEL_9;
    }
LABEL_6:

    BOOL v12 = 0;
    goto LABEL_7;
  }
  sqlite3_reset(pStmt);
  v8 = pStmt;
  id v9 = v6;
  v10 = (const char *)[v9 UTF8String];
  int v11 = [v9 length];
  BOOL v12 = 1;
  sqlite3_bind_text(v8, 1, v10, v11, 0);
  int v13 = sqlite3_step(pStmt);
  sqlite3_finalize(pStmt);
  if (v13 != 101)
  {
    v14 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = a3;
      __int16 v22 = 1024;
      int v23 = v13;
      v15 = "deleteUpload (%s) failed: %d";
      v16 = v14;
      uint32_t v17 = 18;
LABEL_9:
      _os_log_error_impl(&dword_1BA2B8000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v12;
}

- (BOOL)deleteUploadWithIdentifier:(id)a3
{
  id v4 = a3;
  if (![(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    id v6 = [(FLSQLitePersistence *)self log];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      BOOL v8 = 0;
      goto LABEL_10;
    }
    __int16 v14 = 0;
    id v9 = "Can't deleteUploadWithIdentifier, initializeConnection failed";
    v10 = (uint8_t *)&v14;
LABEL_12:
    _os_log_error_impl(&dword_1BA2B8000, v6, OS_LOG_TYPE_ERROR, v9, v10, 2u);
    goto LABEL_9;
  }
  BOOL v5 = -[FLSQLitePersistence __deleteStatementHelper:forUploadId:](self, "__deleteStatementHelper:forUploadId:", "DELETE FROM fileUploads WHERE uploadId=?;",
         v4);
  id v6 = [(FLSQLitePersistence *)self log];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (!v5)
  {
    if (!v7) {
      goto LABEL_9;
    }
    __int16 v12 = 0;
    id v9 = "Failed to deleteUploadWithIdentifier";
    v10 = (uint8_t *)&v12;
    goto LABEL_12;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BA2B8000, v6, OS_LOG_TYPE_ERROR, "Failed to deleteUploadWithIdentifier, rolling back transaction", buf, 2u);
  }
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)iterateUploadsWithCodeblock:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, UploadRecord *, unsigned char *))a3;
  if (![(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    uint32_t v17 = [(FLSQLitePersistence *)self log];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      goto LABEL_12;
    }
    LOWORD(pStmt[0]) = 0;
    v18 = "Can't iterateUploadsWithCodeblock, initializeConnection failed";
    v19 = (uint8_t *)pStmt;
LABEL_24:
    _os_log_error_impl(&dword_1BA2B8000, v17, OS_LOG_TYPE_ERROR, v18, v19, 2u);
    goto LABEL_11;
  }
  pStmt[0] = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT uploadId, payload, timestampRefId, status, processedAttempts, dateCreated, dateUploaded, dateLastProcessed FROM fileUploads WHERE status=0;",
          pStmt))
  {
    uint32_t v17 = [(FLSQLitePersistence *)self log];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v18 = "Failed to create SQLite iterate uploads statement";
    v19 = buf;
    goto LABEL_24;
  }
  BOOL v5 = (void *)MEMORY[0x1BA9E8750]();
  char v25 = 0;
  while (1)
  {
    int v6 = sqlite3_step(pStmt[0]);
    if (v6 != 100)
    {
      int v22 = v6;
      if (v6 == 101)
      {
LABEL_15:
        BOOL v20 = 1;
      }
      else
      {
        int v23 = [(FLSQLitePersistence *)self log];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v28 = v22;
          _os_log_error_impl(&dword_1BA2B8000, v23, OS_LOG_TYPE_ERROR, "SQLite iterate uploads, failed: %d", buf, 8u);
        }

        BOOL v20 = 0;
      }
      sqlite3_finalize(pStmt[0]);
      goto LABEL_13;
    }
    BOOL v7 = objc_alloc_init(UploadRecord);
    BOOL v8 = tryGetTextProperty(pStmt[0], 0);
    [(UploadRecord *)v7 setUploadIdentifier:v8];

    id v9 = [(FLSQLitePersistence *)self db];
    v10 = [(FLSQLitePersistence *)self log];
    int v11 = tryGetDataProperty(v9, v10, pStmt[0], 1);
    [(UploadRecord *)v7 setPayload:v11];

    __int16 v12 = tryGetTextProperty(pStmt[0], 2);
    [(UploadRecord *)v7 setTimestampReferenceIdentifier:v12];

    [(UploadRecord *)v7 setUploadStatus:sqlite3_column_int(pStmt[0], 3)];
    [(UploadRecord *)v7 setProcessedAttempts:sqlite3_column_int(pStmt[0], 4)];
    uint64_t v13 = tryGetDateProperty(pStmt[0], 5);
    if (!v13) {
      break;
    }
    __int16 v14 = (void *)v13;
    [(UploadRecord *)v7 setDateCreated:v13];
    v15 = tryGetDateProperty(pStmt[0], 6);
    [(UploadRecord *)v7 setDateUploaded:v15];

    v16 = tryGetDateProperty(pStmt[0], 7);
    [(UploadRecord *)v7 setDateLastProcessed:v16];

    v4[2](v4, v7, &v25);
    if (v25) {
      goto LABEL_15;
    }
  }
  uint64_t v24 = [(FLSQLitePersistence *)self log];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BA2B8000, v24, OS_LOG_TYPE_ERROR, "Upload record has no creation date.", buf, 2u);
  }

  sqlite3_finalize(pStmt[0]);
LABEL_12:
  BOOL v20 = 0;
LABEL_13:

  return v20;
}

- (id)getUploadRecordWithId:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    pStmt[0] = 0;
    if (-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT payload, timestampRefId, status, processedAttempts, dateCreated, dateUploaded, dateLastProcessed, length(payload) FROM fileUploads WHERE uploadId=?;",
           pStmt))
    {
      BOOL v5 = pStmt[0];
      id v6 = v4;
      sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], objc_msgSend(v6, "length"), 0);
      int v7 = sqlite3_step(pStmt[0]);
      if (v7 == 101)
      {
        id v9 = 0;
LABEL_18:
        sqlite3_finalize(pStmt[0]);
        id v9 = v9;
        BOOL v20 = v9;
        goto LABEL_19;
      }
      int v8 = v7;
      if (v7 != 100)
      {
        v15 = [(FLSQLitePersistence *)self log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v25 = v8;
          _os_log_error_impl(&dword_1BA2B8000, v15, OS_LOG_TYPE_ERROR, "SQLite iterate uploads, failed: %d", buf, 8u);
        }
        id v9 = 0;
        goto LABEL_17;
      }
      id v9 = objc_alloc_init(UploadRecord);
      [(UploadRecord *)v9 setUploadIdentifier:v6];
      v10 = [(FLSQLitePersistence *)self db];
      int v11 = [(FLSQLitePersistence *)self log];
      __int16 v12 = tryGetDataProperty(v10, v11, pStmt[0], 0);
      [(UploadRecord *)v9 setPayload:v12];

      uint64_t v13 = tryGetTextProperty(pStmt[0], 1);
      [(UploadRecord *)v9 setTimestampReferenceIdentifier:v13];

      [(UploadRecord *)v9 setUploadStatus:sqlite3_column_int(pStmt[0], 2)];
      [(UploadRecord *)v9 setProcessedAttempts:sqlite3_column_int(pStmt[0], 3)];
      uint64_t v14 = tryGetDateProperty(pStmt[0], 4);
      if (v14)
      {
        v15 = v14;
        [(UploadRecord *)v9 setDateCreated:v14];
        v16 = tryGetDateProperty(pStmt[0], 5);
        [(UploadRecord *)v9 setDateUploaded:v16];

        uint32_t v17 = tryGetDateProperty(pStmt[0], 6);
        [(UploadRecord *)v9 setDateLastProcessed:v17];

        [(UploadRecord *)v9 setSize:sqlite3_column_int(pStmt[0], 7)];
        v18 = [(FLSQLitePersistence *)self storeIdentifier];
        [(UploadRecord *)v9 setApplicationIdentifier:v18];

LABEL_17:
        goto LABEL_18;
      }
      int v22 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BA2B8000, v22, OS_LOG_TYPE_ERROR, "Upload record has no creation date.", buf, 2u);
      }

      sqlite3_finalize(pStmt[0]);
    }
    else
    {
      id v9 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BA2B8000, &v9->super, OS_LOG_TYPE_ERROR, "Failed to create SQLite iterate uploads statement", buf, 2u);
      }
    }
    BOOL v20 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v19 = [(FLSQLitePersistence *)self log];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    LOWORD(pStmt[0]) = 0;
    _os_log_error_impl(&dword_1BA2B8000, v19, OS_LOG_TYPE_ERROR, "Can't getUploadRecordWithId, initializeConnection failed", (uint8_t *)pStmt, 2u);
  }

  BOOL v20 = 0;
LABEL_20:

  return v20;
}

- (id)persistUploadPayload:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(FLSQLitePersistence *)self initializeConnectionForUseBy:0])
  {
    int v25 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BA2B8000, v25, OS_LOG_TYPE_ERROR, "Can't persistUploadPayload, initializeConnection failed", buf, 2u);
    }

    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = -4;
    goto LABEL_14;
  }
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "INSERT INTO fileUploads(uploadId, payload, timestampRefId, dateCreated) VALUES (?, ?, ?, ?);",
          &pStmt))
  {
    int v28 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BA2B8000, v28, OS_LOG_TYPE_ERROR, "Failed to create SQLite iterate uploads statement", buf, 2u);
    }

    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = -7;
LABEL_14:
    uint64_t v24 = [v26 errorWithDomain:@"FLErrorDomain" code:v27 userInfo:0];
    goto LABEL_23;
  }
  BOOL v5 = (void *)MEMORY[0x1BA9E8750]();
  id v6 = objc_opt_new();
  int v7 = [v6 UUIDString];

  int v8 = pStmt;
  id v9 = v7;
  sqlite3_bind_text(v8, 1, (const char *)[v9 UTF8String], objc_msgSend(v9, "length"), 0);
  v10 = pStmt;
  id v11 = v4;
  sqlite3_bind_blob(v10, 2, (const void *)[v11 bytes], objc_msgSend(v11, "length"), 0);
  __int16 v12 = pStmt;
  uint64_t v13 = [(FLSQLitePersistence *)self context];
  id v14 = [v13 timestampReferenceIdentifier];
  v15 = (const char *)[v14 UTF8String];
  v16 = [(FLSQLitePersistence *)self context];
  uint32_t v17 = [v16 timestampReferenceIdentifier];
  sqlite3_bind_text(v12, 3, v15, [v17 length], 0);

  v18 = pStmt;
  v19 = objc_opt_new();
  [v19 timeIntervalSince1970];
  sqlite3_bind_int64(v18, 4, (uint64_t)v20);

  int v21 = sqlite3_step(pStmt);
  if (v21 == 13)
  {
    uint64_t v29 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      unint64_t v35 = [(FLSQLitePersistence *)self getCurrentDatabaseSize];
      unint64_t v36 = [(FLSQLitePersistence *)self maxAllowedDatabaseSizeInBytes];
      *(_DWORD *)buf = 134218240;
      unint64_t v39 = v35;
      __int16 v40 = 2048;
      unint64_t v41 = v36;
      _os_log_error_impl(&dword_1BA2B8000, v29, OS_LOG_TYPE_ERROR, "Database quota exceeded, using %llu out of %llu bytes, failing persist request", buf, 0x16u);
    }

    v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = -2;
  }
  else
  {
    int v22 = v21;
    if (v21 == 101)
    {
      int v23 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BA2B8000, v23, OS_LOG_TYPE_DEBUG, "Successfully added file upload record", buf, 2u);
      }

      uint64_t v24 = 0;
      goto LABEL_22;
    }
    v32 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = v22;
      _os_log_error_impl(&dword_1BA2B8000, v32, OS_LOG_TYPE_ERROR, "Failed to insert upload record %d", buf, 8u);
    }

    v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = sqlite3_errcode([(FLSQLitePersistence *)self db]);
    v30 = v33;
  }
  uint64_t v24 = [v30 errorWithDomain:@"FLErrorDomain" code:v31 userInfo:0];
LABEL_22:

  sqlite3_finalize(pStmt);
LABEL_23:

  return v24;
}

- (int64_t)cleanupPurgableUploads
{
  {
    return sqlite3_changes([(FLSQLitePersistence *)self db]);
  }
  else
  {
    return -1;
  }
}

- (BOOL)markUploadsForPurge
{
  return [(FLSQLitePersistence *)self executeSQLStatement:"UPDATE fileUploads SET status=5 WHERE uploadId IN (SELECT uploadId FROM fileUploads WHERE (dateUploaded IS NOT NULL OR dateCreated < strftime('%s',datetime('now', '-7 day')) OR status IN (3, 4, 5))) AND status NOT IN (2, 3, 4);"];
}

- (int64_t)doUploadHousekeeping
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(FLSQLitePersistence *)self context];
  id v4 = [v3 userDefaults];
  int v5 = [v4 BOOLForKey:@"DisableFileHousekeeping"];

  if (!v5)
  {
    id v6 = [(FLSQLitePersistence *)self getPurgableUploadIds];
    if ([v6 count])
    {
      if ([(FLSQLitePersistence *)self markUploadsForPurge])
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        int v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v21;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = -[FLSQLitePersistence getUploadRecordWithId:](self, "getUploadRecordWithId:", *(void *)(*((void *)&v20 + 1) + 8 * v12), (void)v20);
              id v14 = [v13 outcomeTelemetryDictionary];
              v15 = [(FLSQLitePersistence *)self context];
              [v15 reportTelemetry:@"com.apple.parsec-fbf.batchUploadOutcome" payload:v14];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v10);
        }

        int64_t v7 = [(FLSQLitePersistence *)self cleanupPurgableUploads];
        uint64_t v16 = [v8 count];
        if (v7 == v16)
        {
          id v6 = v8;
          goto LABEL_25;
        }
        uint64_t v18 = v16;
        uint32_t v17 = [(FLSQLitePersistence *)self log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v25 = v18;
          __int16 v26 = 2048;
          int64_t v27 = v7;
          _os_log_error_impl(&dword_1BA2B8000, v17, OS_LOG_TYPE_ERROR, "Expected %ld purged uploads from housekeeping, but there were %ld.", buf, 0x16u);
        }
      }
      else
      {
        uint32_t v17 = [(FLSQLitePersistence *)self log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BA2B8000, v17, OS_LOG_TYPE_ERROR, "Error marking uploads for purge, bailing on housekeeping.", buf, 2u);
        }
        int64_t v7 = -1;
      }
    }
    else
    {
      uint32_t v17 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BA2B8000, v17, OS_LOG_TYPE_DEBUG, "Housekeeping found no eligible file uploads.", buf, 2u);
      }
      int64_t v7 = 0;
    }

    goto LABEL_25;
  }
  id v6 = [(FLSQLitePersistence *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BA2B8000, v6, OS_LOG_TYPE_DEBUG, "File housekeeping is disabled, doing nothing.", buf, 2u);
  }
  int64_t v7 = 0;
LABEL_25:

  return v7;
}

- (BOOL)recoverOrphanedProcessingUploads
{
  return [(FLSQLitePersistence *)self executeSQLStatement:"UPDATE fileUploads SET status=0 WHERE status=1;"];
}

- (BOOL)updateStatusForUpload:(id)a3 toStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v4 == 2)
  {
    LOBYTE(v8) = [(FLSQLitePersistence *)self _updateMetadataHelperForUpload:v6 query:"UPDATE fileUploads SET dateUploaded=strftime('%s',datetime('now')) WHERE uploadId=?;"];
  }
  else if (v4 == 1)
  {
    BOOL v7 = [(FLSQLitePersistence *)self _updateMetadataHelperForUpload:v6 query:"UPDATE fileUploads SET processedAttempts=processedAttempts+1 WHERE uploadId=?;"];
    int v8 = v7 & [(FLSQLitePersistence *)self _updateMetadataHelperForUpload:v6 query:"UPDATE fileUploads SET dateLastProcessed=strftime('%s',datetime('now')) WHERE uploadId=?;"];
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  BOOL v9 = v8 & [(FLSQLitePersistence *)self _updateStatusHelperForUpload:v6 toStatus:v4];

  return v9;
}

- (BOOL)_updateMetadataHelperForUpload:(id)a3 query:(const char *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  pStmt = 0;
  if (![(FLSQLitePersistence *)self tryPrepare:a4 preparedStatement:&pStmt])
  {
LABEL_6:
    BOOL v9 = 0;
    goto LABEL_7;
  }
  BOOL v7 = pStmt;
  id v8 = v6;
  BOOL v9 = 1;
  sqlite3_bind_text(v7, 1, (const char *)[v8 UTF8String], objc_msgSend(v8, "length"), 0);
  if (sqlite3_step(pStmt) != 101)
  {
    uint64_t v10 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_error_impl(&dword_1BA2B8000, v10, OS_LOG_TYPE_ERROR, "Failed to update status metadata for upload %@", buf, 0xCu);
    }

    goto LABEL_6;
  }
LABEL_7:
  sqlite3_finalize(pStmt);

  return v9;
}

- (BOOL)_updateStatusHelperForUpload:(id)a3 toStatus:(int)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "UPDATE fileUploads SET status=? WHERE uploadId=?;",
          &pStmt))
  {
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }
  BOOL v7 = 1;
  sqlite3_bind_int(pStmt, 1, a4);
  id v8 = pStmt;
  id v9 = v6;
  sqlite3_bind_text(v8, 2, (const char *)[v9 UTF8String], objc_msgSend(v9, "length"), 0);
  if (sqlite3_step(pStmt) != 101)
  {
    uint64_t v10 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_error_impl(&dword_1BA2B8000, v10, OS_LOG_TYPE_ERROR, "Failed to update status for upload %@", buf, 0xCu);
    }

    goto LABEL_6;
  }
LABEL_7:
  sqlite3_finalize(pStmt);

  return v7;
}

- (id)getUploadsRangeStart:(int64_t)a3 end:(int64_t)a4
{
  if (![(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    BOOL v7 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(pStmt[0]) = 0;
      id v8 = "Can't getRecordsRangeStartDate:endDate, initializeConnection failed";
      id v9 = pStmt;
      goto LABEL_25;
    }
LABEL_8:

    id v10 = 0;
    goto LABEL_9;
  }
  pStmt[0] = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT payload, dateCreated, uploadId FROM fileUploads WHERE dateCreated >= ? AND dateCreated <= ? ORDER BY dateCreated ASC;",
          pStmt)
    || sqlite3_bind_int64(pStmt[0], 1, a3)
    || sqlite3_bind_int64(pStmt[0], 2, a4))
  {
    sqlite3_finalize(pStmt[0]);
    BOOL v7 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      id v8 = "getRecordsRangeStartDate:endDate, failed";
      id v9 = (sqlite3_stmt **)v19;
LABEL_25:
      _os_log_error_impl(&dword_1BA2B8000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)v9, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  while (sqlite3_step(pStmt[0]) == 100)
  {
    uint64_t v12 = [(FLSQLitePersistence *)self db];
    uint64_t v13 = [(FLSQLitePersistence *)self log];
    id v14 = tryGetDataProperty(v12, v13, pStmt[0], 0);

    uint64_t v15 = tryGetDateProperty(pStmt[0], 1);
    if (v15)
    {
      uint64_t v16 = tryGetTextProperty(pStmt[0], 2);
      if (v16)
      {
        uint32_t v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [v17 addObject:v14];
        [v17 addObject:v15];
        uint64_t v18 = [(FLSQLitePersistence *)self storeIdentifier];
        [v17 addObject:v18];

        [v17 addObject:v16];
        [v10 addObject:v17];
      }
      else
      {
        uint32_t v17 = [(FLSQLitePersistence *)self log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v19 = 0;
          _os_log_error_impl(&dword_1BA2B8000, v17, OS_LOG_TYPE_ERROR, "getRecordsRangeStartDate:endDate uploadId failed", v19, 2u);
        }
      }
    }
    else
    {
      uint64_t v16 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl(&dword_1BA2B8000, v16, OS_LOG_TYPE_ERROR, "getRecordsRangeStartDate:endDate dateCreated failed", v19, 2u);
      }
    }
  }
  sqlite3_finalize(pStmt[0]);
LABEL_9:
  return v10;
}

- (id)_getUploadIdsHelper:(sqlite3_stmt *)a3
{
  if (a3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    while (sqlite3_step(a3) == 100)
    {
      int v5 = tryGetTextProperty(a3, 0);
      if (v5) {
        [v4 addObject:v5];
      }
    }
    sqlite3_finalize(a3);
  }
  else
  {
    id v6 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_1BA2B8000, v6, OS_LOG_TYPE_ERROR, "Can't getUploadIds, no statement", v8, 2u);
    }

    id v4 = 0;
  }
  return v4;
}

- (id)getPurgableUploadIds
{
  if (![(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    id v4 = [(FLSQLitePersistence *)self log];
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v10 = 0;
    int v5 = "Can't getPurgableUploadIds, initializeConnection failed";
    id v6 = (uint8_t *)&v10;
LABEL_12:
    _os_log_error_impl(&dword_1BA2B8000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    goto LABEL_7;
  }
  pStmt = 0;
  if ([(FLSQLitePersistence *)self tryPrepare:"SELECT uploadId FROM fileUploads WHERE (dateUploaded IS NOT NULL OR dateCreated < strftime('%s',datetime('now', '-7 day')) OR status IN (3, 4, 5))" preparedStatement:&pStmt])
  {
    v3 = [(FLSQLitePersistence *)self _getUploadIdsHelper:pStmt];
    goto LABEL_8;
  }
  sqlite3_finalize(pStmt);
  id v4 = [(FLSQLitePersistence *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __int16 v8 = 0;
    int v5 = "getPurgableUploadIds failed";
    id v6 = (uint8_t *)&v8;
    goto LABEL_12;
  }
LABEL_7:

  v3 = 0;
LABEL_8:
  return v3;
}

- (id)getUploadIdsWithAllStatuses
{
  if (![(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    id v4 = [(FLSQLitePersistence *)self log];
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v10 = 0;
    int v5 = "Can't getUploadIdsWithAllStatuses, initializeConnection failed";
    id v6 = (uint8_t *)&v10;
LABEL_12:
    _os_log_error_impl(&dword_1BA2B8000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    goto LABEL_7;
  }
  pStmt = 0;
  if (-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT uploadId FROM fileUploads ORDER BY rowid ASC;",
         &pStmt))
  {
    v3 = [(FLSQLitePersistence *)self _getUploadIdsHelper:pStmt];
    goto LABEL_8;
  }
  sqlite3_finalize(pStmt);
  id v4 = [(FLSQLitePersistence *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __int16 v8 = 0;
    int v5 = "getUploadIdsWithAllStatuses failed";
    id v6 = (uint8_t *)&v8;
    goto LABEL_12;
  }
LABEL_7:

  v3 = 0;
LABEL_8:
  return v3;
}

- (id)getUploadIdsWithStatus:(int)a3
{
  if (![(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    int v5 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v6 = "Can't getUploadIdsWithStatus, initializeConnection failed";
      BOOL v7 = buf;
      goto LABEL_13;
    }
LABEL_7:

    __int16 v8 = 0;
    goto LABEL_8;
  }
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT uploadId FROM fileUploads WHERE status=? ORDER BY rowid ASC;",
          &pStmt)
    || sqlite3_bind_int(pStmt, 1, a3))
  {
    sqlite3_finalize(pStmt);
    int v5 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = 0;
      id v6 = "getUploadIdsWithStatus failed";
      BOOL v7 = (uint8_t *)&v10;
LABEL_13:
      _os_log_error_impl(&dword_1BA2B8000, v5, OS_LOG_TYPE_ERROR, v6, v7, 2u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  __int16 v8 = [(FLSQLitePersistence *)self _getUploadIdsHelper:pStmt];
LABEL_8:
  return v8;
}

+ (id)uploadStatusDescription:(int)a3
{
  if (a3 > 5) {
    return @"unknown";
  }
  else {
    return off_1E6208860[a3];
  }
}

- (BOOL)purgeAllBatches
{
  if ([(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    return [(FLSQLitePersistence *)self executeInTransactionMultipleSQLStatements:&unk_1F13BBA98];
  }
  else
  {
    id v4 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v5 = 0;
      _os_log_error_impl(&dword_1BA2B8000, v4, OS_LOG_TYPE_ERROR, "Can't purgeAllBatches, initializeConnection failed", v5, 2u);
    }

    return 0;
  }
}

- (BOOL)__purgeStatementHelper:(const char *)a3 forBatchId:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1BA9E8750]();
  pStmt = 0;
  if (![(FLSQLitePersistence *)self tryPrepare:a3 preparedStatement:&pStmt])
  {
    id v14 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      long long v21 = a3;
      uint64_t v15 = "Can't purgeBatch (%s), statement prep failed";
      uint64_t v16 = v14;
      uint32_t v17 = 12;
      goto LABEL_9;
    }
LABEL_6:

    BOOL v12 = 0;
    goto LABEL_7;
  }
  sqlite3_reset(pStmt);
  __int16 v8 = pStmt;
  id v9 = v6;
  __int16 v10 = (const char *)[v9 UTF8String];
  int v11 = [v9 length];
  BOOL v12 = 1;
  sqlite3_bind_text(v8, 1, v10, v11, 0);
  int v13 = sqlite3_step(pStmt);
  sqlite3_finalize(pStmt);
  if (v13 != 101)
  {
    id v14 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v21 = a3;
      __int16 v22 = 1024;
      int v23 = v13;
      uint64_t v15 = "purgeBatch (%s) failed: %d";
      uint64_t v16 = v14;
      uint32_t v17 = 18;
LABEL_9:
      _os_log_error_impl(&dword_1BA2B8000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v12;
}

- (BOOL)purgeBatch:(id)a3
{
  id v4 = a3;
  if (![(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    __int16 v10 = [(FLSQLitePersistence *)self log];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      BOOL v13 = 0;
      goto LABEL_14;
    }
    __int16 v18 = 0;
    int v11 = "Can't purgeBatch, initializeConnection failed";
    BOOL v12 = (uint8_t *)&v18;
LABEL_16:
    _os_log_error_impl(&dword_1BA2B8000, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
    goto LABEL_9;
  }
  uint64_t v5 = [@"BEGIN TRANSACTION;" UTF8String];
  uint64_t v6 = [@"END TRANSACTION;" UTF8String];
  uint64_t v7 = [@"ROLLBACK;" UTF8String];
  if (![(FLSQLitePersistence *)self executeSQLStatement:v5 usingTransaction:0])
  {
    __int16 v10 = [(FLSQLitePersistence *)self log];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    int v11 = "Can't purgeBatch, couldn't begin transaction";
    BOOL v12 = buf;
    goto LABEL_16;
  }
  if (-[FLSQLitePersistence __purgeStatementHelper:forBatchId:](self, "__purgeStatementHelper:forBatchId:", "DELETE FROM records WHERE batchId=?;",
         v4)
    && -[FLSQLitePersistence __purgeStatementHelper:forBatchId:](self, "__purgeStatementHelper:forBatchId:", "DELETE FROM batchStatus WHERE batchId=?;",
         v4))
  {
    __int16 v8 = self;
    uint64_t v9 = v6;
  }
  else
  {
    id v14 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_error_impl(&dword_1BA2B8000, v14, OS_LOG_TYPE_ERROR, "Failed to purgeBatch, rolling back transaction", v16, 2u);
    }

    __int16 v8 = self;
    uint64_t v9 = v7;
  }
  BOOL v13 = [(FLSQLitePersistence *)v8 executeSQLStatement:v9 usingTransaction:0];
LABEL_14:

  return v13;
}

- (BOOL)vacuum
{
  return -[FLSQLitePersistence executeSQLStatement:usingTransaction:](self, "executeSQLStatement:usingTransaction:", "VACUUM;",
           0);
}

- (int64_t)doBatchesHousekeeping
{
         "d IN (SELECT batchId FROM batchStatus WHERE (dateUploaded IS NOT NULL OR dateCreated < strftime('%s',datetime('"
         "now', '-7 day')) OR status IN (4, 5, 6)));"))
  {
    return sqlite3_changes([(FLSQLitePersistence *)self db]);
  }
  else
  {
    return -1;
  }
}

- (BOOL)markBatchesforPurge
{
  return [(FLSQLitePersistence *)self executeSQLStatement:"UPDATE batchStatus SET status=6 WHERE batchId IN (SELECT batchId FROM batchStatus WHERE (dateUploaded IS NOT NULL OR dateCreated < strftime('%s',datetime('now', '-7 day')) OR status IN (4, 5, 6))) AND status NOT IN (3, 4, 5);"];
}

- (BOOL)recoverOrphanedProcessingBatches
{
  return [(FLSQLitePersistence *)self executeSQLStatement:"UPDATE batchStatus SET status=1 WHERE status=2;"];
}

- (BOOL)closeOpenBatch
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(FLSQLitePersistence *)self currentBatchIdentifier];

  if (!v3) {
    return 1;
  }
  pStmt = 0;
  if (-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "UPDATE batchStatus SET status=1 WHERE status=0 AND batchId=?;",
         &pStmt))
  {
    id v4 = pStmt;
    id v5 = [(FLSQLitePersistence *)self currentBatchIdentifier];
    uint64_t v6 = (const char *)[v5 UTF8String];
    uint64_t v7 = [(FLSQLitePersistence *)self currentBatchIdentifier];
    sqlite3_bind_text(v4, 1, v6, [v7 length], 0);

    int v8 = sqlite3_step(pStmt);
    if (v8 == 101)
    {
      sqlite3_finalize(pStmt);
      [(FLSQLitePersistence *)self setCurrentBatchCreationDate:0];
      [(FLSQLitePersistence *)self setCurrentBatchIdentifier:0];
      return 1;
    }
    int v10 = v8;
    int v11 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = sqlite3_errmsg([(FLSQLitePersistence *)self db]);
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = @"UPDATE batchStatus SET status=1 WHERE status=0 AND batchId=?;";
      __int16 v16 = 1024;
      int v17 = v10;
      __int16 v18 = 2080;
      v19 = v12;
      _os_log_error_impl(&dword_1BA2B8000, v11, OS_LOG_TYPE_ERROR, "Failed to close batch with statement %@ with status %d, error: %s", buf, 0x1Cu);
    }
  }
  sqlite3_finalize(pStmt);
  return 0;
}

- (BOOL)forceCloseOpenBatches
{
  v3 = [(FLSQLitePersistence *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1BA2B8000, v3, OS_LOG_TYPE_INFO, "Force closing open batches", v5, 2u);
  }

  return [(FLSQLitePersistence *)self executeSQLStatement:"UPDATE batchStatus SET status=1 WHERE status=0;"];
}

- (BOOL)closeOrphanedBatches
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  pStmt = 0;
  if (-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT batchId, dateCreated FROM batchStatus WHERE status=0 AND dateCreated < strftime('%s',datetime('now', '-16 minute'));",
         &pStmt))
  {
    *(void *)&long long v3 = 138412546;
    long long v9 = v3;
    while (sqlite3_step(pStmt) == 100)
    {
      id v4 = tryGetTextProperty(pStmt, 0);
      id v5 = tryGetDateProperty(pStmt, 1);
      uint64_t v6 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v9;
        BOOL v12 = v4;
        __int16 v13 = 2112;
        id v14 = v5;
        _os_log_error_impl(&dword_1BA2B8000, v6, OS_LOG_TYPE_ERROR, "Found orphaned batch %@ created at %@", buf, 0x16u);
      }
    }
    sqlite3_finalize(pStmt);
  }
  else
  {
    uint64_t v7 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BA2B8000, v7, OS_LOG_TYPE_ERROR, "Failed to get orphaned batches", buf, 2u);
    }
  }
  return -[FLSQLitePersistence executeSQLStatement:](self, "executeSQLStatement:", "UPDATE batchStatus SET status=1 WHERE status=0 AND dateCreated < strftime('%s',datetime('now', '-16 minute'));",
           v9);
}

- (BOOL)initializeNewBatch
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v3 = (void *)MEMORY[0x1BA9E8750](self, a2);
  if (![(FLSQLitePersistence *)self closeOpenBatch])
  {
    id v4 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(pStmt[0]) = 0;
      _os_log_error_impl(&dword_1BA2B8000, v4, OS_LOG_TYPE_ERROR, "Couldn't close open batches, failing", (uint8_t *)pStmt, 2u);
    }
  }
  pStmt[0] = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "INSERT INTO batchStatus(batchId, timestampRefId, dateCreated) VALUES (?, ?, ?);",
          pStmt))
  {
    int v8 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BA2B8000, v8, OS_LOG_TYPE_ERROR, "Couldn't prepare batch initializer statement, failing", buf, 2u);
    }
    goto LABEL_13;
  }
  id v5 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v6 = [v5 UUIDString];

  sqlite3_reset(pStmt[0]);
  uint64_t v7 = pStmt[0];
  int v8 = v6;
  sqlite3_bind_text(v7, 1, (const char *)[v8 UTF8String], [v8 length], 0);
  long long v9 = pStmt[0];
  int v10 = [(FLSQLitePersistence *)self context];
  id v11 = [v10 timestampReferenceIdentifier];
  BOOL v12 = (const char *)[v11 UTF8String];
  __int16 v13 = [(FLSQLitePersistence *)self context];
  id v14 = [v13 timestampReferenceIdentifier];
  sqlite3_bind_text(v9, 2, v12, [v14 length], 0);

  uint64_t v15 = pStmt[0];
  __int16 v16 = objc_opt_new();
  [v16 timeIntervalSince1970];
  sqlite3_bind_int64(v15, 3, (uint64_t)v17);

  int v18 = sqlite3_step(pStmt[0]);
  sqlite3_finalize(pStmt[0]);
  if (v18 != 101)
  {
    long long v21 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v25 = v18;
      _os_log_error_impl(&dword_1BA2B8000, v21, OS_LOG_TYPE_ERROR, "SQLite initialize new batch failed: %d", buf, 8u);
    }

LABEL_13:
    BOOL v20 = 0;
    goto LABEL_14;
  }
  [(FLSQLitePersistence *)self setCurrentBatchIdentifier:v8];
  v19 = [MEMORY[0x1E4F1C9C8] date];
  [(FLSQLitePersistence *)self setCurrentBatchCreationDate:v19];

  [(FLSQLitePersistence *)self setCurrentBatchPayloadSize:0];
  [(FLSQLitePersistence *)self setCurrentBatchEventCount:0];
  BOOL v20 = 1;
LABEL_14:

  return v20;
}

- (int)getDataVersion
{
  int v6 = 1;
  if (![(FLSQLitePersistence *)self getIntValueForPragma:@"data_version" into:&v6])
  {
    long long v3 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl(&dword_1BA2B8000, v3, OS_LOG_TYPE_ERROR, "Could not infer data_version, assuming 1", v5, 2u);
    }
  }
  return v6;
}

- (BOOL)updateStatusForBatch:(id)a3 toStatus:(int)a4
{
  id v4 = *(NSObject **)&a4;
  id v6 = a3;
  if ([(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    if (v4 == 3)
    {
      int v8 = [(FLSQLitePersistence *)self _updateMetadataHelperForBatch:v6 query:"UPDATE batchStatus SET dateUploaded=strftime('%s',datetime('now')) WHERE batchId=?;"];
    }
    else if (v4 == 2)
    {
      BOOL v7 = [(FLSQLitePersistence *)self _updateMetadataHelperForBatch:v6 query:"UPDATE batchStatus SET processedAttempts=processedAttempts+1 WHERE batchId=?;"];
      int v8 = v7 & [(FLSQLitePersistence *)self _updateMetadataHelperForBatch:v6 query:"UPDATE batchStatus SET dateLastProcessed=strftime('%s',datetime('now')) WHERE batchId=?;"];
    }
    else
    {
      int v8 = 1;
    }
    LODWORD(v4) = v8 & [(FLSQLitePersistence *)self _updateStatusHelperForBatch:v6 toStatus:v4];
  }
  else
  {
    id v4 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v10 = 0;
      _os_log_error_impl(&dword_1BA2B8000, v4, OS_LOG_TYPE_ERROR, "Can't getBatchSize, initialization failed", v10, 2u);
    }

    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

- (BOOL)_updateMetadataHelperForBatch:(id)a3 query:(const char *)a4
{
  id v6 = a3;
  pStmt = 0;
  if (![(FLSQLitePersistence *)self tryPrepare:a4 preparedStatement:&pStmt])
  {
LABEL_6:
    BOOL v11 = 0;
    goto LABEL_7;
  }
  BOOL v7 = pStmt;
  id v8 = v6;
  long long v9 = (const char *)[v8 UTF8String];
  int v10 = [v8 length];
  BOOL v11 = 1;
  sqlite3_bind_text(v7, 1, v9, v10, 0);
  if (sqlite3_step(pStmt) != 101)
  {
    BOOL v12 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_error_impl(&dword_1BA2B8000, v12, OS_LOG_TYPE_ERROR, "Failed to update status metadata for batch", v14, 2u);
    }

    goto LABEL_6;
  }
LABEL_7:
  sqlite3_finalize(pStmt);

  return v11;
}

- (BOOL)_updateStatusHelperForBatch:(id)a3 toStatus:(int)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "UPDATE batchStatus SET status=? WHERE batchId=?;",
          &pStmt))
  {
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }
  BOOL v7 = 1;
  sqlite3_bind_int(pStmt, 1, a4);
  id v8 = pStmt;
  id v9 = v6;
  sqlite3_bind_text(v8, 2, (const char *)[v9 UTF8String], objc_msgSend(v9, "length"), 0);
  if (sqlite3_step(pStmt) != 101)
  {
    int v10 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = @"UPDATE batchStatus SET status=? WHERE batchId=?;";
      _os_log_error_impl(&dword_1BA2B8000, v10, OS_LOG_TYPE_ERROR, "Failed to update status for batch with statement: %@", buf, 0xCu);
    }

    goto LABEL_6;
  }
LABEL_7:
  sqlite3_finalize(pStmt);

  return v7;
}

- (id)metadataForBatch:(id)a3 bundleID:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    BOOL v11 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BA2B8000, v11, OS_LOG_TYPE_ERROR, "Can't getBatchSize, initialization failed", buf, 2u);
    }

    goto LABEL_11;
  }
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT s.batchId, s.timestampRefId, COALESCE(sum(length(r.payload)), 0), s.status, s.processedAttempts, s.dateCreated, s.dateUploaded, s.dateLastProcessed, COUNT(DISTINCT(r.rowId)), first_value(r.payload) OVER (ORDER BY r.rowId) FROM batchStatus s LEFT JOIN records r ON s.batchId = r.batchId WHERE s.batchId=? GROUP BY s.batchId;",
          &pStmt)
    || (id v8 = pStmt,
        id v9 = v6,
        sqlite3_bind_text(v8, 1, (const char *)[v9 UTF8String], objc_msgSend(v9, "length"), 0)))
  {
    int v10 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BA2B8000, v10, OS_LOG_TYPE_ERROR, "Failed to get batch metadata", buf, 2u);
    }

    goto LABEL_7;
  }
  if (sqlite3_step(pStmt) != 100)
  {
LABEL_7:
    sqlite3_finalize(pStmt);
LABEL_11:
    BOOL v12 = 0;
    goto LABEL_12;
  }
  id v14 = objc_alloc_init(BatchMetadata);
  [(BatchMetadata *)v14 setBatchIdentifier:v9];
  uint64_t v15 = tryGetTextProperty(pStmt, 1);
  [(BatchMetadata *)v14 setTimestampReferenceIdentifier:v15];

  [(BatchMetadata *)v14 setBatchSize:sqlite3_column_int(pStmt, 2)];
  [(BatchMetadata *)v14 setBatchStatus:sqlite3_column_int(pStmt, 3)];
  [(BatchMetadata *)v14 setProcessedAttempts:sqlite3_column_int(pStmt, 4)];
  __int16 v16 = tryGetDateProperty(pStmt, 5);
  if (v16)
  {
    [(BatchMetadata *)v14 setDateCreated:v16];
    double v17 = tryGetDateProperty(pStmt, 6);
    [(BatchMetadata *)v14 setDateUploaded:v17];

    int v18 = tryGetDateProperty(pStmt, 7);
    [(BatchMetadata *)v14 setDateLastProcessed:v18];

    [(BatchMetadata *)v14 setEventCount:sqlite3_column_int(pStmt, 8)];
    v19 = [(FLSQLitePersistence *)self db];
    BOOL v20 = [(FLSQLitePersistence *)self log];
    long long v21 = tryGetDataProperty(v19, v20, pStmt, 9);

    __int16 v22 = +[FLLogger fixedCategoryForBundleID:v7];
    if (v22)
    {
      [(BatchMetadata *)v14 setCategory:v22];
    }
    else if (v21)
    {
      objc_initWeak((id *)buf, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __63__FLSQLitePersistence_BatchManager__metadataForBatch_bundleID___block_invoke;
      aBlock[3] = &unk_1E6208898;
      objc_copyWeak(&v33, (id *)buf);
      id v31 = v7;
      v32 = v21;
      uint64_t v24 = _Block_copy(aBlock);
      int v25 = [FLLogger alloc];
      uint64_t v26 = [(FLSQLitePersistence *)self context];
      int64_t v27 = [(FLLogger *)v25 initWithContext:v26];

      int v28 = [(FLLogger *)v27 categoryForSiriPayload:v21 autoBugCaptureBlock:v24];
      [(BatchMetadata *)v14 setCategory:v28];

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(BatchMetadata *)v14 setCategory:0];
      uint64_t v29 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v7;
        _os_log_error_impl(&dword_1BA2B8000, v29, OS_LOG_TYPE_ERROR, "Batch has no payload for bundleID %@", buf, 0xCu);
      }
    }
    sqlite3_finalize(pStmt);
    BOOL v12 = v14;
  }
  else
  {
    int v23 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BA2B8000, v23, OS_LOG_TYPE_ERROR, "Batch has no creation date.", buf, 2u);
    }

    sqlite3_finalize(pStmt);
    BOOL v12 = 0;
  }

LABEL_12:
  return v12;
}

void __63__FLSQLitePersistence_BatchManager__metadataForBatch_bundleID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = [FLAutoBugHelper alloc];
  id v8 = [WeakRetained context];
  id v9 = [v8 autoBugCapture];
  int v10 = [(FLAutoBugHelper *)v7 initWithAutoBugCapture:v9 bundleID:*(void *)(a1 + 32) eventValue:*(void *)(a1 + 40)];

  if (v11) {
    [(FLAutoBugHelper *)v10 triggerABCWithSubtype:v5 additionalEventName:v11];
  }
  else {
    [(FLAutoBugHelper *)v10 triggerABCWithSubtype:v5];
  }
}

- (id)getRecordsRangeStart:(int64_t)a3 end:(int64_t)a4
{
  if (![(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    id v7 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(pStmt[0]) = 0;
      id v8 = "Can't getRecordsRangeStartDate:endDate, initializeConnection failed";
      id v9 = pStmt;
      goto LABEL_25;
    }
LABEL_8:

    id v10 = 0;
    goto LABEL_9;
  }
  pStmt[0] = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT r.payload, r.dateCreated, r.batchId FROM records r WHERE r.dateCreated >= ? AND r.dateCreated <= ? ORDER BY r.dateCreated ASC;",
          pStmt)
    || sqlite3_bind_int64(pStmt[0], 1, a3)
    || sqlite3_bind_int64(pStmt[0], 2, a4))
  {
    sqlite3_finalize(pStmt[0]);
    id v7 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      id v8 = "getRecordsRangeStartDate:endDate, failed";
      id v9 = (sqlite3_stmt **)v19;
LABEL_25:
      _os_log_error_impl(&dword_1BA2B8000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)v9, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  while (sqlite3_step(pStmt[0]) == 100)
  {
    BOOL v12 = [(FLSQLitePersistence *)self db];
    __int16 v13 = [(FLSQLitePersistence *)self log];
    id v14 = tryGetDataProperty(v12, v13, pStmt[0], 0);

    uint64_t v15 = tryGetDateProperty(pStmt[0], 1);
    if (v15)
    {
      __int16 v16 = tryGetTextProperty(pStmt[0], 2);
      if (v16)
      {
        double v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [v17 addObject:v14];
        [v17 addObject:v15];
        int v18 = [(FLSQLitePersistence *)self storeIdentifier];
        [v17 addObject:v18];

        [v17 addObject:v16];
        [v10 addObject:v17];
      }
      else
      {
        double v17 = [(FLSQLitePersistence *)self log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v19 = 0;
          _os_log_error_impl(&dword_1BA2B8000, v17, OS_LOG_TYPE_ERROR, "getRecordsRangeStartDate:endDate batchId failed", v19, 2u);
        }
      }
    }
    else
    {
      __int16 v16 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl(&dword_1BA2B8000, v16, OS_LOG_TYPE_ERROR, "getRecordsRangeStartDate:endDate dateCreated failed", v19, 2u);
      }
    }
  }
  sqlite3_finalize(pStmt[0]);
LABEL_9:
  return v10;
}

- (id)_getBatchIdsHelper:(sqlite3_stmt *)a3
{
  id v5 = [(FLSQLitePersistence *)self context];
  id v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  if (a3)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    while (sqlite3_step(a3) == 100)
    {
      id v8 = tryGetTextProperty(a3, 0);
      if (v8) {
        [v7 addObject:v8];
      }
    }
    sqlite3_finalize(a3);
  }
  else
  {
    id v9 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v11 = 0;
      _os_log_error_impl(&dword_1BA2B8000, v9, OS_LOG_TYPE_ERROR, "Can't getBatchIds, no statement", v11, 2u);
    }

    id v7 = 0;
  }
  return v7;
}

- (id)getPurgableBatchIds
{
  if (![(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    id v4 = [(FLSQLitePersistence *)self log];
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v10 = 0;
    id v5 = "Can't getPurgableBatchIds, initializeConnection failed";
    id v6 = (uint8_t *)&v10;
LABEL_12:
    _os_log_error_impl(&dword_1BA2B8000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    goto LABEL_7;
  }
  pStmt = 0;
  if ([(FLSQLitePersistence *)self tryPrepare:"SELECT batchId FROM batchStatus WHERE (dateUploaded IS NOT NULL OR dateCreated < strftime('%s',datetime('now', '-7 day')) OR status IN (4, 5, 6))" preparedStatement:&pStmt])
  {
    long long v3 = [(FLSQLitePersistence *)self _getBatchIdsHelper:pStmt];
    goto LABEL_8;
  }
  sqlite3_finalize(pStmt);
  id v4 = [(FLSQLitePersistence *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __int16 v8 = 0;
    id v5 = "getPurgableBatchIds failed";
    id v6 = (uint8_t *)&v8;
    goto LABEL_12;
  }
LABEL_7:

  long long v3 = 0;
LABEL_8:
  return v3;
}

- (id)getBatchIdsWithAllStatuses
{
  if (![(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    id v4 = [(FLSQLitePersistence *)self log];
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v10 = 0;
    id v5 = "Can't getBatchIdsWithAllStatuses, initializeConnection failed";
    id v6 = (uint8_t *)&v10;
LABEL_12:
    _os_log_error_impl(&dword_1BA2B8000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    goto LABEL_7;
  }
  pStmt = 0;
  if (-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT batchId FROM batchStatus ORDER BY rowid ASC;",
         &pStmt))
  {
    long long v3 = [(FLSQLitePersistence *)self _getBatchIdsHelper:pStmt];
    goto LABEL_8;
  }
  sqlite3_finalize(pStmt);
  id v4 = [(FLSQLitePersistence *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __int16 v8 = 0;
    id v5 = "getBatchIdsWithAllStatuses failed";
    id v6 = (uint8_t *)&v8;
    goto LABEL_12;
  }
LABEL_7:

  long long v3 = 0;
LABEL_8:
  return v3;
}

- (id)getBatchIdsWithStatus:(int)a3
{
  if (![(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    id v5 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v6 = "Can't getBatchIdsWithStatus, initializeConnection failed";
      id v7 = buf;
      goto LABEL_13;
    }
LABEL_7:

    __int16 v8 = 0;
    goto LABEL_8;
  }
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT batchId FROM batchStatus WHERE status=? ORDER BY rowid ASC LIMIT 4096;",
          &pStmt)
    || sqlite3_bind_int(pStmt, 1, a3))
  {
    sqlite3_finalize(pStmt);
    id v5 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = 0;
      id v6 = "getBatchIdsWithStatus failed";
      id v7 = (uint8_t *)&v10;
LABEL_13:
      _os_log_error_impl(&dword_1BA2B8000, v5, OS_LOG_TYPE_ERROR, v6, v7, 2u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  __int16 v8 = [(FLSQLitePersistence *)self _getBatchIdsHelper:pStmt];
LABEL_8:
  return v8;
}

+ (id)batchStatusDescription:(int)a3
{
  if (a3 > 6) {
    return @"unknown";
  }
  else {
    return off_1E62088B8[a3];
  }
}

- (BOOL)shouldIgnoreQuota
{
  long long v3 = [(FLSQLitePersistence *)self context];
  int v4 = [(id)objc_opt_class() isInternalBuild];

  if (!v4) {
    return 0;
  }
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = [(FLSQLitePersistence *)self databasePath];
  id v7 = [v5 fileURLWithPath:v6];

  __int16 v8 = [v7 URLByDeletingLastPathComponent];
  id v9 = [v8 URLByAppendingPathComponent:@".com.apple.feedbacklogger.ignore_quota"];
  __int16 v10 = [v9 standardizedURL];

  id v11 = [v10 path];
  if (v11
    && ([(FLSQLitePersistence *)self context],
        BOOL v12 = objc_claimAutoreleasedReturnValue(),
        [v12 fileManager],
        __int16 v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 fileExistsAtPath:v11],
        v13,
        v12,
        v14))
  {
    uint64_t v15 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v18 = 0;
      _os_log_debug_impl(&dword_1BA2B8000, v15, OS_LOG_TYPE_DEBUG, "Ignoring FeedbackLogger DB size quota.", v18, 2u);
    }

    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)setDatabaseSizeLimit
{
  if ([(FLSQLitePersistence *)self shouldIgnoreQuota]) {
    return 1;
  }
  int v12 = 0;
  if ([(FLSQLitePersistence *)self getIntValueForPragma:@"page_size" into:&v12])
  {
    unint64_t v4 = [(FLSQLitePersistence *)self maxAllowedDatabaseSizeInBytes];
    unint64_t v5 = v4 / v12;
    id v6 = (void *)MEMORY[0x1BA9E8750]();
    objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA max_page_count = %i;", v5);
    id v7 = objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 UTF8String];

    BOOL v3 = [(FLSQLitePersistence *)self executeSQLStatement:v8];
  }
  else
  {
    id v9 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BA2B8000, v9, OS_LOG_TYPE_ERROR, "Couldn't infer page_size, failing request to set database size limit", buf, 2u);
    }

    return 0;
  }
  return v3;
}

- (unint64_t)getCurrentDatabaseSize
{
  uint64_t v4 = 0;
  [(FLSQLitePersistence *)self getIntValueForPragma:@"page_size" into:&v4];
  [(FLSQLitePersistence *)self getIntValueForPragma:@"page_count" into:(char *)&v4 + 4];
  return (int)v4 * (uint64_t)SHIDWORD(v4);
}

- (int)getSchemaVersion
{
  int v6 = 0;
  if (![(FLSQLitePersistence *)self getIntValueForPragma:@"user_version" into:&v6])
  {
    BOOL v3 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v5 = 0;
      _os_log_error_impl(&dword_1BA2B8000, v3, OS_LOG_TYPE_ERROR, "Could not infer schema_version, assuming 0", v5, 2u);
    }
  }
  return v6;
}

- (BOOL)updateSchema
{
  *(void *)&v17[5] = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__FLSQLitePersistence_SchemaManager__updateSchema__block_invoke;
  aBlock[3] = &unk_1E6208900;
  void aBlock[4] = self;
  BOOL v3 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  unsigned int v4 = [(FLSQLitePersistence *)self getSchemaVersion];
  unint64_t v5 = [(FLSQLitePersistence *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    v17[0] = v4;
    LOWORD(v17[1]) = 1024;
    *(_DWORD *)((char *)&v17[1] + 2) = 6;
    _os_log_debug_impl(&dword_1BA2B8000, v5, OS_LOG_TYPE_DEBUG, "db's schema version %d. required schema version %d.", buf, 0xEu);
  }

  if (v4 < 5)
  {
    if ([(FLSQLitePersistence *)self deleteDatabase]
      && [(FLSQLitePersistence *)self createDatabase])
    {
      BOOL v6 = -[FLSQLitePersistence executeSQLStatement:usingTransaction:](self, "executeSQLStatement:usingTransaction:", "PRAGMA journal_mode=WAL;",
             0);
      id v7 = [(FLSQLitePersistence *)self log];
      uint64_t v8 = v7;
      if (!v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
        goto LABEL_29;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)double v17 = "CREATE TABLE batchStatus(batchId TEXT NOT NULL PRIMARY KEY, timestampRefId TEXT NOT NULL, statu"
                         "s INT DEFAULT 0, processedAttempts INT DEFAULT 0, dateCreated INT NOT NULL, dateUploaded INT DE"
                         "FAULT NULL, dateLastProcessed INT DEFAULT NULL);CREATE TABLE records(batchId TEXT NOT NULL, pay"
                         "load BLOB, dateCreated INT NOT NULL, FOREIGN KEY (batchId) REFERENCES batchStatus(batchId));CRE"
                         "ATE TABLE fileUploads(uploadId TEXT NOT NULL PRIMARY KEY, payload BLOB, timestampRefId TEXT NOT"
                         " NULL, status INT DEFAULT 0, processedAttempts INT DEFAULT 0, dateCreated INT NOT NULL, dateUpl"
                         "oaded INT DEFAULT NULL, dateLastProcessed INT DEFAULT NULL);";
        _os_log_impl(&dword_1BA2B8000, v8, OS_LOG_TYPE_DEFAULT, "migrating schema with: %s", buf, 0xCu);
      }

      if (![(FLSQLitePersistence *)self executeSQLStatement:"DROP TABLE IF EXISTS records; DROP TABLE IF EXISTS batchStatus;"]
        || !-[FLSQLitePersistence executeSQLStatement:](self, "executeSQLStatement:", "CREATE TABLE batchStatus(batchId TEXT NOT NULL PRIMARY KEY, timestampRefId TEXT NOT NULL, status INT DEFAULT 0, processedAttempts INT DEFAULT 0, dateCreated INT NOT NULL, dateUploaded INT DEFAULT NULL, dateLastProcessed INT DEFAULT NULL);CREATE TABLE records(batchId TEXT NOT NULL, payload BLOB, dateCreated INT NOT NU"
              "LL, FOREIGN KEY (batchId) REFERENCES batchStatus(batchId));CREATE TABLE fileUploads(uploadId TEXT NOT NULL"
              " PRIMARY KEY, payload BLOB, timestampRefId TEXT NOT NULL, status INT DEFAULT 0, processedAttempts INT DEFA"
              "ULT 0, dateCreated INT NOT NULL, dateUploaded INT DEFAULT NULL, dateLastProcessed INT DEFAULT NULL);"))
      {
        uint64_t v8 = [(FLSQLitePersistence *)self log];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
        goto LABEL_29;
      }
LABEL_24:
      v3[2](v3, 6);
      goto LABEL_25;
    }
    id v9 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2B8000, v9, OS_LOG_TYPE_DEFAULT, "could not recreate database for migration", buf, 2u);
    }
LABEL_19:

LABEL_30:
    BOOL v12 = 0;
    goto LABEL_31;
  }
  if (v4 == 5)
  {
    BOOL v10 = -[FLSQLitePersistence executeSQLStatement:usingTransaction:](self, "executeSQLStatement:usingTransaction:", "PRAGMA journal_mode=WAL;",
            0);
    id v11 = [(FLSQLitePersistence *)self log];
    uint64_t v8 = v11;
    if (!v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_32:
        int v14 = sqlite3_errmsg([(FLSQLitePersistence *)self db]);
        *(_DWORD *)buf = 136315138;
        *(void *)double v17 = v14;
        _os_log_error_impl(&dword_1BA2B8000, v8, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
LABEL_29:

      goto LABEL_30;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)double v17 = "CREATE TABLE fileUploads(uploadId TEXT NOT NULL PRIMARY KEY, payload BLOB, timestampRefId TEXT NO"
                       "T NULL, status INT DEFAULT 0, processedAttempts INT DEFAULT 0, dateCreated INT NOT NULL, dateUplo"
                       "aded INT DEFAULT NULL, dateLastProcessed INT DEFAULT NULL);";
      _os_log_impl(&dword_1BA2B8000, v8, OS_LOG_TYPE_DEFAULT, "migrating schema with: %s", buf, 0xCu);
    }

    [(FLSQLitePersistence *)self executeSQLStatement:"CREATE TABLE fileUploads(uploadId TEXT NOT NULL PRIMARY KEY, payload BLOB, timestampRefId TEXT NOT NULL, status INT DEFAULT 0, processedAttempts INT DEFAULT 0, dateCreated INT NOT NULL, dateUploaded INT DEFAULT NULL, dateLastProcessed INT DEFAULT NULL);"];
    goto LABEL_24;
  }
  if (v4 != 6)
  {
    id v9 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BA2B8000, v9, OS_LOG_TYPE_ERROR, "Received unexpected schema version, failing migration", buf, 2u);
    }
    goto LABEL_19;
  }
LABEL_25:
  BOOL v12 = [(FLSQLitePersistence *)self getSchemaVersion] == 6;
LABEL_31:

  return v12;
}

uint64_t __50__FLSQLitePersistence_SchemaManager__updateSchema__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = (void *)MEMORY[0x1BA9E8750]();
  objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %i;", a2);
  id v5 = objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 UTF8String];

  if (!v6)
  {
LABEL_7:
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  if (([*(id *)(a1 + 32) executeSQLStatement:v6] & 1) == 0)
  {
    uint64_t v8 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BA2B8000, v8, OS_LOG_TYPE_ERROR, "Schema updateVersion failed", buf, 2u);
    }

    goto LABEL_7;
  }
  uint64_t v7 = 1;
LABEL_8:
  return v7;
}

- (BOOL)isSchemaReady
{
  return [(FLSQLitePersistence *)self getSchemaVersion] > 5;
}

- (BOOL)prepareSchema
{
  if ([(FLSQLitePersistence *)self isSchemaReady]) {
    return 1;
  }
  return [(FLSQLitePersistence *)self updateSchema];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbConnection, 0);
  objc_storeStrong((id *)&self->_currentBatchCreationDate, 0);
  objc_storeStrong((id *)&self->_currentBatchIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

- (void)setUser:(int)a3
{
  self->_user = a3;
}

- (int)user
{
  return self->_user;
}

- (void)setDbConnection:(id)a3
{
}

- (FLSQLiteDatabaseConnection)dbConnection
{
  return self->_dbConnection;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (void)setMaxRowIdStatement:(sqlite3_stmt *)a3
{
  self->_maxRowIdStatement = a3;
}

- (sqlite3_stmt)maxRowIdStatement
{
  return self->_maxRowIdStatement;
}

- (void)setBatchMaximumDuration:(double)a3
{
  self->_batchMaximumDuration = a3;
}

- (double)batchMaximumDuration
{
  return self->_batchMaximumDuration;
}

- (void)setCurrentBatchEventCount:(unint64_t)a3
{
  self->_currentBatchEventCount = a3;
}

- (unint64_t)currentBatchEventCount
{
  return self->_currentBatchEventCount;
}

- (void)setCurrentBatchPayloadSize:(unint64_t)a3
{
  self->_currentBatchPayloadSize = a3;
}

- (unint64_t)currentBatchPayloadSize
{
  return self->_currentBatchPayloadSize;
}

- (void)setCurrentBatchCreationDate:(id)a3
{
}

- (NSDate)currentBatchCreationDate
{
  return self->_currentBatchCreationDate;
}

- (void)setCurrentBatchIdentifier:(id)a3
{
}

- (NSString)currentBatchIdentifier
{
  return self->_currentBatchIdentifier;
}

- (void)setMaxAllowedDatabaseSizeInBytes:(unint64_t)a3
{
  self->_maxAllowedDatabaseSizeInBytes = a3;
}

- (unint64_t)maxAllowedDatabaseSizeInBytes
{
  return self->_maxAllowedDatabaseSizeInBytes;
}

- (void)setMaxBatchPayloadInBytes:(unint64_t)a3
{
  self->_maxBatchPayloadInBytes = a3;
}

- (unint64_t)maxBatchPayloadInBytes
{
  return self->_maxBatchPayloadInBytes;
}

- (void)setConfigured:(BOOL)a3
{
}

- (BOOL)configured
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_configured);
  return v2 & 1;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setIteratePayloadStatement:(sqlite3_stmt *)a3
{
  self->_iteratePayloadStatement = a3;
}

- (sqlite3_stmt)iteratePayloadStatement
{
  return self->_iteratePayloadStatement;
}

- (void)setInsertRecordsStatement:(sqlite3_stmt *)a3
{
  self->_insertRecordsStatement = a3;
}

- (sqlite3_stmt)insertRecordsStatement
{
  return self->_insertRecordsStatement;
}

- (void)setContext:(id)a3
{
}

- (FLLoggingContext)context
{
  return self->_context;
}

- (void)setLog:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (BOOL)deleteAllUploadsQueuedBefore:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(FLSQLitePersistence *)self initializeConnectionForUseBy:1])
  {
    [v4 timeIntervalSince1970];
    uint64_t v6 = (uint64_t)v5;
    uint64_t v7 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = v6;
      _os_log_debug_impl(&dword_1BA2B8000, v7, OS_LOG_TYPE_DEBUG, "Deleting all uploads queued before %lld (timestampInSecondsSince1970)", buf, 0xCu);
    }

    uint64_t v8 = (void *)MEMORY[0x1BA9E8750]();
    objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM fileUploads WHERE dateCreated <= %lld;",
      v6);
    id v9 = objc_claimAutoreleasedReturnValue();
    BOOL v10 = -[FLSQLitePersistence executeSQLStatement:usingTransaction:](self, "executeSQLStatement:usingTransaction:", [v9 UTF8String], 0);
    objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM records     WHERE dateCreated <= %lld;",
    id v11 = v6);
    v15[0] = v11;
    objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM batchStatus WHERE dateCreated <= %lld;",
    BOOL v12 = v6);
    v15[1] = v12;
    __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    LODWORD(self) = v10 & [(FLSQLitePersistence *)self executeInTransactionMultipleSQLStatements:v13];
  }
  else
  {
    self = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BA2B8000, &self->super, OS_LOG_TYPE_ERROR, "deleteAllQueuedFileAndBatchedRecordUploads: initializeConnection failed", buf, 2u);
    }

    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (BOOL)deleteDatabase
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (![(FLSQLiteDatabaseConnection *)self->_dbConnection db]) {
    return 1;
  }
  BOOL v3 = [(FLSQLitePersistence *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v8) = 0;
    _os_log_debug_impl(&dword_1BA2B8000, v3, OS_LOG_TYPE_DEBUG, "Resetting to an empty database file.", (uint8_t *)&v8, 2u);
  }

  [(FLSQLiteDatabaseConnection *)self->_dbConnection db];
  int v4 = _sqlite3_db_truncate();
  [(FLSQLitePersistence *)self closeDatabase];
  if (!v4) {
    return 1;
  }
  double v5 = [(FLSQLitePersistence *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = sqlite3_errmsg([(FLSQLiteDatabaseConnection *)self->_dbConnection db]);
    int v8 = 136315138;
    id v9 = v7;
    _os_log_error_impl(&dword_1BA2B8000, v5, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v8, 0xCu);
  }

  return 0;
}

- (void)closeDatabase
{
  BOOL v3 = [(FLSQLitePersistence *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v4 = 0;
    _os_log_debug_impl(&dword_1BA2B8000, v3, OS_LOG_TYPE_DEBUG, "Closing database file", v4, 2u);
  }

  [(FLSQLiteDatabaseConnection *)self->_dbConnection close];
}

- (BOOL)createDatabase
{
  BOOL v3 = [(FLSQLitePersistence *)self open];
  if (v3)
  {
    LOBYTE(v3) = -[FLSQLitePersistence executeSQLStatement:usingTransaction:](self, "executeSQLStatement:usingTransaction:", "PRAGMA foreign_keys=ON;",
                   0);
  }
  return v3;
}

- (BOOL)getIntValueForPragma:(id)a3 into:(int *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1BA9E8750]();
  pStmt = 0;
  id v8 = [NSString stringWithFormat:@"PRAGMA %@;", v6];
  uint64_t v9 = [v8 UTF8String];

  if (![(FLSQLitePersistence *)self tryPrepare:v9 preparedStatement:&pStmt])
  {
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }
  if (sqlite3_step(pStmt) != 100)
  {
    sqlite3_finalize(pStmt);
    id v11 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_error_impl(&dword_1BA2B8000, v11, OS_LOG_TYPE_ERROR, "Could not infer PRAGMA %@", buf, 0xCu);
    }

    goto LABEL_7;
  }
  *a4 = sqlite3_column_int(pStmt, 0);
  sqlite3_finalize(pStmt);
  BOOL v10 = 1;
LABEL_8:

  return v10;
}

- (BOOL)iteratePayloadForBatch:(id)a3 codeblock:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, unsigned char *, void *))a4;
  sqlite3_reset(self->_iteratePayloadStatement);
  iteratePayloadStatement = self->_iteratePayloadStatement;
  id v9 = v6;
  uint64_t v10 = sqlite3_bind_text(iteratePayloadStatement, 1, (const char *)[v9 UTF8String], objc_msgSend(v9, "length"), 0);
  id v11 = (void *)MEMORY[0x1BA9E8750](v10);
  char v25 = 0;
  while (1)
  {
    int v12 = sqlite3_step(self->_iteratePayloadStatement);
    if (v12 != 100) {
      break;
    }
    __int16 v13 = sqlite3_column_blob(self->_iteratePayloadStatement, 0);
    if (sqlite3_errcode([(FLSQLitePersistence *)self db]) == 7)
    {
      v19 = [(FLSQLitePersistence *)self log];
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      *(_WORD *)buf = 0;
      long long v21 = "SQLite payload blob iteration OOM";
      __int16 v22 = v19;
      uint32_t v23 = 2;
      goto LABEL_15;
    }
    int v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v13, sqlite3_column_bytes(self->_iteratePayloadStatement, 0));
    id v15 = [(FLSQLitePersistence *)self context];
    v7[2](v7, v14, &v25, v15);

    if (v25)
    {
      char v16 = 1;
LABEL_8:
      char v18 = 1;
      goto LABEL_13;
    }
  }
  int v17 = v12;
  if (v12 == 101)
  {
    char v16 = 0;
    goto LABEL_8;
  }
  v19 = [(FLSQLitePersistence *)self log];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = [v9 UTF8String];
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = v20;
    __int16 v28 = 1024;
    int v29 = v17;
    long long v21 = "SQLite iterate payload for batch (%s) failed: %d";
    __int16 v22 = v19;
    uint32_t v23 = 18;
LABEL_15:
    _os_log_error_impl(&dword_1BA2B8000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
  }
LABEL_12:

  char v16 = 0;
  char v18 = 0;
LABEL_13:

  return v16 | v18;
}

- (BOOL)executeInTransactionMultipleSQLStatements:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(FLSQLitePersistence *)self db] || [(FLSQLitePersistence *)self open])
  {
    uint64_t v13 = 0;
    int v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 1;
    if (sqlite3_exec([(FLSQLitePersistence *)self db], "BEGIN TRANSACTION;", 0, 0, 0))
    {
      double v5 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BA2B8000, v5, OS_LOG_TYPE_ERROR, "Failed to start transaction", buf, 2u);
      }

LABEL_7:
      BOOL v6 = 0;
LABEL_19:
      _Block_object_dispose(&v13, 8);
      goto LABEL_20;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__FLSQLitePersistence_executeInTransactionMultipleSQLStatements___block_invoke;
    v12[3] = &unk_1E6208930;
    v12[4] = self;
    v12[5] = &v13;
    [v4 enumerateObjectsUsingBlock:v12];
    if (*((unsigned char *)v14 + 24))
    {
      errmsg = 0;
      int v7 = sqlite3_exec([(FLSQLitePersistence *)self db], "COMMIT;", 0, 0, &errmsg);
      if (v7)
      {
        id v8 = [(FLSQLitePersistence *)self log];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          int v18 = v7;
          __int16 v19 = 2080;
          uint64_t v20 = errmsg;
          _os_log_error_impl(&dword_1BA2B8000, v8, OS_LOG_TYPE_ERROR, "Failed to commit transaction - error-code: %d error-message: %s", buf, 0x12u);
        }

        sqlite3_free(errmsg);
        goto LABEL_7;
      }
    }
    else if (sqlite3_exec([(FLSQLitePersistence *)self db], "ROLLBACK;", 0, 0, 0))
    {
      id v9 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BA2B8000, v9, OS_LOG_TYPE_ERROR, "Failed to rollback transaction", buf, 2u);
      }
    }
    BOOL v6 = *((unsigned char *)v14 + 24) != 0;
    goto LABEL_19;
  }
  BOOL v6 = 0;
LABEL_20:

  return v6;
}

void __65__FLSQLitePersistence_executeInTransactionMultipleSQLStatements___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  char v7 = objc_msgSend(*(id *)(a1 + 32), "executeSQLStatement:usingTransaction:", objc_msgSend(v6, "UTF8String"), 0);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v8 + 24)) {
    char v9 = v7;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)(v8 + 24) = v9;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *a4 = 1;
    uint64_t v10 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_1BA2B8000, v10, OS_LOG_TYPE_ERROR, "Failed to execute (%@) in set, rolling back", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)executeSQLStatement:(const char *)a3
{
  return [(FLSQLitePersistence *)self executeSQLStatement:a3 usingTransaction:1];
}

- (BOOL)executeSQLStatement:(const char *)a3 usingTransaction:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  errmsg = 0;
  if ([(FLSQLitePersistence *)self db] || (BOOL v7 = [(FLSQLitePersistence *)self open]))
  {
    if (v4 && sqlite3_exec([(FLSQLitePersistence *)self db], "BEGIN TRANSACTION;", 0, 0, 0))
    {
      uint64_t v8 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BA2B8000, v8, OS_LOG_TYPE_ERROR, "Failed to start transaction", buf, 2u);
      }

LABEL_18:
      LOBYTE(v7) = 0;
      return v7;
    }
    int v9 = sqlite3_exec([(FLSQLitePersistence *)self db], a3, 0, 0, &errmsg);
    if (v9)
    {
      int v10 = v9;
      int v11 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        int v18 = a3;
        __int16 v19 = 1024;
        int v20 = v10;
        __int16 v21 = 2080;
        __int16 v22 = errmsg;
        _os_log_error_impl(&dword_1BA2B8000, v11, OS_LOG_TYPE_ERROR, "SQL statement failed - SQL:%s error-code: %d error-message: %s", buf, 0x1Cu);
      }

      sqlite3_free(errmsg);
      if (v4) {
        sqlite3_exec([(FLSQLitePersistence *)self db], "ROLLBACK;", 0, 0, 0);
      }
      goto LABEL_18;
    }
    if (v4)
    {
      int v12 = sqlite3_exec([(FLSQLitePersistence *)self db], "COMMIT;", 0, 0, &errmsg);
      if (v12)
      {
        int v13 = v12;
        int v14 = [(FLSQLitePersistence *)self log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          int v18 = a3;
          __int16 v19 = 1024;
          int v20 = v13;
          __int16 v21 = 2080;
          __int16 v22 = errmsg;
          _os_log_error_impl(&dword_1BA2B8000, v14, OS_LOG_TYPE_ERROR, "SQL statement failed - SQL:%s error-code: %d error-message: %s", buf, 0x1Cu);
        }

        sqlite3_free(errmsg);
        goto LABEL_18;
      }
    }
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)tryPrepare:(const char *)a3 preparedStatement:(sqlite3_stmt *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v6 = sqlite3_prepare_v2([(FLSQLitePersistence *)self db], a3, -1, a4, 0);
  if (v6)
  {
    BOOL v7 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      int v10 = a3;
      __int16 v11 = 1024;
      int v12 = v6;
      _os_log_error_impl(&dword_1BA2B8000, v7, OS_LOG_TYPE_ERROR, "SQLite statement (%s) prep failed: %d", (uint8_t *)&v9, 0x12u);
    }
  }
  return v6 == 0;
}

- (BOOL)tryRolloverBatchIfNecessary:(unint64_t)a3 preferredBatchSize:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(FLSQLitePersistence *)self currentBatchIdentifier];

  if (v7)
  {
    if ([(FLSQLitePersistence *)self currentBatchPayloadSize] <= a4)
    {
      unint64_t v11 = [(FLSQLitePersistence *)self currentBatchPayloadSize] + a3;
      if (v11 <= [(FLSQLitePersistence *)self maxBatchPayloadInBytes])
      {
        int v12 = [(FLSQLitePersistence *)self currentBatchCreationDate];
        [v12 timeIntervalSinceNow];
        double v14 = -v13;
        [(FLSQLitePersistence *)self batchMaximumDuration];
        double v16 = v15;

        if (v16 >= v14)
        {
LABEL_17:
          LOBYTE(v17) = 1;
          return v17;
        }
        uint64_t v8 = [(FLSQLitePersistence *)self log];
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_12;
        }
        id v9 = [(FLSQLitePersistence *)self currentBatchCreationDate];
        [v9 timeIntervalSinceNow];
        uint64_t v22 = v21;
        id v23 = [(FLSQLitePersistence *)self currentBatchIdentifier];
        *(_DWORD *)char v25 = 134218242;
        *(void *)&v25[4] = v22;
        *(_WORD *)&v25[12] = 2080;
        *(void *)&v25[14] = [v23 UTF8String];
        _os_log_error_impl(&dword_1BA2B8000, v8, OS_LOG_TYPE_ERROR, "Batch exceeded maximum allowed life time (%f), rolling over Id(%s).", v25, 0x16u);

        goto LABEL_9;
      }
      uint64_t v8 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [(FLSQLitePersistence *)self currentBatchIdentifier];
        *(_DWORD *)char v25 = 136315138;
        *(void *)&v25[4] = [v9 UTF8String];
        int v10 = "Batch exceeded maximum size, rolling over Id(%s)";
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v8 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [(FLSQLitePersistence *)self currentBatchIdentifier];
        *(_DWORD *)char v25 = 136315138;
        *(void *)&v25[4] = [v9 UTF8String];
        int v10 = "Batch is already larger than preferred size, rolling over Id(%s)";
LABEL_8:
        _os_log_impl(&dword_1BA2B8000, v8, OS_LOG_TYPE_INFO, v10, v25, 0xCu);
LABEL_9:
      }
    }
LABEL_12:
  }
  BOOL v17 = [(FLSQLitePersistence *)self initializeNewBatch];
  if (v17)
  {
    int v18 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v19 = [(FLSQLitePersistence *)self currentBatchIdentifier];
      uint64_t v20 = [v19 UTF8String];
      *(_DWORD *)char v25 = 136315138;
      *(void *)&v25[4] = v20;
      _os_log_debug_impl(&dword_1BA2B8000, v18, OS_LOG_TYPE_DEBUG, "Rolled over to new batch with Id(%s)", v25, 0xCu);
    }
    goto LABEL_17;
  }
  return v17;
}

- (BOOL)open
{
  return [(FLSQLiteDatabaseConnection *)self->_dbConnection open];
}

- (id)persist:(id)a3 preferredBatchSize:(unint64_t)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 <= 0x10000) {
    unint64_t v7 = 0x10000;
  }
  else {
    unint64_t v7 = a4;
  }
  os_signpost_id_t v8 = os_signpost_id_generate((os_log_t)FL_LOG_SIGNPOSTS);
  if ([v6 length] > self->_maxBatchPayloadInBytes)
  {
    id v9 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = [v6 length];
      unint64_t maxBatchPayloadInBytes = self->_maxBatchPayloadInBytes;
      int v40 = 134218240;
      unint64_t v41 = v35;
      __int16 v42 = 2048;
      unint64_t v43 = maxBatchPayloadInBytes;
      _os_log_error_impl(&dword_1BA2B8000, v9, OS_LOG_TYPE_ERROR, "Can't persist blob sizes(%lu) greater than maximum allowed(%llu)", (uint8_t *)&v40, 0x16u);
    }

    int v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = -5;
LABEL_36:
    uint64_t v22 = [v10 errorWithDomain:@"FLErrorDomain" code:v11 userInfo:0];
    goto LABEL_37;
  }
  if (![(FLSQLitePersistence *)self initializeConnectionForUseBy:0])
  {
    uint64_t v24 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v40) = 0;
      _os_log_error_impl(&dword_1BA2B8000, v24, OS_LOG_TYPE_ERROR, "Can't persist, initialization failed", (uint8_t *)&v40, 2u);
    }

    int v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = -4;
    goto LABEL_36;
  }
  if (!-[FLSQLitePersistence tryRolloverBatchIfNecessary:preferredBatchSize:](self, "tryRolloverBatchIfNecessary:preferredBatchSize:", [v6 length], v7))
  {
    char v25 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v40) = 0;
      _os_log_error_impl(&dword_1BA2B8000, v25, OS_LOG_TYPE_ERROR, "Detected necessary rollover, but couldn't succeed, failing persist request", (uint8_t *)&v40, 2u);
    }

    int v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = -6;
    goto LABEL_36;
  }
  sqlite3_reset(self->_insertRecordsStatement);
  sqlite3_bind_text(self->_insertRecordsStatement, 1, [(NSString *)self->_currentBatchIdentifier UTF8String], [(NSString *)self->_currentBatchIdentifier length], 0);
  insertRecordsStatement = self->_insertRecordsStatement;
  id v13 = v6;
  sqlite3_bind_blob(insertRecordsStatement, 2, (const void *)[v13 bytes], objc_msgSend(v13, "length"), 0);
  double v14 = self->_insertRecordsStatement;
  double v15 = objc_opt_new();
  [v15 timeIntervalSince1970];
  sqlite3_bind_int64(v14, 3, (uint64_t)v16);

  int v17 = sqlite3_step(self->_insertRecordsStatement);
  if (v17 == 13)
  {
    uint64_t v26 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      unint64_t v37 = [(FLSQLitePersistence *)self getCurrentDatabaseSize];
      unint64_t maxAllowedDatabaseSizeInBytes = self->_maxAllowedDatabaseSizeInBytes;
      int v40 = 134218240;
      unint64_t v41 = v37;
      __int16 v42 = 2048;
      unint64_t v43 = maxAllowedDatabaseSizeInBytes;
      _os_log_error_impl(&dword_1BA2B8000, v26, OS_LOG_TYPE_ERROR, "Database quota exceeded, using %llu out of %llu bytes, failing persist request", (uint8_t *)&v40, 0x16u);
    }

    uint64_t v27 = (id)FL_LOG_SIGNPOSTS;
    __int16 v28 = v27;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      LOWORD(v40) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2B8000, v28, OS_SIGNPOST_EVENT, v8, "database quota exceeded", "", (uint8_t *)&v40, 2u);
    }

    int v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = -2;
    goto LABEL_36;
  }
  int v18 = v17;
  if (v17 != 101)
  {
    int v29 = (id)FL_LOG_SIGNPOSTS;
    uint64_t v30 = v29;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      LOWORD(v40) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2B8000, v30, OS_SIGNPOST_EVENT, v8, "persist request failed", "", (uint8_t *)&v40, 2u);
    }

    id v31 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v40 = 67109120;
      LODWORD(v41) = v18;
      _os_log_error_impl(&dword_1BA2B8000, v31, OS_LOG_TYPE_ERROR, "SQLite insertion failed: %d", (uint8_t *)&v40, 8u);
    }

    v32 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      unint64_t v39 = sqlite3_errmsg([(FLSQLitePersistence *)self db]);
      int v40 = 136315138;
      unint64_t v41 = (unint64_t)v39;
      _os_log_error_impl(&dword_1BA2B8000, v32, OS_LOG_TYPE_ERROR, "Failure detail: %s", (uint8_t *)&v40, 0xCu);
    }

    id v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = sqlite3_errcode([(FLSQLitePersistence *)self db]);
    int v10 = v33;
    goto LABEL_36;
  }
  id v19 = (id)FL_LOG_SIGNPOSTS;
  uint64_t v20 = v19;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v40) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2B8000, v20, OS_SIGNPOST_EVENT, v8, "data persisted", "", (uint8_t *)&v40, 2u);
  }

  uint64_t v21 = [v13 length];
  uint64_t v22 = 0;
  int64x2_t v23 = vdupq_n_s64(1uLL);
  v23.i64[0] = v21;
  *(int64x2_t *)&self->_currentBatchPayloadSize = vaddq_s64(*(int64x2_t *)&self->_currentBatchPayloadSize, v23);
LABEL_37:

  return v22;
}

- (id)persist:(id)a3
{
  return [(FLSQLitePersistence *)self persist:a3 preferredBatchSize:0];
}

- (BOOL)initializeConnectionForUseBy:(int)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_configured);
  if (v3) {
    return 1;
  }
  uint64_t v4 = *(void *)&a3;
  switch(a3)
  {
    case -1:
      unint64_t v7 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_error_impl(&dword_1BA2B8000, v7, OS_LOG_TYPE_ERROR, "Can't open a connection for unknown user.", (uint8_t *)&v11, 2u);
      }

      goto LABEL_32;
    case 0:
    case 2:
      if (![(FLSQLitePersistence *)self createDatabase])
      {
        os_signpost_id_t v8 = [(FLSQLitePersistence *)self log];
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
      if (![(FLSQLitePersistence *)self prepareSchema])
      {
        os_signpost_id_t v8 = [(FLSQLitePersistence *)self log];
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
      switch(v4)
      {
        case 0:
          [(FLSQLitePersistence *)self setDatabaseSizeLimit];
          if (-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "INSERT INTO records (batchId, payload, dateCreated) VALUES (?, ?, ?);",
                 &self->_insertRecordsStatement)
            && [(FLSQLitePersistence *)self initializeNewBatch])
          {
            goto LABEL_17;
          }
          goto LABEL_29;
        case 2:
          goto LABEL_16;
        case 1:
          goto LABEL_15;
      }
      goto LABEL_17;
    case 1:
      if (![(FLSQLitePersistence *)self open])
      {
        os_signpost_id_t v8 = [(FLSQLitePersistence *)self log];
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
LABEL_31:

          goto LABEL_32;
        }
LABEL_30:
        int v11 = 136315138;
        int v12 = sqlite3_errmsg([(FLSQLitePersistence *)self db]);
        _os_log_error_impl(&dword_1BA2B8000, v8, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v11, 0xCu);
        goto LABEL_31;
      }
      if ([(FLSQLitePersistence *)self isSchemaReady])
      {
LABEL_15:
        [(FLSQLitePersistence *)self closeOrphanedBatches];
LABEL_16:
        if (-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT payload FROM records WHERE batchId=?;",
               &self->_iteratePayloadStatement))
        {
LABEL_17:
          BOOL v6 = 1;
          atomic_store(1u, (unsigned __int8 *)&self->_configured);
          [(FLSQLitePersistence *)self setUser:v4];
          return v6;
        }
LABEL_29:
        os_signpost_id_t v8 = [(FLSQLitePersistence *)self log];
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
      id v9 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_error_impl(&dword_1BA2B8000, v9, OS_LOG_TYPE_ERROR, "Database is not yet initialized by client", (uint8_t *)&v11, 2u);
      }

      [(FLSQLitePersistence *)self closeDatabase];
LABEL_32:
      BOOL v6 = 0;
      break;
    default:
      goto LABEL_17;
  }
  return v6;
}

- (sqlite3)db
{
  return [(FLSQLiteDatabaseConnection *)self->_dbConnection db];
}

- (void)dealloc
{
  if ([(FLSQLitePersistence *)self db])
  {
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_configured);
    if ((v3 & 1) != 0 && ![(FLSQLitePersistence *)self user]) {
      [(FLSQLitePersistence *)self closeOpenBatch];
    }
    [(FLSQLitePersistence *)self finalizeObserver];
    insertRecordsStatement = self->_insertRecordsStatement;
    if (insertRecordsStatement) {
      sqlite3_finalize(insertRecordsStatement);
    }
    iteratePayloadStatement = self->_iteratePayloadStatement;
    if (iteratePayloadStatement) {
      sqlite3_finalize(iteratePayloadStatement);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)FLSQLitePersistence;
  [(FLSQLitePersistence *)&v6 dealloc];
}

- (FLSQLitePersistence)initWithStoreId:(id)a3 loggingContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  os_signpost_id_t v8 = [v6 fileManager];
  id v9 = [v8 urlForStoreWithId:v7];
  int v10 = [v9 path];

  int v11 = [[FLSQLiteDatabaseConnection alloc] initWithStorePath:v10];
  int v12 = [(FLSQLitePersistence *)self initWithStoreId:v7 dbConnection:v11 loggingContext:v6];

  return v12;
}

- (FLSQLitePersistence)initWithStoreId:(id)a3 dbConnection:(id)a4 loggingContext:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)FLSQLitePersistence;
  int v11 = [(FLSQLitePersistence *)&v24 init];
  int v12 = v11;
  if (FLSignpostLoggingInit_onceToken == -1)
  {
    if (!v11) {
      goto LABEL_5;
    }
  }
  else
  {
    dispatch_once(&FLSignpostLoggingInit_onceToken, &__block_literal_global_640);
    if (!v12) {
      goto LABEL_5;
    }
  }
  *(_OWORD *)&v12->_unint64_t maxBatchPayloadInBytes = xmmword_1BA2DF4E0;
  uint64_t v13 = [v9 storePath];
  databasePath = v12->_databasePath;
  v12->_databasePath = (NSString *)v13;

  uint64_t v15 = flLogForObject(v12);
  log = v12->_log;
  v12->_log = (OS_os_log *)v15;

  objc_storeStrong((id *)&v12->_context, a5);
  uint64_t v17 = [v8 copy];
  storeIdentifier = v12->_storeIdentifier;
  v12->_storeIdentifier = (NSString *)v17;

  currentBatchIdentifier = v12->_currentBatchIdentifier;
  v12->_currentBatchIdentifier = 0;

  currentBatchCreationDate = v12->_currentBatchCreationDate;
  v12->_currentBatchCreationDate = 0;

  v12->_currentBatchPayloadSize = 0;
  v12->_currentBatchEventCount = 0;
  v12->_batchMaximumDuration = 900.0;
  objc_storeStrong((id *)&v12->_dbConnection, a4);
  v12->_user = -1;
  v12->_configured = 0;
  uint64_t v21 = v12->_log;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    int64x2_t v23 = v12->_databasePath;
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v23;
    _os_log_debug_impl(&dword_1BA2B8000, v21, OS_LOG_TYPE_DEBUG, "Initialized SQLite persistent store manager for %@", buf, 0xCu);
  }
LABEL_5:

  return v12;
}

- (void)observeInsertionAtRow:(int64_t)a3 observer:(id)a4
{
  id v6 = (void (**)(id, NSObject *))a4;
  ppStmt = 0;
  if (sqlite3_prepare_v2([(FLSQLitePersistence *)self db], "SELECT payload FROM records WHERE rowId=?;",
         -1,
         &ppStmt,
         0)
    || sqlite3_bind_int64(ppStmt, 1, a3)
    || sqlite3_step(ppStmt) != 100)
  {
    id v8 = [(FLSQLitePersistence *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_1BA2B8000, v8, OS_LOG_TYPE_ERROR, "Row insertion observer failed", v9, 2u);
    }
  }
  else
  {
    id v7 = sqlite3_column_blob(ppStmt, 0);
    id v8 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v7, sqlite3_column_bytes(ppStmt, 0));
    v6[2](v6, v8);
    sqlite3_finalize(ppStmt);
  }
}

- (id)registerInsertionObserver:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(FLSQLitePersistence *)self open];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int64_t v21 = 0;
  int64_t v21 = [(FLSQLitePersistence *)self maxRowId];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v17 = v19[3] + 1;
  double v5 = [(FLSQLitePersistence *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = v19[3];
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v11;
    _os_log_debug_impl(&dword_1BA2B8000, v5, OS_LOG_TYPE_DEBUG, "Registering new insertion observer, starting max row: %lld", buf, 0xCu);
  }

  id v6 = [(FLSQLitePersistence *)self context];
  id v7 = [v6 queue];
  id v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v7);

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__FLSQLitePersistence_Observer__registerInsertionObserver___block_invoke;
  v12[3] = &unk_1E62089A8;
  double v14 = &v18;
  uint64_t v15 = v16;
  v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  dispatch_source_set_event_handler(v8, v12);
  dispatch_source_set_timer(v8, 0, 0x3B9ACA00uLL, 0x3B9ACA00uLL);
  dispatch_activate(v8);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

uint64_t __59__FLSQLitePersistence_Observer__registerInsertionObserver___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) maxRowId];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) <= *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                + 24))
  {
    *(void *)&long long v3 = 134217984;
    long long v6 = v3;
    do
    {
      id v4 = objc_msgSend(*(id *)(a1 + 32), "log", v6);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        *(_DWORD *)buf = v6;
        uint64_t v8 = v5;
        _os_log_debug_impl(&dword_1BA2B8000, v4, OS_LOG_TYPE_DEBUG, "Informing observer about insertion at row: %lld", buf, 0xCu);
      }

      uint64_t result = [*(id *)(a1 + 32) observeInsertionAtRow:(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))++ observer:*(void *)(a1 + 40)];
    }
    while (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) <= *(void *)(*(void *)(*(void *)(a1 + 48)
                                                                                                 + 8)
                                                                                     + 24));
  }
  return result;
}

- (int64_t)maxRowId
{
  if (![(FLSQLitePersistence *)self maxRowIdStatement])
  {
    ppStmt = 0;
    if (sqlite3_prepare_v2([(FLSQLitePersistence *)self db], "SELECT MAX(ROWID) FROM records;", -1, &ppStmt, 0) == 1)
    {
      long long v3 = [(FLSQLitePersistence *)self log];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        __int16 v9 = 0;
        id v4 = "Max ID calculation failed to prepare statement";
        uint64_t v5 = (uint8_t *)&v9;
LABEL_12:
        _os_log_error_impl(&dword_1BA2B8000, v3, OS_LOG_TYPE_ERROR, v4, v5, 2u);
        goto LABEL_8;
      }
      goto LABEL_8;
    }
    [(FLSQLitePersistence *)self setMaxRowIdStatement:ppStmt];
  }
  if (sqlite3_step([(FLSQLitePersistence *)self maxRowIdStatement]) != 1)
  {
    sqlite3_int64 v6 = sqlite3_column_int64([(FLSQLitePersistence *)self maxRowIdStatement], 0);
    sqlite3_reset([(FLSQLitePersistence *)self maxRowIdStatement]);
    return v6;
  }
  long long v3 = [(FLSQLitePersistence *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __int16 v8 = 0;
    id v4 = "Max ID calculation failed to run";
    uint64_t v5 = (uint8_t *)&v8;
    goto LABEL_12;
  }
LABEL_8:

  return 0;
}

- (void)finalizeObserver
{
  if ([(FLSQLitePersistence *)self maxRowIdStatement])
  {
    sqlite3_finalize([(FLSQLitePersistence *)self maxRowIdStatement]);
    [(FLSQLitePersistence *)self setMaxRowIdStatement:0];
  }
}

@end