@interface EDProtectedDatabasePersistence
+ (BOOL)_isRecoverableError:(id)a3;
+ (NSString)journalDatabaseName;
+ (NSString)protectedDatabaseName;
+ (OS_os_log)log;
+ (OS_os_log)signpostLog;
+ (id)deleteMergeHandler;
+ (id)replaceMergeHandler;
+ (unint64_t)_resultForConnection:(id)a3 success:(BOOL)a4 error:(id)a5 errorMessage:(id)a6;
- (BOOL)_attachProtectedDatabaseToConnection:(id)a3 withSchema:(id)a4 error:(id *)a5;
- (BOOL)_initializeDatabase:(id)a3 withConnection:(id)a4 schema:(id)a5 error:(id *)a6;
- (BOOL)_isJournalMalformedForSchema:(id)a3 connection:(id)a4;
- (BOOL)_performOnDemandReconciliationForConnection:(id)a3 withSchema:(id)a4;
- (BOOL)_removeExistingDatabaseIDs:(id)a3 withColumn:(id)a4 connection:(id)a5;
- (BOOL)_updateSqliteSequenceForDatabase:(id)a3 schema:(id)a4 withConnection:(id)a5 error:(id *)a6;
- (BOOL)_upgradeJournalWithConnection:(id)a3 schema:(id)a4 error:(id *)a5;
- (BOOL)isInitialized;
- (BOOL)isReconciling;
- (BOOL)protectedDataAvailable;
- (BOOL)supportsJournaling;
- (EDPersistenceDatabaseJournalManager)journalManager;
- (EDPersistenceHookRegistry)hookRegistry;
- (EDProtectedDatabasePersistence)initWithBasePath:(id)a3 hookRegistry:(id)a4;
- (EDProtectedDatabasePersistence)initWithJournalManager:(id)a3 hookRegistry:(id)a4;
- (EFLocked)reconciliationMergeHandlers;
- (OS_dispatch_queue)reconciliationQueue;
- (id)_allReferencingColumnsForTable:(id)a3;
- (id)_databaseIDsToDeleteForTable:(id)a3;
- (id)database;
- (int64_t)_maxRowIDForColumn:(id)a3 withConnection:(id)a4;
- (unint64_t)_deleteRowIDs:(id)a3 fromJournal:(id)a4 withConnection:(id)a5;
- (unint64_t)_executeStatementString:(id)a3 onConnection:(id)a4 errorMessage:(id)a5;
- (unint64_t)_executeUpdateStatement:(id)a3 onConnection:(id)a4 errorMessage:(id)a5;
- (unint64_t)_mergeSchema:(id)a3 connection:(id)a4 journaledRows:(unint64_t *)a5 newRows:(unint64_t *)a6;
- (unint64_t)_mergeTable:(id)a3 connection:(id)a4 journaledRows:(unint64_t *)a5 newRows:(unint64_t *)a6;
- (unint64_t)_reconcileJournalsWithSchema:(id)a3 connection:(id)a4;
- (unint64_t)_runReconciliationWithSchema:(id)a3 connection:(id)a4;
- (unint64_t)signpostID;
- (void)_attachJournalDatabaseToConnection:(id)a3 withSchema:(id)a4;
- (void)_deleteDatabaseIDs:(id)a3 fromTable:(id)a4;
- (void)_detachJournalDatabaseFromConnection:(id)a3;
- (void)_detachProtectedDatabaseFromConnection:(id)a3;
- (void)_ensureJournalIsAttachedToConnection:(id)a3 withSchema:(id)a4;
- (void)_ensureProtectedDatabaseOrJournalIsAttachedToConnection:(id)a3 withSchema:(id)a4;
- (void)attachProtectedOrJournalDatabaseToConnectionIfNecessary:(id)a3 withSchema:(id)a4;
- (void)detachProtectedOrJournalDatabaseFromConnectionIfNecessary:(id)a3;
- (void)reconcileJournalsWithSchema:(id)a3 completionBlock:(id)a4;
- (void)registerMergeHandler:(id)a3 forTable:(id)a4;
- (void)scheduleRecurringActivity;
- (void)setDatabase:(id)a3;
- (void)setIsInitialized:(BOOL)a3;
- (void)setIsReconciling:(BOOL)a3;
- (void)test_tearDown;
@end

@implementation EDProtectedDatabasePersistence

- (BOOL)protectedDataAvailable
{
  v2 = [(EDProtectedDatabasePersistence *)self database];
  char v3 = [v2 protectedDatabaseIsAvailable];

  return v3;
}

- (id)database
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_database);

  return WeakRetained;
}

- (void)detachProtectedOrJournalDatabaseFromConnectionIfNecessary:(id)a3
{
  id v5 = a3;
  v4 = (void *)MEMORY[0x1E0190280]();
  if ([(EDProtectedDatabasePersistence *)self supportsJournaling]
    && [v5 protectedDatabaseAttached]
    && ![(EDProtectedDatabasePersistence *)self protectedDataAvailable])
  {
    [(EDProtectedDatabasePersistence *)self _detachProtectedDatabaseFromConnection:v5];
  }
}

- (void)attachProtectedOrJournalDatabaseToConnectionIfNecessary:(id)a3 withSchema:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E0190280]();
  if ([(EDProtectedDatabasePersistence *)self supportsJournaling])
  {
    if (![(EDProtectedDatabasePersistence *)self protectedDataAvailable])
    {
      if ([v7 protectedDatabaseAttached])
      {
        [(EDProtectedDatabasePersistence *)self _detachProtectedDatabaseFromConnection:v7];
      }
      else if ([v7 journalDatabaseAttached])
      {
        goto LABEL_19;
      }
      [(EDProtectedDatabasePersistence *)self _attachJournalDatabaseToConnection:v7 withSchema:v8];
      goto LABEL_19;
    }
    if (([v7 protectedDatabaseAttached] & 1) == 0)
    {
      if ([v7 journalDatabaseAttached])
      {
        if ([(EDProtectedDatabasePersistence *)self _performOnDemandReconciliationForConnection:v7 withSchema:v8])
        {
          [(EDProtectedDatabasePersistence *)self _ensureProtectedDatabaseOrJournalIsAttachedToConnection:v7 withSchema:v8];
        }
        else
        {
          [(EDProtectedDatabasePersistence *)self _ensureJournalIsAttachedToConnection:v7 withSchema:v8];
        }
      }
      else
      {
        id v18 = 0;
        BOOL v10 = [(EDProtectedDatabasePersistence *)self _attachProtectedDatabaseToConnection:v7 withSchema:v8 error:&v18];
        id v11 = v18;
        if (!v10)
        {
          if (+[EDProtectedDatabasePersistence _isRecoverableError:v11])
          {
            v12 = +[EDProtectedDatabasePersistence log];
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              v14 = objc_msgSend(v11, "ef_publicDescription");
              int v15 = EFProtectedDataAvailable();
              v16 = [(EDProtectedDatabasePersistence *)self database];
              int v17 = [v16 protectedDatabaseIsAvailable];
              *(_DWORD *)buf = 138543874;
              v20 = v14;
              __int16 v21 = 1024;
              int v22 = v15;
              __int16 v23 = 1024;
              int v24 = v17;
              _os_log_error_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_ERROR, "Got error %{public}@ attaching protected database.  ProtectedDataAvailable = %d, protectedDatabaseIsAvailable = %d", buf, 0x18u);
            }
            [(EDProtectedDatabasePersistence *)self _attachJournalDatabaseToConnection:v7 withSchema:v8];
          }
          else
          {
            [v7 handleError:v11 message:@"Unable to attach protected database"];
            v13 = [MEMORY[0x1E4F28B00] currentHandler];
            [v13 handleFailureInMethod:a2 object:self file:@"EDProtectedDatabasePersistence.m" lineNumber:142 description:@"Unable to attach protected database"];
          }
        }
      }
    }
  }
LABEL_19:
}

- (BOOL)_attachProtectedDatabaseToConnection:(id)a3 withSchema:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(id)objc_opt_class() protectedDatabaseName];
  int v11 = [v8 attachProtectedDatabaseWithName:v10 error:a5];

  if (!v11) {
    goto LABEL_9;
  }
  os_unfair_lock_lock(&self->_initializationLock);
  if ([(EDProtectedDatabasePersistence *)self isInitialized])
  {
    os_unfair_lock_unlock(&self->_initializationLock);
  }
  else
  {
    v12 = [(id)objc_opt_class() protectedDatabaseName];
    BOOL v13 = [(EDProtectedDatabasePersistence *)self _initializeDatabase:v12 withConnection:v8 schema:v9 error:a5];

    [(EDProtectedDatabasePersistence *)self setIsInitialized:v13];
    os_unfair_lock_unlock(&self->_initializationLock);
    if (!v13)
    {
LABEL_8:
      [v8 detachProtectedDatabase];
LABEL_9:
      BOOL v16 = 0;
      goto LABEL_10;
    }
  }
  if ([v8 isWriter])
  {
    v14 = [(id)objc_opt_class() protectedDatabaseName];
    BOOL v15 = [(EDProtectedDatabasePersistence *)self _updateSqliteSequenceForDatabase:v14 schema:v9 withConnection:v8 error:a5];

    if (!v15) {
      goto LABEL_8;
    }
  }
  BOOL v16 = 1;
LABEL_10:

  return v16;
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EDProtectedDatabasePersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_74 != -1) {
    dispatch_once(&log_onceToken_74, block);
  }
  v2 = (void *)log_log_74;

  return (OS_os_log *)v2;
}

void __37__EDProtectedDatabasePersistence_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_74;
  log_log_74 = (uint64_t)v1;
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__EDProtectedDatabasePersistence_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_6 != -1) {
    dispatch_once(&signpostLog_onceToken_6, block);
  }
  v2 = (void *)signpostLog_log_6;

  return (OS_os_log *)v2;
}

void __45__EDProtectedDatabasePersistence_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_6;
  signpostLog_log_6 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (NSString)protectedDatabaseName
{
}

+ (NSString)journalDatabaseName
{
}

+ (id)deleteMergeHandler
{
  return +[_EDDeleteReconciliationMergeHandler sharedInstance];
}

+ (id)replaceMergeHandler
{
  return +[_EDReplaceReconciliationMergeHandler sharedInstance];
}

- (EDProtectedDatabasePersistence)initWithBasePath:(id)a3 hookRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[EDPersistenceDatabaseJournalManager alloc] initWithBasePath:v6];
  id v9 = [(EDProtectedDatabasePersistence *)self initWithJournalManager:v8 hookRegistry:v7];

  return v9;
}

- (EDProtectedDatabasePersistence)initWithJournalManager:(id)a3 hookRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)EDProtectedDatabasePersistence;
  id v9 = [(EDProtectedDatabasePersistence *)&v20 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_journalManager, a3);
    objc_storeStrong((id *)&v10->_hookRegistry, a4);
    int v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.email.protectedDatabasePersistence.reconciliationQueue", v12);
    reconciliationQueue = v10->_reconciliationQueue;
    v10->_reconciliationQueue = (OS_dispatch_queue *)v13;

    *(void *)&v10->_initializationLock._os_unfair_lock_opaque = 0;
    id v15 = objc_alloc(MEMORY[0x1E4F60DA0]);
    BOOL v16 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    uint64_t v17 = [v15 initWithObject:v16];
    reconciliationMergeHandlers = v10->_reconciliationMergeHandlers;
    v10->_reconciliationMergeHandlers = (EFLocked *)v17;
  }
  return v10;
}

- (void)setDatabase:(id)a3
{
}

- (void)_ensureJournalIsAttachedToConnection:(id)a3 withSchema:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 protectedDatabaseAttached]) {
    [(EDProtectedDatabasePersistence *)self _detachProtectedDatabaseFromConnection:v7];
  }
  if (([v7 journalDatabaseAttached] & 1) == 0) {
    [(EDProtectedDatabasePersistence *)self _attachJournalDatabaseToConnection:v7 withSchema:v6];
  }
}

- (void)_ensureProtectedDatabaseOrJournalIsAttachedToConnection:(id)a3 withSchema:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 protectedDatabaseAttached])
  {
    id v9 = 0;
    goto LABEL_4;
  }
  id v17 = 0;
  BOOL v10 = [(EDProtectedDatabasePersistence *)self _attachProtectedDatabaseToConnection:v7 withSchema:v8 error:&v17];
  id v9 = v17;
  if (v10)
  {
LABEL_4:
    if ([v7 journalDatabaseAttached]) {
      [(EDProtectedDatabasePersistence *)self _detachJournalDatabaseFromConnection:v7];
    }
    goto LABEL_12;
  }
  if (+[EDProtectedDatabasePersistence _isRecoverableError:v9])
  {
    int v11 = +[EDProtectedDatabasePersistence log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      dispatch_queue_t v13 = objc_msgSend(v9, "ef_publicDescription");
      int v14 = EFProtectedDataAvailable();
      id v15 = [(EDProtectedDatabasePersistence *)self database];
      int v16 = [v15 protectedDatabaseIsAvailable];
      *(_DWORD *)buf = 138543874;
      v19 = v13;
      __int16 v20 = 1024;
      int v21 = v14;
      __int16 v22 = 1024;
      int v23 = v16;
      _os_log_error_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_ERROR, "Got error %{public}@ attaching protected database.  ProtectedDataAvailable = %d, protectedDatabaseIsAvailable = %d", buf, 0x18u);
    }
    if (([v7 journalDatabaseAttached] & 1) == 0) {
      [(EDProtectedDatabasePersistence *)self _attachJournalDatabaseToConnection:v7 withSchema:v8];
    }
  }
  else
  {
    [v7 handleError:v9 message:@"Unable to attach protected database"];
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"EDProtectedDatabasePersistence.m" lineNumber:214 description:@"Unable to attach protected database"];
  }
LABEL_12:
}

- (void)_detachProtectedDatabaseFromConnection:(id)a3
{
}

- (void)_attachJournalDatabaseToConnection:(id)a3 withSchema:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 isWriter])
  {
    id v9 = [(EDProtectedDatabasePersistence *)self journalManager];
    BOOL v10 = [v9 currentJournalCreateIfNeeded:1];

    int v11 = [(id)objc_opt_class() journalDatabaseName];
    int v12 = [v7 attachJournalDatabase:v10 withName:v11];

    if (v12)
    {
      dispatch_queue_t v13 = [(id)objc_opt_class() journalDatabaseName];
      id v22 = 0;
      BOOL v14 = [(EDProtectedDatabasePersistence *)self _initializeDatabase:v13 withConnection:v7 schema:v8 error:&v22];
      id v15 = v22;

      if (v14)
      {
        int v16 = [(id)objc_opt_class() journalDatabaseName];
        id v21 = v15;
        BOOL v17 = [(EDProtectedDatabasePersistence *)self _updateSqliteSequenceForDatabase:v16 schema:v8 withConnection:v7 error:&v21];
        id v18 = v21;

        id v15 = v18;
        if (v17) {
          goto LABEL_9;
        }
      }
      v19 = +[EDProtectedDatabasePersistence log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[EDProtectedDatabasePersistence _attachJournalDatabaseToConnection:withSchema:](v19);
      }

      [v7 detachJournalDatabase];
      __int16 v20 = [(EDProtectedDatabasePersistence *)self journalManager];
      [v20 mergedJournal:v10];

      [v7 handleError:v15 message:@"Initializing journal database"];
    }
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"EDProtectedDatabasePersistence.m" lineNumber:271 description:@"Unable to attach journal database"];
LABEL_9:
  }
}

- (void)_detachJournalDatabaseFromConnection:(id)a3
{
  id v6 = a3;
  if (([v6 detachJournalDatabase] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"EDProtectedDatabasePersistence.m" lineNumber:277 description:@"Unable to detach journal database"];
  }
}

- (BOOL)_initializeDatabase:(id)a3 withConnection:(id)a4 schema:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"PRAGMA %@.journal_mode = WAL;",
                  v9);
  dispatch_queue_t v13 = [v10 sqlConnection];
  int v14 = [v13 executeStatementString:v12 error:a6];

  if (v14)
  {
    id v15 = [v11 definitionWithDatabaseName:v9];
    int v16 = [v10 sqlConnection];
    char v17 = [v16 executeStatementString:v15 error:a6];
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (BOOL)_upgradeJournalWithConnection:(id)a3 schema:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(id)objc_opt_class() journalDatabaseName];
  LOBYTE(a5) = [(EDProtectedDatabasePersistence *)self _initializeDatabase:v10 withConnection:v8 schema:v9 error:a5];

  return (char)a5;
}

- (BOOL)_updateSqliteSequenceForDatabase:(id)a3 schema:(id)a4 withConnection:(id)a5 error:(id *)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v45 = a4;
  id v9 = a5;
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v42 = (void *)[[NSString alloc] initWithFormat:@"SELECT name FROM %@.sqlite_sequence", v50];
  id v10 = objc_msgSend(v9, "preparedStatementForQueryString:");
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __95__EDProtectedDatabasePersistence__updateSqliteSequenceForDatabase_schema_withConnection_error___block_invoke;
  v62[3] = &unk_1E6BFF3B0;
  id v53 = v44;
  id v63 = v53;
  v43 = v10;
  if ([v10 executeUsingBlock:v62 error:a6])
  {
    v47 = (void *)[[NSString alloc] initWithFormat:@"%@.sqlite_sequence", v50];
    v46 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:v47];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    obuint64_t j = [v45 tables];
    uint64_t v11 = [obj countByEnumeratingWithState:&v58 objects:v71 count:16];
    if (v11)
    {
      uint64_t v51 = *(void *)v59;
      do
      {
        uint64_t v52 = v11;
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v59 != v51) {
            objc_enumerationMutation(obj);
          }
          dispatch_queue_t v13 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          int v14 = [(EDProtectedDatabasePersistence *)self _allReferencingColumnsForTable:v13];
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v15 = v14;
          int64_t v16 = 0;
          uint64_t v17 = [v15 countByEnumeratingWithState:&v54 objects:v70 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v55;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v55 != v18) {
                  objc_enumerationMutation(v15);
                }
                int64_t v20 = [(EDProtectedDatabasePersistence *)self _maxRowIDForColumn:*(void *)(*((void *)&v54 + 1) + 8 * j) withConnection:v9];
                if (v16 <= v20) {
                  int64_t v16 = v20;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v54 objects:v70 count:16];
            }
            while (v17);
          }

          id v21 = [v13 name];
          int64_t v22 = +[EDTableMetadataPersistence largestDeletedRowIDForTableName:v21 withConnection:v9];

          int v23 = +[EDProtectedDatabasePersistence log];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = [v13 name];
            *(_DWORD *)buf = 138412802;
            v65 = v24;
            __int16 v66 = 2048;
            int64_t v67 = v16;
            __int16 v68 = 2048;
            int64_t v69 = v22;
            _os_log_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_DEFAULT, "%@: maxRowID: %lld, largestDeletedRowID: %lld", buf, 0x20u);
          }
          if (v16 <= v22) {
            int64_t v25 = v22;
          }
          else {
            int64_t v25 = v16;
          }
          v26 = [v13 name];
          int v27 = [v53 containsObject:v26];

          if (v27)
          {
            v28 = +[EDProtectedDatabasePersistence log];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = [v13 fullNameWithDatabaseName:v50];
              *(_DWORD *)buf = 138543618;
              v65 = v29;
              __int16 v66 = 2048;
              int64_t v67 = v25;
              _os_log_impl(&dword_1DB39C000, v28, OS_LOG_TYPE_DEFAULT, "Updating sqlite_sequence %{public}@ = %lld", buf, 0x16u);
            }
            v30 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:v47];
            v31 = [NSNumber numberWithLongLong:v25];
            [v30 setObject:v31 forKeyedSubscript:@"seq"];

            v32 = (void *)[objc_alloc(MEMORY[0x1E4F60E78]) initWithName:@"name"];
            v33 = [v13 name];
            uint64_t v34 = [v32 equalTo:v33];
            [v30 setWhereClause:v34];

            LOBYTE(v34) = [v9 executeUpdateStatement:v30 error:a6];
            if ((v34 & 1) == 0)
            {

              char v40 = 0;
              goto LABEL_33;
            }
          }
          else
          {
            v35 = +[EDProtectedDatabasePersistence log];
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v36 = [v13 fullNameWithDatabaseName:v50];
              *(_DWORD *)buf = 138543618;
              v65 = v36;
              __int16 v66 = 2048;
              int64_t v67 = v25;
              _os_log_impl(&dword_1DB39C000, v35, OS_LOG_TYPE_DEFAULT, "Setting sqlite_sequence %{public}@ = %lld", buf, 0x16u);
            }
            v37 = [v46 addValue];
            v38 = [v13 name];
            [v37 setObject:v38 forKeyedSubscript:@"name"];

            v39 = [NSNumber numberWithLongLong:v25];
            [v37 setObject:v39 forKeyedSubscript:@"seq"];
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v58 objects:v71 count:16];
      }
      while (v11);
    }

    char v40 = [v9 executeInsertStatement:v46 error:a6];
LABEL_33:
  }
  else
  {
    char v40 = 0;
  }

  return v40;
}

void __95__EDProtectedDatabasePersistence__updateSqliteSequenceForDatabase_schema_withConnection_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 objectAtIndexedSubscript:0];
  id v3 = [v4 stringValue];
  [v2 addObject:v3];
}

- (int64_t)_maxRowIDForColumn:(id)a3 withConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v21 = 0;
  int64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  id v7 = [NSString alloc];
  id v8 = [v5 name];
  uint64_t v9 = [v5 table];
  id v10 = [(id)v9 name];
  uint64_t v11 = (void *)[v7 initWithFormat:@"SELECT max(%@) FROM %@", v8, v10];

  int v12 = [v6 preparedStatementForQueryString:v11];
  id v19 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__EDProtectedDatabasePersistence__maxRowIDForColumn_withConnection___block_invoke;
  v20[3] = &unk_1E6BFF4C8;
  v20[4] = &v21;
  LOBYTE(v9) = [v12 executeUsingBlock:v20 error:&v19];
  id v13 = v19;
  if ((v9 & 1) == 0)
  {
    id v14 = [NSString alloc];
    id v15 = [v5 fullNameWithDatabaseName:0];
    int64_t v16 = (void *)[v14 initWithFormat:@"Finding max %@", v15];

    [v6 handleError:v13 message:v16];
  }
  int64_t v17 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v17;
}

void __68__EDProtectedDatabasePersistence__maxRowIDForColumn_withConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v6 = [v7 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 databaseIDValue];

  *a4 = 1;
}

- (BOOL)_performOnDemandReconciliationForConnection:(id)a3 withSchema:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v8 = +[EDProtectedDatabasePersistence log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      uint64_t v9 = "Skipping on-demand reconciliation from the main thread";
LABEL_10:
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if ((EFProtectedDataAvailable() & 1) == 0)
  {
    id v8 = +[EDProtectedDatabasePersistence log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      uint64_t v9 = "Skipping on-demand reconciliation because protected data isn't available";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  os_unfair_lock_lock(&self->_reconciliationLock);
  if ([(EDProtectedDatabasePersistence *)self isReconciling])
  {
    os_unfair_lock_unlock(&self->_reconciliationLock);
    id v8 = +[EDProtectedDatabasePersistence log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      uint64_t v9 = "Skipping on-demand reconciliation because we're already reconciling";
      goto LABEL_10;
    }
LABEL_11:
    BOOL v10 = 1;
    goto LABEL_12;
  }
  [(EDProtectedDatabasePersistence *)self setIsReconciling:1];
  os_unfair_lock_unlock(&self->_reconciliationLock);
  int v12 = +[EDProtectedDatabasePersistence log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Triggering on-demand reconciliation", (uint8_t *)&v15, 2u);
  }

  id v8 = [MEMORY[0x1E4F60E10] transactionWithDescription:@"on-demand reconciliation"];
  unint64_t v13 = [(EDProtectedDatabasePersistence *)self _reconcileJournalsWithSchema:v7 connection:v6];
  BOOL v10 = v13 == 0;
  id v14 = +[EDProtectedDatabasePersistence log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    unint64_t v16 = v13;
    _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Completed on-demand reconciliation with result: %lu", (uint8_t *)&v15, 0xCu);
  }

  [v8 invalidate];
LABEL_12:

  return v10;
}

- (void)reconcileJournalsWithSchema:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_reconciliationLock);
  if (![(EDProtectedDatabasePersistence *)self isReconciling])
  {
    [(EDProtectedDatabasePersistence *)self setIsReconciling:1];
    os_unfair_lock_unlock(&self->_reconciliationLock);
    BOOL v10 = +[EDProtectedDatabasePersistence log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Triggering reconciliation", buf, 2u);
    }

    uint64_t v11 = [MEMORY[0x1E4F60E10] transactionWithDescription:@"reconciliation"];
    reconciliationQueue = self->_reconciliationQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__EDProtectedDatabasePersistence_reconcileJournalsWithSchema_completionBlock___block_invoke;
    v15[3] = &unk_1E6C03B20;
    v15[4] = self;
    id v16 = v6;
    id v17 = v11;
    id v18 = v7;
    id v9 = v11;
    dispatch_async(reconciliationQueue, v15);

    goto LABEL_7;
  }
  os_unfair_lock_unlock(&self->_reconciliationLock);
  if (v7)
  {
    id v8 = self->_reconciliationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__EDProtectedDatabasePersistence_reconcileJournalsWithSchema_completionBlock___block_invoke_62;
    block[3] = &unk_1E6C009C8;
    id v14 = v7;
    dispatch_async(v8, block);
    id v9 = v14;
LABEL_7:
  }
}

uint64_t __78__EDProtectedDatabasePersistence_reconcileJournalsWithSchema_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _reconcileJournalsWithSchema:*(void *)(a1 + 40) connection:0];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  id v4 = +[EDProtectedDatabasePersistence log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = v2;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Completed reconciliation with result: %lu", (uint8_t *)&v6, 0xCu);
  }

  return [*(id *)(a1 + 48) invalidate];
}

uint64_t __78__EDProtectedDatabasePersistence_reconcileJournalsWithSchema_completionBlock___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)_reconcileJournalsWithSchema:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E0190280]();
  if ([v7 isWriter])
  {
    id v9 = v7;
  }
  else
  {
    BOOL v10 = [(EDProtectedDatabasePersistence *)self database];
    id v9 = [v10 checkOutConnectionIsWriter:1];
  }
  unint64_t v11 = [(EDProtectedDatabasePersistence *)self _runReconciliationWithSchema:v6 connection:v9];
  if (v9 != v7)
  {
    int v12 = [(EDProtectedDatabasePersistence *)self database];
    [v12 checkInConnection:v9];
  }
  [(EDProtectedDatabasePersistence *)self finishJournalReconciliation:v11];
  os_unfair_lock_lock(&self->_reconciliationLock);
  [(EDProtectedDatabasePersistence *)self setIsReconciling:0];
  os_unfair_lock_unlock(&self->_reconciliationLock);
  if (!v11)
  {
    unint64_t v13 = [(EDProtectedDatabasePersistence *)self hookRegistry];
    [v13 persistenceDidReconcileProtectedData];
  }

  return v11;
}

- (unint64_t)_runReconciliationWithSchema:(id)a3 connection:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v42 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  uint64_t v8 = +[EDProtectedDatabasePersistence signpostLog];
  os_signpost_id_t v9 = [(EDProtectedDatabasePersistence *)self signpostID];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EDProtectedDatabasePersistenceReconciliation", "Starting reconciliation of protected data", buf, 2u);
  }

  if (![(EDProtectedDatabasePersistence *)self protectedDataAvailable])
  {
    unint64_t v24 = 1;
    goto LABEL_49;
  }
  if ([v7 journalDatabaseAttached]) {
    [(EDProtectedDatabasePersistence *)self _detachJournalDatabaseFromConnection:v7];
  }
  if (([v7 protectedDatabaseAttached] & 1) == 0)
  {
    id v47 = 0;
    BOOL v10 = [(EDProtectedDatabasePersistence *)self _attachProtectedDatabaseToConnection:v7 withSchema:v6 error:&v47];
    id v11 = v47;
    int v12 = v11;
    if (!v10)
    {
      unint64_t v24 = +[EDProtectedDatabasePersistence _resultForConnection:v7 success:0 error:v11 errorMessage:@"Unable to attach protected database"];

      goto LABEL_49;
    }
  }
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  unint64_t v13 = [(EDProtectedDatabasePersistence *)self journalManager];
  id v14 = [v13 oldestJournal];
  if (!v14)
  {
LABEL_33:
    unint64_t v24 = 0;
    goto LABEL_43;
  }
  *(void *)&long long v15 = 134217984;
  long long v41 = v15;
  while (1)
  {
    id v16 = +[EDProtectedDatabasePersistence log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v14 number];
      *(_DWORD *)buf = v41;
      uint64_t v53 = v17;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Reconciling journal %lu", buf, 0xCu);
    }

    id v18 = [(id)objc_opt_class() journalDatabaseName];
    id v44 = 0;
    char v19 = [v7 attachJournalDatabase:v14 withName:v18 error:&v44];
    id v20 = v44;

    if ((v19 & 1) == 0) {
      break;
    }
    id v43 = v20;
    BOOL v21 = [(EDProtectedDatabasePersistence *)self _upgradeJournalWithConnection:v7 schema:v6 error:&v43];
    id v22 = v43;

    id v20 = v22;
    if (!v21)
    {
      uint64_t v34 = +[EDProtectedDatabasePersistence log];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = [v14 number];
        v36 = objc_msgSend(v22, "ef_publicDescription");
        -[EDProtectedDatabasePersistence _runReconciliationWithSchema:connection:](v36, (uint64_t)buf, v35);
      }

      unint64_t v33 = +[EDProtectedDatabasePersistence _resultForConnection:v7 success:0 error:v22 errorMessage:@"Upgrading journal for merging"];
      goto LABEL_41;
    }
    unint64_t v23 = [(EDProtectedDatabasePersistence *)self _mergeSchema:v6 connection:v7 journaledRows:&v46 newRows:&v45];
    unint64_t v24 = v23;
    if (v23 == 2)
    {
      if ([(EDProtectedDatabasePersistence *)self _isJournalMalformedForSchema:v6 connection:v7])
      {
        int64_t v25 = +[EDProtectedDatabasePersistence log];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = [v14 number];
          *(_DWORD *)buf = v41;
          uint64_t v53 = v28;
          _os_log_error_impl(&dword_1DB39C000, v25, OS_LOG_TYPE_ERROR, "Skipped merging data due to malformed schema for journal %lu", buf, 0xCu);
        }
        unint64_t v24 = 0;
      }
      else
      {
        int64_t v25 = +[EDProtectedDatabasePersistence log];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = [v14 number];
          *(_DWORD *)buf = v41;
          uint64_t v53 = v29;
          _os_log_error_impl(&dword_1DB39C000, v25, OS_LOG_TYPE_ERROR, "Permanently failed to merge data for journal %lu", buf, 0xCu);
        }
        unint64_t v24 = 2;
      }
    }
    else
    {
      if (v23 != 1) {
        goto LABEL_29;
      }
      int64_t v25 = +[EDProtectedDatabasePersistence log];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = [v14 number];
        *(_DWORD *)buf = v41;
        uint64_t v53 = v27;
        _os_log_error_impl(&dword_1DB39C000, v25, OS_LOG_TYPE_ERROR, "Temporarily failed to merge data for journal %lu", buf, 0xCu);
      }
      unint64_t v24 = 1;
    }

LABEL_29:
    [(EDProtectedDatabasePersistence *)self _detachJournalDatabaseFromConnection:v7];
    if (v24) {
      goto LABEL_42;
    }
    [v13 mergedJournal:v14];
    uint64_t v26 = [v13 oldestJournal];

    id v14 = (void *)v26;
    if (!v26) {
      goto LABEL_33;
    }
  }
  v30 = +[EDProtectedDatabasePersistence log];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    uint64_t v31 = [v14 number];
    v32 = objc_msgSend(v20, "ef_publicDescription");
    -[EDProtectedDatabasePersistence _runReconciliationWithSchema:connection:](v32, (uint64_t)buf, v31);
  }

  unint64_t v33 = +[EDProtectedDatabasePersistence _resultForConnection:v7 success:0 error:v20 errorMessage:@"Attaching journal for merging"];
LABEL_41:
  unint64_t v24 = v33;
LABEL_42:

LABEL_43:
  v37 = +[EDProtectedDatabasePersistence signpostLog];
  os_signpost_id_t v38 = [(EDProtectedDatabasePersistence *)self signpostID];
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_DWORD *)v48 = 134349312;
    uint64_t v49 = v46;
    __int16 v50 = 2050;
    uint64_t v51 = v45;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v37, OS_SIGNPOST_INTERVAL_END, v38, "EDProtectedDatabasePersistenceReconciliation", "TotalJournaledRows=%{public,signpost.telemetry:number1}lu, NewJournaledRows=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", v48, 0x16u);
  }

  [v42 timeIntervalSinceNow];
  if (v39 < -10.0) {
    EFSaveTailspin();
  }

LABEL_49:
  return v24;
}

- (unint64_t)_mergeSchema:(id)a3 connection:(id)a4 journaledRows:(unint64_t *)a5 newRows:(unint64_t *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = [a3 tables];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v21;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v11);
      }
      uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * v14);
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      unint64_t v16 = [(EDProtectedDatabasePersistence *)self _mergeTable:v15 connection:v10 journaledRows:&v19 newRows:&v18];
      if (v16) {
        break;
      }
      if (a5) {
        *a5 += v19;
      }
      if (a6) {
        *a6 += v18;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    unint64_t v16 = 0;
  }

  return v16;
}

- (unint64_t)_mergeTable:(id)a3 connection:(id)a4 journaledRows:(unint64_t *)a5 newRows:(unint64_t *)a6
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v45 = a4;
  uint64_t v46 = v8;
  uint64_t v49 = self;
  os_signpost_id_t v9 = [(id)objc_opt_class() journalDatabaseName];
  id v44 = [v8 fullNameWithDatabaseName:v9];

  id v10 = [(id)objc_opt_class() protectedDatabaseName];
  id v43 = [v8 fullNameWithDatabaseName:v10];

  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  v48 = [(EDProtectedDatabasePersistence *)v49 _allReferencingColumnsForTable:v8];
  id v11 = [v8 uniqueColumns];
  id v47 = [v11 firstObject];

  if (v47)
  {
    uint64_t v12 = +[EDProtectedDatabasePersistence log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v8 name];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v47;
      *(_WORD *)&buf[22] = 2114;
      v86 = v48;
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_INFO, "Merging table %{public}@ with unique columns: %{public}@\n  referencing columns: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v12 = +[EDProtectedDatabasePersistence log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [v8 name];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_INFO, "Merging table %{public}@ without unique columns", buf, 0xCu);
    }
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  v86 = 0;
  unint64_t v39 = 0;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  uint64_t v80 = 0;
  uint64_t v15 = &v77;
  do
  {
    v15[3] = 0;
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v76 = 0;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke;
    v64[3] = &unk_1E6C04BB0;
    id v17 = v44;
    id v65 = v17;
    id v18 = v47;
    id v66 = v18;
    id v19 = v43;
    SEL v75 = a2;
    id v67 = v19;
    __int16 v68 = v49;
    id v20 = v16;
    id v69 = v20;
    uint64_t v72 = &v77;
    v73 = &v81;
    id v21 = v46;
    id v70 = v21;
    id v22 = v45;
    id v71 = v22;
    v74 = buf;
    uint64_t v23 = [v22 performWithOptions:3 transactionError:&v76 block:v64];
    id v24 = v76;
    char v40 = v19;
    long long v41 = v18;
    if (v82[3]
      || (unint64_t v25 = +[EDProtectedDatabasePersistence _resultForConnection:v22 success:v23 error:v24 errorMessage:@"Committing merge batch transaction"], (v82[3] = v25) != 0))
    {
      int v26 = 0;
    }
    else
    {
      uint64_t v27 = &v60;
      uint64_t v60 = 0;
      long long v61 = &v60;
      uint64_t v62 = 0x2020000000;
      uint64_t v63 = 0;
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = v24;
      do
      {
        v27[3] = 0;
        id v59 = v29;
        v50[0] = v28;
        v50[1] = 3221225472;
        v50[2] = __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_95;
        v50[3] = &unk_1E6C04C00;
        id v51 = v20;
        id v52 = v21;
        id v30 = v48;
        long long v57 = &v81;
        id v53 = v30;
        uint64_t v54 = v49;
        id v31 = v22;
        id v55 = v31;
        long long v58 = &v60;
        id v56 = v17;
        uint64_t v32 = [v31 performWithOptions:3 transactionError:&v59 block:v50];
        id v24 = v59;

        unint64_t v33 = v82[3];
        if (!v33)
        {
          unint64_t v33 = +[EDProtectedDatabasePersistence _resultForConnection:v31 success:v32 error:v24 errorMessage:@"Committing update batch transaction"];
          v82[3] = v33;
        }
        BOOL v34 = v33 == 0;

        if (!v34) {
          break;
        }
        uint64_t v27 = v61;
        uint64_t v29 = v24;
      }
      while (v61[3]);
      if (!v82[3]) {
        v39 += v78[3];
      }
      _Block_object_dispose(&v60, 8);
      int v26 = 1;
    }

    if (!v26) {
      break;
    }
    uint64_t v15 = v78;
  }
  while (v78[3]);
  if (a5) {
    *a5 = v39;
  }
  if (a6) {
    *a6 = *(void *)(*(void *)&buf[8] + 24);
  }
  unint64_t v35 = v82[3];
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v81, 8);
  return v35;
}

BOOL __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v35 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v4 = *MEMORY[0x1E4F60D08];
  id v5 = (void *)[v3 initWithResultColumn:*MEMORY[0x1E4F60D08] table:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) count])
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_2;
    v41[3] = &unk_1E6C04B60;
    id v6 = *(void **)(a1 + 40);
    id v42 = *(id *)(a1 + 48);
    id v43 = *(id *)(a1 + 32);
    id v7 = objc_msgSend(v6, "ef_map:", v41);
    if (![v7 count])
    {
      BOOL v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:*(void *)(a1 + 112) object:*(void *)(a1 + 56) file:@"EDProtectedDatabasePersistence.m" lineNumber:596 description:@"We must have at least one join constraint"];
    }
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F60E48]) initWithExpressions:v7];
    os_signpost_id_t v9 = [v5 leftOuterJoin:*(void *)(a1 + 48) on:v8];
    [v9 addResultColumn:v4];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
    [v5 addResult:v10 alias:v4];
  }
  [v5 setLimit:500];
  id v11 = objc_alloc_init(MEMORY[0x1E4F60DB8]);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_3;
  v37[3] = &unk_1E6C04B88;
  id v38 = *(id *)(a1 + 64);
  id v12 = v11;
  uint64_t v13 = *(void *)(a1 + 88);
  id v39 = v12;
  uint64_t v40 = v13;
  id v36 = 0;
  uint64_t v14 = [v35 executeSelectStatement:v5 withBlock:v37 error:&v36];
  id v15 = v36;
  *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = +[EDProtectedDatabasePersistence _resultForConnection:v35 success:v14 error:v15 errorMessage:@"Selecting ROWIDs to merge"];
  if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    BOOL v16 = 0;
  }
  else
  {
    id v17 = [*(id *)(a1 + 56) hookRegistry];
    uint64_t v18 = *(void *)(a1 + 64);
    id v19 = [*(id *)(a1 + 72) name];
    [v17 persistenceWillAddProtectedDatabaseIDsFromJournal:v12 andReplaceJournalDatabaseIDsWithProtectedDatabaseIDs:v18 forTable:v19];

    id v20 = +[EDProtectedDatabasePersistence log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v45 = v12;
      _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_INFO, "Inserting %{public}@", buf, 0xCu);
    }

    id v21 = [*(id *)(a1 + 72) rowIDColumn];
    id v22 = [v21 columnExpression];
    uint64_t v23 = [v22 in:v12];

    id v24 = [NSString alloc];
    uint64_t v25 = *(void *)(a1 + 48);
    uint64_t v26 = *(void *)(a1 + 32);
    uint64_t v27 = objc_msgSend(v23, "ef_SQLExpression");
    uint64_t v28 = (void *)[v24 initWithFormat:@"INSERT OR IGNORE INTO %@ SELECT * FROM %@ WHERE %@", v25, v26, v27];

    id v29 = [NSString alloc];
    id v30 = [*(id *)(a1 + 72) name];
    id v31 = (void *)[v29 initWithFormat:@"Unable to insert new rows into protected database for table %@", v30];

    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [*(id *)(a1 + 56) _executeStatementString:v28 onConnection:*(void *)(a1 + 80) errorMessage:v31];
    if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
    {
      BOOL v16 = 0;
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [*(id *)(a1 + 56) _deleteRowIDs:v12 fromJournal:*(void *)(a1 + 32) withConnection:v35];
      uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      if (!v32)
      {
        *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) += [v12 count];
        uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      }
      BOOL v16 = v32 == 0;
    }
  }
  return v16;
}

id __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F60E78];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [v3 name];
  id v7 = [v4 table:v5 column:v6];

  id v8 = (void *)MEMORY[0x1E4F60E78];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [v3 name];
  id v11 = [v8 table:v9 column:v10];

  id v12 = [v7 equalTo:v11];

  return v12;
}

void __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 databaseIDValue];

  uint64_t v5 = [v9 objectAtIndexedSubscript:1];
  id v6 = [v5 numberValue];

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [NSNumber numberWithLongLong:v4];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
  else
  {
    [*(id *)(a1 + 40) addIndex:v4];
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

BOOL __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_95(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  BOOL v16 = __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_2_97;
  id v17 = &unk_1E6C04BD8;
  uint64_t v5 = *(void **)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  id v19 = *(id *)(a1 + 48);
  id v6 = v3;
  uint64_t v24 = *(void *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = *(void **)(a1 + 64);
  id v20 = v6;
  uint64_t v21 = v7;
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 88);
  id v22 = v9;
  uint64_t v25 = v10;
  id v11 = v4;
  id v23 = v11;
  [v5 enumerateKeysAndObjectsUsingBlock:&v14];
  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    BOOL v12 = 0;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 56), "_deleteRowIDs:fromJournal:withConnection:", v11, *(void *)(a1 + 72), v6, v14, v15, v16, v17, v18, v19, v20, v21, v22);
    [*(id *)(a1 + 32) removeObjectsForKeys:v11];
    BOOL v12 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == 0;
  }

  return v12;
}

void __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_2_97(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v46 = a2;
  id v45 = a3;
  id v6 = +[EDProtectedDatabasePersistence log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v46;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v45;
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_INFO, "Replacing %{public}@ with %{public}@", buf, 0x16u);
  }

  uint64_t v7 = [*(id *)(a1 + 32) name];
  int v8 = [v7 isEqualToString:@"subjects"];

  if (v8)
  {
    id v9 = +[EDProtectedDatabasePersistence log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v46;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v45;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Mapping subjectID %{public}@ to %{public}@", buf, 0x16u);
    }
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v10)
  {
    uint64_t v43 = *(void *)v53;
    while (2)
    {
      uint64_t v44 = v10;
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v53 != v43) {
          objc_enumerationMutation(obj);
        }
        BOOL v12 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v13 = [v12 table];
        uint64_t v14 = [v13 name];

        uint64_t v15 = [v12 name];
        BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:v14];
        [v16 setObject:v45 forKeyedSubscript:v15];
        id v17 = [v12 columnExpression];
        id v18 = [v17 equalTo:v46];
        [v16 setWhereClause:v18];

        id v19 = [NSString alloc];
        id v20 = [v12 table];
        uint64_t v21 = [v20 name];
        id v22 = (void *)[v19 initWithFormat:@"Unable to merge journal for table %@", v21];

        id v23 = *(void **)(a1 + 48);
        id v51 = 0;
        uint64_t v24 = [v23 executeUpdateStatement:v16 error:&v51];
        id v25 = v51;
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = +[EDProtectedDatabasePersistence _resultForConnection:*(void *)(a1 + 48) success:v24 error:v25 errorMessage:v22];
        uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        if (v26)
        {
          if (v26 != 2)
          {
            id v38 = +[EDProtectedDatabasePersistence log];
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              id v39 = [*(id *)(a1 + 32) name];
              uint64_t v40 = [v12 fullNameWithDatabaseName:0];
              __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_2_97_cold_1(v39, v40, (uint64_t)buf, v38);
            }

            *a4 = 1;
            goto LABEL_32;
          }
          uint64_t v27 = +[EDProtectedDatabasePersistence log];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v14;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v15;
            *(_WORD *)&buf[22] = 2114;
            long long v61 = v46;
            LOWORD(v62) = 2114;
            *(void *)((char *)&v62 + 2) = v45;
            _os_log_error_impl(&dword_1DB39C000, v27, OS_LOG_TYPE_ERROR, "Conflict merging table %{public}@.%{public}@ %{public}@ with %{public}@", buf, 0x2Au);
          }

          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          long long v61 = __Block_byref_object_copy__30;
          *(void *)&long long v62 = __Block_byref_object_dispose__30;
          *((void *)&v62 + 1) = 0;
          uint64_t v28 = [*(id *)(a1 + 56) reconciliationMergeHandlers];
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_104;
          v48[3] = &unk_1E6C03CA8;
          __int16 v50 = buf;
          id v29 = v14;
          id v49 = v29;
          [v28 performWhileLocked:v48];

          if (*(void *)(*(void *)&buf[8] + 40))
          {
            id v30 = +[EDProtectedDatabasePersistence log];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)id v56 = 138543362;
              id v57 = v29;
              _os_log_impl(&dword_1DB39C000, v30, OS_LOG_TYPE_DEFAULT, "Merge handler found for table %{public}@", v56, 0xCu);
            }

            id v31 = *(void **)(*(void *)&buf[8] + 40);
            uint64_t v32 = *(void *)(a1 + 64);
            uint64_t v33 = *(void *)(*(void *)(a1 + 88) + 8) + 24;
            id v47 = v25;
            uint64_t v34 = [v31 handleReconciliationMergeErrorForTable:v29 columnName:v15 statement:v16 journalRowID:v46 protectedRowID:v45 connection:v32 rowsUpdated:v33 error:&v47];
            id v35 = v47;

            *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v34;
            id v36 = +[EDProtectedDatabasePersistence log];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
              *(_DWORD *)id v56 = 138543618;
              id v57 = v29;
              __int16 v58 = 2048;
              uint64_t v59 = v37;
              _os_log_impl(&dword_1DB39C000, v36, OS_LOG_TYPE_DEFAULT, "Merge handler for table %{public}@ returned with result %lu", v56, 0x16u);
            }
          }
          else
          {
            id v36 = +[EDProtectedDatabasePersistence log];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)id v56 = 138543362;
              id v57 = v29;
              _os_log_error_impl(&dword_1DB39C000, v36, OS_LOG_TYPE_ERROR, "No merge handler found for table %{public}@", v56, 0xCu);
            }
            id v35 = v25;
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) += sqlite3_changes((sqlite3 *)[*(id *)(a1 + 48) sqlDB]);
          id v35 = v25;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_32:

  [*(id *)(a1 + 72) addObject:v46];
  if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) >= 0x1F4uLL) {
    *a4 = 1;
  }
}

void __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_104(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (unint64_t)_deleteRowIDs:(id)a3 fromJournal:(id)a4 withConnection:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[EDProtectedDatabasePersistence log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[EDProtectedDatabasePersistence _deleteRowIDs:fromJournal:withConnection:]((uint64_t)v7, v10);
  }

  id v11 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  BOOL v12 = [v11 in:v7];

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:v8 where:v12];
  id v19 = 0;
  uint64_t v14 = [v9 executeDeleteStatement:v13 error:&v19];
  id v15 = v19;
  BOOL v16 = (void *)[[NSString alloc] initWithFormat:@"Unable to delete rows from journal for table %@", v8];
  unint64_t v17 = +[EDProtectedDatabasePersistence _resultForConnection:v9 success:v14 error:v15 errorMessage:v16];

  return v17;
}

- (void)scheduleRecurringActivity
{
  if ([(EDProtectedDatabasePersistence *)self supportsJournaling])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__EDProtectedDatabasePersistence_scheduleRecurringActivity__block_invoke;
    aBlock[3] = &unk_1E6C008D8;
    aBlock[4] = self;
    uint64_t v3 = _Block_copy(aBlock);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__EDProtectedDatabasePersistence_scheduleRecurringActivity__block_invoke_2;
    v5[3] = &unk_1E6C008D8;
    v5[4] = self;
    uint64_t v4 = _Block_copy(v5);
    ef_xpc_activity_register();
  }
}

void __59__EDProtectedDatabasePersistence_scheduleRecurringActivity__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14338], 0);
  [*(id *)(a1 + 32) addAdditionalCriteriaToCleanupActivity:xdict];
}

void __59__EDProtectedDatabasePersistence_scheduleRecurringActivity__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = +[EDProtectedDatabasePersistence log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Starting clean up", buf, 2u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "database", 0);
  id v6 = [v5 protectedSchema];
  id v7 = [v6 tables];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      if (xpc_activity_should_defer(v3) && xpc_activity_set_state(v3, 3)) {
        break;
      }
      BOOL v12 = [*(id *)(a1 + 32) _databaseIDsToDeleteForTable:v11];
      if ([v12 count]) {
        [*(id *)(a1 + 32) _deleteDatabaseIDs:v12 fromTable:v11];
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

- (id)_databaseIDsToDeleteForTable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EDProtectedDatabasePersistence *)self _allReferencingColumnsForTable:v4];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  id v6 = [MEMORY[0x1E4F28E78] string];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __63__EDProtectedDatabasePersistence__databaseIDsToDeleteForTable___block_invoke;
  v22[3] = &unk_1E6C04C28;
  uint64_t v24 = v25;
  id v7 = v6;
  id v23 = v7;
  [v5 enumerateObjectsUsingBlock:v22];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v9 = [(EDProtectedDatabasePersistence *)self database];
  uint64_t v10 = [NSString stringWithUTF8String:"-[EDProtectedDatabasePersistence _databaseIDsToDeleteForTable:]"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__EDProtectedDatabasePersistence__databaseIDsToDeleteForTable___block_invoke_2;
  v17[3] = &unk_1E6C027D0;
  id v11 = v4;
  id v18 = v11;
  uint64_t v19 = self;
  id v12 = v7;
  id v20 = v12;
  id v13 = v8;
  id v21 = v13;
  objc_msgSend(v9, "__performReadWithCaller:usingBlock:", v10, v17);

  long long v14 = v21;
  id v15 = v13;

  _Block_object_dispose(v25, 8);

  return v15;
}

void __63__EDProtectedDatabasePersistence__databaseIDsToDeleteForTable___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [*(id *)(a1 + 32) appendString:@" UNION "];
  }
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [v9 name];
  uint64_t v5 = [v9 table];
  id v6 = [v5 fullNameWithDatabaseName:0];
  [v3 appendFormat:@"SELECT DISTINCT %@ FROM %@", v4, v6];

  if ([v9 nullable])
  {
    [*(id *)(a1 + 32) appendString:@" WHERE "];
    id v7 = [v9 columnExpressionWithFullName];
    id v8 = [v7 isNotNull];
    objc_msgSend(v8, "ef_renderSQLExpressionInto:", *(void *)(a1 + 32));
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __63__EDProtectedDatabasePersistence__databaseIDsToDeleteForTable___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 protectedDatabaseAttached])
  {
    id v4 = [NSString alloc];
    uint64_t v5 = [*(id *)(a1 + 32) rowIDColumn];
    id v6 = [v5 name];
    id v7 = *(void **)(a1 + 32);
    id v8 = [(id)objc_opt_class() protectedDatabaseName];
    id v9 = [v7 fullNameWithDatabaseName:v8];
    uint64_t v10 = objc_msgSend(v4, "initWithFormat:", @"SELECT %1$@ FROM %2$@ WHERE %1$@ NOT IN (%3$@)", v6, v9, *(void *)(a1 + 48));

    id v11 = [v3 preparedStatementForQueryString:v10];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__EDProtectedDatabasePersistence__databaseIDsToDeleteForTable___block_invoke_3;
    v14[3] = &unk_1E6BFF3B0;
    id v15 = *(id *)(a1 + 56);
    uint64_t v12 = [v11 executeUsingBlock:v14 error:0];
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

void __63__EDProtectedDatabasePersistence__databaseIDsToDeleteForTable___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = [a2 objectAtIndexedSubscript:0];
  id v3 = [v4 stringValue];
  [v2 addObject:v3];
}

- (void)_deleteDatabaseIDs:(id)a3 fromTable:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[v6 mutableCopy];
  id v9 = [(EDProtectedDatabasePersistence *)self _allReferencingColumnsForTable:v7];
  uint64_t v10 = [(EDProtectedDatabasePersistence *)self database];
  id v11 = [NSString stringWithUTF8String:"-[EDProtectedDatabasePersistence _deleteDatabaseIDs:fromTable:]"];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __63__EDProtectedDatabasePersistence__deleteDatabaseIDs_fromTable___block_invoke;
  id v21 = &unk_1E6C027D0;
  id v12 = v9;
  id v22 = v12;
  id v23 = self;
  id v13 = v8;
  id v24 = v13;
  id v14 = v7;
  id v25 = v14;
  objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, &v18);

  id v15 = +[EDProtectedDatabasePersistence log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v13 count];
    unint64_t v17 = [v14 name];
    *(_DWORD *)buf = 134218242;
    uint64_t v27 = v16;
    __int16 v28 = 2114;
    id v29 = v17;
    _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Deleted %lu rows from %{public}@", buf, 0x16u);
  }
}

uint64_t __63__EDProtectedDatabasePersistence__deleteDatabaseIDs_fromTable___block_invoke(id *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 protectedDatabaseAttached])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = a1[4];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v18;
      while (2)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v4);
          }
          if (([a1[5] _removeExistingDatabaseIDs:a1[6] withColumn:*(void *)(*((void *)&v17 + 1) + 8 * v7) connection:v3] & 1) == 0)
          {
            uint64_t v11 = 0;
            goto LABEL_13;
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    id v8 = [a1[6] allObjects];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__EDProtectedDatabasePersistence__deleteDatabaseIDs_fromTable___block_invoke_2;
    v13[3] = &unk_1E6C04C50;
    id v9 = a1[7];
    id v10 = a1[5];
    id v14 = v9;
    id v15 = v10;
    id v16 = v3;
    objc_msgSend(v8, "ef_enumerateObjectsInBatchesOfSize:block:", 45000, v13);

    uint64_t v11 = 1;
    id v4 = v14;
LABEL_13:
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

void __63__EDProtectedDatabasePersistence__deleteDatabaseIDs_fromTable___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) rowIDColumn];
  uint64_t v5 = [v4 columnExpressionWithFullName];
  uint64_t v6 = [v5 in:v3];

  id v7 = objc_alloc(MEMORY[0x1E4F60E98]);
  id v8 = *(void **)(a1 + 32);
  id v9 = [(id)objc_opt_class() protectedDatabaseName];
  id v10 = [v8 fullNameWithDatabaseName:v9];
  uint64_t v11 = (void *)[v7 initWithTable:v10 where:v6];

  id v12 = *(void **)(a1 + 48);
  uint64_t v13 = 0;
  [v12 executeDeleteStatement:v11 error:&v13];
}

- (BOOL)_removeExistingDatabaseIDs:(id)a3 withColumn:(id)a4 connection:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  id v10 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v11 = [v8 name];
  id v12 = [v8 table];
  uint64_t v13 = [v12 fullNameWithDatabaseName:0];
  id v14 = (void *)[v10 initWithResultColumn:v11 table:v13];

  id v15 = [v8 columnExpressionWithFullName];
  id v16 = [v7 allObjects];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __83__EDProtectedDatabasePersistence__removeExistingDatabaseIDs_withColumn_connection___block_invoke;
  v22[3] = &unk_1E6C04C78;
  id v17 = v14;
  id v23 = v17;
  id v18 = v15;
  id v24 = v18;
  uint64_t v27 = &v28;
  id v19 = v9;
  id v25 = v19;
  id v20 = v7;
  id v26 = v20;
  objc_msgSend(v16, "ef_enumerateObjectsInBatchesOfSize:block:", 45000, v22);

  LOBYTE(v7) = *((unsigned char *)v29 + 24);
  _Block_object_dispose(&v28, 8);

  return (char)v7;
}

void __83__EDProtectedDatabasePersistence__removeExistingDatabaseIDs_withColumn_connection___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = [*(id *)(a1 + 40) in:a2];
  [*(id *)(a1 + 32) setWhere:v5];

  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__EDProtectedDatabasePersistence__removeExistingDatabaseIDs_withColumn_connection___block_invoke_2;
  v8[3] = &unk_1E6BFF3B0;
  id v7 = *(void **)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v7 executeSelectStatement:v6 withBlock:v8 error:0];
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) ^ 1;
}

void __83__EDProtectedDatabasePersistence__removeExistingDatabaseIDs_withColumn_connection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = [a2 objectAtIndexedSubscript:0];
  id v3 = [v4 stringValue];
  [v2 removeObject:v3];
}

- (BOOL)_isJournalMalformedForSchema:(id)a3 connection:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v26 = a4;
  id v23 = v5;
  uint64_t v6 = [(id)objc_opt_class() journalDatabaseName];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = [v5 tables];
  uint64_t v21 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v8 = [v7 name];
        char v9 = [v26 tableExists:v8 inDatabase:v6];

        if ((v9 & 1) == 0)
        {
LABEL_20:
          BOOL v19 = 1;
          goto LABEL_22;
        }
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v10 = [v7 columns];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v29;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v29 != v12) {
                objc_enumerationMutation(v10);
              }
              id v14 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              uint64_t v27 = 4;
              id v15 = [v14 name];
              id v16 = [v7 name];
              int v17 = [v26 columnExists:v15 inTable:v16 database:v6 type:&v27];

              if (v17)
              {
                uint64_t v18 = v27;
                if (v18 == [v14 type]) {
                  continue;
                }
              }

              goto LABEL_20;
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }
      BOOL v19 = 0;
      uint64_t v21 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_22:

  return v19;
}

- (unint64_t)_executeUpdateStatement:(id)a3 onConnection:(id)a4 errorMessage:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v14 = 0;
  uint64_t v10 = [v8 executeUpdateStatement:v7 error:&v14];
  id v11 = v14;
  unint64_t v12 = +[EDProtectedDatabasePersistence _resultForConnection:v8 success:v10 error:v11 errorMessage:v9];

  return v12;
}

- (unint64_t)_executeStatementString:(id)a3 onConnection:(id)a4 errorMessage:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 sqlConnection];
  id v15 = 0;
  uint64_t v11 = [v10 executeStatementString:v7 error:&v15];
  id v12 = v15;

  unint64_t v13 = +[EDProtectedDatabasePersistence _resultForConnection:v8 success:v11 error:v12 errorMessage:v9];
  return v13;
}

+ (BOOL)_isRecoverableError:(id)a3
{
  uint64_t v3 = [a3 code];
  return v3 == 23 || v3 == 10;
}

+ (unint64_t)_resultForConnection:(id)a3 success:(BOOL)a4 error:(id)a5 errorMessage:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (a4)
  {
    unint64_t v12 = 0;
  }
  else if (([v9 hadIOError] & 1) != 0 {
         || +[EDProtectedDatabasePersistence _isRecoverableError:v10])
  }
  {
    unint64_t v12 = 1;
  }
  else
  {
    [v9 handleError:v10 message:v11];
    unint64_t v12 = 2;
  }

  return v12;
}

- (id)_allReferencingColumnsForTable:(id)a3
{
  id v3 = a3;
  id v4 = [v3 foreignKeyReferences];
  id v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  id v8 = v7;

  id v9 = [v3 associatedColumns];
  if ([v9 count]) {
    [v8 unionSet:v9];
  }

  return v8;
}

- (void)registerMergeHandler:(id)a3 forTable:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(EDProtectedDatabasePersistence *)self reconciliationMergeHandlers];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__EDProtectedDatabasePersistence_registerMergeHandler_forTable___block_invoke;
  v12[3] = &unk_1E6C04CA0;
  id v10 = v8;
  SEL v16 = a2;
  id v13 = v10;
  id v14 = self;
  id v11 = v7;
  id v15 = v11;
  [v9 performWhileLocked:v12];
}

void __64__EDProtectedDatabasePersistence_registerMergeHandler_forTable___block_invoke(void *a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 objectForKey:a1[4]];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a1[7] object:a1[5] file:@"EDProtectedDatabasePersistence.m" lineNumber:947 description:@"Merge handler already registered for table"];
  }
  [v5 setObject:a1[6] forKey:a1[4]];
}

- (BOOL)supportsJournaling
{
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDProtectedDatabasePersistence.m", 971, @"%s can only be called from unit tests", "-[EDProtectedDatabasePersistence test_tearDown]");
  }
  id v4 = [(EDProtectedDatabasePersistence *)self journalManager];
  objc_msgSend(v4, "test_tearDown");
}

- (EDPersistenceDatabaseJournalManager)journalManager
{
  return self->_journalManager;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (OS_dispatch_queue)reconciliationQueue
{
  return self->_reconciliationQueue;
}

- (void)setIsInitialized:(BOOL)a3
{
  self->_isInitialized = a3;
}

- (BOOL)isReconciling
{
  return self->_isReconciling;
}

- (void)setIsReconciling:(BOOL)a3
{
  self->_isReconciling = a3;
}

- (EFLocked)reconciliationMergeHandlers
{
  return self->_reconciliationMergeHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reconciliationMergeHandlers, 0);
  objc_storeStrong((id *)&self->_reconciliationQueue, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_journalManager, 0);

  objc_destroyWeak((id *)&self->_database);
}

- (void)_attachJournalDatabaseToConnection:(os_log_t)log withSchema:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to initialize the journal database. Mark the current journal as merged to get it deleted.", v1, 2u);
}

- (void)_runReconciliationWithSchema:(uint64_t)a3 connection:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3((uint64_t)a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to upgrade journal %lu for reconciliation due to error %{public}@", v4, v5);
}

- (void)_runReconciliationWithSchema:(uint64_t)a3 connection:.cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3((uint64_t)a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to attach journal %lu for reconciliation due to error %{public}@", v4, v5);
}

void __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_2_97_cold_1(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to merge table %{public}@ for %{public}@", (uint8_t *)a3, a4);
}

- (void)_deleteRowIDs:(uint64_t)a1 fromJournal:(NSObject *)a2 withConnection:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_DEBUG, "Deleting from journal: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end