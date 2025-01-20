@interface EDDataDetectionPersistence
+ (id)_dataDetectionResultsTableSchemaWithName:(id)a3;
+ (id)protectedTablesAndForeignKeysToResolve:(id *)a3;
- (BOOL)_addDataDetectionResults:(id)a3 withGlobalMessageID:(int64_t)a4 toTable:(id)a5 withConnection:(id)a6;
- (BOOL)_hookResponderRespondsToRequiredMethods:(id)a3;
- (BOOL)addDataDetectionResults:(id)a3 globalMessageID:(int64_t)a4;
- (EDDataDetectionPersistence)initWithDatabase:(id)a3 messagePersistence:(id)a4 hookResponder:(id)a5;
- (EDMessageChangeHookResponder)hookResponder;
- (EDMessagePersistence)messagePersistence;
- (EDPersistenceDatabase)database;
- (id)_getPersistedMessagesFromGlobalMessageID:(int64_t)a3;
- (id)getDataDetectionResultRowIDsForGlobalMessageID:(int64_t)a3;
- (id)getDataDetectionResultsForGlobalMessageID:(int64_t)a3;
@end

@implementation EDDataDetectionPersistence

void ___ef_log_EDDataDetectionPersistence_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDDataDetectionPersistence");
  v1 = (void *)_ef_log_EDDataDetectionPersistence_log;
  _ef_log_EDDataDetectionPersistence_log = (uint64_t)v0;
}

+ (id)protectedTablesAndForeignKeysToResolve:(id *)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    *a3 = (id)MEMORY[0x1E4F1CBF0];
  }
  v3 = [a1 _dataDetectionResultsTableSchemaWithName:@"data_detection_results"];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

+ (id)_dataDetectionResultsTableSchemaWithName:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F60F08]);
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"global_message_id" nullable:0];
  v13[0] = v5;
  v6 = [MEMORY[0x1E4F60E80] textColumnWithName:@"category" collation:1 nullable:0];
  v13[1] = v6;
  v7 = [MEMORY[0x1E4F60E80] textColumnWithName:@"value" collation:1 nullable:0];
  v13[2] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  v9 = (void *)[v4 initWithName:v3 rowIDType:1 columns:v8];

  v12[0] = @"global_message_id";
  v12[1] = @"category";
  v12[2] = @"value";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  [v9 addUniquenessConstraintForColumns:v10 conflictResolution:1];

  return v9;
}

- (EDDataDetectionPersistence)initWithDatabase:(id)a3 messagePersistence:(id)a4 hookResponder:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EDDataDetectionPersistence;
  v13 = [(EDDataDetectionPersistence *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_database, a3);
    objc_storeWeak((id *)&v14->_hookResponder, v12);
    objc_storeStrong((id *)&v14->_messagePersistence, a4);
    if (v12)
    {
      if (![(EDDataDetectionPersistence *)v14 _hookResponderRespondsToRequiredMethods:v12])
      {
        v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:a2 object:v14 file:@"EDDataDetectionPersistence.m" lineNumber:68 description:@"HookResponder does not respond to all of the methods required by EDDataDetectionPersistence."];
      }
    }
  }

  return v14;
}

- (BOOL)addDataDetectionResults:(id)a3 globalMessageID:(int64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    v7 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
    v8 = [(EDDataDetectionPersistence *)self hookResponder];
    [v8 persistenceWillBeginUpdates];

    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 1;
    v9 = [(EDDataDetectionPersistence *)self database];
    id v10 = [NSString stringWithUTF8String:"-[EDDataDetectionPersistence addDataDetectionResults:globalMessageID:]"];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __70__EDDataDetectionPersistence_addDataDetectionResults_globalMessageID___block_invoke;
    v19 = &unk_1E6C00008;
    v22 = &v24;
    v20 = self;
    id v21 = v6;
    int64_t v23 = a4;
    objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, &v16);

    id v11 = -[EDDataDetectionPersistence _getPersistedMessagesFromGlobalMessageID:](self, "_getPersistedMessagesFromGlobalMessageID:", a4, v16, v17, v18, v19, v20);
    id v12 = [(EDDataDetectionPersistence *)self hookResponder];
    [v12 persistenceDidAddDataDetectionResults:v11 generationWindow:v7];

    v13 = [(EDDataDetectionPersistence *)self hookResponder];
    [v13 persistenceDidFinishUpdates];

    BOOL v14 = *((unsigned char *)v25 + 24) != 0;
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

uint64_t __70__EDDataDetectionPersistence_addDataDetectionResults_globalMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _addDataDetectionResults:*(void *)(a1 + 40) withGlobalMessageID:*(void *)(a1 + 56) toTable:@"data_detection_results" withConnection:v3];
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

  return v4;
}

- (BOOL)_addDataDetectionResults:(id)a3 withGlobalMessageID:(int64_t)a4 toTable:(id)a5 withConnection:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__9;
  v32 = __Block_byref_object_dispose__9;
  id v33 = (id)0xAAAAAAAAAAAAAAAALL;
  id v33 = (id)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:v10 conflictResolution:4];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __98__EDDataDetectionPersistence__addDataDetectionResults_withGlobalMessageID_toTable_withConnection___block_invoke;
  v27[3] = &unk_1E6C00DD8;
  v27[4] = &v28;
  v27[5] = a4;
  [v9 enumerateKeysAndObjectsUsingBlock:v27];
  uint64_t v12 = v29[5];
  id v26 = 0;
  char v13 = [v11 executeInsertStatement:v12 error:&v26];
  id v14 = v26;
  v15 = _ef_log_EDDataDetectionPersistence();
  uint64_t v16 = v15;
  if (v13)
  {
    uint64_t v17 = v15;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = [MEMORY[0x1E4F60E00] partiallyRedactedDictionary:v9];
      -[EDDataDetectionPersistence _addDataDetectionResults:withGlobalMessageID:toTable:withConnection:](v18, buf, v17);
    }
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[EDDataDetectionPersistence _addDataDetectionResults:withGlobalMessageID:toTable:withConnection:]((uint64_t)v14, v16, v19, v20, v21, v22, v23, v24);
    }

    [v11 handleError:v14 message:@"Inserting into the data detection results table"];
  }

  _Block_object_dispose(&v28, 8);
  return v13;
}

void __98__EDDataDetectionPersistence__addDataDetectionResults_withGlobalMessageID_toTable_withConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = a3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        id v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addValue];
        [v10 setObject:v9 forKeyedSubscript:@"value"];
        [v10 setObject:v5 forKeyedSubscript:@"category"];
        id v11 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
        [v10 setObject:v11 forKeyedSubscript:@"global_message_id"];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (id)getDataDetectionResultsForGlobalMessageID:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__9;
  uint64_t v19 = __Block_byref_object_dispose__9;
  id v20 = (id)0xAAAAAAAAAAAAAAAALL;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [(EDDataDetectionPersistence *)self database];
  uint64_t v6 = [NSString stringWithUTF8String:"-[EDDataDetectionPersistence getDataDetectionResultsForGlobalMessageID:]"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__EDDataDetectionPersistence_getDataDetectionResultsForGlobalMessageID___block_invoke;
  v14[3] = &unk_1E6BFFE38;
  v14[4] = &v15;
  v14[5] = a3;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v14);

  uint64_t v7 = [(id)v16[5] count];
  uint64_t v8 = _ef_log_EDDataDetectionPersistence();
  uint64_t v9 = v8;
  if (v7)
  {
    id v10 = v8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [MEMORY[0x1E4F60E00] partiallyRedactedDictionary:v16[5]];
      *(_DWORD *)buf = 134349314;
      int64_t v22 = a3;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Database read data detection results for message %{public}lld: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    int64_t v22 = a3;
    _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Did not find any data detection results for message %{public}lld", buf, 0xCu);
  }

  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

uint64_t __72__EDDataDetectionPersistence_getDataDetectionResultsForGlobalMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"value" table:@"data_detection_results"];
  [v4 addResultColumn:@"category"];
  id v5 = [MEMORY[0x1E4F60E78] column:@"global_message_id"];
  uint64_t v6 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  uint64_t v7 = [v5 is:v6];
  [v4 setWhere:v7];

  id v17 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__EDDataDetectionPersistence_getDataDetectionResultsForGlobalMessageID___block_invoke_2;
  v18[3] = &unk_1E6BFF4C8;
  v18[4] = *(void *)(a1 + 32);
  LOBYTE(v7) = [v3 executeSelectStatement:v4 withBlock:v18 error:&v17];
  id v8 = v17;
  if ((v7 & 1) == 0)
  {
    uint64_t v9 = _ef_log_EDDataDetectionPersistence();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __72__EDDataDetectionPersistence_getDataDetectionResultsForGlobalMessageID___block_invoke_cold_1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    }

    [v3 handleError:v8 message:@"Reading data detection results"];
  }

  return 1;
}

void __72__EDDataDetectionPersistence_getDataDetectionResultsForGlobalMessageID___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 objectForKeyedSubscript:@"category"];
  uint64_t v4 = [v3 stringValue];

  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v4];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v6 forKeyedSubscript:v4];
  }
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v4];
  id v8 = [v10 objectForKeyedSubscript:@"value"];
  uint64_t v9 = [v8 stringValue];
  [v7 addObject:v9];
}

- (id)getDataDetectionResultRowIDsForGlobalMessageID:(int64_t)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__9;
  uint64_t v18 = __Block_byref_object_dispose__9;
  id v19 = (id)0xAAAAAAAAAAAAAAAALL;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__9;
  v10[4] = __Block_byref_object_dispose__9;
  id v11 = 0;
  id v5 = [(EDDataDetectionPersistence *)self database];
  id v6 = [NSString stringWithUTF8String:"-[EDDataDetectionPersistence getDataDetectionResultRowIDsForGlobalMessageID:]"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__EDDataDetectionPersistence_getDataDetectionResultRowIDsForGlobalMessageID___block_invoke;
  v9[3] = &unk_1E6C00E00;
  v9[4] = v12;
  v9[5] = &v14;
  v9[6] = v10;
  v9[7] = a3;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v9);

  id v7 = (id)v15[5];
  _Block_object_dispose(v10, 8);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

uint64_t __77__EDDataDetectionPersistence_getDataDetectionResultRowIDsForGlobalMessageID___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"ROWID" table:@"data_detection_results"];
  id v5 = [MEMORY[0x1E4F60E78] column:@"global_message_id"];
  id v6 = [NSNumber numberWithLongLong:a1[7]];
  id v7 = [v5 is:v6];
  [v4 setWhere:v7];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77__EDDataDetectionPersistence_getDataDetectionResultRowIDsForGlobalMessageID___block_invoke_2;
  v21[3] = &unk_1E6BFF4C8;
  uint64_t v9 = (uint64_t)(a1 + 6);
  uint64_t v8 = a1[6];
  v21[4] = a1[5];
  uint64_t v10 = *(void *)(v8 + 8);
  id obj = *(id *)(v10 + 40);
  char v11 = [v3 executeSelectStatement:v4 withBlock:v21 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = v11;
  if (!*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    uint64_t v12 = _ef_log_EDDataDetectionPersistence();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __77__EDDataDetectionPersistence_getDataDetectionResultRowIDsForGlobalMessageID___block_invoke_cold_1(v9, v12, v13, v14, v15, v16, v17, v18);
    }

    [v3 handleError:*(void *)(*(void *)(*(void *)v9 + 8) + 40) message:@"Getting data detection results from message ID"];
  }

  return 1;
}

void __77__EDDataDetectionPersistence_getDataDetectionResultRowIDsForGlobalMessageID___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = [a2 objectForKeyedSubscript:@"ROWID"];
  id v3 = [v4 numberValue];
  [v2 addObject:v3];
}

- (id)_getPersistedMessagesFromGlobalMessageID:(int64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(EDDataDetectionPersistence *)self messagePersistence];
  id v6 = [NSNumber numberWithLongLong:a3];
  v12[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v8 = [v5 persistedMessageIDsForGlobalMessageIDs:v7];

  uint64_t v9 = [(EDDataDetectionPersistence *)self messagePersistence];
  uint64_t v10 = [v9 persistedMessagesForDatabaseIDs:v8 requireProtectedData:0 temporarilyUnavailableDatabaseIDs:0];

  return v10;
}

- (BOOL)_hookResponderRespondsToRequiredMethods:(id)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDMessageChangeHookResponder)hookResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hookResponder);

  return (EDMessageChangeHookResponder *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hookResponder);
  objc_storeStrong((id *)&self->_messagePersistence, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

- (void)_addDataDetectionResults:(os_log_t)log withGlobalMessageID:toTable:withConnection:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "Successfully detected and persisted data detection results: %@", buf, 0xCu);
}

- (void)_addDataDetectionResults:(uint64_t)a3 withGlobalMessageID:(uint64_t)a4 toTable:(uint64_t)a5 withConnection:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__EDDataDetectionPersistence_getDataDetectionResultsForGlobalMessageID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __77__EDDataDetectionPersistence_getDataDetectionResultRowIDsForGlobalMessageID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end