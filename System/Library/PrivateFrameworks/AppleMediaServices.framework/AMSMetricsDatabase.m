@interface AMSMetricsDatabase
+ (id)sharedDatabaseWithContainerId:(id)a3;
- (AMSMetricsDatabase)initWithContainerId:(id)a3;
- (AMSSQLiteConnection)connection;
- (BOOL)cleanupInvalidIdentifiersWithError:(id *)a3;
- (BOOL)clearIdentifierSyncStateWithError:(id *)a3;
- (BOOL)connectionNeedsResetForCorruption:(id)a3;
- (BOOL)dropAllEventsWithLockKey:(id)a3 error:(id *)a4;
- (BOOL)dropEvents:(id)a3 error:(id *)a4;
- (BOOL)enumerateUnsyncedIdentifierStoresUsingBlock:(id)a3 error:(id *)a4;
- (BOOL)enumerateUnsyncedIdentifiersUsingBlock:(id)a3 error:(id *)a4;
- (BOOL)insertEvents:(id)a3 error:(id *)a4;
- (BOOL)permanentlyRemoveIdentifierForKey:(id)a3 error:(id *)a4;
- (BOOL)removeCrossDeviceIdentifiersWithError:(id *)a3;
- (BOOL)removeIdentifiersForAccount:(id)a3 error:(id *)a4;
- (BOOL)removeIdentifiersForStore:(id)a3 error:(id *)a4;
- (BOOL)unlockAllEventsWithKey:(id)a3 error:(id *)a4;
- (BOOL)unlockEvents:(id)a3 error:(id *)a4;
- (NSString)containerId;
- (OS_dispatch_queue)internalQueue;
- (id)_cachePath;
- (id)_lockedById;
- (id)identifierForKey:(id)a3 updateMaybe:(id)a4 error:(id *)a5;
- (id)identifierStoreForKey:(id)a3 updateMaybe:(id)a4 error:(id *)a5;
- (id)lockAllEventsWithError:(id *)a3;
- (int64_t)countAllEventsWithLockKey:(id)a3 error:(id *)a4;
- (void)_performTransaction:(id)a3;
- (void)close;
- (void)dealloc;
- (void)enumerateEventsWithTopic:(id)a3 lockKey:(id)a4 objectBlock:(id)a5;
- (void)setConnection:(id)a3;
- (void)setContainerId:(id)a3;
- (void)setInternalQueue:(id)a3;
@end

@implementation AMSMetricsDatabase

uint64_t __42__AMSMetricsDatabase__performTransaction___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) connection];
  id v10 = 0;
  uint64_t v2 = [v1 executeStatement:@"PRAGMA incremental_vacuum(100);" error:&v10];
  id v3 = v10;

  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    v5 = +[AMSLogConfig sharedMetricsConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      v8 = AMSLogableError(v3);
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Incremental vacuum failed. Error = %{public}@", buf, 0x16u);
    }
  }

  return v2;
}

void __42__AMSMetricsDatabase__performTransaction___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AMSMetricsDatabase__performTransaction___block_invoke_2;
  v5[3] = &unk_1E55A4350;
  id v6 = *(id *)(a1 + 40);
  [v2 performTransaction:v5];

  id v3 = [*(id *)(a1 + 32) connection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__AMSMetricsDatabase__performTransaction___block_invoke_3;
  v4[3] = &unk_1E55A4378;
  v4[4] = *(void *)(a1 + 32);
  [v3 performTransaction:v4];
}

- (AMSSQLiteConnection)connection
{
  return self->_connection;
}

uint64_t __42__AMSMetricsDatabase__performTransaction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  v34 = (double *)&v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke_2;
  v28[3] = &unk_1E55A4238;
  uint64_t v3 = *(void *)(a1 + 56);
  BOOL v4 = *(void **)(a1 + 40);
  v28[4] = *(void *)(a1 + 32);
  uint64_t v30 = v3;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 64);
  id v29 = v5;
  uint64_t v31 = v6;
  v32 = &v33;
  objc_msgSend(v2, "executeQuery:withResults:", @"SELECT store_key, store_uuid, account, interval, cross_device, started, last_sync, modified, deleted FROM identifier_stores WHERE store_key=?;",
    v28);

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
    || (uint64_t v7 = *(void *)(a1 + 48),
        uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8),
        id obj = *(id *)(v8 + 40),
        char v9 = (*(uint64_t (**)(void))(v7 + 16))(),
        objc_storeStrong((id *)(v8 + 40), obj),
        (v9 & 1) == 0))
  {
    uint64_t v22 = *(void *)(a1 + 80);
  }
  else
  {
    double v10 = v34[3];
    v11 = [*(id *)(a1 + 32) connection];
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    v16 = *(void **)(v13 + 40);
    uint64_t v15 = (id *)(v13 + 40);
    v14 = v16;
    if (v10 <= 0.0) {
      v17 = @"INSERT OR IGNORE INTO identifier_stores (store_uuid, account, interval, cross_device, started, last_sync, modified, store_key) VALUES (?,?,?,?,?,?,?,?);";
    }
    else {
      v17 = @"UPDATE identifier_stores SET store_uuid=?, account=?, interval=?, cross_device=?, started=?, last_sync=?, modified=?, deleted=0 WHERE store_key=? AND modified=?;";
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke_137;
    v25[3] = &unk_1E55A4260;
    v25[4] = *(void *)(a1 + 64);
    v25[5] = &v33;
    id v26 = v14;
    [v11 executeStatement:v17 error:&v26 bindings:v25];
    objc_storeStrong(v15, v26);

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      v18 = +[AMSLogConfig sharedMetricsConfig];
      if (!v18)
      {
        v18 = +[AMSLogConfig sharedConfig];
      }
      v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = objc_opt_class();
        uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v38 = v20;
        __int16 v39 = 2114;
        uint64_t v40 = v21;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update or insert identifier_stores. %{public}@", buf, 0x16u);
      }
    }
    uint64_t v22 = *(void *)(a1 + 72);
  }
  *(unsigned char *)(*(void *)(v22 + 8) + 24) = 1;
  BOOL v23 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) == 0;

  _Block_object_dispose(&v33, 8);
  return v23;
}

void __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[AMSLogConfig sharedMetricsConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = objc_opt_class();
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query identifiers. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  }
  else
  {
    [v5 bindString:a1[5] atPosition:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke_141;
    v9[3] = &unk_1E55A4210;
    v9[4] = a1[4];
    long long v10 = *((_OWORD *)a1 + 3);
    uint64_t v11 = a1[8];
    [v5 enumerateRowsUsingBlock:v9];
  }
}

void __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[AMSLogConfig sharedMetricsConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = objc_opt_class();
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query identifier_stores. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  }
  else
  {
    [v5 bindString:a1[5] atPosition:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke_129;
    v9[3] = &unk_1E55A4210;
    v9[4] = a1[4];
    long long v10 = *((_OWORD *)a1 + 3);
    uint64_t v11 = a1[8];
    [v5 enumerateRowsUsingBlock:v9];
  }
}

BOOL __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  v34 = (double *)&v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke_2;
  v28[3] = &unk_1E55A4238;
  uint64_t v3 = *(void *)(a1 + 56);
  BOOL v4 = *(void **)(a1 + 40);
  v28[4] = *(void *)(a1 + 32);
  uint64_t v30 = v3;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 64);
  id v29 = v5;
  uint64_t v31 = v6;
  v32 = &v33;
  objc_msgSend(v2, "executeQuery:withResults:", @"SELECT identifier_key, store_uuid, name, value, cross_device, expires, last_sync, modified, deleted, server_provided_at FROM identifiers WHERE identifier_key=?;",
    v28);

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
    || (uint64_t v7 = *(void *)(a1 + 48),
        uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8),
        id obj = *(id *)(v8 + 40),
        char v9 = (*(uint64_t (**)(void))(v7 + 16))(),
        objc_storeStrong((id *)(v8 + 40), obj),
        (v9 & 1) == 0))
  {
    uint64_t v22 = *(void *)(a1 + 80);
  }
  else
  {
    double v10 = v34[3];
    uint64_t v11 = [*(id *)(a1 + 32) connection];
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v16 = *(void **)(v13 + 40);
    id v15 = (id *)(v13 + 40);
    __int16 v14 = v16;
    if (v10 <= 0.0) {
      v17 = @"INSERT OR IGNORE INTO identifiers (store_uuid, name, value, cross_device, expires, last_sync, modified, server_provided_at, identifier_key) VALUES (?,?,?,?,?,?,?,?,?);";
    }
    else {
      v17 = @"UPDATE identifiers SET store_uuid=?, name=?, value=?, cross_device=?, expires=?, last_sync=?, modified=?, deleted=0, server_provided_at=? WHERE identifier_key=? AND modified=?;";
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke_149;
    v25[3] = &unk_1E55A4260;
    v25[4] = *(void *)(a1 + 64);
    v25[5] = &v33;
    id v26 = v14;
    [v11 executeStatement:v17 error:&v26 bindings:v25];
    objc_storeStrong(v15, v26);

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      v18 = +[AMSLogConfig sharedMetricsConfig];
      if (!v18)
      {
        v18 = +[AMSLogConfig sharedConfig];
      }
      v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = objc_opt_class();
        uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v38 = v20;
        __int16 v39 = 2114;
        uint64_t v40 = v21;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update or insert identifiers. %{public}@", buf, 0x16u);
      }
    }
    uint64_t v22 = *(void *)(a1 + 72);
  }
  *(unsigned char *)(*(void *)(v22 + 8) + 24) = 1;
  BOOL v23 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) == 0;

  _Block_object_dispose(&v33, 8);
  return v23;
}

void __41__AMSMetricsDatabase_insertEvents_error___block_invoke_86(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v8 = a2;
  BOOL v4 = [v3 topic];
  [v8 bindString:v4 atPosition:1];

  [v8 bindString:*(void *)(a1 + 40) atPosition:2];
  [v8 bindString:*(void *)(a1 + 48) atPosition:3];
  id v5 = [*(id *)(a1 + 32) account];
  uint64_t v6 = objc_msgSend(v5, "ams_DSID");
  uint64_t v7 = [v6 stringValue];
  [v8 bindNullableString:v7 atPosition:4];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v8, "bindDouble:atPosition:", 5);
}

void __52__AMSMetricsDatabase_sharedDatabaseWithContainerId___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v2 = [[AMSMetricsDatabase alloc] initWithContainerId:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setObject:v2 forKey:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v2);
  uint64_t v3 = [*(id *)(a1 + 48) objectForKey:*(void *)(a1 + 40)];
  BOOL v4 = v3;
  if (v3) {
    dispatch_block_cancel(v3);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AMSMetricsDatabase_sharedDatabaseWithContainerId___block_invoke_5;
  block[3] = &unk_1E559EA90;
  v17 = v2;
  id v5 = v2;
  dispatch_block_t v6 = dispatch_block_create((dispatch_block_flags_t)0, block);

  uint64_t v7 = *(void **)(a1 + 48);
  id v8 = _Block_copy(v6);
  [v7 setObject:v8 forKey:*(void *)(a1 + 40)];

  char v9 = *(void **)(a1 + 56);
  id v10 = v6;
  uint64_t v11 = v9;
  uint64_t v12 = AMSLogKey();
  dispatch_time_t v13 = dispatch_time(0, 30000000000);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __AMSDispatchAfter_block_invoke_4;
  v18[3] = &unk_1E559EAE0;
  id v19 = v12;
  id v20 = v10;
  id v14 = v12;
  id v15 = v10;
  dispatch_after(v13, v11, v18);
}

- (AMSMetricsDatabase)initWithContainerId:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)AMSMetricsDatabase;
  dispatch_block_t v6 = [(AMSMetricsDatabase *)&v42 init];
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_18;
  }
  objc_storeStrong((id *)&v6->_containerId, a3);
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  __int16 v39 = __Block_byref_object_copy__43;
  uint64_t v40 = __Block_byref_object_dispose__43;
  id v41 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __42__AMSMetricsDatabase_initWithContainerId___block_invoke;
  v33[3] = &unk_1E559F2A8;
  uint64_t v35 = &v36;
  id v8 = v7;
  v34 = v8;
  AMSMetricsDatabaseBlockWithKeepAlive(@"AMSMetricsDatabase-init-createDirectory", v33);
  char v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v9[2]();

  if (v37[5])
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.AMSMetricsDatabase.internal", 0);
    id v11 = v8[3];
    v8[3] = v10;

    uint64_t v12 = [AMSSQLiteConnectionOptions alloc];
    dispatch_time_t v13 = [(AMSSQLiteConnectionOptions *)v12 initWithDatabasePath:v37[5]];
    [(AMSSQLiteConnectionOptions *)v13 setCheckpointingOnCloseDisabled:1];
    id v14 = [[AMSSQLiteConnection alloc] initWithOptions:v13];
    [(AMSSQLiteConnection *)v14 setDelegate:v8];
    objc_storeStrong(v8 + 2, v14);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v46 = 0x2020000000;
    char v47 = 0;
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    id v29 = __42__AMSMetricsDatabase_initWithContainerId___block_invoke_9;
    uint64_t v30 = &unk_1E559F2A8;
    p_long long buf = &buf;
    id v15 = v14;
    uint64_t v31 = v15;
    AMSMetricsDatabaseBlockWithKeepAlive(@"AMSMetricsDatabase-init-updateSchema", &v27);
    uint64_t v16 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    v16[2](v16, v17, v18, v19);

    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      int v20 = 0;
    }
    else
    {
      uint64_t v22 = +[AMSLogConfig sharedMetricsConfig];
      if (!v22)
      {
        uint64_t v22 = +[AMSLogConfig sharedConfig];
      }
      BOOL v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = objc_opt_class();
        *(_DWORD *)v43 = 138543362;
        uint64_t v44 = v24;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Fatal Error: Failed to create the database schema", v43, 0xCu);
      }

      int v20 = 1;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    dispatch_time_t v13 = +[AMSLogConfig sharedMetricsConfig];
    if (!v13)
    {
      dispatch_time_t v13 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [(AMSSQLiteConnectionOptions *)v13 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_opt_class();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v21;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Fatal Error: Failed to fetch dbPath", (uint8_t *)&buf, 0xCu);
    }
    int v20 = 1;
  }

  _Block_object_dispose(&v36, 8);
  if (v20) {
    v25 = 0;
  }
  else {
LABEL_18:
  }
    v25 = v7;

  return v25;
}

- (id)identifierForKey:(id)a3 updateMaybe:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__43;
  __int16 v39 = __Block_byref_object_dispose__43;
  id v40 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__43;
  uint64_t v33 = __Block_byref_object_dispose__43;
  id v34 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  do
  {
    char v9 = (void *)v30[5];
    v30[5] = 0;

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke;
    v16[3] = &unk_1E55A4288;
    v16[4] = self;
    uint64_t v19 = &v35;
    id v10 = v7;
    id v17 = v10;
    int v20 = &v29;
    uint64_t v21 = v23;
    id v11 = v8;
    id v18 = v11;
    uint64_t v22 = &v25;
    [(AMSMetricsDatabase *)self _performTransaction:v16];
  }
  while (!*((unsigned char *)v26 + 24));
  uint64_t v12 = (void *)v36[5];
  if (v12)
  {
    id v13 = 0;
    if (a5) {
      *a5 = v12;
    }
  }
  else
  {
    id v13 = (id)v30[5];
  }
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v13;
}

- (id)identifierStoreForKey:(id)a3 updateMaybe:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__43;
  __int16 v39 = __Block_byref_object_dispose__43;
  id v40 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__43;
  uint64_t v33 = __Block_byref_object_dispose__43;
  id v34 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  do
  {
    char v9 = (void *)v30[5];
    v30[5] = 0;

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke;
    v16[3] = &unk_1E55A4288;
    v16[4] = self;
    uint64_t v19 = &v35;
    id v10 = v7;
    id v17 = v10;
    int v20 = &v29;
    uint64_t v21 = v23;
    id v11 = v8;
    id v18 = v11;
    uint64_t v22 = &v25;
    [(AMSMetricsDatabase *)self _performTransaction:v16];
  }
  while (!*((unsigned char *)v26 + 24));
  uint64_t v12 = (void *)v36[5];
  if (v12)
  {
    id v13 = 0;
    if (a5) {
      *a5 = v12;
    }
  }
  else
  {
    id v13 = (id)v30[5];
  }
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v13;
}

- (void)_performTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSMetricsDatabase *)self internalQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__AMSMetricsDatabase__performTransaction___block_invoke;
  v8[3] = &unk_1E559EAE0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  id v7 = AMSMetricsDatabaseBlockWithKeepAlive(@"AMSMetricsDatabase-transaction", v8);
  dispatch_sync(v5, v7);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

+ (id)sharedDatabaseWithContainerId:(id)a3
{
  id v3 = a3;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__43;
  BOOL v23 = __Block_byref_object_dispose__43;
  id v24 = 0;
  if (_MergedGlobals_129 != -1) {
    dispatch_once(&_MergedGlobals_129, &__block_literal_global_87);
  }
  id v4 = (id)qword_1EB38DDA8;
  if (qword_1EB38DDB0 != -1) {
    dispatch_once(&qword_1EB38DDB0, &__block_literal_global_15_3);
  }
  id v5 = (id)qword_1EB38DDB8;
  if (qword_1EB38DDC0 != -1) {
    dispatch_once(&qword_1EB38DDC0, &__block_literal_global_20_0);
  }
  id v6 = (id)qword_1EB38DDC8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AMSMetricsDatabase_sharedDatabaseWithContainerId___block_invoke_4;
  block[3] = &unk_1E55A4008;
  id v14 = v5;
  id v15 = v3;
  id v17 = v4;
  id v18 = &v19;
  id v16 = v6;
  id v7 = v4;
  id v8 = v6;
  id v9 = v3;
  id v10 = v5;
  dispatch_sync(v7, block);
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke_141(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (v8)
  {
    id v9 = +[AMSLogConfig sharedMetricsConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v26 = 138543618;
      uint64_t v27 = objc_opt_class();
      __int16 v28 = 2114;
      id v29 = v8;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enumerate identifiers. %{public}@", (uint8_t *)&v26, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = *(void *)(a1[6] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    id v14 = [v7 stringForColumnIndex:0];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setIdKey:v14];

    id v15 = [v7 stringForColumnIndex:1];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setStoreUUID:v15];

    id v16 = [v7 stringForColumnIndex:2];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setName:v16];

    id v17 = [v7 stringForColumnIndex:3];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setValue:v17];

    objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "setCrossDeviceSync:", objc_msgSend(v7, "intForColumnIndex:", 4) != 0);
    [v7 doubleForColumnIndex:5];
    if (v18 <= 0.0)
    {
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    }
    [*(id *)(*(void *)(a1[6] + 8) + 40) setExpires:v19];

    [v7 doubleForColumnIndex:6];
    if (v20 <= 0.0)
    {
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    }
    [*(id *)(*(void *)(a1[6] + 8) + 40) setLastSync:v21];

    [v7 doubleForColumnIndex:7];
    *(void *)(*(void *)(a1[7] + 8) + 24) = v22;
    BOOL v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)(*(void *)(a1[7] + 8) + 24)];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setModified:v23];

    objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "setDeleted:", objc_msgSend(v7, "intForColumnIndex:", 8) != 0);
    [v7 doubleForColumnIndex:9];
    if (v24 <= 0.0)
    {
      uint64_t v25 = 0;
    }
    else
    {
      uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    }
    [*(id *)(*(void *)(a1[6] + 8) + 40) setServerProvidedAt:v25];
  }
  *a4 = 1;
}

void __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke_129(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (v8)
  {
    id v9 = +[AMSLogConfig sharedMetricsConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138543618;
      uint64_t v24 = objc_opt_class();
      __int16 v25 = 2114;
      id v26 = v8;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enumerate identifier_stores. %{public}@", (uint8_t *)&v23, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = *(void *)(a1[6] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    id v14 = [v7 stringForColumnIndex:0];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setStoreKey:v14];

    id v15 = [v7 stringForColumnIndex:1];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setStoreUUID:v15];

    id v16 = [v7 stringForColumnIndex:2];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setAccount:v16];

    [v7 doubleForColumnIndex:3];
    objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "setResetInterval:");
    objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "setCrossDeviceSync:", objc_msgSend(v7, "intForColumnIndex:", 4) != 0);
    [v7 doubleForColumnIndex:5];
    if (v17 <= 0.0)
    {
      double v18 = 0;
    }
    else
    {
      double v18 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    }
    [*(id *)(*(void *)(a1[6] + 8) + 40) setStarted:v18];

    [v7 doubleForColumnIndex:6];
    if (v19 <= 0.0)
    {
      double v20 = 0;
    }
    else
    {
      double v20 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    }
    [*(id *)(*(void *)(a1[6] + 8) + 40) setLastSync:v20];

    [v7 doubleForColumnIndex:7];
    *(void *)(*(void *)(a1[7] + 8) + 24) = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)(*(void *)(a1[7] + 8) + 24)];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setModified:v22];

    objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "setDeleted:", objc_msgSend(v7, "intForColumnIndex:", 8) != 0);
  }
  *a4 = 1;
}

- (BOOL)insertEvents:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x3032000000;
  double v20 = __Block_byref_object_copy__43;
  uint64_t v21 = __Block_byref_object_dispose__43;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41__AMSMetricsDatabase_insertEvents_error___block_invoke;
  v14[3] = &unk_1E55A4198;
  v14[4] = self;
  id v16 = &v17;
  id v7 = v6;
  id v15 = v7;
  [(AMSMetricsDatabase *)self _performTransaction:v14];
  uint64_t v8 = v18[5];
  if (v8)
  {
    id v9 = +[AMSLogConfig sharedMetricsConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = AMSLogableError((void *)v18[5]);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v24 = v11;
      __int16 v25 = 2114;
      id v26 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to insert events. Error = %{public}@", buf, 0x16u);
    }
    if (a4) {
      *a4 = (id) v18[5];
    }
  }

  _Block_object_dispose(&v17, 8);
  return v8 == 0;
}

BOOL __41__AMSMetricsDatabase_insertEvents_error___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "prepareStatement:error:", @"INSERT OR REPLACE INTO events (report_url, eventBody, batchId, account, timestampInserted) VALUES (?,?,?,?,?);",
  id v4 = &obj);
  objc_storeStrong((id *)(v3 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    BOOL v5 = 0;
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __41__AMSMetricsDatabase_insertEvents_error___block_invoke_2;
    v20[3] = &unk_1E55A4170;
    id v6 = *(void **)(a1 + 40);
    v20[4] = *(void *)(a1 + 32);
    id v22 = &v25;
    id v7 = v4;
    uint64_t v8 = *(void *)(a1 + 48);
    id v21 = v7;
    uint64_t v23 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v20];
    id v9 = [*(id *)(a1 + 32) connection];
    id v19 = 0;
    [v9 finalizePreparedStatement:v7 error:&v19];
    id v10 = v19;

    if (v10)
    {
      uint64_t v11 = +[AMSLogConfig sharedMetricsConfig];
      if (!v11)
      {
        uint64_t v11 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = (id)objc_opt_class();
        id v14 = AMSLogableError(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
        *(_DWORD *)long long buf = 138543618;
        uint64_t v30 = (uint64_t)v13;
        __int16 v31 = 2114;
        v32 = v14;
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to finalize statement. Error = %{public}@", buf, 0x16u);
      }
    }
    if (*((unsigned char *)v26 + 24))
    {
      BOOL v5 = 1;
    }
    else if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      BOOL v5 = 0;
    }
    else
    {
      id v15 = +[AMSLogConfig sharedMetricsConfig];
      if (!v15)
      {
        id v15 = +[AMSLogConfig sharedConfig];
      }
      id v16 = [v15 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = objc_opt_class();
        *(_DWORD *)long long buf = 138543362;
        uint64_t v30 = v17;
        _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Inserting events failed without an error", buf, 0xCu);
      }

      BOOL v5 = *((unsigned char *)v26 + 24) != 0;
    }
  }
  _Block_object_dispose(&v25, 8);
  return v5;
}

void __41__AMSMetricsDatabase_insertEvents_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v30 = a2;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v39;
    id v29 = v33;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v38 + 1) + 8 * v8);
        id v10 = objc_msgSend(v9, "topic", v29);
        uint64_t v11 = [v10 length];

        if (!v11)
        {
          id v14 = +[AMSLogConfig sharedMetricsConfig];
          if (!v14)
          {
            id v14 = +[AMSLogConfig sharedConfig];
          }
          id v13 = [v14 OSLogObject];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            id v21 = objc_opt_class();
            *(_DWORD *)long long buf = 138543362;
            v43 = v21;
            id v22 = v21;
            _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: No topic found on event", buf, 0xCu);
          }
          goto LABEL_17;
        }
        uint64_t v12 = [v9 databaseEventBody];
        id v37 = 0;
        id v13 = +[AMSData dataWithObject:v12 encoding:3 error:&v37];
        id v14 = v37;

        id v15 = (void *)[[NSString alloc] initWithData:v13 encoding:4];
        id v16 = v15;
        if (v14 || ![v15 length])
        {
          uint64_t v17 = +[AMSLogConfig sharedMetricsConfig];
          if (!v17)
          {
            uint64_t v17 = +[AMSLogConfig sharedConfig];
          }
          double v18 = [v17 OSLogObject];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            id v19 = objc_opt_class();
            *(_DWORD *)long long buf = 138543618;
            v43 = v19;
            __int16 v44 = 2114;
            id v45 = v14;
            id v20 = v19;
            _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to serialize event fields to JSON. Error: %{public}@", buf, 0x16u);
          }
LABEL_17:

          goto LABEL_18;
        }
        uint64_t v23 = [*(id *)(a1 + 32) connection];
        uint64_t v24 = *(void *)(a1 + 40);
        uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
        id v36 = *(id *)(v25 + 40);
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v33[0] = __41__AMSMetricsDatabase_insertEvents_error___block_invoke_86;
        v33[1] = &unk_1E55A1338;
        v33[2] = v9;
        id v26 = v16;
        id v34 = v26;
        id v35 = v30;
        LOBYTE(v24) = [v23 executePreparedStatement:v24 error:&v36 bindings:v32];
        objc_storeStrong((id *)(v25 + 40), v36);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v24;

        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
        {

          goto LABEL_27;
        }
        uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);

        if (v27) {
          goto LABEL_27;
        }
LABEL_18:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v28 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
      uint64_t v6 = v28;
    }
    while (v28);
  }
LABEL_27:
}

BOOL __42__AMSMetricsDatabase_initWithContainerId___block_invoke_9(uint64_t a1)
{
  BOOL result = +[AMSMetricsDatabaseSchema createOrUpdateSchemaUsingConnection:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __42__AMSMetricsDatabase_initWithContainerId___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _cachePath];
  uint64_t v2 = +[AMSDatabaseHelper databasePathForCachePath:v5 type:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_cachePath
{
  uint64_t v3 = +[AMSDatabaseHelper databaseFolderNameForType:0];
  id v4 = [v3 stringByAppendingPathComponent:self->_containerId];

  return v4;
}

uint64_t __52__AMSMetricsDatabase_sharedDatabaseWithContainerId___block_invoke_3()
{
  qword_1EB38DDC8 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  return MEMORY[0x1F41817F8]();
}

uint64_t __52__AMSMetricsDatabase_sharedDatabaseWithContainerId___block_invoke_2()
{
  qword_1EB38DDB8 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  return MEMORY[0x1F41817F8]();
}

void __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke_137(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) storeUUID];
  [v9 bindString:v3 atPosition:1];

  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) account];
  [v9 bindString:v4 atPosition:2];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) resetInterval];
  objc_msgSend(v9, "bindDouble:atPosition:", 3);
  objc_msgSend(v9, "bindInt:atPosition:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "crossDeviceSync"), 4);
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) started];
  [v5 timeIntervalSinceReferenceDate];
  objc_msgSend(v9, "bindDouble:atPosition:", 5);

  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lastSync];
  [v6 timeIntervalSinceReferenceDate];
  objc_msgSend(v9, "bindDouble:atPosition:", 6);

  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) modified];
  [v7 timeIntervalSinceReferenceDate];
  objc_msgSend(v9, "bindDouble:atPosition:", 7);

  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) storeKey];
  [v9 bindString:v8 atPosition:8];

  if (*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 0.0) {
    objc_msgSend(v9, "bindDouble:atPosition:", 9);
  }
}

void __52__AMSMetricsDatabase_sharedDatabaseWithContainerId___block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AMSMetricsDatabase", v2);
  v1 = (void *)qword_1EB38DDA8;
  qword_1EB38DDA8 = (uint64_t)v0;
}

- (void)dealloc
{
  [(AMSMetricsDatabase *)self close];
  [(AMSMetricsDatabase *)self setConnection:0];
  v3.receiver = self;
  v3.super_class = (Class)AMSMetricsDatabase;
  [(AMSMetricsDatabase *)&v3 dealloc];
}

- (void)close
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__AMSMetricsDatabase_close__block_invoke;
  v3[3] = &unk_1E559EA90;
  v3[4] = self;
  AMSMetricsDatabaseBlockWithKeepAlive(@"AMSMetricsDatabase-close", v3);
  uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();
}

void __27__AMSMetricsDatabase_close__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) connection];
  char v2 = [v1 close];

  if ((v2 & 1) == 0)
  {
    objc_super v3 = +[AMSLogConfig sharedMetricsConfig];
    if (!v3)
    {
      objc_super v3 = +[AMSLogConfig sharedConfig];
    }
    id v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = (id)objc_opt_class();
      id v5 = v7;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to close the database connection", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (int64_t)countAllEventsWithLockKey:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__43;
  uint64_t v27 = __Block_byref_object_dispose__43;
  id v28 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __54__AMSMetricsDatabase_countAllEventsWithLockKey_error___block_invoke;
  double v18 = &unk_1E55A4080;
  id v7 = v6;
  id v19 = v7;
  id v20 = self;
  id v21 = &v23;
  id v22 = &v29;
  [(AMSMetricsDatabase *)self _performTransaction:&v15];
  uint64_t v8 = (void *)v24[5];
  if (a4)
  {
    *a4 = v8;
  }
  else if (v8)
  {
    id v9 = +[AMSLogConfig sharedMetricsConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = AMSLogableError((void *)v24[5]);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v34 = v11;
      __int16 v35 = 2114;
      id v36 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to count events. Error = %{public}@", buf, 0x16u);
    }
  }
  int64_t v13 = v30[3];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v13;
}

uint64_t __54__AMSMetricsDatabase_countAllEventsWithLockKey_error___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v2 appendString:@"SELECT COUNT(*) FROM events"];
  if (*(void *)(a1 + 32)) {
    [v2 appendString:@" locked_by = ? AND locked_time > ?"];
  }
  [v2 appendString:@";"];
  objc_super v3 = [*(id *)(a1 + 40) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__AMSMetricsDatabase_countAllEventsWithLockKey_error___block_invoke_2;
  v7[3] = &unk_1E55A4058;
  uint64_t v9 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  id v8 = v4;
  uint64_t v10 = v5;
  [v3 executeQuery:v2 withResults:v7];

  return 1;
}

void __54__AMSMetricsDatabase_countAllEventsWithLockKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      [v5 bindString:v7 atPosition:1];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v9 = v8 + -600.0;
      *(float *)&double v9 = v9;
      [v5 bindFloat:2 atPosition:v9];
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__AMSMetricsDatabase_countAllEventsWithLockKey_error___block_invoke_3;
    v10[3] = &unk_1E55A4030;
    long long v11 = *(_OWORD *)(a1 + 40);
    [v5 enumerateRowsUsingBlock:v10];
  }
}

void __54__AMSMetricsDatabase_countAllEventsWithLockKey_error___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 int64ForColumnIndex:0];
  }
}

- (BOOL)dropAllEventsWithLockKey:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__43;
  id v22 = __Block_byref_object_dispose__43;
  id v23 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__AMSMetricsDatabase_dropAllEventsWithLockKey_error___block_invoke;
  v14[3] = &unk_1E55A40D0;
  id v7 = v6;
  id v15 = v7;
  uint64_t v16 = self;
  uint64_t v17 = &v18;
  [(AMSMetricsDatabase *)self _performTransaction:v14];
  uint64_t v8 = v19[5];
  if (v8)
  {
    double v9 = +[AMSLogConfig sharedMetricsConfig];
    if (!v9)
    {
      double v9 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = AMSLogableError((void *)v19[5]);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v25 = v11;
      __int16 v26 = 2114;
      uint64_t v27 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to drop events. Error = %{public}@", buf, 0x16u);
    }
    if (a4) {
      *a4 = (id) v19[5];
    }
  }

  _Block_object_dispose(&v18, 8);
  return v8 == 0;
}

uint64_t __53__AMSMetricsDatabase_dropAllEventsWithLockKey_error___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v2 appendString:@"DELETE FROM events"];
  if (*(void *)(a1 + 32)) {
    [v2 appendString:@" WHERE locked_by = ?"];
  }
  [v2 appendString:@";"];
  objc_super v3 = [*(id *)(a1 + 40) connection];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__AMSMetricsDatabase_dropAllEventsWithLockKey_error___block_invoke_2;
  v7[3] = &unk_1E55A40A8;
  id v8 = *(id *)(a1 + 32);
  uint64_t v5 = [v3 executeStatement:v2 error:&obj bindings:v7];
  objc_storeStrong((id *)(v4 + 40), obj);

  return v5;
}

uint64_t __53__AMSMetricsDatabase_dropAllEventsWithLockKey_error___block_invoke_2(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [a2 bindString:v2 atPosition:1];
  }
  return result;
}

- (BOOL)dropEvents:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__43;
  __int16 v35 = __Block_byref_object_dispose__43;
  id v36 = 0;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v12 = [v11 databasePID];
        BOOL v13 = v12 == 0;

        if (!v13)
        {
          if ([v6 length]) {
            [v6 appendString:@","];
          }
          id v14 = [v11 databasePID];
          [v6 appendFormat:@"%@", v14];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v41 count:16];
    }
    while (v8);
  }

  if ([v6 length])
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __39__AMSMetricsDatabase_dropEvents_error___block_invoke;
    void v23[3] = &unk_1E55A40D0;
    id v24 = v6;
    uint64_t v25 = self;
    __int16 v26 = &v31;
    [(AMSMetricsDatabase *)self _performTransaction:v23];
    uint64_t v15 = v32[5];
    BOOL v16 = v15 == 0;
    if (v15)
    {
      uint64_t v17 = +[AMSLogConfig sharedMetricsConfig];
      if (!v17)
      {
        uint64_t v17 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v18 = [v17 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = objc_opt_class();
        uint64_t v20 = AMSLogableError((void *)v32[5]);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v38 = v19;
        __int16 v39 = 2114;
        long long v40 = v20;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to drop events. Error = %{public}@", buf, 0x16u);
      }
      if (a4) {
        *a4 = (id) v32[5];
      }
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  _Block_object_dispose(&v31, 8);
  return v16;
}

uint64_t __39__AMSMetricsDatabase_dropEvents_error___block_invoke(uint64_t a1)
{
  objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM events WHERE pid in (%@);",
  uint64_t v2 = *(void *)(a1 + 32));
  objc_super v3 = [*(id *)(a1 + 40) connection];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 executeStatement:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  return v5;
}

- (void)enumerateEventsWithTopic:(id)a3 lockKey:(id)a4 objectBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  uint64_t v12 = objc_msgSend(v11, "ams_iTunesAccounts");

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke;
  v17[3] = &unk_1E55A4148;
  id v18 = v8;
  id v19 = v9;
  id v21 = v12;
  id v22 = v10;
  uint64_t v20 = self;
  id v13 = v12;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [(AMSMetricsDatabase *)self _performTransaction:v17];
}

uint64_t __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke(id *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v2 appendString:@"SELECT pid, eventBody, batchId, account FROM events"];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = v3;
  if (a1[4])
  {
    if ([v3 length]) {
      [v4 appendString:@" AND"];
    }
    [v4 appendString:@" report_url = ?"];
  }
  if (a1[5])
  {
    if ([v4 length]) {
      [v4 appendString:@" AND"];
    }
    [v4 appendString:@" locked_by = ? AND locked_time > ?"];
  }
  if ([v4 length]) {
    [v2 appendFormat:@" WHERE%@", v4];
  }
  [v2 appendString:@" ORDER BY report_url ASC, batchId ASC, timestampInserted ASC;"];
  uint64_t v5 = [a1[6] connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke_2;
  v7[3] = &unk_1E55A4120;
  void v7[4] = a1[6];
  id v11 = a1[8];
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = a1[7];
  [v5 executeQuery:v2 withResults:v7];

  return 1;
}

void __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedMetricsConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogableError(v6);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      id v22 = v10;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query events. Error = %{public}@", buf, 0x16u);
    }
    buf[0] = 0;
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      [v5 bindString:v11 atPosition:1];
      uint64_t v12 = 2;
    }
    else
    {
      uint64_t v12 = 1;
    }
    uint64_t v13 = *(void *)(a1 + 48);
    if (v13)
    {
      [v5 bindString:v13 atPosition:v12];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v15 = v14 + -600.0;
      *(float *)&double v15 = v15;
      [v5 bindFloat:(v12 + 1) atPosition:v15];
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke_74;
    v16[3] = &unk_1E55A40F8;
    v16[4] = *(void *)(a1 + 32);
    id v18 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 56);
    [v5 enumerateRowsUsingBlock:v16];
  }
}

void __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke_74(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (v8)
  {
    uint64_t v9 = +[AMSLogConfig sharedMetricsConfig];
    if (!v9)
    {
      uint64_t v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = AMSLogableError(v8);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v44 = v11;
      __int16 v45 = 2114;
      uint64_t v46 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enumerate events. Error = %{public}@", buf, 0x16u);
    }
    *a4 = 1;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v13 = [v7 int64ForColumnIndex:0];
    double v14 = [v7 stringForColumnIndex:1];
    double v15 = [v7 stringForColumnIndex:2];
    id v16 = [v7 stringForColumnIndex:3];
    if ([v14 length])
    {
      __int16 v39 = v15;
      id v17 = [v14 dataUsingEncoding:4];
      id v42 = 0;
      id v18 = +[AMSData objectWithData:v17 encoding:3 error:&v42];
      id v19 = v42;
      if (!v19)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v35 = v17;
          id v36 = v18;
          if (objc_opt_respondsToSelector())
          {
            uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v16, "longLongValue"));
            __int16 v21 = *(void **)(a1 + 40);
            v40[0] = MEMORY[0x1E4F143A8];
            v40[1] = 3221225472;
            v40[2] = __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke_80;
            v40[3] = &unk_1E559E490;
            id v41 = v20;
            id v37 = v20;
            uint64_t v22 = objc_msgSend(v21, "ams_firstObjectPassingTest:", v40);

            uint64_t v23 = (void *)v22;
          }
          else
          {
            uint64_t v23 = 0;
          }
          uint64_t v24 = v13;
          uint64_t v38 = v23;
          if (!v23 && v16)
          {
            uint64_t v25 = +[AMSLogConfig sharedMetricsConfig];
            if (!v25)
            {
              uint64_t v25 = +[AMSLogConfig sharedConfig];
            }
            uint64_t v34 = v25;
            __int16 v26 = [v25 OSLogObject];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              uint64_t v32 = objc_opt_class();
              uint64_t v33 = AMSHashIfNeeded(v16);
              uint64_t v27 = [v36 objectForKeyedSubscript:@"topic"];
              *(_DWORD *)long long buf = 138543874;
              uint64_t v44 = v32;
              __int16 v45 = 2114;
              uint64_t v46 = v33;
              __int16 v47 = 2114;
              uint64_t v48 = v27;
              long long v28 = (void *)v27;
              _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Unable to locate account for dsid: %{public}@ topic: %{public}@", buf, 0x20u);
            }
          }
          long long v29 = [AMSMetricsEvent alloc];
          long long v30 = [MEMORY[0x1E4F28ED0] numberWithInteger:v24];
          id v18 = v36;
          uint64_t v31 = [(AMSMetricsEvent *)v29 initWithDatabaseEventBody:v36 account:v38 databasePID:v30];

          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          id v17 = v35;
        }
      }

      double v15 = v39;
    }
  }
}

uint64_t __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "ams_DSID");
  uint64_t v4 = [v3 isEqualToNumber:*(void *)(a1 + 32)];

  return v4;
}

- (id)lockAllEventsWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = [(AMSMetricsDatabase *)self _lockedById];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__43;
  __int16 v21 = __Block_byref_object_dispose__43;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__AMSMetricsDatabase_lockAllEventsWithError___block_invoke;
  v14[3] = &unk_1E55A4198;
  void v14[4] = self;
  id v16 = &v17;
  id v6 = v5;
  id v15 = v6;
  [(AMSMetricsDatabase *)self _performTransaction:v14];
  id v7 = (void *)v18[5];
  if (v7)
  {
    if (a3) {
      *a3 = v7;
    }
    id v8 = +[AMSLogConfig sharedMetricsConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = AMSLogableError((void *)v18[5]);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v24 = v10;
      __int16 v25 = 2114;
      __int16 v26 = v11;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lock events. Error = %{public}@", buf, 0x16u);
    }
    id v12 = 0;
  }
  else
  {
    id v12 = v6;
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

uint64_t __45__AMSMetricsDatabase_lockAllEventsWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__AMSMetricsDatabase_lockAllEventsWithError___block_invoke_2;
  v6[3] = &unk_1E55A40A8;
  id v7 = *(id *)(a1 + 40);
  uint64_t v4 = objc_msgSend(v2, "executeStatement:error:bindings:", @"UPDATE events SET locked_by = ?, locked_time = ? WHERE locked_by IS NULL OR locked_by = '' OR locked_time <= ?;",
         &obj,
         v6);
  objc_storeStrong((id *)(v3 + 40), obj);

  return v4;
}

void __45__AMSMetricsDatabase_lockAllEventsWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v6 = a2;
  [v6 bindString:v2 atPosition:1];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  *(float *)&double v3 = v3;
  [v6 bindFloat:2 atPosition:v3];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4 + -600.0;
  *(float *)&double v5 = v5;
  [v6 bindFloat:3 atPosition:v5];
}

- (BOOL)unlockAllEventsWithKey:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__43;
  __int16 v21 = __Block_byref_object_dispose__43;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__AMSMetricsDatabase_unlockAllEventsWithKey_error___block_invoke;
  v14[3] = &unk_1E55A4198;
  void v14[4] = self;
  id v16 = &v17;
  id v7 = v6;
  id v15 = v7;
  [(AMSMetricsDatabase *)self _performTransaction:v14];
  id v8 = (void *)v18[5];
  if (v8)
  {
    if (a4) {
      *a4 = v8;
    }
    uint64_t v9 = +[AMSLogConfig sharedMetricsConfig];
    if (!v9)
    {
      uint64_t v9 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      id v12 = AMSLogableError((void *)v18[5]);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v24 = v11;
      __int16 v25 = 2114;
      __int16 v26 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lock events. Error = %{public}@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v17, 8);
  return v8 == 0;
}

uint64_t __51__AMSMetricsDatabase_unlockAllEventsWithKey_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__AMSMetricsDatabase_unlockAllEventsWithKey_error___block_invoke_2;
  v6[3] = &unk_1E55A40A8;
  id v7 = *(id *)(a1 + 40);
  uint64_t v4 = objc_msgSend(v2, "executeStatement:error:bindings:", @"UPDATE events SET locked_by = NULL, locked_time = 0 WHERE locked_by = ? OR locked_time <= ?;",
         &obj,
         v6);
  objc_storeStrong((id *)(v3 + 40), obj);

  return v4;
}

void __51__AMSMetricsDatabase_unlockAllEventsWithKey_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindString:v2 atPosition:1];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3 + -600.0;
  *(float *)&double v4 = v4;
  [v5 bindFloat:2 atPosition:v4];
}

- (BOOL)unlockEvents:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__43;
  __int16 v35 = __Block_byref_object_dispose__43;
  id v36 = 0;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v12 = [v11 databasePID];
        BOOL v13 = v12 == 0;

        if (!v13)
        {
          if ([v6 length]) {
            [v6 appendString:@","];
          }
          double v14 = [v11 databasePID];
          [v6 appendFormat:@"%@", v14];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v41 count:16];
    }
    while (v8);
  }

  if ([v6 length])
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __41__AMSMetricsDatabase_unlockEvents_error___block_invoke;
    void v23[3] = &unk_1E55A40D0;
    id v24 = v6;
    __int16 v25 = self;
    __int16 v26 = &v31;
    [(AMSMetricsDatabase *)self _performTransaction:v23];
    id v15 = (void *)v32[5];
    BOOL v16 = v15 == 0;
    if (v15)
    {
      if (a4) {
        *a4 = v15;
      }
      uint64_t v17 = +[AMSLogConfig sharedMetricsConfig];
      if (!v17)
      {
        uint64_t v17 = +[AMSLogConfig sharedConfig];
      }
      id v18 = [v17 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = objc_opt_class();
        uint64_t v20 = AMSLogableError((void *)v32[5]);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v38 = v19;
        __int16 v39 = 2114;
        long long v40 = v20;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to drop events. Error = %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  _Block_object_dispose(&v31, 8);
  return v16;
}

uint64_t __41__AMSMetricsDatabase_unlockEvents_error___block_invoke(uint64_t a1)
{
  objc_msgSend(NSString, "stringWithFormat:", @"UPDATE events SET locked_by = NULL, locked_time = 0 WHERE pid in (%@);",
  uint64_t v2 = *(void *)(a1 + 32));
  double v3 = [*(id *)(a1 + 40) connection];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 executeStatement:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  return v5;
}

- (BOOL)cleanupInvalidIdentifiersWithError:(id *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__43;
  uint64_t v11 = __Block_byref_object_dispose__43;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__AMSMetricsDatabase_cleanupInvalidIdentifiersWithError___block_invoke;
  v6[3] = &unk_1E55A41C0;
  void v6[4] = self;
  v6[5] = &v7;
  [(AMSMetricsDatabase *)self _performTransaction:v6];
  uint64_t v4 = (void *)v8[5];
  if (a3 && v4) {
    *a3 = v4;
  }
  _Block_object_dispose(&v7, 8);

  return v4 == 0;
}

uint64_t __57__AMSMetricsDatabase_cleanupInvalidIdentifiersWithError___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v3 = v2;
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v5 + 40);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__AMSMetricsDatabase_cleanupInvalidIdentifiersWithError___block_invoke_2;
  v18[3] = &__block_descriptor_40_e28_v16__0___AMSSQLiteBinding__8l;
  void v18[4] = v3;
  objc_msgSend(v4, "executeStatement:error:bindings:", @"DELETE FROM identifiers WHERE cross_device=0 AND ((expires>0 AND expires<?) OR store_uuid NOT IN (SELECT store_uuid FROM identifier_stores WHERE deleted=0));",
    &obj,
    v18);
  objc_storeStrong((id *)(v5 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v6 = +[AMSLogConfig sharedMetricsConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    uint64_t v23 = v9;
    uint64_t v10 = "%{public}@: Failed to delete identifiers. %{public}@";
LABEL_11:
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);
LABEL_12:

    return 0;
  }
  uint64_t v11 = [*(id *)(a1 + 32) connection];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  id v17 = *(id *)(v12 + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__AMSMetricsDatabase_cleanupInvalidIdentifiersWithError___block_invoke_103;
  v16[3] = &__block_descriptor_40_e28_v16__0___AMSSQLiteBinding__8l;
  v16[4] = v3;
  objc_msgSend(v11, "executeStatement:error:bindings:", @"UPDATE identifiers SET modified=?, deleted=1 WHERE deleted=0 AND ((expires>0 AND expires<?) OR store_uuid NOT IN (SELECT store_uuid FROM identifier_stores WHERE deleted=0));",
    &v17,
    v16);
  objc_storeStrong((id *)(v12 + 40), v17);

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v6 = +[AMSLogConfig sharedMetricsConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v21 = v13;
    __int16 v22 = 2114;
    uint64_t v23 = v14;
    uint64_t v10 = "%{public}@: Failed to update identifiers. %{public}@";
    goto LABEL_11;
  }
  return 1;
}

uint64_t __57__AMSMetricsDatabase_cleanupInvalidIdentifiersWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindDouble:1 atPosition:*(double *)(a1 + 32)];
}

void __57__AMSMetricsDatabase_cleanupInvalidIdentifiersWithError___block_invoke_103(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  [v4 bindDouble:1 atPosition:v3];
  [v4 bindDouble:2 atPosition:*(double *)(a1 + 32)];
}

- (BOOL)removeIdentifiersForAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  BOOL v16 = __Block_byref_object_copy__43;
  id v17 = __Block_byref_object_dispose__43;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke;
  v10[3] = &unk_1E55A4198;
  void v10[4] = self;
  uint64_t v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [(AMSMetricsDatabase *)self _performTransaction:v10];
  uint64_t v8 = (void *)v14[5];
  if (a4 && v8) {
    *a4 = v8;
  }

  _Block_object_dispose(&v13, 8);
  return v8 == 0;
}

BOOL __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v3 = v2;
  id v4 = [*(id *)(a1 + 32) connection];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v38 = *(id *)(v5 + 40);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke_2;
  v36[3] = &unk_1E55A40A8;
  id v37 = *(id *)(a1 + 40);
  objc_msgSend(v4, "executeStatement:error:bindings:", @"DELETE FROM identifiers WHERE cross_device=0 AND store_uuid in (SELECT store_uuid FROM identifier_stores WHERE account=?);",
    &v38,
    v36);
  objc_storeStrong((id *)(v5 + 40), v38);

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = +[AMSLogConfig sharedMetricsConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v40 = v8;
      __int16 v41 = 2114;
      uint64_t v42 = v9;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete identifiers. %{public}@", buf, 0x16u);
    }

    BOOL v10 = 0;
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) connection];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v12 + 40);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    void v32[2] = __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke_110;
    v32[3] = &unk_1E55A41E8;
    uint64_t v34 = v3;
    id v33 = *(id *)(a1 + 40);
    objc_msgSend(v11, "executeStatement:error:bindings:", @"UPDATE identifiers SET modified=?, deleted=1 WHERE deleted=0 AND store_uuid in (SELECT store_uuid FROM identifier_stores WHERE account=?);",
      &obj,
      v32);
    objc_storeStrong((id *)(v12 + 40), obj);

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v13 = +[AMSLogConfig sharedMetricsConfig];
      if (!v13)
      {
        uint64_t v13 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v40 = v15;
        __int16 v41 = 2114;
        uint64_t v42 = v16;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update identifiers. %{public}@", buf, 0x16u);
      }

      BOOL v10 = 0;
    }
    else
    {
      id v17 = [*(id *)(a1 + 32) connection];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      id v31 = *(id *)(v18 + 40);
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      long long v27 = __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke_114;
      long long v28 = &unk_1E55A41E8;
      uint64_t v30 = v3;
      id v29 = *(id *)(a1 + 40);
      objc_msgSend(v17, "executeStatement:error:bindings:", @"UPDATE identifier_stores SET modified=?, deleted=1 WHERE deleted=0 AND account=?;",
        &v31,
        &v25);
      objc_storeStrong((id *)(v18 + 40), v31);

      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      BOOL v10 = v19 == 0;
      if (v19)
      {
        uint64_t v20 = +[AMSLogConfig sharedMetricsConfig];
        if (!v20)
        {
          uint64_t v20 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v21 = [v20 OSLogObject];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = objc_opt_class();
          uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          *(_DWORD *)long long buf = 138543618;
          uint64_t v40 = v22;
          __int16 v41 = 2114;
          uint64_t v42 = v23;
          _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update identifier_stores. %{public}@", buf, 0x16u);
        }
      }
      uint64_t v13 = v29;
    }

    id v6 = v33;
  }

  return v10;
}

uint64_t __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindString:*(void *)(a1 + 32) atPosition:1];
}

void __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke_110(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  id v4 = a2;
  [v4 bindDouble:1 atPosition:v3];
  [v4 bindString:*(void *)(a1 + 32) atPosition:2];
}

void __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke_114(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  id v4 = a2;
  [v4 bindDouble:1 atPosition:v3];
  [v4 bindString:*(void *)(a1 + 32) atPosition:2];
}

- (BOOL)removeIdentifiersForStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__43;
  id v17 = __Block_byref_object_dispose__43;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke;
  v10[3] = &unk_1E55A4198;
  void v10[4] = self;
  uint64_t v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [(AMSMetricsDatabase *)self _performTransaction:v10];
  uint64_t v8 = (void *)v14[5];
  if (a4 && v8) {
    *a4 = v8;
  }

  _Block_object_dispose(&v13, 8);
  return v8 == 0;
}

BOOL __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v3 = v2;
  id v4 = [*(id *)(a1 + 32) connection];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v38 = *(id *)(v5 + 40);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke_2;
  v36[3] = &unk_1E55A40A8;
  id v37 = *(id *)(a1 + 40);
  objc_msgSend(v4, "executeStatement:error:bindings:", @"DELETE FROM identifiers WHERE cross_device=0 AND store_uuid in (SELECT store_uuid FROM identifier_stores WHERE store_key=?);",
    &v38,
    v36);
  objc_storeStrong((id *)(v5 + 40), v38);

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = +[AMSLogConfig sharedMetricsConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v40 = v8;
      __int16 v41 = 2114;
      uint64_t v42 = v9;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete identifiers. %{public}@", buf, 0x16u);
    }

    BOOL v10 = 0;
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) connection];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v12 + 40);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    void v32[2] = __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke_121;
    v32[3] = &unk_1E55A41E8;
    uint64_t v34 = v3;
    id v33 = *(id *)(a1 + 40);
    objc_msgSend(v11, "executeStatement:error:bindings:", @"UPDATE identifiers SET modified=?, deleted=1 WHERE deleted=0 AND store_uuid in (SELECT store_uuid FROM identifier_stores WHERE store_key=?);",
      &obj,
      v32);
    objc_storeStrong((id *)(v12 + 40), obj);

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v13 = +[AMSLogConfig sharedMetricsConfig];
      if (!v13)
      {
        uint64_t v13 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v40 = v15;
        __int16 v41 = 2114;
        uint64_t v42 = v16;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update identifiers. %{public}@", buf, 0x16u);
      }

      BOOL v10 = 0;
    }
    else
    {
      id v17 = [*(id *)(a1 + 32) connection];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      id v31 = *(id *)(v18 + 40);
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      long long v27 = __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke_125;
      long long v28 = &unk_1E55A41E8;
      uint64_t v30 = v3;
      id v29 = *(id *)(a1 + 40);
      objc_msgSend(v17, "executeStatement:error:bindings:", @"UPDATE identifier_stores SET modified=?, deleted=1 WHERE deleted=0 AND store_key=?;",
        &v31,
        &v25);
      objc_storeStrong((id *)(v18 + 40), v31);

      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      BOOL v10 = v19 == 0;
      if (v19)
      {
        uint64_t v20 = +[AMSLogConfig sharedMetricsConfig];
        if (!v20)
        {
          uint64_t v20 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v21 = [v20 OSLogObject];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = objc_opt_class();
          uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          *(_DWORD *)long long buf = 138543618;
          uint64_t v40 = v22;
          __int16 v41 = 2114;
          uint64_t v42 = v23;
          _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update identifier_stores. %{public}@", buf, 0x16u);
        }
      }
      uint64_t v13 = v29;
    }

    id v6 = v33;
  }

  return v10;
}

uint64_t __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindString:*(void *)(a1 + 32) atPosition:1];
}

void __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke_121(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  id v4 = a2;
  [v4 bindDouble:1 atPosition:v3];
  [v4 bindString:*(void *)(a1 + 32) atPosition:2];
}

void __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke_125(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  id v4 = a2;
  [v4 bindDouble:1 atPosition:v3];
  [v4 bindString:*(void *)(a1 + 32) atPosition:2];
}

void __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke_149(uint64_t a1, void *a2)
{
  id v11 = a2;
  double v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) storeUUID];
  [v11 bindString:v3 atPosition:1];

  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) name];
  [v11 bindString:v4 atPosition:2];

  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) value];
  [v11 bindString:v5 atPosition:3];

  objc_msgSend(v11, "bindInt:atPosition:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "crossDeviceSync"), 4);
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) expires];
  [v6 timeIntervalSinceReferenceDate];
  objc_msgSend(v11, "bindDouble:atPosition:", 5);

  id v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lastSync];
  [v7 timeIntervalSinceReferenceDate];
  objc_msgSend(v11, "bindDouble:atPosition:", 6);

  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) modified];
  [v8 timeIntervalSinceReferenceDate];
  objc_msgSend(v11, "bindDouble:atPosition:", 7);

  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) serverProvidedAt];
  [v9 timeIntervalSinceReferenceDate];
  objc_msgSend(v11, "bindDouble:atPosition:", 8);

  BOOL v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) idKey];
  [v11 bindString:v10 atPosition:9];

  if (*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 0.0) {
    objc_msgSend(v11, "bindDouble:atPosition:", 10);
  }
}

- (BOOL)clearIdentifierSyncStateWithError:(id *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  BOOL v10 = __Block_byref_object_copy__43;
  id v11 = __Block_byref_object_dispose__43;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__AMSMetricsDatabase_clearIdentifierSyncStateWithError___block_invoke;
  v6[3] = &unk_1E55A41C0;
  void v6[4] = self;
  v6[5] = &v7;
  [(AMSMetricsDatabase *)self _performTransaction:v6];
  id v4 = (void *)v8[5];
  if (a3 && v4) {
    *a3 = v4;
  }
  _Block_object_dispose(&v7, 8);

  return v4 == 0;
}

uint64_t __56__AMSMetricsDatabase_clearIdentifierSyncStateWithError___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  [v2 executeStatement:@"UPDATE identifiers SET last_sync=0 WHERE cross_device=1;" error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v4 = +[AMSLogConfig sharedMetricsConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v5 = [v4 OSLogObject];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v17 = v6;
    __int16 v18 = 2114;
    uint64_t v19 = v7;
    uint64_t v8 = "%{public}@: Failed to clear identifiers last sync. %{public}@";
    goto LABEL_11;
  }
  uint64_t v9 = [*(id *)(a1 + 32) connection];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(id *)(v10 + 40);
  objc_msgSend(v9, "executeStatement:error:", @"UPDATE identifier_stores SET last_sync=0 WHERE cross_device=1;",
    &v14);
  objc_storeStrong((id *)(v10 + 40), v14);

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    return 1;
  }
  id v4 = +[AMSLogConfig sharedMetricsConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    uint64_t v8 = "%{public}@: Failed to clear identifier_stores last sync. %{public}@";
LABEL_11:
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, v8, buf, 0x16u);
  }
LABEL_12:

  return 0;
}

- (BOOL)enumerateUnsyncedIdentifierStoresUsingBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__43;
  uint64_t v17 = __Block_byref_object_dispose__43;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__AMSMetricsDatabase_enumerateUnsyncedIdentifierStoresUsingBlock_error___block_invoke;
  v10[3] = &unk_1E55A4300;
  void v10[4] = self;
  uint64_t v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [(AMSMetricsDatabase *)self _performTransaction:v10];
  uint64_t v8 = (void *)v14[5];
  if (a4 && v8) {
    *a4 = v8;
  }

  _Block_object_dispose(&v13, 8);
  return v8 == 0;
}

BOOL __72__AMSMetricsDatabase_enumerateUnsyncedIdentifierStoresUsingBlock_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__AMSMetricsDatabase_enumerateUnsyncedIdentifierStoresUsingBlock_error___block_invoke_2;
  v7[3] = &unk_1E55A42D8;
  void v7[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v6;
  long long v8 = v6;
  objc_msgSend(v2, "executeQuery:withResults:", @"SELECT store_key, store_uuid, account, interval, started, last_sync, modified, deleted FROM identifier_stores WHERE cross_device=1 AND last_sync<modified;",
    v7);

  BOOL v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) == 0;
  return v4;
}

void __72__AMSMetricsDatabase_enumerateUnsyncedIdentifierStoresUsingBlock_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedMetricsConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    long long v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      uint64_t v14 = objc_opt_class();
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query identifier_stores. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__AMSMetricsDatabase_enumerateUnsyncedIdentifierStoresUsingBlock_error___block_invoke_159;
    v11[3] = &unk_1E55A42B0;
    v11[4] = *(void *)(a1 + 32);
    long long v10 = *(_OWORD *)(a1 + 40);
    id v9 = (id)v10;
    long long v12 = v10;
    [a2 enumerateRowsUsingBlock:v11];
  }
}

void __72__AMSMetricsDatabase_enumerateUnsyncedIdentifierStoresUsingBlock_error___block_invoke_159(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (v8)
  {
    id v9 = +[AMSLogConfig sharedMetricsConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    long long v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138543618;
      uint64_t v22 = objc_opt_class();
      __int16 v23 = 2114;
      id v24 = v8;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enumerate identifier_stores. %{public}@", (uint8_t *)&v21, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    *a4 = 1;
  }
  else
  {
    id v11 = objc_opt_new();
    long long v12 = [v7 stringForColumnIndex:0];
    [v11 setStoreKey:v12];

    uint64_t v13 = [v7 stringForColumnIndex:1];
    [v11 setStoreUUID:v13];

    uint64_t v14 = [v7 stringForColumnIndex:2];
    [v11 setAccount:v14];

    [v7 doubleForColumnIndex:3];
    objc_msgSend(v11, "setResetInterval:");
    [v7 doubleForColumnIndex:4];
    if (v15 <= 0.0)
    {
      id v16 = 0;
    }
    else
    {
      id v16 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    }
    [v11 setStarted:v16];

    [v7 doubleForColumnIndex:5];
    if (v17 <= 0.0)
    {
      id v18 = 0;
    }
    else
    {
      id v18 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    }
    [v11 setLastSync:v18];

    [v7 doubleForColumnIndex:6];
    if (v19 <= 0.0)
    {
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    }
    [v11 setModified:v20];

    objc_msgSend(v11, "setDeleted:", objc_msgSend(v7, "intForColumnIndex:", 7) != 0);
    *a4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() ^ 1;
  }
}

- (BOOL)enumerateUnsyncedIdentifiersUsingBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__43;
  double v17 = __Block_byref_object_dispose__43;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__AMSMetricsDatabase_enumerateUnsyncedIdentifiersUsingBlock_error___block_invoke;
  v10[3] = &unk_1E55A4300;
  void v10[4] = self;
  long long v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [(AMSMetricsDatabase *)self _performTransaction:v10];
  id v8 = (void *)v14[5];
  if (a4 && v8) {
    *a4 = v8;
  }

  _Block_object_dispose(&v13, 8);
  return v8 == 0;
}

BOOL __67__AMSMetricsDatabase_enumerateUnsyncedIdentifiersUsingBlock_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__AMSMetricsDatabase_enumerateUnsyncedIdentifiersUsingBlock_error___block_invoke_2;
  v7[3] = &unk_1E55A42D8;
  void v7[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v6;
  long long v8 = v6;
  objc_msgSend(v2, "executeQuery:withResults:", @"SELECT identifier_key, store_uuid, name, value, cross_device, expires, last_sync, modified, deleted, server_provided_at FROM identifiers WHERE cross_device=1 AND last_sync<modified AND (expires=0 OR expires>?);",
    v7);

  BOOL v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) == 0;
  return v4;
}

void __67__AMSMetricsDatabase_enumerateUnsyncedIdentifiersUsingBlock_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedMetricsConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    long long v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      uint64_t v14 = objc_opt_class();
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query identifiers. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "bindDouble:atPosition:", 1);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__AMSMetricsDatabase_enumerateUnsyncedIdentifiersUsingBlock_error___block_invoke_163;
    v11[3] = &unk_1E55A42B0;
    v11[4] = *(void *)(a1 + 32);
    long long v10 = *(_OWORD *)(a1 + 40);
    id v9 = (id)v10;
    long long v12 = v10;
    [v5 enumerateRowsUsingBlock:v11];
  }
}

void __67__AMSMetricsDatabase_enumerateUnsyncedIdentifiersUsingBlock_error___block_invoke_163(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (v8)
  {
    id v9 = +[AMSLogConfig sharedMetricsConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    long long v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v24 = 138543618;
      uint64_t v25 = objc_opt_class();
      __int16 v26 = 2114;
      id v27 = v8;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enumerate identifiers. %{public}@", (uint8_t *)&v24, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    *a4 = 1;
  }
  else
  {
    id v11 = objc_opt_new();
    long long v12 = [v7 stringForColumnIndex:0];
    [v11 setIdKey:v12];

    uint64_t v13 = [v7 stringForColumnIndex:1];
    [v11 setStoreUUID:v13];

    uint64_t v14 = [v7 stringForColumnIndex:2];
    [v11 setName:v14];

    __int16 v15 = [v7 stringForColumnIndex:3];
    [v11 setValue:v15];

    objc_msgSend(v11, "setCrossDeviceSync:", objc_msgSend(v7, "intForColumnIndex:", 4) != 0);
    [v7 doubleForColumnIndex:5];
    if (v16 <= 0.0)
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    }
    [v11 setExpires:v17];

    [v7 doubleForColumnIndex:6];
    if (v18 <= 0.0)
    {
      double v19 = 0;
    }
    else
    {
      double v19 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    }
    [v11 setLastSync:v19];

    [v7 doubleForColumnIndex:7];
    if (v20 <= 0.0)
    {
      int v21 = 0;
    }
    else
    {
      int v21 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    }
    [v11 setModified:v21];

    objc_msgSend(v11, "setDeleted:", objc_msgSend(v7, "intForColumnIndex:", 8) != 0);
    [v7 doubleForColumnIndex:9];
    if (v22 <= 0.0)
    {
      __int16 v23 = 0;
    }
    else
    {
      __int16 v23 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    }
    [v11 setServerProvidedAt:v23];

    *a4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() ^ 1;
  }
}

- (BOOL)permanentlyRemoveIdentifierForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  double v16 = __Block_byref_object_copy__43;
  uint64_t v17 = __Block_byref_object_dispose__43;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__AMSMetricsDatabase_permanentlyRemoveIdentifierForKey_error___block_invoke;
  v10[3] = &unk_1E55A4198;
  void v10[4] = self;
  long long v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [(AMSMetricsDatabase *)self _performTransaction:v10];
  id v8 = (void *)v14[5];
  if (a4 && v8) {
    *a4 = v8;
  }

  _Block_object_dispose(&v13, 8);
  return v8 == 0;
}

BOOL __62__AMSMetricsDatabase_permanentlyRemoveIdentifierForKey_error___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __62__AMSMetricsDatabase_permanentlyRemoveIdentifierForKey_error___block_invoke_2;
  void v23[3] = &unk_1E55A40A8;
  id v24 = *(id *)(a1 + 40);
  [v2 executeStatement:@"DELETE FROM identifier_stores WHERE store_key=?" error:&obj bindings:v23];
  objc_storeStrong((id *)(v3 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    BOOL v4 = +[AMSLogConfig sharedMetricsConfig];
    if (!v4)
    {
      BOOL v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v27 = v6;
      __int16 v28 = 2114;
      uint64_t v29 = v7;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete identifier_stores. %{public}@", buf, 0x16u);
    }

    BOOL v8 = 0;
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) connection];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v22 = *(id *)(v10 + 40);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    double v19 = __62__AMSMetricsDatabase_permanentlyRemoveIdentifierForKey_error___block_invoke_170;
    double v20 = &unk_1E55A40A8;
    id v21 = *(id *)(a1 + 40);
    [v9 executeStatement:@"DELETE FROM identifiers WHERE identifier_key=?" error:&v22 bindings:&v17];
    objc_storeStrong((id *)(v10 + 40), v22);

    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    BOOL v8 = v11 == 0;
    if (v11)
    {
      long long v12 = +[AMSLogConfig sharedMetricsConfig];
      if (!v12)
      {
        long long v12 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v27 = v14;
        __int16 v28 = 2114;
        uint64_t v29 = v15;
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete identifiers. %{public}@", buf, 0x16u);
      }
    }
    BOOL v4 = v21;
  }

  return v8;
}

uint64_t __62__AMSMetricsDatabase_permanentlyRemoveIdentifierForKey_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindString:*(void *)(a1 + 32) atPosition:1];
}

uint64_t __62__AMSMetricsDatabase_permanentlyRemoveIdentifierForKey_error___block_invoke_170(uint64_t a1, void *a2)
{
  return [a2 bindString:*(void *)(a1 + 32) atPosition:1];
}

- (BOOL)removeCrossDeviceIdentifiersWithError:(id *)a3
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__43;
  uint64_t v11 = __Block_byref_object_dispose__43;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__AMSMetricsDatabase_removeCrossDeviceIdentifiersWithError___block_invoke;
  v6[3] = &unk_1E55A41C0;
  void v6[4] = self;
  v6[5] = &v7;
  [(AMSMetricsDatabase *)self _performTransaction:v6];
  BOOL v4 = (void *)v8[5];
  if (a3 && v4) {
    *a3 = v4;
  }
  _Block_object_dispose(&v7, 8);

  return v4 == 0;
}

uint64_t __60__AMSMetricsDatabase_removeCrossDeviceIdentifiersWithError___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "executeStatement:error:", @"DELETE FROM identifiers WHERE cross_device=1 OR store_uuid IN (SELECT store_uuid FROM identifier_stores WHERE cross_device=1);",
    &obj);
  objc_storeStrong((id *)(v3 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    BOOL v4 = +[AMSLogConfig sharedMetricsConfig];
    if (!v4)
    {
      BOOL v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v17 = v6;
    __int16 v18 = 2114;
    uint64_t v19 = v7;
    BOOL v8 = "%{public}@: Failed to delete identifiers. %{public}@";
    goto LABEL_11;
  }
  uint64_t v9 = [*(id *)(a1 + 32) connection];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(id *)(v10 + 40);
  [v9 executeStatement:@"DELETE FROM identifier_stores WHERE cross_device=1;" error:&v14];
  objc_storeStrong((id *)(v10 + 40), v14);

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    return 1;
  }
  BOOL v4 = +[AMSLogConfig sharedMetricsConfig];
  if (!v4)
  {
    BOOL v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    BOOL v8 = "%{public}@: Failed to delete identifier_stores. %{public}@";
LABEL_11:
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, v8, buf, 0x16u);
  }
LABEL_12:

  return 0;
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__AMSMetricsDatabase_connectionNeedsResetForCorruption___block_invoke;
  v8[3] = &unk_1E55A4328;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = self;
  uint64_t v11 = &v12;
  AMSMetricsDatabaseBlockWithKeepAlive(@"AMSMetricsDatabase-truncateAfterCorruption", v8);
  uint64_t v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v6[2]();

  LOBYTE(v6) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v6;
}

void __56__AMSMetricsDatabase_connectionNeedsResetForCorruption___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) truncate] & 1) != 0
    || ([*(id *)(a1 + 32) close],
        [*(id *)(a1 + 40) _cachePath],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        BOOL v3 = +[AMSDatabaseHelper removeDatabaseForCachePath:v2], v2, v3))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = +[AMSMetricsDatabaseSchema createOrUpdateSchemaUsingConnection:*(void *)(a1 + 32)];
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v4 = +[AMSLogConfig sharedMetricsConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      uint64_t v7 = objc_opt_class();
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset database after corruption. This is bad!", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)_lockedById
{
  uint64_t v2 = [MEMORY[0x1E4F29128] UUID];
  BOOL v3 = [v2 UUIDString];

  return v3;
}

- (NSString)containerId
{
  return self->_containerId;
}

- (void)setContainerId:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (void)setInternalQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_containerId, 0);
}

@end