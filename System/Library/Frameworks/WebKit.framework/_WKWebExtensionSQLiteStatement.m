@interface _WKWebExtensionSQLiteStatement
- (BOOL)_isValid;
- (BOOL)execute:(id *)a3;
- (BOOL)fetchWithEnumerationBlock:(id)a3 error:(id *)a4;
- (NSArray)columnNames;
- (NSDictionary)columnNamesToIndexes;
- (_WKWebExtensionSQLiteDatabase)database;
- (_WKWebExtensionSQLiteStatement)init;
- (_WKWebExtensionSQLiteStatement)initWithDatabase:(id)a3 query:(id)a4;
- (_WKWebExtensionSQLiteStatement)initWithDatabase:(id)a3 query:(id)a4 error:(id *)a5;
- (id)fetch;
- (int)execute;
- (sqlite3_stmt)handle;
- (void)bindData:(id)a3 atParameterIndex:(unint64_t)a4;
- (void)bindDouble:(double)a3 atParameterIndex:(unint64_t)a4;
- (void)bindInt64:(int64_t)a3 atParameterIndex:(unint64_t)a4;
- (void)bindInt:(int)a3 atParameterIndex:(unint64_t)a4;
- (void)bindNullAtParameterIndex:(unint64_t)a3;
- (void)bindString:(id)a3 atParameterIndex:(unint64_t)a4;
- (void)dealloc;
- (void)invalidate;
- (void)reset;
@end

@implementation _WKWebExtensionSQLiteStatement

- (_WKWebExtensionSQLiteStatement)init
{
  return 0;
}

- (_WKWebExtensionSQLiteStatement)initWithDatabase:(id)a3 query:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_WKWebExtensionSQLiteStatement;
  v11 = [(_WKWebExtensionSQLiteStatement *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_database, a3);
    v13 = [(_WKWebExtensionSQLiteDatabase *)v12->_database queue];
    dispatch_assert_queue_V2(v13);

    v14 = (sqlite3 *)[v9 handle];
    id v15 = v10;
    uint64_t v16 = sqlite3_prepare_v2(v14, (const char *)[v15 UTF8String], -1, &v12->_handle, 0);
    if (!v16)
    {
      v17 = v12;
      goto LABEL_6;
    }
    [v9 reportErrorWithCode:v16 query:v15 error:a5];
  }
  v17 = 0;
LABEL_6:

  return v17;
}

- (_WKWebExtensionSQLiteStatement)initWithDatabase:(id)a3 query:(id)a4
{
  return [(_WKWebExtensionSQLiteStatement *)self initWithDatabase:a3 query:a4 error:0];
}

- (void)dealloc
{
  handle = self->_handle;
  if (handle)
  {
    v4 = self->_database;
    v5 = [(_WKWebExtensionSQLiteDatabase *)v4 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41___WKWebExtensionSQLiteStatement_dealloc__block_invoke;
    block[3] = &unk_1E58110B8;
    id v9 = v4;
    id v10 = handle;
    v6 = v4;
    dispatch_async(v5, block);
  }
  v7.receiver = self;
  v7.super_class = (Class)_WKWebExtensionSQLiteStatement;
  [(_WKWebExtensionSQLiteStatement *)&v7 dealloc];
}

- (int)execute
{
  v3 = [(_WKWebExtensionSQLiteDatabase *)self->_database queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = sqlite3_step(self->_handle);
  int v5 = v4;
  if ((v4 - 100) >= 2 && v4 != 0) {
    [(_WKWebExtensionSQLiteDatabase *)self->_database reportErrorWithCode:v4 statement:self->_handle error:0];
  }
  return v5;
}

- (BOOL)execute:(id *)a3
{
  int v5 = [(_WKWebExtensionSQLiteDatabase *)self->_database queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = sqlite3_step(self->_handle);
  if ((v6 - 100) < 2 || v6 == 0) {
    return 1;
  }
  [(_WKWebExtensionSQLiteDatabase *)self->_database reportErrorWithCode:v6 statement:self->_handle error:a3];
  return 0;
}

- (id)fetch
{
  v3 = [(_WKWebExtensionSQLiteDatabase *)self->_database queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [[_WKWebExtensionSQLiteRowEnumerator alloc] initWithResultsOfStatement:self];

  return v4;
}

- (BOOL)fetchWithEnumerationBlock:(id)a3 error:(id *)a4
{
  int v5 = (void (**)(id, _WKWebExtensionSQLiteRow *, unsigned char *))a3;
  uint64_t v6 = [(_WKWebExtensionSQLiteDatabase *)self->_database queue];
  dispatch_assert_queue_V2(v6);

  objc_super v7 = 0;
  char v10 = 0;
  do
  {
    int v8 = sqlite3_step(self->_handle);
    if (v8 != 100) {
      break;
    }
    if (!v7) {
      objc_super v7 = [[_WKWebExtensionSQLiteRow alloc] initWithStatement:self];
    }
    v5[2](v5, v7, &v10);
  }
  while (!v10);

  return v8 == 101;
}

- (void)reset
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(_WKWebExtensionSQLiteDatabase *)self->_database queue];
  dispatch_assert_queue_V2(v3);

  int v4 = sqlite3_reset(self->_handle);
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_super v7 = [(_WKWebExtensionSQLiteDatabase *)self->_database lastErrorMessage];
      int v8 = 138412546;
      id v9 = v7;
      __int16 v10 = 1024;
      int v11 = v5;
      _os_log_debug_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEBUG, "Could not reset statement: %@ (%d)", (uint8_t *)&v8, 0x12u);
    }
  }
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(_WKWebExtensionSQLiteDatabase *)self->_database queue];
  dispatch_assert_queue_V2(v3);

  int v4 = sqlite3_finalize(self->_handle);
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_super v7 = [(_WKWebExtensionSQLiteDatabase *)self->_database lastErrorMessage];
      int v8 = 138412546;
      id v9 = v7;
      __int16 v10 = 1024;
      int v11 = v5;
      _os_log_debug_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEBUG, "Could not finalize statement: %@ (%d)", (uint8_t *)&v8, 0x12u);
    }
  }
  self->_handle = 0;
}

- (void)bindString:(id)a3 atParameterIndex:(unint64_t)a4
{
  int v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = [(_WKWebExtensionSQLiteDatabase *)self->_database queue];
  dispatch_assert_queue_V2(v7);

  handle = self->_handle;
  id v9 = v6;
  int v10 = sqlite3_bind_text(handle, v4, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (v10)
  {
    int v11 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [(_WKWebExtensionSQLiteDatabase *)self->_database lastErrorMessage];
      int v13 = 138412546;
      v14 = v12;
      __int16 v15 = 1024;
      int v16 = v10;
      _os_log_debug_impl(&dword_1985F2000, v11, OS_LOG_TYPE_DEBUG, "Could not bind string: %@ (%d)", (uint8_t *)&v13, 0x12u);
    }
  }
}

- (void)bindInt:(int)a3 atParameterIndex:(unint64_t)a4
{
  int v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v7 = [(_WKWebExtensionSQLiteDatabase *)self->_database queue];
  dispatch_assert_queue_V2(v7);

  int v8 = sqlite3_bind_int(self->_handle, v4, a3);
  if (v8)
  {
    int v9 = v8;
    int v10 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = [(_WKWebExtensionSQLiteDatabase *)self->_database lastErrorMessage];
      int v12 = 138412546;
      int v13 = v11;
      __int16 v14 = 1024;
      int v15 = v9;
      _os_log_debug_impl(&dword_1985F2000, v10, OS_LOG_TYPE_DEBUG, "Could not bind int: %@ (%d)", (uint8_t *)&v12, 0x12u);
    }
  }
}

- (void)bindInt64:(int64_t)a3 atParameterIndex:(unint64_t)a4
{
  int v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v7 = [(_WKWebExtensionSQLiteDatabase *)self->_database queue];
  dispatch_assert_queue_V2(v7);

  int v8 = sqlite3_bind_int64(self->_handle, v4, a3);
  if (v8)
  {
    int v9 = v8;
    int v10 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = [(_WKWebExtensionSQLiteDatabase *)self->_database lastErrorMessage];
      int v12 = 138412546;
      int v13 = v11;
      __int16 v14 = 1024;
      int v15 = v9;
      _os_log_debug_impl(&dword_1985F2000, v10, OS_LOG_TYPE_DEBUG, "Could not bind integer: %@ (%d)", (uint8_t *)&v12, 0x12u);
    }
  }
}

- (void)bindDouble:(double)a3 atParameterIndex:(unint64_t)a4
{
  int v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v7 = [(_WKWebExtensionSQLiteDatabase *)self->_database queue];
  dispatch_assert_queue_V2(v7);

  int v8 = sqlite3_bind_double(self->_handle, v4, a3);
  if (v8)
  {
    int v9 = v8;
    int v10 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = [(_WKWebExtensionSQLiteDatabase *)self->_database lastErrorMessage];
      int v12 = 138412546;
      int v13 = v11;
      __int16 v14 = 1024;
      int v15 = v9;
      _os_log_debug_impl(&dword_1985F2000, v10, OS_LOG_TYPE_DEBUG, "Could not bind double: %@ (%d)", (uint8_t *)&v12, 0x12u);
    }
  }
}

- (void)bindData:(id)a3 atParameterIndex:(unint64_t)a4
{
  int v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = [(_WKWebExtensionSQLiteDatabase *)self->_database queue];
  dispatch_assert_queue_V2(v7);

  handle = self->_handle;
  id v9 = v6;
  int v10 = sqlite3_bind_blob(handle, v4, (const void *)[v9 bytes], objc_msgSend(v9, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (v10)
  {
    int v11 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v12 = [(_WKWebExtensionSQLiteDatabase *)self->_database lastErrorMessage];
      int v13 = 138412546;
      __int16 v14 = v12;
      __int16 v15 = 1024;
      int v16 = v10;
      _os_log_debug_impl(&dword_1985F2000, v11, OS_LOG_TYPE_DEBUG, "Could not bind blob: %@ (%d)", (uint8_t *)&v13, 0x12u);
    }
  }
}

- (void)bindNullAtParameterIndex:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = [(_WKWebExtensionSQLiteDatabase *)self->_database queue];
  dispatch_assert_queue_V2(v5);

  int v6 = sqlite3_bind_null(self->_handle, v3);
  if (v6)
  {
    int v7 = v6;
    int v8 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [(_WKWebExtensionSQLiteDatabase *)self->_database lastErrorMessage];
      int v10 = 138412546;
      int v11 = v9;
      __int16 v12 = 1024;
      int v13 = v7;
      _os_log_debug_impl(&dword_1985F2000, v8, OS_LOG_TYPE_DEBUG, "Could not bind null: %@ (%d)", (uint8_t *)&v10, 0x12u);
    }
  }
}

- (NSDictionary)columnNamesToIndexes
{
  int v3 = [(_WKWebExtensionSQLiteDatabase *)self->_database queue];
  dispatch_assert_queue_V2(v3);

  columnNamesToIndexes = self->_columnNamesToIndexes;
  if (columnNamesToIndexes)
  {
    int v5 = columnNamesToIndexes;
  }
  else
  {
    int v6 = sqlite3_column_count(self->_handle);
    int v7 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v6];
    if (v6 >= 1)
    {
      uint64_t v8 = 0;
      do
      {
        id v9 = sqlite3_column_name(self->_handle, v8);
        int v10 = [NSNumber numberWithInt:v8];
        int v11 = [NSString stringWithUTF8String:v9];
        [(NSDictionary *)v7 setObject:v10 forKeyedSubscript:v11];

        uint64_t v8 = (v8 + 1);
      }
      while (v6 != v8);
    }
    __int16 v12 = self->_columnNamesToIndexes;
    self->_columnNamesToIndexes = v7;
    int v13 = v7;

    int v5 = self->_columnNamesToIndexes;
  }

  return v5;
}

- (NSArray)columnNames
{
  int v3 = [(_WKWebExtensionSQLiteDatabase *)self->_database queue];
  dispatch_assert_queue_V2(v3);

  columnNames = self->_columnNames;
  if (columnNames)
  {
    int v5 = columnNames;
  }
  else
  {
    int v6 = sqlite3_column_count(self->_handle);
    int v7 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
    if (v6 >= 1)
    {
      for (int i = 0; i != v6; ++i)
      {
        id v9 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_name(self->_handle, i));
        [(NSArray *)v7 addObject:v9];
      }
    }
    int v10 = self->_columnNames;
    self->_columnNames = v7;
    int v11 = v7;

    int v5 = self->_columnNames;
  }

  return v5;
}

- (BOOL)_isValid
{
  return self->_handle != 0;
}

- (sqlite3_stmt)handle
{
  return self->_handle;
}

- (_WKWebExtensionSQLiteDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong((id *)&self->_columnNamesToIndexes, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

@end