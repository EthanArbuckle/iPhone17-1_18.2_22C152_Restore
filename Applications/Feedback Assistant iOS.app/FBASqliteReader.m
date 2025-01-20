@interface FBASqliteReader
- (FBASqliteReader)initWithFile:(id)a3;
- (NSURL)dbFile;
- (id)allRowsForTable:(id)a3;
- (id)csvRepresentationForTable:(id)a3;
- (id)runQuery:(id)a3;
- (id)tableNames;
- (void)setDbFile:(id)a3;
@end

@implementation FBASqliteReader

- (FBASqliteReader)initWithFile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBASqliteReader;
  v5 = [(FBASqliteReader *)&v8 init];
  v6 = v5;
  if (v5) {
    [(FBASqliteReader *)v5 setDbFile:v4];
  }

  return v6;
}

- (void)setDbFile:(id)a3
{
  id v5 = a3;
  v6 = +[NSFileManager defaultManager];
  v7 = [v5 path];
  unsigned int v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    objc_storeStrong((id *)&self->_dbFile, a3);
  }
  else
  {
    v9 = +[FBALog appHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000A5FB8(v9);
    }

    dbFile = self->_dbFile;
    self->_dbFile = 0;
  }
}

- (id)tableNames
{
  v2 = [(FBASqliteReader *)self runQuery:@"SELECT name FROM sqlite_master WHERE type='table'"];
  v3 = [v2 valueForKey:@"name"];

  return v3;
}

- (id)allRowsForTable:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v9 = +[NSException exceptionWithName:NSGenericException reason:@"passed nil tableName to rowsForTable:" userInfo:0];
    objc_exception_throw(v9);
  }
  id v5 = v4;
  v6 = +[NSString stringWithFormat:@"SELECT * FROM %@", v4];
  v7 = [(FBASqliteReader *)self runQuery:v6];

  return v7;
}

- (id)csvRepresentationForTable:(id)a3
{
  id v4 = a3;
  id v5 = [(FBASqliteReader *)self allRowsForTable:v4];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    id v27 = v4;
    unsigned int v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v30;
    CFStringRef v11 = @"\n";
    v12 = &swift_getEnumCaseMultiPayload_ptr;
    do
    {
      v13 = 0;
      v14 = v8;
      id v28 = v7;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v5);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v13);
        if (!v9)
        {
          id v9 = objc_opt_new();
          v16 = [v15 allKeys];
          v17 = v16;
          if (v16 && [v16 count])
          {
            [v17 componentsJoinedByString:@","];
            uint64_t v18 = v10;
            CFStringRef v19 = v11;
            v20 = v12;
            v22 = v21 = v5;
            [v9 appendString:v22];

            id v5 = v21;
            v12 = v20;
            CFStringRef v11 = v19;
            uint64_t v10 = v18;
            id v7 = v28;
          }
          [v9 appendString:v11];
        }
        v23 = [v15 allValues];
        unsigned int v8 = [v23 componentsJoinedByString:@","];

        v24 = [v12[350] stringWithFormat:@"%@\n", v8];
        [v9 appendString:v24];

        v13 = (char *)v13 + 1;
        v14 = v8;
      }
      while (v7 != v13);
      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
    if (v9) {
      v25 = (__CFString *)[objc_alloc((Class)v12[350]) initWithString:v9];
    }
    else {
      v25 = &stru_1000F6658;
    }
    id v4 = v27;
  }
  else
  {
    unsigned int v8 = 0;
    id v9 = 0;
    v25 = &stru_1000F6658;
  }

  return v25;
}

- (id)runQuery:(id)a3
{
  id v4 = a3;
  if (!self->_dbFile)
  {
    id v29 = +[NSException exceptionWithName:NSGenericException reason:@"invalid database file" userInfo:0];
    objc_exception_throw(v29);
  }
  id v5 = v4;
  ppDb = 0;
  id v6 = [(FBASqliteReader *)self dbFile];
  id v7 = [v6 path];

  id v8 = v7;
  id v9 = 0;
  uint64_t v10 = 0;
  if (!sqlite3_open((const char *)[v8 UTF8String], &ppDb))
  {
    ppStmt = 0;
    if (sqlite3_prepare_v2(ppDb, (const char *)[v5 UTF8String], -1, &ppStmt, 0))
    {
      CFStringRef v11 = +[FBALog appHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000A5FFC(&ppDb, v11);
      }

      id v9 = 0;
      uint64_t v10 = 0;
    }
    else
    {
      int v12 = sqlite3_column_count(ppStmt);
      uint64_t v13 = v12;
      id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v12];
      if (v12 >= 1)
      {
        int v15 = 0;
        do
        {
          v16 = +[NSString stringWithUTF8String:sqlite3_column_name(ppStmt, v15)];
          [v14 addObject:v16];

          ++v15;
        }
        while (v13 != v15);
      }
      id v17 = [v14 copy];
      uint64_t v10 = +[NSArray arrayWithArray:v17];

      id v9 = +[NSMutableArray arrayWithCapacity:v13];
      if (sqlite3_step(ppStmt) == 100)
      {
        id v30 = v8;
        long long v31 = v5;
        do
        {
          uint64_t v18 = objc_opt_new();
          if ((int)v13 < 1)
          {
            v21 = 0;
            v20 = 0;
          }
          else
          {
            uint64_t v19 = 0;
            v20 = 0;
            v21 = 0;
            do
            {
              v22 = sqlite3_column_text(ppStmt, v19);
              if (v22)
              {
                uint64_t v23 = +[NSString stringWithUTF8String:v22];

                uint64_t v24 = [v10 objectAtIndexedSubscript:v19];

                [v18 setObject:v23 forKeyedSubscript:v24];
                v21 = (void *)v24;
                v20 = (void *)v23;
              }
              ++v19;
            }
            while (v13 != v19);
          }
          id v25 = [v18 copy:v30, v31];
          [v9 addObject:v25];
        }
        while (sqlite3_step(ppStmt) == 100);
        id v8 = v30;
        id v5 = v31;
      }
    }
    sqlite3_finalize(ppStmt);
  }
  sqlite3_close(ppDb);
  id v26 = [v9 copy];
  id v27 = +[NSArray arrayWithArray:v26];

  return v27;
}

- (NSURL)dbFile
{
  return self->_dbFile;
}

- (void).cxx_destruct
{
}

@end