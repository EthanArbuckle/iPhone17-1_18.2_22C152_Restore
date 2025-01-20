@interface IMDDatabaseDowngradeHelper
- (BOOL)_readIntegerFromQuery:(id)a3 resultBlock:(id)a4;
- (BOOL)beginTransaction:(id)a3;
- (BOOL)cloneTableContents:(id)a3 withOperation:(IMDSqlOperation *)a4 resultBlock:(id)a5;
- (BOOL)close:(id)a3;
- (BOOL)commitTransaction:(id)a3;
- (BOOL)createIndexes:(id)a3;
- (BOOL)createTables:(id)a3;
- (BOOL)createTriggers:(id)a3;
- (BOOL)importDataFromWhitetailDatabaseWithSqlOperation:(IMDSqlOperation *)a3 resultBlock:(id)a4;
- (BOOL)isOpen;
- (BOOL)open:(id)a3;
- (BOOL)readDatabaseVersion:(id)a3;
- (BOOL)readRowCountForTable:(id)a3 resultBlock:(id)a4;
- (BOOL)revertTransaction:(id)a3;
- (BOOL)runArrayOfQueries:(id)a3 resultBlock:(id)a4;
- (BOOL)runSimpleQuery:(id)a3 resultBlock:(id)a4;
- (BOOL)writeDatabaseVersion:(int64_t)a3 resultBlock:(id)a4;
- (IMDDatabaseDowngradeHelper)initWithPath:(id)a3 tableNames:(id)a4 createTablesSQL:(id)a5 createIndexesSQL:(id)a6 createTriggersSQL:(id)a7 downgradesToVersion:(int64_t)a8;
- (NSArray)createIndexesSQL;
- (NSArray)createTablesSQL;
- (NSArray)createTriggersSQL;
- (NSArray)tableNames;
- (NSString)path;
- (id)errorFromResult:(int)a3 query:(id)a4;
- (int64_t)downgradesToVersion;
- (sqlite3)database;
- (void)dealloc;
- (void)setCreateIndexesSQL:(id)a3;
- (void)setCreateTablesSQL:(id)a3;
- (void)setCreateTriggersSQL:(id)a3;
- (void)setPath:(id)a3;
- (void)setTableNames:(id)a3;
@end

@implementation IMDDatabaseDowngradeHelper

- (IMDDatabaseDowngradeHelper)initWithPath:(id)a3 tableNames:(id)a4 createTablesSQL:(id)a5 createIndexesSQL:(id)a6 createTriggersSQL:(id)a7 downgradesToVersion:(int64_t)a8
{
  v16.receiver = self;
  v16.super_class = (Class)IMDDatabaseDowngradeHelper;
  v14 = [(IMDDatabaseDowngradeHelper *)&v16 init];
  if (v14)
  {
    v14->_path = (NSString *)[a3 copy];
    v14->_tableNames = (NSArray *)[a4 copy];
    v14->_createTablesSQL = (NSArray *)[a5 copy];
    v14->_createIndexesSQL = (NSArray *)[a6 copy];
    v14->_createTriggersSQL = (NSArray *)[a7 copy];
    v14->_downgradesToVersion = a8;
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMDDatabaseDowngradeHelper;
  [(IMDDatabaseDowngradeHelper *)&v3 dealloc];
}

- (BOOL)runSimpleQuery:(id)a3 resultBlock:(id)a4
{
  ppStmt = 0;
  id v7 = -[IMDDatabaseDowngradeHelper errorFromResult:query:](self, "errorFromResult:query:", sqlite3_prepare_v2(self->_database, (const char *)[a3 UTF8String], -1, &ppStmt, 0), a3);
  if (!v7)
  {
    uint64_t v8 = sqlite3_step(ppStmt);
    if (v8 == 100)
    {
      do
        uint64_t v9 = sqlite3_step(ppStmt);
      while (v9 == 100);
      uint64_t v8 = v9;
    }
    id v7 = [(IMDDatabaseDowngradeHelper *)self errorFromResult:v8 query:a3];
  }
  if (ppStmt)
  {
    sqlite3_finalize(ppStmt);
    ppStmt = 0;
  }
  if (a4) {
    (*((void (**)(id, BOOL, id))a4 + 2))(a4, v7 == 0, v7);
  }
  return v7 == 0;
}

- (BOOL)runArrayOfQueries:(id)a3 resultBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(a3);
      }
      BOOL v11 = [(IMDDatabaseDowngradeHelper *)self runSimpleQuery:*(void *)(*((void *)&v13 + 1) + 8 * v10) resultBlock:a4];
      if (!v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v11) = 1;
  }
  return v11;
}

- (BOOL)createTables:(id)a3
{
  [(IMDDatabaseDowngradeHelper *)self createTablesSQL];
  return MEMORY[0x1F4181798](self, sel_runArrayOfQueries_resultBlock_);
}

- (BOOL)createIndexes:(id)a3
{
  [(IMDDatabaseDowngradeHelper *)self createIndexesSQL];
  return MEMORY[0x1F4181798](self, sel_runArrayOfQueries_resultBlock_);
}

- (BOOL)createTriggers:(id)a3
{
  [(IMDDatabaseDowngradeHelper *)self createTriggersSQL];
  return MEMORY[0x1F4181798](self, sel_runArrayOfQueries_resultBlock_);
}

- (BOOL)isOpen
{
  return self->_database != 0;
}

- (BOOL)beginTransaction:(id)a3
{
  BOOL result = -[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", @"BEGIN EXCLUSIVE;",
             a3);
  self->_inTransaction = result;
  return result;
}

- (BOOL)commitTransaction:(id)a3
{
  if (self->_inTransaction)
  {
    if (-[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", @"COMMIT;",
           a3))
    {
      self->_inTransaction = 0;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v5 = IMLogHandleForCategory();
    BOOL v4 = 1;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Skipping commit of a non-existent transaction in Downgraded database", v7, 2u);
    }
  }
  return v4;
}

- (BOOL)revertTransaction:(id)a3
{
  if (self->_inTransaction)
  {
    if (-[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", @"REVERT;",
           a3))
    {
      self->_inTransaction = 0;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v5 = IMLogHandleForCategory();
    BOOL v4 = 1;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Skipping revert of a non-existant transaction in Downgraded database.", v7, 2u);
    }
  }
  return v4;
}

- (BOOL)writeDatabaseVersion:(int64_t)a3 resultBlock:(id)a4
{
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"UPDATE _SqliteDatabaseProperties SET value = %ld WHERE key = '_ClientVersion';",
         a3);
  return [(IMDDatabaseDowngradeHelper *)self runSimpleQuery:v6 resultBlock:a4];
}

- (BOOL)cloneTableContents:(id)a3 withOperation:(IMDSqlOperation *)a4 resultBlock:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = a3;
    _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Cloning and downgrading table '%@' into Downgraded Database", buf, 0xCu);
  }
  id Rows = _IMDSqlOperationGetRows((uint64_t)a4, (const __CFString *)objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA dest.table_info(%@);",
                                 a3));
  *(void *)buf = 0;
  IMDSqlOperationGetError((uint64_t)a4, buf);
  uint64_t v10 = *(void *)buf;
  if (!*(void *)buf)
  {
    id v20 = a3;
    id v21 = a5;
    BOOL v11 = (void *)[MEMORY[0x1E4F28E78] string];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v12 = [Rows countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(Rows);
          }
          long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v17 = [v11 length];
          uint64_t v18 = [v16 objectForKeyedSubscript:@"name"];
          if (v17) {
            [v11 appendFormat:@", %@", v18];
          }
          else {
            [v11 appendString:v18];
          }
        }
        uint64_t v13 = [Rows countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }
    _IMDSqlOperationRunQuery((uint64_t)a4, (CFStringRef)[NSString stringWithFormat:@"INSERT INTO dest.%@ SELECT %@ FROM main.%@", v20, v11, v20], 0, 0);
    *(void *)buf = 0;
    IMDSqlOperationGetError((uint64_t)a4, buf);
    uint64_t v10 = *(void *)buf;
    a5 = v21;
  }

  if (a5) {
    (*((void (**)(id, BOOL, uint64_t))a5 + 2))(a5, v10 == 0, v10);
  }
  return v10 == 0;
}

- (BOOL)importDataFromWhitetailDatabaseWithSqlOperation:(IMDSqlOperation *)a3 resultBlock:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = IMLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Downgrade: turning off foreign keys", buf, 2u);
  }
  _IMDSqlOperationRunQuery((uint64_t)a3, @"PRAGMA foreign_keys = OFF;", 0, 0);
  *(void *)buf = 0;
  v27 = buf;
  uint64_t v28 = 0x3052000000;
  v29 = sub_1AFB60C14;
  v30 = sub_1AFB60C24;
  uint64_t v31 = 0;
  *(void *)v32 = 0;
  IMDSqlOperationGetError((uint64_t)a3, v32);
  uint64_t v31 = *(void *)v32;
  if (!*((void *)v27 + 5))
  {
    uint64_t v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Downgrade: attaching new (empty so far) downgraded database to the real database", v32, 2u);
    }
    _IMDSqlOperationRunQuery((uint64_t)a3, (CFStringRef)objc_msgSend(NSString, "stringWithFormat:", @"ATTACH '%@' AS 'dest';",
                     [(IMDDatabaseDowngradeHelper *)self path]),
      0,
      0);
    *(void *)v32 = 0;
    IMDSqlOperationGetError((uint64_t)a3, v32);
    uint64_t v9 = *(void *)v32;
    *((void *)v27 + 5) = *(void *)v32;
    if (!v9)
    {
      uint64_t v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Downgrade: Beginning transaction", v32, 2u);
      }
      IMDSqlOperationBeginTransaction(a3);
      id v20 = a4;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      BOOL v11 = [(IMDDatabaseDowngradeHelper *)self tableNames];
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v23;
LABEL_11:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * v14);
          long long v16 = IMLogHandleForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v32 = 138412290;
            *(void *)&v32[4] = v15;
            _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, "Downgrade: Copying table: %@", v32, 0xCu);
          }
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = sub_1AFB60C30;
          v21[3] = &unk_1E5F8D498;
          v21[4] = buf;
          [(IMDDatabaseDowngradeHelper *)self cloneTableContents:v15 withOperation:a3 resultBlock:v21];
          if (*((void *)v27 + 5)) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v33 count:16];
            if (v12) {
              goto LABEL_11;
            }
            break;
          }
        }
      }
      IMDSqlOperationCommitOrRevertTransaction(a3);
      a4 = v20;
    }
  }
  uint64_t v17 = IMLogHandleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "Downgrade: Detaching database", v32, 2u);
  }
  _IMDSqlOperationRunQuery((uint64_t)a3, @"DETACH DATABASE 'dest';", 0, 0);
  if (a4) {
    (*((void (**)(id, BOOL))a4 + 2))(a4, *((void *)v27 + 5) == 0);
  }
  BOOL v18 = *((void *)v27 + 5) == 0;
  _Block_object_dispose(buf, 8);
  return v18;
}

- (id)errorFromResult:(int)a3 query:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (a3 - 100) < 2 || a3 == 0;
  if (v5 || (uint64_t v9 = IMDCreateCFErrorWithQueryErrorCode(a3, self->_database, (uint64_t)a4)) == 0)
  {
    uint64_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = a4;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Downgraded database SQL query ran ok: '%@'", (uint8_t *)&v11, 0xCu);
    }
    return 0;
  }
  else
  {
    uint64_t v7 = v9;
    uint64_t v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1AFC61CBC((uint64_t)a4, v7, v10);
    }
  }
  return v7;
}

- (BOOL)open:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    path = self->_path;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = path;
    _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Opening Downgraded database at: '%@'...", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v7 = sqlite3_open_v2([(NSString *)self->_path UTF8String], &self->_database, 6, 0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = sub_1AFB60C14;
  BOOL v18 = sub_1AFB60C24;
  id v19 = 0;
  id v19 = [(IMDDatabaseDowngradeHelper *)self errorFromResult:v7 query:@"Open database"];
  uint64_t v8 = *((void *)&buf + 1);
  if (!*(void *)(*((void *)&buf + 1) + 40))
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1AFB61064;
    v14[3] = &unk_1E5F8D498;
    v14[4] = &buf;
    -[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", @"PRAGMA page_size = 4096;",
      v14);
    uint64_t v8 = *((void *)&buf + 1);
    if (!*(void *)(*((void *)&buf + 1) + 40))
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = sub_1AFB61074;
      v13[3] = &unk_1E5F8D498;
      v13[4] = &buf;
      -[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", @"PRAGMA auto_vacuum = 2;",
        v13);
      uint64_t v8 = *((void *)&buf + 1);
      if (!*(void *)(*((void *)&buf + 1) + 40))
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = sub_1AFB61084;
        v12[3] = &unk_1E5F8D498;
        v12[4] = &buf;
        -[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", @"PRAGMA journal_mode = wal;",
          v12);
        uint64_t v8 = *((void *)&buf + 1);
        if (!*(void *)(*((void *)&buf + 1) + 40))
        {
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = sub_1AFB61094;
          v11[3] = &unk_1E5F8D498;
          v11[4] = &buf;
          -[IMDDatabaseDowngradeHelper runSimpleQuery:resultBlock:](self, "runSimpleQuery:resultBlock:", @"PRAGMA foreign_keys = OFF;",
            v11);
          uint64_t v8 = *((void *)&buf + 1);
        }
      }
    }
  }
  if (a3)
  {
    (*((void (**)(id, BOOL))a3 + 2))(a3, *(void *)(v8 + 40) == 0);
    uint64_t v8 = *((void *)&buf + 1);
  }
  BOOL v9 = *(void *)(v8 + 40) == 0;
  _Block_object_dispose(&buf, 8);
  return v9;
}

- (BOOL)close:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  database = self->_database;
  if (database)
  {
    sqlite3_close_v2(database);
    self->_database = 0;
    uint64_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      path = self->_path;
      int v9 = 138412290;
      uint64_t v10 = path;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Closed Downgraded database at: '%@'...", (uint8_t *)&v9, 0xCu);
    }
  }
  if (a3) {
    (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
  }
  return 1;
}

- (sqlite3)database
{
  return self->_database;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (int64_t)downgradesToVersion
{
  return self->_downgradesToVersion;
}

- (NSArray)tableNames
{
  return self->_tableNames;
}

- (void)setTableNames:(id)a3
{
}

- (NSArray)createIndexesSQL
{
  return self->_createIndexesSQL;
}

- (void)setCreateIndexesSQL:(id)a3
{
}

- (NSArray)createTablesSQL
{
  return self->_createTablesSQL;
}

- (void)setCreateTablesSQL:(id)a3
{
}

- (NSArray)createTriggersSQL
{
  return self->_createTriggersSQL;
}

- (void)setCreateTriggersSQL:(id)a3
{
}

- (BOOL)_readIntegerFromQuery:(id)a3 resultBlock:(id)a4
{
  ppStmt = 0;
  id v7 = -[IMDDatabaseDowngradeHelper errorFromResult:query:](self, "errorFromResult:query:", sqlite3_prepare_v2(self->_database, (const char *)[a3 UTF8String], -1, &ppStmt, 0), a3);
  if (v7)
  {
    id v8 = v7;
    sqlite3_int64 v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v10 = sqlite3_step(ppStmt);
    if (v10 == 100)
    {
      do
      {
        sqlite3_int64 v9 = sqlite3_column_int64(ppStmt, 0);
        uint64_t v11 = sqlite3_step(ppStmt);
      }
      while (v11 == 100);
      uint64_t v12 = v11;
    }
    else
    {
      uint64_t v12 = v10;
      sqlite3_int64 v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    id v8 = [(IMDDatabaseDowngradeHelper *)self errorFromResult:v12 query:a3];
  }
  if (ppStmt)
  {
    sqlite3_finalize(ppStmt);
    ppStmt = 0;
  }
  if (a4) {
    (*((void (**)(id, BOOL, id, sqlite3_int64))a4 + 2))(a4, v8 == 0, v8, v9);
  }
  return v8 == 0;
}

- (BOOL)readDatabaseVersion:(id)a3
{
  [NSString stringWithFormat:@"SELECT value FROM _SqliteDatabaseProperties WHERE key = '_ClientVersion';"];
  return MEMORY[0x1F4181798](self, sel__readIntegerFromQuery_resultBlock_);
}

- (BOOL)readRowCountForTable:(id)a3 resultBlock:(id)a4
{
  [NSString stringWithFormat:@"SELECT count(*) FROM %@;", a3];
  return MEMORY[0x1F4181798](self, sel__readIntegerFromQuery_resultBlock_);
}

@end