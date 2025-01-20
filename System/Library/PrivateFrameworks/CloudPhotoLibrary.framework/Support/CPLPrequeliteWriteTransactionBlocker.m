@interface CPLPrequeliteWriteTransactionBlocker
- (CPLPrequeliteWriteTransactionBlocker)initWithBypassQueue:(id)a3 blockedQueue:(id)a4;
- (OS_dispatch_queue)blockedQueue;
- (OS_dispatch_queue)bypassQueue;
@end

@implementation CPLPrequeliteWriteTransactionBlocker

- (CPLPrequeliteWriteTransactionBlocker)initWithBypassQueue:(id)a3 blockedQueue:(id)a4
{
  id v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2(v8);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100192A88;
  v15[3] = &unk_100275EA0;
  v9 = v8;
  v16 = v9;
  v14.receiver = self;
  v14.super_class = (Class)CPLPrequeliteWriteTransactionBlocker;
  v10 = [(CPLPrequeliteWriteTransactionBlocker *)&v14 initWithUnblockBlock:v15];
  if (v10)
  {
    if (!_CPLSilentLogging)
    {
      v11 = sub_10018796C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Blocking write queue", v13, 2u);
      }
    }
    dispatch_suspend(v9);
    objc_storeStrong((id *)&v10->_bypassQueue, a3);
  }

  return v10;
}

- (OS_dispatch_queue)bypassQueue
{
  return self->_bypassQueue;
}

- (OS_dispatch_queue)blockedQueue
{
  return self->_blockedQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockedQueue, 0);
  objc_storeStrong((id *)&self->_bypassQueue, 0);
}

@end