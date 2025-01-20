@interface AMSEngagementCacheDatabase
- (AMSSQLiteConnection)connection;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)collectGarbageWithError:(id *)a3;
- (BOOL)connectionNeedsResetForCorruption:(id)a3;
- (BOOL)insertResponseData:(id)a3 filterData:(id)a4 expiration:(id)a5 error:(id *)a6;
- (BOOL)openAtPath:(id)a3 error:(id *)a4;
- (BOOL)selectWithExpirationDate:(id)a3 handler:(id)a4 error:(id *)a5;
- (void)_performTransaction:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation AMSEngagementCacheDatabase

- (BOOL)closeWithError:(id *)a3
{
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = +[AMSKeepAlive keepAliveWithName:v6];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__AMSEngagementCacheDatabase_closeWithError___block_invoke;
  aBlock[3] = &unk_1E559EA90;
  id v8 = v7;
  id v16 = v8;
  v9 = (void (**)(void))_Block_copy(aBlock);
  v10 = [(AMSEngagementCacheDatabase *)self connection];
  int v11 = [v10 close];

  if (v11)
  {
    [(AMSEngagementCacheDatabase *)self setConnection:0];
  }
  else if (a3)
  {
    AMSError(16, @"Close Failure", @"Failed to close Engagement cache database.", 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = [(AMSEngagementCacheDatabase *)self connection];
  BOOL v13 = v12 == 0;

  v9[2](v9);
  return v13;
}

uint64_t __45__AMSEngagementCacheDatabase_closeWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (BOOL)collectGarbageWithError:(id *)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AMSEngagementCacheDatabase_collectGarbageWithError___block_invoke;
  v5[3] = &unk_1E55A2508;
  v5[4] = &v6;
  v5[5] = a3;
  [(AMSEngagementCacheDatabase *)self _performTransaction:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AMSEngagementCacheDatabase_collectGarbageWithError___block_invoke(uint64_t a1, void *a2)
{
  char v3 = (objc_class *)NSString;
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithFormat:@"DELETE FROM %@ WHERE %@ < ?", 0x1EDCB2968, 0x1EDCB2988];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v6 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__AMSEngagementCacheDatabase_collectGarbageWithError___block_invoke_2;
  v10[3] = &__block_descriptor_40_e28_v16__0___AMSSQLiteBinding__8l;
  v10[4] = v7;
  char v8 = [v4 executeStatement:v5 error:v6 bindings:v10];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
  return 1;
}

uint64_t __54__AMSEngagementCacheDatabase_collectGarbageWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindDouble:1 atPosition:*(double *)(a1 + 32)];
}

- (BOOL)insertResponseData:(id)a3 filterData:(id)a4 expiration:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__AMSEngagementCacheDatabase_insertResponseData_filterData_expiration_error___block_invoke;
  v17[3] = &unk_1E55A2530;
  id v18 = v10;
  id v19 = v12;
  id v20 = v11;
  v21 = a6;
  id v13 = v11;
  id v14 = v12;
  id v15 = v10;
  [(AMSEngagementCacheDatabase *)self _performTransaction:v17];

  return 1;
}

uint64_t __77__AMSEngagementCacheDatabase_insertResponseData_filterData_expiration_error___block_invoke(uint64_t a1, void *a2)
{
  char v3 = (objc_class *)NSString;
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithFormat:@"INSERT INTO %@ (%@, %@, %@) VALUES (?,?,?)", 0x1EDCB2968, 0x1EDCAAC28, 0x1EDCB2988, 0x1EDCB2808];
  uint64_t v6 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__AMSEngagementCacheDatabase_insertResponseData_filterData_expiration_error___block_invoke_2;
  v9[3] = &unk_1E55A1338;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  uint64_t v7 = [v4 executeStatement:v5 error:v6 bindings:v9];

  return v7;
}

void __77__AMSEngagementCacheDatabase_insertResponseData_filterData_expiration_error___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 bindData:v3 atPosition:1];
  [v4 bindDate:a1[5] atPosition:2];
  [v4 bindData:a1[6] atPosition:3];
}

- (BOOL)selectWithExpirationDate:(id)a3 handler:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__AMSEngagementCacheDatabase_selectWithExpirationDate_handler_error___block_invoke;
  v13[3] = &unk_1E55A25A8;
  id v10 = v8;
  id v16 = &v18;
  v17 = a5;
  id v14 = v10;
  id v11 = v9;
  id v15 = v11;
  [(AMSEngagementCacheDatabase *)self _performTransaction:v13];
  LOBYTE(self) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)self;
}

uint64_t __69__AMSEngagementCacheDatabase_selectWithExpirationDate_handler_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithFormat:@"SELECT %@, %@ FROM %@ WHERE %@ > ?", 0x1EDCAAC28, 0x1EDCB2808, 0x1EDCB2968, 0x1EDCB2988];
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__AMSEngagementCacheDatabase_selectWithExpirationDate_handler_error___block_invoke_2;
  v10[3] = &unk_1E55A2580;
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v13 = v6;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v11 = v9;
  [v4 executeQuery:v5 withResults:v10];

  return 1;
}

void __69__AMSEngagementCacheDatabase_selectWithExpirationDate_handler_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = v5;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    double v7 = *(double *)(a1 + 56);
    id v8 = a2;
    [v8 bindDouble:1 atPosition:v7];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__AMSEngagementCacheDatabase_selectWithExpirationDate_handler_error___block_invoke_3;
    v11[3] = &unk_1E55A2558;
    uint64_t v13 = *(void *)(a1 + 48);
    long long v10 = *(_OWORD *)(a1 + 32);
    id v9 = (id)v10;
    long long v12 = v10;
    [v8 enumerateRowsUsingBlock:v11];
  }
}

void __69__AMSEngagementCacheDatabase_selectWithExpirationDate_handler_error___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = v7;
  if (v7)
  {
    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = v7;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    if (a4) {
      *a4 = 1;
    }
  }
  else
  {
    id v9 = [v11 dataForColumnIndex:0];
    long long v10 = [v11 dataForColumnIndex:1];
    if (a4) {
      *a4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (BOOL)openAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = +[AMSKeepAlive keepAliveWithName:v8];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__AMSEngagementCacheDatabase_openAtPath_error___block_invoke;
  aBlock[3] = &unk_1E559EA90;
  id v10 = v9;
  id v18 = v10;
  id v11 = (void (**)(void))_Block_copy(aBlock);
  long long v12 = [[AMSSQLiteConnectionOptions alloc] initWithDatabasePath:v6];
  uint64_t v13 = [[AMSSQLiteConnection alloc] initWithOptions:v12];
  [(AMSSQLiteConnection *)v13 setDelegate:self];
  if (+[AMSEngagementCacheDatabaseSchema createOrUpdateSchemaUsingConnection:v13])
  {
    [(AMSEngagementCacheDatabase *)self setConnection:v13];
  }
  else if (a4)
  {
    AMSError(16, @"Open Failure", @"Failed to open Engagement cache database.", 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v14 = [(AMSEngagementCacheDatabase *)self connection];
  BOOL v15 = v14 != 0;

  v11[2](v11);
  return v15;
}

uint64_t __47__AMSEngagementCacheDatabase_openAtPath_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = +[AMSKeepAlive keepAliveWithName:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__AMSEngagementCacheDatabase_connectionNeedsResetForCorruption___block_invoke;
  aBlock[3] = &unk_1E559EA90;
  id v7 = v6;
  id v24 = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  if (([v3 truncate] & 1) == 0)
  {
    [v3 close];
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = [v3 options];
    id v11 = [v10 databasePath];
    id v22 = 0;
    int v12 = [v9 removeItemAtPath:v11 error:&v22];
    id v13 = v22;

    if (!v12)
    {
      BOOL v15 = +[AMSLogConfig sharedConfig];
      if (!v15)
      {
        BOOL v15 = +[AMSLogConfig sharedConfig];
      }
      id v16 = [v15 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v17;
        _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset Engagement database after corruption. This is bad!", buf, 0xCu);
      }

      goto LABEL_11;
    }
  }
  if (+[AMSEngagementCacheDatabaseSchema createOrUpdateSchemaUsingConnection:v3])
  {
    BOOL v14 = 1;
    goto LABEL_16;
  }
LABEL_11:
  id v18 = +[AMSLogConfig sharedConfig];
  if (!v18)
  {
    id v18 = +[AMSLogConfig sharedConfig];
  }
  id v19 = [v18 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v20;
    _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset Engagement database after corruption. This is bad!", buf, 0xCu);
  }

  BOOL v14 = 0;
LABEL_16:
  v8[2](v8);

  return v14;
}

uint64_t __64__AMSEngagementCacheDatabase_connectionNeedsResetForCorruption___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_performTransaction:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = +[AMSKeepAlive keepAliveWithName:v6];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__AMSEngagementCacheDatabase__performTransaction___block_invoke;
  aBlock[3] = &unk_1E559EA90;
  id v8 = v7;
  id v17 = v8;
  id v9 = (void (**)(void))_Block_copy(aBlock);
  id v10 = [(AMSEngagementCacheDatabase *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__AMSEngagementCacheDatabase__performTransaction___block_invoke_2;
  v13[3] = &unk_1E55A25D0;
  id v11 = v4;
  id v15 = v11;
  id v12 = v10;
  id v14 = v12;
  [v12 performTransaction:v13];

  v9[2](v9);
}

uint64_t __50__AMSEngagementCacheDatabase__performTransaction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __50__AMSEngagementCacheDatabase__performTransaction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (AMSSQLiteConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end