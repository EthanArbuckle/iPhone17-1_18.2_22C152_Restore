@interface ACCSQLiteStatement
- (ACCSQLite)SQLite;
- (ACCSQLiteStatement)initWithSQLite:(id)a3 SQL:(id)a4 handle:(sqlite3_stmt *)a5;
- (BOOL)isReset;
- (BOOL)step;
- (NSMutableArray)temporaryBoundObjects;
- (NSString)SQL;
- (double)doubleAtIndex:(unint64_t)a3;
- (id)allObjects;
- (id)allObjectsByColumnName;
- (id)blobAtIndex:(unint64_t)a3;
- (id)columnNameAtIndex:(unint64_t)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)retainedTemporaryBoundObject:(id)a3;
- (id)textAtIndex:(unint64_t)a3;
- (int)columnTypeAtIndex:(unint64_t)a3;
- (int)intAtIndex:(unint64_t)a3;
- (int64_t)int64AtIndex:(unint64_t)a3;
- (sqlite3_stmt)handle;
- (unint64_t)columnCount;
- (void)bindBlob:(id)a3 atIndex:(unint64_t)a4;
- (void)bindDouble:(double)a3 atIndex:(unint64_t)a4;
- (void)bindInt64:(int64_t)a3 atIndex:(unint64_t)a4;
- (void)bindInt:(int)a3 atIndex:(unint64_t)a4;
- (void)bindNullAtIndex:(unint64_t)a3;
- (void)bindText:(id)a3 atIndex:(unint64_t)a4;
- (void)bindValue:(id)a3 atIndex:(unint64_t)a4;
- (void)bindValues:(id)a3;
- (void)finalizeStatement;
- (void)reset;
- (void)resetAfterStepError;
- (void)setReset:(BOOL)a3;
- (void)setTemporaryBoundObjects:(id)a3;
@end

@implementation ACCSQLiteStatement

- (ACCSQLiteStatement)initWithSQLite:(id)a3 SQL:(id)a4 handle:(sqlite3_stmt *)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ACCSQLiteStatement;
  v10 = [(ACCSQLiteStatement *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_SQLite, v8);
    objc_storeStrong((id *)&v11->_SQL, a4);
    v11->_handle = a5;
    v11->_reset = 1;
  }

  return v11;
}

- (void)finalizeStatement
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!self->_reset)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    SQL = self->_SQL;
    int v7 = 138412290;
    id v8 = SQL;
    v4 = MEMORY[0x263EF8438];
    v5 = "[#ACCEventLogger] accsqlite: Statement not reset after last use: \"%@\"";
    goto LABEL_7;
  }
  if (sqlite3_finalize(self->_handle) && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    v3 = self->_SQL;
    int v7 = 138412290;
    id v8 = v3;
    v4 = MEMORY[0x263EF8438];
    v5 = "[#ACCEventLogger] accsqlite: Error finalizing prepared statement: \"%@\"";
LABEL_7:
    _os_log_impl(&dword_222CE3000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0xCu);
  }
}

- (void)resetAfterStepError
{
  if (!self->_reset)
  {
    sqlite3_reset(self->_handle);
    sqlite3_clear_bindings(self->_handle);
    [(NSMutableArray *)self->_temporaryBoundObjects removeAllObjects];
    self->_reset = 1;
  }
}

- (BOOL)step
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_reset) {
    self->_reset = 0;
  }
  int v3 = sqlite3_step(self->_handle);
  if ((v3 & 0xFE) != 0x64)
  {
    [(ACCSQLiteStatement *)self resetAfterStepError];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      v6[0] = 67109378;
      v6[1] = v3;
      __int16 v7 = 2112;
      id v8 = SQL;
      _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Failed to step (%d): \"%@\"", (uint8_t *)v6, 0x12u);
    }
  }
  return v3 == 100;
}

- (void)reset
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!self->_reset)
  {
    if (sqlite3_reset(self->_handle))
    {
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      SQL = self->_SQL;
      int v7 = 138412290;
      id v8 = SQL;
      v4 = MEMORY[0x263EF8438];
      v5 = "[#ACCEventLogger] accsqlite: Error resetting prepared statement: \"%@\"";
LABEL_8:
      _os_log_impl(&dword_222CE3000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0xCu);
      return;
    }
    if (sqlite3_clear_bindings(self->_handle))
    {
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      v6 = self->_SQL;
      int v7 = 138412290;
      id v8 = v6;
      v4 = MEMORY[0x263EF8438];
      v5 = "[#ACCEventLogger] accsqlite: Error clearing prepared statement bindings: \"%@\"";
      goto LABEL_8;
    }
    [(NSMutableArray *)self->_temporaryBoundObjects removeAllObjects];
    self->_reset = 1;
  }
}

- (void)bindInt:(int)a3 atIndex:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!self->_reset)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    SQL = self->_SQL;
    int v11 = 138412290;
    unint64_t v12 = (unint64_t)SQL;
    int v7 = MEMORY[0x263EF8438];
    id v8 = "[#ACCEventLogger] accsqlite: Statement is not reset: \"%@\"";
    uint32_t v9 = 12;
    goto LABEL_7;
  }
  if (sqlite3_bind_int(self->_handle, a4 + 1, a3) && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_SQL;
    int v11 = 134218242;
    unint64_t v12 = a4;
    __int16 v13 = 2112;
    v14 = v6;
    int v7 = MEMORY[0x263EF8438];
    id v8 = "[#ACCEventLogger] accsqlite: Error binding int at %ld: \"%@\"";
    uint32_t v9 = 22;
LABEL_7:
    _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v9);
  }
}

- (void)bindInt64:(int64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!self->_reset)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    SQL = self->_SQL;
    int v11 = 138412290;
    unint64_t v12 = (unint64_t)SQL;
    int v7 = MEMORY[0x263EF8438];
    id v8 = "[#ACCEventLogger] accsqlite: Statement is not reset: \"%@\"";
    uint32_t v9 = 12;
    goto LABEL_7;
  }
  if (sqlite3_bind_int64(self->_handle, a4 + 1, a3) && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_SQL;
    int v11 = 134218242;
    unint64_t v12 = a4;
    __int16 v13 = 2112;
    v14 = v6;
    int v7 = MEMORY[0x263EF8438];
    id v8 = "[#ACCEventLogger] accsqlite: Error binding int64 at %ld: \"%@\"";
    uint32_t v9 = 22;
LABEL_7:
    _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v9);
  }
}

- (void)bindDouble:(double)a3 atIndex:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!self->_reset)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    SQL = self->_SQL;
    int v11 = 138412290;
    unint64_t v12 = (unint64_t)SQL;
    int v7 = MEMORY[0x263EF8438];
    id v8 = "[#ACCEventLogger] accsqlite: Statement is not reset: \"%@\"";
    uint32_t v9 = 12;
    goto LABEL_7;
  }
  if (sqlite3_bind_double(self->_handle, a4 + 1, a3) && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_SQL;
    int v11 = 134218242;
    unint64_t v12 = a4;
    __int16 v13 = 2112;
    v14 = v6;
    int v7 = MEMORY[0x263EF8438];
    id v8 = "[#ACCEventLogger] accsqlite: Error binding double at %ld: \"%@\"";
    uint32_t v9 = 22;
LABEL_7:
    _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v9);
  }
}

- (void)bindBlob:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = v6;
  if (self->_reset)
  {
    if (!v6)
    {
      [(ACCSQLiteStatement *)self bindNullAtIndex:a4];
      goto LABEL_10;
    }
    if (sqlite3_bind_blob(self->_handle, a4 + 1, (const void *)[v6 bytes], objc_msgSend(v6, "length"), 0)&& os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      int v13 = 134218242;
      unint64_t v14 = a4;
      __int16 v15 = 2112;
      v16 = SQL;
      uint32_t v9 = MEMORY[0x263EF8438];
      v10 = "[#ACCEventLogger] accsqlite: Error binding blob at %ld: \"%@\"";
      uint32_t v11 = 22;
LABEL_8:
      _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v11);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = self->_SQL;
    int v13 = 138412290;
    unint64_t v14 = (unint64_t)v12;
    uint32_t v9 = MEMORY[0x263EF8438];
    v10 = "[#ACCEventLogger] accsqlite: Statement is not reset: \"%@\"";
    uint32_t v11 = 12;
    goto LABEL_8;
  }
LABEL_10:
}

- (void)bindText:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = v6;
  if (self->_reset)
  {
    if (!v6)
    {
      [(ACCSQLiteStatement *)self bindNullAtIndex:a4];
      goto LABEL_10;
    }
    if (sqlite3_bind_text(self->_handle, a4 + 1, (const char *)[v6 UTF8String], -1, 0)
      && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      int v13 = 134218242;
      unint64_t v14 = a4;
      __int16 v15 = 2112;
      v16 = SQL;
      uint32_t v9 = MEMORY[0x263EF8438];
      v10 = "[#ACCEventLogger] accsqlite: Error binding text at %ld: \"%@\"";
      uint32_t v11 = 22;
LABEL_8:
      _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v11);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = self->_SQL;
    int v13 = 138412290;
    unint64_t v14 = (unint64_t)v12;
    uint32_t v9 = MEMORY[0x263EF8438];
    v10 = "[#ACCEventLogger] accsqlite: Statement is not reset: \"%@\"";
    uint32_t v11 = 12;
    goto LABEL_8;
  }
LABEL_10:
}

- (void)bindNullAtIndex:(unint64_t)a3
{
  if (sqlite3_bind_null(self->_handle, a3 + 1))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v3 = 0;
      _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: sqlite3_bind_null error", v3, 2u);
    }
  }
}

- (id)retainedTemporaryBoundObject:(id)a3
{
  id v4 = a3;
  temporaryBoundObjects = self->_temporaryBoundObjects;
  if (!temporaryBoundObjects)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    int v7 = self->_temporaryBoundObjects;
    self->_temporaryBoundObjects = v6;

    temporaryBoundObjects = self->_temporaryBoundObjects;
  }
  [(NSMutableArray *)temporaryBoundObjects addObject:v4];
  return v4;
}

- (void)bindValue:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = +[ACCObjCType typeForValue:v6];
    if ([v7 isIntegerNumber])
    {
      if ((unint64_t)[v7 size] <= 4)
      {
LABEL_4:
        -[ACCSQLiteStatement bindInt:atIndex:](self, "bindInt:atIndex:", [v6 intValue], a4);
LABEL_13:

        goto LABEL_14;
      }
    }
    else if ([v7 code] == 10)
    {
      goto LABEL_4;
    }
    -[ACCSQLiteStatement bindInt64:atIndex:](self, "bindInt64:atIndex:", [v6 longLongValue], a4);
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(ACCSQLiteStatement *)self bindBlob:v6 atIndex:a4];
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    [v6 getUUIDBytes:&v11];
    uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v11 length:16];
LABEL_11:
    int v7 = (void *)v8;
    uint32_t v9 = [(ACCSQLiteStatement *)self retainedTemporaryBoundObject:v8];
    [(ACCSQLiteStatement *)self bindBlob:v9 atIndex:a4];
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(ACCSQLiteStatement *)self bindText:v6 atIndex:a4];
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(ACCSQLiteStatement *)self bindNullAtIndex:a4];
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 timeIntervalSinceReferenceDate];
    -[ACCSQLiteStatement bindDouble:atIndex:](self, "bindDouble:atIndex:", a4);
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = [v6 absoluteString];
    uint32_t v9 = [(ACCSQLiteStatement *)self retainedTemporaryBoundObject:v7];
    [(ACCSQLiteStatement *)self bindText:v9 atIndex:a4];
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v11) = 138412290;
    *(void *)((char *)&v11 + 4) = objc_opt_class();
    id v10 = *(id *)((char *)&v11 + 4);
    _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Can't bind object of type %@", (uint8_t *)&v11, 0xCu);
  }
LABEL_14:
}

- (void)bindValues:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [v6 objectAtIndexedSubscript:v4];
      [(ACCSQLiteStatement *)self bindValue:v5 atIndex:v4];

      ++v4;
    }
    while (v4 < [v6 count]);
  }
}

- (unint64_t)columnCount
{
  return sqlite3_column_count(self->_handle);
}

- (int)columnTypeAtIndex:(unint64_t)a3
{
  return sqlite3_column_type(self->_handle, a3);
}

- (id)columnNameAtIndex:(unint64_t)a3
{
  int v3 = NSString;
  unint64_t v4 = sqlite3_column_name(self->_handle, a3);
  return (id)[v3 stringWithUTF8String:v4];
}

- (int)intAtIndex:(unint64_t)a3
{
  return sqlite3_column_int(self->_handle, a3);
}

- (int64_t)int64AtIndex:(unint64_t)a3
{
  return sqlite3_column_int64(self->_handle, a3);
}

- (double)doubleAtIndex:(unint64_t)a3
{
  return sqlite3_column_double(self->_handle, a3);
}

- (id)blobAtIndex:(unint64_t)a3
{
  int v3 = a3;
  v5 = (void *)sqlite3_column_blob(self->_handle, a3);
  if (v5)
  {
    v5 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v5, sqlite3_column_bytes(self->_handle, v3));
  }
  return v5;
}

- (id)textAtIndex:(unint64_t)a3
{
  int v3 = (void *)sqlite3_column_text(self->_handle, a3);
  if (v3)
  {
    int v3 = [NSString stringWithUTF8String:v3];
  }
  return v3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = -[ACCSQLiteStatement columnTypeAtIndex:](self, "columnTypeAtIndex:") - 1;
  id v6 = 0;
  switch(v5)
  {
    case 0:
      id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ACCSQLiteStatement int64AtIndex:](self, "int64AtIndex:", a3));
      break;
    case 1:
      int v7 = NSNumber;
      [(ACCSQLiteStatement *)self doubleAtIndex:a3];
      id v6 = objc_msgSend(v7, "numberWithDouble:");
      break;
    case 2:
      id v6 = [(ACCSQLiteStatement *)self textAtIndex:a3];
      break;
    case 3:
      id v6 = [(ACCSQLiteStatement *)self blobAtIndex:a3];
      break;
    case 4:
      break;
    default:
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109120;
        v9[1] = 0;
        _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Unexpected column type: %d", (uint8_t *)v9, 8u);
      }
      id v6 = 0;
      break;
  }
  return v6;
}

- (id)allObjects
{
  unint64_t v3 = [(ACCSQLiteStatement *)self columnCount];
  unint64_t v4 = [MEMORY[0x263EFF980] arrayWithCapacity:v3];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      id v6 = [(ACCSQLiteStatement *)self objectAtIndex:i];
      if (v6)
      {
        [v4 setObject:v6 atIndexedSubscript:i];
      }
      else
      {
        int v7 = [MEMORY[0x263EFF9D0] null];
        [v4 setObject:v7 atIndexedSubscript:i];
      }
    }
  }
  return v4;
}

- (id)allObjectsByColumnName
{
  unint64_t v3 = [(ACCSQLiteStatement *)self columnCount];
  unint64_t v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v3];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      id v6 = [(ACCSQLiteStatement *)self columnNameAtIndex:i];
      int v7 = [(ACCSQLiteStatement *)self objectAtIndex:i];
      if (v7) {
        [v4 setObject:v7 forKeyedSubscript:v6];
      }
    }
  }
  return v4;
}

- (ACCSQLite)SQLite
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_SQLite);
  return (ACCSQLite *)WeakRetained;
}

- (NSString)SQL
{
  return self->_SQL;
}

- (sqlite3_stmt)handle
{
  return self->_handle;
}

- (BOOL)isReset
{
  return self->_reset;
}

- (void)setReset:(BOOL)a3
{
  self->_reset = a3;
}

- (NSMutableArray)temporaryBoundObjects
{
  return self->_temporaryBoundObjects;
}

- (void)setTemporaryBoundObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryBoundObjects, 0);
  objc_storeStrong((id *)&self->_SQL, 0);
  objc_destroyWeak((id *)&self->_SQLite);
}

@end