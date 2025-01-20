@interface BDSOSTransaction
- (BDSOSTransaction)initWithTransactionName:(const char *)a3;
- (BDSOSTransactionDelegate)delegate;
- (OS_os_transaction)osTransaction;
- (void)dealloc;
- (void)endTransaction;
- (void)setDelegate:(id)a3;
- (void)setOsTransaction:(id)a3;
- (void)transactionNeedsMoreTime;
@end

@implementation BDSOSTransaction

- (BDSOSTransaction)initWithTransactionName:(const char *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)BDSOSTransaction;
  v4 = [(BDSOSTransaction *)&v9 init];
  if (v4)
  {
    uint64_t v5 = os_transaction_create();
    osTransaction = v4->_osTransaction;
    v4->_osTransaction = (OS_os_transaction *)v5;

    v7 = BDSCloudKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v11 = a3;
      __int16 v12 = 2048;
      v13 = v4;
      _os_log_impl(&dword_2360BC000, v7, OS_LOG_TYPE_DEFAULT, "[Transaction]: Created transaction %{public}s(%p)", buf, 0x16u);
    }
  }
  return v4;
}

- (void)transactionNeedsMoreTime
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_osTransaction)
  {
    v3 = (BDSOSTransaction *)os_transaction_copy_description();
    v4 = BDSCloudKitLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446466;
      v7 = v3;
      __int16 v8 = 2048;
      objc_super v9 = self;
      _os_log_impl(&dword_2360BC000, v4, OS_LOG_TYPE_DEFAULT, "[Transaction]: Transaction needs more time %{public}s(%p)", (uint8_t *)&v6, 0x16u);
    }

    os_transaction_needs_more_time();
    if (v3) {
      free(v3);
    }
  }
  else
  {
    uint64_t v5 = BDSCloudKitLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      v7 = self;
      _os_log_impl(&dword_2360BC000, v5, OS_LOG_TYPE_DEFAULT, "[Transaction]: transactionNeedsMoreTime was called but transaction was already nil.(%p)", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)endTransaction
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (self->_osTransaction)
  {
    v3 = (BDSOSTransaction *)os_transaction_copy_description();
    v4 = BDSCloudKitLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136446466;
      v30 = v3;
      __int16 v31 = 2048;
      v32 = self;
      _os_log_impl(&dword_2360BC000, v4, OS_LOG_TYPE_DEFAULT, "[Transaction]: Ending transaction %{public}s(%p)", (uint8_t *)&v29, 0x16u);
    }

    __int16 v12 = objc_msgSend_delegate(self, v5, v6, v7, v8, v9, v10, v11);

    if (v12)
    {
      v20 = objc_msgSend_delegate(self, v13, v14, v15, v16, v17, v18, v19);
      objc_msgSend_transactionWillEndWithName_(v20, v21, (uint64_t)v3, v22, v23, v24, v25, v26);
    }
    if (v3) {
      free(v3);
    }
  }
  else
  {
    v27 = BDSCloudKitLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 134217984;
      v30 = self;
      _os_log_impl(&dword_2360BC000, v27, OS_LOG_TYPE_DEFAULT, "[Transaction]: EndTransaction was called but transaction was already nil.(%p)", (uint8_t *)&v29, 0xCu);
    }
  }
  osTransaction = self->_osTransaction;
  self->_osTransaction = 0;
}

- (void)dealloc
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (self->_osTransaction)
  {
    v3 = (void *)os_transaction_copy_description();
    v4 = BDSCloudKitLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v29 = v3;
      __int16 v30 = 2048;
      __int16 v31 = self;
      _os_log_impl(&dword_2360BC000, v4, OS_LOG_TYPE_DEFAULT, "[Transaction]: Ending transaction %{public}s(%p)", buf, 0x16u);
    }

    __int16 v12 = objc_msgSend_delegate(self, v5, v6, v7, v8, v9, v10, v11);

    if (v12)
    {
      v20 = objc_msgSend_delegate(self, v13, v14, v15, v16, v17, v18, v19);
      objc_msgSend_transactionWillEndWithName_(v20, v21, (uint64_t)v3, v22, v23, v24, v25, v26);
    }
    if (v3) {
      free(v3);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)BDSOSTransaction;
  [(BDSOSTransaction *)&v27 dealloc];
}

- (BDSOSTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BDSOSTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_os_transaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end