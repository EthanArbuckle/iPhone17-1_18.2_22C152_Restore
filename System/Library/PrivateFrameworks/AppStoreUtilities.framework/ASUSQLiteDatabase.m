@interface ASUSQLiteDatabase
- (ASUSQLiteDatabase)initWithConnection:(id)a3;
- (ASUSQLiteDatabase)initWithConnectionOptions:(id)a3;
- (BOOL)connectionNeedsResetForCorruption:(id)a3;
- (BOOL)connectionNeedsResetForReopen:(id)a3;
- (BOOL)tableExists:(id)a3;
- (dispatch_queue_t)_readUsingSession:(void *)a3 withBlock:;
- (uint64_t)_performMigrationIfNeededForStore:(char)a3 calledAfterTransaction:;
- (void)_modifyUsingTransactionClass:(void *)a3 withBlock:;
- (void)_reentrantSafePerformBlock:(NSObject *)a1;
- (void)assertOnTransactionQueue;
- (void)modifyStore:(id)a3 usingTransaction:(id)a4;
- (void)modifyStore:(id)a3 usingTransaction:(id)a4 completion:(id)a5;
- (void)modifyStore:(id)a3 usingTransactionClass:(Class)a4 withBlock:(id)a5;
- (void)modifyStore:(id)a3 usingTransactionClass:(Class)a4 withBlock:(id)a5 completion:(id)a6;
- (void)readStore:(id)a3 usingSession:(id)a4;
- (void)readStore:(id)a3 usingSession:(id)a4 completion:(id)a5;
- (void)verifyDatabaseIntegrity;
@end

@implementation ASUSQLiteDatabase

- (ASUSQLiteDatabase)initWithConnection:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASUSQLiteDatabase;
  id v6 = [(ASUSQLiteDatabase *)&v13 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.appstored.ASUSQLiteDatabase", v7);
    v9 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v8;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v6 + 2), "_ASUSQLiteDispatchQueueTag", v6, 0);
    uint64_t v10 = [MEMORY[0x263F088B0] hashTableWithOptions:258];
    v11 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v10;

    objc_storeStrong((id *)v6 + 1, a3);
    [*((id *)v6 + 1) setDelegate:v6];
  }

  return (ASUSQLiteDatabase *)v6;
}

- (ASUSQLiteDatabase)initWithConnectionOptions:(id)a3
{
  id v4 = a3;
  id v5 = [[ASUSQLiteConnection alloc] initWithOptions:v4];

  id v6 = [(ASUSQLiteDatabase *)self initWithConnection:v5];
  return v6;
}

- (void)assertOnTransactionQueue
{
}

- (void)modifyStore:(id)a3 usingTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__ASUSQLiteDatabase_modifyStore_usingTransaction___block_invoke;
  v10[3] = &unk_26522F950;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[ASUSQLiteDatabase _reentrantSafePerformBlock:]((NSObject **)self, v10);
}

void __50__ASUSQLiteDatabase_modifyStore_usingTransaction___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    -[ASUSQLiteDatabase _performMigrationIfNeededForStore:calledAfterTransaction:](v2, *(void **)(a1 + 40), 0);
  }
  id v3 = [(id)objc_opt_class() storeDescriptor];
  -[ASUSQLiteDatabase _modifyUsingTransactionClass:withBlock:](*(void *)(a1 + 32), (objc_class *)[v3 transactionClass], *(void **)(a1 + 48));
}

- (void)_modifyUsingTransactionClass:(void *)a3 withBlock:
{
  id v5 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    id v6 = (void *)[[a2 alloc] initWithConnection:*(void *)(a1 + 8)];
    id v7 = *(void **)(a1 + 8);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__ASUSQLiteDatabase__modifyUsingTransactionClass_withBlock___block_invoke;
    v9[3] = &unk_26522FA90;
    id v10 = v6;
    id v11 = v5;
    id v8 = v6;
    [v7 performTransaction:v9 error:0];
  }
}

- (void)_reentrantSafePerformBlock:(NSObject *)a1
{
  block = a2;
  if (a1)
  {
    specific = (NSObject **)dispatch_get_specific("_ASUSQLiteDispatchQueueTag");
    id v4 = a1[2];
    if (specific == a1)
    {
      dispatch_assert_queue_V2(v4);
      block[2]();
    }
    else
    {
      dispatch_assert_queue_not_V2(v4);
      dispatch_sync(a1[2], block);
    }
  }
}

- (void)modifyStore:(id)a3 usingTransaction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  transactionQueue = self->_transactionQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__ASUSQLiteDatabase_modifyStore_usingTransaction_completion___block_invoke;
  v15[3] = &unk_26522F978;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(transactionQueue, v15);
}

void __61__ASUSQLiteDatabase_modifyStore_usingTransaction_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    -[ASUSQLiteDatabase _performMigrationIfNeededForStore:calledAfterTransaction:](v2, *(void **)(a1 + 40), 0);
  }
  id v4 = [(id)objc_opt_class() storeDescriptor];
  -[ASUSQLiteDatabase _modifyUsingTransactionClass:withBlock:](*(void *)(a1 + 32), (objc_class *)[v4 transactionClass], *(void **)(a1 + 48));
  id v3 = dispatch_get_global_queue(21, 0);
  dispatch_async(v3, *(dispatch_block_t *)(a1 + 56));
}

- (void)modifyStore:(id)a3 usingTransactionClass:(Class)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__ASUSQLiteDatabase_modifyStore_usingTransactionClass_withBlock___block_invoke;
  v12[3] = &unk_26522F9A0;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  Class v15 = a4;
  id v10 = v9;
  id v11 = v8;
  -[ASUSQLiteDatabase _reentrantSafePerformBlock:]((NSObject **)self, v12);
}

void __65__ASUSQLiteDatabase_modifyStore_usingTransactionClass_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    -[ASUSQLiteDatabase _performMigrationIfNeededForStore:calledAfterTransaction:](v2, *(void **)(a1 + 40), 0);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v4 = *(void **)(a1 + 48);
  id v3 = *(objc_class **)(a1 + 56);

  -[ASUSQLiteDatabase _modifyUsingTransactionClass:withBlock:](v2, v3, v4);
}

- (void)modifyStore:(id)a3 usingTransactionClass:(Class)a4 withBlock:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  transactionQueue = self->_transactionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__ASUSQLiteDatabase_modifyStore_usingTransactionClass_withBlock_completion___block_invoke;
  block[3] = &unk_26522F9C8;
  block[4] = self;
  id v18 = v10;
  id v20 = v12;
  Class v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(transactionQueue, block);
}

void __76__ASUSQLiteDatabase_modifyStore_usingTransactionClass_withBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    -[ASUSQLiteDatabase _performMigrationIfNeededForStore:calledAfterTransaction:](v2, *(void **)(a1 + 40), 0);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  -[ASUSQLiteDatabase _modifyUsingTransactionClass:withBlock:](v2, *(objc_class **)(a1 + 64), *(void **)(a1 + 48));
  id v3 = dispatch_get_global_queue(21, 0);
  dispatch_async(v3, *(dispatch_block_t *)(a1 + 56));
}

- (void)readStore:(id)a3 usingSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__ASUSQLiteDatabase_readStore_usingSession___block_invoke;
  v10[3] = &unk_26522F950;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[ASUSQLiteDatabase _reentrantSafePerformBlock:]((NSObject **)self, v10);
}

void __44__ASUSQLiteDatabase_readStore_usingSession___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    -[ASUSQLiteDatabase _performMigrationIfNeededForStore:calledAfterTransaction:](v2, *(void **)(a1 + 40), 0);
  }
  id v3 = [(id)objc_opt_class() storeDescriptor];
  id v4 = objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "sessionClass")), "initWithConnection:", *(void *)(*(void *)(a1 + 32) + 8));
  id v5 = *(dispatch_queue_t **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__ASUSQLiteDatabase_readStore_usingSession___block_invoke_2;
  v7[3] = &unk_26522F9F0;
  id v8 = *(id *)(a1 + 48);
  id v6 = -[ASUSQLiteDatabase _readUsingSession:withBlock:](v5, v4, v7);
}

uint64_t __44__ASUSQLiteDatabase_readStore_usingSession___block_invoke_2(uint64_t a1)
{
  return 0;
}

- (dispatch_queue_t)_readUsingSession:(void *)a3 withBlock:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__0;
    id v18 = __Block_byref_object_dispose__0;
    id v19 = 0;
    dispatch_queue_t v7 = a1[1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __49__ASUSQLiteDatabase__readUsingSession_withBlock___block_invoke;
    v10[3] = &unk_26522FB08;
    id v13 = &v14;
    id v12 = v6;
    id v11 = v5;
    if ([v7 performTransaction:v10 error:0]) {
      id v8 = (void *)v15[5];
    }
    else {
      id v8 = 0;
    }
    a1 = v8;

    _Block_object_dispose(&v14, 8);
  }

  return a1;
}

- (void)readStore:(id)a3 usingSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  transactionQueue = self->_transactionQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55__ASUSQLiteDatabase_readStore_usingSession_completion___block_invoke;
  v15[3] = &unk_26522F978;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(transactionQueue, v15);
}

void __55__ASUSQLiteDatabase_readStore_usingSession_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    -[ASUSQLiteDatabase _performMigrationIfNeededForStore:calledAfterTransaction:](v2, *(void **)(a1 + 40), 0);
  }
  id v3 = [(id)objc_opt_class() storeDescriptor];
  id v4 = objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "sessionClass")), "initWithConnection:", *(void *)(*(void *)(a1 + 32) + 8));
  id v5 = -[ASUSQLiteDatabase _readUsingSession:withBlock:](*(dispatch_queue_t **)(a1 + 32), v4, *(void **)(a1 + 48));
  id v6 = dispatch_get_global_queue(21, 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__ASUSQLiteDatabase_readStore_usingSession_completion___block_invoke_2;
  v9[3] = &unk_26522FA18;
  id v7 = *(id *)(a1 + 56);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, v9);
}

uint64_t __55__ASUSQLiteDatabase_readStore_usingSession_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)connectionNeedsResetForReopen:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  id v5 = ASULogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v7 = [v4 options];
    id v8 = [v7 databasePath];
    int v9 = 138543362;
    id v10 = v8;
    _os_log_error_impl(&dword_247E53000, v5, OS_LOG_TYPE_ERROR, "Requiring all stores to migrate after truncating corrupt database at: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  NSResetHashTable(self->_migratedStores);

  return 1;
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  id v5 = [v4 options];
  id v6 = [v5 databasePath];

  id v7 = ASULogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_error_impl(&dword_247E53000, v7, OS_LOG_TYPE_ERROR, "Exiting after deleting corrupt database at: %{public}@", buf, 0xCu);
  }

  [v4 close];
  id v15 = 0;
  ASUSQLiteDeleteDatabase(v6, &v15);
  id v8 = v15;
  if (v8)
  {
    int v9 = v8;
    id v10 = ASULogHandleForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v9;
      _os_log_error_impl(&dword_247E53000, v10, OS_LOG_TYPE_ERROR, "Error when deleting corrupt database, renaming database instead: %{public}@", buf, 0xCu);
    }

    id v14 = 0;
    ASUSQLiteTrashDatabaseName(v6, &v14);
    id v11 = v14;
    if (v11)
    {
      id v12 = v11;
      id v13 = ASULogHandleForCategory(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v17 = v12;
        _os_log_error_impl(&dword_247E53000, v13, OS_LOG_TYPE_ERROR, "Error when renaming database: %{public}@", buf, 0xCu);
      }
    }
  }
  exit(0);
}

- (BOOL)tableExists:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__ASUSQLiteDatabase_tableExists___block_invoke;
  v7[3] = &unk_26522FA40;
  int v9 = &v10;
  void v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  -[ASUSQLiteDatabase _reentrantSafePerformBlock:]((NSObject **)self, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __33__ASUSQLiteDatabase_tableExists___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) tableExists:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)verifyDatabaseIntegrity
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __44__ASUSQLiteDatabase_verifyDatabaseIntegrity__block_invoke;
  v2[3] = &unk_26522FA68;
  v2[4] = self;
  -[ASUSQLiteDatabase _reentrantSafePerformBlock:]((NSObject **)self, v2);
}

void __44__ASUSQLiteDatabase_verifyDatabaseIntegrity__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) options];
  id v3 = [v2 databasePath];

  LODWORD(v2) = [*(id *)(*(void *)(a1 + 32) + 8) tableExists:@"schema_version"];
  id v4 = ASULogHandleForCategory(1);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v5)
    {
      int v7 = 138543362;
      id v8 = v3;
      id v6 = "Database opened at: %{public}@";
LABEL_6:
      _os_log_impl(&dword_247E53000, v4, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v7, 0xCu);
    }
  }
  else if (v5)
  {
    int v7 = 138543362;
    id v8 = v3;
    id v6 = "Database created at: %{public}@";
    goto LABEL_6;
  }
}

uint64_t __60__ASUSQLiteDatabase__modifyUsingTransactionClass_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (uint64_t)_performMigrationIfNeededForStore:(char)a3 calledAfterTransaction:
{
  id v5 = a2;
  if (a1)
  {
    if (NSHashGet(*(NSHashTable **)(a1 + 24), v5))
    {
      uint64_t v6 = 1;
    }
    else
    {
      int v7 = [(id)objc_opt_class() storeDescriptor];
      id v8 = [ASUSQLiteDatabaseStoreSchema alloc];
      uint64_t v9 = *(void *)(a1 + 8);
      uint64_t v10 = [v7 schemaName];
      id v11 = [v7 tableNames];
      uint64_t v12 = [(ASUSQLiteDatabaseStoreSchema *)v8 initWithConnection:v9 schemaName:v10 tableNames:v11];

      char v13 = *(void **)(a1 + 8);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __78__ASUSQLiteDatabase__performMigrationIfNeededForStore_calledAfterTransaction___block_invoke;
      v17[3] = &unk_26522FAE0;
      id v18 = v5;
      id v19 = v12;
      char v22 = a3;
      uint64_t v20 = a1;
      id v21 = v7;
      id v14 = v7;
      id v15 = v12;
      uint64_t v6 = [v13 performTransaction:v17 error:0];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __78__ASUSQLiteDatabase__performMigrationIfNeededForStore_calledAfterTransaction___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(id)objc_opt_class() createOrMigrateStoreUsingSchema:*(void *)(a1 + 40)];
  if (v2)
  {
    if (!*(unsigned char *)(a1 + 64))
    {
      uint64_t v3 = *(void *)(a1 + 48);
      id v4 = *(void **)(v3 + 8);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __78__ASUSQLiteDatabase__performMigrationIfNeededForStore_calledAfterTransaction___block_invoke_2;
      v9[3] = &unk_26522FAB8;
      void v9[4] = v3;
      id v10 = *(id *)(a1 + 32);
      [v4 dispatchAfterTransaction:v9];
    }
  }
  else
  {
    id v5 = ASULogHandleForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v7 = [*(id *)(a1 + 56) schemaName];
      uint64_t v8 = [*(id *)(a1 + 40) currentSchemaVersion];
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
    }
  }
  return v2;
}

void __78__ASUSQLiteDatabase__performMigrationIfNeededForStore_calledAfterTransaction___block_invoke_2(uint64_t a1)
{
  v1 = *(NSObject ***)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __78__ASUSQLiteDatabase__performMigrationIfNeededForStore_calledAfterTransaction___block_invoke_3;
  v2[3] = &unk_26522FAB8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  -[ASUSQLiteDatabase _reentrantSafePerformBlock:](v1, v2);
}

void __78__ASUSQLiteDatabase__performMigrationIfNeededForStore_calledAfterTransaction___block_invoke_3(uint64_t a1)
{
  if (-[ASUSQLiteDatabase _performMigrationIfNeededForStore:calledAfterTransaction:](*(void *)(a1 + 32), *(void *)(a1 + 40), 1))
  {
    uint64_t v2 = *(const void **)(a1 + 40);
    id v3 = *(NSHashTable **)(*(void *)(a1 + 32) + 24);
    NSHashInsert(v3, v2);
  }
}

uint64_t __49__ASUSQLiteDatabase__readUsingSession_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migratedStores, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end