@interface CXDatabaseStatement
- (BOOL)bind:(id)a3 error:(id *)a4;
- (BOOL)bindInt64:(int64_t)a3 atIndex:(int)a4 error:(id *)a5;
- (BOOL)bindText:(const char *)a3 ofLength:(int)a4 atIndex:(int)a5 error:(id *)a6;
- (BOOL)executeWithError:(id *)a3;
- (BOOL)executeWithExpectedColumnCount:(int64_t)a3 resultRowHandler:(id)a4 error:(id *)a5;
- (BOOL)processResultsWithExpectedColumnCount:(int64_t)a3 resultRowHandler:(id)a4 error:(id *)a5;
- (CXDatabaseStatement)init;
- (CXDatabaseStatement)initWithSQL:(id)a3 database:(id)a4 error:(id *)a5;
- (sqlite3)database;
- (sqlite3_stmt)statement;
- (void)dealloc;
- (void)finalize;
- (void)setDatabase:(sqlite3 *)a3;
- (void)setStatement:(sqlite3_stmt *)a3;
@end

@implementation CXDatabaseStatement

- (CXDatabaseStatement)initWithSQL:(id)a3 database:(id)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CXDatabaseStatement;
  v10 = [(CXDatabaseStatement *)&v18 init];
  if (v10)
  {
    id v11 = v8;
    uint64_t v12 = sqlite3_prepare_v2((sqlite3 *)[v9 database], (const char *)objc_msgSend(v11, "UTF8String"), objc_msgSend(v11, "length") + 1, &v10->_statement, 0);
    if (v12)
    {
      if (a5)
      {
        int v13 = v12;
        v14 = [NSString stringWithFormat:@"sqlite3_prepare_v2 for query '%@' returned %d errorMessage '%s'", v11, v12, sqlite3_errmsg((sqlite3 *)objc_msgSend(v9, "database"))];
        v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = *MEMORY[0x1E4F28568];
        v20[0] = v14;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
        *a5 = [v15 errorWithDomain:@"com.apple.callkit.database.sqlite" code:v13 userInfo:v16];
      }
      v10 = 0;
    }
    else
    {
      v10->_database = (sqlite3 *)[v9 database];
    }
  }

  return v10;
}

- (BOOL)bind:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (!v7) {
    goto LABEL_22;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 1;
  uint64_t v10 = *(void *)v29;
  v27 = a4;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v29 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        v14 = (const char *)[v13 UTF8String];
        if (!v14)
        {
          if (a4)
          {
            uint64_t v19 = [NSString stringWithFormat:@"NSString %@ returned a nil UTF-8 string", v13];
            v20 = (void *)MEMORY[0x1E4F28C58];
            v21 = (objc_class *)objc_opt_class();
            v22 = NSStringFromClass(v21);
            uint64_t v34 = *MEMORY[0x1E4F28568];
            v35 = v19;
            v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
            *a4 = [v20 errorWithDomain:v22 code:3 userInfo:v23];

            goto LABEL_25;
          }
          goto LABEL_26;
        }
        if (![(CXDatabaseStatement *)self bindText:v14 ofLength:strlen(v14) atIndex:v9 + i error:a4])goto LABEL_26; {
      }
        }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!-[CXDatabaseStatement bindInt64:atIndex:error:](self, "bindInt64:atIndex:error:", [v12 longLongValue], v9 + i, a4))goto LABEL_27; {
        }
          }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            sqlite3_bind_null([(CXDatabaseStatement *)self statement], v9 + i);
            continue;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4) {
              goto LABEL_28;
            }
            id v13 = [NSString stringWithFormat:@"Object %@ not a supported binding class", v12];
            v25 = (void *)MEMORY[0x1E4F28C58];
            v26 = (objc_class *)objc_opt_class();
            uint64_t v19 = NSStringFromClass(v26);
            uint64_t v32 = *MEMORY[0x1E4F28568];
            id v33 = v13;
            v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
            *a4 = [v25 errorWithDomain:v19 code:1 userInfo:v22];
LABEL_25:

LABEL_26:
LABEL_27:
            LOBYTE(a4) = 0;
            goto LABEL_28;
          }
          id v15 = v6;
          id v16 = v12;
          v17 = (const void *)[v16 bytes];
          if (v17) {
            int v18 = [v16 length];
          }
          else {
            int v18 = 0;
          }
          sqlite3_bind_blob([(CXDatabaseStatement *)self statement], v9 + i, v17, v18, 0);

          id v6 = v15;
          a4 = v27;
        }
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
    uint64_t v9 = (v9 + i);
    if (v8) {
      continue;
    }
    break;
  }
LABEL_22:
  LOBYTE(a4) = 1;
LABEL_28:

  return (char)a4;
}

- (BOOL)bindText:(const char *)a3 ofLength:(int)a4 atIndex:(int)a5 error:(id *)a6
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    int v10 = strnlen(a3, a4);
  }
  else {
    int v10 = 0;
  }
  uint64_t v11 = sqlite3_bind_text([(CXDatabaseStatement *)self statement], a5, a3, v10, 0);
  int v12 = v11;
  if (a6 && v11)
  {
    id v13 = objc_msgSend(NSString, "stringWithFormat:", @"SQLite bind attempt returned %d errorMessage '%s'", v11, sqlite3_errmsg(-[CXDatabaseStatement database](self, "database")));
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = v13;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    *a6 = [v14 errorWithDomain:@"com.apple.callkit.database.sqlite" code:v12 userInfo:v15];
  }
  return v12 == 0;
}

- (sqlite3_stmt)statement
{
  return self->_statement;
}

- (BOOL)executeWithError:(id *)a3
{
  return [(CXDatabaseStatement *)self executeWithExpectedColumnCount:0 resultRowHandler:0 error:a3];
}

- (BOOL)executeWithExpectedColumnCount:(int64_t)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v27 = *MEMORY[0x1E4F28568];
  BOOL v8 = 1;
  double v9 = 0.0;
  double v10 = 0.0;
  while (1)
  {
    uint64_t v11 = sqlite3_step([(CXDatabaseStatement *)self statement]);
    uint64_t v12 = v11;
    if ((v11 - 7) < 0xFFFFFFFE)
    {
      double v10 = 0.0;
      double v9 = 0.0;
    }
    if ((v11 - 5) >= 2) {
      break;
    }
    id v13 = sqlite3_errmsg([(CXDatabaseStatement *)self database]);
    uint64_t v14 = sqlite3_extended_errcode([(CXDatabaseStatement *)self database]);
    if (v10 > 300.0)
    {
      if (!a5) {
        goto LABEL_26;
      }
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"sqlite3_step for query '%s' returned %d (%d) errorMessage '%s' after retrying for %f seconds", sqlite3_sql(-[CXDatabaseStatement statement](self, "statement")), v12, v14, v13, *(void *)&v10);
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = v12;
      uint64_t v39 = v27;
      v40[0] = v19;
      v22 = (void *)MEMORY[0x1E4F1C9E8];
      v23 = (void **)v40;
      v24 = &v39;
      goto LABEL_25;
    }
    if (v9 == 0.0) {
      double v15 = -0.0;
    }
    else {
      double v15 = v9 * 1.2;
    }
    if (v9 == 0.0) {
      double v9 = 0.2;
    }
    else {
      double v9 = v9 * 1.2;
    }
    id v16 = CXDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109890;
      int v32 = v12;
      __int16 v33 = 1024;
      int v34 = v14;
      __int16 v35 = 2080;
      v36 = v13;
      __int16 v37 = 2048;
      double v38 = v9;
      _os_log_impl(&dword_1A6E3A000, v16, OS_LOG_TYPE_DEFAULT, "[WARN] sqlite3_step returned %d (%d) errorMessage '%s', so retrying query after %f seconds", buf, 0x22u);
    }
    double v10 = v10 + v15;

    [MEMORY[0x1E4F29060] sleepForTimeInterval:v9];
LABEL_18:
    if (!v8) {
      goto LABEL_27;
    }
  }
  if (v11 == 100)
  {
    if (v7) {
      BOOL v8 = [(CXDatabaseStatement *)self processResultsWithExpectedColumnCount:a3 resultRowHandler:v7 error:a5];
    }
    goto LABEL_18;
  }
  if (v11 == 101) {
    goto LABEL_27;
  }
  if (a5)
  {
    uint64_t v17 = sqlite3_sql([(CXDatabaseStatement *)self statement]);
    int v18 = sqlite3_errmsg([(CXDatabaseStatement *)self database]);
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"sqlite3_step for query '%s' returned %d (%d) errorMessage '%s'", v17, v12, sqlite3_extended_errcode(-[CXDatabaseStatement database](self, "database")), v18);
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = (int)v12;
    uint64_t v29 = v27;
    long long v30 = v19;
    v22 = (void *)MEMORY[0x1E4F1C9E8];
    v23 = &v30;
    v24 = &v29;
LABEL_25:
    v25 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
    *a5 = [v20 errorWithDomain:@"com.apple.callkit.database.sqlite" code:v21 userInfo:v25];
  }
LABEL_26:
  BOOL v8 = 0;
LABEL_27:
  sqlite3_reset([(CXDatabaseStatement *)self statement]);
  sqlite3_clear_bindings([(CXDatabaseStatement *)self statement]);

  return v8;
}

- (void)setStatement:(sqlite3_stmt *)a3
{
  self->_statement = a3;
}

- (void)dealloc
{
  [(CXDatabaseStatement *)self finalize];
  v3.receiver = self;
  v3.super_class = (Class)CXDatabaseStatement;
  [(CXDatabaseStatement *)&v3 dealloc];
}

- (void)finalize
{
  if ([(CXDatabaseStatement *)self statement])
  {
    sqlite3_finalize([(CXDatabaseStatement *)self statement]);
    [(CXDatabaseStatement *)self setStatement:0];
  }
}

- (CXDatabaseStatement)init
{
  return 0;
}

- (BOOL)bindInt64:(int64_t)a3 atIndex:(int)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = sqlite3_bind_int64([(CXDatabaseStatement *)self statement], a4, a3);
  int v8 = v7;
  if (a5 && v7)
  {
    double v9 = objc_msgSend(NSString, "stringWithFormat:", @"SQLite bind attempt returned %d errorMessage '%s'", v7, sqlite3_errmsg(-[CXDatabaseStatement database](self, "database")));
    double v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a5 = [v10 errorWithDomain:@"com.apple.callkit.database.sqlite" code:v8 userInfo:v11];
  }
  return v8 == 0;
}

- (BOOL)processResultsWithExpectedColumnCount:(int64_t)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  int v8 = (void (**)(id, void *))a4;
  uint64_t v9 = sqlite3_column_count([(CXDatabaseStatement *)self statement]);
  if (v9 == a3)
  {
    double v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    if ((int)v9 >= 1)
    {
      int v11 = 0;
      do
      {
        switch(sqlite3_column_type([(CXDatabaseStatement *)self statement], v11))
        {
          case 1:
            uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(-[CXDatabaseStatement statement](self, "statement"), v11));
            goto LABEL_10;
          case 2:
            uint64_t v12 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(-[CXDatabaseStatement statement](self, "statement"), v11));
            goto LABEL_10;
          case 3:
            uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(-[CXDatabaseStatement statement](self, "statement"), v11));
            goto LABEL_10;
          case 4:
            uint64_t v13 = sqlite3_column_blob([(CXDatabaseStatement *)self statement], v11);
            uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v13, sqlite3_column_bytes(-[CXDatabaseStatement statement](self, "statement"), v11));
            goto LABEL_10;
          case 5:
            uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
LABEL_10:
            uint64_t v14 = (void *)v12;
            [v10 addObject:v12];

            break;
          default:
            break;
        }
        ++v11;
      }
      while (v9 != v11);
    }
    v8[2](v8, v10);
  }
  else if (a5)
  {
    double v15 = objc_msgSend(NSString, "stringWithFormat:", @"Columns returned by query (%d) did not match expected number of columns (%ld)", v9, a3);
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = (objc_class *)objc_opt_class();
    int v18 = NSStringFromClass(v17);
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = v15;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    *a5 = [v16 errorWithDomain:v18 code:2 userInfo:v19];
  }
  return v9 == a3;
}

- (sqlite3)database
{
  return self->_database;
}

- (void)setDatabase:(sqlite3 *)a3
{
  self->_database = a3;
}

@end