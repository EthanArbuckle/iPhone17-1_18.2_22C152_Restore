@interface FLSQLiteDatabaseConnection
- (BOOL)open;
- (FLSQLiteDatabaseConnection)initWithStorePath:(id)a3;
- (NSString)storePath;
- (OS_os_log)log;
- (sqlite3)db;
- (void)close;
- (void)dealloc;
- (void)setLog:(id)a3;
- (void)setStorePath:(id)a3;
@end

@implementation FLSQLiteDatabaseConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_storePath, 0);
}

- (void)setLog:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setStorePath:(id)a3
{
}

- (NSString)storePath
{
  return self->_storePath;
}

- (sqlite3)db
{
  return self->_db;
}

- (void)close
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  db = self->_db;
  if (db)
  {
    int v4 = sqlite3_close_v2(db);
    if (v4)
    {
      int v5 = v4;
      v6 = [(FLSQLiteDatabaseConnection *)self log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7[0] = 67109120;
        v7[1] = v5;
        _os_log_error_impl(&dword_1BA2B8000, v6, OS_LOG_TYPE_ERROR, "SQLite close connection failed: %d", (uint8_t *)v7, 8u);
      }
    }
  }
  self->_db = 0;
}

- (BOOL)open
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_db = &self->_db;
  if (self->_db)
  {
    int v4 = [(FLSQLiteDatabaseConnection *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v10 = [(FLSQLiteDatabaseConnection *)self storePath];
      int v11 = 138412290;
      v12 = v10;
      _os_log_debug_impl(&dword_1BA2B8000, v4, OS_LOG_TYPE_DEBUG, "Re-using already opened SQLite store %@", (uint8_t *)&v11, 0xCu);
    }
    BOOL v5 = 1;
  }
  else
  {
    int v4 = [(FLSQLiteDatabaseConnection *)self storePath];
    int v6 = sqlite3_open_v2((const char *)[v4 UTF8String], p_db, 3211270, 0);
    BOOL v5 = v6 == 0;
    if (v6)
    {
      int v7 = v6;
      [(FLSQLiteDatabaseConnection *)self close];
      uint64_t v8 = [(FLSQLiteDatabaseConnection *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v11 = 67109120;
        LODWORD(v12) = v7;
        _os_log_error_impl(&dword_1BA2B8000, v8, OS_LOG_TYPE_ERROR, "SQLite open failed: %d", (uint8_t *)&v11, 8u);
      }
    }
    else
    {
      sqlite3_busy_timeout(self->_db, 250);
      uint64_t v8 = [(FLSQLiteDatabaseConnection *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138412290;
        v12 = v4;
        _os_log_debug_impl(&dword_1BA2B8000, v8, OS_LOG_TYPE_DEBUG, "Opened SQLite store %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  [(FLSQLiteDatabaseConnection *)self close];
  v3.receiver = self;
  v3.super_class = (Class)FLSQLiteDatabaseConnection;
  [(FLSQLiteDatabaseConnection *)&v3 dealloc];
}

- (FLSQLiteDatabaseConnection)initWithStorePath:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FLSQLiteDatabaseConnection;
  BOOL v5 = [(FLSQLiteDatabaseConnection *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringByRemovingPercentEncoding];
    int v7 = (void *)v6;
    if (v6) {
      id v8 = (id)v6;
    }
    else {
      id v8 = v4;
    }
    [(FLSQLiteDatabaseConnection *)v5 setStorePath:v8];

    v9 = flLogForObject(v5);
    [(FLSQLiteDatabaseConnection *)v5 setLog:v9];
  }
  return v5;
}

@end