@interface _bmFMDatabase
+ (BOOL)isSQLiteThreadSafe;
+ (_bmFMDatabase)databaseWithPath:(id)a3;
+ (_bmFMDatabase)databaseWithURL:(id)a3;
+ (id)FMDBUserVersion;
+ (id)sqliteLibVersion;
+ (id)storeableDateFormat:(id)a3;
+ (int)FMDBVersion;
- (BOOL)BOOLForQuery:(id)a3;
- (BOOL)beginDeferredTransaction;
- (BOOL)beginExclusiveTransaction;
- (BOOL)beginImmediateTransaction;
- (BOOL)beginTransaction;
- (BOOL)bindStatement:(sqlite3_stmt *)a3 WithArgumentsInArray:(id)a4 orDictionary:(id)a5 orVAList:(char *)a6;
- (BOOL)checkedOut;
- (BOOL)checkpoint:(int)a3 error:(id *)a4;
- (BOOL)checkpoint:(int)a3 name:(id)a4 error:(id *)a5;
- (BOOL)checkpoint:(int)a3 name:(id)a4 logFrameCount:(int *)a5 checkpointCount:(int *)a6 error:(id *)a7;
- (BOOL)close;
- (BOOL)columnExists:(id)a3 columnName:(id)a4;
- (BOOL)columnExists:(id)a3 inTableWithName:(id)a4;
- (BOOL)commit;
- (BOOL)crashOnErrors;
- (BOOL)databaseExists;
- (BOOL)executeStatements:(id)a3;
- (BOOL)executeStatements:(id)a3 withResultBlock:(id)a4;
- (BOOL)executeUpdate:(id)a3;
- (BOOL)executeUpdate:(id)a3 error:(id *)a4 withArgumentsInArray:(id)a5 orDictionary:(id)a6 orVAList:(char *)a7;
- (BOOL)executeUpdate:(id)a3 values:(id)a4 error:(id *)a5;
- (BOOL)executeUpdate:(id)a3 withArgumentsInArray:(id)a4;
- (BOOL)executeUpdate:(id)a3 withErrorAndBindings:(id *)a4;
- (BOOL)executeUpdate:(id)a3 withParameterDictionary:(id)a4;
- (BOOL)executeUpdate:(id)a3 withVAList:(char *)a4;
- (BOOL)executeUpdateWithFormat:(id)a3;
- (BOOL)goodConnection;
- (BOOL)hadError;
- (BOOL)hasDateFormatter;
- (BOOL)hasOpenResultSets;
- (BOOL)inTransaction;
- (BOOL)interrupt;
- (BOOL)isInTransaction;
- (BOOL)isOpen;
- (BOOL)logsErrors;
- (BOOL)open;
- (BOOL)openWithFlags:(int)a3;
- (BOOL)openWithFlags:(int)a3 vfs:(id)a4;
- (BOOL)rekey:(id)a3;
- (BOOL)rekeyWithData:(id)a3;
- (BOOL)releaseSavePointWithName:(id)a3 error:(id *)a4;
- (BOOL)rollback;
- (BOOL)rollbackToSavePointWithName:(id)a3 error:(id *)a4;
- (BOOL)setKey:(id)a3;
- (BOOL)setKeyWithData:(id)a3;
- (BOOL)shouldCacheStatements;
- (BOOL)startSavePointWithName:(id)a3 error:(id *)a4;
- (BOOL)tableExists:(id)a3;
- (BOOL)traceExecution;
- (BOOL)update:(id)a3 withErrorAndBindings:(id *)a4;
- (BOOL)validateSQL:(id)a3 error:(id *)a4;
- (NSMutableDictionary)cachedStatements;
- (NSString)databasePath;
- (NSURL)databaseURL;
- (_bmFMDatabase)init;
- (_bmFMDatabase)initWithPath:(id)a3;
- (_bmFMDatabase)initWithURL:(id)a3;
- (const)sqlitePath;
- (double)doubleForQuery:(id)a3;
- (double)maxBusyRetryTimeInterval;
- (double)valueDouble:(void *)a3;
- (id)cachedStatementForQuery:(id)a3;
- (id)dataForQuery:(id)a3;
- (id)dateForQuery:(id)a3;
- (id)dateFromString:(id)a3;
- (id)errorWithMessage:(id)a3;
- (id)executeQuery:(id)a3;
- (id)executeQuery:(id)a3 values:(id)a4 error:(id *)a5;
- (id)executeQuery:(id)a3 withArgumentsInArray:(id)a4;
- (id)executeQuery:(id)a3 withArgumentsInArray:(id)a4 orDictionary:(id)a5 orVAList:(char *)a6 shouldBind:(BOOL)a7;
- (id)executeQuery:(id)a3 withParameterDictionary:(id)a4;
- (id)executeQuery:(id)a3 withVAList:(char *)a4;
- (id)executeQueryWithFormat:(id)a3;
- (id)getSchema;
- (id)getTableSchema:(id)a3;
- (id)inSavePoint:(id)a3;
- (id)lastError;
- (id)lastErrorMessage;
- (id)prepare:(id)a3;
- (id)stringForQuery:(id)a3;
- (id)stringFromDate:(id)a3;
- (id)valueData:(void *)a3;
- (id)valueString:(void *)a3;
- (int)bindObject:(id)a3 toColumn:(int)a4 inStatement:(sqlite3_stmt *)a5;
- (int)busyRetryTimeout;
- (int)changes;
- (int)intForQuery:(id)a3;
- (int)lastErrorCode;
- (int)lastExtendedErrorCode;
- (int)limitFor:(int)a3 value:(int)a4;
- (int)valueInt:(void *)a3;
- (int)valueType:(void *)a3;
- (int64_t)lastInsertRowId;
- (int64_t)longForQuery:(id)a3;
- (int64_t)valueLong:(void *)a3;
- (unsigned)applicationID;
- (unsigned)userVersion;
- (void)clearCachedStatements;
- (void)closeOpenResultSets;
- (void)databaseExists;
- (void)dealloc;
- (void)extractSQL:(id)a3 argumentsList:(char *)a4 intoString:(id)a5 arguments:(id)a6;
- (void)makeFunctionNamed:(id)a3 arguments:(int)a4 block:(id)a5;
- (void)resultData:(id)a3 context:(void *)a4;
- (void)resultDouble:(double)a3 context:(void *)a4;
- (void)resultError:(id)a3 context:(void *)a4;
- (void)resultErrorCode:(int)a3 context:(void *)a4;
- (void)resultErrorNoMemoryInContext:(void *)a3;
- (void)resultErrorTooBigInContext:(void *)a3;
- (void)resultInt:(int)a3 context:(void *)a4;
- (void)resultLong:(int64_t)a3 context:(void *)a4;
- (void)resultNullInContext:(void *)a3;
- (void)resultSetDidClose:(id)a3;
- (void)resultString:(id)a3 context:(void *)a4;
- (void)setApplicationID:(unsigned int)a3;
- (void)setBusyRetryTimeout:(int)a3;
- (void)setCachedStatement:(id)a3 forQuery:(id)a4;
- (void)setCachedStatements:(id)a3;
- (void)setCheckedOut:(BOOL)a3;
- (void)setCrashOnErrors:(BOOL)a3;
- (void)setDateFormat:(id)a3;
- (void)setIsOpen:(BOOL)a3;
- (void)setLogsErrors:(BOOL)a3;
- (void)setMaxBusyRetryTimeInterval:(double)a3;
- (void)setShouldCacheStatements:(BOOL)a3;
- (void)setTraceExecution:(BOOL)a3;
- (void)setUserVersion:(unsigned int)a3;
- (void)sqliteHandle;
- (void)warnInUse;
@end

@implementation _bmFMDatabase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_cachedStatements, 0);
  objc_storeStrong((id *)&self->_dateFormat, 0);
  objc_storeStrong((id *)&self->_openFunctions, 0);
  objc_storeStrong((id *)&self->_openResultSets, 0);
}

- (void)dealloc
{
  [(_bmFMDatabase *)self close];
  v3.receiver = self;
  v3.super_class = (Class)_bmFMDatabase;
  [(_bmFMDatabase *)&v3 dealloc];
}

- (BOOL)close
{
  [(_bmFMDatabase *)self clearCachedStatements];
  [(_bmFMDatabase *)self closeOpenResultSets];
  db = (sqlite3 *)self->_db;
  if (db)
  {
    uint64_t v4 = sqlite3_close(db);
    if ((v4 - 5) > 1) {
      goto LABEL_7;
    }
    stmt = sqlite3_next_stmt((sqlite3 *)self->_db, 0);
    if (stmt)
    {
      v6 = stmt;
      do
      {
        NSLog(&cfstr_ClosingLeakedS.isa);
        sqlite3_finalize(v6);
        v6 = sqlite3_next_stmt((sqlite3 *)self->_db, 0);
      }
      while (v6);
      uint64_t v4 = sqlite3_close((sqlite3 *)self->_db);
      if ((v4 - 5) > 1)
      {
LABEL_7:
        if (v4) {
          NSLog(&cfstr_ErrorClosingD.isa, v4);
        }
      }
    }
    self->_db = 0;
    self->_isOpen = 0;
  }
  return 1;
}

- (void)closeOpenResultSets
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[(NSMutableSet *)self->_openResultSets copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "pointerValue", (void)v11);
        [v10 setParentDB:0];
        [v10 close];
        [(NSMutableSet *)self->_openResultSets removeObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)clearCachedStatements
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_super v3 = [(NSMutableDictionary *)self->_cachedStatements objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        v9 = objc_msgSend(v8, "allObjects", 0);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v15;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v15 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v14 + 1) + 8 * v13++) close];
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_cachedStatements removeAllObjects];
}

- (void)resultSetDidClose:(id)a3
{
  id v4 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:a3];
  [(NSMutableSet *)self->_openResultSets removeObject:v4];
}

- (id)executeQuery:(id)a3 withArgumentsInArray:(id)a4 orDictionary:(id)a5 orVAList:(char *)a6 shouldBind:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (![(_bmFMDatabase *)self databaseExists]) {
    goto LABEL_4;
  }
  if (self->_isExecutingStatement)
  {
    [(_bmFMDatabase *)self warnInUse];
LABEL_4:
    id v16 = 0;
    goto LABEL_5;
  }
  self->_isExecutingStatement = 1;
  ppStmt = 0;
  if (v13 && self->_traceExecution) {
    NSLog(&cfstr_Executequery.isa, self, v13);
  }
  if (self->_shouldCacheStatements)
  {
    long long v18 = [(_bmFMDatabase *)self cachedStatementForQuery:v13];
    long long v19 = v18;
    if (v18)
    {
      ppStmt = [(_bmFMStatement *)v18 statement];
      [(_bmFMStatement *)v19 reset];
      if (ppStmt)
      {
LABEL_22:
        if (v7
          && ![(_bmFMDatabase *)self bindStatement:ppStmt WithArgumentsInArray:v14 orDictionary:v15 orVAList:a6])
        {
          id v16 = 0;
        }
        else
        {
          if (!v19)
          {
            long long v19 = objc_alloc_init(_bmFMStatement);
            [(_bmFMStatement *)v19 setStatement:ppStmt];
            if (v13)
            {
              if (self->_shouldCacheStatements) {
                [(_bmFMDatabase *)self setCachedStatement:v19 forQuery:v13];
              }
            }
          }
          uint64_t v24 = +[_bmFMResultSet resultSetWithStatement:v19 usingParentDatabase:self shouldAutoClose:v7];
          [v24 setQuery:v13];
          v25 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v24];
          [(NSMutableSet *)self->_openResultSets addObject:v25];
          [(_bmFMStatement *)v19 setUseCount:[(_bmFMStatement *)v19 useCount] + 1];
          self->_isExecutingStatement = 0;
          id v16 = v24;
        }
        goto LABEL_30;
      }
    }
    else
    {
      ppStmt = 0;
      [0 reset];
    }
  }
  else
  {
    long long v19 = 0;
  }
  db = (sqlite3 *)self->_db;
  id v21 = v13;
  if (!sqlite3_prepare_v2(db, (const char *)[v21 UTF8String], -1, &ppStmt, 0)) {
    goto LABEL_22;
  }
  if (self->_logsErrors)
  {
    uint64_t v22 = [(_bmFMDatabase *)self lastErrorCode];
    v23 = [(_bmFMDatabase *)self lastErrorMessage];
    NSLog(&cfstr_DbErrorD.isa, v22, v23);

    NSLog(&cfstr_DbQuery.isa, v21);
    NSLog(&cfstr_DbPath.isa, self->_databasePath);
  }
  if (self->_crashOnErrors) {
    -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:](self, (uint64_t)a2);
  }
  sqlite3_finalize(ppStmt);
  id v16 = 0;
  ppStmt = 0;
  self->_isExecutingStatement = 0;
LABEL_30:

LABEL_5:
  return v16;
}

- (BOOL)databaseExists
{
  BOOL isOpen = self->_isOpen;
  if (!self->_isOpen)
  {
    NSLog(&cfstr_TheBmfmdatabas_0.isa, self);
    if (self->_crashOnErrors) {
      [(_bmFMDatabase *)(uint64_t)a2 databaseExists];
    }
  }
  return isOpen;
}

- (BOOL)bindStatement:(sqlite3_stmt *)a3 WithArgumentsInArray:(id)a4 orDictionary:(id)a5 orVAList:(char *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v37 = a4;
  id v10 = a5;
  v44 = a6;
  int v11 = sqlite3_bind_parameter_count(a3);
  int v36 = v11;
  if (v10)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = [v10 allKeys];
    uint64_t v12 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      LODWORD(v39) = 0;
      uint64_t v14 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          long long v17 = (void *)[[NSString alloc] initWithFormat:@":%@", v16];
          if (self->_traceExecution)
          {
            long long v18 = [v10 objectForKey:v16];
            NSLog(&stru_1F11ED840.isa, v17, v18);
          }
          id v19 = v17;
          uint64_t v20 = sqlite3_bind_parameter_index(a3, (const char *)[v19 UTF8String]);
          if ((int)v20 < 1)
          {
            NSLog(&cfstr_CouldNotFindIn.isa, v16);
          }
          else
          {
            uint64_t v21 = v20;
            id v22 = v10;
            v23 = [v10 objectForKey:v16];
            uint64_t v24 = [(_bmFMDatabase *)self bindObject:v23 toColumn:v21 inStatement:a3];

            if (v24)
            {
              v34 = sqlite3_errmsg((sqlite3 *)self->_db);
              NSLog(&cfstr_ErrorUnableToB.isa, v24, v34);
              sqlite3_finalize(a3);
              self->_isExecutingStatement = 0;

              v26 = 0;
              BOOL v33 = 0;
              id v10 = v22;
              goto LABEL_37;
            }
            LODWORD(v39) = v39 + 1;
            id v10 = v22;
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
      LODWORD(v39) = 0;
    }

    v27 = 0;
  }
  else
  {
    uint64_t v25 = 0;
    v26 = 0;
    uint64_t v39 = v11 & ~(v11 >> 31);
    while (1)
    {
      v27 = v26;
      if (v39 == v25) {
        break;
      }
      if (v37 && v25 < (int)[v37 count])
      {
        id v28 = [v37 objectAtIndex:v25];
      }
      else
      {
        if (!v44)
        {
          LODWORD(v39) = v25;
          break;
        }
        v29 = (id *)v44;
        v44 += 8;
        id v28 = *v29;
      }
      v26 = v28;

      if (self->_traceExecution)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          NSLog(&cfstr_DataLdBytes.isa, [v26 length]);
        }
        else {
          NSLog(&cfstr_Obj.isa, v26);
        }
      }
      uint64_t v30 = [(_bmFMDatabase *)self bindObject:v26 toColumn:++v25 inStatement:a3];
      if (v30)
      {
        uint64_t v31 = v30;
        v32 = sqlite3_errmsg((sqlite3 *)self->_db);
        NSLog(&cfstr_ErrorUnableToB.isa, v31, v32);
        sqlite3_finalize(a3);
        BOOL v33 = 0;
        self->_isExecutingStatement = 0;
        goto LABEL_37;
      }
    }
  }
  if (v39 == v36)
  {
    BOOL v33 = 1;
  }
  else
  {
    NSLog(&cfstr_ErrorTheBindCo.isa);
    sqlite3_finalize(a3);
    BOOL v33 = 0;
    self->_isExecutingStatement = 0;
  }
  v26 = v27;
LABEL_37:

  return v33;
}

- (BOOL)executeUpdate:(id)a3
{
  return [(_bmFMDatabase *)self executeUpdate:a3 error:0 withArgumentsInArray:0 orDictionary:0 orVAList:&v4];
}

- (BOOL)executeUpdate:(id)a3 error:(id *)a4 withArgumentsInArray:(id)a5 orDictionary:(id)a6 orVAList:(char *)a7
{
  v9 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:a5 orDictionary:a6 orVAList:a7 shouldBind:1];
  id v10 = v9;
  if (v9)
  {
    BOOL v11 = [v9 internalStepWithError:a4] == 101;
  }
  else if (a4)
  {
    [(_bmFMDatabase *)self lastError];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)executeQuery:(id)a3
{
  objc_super v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v6 shouldBind:1];
  return v3;
}

- (BOOL)open
{
  if (self->_isOpen) {
    return 1;
  }
  p_db = &self->_db;
  if (self->_db) {
    [(_bmFMDatabase *)self close];
  }
  uint64_t v5 = sqlite3_open([(_bmFMDatabase *)self sqlitePath], (sqlite3 **)p_db);
  if (v5)
  {
    NSLog(&cfstr_ErrorOpeningD.isa, v5);
    return 0;
  }
  else
  {
    if (self->_maxBusyRetryTimeInterval > 0.0) {
      -[_bmFMDatabase setMaxBusyRetryTimeInterval:](self, "setMaxBusyRetryTimeInterval:");
    }
    BOOL result = 1;
    self->_BOOL isOpen = 1;
  }
  return result;
}

- (void)setMaxBusyRetryTimeInterval:(double)a3
{
  objc_super v3 = self;
  self->_maxBusyRetryTimeInterval = a3;
  db = (sqlite3 *)self->_db;
  if (db)
  {
    if (a3 <= 0.0)
    {
      uint64_t v5 = 0;
      objc_super v3 = 0;
    }
    else
    {
      uint64_t v5 = (int (__cdecl *)(void *, int))FMDBDatabaseBusyHandler;
    }
    sqlite3_busy_handler(db, v5, v3);
  }
}

- (const)sqlitePath
{
  databasePath = self->_databasePath;
  if (!databasePath) {
    return ":memory:";
  }
  if (![(NSString *)databasePath length]) {
    return "";
  }
  uint64_t v4 = self->_databasePath;
  return [(NSString *)v4 fileSystemRepresentation];
}

- (NSURL)databaseURL
{
  if (self->_databasePath)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");
  }
  else
  {
    v2 = 0;
  }
  return (NSURL *)v2;
}

+ (_bmFMDatabase)databaseWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4];

  return (_bmFMDatabase *)v5;
}

- (_bmFMDatabase)initWithURL:(id)a3
{
  id v4 = [a3 path];
  uint64_t v5 = [(_bmFMDatabase *)self initWithPath:v4];

  return v5;
}

- (_bmFMDatabase)initWithPath:(id)a3
{
  id v4 = a3;
  if (!sqlite3_threadsafe()) {
    -[_bmFMDatabase initWithPath:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)_bmFMDatabase;
  uint64_t v5 = [(_bmFMDatabase *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    BOOL v7 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v6;

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v9 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v8;

    *((void *)v5 + 1) = 0;
    *(_WORD *)(v5 + 59) = 256;
    *((void *)v5 + 8) = 0x4000000000000000;
    v5[61] = 0;
  }

  return (_bmFMDatabase *)v5;
}

+ (_bmFMDatabase)databaseWithPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithPath:v4];

  return (_bmFMDatabase *)v5;
}

- (_bmFMDatabase)init
{
  return [(_bmFMDatabase *)self initWithPath:0];
}

+ (id)FMDBUserVersion
{
  return @"2.7.7";
}

+ (int)FMDBVersion
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28___bmFMDatabase_FMDBVersion__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (FMDBVersion_once != -1) {
    dispatch_once(&FMDBVersion_once, block);
  }
  return FMDBVersion_FMDBVersionVal;
}

+ (id)sqliteLibVersion
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sqlite3_libversion());
  return v2;
}

+ (BOOL)isSQLiteThreadSafe
{
  return sqlite3_threadsafe() != 0;
}

- (void)sqliteHandle
{
  return self->_db;
}

- (int)limitFor:(int)a3 value:(int)a4
{
  return sqlite3_limit((sqlite3 *)self->_db, a3, a4);
}

- (BOOL)openWithFlags:(int)a3
{
  return [(_bmFMDatabase *)self openWithFlags:*(void *)&a3 vfs:0];
}

- (BOOL)openWithFlags:(int)a3 vfs:(id)a4
{
  id v6 = a4;
  if (self->_isOpen)
  {
    BOOL v7 = 1;
  }
  else
  {
    if (self->_db) {
      [(_bmFMDatabase *)self close];
    }
    uint64_t v8 = sqlite3_open_v2(-[_bmFMDatabase sqlitePath](self, "sqlitePath"), (sqlite3 **)&self->_db, a3, (const char *)[v6 UTF8String]);
    if (v8)
    {
      NSLog(&cfstr_ErrorOpeningD.isa, v8);
      BOOL v7 = 0;
    }
    else
    {
      if (self->_maxBusyRetryTimeInterval > 0.0) {
        -[_bmFMDatabase setMaxBusyRetryTimeInterval:](self, "setMaxBusyRetryTimeInterval:");
      }
      BOOL v7 = 1;
      self->_BOOL isOpen = 1;
    }
  }

  return v7;
}

- (double)maxBusyRetryTimeInterval
{
  return self->_maxBusyRetryTimeInterval;
}

- (int)busyRetryTimeout
{
  return -1;
}

- (void)setBusyRetryTimeout:(int)a3
{
}

- (BOOL)hasOpenResultSets
{
  return [(NSMutableSet *)self->_openResultSets count] != 0;
}

- (id)cachedStatementForQuery:(id)a3
{
  objc_super v3 = [(NSMutableDictionary *)self->_cachedStatements objectForKey:a3];
  id v4 = [v3 objectsPassingTest:&__block_literal_global_0];
  uint64_t v5 = [v4 anyObject];

  return v5;
}

- (void)setCachedStatement:(id)a3 forQuery:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = (void *)[v7 copy];

    [v12 setQuery:v9];
    id v10 = [(NSMutableDictionary *)self->_cachedStatements objectForKey:v9];
    if (!v10)
    {
      id v10 = [MEMORY[0x1E4F1CA80] set];
    }
    [v10 addObject:v12];
    [(NSMutableDictionary *)self->_cachedStatements setObject:v10 forKey:v9];
  }
  else
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"FMDatabase.m", 411, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    NSLog(&cfstr_ApiMisuseBmfmd.isa);
  }
}

- (BOOL)rekey:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9B8];
  id v5 = a3;
  uint64_t v6 = [v5 UTF8String];
  id v7 = v5;
  uint64_t v8 = (const char *)[v7 UTF8String];

  v9 = [v4 dataWithBytes:v6 length:strlen(v8)];
  LOBYTE(self) = [(_bmFMDatabase *)self rekeyWithData:v9];

  return (char)self;
}

- (BOOL)rekeyWithData:(id)a3
{
  return 0;
}

- (BOOL)setKey:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9B8];
  id v5 = a3;
  uint64_t v6 = [v5 UTF8String];
  id v7 = v5;
  uint64_t v8 = (const char *)[v7 UTF8String];

  v9 = [v4 dataWithBytes:v6 length:strlen(v8)];
  LOBYTE(self) = [(_bmFMDatabase *)self setKeyWithData:v9];

  return (char)self;
}

- (BOOL)setKeyWithData:(id)a3
{
  return 0;
}

+ (id)storeableDateFormat:(id)a3
{
  objc_super v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:v4];

  uint64_t v6 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v5 setTimeZone:v6];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
  [v5 setLocale:v7];

  return v5;
}

- (BOOL)hasDateFormatter
{
  return self->_dateFormat != 0;
}

- (void)setDateFormat:(id)a3
{
}

- (id)dateFromString:(id)a3
{
  return [(NSDateFormatter *)self->_dateFormat dateFromString:a3];
}

- (id)stringFromDate:(id)a3
{
  return [(NSDateFormatter *)self->_dateFormat stringFromDate:a3];
}

- (BOOL)goodConnection
{
  if (!self->_isOpen) {
    return 0;
  }
  v2 = [(_bmFMDatabase *)self executeQuery:@"select name from sqlite_master where type='table'"];
  objc_super v3 = v2;
  BOOL v4 = v2 != 0;
  if (v2) {
    [v2 close];
  }

  return v4;
}

- (void)warnInUse
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a1, a2, @"FMDatabase.m", 550, @"The _bmFMDatabase %@ is currently in use.", a2 object file lineNumber description];

  abort();
}

- (id)lastErrorMessage
{
  v2 = NSString;
  objc_super v3 = sqlite3_errmsg((sqlite3 *)self->_db);
  return (id)[v2 stringWithUTF8String:v3];
}

- (BOOL)hadError
{
  return [(_bmFMDatabase *)self lastErrorCode] - 1 < 0x63;
}

- (int)lastErrorCode
{
  return sqlite3_errcode((sqlite3 *)self->_db);
}

- (int)lastExtendedErrorCode
{
  return sqlite3_extended_errcode((sqlite3 *)self->_db);
}

- (id)errorWithMessage:(id)a3
{
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a3 forKey:*MEMORY[0x1E4F28568]];
  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_bmFMDatabase" code:sqlite3_errcode((sqlite3 *)self->_db) userInfo:v4];

  return v5;
}

- (id)lastError
{
  objc_super v3 = [(_bmFMDatabase *)self lastErrorMessage];
  BOOL v4 = [(_bmFMDatabase *)self errorWithMessage:v3];

  return v4;
}

- (int64_t)lastInsertRowId
{
  if (self->_isExecutingStatement)
  {
    [(_bmFMDatabase *)self warnInUse];
    return 0;
  }
  else
  {
    self->_isExecutingStatement = 1;
    int64_t result = sqlite3_last_insert_rowid((sqlite3 *)self->_db);
    self->_isExecutingStatement = 0;
  }
  return result;
}

- (int)changes
{
  if (self->_isExecutingStatement)
  {
    [(_bmFMDatabase *)self warnInUse];
    return 0;
  }
  else
  {
    self->_isExecutingStatement = 1;
    int result = sqlite3_changes((sqlite3 *)self->_db);
    self->_isExecutingStatement = 0;
  }
  return result;
}

- (int)bindObject:(id)a3 toColumn:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1CA98] null];

    if (v9 != v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v8;
        uint64_t v11 = [v10 bytes];
        if (v11) {
          id v12 = (const char *)v11;
        }
        else {
          id v12 = "";
        }
        int v13 = sqlite3_bind_blob(a5, a4, v12, [v10 length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        goto LABEL_9;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([(_bmFMDatabase *)self hasDateFormatter])
        {
          uint64_t v16 = [(_bmFMDatabase *)self stringFromDate:v8];
LABEL_33:
          id v32 = v16;
          int v14 = sqlite3_bind_text(a5, a4, (const char *)[v32 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

          goto LABEL_10;
        }
        [v8 timeIntervalSince1970];
        goto LABEL_30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v30 = v8;
        goto LABEL_32;
      }
      id v17 = v8;
      if (strcmp((const char *)[v17 objCType], "c"))
      {
        id v18 = v17;
        if (!strcmp((const char *)[v18 objCType], "C"))
        {
          int v33 = [v18 unsignedCharValue];
          goto LABEL_39;
        }
        id v19 = v18;
        if (!strcmp((const char *)[v19 objCType], "s"))
        {
          int v33 = [v19 shortValue];
          goto LABEL_39;
        }
        id v20 = v19;
        if (!strcmp((const char *)[v20 objCType], "S"))
        {
          int v33 = [v20 unsignedShortValue];
          goto LABEL_39;
        }
        id v21 = v20;
        if (!strcmp((const char *)[v21 objCType], "i"))
        {
          int v33 = [v21 intValue];
          goto LABEL_39;
        }
        id v22 = v21;
        if (!strcmp((const char *)[v22 objCType], "I"))
        {
          sqlite3_int64 v34 = [v22 unsignedIntValue];
        }
        else
        {
          id v23 = v22;
          if (!strcmp((const char *)[v23 objCType], "q"))
          {
            uint64_t v35 = [v23 longValue];
          }
          else
          {
            id v24 = v23;
            if (!strcmp((const char *)[v24 objCType], "Q"))
            {
              uint64_t v35 = [v24 unsignedLongValue];
            }
            else
            {
              id v25 = v24;
              if (!strcmp((const char *)[v25 objCType], "q"))
              {
                uint64_t v35 = [v25 longLongValue];
              }
              else
              {
                id v26 = v25;
                if (strcmp((const char *)[v26 objCType], "Q"))
                {
                  id v27 = v26;
                  if (!strcmp((const char *)[v27 objCType], "f"))
                  {
                    [v27 floatValue];
                    double v31 = v36;
                  }
                  else
                  {
                    id v28 = v27;
                    if (strcmp((const char *)[v28 objCType], "d"))
                    {
                      id v29 = v28;
                      if (strcmp((const char *)[v29 objCType], "B"))
                      {
                        uint64_t v30 = v29;
LABEL_32:
                        uint64_t v16 = [v30 description];
                        goto LABEL_33;
                      }
                      int v33 = [v29 BOOLValue];
LABEL_39:
                      int v13 = sqlite3_bind_int(a5, a4, v33);
                      goto LABEL_9;
                    }
                    [v28 doubleValue];
                  }
LABEL_30:
                  int v13 = sqlite3_bind_double(a5, a4, v31);
                  goto LABEL_9;
                }
                uint64_t v35 = [v26 unsignedLongLongValue];
              }
            }
          }
          sqlite3_int64 v34 = v35;
        }
        int v13 = sqlite3_bind_int64(a5, a4, v34);
        goto LABEL_9;
      }
      int v33 = [v17 charValue];
      goto LABEL_39;
    }
  }
  int v13 = sqlite3_bind_null(a5, a4);
LABEL_9:
  int v14 = v13;
LABEL_10:

  return v14;
}

- (void)extractSQL:(id)a3 argumentsList:(char *)a4 intoString:(id)a5 arguments:(id)a6
{
  id v9 = a3;
  v44 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v9 length];
  if (v12)
  {
    unint64_t v13 = v12;
    LODWORD(v14) = 0;
    unint64_t v15 = 0;
    while (1)
    {
      int v16 = v14;
      uint64_t v17 = [v9 characterAtIndex:v15];
      uint64_t v14 = v17;
      if (v16 == 37) {
        break;
      }
      if (v17 == 37) {
        goto LABEL_48;
      }
LABEL_45:
      uint64_t v35 = v14;
      if (v14)
      {
LABEL_46:
        uint64_t v43 = v35;
        long long v40 = v10;
        long long v41 = @"%C";
        goto LABEL_47;
      }
LABEL_48:
      if (++v15 >= v13) {
        goto LABEL_53;
      }
    }
    if ((int)v17 > 98)
    {
      switch((int)v17)
      {
        case 'c':
          id v18 = [NSString alloc];
          id v19 = (unsigned int *)v44;
          v44 += 8;
          id v20 = (id)objc_msgSend(v18, "initWithFormat:", @"%c", *v19);
          goto LABEL_31;
        case 'd':
        case 'i':
          goto LABEL_13;
        case 'f':
          id v23 = (double *)v44;
          v44 += 8;
          id v20 = [NSNumber numberWithDouble:*v23];
          goto LABEL_31;
        case 'g':
          id v24 = v44;
          v44 += 8;
          double v25 = *(double *)v24;
          *(float *)&double v25 = *(double *)v24;
          id v20 = [NSNumber numberWithFloat:v25];
          goto LABEL_31;
        case 'h':
          unint64_t v26 = v15 + 1;
          if (v15 + 1 >= v13) {
            goto LABEL_36;
          }
          if ([v9 characterAtIndex:v15 + 1] == 105)
          {
            id v27 = v44;
            v44 += 8;
            uint64_t v28 = [NSNumber numberWithShort:*(__int16 *)v27];
            goto LABEL_42;
          }
          if ([v9 characterAtIndex:v15 + 1] == 117)
          {
            float v36 = (unsigned __int16 *)v44;
            v44 += 8;
            uint64_t v28 = [NSNumber numberWithUnsignedShort:*v36];
            goto LABEL_42;
          }
LABEL_36:
          uint64_t v35 = 104;
          goto LABEL_46;
        case 'l':
          unint64_t v26 = v15 + 1;
          if (v15 + 1 >= v13) {
            goto LABEL_33;
          }
          int v29 = [v9 characterAtIndex:v15 + 1];
          if (v29 == 100)
          {
            v38 = v44;
            v44 += 8;
            uint64_t v28 = [NSNumber numberWithLong:*(void *)v38];
            goto LABEL_42;
          }
          if (v29 == 117)
          {
            uint64_t v39 = v44;
            v44 += 8;
            uint64_t v28 = [NSNumber numberWithUnsignedLong:*(void *)v39];
            goto LABEL_42;
          }
          if (v29 != 108)
          {
LABEL_33:
            uint64_t v35 = 108;
            goto LABEL_46;
          }
          v15 += 2;
          if (v15 < v13)
          {
            if ([v9 characterAtIndex:v15] == 100)
            {
              uint64_t v30 = v44;
              v44 += 8;
              id v20 = [NSNumber numberWithLongLong:*(void *)v30];
              goto LABEL_31;
            }
            if ([v9 characterAtIndex:v15] == 117)
            {
              long long v42 = v44;
              v44 += 8;
              id v20 = [NSNumber numberWithUnsignedLongLong:*(void *)v42];
              goto LABEL_31;
            }
          }
          uint64_t v35 = 108;
          unint64_t v15 = v26;
          goto LABEL_46;
        case 'q':
          unint64_t v26 = v15 + 1;
          if (v15 + 1 >= v13) {
            goto LABEL_39;
          }
          if ([v9 characterAtIndex:v15 + 1] == 105)
          {
            double v31 = v44;
            v44 += 8;
            uint64_t v28 = [NSNumber numberWithLongLong:*(void *)v31];
          }
          else
          {
            if ([v9 characterAtIndex:v15 + 1] != 117)
            {
LABEL_39:
              uint64_t v35 = 113;
              goto LABEL_46;
            }
            id v37 = v44;
            v44 += 8;
            uint64_t v28 = [NSNumber numberWithUnsignedLongLong:*(void *)v37];
          }
LABEL_42:
          sqlite3_int64 v34 = (void *)v28;
          unint64_t v15 = v26;
          if (!v28) {
            goto LABEL_43;
          }
          goto LABEL_32;
        case 's':
          id v32 = v44;
          v44 += 8;
          id v20 = [NSString stringWithUTF8String:*(void *)v32];
          goto LABEL_31;
        case 'u':
          goto LABEL_12;
        default:
          goto LABEL_43;
      }
    }
    switch(v17)
    {
      case '@':
        int v33 = (id *)v44;
        v44 += 8;
        id v20 = *v33;
        break;
      case 'D':
LABEL_13:
        id v22 = (unsigned int *)v44;
        v44 += 8;
        id v20 = [NSNumber numberWithInt:*v22];
        break;
      case 'U':
LABEL_12:
        id v21 = (unsigned int *)v44;
        v44 += 8;
        id v20 = [NSNumber numberWithUnsignedInt:*v21];
        break;
      default:
LABEL_43:
        if (v14 == 64)
        {
          long long v40 = v10;
          long long v41 = @"NULL";
LABEL_47:
          objc_msgSend(v40, "appendFormat:", v41, v43);
          goto LABEL_48;
        }
        goto LABEL_45;
    }
LABEL_31:
    sqlite3_int64 v34 = v20;
    if (v20)
    {
LABEL_32:
      [v10 appendString:@"?"];
      [v11 addObject:v34];

      goto LABEL_48;
    }
    goto LABEL_43;
  }
LABEL_53:
}

- (id)executeQuery:(id)a3 withParameterDictionary:(id)a4
{
  return [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:a4 orVAList:0 shouldBind:1];
}

- (id)executeQueryWithFormat:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F28E78];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "stringWithCapacity:", objc_msgSend(v5, "length"));
  id v7 = [MEMORY[0x1E4F1CA48] array];
  [(_bmFMDatabase *)self extractSQL:v5 argumentsList:&v11 intoString:v6 arguments:v7];

  id v8 = [(_bmFMDatabase *)self executeQuery:v6 withArgumentsInArray:v7];

  return v8;
}

- (id)executeQuery:(id)a3 withArgumentsInArray:(id)a4
{
  return [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:a4 orDictionary:0 orVAList:0 shouldBind:1];
}

- (id)executeQuery:(id)a3 values:(id)a4 error:(id *)a5
{
  uint64_t v7 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:a4 orDictionary:0 orVAList:0 shouldBind:1];
  id v8 = (void *)v7;
  if (a5 && !v7)
  {
    *a5 = [(_bmFMDatabase *)self lastError];
  }
  return v8;
}

- (id)executeQuery:(id)a3 withVAList:(char *)a4
{
  return [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:a4 shouldBind:1];
}

- (BOOL)executeUpdate:(id)a3 withArgumentsInArray:(id)a4
{
  return [(_bmFMDatabase *)self executeUpdate:a3 error:0 withArgumentsInArray:a4 orDictionary:0 orVAList:0];
}

- (BOOL)executeUpdate:(id)a3 values:(id)a4 error:(id *)a5
{
  return [(_bmFMDatabase *)self executeUpdate:a3 error:a5 withArgumentsInArray:a4 orDictionary:0 orVAList:0];
}

- (BOOL)executeUpdate:(id)a3 withParameterDictionary:(id)a4
{
  return [(_bmFMDatabase *)self executeUpdate:a3 error:0 withArgumentsInArray:0 orDictionary:a4 orVAList:0];
}

- (BOOL)executeUpdate:(id)a3 withVAList:(char *)a4
{
  return [(_bmFMDatabase *)self executeUpdate:a3 error:0 withArgumentsInArray:0 orDictionary:0 orVAList:a4];
}

- (BOOL)executeUpdateWithFormat:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F28E78];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "stringWithCapacity:", objc_msgSend(v5, "length"));
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  [(_bmFMDatabase *)self extractSQL:v5 argumentsList:&v9 intoString:v6 arguments:v7];

  LOBYTE(self) = [(_bmFMDatabase *)self executeUpdate:v6 withArgumentsInArray:v7];
  return (char)self;
}

- (BOOL)executeStatements:(id)a3
{
  return [(_bmFMDatabase *)self executeStatements:a3 withResultBlock:0];
}

- (BOOL)executeStatements:(id)a3 withResultBlock:(id)a4
{
  errmsg = 0;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_bmFMDatabase *)self sqliteHandle];
  id v9 = v7;
  id v10 = (const char *)[v9 UTF8String];

  if (v6) {
    uint64_t v11 = (int (__cdecl *)(void *, int, char **, char **))FMDBExecuteBulkSQLCallback;
  }
  else {
    uint64_t v11 = 0;
  }
  int v12 = sqlite3_exec(v8, v10, v11, v6, &errmsg);

  if (errmsg)
  {
    if ([(_bmFMDatabase *)self logsErrors]) {
      NSLog(&cfstr_ErrorInserting.isa, errmsg);
    }
    if (errmsg) {
      sqlite3_free(errmsg);
    }
  }
  return v12 == 0;
}

- (BOOL)executeUpdate:(id)a3 withErrorAndBindings:(id *)a4
{
  return [(_bmFMDatabase *)self executeUpdate:a3 error:a4 withArgumentsInArray:0 orDictionary:0 orVAList:&v5];
}

- (BOOL)update:(id)a3 withErrorAndBindings:(id *)a4
{
  return [(_bmFMDatabase *)self executeUpdate:a3 error:a4 withArgumentsInArray:0 orDictionary:0 orVAList:&v5];
}

- (id)prepare:(id)a3
{
  return [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:0 shouldBind:0];
}

- (BOOL)rollback
{
  BOOL v3 = [(_bmFMDatabase *)self executeUpdate:@"rollback transaction"];
  if (v3) {
    self->_isInTransaction = 0;
  }
  return v3;
}

- (BOOL)commit
{
  BOOL v3 = [(_bmFMDatabase *)self executeUpdate:@"commit transaction"];
  if (v3) {
    self->_isInTransaction = 0;
  }
  return v3;
}

- (BOOL)beginTransaction
{
  BOOL v3 = [(_bmFMDatabase *)self executeUpdate:@"begin exclusive transaction"];
  if (v3) {
    self->_isInTransaction = 1;
  }
  return v3;
}

- (BOOL)beginDeferredTransaction
{
  BOOL v3 = [(_bmFMDatabase *)self executeUpdate:@"begin deferred transaction"];
  if (v3) {
    self->_isInTransaction = 1;
  }
  return v3;
}

- (BOOL)beginImmediateTransaction
{
  BOOL v3 = [(_bmFMDatabase *)self executeUpdate:@"begin immediate transaction"];
  if (v3) {
    self->_isInTransaction = 1;
  }
  return v3;
}

- (BOOL)beginExclusiveTransaction
{
  BOOL v3 = [(_bmFMDatabase *)self executeUpdate:@"begin exclusive transaction"];
  if (v3) {
    self->_isInTransaction = 1;
  }
  return v3;
}

- (BOOL)inTransaction
{
  return self->_isInTransaction;
}

- (BOOL)interrupt
{
  db = self->_db;
  if (db) {
    sqlite3_interrupt((sqlite3 *)[(_bmFMDatabase *)self sqliteHandle]);
  }
  return db != 0;
}

- (BOOL)startSavePointWithName:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"FMDatabase.m", 1256, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  id v8 = [NSString alloc];
  id v9 = [v7 stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
  id v10 = (void *)[v8 initWithFormat:@"savepoint '%@';", v9];

  BOOL v11 = [(_bmFMDatabase *)self executeUpdate:v10 error:a4 withArgumentsInArray:0 orDictionary:0 orVAList:0];
  return v11;
}

- (BOOL)releaseSavePointWithName:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"FMDatabase.m", 1270, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  id v8 = [NSString alloc];
  id v9 = [v7 stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
  id v10 = (void *)[v8 initWithFormat:@"release savepoint '%@';", v9];

  BOOL v11 = [(_bmFMDatabase *)self executeUpdate:v10 error:a4 withArgumentsInArray:0 orDictionary:0 orVAList:0];
  return v11;
}

- (BOOL)rollbackToSavePointWithName:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"FMDatabase.m", 1284, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  id v8 = [NSString alloc];
  id v9 = [v7 stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
  id v10 = (void *)[v8 initWithFormat:@"rollback transaction to savepoint '%@';", v9];

  BOOL v11 = [(_bmFMDatabase *)self executeUpdate:v10 error:a4 withArgumentsInArray:0 orDictionary:0 orVAList:0];
  return v11;
}

- (id)inSavePoint:(id)a3
{
  BOOL v4 = (void (**)(id, unsigned char *))a3;
  id v5 = [NSString alloc];
  uint64_t v6 = inSavePoint__savePointIdx++;
  id v7 = objc_msgSend(v5, "initWithFormat:", @"dbSavePoint%ld", v6);
  char v17 = 0;
  id v16 = 0;
  BOOL v8 = [(_bmFMDatabase *)self startSavePointWithName:v7 error:&v16];
  id v9 = v16;
  if (v8)
  {
    if (v4)
    {
      v4[2](v4, &v17);
      if (v17)
      {
        id v15 = v9;
        [(_bmFMDatabase *)self rollbackToSavePointWithName:v7 error:&v15];
        id v10 = v15;

        id v9 = v10;
      }
    }
    id v14 = v9;
    [(_bmFMDatabase *)self releaseSavePointWithName:v7 error:&v14];
    id v11 = v14;

    id v9 = v11;
  }
  id v12 = v9;

  return v12;
}

- (BOOL)checkpoint:(int)a3 error:(id *)a4
{
  return [(_bmFMDatabase *)self checkpoint:*(void *)&a3 name:0 logFrameCount:0 checkpointCount:0 error:a4];
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 error:(id *)a5
{
  return [(_bmFMDatabase *)self checkpoint:*(void *)&a3 name:a4 logFrameCount:0 checkpointCount:0 error:a5];
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 logFrameCount:(int *)a5 checkpointCount:(int *)a6 error:(id *)a7
{
  id v13 = a4;
  int v14 = sqlite3_wal_checkpoint_v2((sqlite3 *)self->_db, (const char *)[v13 UTF8String], a3, a5, a6);
  if (v14)
  {
    if (a7)
    {
      *a7 = [(_bmFMDatabase *)self lastError];
    }
    if ([(_bmFMDatabase *)self logsErrors])
    {
      id v15 = [(_bmFMDatabase *)self lastErrorMessage];
      NSLog(&stru_1F11EDA60.isa, v15);
    }
    if ([(_bmFMDatabase *)self crashOnErrors]) {
      -[_bmFMDatabase checkpoint:name:logFrameCount:checkpointCount:error:](self, (uint64_t)a2);
    }
  }

  return v14 == 0;
}

- (BOOL)shouldCacheStatements
{
  return self->_shouldCacheStatements;
}

- (void)setShouldCacheStatements:(BOOL)a3
{
  self->_shouldCacheStatements = a3;
  if (!a3
    || !self->_cachedStatements
    && ([MEMORY[0x1E4F1CA60] dictionary],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        [(_bmFMDatabase *)self setCachedStatements:v4],
        v4,
        !self->_shouldCacheStatements))
  {
    [(_bmFMDatabase *)self setCachedStatements:0];
  }
}

- (void)makeFunctionNamed:(id)a3 arguments:(int)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!self->_openFunctions)
  {
    id v10 = (NSMutableSet *)objc_opt_new();
    openFunctions = self->_openFunctions;
    self->_openFunctions = v10;
  }
  id v12 = (void *)[v9 copy];
  [(NSMutableSet *)self->_openFunctions addObject:v12];
  id v13 = [(_bmFMDatabase *)self sqliteHandle];
  id v14 = v8;
  sqlite3_create_function(v13, (const char *)[v14 UTF8String], a4, 1, v12, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))FMDBBlockSQLiteCallBackFunction, 0, 0);
}

- (int)valueType:(void *)a3
{
  return sqlite3_value_type((sqlite3_value *)a3);
}

- (int)valueInt:(void *)a3
{
  return sqlite3_value_int((sqlite3_value *)a3);
}

- (int64_t)valueLong:(void *)a3
{
  return sqlite3_value_int64((sqlite3_value *)a3);
}

- (double)valueDouble:(void *)a3
{
  return sqlite3_value_double((sqlite3_value *)a3);
}

- (id)valueData:(void *)a3
{
  BOOL v4 = sqlite3_value_blob((sqlite3_value *)a3);
  int v5 = sqlite3_value_bytes((sqlite3_value *)a3);
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)valueString:(void *)a3
{
  BOOL v3 = (void *)sqlite3_value_text((sqlite3_value *)a3);
  if (v3)
  {
    BOOL v3 = [NSString stringWithUTF8String:v3];
  }
  return v3;
}

- (void)resultNullInContext:(void *)a3
{
}

- (void)resultInt:(int)a3 context:(void *)a4
{
}

- (void)resultLong:(int64_t)a3 context:(void *)a4
{
}

- (void)resultDouble:(double)a3 context:(void *)a4
{
}

- (void)resultData:(id)a3 context:(void *)a4
{
  id v5 = a3;
  uint64_t v6 = (const void *)[v5 bytes];
  int v7 = [v5 length];

  sqlite3_result_blob((sqlite3_context *)a4, v6, v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)resultString:(id)a3 context:(void *)a4
{
  id v5 = (const char *)[a3 UTF8String];
  sqlite3_result_text((sqlite3_context *)a4, v5, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)resultError:(id)a3 context:(void *)a4
{
  id v5 = (const char *)[a3 UTF8String];
  sqlite3_result_error((sqlite3_context *)a4, v5, -1);
}

- (void)resultErrorCode:(int)a3 context:(void *)a4
{
}

- (void)resultErrorNoMemoryInContext:(void *)a3
{
}

- (void)resultErrorTooBigInContext:(void *)a3
{
}

- (BOOL)traceExecution
{
  return self->_traceExecution;
}

- (void)setTraceExecution:(BOOL)a3
{
  self->_traceExecution = a3;
}

- (BOOL)checkedOut
{
  return self->_checkedOut;
}

- (void)setCheckedOut:(BOOL)a3
{
  self->_checkedOut = a3;
}

- (BOOL)crashOnErrors
{
  return self->_crashOnErrors;
}

- (void)setCrashOnErrors:(BOOL)a3
{
  self->_crashOnErrors = a3;
}

- (BOOL)logsErrors
{
  return self->_logsErrors;
}

- (void)setLogsErrors:(BOOL)a3
{
  self->_logsErrors = a3;
}

- (NSMutableDictionary)cachedStatements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCachedStatements:(id)a3
{
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (void)setIsOpen:(BOOL)a3
{
  self->_BOOL isOpen = a3;
}

- (BOOL)isInTransaction
{
  return self->_isInTransaction;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)initWithPath:.cold.1()
{
}

- (void)databaseExists
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a1, a2, @"FMDatabase.m", 564, @"The _bmFMDatabase %@ is not open.", a2 object file lineNumber description];

  abort();
}

- (void)executeQuery:(void *)a1 withArgumentsInArray:(uint64_t)a2 orDictionary:orVAList:shouldBind:.cold.1(void *a1, uint64_t a2)
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = [a1 lastErrorCode];
  uint64_t v6 = [a1 lastErrorMessage];
  [v4 handleFailureInMethod:a2, a1, @"FMDatabase.m", 875, @"DB Error: %d \"%@\"", v5, v6 object file lineNumber description];

  abort();
}

- (void)checkpoint:(void *)a1 name:(uint64_t)a2 logFrameCount:checkpointCount:error:.cold.1(void *a1, uint64_t a2)
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = [a1 lastErrorMessage];
  [v4 handleFailureInMethod:a2, a1, @"FMDatabase.m", 1351, @"%@", v5 object file lineNumber description];

  abort();
}

- (id)stringForQuery:(id)a3
{
  BOOL v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v7 shouldBind:1];
  BOOL v4 = 0;
  if ([v3 next])
  {
    BOOL v4 = [v3 stringForColumnIndex:0];
    [v3 close];
    [v3 setParentDB:0];
  }

  return v4;
}

- (int)intForQuery:(id)a3
{
  BOOL v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v6 shouldBind:1];
  if ([v3 next])
  {
    int v4 = [v3 intForColumnIndex:0];
    [v3 close];
    [v3 setParentDB:0];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int64_t)longForQuery:(id)a3
{
  BOOL v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v6 shouldBind:1];
  int64_t v4 = 0;
  if ([v3 next])
  {
    int64_t v4 = [v3 longForColumnIndex:0];
    [v3 close];
    [v3 setParentDB:0];
  }

  return v4;
}

- (BOOL)BOOLForQuery:(id)a3
{
  BOOL v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v6 shouldBind:1];
  if ([v3 next])
  {
    char v4 = [v3 BOOLForColumnIndex:0];
    [v3 close];
    [v3 setParentDB:0];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (double)doubleForQuery:(id)a3
{
  BOOL v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v7 shouldBind:1];
  double v4 = 0.0;
  if ([v3 next])
  {
    [v3 doubleForColumnIndex:0];
    double v4 = v5;
    [v3 close];
    [v3 setParentDB:0];
  }

  return v4;
}

- (id)dataForQuery:(id)a3
{
  BOOL v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v7 shouldBind:1];
  double v4 = 0;
  if ([v3 next])
  {
    double v4 = [v3 dataForColumnIndex:0];
    [v3 close];
    [v3 setParentDB:0];
  }

  return v4;
}

- (id)dateForQuery:(id)a3
{
  BOOL v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v7 shouldBind:1];
  double v4 = 0;
  if ([v3 next])
  {
    double v4 = [v3 dateForColumnIndex:0];
    [v3 close];
    [v3 setParentDB:0];
  }

  return v4;
}

- (BOOL)tableExists:(id)a3
{
  double v4 = [a3 lowercaseString];
  double v5 = [(_bmFMDatabase *)self executeQuery:@"select [sql] from sqlite_master where [type] = 'table' and lower(name) = ?", v4];
  char v6 = [v5 next];
  [v5 close];

  return v6;
}

- (id)getSchema
{
  return [(_bmFMDatabase *)self executeQuery:@"SELECT type, name, tbl_name, rootpage, sql FROM (SELECT * FROM sqlite_master UNION ALL SELECT * FROM sqlite_temp_master) WHERE type != 'meta' AND name NOT LIKE 'sqlite_%' ORDER BY tbl_name, type DESC, name"];
}

- (id)getTableSchema:(id)a3
{
  double v4 = (objc_class *)NSString;
  id v5 = a3;
  char v6 = (void *)[[v4 alloc] initWithFormat:@"pragma table_info('%@')", v5];

  uint64_t v7 = [(_bmFMDatabase *)self executeQuery:v6];

  return v7;
}

- (BOOL)columnExists:(id)a3 inTableWithName:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 lowercaseString];
  id v8 = [v6 lowercaseString];

  id v9 = [(_bmFMDatabase *)self getTableSchema:v7];
  do
  {
    int v10 = [v9 next];
    if (!v10) {
      break;
    }
    id v11 = [v9 stringForColumn:@"name"];
    id v12 = [v11 lowercaseString];
    int v13 = [v12 isEqualToString:v8];
  }
  while (!v13);
  [v9 close];

  return v10;
}

- (unsigned)applicationID
{
  v2 = [(_bmFMDatabase *)self executeQuery:@"pragma application_id"];
  if ([v2 next]) {
    unsigned int v3 = [v2 longLongIntForColumnIndex:0];
  }
  else {
    unsigned int v3 = 0;
  }
  [v2 close];

  return v3;
}

- (void)setApplicationID:(unsigned int)a3
{
  id v5 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"pragma application_id=%d", *(void *)&a3);
  double v4 = [(_bmFMDatabase *)self executeQuery:v5];
  [v4 next];
  [v4 close];
}

- (unsigned)userVersion
{
  v2 = [(_bmFMDatabase *)self executeQuery:@"pragma user_version"];
  if ([v2 next]) {
    unsigned int v3 = [v2 longLongIntForColumnIndex:0];
  }
  else {
    unsigned int v3 = 0;
  }
  [v2 close];

  return v3;
}

- (void)setUserVersion:(unsigned int)a3
{
  id v5 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"pragma user_version = %d", *(void *)&a3);
  double v4 = [(_bmFMDatabase *)self executeQuery:v5];
  [v4 next];
  [v4 close];
}

- (BOOL)columnExists:(id)a3 columnName:(id)a4
{
  return [(_bmFMDatabase *)self columnExists:a4 inTableWithName:a3];
}

- (BOOL)validateSQL:(id)a3 error:(id *)a4
{
  ppStmt = 0;
  id v6 = a3;
  uint64_t v7 = [(_bmFMDatabase *)self sqliteHandle];
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  int v10 = sqlite3_prepare_v2(v7, v9, -1, &ppStmt, 0);
  int v11 = v10;
  if (a4 && v10)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F281F8];
    uint64_t v14 = [(_bmFMDatabase *)self lastErrorCode];
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    id v16 = [(_bmFMDatabase *)self lastErrorMessage];
    char v17 = [v15 dictionaryWithObject:v16 forKey:*MEMORY[0x1E4F28568]];
    *a4 = [v12 errorWithDomain:v13 code:v14 userInfo:v17];
  }
  sqlite3_finalize(ppStmt);
  return v11 == 0;
}

@end