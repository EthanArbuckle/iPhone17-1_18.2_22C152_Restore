@interface HDSQLiteDatabase
+ (id)memoryDatabaseFromURL:(id)a3;
+ (uint64_t)_copyContentsFromDatabase:(sqlite3 *)a3 toDatabase:;
- (BOOL)_executeStatementWithError:(id *)a3 statementProvider:(id)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6;
- (BOOL)_integerValueForPragma:(void *)a3 databaseName:(uint64_t)a4 value:(uint64_t)a5 error:;
- (BOOL)checkpointRequired;
- (BOOL)columnIsNullable:(id)a3 inTable:(id)a4 error:(id *)a5;
- (BOOL)enableIncrementalAutovacuumForDatabaseWithName:(id)a3 error:(id *)a4;
- (BOOL)encounteredOutOfSpace;
- (BOOL)executeCachedStatementForKey:(const char *)a3 error:(id *)a4 SQLGenerator:(id)a5 bindingHandler:(id)a6 enumerationHandler:(id)a7;
- (BOOL)executeSQL:(id)a3 error:(id *)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6;
- (BOOL)executeSQLStatements:(id)a3 error:(id *)a4;
- (BOOL)executeUncachedSQL:(id)a3 error:(id *)a4;
- (BOOL)executeUncachedSQL:(id)a3 error:(id *)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6;
- (BOOL)foreignKeyExistsFromTable:(id)a3 column:(id)a4 toTable:(id)a5 column:(id)a6 error:(id *)a7;
- (BOOL)incrementalVacuumDatabaseIfNeeded:(id)a3 error:(id *)a4;
- (BOOL)isOpen;
- (BOOL)isWriter;
- (BOOL)performIntegrityCheckOnDatabase:(id)a3 error:(id *)a4 integrityErrorHandler:(id)a5;
- (BOOL)performTransactionWithType:(int64_t)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)permitWritesInReadTransaction;
- (BOOL)setUserVersion:(int64_t)a3 withDatabaseName:(id)a4 error:(id *)a5;
- (BOOL)table:(id)a3 hasColumnWithName:(id)a4 error:(id *)a5;
- (BOOL)transactionInterruptRequested;
- (HDSQLiteDatabase)initWithDatabaseURL:(id)a3;
- (HDSQLiteDatabaseDelegate)delegate;
- (HDSQLiteDatabaseSchema)_schemaForDatabaseWithName:(uint64_t)a3 error:;
- (HDSQLiteDatabaseTableSchema)_schemaForTableWithName:(void *)a3 database:(uint64_t)a4 error:;
- (HDSQLiteStatementCache)statementCache;
- (NSError)corruptionError;
- (NSNumber)lastInsertRowID;
- (NSString)fileProtectionType;
- (NSURL)fileURL;
- (id)_tableNamesForDatabaseWithName:(uint64_t)a3 error:;
- (id)dumpSchemaWithError:(id *)a3;
- (id)getLastErrorWithStatement:(sqlite3_stmt *)a3 context:(id)a4;
- (id)initMemoryDatabase;
- (id)typeOfColumn:(id)a3 inTable:(id)a4 error:(id *)a5;
- (int)getChangesCount;
- (int)openForReadingWithError:(id *)a3;
- (int)openWithError:(id *)a3;
- (int64_t)cacheScope;
- (int64_t)userVersionWithDatabaseName:(id)a3 error:(id *)a4;
- (int64_t)validateForeignKeysForTable:(id)a3 databaseName:(id)a4 error:(id *)a5;
- (uint64_t)_executeSQL:(char)a3 cache:(uint64_t)a4 error:(void *)a5 bindingHandler:(void *)a6 enumerationHandler:;
- (uint64_t)_executeUncachedSQL:(void *)a3 error:;
- (uint64_t)_executeUncachedSQL:(void *)a3 error:(int)a4 retryIfBusy:(int)a5 interruptible:;
- (uint64_t)_handleInterruptionWithError:(uint64_t)a1;
- (uint64_t)_openForWriting:(int)a3 additionalFlags:(void *)a4 error:;
- (uint64_t)_setPragma:(uint64_t)a3 integerValue:(void *)a4 withDatabaseName:(void *)a5 error:;
- (uint64_t)_stepStatement:(unsigned char *)a3 hasRow:(void *)a4 error:;
- (void)_statementCache;
- (void)accessDatabaseUsingBlock:(id)a3;
- (void)beforeCommit:(id)a3;
- (void)close;
- (void)dealloc;
- (void)onCommit:(id)a3 orRollback:(id)a4;
- (void)requireRollback;
- (void)setCacheScope:(int64_t)a3;
- (void)setCheckpointRequired:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEncounteredOutOfSpace:(BOOL)a3;
- (void)setFileProtectionType:(id)a3;
- (void)setPermitWritesInReadTransaction:(BOOL)a3;
- (void)setTransactionInterruptRequested:(BOOL)a3;
- (void)setWriter:(BOOL)a3;
- (void)unitTest_setCorruptionError:(id)a3;
@end

@implementation HDSQLiteDatabase

- (void)setWriter:(BOOL)a3
{
  self->_writer = a3;
}

- (void)setCacheScope:(int64_t)a3
{
  self->_cacheScope = a3;
}

- (BOOL)isWriter
{
  return self->_writer;
}

- (BOOL)encounteredOutOfSpace
{
  return self->_encounteredOutOfSpace;
}

- (NSError)corruptionError
{
  return self->_corruptionError;
}

- (BOOL)checkpointRequired
{
  return self->_checkpointRequired;
}

uint64_t __64__HDSQLiteDatabase_performTransactionWithType_error_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (BOOL)_executeStatementWithError:(id *)a3 statementProvider:(id)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6
{
  v45[5] = *MEMORY[0x263EF8340];
  v37 = (uint64_t (**)(void))a4;
  v36 = (void (**)(id, sqlite3_stmt *))a5;
  v38 = (uint64_t (**)(id, uint8_t *, id *))a6;
  if ([(HDSQLiteDatabase *)self isOpen])
  {
    if (!self) {
      goto LABEL_52;
    }
  }
  else
  {
    v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"HDSQLiteDatabase.mm", 679, @"Invalid parameter not satisfying: %@", @"self.open" object file lineNumber description];

    if (!self) {
      goto LABEL_52;
    }
  }
  if (self->_db)
  {
    if (self->_isHandlingTransactionEnd)
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a3, 100, @"Attempt to execute SQL within a commit or rollback block.");
      _HKInitializeLogging();
      v35 = (id)*MEMORY[0x263F098E8];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        v11 = objc_opt_class();
        -[HDSQLiteDatabase _executeStatementWithError:statementProvider:bindingHandler:enumerationHandler:](v11, (uint64_t)buf);
      }
      LOBYTE(self) = 0;
      goto LABEL_51;
    }
    v34 = a3;
    -[HDSQLiteDatabase _statementCache](self);
    v35 = uint64_t v43 = 0;
    v12 = (sqlite3_stmt *)v37[2]();
    id v13 = 0;
    v14 = v13;
    if (v12)
    {
      if (!self->_isInTransaction
        || self->_transactionType
        || self->_permitWritesInReadTransaction
        || sqlite3_stmt_readonly(v12))
      {
        if (v36) {
          v36[2](v36, v12);
        }
        if (v38)
        {
          HDSQLiteRow::HDSQLiteRow((uint64_t)buf, v12, 0);
          v15 = 0;
          unsigned __int8 v42 = 0;
          do
          {
            id v41 = v14;
            int v16 = -[HDSQLiteDatabase _stepStatement:hasRow:error:]((uint64_t)self, v12, &v42, &v41);
            id v17 = v41;

            v14 = v17;
            int v18 = v16;
            int v19 = v42;
            if (v42) {
              int v20 = v16;
            }
            else {
              int v20 = 0;
            }
            if (v20 == 1)
            {
              v21 = (void *)MEMORY[0x21D49F400]();
              id v40 = v15;
              int v22 = v38[2](v38, buf, &v40);
              id v23 = v40;

              if (!v22) {
                break;
              }
              int v19 = v42;
              v15 = v23;
            }
            else
            {
              id v23 = v15;
            }
            if (v19) {
              char v24 = v16;
            }
            else {
              char v24 = 0;
            }
          }
          while ((v24 & 1) != 0);
          if (v23)
          {
            id v25 = v23;

            int v18 = 0;
            v14 = v25;
          }

          *(void *)buf = &unk_26CC1A088;
          std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)v45);
          if (v18) {
            goto LABEL_49;
          }
        }
        else
        {
          id v39 = v14;
          int v18 = -[HDSQLiteDatabase _stepStatement:hasRow:error:]((uint64_t)self, v12, 0, &v39);
          id v27 = v39;

          v14 = v27;
          if (v18)
          {
LABEL_49:
            LOBYTE(self) = v18 != 0;
            [v35 checkInStatement:v12];
            goto LABEL_50;
          }
        }
        id v28 = v14;
        v29 = v28;
        if (v28)
        {
          if (v34) {
            id *v34 = v28;
          }
          else {
            _HKLogDroppedError();
          }
        }

        goto LABEL_49;
      }
      _HKInitializeLogging();
      v31 = (id)*MEMORY[0x263F098E8];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        v32 = sqlite3_sql(v12);
        -[HDSQLiteDatabase _executeStatementWithError:statementProvider:bindingHandler:enumerationHandler:]((uint64_t)v32, buf, v31);
      }

      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a3, 131, @"Unsafe statement in read-only transaction: %s", sqlite3_sql(v12));
    }
    else
    {
      if (objc_msgSend(v13, "hd_isDatabaseCorruptionError")) {
        objc_storeStrong((id *)&self->_corruptionError, 0);
      }
      if (objc_msgSend(v14, "hk_isTransactionInterruptedError")) {
        -[HDSQLiteDatabase _handleInterruptionWithError:]((uint64_t)self, 0);
      }
      id v26 = v14;
      v14 = v26;
      if (v26)
      {
        if (a3) {
          *a3 = v26;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    LOBYTE(self) = 0;
LABEL_50:

LABEL_51:
    goto LABEL_52;
  }
  objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a3, 3, @"Database connection is closed");
  LOBYTE(self) = 0;
LABEL_52:

  return (char)self;
}

- (uint64_t)_stepStatement:(unsigned char *)a3 hasRow:(void *)a4 error:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  if (a3) {
    *a3 = 0;
  }
  if (!a2) {
    return 1;
  }
  while (1)
  {
    unsigned __int8 v8 = atomic_load((unsigned __int8 *)(v7 + 32));
    if (v8) {
      break;
    }
    unsigned __int8 v9 = sqlite3_step(a2);
    switch(v9)
    {
      case 9u:
        goto LABEL_33;
      case 0x65u:
        return 1;
      case 0x64u:
        result = 1;
        if (a3) {
          *a3 = 1;
        }
        return result;
    }
    int v10 = v9;
    if (v9 - 5 >= 2)
    {
      switch(v9)
      {
        case 0x13u:
          _HKInitializeLogging();
          v21 = (void *)*MEMORY[0x263F098E8];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_DEBUG)) {
            goto LABEL_33;
          }
          int v22 = v21;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            id v23 = sqlite3_db_handle(a2);
            char v24 = sqlite3_errmsg(v23);
            id v25 = sqlite3_sql(a2);
            -[HDSQLiteDatabase _stepStatement:hasRow:error:]((uint64_t)v24, (uint64_t)v25, (uint8_t *)&v31, v22);
          }
          break;
        case 0xDu:
          *(unsigned char *)(v7 + 70) = 1;
          _HKInitializeLogging();
          id v26 = (void *)*MEMORY[0x263F098E8];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_INFO)) {
            goto LABEL_33;
          }
          int v22 = v26;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            int v31 = 136315138;
            *(void *)v32 = sqlite3_sql(a2);
            _os_log_impl(&dword_21BFB4000, v22, OS_LOG_TYPE_INFO, "Encountered device out of space during statement step: %s", (uint8_t *)&v31, 0xCu);
          }
          break;
        case 0xBu:
          v11 = HDSQLiteErrorFromDatabase(*(sqlite3 **)(v7 + 8), a2, 0);
          uint64_t v12 = HDSQLiteDatabaseErrorFromSQLiteError(v11);
          id v13 = *(void **)(v7 + 112);
          *(void *)(v7 + 112) = v12;

          _HKInitializeLogging();
          v14 = *MEMORY[0x263F098E8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR)) {
            -[HDSQLiteDatabase _stepStatement:hasRow:error:](v7 + 112, v14, v15, v16, v17, v18, v19, v20);
          }
          goto LABEL_33;
        default:
          _HKInitializeLogging();
          id v27 = (void *)*MEMORY[0x263F098E8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_INFO))
          {
            int v22 = v27;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              id v28 = sqlite3_db_handle(a2);
              int v31 = 67109634;
              *(_DWORD *)v32 = v10;
              *(_WORD *)&v32[4] = 2080;
              *(void *)&v32[6] = sqlite3_errmsg(v28);
              __int16 v33 = 2080;
              v34 = sqlite3_sql(a2);
              _os_log_impl(&dword_21BFB4000, v22, OS_LOG_TYPE_INFO, "Step failed: [%d, %s]: %s", (uint8_t *)&v31, 0x1Cu);
            }
            break;
          }
LABEL_33:
          id v29 = [(id)v7 getLastErrorWithStatement:a2 context:0];
          v30 = v29;
          if (v29)
          {
            if (a4) {
              *a4 = v29;
            }
            else {
              _HKLogDroppedError();
            }
          }

          return 0;
      }

      goto LABEL_33;
    }
  }

  return -[HDSQLiteDatabase _handleInterruptionWithError:](v7, a4);
}

- (void)_statementCache
{
  if (a1)
  {
    v1 = a1;
    if (!a1[1])
    {
      v6 = [MEMORY[0x263F08690] currentHandler];
      [v6 handleFailureInMethod:sel__statementCache, v1, @"HDSQLiteDatabase.mm", 1319, @"Invalid parameter not satisfying: %@", @"_db != NULL" object file lineNumber description];
    }
    v2 = (void *)v1[13];
    if (!v2)
    {
      v3 = [[HDSQLiteStatementCache alloc] initWithDatabase:v1[1]];
      v4 = (void *)v1[13];
      v1[13] = v3;

      v2 = (void *)v1[13];
    }
    a1 = v2;
  }

  return a1;
}

uint64_t __78__HDSQLiteDatabase__executeSQL_cache_error_bindingHandler_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 checkOutStatementForSQL:*(void *)(a1 + 32) shouldCache:*(unsigned __int8 *)(a1 + 40) error:a3];
}

- (BOOL)performTransactionWithType:(int64_t)a3 error:(id *)a4 usingBlock:(id)a5
{
  v86[1] = *MEMORY[0x263EF8340];
  id v9 = a5;
  if ([(HDSQLiteDatabase *)self isOpen])
  {
    if (!self) {
      goto LABEL_9;
    }
  }
  else
  {
    v56 = [MEMORY[0x263F08690] currentHandler];
    [v56 handleFailureInMethod:a2, self, @"HDSQLiteDatabase.mm", 511, @"Invalid parameter not satisfying: %@", @"self.open" object file lineNumber description];

    if (!self) {
      goto LABEL_9;
    }
  }
  if (self->_db)
  {
    int v10 = -[HDSQLiteDatabase _statementCache](self);
    BOOL isInTransaction = self->_isInTransaction;
    int64_t cacheScope = self->_cacheScope;
    if (self->_isInTransaction)
    {
      if (self->_transactionType < a3)
      {
        if ((unint64_t)a3 > 2) {
          id v13 = 0;
        }
        else {
          id v13 = off_2643D4BE0[a3];
        }
        unint64_t transactionType = self->_transactionType;
        if (transactionType > 2) {
          uint64_t v18 = 0;
        }
        else {
          uint64_t v18 = off_2643D4BE0[transactionType];
        }
        _HKInitializeLogging();
        uint64_t v19 = *MEMORY[0x263F098E8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_FAULT)) {
          -[HDSQLiteDatabase performTransactionWithType:error:usingBlock:]((uint64_t)v13, (uint64_t)v18, v19);
        }
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Cannot perform %@ transaction inside an existing %@ transaction", v13, v18 format];
      }
    }
    else
    {
      [(HDSQLiteDatabase *)self setTransactionInterruptRequested:0];
      self->_permitWritesInReadTransaction = 0;
      self->_requiresRollbacuint64_t k = 0;
      if ((unint64_t)a3 >= 3) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = off_2643D4BC8[a3];
      }
      self->_unint64_t transactionType = a3;
      char v16 = -[HDSQLiteDatabase _executeUncachedSQL:error:retryIfBusy:interruptible:]((uint64_t)self, v15, a4, 1, 1);
      self->_BOOL isInTransaction = v16;
      if ((v16 & 1) == 0) {
        goto LABEL_27;
      }
      if (cacheScope == 1) {
        [v10 beginTransaction];
      }
    }
    if (self->_isInTransaction)
    {
      uint64_t v78 = 0;
      uint64_t v72 = MEMORY[0x263EF8330];
      uint64_t v73 = 3221225472;
      v74 = __64__HDSQLiteDatabase_performTransactionWithType_error_usingBlock___block_invoke;
      v75 = &unk_2643D4A10;
      v76 = self;
      id v77 = v9;
      v57 = v10;
      int v14 = HKWithAutoreleasePool();
      id v20 = 0;
      id v21 = v20;
      if (v14)
      {
LABEL_36:

        if (!isInTransaction)
        {
          if (v14)
          {
            if (self->_requiresRollback
              && [(HDSQLiteDatabase *)self transactionInterruptRequested])
            {
              objc_msgSend(MEMORY[0x263F087E8], "hk_transactionInterruptedError");
              id v26 = (id)objc_claimAutoreleasedReturnValue();
              id v27 = v26;
              if (v26)
              {
                if (a4) {
                  *a4 = v26;
                }
                else {
                  _HKLogDroppedError();
                }
              }
            }
            int v14 = !self->_requiresRollback;
          }
          [(HDSQLiteDatabase *)self setTransactionInterruptRequested:0];
          char v28 = 1;
          self->_isHandlingTransactionBeforeCommit = 1;
          if (v14)
          {
            for (int i = 10; ; --i)
            {
              if (![(NSMutableArray *)self->_beforeCommitBlocks count])
              {
                char v28 = 0;
                int v14 = 1;
                goto LABEL_66;
              }
              if (!i) {
                break;
              }
              v30 = self->_beforeCommitBlocks;
              beforeCommitBlocks = self->_beforeCommitBlocks;
              self->_beforeCommitBlocks = 0;

              long long v70 = 0u;
              long long v71 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              v32 = v30;
              uint64_t v33 = [v32 countByEnumeratingWithState:&v68 objects:v84 count:16];
              if (v33)
              {
                uint64_t v34 = *(void *)v69;
                while (2)
                {
                  for (uint64_t j = 0; j != v33; ++j)
                  {
                    if (*(void *)v69 != v34) {
                      objc_enumerationMutation(v32);
                    }
                    uint64_t v36 = *(void *)(*((void *)&v68 + 1) + 8 * j);
                    uint64_t v67 = 0;
                    char v37 = (*(uint64_t (**)(void))(v36 + 16))();
                    id v38 = 0;
                    if ((v37 & 1) == 0)
                    {
                      id v39 = v38;
                      id v40 = v39;
                      if (v39)
                      {
                        if (a4) {
                          *a4 = v39;
                        }
                        else {
                          _HKLogDroppedError();
                        }
                      }

                      goto LABEL_65;
                    }
                  }
                  uint64_t v33 = [v32 countByEnumeratingWithState:&v68 objects:v84 count:16];
                  if (v33) {
                    continue;
                  }
                  break;
                }
              }
            }
            objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 100, @"beforeCommitLoopLimit limit reached in transaction");
            _HKInitializeLogging();
            v32 = (id)*MEMORY[0x263F098E8];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            {
              v55 = objc_opt_class();
              -[HDSQLiteDatabase performTransactionWithType:error:usingBlock:](v55, (uint64_t)v83);
            }
LABEL_65:

            int v14 = 0;
            char v28 = 1;
          }
LABEL_66:
          id v41 = self->_beforeCommitBlocks;
          self->_beforeCommitBlocks = 0;

          self->_isHandlingTransactionBeforeCommit = 0;
          if (cacheScope == 1) {
            [v57 endTransaction];
          }
          if ((v28 & 1) == 0) {
            int v14 = -[HDSQLiteDatabase _executeUncachedSQL:error:retryIfBusy:interruptible:]((uint64_t)self, @"COMMIT;",
          }
                    a4,
                    1,
                    0);
          self->_isHandlingTransactionEnd = 1;
          if (v14)
          {
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            uint64_t v43 = self->_onCommitBlocks;
            uint64_t v49 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v63 objects:v82 count:16];
            if (v49)
            {
              uint64_t v50 = *(void *)v64;
              do
              {
                for (uint64_t k = 0; k != v49; ++k)
                {
                  if (*(void *)v64 != v50) {
                    objc_enumerationMutation(v43);
                  }
                  (*(void (**)(void))(*(void *)(*((void *)&v63 + 1) + 8 * k) + 16))();
                }
                uint64_t v49 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v63 objects:v82 count:16];
              }
              while (v49);
            }
          }
          else
          {
            os_unfair_lock_lock(&self->_interruptionLock);
            id v62 = 0;
            char v42 = -[HDSQLiteDatabase _executeUncachedSQL:error:retryIfBusy:interruptible:]((uint64_t)self, @"ROLLBACK;",
                    &v62,
                    1,
                    0);
            uint64_t v43 = (NSMutableArray *)v62;
            if ((v42 & 1) == 0)
            {
              _HKInitializeLogging();
              v44 = *MEMORY[0x263F098E8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v81 = v43;
                _os_log_impl(&dword_21BFB4000, v44, OS_LOG_TYPE_DEFAULT, "Failed to roll back transaction: %{public}@", buf, 0xCu);
              }
            }
            os_unfair_lock_unlock(&self->_interruptionLock);
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            v45 = self->_onRollbackBlocks;
            uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v58 objects:v79 count:16];
            if (v46)
            {
              uint64_t v47 = *(void *)v59;
              do
              {
                for (uint64_t m = 0; m != v46; ++m)
                {
                  if (*(void *)v59 != v47) {
                    objc_enumerationMutation(v45);
                  }
                  (*(void (**)(void))(*(void *)(*((void *)&v58 + 1) + 8 * m) + 16))();
                }
                uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v58 objects:v79 count:16];
              }
              while (v46);
            }
          }
          onCommitBlocks = self->_onCommitBlocks;
          self->_onCommitBlocks = 0;

          onRollbackBlocks = self->_onRollbackBlocks;
          self->_onRollbackBlocks = 0;

          self->_isHandlingTransactionEnd = 0;
          *(_WORD *)&self->_BOOL isInTransaction = 0;
        }
        int v10 = v57;
        goto LABEL_91;
      }
      if (v20)
      {
        id v21 = v20;
      }
      else
      {
        if ([MEMORY[0x263F0A980] isAppleInternalInstall])
        {
          _HKInitializeLogging();
          int v22 = *MEMORY[0x263F098E8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_FAULT)) {
            -[HDSQLiteDatabase performTransactionWithType:error:usingBlock:](v22);
          }
        }
        id v23 = (void *)MEMORY[0x263F087E8];
        uint64_t v85 = *MEMORY[0x263F08320];
        v86[0] = @"Transaction block failed without an error.";
        char v24 = [NSDictionary dictionaryWithObjects:v86 forKeys:&v85 count:1];
        id v25 = [v23 errorWithDomain:@"com.apple.healthd.SQLite" code:1 userInfo:v24];

        id v21 = v25;
        if (!v21) {
          goto LABEL_35;
        }
      }
      if (a4)
      {
        id v21 = v21;
        *a4 = v21;
      }
      else
      {
        _HKLogDroppedError();
      }
LABEL_35:

      goto LABEL_36;
    }
LABEL_27:
    LOBYTE(v14) = 0;
LABEL_91:

    goto LABEL_92;
  }
  objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 3, @"Database connection is closed");
LABEL_9:
  LOBYTE(v14) = 0;
LABEL_92:

  return v14;
}

- (void)setTransactionInterruptRequested:(BOOL)a3
{
  BOOL v3 = a3;
  p_interruptionLocuint64_t k = &self->_interruptionLock;
  os_unfair_lock_lock(&self->_interruptionLock);
  int v6 = !v3;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_transactionInterruptRequested, (unsigned __int8 *)&v6, v3);
  if (v6 == !v3 && v3)
  {
    db = self->_db;
    if (db) {
      sqlite3_interrupt(db);
    }
  }

  os_unfair_lock_unlock(p_interruptionLock);
}

- (uint64_t)_executeUncachedSQL:(void *)a3 error:(int)a4 retryIfBusy:(int)a5 interruptible:
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v9 = a2;
  if (!a1) {
    goto LABEL_20;
  }
  if (([(id)a1 isOpen] & 1) == 0)
  {
    id v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:sel__executeUncachedSQL_error_retryIfBusy_interruptible_, a1, @"HDSQLiteDatabase.mm", 454, @"Invalid parameter not satisfying: %@", @"self.open" object file lineNumber description];
  }
  int v10 = *(sqlite3 **)(a1 + 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a3, 3, @"Database connection is closed");
LABEL_20:
    uint64_t v16 = 0;
    goto LABEL_25;
  }
  if (a5)
  {
    unsigned __int8 v11 = atomic_load((unsigned __int8 *)(a1 + 32));
    if (v11)
    {
      uint64_t v16 = -[HDSQLiteDatabase _handleInterruptionWithError:](a1, a3);
      goto LABEL_25;
    }
    int v10 = *(sqlite3 **)(a1 + 8);
  }
  char v24 = 0;
  id v12 = v9;
  id v13 = (const char *)[v12 UTF8String];
  if (a4) {
    int busy = sqlite3_exec_busy_retry(v10, v13, 0, 0, (char **)&v24);
  }
  else {
    int busy = MEMORY[0x263F8C7B8](v10, v13, 0, 0, &v24);
  }
  int v15 = busy;
  uint64_t v16 = busy == 0;
  if (busy)
  {
    uint64_t v17 = v24;
    if (!v24) {
      uint64_t v17 = (void *)sqlite3_errmsg(*(sqlite3 **)(a1 + 8));
    }
    _HKInitializeLogging();
    uint64_t v18 = *MEMORY[0x263F098E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v26 = v12;
      __int16 v27 = 1024;
      int v28 = v15;
      __int16 v29 = 2082;
      v30 = v17;
      _os_log_error_impl(&dword_21BFB4000, v18, OS_LOG_TYPE_ERROR, "Could not execute SQL: %{public}@: [%d, %{public}s]", buf, 0x1Cu);
    }
    uint64_t v19 = [NSString stringWithFormat:@"_executeUncachedSQL(%@)", v12];
    id v20 = [(id)a1 getLastErrorWithStatement:0 context:v19];
    id v21 = v20;
    if (v20)
    {
      if (a3) {
        *a3 = v20;
      }
      else {
        _HKLogDroppedError();
      }
    }

    if (v24) {
      sqlite3_free(v24);
    }
  }
LABEL_25:

  return v16;
}

- (BOOL)isOpen
{
  return self->_db != 0;
}

uint64_t __102__HDSQLiteDatabase_executeCachedStatementForKey_error_SQLGenerator_bindingHandler_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 checkOutCachedStatementForKey:*(void *)(a1 + 40) SQLGenerator:*(void *)(a1 + 32) error:a3];
}

- (NSNumber)lastInsertRowID
{
  v2 = NSNumber;
  sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_db);

  return (NSNumber *)[v2 numberWithLongLong:insert_rowid];
}

- (BOOL)incrementalVacuumDatabaseIfNeeded:(id)a3 error:(id *)a4
{
  int v6 = (__CFString *)a3;
  uint64_t v12 = 0;
  if (!-[HDSQLiteDatabase _integerValueForPragma:databaseName:value:error:](self, @"FREELIST_COUNT", v6, (uint64_t)&v12, (uint64_t)a4))goto LABEL_8; {
  if (!v12)
  }
  {
LABEL_9:
    char v9 = 1;
    goto LABEL_10;
  }
  uint64_t v11 = 0;
  if (!-[HDSQLiteDatabase _integerValueForPragma:databaseName:value:error:](self, @"PAGE_SIZE", v6, (uint64_t)&v11, (uint64_t)a4))
  {
LABEL_8:
    char v9 = 0;
    goto LABEL_10;
  }
  if (v12 <= 0x200000 / v11) {
    goto LABEL_9;
  }
  uint64_t v7 = @"main";
  if (v6) {
    uint64_t v7 = v6;
  }
  unsigned __int8 v8 = [NSString stringWithFormat:@"PRAGMA %@.incremental_vacuum(%lld)", v7, v12 - 0x200000 / v11];
  char v9 = -[HDSQLiteDatabase _executeUncachedSQL:error:]((uint64_t)self, v8, a4);

LABEL_10:
  return v9;
}

- (BOOL)_integerValueForPragma:(void *)a3 databaseName:(uint64_t)a4 value:(uint64_t)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  uint64_t v11 = v10;
  if (a1)
  {
    uint64_t v12 = NSString;
    id v13 = HDSQLiteDatabaseNamePrefix(v10);
    int v14 = [v12 stringWithFormat:@"PRAGMA %@%@;", v13, v9];

    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __68__HDSQLiteDatabase__integerValueForPragma_databaseName_value_error___block_invoke;
    v17[3] = &unk_2643D4A90;
    v17[4] = &v18;
    v17[5] = a4;
    -[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v14, 0, a5, 0, v17);
    BOOL v15 = *((unsigned char *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

uint64_t __68__HDSQLiteDatabase__integerValueForPragma_databaseName_value_error___block_invoke(uint64_t a1, uint64_t a2)
{
  **(void **)(a1 + 40) = HDSQLiteColumnAsInt64(a2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

- (BOOL)executeCachedStatementForKey:(const char *)a3 error:(id *)a4 SQLGenerator:(id)a5 bindingHandler:(id)a6 enumerationHandler:(id)a7
{
  id v12 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __102__HDSQLiteDatabase_executeCachedStatementForKey_error_SQLGenerator_bindingHandler_enumerationHandler___block_invoke;
  v15[3] = &unk_2643D4A40;
  id v16 = v12;
  uint64_t v17 = a3;
  id v13 = v12;
  LOBYTE(a7) = [(HDSQLiteDatabase *)self _executeStatementWithError:a4 statementProvider:v15 bindingHandler:a6 enumerationHandler:a7];

  return (char)a7;
}

- (uint64_t)_executeSQL:(char)a3 cache:(uint64_t)a4 error:(void *)a5 bindingHandler:(void *)a6 enumerationHandler:
{
  id v11 = a2;
  id v12 = a5;
  id v13 = a6;
  if (a1)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __78__HDSQLiteDatabase__executeSQL_cache_error_bindingHandler_enumerationHandler___block_invoke;
    v16[3] = &unk_2643D4A68;
    id v17 = v11;
    char v18 = a3;
    uint64_t v14 = [a1 _executeStatementWithError:a4 statementProvider:v16 bindingHandler:v12 enumerationHandler:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)executeSQL:(id)a3 error:(id *)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6
{
  return -[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](self, a3, 1, (uint64_t)a4, a5, a6);
}

- (BOOL)executeUncachedSQL:(id)a3 error:(id *)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6
{
  return -[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](self, a3, 0, (uint64_t)a4, a5, a6);
}

- (HDSQLiteDatabase)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSQLiteDatabase;
  v5 = [(HDSQLiteDatabase *)&v10 init];
  if (v5)
  {
    if (v4 && ([v4 isFileURL] & 1) == 0)
    {

      int v6 = 0;
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Invalid database URL"];
    }
    else
    {
      int v6 = v5;
    }
    uint64_t v7 = [v4 copy];
    fileURL = v6->_fileURL;
    v6->_fileURL = (NSURL *)v7;

    v6->_interruptionLock._os_unfair_lock_opaque = 0;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)initMemoryDatabase
{
  return [(HDSQLiteDatabase *)self initWithDatabaseURL:0];
}

+ (uint64_t)_copyContentsFromDatabase:(sqlite3 *)a3 toDatabase:
{
  self;
  v5 = sqlite3_backup_init(a3, "main", a2, "main");
  if (v5)
  {
    int v6 = v5;
    sqlite3_backup_step(v5, -1);
    sqlite3_backup_finish(v6);
  }

  return sqlite3_errcode(a3);
}

+ (id)memoryDatabaseFromURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [objc_alloc((Class)a1) initWithDatabaseURL:v4];
  uint64_t v6 = v5;
  if (!v5)
  {
    id v16 = 0;
    goto LABEL_15;
  }
  id v36 = 0;
  uint64_t v7 = -[HDSQLiteDatabase _openForWriting:additionalFlags:error:](v5, 1, 0, &v36);
  id v8 = v36;
  if (v7)
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x263F098E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR)) {
      +[HDSQLiteDatabase memoryDatabaseFromURL:](v7, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    uint64_t v35 = 0;
    uint64_t v17 = sqlite3_open(":memory:", &v35);
    if (v17)
    {
      _HKInitializeLogging();
      char v18 = *MEMORY[0x263F098E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR)) {
        +[HDSQLiteDatabase memoryDatabaseFromURL:](v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
    else
    {
      if (!+[HDSQLiteDatabase _copyContentsFromDatabase:toDatabase:]((uint64_t)a1, *(sqlite3 **)(v6 + 8), v35))
      {
        [(id)v6 close];
        uint64_t v34 = *(void **)(v6 + 72);
        *(void *)(v6 + 72) = 0;

        *(void *)(v6 + 8) = v35;
        id v16 = (id)v6;
        goto LABEL_14;
      }
      _HKInitializeLogging();
      id v25 = *MEMORY[0x263F098E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR)) {
        +[HDSQLiteDatabase memoryDatabaseFromURL:](v25, v26, v27, v28, v29, v30, v31, v32);
      }
    }
    [(id)v6 close];
  }
  id v16 = 0;
LABEL_14:

LABEL_15:

  return v16;
}

- (uint64_t)_openForWriting:(int)a3 additionalFlags:(void *)a4 error:
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v5 = (sqlite3 **)(a1 + 8);
    if (!*(void *)(a1 + 8))
    {
      uint64_t v10 = *(void **)(a1 + 72);
      if (v10)
      {
        uint64_t v11 = [v10 path];
      }
      else
      {
        uint64_t v11 = @":memory:";
      }
      if (a2) {
        int v12 = 6;
      }
      else {
        int v12 = 1;
      }
      uint64_t v14 = (id *)(a1 + 80);
      uint64_t v13 = *(void **)(a1 + 80);
      uint64_t v15 = (id *)MEMORY[0x263F098E8];
      if (v13)
      {
        if ([v13 isEqualToString:*MEMORY[0x263F080B0]])
        {
          v12 |= 0x400000u;
        }
        else if ([*v14 isEqualToString:*MEMORY[0x263F08098]])
        {
          v12 |= 0x300000u;
        }
        else if ([*v14 isEqualToString:*MEMORY[0x263F08088]])
        {
          v12 |= 0x200000u;
        }
        else if ([*v14 isEqualToString:*MEMORY[0x263F08080]])
        {
          v12 |= 0x100000u;
        }
        else
        {
          _HKInitializeLogging();
          id v16 = *v15;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = objc_opt_class();
            -[HDSQLiteDatabase _openForWriting:additionalFlags:error:](v17, (uint64_t *)(a1 + 80), buf, v16);
          }
        }
      }
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
      char v18 = v11;
      uint64_t busy = sqlite3_open_v2((const char *)[(__CFString *)v18 fileSystemRepresentation], v5, v12 | a3 & ~(a3 >> 31), 0);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
      if (busy)
      {
        uint64_t v19 = @"opening database";
      }
      else
      {
        uint64_t busy = sqlite3_exec_busy_retry(*v5, "PRAGMA cache_size=384;", 0, 0, 0);
        if (busy)
        {
          uint64_t v19 = @"setting cache_size";
        }
        else
        {
          uint64_t busy = sqlite3_busy_timeout(*v5, 60000);
          if (busy)
          {
            uint64_t v19 = @"setting busy timeout";
          }
          else
          {
            if (a2)
            {
              uint64_t busy = sqlite3_exec_busy_retry(*v5, "PRAGMA journal_mode = WAL;", 0, 0, 0);
              if (busy)
              {
                uint64_t v19 = @"setting journal_mode";
                goto LABEL_28;
              }
              uint64_t busy = sqlite3_exec_busy_retry(*v5, "PRAGMA foreign_keys = ON;", 0, 0, 0);
              if (busy)
              {
                uint64_t v19 = @"enabling foreign keys";
                goto LABEL_28;
              }
            }
            if (HDSQLiteInstallCustomFunctionsInDatabase(*v5))
            {
              uint64_t busy = 0;
LABEL_35:

              return busy;
            }
            unsigned int v26 = sqlite3_extended_errcode(*v5);
            if (v26 <= 1) {
              uint64_t busy = 1;
            }
            else {
              uint64_t busy = v26;
            }
            uint64_t v19 = @"installing custom functions";
          }
        }
      }
LABEL_28:
      uint64_t v20 = HDSQLiteErrorFromDatabase(*v5, 0, v19);
      HDSQLiteDatabaseErrorFromSQLiteError(v20);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = v21;
      if (v21)
      {
        if (a4) {
          *a4 = v21;
        }
        else {
          _HKLogDroppedError();
        }
      }

      _HKInitializeLogging();
      uint64_t v23 = *v15;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v25 = [v20 localizedDescription];
        int v27 = 138544130;
        uint64_t v28 = v19;
        __int16 v29 = 1024;
        int v30 = busy;
        __int16 v31 = 2114;
        uint64_t v32 = v18;
        __int16 v33 = 2112;
        uint64_t v34 = v25;
        _os_log_error_impl(&dword_21BFB4000, v23, OS_LOG_TYPE_ERROR, "Error %{public}@: [%d, %{public}@] (%@)", (uint8_t *)&v27, 0x26u);
      }
      [(id)a1 close];

      goto LABEL_35;
    }
  }
  return 0;
}

- (void)dealloc
{
  if (self->_db)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"HDSQLiteDatabase.mm", 273, @"Invalid parameter not satisfying: %@", @"_db == NULL" object file lineNumber description];

    if (self->_db) {
      [(HDSQLiteDatabase *)self close];
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)HDSQLiteDatabase;
  [(HDSQLiteDatabase *)&v5 dealloc];
}

- (int)openWithError:(id *)a3
{
  return -[HDSQLiteDatabase _openForWriting:additionalFlags:error:]((uint64_t)self, 1, 0, a3);
}

- (int)openForReadingWithError:(id *)a3
{
  return -[HDSQLiteDatabase _openForWriting:additionalFlags:error:]((uint64_t)self, 0, 0, a3);
}

- (void)close
{
  [(HDSQLiteStatementCache *)self->_statementCache clearCachedStatements];
  statementCache = self->_statementCache;
  self->_statementCache = 0;

  os_unfair_lock_lock(&self->_interruptionLock);
  db = self->_db;
  if (db)
  {
    sqlite3_close(db);
    self->_db = 0;
  }

  os_unfair_lock_unlock(&self->_interruptionLock);
}

- (BOOL)transactionInterruptRequested
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_transactionInterruptRequested);
  return v2 & 1;
}

- (void)setFileProtectionType:(id)a3
{
  id v10 = a3;
  if ([(HDSQLiteDatabase *)self isOpen])
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDSQLiteDatabase.mm", 424, @"Invalid parameter not satisfying: %@", @"self.open == NO" object file lineNumber description];
  }
  objc_super v5 = [(HDSQLiteDatabase *)self fileURL];

  if (!v5)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HDSQLiteDatabase.mm", 427, @"Invalid parameter not satisfying: %@", @"self.fileURL != nil" object file lineNumber description];
  }
  uint64_t v6 = (NSString *)[v10 copy];
  fileProtectionType = self->_fileProtectionType;
  self->_fileProtectionType = v6;
}

- (void)accessDatabaseUsingBlock:(id)a3
{
  uint64_t v6 = (void (**)(void))a3;
  if (![(HDSQLiteDatabase *)self isOpen])
  {
    objc_super v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"HDSQLiteDatabase.mm", 435, @"Invalid parameter not satisfying: %@", @"self.open" object file lineNumber description];
  }
  if (self->_db) {
    v6[2]();
  }
}

- (uint64_t)_executeUncachedSQL:(void *)a3 error:
{
  id v5 = a2;
  if (a1) {
    uint64_t v6 = -[HDSQLiteDatabase _executeUncachedSQL:error:retryIfBusy:interruptible:](a1, v5, a3, 0, 1);
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)_handleInterruptionWithError:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 64);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    os_unfair_lock_unlock(v4);
    *(unsigned char *)(a1 + 17) = 1;
    objc_msgSend(MEMORY[0x263F087E8], "hk_transactionInterruptedError");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = v5;
    if (v5)
    {
      if (a2) {
        *a2 = v5;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return 0;
}

- (id)getLastErrorWithStatement:(sqlite3_stmt *)a3 context:(id)a4
{
  id v7 = a4;
  if (![(HDSQLiteDatabase *)self isOpen])
  {
    int v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDSQLiteDatabase.mm", 485, @"Invalid parameter not satisfying: %@", @"self.open" object file lineNumber description];
  }
  db = self->_db;
  if (db)
  {
    if (sqlite3_errcode(db) == 9)
    {
      id v13 = 0;
      -[HDSQLiteDatabase _handleInterruptionWithError:]((uint64_t)self, &v13);
      id v9 = v13;
    }
    else
    {
      id v10 = HDSQLiteErrorFromDatabase(self->_db, a3, v7);
      HDSQLiteDatabaseErrorFromSQLiteError(v10);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (int)getChangesCount
{
  if (![(HDSQLiteDatabase *)self isOpen])
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"HDSQLiteDatabase.mm", 499, @"Invalid parameter not satisfying: %@", @"self.open" object file lineNumber description];
  }
  db = self->_db;
  if (db)
  {
    LODWORD(db) = sqlite3_changes(db);
  }
  return (int)db;
}

- (BOOL)executeUncachedSQL:(id)a3 error:(id *)a4
{
  return [(HDSQLiteDatabase *)self executeUncachedSQL:a3 error:a4 bindingHandler:0 enumerationHandler:0];
}

- (BOOL)executeSQLStatements:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        if (!-[HDSQLiteDatabase executeUncachedSQL:error:bindingHandler:enumerationHandler:](self, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", *(void *)(*((void *)&v12 + 1) + 8 * i), a4, 0, 0, (void)v12))
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)setUserVersion:(int64_t)a3 withDatabaseName:(id)a4 error:(id *)a5
{
  return -[HDSQLiteDatabase _setPragma:integerValue:withDatabaseName:error:]((uint64_t)self, @"user_version", a3, a4, a5);
}

- (uint64_t)_setPragma:(uint64_t)a3 integerValue:(void *)a4 withDatabaseName:(void *)a5 error:
{
  id v9 = a2;
  id v10 = a4;
  uint64_t v11 = v10;
  if (a1)
  {
    long long v12 = NSString;
    long long v13 = HDSQLiteDatabaseNamePrefix(v10);
    long long v14 = [v12 stringWithFormat:@"PRAGMA %@%@=%lld", v13, v9, a3];

    uint64_t v15 = -[HDSQLiteDatabase _executeUncachedSQL:error:](a1, v14, a5);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (int64_t)userVersionWithDatabaseName:(id)a3 error:(id *)a4
{
  int64_t v5 = -1;
  -[HDSQLiteDatabase _integerValueForPragma:databaseName:value:error:](self, @"user_version", a3, (uint64_t)&v5, (uint64_t)a4);
  return v5;
}

- (void)onCommit:(id)a3 orRollback:(id)a4
{
  id v20 = a3;
  id v7 = a4;
  if (!self->_isInTransaction)
  {
    char v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDSQLiteDatabase.mm", 846, @"Invalid parameter not satisfying: %@", @"_isInTransaction" object file lineNumber description];
  }
  if (!self->_isHandlingTransactionEnd
    || ([MEMORY[0x263F08690] currentHandler],
        uint64_t v19 = objc_claimAutoreleasedReturnValue(),
        [v19 handleFailureInMethod:a2 object:self file:@"HDSQLiteDatabase.mm" lineNumber:847 description:@"Cannot add new commit or rollback handlers from within a commit or rollback handler."], v19, !self->_isHandlingTransactionEnd))
  {
    if (v20)
    {
      onCommitBlocks = self->_onCommitBlocks;
      if (!onCommitBlocks)
      {
        id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        id v10 = self->_onCommitBlocks;
        self->_onCommitBlocks = v9;

        onCommitBlocks = self->_onCommitBlocks;
      }
      uint64_t v11 = (void *)[v20 copy];
      long long v12 = (void *)MEMORY[0x21D49F640]();
      [(NSMutableArray *)onCommitBlocks addObject:v12];
    }
    if (v7)
    {
      onRollbackBlocks = self->_onRollbackBlocks;
      if (!onRollbackBlocks)
      {
        long long v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v15 = self->_onRollbackBlocks;
        self->_onRollbackBlocks = v14;

        onRollbackBlocks = self->_onRollbackBlocks;
      }
      id v16 = (void *)[v7 copy];
      uint64_t v17 = (void *)MEMORY[0x21D49F640]();
      [(NSMutableArray *)onRollbackBlocks addObject:v17];
    }
  }
}

- (void)beforeCommit:(id)a3
{
  id v5 = a3;
  id v13 = v5;
  if (!self->_isInTransaction)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDSQLiteDatabase.mm", 869, @"Invalid parameter not satisfying: %@", @"_isInTransaction" object file lineNumber description];

    id v5 = v13;
  }
  if (self->_isHandlingTransactionEnd)
  {
    long long v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDSQLiteDatabase.mm", 870, @"Invalid parameter not satisfying: %@", @"!_isHandlingTransactionEnd" object file lineNumber description];

    id v5 = v13;
  }
  beforeCommitBlocks = self->_beforeCommitBlocks;
  if (!beforeCommitBlocks)
  {
    id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v8 = self->_beforeCommitBlocks;
    self->_beforeCommitBlocks = v7;

    beforeCommitBlocks = self->_beforeCommitBlocks;
    id v5 = v13;
  }
  id v9 = (void *)[v5 copy];
  id v10 = (void *)MEMORY[0x21D49F640]();
  [(NSMutableArray *)beforeCommitBlocks addObject:v10];
}

- (void)requireRollback
{
  if (self->_isInTransaction) {
    self->_requiresRollbacuint64_t k = 1;
  }
}

- (int64_t)validateForeignKeysForTable:(id)a3 databaseName:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!a5)
  {
    uint64_t v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HDSQLiteDatabase.mm", 885, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  uint64_t v11 = NSString;
  long long v12 = HDSQLiteDatabaseNamePrefix(v10);
  if (v9) {
    [v11 stringWithFormat:@"PRAGMA %@foreign_key_check(%@)", v12, v9];
  }
  else {
  id v13 = [v11 stringWithFormat:@"PRAGMA %@foreign_key_check", v12];
  }

  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  unsigned int v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy_;
  __int16 v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __67__HDSQLiteDatabase_validateForeignKeysForTable_databaseName_error___block_invoke;
  v24[3] = &unk_2643D4AB8;
  v24[4] = &v31;
  v24[5] = &v25;
  if (-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](self, v13, 0, (uint64_t)a5, 0, v24))
  {
    if (*((unsigned char *)v32 + 24))
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 100, v26[5]);
      int64_t v14 = 1;
    }
    else
    {
      int64_t v14 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v15 = *MEMORY[0x263F098E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR)) {
      -[HDSQLiteDatabase validateForeignKeysForTable:databaseName:error:]((uint64_t)a5, v15, v16, v17, v18, v19, v20, v21);
    }
    int64_t v14 = 2;
  }
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v14;
}

uint64_t __67__HDSQLiteDatabase_validateForeignKeysForTable_databaseName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  id v4 = NSString;
  id v5 = HDSQLiteColumnAsString(a2, 0);
  id v6 = HDSQLiteColumnAsNumber(a2, 1);
  id v7 = HDSQLiteColumnAsString(a2, 2);
  uint64_t v8 = [v4 stringWithFormat:@"Foreign key check failed for reference from %@ to row %@ in %@", v5, v6, v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return 0;
}

- (BOOL)table:(id)a3 hasColumnWithName:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = -[HDSQLiteDatabase _schemaForTableWithName:database:error:](self, a3, 0, (uint64_t)a5);
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 columns];
    long long v12 = [v11 objectForKeyedSubscript:v8];

    BOOL v13 = v12 != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (HDSQLiteDatabaseTableSchema)_schemaForTableWithName:(void *)a3 database:(uint64_t)a4 error:
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (a1)
  {
    if (!v7)
    {
      id v40 = v6;
      uint64_t v9 = [v6 componentsSeparatedByString:@"."];
      if ((unint64_t)[v9 count] < 2)
      {
        id v8 = 0;
      }
      else
      {
        id v8 = [v9 objectAtIndexedSubscript:0];
        id v6 = [v9 objectAtIndexedSubscript:1];
      }
    }
    id v41 = v6;
    id v39 = objc_alloc_init(HDSQLiteDatabaseTableSchema);
    [(HDSQLiteDatabaseTableSchema *)v39 setName:v6];
    char v37 = objc_opt_new();
    if (v8) {
      [NSString stringWithFormat:@"PRAGMA %@.table_info(%@);", v8, v6];
    }
    else {
    id v10 = [NSString stringWithFormat:@"PRAGMA table_info(%@);", v6];
    }
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke;
    v62[3] = &unk_2643D4B08;
    id v11 = v37;
    id v63 = v11;
    id v38 = v11;
    if (-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v10, 0, a4, 0, v62))
    {
      [(HDSQLiteDatabaseTableSchema *)v39 setColumns:v11];
      if (v8) {
        objc_msgSend(NSString, "stringWithFormat:", @"SELECT sql FROM %@.sqlite_master WHERE type='table' AND tbl_name='%@';",
      }
          v8,
          v6);
      else {
        objc_msgSend(NSString, "stringWithFormat:", @"SELECT sql FROM sqlite_master WHERE type='table' AND tbl_name='%@';",
      }
      BOOL v13 = v6);

      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_2;
      v60[3] = &unk_2643D4B08;
      int64_t v14 = v39;
      long long v61 = v14;
      if (-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v13, 0, a4, 0, v60))
      {
        char v34 = v14;
        if (v8) {
          [NSString stringWithFormat:@"PRAGMA %@.index_list(%@)", v8, v6];
        }
        else {
        uint64_t v15 = [NSString stringWithFormat:@"PRAGMA index_list(%@)", v6];
        }

        id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_3;
        v58[3] = &unk_2643D4B08;
        id v17 = v16;
        id v59 = v17;
        uint64_t v35 = v17;
        if (-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v15, 0, a4, 0, v58))
        {
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          obuint64_t j = v17;
          uint64_t v18 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v55;
            while (2)
            {
              uint64_t v20 = 0;
              uint64_t v21 = v15;
              do
              {
                if (*(void *)v55 != v19) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v22 = *(void **)(*((void *)&v54 + 1) + 8 * v20);
                uint64_t v23 = NSString;
                uint64_t v24 = [v22 name];
                if (v8) {
                  [v23 stringWithFormat:@"PRAGMA %@.index_info(%@)", v8, v24];
                }
                else {
                uint64_t v15 = [v23 stringWithFormat:@"PRAGMA index_info(%@)", v24];
                }

                uint64_t v25 = objc_opt_new();
                v52[0] = MEMORY[0x263EF8330];
                v52[1] = 3221225472;
                v52[2] = __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_4;
                v52[3] = &unk_2643D4B08;
                id v26 = v25;
                id v53 = v26;
                if ((-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v15, 0, a4, 0, v52) & 1) == 0)
                {

                  long long v12 = 0;
                  goto LABEL_47;
                }
                [v22 setColumns:v26];

                ++v20;
                uint64_t v21 = v15;
              }
              while (v18 != v20);
              uint64_t v18 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          uint64_t v27 = [MEMORY[0x263EFFA08] setWithArray:obj];
          [(HDSQLiteDatabaseTableSchema *)v34 setIndices:v27];

          if (v8)
          {
            [NSString stringWithFormat:@"select name, sql from %@.sqlite_master where type='trigger' AND tbl_name=?", v8];
            uint64_t v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v28 = @"select name, sql from sqlite_master where type='trigger' AND tbl_name=?";
          }

          id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
          v50[0] = MEMORY[0x263EF8330];
          v50[1] = 3221225472;
          v50[2] = __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_5;
          v50[3] = &unk_2643D4B30;
          id v51 = v41;
          v47[0] = MEMORY[0x263EF8330];
          v47[1] = 3221225472;
          v47[2] = __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_6;
          v47[3] = &unk_2643D4B58;
          id v30 = v51;
          id v48 = v30;
          obuint64_t j = v29;
          id v49 = obj;
          if (-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v28, 0, a4, v50, v47))
          {
            uint64_t v31 = [MEMORY[0x263EFFA08] setWithArray:obj];
            [(HDSQLiteDatabaseTableSchema *)v34 setTriggers:v31];

            if (v8) {
              [NSString stringWithFormat:@"PRAGMA %@.foreign_key_list(%@);", v8, v30];
            }
            else {
            uint64_t v32 = [NSString stringWithFormat:@"PRAGMA foreign_key_list(%@);", v30];
            }

            v43[0] = MEMORY[0x263EF8330];
            v43[1] = 3221225472;
            v43[2] = __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_7;
            v43[3] = &unk_2643D4B80;
            v45 = a1;
            uint64_t v46 = sel__schemaForTableWithName_database_error_;
            id v44 = v38;
            if (-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v32, 0, a4, 0, v43))long long v12 = v34; {
            else
            }
              long long v12 = 0;

            uint64_t v28 = v32;
          }
          else
          {
            long long v12 = 0;
          }

          id v26 = v51;
          uint64_t v15 = v28;
LABEL_47:
        }
        else
        {
          long long v12 = 0;
        }

        BOOL v13 = v15;
      }
      else
      {
        long long v12 = 0;
      }

      id v10 = v13;
    }
    else
    {
      long long v12 = 0;
    }
  }
  else
  {
    id v41 = v6;
    long long v12 = 0;
  }

  return v12;
}

- (BOOL)foreignKeyExistsFromTable:(id)a3 column:(id)a4 toTable:(id)a5 column:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = -[HDSQLiteDatabase _schemaForTableWithName:database:error:](self, a3, 0, (uint64_t)a7);
  id v16 = v15;
  if (v15)
  {
    id v17 = [v15 columns];
    uint64_t v18 = [v17 objectForKeyedSubscript:v12];

    uint64_t v19 = [v18 foreignKeyTargetTable];
    if ([v19 isEqualToString:v13])
    {
      uint64_t v20 = [v18 foreignKeyTargetColumn];
      char v21 = [v20 isEqualToString:v14];
    }
    else
    {
      char v21 = 0;
    }
  }
  else
  {
    char v21 = 0;
  }

  return v21;
}

- (id)typeOfColumn:(id)a3 inTable:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (!a5)
  {
    uint64_t v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HDSQLiteDatabase.mm", 940, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  id v11 = -[HDSQLiteDatabase _schemaForTableWithName:database:error:](self, v10, 0, (uint64_t)a5);
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 columns];
    id v14 = [v13 objectForKeyedSubscript:v9];

    if (v14)
    {
      uint64_t v15 = [v14 type];
    }
    else
    {
      _HKInitializeLogging();
      id v16 = (id)*MEMORY[0x263F098E8];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = [v12 columns];
        *(_DWORD *)buf = 138543874;
        id v21 = v10;
        __int16 v22 = 2114;
        id v23 = v9;
        __int16 v24 = 2114;
        uint64_t v25 = v18;
        _os_log_error_impl(&dword_21BFB4000, v16, OS_LOG_TYPE_ERROR, "Table '%{public}@' has no column %{public}@: %{public}@", buf, 0x20u);
      }
      uint64_t v15 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR)) {
      -[HDSQLiteDatabase typeOfColumn:inTable:error:]();
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (BOOL)columnIsNullable:(id)a3 inTable:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (!a5)
  {
    uint64_t v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HDSQLiteDatabase.mm", 958, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  id v11 = -[HDSQLiteDatabase _schemaForTableWithName:database:error:](self, v10, 0, (uint64_t)a5);
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 columns];
    id v14 = [v13 objectForKeyedSubscript:v9];

    if (v14)
    {
      char v15 = [v14 isNullable];
    }
    else
    {
      _HKInitializeLogging();
      id v16 = (id)*MEMORY[0x263F098E8];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = [v12 columns];
        *(_DWORD *)buf = 138543874;
        id v21 = v10;
        __int16 v22 = 2114;
        id v23 = v9;
        __int16 v24 = 2114;
        uint64_t v25 = v18;
        _os_log_error_impl(&dword_21BFB4000, v16, OS_LOG_TYPE_ERROR, "Table '%{public}@' has no column %{public}@: %{public}@", buf, 0x20u);
      }
      char v15 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR)) {
      -[HDSQLiteDatabase typeOfColumn:inTable:error:]();
    }
    char v15 = 0;
  }

  return v15;
}

- (BOOL)enableIncrementalAutovacuumForDatabaseWithName:(id)a3 error:(id *)a4
{
  id v6 = (__CFString *)a3;
  uint64_t v37 = 0;
  if (!-[HDSQLiteDatabase _integerValueForPragma:databaseName:value:error:](self, @"AUTO_VACUUM", v6, (uint64_t)&v37, (uint64_t)a4))goto LABEL_20; {
  if (v37 == 2)
  }
  {
    char v7 = 1;
    goto LABEL_21;
  }
  if (!-[HDSQLiteDatabase _setPragma:integerValue:withDatabaseName:error:]((uint64_t)self, @"AUTO_VACUUM", 2, v6, a4))
  {
LABEL_20:
    char v7 = 0;
    goto LABEL_21;
  }
  id v35 = 0;
  uint64_t v36 = 2500;
  BOOL v8 = -[HDSQLiteDatabase _integerValueForPragma:databaseName:value:error:](self, @"CACHE_SPILL", v6, (uint64_t)&v36, (uint64_t)&v35);
  id v9 = v35;
  if (!v8)
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x263F098E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR)) {
      -[HDSQLiteDatabase enableIncrementalAutovacuumForDatabaseWithName:error:]((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  if (v36 >= 625) {
    uint64_t v17 = 625;
  }
  else {
    uint64_t v17 = v36;
  }
  id v34 = v9;
  char v18 = -[HDSQLiteDatabase _setPragma:integerValue:withDatabaseName:error:]((uint64_t)self, @"CACHE_SPILL", v17, v6, &v34);
  id v19 = v34;

  if ((v18 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v20 = *MEMORY[0x263F098E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR)) {
      -[HDSQLiteDatabase enableIncrementalAutovacuumForDatabaseWithName:error:]((uint64_t)v19, v17, v20);
    }
  }
  id v21 = &stru_26CC1AE10;
  if (v6) {
    id v21 = v6;
  }
  __int16 v22 = [NSString stringWithFormat:@"VACUUM %@;", v21];
  char v7 = -[HDSQLiteDatabase _executeUncachedSQL:error:]((uint64_t)self, v22, a4);
  id v33 = v19;
  char v23 = -[HDSQLiteDatabase _setPragma:integerValue:withDatabaseName:error:]((uint64_t)self, @"CACHE_SPILL", v36, v6, &v33);
  id v24 = v33;

  if ((v23 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v25 = *MEMORY[0x263F098E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR)) {
      -[HDSQLiteDatabase enableIncrementalAutovacuumForDatabaseWithName:error:]((uint64_t)v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }

LABEL_21:
  return v7;
}

- (BOOL)performIntegrityCheckOnDatabase:(id)a3 error:(id *)a4 integrityErrorHandler:(id)a5
{
  id v8 = a5;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v9 = [NSString stringWithFormat:@"PRAGMA %@.INTEGRITY_CHECK;", a3];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__HDSQLiteDatabase_performIntegrityCheckOnDatabase_error_integrityErrorHandler___block_invoke;
  v13[3] = &unk_2643D4AE0;
  uint64_t v15 = &v16;
  id v10 = v8;
  id v14 = v10;
  if ([(HDSQLiteDatabase *)self executeUncachedSQL:v9 error:a4 bindingHandler:0 enumerationHandler:v13])
  {
    if (!*((unsigned char *)v17 + 24))
    {
      BOOL v11 = 1;
      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 102, @"Access error during integrity check.");
  }
  BOOL v11 = 0;
LABEL_5:

  _Block_object_dispose(&v16, 8);
  return v11;
}

uint64_t __80__HDSQLiteDatabase_performIntegrityCheckOnDatabase_error_integrityErrorHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = HDSQLiteColumnAsString(a2, 0);
  if ([v3 isEqualToString:@"ok"])
  {
    uint64_t v4 = 0;
  }
  else if ([v3 containsString:@"=266"])
  {
    uint64_t v4 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v4 = 1;
  }

  return v4;
}

uint64_t __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke(uint64_t a1, HDSQLiteRow *a2)
{
  uint64_t v4 = objc_alloc_init(HDSQLiteDatabaseColumnSchema);
  id v5 = HDSQLiteColumnWithNameAsString(a2, @"name");
  [(HDSQLiteDatabaseColumnSchema *)v4 setName:v5];

  id v6 = HDSQLiteColumnWithNameAsString(a2, @"type");
  [(HDSQLiteDatabaseColumnSchema *)v4 setType:v6];

  char v7 = HDSQLiteColumnWithNameAsString(a2, @"dflt_value");
  [(HDSQLiteDatabaseColumnSchema *)v4 setDefaultValue:v7];

  [(HDSQLiteDatabaseColumnSchema *)v4 setIsNullable:!HDSQLiteColumnWithNameAsBoolean(a2, @"notnull")];
  [(HDSQLiteDatabaseColumnSchema *)v4 setIsPrimaryKey:HDSQLiteColumnWithNameAsBoolean(a2, @"pk")];
  id v8 = *(void **)(a1 + 32);
  id v9 = [(HDSQLiteDatabaseColumnSchema *)v4 name];
  [v8 setObject:v4 forKeyedSubscript:v9];

  return 1;
}

uint64_t __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_2(uint64_t a1, HDSQLiteRow *a2)
{
  BOOL v3 = HDSQLiteColumnWithNameAsString(a2, @"sql");
  [*(id *)(a1 + 32) setCreateTableSchema:v3];

  return 1;
}

uint64_t __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_3(uint64_t a1, HDSQLiteRow *a2)
{
  uint64_t v4 = objc_alloc_init(HDSQLiteDatabaseIndexSchema);
  [(HDSQLiteDatabaseIndexSchema *)v4 setIsUnique:HDSQLiteColumnWithNameAsBoolean(a2, @"unique")];
  id v5 = HDSQLiteColumnWithNameAsString(a2, @"name");
  [(HDSQLiteDatabaseIndexSchema *)v4 setName:v5];

  [*(id *)(a1 + 32) addObject:v4];
  return 1;
}

uint64_t __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_4(uint64_t a1, HDSQLiteRow *a2)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  BOOL v3 = HDSQLiteColumnWithNameAsString(a2, @"name");
  [v2 addObject:v3];

  return 1;
}

void __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
}

uint64_t __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_6(uint64_t a1, HDSQLiteRow *a2)
{
  uint64_t v4 = objc_alloc_init(HDSQLiteDatabaseTriggerSchema);
  id v5 = HDSQLiteColumnWithNameAsString(a2, @"name");
  [(HDSQLiteDatabaseTriggerSchema *)v4 setName:v5];

  [(HDSQLiteDatabaseTriggerSchema *)v4 setTableName:*(void *)(a1 + 32)];
  id v6 = HDSQLiteColumnWithNameAsString(a2, @"sql");
  [(HDSQLiteDatabaseTriggerSchema *)v4 setSql:v6];

  [*(id *)(a1 + 40) addObject:v4];
  return 1;
}

uint64_t __59__HDSQLiteDatabase__schemaForTableWithName_database_error___block_invoke_7(void *a1, HDSQLiteRow *a2)
{
  uint64_t v4 = (void *)a1[4];
  id v5 = HDSQLiteColumnWithNameAsString(a2, @"from");
  id v6 = [v4 objectForKeyedSubscript:v5];

  char v7 = HDSQLiteColumnWithNameAsString(a2, @"table");
  [v6 setForeignKeyTargetTable:v7];

  id v8 = HDSQLiteColumnWithNameAsString(a2, @"to");
  [v6 setForeignKeyTargetColumn:v8];

  id v9 = HDSQLiteColumnWithNameAsString(a2, @"on_delete");
  if ([v9 isEqualToString:@"CASCADE"])
  {
    uint64_t v10 = 2;
  }
  else if ([v9 isEqualToString:@"RESTRICT"])
  {
    uint64_t v10 = 1;
  }
  else if ([v9 isEqualToString:@"NO ACTION"])
  {
    uint64_t v10 = 0;
  }
  else if ([v9 isEqualToString:@"SET NULL"])
  {
    uint64_t v10 = 3;
  }
  else
  {
    if (![v9 isEqualToString:@"SET DEFAULT"])
    {
      uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a1[6], a1[5], @"HDSQLiteDatabase.mm", 1182, @"Unable to determine deletion action for %@", v9 object file lineNumber description];

      goto LABEL_12;
    }
    uint64_t v10 = 4;
  }
  [v6 setDeletionAction:v10];
LABEL_12:

  return 1;
}

- (HDSQLiteDatabaseSchema)_schemaForDatabaseWithName:(uint64_t)a3 error:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a1)
  {
    uint64_t v15 = objc_alloc_init(HDSQLiteDatabaseSchema);
    uint64_t v16 = -[HDSQLiteDatabase _tableNamesForDatabaseWithName:error:](a1, v5, a3);
    if (v16)
    {
      id v6 = objc_opt_new();
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = v16;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v7);
            }
            BOOL v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            uint64_t v12 = -[HDSQLiteDatabase _schemaForTableWithName:database:error:](a1, v11, v5, a3);
            if (!v12)
            {

              uint64_t v13 = 0;
              goto LABEL_13;
            }
            [v6 setObject:v12 forKeyedSubscript:v11];
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      [(HDSQLiteDatabaseSchema *)v15 setTables:v6];
      uint64_t v13 = v15;
LABEL_13:
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)_tableNamesForDatabaseWithName:(uint64_t)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = objc_opt_new();
    objc_msgSend(NSString, "stringWithFormat:", @"SELECT name FROM %@.sqlite_master WHERE type='table';",
    id v7 = v5);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__HDSQLiteDatabase__tableNamesForDatabaseWithName_error___block_invoke;
    v11[3] = &unk_2643D4B08;
    id v8 = v6;
    id v12 = v8;
    if (-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](a1, v7, 0, a3, 0, v11)) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __57__HDSQLiteDatabase__tableNamesForDatabaseWithName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  BOOL v3 = HDSQLiteColumnAsString(a2, 0);
  [v2 addObject:v3];

  return 1;
}

- (id)dumpSchemaWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = objc_opt_new();
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __40__HDSQLiteDatabase_dumpSchemaWithError___block_invoke;
  v20[3] = &unk_2643D4B08;
  id v15 = v5;
  id v21 = v15;
  if ((-[HDSQLiteDatabase _executeSQL:cache:error:bindingHandler:enumerationHandler:](self, @"PRAGMA database_list;",
          0,
          (uint64_t)a3,
          0,
          v20) & 1) != 0)
  {
    id v6 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v15;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          BOOL v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (([v11 isEqualToString:@"temp"] & 1) == 0)
          {
            id v12 = -[HDSQLiteDatabase _schemaForDatabaseWithName:error:](self, v11, (uint64_t)a3);
            if (!v12)
            {

              id v13 = 0;
              goto LABEL_15;
            }
            [v6 setObject:v12 forKeyedSubscript:v11];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v13 = v6;
LABEL_15:
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __40__HDSQLiteDatabase_dumpSchemaWithError___block_invoke(uint64_t a1, HDSQLiteRow *a2)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  BOOL v3 = HDSQLiteColumnWithNameAsString(a2, @"name");
  [v2 addObject:v3];

  return 1;
}

- (void)unitTest_setCorruptionError:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSString)fileProtectionType
{
  return self->_fileProtectionType;
}

- (void)setCheckpointRequired:(BOOL)a3
{
  self->_checkpointRequired = a3;
}

- (HDSQLiteDatabaseDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDSQLiteDatabaseDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)cacheScope
{
  return self->_cacheScope;
}

- (HDSQLiteStatementCache)statementCache
{
  return self->_statementCache;
}

- (void)setEncounteredOutOfSpace:(BOOL)a3
{
  self->_encounteredOutOfSpace = a3;
}

- (BOOL)permitWritesInReadTransaction
{
  return self->_permitWritesInReadTransaction;
}

- (void)setPermitWritesInReadTransaction:(BOOL)a3
{
  self->_permitWritesInReadTransaction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_corruptionError, 0);
  objc_storeStrong((id *)&self->_statementCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileProtectionType, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_onRollbackBlocks, 0);
  objc_storeStrong((id *)&self->_onCommitBlocks, 0);

  objc_storeStrong((id *)&self->_beforeCommitBlocks, 0);
}

+ (void)memoryDatabaseFromURL:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)memoryDatabaseFromURL:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_openForWriting:(uint8_t *)buf additionalFlags:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t *a2, uint8_t *buf, os_log_t log)
{
  uint64_t v4 = *a2;
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = v4;
  _os_log_error_impl(&dword_21BFB4000, log, OS_LOG_TYPE_ERROR, "%{public}@: Invalid fileProtectionType \"%{public}@\"", buf, 0x16u);
}

- (void)performTransactionWithType:(void *)a1 error:(uint64_t)a2 usingBlock:.cold.1(void *a1, uint64_t a2)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  id v2 = a1;
  OUTLINED_FUNCTION_4(&dword_21BFB4000, v3, v4, "%{public}@ beforeCommitLoopLimit limit reached in transaction");
}

- (void)performTransactionWithType:(os_log_t)log error:usingBlock:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21BFB4000, log, OS_LOG_TYPE_FAULT, "Transaction block failed without an error.", v1, 2u);
}

- (void)performTransactionWithType:(uint64_t)a1 error:(uint64_t)a2 usingBlock:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_21BFB4000, log, OS_LOG_TYPE_FAULT, "Cannot perform %@ transaction inside an existing %@ transaction", (uint8_t *)&v3, 0x16u);
}

- (void)_executeStatementWithError:(os_log_t)log statementProvider:bindingHandler:enumerationHandler:.cold.1(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_21BFB4000, log, OS_LOG_TYPE_FAULT, "Unsafe statement in read-only transaction: %s", buf, 0xCu);
}

- (void)_executeStatementWithError:(void *)a1 statementProvider:(uint64_t)a2 bindingHandler:enumerationHandler:.cold.2(void *a1, uint64_t a2)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  id v2 = a1;
  OUTLINED_FUNCTION_4(&dword_21BFB4000, v3, v4, "%{public}@ Attempt to execute SQL within a commit or rollback block");
}

- (void)_stepStatement:(uint64_t)a3 hasRow:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_stepStatement:(uint8_t *)buf hasRow:(os_log_t)log error:.cold.2(uint64_t a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109634;
  *((_DWORD *)buf + 1) = 19;
  *((_WORD *)buf + 4) = 2082;
  *(void *)(buf + 10) = a1;
  *((_WORD *)buf + 9) = 2080;
  *(void *)(buf + 20) = a2;
  _os_log_debug_impl(&dword_21BFB4000, log, OS_LOG_TYPE_DEBUG, "Constraint violation during statement step: [%d, %{public}s]  %s", buf, 0x1Cu);
}

- (void)validateForeignKeysForTable:(uint64_t)a3 databaseName:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)typeOfColumn:inTable:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_21BFB4000, v0, v1, "Failed to retrieve schema for '%{public}@': %{public}@");
}

- (void)enableIncrementalAutovacuumForDatabaseWithName:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)enableIncrementalAutovacuumForDatabaseWithName:(NSObject *)a3 error:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_3(&dword_21BFB4000, a2, a3, "Failed to set %lld for CACHE_SPILL when enabling incremental autovacuum: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)enableIncrementalAutovacuumForDatabaseWithName:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end