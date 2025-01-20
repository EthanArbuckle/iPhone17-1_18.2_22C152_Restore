@interface EDPersistenceDatabaseConnection
+ (OS_os_log)log;
- (BOOL)attachJournalDatabase:(id)a3 withName:(id)a4;
- (BOOL)attachJournalDatabase:(id)a3 withName:(id)a4 error:(id *)a5;
- (BOOL)attachProtectedDatabaseWithName:(id)a3;
- (BOOL)attachProtectedDatabaseWithName:(id)a3 error:(id *)a4;
- (BOOL)attachProtectedDatabaseWithName:(id)a3 url:(id)a4 error:(id *)a5;
- (BOOL)checkForConnectionErrorWithMessage:(id)a3;
- (BOOL)columnExists:(id)a3 inTable:(id)a4 database:(id)a5 type:(unint64_t *)a6;
- (BOOL)columnExists:(id)a3 inTable:(id)a4 type:(unint64_t *)a5;
- (BOOL)databaseIsAttached:(id)a3;
- (BOOL)detachJournalDatabase;
- (BOOL)executeDeleteStatement:(id)a3 error:(id *)a4;
- (BOOL)executeDeleteStatement:(id)a3 rowsChanged:(unint64_t *)a4;
- (BOOL)executeInsertStatement:(id)a3 error:(id *)a4;
- (BOOL)executeInsertStatement:(id)a3 rowsChanged:(unint64_t *)a4;
- (BOOL)executeSelectStatement:(id)a3 withBlock:(id)a4 error:(id *)a5;
- (BOOL)executeStatementString:(id)a3 errorMessage:(id)a4;
- (BOOL)executeUpdateStatement:(id)a3 error:(id *)a4;
- (BOOL)executeUpdateStatement:(id)a3 rowsChanged:(unint64_t *)a4;
- (BOOL)executeUpsertStatement:(id)a3 error:(id *)a4;
- (BOOL)executeUpsertStatement:(id)a3 rowsChanged:(unint64_t *)a4;
- (BOOL)hadIOError;
- (BOOL)isValid;
- (BOOL)isWriter;
- (BOOL)journalDatabaseAttached;
- (BOOL)performWithOptions:(unint64_t)a3 transactionError:(id *)a4 block:(id)a5;
- (BOOL)protectedDatabaseAttached;
- (BOOL)selectIsReindexing;
- (BOOL)tableExists:(id)a3;
- (BOOL)tableExists:(id)a3 inDatabase:(id)a4;
- (EDPersistenceDatabaseConnection)init;
- (EDPersistenceDatabaseConnection)initWithBasePath:(id)a3 databaseName:(id)a4 isWriter:(BOOL)a5 delegate:(id)a6;
- (EDPersistenceDatabaseConnection)initWithSQLDB:(sqlite3 *)a3 isWriter:(BOOL)a4 delegate:(id)a5;
- (EDPersistenceDatabaseConnectionDelegate)delegate;
- (EFSQLConnection)sqlConnection;
- (NSString)basePath;
- (NSString)description;
- (NSString)fullPath;
- (NSString)transactionLabel;
- (id)SQLQueryLogger;
- (id)_databasePathForFileName:(void *)a1;
- (id)assignIndexedAttachmentItems:(uint64_t)a3 transaction:;
- (id)assignIndexedRichLinkItems:(uint64_t)a3 transaction:;
- (id)attachmentDataForItemsRequiringIndexingExcludingIDs:(void *)a3 lastProcessedAttachmentID:(uint64_t)a4 limit:(void *)a5 cancelationToken:;
- (id)attachmentDataForMessageWithIdentifier:(void *)a1;
- (id)databaseIDsForSelectStatement:(id)a3;
- (id)identifiersForAttachmentsWithQuery:(void *)a1;
- (id)initForInMemoryDatabaseIsWriter:(BOOL)a3 delegate:(id)a4;
- (id)messageIDTransactionIDDictionaryToVerifyWithCount:(uint64_t)a3 lastVerifiedMessageID:;
- (id)preparedStatementForQueryString:(id)a3;
- (id)richLinkDataForItemsRequiringIndexingExcludingIdentifiers:(uint64_t)a3 limit:(void *)a4 cancelationToken:;
- (id)selectAttachmentIdentifiersForMessages:(void *)a1;
- (id)selectAttachmentIdentifiersForTransactions:(void *)a1;
- (id)selectDistinctTransactionIDs;
- (id)selectIdentifiersForDeletedAttachments;
- (id)selectIdentifiersForDeletedMessages;
- (id)selectIdentifiersForTombstonesOfType:(void *)a1;
- (id)selectLastProcessedAttachmentID;
- (id)selectMessageIDsFromBacklogWithBatchSize:(void *)a1;
- (id)selectMessageIdentifiersForTransactions:(void *)a1;
- (id)selectTombstoneIdentifiersForTransactions:(void *)a1;
- (id)selectTransactionAndIndexTypeForMessage:(id)a1;
- (int)configureSQLConnection;
- (int64_t)lastInsertedDatabaseID;
- (int64_t)transactionGeneration;
- (int64_t)transactionTypeForWriting;
- (sqlite3)sqlDB;
- (uint64_t)_adjustedDatabaseTypeForType:(uint64_t)result;
- (uint64_t)_attachDatabaseWithName:(void *)a3 url:(uint64_t)a4 error:;
- (uint64_t)_detachDatabaseWithName:(void *)a1;
- (uint64_t)_executePreparedStatement:(void *)a3 withBlock:(void *)a4 description:(uint64_t *)a5 error:;
- (uint64_t)_fetchTransactionWriteGenerationWithSQLConnection:(void *)a3 newGeneration:;
- (uint64_t)_finishTransactionWithSQLConnection:(int)a3 afterSuccess:(void *)a4 transactionError:;
- (uint64_t)_startTransactionWithSQLConnection:(char)a3 options:(uint64_t)a4 error:;
- (uint64_t)_storeTransactionWriteGenerationWithSQLConnection:(uint64_t)a3 newGeneration:;
- (uint64_t)setLastProcessedAttachmentID:(void *)a1;
- (unint64_t)countForSelectStatement:(id)a3;
- (unint64_t)rowsChanged;
- (void)addAllMessagesToRebuildTable;
- (void)addTombstonesForIdentifiers:(uint64_t)a3 type:;
- (void)assignTombstonesForIdentifiers:(uint64_t)a3 type:(uint64_t)a4 transaction:;
- (void)clearLastInsertedDatabaseID;
- (void)clearReferencesToMissingSearchableMessages;
- (void)clearReferencesToSearchableMessages;
- (void)clearTransactionsForTombstonesAfterTransaction:(void *)a1;
- (void)close;
- (void)dealloc;
- (void)deleteAttachmentsAfterTransaction:(void *)a1;
- (void)deleteAttachmentsForMessage:(void *)a1;
- (void)deleteAttachmentsInTransactions:(void *)a1;
- (void)deleteMessagesAfterTransaction:(void *)a1;
- (void)deleteMessagesInTransactions:(void *)a1;
- (void)deleteRichLinksInTransactions:(void *)a1;
- (void)deleteTombstonesBeforeTransaction:(void *)a1;
- (void)deleteTombstonesInTransactions:(void *)a1;
- (void)detachProtectedDatabase;
- (void)emptyAllSearchableIndexTables;
- (void)handleError:(id)a3 message:(id)a4;
- (void)handleSQLResult:(int)a3 message:(id)a4;
- (void)open;
- (void)removeIndexedIdentifiers:(void *)a1;
- (void)setHadIOError:(BOOL)a3;
- (void)setIsWriter:(BOOL)a3;
- (void)setJournal:(uint64_t)a1;
- (void)setTransactionLabel:(id)a3;
@end

@implementation EDPersistenceDatabaseConnection

void __99__EDPersistenceDatabaseConnection__fetchTransactionWriteGenerationWithSQLConnection_newGeneration___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = [v4 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 int64Value];
}

void __59__EDPersistenceDatabaseConnection_countForSelectStatement___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 objectAtIndexedSubscript:0];
  id v4 = [v3 numberValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 unsignedIntegerValue];
}

- (EDPersistenceDatabaseConnection)initWithBasePath:(id)a3 databaseName:(id)a4 isWriter:(BOOL)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)EDPersistenceDatabaseConnection;
  v14 = [(EDPersistenceDatabaseConnection *)&v23 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v13);
    objc_storeStrong((id *)&v15->_basePath, a3);
    v15->_isWriter = a5;
    v16 = -[EDPersistenceDatabaseConnection _databasePathForFileName:](v15, v12);
    v17 = [(EDPersistenceDatabaseConnection *)v15 basePath];

    if (v17) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = 3;
    }
    v19 = [v13 urlForDatabasePath:v16 type:v18];

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F60E90]) initWithURL:v19];
    sqlConnection = v15->_sqlConnection;
    v15->_sqlConnection = (EFSQLConnection *)v20;
  }
  return v15;
}

- (id)_databasePathForFileName:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 basePath];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 stringByAppendingPathComponent:v3];
    }
    else
    {
      id v6 = v3;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)basePath
{
  return self->_basePath;
}

- (id)preparedStatementForQueryString:(id)a3
{
  id v4 = a3;
  id v5 = [(EDPersistenceDatabaseConnection *)self sqlConnection];
  id v6 = [(EDPersistenceDatabaseConnection *)self transactionLabel];
  v7 = [(EDPersistenceDatabaseConnection *)self SQLQueryLogger];
  v8 = [v5 preparedStatementForQueryString:v4 transactionLabel:v6 queryLogger:v7];

  if (!v8)
  {
    v9 = (void *)[[NSString alloc] initWithFormat:@"Error preparing statement for query %@", v4];
    [(EDPersistenceDatabaseConnection *)self handleSQLResult:sqlite3_errcode([(EDPersistenceDatabaseConnection *)self sqlDB]) message:v9];
  }

  return v8;
}

- (NSString)transactionLabel
{
  return self->_transactionLabel;
}

- (id)SQLQueryLogger
{
  id v3 = [(EDPersistenceDatabaseConnection *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(EDPersistenceDatabaseConnection *)self delegate];
    id v6 = [v5 queryLogger];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (EDPersistenceDatabaseConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EDPersistenceDatabaseConnectionDelegate *)WeakRetained;
}

- (BOOL)performWithOptions:(unint64_t)a3 transactionError:(id *)a4 block:(id)a5
{
  char v6 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v9 = (uint64_t (**)(id, EDPersistenceDatabaseConnection *))a5;
  v10 = (void *)MEMORY[0x1E0190280]();
  id v11 = [(EDPersistenceDatabaseConnection *)self sqlConnection];
  if (v6)
  {
    id v28 = 0;
    int v12 = -[EDPersistenceDatabaseConnection _startTransactionWithSQLConnection:options:error:]((uint64_t)self, v11, v6, (uint64_t)&v28);
    id v13 = v28;
    if (v13)
    {
      id v14 = v13;
      v15 = +[EDPersistenceDatabaseConnection log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = objc_msgSend(v14, "ef_publicDescription");
        -[EDPersistenceDatabaseConnection performWithOptions:transactionError:block:].cold.4((uint64_t)self, v16, buf, v15);
      }

      if (v12)
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2 object:self file:@"EDPersistenceDatabaseConnection.m" lineNumber:400 description:@"Transaction error set despite not needing/attempting to take a transaction"];
      }
      goto LABEL_8;
    }
  }
  else
  {
    int v12 = 0;
  }
  char v18 = v9[2](v9, self);
  if (!v12)
  {
    if (v18)
    {
      id v14 = 0;
      char v17 = 1;
      goto LABEL_25;
    }
    if (v6)
    {
      v21 = +[EDPersistenceDatabaseConnection log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[EDPersistenceDatabaseConnection performWithOptions:transactionError:block:]();
      }

      v22 = [MEMORY[0x1E4F29060] currentThread];
      objc_super v23 = [v22 threadDictionary];

      [v23 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_EDPersistenceDatabaseConnectionNestedBlockFailed"];
      id v14 = 0;
    }
    else
    {
      uint64_t v20 = +[EDPersistenceDatabaseConnection log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[EDPersistenceDatabaseConnection performWithOptions:transactionError:block:]();
      }

      id v14 = 0;
    }
LABEL_8:
    char v17 = 0;
    goto LABEL_25;
  }
  if (v18)
  {
    int v19 = 1;
  }
  else
  {
    v25 = +[EDPersistenceDatabaseConnection log];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[EDPersistenceDatabaseConnection performWithOptions:transactionError:block:]();
    }

    int v19 = 0;
  }
  id v27 = 0;
  char v17 = -[EDPersistenceDatabaseConnection _finishTransactionWithSQLConnection:afterSuccess:transactionError:](self, v11, v19, &v27);
  id v14 = v27;
LABEL_25:

  if (a4) {
    *a4 = v14;
  }

  return v17;
}

- (EFSQLConnection)sqlConnection
{
  return self->_sqlConnection;
}

- (uint64_t)_startTransactionWithSQLConnection:(char)a3 options:(uint64_t)a4 error:
{
  id v7 = a2;
  if (a1)
  {
    v8 = [MEMORY[0x1E4F29060] currentThread];
    v9 = [v8 threadDictionary];

    v10 = [v9 objectForKeyedSubscript:@"_EDPersistenceDatabaseConnectionInTransaction"];
    char v11 = [v10 BOOLValue];

    if ((v11 & 1) != 0
      || ((a3 & 2) != 0 ? (uint64_t v12 = [(id)a1 transactionTypeForWriting]) : (uint64_t v12 = 0),
          ![v7 beginTransaction:v12 error:a4]))
    {
      a1 = 0;
LABEL_25:

      goto LABEL_26;
    }
    [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_EDPersistenceDatabaseConnectionInTransaction"];
    uint64_t v16 = 0;
    if ((a3 & 4) != 0)
    {
      if ((a3 & 2) != 0)
      {
        if (EFSQLVerboseDebugLoggingEnabled())
        {
          id v13 = +[EDPersistenceDatabaseConnection log];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[EDPersistenceDatabaseConnection _startTransactionWithSQLConnection:options:error:].cold.4();
          }
          goto LABEL_23;
        }
      }
      else if (EFSQLVerboseDebugLoggingEnabled())
      {
        id v13 = +[EDPersistenceDatabaseConnection log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[EDPersistenceDatabaseConnection _startTransactionWithSQLConnection:options:error:]();
        }
        goto LABEL_23;
      }
    }
    else
    {
      -[EDPersistenceDatabaseConnection _fetchTransactionWriteGenerationWithSQLConnection:newGeneration:]((void *)a1, v7, &v16);
      if ((a3 & 2) != 0)
      {
        -[EDPersistenceDatabaseConnection _storeTransactionWriteGenerationWithSQLConnection:newGeneration:]((void *)a1, v7, ++v16);
        if (EFSQLVerboseDebugLoggingEnabled())
        {
          id v13 = +[EDPersistenceDatabaseConnection log];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[EDPersistenceDatabaseConnection _startTransactionWithSQLConnection:options:error:](&v16);
          }
          goto LABEL_23;
        }
      }
      else if (EFSQLVerboseDebugLoggingEnabled())
      {
        id v13 = +[EDPersistenceDatabaseConnection log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[EDPersistenceDatabaseConnection _startTransactionWithSQLConnection:options:error:](&v16);
        }
LABEL_23:
      }
    }
    id v14 = [NSNumber numberWithLongLong:v16];
    [v9 setObject:v14 forKeyedSubscript:@"_EDPersistenceDatabaseConnectionTransactionGeneration"];

    a1 = 1;
    goto LABEL_25;
  }
LABEL_26:

  return a1;
}

- (void)setTransactionLabel:(id)a3
{
}

- (BOOL)executeSelectStatement:(id)a3 withBlock:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a3 queryString];
  v10 = [(EDPersistenceDatabaseConnection *)self preparedStatementForQueryString:v9];

  LOBYTE(a5) = -[EDPersistenceDatabaseConnection _executePreparedStatement:withBlock:description:error:](self, v10, v8, @"SELECT statement", (uint64_t *)a5);
  return (char)a5;
}

- (uint64_t)_executePreparedStatement:(void *)a3 withBlock:(void *)a4 description:(uint64_t *)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    uint64_t v18 = 0;
    if (a5) {
      uint64_t v12 = a5;
    }
    else {
      uint64_t v12 = &v18;
    }
    uint64_t v13 = [v9 executeUsingBlock:v10 error:v12];
    uint64_t v14 = v13;
    if (a5) {
      char v15 = 1;
    }
    else {
      char v15 = v13;
    }
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = [NSString stringWithFormat:@"Error while executing %@", v11];
      [a1 handleError:v18 message:v16];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (uint64_t)_fetchTransactionWriteGenerationWithSQLConnection:(void *)a3 newGeneration:
{
  id v5 = a2;
  if (a1)
  {
    char v6 = [NSString stringWithUTF8String:"-[EDPersistenceDatabaseConnection _fetchTransactionWriteGenerationWithSQLConnection:newGeneration:]"];
    id v7 = [a1 SQLQueryLogger];
    id v8 = [v5 preparedStatementForQueryString:@"SELECT value FROM properties WHERE key = :key" transactionLabel:v6 queryLogger:v7];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v9 setObject:@"WriteTransactionGeneration" forKeyedSubscript:@":key"];
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    id v13 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __99__EDPersistenceDatabaseConnection__fetchTransactionWriteGenerationWithSQLConnection_newGeneration___block_invoke;
    v14[3] = &unk_1E6BFF4C8;
    v14[4] = &v15;
    uint64_t v10 = [v8 executeWithNamedBindings:v9 usingBlock:v14 error:&v13];
    id v11 = v13;
    if (a3) {
      *a3 = v16[3];
    }
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)protectedDatabaseAttached
{
  if (self) {
    protectedDatabaseName = self->_protectedDatabaseName;
  }
  else {
    protectedDatabaseName = 0;
  }
  return protectedDatabaseName != 0;
}

- (BOOL)isWriter
{
  return self->_isWriter;
}

- (void)setHadIOError:(BOOL)a3
{
  self->_hadIOError = a3;
}

- (void)setIsWriter:(BOOL)a3
{
  self->_isWriter = a3;
}

- (uint64_t)_finishTransactionWithSQLConnection:(int)a3 afterSuccess:(void *)a4 transactionError:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (!a1)
  {
    uint64_t v16 = 0;
    goto LABEL_25;
  }
  id v8 = [MEMORY[0x1E4F29060] currentThread];
  id v9 = [v8 threadDictionary];

  if (!a3)
  {
LABEL_6:
    char v12 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = [v9 objectForKeyedSubscript:@"_EDPersistenceDatabaseConnectionNestedBlockFailed"];
  char v11 = [v10 BOOLValue];

  if ((v11 & 1) == 0)
  {
    if (([a1 hadIOError] & 1) == 0)
    {
      uint64_t v23 = 0;
      uint64_t v15 = (id *)&v23;
      uint64_t v16 = [v7 commitTransactionWithError:&v23];
      uint64_t v17 = @"commit";
      goto LABEL_15;
    }
    goto LABEL_6;
  }
  char v12 = 1;
LABEL_7:
  id v13 = +[EDPersistenceDatabaseConnection log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    if (v12)
    {
      uint64_t v14 = @" (due to nested block failure)";
    }
    else if ([a1 hadIOError])
    {
      uint64_t v14 = @"(due to IOError)";
    }
    else
    {
      uint64_t v14 = &stru_1F3583658;
    }
    -[EDPersistenceDatabaseConnection _finishTransactionWithSQLConnection:afterSuccess:transactionError:]((uint64_t)v14, v30, (uint64_t)a1, v13);
  }

  uint64_t v22 = 0;
  uint64_t v15 = (id *)&v22;
  [v7 rollbackTransactionWithError:&v22];
  uint64_t v16 = 0;
  uint64_t v17 = @"rollback";
LABEL_15:
  id v18 = *v15;
  if (v18)
  {
    int v19 = +[EDPersistenceDatabaseConnection log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_msgSend(v18, "ef_publicDescription");
      *(_DWORD *)buf = 138543874;
      v25 = a1;
      __int16 v26 = 2114;
      id v27 = v17;
      __int16 v28 = 2114;
      v29 = v20;
      _os_log_error_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_ERROR, "Transaction on connection %{public}@ %{public}@ failed: %{public}@", buf, 0x20u);
    }
LABEL_21:

    goto LABEL_22;
  }
  if (EFSQLVerboseDebugLoggingEnabled())
  {
    int v19 = +[EDPersistenceDatabaseConnection log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[EDPersistenceDatabaseConnection _finishTransactionWithSQLConnection:afterSuccess:transactionError:]((uint64_t)a1);
    }
    goto LABEL_21;
  }
LABEL_22:
  if (a4) {
    *a4 = v18;
  }
  [v9 setObject:0 forKeyedSubscript:@"_EDPersistenceDatabaseConnectionInTransaction"];
  [v9 setObject:0 forKeyedSubscript:@"_EDPersistenceDatabaseConnectionNestedBlockFailed"];
  [v9 setObject:0 forKeyedSubscript:@"_EDPersistenceDatabaseConnectionTransactionGeneration"];

LABEL_25:
  return v16;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__EDPersistenceDatabaseConnection_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_68 != -1) {
    dispatch_once(&log_onceToken_68, block);
  }
  v2 = (void *)log_log_68;

  return (OS_os_log *)v2;
}

- (BOOL)hadIOError
{
  return self->_hadIOError;
}

- (unint64_t)countForSelectStatement:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__EDPersistenceDatabaseConnection_countForSelectStatement___block_invoke;
  v5[3] = &unk_1E6BFF4C8;
  v5[4] = &v6;
  [(EDPersistenceDatabaseConnection *)self executeSelectStatement:a3 withBlock:v5 error:0];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)journalDatabaseAttached
{
  if (self) {
    journalDatabaseName = self->_journalDatabaseName;
  }
  else {
    journalDatabaseName = 0;
  }
  return journalDatabaseName != 0;
}

- (BOOL)isValid
{
  v2 = [(EDPersistenceDatabaseConnection *)self sqlConnection];
  char v3 = [v2 isOpen];

  return v3;
}

- (uint64_t)_storeTransactionWriteGenerationWithSQLConnection:(uint64_t)a3 newGeneration:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = [NSString stringWithUTF8String:"-[EDPersistenceDatabaseConnection _storeTransactionWriteGenerationWithSQLConnection:newGeneration:]"];
    id v7 = [a1 SQLQueryLogger];
    uint64_t v8 = [v5 preparedStatementForQueryString:@"INSERT OR REPLACE INTO properties (key, value) VALUES (:key, :value)", v6, v7 transactionLabel queryLogger];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v9 setObject:@"WriteTransactionGeneration" forKeyedSubscript:@":key"];
    uint64_t v10 = [NSNumber numberWithLongLong:a3];
    [v9 setObject:v10 forKeyedSubscript:@":value"];

    id v16 = 0;
    uint64_t v11 = [v8 executeWithNamedBindings:v9 usingBlock:0 error:&v16];
    id v12 = v16;
    if ((v11 & 1) == 0)
    {
      id v13 = +[EDPersistenceDatabaseConnection log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = objc_msgSend(v12, "ef_publicDescription");
        -[EDPersistenceDatabaseConnection _storeTransactionWriteGenerationWithSQLConnection:newGeneration:](v14, buf, v13);
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (int64_t)transactionGeneration
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  char v3 = [v2 threadDictionary];

  char v4 = [v3 objectForKeyedSubscript:@"_EDPersistenceDatabaseConnectionTransactionGeneration"];
  int64_t v5 = [v4 longLongValue];

  return v5;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)EDPersistenceDatabaseConnection;
  char v4 = [(EDPersistenceDatabaseConnection *)&v11 description];
  BOOL v5 = [(EDPersistenceDatabaseConnection *)self isWriter];
  uint64_t v6 = [(EDPersistenceDatabaseConnection *)self sqlConnection];
  id v7 = (void *)v6;
  uint64_t v8 = @"NO";
  if (v5) {
    uint64_t v8 = @"YES";
  }
  id v9 = (void *)[v3 initWithFormat:@"[%@ isWriter: %@, SQL connection: %@]", v4, v8, v6];

  return (NSString *)v9;
}

- (BOOL)attachProtectedDatabaseWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(EDPersistenceDatabaseConnection *)self delegate];
  uint64_t v8 = [(EDPersistenceDatabaseConnection *)self delegate];
  id v9 = [v8 protectedDatabasePath];
  uint64_t v10 = objc_msgSend(v7, "urlForDatabasePath:type:", v9, -[EDPersistenceDatabaseConnection _adjustedDatabaseTypeForType:]((uint64_t)self, 1));

  LOBYTE(v7) = [(EDPersistenceDatabaseConnection *)self attachProtectedDatabaseWithName:v6 url:v10 error:a4];
  return (char)v7;
}

- (BOOL)attachProtectedDatabaseWithName:(id)a3 url:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(EDPersistenceDatabaseConnection *)self protectedDatabaseAttached]
    || !-[EDPersistenceDatabaseConnection _attachDatabaseWithName:url:error:](self, v8, v9, (uint64_t)a5))
  {
    BOOL v12 = 0;
  }
  else
  {
    if (self) {
      objc_setProperty_nonatomic_copy(self, v10, v8, 16);
    }
    objc_super v11 = +[EDPersistenceDatabaseConnection log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      uint64_t v15 = self;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Attached Protected Index on connection %{public}@", (uint8_t *)&v14, 0xCu);
    }

    BOOL v12 = 1;
  }

  return v12;
}

- (uint64_t)_adjustedDatabaseTypeForType:(uint64_t)result
{
  if (result)
  {
    id v3 = [(id)result basePath];

    if (v3) {
      return a2;
    }
    else {
      return 3;
    }
  }
  return result;
}

- (void)close
{
  id v3 = [(EDPersistenceDatabaseConnection *)self sqlConnection];
  id v7 = 0;
  char v4 = [v3 finalizeStatementsWithError:&v7];
  id v5 = v7;

  if ((v4 & 1) == 0) {
    [(EDPersistenceDatabaseConnection *)self handleError:v5 message:@"Unable to finalize statements"];
  }
  if ([(EDPersistenceDatabaseConnection *)self protectedDatabaseAttached]) {
    [(EDPersistenceDatabaseConnection *)self detachProtectedDatabase];
  }
  if ([(EDPersistenceDatabaseConnection *)self journalDatabaseAttached]) {
    [(EDPersistenceDatabaseConnection *)self detachJournalDatabase];
  }
  id v6 = [(EDPersistenceDatabaseConnection *)self sqlConnection];
  [v6 close];
}

- (void)detachProtectedDatabase
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(EDPersistenceDatabaseConnection *)self protectedDatabaseAttached])
  {
    if (self) {
      protectedDatabaseName = self->_protectedDatabaseName;
    }
    else {
      protectedDatabaseName = 0;
    }
    int v5 = -[EDPersistenceDatabaseConnection _detachDatabaseWithName:](self, protectedDatabaseName);
    if (self) {
      objc_setProperty_nonatomic_copy(self, v4, 0, 16);
    }
    if (v5)
    {
      id v6 = +[EDPersistenceDatabaseConnection log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138543362;
        id v8 = self;
        _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Detached Protected Index on connection %{public}@", (uint8_t *)&v7, 0xCu);
      }
    }
    else
    {
      [(EDPersistenceDatabaseConnection *)self close];
      [(EDPersistenceDatabaseConnection *)self open];
    }
  }
}

- (void)dealloc
{
  [(EDPersistenceDatabaseConnection *)self close];
  v3.receiver = self;
  v3.super_class = (Class)EDPersistenceDatabaseConnection;
  [(EDPersistenceDatabaseConnection *)&v3 dealloc];
}

- (int)configureSQLConnection
{
  char v4 = [(EDPersistenceDatabaseConnection *)self sqlConnection];
  char v5 = [v4 isOpen];

  if ((v5 & 1) == 0)
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"EDPersistenceDatabaseConnection.m" lineNumber:357 description:@"configureSQLConnection called on a closed connection"];
  }
  id v6 = [(EDPersistenceDatabaseConnection *)self sqlConnection];
  int v7 = (sqlite3 *)[v6 sqlDB];

  uint64_t function = sqlite3_create_function(v7, "and64", 2, 1, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))and64, 0, 0);
  [(EDPersistenceDatabaseConnection *)self handleSQLResult:function message:@"error creating user function and64"];
  if (!function)
  {
    uint64_t v9 = sqlite3_exec(v7, "PRAGMA foreign_keys = ON;", 0, 0, 0);
    if (v9)
    {
      uint64_t function = v9;
      uint64_t v10 = @"error enabling foreign key support";
LABEL_8:
      [(EDPersistenceDatabaseConnection *)self handleSQLResult:function message:v10];
      return function;
    }
    uint64_t function = sqlite3_busy_timeout(v7, 0x7FFFFFFF);
    if (function)
    {
      uint64_t v10 = @"error setting busy timeout";
      goto LABEL_8;
    }
  }
  return function;
}

- (void)open
{
  id v12 = [(EDPersistenceDatabaseConnection *)self sqlConnection];
  int v4 = [v12 isOpen];

  if (v4)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"EDPersistenceDatabaseConnection.m" lineNumber:297 description:@"EDPersistenceDatabaseConnection open called when already open"];
  }
  id v13 = [(EDPersistenceDatabaseConnection *)self sqlConnection];
  char v5 = [v13 url];
  id v6 = [v5 path];
  int v7 = (const char *)[v6 fileSystemRepresentation];

  if (([v13 openWithError:0] & 1) == 0)
  {
    id v8 = [(EDPersistenceDatabaseConnection *)self basePath];

    if (!v8
      || ([MEMORY[0x1E4F28CB8] defaultManager],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          [(EDPersistenceDatabaseConnection *)self basePath],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:0],
          v10,
          v9,
          ([v13 openWithError:0] & 1) == 0))
    {
      objc_super v11 = [(EDPersistenceDatabaseConnection *)self basePath];

      if (!v11) {
        goto LABEL_20;
      }
      if (self && v7) {
        chmod(v7, 0x180u);
      }
      if (![v13 openWithError:0]) {
        goto LABEL_20;
      }
    }
  }
  if ([v13 isOpen]
    && [(EDPersistenceDatabaseConnection *)self configureSQLConnection])
  {
LABEL_20:
    if ([v13 isOpen])
    {
      [v13 finalizeStatementsWithError:0];
      [v13 close];
    }
  }
}

- (uint64_t)_attachDatabaseWithName:(void *)a3 url:(uint64_t)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    if (![a1 sqlDB])
    {
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:sel__attachDatabaseWithName_url_error_ object:a1 file:@"EDPersistenceDatabaseConnection.m" lineNumber:770 description:@"Attaching database when not open"];
    }
    uint64_t v9 = +[EDPersistenceDatabaseConnection log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[EDPersistenceDatabaseConnection _attachDatabaseWithName:url:error:]((uint64_t)v7);
    }

    uint64_t v10 = [a1 sqlConnection];
    objc_super v11 = NSString;
    id v12 = [v8 absoluteString];
    id v13 = objc_msgSend(v12, "ef_quotedSQLEscapedString");
    id v14 = [v11 stringWithFormat:@"ATTACH DATABASE %@ AS %@", v13, v7];

    uint64_t v15 = [v10 executeStatementString:v14 error:a4];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (uint64_t)_detachDatabaseWithName:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (![a1 sqlDB])
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel__detachDatabaseWithName_ object:a1 file:@"EDPersistenceDatabaseConnection.m" lineNumber:781 description:@"Detaching database when not open"];
    }
    int v4 = (void *)[[NSString alloc] initWithFormat:@"DETACH DATABASE %@", v3];
    char v5 = [a1 sqlConnection];
    id v11 = 0;
    uint64_t v6 = [v5 executeStatementString:v4 error:&v11];
    id v7 = v11;

    if ((v6 & 1) == 0)
    {
      id v8 = (void *)[[NSString alloc] initWithFormat:@"detaching %@", v3];
      [a1 handleError:v7 message:v8];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (sqlite3)sqlDB
{
  int v4 = [(EDPersistenceDatabaseConnection *)self sqlConnection];
  char v5 = (sqlite3 *)[v4 sqlDB];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"EDPersistenceDatabaseConnection.m" lineNumber:292 description:@"We have a database connection without a sql database pointer"];
  }
  return v5;
}

void __64__EDPersistenceDatabaseConnection_executeUpdateStatement_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  char v5 = objc_msgSend(a3, "ef_SQLBinding");
  [v5 bindToStatement:*(void *)(a1 + 32) usingName:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionLabel, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_sqlConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_journal, 0);
  objc_storeStrong((id *)&self->_journalDatabaseName, 0);

  objc_storeStrong((id *)&self->_protectedDatabaseName, 0);
}

- (void)assignTombstonesForIdentifiers:(uint64_t)a3 type:(uint64_t)a4 transaction:
{
  id v7 = a2;
  id v8 = v7;
  if (a1 && [v7 count])
  {
    uint64_t v9 = objc_msgSend(v8, "ef_mapSelector:", sel_ef_quotedSQLEscapedString);
    uint64_t v10 = [v9 componentsJoinedByString:@","];
    if (a4 < 0) {
      uint64_t v11 = [[NSString alloc] initWithFormat:@"DELETE FROM searchable_message_tombstones WHERE type = %lld AND identifier IN (%@)", a3, v10];
    }
    else {
      uint64_t v11 = [[NSString alloc] initWithFormat:@"UPDATE searchable_message_tombstones SET transaction_id = %lld WHERE type = %lld AND identifier IN (%@)", a4, a3, v10];
    }
    id v12 = (void *)v11;
    id v13 = [a1 preparedStatementForQueryString:v11];
    id v16 = 0;
    char v14 = [v13 executeUsingBlock:0 error:&v16];
    id v15 = v16;
    if ((v14 & 1) == 0) {
      [a1 handleError:v15 message:@"Updating or deleting searchable_message_tombstones"];
    }
  }
}

- (BOOL)executeUpdateStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 queryString];
  id v8 = [(EDPersistenceDatabaseConnection *)self preparedStatementForQueryString:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__EDPersistenceDatabaseConnection_executeUpdateStatement_error___block_invoke;
    v13[3] = &unk_1E6C04408;
    id v10 = v8;
    id v14 = v10;
    [v6 enumerateBindingNamesAndValuesUsingBlock:v13];
    char v11 = -[EDPersistenceDatabaseConnection _executePreparedStatement:withBlock:description:error:](self, v10, 0, @"UPDATE statement", (uint64_t *)a4);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)selectIdentifiersForTombstonesOfType:(void *)a1
{
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT identifier FROM searchable_message_tombstones WHERE transaction_id IS NULL AND type = %lld", a2);
    id v6 = [a1 preparedStatementForQueryString:v5];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __102__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectIdentifiersForTombstonesOfType___block_invoke;
    v14[3] = &unk_1E6BFF3B0;
    id v7 = v4;
    id v15 = v7;
    id v13 = 0;
    char v8 = [v6 executeUsingBlock:v14 error:&v13];
    id v9 = v13;
    if ((v8 & 1) == 0) {
      [a1 handleError:v9 message:@"searching for tombstone identifiers"];
    }
    id v10 = v15;
    id v11 = v7;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)selectIdentifiersForDeletedMessages
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v3 = [a1 preparedStatementForQueryString:@"SELECT message_id FROM searchable_messages WHERE message is NULL"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __100__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectIdentifiersForDeletedMessages__block_invoke;
    v11[3] = &unk_1E6BFF3B0;
    id v4 = v2;
    id v12 = v4;
    id v10 = 0;
    char v5 = [v3 executeUsingBlock:v11 error:&v10];
    id v6 = v10;
    if ((v5 & 1) == 0) {
      [a1 handleError:v6 message:@"searching for removed identifiers"];
    }
    id v7 = v12;
    id v8 = v4;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)selectIdentifiersForDeletedAttachments
{
  if (a1)
  {
    a1 = -[EDPersistenceDatabaseConnection identifiersForAttachmentsWithQuery:](a1, @"SELECT attachment_id FROM searchable_attachments WHERE attachment is NULL");
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)identifiersForAttachmentsWithQuery:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v5 = [a1 preparedStatementForQueryString:v3];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __100__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__identifiersForAttachmentsWithQuery___block_invoke;
    v13[3] = &unk_1E6BFF3B0;
    id v6 = v4;
    id v14 = v6;
    id v12 = 0;
    char v7 = [v5 executeUsingBlock:v13 error:&v12];
    id v8 = v12;
    if ((v7 & 1) == 0) {
      [a1 handleError:v8 message:@"searching for removed attachment identifiers"];
    }
    id v9 = v14;
    id v10 = v6;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)executeDeleteStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = v6;
  if (a4)
  {
    id v8 = [(EDPersistenceDatabaseConnection *)self sqlConnection];
    id v9 = [v7 queryString];
    LOBYTE(a4) = [v8 executeStatementString:v9 error:a4];
  }
  else
  {
    id v8 = [v6 queryString];
    a4 = (id *)[(EDPersistenceDatabaseConnection *)self executeStatementString:v8 errorMessage:@"Error while executing DELETE statement"];
  }

  return (char)a4;
}

void __38__EDPersistenceDatabaseConnection_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)log_log_68;
  log_log_68 = (uint64_t)v1;
}

- (EDPersistenceDatabaseConnection)init
{
}

- (id)initForInMemoryDatabaseIsWriter:(BOOL)a3 delegate:(id)a4
{
  return [(EDPersistenceDatabaseConnection *)self initWithBasePath:0 databaseName:@":memory:" isWriter:a3 delegate:a4];
}

- (EDPersistenceDatabaseConnection)initWithSQLDB:(sqlite3 *)a3 isWriter:(BOOL)a4 delegate:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EDPersistenceDatabaseConnection;
  id v9 = [(EDPersistenceDatabaseConnection *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_isWriter = a4;
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F60E90]) initWithSQLDB:a3];
    sqlConnection = v10->_sqlConnection;
    v10->_sqlConnection = (EFSQLConnection *)v11;
  }
  return v10;
}

- (BOOL)executeInsertStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 isEmpty])
  {
    char v7 = 1;
  }
  else
  {
    id v8 = [v6 queryString];
    id v9 = [(EDPersistenceDatabaseConnection *)self preparedStatementForQueryString:v8];
    id v10 = v9;
    if (v9)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64__EDPersistenceDatabaseConnection_executeInsertStatement_error___block_invoke;
      v13[3] = &unk_1E6C043E0;
      id v11 = v9;
      id v14 = v11;
      [v6 enumerateBindingIndicesAndValuesUsingBlock:v13];
      char v7 = -[EDPersistenceDatabaseConnection _executePreparedStatement:withBlock:description:error:](self, v11, 0, @"INSERT statement", (uint64_t *)a4);
    }
    else
    {
      char v7 = 0;
    }
  }
  return v7;
}

void __64__EDPersistenceDatabaseConnection_executeInsertStatement_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "ef_SQLBinding");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 bindToStatement:*(void *)(a1 + 32) usingIndex:a2];
}

- (BOOL)executeInsertStatement:(id)a3 rowsChanged:(unint64_t *)a4
{
  id v6 = a3;
  BOOL v7 = [(EDPersistenceDatabaseConnection *)self executeInsertStatement:v6 error:0];
  if (a4) {
    *a4 = sqlite3_changes([(EDPersistenceDatabaseConnection *)self sqlDB]);
  }

  return v7;
}

- (BOOL)executeUpdateStatement:(id)a3 rowsChanged:(unint64_t *)a4
{
  id v6 = a3;
  BOOL v7 = [(EDPersistenceDatabaseConnection *)self executeUpdateStatement:v6 error:0];
  if (a4) {
    *a4 = sqlite3_changes([(EDPersistenceDatabaseConnection *)self sqlDB]);
  }

  return v7;
}

- (BOOL)executeUpsertStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 isEmpty])
  {
    char v7 = 1;
  }
  else
  {
    id v8 = [v6 queryString];
    id v9 = [(EDPersistenceDatabaseConnection *)self preparedStatementForQueryString:v8];
    id v10 = v9;
    if (v9)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64__EDPersistenceDatabaseConnection_executeUpsertStatement_error___block_invoke;
      v13[3] = &unk_1E6C04408;
      id v11 = v9;
      id v14 = v11;
      [v6 enumerateBindingNamesAndValuesUsingBlock:v13];
      char v7 = -[EDPersistenceDatabaseConnection _executePreparedStatement:withBlock:description:error:](self, v11, 0, @"UPSERT statement", (uint64_t *)a4);
    }
    else
    {
      char v7 = 0;
    }
  }
  return v7;
}

void __64__EDPersistenceDatabaseConnection_executeUpsertStatement_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = objc_msgSend(a3, "ef_SQLBinding");
  [v5 bindToStatement:*(void *)(a1 + 32) usingName:v6];
}

- (BOOL)executeUpsertStatement:(id)a3 rowsChanged:(unint64_t *)a4
{
  id v6 = a3;
  BOOL v7 = [(EDPersistenceDatabaseConnection *)self executeUpsertStatement:v6 error:0];
  if (a4) {
    *a4 = sqlite3_changes([(EDPersistenceDatabaseConnection *)self sqlDB]);
  }

  return v7;
}

- (BOOL)executeDeleteStatement:(id)a3 rowsChanged:(unint64_t *)a4
{
  id v6 = a3;
  BOOL v7 = [(EDPersistenceDatabaseConnection *)self executeDeleteStatement:v6 error:0];
  if (a4) {
    *a4 = sqlite3_changes([(EDPersistenceDatabaseConnection *)self sqlDB]);
  }

  return v7;
}

- (BOOL)executeStatementString:(id)a3 errorMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDPersistenceDatabaseConnection *)self sqlConnection];
  id v12 = 0;
  char v9 = [v8 executeStatementString:v6 error:&v12];
  id v10 = v12;

  if ((v9 & 1) == 0) {
    [(EDPersistenceDatabaseConnection *)self handleError:v10 message:v7];
  }

  return v9;
}

- (id)databaseIDsForSelectStatement:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F60DB8]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__EDPersistenceDatabaseConnection_databaseIDsForSelectStatement___block_invoke;
  v8[3] = &unk_1E6BFF3B0;
  id v6 = v5;
  id v9 = v6;
  [(EDPersistenceDatabaseConnection *)self executeSelectStatement:v4 withBlock:v8 error:0];

  return v6;
}

void __65__EDPersistenceDatabaseConnection_databaseIDsForSelectStatement___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 databaseIDValue];

  [*(id *)(a1 + 32) addIndex:v4];
}

- (unint64_t)rowsChanged
{
  return sqlite3_changes([(EDPersistenceDatabaseConnection *)self sqlDB]);
}

- (int64_t)lastInsertedDatabaseID
{
  id v2 = [(EDPersistenceDatabaseConnection *)self sqlDB];

  return sqlite3_last_insert_rowid(v2);
}

- (void)clearLastInsertedDatabaseID
{
  id v2 = [(EDPersistenceDatabaseConnection *)self sqlDB];

  sqlite3_set_last_insert_rowid(v2, 0);
}

- (int64_t)transactionTypeForWriting
{
  return 2;
}

- (BOOL)checkForConnectionErrorWithMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sqlite3_errcode([(EDPersistenceDatabaseConnection *)self sqlDB]);
  [(EDPersistenceDatabaseConnection *)self handleSQLResult:v5 message:v4];
  BOOL v6 = v5 == 9;
  if (!v5) {
    BOOL v6 = 1;
  }
  BOOL v7 = (v5 - 100) < 2 || v6;

  return v7;
}

- (void)handleError:(id)a3 message:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    BOOL v7 = [v9 domain];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F60D10]];

    if (v8) {
      -[EDPersistenceDatabaseConnection handleSQLResult:message:](self, "handleSQLResult:message:", [v9 code], v6);
    }
  }
}

- (void)handleSQLResult:(int)a3 message:(id)a4
{
  id v6 = a4;
  [(EDPersistenceDatabaseConnection *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDPersistenceDatabaseConnection handleSQLResult:message:]", "EDPersistenceDatabaseConnection.m", 566, "0");
}

- (NSString)fullPath
{
  id v2 = [(EDPersistenceDatabaseConnection *)self sqlConnection];
  id v3 = [v2 url];
  id v4 = [v3 path];

  return (NSString *)v4;
}

- (BOOL)databaseIsAttached:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v5 = [(EDPersistenceDatabaseConnection *)self preparedStatementForQueryString:@"PRAGMA database_list"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__EDPersistenceDatabaseConnection_databaseIsAttached___block_invoke;
  v12[3] = &unk_1E6BFFF90;
  id v6 = v4;
  id v13 = v6;
  id v14 = &v15;
  id v11 = 0;
  char v7 = [v5 executeUsingBlock:v12 error:&v11];
  id v8 = v11;
  if ((v7 & 1) == 0) {
    [(EDPersistenceDatabaseConnection *)self handleError:v8 message:@"Getting attached databases"];
  }
  char v9 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __54__EDPersistenceDatabaseConnection_databaseIsAttached___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 objectAtIndexedSubscript:1];
  char v7 = [v6 stringValue];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)tableExists:(id)a3
{
  return [(EDPersistenceDatabaseConnection *)self tableExists:a3 inDatabase:0];
}

- (BOOL)tableExists:(id)a3 inDatabase:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  if (v7) {
    int v8 = (__CFString *)[[NSString alloc] initWithFormat:@"SELECT 1 FROM %@.sqlite_master WHERE name = ? AND type = 'table'", v7];
  }
  else {
    int v8 = @"SELECT 1 FROM sqlite_master WHERE name = ? AND type = 'table'";
  }
  char v9 = [(EDPersistenceDatabaseConnection *)self preparedStatementForQueryString:v8];
  v21[0] = v6;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v15 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__EDPersistenceDatabaseConnection_tableExists_inDatabase___block_invoke;
  v16[3] = &unk_1E6BFF4C8;
  v16[4] = &v17;
  char v11 = [v9 executeWithIndexedBindings:v10 usingBlock:v16 error:&v15];
  id v12 = v15;

  if ((v11 & 1) == 0) {
    [(EDPersistenceDatabaseConnection *)self handleError:v12 message:@"Checking for existence of table"];
  }
  BOOL v13 = *((unsigned char *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v13;
}

uint64_t __58__EDPersistenceDatabaseConnection_tableExists_inDatabase___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

- (BOOL)columnExists:(id)a3 inTable:(id)a4 type:(unint64_t *)a5
{
  return [(EDPersistenceDatabaseConnection *)self columnExists:a3 inTable:a4 database:0 type:a5];
}

- (BOOL)columnExists:(id)a3 inTable:(id)a4 database:(id)a5 type:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 1;
  if (v12) {
    uint64_t v13 = [[NSString alloc] initWithFormat:@"PRAGMA %@.table_info(%@)", v12, v11];
  }
  else {
    uint64_t v13 = [[NSString alloc] initWithFormat:@"PRAGMA table_info(%@)", v11];
  }
  id v14 = (void *)v13;
  id v15 = [(EDPersistenceDatabaseConnection *)self preparedStatementForQueryString:v13];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__EDPersistenceDatabaseConnection_columnExists_inTable_database_type___block_invoke;
  v22[3] = &unk_1E6C04430;
  id v16 = v10;
  id v23 = v16;
  v24 = &v30;
  v25 = &v26;
  id v21 = 0;
  char v17 = [v15 executeUsingBlock:v22 error:&v21];
  id v18 = v21;
  if ((v17 & 1) == 0) {
    [(EDPersistenceDatabaseConnection *)self handleError:v18 message:@"Fetching column type"];
  }
  if (a6) {
    *a6 = v27[3];
  }
  char v19 = *((unsigned char *)v31 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v19;
}

void __70__EDPersistenceDatabaseConnection_columnExists_inTable_database_type___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  id v6 = [v11 objectAtIndexedSubscript:1];
  id v7 = [v6 stringValue];

  if ([v7 isEqualToString:a1[4]])
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    int v8 = (void *)MEMORY[0x1E4F60E80];
    char v9 = [v11 objectAtIndexedSubscript:2];
    id v10 = [v9 stringValue];
    *(void *)(*(void *)(a1[6] + 8) + 24) = [v8 columnTypeForString:v10];

    *a4 = 1;
  }
}

- (BOOL)attachProtectedDatabaseWithName:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  BOOL v5 = [(EDPersistenceDatabaseConnection *)self attachProtectedDatabaseWithName:v4 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"attaching %@", v4];
    [(EDPersistenceDatabaseConnection *)self handleError:v6 message:v7];
  }
  return v5;
}

- (BOOL)attachJournalDatabase:(id)a3 withName:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(EDPersistenceDatabaseConnection *)self journalDatabaseAttached])
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    id v11 = [(EDPersistenceDatabaseConnection *)self delegate];
    id v12 = [v8 path];
    uint64_t v13 = objc_msgSend(v11, "urlForDatabasePath:type:", v12, -[EDPersistenceDatabaseConnection _adjustedDatabaseTypeForType:]((uint64_t)self, 2));

    int v10 = -[EDPersistenceDatabaseConnection _attachDatabaseWithName:url:error:](self, v9, v13, (uint64_t)a5);
    if (v10)
    {
      if (self) {
        objc_setProperty_nonatomic_copy(self, v14, v9, 24);
      }
      -[EDPersistenceDatabaseConnection setJournal:]((uint64_t)self, v8);
      [v8 checkOut];
      id v15 = +[EDPersistenceDatabaseConnection log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        id v18 = self;
        _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Attached journal on connection %{public}@", (uint8_t *)&v17, 0xCu);
      }
    }
  }

  return v10;
}

- (void)setJournal:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (BOOL)attachJournalDatabase:(id)a3 withName:(id)a4
{
  id v6 = a4;
  id v11 = 0;
  BOOL v7 = [(EDPersistenceDatabaseConnection *)self attachJournalDatabase:a3 withName:v6 error:&v11];
  id v8 = v11;
  if (!v7)
  {
    id v9 = (void *)[[NSString alloc] initWithFormat:@"attaching %@", v6];
    [(EDPersistenceDatabaseConnection *)self handleError:v8 message:v9];
  }
  return v7;
}

- (BOOL)detachJournalDatabase
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = [(EDPersistenceDatabaseConnection *)self journalDatabaseAttached];
  if (v3)
  {
    id v4 = self ? self->_journalDatabaseName : 0;
    int v3 = -[EDPersistenceDatabaseConnection _detachDatabaseWithName:](self, v4);
    if (v3)
    {
      if (self)
      {
        [(EDPersistenceDatabaseJournal *)self->_journal checkIn];
        -[EDPersistenceDatabaseConnection setJournal:]((uint64_t)self, 0);
        objc_setProperty_nonatomic_copy(self, v5, 0, 24);
      }
      else
      {
        [0 checkIn];
        -[EDPersistenceDatabaseConnection setJournal:](0, 0);
      }
      id v6 = +[EDPersistenceDatabaseConnection log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138543362;
        id v9 = self;
        _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Detached journal on connection %{public}@", (uint8_t *)&v8, 0xCu);
      }

      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)selectLastProcessedAttachmentID
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x3032000000;
    id v11 = __Block_byref_object_copy__35;
    id v12 = __Block_byref_object_dispose__35;
    id v13 = 0;
    id v2 = [NSString stringWithFormat:@"SELECT value FROM properties WHERE key = '%@'", @"com.apple.mail.searchableIndex.lastProcessedAttachmentIDKey"];
    int v3 = [v1 preparedStatementForQueryString:v2];

    id v6 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __96__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectLastProcessedAttachmentID__block_invoke;
    v7[3] = &unk_1E6BFF4C8;
    v7[4] = &v8;
    [v3 executeUsingBlock:v7 error:&v6];
    id v4 = v6;
    [v1 handleError:v4 message:@"Selecting previous conversation daily export sync anchor"];
    id v1 = (id)v9[5];

    _Block_object_dispose(&v8, 8);
  }

  return v1;
}

void __96__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectLastProcessedAttachmentID__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  int v3 = [v8 objectForKeyedSubscript:@"value"];
  uint64_t v4 = [v3 databaseIDValue];

  if (v4)
  {
    SEL v5 = [[EDPersistedAttachmentID alloc] initWithDatabaseID:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    BOOL v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (uint64_t)setLastProcessedAttachmentID:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 preparedStatementForQueryString:@"INSERT OR REPLACE INTO properties (key, value) VALUES (:key, :value)"];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v5 setObject:@"com.apple.mail.searchableIndex.lastProcessedAttachmentIDKey" forKeyedSubscript:@":key"];
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "databaseID"));
    [v5 setObject:v6 forKeyedSubscript:@":value"];

    id v10 = 0;
    uint64_t v7 = [v4 executeWithNamedBindings:v5 usingBlock:0 error:&v10];
    id v8 = v10;
    if ((v7 & 1) == 0) {
      [a1 handleError:v8 message:@"Setting latest value for lastProcessAttachmentID"];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)attachmentDataForMessageWithIdentifier:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = [NSString stringWithFormat:@"SELECT ma.ROWID, m.ROWID, ma.mime_part_number, ma.name, m.mailbox FROM messages AS m LEFT OUTER JOIN message_attachments AS ma ON (ma.global_message_id = m.global_message_id) LEFT OUTER JOIN searchable_attachments AS s ON (ma.ROWID = s.attachment_id) WHERE m.ROWID = %d AND s.attachment_id IS NULL AND ma.attachment IS NOT NULL", objc_msgSend(v3, "intValue")];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = [a1 preparedStatementForQueryString:v5];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __104__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__attachmentDataForMessageWithIdentifier___block_invoke;
    v15[3] = &unk_1E6BFF3B0;
    id v8 = v6;
    id v16 = v8;
    id v14 = 0;
    char v9 = [v7 executeUsingBlock:v15 error:&v14];
    id v10 = v14;
    if ((v9 & 1) == 0) {
      [a1 handleError:v10 message:@"Searching for attachment data for message identifier"];
    }
    id v11 = v16;
    id v12 = v8;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __104__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__attachmentDataForMessageWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  id v3 = [EDPersistedAttachmentID alloc];
  uint64_t v4 = [v16 objectAtIndexedSubscript:0];
  id v5 = -[EDPersistedAttachmentID initWithDatabaseID:](v3, "initWithDatabaseID:", [v4 databaseIDValue]);

  id v6 = [EDPersistedMessageID alloc];
  uint64_t v7 = [v16 objectAtIndexedSubscript:1];
  id v8 = -[EDPersistedMessageID initWithDatabaseID:](v6, "initWithDatabaseID:", [v7 databaseIDValue]);

  char v9 = [v16 objectAtIndexedSubscript:2];
  id v10 = [v9 stringValue];

  id v11 = [v16 objectAtIndexedSubscript:3];
  id v12 = [v11 stringValue];

  id v13 = [v16 objectAtIndexedSubscript:4];
  uint64_t v14 = [v13 databaseIDValue];

  id v15 = [[EDSearchableIndexPersistenceAttachmentDatum alloc] initWithAttachmentPersistentID:v5 messagePersistentID:v8 attachmentID:v10 name:v12 mailboxID:v14];
  [*(id *)(a1 + 32) addObject:v15];
}

- (id)attachmentDataForItemsRequiringIndexingExcludingIDs:(void *)a3 lastProcessedAttachmentID:(uint64_t)a4 limit:(void *)a5 cancelationToken:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    id v12 = [NSString stringWithFormat:@"SELECT ma.ROWID, m.ROWID, ma.mime_part_number, ma.name, m.mailbox FROM messages AS m LEFT OUTER JOIN message_attachments AS ma ON (ma.global_message_id = m.global_message_id) LEFT OUTER JOIN searchable_attachments AS s ON (ma.ROWID = s.attachment_id) WHERE ma.ROWID > %lld AND s.attachment_id IS NULL AND ma.attachment IS NOT NULL ORDER BY m.ROWID", objc_msgSend(v10, "databaseID")];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v14 = [a1 preparedStatementForQueryString:v12];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __166__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__attachmentDataForItemsRequiringIndexingExcludingIDs_lastProcessedAttachmentID_limit_cancelationToken___block_invoke;
    v22[3] = &unk_1E6C05A48;
    id v23 = v11;
    id v24 = v9;
    id v15 = v13;
    id v25 = v15;
    uint64_t v26 = a4;
    id v21 = 0;
    char v16 = [v14 executeUsingBlock:v22 error:&v21];
    id v17 = v21;
    if ((v16 & 1) == 0) {
      [a1 handleError:v17 message:@"Searching for attachments to index"];
    }
    id v18 = v25;
    id v19 = v15;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

void __166__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__attachmentDataForItemsRequiringIndexingExcludingIDs_lastProcessedAttachmentID_limit_cancelationToken___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v19 = a2;
  if ([*(id *)(a1 + 32) isCanceled])
  {
    *a4 = 1;
  }
  else
  {
    id v6 = [EDPersistedAttachmentID alloc];
    uint64_t v7 = [v19 objectAtIndexedSubscript:0];
    id v8 = -[EDPersistedAttachmentID initWithDatabaseID:](v6, "initWithDatabaseID:", [v7 databaseIDValue]);

    if (([*(id *)(a1 + 40) containsObject:v8] & 1) == 0)
    {
      id v9 = [EDPersistedMessageID alloc];
      id v10 = [v19 objectAtIndexedSubscript:1];
      id v11 = -[EDPersistedMessageID initWithDatabaseID:](v9, "initWithDatabaseID:", [v10 databaseIDValue]);

      id v12 = [v19 objectAtIndexedSubscript:2];
      id v13 = [v12 stringValue];

      uint64_t v14 = [v19 objectAtIndexedSubscript:3];
      id v15 = [v14 stringValue];

      char v16 = [v19 objectAtIndexedSubscript:4];
      uint64_t v17 = [v16 databaseIDValue];

      id v18 = [[EDSearchableIndexPersistenceAttachmentDatum alloc] initWithAttachmentPersistentID:v8 messagePersistentID:v11 attachmentID:v13 name:v15 mailboxID:v17];
      [*(id *)(a1 + 48) addObject:v18];
      if ((unint64_t)[*(id *)(a1 + 48) count] >= *(void *)(a1 + 56)) {
        *a4 = 1;
      }
    }
  }
}

void __100__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__identifiersForAttachmentsWithQuery___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [EDPersistedAttachmentID alloc];
  uint64_t v4 = [v7 objectAtIndexedSubscript:0];
  id v5 = -[EDPersistedAttachmentID initWithDatabaseID:](v3, "initWithDatabaseID:", [v4 databaseIDValue]);

  id v6 = +[EDSearchableIndexAttachmentItem identifierForAttachmentPersistentID:v5];
  [*(id *)(a1 + 32) addObject:v6];
}

- (id)selectAttachmentIdentifiersForTransactions:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = [v3 componentsJoinedByString:@","];
    id v6 = [NSString stringWithFormat:@"SELECT attachment_id FROM searchable_attachments WHERE transaction_id in (%@)", v5];
    a1 = -[EDPersistenceDatabaseConnection identifiersForAttachmentsWithQuery:](a1, v6);
  }

  return a1;
}

- (id)selectAttachmentIdentifiersForMessages:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = objc_msgSend(v4, "ef_filter:", &__block_literal_global_73);

    id v7 = [v6 componentsJoinedByString:@","];
    id v8 = (void *)[[NSString alloc] initWithFormat:@"SELECT attachment_id FROM searchable_attachments WHERE message_id IN (%@)", v7];
    id v9 = [a1 preparedStatementForQueryString:v8];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __104__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectAttachmentIdentifiersForMessages___block_invoke_2;
    v17[3] = &unk_1E6BFF3B0;
    id v10 = v5;
    id v18 = v10;
    id v16 = 0;
    char v11 = [v9 executeUsingBlock:v17 error:&v16];
    id v12 = v16;
    if ((v11 & 1) == 0) {
      [a1 handleError:v12 message:@"searching for child attachment identifiers"];
    }
    id v13 = v18;
    id v14 = v10;
  }
  else
  {
    id v14 = 0;
    id v6 = v3;
  }

  return v14;
}

BOOL __104__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectAttachmentIdentifiersForMessages___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[EDSearchableIndexAttachmentItem attachmentPersistentIDFromItemIdentifier:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

void __104__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectAttachmentIdentifiersForMessages___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  BOOL v3 = [EDPersistedAttachmentID alloc];
  uint64_t v4 = [v7 objectAtIndexedSubscript:0];
  id v5 = -[EDPersistedAttachmentID initWithDatabaseID:](v3, "initWithDatabaseID:", [v4 databaseIDValue]);

  id v6 = +[EDSearchableIndexAttachmentItem identifierForAttachmentPersistentID:v5];
  [*(id *)(a1 + 32) addObject:v6];
}

- (id)assignIndexedAttachmentItems:(uint64_t)a3 transaction:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  uint64_t v29 = a1;
  if (a1)
  {
    if ([v5 count])
    {
      uint64_t v26 = v6;
      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v27 = (void *)[[NSString alloc] initWithFormat:@"INSERT OR REPLACE INTO searchable_attachments (attachment_id, attachment, message_id, transaction_id) VALUES (?, ?, ?, %lld)", a3];
      id v7 = [a1 preparedStatementForQueryString:v27];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id obj = v6;
      uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (!v8) {
        goto LABEL_16;
      }
      uint64_t v32 = *(void *)v35;
      uint64_t v30 = *MEMORY[0x1E4F60D10];
      while (1)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          char v11 = NSNumber;
          id v12 = [v10 attachmentID];
          id v13 = objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v12, "databaseID"));

          id v14 = NSNumber;
          id v15 = [v10 messageID];
          id v16 = objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v15, "databaseID"));

          v38[0] = v13;
          v38[1] = v13;
          v38[2] = v16;
          uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
          id v33 = 0;
          char v18 = [v7 executeWithIndexedBindings:v17 usingBlock:0 error:&v33];
          id v19 = v33;
          char v20 = v19;
          if ((v18 & 1) == 0)
          {
            id v21 = [v19 domain];
            if ([v21 isEqualToString:v30])
            {
              BOOL v22 = [v20 code] == 19;

              if (v22)
              {
                id v23 = [v10 attachmentID];
                id v24 = +[EDSearchableIndexAttachmentItem identifierForAttachmentPersistentID:v23];
                [v28 addObject:v24];

                goto LABEL_14;
              }
            }
            else
            {
            }
            [v29 handleError:v20 message:@"Adding to searchable_attachments"];
          }
LABEL_14:
          [v7 clearBindingsWithError:0];
          [v7 resetWithError:0];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (!v8)
        {
LABEL_16:

          id v6 = v26;
          goto LABEL_18;
        }
      }
    }
    id v28 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v28 = 0;
  }
LABEL_18:

  return v28;
}

- (void)deleteAttachmentsAfterTransaction:(void *)a1
{
  if (a1)
  {
    BOOL v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"DELETE FROM searchable_attachments WHERE transaction_id > %llu", a2);
    uint64_t v4 = [a1 preparedStatementForQueryString:v3];
    id v7 = 0;
    char v5 = [v4 executeUsingBlock:0 error:&v7];
    id v6 = v7;
    if ((v5 & 1) == 0) {
      [a1 handleError:v6 message:@"Invalidating searchable_attachments"];
    }
  }
}

- (void)deleteAttachmentsInTransactions:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    char v5 = [v3 componentsJoinedByString:@","];
    id v6 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM searchable_attachments WHERE transaction_id IN (%@)", v5];
    id v7 = [a1 preparedStatementForQueryString:v6];
    id v10 = 0;
    char v8 = [v7 executeUsingBlock:0 error:&v10];
    id v9 = v10;
    if ((v8 & 1) == 0) {
      [a1 handleError:v9 message:@"Failed to delete messages for items in searchable_attachments"];
    }
  }
}

- (void)deleteAttachmentsForMessage:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM searchable_attachments WHERE message_id = %@", v3];
    char v5 = [a1 preparedStatementForQueryString:v4];
    id v8 = 0;
    char v6 = [v5 executeUsingBlock:0 error:&v8];
    id v7 = v8;
    if ((v6 & 1) == 0) {
      [a1 handleError:v7 message:@"Removing message identifier from searchable_attachments"];
    }
  }
}

- (id)selectTransactionAndIndexTypeForMessage:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"SELECT transaction_id, reindex_type FROM searchable_messages WHERE message_id = %@", v3];
    char v5 = [a1 preparedStatementForQueryString:v4];
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__35;
    id v15 = __Block_byref_object_dispose__35;
    id v16 = 0;
    id v9 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __105__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectTransactionAndIndexTypeForMessage___block_invoke;
    v10[3] = &unk_1E6BFF4C8;
    v10[4] = &v11;
    char v6 = [v5 executeUsingBlock:v10 error:&v9];
    id v7 = v9;
    if ((v6 & 1) == 0) {
      [a1 handleError:v7 message:@"Searching for reindex type"];
    }
    a1 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return a1;
}

void __105__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectTransactionAndIndexTypeForMessage___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F60DF0]);
  uint64_t v4 = [v11 objectAtIndexedSubscript:0];
  char v5 = [v4 numberValue];
  char v6 = [v11 objectAtIndexedSubscript:1];
  id v7 = [v6 numberValue];
  uint64_t v8 = [v3 initWithFirst:v5 second:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)selectMessageIdentifiersForTransactions:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v5 = [v3 componentsJoinedByString:@","];
    char v6 = (void *)[[NSString alloc] initWithFormat:@"SELECT rowid FROM searchable_messages WHERE transaction_id IN (%@)", v5];
    id v7 = [a1 preparedStatementForQueryString:v6];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __105__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectMessageIdentifiersForTransactions___block_invoke;
    v15[3] = &unk_1E6BFF3B0;
    id v8 = v4;
    id v16 = v8;
    id v14 = 0;
    char v9 = [v7 executeUsingBlock:v15 error:&v14];
    id v10 = v14;
    if ((v9 & 1) == 0) {
      [a1 handleError:v10 message:@"Failed to get messages for transaction ids in searchable_messages"];
    }
    id v11 = v16;
    id v12 = v8;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __105__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectMessageIdentifiersForTransactions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 objectAtIndexedSubscript:0];
  id v3 = [v4 stringValue];
  [v2 addObject:v3];
}

- (void)deleteMessagesAfterTransaction:(void *)a1
{
  if (a1)
  {
    id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"DELETE FROM searchable_messages WHERE transaction_id > %llu", a2);
    id v4 = [a1 preparedStatementForQueryString:v3];
    id v7 = 0;
    char v5 = [v4 executeUsingBlock:0 error:&v7];
    id v6 = v7;
    if ((v5 & 1) == 0) {
      [a1 handleError:v6 message:@"Invalidating searchable_messages"];
    }
  }
}

- (void)deleteMessagesInTransactions:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    char v5 = [v3 componentsJoinedByString:@","];
    id v6 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM searchable_messages WHERE transaction_id IN (%@)", v5];
    id v7 = [a1 preparedStatementForQueryString:v6];
    id v10 = 0;
    char v8 = [v7 executeUsingBlock:0 error:&v10];
    id v9 = v10;
    if ((v8 & 1) == 0) {
      [a1 handleError:v9 message:@"Failed to delete messages for items in searchable_messages"];
    }
  }
}

void __100__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectIdentifiersForDeletedMessages__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectAtIndexedSubscript:0];
  id v4 = [v3 stringValue];

  [*(id *)(a1 + 32) addObject:v4];
}

- (id)selectMessageIDsFromBacklogWithBatchSize:(void *)a1
{
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT message_id FROM searchable_rebuild LIMIT %ld", a2);
    id v6 = [a1 preparedStatementForQueryString:v5];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __106__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectMessageIDsFromBacklogWithBatchSize___block_invoke;
    v14[3] = &unk_1E6BFF3B0;
    id v7 = v4;
    id v15 = v7;
    id v13 = 0;
    char v8 = [v6 executeUsingBlock:v14 error:&v13];
    id v9 = v13;
    if ((v8 & 1) == 0) {
      [a1 handleError:v9 message:@"Could not select message_id from searchable_rebuild table"];
    }
    id v10 = v15;
    id v11 = v7;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __106__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectMessageIDsFromBacklogWithBatchSize___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 objectAtIndexedSubscript:0];
  id v3 = [v4 numberValue];
  [v2 addObject:v3];
}

- (BOOL)selectIsReindexing
{
  BOOL v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F60EF8]);
    id v3 = (void *)[v2 initWithResultColumn:*MEMORY[0x1E4F60D08] table:@"searchable_rebuild"];
    [v3 setLimit:1];
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    id v6 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __83__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectIsReindexing__block_invoke;
    v7[3] = &unk_1E6BFF4C8;
    v7[4] = &v8;
    [(id)v1 executeSelectStatement:v3 withBlock:v7 error:&v6];
    id v4 = v6;
    if (v4) {
      [(id)v1 handleError:v4 message:@"Failed to query searchable_rebuild table to establish if it still has data"];
    }
    BOOL v1 = *((unsigned char *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  return v1;
}

uint64_t __83__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectIsReindexing__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __102__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectIdentifiersForTombstonesOfType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectAtIndexedSubscript:0];
  id v4 = [v3 stringValue];

  [*(id *)(a1 + 32) addObject:v4];
}

- (id)selectTombstoneIdentifiersForTransactions:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v5 = [v3 componentsJoinedByString:@","];
    id v6 = (void *)[[NSString alloc] initWithFormat:@"SELECT rowid FROM searchable_message_tombstones WHERE transaction_id IN (%@)", v5];
    id v7 = [a1 preparedStatementForQueryString:v6];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __107__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectTombstoneIdentifiersForTransactions___block_invoke;
    v15[3] = &unk_1E6BFF3B0;
    id v8 = v4;
    id v16 = v8;
    id v14 = 0;
    char v9 = [v7 executeUsingBlock:v15 error:&v14];
    id v10 = v14;
    if ((v9 & 1) == 0) {
      [a1 handleError:v10 message:@"Failed to get messages for transaction ids in searchable_message_tombstones"];
    }
    char v11 = v16;
    id v12 = v8;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __107__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectTombstoneIdentifiersForTransactions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 objectAtIndexedSubscript:0];
  id v3 = [v4 stringValue];
  [v2 addObject:v3];
}

- (void)addTombstonesForIdentifiers:(uint64_t)a3 type:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a1 && [v5 count])
  {
    id v15 = (void *)[[NSString alloc] initWithFormat:@"INSERT OR REPLACE INTO searchable_message_tombstones (type, identifier) VALUES (%lld, ?)", a3];
    id v7 = [a1 preparedStatementForQueryString:v15];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v21 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
          id v16 = 0;
          char v13 = [v7 executeWithIndexedBindings:v12 usingBlock:0 error:&v16];
          id v14 = v16;

          if ((v13 & 1) == 0) {
            [a1 handleError:v14 message:@"Adding to searchable_message_tombstones index"];
          }
          [v7 clearBindingsWithError:0];
          [v7 resetWithError:0];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v9);
    }
  }
}

- (void)clearTransactionsForTombstonesAfterTransaction:(void *)a1
{
  if (a1)
  {
    id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"UPDATE searchable_message_tombstones SET transaction_id = NULL WHERE transaction_id > %lld", a2);
    id v4 = [a1 preparedStatementForQueryString:v3];
    id v7 = 0;
    char v5 = [v4 executeUsingBlock:0 error:&v7];
    id v6 = v7;
    if ((v5 & 1) == 0) {
      [a1 handleError:v6 message:@"Invalidating searchable_message_tombstones"];
    }
  }
}

- (void)deleteTombstonesBeforeTransaction:(void *)a1
{
  if (a1)
  {
    id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"DELETE FROM searchable_message_tombstones WHERE transaction_id < %lld", a2);
    id v4 = [a1 preparedStatementForQueryString:v3];
    id v7 = 0;
    char v5 = [v4 executeUsingBlock:0 error:&v7];
    id v6 = v7;
    if ((v5 & 1) == 0) {
      [a1 handleError:v6 message:@"Purging searchable_message_tombstones"];
    }
  }
}

- (void)deleteTombstonesInTransactions:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    char v5 = [v3 componentsJoinedByString:@","];
    id v6 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM searchable_message_tombstones WHERE transaction_id IN (%@)", v5];
    id v7 = [a1 preparedStatementForQueryString:v6];
    id v10 = 0;
    char v8 = [v7 executeUsingBlock:0 error:&v10];
    id v9 = v10;
    if ((v8 & 1) == 0) {
      [a1 handleError:v9 message:@"Failed to delete messages for items in searchable_message_tombstones"];
    }
  }
}

- (id)selectDistinctTransactionIDs
{
  id v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v3 = [v1 preparedStatementForQueryString:@"SELECT DISTINCT transaction_id FROM searchable_messages"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __93__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectDistinctTransactionIDs__block_invoke;
    v9[3] = &unk_1E6BFF3B0;
    id v4 = v2;
    id v10 = v4;
    id v8 = 0;
    char v5 = [v3 executeUsingBlock:v9 error:&v8];
    id v6 = v8;
    if ((v5 & 1) == 0) {
      [v1 handleError:v6 message:@"Searching for distinct transaction identifiers"];
    }
    id v1 = (id)[v4 copy];
  }

  return v1;
}

void __93__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__selectDistinctTransactionIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectAtIndexedSubscript:0];
  id v4 = [v3 numberValue];

  if (v4 && [v4 longLongValue] >= 1) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (id)richLinkDataForItemsRequiringIndexingExcludingIdentifiers:(uint64_t)a3 limit:(void *)a4 cancelationToken:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    id v9 = [NSString stringWithFormat:@"SELECT m.ROWID, mr.rich_link, m.mailbox, r.title, r.url FROM message_rich_links AS mr LEFT OUTER JOIN messages AS m ON (m.global_message_id = mr.global_message_id) LEFT OUTER JOIN rich_links AS r ON (r.ROWID = mr.rich_link) LEFT OUTER JOIN searchable_rich_links AS s ON (m.ROWID = s.message_id) WHERE s.rich_link_id IS NULL ORDER BY m.ROWID"];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v11 = [a1 preparedStatementForQueryString:v9];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __146__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__richLinkDataForItemsRequiringIndexingExcludingIdentifiers_limit_cancelationToken___block_invoke;
    v19[3] = &unk_1E6C05A48;
    id v20 = v7;
    id v12 = v10;
    id v21 = v12;
    uint64_t v23 = a3;
    id v22 = v8;
    id v18 = 0;
    char v13 = [v11 executeUsingBlock:v19 error:&v18];
    id v14 = v18;
    if ((v13 & 1) == 0) {
      [a1 handleError:v14 message:@"Searching for rich links requiring indexing"];
    }
    id v15 = v22;
    id v16 = v12;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void __146__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__richLinkDataForItemsRequiringIndexingExcludingIdentifiers_limit_cancelationToken___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v22 = a2;
  id v6 = [EDPersistedMessageID alloc];
  id v7 = [v22 objectAtIndexedSubscript:0];
  id v8 = -[EDPersistedMessageID initWithDatabaseID:](v6, "initWithDatabaseID:", [v7 databaseIDValue]);

  id v9 = [EDPersistedRichLinkID alloc];
  id v10 = [v22 objectAtIndexedSubscript:1];
  char v11 = -[EDPersistedRichLinkID initWithDatabaseID:](v9, "initWithDatabaseID:", [v10 databaseIDValue]);

  id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  if (!v12
    || ([*(id *)(a1 + 32) objectForKeyedSubscript:v8],
        char v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 containsObject:v11],
        v13,
        v12,
        (v14 & 1) == 0))
  {
    id v15 = [v22 objectAtIndexedSubscript:2];
    uint64_t v16 = [v15 databaseIDValue];

    long long v17 = [v22 objectAtIndexedSubscript:3];
    id v18 = [v17 stringValue];

    long long v19 = [v22 objectAtIndexedSubscript:4];
    id v20 = [v19 stringValue];

    id v21 = [[EDSearchableIndexPersistenceRichLinkDatum alloc] initWithMessageID:v8 richLinkID:v11 mailboxID:v16 title:v18 url:v20];
    [*(id *)(a1 + 40) addObject:v21];
    if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 56)
      || [*(id *)(a1 + 48) isCanceled])
    {
      *a4 = 1;
    }
  }
}

- (id)assignIndexedRichLinkItems:(uint64_t)a3 transaction:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v29 = a1;
  id v27 = v5;
  if (a1)
  {
    if ([v5 count])
    {
      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v26 = (void *)[[NSString alloc] initWithFormat:@"INSERT OR REPLACE INTO searchable_rich_links (rich_link, message_id, transaction_id) VALUES (?, ?, %lld)", a3];
      id v6 = objc_msgSend(a1, "preparedStatementForQueryString:");
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id obj = v27;
      uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (!v7) {
        goto LABEL_16;
      }
      uint64_t v32 = *(void *)v35;
      uint64_t v30 = *MEMORY[0x1E4F60D10];
      while (1)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v10 = NSNumber;
          char v11 = [v9 richLinkID];
          id v12 = objc_msgSend(v10, "numberWithLongLong:", objc_msgSend(v11, "databaseID"));

          char v13 = NSNumber;
          char v14 = [v9 messageID];
          id v15 = objc_msgSend(v13, "numberWithLongLong:", objc_msgSend(v14, "databaseID"));

          v38[0] = v12;
          v38[1] = v15;
          uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
          id v33 = 0;
          char v17 = [v6 executeWithIndexedBindings:v16 usingBlock:0 error:&v33];
          id v18 = v33;
          long long v19 = v18;
          if ((v17 & 1) == 0)
          {
            id v20 = [v18 domain];
            if ([v20 isEqualToString:v30])
            {
              BOOL v21 = [v19 code] == 19;

              if (v21)
              {
                id v22 = [v9 messageID];
                uint64_t v23 = [v9 richLinkID];
                id v24 = +[EDSearchableIndexRichLinkItem identifierForMessageID:v22 richLinkID:v23];
                [v28 addObject:v24];

                goto LABEL_14;
              }
            }
            else
            {
            }
            [v29 handleError:v19 message:@"Adding to searchable_rich_links"];
          }
LABEL_14:
          [v6 clearBindingsWithError:0];
          [v6 resetWithError:0];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (!v7)
        {
LABEL_16:

          goto LABEL_18;
        }
      }
    }
    id v28 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v28 = 0;
  }
LABEL_18:

  return v28;
}

- (void)deleteRichLinksInTransactions:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 componentsJoinedByString:@","];
    id v6 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM searchable_rich_links WHERE transaction_id IN (%@)", v5];
    uint64_t v7 = [a1 preparedStatementForQueryString:v6];
    id v10 = 0;
    char v8 = [v7 executeUsingBlock:0 error:&v10];
    id v9 = v10;
    if ((v8 & 1) == 0) {
      [a1 handleError:v9 message:@"Failed to delete messages for items in searchable_rich_links"];
    }
  }
}

- (void)addAllMessagesToRebuildTable
{
  if (a1)
  {
    id v2 = [a1 preparedStatementForQueryString:@"INSERT OR IGNORE INTO searchable_rebuild (message_id) SELECT ROWID FROM messages ORDER BY date_received DESC"];
    id v5 = 0;
    char v3 = [v2 executeUsingBlock:0 error:&v5];
    id v4 = v5;
    if ((v3 & 1) == 0) {
      [a1 handleError:v4 message:@"could not populate searchable_rebuild table"];
    }
  }
}

- (void)clearReferencesToMissingSearchableMessages
{
  id v1 = a1;
  if (a1)
  {
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"messages"];
    char v3 = [MEMORY[0x1E4F1CA98] null];
    [v2 setObject:v3 forKeyedSubscript:@"searchable_message"];

    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"message_id" table:@"searchable_messages"];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F60E78]) initWithName:@"searchable_message"];
    id v6 = [v5 notIn:v4];
    [v2 setWhereClause:v6];

    char v8 = 0;
    [v1 executeUpdateStatement:v2 rowsChanged:&v8];
    id v1 = v8;
  }
  return v1;
}

- (void)clearReferencesToSearchableMessages
{
  if (a1)
  {
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"messages"];
    char v3 = [MEMORY[0x1E4F1CA98] null];
    [v2 setObject:v3 forKeyedSubscript:@"searchable_message"];

    id v4 = [v2 queryString];
    id v5 = [a1 preparedStatementForQueryString:v4];

    id v8 = 0;
    char v6 = [v5 executeUsingBlock:0 error:&v8];
    id v7 = v8;
    if ((v6 & 1) == 0) {
      [a1 handleError:v7 message:@"Clearing searchable_message column"];
    }
  }
}

- (void)emptyAllSearchableIndexTables
{
  v18[6] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v18[0] = @"searchable_messages";
    v18[1] = @"searchable_message_tombstones";
    v18[2] = @"searchable_attachments";
    v18[3] = @"searchable_rich_links";
    v18[4] = @"searchable_data_detection_results";
    v18[5] = @"searchable_rebuild";
    [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:6];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v2)
    {
      uint64_t v3 = *(void *)v14;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v14 != v3) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void *)(*((void *)&v13 + 1) + 8 * v4);
          char v6 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM %@", v5];
          id v7 = [a1 preparedStatementForQueryString:v6];
          id v12 = 0;
          char v8 = [v7 executeUsingBlock:0 error:&v12];
          id v9 = v12;
          if ((v8 & 1) == 0)
          {
            id v10 = (void *)[[NSString alloc] initWithFormat:@"Purging %@", v5];
            [a1 handleError:v9 message:v10];
          }
          ++v4;
        }
        while (v2 != v4);
        uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v2);
    }
  }
}

- (void)removeIndexedIdentifiers:(void *)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  if (a1)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = v23;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id v10 = +[EDSearchableIndexAttachmentItem attachmentPersistentIDFromItemIdentifier:v9];
          char v11 = v10;
          if (v10)
          {
            id v12 = [v10 stringValue];
            [v4 addObject:v12];
          }
          else
          {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v6);
    }

    if ([v3 count])
    {
      long long v13 = [v3 componentsJoinedByString:@","];
      long long v14 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM searchable_messages WHERE message_id IN (%@)", v13];
      long long v15 = [a1 preparedStatementForQueryString:v14];
      id v25 = 0;
      char v16 = [v15 executeUsingBlock:0 error:&v25];
      id v17 = v25;
      if ((v16 & 1) == 0) {
        [a1 handleError:v17 message:@"Removing items from searchable_messages"];
      }
    }
    if ([v4 count])
    {
      id v18 = [v4 componentsJoinedByString:@","];
      long long v19 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM searchable_attachments WHERE attachment_id IN (%@)", v18];
      id v20 = [a1 preparedStatementForQueryString:v19];
      id v24 = 0;
      char v21 = [v20 executeUsingBlock:0 error:&v24];
      id v22 = v24;
      if ((v21 & 1) == 0) {
        [a1 handleError:v22 message:@"Removing items from searchable_attachments"];
      }
    }
  }
}

- (id)messageIDTransactionIDDictionaryToVerifyWithCount:(uint64_t)a3 lastVerifiedMessageID:
{
  if (a1)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = [NSString stringWithFormat:@"SELECT message_id, transaction_id FROM searchable_messages WHERE reindex_type = 0 AND message IS NOT NULL AND message_id > %lu LIMIT %lu", a3, a2];
    char v8 = [a1 preparedStatementForQueryString:v7];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __137__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__messageIDTransactionIDDictionaryToVerifyWithCount_lastVerifiedMessageID___block_invoke;
    v16[3] = &unk_1E6BFF3B0;
    id v9 = v6;
    id v17 = v9;
    id v15 = 0;
    char v10 = [v8 executeUsingBlock:v16 error:&v15];
    id v11 = v15;
    if ((v10 & 1) == 0) {
      [a1 handleError:v11 message:@"Searching for random sample of messages to verify for spotlight integrity"];
    }
    id v12 = v17;
    id v13 = v9;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __137__EDPersistenceDatabaseConnection_EDSearchableIndexPersistence__messageIDTransactionIDDictionaryToVerifyWithCount_lastVerifiedMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectAtIndexedSubscript:0];
  id v4 = [v3 stringValue];

  id v5 = [v7 objectAtIndexedSubscript:1];
  id v6 = [v5 numberValue];

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v4];
}

- (void)performWithOptions:transactionError:block:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2(&dword_1DB39C000, v0, v1, "Non-transactional database block failed on connection %{public}@", v2, v3, v4, v5, v6);
}

- (void)performWithOptions:transactionError:block:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2(&dword_1DB39C000, v0, v1, "Nested database block failed on connection %{public}@", v2, v3, v4, v5, v6);
}

- (void)performWithOptions:transactionError:block:.cold.3()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2(&dword_1DB39C000, v0, v1, "Outer database block failed on connection %{public}@", v2, v3, v4, v5, v6);
}

- (void)performWithOptions:(uint8_t *)buf transactionError:(os_log_t)log block:.cold.4(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to begin transaction on connection %{public}@: %{public}@", buf, 0x16u);
}

- (void)_startTransactionWithSQLConnection:(void *)a1 options:error:.cold.1(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v1, v2, "Read Transaction (generation: %lld) on connection %{public}@ started successfully", (void)v3, DWORD2(v3));
}

- (void)_startTransactionWithSQLConnection:(void *)a1 options:error:.cold.2(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v1, v2, "Write Transaction (generation: %lld) on connection %{public}@ started successfully", (void)v3, DWORD2(v3));
}

- (void)_startTransactionWithSQLConnection:options:error:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  _os_log_debug_impl(&dword_1DB39C000, v0, OS_LOG_TYPE_DEBUG, "Read Transaction (generation: ignored) on connection %{public}@ started successfully", v1, 0xCu);
}

- (void)_startTransactionWithSQLConnection:options:error:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  _os_log_debug_impl(&dword_1DB39C000, v0, OS_LOG_TYPE_DEBUG, "Write Transaction (generation: ignored) on connection %{public}@ started successfully", v1, 0xCu);
}

- (void)_finishTransactionWithSQLConnection:(uint64_t)a1 afterSuccess:transactionError:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v1, v2, "Transaction on connection %{public}@ %{public}@ succeeded", (void)v3, DWORD2(v3));
}

- (void)_finishTransactionWithSQLConnection:(uint64_t)a3 afterSuccess:(os_log_t)log transactionError:.cold.2(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Rolling back transaction on connection %{public}@ %{public}@", buf, 0x16u);
}

- (void)_storeTransactionWriteGenerationWithSQLConnection:(os_log_t)log newGeneration:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Unable to increment transaction generation: %{public}@", buf, 0xCu);
}

- (void)_attachDatabaseWithName:(uint64_t)a1 url:error:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, v1, v2, "Attaching database '%{public}@' at URL %{public}@", (void)v3, DWORD2(v3));
}

@end