@interface SFSQLiteStatement
- (BOOL)isReset;
- (BOOL)step;
- (NSDictionary)indexesByColumnName;
- (NSMutableArray)temporaryBoundObjects;
- (NSString)SQL;
- (SFSQLite)SQLite;
- (SFSQLiteStatement)initWithSQLite:(id)a3 SQL:(id)a4 handle:(sqlite3_stmt *)a5;
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
- (unint64_t)indexForColumnName:(id)a3;
- (void)bindBlob:(id)a3 atIndex:(unint64_t)a4;
- (void)bindDouble:(double)a3 atIndex:(unint64_t)a4;
- (void)bindInt64:(int64_t)a3 atIndex:(unint64_t)a4;
- (void)bindInt:(int)a3 atIndex:(unint64_t)a4;
- (void)bindNullAtIndex:(unint64_t)a3;
- (void)bindText:(id)a3 atIndex:(unint64_t)a4;
- (void)bindValue:(id)a3 atIndex:(unint64_t)a4;
- (void)bindValues:(id)a3;
- (void)enumerateColumnsUsingBlock:(id)a3;
- (void)finalizeStatement;
- (void)reset;
- (void)resetAfterStepError;
- (void)setIndexesByColumnName:(id)a3;
- (void)setReset:(BOOL)a3;
- (void)setTemporaryBoundObjects:(id)a3;
@end

@implementation SFSQLiteStatement

- (BOOL)step
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_reset) {
    self->_reset = 0;
  }
  int v3 = sqlite3_step(self->_handle);
  if ((v3 & 0xFE) != 0x64)
  {
    [(SFSQLiteStatement *)self resetAfterStepError];
    v4 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      v7[0] = 67109378;
      v7[1] = v3;
      __int16 v8 = 2112;
      v9 = SQL;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "sfsqlite: Failed to step (%d): \"%@\"", (uint8_t *)v7, 0x12u);
    }
  }
  return v3 == 100;
}

- (void)reset
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_reset)
  {
    if (sqlite3_reset(self->_handle))
    {
      int v3 = secLogObjForScope("SecError");
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        return;
      }
      SQL = self->_SQL;
      int v7 = 138412290;
      __int16 v8 = SQL;
      v5 = "sfsqlite: Error resetting prepared statement: \"%@\"";
    }
    else
    {
      if (!sqlite3_clear_bindings(self->_handle))
      {
        [(NSMutableArray *)self->_temporaryBoundObjects removeAllObjects];
        self->_reset = 1;
        return;
      }
      int v3 = secLogObjForScope("SecError");
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      v6 = self->_SQL;
      int v7 = 138412290;
      __int16 v8 = v6;
      v5 = "sfsqlite: Error clearing prepared statement bindings: \"%@\"";
    }
    _os_log_impl(&dword_18B299000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0xCu);
    goto LABEL_9;
  }
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
      [(SFSQLiteStatement *)self bindValue:v5 atIndex:v4];

      ++v4;
    }
    while (v4 < [v6 count]);
  }
}

- (void)bindValue:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v8 = +[SFObjCType typeForValue:v7];
    if ([v8 isIntegerNumber])
    {
      if ((unint64_t)[v8 size] > 4) {
        -[SFSQLiteStatement bindInt64:atIndex:](self, "bindInt64:atIndex:", [v7 longLongValue], a4);
      }
      else {
        -[SFSQLiteStatement bindInt:atIndex:](self, "bindInt:atIndex:", [v7 intValue], a4);
      }
    }
    else
    {
      if (([v8 isFloatingPointNumber] & 1) == 0)
      {
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2 object:self file:@"SFSQLiteStatement.m" lineNumber:208 description:@"Expected number type to be either integer or floating point"];
      }
      if ([v8 code] != 11 && objc_msgSend(v8, "code") != 10)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2, self, @"SFSQLiteStatement.m", 209, @"Unexpected floating point number type: %@", v8 object file lineNumber description];
      }
      [v7 doubleValue];
      -[SFSQLiteStatement bindDouble:atIndex:](self, "bindDouble:atIndex:", a4);
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SFSQLiteStatement *)self bindBlob:v7 atIndex:a4];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    memset(buf, 170, 16);
    [v7 getUUIDBytes:buf];
    uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:16];
LABEL_15:
    __int16 v8 = (void *)v9;
    uint64_t v10 = [(SFSQLiteStatement *)self retainedTemporaryBoundObject:v9];
    [(SFSQLiteStatement *)self bindBlob:v10 atIndex:a4];
LABEL_16:

LABEL_18:
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SFSQLiteStatement *)self bindText:v7 atIndex:a4];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SFSQLiteStatement *)self bindNullAtIndex:a4];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 timeIntervalSinceReferenceDate];
    -[SFSQLiteStatement bindDouble:atIndex:](self, "bindDouble:atIndex:", a4);
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v8 = [v7 absoluteString];
    uint64_t v10 = [(SFSQLiteStatement *)self retainedTemporaryBoundObject:v8];
    [(SFSQLiteStatement *)self bindText:v10 atIndex:a4];
    goto LABEL_16;
  }
  v11 = secLogObjForScope("SecError");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = objc_opt_class();
    id v12 = *(id *)&buf[4];
    _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "sfsqlite: Can't bind object of type %@", buf, 0xCu);
  }
LABEL_19:
}

- (void)bindText:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (self->_reset)
  {
    if (v6)
    {
      if (sqlite3_bind_text(self->_handle, a4 + 1, (const char *)[v6 UTF8String], -1, 0))
      {
        __int16 v8 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          SQL = self->_SQL;
          int v12 = 134218242;
          unint64_t v13 = a4;
          __int16 v14 = 2112;
          v15 = SQL;
          _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "sfsqlite: Error binding text at %ld: \"%@\"", (uint8_t *)&v12, 0x16u);
        }
      }
    }
    else
    {
      [(SFSQLiteStatement *)self bindNullAtIndex:a4];
    }
  }
  else
  {
    uint64_t v10 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_SQL;
      int v12 = 138412290;
      unint64_t v13 = (unint64_t)v11;
      _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "sfsqlite: Statement is not reset: \"%@\"", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (BOOL)isReset
{
  return self->_reset;
}

- (void)bindInt64:(int64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_reset)
  {
    if (!sqlite3_bind_int64(self->_handle, a4 + 1, a3)) {
      return;
    }
    id v6 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      int v12 = 134218242;
      unint64_t v13 = a4;
      __int16 v14 = 2112;
      v15 = SQL;
      __int16 v8 = "sfsqlite: Error binding int64 at %ld: \"%@\"";
      uint64_t v9 = v6;
      uint32_t v10 = 22;
LABEL_7:
      _os_log_impl(&dword_18B299000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    id v6 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_SQL;
      int v12 = 138412290;
      unint64_t v13 = (unint64_t)v11;
      __int16 v8 = "sfsqlite: Statement is not reset: \"%@\"";
      uint64_t v9 = v6;
      uint32_t v10 = 12;
      goto LABEL_7;
    }
  }
}

- (id)allObjectsByColumnName
{
  unint64_t v3 = [(SFSQLiteStatement *)self columnCount];
  unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__SFSQLiteStatement_allObjectsByColumnName__block_invoke;
  v9[3] = &unk_1E5475748;
  v9[4] = self;
  id v5 = v4;
  id v10 = v5;
  [(SFSQLiteStatement *)self enumerateColumnsUsingBlock:v9];
  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (unint64_t)columnCount
{
  if (self->_reset)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"SFSQLiteStatement.m", 241, @"Statement is reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  return sqlite3_column_count(self->_handle);
}

- (void)enumerateColumnsUsingBlock:(id)a3
{
  int v12 = (void (**)(void))a3;
  unint64_t v4 = [(SFSQLiteStatement *)self columnCount];
  unint64_t v5 = v4;
  if (self->_indexesByColumnName)
  {
    id v6 = 0;
    if (!v4) {
      goto LABEL_11;
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v4];
    if (!v5) {
      goto LABEL_11;
    }
  }
  uint64_t v7 = 0;
  do
  {
    __int16 v8 = [(SFSQLiteStatement *)self columnNameAtIndex:v7];
    if (v6)
    {
      uint64_t v9 = [NSNumber numberWithUnsignedInteger:v7];
      [v6 setObject:v9 forKeyedSubscript:v8];
    }
    if (v12) {
      v12[2]();
    }

    ++v7;
  }
  while (v5 != v7);
LABEL_11:
  if (v6)
  {
    id v10 = (NSDictionary *)[v6 copy];
    indexesByColumnName = self->_indexesByColumnName;
    self->_indexesByColumnName = v10;
  }
}

void __43__SFSQLiteStatement_allObjectsByColumnName__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  unint64_t v5 = [*(id *)(a1 + 32) objectAtIndex:a2];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = -[SFSQLiteStatement columnTypeAtIndex:](self, "columnTypeAtIndex:") - 1;
  id v6 = 0;
  switch(v5)
  {
    case 0:
      id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SFSQLiteStatement int64AtIndex:](self, "int64AtIndex:", a3));
      break;
    case 1:
      __int16 v8 = NSNumber;
      [(SFSQLiteStatement *)self doubleAtIndex:a3];
      id v6 = objc_msgSend(v8, "numberWithDouble:");
      break;
    case 2:
      id v6 = [(SFSQLiteStatement *)self textAtIndex:a3];
      break;
    case 3:
      id v6 = [(SFSQLiteStatement *)self blobAtIndex:a3];
      break;
    case 4:
      break;
    default:
      uint64_t v7 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = 0;
        _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "sfsqlite: Unexpected column type: %d", (uint8_t *)v10, 8u);
      }

      id v6 = 0;
      break;
  }

  return v6;
}

- (int64_t)int64AtIndex:(unint64_t)a3
{
  int v3 = a3;
  if (self->_reset)
  {
    __int16 v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SFSQLiteStatement.m", 274, @"Statement is reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  handle = self->_handle;

  return sqlite3_column_int64(handle, v3);
}

- (int)columnTypeAtIndex:(unint64_t)a3
{
  int v3 = a3;
  if (self->_reset)
  {
    __int16 v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SFSQLiteStatement.m", 247, @"Statement is reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  handle = self->_handle;

  return sqlite3_column_type(handle, v3);
}

- (id)columnNameAtIndex:(unint64_t)a3
{
  int v3 = a3;
  if (self->_reset)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SFSQLiteStatement.m", 253, @"Statement is reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  int v5 = NSString;
  id v6 = sqlite3_column_name(self->_handle, v3);

  return (id)[v5 stringWithUTF8String:v6];
}

- (void)bindDouble:(double)a3 atIndex:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_reset)
  {
    if (!sqlite3_bind_double(self->_handle, a4 + 1, a3)) {
      return;
    }
    id v6 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      int v12 = 134218242;
      unint64_t v13 = a4;
      __int16 v14 = 2112;
      v15 = SQL;
      __int16 v8 = "sfsqlite: Error binding double at %ld: \"%@\"";
      uint64_t v9 = v6;
      uint32_t v10 = 22;
LABEL_7:
      _os_log_impl(&dword_18B299000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    id v6 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = self->_SQL;
      int v12 = 138412290;
      unint64_t v13 = (unint64_t)v11;
      __int16 v8 = "sfsqlite: Statement is not reset: \"%@\"";
      uint64_t v9 = v6;
      uint32_t v10 = 12;
      goto LABEL_7;
    }
  }
}

- (void)bindBlob:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (self->_reset)
  {
    if (v6)
    {
      if (sqlite3_bind_blob(self->_handle, a4 + 1, (const void *)[v6 bytes], objc_msgSend(v6, "length"), 0))
      {
        __int16 v8 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          SQL = self->_SQL;
          int v12 = 134218242;
          unint64_t v13 = a4;
          __int16 v14 = 2112;
          v15 = SQL;
          _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "sfsqlite: Error binding blob at %ld: \"%@\"", (uint8_t *)&v12, 0x16u);
        }
      }
    }
    else
    {
      [(SFSQLiteStatement *)self bindNullAtIndex:a4];
    }
  }
  else
  {
    uint32_t v10 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = self->_SQL;
      int v12 = 138412290;
      unint64_t v13 = (unint64_t)v11;
      _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "sfsqlite: Statement is not reset: \"%@\"", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesByColumnName, 0);
  objc_storeStrong((id *)&self->_temporaryBoundObjects, 0);
  objc_storeStrong((id *)&self->_SQL, 0);

  objc_destroyWeak((id *)&self->_SQLite);
}

- (void)setIndexesByColumnName:(id)a3
{
}

- (NSDictionary)indexesByColumnName
{
  return self->_indexesByColumnName;
}

- (void)setTemporaryBoundObjects:(id)a3
{
}

- (NSMutableArray)temporaryBoundObjects
{
  return self->_temporaryBoundObjects;
}

- (void)setReset:(BOOL)a3
{
  self->_reset = a3;
}

- (sqlite3_stmt)handle
{
  return self->_handle;
}

- (NSString)SQL
{
  return self->_SQL;
}

- (SFSQLite)SQLite
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_SQLite);

  return (SFSQLite *)WeakRetained;
}

- (id)allObjects
{
  unint64_t v3 = [(SFSQLiteStatement *)self columnCount];
  unint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__SFSQLiteStatement_allObjects__block_invoke;
  v8[3] = &unk_1E5475748;
  id v5 = v4;
  id v9 = v5;
  uint32_t v10 = self;
  [(SFSQLiteStatement *)self enumerateColumnsUsingBlock:v8];
  id v6 = v5;

  return v6;
}

void __31__SFSQLiteStatement_allObjects__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 40) objectAtIndex:a2];
  id v6 = (id)v4;
  if (v4)
  {
    [*(id *)(a1 + 32) setObject:v4 atIndexedSubscript:a2];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a2];
  }
}

- (id)textAtIndex:(unint64_t)a3
{
  int v3 = a3;
  if (self->_reset)
  {
    __int16 v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SFSQLiteStatement.m", 298, @"Statement is reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  id v5 = (void *)sqlite3_column_text(self->_handle, v3);
  if (v5)
  {
    id v5 = [NSString stringWithUTF8String:v5];
  }

  return v5;
}

- (id)blobAtIndex:(unint64_t)a3
{
  int v3 = a3;
  if (self->_reset)
  {
    __int16 v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SFSQLiteStatement.m", 286, @"Statement is reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  id v5 = (void *)sqlite3_column_blob(self->_handle, v3);
  if (v5)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v5, sqlite3_column_bytes(self->_handle, v3));
  }

  return v5;
}

- (double)doubleAtIndex:(unint64_t)a3
{
  int v3 = a3;
  if (self->_reset)
  {
    __int16 v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SFSQLiteStatement.m", 280, @"Statement is reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  handle = self->_handle;

  return sqlite3_column_double(handle, v3);
}

- (int)intAtIndex:(unint64_t)a3
{
  int v3 = a3;
  if (self->_reset)
  {
    __int16 v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SFSQLiteStatement.m", 268, @"Statement is reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  handle = self->_handle;

  return sqlite3_column_int(handle, v3);
}

- (unint64_t)indexForColumnName:(id)a3
{
  id v4 = a3;
  indexesByColumnName = self->_indexesByColumnName;
  if (!indexesByColumnName)
  {
    [(SFSQLiteStatement *)self enumerateColumnsUsingBlock:0];
    indexesByColumnName = self->_indexesByColumnName;
  }
  id v6 = [(NSDictionary *)indexesByColumnName objectForKeyedSubscript:v4];
  uint64_t v7 = v6;
  if (v6) {
    unint64_t v8 = [v6 unsignedIntegerValue];
  }
  else {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (id)retainedTemporaryBoundObject:(id)a3
{
  id v4 = a3;
  temporaryBoundObjects = self->_temporaryBoundObjects;
  if (!temporaryBoundObjects)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    uint64_t v7 = self->_temporaryBoundObjects;
    self->_temporaryBoundObjects = v6;

    temporaryBoundObjects = self->_temporaryBoundObjects;
  }
  [(NSMutableArray *)temporaryBoundObjects addObject:v4];

  return v4;
}

- (void)bindNullAtIndex:(unint64_t)a3
{
  if (sqlite3_bind_null(self->_handle, a3 + 1))
  {
    int v3 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_18B299000, v3, OS_LOG_TYPE_DEFAULT, "sfsqlite: sqlite3_bind_null error", v4, 2u);
    }
  }
}

- (void)bindInt:(int)a3 atIndex:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_reset)
  {
    if (!sqlite3_bind_int(self->_handle, a4 + 1, a3)) {
      return;
    }
    id v6 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      int v12 = 134218242;
      unint64_t v13 = a4;
      __int16 v14 = 2112;
      v15 = SQL;
      unint64_t v8 = "sfsqlite: Error binding int at %ld: \"%@\"";
      id v9 = v6;
      uint32_t v10 = 22;
LABEL_7:
      _os_log_impl(&dword_18B299000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    id v6 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = self->_SQL;
      int v12 = 138412290;
      unint64_t v13 = (unint64_t)v11;
      unint64_t v8 = "sfsqlite: Statement is not reset: \"%@\"";
      id v9 = v6;
      uint32_t v10 = 12;
      goto LABEL_7;
    }
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

- (void)finalizeStatement
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_reset)
  {
    if (!sqlite3_finalize(self->_handle)) {
      return;
    }
    int v3 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      int v7 = 138412290;
      unint64_t v8 = SQL;
      id v5 = "sfsqlite: Error finalizing prepared statement: \"%@\"";
LABEL_7:
      _os_log_impl(&dword_18B299000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    int v3 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = self->_SQL;
      int v7 = 138412290;
      unint64_t v8 = v6;
      id v5 = "sfsqlite: Statement not reset after last use: \"%@\"";
      goto LABEL_7;
    }
  }
}

- (SFSQLiteStatement)initWithSQLite:(id)a3 SQL:(id)a4 handle:(sqlite3_stmt *)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFSQLiteStatement;
  uint32_t v10 = [(SFSQLiteStatement *)&v13 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_SQLite, v8);
    objc_storeStrong((id *)&v11->_SQL, a4);
    v11->_handle = a5;
    v11->_reset = 1;
  }

  return v11;
}

@end