@interface SQLiteConnection
- (void)dealloc;
@end

@implementation SQLiteConnection

- (void)dealloc
{
  if (self->_database)
  {
    v3 = (char *)os_log_create("com.apple.AdAttributionKit", "SQL");
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_FAULT)) {
      sub_10000A908((uint64_t)self, v3);
    }

    sqlite3_close_v2(self->_database);
  }
  v4.receiver = self;
  v4.super_class = (Class)SQLiteConnection;
  [(SQLiteConnection *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_afterTransactionBlocks, 0);
}

@end