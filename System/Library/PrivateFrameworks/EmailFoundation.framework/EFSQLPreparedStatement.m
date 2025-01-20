@interface EFSQLPreparedStatement
+ (id)log;
- (BOOL)clearBindingsWithError:(id *)a3;
- (BOOL)executeUsingBlock:(id)a3 error:(id *)a4;
- (BOOL)executeWithIndexedBindings:(id)a3 usingBlock:(id)a4 error:(id *)a5;
- (BOOL)executeWithNamedBindings:(id)a3 rowsChanged:(unint64_t *)a4 error:(id *)a5;
- (BOOL)executeWithNamedBindings:(id)a3 usingBlock:(id)a4 error:(id *)a5;
- (BOOL)finalizeWithError:(id *)a3;
- (BOOL)isFinalized;
- (BOOL)resetWithError:(id *)a3;
- (EFSQLPreparedStatement)initWithString:(id)a3 connection:(id)a4 transactionLabel:(id)a5 queryLogger:(id)a6;
- (EFSQLQueryLogging)queryLogger;
- (NSString)originalString;
- (NSString)transactionLabel;
- (double)allowedExecutionTime;
- (id)debugDescription;
- (sqlite3_stmt)compiled;
- (void)dealloc;
- (void)setAllowedExecutionTime:(double)a3;
- (void)setQueryLogger:(id)a3;
- (void)setTransactionLabel:(id)a3;
@end

@implementation EFSQLPreparedStatement

- (BOOL)executeUsingBlock:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, EFSQLRow *, uint64_t, char *))a3;
  v6 = self;
  v7 = [(EFSQLPreparedStatement *)v6 compiled];
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v9 = 0;
  v44 = 0;
  char v46 = 0;
  double v10 = 0.0;
  while (1)
  {
    uint64_t v11 = sqlite3_step(v7);
    uint64_t v12 = v11;
    if (v11 != 100) {
      break;
    }
    if (v5)
    {
      if (!v44) {
        v44 = [[EFSQLRow alloc] initWithPreparedStatement:v6];
      }
      v13 = (void *)MEMORY[0x1BA9A5240]();
      v5[2](v5, v44, v9, &v46);
      if (!v9) {
        double v10 = CFAbsoluteTimeGetCurrent() - Current;
      }
      if (v46)
      {
        uint64_t v12 = 100;
        goto LABEL_13;
      }
      ++v9;
    }
  }
  if (v11 && v11 != 101)
  {
    v14 = sqlite3_db_handle(v7);
    uint64_t v12 = sqlite3_extended_errcode(v14);
  }
LABEL_13:
  double v15 = CFAbsoluteTimeGetCurrent();
  v16 = [(EFSQLPreparedStatement *)v6 originalString];
  double v17 = v15 - Current;
  if (EFSQLVerboseDebugLoggingEnabled())
  {
    v18 = +[EFSQLPreparedStatement log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[EFSQLPreparedStatement executeUsingBlock:error:].cold.5((uint64_t)v16, v18, v17);
    }
  }
  if (v17 > v6->_allowedExecutionTime)
  {
    v19 = +[EFSQLPreparedStatement log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      double allowedExecutionTime = v6->_allowedExecutionTime;
      *(_DWORD *)v51 = 134218498;
      double v52 = allowedExecutionTime;
      __int16 v53 = 2048;
      double v54 = v17;
      __int16 v55 = 2112;
      v56 = v16;
      _os_log_error_impl(&dword_1B5A59000, v19, OS_LOG_TYPE_ERROR, "Query execution exceeded threshold of %.02f seconds - Took %0.05f seconds for query %@", v51, 0x20u);
    }

    if (v17 > 2.0 && v12 == 101)
    {
      uint64_t v20 = [v16 rangeOfString:@"WHERE"];
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v21 = +[EFSQLPreparedStatement log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[EFSQLPreparedStatement executeUsingBlock:error:]((uint64_t)v6, (uint64_t)v16, v21);
        }
      }
      else
      {
        v21 = +[EFSQLPreparedStatement log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = [v16 substringFromIndex:v20];
          [(EFSQLPreparedStatement *)(uint64_t)v6 executeUsingBlock:v51 error:v21];
        }
      }

      id v42 = [NSString stringWithFormat:@"EXPLAIN QUERY PLAN %@", v16];
      v23 = sqlite3_db_handle(v7);
      ppStmt = 0;
      id v24 = v42;
      uint64_t v25 = sqlite3_prepare_v2(v23, (const char *)[v24 UTF8String], -1, &ppStmt, 0);
      if (v25)
      {
        v26 = +[EFSQLPreparedStatement log];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_SQLiteErrorWithCode:", v25);
          -[EFSQLPreparedStatement executeUsingBlock:error:](v27, buf, v26);
        }
      }
      else
      {
        while (1)
        {
          uint64_t v28 = sqlite3_step(ppStmt);
          uint64_t v29 = v28;
          if (v28 != 100) {
            break;
          }
          v30 = sqlite3_column_text(ppStmt, 3);
          id v31 = [NSString alloc];
          v32 = objc_msgSend(v31, "initWithBytes:length:encoding:", v30, sqlite3_column_bytes(ppStmt, 3), 4);
          v33 = +[EFSQLPreparedStatement log];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            v48 = v6;
            __int16 v49 = 2112;
            v50 = v32;
            _os_log_error_impl(&dword_1B5A59000, v33, OS_LOG_TYPE_ERROR, "%p: %@", buf, 0x16u);
          }
        }
        if (v28 && v28 != 101)
        {
          v34 = +[EFSQLPreparedStatement log];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v35 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_SQLiteErrorWithCode:", v29);
            -[EFSQLPreparedStatement executeUsingBlock:error:](v35, buf, v34);
          }
        }
        sqlite3_finalize(ppStmt);
      }
    }
  }
  v36 = [(EFSQLPreparedStatement *)v6 queryLogger];

  if (v36)
  {
    v37 = [(EFSQLPreparedStatement *)v6 queryLogger];
    v38 = [(EFSQLPreparedStatement *)v6 transactionLabel];
    [v37 logQueryString:v16 label:v38 firstRowExecutionTimeInNanoseconds:(unint64_t)(v10 * 1000000000.0) totalExecutionTimeInNanoseconds:(unint64_t)(v17 * 1000000000.0) numberOfRows:v9 + 1];
  }
  [(EFSQLPreparedStatement *)v6 clearBindingsWithError:0];
  [(EFSQLPreparedStatement *)v6 resetWithError:0];
  BOOL v39 = +[EFSQLConnection isSuccessResultCode:v12 forStep:1 error:a4];

  return v39;
}

- (BOOL)clearBindingsWithError:(id *)a3
{
  uint64_t v4 = sqlite3_clear_bindings([(EFSQLPreparedStatement *)self compiled]);
  return +[EFSQLConnection isSuccessResultCode:v4 forStep:0 error:a3];
}

- (BOOL)resetWithError:(id *)a3
{
  uint64_t v4 = sqlite3_reset([(EFSQLPreparedStatement *)self compiled]);
  return +[EFSQLConnection isSuccessResultCode:v4 forStep:0 error:a3];
}

- (sqlite3_stmt)compiled
{
  if ([(EFSQLPreparedStatement *)self isFinalized])
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [v5 handleFailureInMethod:a2, self, @"EFSQLPreparedStatement.m", 64, @"%@ has already been finalized", v7 object file lineNumber description];
  }
  return self->_compiled;
}

- (BOOL)isFinalized
{
  return self->_compiled == 0;
}

- (EFSQLQueryLogging)queryLogger
{
  return self->_queryLogger;
}

- (NSString)originalString
{
  v2 = NSString;
  v3 = sqlite3_sql([(EFSQLPreparedStatement *)self compiled]);
  return (NSString *)[v2 stringWithUTF8String:v3];
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__EFSQLPreparedStatement_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_8 != -1) {
    dispatch_once(&log_onceToken_8, block);
  }
  v2 = (void *)log_log_8;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionLabel, 0);
  objc_storeStrong((id *)&self->_queryLogger, 0);
}

- (void)dealloc
{
  [(EFSQLPreparedStatement *)self finalizeWithError:0];
  v3.receiver = self;
  v3.super_class = (Class)EFSQLPreparedStatement;
  [(EFSQLPreparedStatement *)&v3 dealloc];
}

- (BOOL)finalizeWithError:(id *)a3
{
  BOOL result = +[EFSQLConnection isSuccessResultCode:sqlite3_finalize(self->_compiled) forStep:0 error:a3];
  self->_compiled = 0;
  return result;
}

void __70__EFSQLPreparedStatement_executeWithIndexedBindings_usingBlock_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_msgSend(a2, "ef_SQLBinding");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 bindToStatement:*(void *)(a1 + 32) usingIndex:a3];
}

void __68__EFSQLPreparedStatement_executeWithNamedBindings_usingBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = objc_msgSend(a3, "ef_SQLBinding");
  [v5 bindToStatement:*(void *)(a1 + 32) usingName:v6];
}

- (EFSQLPreparedStatement)initWithString:(id)a3 connection:(id)a4 transactionLabel:(id)a5 queryLogger:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)EFSQLPreparedStatement;
  v14 = [(EFSQLPreparedStatement *)&v21 init];
  double v15 = v14;
  if (v14)
  {
    v14->_double allowedExecutionTime = 2.0;
    objc_storeStrong((id *)&v14->_queryLogger, a6);
    objc_storeStrong((id *)&v15->_transactionLabel, a5);
    v16 = (sqlite3 *)[v11 sqlDB];
    id v17 = v10;
    if (sqlite3_prepare_v2(v16, (const char *)[v17 UTF8String], -1, &v15->_compiled, 0))
    {
      v18 = +[EFSQLPreparedStatement log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = sqlite3_errmsg((sqlite3 *)[v11 sqlDB]);
        -[EFSQLPreparedStatement initWithString:connection:transactionLabel:queryLogger:]((uint64_t)v19, buf, (uint64_t)v17, v18);
      }

      memset(__b, 170, sizeof(__b));
      __b[8] = 0;
      *(void *)uint64_t v25 = 0xE00000001;
      int v26 = 1;
      pid_t v27 = getpid();
      size_t v22 = 648;
      if (!sysctl(v25, 4u, __b, &v22, 0, 0) && (__b[8] & 0x800) != 0) {
        __debugbreak();
      }

      double v15 = 0;
    }
  }

  return v15;
}

- (BOOL)executeWithIndexedBindings:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__EFSQLPreparedStatement_executeWithIndexedBindings_usingBlock_error___block_invoke;
  v10[3] = &unk_1E6123318;
  v10[4] = self;
  [a3 enumerateObjectsUsingBlock:v10];
  LOBYTE(a5) = [(EFSQLPreparedStatement *)self executeUsingBlock:v8 error:a5];

  return (char)a5;
}

- (BOOL)executeWithNamedBindings:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__EFSQLPreparedStatement_executeWithNamedBindings_usingBlock_error___block_invoke;
  v10[3] = &unk_1E61232D0;
  v10[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v10];
  LOBYTE(a5) = [(EFSQLPreparedStatement *)self executeUsingBlock:v8 error:a5];

  return (char)a5;
}

void __29__EFSQLPreparedStatement_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_8;
  log_log_8 = (uint64_t)v1;
}

- (id)debugDescription
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EFSQLPreparedStatement;
  uint64_t v4 = [(EFSQLPreparedStatement *)&v8 debugDescription];
  id v5 = [(EFSQLPreparedStatement *)self originalString];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)executeWithNamedBindings:(id)a3 rowsChanged:(unint64_t *)a4 error:(id *)a5
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__EFSQLPreparedStatement_executeWithNamedBindings_rowsChanged_error___block_invoke;
  v12[3] = &unk_1E61232D0;
  v12[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v12];
  BOOL v8 = [(EFSQLPreparedStatement *)self executeUsingBlock:&__block_literal_global_33 error:a5];
  char v9 = !v8;
  if (!a4) {
    char v9 = 1;
  }
  if ((v9 & 1) == 0)
  {
    id v10 = sqlite3_db_handle([(EFSQLPreparedStatement *)self compiled]);
    *a4 = sqlite3_changes(v10);
  }
  return v8;
}

void __69__EFSQLPreparedStatement_executeWithNamedBindings_rowsChanged_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = objc_msgSend(a3, "ef_SQLBinding");
  [v5 bindToStatement:*(void *)(a1 + 32) usingName:v6];
}

- (double)allowedExecutionTime
{
  return self->_allowedExecutionTime;
}

- (void)setAllowedExecutionTime:(double)a3
{
  self->_double allowedExecutionTime = a3;
}

- (void)setQueryLogger:(id)a3
{
}

- (NSString)transactionLabel
{
  return self->_transactionLabel;
}

- (void)setTransactionLabel:(id)a3
{
}

- (void)initWithString:(uint64_t)a1 connection:(uint8_t *)buf transactionLabel:(uint64_t)a3 queryLogger:(os_log_t)log .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2082;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_1B5A59000, log, OS_LOG_TYPE_ERROR, "Unable to prepare statement '%@': %{public}s", buf, 0x16u);
}

- (void)executeUsingBlock:(os_log_t)log error:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B5A59000, log, OS_LOG_TYPE_ERROR, "Got error %@ preparing EXPLAIN QUERY PLAN", buf, 0xCu);
}

- (void)executeUsingBlock:(os_log_t)log error:.cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B5A59000, log, OS_LOG_TYPE_ERROR, "%p QUERY PLAN for statement: %@", (uint8_t *)&v3, 0x16u);
}

- (void)executeUsingBlock:(uint8_t *)buf error:(os_log_t)log .cold.4(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B5A59000, log, OS_LOG_TYPE_ERROR, "%p QUERY PLAN for clause: %@", buf, 0x16u);
}

- (void)executeUsingBlock:(double)a3 error:.cold.5(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  double v4 = a3;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_1B5A59000, a2, OS_LOG_TYPE_DEBUG, "Execution took %0.05f seconds for query %@", (uint8_t *)&v3, 0x16u);
}

@end