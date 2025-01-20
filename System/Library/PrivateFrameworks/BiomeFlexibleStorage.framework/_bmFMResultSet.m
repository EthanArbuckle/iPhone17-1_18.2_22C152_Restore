@interface _bmFMResultSet
+ (id)resultSetWithStatement:(id)a3 usingParentDatabase:(id)a4 shouldAutoClose:(BOOL)a5;
- (BOOL)BOOLForColumn:(id)a3;
- (BOOL)BOOLForColumnIndex:(int)a3;
- (BOOL)bindWithArray:(id)a3;
- (BOOL)bindWithArray:(id)a3 orDictionary:(id)a4 orVAList:(char *)a5;
- (BOOL)bindWithDictionary:(id)a3;
- (BOOL)columnIndexIsNull:(int)a3;
- (BOOL)columnIsNull:(id)a3;
- (BOOL)hasAnotherRow;
- (BOOL)next;
- (BOOL)nextWithError:(id *)a3;
- (BOOL)shouldAutoClose;
- (BOOL)step;
- (BOOL)stepWithError:(id *)a3;
- (NSDictionary)resultDictionary;
- (NSMutableDictionary)columnNameToIndexMap;
- (NSString)query;
- (_bmFMDatabase)parentDB;
- (_bmFMStatement)statement;
- (const)UTF8StringForColumn:(id)a3;
- (const)UTF8StringForColumnIndex:(int)a3;
- (double)doubleForColumn:(id)a3;
- (double)doubleForColumnIndex:(int)a3;
- (id)columnNameForIndex:(int)a3;
- (id)dataForColumn:(id)a3;
- (id)dataForColumnIndex:(int)a3;
- (id)dataNoCopyForColumn:(id)a3;
- (id)dataNoCopyForColumnIndex:(int)a3;
- (id)dateForColumn:(id)a3;
- (id)dateForColumnIndex:(int)a3;
- (id)objectForColumn:(id)a3;
- (id)objectForColumnIndex:(int)a3;
- (id)resultDict;
- (id)stringForColumn:(id)a3;
- (id)stringForColumnIndex:(int)a3;
- (int)columnCount;
- (int)columnIndexForName:(id)a3;
- (int)intForColumn:(id)a3;
- (int)intForColumnIndex:(int)a3;
- (int)internalStepWithError:(id *)a3;
- (int64_t)longForColumn:(id)a3;
- (int64_t)longForColumnIndex:(int)a3;
- (int64_t)longLongIntForColumn:(id)a3;
- (int64_t)longLongIntForColumnIndex:(int)a3;
- (unint64_t)unsignedLongLongIntForColumn:(id)a3;
- (void)_tryLogSqliteColumnError:(int)a3;
- (void)close;
- (void)dealloc;
- (void)kvcMagic:(id)a3;
- (void)setParentDB:(id)a3;
- (void)setQuery:(id)a3;
- (void)setShouldAutoClose:(BOOL)a3;
- (void)setStatement:(id)a3;
@end

@implementation _bmFMResultSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statement, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_parentDB, 0);
  objc_storeStrong((id *)&self->_columnNameToIndexMap, 0);
}

- (BOOL)next
{
  return [(_bmFMResultSet *)self nextWithError:0];
}

- (BOOL)nextWithError:(id *)a3
{
  return [(_bmFMResultSet *)self internalStepWithError:a3] == 100;
}

- (int)internalStepWithError:(id *)a3
{
  uint64_t v5 = sqlite3_step((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]);
  uint64_t v6 = v5;
  if ((v5 - 5) <= 1)
  {
    v7 = [(_bmFMDatabase *)self->_parentDB databasePath];
    NSLog(&cfstr_SDDatabaseBusy.isa, "-[_bmFMResultSet internalStepWithError:]", 189, v7);

    NSLog(&cfstr_DatabaseBusy.isa, v13, v14);
LABEL_3:
    if (!a3) {
      goto LABEL_8;
    }
    parentDB = self->_parentDB;
    goto LABEL_5;
  }
  if ((v5 & 0xFFFFFFFE) == 0x64)
  {
LABEL_7:
    if (v6 == 100) {
      return v6;
    }
    goto LABEL_8;
  }
  if (v5 != 21)
  {
    if (v5 == 1)
    {
      v15 = sqlite3_errmsg((sqlite3 *)[(_bmFMDatabase *)self->_parentDB sqliteHandle]);
      NSLog(&cfstr_ErrorCallingSq.isa, 1, v15);
      goto LABEL_3;
    }
    v12 = sqlite3_errmsg((sqlite3 *)[(_bmFMDatabase *)self->_parentDB sqliteHandle]);
    NSLog(&cfstr_UnknownErrorCa.isa, v6, v12);
    if (a3)
    {
      *a3 = [(_bmFMDatabase *)self->_parentDB lastError];
    }
    goto LABEL_7;
  }
  v10 = sqlite3_errmsg((sqlite3 *)[(_bmFMDatabase *)self->_parentDB sqliteHandle]);
  NSLog(&cfstr_ErrorCallingSq.isa, 21, v10);
  if (a3)
  {
    parentDB = self->_parentDB;
    if (parentDB)
    {
LABEL_5:
      *a3 = [(_bmFMDatabase *)parentDB lastError];
      goto LABEL_8;
    }
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"parentDB does not exist" forKey:*MEMORY[0x1E4F28568]];
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_bmFMDatabase" code:21 userInfo:v11];
  }
LABEL_8:
  if (self->_shouldAutoClose) {
    [(_bmFMResultSet *)self close];
  }
  return v6;
}

- (int)intForColumnIndex:(int)a3
{
  v4 = [(_bmFMStatement *)self->_statement statement];
  return sqlite3_column_int(v4, a3);
}

- (id)stringForColumnIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], a3);
  uint64_t v6 = 0;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]) > (int)v3)
    {
      v7 = sqlite3_column_text((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v3);
      if (v7)
      {
        uint64_t v6 = [NSString stringWithUTF8String:v7];
        goto LABEL_8;
      }
      [(_bmFMResultSet *)self _tryLogSqliteColumnError:v3];
    }
    uint64_t v6 = 0;
  }
LABEL_8:
  return v6;
}

- (void)dealloc
{
  [(_bmFMResultSet *)self close];
  query = self->_query;
  self->_query = 0;

  columnNameToIndexMap = self->_columnNameToIndexMap;
  self->_columnNameToIndexMap = 0;

  v5.receiver = self;
  v5.super_class = (Class)_bmFMResultSet;
  [(_bmFMResultSet *)&v5 dealloc];
}

- (void)setParentDB:(id)a3
{
}

- (void)close
{
  [(_bmFMStatement *)self->_statement reset];
  statement = self->_statement;
  self->_statement = 0;

  [(_bmFMDatabase *)self->_parentDB resultSetDidClose:self];
  [(_bmFMResultSet *)self setParentDB:0];
}

- (void)setQuery:(id)a3
{
}

+ (id)resultSetWithStatement:(id)a3 usingParentDatabase:(id)a4 shouldAutoClose:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = objc_alloc_init(_bmFMResultSet);
  [(_bmFMResultSet *)v11 setStatement:v9];
  [(_bmFMResultSet *)v11 setParentDB:v10];

  [(_bmFMResultSet *)v11 setShouldAutoClose:v5];
  if ([v9 inUse])
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"FMResultSet.m", 38, @"Invalid parameter not satisfying: %@", @"![statement inUse]" object file lineNumber description];
  }
  [v9 setInUse:1];

  return v11;
}

- (void)setStatement:(id)a3
{
}

- (void)setShouldAutoClose:(BOOL)a3
{
  self->_shouldAutoClose = a3;
}

- (int)intForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];
  return [(_bmFMResultSet *)self intForColumnIndex:v4];
}

- (int)columnIndexForName:(id)a3
{
  uint64_t v4 = [a3 lowercaseString];
  BOOL v5 = [(_bmFMResultSet *)self columnNameToIndexMap];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6)
  {
    int v7 = [v6 intValue];
  }
  else
  {
    NSLog(&cfstr_WarningICouldN.isa, v4);
    int v7 = -1;
  }

  return v7;
}

- (NSMutableDictionary)columnNameToIndexMap
{
  if (!self->_columnNameToIndexMap)
  {
    int v3 = sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]);
    uint64_t v4 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v3];
    columnNameToIndexMap = self->_columnNameToIndexMap;
    self->_columnNameToIndexMap = v4;

    if (v3 >= 1)
    {
      uint64_t v6 = 0;
      do
      {
        int v7 = self->_columnNameToIndexMap;
        v8 = [NSNumber numberWithInt:v6];
        id v9 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_name((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v6));
        id v10 = [v9 lowercaseString];
        [(NSMutableDictionary *)v7 setObject:v8 forKey:v10];

        uint64_t v6 = (v6 + 1);
      }
      while (v3 != v6);
    }
  }
  v11 = self->_columnNameToIndexMap;
  return v11;
}

- (int)columnCount
{
  v2 = [(_bmFMStatement *)self->_statement statement];
  return sqlite3_column_count(v2);
}

- (void)kvcMagic:(id)a3
{
  id v10 = a3;
  int v4 = sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]);
  if (v4 >= 1)
  {
    int v5 = v4;
    uint64_t v6 = 0;
    do
    {
      int v7 = sqlite3_column_text((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v6);
      if (v7)
      {
        v8 = [NSString stringWithUTF8String:v7];
        id v9 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_name((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v6));
        [v10 setValue:v8 forKey:v9];
      }
      else
      {
        [(_bmFMResultSet *)self _tryLogSqliteColumnError:v6];
      }
      uint64_t v6 = (v6 + 1);
    }
    while (v5 != v6);
  }
}

- (id)resultDict
{
  int v3 = sqlite3_data_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v3];
    int v5 = [(_bmFMResultSet *)self columnNameToIndexMap];
    uint64_t v6 = [v5 keyEnumerator];

    uint64_t v7 = [v6 nextObject];
    if (v7)
    {
      v8 = (void *)v7;
      do
      {
        id v9 = [(_bmFMResultSet *)self objectForColumnName:v8];
        [v4 setObject:v9 forKey:v8];

        uint64_t v10 = [v6 nextObject];

        v8 = (void *)v10;
      }
      while (v10);
    }
    v11 = (void *)[v4 copy];
  }
  else
  {
    NSLog(&cfstr_WarningThereSe.isa);
    v11 = 0;
  }
  return v11;
}

- (NSDictionary)resultDictionary
{
  int v3 = sqlite3_data_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v3];
    int v5 = sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]);
    if (v5 >= 1)
    {
      int v6 = v5;
      uint64_t v7 = 0;
      do
      {
        v8 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_name((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v7));
        id v9 = [(_bmFMResultSet *)self objectForColumnIndex:v7];
        [v4 setObject:v9 forKey:v8];

        uint64_t v7 = (v7 + 1);
      }
      while (v6 != v7);
    }
  }
  else
  {
    NSLog(&cfstr_WarningThereSe.isa);
    int v4 = 0;
  }
  return (NSDictionary *)v4;
}

- (BOOL)step
{
  return [(_bmFMResultSet *)self stepWithError:0];
}

- (BOOL)stepWithError:(id *)a3
{
  return [(_bmFMResultSet *)self internalStepWithError:a3] == 101;
}

- (BOOL)hasAnotherRow
{
  return sqlite3_errcode((sqlite3 *)[(_bmFMDatabase *)self->_parentDB sqliteHandle]) == 100;
}

- (int64_t)longForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];
  return [(_bmFMResultSet *)self longForColumnIndex:v4];
}

- (int64_t)longForColumnIndex:(int)a3
{
  uint64_t v4 = [(_bmFMStatement *)self->_statement statement];
  return sqlite3_column_int64(v4, a3);
}

- (int64_t)longLongIntForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];
  return [(_bmFMResultSet *)self longLongIntForColumnIndex:v4];
}

- (int64_t)longLongIntForColumnIndex:(int)a3
{
  uint64_t v4 = [(_bmFMStatement *)self->_statement statement];
  return sqlite3_column_int64(v4, a3);
}

- (unint64_t)unsignedLongLongIntForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];
  return [(_bmFMResultSet *)self unsignedLongLongIntForColumnIndex:v4];
}

- (BOOL)BOOLForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];
  return [(_bmFMResultSet *)self BOOLForColumnIndex:v4];
}

- (BOOL)BOOLForColumnIndex:(int)a3
{
  return [(_bmFMResultSet *)self intForColumnIndex:*(void *)&a3] != 0;
}

- (double)doubleForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];
  [(_bmFMResultSet *)self doubleForColumnIndex:v4];
  return result;
}

- (double)doubleForColumnIndex:(int)a3
{
  uint64_t v4 = [(_bmFMStatement *)self->_statement statement];
  return sqlite3_column_double(v4, a3);
}

- (id)stringForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];
  return [(_bmFMResultSet *)self stringForColumnIndex:v4];
}

- (id)dateForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];
  return [(_bmFMResultSet *)self dateForColumnIndex:v4];
}

- (id)dateForColumnIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], a3);
  int v6 = 0;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]) <= (int)v3)
    {
      int v6 = 0;
    }
    else if ([(_bmFMDatabase *)self->_parentDB hasDateFormatter])
    {
      parentDB = self->_parentDB;
      v8 = [(_bmFMResultSet *)self stringForColumnIndex:v3];
      int v6 = [(_bmFMDatabase *)parentDB dateFromString:v8];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F1C9C8];
      [(_bmFMResultSet *)self doubleForColumnIndex:v3];
      int v6 = objc_msgSend(v9, "dateWithTimeIntervalSince1970:");
    }
  }
  return v6;
}

- (id)dataForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];
  return [(_bmFMResultSet *)self dataForColumnIndex:v4];
}

- (id)dataForColumnIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], a3);
  int v6 = 0;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]) > (int)v3)
    {
      uint64_t v7 = sqlite3_column_blob((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v3);
      int v8 = sqlite3_column_bytes((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v3);
      if (v7)
      {
        int v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v7 length:v8];
        goto LABEL_8;
      }
      [(_bmFMResultSet *)self _tryLogSqliteColumnError:v3];
    }
    int v6 = 0;
  }
LABEL_8:
  return v6;
}

- (id)dataNoCopyForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];
  return [(_bmFMResultSet *)self dataNoCopyForColumnIndex:v4];
}

- (id)dataNoCopyForColumnIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], a3);
  int v6 = 0;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]) > (int)v3)
    {
      uint64_t v7 = sqlite3_column_blob((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v3);
      int v8 = sqlite3_column_bytes((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v3);
      if (v7)
      {
        int v6 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v7 length:v8 freeWhenDone:0];
        goto LABEL_8;
      }
      [(_bmFMResultSet *)self _tryLogSqliteColumnError:v3];
    }
    int v6 = 0;
  }
LABEL_8:
  return v6;
}

- (BOOL)columnIndexIsNull:(int)a3
{
  return sqlite3_column_type((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], a3) == 5;
}

- (BOOL)columnIsNull:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];
  return [(_bmFMResultSet *)self columnIndexIsNull:v4];
}

- (const)UTF8StringForColumnIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], a3);
  double result = 0;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]) > (int)v3)
    {
      double result = (const char *)sqlite3_column_text((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v3);
      if (result) {
        return result;
      }
      [(_bmFMResultSet *)self _tryLogSqliteColumnError:v3];
    }
    return 0;
  }
  return result;
}

- (const)UTF8StringForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];
  return [(_bmFMResultSet *)self UTF8StringForColumnIndex:v4];
}

- (id)objectForColumnIndex:(int)a3
{
  if ((a3 & 0x80000000) == 0)
  {
    uint64_t v4 = *(void *)&a3;
    if (sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]) <= a3)
    {
      uint64_t v7 = 0;
      goto LABEL_18;
    }
    int v6 = sqlite3_column_type((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v4);
    switch(v6)
    {
      case 4:
        uint64_t v7 = [(_bmFMResultSet *)self dataForColumnIndex:v4];
        if (v7) {
          goto LABEL_18;
        }
        break;
      case 2:
        id v9 = NSNumber;
        [(_bmFMResultSet *)self doubleForColumnIndex:v4];
        uint64_t v7 = objc_msgSend(v9, "numberWithDouble:");
        if (v7) {
          goto LABEL_18;
        }
        break;
      case 1:
        uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_bmFMResultSet longLongIntForColumnIndex:](self, "longLongIntForColumnIndex:", v4));
        if (v7) {
          goto LABEL_18;
        }
        break;
      default:
        uint64_t v7 = [(_bmFMResultSet *)self stringForColumnIndex:v4];
        if (v7) {
          goto LABEL_18;
        }
        break;
    }
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
LABEL_18:
    return v7;
  }
  uint64_t v7 = 0;
  return v7;
}

- (id)objectForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];
  return [(_bmFMResultSet *)self objectForColumnIndex:v4];
}

- (id)columnNameForIndex:(int)a3
{
  uint64_t v3 = NSString;
  uint64_t v4 = sqlite3_column_name((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], a3);
  return (id)[v3 stringWithUTF8String:v4];
}

- (BOOL)bindWithArray:(id)a3 orDictionary:(id)a4 orVAList:(char *)a5
{
  statement = self->_statement;
  id v9 = a4;
  id v10 = a3;
  [(_bmFMStatement *)statement reset];
  LOBYTE(a5) = [(_bmFMDatabase *)self->_parentDB bindStatement:[(_bmFMStatement *)self->_statement statement] WithArgumentsInArray:v10 orDictionary:v9 orVAList:a5];

  return (char)a5;
}

- (BOOL)bindWithArray:(id)a3
{
  return [(_bmFMResultSet *)self bindWithArray:a3 orDictionary:0 orVAList:0];
}

- (BOOL)bindWithDictionary:(id)a3
{
  return [(_bmFMResultSet *)self bindWithArray:0 orDictionary:a3 orVAList:0];
}

- (void)_tryLogSqliteColumnError:(int)a3
{
  p_parentDB = &self->_parentDB;
  if ([(_bmFMDatabase *)self->_parentDB lastErrorCode])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(_bmFMResultSet *)(id *)p_parentDB _tryLogSqliteColumnError:a3];
    }
  }
}

- (_bmFMDatabase)parentDB
{
  return self->_parentDB;
}

- (NSString)query
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (_bmFMStatement)statement
{
  return (_bmFMStatement *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)shouldAutoClose
{
  return self->_shouldAutoClose;
}

- (void)_tryLogSqliteColumnError:(int)a3 .cold.1(id *a1, uint64_t a2, int a3)
{
  int v5 = a1;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v6 = [*a1 lastErrorMessage];
  int v7 = [*v5 lastErrorCode];
  LODWORD(v5) = [*v5 lastExtendedErrorCode];
  int v8 = [*(id *)(a2 + 40) query];
  int v9 = 138413314;
  id v10 = v6;
  __int16 v11 = 1024;
  int v12 = v7;
  __int16 v13 = 1024;
  int v14 = (int)v5;
  __int16 v15 = 1024;
  int v16 = a3;
  __int16 v17 = 2112;
  v18 = v8;
  _os_log_error_impl(&dword_1B87BE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "fmdb: error: %@ errCode: %u extendedErrCode: %u while fetching column %u for statement: %@", (uint8_t *)&v9, 0x28u);
}

@end