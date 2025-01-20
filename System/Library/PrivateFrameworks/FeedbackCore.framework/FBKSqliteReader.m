@interface FBKSqliteReader
- (FBKSqliteReader)initWithFile:(id)a3;
- (NSURL)dbFile;
- (id)allRowsForTable:(id)a3;
- (id)csvRepresentationForTable:(id)a3;
- (id)runQuery:(id)a3;
- (id)tableNames;
- (void)setDbFile:(id)a3;
@end

@implementation FBKSqliteReader

- (FBKSqliteReader)initWithFile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBKSqliteReader;
  v5 = [(FBKSqliteReader *)&v8 init];
  v6 = v5;
  if (v5) {
    [(FBKSqliteReader *)v5 setDbFile:v4];
  }

  return v6;
}

- (void)setDbFile:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F08850] defaultManager];
  v7 = [v5 path];
  int v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    objc_storeStrong((id *)&self->_dbFile, a3);
  }
  else
  {
    v9 = +[FBKLog appHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[FBKSqliteReader setDbFile:]((uint64_t)v5, v9);
    }

    dbFile = self->_dbFile;
    self->_dbFile = 0;
  }
}

- (id)tableNames
{
  v2 = [(FBKSqliteReader *)self runQuery:@"SELECT name FROM sqlite_master WHERE type='table'"];
  v3 = [v2 valueForKey:@"name"];

  return v3;
}

- (id)allRowsForTable:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"passed nil tableName to rowsForTable:" userInfo:0];
    objc_exception_throw(v9);
  }
  id v5 = v4;
  v6 = [NSString stringWithFormat:@"SELECT * FROM %@", v4];
  v7 = [(FBKSqliteReader *)self runQuery:v6];

  return v7;
}

- (id)csvRepresentationForTable:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(FBKSqliteReader *)self allRowsForTable:v4];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v27 = v4;
    int v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v30;
    v11 = @"\n";
    unint64_t v12 = 0x263F08000uLL;
    do
    {
      uint64_t v13 = 0;
      v14 = v8;
      uint64_t v28 = v7;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v5);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * v13);
        if (!v9)
        {
          id v9 = objc_opt_new();
          v16 = [v15 allKeys];
          v17 = v16;
          if (v16 && [v16 count])
          {
            [v17 componentsJoinedByString:@","];
            uint64_t v18 = v10;
            v19 = v11;
            unint64_t v20 = v12;
            v22 = v21 = v5;
            [v9 appendString:v22];

            id v5 = v21;
            unint64_t v12 = v20;
            v11 = v19;
            uint64_t v10 = v18;
            uint64_t v7 = v28;
          }
          [v9 appendString:v11];
        }
        v23 = [v15 allValues];
        int v8 = [v23 componentsJoinedByString:@","];

        v24 = [*(id *)(v12 + 2880) stringWithFormat:@"%@\n", v8];
        [v9 appendString:v24];

        ++v13;
        v14 = v8;
      }
      while (v7 != v13);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
    if (v9) {
      v25 = (__CFString *)[objc_alloc(*(Class *)(v12 + 2880)) initWithString:v9];
    }
    else {
      v25 = &stru_26DDF6A30;
    }
    id v4 = v27;
  }
  else
  {
    int v8 = 0;
    id v9 = 0;
    v25 = &stru_26DDF6A30;
  }

  return v25;
}

- (id)runQuery:(id)a3
{
  id v4 = a3;
  if (!self->_dbFile)
  {
    id v31 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"invalid database file" userInfo:0];
    objc_exception_throw(v31);
  }
  id v5 = v4;
  ppDb = 0;
  uint64_t v6 = [(FBKSqliteReader *)self dbFile];
  uint64_t v7 = [v6 path];

  id v8 = v7;
  id v9 = 0;
  uint64_t v10 = 0;
  if (!sqlite3_open((const char *)[v8 UTF8String], &ppDb))
  {
    ppStmt = 0;
    if (sqlite3_prepare_v2(ppDb, (const char *)[v5 UTF8String], -1, &ppStmt, 0))
    {
      v11 = +[FBKLog appHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[FBKSqliteReader runQuery:](&ppDb, v11);
      }

      id v9 = 0;
      uint64_t v10 = 0;
    }
    else
    {
      int v12 = sqlite3_column_count(ppStmt);
      uint64_t v13 = v12;
      v14 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v12];
      if (v12 >= 1)
      {
        int v15 = 0;
        do
        {
          v16 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_name(ppStmt, v15));
          [v14 addObject:v16];

          ++v15;
        }
        while (v13 != v15);
      }
      v17 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v18 = (void *)[v14 copy];
      uint64_t v10 = [v17 arrayWithArray:v18];

      id v9 = [MEMORY[0x263EFF980] arrayWithCapacity:v13];
      if (sqlite3_step(ppStmt) == 100)
      {
        id v32 = v8;
        v33 = v5;
        do
        {
          v19 = objc_opt_new();
          if ((int)v13 < 1)
          {
            v22 = 0;
            v21 = 0;
          }
          else
          {
            uint64_t v20 = 0;
            v21 = 0;
            v22 = 0;
            do
            {
              v23 = sqlite3_column_text(ppStmt, v20);
              if (v23)
              {
                uint64_t v24 = [NSString stringWithUTF8String:v23];

                uint64_t v25 = [v10 objectAtIndexedSubscript:v20];

                [v19 setObject:v24 forKeyedSubscript:v25];
                v22 = (void *)v25;
                v21 = (void *)v24;
              }
              ++v20;
            }
            while (v13 != v20);
          }
          v26 = objc_msgSend(v19, "copy", v32, v33);
          [v9 addObject:v26];
        }
        while (sqlite3_step(ppStmt) == 100);
        id v8 = v32;
        id v5 = v33;
      }
    }
    sqlite3_finalize(ppStmt);
  }
  sqlite3_close(ppDb);
  id v27 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v28 = (void *)[v9 copy];
  long long v29 = [v27 arrayWithArray:v28];

  return v29;
}

- (NSURL)dbFile
{
  return self->_dbFile;
}

- (void).cxx_destruct
{
}

- (void)setDbFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "dbFile %@ does not exist, setting to nil", (uint8_t *)&v2, 0xCu);
}

- (void)runQuery:(sqlite3 *)a1 .cold.1(sqlite3 **a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = sqlite3_errmsg(*a1);
  int v4 = 136315138;
  id v5 = v3;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v4, 0xCu);
}

@end