@interface _WKWebExtensionSQLiteDatabase
+ (id)_errorWith_WKSQLiteErrorCode:(int)a3 userInfo:(id)a4;
+ (id)inMemoryDatabaseURL;
+ (id)privateOnDiskDatabaseURL;
- (BOOL)_openWithFlags:(int)a3 vfs:(id)a4 error:(id *)a5;
- (BOOL)enableWAL:(id *)a3;
- (BOOL)openWithAccessType:(int64_t)a3 error:(id *)a4;
- (BOOL)openWithAccessType:(int64_t)a3 protectionType:(int64_t)a4 vfs:(id)a5 error:(id *)a6;
- (BOOL)openWithAccessType:(int64_t)a3 vfs:(id)a4 error:(id *)a5;
- (BOOL)reportErrorWithCode:(int)a3 query:(id)a4 error:(id *)a5;
- (BOOL)reportErrorWithCode:(int)a3 statement:(sqlite3_stmt *)a4 error:(id *)a5;
- (NSString)lastErrorMessage;
- (NSURL)url;
- (OS_dispatch_queue)queue;
- (_WKWebExtensionSQLiteDatabase)initWithURL:(id)a3 queue:(id)a4;
- (int)close;
- (int)lastErrorCode;
- (sqlite3)handle;
- (void)dealloc;
@end

@implementation _WKWebExtensionSQLiteDatabase

- (_WKWebExtensionSQLiteDatabase)initWithURL:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_WKWebExtensionSQLiteDatabase;
  v8 = [(_WKWebExtensionSQLiteDatabase *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_queue, a4);
    v11 = v8;
  }

  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_WKWebExtensionSQLiteDatabase;
  [(_WKWebExtensionSQLiteDatabase *)&v2 dealloc];
}

- (int)close
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v3 = sqlite3_close_v2(self->_handle);
  if (v3)
  {
    v4 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = [(_WKWebExtensionSQLiteDatabase *)self lastErrorMessage];
      int v7 = 138543618;
      v8 = v6;
      __int16 v9 = 1024;
      int v10 = v3;
      _os_log_error_impl(&dword_1985F2000, v4, OS_LOG_TYPE_ERROR, "Failed to close database: %{public}@ (%d)", (uint8_t *)&v7, 0x12u);
    }
  }
  else
  {
    self->_handle = 0;
  }
  return v3;
}

- (BOOL)reportErrorWithCode:(int)a3 query:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  url = self->_url;
  if (url)
  {
    v12 = (void *)[(NSURL *)url copy];
    [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F289D0]];
  }
  if (a3)
  {
    __int16 v9 = sqlite3_errmsg(self->_handle);
    if (v9)
    {
      objc_super v13 = [NSString stringWithUTF8String:v9];
      [v10 setObject:v13 forKeyedSubscript:@"Message"];
    }
  }
  if (v8)
  {
    v14 = objc_msgSend(v8, "copy", v9);
    [v10 setObject:v14 forKeyedSubscript:@"SQL"];
  }
  v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.WebKit.SQLite" code:a3 userInfo:v10];
  v16 = v15;
  if (a5)
  {
    *a5 = v15;
  }
  else
  {
    v17 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = WebKit::privacyPreservingDescription(v16, v18);
      int v21 = 138543362;
      v22 = v20;
      _os_log_error_impl(&dword_1985F2000, v17, OS_LOG_TYPE_ERROR, "Unhandled SQLite error: %{public}@", (uint8_t *)&v21, 0xCu);
    }
  }

  return 0;
}

- (BOOL)reportErrorWithCode:(int)a3 statement:(sqlite3_stmt *)a4 error:(id *)a5
{
  uint64_t v7 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a4 && (__int16 v9 = sqlite3_expanded_sql(a4)) != 0)
  {
    int v10 = v9;
    uint64_t v11 = [NSString stringWithUTF8String:v9];
    BOOL v12 = [(_WKWebExtensionSQLiteDatabase *)self reportErrorWithCode:v7 query:v11 error:a5];

    sqlite3_free(v10);
    return v12;
  }
  else
  {
    return [(_WKWebExtensionSQLiteDatabase *)self reportErrorWithCode:v7 query:0 error:a5];
  }
}

- (BOOL)enableWAL:(id *)a3
{
  int v5 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(self, a3, @"PRAGMA synchronous = NORMAL");
  if (v5 != 101 && v5 != 0) {
    return 0;
  }
  uint64_t v7 = self;
  id v8 = @"PRAGMA journal_mode = WAL";
  __int16 v9 = [[_WKWebExtensionSQLiteStatement alloc] initWithDatabase:v7 query:@"PRAGMA journal_mode = WAL" error:a3];
  int v10 = v9;
  if (v9)
  {
    uint64_t v11 = [(_WKWebExtensionSQLiteStatement *)v9 handle];
    BOOL v12 = v7;
    uint64_t v13 = sqlite3_step(v11);
    if (v13 == 100 && (uint64_t v13 = sqlite3_step(v11), v13 == 101))
    {
      BOOL v14 = 1;
    }
    else
    {
      [(_WKWebExtensionSQLiteDatabase *)v12 reportErrorWithCode:v13 statement:v11 error:a3];
      BOOL v14 = 0;
    }

    [(_WKWebExtensionSQLiteStatement *)v10 invalidate];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)openWithAccessType:(int64_t)a3 error:(id *)a4
{
  return [(_WKWebExtensionSQLiteDatabase *)self openWithAccessType:a3 vfs:0 error:a4];
}

- (BOOL)openWithAccessType:(int64_t)a3 vfs:(id)a4 error:(id *)a5
{
  return [(_WKWebExtensionSQLiteDatabase *)self openWithAccessType:a3 protectionType:0 vfs:a4 error:a5];
}

- (BOOL)openWithAccessType:(int64_t)a3 protectionType:(int64_t)a4 vfs:(id)a5 error:(id *)a6
{
  id v10 = a5;
  if ((unint64_t)a3 > 2) {
    unsigned int v11 = 0x8000;
  }
  else {
    unsigned int v11 = dword_1994F58E8[a3];
  }
  unsigned int v12 = v11 | 0x300000;
  int v13 = v11 | 0x200000;
  if (a4 == 3) {
    v11 |= 0x100000u;
  }
  if (a4 == 2) {
    unsigned int v11 = v13;
  }
  if ((unint64_t)a4 >= 2) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = v12;
  }
  BOOL v15 = [(_WKWebExtensionSQLiteDatabase *)self _openWithFlags:v14 vfs:v10 error:a6];

  return v15;
}

- (BOOL)_openWithFlags:(int)a3 vfs:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  url = self->_url;
  id v10 = +[_WKWebExtensionSQLiteDatabase inMemoryDatabaseURL];
  LODWORD(url) = [(NSURL *)url isEqual:v10];

  if (url)
  {
    unsigned int v11 = (const char *)[@"file::memory:" UTF8String];
  }
  else
  {
    unsigned int v12 = self->_url;
    int v13 = +[_WKWebExtensionSQLiteDatabase privateOnDiskDatabaseURL];
    LOBYTE(v12) = [(NSURL *)v12 isEqual:v13];

    if (v12)
    {
      unsigned int v11 = "";
    }
    else
    {
      id v14 = [(NSURL *)self->_url path];
      unsigned int v11 = (const char *)[v14 fileSystemRepresentation];

      BOOL v15 = [(NSURL *)self->_url URLByDeletingLastPathComponent];
      v17 = WebKit::ensureDirectoryExists(v15, v16);

      if (!v17)
      {
        if (!a5)
        {
          BOOL v20 = 0;
          goto LABEL_18;
        }
        v25 = qword_1EB357DF8;
        if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_ERROR))
        {
          v26 = self->_url;
          int v27 = 138477827;
          v28 = v26;
          _os_log_error_impl(&dword_1985F2000, v25, OS_LOG_TYPE_ERROR, "Unable to create parent folder for database at path: %{private}@", (uint8_t *)&v27, 0xCu);
        }
        uint64_t v23 = objc_msgSend((id)objc_opt_class(), "_errorWith_WKSQLiteErrorCode:userInfo:", 14, 0);
        goto LABEL_16;
      }
    }
  }
  p_handle = &self->_handle;
  uint64_t v19 = sqlite3_open_v2(v11, &self->_handle, a3, (const char *)[v8 UTF8String]);
  if (!v19)
  {
    BOOL v20 = 1;
    goto LABEL_18;
  }
  sqlite3_close_v2(*p_handle);
  BOOL v20 = 0;
  *p_handle = 0;
  BOOL v22 = (a3 & 4) == 0 && v19 == 14;
  if (a5 && !v22)
  {
    uint64_t v23 = objc_msgSend((id)objc_opt_class(), "_errorWith_WKSQLiteErrorCode:userInfo:", v19, 0);
LABEL_16:
    BOOL v20 = 0;
    *a5 = v23;
  }
LABEL_18:

  return v20;
}

+ (id)inMemoryDatabaseURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"file::memory:"];
}

+ (id)privateOnDiskDatabaseURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"webkit::privateondisk:"];
}

+ (id)_errorWith_WKSQLiteErrorCode:(int)a3 userInfo:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = [NSString stringWithUTF8String:sqlite3_errstr(a3)];
    uint64_t v7 = (void *)[v5 mutableCopy];
    [v7 setObject:v6 forKeyedSubscript:@"Message"];
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.WebKit.SQLite" code:a3 userInfo:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (sqlite3)handle
{
  return self->_handle;
}

- (NSURL)url
{
  return self->_url;
}

- (int)lastErrorCode
{
  return self->_lastErrorCode;
}

- (NSString)lastErrorMessage
{
  return self->_lastErrorMessage;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastErrorMessage, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end