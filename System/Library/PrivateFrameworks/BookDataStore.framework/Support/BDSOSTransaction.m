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

- (void)endTransaction
{
  if (self->_osTransaction)
  {
    v3 = (BDSOSTransaction *)os_transaction_copy_description();
    v4 = sub_1000083A0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136446466;
      v10 = v3;
      __int16 v11 = 2048;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Transaction]: Ending transaction %{public}s(%p)", (uint8_t *)&v9, 0x16u);
    }

    v5 = [(BDSOSTransaction *)self delegate];

    if (v5)
    {
      v6 = [(BDSOSTransaction *)self delegate];
      [v6 transactionWillEndWithName:v3];
    }
    if (v3) {
      free(v3);
    }
  }
  else
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Transaction]: EndTransaction was called but transaction was already nil.(%p)", (uint8_t *)&v9, 0xCu);
    }
  }
  osTransaction = self->_osTransaction;
  self->_osTransaction = 0;
}

- (BDSOSTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BDSOSTransactionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)dealloc
{
  if (self->_osTransaction)
  {
    v3 = (void *)os_transaction_copy_description();
    v4 = sub_1000083A0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v9 = v3;
      __int16 v10 = 2048;
      __int16 v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Transaction]: Ending transaction %{public}s(%p)", buf, 0x16u);
    }

    v5 = [(BDSOSTransaction *)self delegate];

    if (v5)
    {
      v6 = [(BDSOSTransaction *)self delegate];
      [v6 transactionWillEndWithName:v3];
    }
    if (v3) {
      free(v3);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)BDSOSTransaction;
  [(BDSOSTransaction *)&v7 dealloc];
}

- (BDSOSTransaction)initWithTransactionName:(const char *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BDSOSTransaction;
  v4 = [(BDSOSTransaction *)&v9 init];
  if (v4)
  {
    uint64_t v5 = os_transaction_create();
    osTransaction = v4->_osTransaction;
    v4->_osTransaction = (OS_os_transaction *)v5;

    objc_super v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v11 = a3;
      __int16 v12 = 2048;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Transaction]: Created transaction %{public}s(%p)", buf, 0x16u);
    }
  }
  return v4;
}

- (void)transactionNeedsMoreTime
{
  if (self->_osTransaction)
  {
    v3 = (BDSOSTransaction *)os_transaction_copy_description();
    v4 = sub_1000083A0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446466;
      objc_super v7 = v3;
      __int16 v8 = 2048;
      objc_super v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Transaction]: Transaction needs more time %{public}s(%p)", (uint8_t *)&v6, 0x16u);
    }

    os_transaction_needs_more_time();
    if (v3) {
      free(v3);
    }
  }
  else
  {
    uint64_t v5 = sub_1000083A0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      objc_super v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Transaction]: transactionNeedsMoreTime was called but transaction was already nil.(%p)", (uint8_t *)&v6, 0xCu);
    }
  }
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

@end