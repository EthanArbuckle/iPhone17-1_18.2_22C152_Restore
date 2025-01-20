@interface AMSMetricsIdentifierCloudDataSource
+ (id)_database;
+ (id)_saveCloudObject:(id)a3 intoDatabase:(id)a4 isServerRecord:(BOOL)a5;
+ (id)_saveIdInfo:(id)a3 intoDatabase:(id)a4 isServerRecord:(BOOL)a5;
+ (id)_saveStoreInfo:(id)a3 intoDatabase:(id)a4 isServerRecord:(BOOL)a5;
+ (id)_sharedQueue;
+ (void)cleanupIdentifiers;
+ (void)clearSyncState;
+ (void)removeAllRecords;
- (AMSMetricsIdentifierCloudDataSourceDelegate)delegate;
- (id)_createRecordForIdentifier:(id)a3;
- (id)_createRecordForIdentifierStore:(id)a3;
- (id)_parseRecord:(id)a3 error:(id *)a4;
- (void)fetchModifiedRecordsWithCompletion:(id)a3;
- (void)removeRecordWithIdentifier:(id)a3;
- (void)saveRecord:(id)a3 isServerRecord:(BOOL)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AMSMetricsIdentifierCloudDataSource

+ (void)cleanupIdentifiers
{
}

+ (void)clearSyncState
{
  v3 = [a1 _sharedQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AMSMetricsIdentifierCloudDataSource_clearSyncState__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_sync(v3, block);
}

void __53__AMSMetricsIdentifierCloudDataSource_clearSyncState__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) _database];
  v2 = +[AMSLogConfig sharedMetricsConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    v5 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Clearing identifier sync state", buf, 0x16u);
  }
  id v11 = 0;
  [v1 clearIdentifierSyncStateWithError:&v11];
  id v6 = v11;
  if (v6)
  {
    v7 = +[AMSLogConfig sharedMetricsConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      v10 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to clear identifier sync state. %{public}@", buf, 0x20u);
    }
  }
}

- (void)fetchModifiedRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _sharedQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__AMSMetricsIdentifierCloudDataSource_fetchModifiedRecordsWithCompletion___block_invoke;
  v7[3] = &unk_1E559EAE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __74__AMSMetricsIdentifierCloudDataSource_fetchModifiedRecordsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() _database];
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __74__AMSMetricsIdentifierCloudDataSource_fetchModifiedRecordsWithCompletion___block_invoke_2;
  v23[3] = &unk_1E55A46A8;
  v23[4] = *(void *)(a1 + 32);
  id v5 = v4;
  id v24 = v5;
  id v6 = v3;
  id v25 = v6;
  id v22 = 0;
  [v2 enumerateUnsyncedIdentifierStoresUsingBlock:v23 error:&v22];
  id v7 = v22;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = +[AMSLogConfig sharedMetricsConfig];
    if (!v9)
    {
      uint64_t v9 = +[AMSLogConfig sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      v12 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v11;
      __int16 v28 = 2114;
      v29 = v12;
      __int16 v30 = 2114;
      id v31 = v8;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to enumerate unsynced identifier domains. %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__AMSMetricsIdentifierCloudDataSource_fetchModifiedRecordsWithCompletion___block_invoke_4;
    v19[3] = &unk_1E55A46D0;
    v19[4] = *(void *)(a1 + 32);
    id v20 = v5;
    id v21 = v6;
    id v18 = 0;
    [v2 enumerateUnsyncedIdentifiersUsingBlock:v19 error:&v18];
    id v8 = v18;
    if (v8)
    {
      uint64_t v13 = +[AMSLogConfig sharedMetricsConfig];
      if (!v13)
      {
        uint64_t v13 = +[AMSLogConfig sharedConfig];
      }
      __int16 v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_opt_class();
        __int16 v16 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v27 = v15;
        __int16 v28 = 2114;
        v29 = v16;
        __int16 v30 = 2114;
        id v31 = v8;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to enumerate unsynced identifiers. %{public}@", buf, 0x20u);
      }
      id v17 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      id v17 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v17();
  }
}

uint64_t __74__AMSMetricsIdentifierCloudDataSource_fetchModifiedRecordsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 deleted];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = [v5 delegate];
    id v7 = [v3 storeKey];
    id v8 = [v6 recordIdentifierForKey:v7];

    if (v8)
    {
      uint64_t v9 = (id *)(a1 + 40);
LABEL_6:
      [*v9 addObject:v8];
    }
  }
  else
  {
    id v8 = [v5 _createRecordForIdentifierStore:v3];
    if (v8)
    {
      uint64_t v9 = (id *)(a1 + 48);
      goto LABEL_6;
    }
  }

  return 1;
}

uint64_t __74__AMSMetricsIdentifierCloudDataSource_fetchModifiedRecordsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 deleted];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = [v5 delegate];
    id v7 = [v3 idKey];
    id v8 = [v6 recordIdentifierForKey:v7];

    if (v8)
    {
      uint64_t v9 = (id *)(a1 + 40);
LABEL_6:
      [*v9 addObject:v8];
    }
  }
  else
  {
    id v8 = [v5 _createRecordForIdentifier:v3];
    if (v8)
    {
      uint64_t v9 = (id *)(a1 + 48);
      goto LABEL_6;
    }
  }

  return 1;
}

+ (void)removeAllRecords
{
  id v3 = [(id)objc_opt_class() _sharedQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__AMSMetricsIdentifierCloudDataSource_removeAllRecords__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_sync(v3, block);
}

void __55__AMSMetricsIdentifierCloudDataSource_removeAllRecords__block_invoke()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v0 = [(id)objc_opt_class() _database];
  v1 = +[AMSLogConfig sharedMetricsConfig];
  if (!v1)
  {
    v1 = +[AMSLogConfig sharedConfig];
  }
  v2 = [v1 OSLogObject];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    int v4 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v3;
    __int16 v13 = 2114;
    __int16 v14 = v4;
    _os_log_impl(&dword_18D554000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Permanently removing cross-device identifiers", buf, 0x16u);
  }
  id v10 = 0;
  [v0 removeCrossDeviceIdentifiersWithError:&v10];
  id v5 = v10;
  if (v5)
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
      uint64_t v9 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      __int16 v14 = v9;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to permanently remove cross-device identifiers. %{public}@", buf, 0x20u);
    }
  }
}

- (void)removeRecordWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _sharedQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__AMSMetricsIdentifierCloudDataSource_removeRecordWithIdentifier___block_invoke;
  v7[3] = &unk_1E559F1E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__AMSMetricsIdentifierCloudDataSource_removeRecordWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() _database];
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  id v4 = [v3 keyForRecordIdentifier:*(void *)(a1 + 40)];

  if (v4)
  {
    id v5 = +[AMSLogConfig sharedMetricsConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      id v18 = v8;
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Permanently removing identifier for key %{public}@", buf, 0x20u);
    }
    id v14 = 0;
    [v2 permanentlyRemoveIdentifierForKey:v4 error:&v14];
    id v9 = v14;
    if (v9)
    {
      id v10 = +[AMSLogConfig sharedMetricsConfig];
      if (!v10)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = objc_opt_class();
        __int16 v13 = AMSLogKey();
        *(_DWORD *)buf = 138544130;
        uint64_t v16 = v12;
        __int16 v17 = 2114;
        id v18 = v13;
        __int16 v19 = 2114;
        id v20 = v4;
        __int16 v21 = 2114;
        id v22 = v9;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to permanently remove identifier for key %{public}@. %{public}@", buf, 0x2Au);
      }
    }
  }
}

- (void)saveRecord:(id)a3 isServerRecord:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() _sharedQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AMSMetricsIdentifierCloudDataSource_saveRecord_isServerRecord___block_invoke;
  block[3] = &unk_1E55A46F8;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __65__AMSMetricsIdentifierCloudDataSource_saveRecord_isServerRecord___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() _database];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v13 = 0;
  id v5 = [v3 _parseRecord:v4 error:&v13];
  id v6 = v13;
  if (v5)
  {
    uint64_t v7 = [(id)objc_opt_class() _saveCloudObject:v5 intoDatabase:v2 isServerRecord:*(unsigned __int8 *)(a1 + 48)];

    id v6 = (id)v7;
  }
  if (v6)
  {
    id v8 = +[AMSLogConfig sharedMetricsConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      BOOL v11 = AMSLogKey();
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      __int16 v17 = v11;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to add record %{public}@. %{public}@", buf, 0x2Au);
    }
  }
}

+ (id)_saveCloudObject:(id)a3 intoDatabase:(id)a4 isServerRecord:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [a1 _saveStoreInfo:v8 intoDatabase:v9 isServerRecord:v5];
LABEL_5:
    BOOL v11 = (void *)v10;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [a1 _saveIdInfo:v8 intoDatabase:v9 isServerRecord:v5];
    goto LABEL_5;
  }
  BOOL v11 = 0;
LABEL_7:

  return v11;
}

+ (id)_saveStoreInfo:(id)a3 intoDatabase:(id)a4 isServerRecord:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = +[AMSLogConfig sharedMetricsConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = AMSLogKey();
    id v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
    *(_DWORD *)buf = 138544130;
    uint64_t v24 = v11;
    __int16 v25 = 2114;
    v26 = v12;
    __int16 v27 = 2114;
    id v28 = v7;
    __int16 v29 = 2114;
    __int16 v30 = v13;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Maybe saving Store Info %{public}@. from cloudkit server %{public}@", buf, 0x2Au);
  }
  id v14 = [v7 storeKey];
  id v19 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__AMSMetricsIdentifierCloudDataSource__saveStoreInfo_intoDatabase_isServerRecord___block_invoke;
  v20[3] = &unk_1E55A4720;
  id v21 = v7;
  BOOL v22 = v5;
  id v15 = v7;
  id v16 = (id)[v8 identifierStoreForKey:v14 updateMaybe:v20 error:&v19];
  id v17 = v19;

  return v17;
}

uint64_t __82__AMSMetricsIdentifierCloudDataSource__saveStoreInfo_intoDatabase_isServerRecord___block_invoke(uint64_t a1, id *a2)
{
  id v4 = *a2;
  BOOL v5 = [v4 modified];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  id v8 = [*(id *)(a1 + 32) modified];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  if (v7 <= v10 || *(unsigned char *)(a1 + 40) && ([v4 deleted] & 1) == 0)
  {
    *a2 = *(id *)(a1 + 32);
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)_saveIdInfo:(id)a3 intoDatabase:(id)a4 isServerRecord:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = +[AMSLogConfig sharedMetricsConfig];
  if (!v9)
  {
    double v9 = +[AMSLogConfig sharedConfig];
  }
  double v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = AMSLogKey();
    id v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
    *(_DWORD *)buf = 138544130;
    uint64_t v24 = v11;
    __int16 v25 = 2114;
    v26 = v12;
    __int16 v27 = 2114;
    id v28 = v7;
    __int16 v29 = 2114;
    __int16 v30 = v13;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Maybe saving Id Info %{public}@. from cloudkit server %{public}@", buf, 0x2Au);
  }
  id v14 = [v7 idKey];
  id v19 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__AMSMetricsIdentifierCloudDataSource__saveIdInfo_intoDatabase_isServerRecord___block_invoke;
  v20[3] = &unk_1E55A4720;
  id v21 = v7;
  BOOL v22 = v5;
  id v15 = v7;
  id v16 = (id)[v8 identifierForKey:v14 updateMaybe:v20 error:&v19];
  id v17 = v19;

  return v17;
}

BOOL __79__AMSMetricsIdentifierCloudDataSource__saveIdInfo_intoDatabase_isServerRecord___block_invoke(uint64_t a1, id *a2)
{
  id v4 = *a2;
  BOOL v5 = +[AMSMetricsIdentifierCore _shouldReplaceInfo:v4 withInfo:*(void *)(a1 + 32) isServerRecord:*(unsigned __int8 *)(a1 + 40)];
  if (v5) {
    *a2 = *(id *)(a1 + 32);
  }

  return v5;
}

- (id)_createRecordForIdentifierStore:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AMSMetricsIdentifierCloudDataSource *)self delegate];
  double v6 = [v4 storeKey];
  id v7 = [(AMSMetricsIdentifierCloudDataSource *)self delegate];
  id v8 = [v7 identifierStoreRecordType];
  double v9 = [v5 createRecordForKey:v6 recordType:v8];

  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = [v4 account];
    [v10 setField:v11 forKey:@"account"];

    uint64_t v12 = (void *)MEMORY[0x1E4F28ED0];
    [v4 resetInterval];
    id v13 = objc_msgSend(v12, "numberWithDouble:");
    [v10 setField:v13 forKey:@"resetInterval"];

    id v14 = [v4 modified];
    [v10 setField:v14 forKey:@"modified"];

    id v15 = [v4 started];
    [v10 setField:v15 forKey:@"started"];

    id v16 = [v4 storeUUID];
    [v10 setField:v16 forKey:@"storeUUID"];
  }
  return v9;
}

- (id)_createRecordForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AMSMetricsIdentifierCloudDataSource *)self delegate];
  double v6 = [v4 idKey];
  id v7 = [(AMSMetricsIdentifierCloudDataSource *)self delegate];
  id v8 = [v7 identifierRecordType];
  double v9 = [v5 createRecordForKey:v6 recordType:v8];

  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = [v4 expires];
    [v10 setField:v11 forKey:@"expires"];

    uint64_t v12 = [v4 modified];
    [v10 setField:v12 forKey:@"modified"];

    id v13 = [v4 name];
    [v10 setField:v13 forKey:@"name"];

    id v14 = [v4 storeUUID];
    [v10 setField:v14 forKey:@"storeUUID"];

    id v15 = [v4 value];
    [v10 setField:v15 forKey:@"value"];

    id v16 = [v4 serverProvidedAt];
    [v10 setField:v16 forKey:@"serverProvidedAt"];
  }
  return v9;
}

+ (id)_database
{
  return +[AMSMetricsIdentifierStore _database];
}

- (id)_parseRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 type];
  id v8 = [(AMSMetricsIdentifierCloudDataSource *)self delegate];
  double v9 = [v6 identifier];
  id v10 = [v8 keyForRecordIdentifier:v9];

  uint64_t v11 = [(AMSMetricsIdentifierCloudDataSource *)self delegate];
  uint64_t v12 = [v11 identifierStoreRecordType];
  int v13 = [v7 isEqualToString:v12];

  if (v13)
  {
    id v14 = objc_opt_new();
    [v14 setStoreKey:v10];
    [v14 setCrossDeviceSync:1];
    id v15 = [v6 fieldForKey:@"account"];
    [v14 setAccount:v15];

    id v16 = [v6 fieldForKey:@"resetInterval"];
    [v16 doubleValue];
    objc_msgSend(v14, "setResetInterval:");

    id v17 = [v6 fieldForKey:@"started"];
    [v14 setStarted:v17];

    __int16 v18 = [v6 fieldForKey:@"storeUUID"];
    [v14 setStoreUUID:v18];

    id v19 = [v6 fieldForKey:@"modified"];
    [v14 setModified:v19];

    __int16 v20 = [MEMORY[0x1E4F1C9C8] now];
    [v14 setLastSync:v20];

    uint64_t v21 = [v14 storeKey];
    if (!v21) {
      goto LABEL_20;
    }
    BOOL v22 = (void *)v21;
    uint64_t v23 = [v14 storeUUID];
    if (!v23) {
      goto LABEL_19;
    }
    uint64_t v24 = (void *)v23;
    uint64_t v25 = [v14 account];
    if (v25)
    {
      v26 = (void *)v25;
      __int16 v27 = [v14 modified];

      if (!v27)
      {
LABEL_20:
        if (*a4)
        {
          AMSError(0, @"Invalid record data", @"Record data is not valid.", 0);
          id v45 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v45 = 0;
        }
        goto LABEL_23;
      }
LABEL_13:
      id v45 = v14;
LABEL_23:

      goto LABEL_24;
    }
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  id v28 = [(AMSMetricsIdentifierCloudDataSource *)self delegate];
  __int16 v29 = [v28 identifierRecordType];
  int v30 = [v7 isEqualToString:v29];

  if (v30)
  {
    id v14 = objc_opt_new();
    [v14 setIdKey:v10];
    [v14 setCrossDeviceSync:1];
    uint64_t v31 = [v6 fieldForKey:@"expires"];
    [v14 setExpires:v31];

    uint64_t v32 = [v6 fieldForKey:@"name"];
    [v14 setName:v32];

    v33 = [v6 fieldForKey:@"storeUUID"];
    [v14 setStoreUUID:v33];

    v34 = [v6 fieldForKey:@"value"];
    [v14 setValue:v34];

    v35 = [v6 fieldForKey:@"modified"];
    [v14 setModified:v35];

    v36 = [MEMORY[0x1E4F1C9C8] now];
    [v14 setLastSync:v36];

    v37 = [v6 fieldForKey:@"serverProvidedAt"];
    [v14 setServerProvidedAt:v37];

    uint64_t v38 = [v14 idKey];
    if (!v38) {
      goto LABEL_20;
    }
    BOOL v22 = (void *)v38;
    uint64_t v39 = [v14 storeUUID];
    if (!v39) {
      goto LABEL_19;
    }
    uint64_t v24 = (void *)v39;
    uint64_t v40 = [v14 name];
    if (v40)
    {
      v41 = (void *)v40;
      uint64_t v42 = [v14 modified];
      if (v42)
      {
        v43 = (void *)v42;
        v44 = [v14 value];

        if (!v44) {
          goto LABEL_20;
        }
        goto LABEL_13;
      }
    }
    goto LABEL_18;
  }
  if (*a4)
  {
    AMSError(0, @"Unknown record type", @"Record type is unrecognized.", 0);
    id v45 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v45 = 0;
  }
LABEL_24:

  return v45;
}

+ (id)_sharedQueue
{
  return +[AMSMetricsIdentifierStore _sharedQueue];
}

- (AMSMetricsIdentifierCloudDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSMetricsIdentifierCloudDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end