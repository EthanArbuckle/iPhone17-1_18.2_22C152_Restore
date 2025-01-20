@interface HMBSQLContext
+ (id)logCategory;
- (BOOL)fetchSQLite3:(sqlite3_stmt *)a3 error:(id *)a4 block:(id)a5;
- (BOOL)fetchSQLite3:(sqlite3_stmt *)a3 limit:(unint64_t)a4 error:(id *)a5 block:(id)a6;
- (BOOL)fetchSQLite3One:(sqlite3_stmt *)a3 error:(id *)a4 block:(id)a5;
- (BOOL)finalized;
- (BOOL)initializeNewlyCreatedDatabaseWithError:(id *)a3;
- (BOOL)prepareWithError:(id *)a3;
- (BOOL)runSQLite3:(const char *)a3 error:(id *)a4;
- (BOOL)setSchemaVersion:(int64_t)a3 error:(id *)a4;
- (HMBPreparedStatementsCache)preparedStatementsCache;
- (HMBSQLContext)initWithURL:(id)a3;
- (NSString)logIdentifier;
- (NSURL)url;
- (id)_performBlockWithContextManagedStatementForString:(const char *)a3 block:(id)a4;
- (id)attributeDescriptions;
- (id)begin;
- (id)commit;
- (id)execSQLite3:(sqlite3_stmt *)a3;
- (id)runSQLite3:(const char *)a3;
- (id)sqlBlockWithActivity:(id)a3 block:(id)a4;
- (id)sqlTransactionWithActivity:(id)a3 block:(id)a4;
- (int64_t)migrateFromSchemaVersion:(int64_t)a3 error:(id *)a4;
- (sqlite3)connection;
- (sqlite3_stmt)_statementForString:(const char *)a3 error:(id *)a4;
- (unint64_t)execSQLite3:(sqlite3_stmt *)a3 error:(id *)a4;
- (unint64_t)insertSQLite3:(sqlite3_stmt *)a3 error:(id *)a4;
- (void)dealloc;
- (void)finalize;
- (void)rollback;
- (void)setConnection:(sqlite3 *)a3;
- (void)setFinalized:(BOOL)a3;
- (void)setLogIdentifier:(id)a3;
@end

@implementation HMBSQLContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparedStatementsCache, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (BOOL)finalized
{
  return self->_finalized;
}

- (HMBPreparedStatementsCache)preparedStatementsCache
{
  return self->_preparedStatementsCache;
}

- (void)setConnection:(sqlite3 *)a3
{
  self->_connection = a3;
}

- (sqlite3)connection
{
  return self->_connection;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setLogIdentifier:(id)a3
{
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:", -[HMBSQLContext connection](self, "connection"));
  v5 = (void *)[v3 initWithName:@"Context" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMBSQLContext *)self url];
  v8 = (void *)[v6 initWithName:@"URL" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (BOOL)fetchSQLite3One:(sqlite3_stmt *)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v8 = (void (**)(id, sqlite3_stmt *))a5;
  if (a4 && *a4)
  {
    v9 = (void *)MEMORY[0x1D944CB30]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = HMFGetLogIdentifier();
      id v13 = *a4;
      int v23 = 138543618;
      v24 = v12;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring fetch due to previous error: %@", (uint8_t *)&v23, 0x16u);
    }
    goto LABEL_6;
  }
  int v15 = sqlite3_step(a3);
  if (v15 == 101)
  {
LABEL_10:
    int v16 = sqlite3_reset(a3);
    BOOL v14 = 0;
    if (!a4 || !v16) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (v15 != 100)
  {
    if (!v15) {
      goto LABEL_10;
    }
    sqlite3_reset(a3);
    if (a4)
    {
LABEL_18:
      v19 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:a3];
LABEL_19:
      BOOL v14 = 0;
      *a4 = v19;
      goto LABEL_20;
    }
LABEL_6:
    BOOL v14 = 0;
    goto LABEL_20;
  }
  uint64_t v17 = v8[2](v8, a3);
  if (v17)
  {
    v18 = (void *)v17;
    sqlite3_reset(a3);
    if (a4) {
      *a4 = v18;
    }

    goto LABEL_6;
  }
  int v21 = sqlite3_step(a3);
  if (v21 != 101)
  {
    if (v21 == 100)
    {
      sqlite3_reset(a3);
      if (a4)
      {
        v19 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
        goto LABEL_19;
      }
      goto LABEL_6;
    }
    if (v21)
    {
      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:a3];
      }
      sqlite3_reset(a3);
      goto LABEL_6;
    }
  }
  int v22 = sqlite3_reset(a3);
  BOOL v14 = v22 == 0;
  if (v22 && a4) {
    goto LABEL_18;
  }
LABEL_20:

  return v14;
}

- (BOOL)fetchSQLite3:(sqlite3_stmt *)a3 limit:(unint64_t)a4 error:(id *)a5 block:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v10 = (void (**)(id, sqlite3_stmt *, int *))a6;
  if (a5 && *a5)
  {
    v11 = (void *)MEMORY[0x1D944CB30]();
    v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      BOOL v14 = HMFGetLogIdentifier();
      id v15 = *a5;
      int v23 = 138543618;
      v24 = v14;
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring fetch due to previous error: %@", (uint8_t *)&v23, 0x16u);
    }
LABEL_28:
    BOOL v21 = 0;
  }
  else
  {
    LOBYTE(v23) = 0;
    while (1)
    {
      int v16 = sqlite3_step(a3);
      if (v16 != 100) {
        break;
      }
      if (a4 == -1)
      {
        if ((_BYTE)v23) {
          goto LABEL_21;
        }
        a4 = -1;
      }
      else
      {
        BOOL v17 = a4-- != 0;
        if (!v17 || (_BYTE)v23) {
          goto LABEL_21;
        }
      }
      uint64_t v18 = v10[2](v10, a3, &v23);
      if (v18)
      {
        v19 = (void *)v18;
        sqlite3_reset(a3);
        if (a5) {
          *a5 = v19;
        }

        goto LABEL_28;
      }
    }
    if (v16 && v16 != 101)
    {
      if (a5)
      {
        *a5 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:a3];
      }
      sqlite3_reset(a3);
      goto LABEL_28;
    }
LABEL_21:
    int v20 = sqlite3_reset(a3);
    BOOL v21 = 1;
    if ((v20 - 100) >= 2 && v20)
    {
      if (!a5) {
        goto LABEL_28;
      }
      [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:a3];
      BOOL v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v21;
}

- (BOOL)fetchSQLite3:(sqlite3_stmt *)a3 error:(id *)a4 block:(id)a5
{
  return [(HMBSQLContext *)self fetchSQLite3:a3 limit:-1 error:a4 block:a5];
}

- (unint64_t)insertSQLite3:(sqlite3_stmt *)a3 error:(id *)a4
{
  if (!a4)
  {
    if (sqlite3_step(a3) == 101) {
      goto LABEL_7;
    }
    sqlite3_reset(a3);
    return 0;
  }
  if (*a4) {
    return 0;
  }
  if (sqlite3_step(a3) != 101)
  {
    *a4 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:a3];
    if (sqlite3_reset(a3))
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
LABEL_13:
      id v11 = [v6 hmbErrorWithSQLite3Statement:a3];
      unint64_t result = 0;
      *a4 = v11;
      return result;
    }
    return 0;
  }
LABEL_7:
  v7 = sqlite3_db_handle(a3);
  sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(v7);
  int v9 = sqlite3_reset(a3);
  if (v9) {
    unint64_t result = 0;
  }
  else {
    unint64_t result = insert_rowid;
  }
  if (a4 && v9)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    goto LABEL_13;
  }
  return result;
}

- (BOOL)runSQLite3:(const char *)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a4 || !*a4)
  {
    if (sqlite3_exec(self->_connection, a3, 0, 0, 0))
    {
      v8 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Connection:self->_connection statement:a3];
      int v9 = (void *)MEMORY[0x1D944CB30]();
      v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        int v14 = 138543874;
        id v15 = v12;
        __int16 v16 = 2080;
        BOOL v17 = a3;
        __int16 v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to run SQL statement %s: %@", (uint8_t *)&v14, 0x20u);
      }
      if (!a4) {
        goto LABEL_9;
      }
    }
    else
    {
      v8 = 0;
      if (!a4) {
        goto LABEL_9;
      }
    }
    *a4 = v8;
LABEL_9:
    BOOL v7 = v8 == 0;

    return v7;
  }
  return 0;
}

- (unint64_t)execSQLite3:(sqlite3_stmt *)a3 error:(id *)a4
{
  return __execSQLite3(self, a3, a4);
}

- (id)execSQLite3:(sqlite3_stmt *)a3
{
  id v5 = 0;
  __execSQLite3(self, a3, &v5);
  id v3 = v5;
  return v3;
}

- (id)runSQLite3:(const char *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = __removeExtraWhitespace(a3);
  connection = self->_connection;
  id v7 = v5;
  if (sqlite3_exec(connection, (const char *)[v7 UTF8String], 0, 0, 0))
  {
    v8 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Connection:self->_connection statement:a3];
    int v9 = (void *)MEMORY[0x1D944CB30]();
    v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v14 = 138543874;
      id v15 = v12;
      __int16 v16 = 2080;
      BOOL v17 = a3;
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to run SQL statement %s: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)rollback
{
  if (!sqlite3_get_autocommit(self->_connection)) {
    id v3 = objc_unsafeClaimAutoreleasedReturnValue(-[HMBSQLContext _performBlockWithContextManagedStatementForString:block:](self, "_performBlockWithContextManagedStatementForString:block:", "ROLLBACK;",
  }
             &__block_literal_global_25));
}

uint64_t __25__HMBSQLContext_rollback__block_invoke(int a1, sqlite3_stmt *a2)
{
  return 0;
}

- (id)commit
{
  if (sqlite3_get_autocommit(self->_connection))
  {
    id v3 = 0;
  }
  else
  {
    -[HMBSQLContext _performBlockWithContextManagedStatementForString:block:](self, "_performBlockWithContextManagedStatementForString:block:", "COMMIT;",
    id v3 = &__block_literal_global_22);
  }
  return v3;
}

id __23__HMBSQLContext_commit__block_invoke(int a1, sqlite3_stmt *a2)
{
  if (sqlite3_step(a2) == 101)
  {
    if (sqlite3_reset(a2))
    {
      id v3 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:a2];
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:a2];
    sqlite3_reset(a2);
  }
  return v3;
}

- (id)begin
{
  return -[HMBSQLContext _performBlockWithContextManagedStatementForString:block:](self, "_performBlockWithContextManagedStatementForString:block:", "BEGIN;",
           &__block_literal_global);
}

id __22__HMBSQLContext_begin__block_invoke(int a1, sqlite3_stmt *a2)
{
  if (sqlite3_step(a2) == 101)
  {
    if (sqlite3_reset(a2))
    {
      id v3 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:a2];
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:a2];
    sqlite3_reset(a2);
  }
  return v3;
}

- (id)sqlTransactionWithActivity:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, HMBSQLContext *))a4;
  os_unfair_lock_lock_with_options();
  v8 = [(HMBSQLContext *)self begin];
  int v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = v7[2](v7, self);
    if (v11)
    {
      [(HMBSQLContext *)self rollback];
      id v10 = v11;
    }
    else
    {
      id v10 = [(HMBSQLContext *)self commit];
      if (v10)
      {
        [(HMBSQLContext *)self rollback];
        id v12 = v10;
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
  return v10;
}

- (id)sqlBlockWithActivity:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, HMBSQLContext *))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int v9 = v7[2](v7, self);
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (BOOL)setSchemaVersion:(int64_t)a3 error:(id *)a4
{
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %ld", a3);;
  id v7 = [(HMBSQLContext *)self connection];
  id v8 = v6;
  int v9 = (const char *)[v8 UTF8String];
  id v14 = 0;
  id v10 = selectSQLite3(v7, v9, MEMORY[0x1E4F1CC08], &v14);
  id v11 = v14;
  id v12 = v11;
  if (a4 && !v10) {
    *a4 = v11;
  }

  return v10 != 0;
}

- (int64_t)migrateFromSchemaVersion:(int64_t)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  BOOL v5 = -[HMBSQLContext prepareWithError:](self, "prepareWithError:", &v13, a4);
  id v6 = v13;
  if (v5)
  {
    int64_t v7 = 3;
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D944CB30]();
    int v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare tables after migration: %@", buf, 0x16u);
    }
    int64_t v7 = [v6 hmbIsSQLiteDatabaseCorruptedError];
  }

  return v7;
}

- (BOOL)prepareWithError:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HMBSQLContext *)self runSQLite3:"PRAGMA foreign_keys = ON"];;
  if (!v5)
  {
    [NSString stringWithFormat:@"PRAGMA cache_size = %@;", &unk_1F2C4C9A8];
    id v12 = objc_claimAutoreleasedReturnValue();
    uint64_t v13 = -[HMBSQLContext runSQLite3:](self, "runSQLite3:", [v12 UTF8String]);
    if (v13)
    {
      id v6 = (id)v13;
      id v14 = (void *)MEMORY[0x1D944CB30]();
      id v15 = self;
      __int16 v16 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      int v23 = v17;
      __int16 v24 = 2048;
      uint64_t v25 = 512;
      __int16 v26 = 2114;
      id v27 = v6;
      uint64_t v18 = "%{public}@Failed to set sqlite cache size to %ld: %{public}@";
      v19 = v16;
      uint32_t v20 = 32;
    }
    else
    {
      id v6 = [(HMBSQLContext *)self runSQLite3:"PRAGMA integrity_check;"];
      if (!v6)
      {
        BOOL v11 = 1;
LABEL_18:

        goto LABEL_19;
      }
      id v14 = (void *)MEMORY[0x1D944CB30]();
      id v15 = self;
      __int16 v16 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        if (a3)
        {
          id v6 = v6;
          BOOL v11 = 0;
          *a3 = v6;
        }
        else
        {
          BOOL v11 = 0;
        }
        goto LABEL_18;
      }
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v23 = v17;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v6;
      uint64_t v18 = "%{public}@Failed integrity check %@";
      v19 = v16;
      uint32_t v20 = 22;
    }
    _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);

    goto LABEL_14;
  }
  id v6 = (id)v5;
  int64_t v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = self;
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v23 = v10;
    __int16 v24 = 2114;
    uint64_t v25 = (uint64_t)v6;
    _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to turn on foreign key enforcement: %{public}@", buf, 0x16u);
  }
  if (a3)
  {
    id v6 = v6;
    BOOL v11 = 0;
    *a3 = v6;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_19:

  return v11;
}

- (BOOL)initializeNewlyCreatedDatabaseWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  BOOL v5 = [(HMBSQLContext *)self prepareWithError:&v12];
  id v6 = v12;
  if (!v5)
  {
    int64_t v7 = (void *)MEMORY[0x1D944CB30]();
    id v8 = self;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare context during newly created database initialization: %@", buf, 0x16u);
    }
    if (a3) {
      *a3 = v6;
    }
  }

  return v5;
}

- (void)finalize
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944CB30](self, a2);
  v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v6;
    __int16 v19 = 2112;
    uint32_t v20 = v4;
    _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Finalizing %@", buf, 0x16u);
  }
  os_unfair_lock_assert_owner(&v4->_lock);
  if (v4->_finalized) {
    _HMFPreconditionFailure();
  }
  v4->_finalized = 1;
  int64_t v7 = [(HMBPreparedStatementsCache *)v4->_preparedStatementsCache evictAllStatements];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        sqlite3_finalize(*(sqlite3_stmt **)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)_performBlockWithContextManagedStatementForString:(const char *)a3 block:(id)a4
{
  id v6 = (void (**)(id, sqlite3_stmt *))a4;
  os_unfair_lock_assert_owner(&self->_lock);
  id v13 = 0;
  int64_t v7 = [(HMBSQLContext *)self _statementForString:a3 error:&v13];
  id v8 = v13;
  uint64_t v9 = v8;
  if (v7)
  {
    v6[2](v6, v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v8;
  }
  uint64_t v11 = v10;

  return v11;
}

- (sqlite3_stmt)_statementForString:(const char *)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_finalized)
  {
    int64_t v7 = (void *)MEMORY[0x1D944CB30]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v10;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_ERROR, "%{public}@requested to prepare SQL statement when the context has already been marked finalized", buf, 0xCu);
    }
    return 0;
  }
  else
  {
    long long v12 = (void *)[[NSString alloc] initWithUTF8String:a3];
    uint64_t v11 = [(HMBPreparedStatementsCache *)self->_preparedStatementsCache statementForString:v12];
    if (!v11)
    {
      if ([(HMBPreparedStatementsCache *)self->_preparedStatementsCache count] >= 0xA) {
        sqlite3_finalize([(HMBPreparedStatementsCache *)self->_preparedStatementsCache evictLeastRecentlyUsedStatement]);
      }
      id v19 = 0;
      uint64_t v11 = prepareSQLite3([(HMBSQLContext *)self connection], a3, &v19);
      id v13 = v19;
      if (v11)
      {
        [(HMBPreparedStatementsCache *)self->_preparedStatementsCache setStatement:v11 forString:v12];
      }
      else
      {
        long long v14 = (void *)MEMORY[0x1D944CB30]();
        long long v15 = self;
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v21 = v17;
          __int16 v22 = 2112;
          id v23 = v13;
          _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_ERROR, "%{public}@unable to prepare SQL statement: %@", buf, 0x16u);
        }
        uint64_t v11 = 0;
        if (a4) {
          *a4 = v13;
        }
      }
    }
  }
  return v11;
}

- (void)dealloc
{
  if (!self->_finalized) {
    +[HMBSQLFile close:self];
  }
  v3.receiver = self;
  v3.super_class = (Class)HMBSQLContext;
  [(HMBSQLContext *)&v3 dealloc];
}

- (HMBSQLContext)initWithURL:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMBSQLContext;
  id v6 = [(HMBSQLContext *)&v16 init];
  int64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    id v8 = [v5 scheme];
    int v9 = [v8 isEqualToString:@"memory"];

    if (v9) {
      [v5 description];
    }
    else {
    uint64_t v10 = [v5 lastPathComponent];
    }
    logIdentifier = v7->_logIdentifier;
    v7->_logIdentifier = (NSString *)v10;

    long long v12 = objc_alloc_init(HMBPreparedStatementsCache);
    preparedStatementsCache = v7->_preparedStatementsCache;
    v7->_preparedStatementsCache = v12;

    long long v14 = v7;
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20 != -1) {
    dispatch_once(&logCategory__hmf_once_t20, &__block_literal_global_28);
  }
  v2 = (void *)logCategory__hmf_once_v21;
  return v2;
}

uint64_t __28__HMBSQLContext_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v21;
  logCategory__hmf_once_uint64_t v21 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end