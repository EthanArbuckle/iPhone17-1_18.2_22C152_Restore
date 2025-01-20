@interface SQLiteConnection
- (void)dealloc;
@end

@implementation SQLiteConnection

- (void)dealloc
{
  if (self->_database)
  {
    v3 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      options = self->_options;
      if (options) {
        options = objc_getProperty(options, v4, 24, 1);
      }
      id v6 = options;
      *(_DWORD *)buf = 138543362;
      id v9 = v6;
      _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Connection taken down HARD, please call close before deallocating: %{public}@", buf, 0xCu);
    }
    sqlite3_close_v2(self->_database);
  }
  v7.receiver = self;
  v7.super_class = (Class)SQLiteConnection;
  [(SQLiteConnection *)&v7 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_afterTransactionBlocks, 0);
}

@end