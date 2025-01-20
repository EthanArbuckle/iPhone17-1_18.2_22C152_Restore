@interface AMSSQLiteConnection
- (AMSSQLiteConnection)initWithOptions:(id)a3;
- (AMSSQLiteConnectionDelegate)delegate;
- (AMSSQLiteConnectionOptions)options;
- (BOOL)_close;
- (BOOL)_executeStatement:(id)a3 error:(id *)a4;
- (BOOL)_executeWithError:(id *)a3 usingBlock:(id)a4;
- (BOOL)_openAndAllowRetry:(BOOL)a3 error:(id *)a4;
- (BOOL)_openWithError:(id *)a3;
- (BOOL)_performResetAfterCorruptionError;
- (BOOL)_resetAfterCorruptionError;
- (BOOL)_resetAfterIOError;
- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4;
- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4 bindings:(id)a5;
- (BOOL)executeStatement:(id)a3 error:(id *)a4;
- (BOOL)executeStatement:(id)a3 error:(id *)a4 bindings:(id)a5;
- (BOOL)finalizePreparedStatement:(id)a3 error:(id *)a4;
- (BOOL)truncate;
- (NSError)currentError;
- (id)_prepareStatement:(id)a3 error:(id *)a4;
- (id)_statementForPreparedStatement:(id)a3 error:(id *)a4;
- (id)_verifiedStatementForPreparedStatement:(id)a3 error:(id *)a4;
- (id)_verifiedStatementForSQL:(id)a3 error:(id *)a4;
- (id)prepareStatement:(id)a3 error:(id *)a4;
- (int64_t)lastChangeCount;
- (void)_finalizeAllStatements;
- (void)_flushAfterTransactionBlocks;
- (void)dealloc;
- (void)dispatchAfterTransaction:(id)a3;
- (void)executePreparedQuery:(id)a3 withResults:(id)a4;
- (void)executeQuery:(id)a3 withResults:(id)a4;
- (void)performTransaction:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AMSSQLiteConnection

- (void)performTransaction:(id)a3
{
  v9 = (uint64_t (**)(void))a3;
  int64_t transactionDepth = self->_transactionDepth;
  if (transactionDepth < 1)
  {
    if (![(AMSSQLiteConnection *)self executeStatement:@"BEGIN DEFERRED TRANSACTION" error:0])goto LABEL_12; {
    self->_int64_t transactionDepth = 1;
    }
    self->_transactionWantsRollback = 0;
  }
  else
  {
    self->_int64_t transactionDepth = transactionDepth + 1;
  }
  int v5 = v9[2]() ^ 1;
  int64_t v6 = self->_transactionDepth;
  if (self->_transactionWantsRollback) {
    int v5 = 1;
  }
  self->_transactionWantsRollback = v5;
  int64_t v7 = v6 - 1;
  self->_int64_t transactionDepth = v7;
  if (!v7)
  {
    if (v5) {
      v8 = @"ROLLBACK TRANSACTION";
    }
    else {
      v8 = @"COMMIT TRANSACTION";
    }
    [(AMSSQLiteConnection *)self executeStatement:v8 error:0];
    [(AMSSQLiteConnection *)self _flushAfterTransactionBlocks];
  }
LABEL_12:
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  return [(AMSSQLiteConnection *)self executeStatement:a3 error:a4 bindings:0];
}

- (void)_flushAfterTransactionBlocks
{
  afterTransactionBlocks = self->_afterTransactionBlocks;
  if (afterTransactionBlocks)
  {
    v4 = (void *)[(NSMutableArray *)afterTransactionBlocks copy];
    int v5 = self->_afterTransactionBlocks;
    self->_afterTransactionBlocks = 0;

    int64_t v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__AMSSQLiteConnection__flushAfterTransactionBlocks__block_invoke;
    block[3] = &unk_1E559EA90;
    id v9 = v4;
    id v7 = v4;
    dispatch_async(v6, block);
  }
}

- (void)executeQuery:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, AMSSQLiteQueryResults *, id))a4;
  id v12 = 0;
  v8 = [(AMSSQLiteConnection *)self _verifiedStatementForSQL:v6 error:&v12];
  id v9 = v12;
  v10 = [[AMSSQLitePreparedStatement alloc] initWithConnection:self->_database SQL:v6];
  if (v10) {
    [(NSMapTable *)self->_preparedStatements setObject:v8 forKey:v10];
  }
  if (v8) {
    v11 = [[AMSSQLiteQueryResults alloc] initWithStatement:v8];
  }
  else {
    v11 = 0;
  }
  v7[2](v7, v11, v9);
  [v8 finalizeStatement];
  if (v10) {
    [(NSMapTable *)self->_preparedStatements removeObjectForKey:v10];
  }
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  v8 = (void (**)(id, void *))a5;
  id v17 = 0;
  id v9 = a3;
  v10 = [(AMSSQLiteConnection *)self _verifiedStatementForSQL:v9 error:&v17];
  id v11 = v17;
  id v12 = [[AMSSQLitePreparedStatement alloc] initWithConnection:self->_database SQL:v9];

  if (v12) {
    [(NSMapTable *)self->_preparedStatements setObject:v10 forKey:v12];
  }
  if (!v10)
  {
    BOOL v13 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v8) {
    v8[2](v8, v10);
  }
  id v16 = v11;
  BOOL v13 = [(AMSSQLiteConnection *)self _executeStatement:v10 error:&v16];
  id v14 = v16;

  [v10 finalizeStatement];
  if (v12) {
    [(NSMapTable *)self->_preparedStatements removeObjectForKey:v12];
  }
  id v11 = v14;
  if (a4)
  {
LABEL_11:
    if (!v13) {
      *a4 = v11;
    }
  }
LABEL_13:

  return v13;
}

- (id)_verifiedStatementForSQL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v16 = 0;
  BOOL v7 = [(AMSSQLiteConnection *)self _openWithError:&v16];
  id v8 = v16;
  id v9 = v8;
  if (v7)
  {
    id v15 = v8;
    v10 = [(AMSSQLiteConnection *)self _prepareStatement:v6 error:&v15];
    id v11 = v15;

    if (v10)
    {
      if ([(AMSSQLiteConnectionOptions *)self->_options isReadOnly]
        && ([v10 isReadOnly] & 1) == 0)
      {
        uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:0x1EDCC2228 code:-7701 userInfo:0];

        [v10 finalizeStatement];
        id v12 = 0;
        id v11 = (id)v13;
      }
      else
      {
        id v12 = v10;
      }
    }
    else
    {
      id v12 = 0;
    }

    id v9 = v11;
    if (!a4) {
      goto LABEL_13;
    }
  }
  else
  {
    id v12 = 0;
    if (!a4) {
      goto LABEL_13;
    }
  }
  if (!v12) {
    *a4 = v9;
  }
LABEL_13:

  return v12;
}

- (BOOL)_openWithError:(id *)a3
{
  return [(AMSSQLiteConnection *)self _openAndAllowRetry:1 error:a3];
}

- (BOOL)_openAndAllowRetry:(BOOL)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  char v4 = 1;
  if (!self->_database)
  {
    BOOL v5 = a3;
    id v7 = 0;
    v31 = 0;
    uint64_t v8 = 67111936;
    char v9 = 1;
    do
    {
      char v10 = v9;
      id v11 = v7;
      *(_DWORD *)buf = 0;
      options = self->_options;
      id v30 = v7;
      char v4 = AMSSQLiteOpen(options, &v31, buf, &v30);
      id v7 = v30;

      if (v4)
      {
        self->_database = v31;
        goto LABEL_28;
      }
      uint8_t v13 = buf[0];
      if (!*(_DWORD *)buf)
      {
        id v14 = [v7 userInfo];
        id v15 = [v14 objectForKeyedSubscript:0x1EDCC2248];
        if (objc_opt_respondsToSelector())
        {
          id v16 = [v7 userInfo];
          id v17 = [v16 objectForKeyedSubscript:0x1EDCC2248];
          uint8_t v13 = [v17 longLongValue];
        }
        else
        {
          uint8_t v13 = 1;
        }

        uint64_t v8 = 67111936;
      }
      if (!v5) {
        break;
      }
      if (v13 > 0x1Au || ((1 << v13) & 0x4000C00) == 0) {
        break;
      }
      if (![(AMSSQLiteConnection *)self _performResetAfterCorruptionError]) {
        break;
      }
      char v9 = 0;
    }
    while ((v10 & 1) != 0);
    v19 = +[AMSLogConfig sharedConfig];
    if (!v19)
    {
      v19 = +[AMSLogConfig sharedConfig];
    }
    v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = AMSLogKey();
      v22 = NSString;
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = v23;
      if (v21)
      {
        uint64_t v8 = AMSLogKey();
        [v22 stringWithFormat:@"%@: [%@] ", v24, v8];
      }
      else
      {
        [v22 stringWithFormat:@"%@: ", v23];
      v25 = };
      v26 = [(AMSSQLiteConnectionOptions *)self->_options databasePath];
      v27 = AMSHashIfNeeded(v26);
      *(_DWORD *)buf = 138543874;
      v33 = v25;
      __int16 v34 = 2114;
      v35 = v27;
      __int16 v36 = 2112;
      id v37 = v7;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@Error opening database. path = %{public}@ | error = %@", buf, 0x20u);

      if (v21)
      {

        v25 = (void *)v8;
      }
    }
    if (a4) {
      *a4 = v7;
    }
LABEL_28:
  }
  return v4;
}

- (BOOL)_executeStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__AMSSQLiteConnection__executeStatement_error___block_invoke;
  v10[3] = &unk_1E55A6600;
  id v7 = v6;
  id v11 = v7;
  BOOL v8 = [(AMSSQLiteConnection *)self _executeWithError:a4 usingBlock:v10];
  if (v8) {
    [v7 reset];
  }

  return v8;
}

- (id)_prepareStatement:(id)a3 error:(id *)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__62;
  id v15 = __Block_byref_object_dispose__62;
  id v16 = 0;
  id v6 = a3;
  uint64_t v7 = [v6 UTF8String];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__AMSSQLiteConnection__prepareStatement_error___block_invoke;
  v10[3] = &unk_1E55A6628;
  v10[5] = &v11;
  v10[6] = v7;
  void v10[4] = self;
  [(AMSSQLiteConnection *)self _executeWithError:a4 usingBlock:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (BOOL)_executeWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = (unsigned __int8 (**)(id, uint8_t *))a4;
  BOOL v7 = 0;
  uint64_t v8 = 0;
  while (1)
  {
    while (1)
    {
      char v9 = (void *)MEMORY[0x192FA47D0]();
      buf[0] = 0;
      int v10 = v6[2](v6, buf);
      if ((v10 - 5) >= 2) {
        break;
      }
      if (v8 > 9)
      {
        uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:0x1EDCC2228 code:-7702 userInfo:0];
        goto LABEL_29;
      }
      ++v8;
      usleep(0xF4240u);
      int v11 = buf[0];
      if (v11)
      {
        id v13 = 0;
        if (!v7) {
          goto LABEL_31;
        }
LABEL_30:
        BOOL v7 = 1;
        goto LABEL_43;
      }
    }
    if (v10 <= 10) {
      break;
    }
    if (v10 <= 99)
    {
      if (v10 != 11 && v10 != 26) {
        goto LABEL_28;
      }
LABEL_21:
      AMSSQLiteGetCurrentError(self->_database);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      [(AMSSQLiteConnection *)self _resetAfterCorruptionError];
      if (v7) {
        goto LABEL_30;
      }
      goto LABEL_31;
    }
    if (v10 != 100)
    {
      if (v10 == 101)
      {
LABEL_27:
        id v13 = 0;
        goto LABEL_30;
      }
LABEL_28:
      uint64_t v15 = AMSSQLiteGetCurrentError(self->_database);
LABEL_29:
      id v13 = (id)v15;
      if (v7) {
        goto LABEL_30;
      }
      goto LABEL_31;
    }
    int v12 = buf[0];
    BOOL v7 = 1;
    if (v12)
    {
      id v13 = 0;
      goto LABEL_43;
    }
  }
  if (!v10) {
    goto LABEL_27;
  }
  if (v10 == 8) {
    goto LABEL_21;
  }
  if (v10 != 10) {
    goto LABEL_28;
  }
  AMSSQLiteGetCurrentError(self->_database);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [(AMSSQLiteConnection *)self _resetAfterIOError];
  if (v7) {
    goto LABEL_30;
  }
LABEL_31:
  id v16 = +[AMSLogConfig sharedConfig];
  if (!v16)
  {
    id v16 = +[AMSLogConfig sharedConfig];
  }
  id v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = AMSLogKey();
    v19 = NSString;
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = v20;
    if (v18)
    {
      AMSLogKey();
      self = (AMSSQLiteConnection *)objc_claimAutoreleasedReturnValue();
      [v19 stringWithFormat:@"%@: [%@] ", v21, self];
    }
    else
    {
      [v19 stringWithFormat:@"%@: ", v20];
    v22 = };
    uint64_t v23 = AMSLogableError(v13);
    *(_DWORD *)buf = 138543618;
    v26 = v22;
    __int16 v27 = 2114;
    v28 = v23;
    _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@Execution error: %{public}@", buf, 0x16u);
    if (v18)
    {

      v22 = self;
    }
  }
  if (a3)
  {
    id v13 = v13;
    BOOL v7 = 0;
    *a3 = v13;
  }
  else
  {
    BOOL v7 = 0;
  }
LABEL_43:

  return v7;
}

uint64_t __47__AMSSQLiteConnection__prepareStatement_error___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  uint64_t v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), *(const char **)(a1 + 48), -1, &ppStmt, 0);
  if (v2 - 100 < 2 || v2 == 0)
  {
    char v4 = [AMSSQLiteStatement alloc];
    uint64_t v5 = [(AMSSQLiteStatement *)v4 initWithStatement:ppStmt onConnection:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    sqlite3_finalize(ppStmt);
  }
  return v2;
}

uint64_t __47__AMSSQLiteConnection__executeStatement_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) step];
}

- (void)setDelegate:(id)a3
{
}

- (AMSSQLiteConnection)initWithOptions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSSQLiteConnection;
  uint64_t v5 = [(AMSSQLiteConnection *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    options = v5->_options;
    v5->_options = (AMSSQLiteConnectionOptions *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    preparedStatements = v5->_preparedStatements;
    v5->_preparedStatements = (NSMapTable *)v8;
  }
  return v5;
}

- (void)dealloc
{
  [(AMSSQLiteConnection *)self _close];
  v3.receiver = self;
  v3.super_class = (Class)AMSSQLiteConnection;
  [(AMSSQLiteConnection *)&v3 dealloc];
}

- (BOOL)_close
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_database) {
    return 1;
  }
  [(AMSSQLiteConnection *)self _finalizeAllStatements];
  int v3 = sqlite3_close(self->_database);
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      uint64_t v5 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543618;
      id v11 = (id)objc_opt_class();
      __int16 v12 = 1024;
      int v13 = v4;
      id v7 = v11;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to close the database: closeResult=%d", (uint8_t *)&v10, 0x12u);
    }
    return 0;
  }
  else
  {
    afterTransactionBlocks = self->_afterTransactionBlocks;
    self->_afterTransactionBlocks = 0;

    self->_database = 0;
    self->_int64_t transactionDepth = 0;
    BOOL result = 1;
    self->_transactionWantsRollback = 0;
  }
  return result;
}

- (void)_finalizeAllStatements
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v3 = [(NSMapTable *)self->_preparedStatements objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7++) finalizeStatement];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMapTable *)self->_preparedStatements removeAllObjects];
  stmt = sqlite3_next_stmt(self->_database, 0);
  if (stmt)
  {
    char v9 = stmt;
    do
    {
      sqlite3_finalize(v9);
      char v9 = sqlite3_next_stmt(self->_database, v9);
    }
    while (v9);
  }
}

- (id)prepareStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v15 = 0;
  BOOL v7 = [(AMSSQLiteConnection *)self _openWithError:&v15];
  id v8 = v15;
  char v9 = v8;
  if (v7)
  {
    id v14 = v8;
    long long v10 = [(AMSSQLiteConnection *)self _prepareStatement:v6 error:&v14];
    id v11 = v14;

    if (v10)
    {
      long long v12 = [[AMSSQLitePreparedStatement alloc] initWithConnection:self SQL:v6];
      [(NSMapTable *)self->_preparedStatements setObject:v10 forKey:v12];
    }
    else
    {
      long long v12 = 0;
    }

    char v9 = v11;
    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    long long v12 = 0;
    if (!a4) {
      goto LABEL_10;
    }
  }
  if (!v12) {
    *a4 = v9;
  }
LABEL_10:

  return v12;
}

- (BOOL)finalizePreparedStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0;
  BOOL v7 = [(AMSSQLiteConnection *)self _verifiedStatementForPreparedStatement:v6 error:&v13];
  id v8 = v13;
  if (v7)
  {
    int v9 = [v7 finalizeStatement];
    if ((v9 - 100) >= 2 && v9 != 0)
    {
      uint64_t v11 = AMSSQLiteGetCurrentError(self->_database);

      id v8 = (id)v11;
    }
    [(NSMapTable *)self->_preparedStatements removeObjectForKey:v6];
  }
  if (a4) {
    *a4 = v8;
  }

  return 0;
}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v16 = 0;
  int v9 = [(AMSSQLiteConnection *)self _verifiedStatementForPreparedStatement:a3 error:&v16];
  id v10 = v16;
  uint64_t v11 = v10;
  if (v9 && !v10)
  {
    if (v8) {
      v8[2](v8, v9);
    }
    id v15 = 0;
    BOOL v12 = [(AMSSQLiteConnection *)self _executeStatement:v9 error:&v15];
    id v13 = v15;
    if (v13)
    {
      uint64_t v11 = v13;
      if (!a4) {
        goto LABEL_16;
      }
      goto LABEL_14;
    }
    if (v8) {
      [v9 clearBindings];
    }
LABEL_13:
    [v9 reset];
    uint64_t v11 = 0;
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  BOOL v12 = 0;
  if (!v10) {
    goto LABEL_13;
  }
  if (!a4) {
    goto LABEL_16;
  }
LABEL_14:
  if (!v12) {
    *a4 = v11;
  }
LABEL_16:

  return v12;
}

- (id)_verifiedStatementForPreparedStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ((AMSSQLiteConnection *)[v6 connectionPointer] == self)
  {
    id v16 = 0;
    BOOL v9 = [(AMSSQLiteConnection *)self _openWithError:&v16];
    id v10 = v16;
    id v8 = v10;
    if (v9)
    {
      id v15 = v10;
      uint64_t v11 = [(AMSSQLiteConnection *)self _statementForPreparedStatement:v6 error:&v15];
      id v12 = v15;

      if (v11)
      {
        if ([(AMSSQLiteConnectionOptions *)self->_options isReadOnly]
          && ([v11 isReadOnly] & 1) == 0)
        {
          uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:0x1EDCC2228 code:-7701 userInfo:0];

          id v7 = 0;
          id v12 = (id)v13;
        }
        else
        {
          id v7 = v11;
        }
      }
      else
      {
        id v7 = 0;
      }

      id v8 = v12;
      if (!a4) {
        goto LABEL_16;
      }
    }
    else
    {
      id v7 = 0;
      if (!a4) {
        goto LABEL_16;
      }
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Statement from a different connection"];
    id v7 = 0;
    id v8 = 0;
    if (!a4) {
      goto LABEL_16;
    }
  }
  if (!v7) {
    *a4 = v8;
  }
LABEL_16:

  return v7;
}

- (id)_statementForPreparedStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSMapTable *)self->_preparedStatements objectForKey:v6];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = 0;
  }
  else
  {
    id v10 = [v6 SQL];
    id v12 = 0;
    id v8 = [(AMSSQLiteConnection *)self _prepareStatement:v10 error:&v12];
    id v9 = v12;

    if (v8)
    {
      [(NSMapTable *)self->_preparedStatements setObject:v8 forKey:v6];
    }
    else if (a4)
    {
      id v9 = v9;
      id v8 = 0;
      *a4 = v9;
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_afterTransactionBlocks, 0);
}

- (void)dispatchAfterTransaction:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_transactionDepth)
  {
    if (!self->_afterTransactionBlocks)
    {
      uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      afterTransactionBlocks = self->_afterTransactionBlocks;
      self->_afterTransactionBlocks = v5;
    }
    uint64_t v7 = (void *)[v10 copy];
    id v8 = self->_afterTransactionBlocks;
    id v9 = _Block_copy(v7);
    [(NSMutableArray *)v8 addObject:v9];
  }
  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

- (void)executePreparedQuery:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, AMSSQLiteQueryResults *, id))a4;
  id v11 = 0;
  id v8 = [(AMSSQLiteConnection *)self _verifiedStatementForPreparedStatement:v6 error:&v11];
  id v9 = v11;
  if (v8) {
    id v10 = [[AMSSQLiteQueryResults alloc] initWithStatement:v8];
  }
  else {
    id v10 = 0;
  }
  v7[2](v7, v10, v9);
  [v8 clearBindings];
  [v8 reset];
}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4
{
  return [(AMSSQLiteConnection *)self executePreparedStatement:a3 error:a4 bindings:0];
}

- (int64_t)lastChangeCount
{
  BOOL v3 = [(AMSSQLiteConnection *)self _openWithError:0];
  int64_t result = 0;
  if (v3) {
    return sqlite3_changes(self->_database);
  }
  return result;
}

- (BOOL)truncate
{
  if ([(AMSSQLiteConnectionOptions *)self->_options isReadOnly]) {
    return 0;
  }
  BOOL v3 = 0;
  if ([(AMSSQLiteConnection *)self _openAndAllowRetry:0 error:0])
  {
    [(AMSSQLiteConnection *)self _finalizeAllStatements];
    int v6 = 129;
    int v4 = sqlite3_file_control(self->_database, 0, 101, &v6);
    BOOL v3 = v4 == 0;
    if (!v4)
    {
      sqlite3_close(self->_database);
      self->_database = 0;
    }
  }
  return v3;
}

- (NSError)currentError
{
  database = self->_database;
  if (database)
  {
    AMSSQLiteGetCurrentError(database);
    database = (sqlite3 *)objc_claimAutoreleasedReturnValue();
  }
  return (NSError *)database;
}

void __51__AMSSQLiteConnection__flushAfterTransactionBlocks__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (BOOL)_performResetAfterCorruptionError
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    long long v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      long long v6 = +[AMSLogConfig sharedConfig];
    }
    long long v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v8 = objc_opt_class();
      options = self->_options;
      id v10 = v8;
      uint64_t v11 = [(AMSSQLiteConnectionOptions *)options databasePath];
      int v22 = 138543618;
      uint64_t v23 = v8;
      __int16 v24 = 2114;
      v25 = v11;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Asking delegate to reset database after corruption: %{public}@", (uint8_t *)&v22, 0x16u);
    }
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    char v13 = [v12 connectionNeedsResetForCorruption:self];
LABEL_14:
    BOOL v14 = v13;

    return v14;
  }
  if (![(AMSSQLiteConnectionOptions *)self->_options isReadOnly])
  {
    id v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      id v15 = +[AMSLogConfig sharedConfig];
    }
    id v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = objc_opt_class();
      v18 = self->_options;
      id v19 = v17;
      uint64_t v20 = [(AMSSQLiteConnectionOptions *)v18 databasePath];
      int v22 = 138543618;
      uint64_t v23 = v17;
      __int16 v24 = 2114;
      v25 = v20;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Truncating database after corruption: %{public}@", (uint8_t *)&v22, 0x16u);
    }
    id v12 = [(AMSSQLiteConnectionOptions *)self->_options databasePath];
    char v13 = AMSSQLiteTruncateDatabase(v12);
    goto LABEL_14;
  }
  return 0;
}

- (BOOL)_resetAfterCorruptionError
{
  if (self->_didResetForCorruption
    || (BOOL v3 = 1, self->_didResetForCorruption = 1, ![(AMSSQLiteConnection *)self _resetAfterIOError]))
  {
    [(AMSSQLiteConnection *)self _close];
    if ([(AMSSQLiteConnection *)self _performResetAfterCorruptionError])
    {
      self->_didResetForCorruption = 0;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (BOOL)_resetAfterIOError
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    BOOL v3 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    char v5 = objc_opt_class();
    options = self->_options;
    id v7 = v5;
    long long v8 = [(AMSSQLiteConnectionOptions *)options databasePath];
    int v14 = 138543618;
    id v15 = v5;
    __int16 v16 = 2114;
    id v17 = v8;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Reopening database after IO error: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  afterTransactionBlocks = self->_afterTransactionBlocks;
  id v10 = afterTransactionBlocks;
  int64_t transactionDepth = self->_transactionDepth;
  if ([(AMSSQLiteConnection *)self _close]
    && [(AMSSQLiteConnection *)self _openWithError:0])
  {
    if (!transactionDepth)
    {
      BOOL v12 = 1;
      goto LABEL_10;
    }
    if (!sqlite3_exec(self->_database, "BEGIN DEFERRED TRANSACTION", 0, 0, 0))
    {
      objc_storeStrong((id *)&self->_afterTransactionBlocks, afterTransactionBlocks);
      self->_int64_t transactionDepth = transactionDepth;
      BOOL v12 = 1;
      self->_transactionWantsRollback = 1;
      goto LABEL_10;
    }
  }
  BOOL v12 = 0;
LABEL_10:

  return v12;
}

- (AMSSQLiteConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSSQLiteConnectionDelegate *)WeakRetained;
}

- (AMSSQLiteConnectionOptions)options
{
  return self->_options;
}

@end