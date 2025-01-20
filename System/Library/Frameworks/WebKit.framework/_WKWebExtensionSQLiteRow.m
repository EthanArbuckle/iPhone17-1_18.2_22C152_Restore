@interface _WKWebExtensionSQLiteRow
- (BOOL)BOOLAtIndex:(unint64_t)a3;
- (BOOL)_isNullAtIndex:(unint64_t)a3;
- (RawData)uncopiedRawDataAtIndex:(SEL)a3;
- (_WKWebExtensionSQLiteRow)init;
- (_WKWebExtensionSQLiteRow)initWithCurrentRowOfEnumerator:(id)a3;
- (_WKWebExtensionSQLiteRow)initWithStatement:(id)a3;
- (double)doubleAtIndex:(unint64_t)a3;
- (id)dataAtIndex:(unint64_t)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)stringAtIndex:(unint64_t)a3;
- (id)uncopiedDataAtIndex:(unint64_t)a3;
- (int)intAtIndex:(unint64_t)a3;
- (int64_t)int64AtIndex:(unint64_t)a3;
@end

@implementation _WKWebExtensionSQLiteRow

- (_WKWebExtensionSQLiteRow)init
{
  return 0;
}

- (_WKWebExtensionSQLiteRow)initWithStatement:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_WKWebExtensionSQLiteRow;
  v6 = [(_WKWebExtensionSQLiteRow *)&v11 init];
  if (v6)
  {
    v6->_handle = (sqlite3_stmt *)[v5 handle];
    objc_storeStrong((id *)&v6->_statement, a3);
    v7 = [(_WKWebExtensionSQLiteStatement *)v6->_statement database];
    v8 = [v7 queue];
    dispatch_assert_queue_V2(v8);

    v9 = v6;
  }

  return v6;
}

- (_WKWebExtensionSQLiteRow)initWithCurrentRowOfEnumerator:(id)a3
{
  v4 = [a3 statement];
  id v5 = [(_WKWebExtensionSQLiteRow *)self initWithStatement:v4];

  return v5;
}

- (id)stringAtIndex:(unint64_t)a3
{
  id v5 = [(_WKWebExtensionSQLiteStatement *)self->_statement database];
  v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  if ([(_WKWebExtensionSQLiteRow *)self _isNullAtIndex:a3])
  {
    v7 = 0;
  }
  else
  {
    handle = self->_handle;
    v9 = sqlite3_column_text(handle, a3);
    int v10 = sqlite3_column_bytes(handle, a3);
    v7 = (__CFString *)CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9, v10, 0x8000100u, 0);
  }

  return v7;
}

- (int)intAtIndex:(unint64_t)a3
{
  int v3 = a3;
  id v5 = [(_WKWebExtensionSQLiteStatement *)self->_statement database];
  v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  handle = self->_handle;

  return sqlite3_column_int(handle, v3);
}

- (int64_t)int64AtIndex:(unint64_t)a3
{
  int v3 = a3;
  id v5 = [(_WKWebExtensionSQLiteStatement *)self->_statement database];
  v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  handle = self->_handle;

  return sqlite3_column_int64(handle, v3);
}

- (double)doubleAtIndex:(unint64_t)a3
{
  int v3 = a3;
  id v5 = [(_WKWebExtensionSQLiteStatement *)self->_statement database];
  v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  handle = self->_handle;

  return sqlite3_column_double(handle, v3);
}

- (BOOL)BOOLAtIndex:(unint64_t)a3
{
  return [(_WKWebExtensionSQLiteRow *)self intAtIndex:a3] != 0;
}

- (id)dataAtIndex:(unint64_t)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  [(_WKWebExtensionSQLiteRow *)self uncopiedRawDataAtIndex:a3];
  int v3 = 0;
  if (!(_BYTE)v5)
  {
    int v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v6 length:(int)v7];
  }

  return v3;
}

- (id)uncopiedDataAtIndex:(unint64_t)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  [(_WKWebExtensionSQLiteRow *)self uncopiedRawDataAtIndex:a3];
  int v3 = 0;
  if (!(_BYTE)v5)
  {
    int v3 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v6 length:(int)v7 freeWhenDone:0];
  }

  return v3;
}

- (RawData)uncopiedRawDataAtIndex:(SEL)a3
{
  uint64_t v7 = [(_WKWebExtensionSQLiteStatement *)self->_statement database];
  v8 = [v7 queue];
  dispatch_assert_queue_V2(v8);

  result = (RawData *)[(_WKWebExtensionSQLiteRow *)self _isNullAtIndex:a4];
  if (result)
  {
    *(void *)&retstr->var0 = 0;
    retstr->var1 = 0;
    *(void *)&retstr->var2 = 0;
    retstr->var0 = 1;
  }
  else
  {
    handle = self->_handle;
    result = (RawData *)sqlite3_column_blob(handle, a4);
    if (result)
    {
      objc_super v11 = result;
      result = (RawData *)sqlite3_column_bytes(handle, a4);
      retstr->var0 = 0;
      retstr->var1 = v11;
      retstr->var2 = (int)result;
    }
    else
    {
      *(void *)&retstr->var0 = 0;
      retstr->var1 = 0;
      *(void *)&retstr->var2 = 0;
    }
  }
  return result;
}

- (BOOL)_isNullAtIndex:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v5 = [(_WKWebExtensionSQLiteStatement *)self->_statement database];
  uint64_t v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  return sqlite3_column_type(self->_handle, v3) == 5;
}

- (id)objectAtIndex:(unint64_t)a3
{
  switch(sqlite3_column_type(self->_handle, a3))
  {
    case 1:
      uint64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(self->_handle, a3));
      break;
    case 2:
      uint64_t v5 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(self->_handle, a3));
      break;
    case 3:
      uint64_t v5 = [(_WKWebExtensionSQLiteRow *)self stringAtIndex:a3];
      break;
    case 4:
      uint64_t v5 = [(_WKWebExtensionSQLiteRow *)self dataAtIndex:a3];
      break;
    case 5:
      uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
      break;
    default:
      uint64_t v5 = 0;
      break;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end