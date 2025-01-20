@interface NavdOsTransaction
- (NavdOsTransaction)initWithTransactionName:(const char *)a3;
- (void)dealloc;
- (void)endTransaction;
@end

@implementation NavdOsTransaction

- (NavdOsTransaction)initWithTransactionName:(const char *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NavdOsTransaction;
  v4 = [(NavdOsTransaction *)&v9 init];
  if (v4)
  {
    uint64_t v5 = os_transaction_create();
    osTransaction = v4->_osTransaction;
    v4->_osTransaction = (OS_os_transaction *)v5;

    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136380931;
      v11 = a3;
      __int16 v12 = 2048;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Created transaction %{private}s(%p)", buf, 0x16u);
    }
  }
  return v4;
}

- (void)endTransaction
{
  v3 = GEOFindOrCreateLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  if (v4)
  {
    if (self->_osTransaction)
    {
      uint64_t v5 = (NavdOsTransaction *)os_transaction_copy_description();
      v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        int v9 = 136380931;
        v10 = v5;
        __int16 v11 = 2048;
        __int16 v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Ending transaction %{private}s(%p)", (uint8_t *)&v9, 0x16u);
      }

      if (v5) {
        free(v5);
      }
    }
    else
    {
      v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v9 = 134217984;
        v10 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "EndTransaction was called but transaction was already nil.(%p)", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  osTransaction = self->_osTransaction;
  self->_osTransaction = 0;
}

- (void)dealloc
{
  if (self->_osTransaction)
  {
    v3 = GEOFindOrCreateLog();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (v4)
    {
      uint64_t v5 = (void *)os_transaction_copy_description();
      v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136380931;
        int v9 = v5;
        __int16 v10 = 2048;
        __int16 v11 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Ending transaction %{private}s(%p)", buf, 0x16u);
      }

      if (v5) {
        free(v5);
      }
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)NavdOsTransaction;
  [(NavdOsTransaction *)&v7 dealloc];
}

- (void).cxx_destruct
{
}

@end