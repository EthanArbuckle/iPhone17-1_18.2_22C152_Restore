@interface AMSStorageDatabase
+ (BOOL)isFeatureSupported;
+ (id)sharedDatabaseWithDomain:(id)a3;
- (AMSSQLiteConnection)connection;
- (AMSStorageDatabase)initWithDomain:(id)a3;
- (BOOL)BOOLeanForKey:(id)a3 error:(id *)a4;
- (BOOL)_setValueData:(id)a3 valueType:(int64_t)a4 forKey:(id)a5 error:(id *)a6;
- (BOOL)connectionNeedsResetForCorruption:(id)a3;
- (BOOL)deleteForKey:(id)a3 error:(id *)a4;
- (BOOL)setBoolean:(BOOL)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setDouble:(double)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setInteger:(int64_t)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setIsLasset:(id)a3 error:(id *)a4;
- (BOOL)setValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (NSString)domain;
- (OS_dispatch_queue)internalQueue;
- (double)doubleForKey:(id)a3 error:(id *)a4;
- (id)_allKeysPrefixedByDomainWithError:(id *)a3;
- (id)_cachePath;
- (id)_convertToDataWithValue:(id)a3 valueType:(int64_t)a4 error:(id *)a5;
- (id)_convertToValueWithData:(id)a3 valueType:(int64_t)a4 error:(id *)a5;
- (id)_dataForPlistValue:(id)a3 error:(id *)a4;
- (id)_plistValueForData:(id)a3 error:(id *)a4;
- (id)allKeyValuesWithError:(id *)a3;
- (id)allKeysForDomain:(id)a3 withError:(id *)a4;
- (id)isLassetAndReturnError:(id *)a3;
- (id)sizeWithError:(id *)a3;
- (id)valueForKey:(id)a3 error:(id *)a4;
- (int64_t)_valueTypeForValue:(id)a3;
- (int64_t)integerForKey:(id)a3 error:(id *)a4;
- (void)_performTransaction:(id)a3;
- (void)close;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setDomain:(id)a3;
- (void)setInternalQueue:(id)a3;
@end

@implementation AMSStorageDatabase

- (AMSStorageDatabase)initWithDomain:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AMSStorageDatabase;
  v6 = [(AMSStorageDatabase *)&v26 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v6->_domain, a3);
  v8 = +[AMSKeepAlive keepAliveWithName:@"AMSStorage"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__AMSStorageDatabase_initWithDomain___block_invoke;
  aBlock[3] = &unk_1E559EA90;
  id v9 = v8;
  id v25 = v9;
  v10 = (void (**)(void))_Block_copy(aBlock);
  v11 = [(AMSStorageDatabase *)v7 _cachePath];
  v12 = +[AMSDatabaseHelper databasePathForCachePath:v11 type:1];

  if (!v12)
  {
    v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      v15 = +[AMSLogConfig sharedConfig];
    }
    v19 = [(AMSSQLiteConnectionOptions *)v15 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v20;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Fatal Error: Failed to fetch AMSStorage database path.", buf, 0xCu);
    }
    goto LABEL_15;
  }
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.AMSStorageDatabase.internal", 0);
  internalQueue = v7->_internalQueue;
  v7->_internalQueue = (OS_dispatch_queue *)v13;

  v15 = [[AMSSQLiteConnectionOptions alloc] initWithDatabasePath:v12];
  v16 = [[AMSSQLiteConnection alloc] initWithOptions:v15];
  connection = v7->_connection;
  v7->_connection = v16;

  [(AMSSQLiteConnection *)v7->_connection setDelegate:v7];
  if (!+[AMSStorageDatabaseSchema createOrUpdateSchemaUsingConnection:v7->_connection])
  {
    v19 = +[AMSLogConfig sharedConfig];
    if (!v19)
    {
      v19 = +[AMSLogConfig sharedConfig];
    }
    v21 = [v19 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v22;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Fatal Error: Failed to create the AMSStorage database schema.", buf, 0xCu);
    }

LABEL_15:
    v10[2](v10);

    v18 = 0;
    goto LABEL_16;
  }

  v10[2](v10);
LABEL_5:
  v18 = v7;
LABEL_16:

  return v18;
}

- (id)_cachePath
{
  return +[AMSDatabaseHelper databaseFolderNameForType:1];
}

uint64_t __37__AMSStorageDatabase_initWithDomain___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)close
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSKeepAlive keepAliveWithName:@"AMSStorage"];
  v4 = [(AMSStorageDatabase *)self connection];
  char v5 = [v4 close];

  if ((v5 & 1) == 0)
  {
    v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v9 = 138543362;
      *(void *)&v9[4] = objc_opt_class();
      id v8 = *(id *)&v9[4];
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to close the AMSStorage database connection", v9, 0xCu);
    }
  }
  objc_msgSend(v3, "invalidate", *(_OWORD *)v9);
}

- (void)dealloc
{
  [(AMSStorageDatabase *)self close];
  [(AMSStorageDatabase *)self setConnection:0];
  v3.receiver = self;
  v3.super_class = (Class)AMSStorageDatabase;
  [(AMSStorageDatabase *)&v3 dealloc];
}

- (void)setConnection:(id)a3
{
}

- (AMSSQLiteConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (id)isLassetAndReturnError:(id *)a3
{
  v4 = self;
  v5.super.super.isa = AMSStorageDatabase.isLasset()().super.super.isa;

  if (v6.super.super.isa)
  {
    if (a3)
    {
      v7 = (void *)sub_18DD4D6D0();

      id v8 = v7;
      v5.super.super.isa = 0;
      *a3 = v7;
    }
    else
    {

      v5.super.super.isa = 0;
    }
  }
  return v5.super.super.isa;
}

- (BOOL)setIsLasset:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = self;
  AMSStorageDatabase.setIsLasset(_:)((NSNumber)v6);

  if (v8)
  {
    if (a4)
    {
      id v9 = (void *)sub_18DD4D6D0();

      id v10 = v9;
      *a4 = v9;
    }
    else
    {
    }
  }
  return v8 == 0;
}

+ (BOOL)isFeatureSupported
{
  return _os_feature_enabled_impl();
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__65;
  v41 = __Block_byref_object_dispose__65;
  id v42 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__65;
  v31 = __Block_byref_object_dispose__65;
  id v32 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __40__AMSStorageDatabase_valueForKey_error___block_invoke;
  v22[3] = &unk_1E55A6B08;
  v22[4] = self;
  v24 = &v27;
  id v7 = v6;
  id v23 = v7;
  id v25 = &v33;
  objc_super v26 = &v37;
  [(AMSStorageDatabase *)self _performTransaction:v22];
  v14 = (id *)(v28 + 5);
  dispatch_queue_t v13 = (void *)v28[5];
  if (v13)
  {
    if (a4)
    {
LABEL_3:
      v15 = 0;
      *a4 = v13;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v16 = v38[5];
    if (v16)
    {
      uint64_t v17 = v34[3];
      id obj = 0;
      v15 = [(AMSStorageDatabase *)self _convertToValueWithData:v16 valueType:v17 error:&obj];
      objc_storeStrong(v14, obj);
      goto LABEL_9;
    }
    uint64_t v18 = AMSErrorWithFormat(7, @"No value found in AMSStorage database.", @"No value found with key: %@ in the AMSStorage database.", v8, v9, v10, v11, v12, (uint64_t)v7);
    v19 = (void *)v28[5];
    v28[5] = v18;

    if (a4)
    {
      dispatch_queue_t v13 = (void *)v28[5];
      goto LABEL_3;
    }
  }
  v15 = 0;
LABEL_9:

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v15;
}

BOOL __40__AMSStorageDatabase_valueForKey_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__AMSStorageDatabase_valueForKey_error___block_invoke_2;
  v8[3] = &unk_1E55A4238;
  v8[4] = *(void *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v7;
  long long v4 = *(_OWORD *)(a1 + 56);
  long long v9 = v7;
  long long v10 = v4;
  objc_msgSend(v2, "executeQuery:withResults:", @"SELECT key, valueType, value FROM data WHERE key=? AND domain=?;",
    v8);

  BOOL v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return v5;
}

void __40__AMSStorageDatabase_valueForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    long long v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      long long v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = objc_opt_class();
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    [v5 bindString:*(void *)(a1 + 40) atPosition:1];
    long long v9 = [*(id *)(a1 + 32) domain];
    [v5 bindString:v9 atPosition:2];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__AMSStorageDatabase_valueForKey_error___block_invoke_18;
    v10[3] = &unk_1E55A4210;
    v10[4] = *(void *)(a1 + 32);
    long long v11 = *(_OWORD *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 64);
    [v5 enumerateRowsUsingBlock:v10];
  }
}

void __40__AMSStorageDatabase_valueForKey_error___block_invoke_18(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    long long v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      long long v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543618;
      uint64_t v13 = objc_opt_class();
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", (uint8_t *)&v12, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = (int)[v5 intForColumnName:@"valueType"];
    uint64_t v9 = [v5 dataForColumnName:@"value"];
    uint64_t v10 = *(void *)(a1[7] + 8);
    long long v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(AMSStorageDatabase *)self _valueTypeForValue:v8];
  if (v10 != 1)
  {
    int64_t v16 = v10;
    if (!v10)
    {
      AMSErrorWithFormat(2, @"Value type not supported", @"The value type you are trying to use is not supported. Did you mean to conform to 'AMSStorageDatabasePersistable'? Key: %@", v11, v12, v13, v14, v15, (uint64_t)v9);
      goto LABEL_5;
    }
    id v34 = 0;
    uint64_t v20 = [(AMSStorageDatabase *)self _convertToDataWithValue:v8 valueType:v10 error:&v34];
    id v18 = v34;
    if (v18)
    {
      objc_super v26 = +[AMSLogConfig sharedConfig];
      if (!v26)
      {
        objc_super v26 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v27 = [v26 OSLogObject];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v36 = v28;
        __int16 v37 = 2114;
        id v38 = v9;
        __int16 v39 = 2114;
        id v40 = v18;
        _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_ERROR, "%{public}@: Creating data object for %{public}@ failed with error: %{public}@", buf, 0x20u);
      }

      if (a5)
      {
        BOOL v19 = 0;
        *a5 = v18;
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      if (v20)
      {
        BOOL v19 = [(AMSStorageDatabase *)self _setValueData:v20 valueType:v16 forKey:v9 error:a5];
        goto LABEL_25;
      }
      uint64_t v29 = AMSErrorWithFormat(2, @"Error converting value to data", @"There was an issue converting value to data for key: %@", v21, v22, v23, v24, v25, (uint64_t)v9);
      v30 = +[AMSLogConfig sharedConfig];
      if (!v30)
      {
        v30 = +[AMSLogConfig sharedConfig];
      }
      v31 = [v30 OSLogObject];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v36 = v32;
        __int16 v37 = 2114;
        id v38 = v9;
        __int16 v39 = 2114;
        id v40 = v29;
        _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_ERROR, "%{public}@: Creating data object for %{public}@ failed with error: %{public}@", buf, 0x20u);
      }

      if (a5) {
        *a5 = v29;
      }
    }
    BOOL v19 = 0;
    goto LABEL_25;
  }
  AMSErrorWithFormat(2, @"Value is null", @"You are trying to save a null value. Did you mean to call 'deleteForKey'? Key: %@", v11, v12, v13, v14, v15, (uint64_t)v9);
  uint64_t v17 = LABEL_5:;
  id v18 = v17;
  if (a5)
  {
    id v18 = v17;
    BOOL v19 = 0;
    *a5 = v18;
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_26:

  return v19;
}

- (BOOL)BOOLeanForKey:(id)a3 error:(id *)a4
{
  long long v4 = [(AMSStorageDatabase *)self valueForKey:a3 error:a4];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)setBoolean:(BOOL)a3 forKey:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = (void *)MEMORY[0x1E4F28ED0];
  id v9 = a4;
  int64_t v10 = [v8 numberWithBool:v6];
  uint64_t v11 = [(AMSStorageDatabase *)self _convertToDataWithValue:v10 valueType:2 error:a5];

  LOBYTE(a5) = [(AMSStorageDatabase *)self _setValueData:v11 valueType:2 forKey:v9 error:a5];
  return (char)a5;
}

- (int64_t)integerForKey:(id)a3 error:(id *)a4
{
  long long v4 = [(AMSStorageDatabase *)self valueForKey:a3 error:a4];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (BOOL)setInteger:(int64_t)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x1E4F28ED0];
  id v9 = a4;
  int64_t v10 = [v8 numberWithInteger:a3];
  uint64_t v11 = [(AMSStorageDatabase *)self _convertToDataWithValue:v10 valueType:2 error:a5];

  LOBYTE(a5) = [(AMSStorageDatabase *)self _setValueData:v11 valueType:2 forKey:v9 error:a5];
  return (char)a5;
}

- (double)doubleForKey:(id)a3 error:(id *)a4
{
  long long v4 = [(AMSStorageDatabase *)self valueForKey:a3 error:a4];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (BOOL)setDouble:(double)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x1E4F28ED0];
  id v9 = a4;
  int64_t v10 = [v8 numberWithDouble:a3];
  uint64_t v11 = [(AMSStorageDatabase *)self _convertToDataWithValue:v10 valueType:2 error:a5];

  LOBYTE(a5) = [(AMSStorageDatabase *)self _setValueData:v11 valueType:2 forKey:v9 error:a5];
  return (char)a5;
}

- (BOOL)deleteForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  int64_t v16 = __Block_byref_object_copy__65;
  uint64_t v17 = __Block_byref_object_dispose__65;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__AMSStorageDatabase_deleteForKey_error___block_invoke;
  v10[3] = &unk_1E55A4198;
  v10[4] = self;
  uint64_t v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [(AMSStorageDatabase *)self _performTransaction:v10];
  id v8 = (void *)v14[5];
  if (a4 && v8) {
    *a4 = v8;
  }

  _Block_object_dispose(&v13, 8);
  return v8 == 0;
}

uint64_t __41__AMSStorageDatabase_deleteForKey_error___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__AMSStorageDatabase_deleteForKey_error___block_invoke_2;
  v13[3] = &unk_1E55A6798;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v14 = v4;
  uint64_t v15 = v5;
  uint64_t v6 = objc_msgSend(v2, "executeStatement:error:bindings:", @"DELETE FROM data WHERE key=? AND domain=?;",
         &obj,
         v13);
  objc_storeStrong((id *)(v3 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      uint64_t v20 = v10;
      __int16 v21 = 2114;
      uint64_t v22 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Deleting value for key: %{public}@ failed with error: %{public}@", buf, 0x20u);
    }
  }
  return v6;
}

void __41__AMSStorageDatabase_deleteForKey_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3 atPosition:1];
  id v5 = [*(id *)(a1 + 40) domain];
  [v4 bindString:v5 atPosition:2];
}

- (id)sizeWithError:(id *)a3
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__65;
  v12[4] = __Block_byref_object_dispose__65;
  id v13 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__65;
  uint64_t v10 = __Block_byref_object_dispose__65;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__AMSStorageDatabase_sizeWithError___block_invoke;
  v5[3] = &unk_1E55A6B80;
  v5[4] = self;
  v5[5] = v12;
  v5[6] = &v6;
  [(AMSStorageDatabase *)self _performTransaction:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(v12, 8);
  return v3;
}

BOOL __36__AMSStorageDatabase_sizeWithError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__AMSStorageDatabase_sizeWithError___block_invoke_2;
  v4[3] = &unk_1E55A6B58;
  long long v5 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  [v2 executeQuery:@"SELECT SUM(pgsize) FROM dbstat WHERE name='data';" withResults:v4];

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

void __36__AMSStorageDatabase_sizeWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = objc_opt_class();
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__AMSStorageDatabase_sizeWithError___block_invoke_60;
    v9[3] = &unk_1E55A6B30;
    long long v10 = *(_OWORD *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 48);
    [a2 enumerateRowsUsingBlock:v9];
  }
}

void __36__AMSStorageDatabase_sizeWithError___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543618;
      uint64_t v13 = objc_opt_class();
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", (uint8_t *)&v12, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v9 = [a2 stringForColumnIndex:0];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (id)allKeysForDomain:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__65;
  uint64_t v25 = __Block_byref_object_dispose__65;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__65;
  __int16 v19 = __Block_byref_object_dispose__65;
  id v20 = (id)objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__AMSStorageDatabase_allKeysForDomain_withError___block_invoke;
  v11[3] = &unk_1E55A6BD0;
  v11[4] = self;
  uint64_t v13 = &v21;
  id v7 = v6;
  id v12 = v7;
  __int16 v14 = &v15;
  [(AMSStorageDatabase *)self _performTransaction:v11];
  if (a4)
  {
    uint64_t v8 = (void *)v22[5];
    if (v8) {
      *a4 = v8;
    }
  }
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

BOOL __49__AMSStorageDatabase_allKeysForDomain_withError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__AMSStorageDatabase_allKeysForDomain_withError___block_invoke_2;
  v7[3] = &unk_1E55A6BA8;
  v7[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v6;
  long long v8 = v6;
  uint64_t v9 = *(void *)(a1 + 56);
  objc_msgSend(v2, "executeQuery:withResults:", @"SELECT key FROM data WHERE domain=? ORDER BY length(data.value) DESC;",
    v7);

  BOOL v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return v4;
}

void __49__AMSStorageDatabase_allKeysForDomain_withError___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    long long v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  }
  else
  {
    [v5 bindString:a1[5] atPosition:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__AMSStorageDatabase_allKeysForDomain_withError___block_invoke_65;
    v9[3] = &unk_1E55A6B30;
    void v9[4] = a1[4];
    long long v10 = *((_OWORD *)a1 + 3);
    [v5 enumerateRowsUsingBlock:v9];
  }
}

void __49__AMSStorageDatabase_allKeysForDomain_withError___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    long long v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543618;
      uint64_t v11 = objc_opt_class();
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v9 = [a2 stringForColumnIndex:0];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v9];
  }
}

- (id)allKeyValuesWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__65;
  v29[4] = __Block_byref_object_dispose__65;
  id v30 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__65;
  uint64_t v27 = __Block_byref_object_dispose__65;
  id v28 = (id)objc_opt_new();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke;
  v22[3] = &unk_1E55A6B80;
  v22[4] = self;
  void v22[5] = v29;
  v22[6] = &v23;
  [(AMSStorageDatabase *)self _performTransaction:v22];
  BOOL v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = (id)v24[5];
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = 0;
        id v13 = &v12;
        uint64_t v14 = 0x3032000000;
        uint64_t v15 = __Block_byref_object_copy__65;
        uint64_t v16 = __Block_byref_object_dispose__65;
        id v17 = (id)objc_opt_new();
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_71;
        v11[3] = &unk_1E55A6BD0;
        v11[4] = self;
        void v11[5] = v8;
        v11[6] = v29;
        v11[7] = &v12;
        [(AMSStorageDatabase *)self _performTransaction:v11];
        [v4 setObject:v13[5] forKey:v8];
        _Block_object_dispose(&v12, 8);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v31 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(v29, 8);

  return v4;
}

BOOL __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_2;
  v4[3] = &unk_1E55A6B58;
  long long v5 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  [v2 executeQuery:@"SELECT DISTINCT domain FROM data;" withResults:v4];

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

void __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = objc_opt_class();
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_69;
    v9[3] = &unk_1E55A6B30;
    long long v10 = *(_OWORD *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 48);
    [a2 enumerateRowsUsingBlock:v9];
  }
}

void __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543618;
      uint64_t v11 = objc_opt_class();
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v9 = [a2 stringForColumnIndex:0];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v9];
  }
}

BOOL __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_71(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_2_75;
  v5[3] = &unk_1E55A6BA8;
  long long v3 = *(_OWORD *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 32);
  long long v7 = v3;
  objc_msgSend(v2, "executeQuery:withResults:", @"SELECT key, value, valueType FROM data WHERE domain=? ORDER BY length(data.value) DESC;",
    v5);

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

void __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_2_75(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    long long v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      long long v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  }
  else
  {
    [v5 bindString:a1[5] atPosition:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_76;
    v9[3] = &unk_1E55A6B30;
    void v9[4] = a1[4];
    long long v10 = *((_OWORD *)a1 + 3);
    [v5 enumerateRowsUsingBlock:v9];
  }
}

void __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_76(void *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    long long v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      long long v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = objc_opt_class();
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", buf, 0x16u);
    }

    uint64_t v9 = *(void *)(a1[5] + 8);
    id v10 = v6;
    uint64_t v11 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    uint64_t v11 = [v5 stringForColumnIndex:0];
    int v12 = [v5 intForColumnName:@"valueType"];
    __int16 v13 = [v5 dataForColumnName:@"value"];
    uint64_t v14 = v12;
    uint64_t v15 = (void *)a1[4];
    uint64_t v16 = *(void *)(a1[5] + 8);
    id obj = *(id *)(v16 + 40);
    id v17 = [v15 _convertToValueWithData:v13 valueType:v14 error:&obj];
    objc_storeStrong((id *)(v16 + 40), obj);
    [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v17 forKey:v11];
  }
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[AMSKeepAlive keepAliveWithName:@"AMSStorage"];
  if ((([v4 truncate] & 1) != 0
     || ([v4 close],
         [(AMSStorageDatabase *)self _cachePath],
         id v6 = objc_claimAutoreleasedReturnValue(),
         BOOL v7 = +[AMSDatabaseHelper removeDatabaseForCachePath:](AMSDatabaseHelper, "removeDatabaseForCachePath:", v6), v6, v7))&& +[AMSStorageDatabaseSchema createOrUpdateSchemaUsingConnection:v4])
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      uint64_t v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      uint64_t v13 = objc_opt_class();
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset AMSStorage database after corruption. This is bad!", (uint8_t *)&v12, 0xCu);
    }

    BOOL v8 = 0;
  }
  [v5 invalidate];

  return v8;
}

- (id)_allKeysPrefixedByDomainWithError:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__65;
  id v34 = __Block_byref_object_dispose__65;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__65;
  id v28 = __Block_byref_object_dispose__65;
  id v29 = (id)objc_opt_new();
  id v4 = objc_opt_new();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__AMSStorageDatabase__allKeysPrefixedByDomainWithError___block_invoke;
  v23[3] = &unk_1E55A6B80;
  v23[4] = self;
  v23[5] = &v30;
  v23[6] = &v24;
  [(AMSStorageDatabase *)self _performTransaction:v23];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = (id)v25[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v10 = (id *)(v31 + 5);
        id obj = (id)v31[5];
        uint64_t v11 = [(AMSStorageDatabase *)self allKeysForDomain:v9 withError:&obj];
        objc_storeStrong(v10, obj);
        if ([v11 count])
        {
          int v12 = NSString;
          uint64_t v13 = [v11 componentsJoinedByString:@";"];
          uint64_t v14 = [v12 stringWithFormat:@"%@:%@", v9, v13];

          [v4 addObject:v11];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v36 count:16];
    }
    while (v6);
  }

  if (a3)
  {
    uint64_t v15 = (void *)v31[5];
    if (v15) {
      *a3 = v15;
    }
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v4;
}

BOOL __56__AMSStorageDatabase__allKeysPrefixedByDomainWithError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__AMSStorageDatabase__allKeysPrefixedByDomainWithError___block_invoke_2;
  v4[3] = &unk_1E55A6B58;
  long long v5 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  [v2 executeQuery:@"SELECT DISTINCT domain FROM data;" withResults:v4];

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

void __56__AMSStorageDatabase__allKeysPrefixedByDomainWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    BOOL v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = objc_opt_class();
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__AMSStorageDatabase__allKeysPrefixedByDomainWithError___block_invoke_77;
    v9[3] = &unk_1E55A6B30;
    long long v10 = *(_OWORD *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 48);
    [a2 enumerateRowsUsingBlock:v9];
  }
}

void __56__AMSStorageDatabase__allKeysPrefixedByDomainWithError___block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    BOOL v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543618;
      uint64_t v11 = objc_opt_class();
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v9 = [a2 stringForColumnIndex:0];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v9];
  }
}

- (int64_t)_valueTypeForValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v4 = 2;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v4 = 3;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v4 = 4;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int64_t v4 = 5;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int64_t v4 = 6;
          }
          else if ([v3 conformsToProtocol:&unk_1EDD18BE0])
          {
            int64_t v4 = 7;
          }
          else
          {
            int64_t v4 = v3 == 0;
          }
        }
      }
    }
  }

  return v4;
}

- (id)_convertToDataWithValue:(id)a3 valueType:(int64_t)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = v8;
  switch(a4)
  {
    case 0:
    case 1:
      uint64_t v11 = +[AMSLogConfig sharedConfig];
      if (!v11)
      {
        uint64_t v11 = +[AMSLogConfig sharedConfig];
      }
      __int16 v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = objc_opt_class();
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Unsupported value can't be saved to the database. This path should not be reachable.", buf, 0xCu);
      }

      self = 0;
      break;
    case 2:
      id v13 = [NSString stringWithFormat:@"%@", v8];
      self = [v13 dataUsingEncoding:4];

      break;
    case 3:
    case 5:
    case 6:
      int v10 = [(AMSStorageDatabase *)self _dataForPlistValue:v8 error:a5];
      goto LABEL_10;
    case 4:
      int v10 = [v8 dataUsingEncoding:4];
LABEL_10:
      self = v10;
      break;
    case 7:
      uint64_t v14 = [v8 serializeToDictionary];
      self = [(AMSStorageDatabase *)self _dataForPlistValue:v14 error:a5];

      break;
    default:
      break;
  }

  return self;
}

- (id)_convertToValueWithData:(id)a3 valueType:(int64_t)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  switch(a4)
  {
    case 0:
    case 1:
      int v10 = +[AMSLogConfig sharedConfig];
      if (!v10)
      {
        int v10 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138543362;
        uint64_t v16 = objc_opt_class();
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Unsupported value should not have been saved to the database. This path should not be reachable.", (uint8_t *)&v15, 0xCu);
      }

      self = 0;
      break;
    case 2:
      __int16 v12 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
      id v13 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      self = [v13 numberFromString:v12];

      break;
    case 3:
    case 5:
    case 6:
    case 7:
      uint64_t v9 = [(AMSStorageDatabase *)self _plistValueForData:v8 error:a5];
      goto LABEL_3;
    case 4:
      uint64_t v9 = (AMSStorageDatabase *)[[NSString alloc] initWithData:v8 encoding:4];
LABEL_3:
      self = v9;
      break;
    default:
      break;
  }

  return self;
}

- (id)_dataForPlistValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([MEMORY[0x1E4F28F98] propertyList:v5 isValidForFormat:100])
  {
    id v25 = 0;
    uint64_t v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:100 options:0 error:&v25];
    id v12 = v25;
    id v18 = v12;
    if (v11)
    {
      id v19 = v11;
    }
    else
    {
      long long v21 = AMSErrorWithFormat(3, @"Error serializing data", @"Error serializing plist data in the AMSStorage database: %@", v13, v14, v15, v16, v17, (uint64_t)v12);
      long long v22 = v21;
      if (a4) {
        *a4 = v21;
      }
    }
  }
  else
  {
    long long v20 = AMSErrorWithFormat(3, @"AMSStorage invalid format", @"Trying to save invalid format in the AMSStorage database.", v6, v7, v8, v9, v10, v24);
    id v18 = v20;
    if (a4)
    {
      id v18 = v20;
      uint64_t v11 = 0;
      *a4 = v18;
    }
    else
    {
      uint64_t v11 = 0;
    }
  }

  return v11;
}

- (id)_plistValueForData:(id)a3 error:(id *)a4
{
  id v19 = 0;
  uint64_t v20 = 0;
  id v5 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:&v20 error:&v19];
  id v6 = v19;
  id v12 = v6;
  if (v5)
  {
    if (v20 == 100)
    {
      id v13 = v5;
    }
    else
    {
      uint64_t v16 = AMSErrorWithFormat(3, @"AMSStorage invalid format", @"Trying to read invalid format from the AMSStorage database.", v7, v8, v9, v10, v11, v18);

      if (a4)
      {
        id v12 = v16;
        id v13 = 0;
        *a4 = v12;
      }
      else
      {
        id v13 = 0;
        id v12 = v16;
      }
    }
  }
  else
  {
    uint64_t v14 = AMSErrorWithFormat(3, @"Error deserializing data", @"Error deserializing plist data in the AMSStorage database: %@", v7, v8, v9, v10, v11, (uint64_t)v6);
    uint64_t v15 = v14;
    if (a4) {
      *a4 = v14;
    }

    id v13 = 0;
  }

  return v13;
}

- (BOOL)_setValueData:(id)a3 valueType:(int64_t)a4 forKey:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__65;
  id v25 = __Block_byref_object_dispose__65;
  id v26 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__AMSStorageDatabase__setValueData_valueType_forKey_error___block_invoke;
  v16[3] = &unk_1E55A6C20;
  v16[4] = self;
  id v19 = &v21;
  id v12 = v11;
  id v17 = v12;
  int64_t v20 = a4;
  id v13 = v10;
  id v18 = v13;
  [(AMSStorageDatabase *)self _performTransaction:v16];
  uint64_t v14 = (void *)v22[5];
  if (a6 && v14) {
    *a6 = v14;
  }

  _Block_object_dispose(&v21, 8);
  return v14 == 0;
}

uint64_t __59__AMSStorageDatabase__setValueData_valueType_forKey_error___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v3 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__AMSStorageDatabase__setValueData_valueType_forKey_error___block_invoke_2;
  v14[3] = &unk_1E55A6BF8;
  int64_t v4 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 64);
  id v15 = v5;
  uint64_t v17 = v6;
  id v16 = *(id *)(a1 + 48);
  uint64_t v7 = objc_msgSend(v2, "executeStatement:error:bindings:", @"INSERT OR REPLACE INTO data (domain, key, valueType, value, lastModified) VALUES (?,?,?,?,?);",
         &obj,
         v14);
  objc_storeStrong((id *)(v3 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v10;
      __int16 v21 = 2114;
      uint64_t v22 = v11;
      __int16 v23 = 2114;
      uint64_t v24 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Inserting data for key: %{public}@ failed with error: %{public}@", buf, 0x20u);
    }
  }
  return v7;
}

void __59__AMSStorageDatabase__setValueData_valueType_forKey_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  int64_t v4 = [v3 domain];
  [v5 bindString:v4 atPosition:1];

  [v5 bindString:*(void *)(a1 + 40) atPosition:2];
  [v5 bindInt:*(unsigned int *)(a1 + 56) atPosition:3];
  [v5 bindData:*(void *)(a1 + 48) atPosition:4];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "bindDouble:atPosition:", 5);
}

- (void)_performTransaction:(id)a3
{
  id v4 = a3;
  id v5 = +[AMSKeepAlive keepAliveWithName:@"AMSStorage"];
  uint64_t v6 = [(AMSStorageDatabase *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AMSStorageDatabase__performTransaction___block_invoke;
  block[3] = &unk_1E559F7F0;
  id v10 = v5;
  id v11 = v4;
  block[4] = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_sync(v6, block);
}

void __42__AMSStorageDatabase__performTransaction___block_invoke(id *a1)
{
  v2 = [a1[4] connection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AMSStorageDatabase__performTransaction___block_invoke_2;
  v5[3] = &unk_1E55A4350;
  id v6 = a1[6];
  [v2 performTransaction:v5];

  uint64_t v3 = [a1[4] connection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__AMSStorageDatabase__performTransaction___block_invoke_3;
  v4[3] = &unk_1E55A4378;
  void v4[4] = a1[4];
  [v3 performTransaction:v4];

  [a1[5] invalidate];
}

uint64_t __42__AMSStorageDatabase__performTransaction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __42__AMSStorageDatabase__performTransaction___block_invoke_3(uint64_t a1)
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
    id v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = AMSLogableError(v3);
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Incremental vacuum failed. Error = %{public}@", buf, 0x16u);
    }
  }

  return v2;
}

+ (id)sharedDatabaseWithDomain:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[AMSStorageDatabase alloc] initWithDomain:v3];

  return v4;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

@end