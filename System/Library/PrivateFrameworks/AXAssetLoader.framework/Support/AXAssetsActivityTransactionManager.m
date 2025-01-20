@interface AXAssetsActivityTransactionManager
- (AXAssetsActivityTransactionManager)init;
- (AXAssetsActivityTransactionManagerDelegate)delegate;
- (OS_os_transaction)transaction;
- (void)_queue_addActiveReason:(id)a3;
- (void)_queue_handleInactiveTimerFired;
- (void)_queue_removeActiveReason:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTransaction:(id)a3;
- (void)simpleTaskFinished:(id)a3;
- (void)simpleTaskStarted:(id)a3;
@end

@implementation AXAssetsActivityTransactionManager

- (AXAssetsActivityTransactionManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)AXAssetsActivityTransactionManager;
  v2 = [(AXAssetsActivityTransactionManager *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("AXAssetsActivityTransactionManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[NSMutableArray array];
    queue_activeReasons = v2->_queue_activeReasons;
    v2->_queue_activeReasons = (NSMutableArray *)v6;

    v8 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:v2->_queue];
    queue_activityTimer = v2->_queue_activityTimer;
    v2->_queue_activityTimer = v8;

    [(AXDispatchTimer *)v2->_queue_activityTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  return v2;
}

- (void)simpleTaskStarted:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000EAB8;
  v7[3] = &unk_100020900;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)simpleTaskFinished:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000EB5C;
  v7[3] = &unk_100020900;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_queue_addActiveReason:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_queue_activeReasons containsObject:v4])
  {
    v5 = AXLogAssetDaemon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100014E60((uint64_t)v4, v5);
    }
LABEL_4:

    goto LABEL_9;
  }
  [(AXDispatchTimer *)self->_queue_activityTimer cancel];
  id v6 = [(NSMutableArray *)self->_queue_activeReasons count];
  [(NSMutableArray *)self->_queue_activeReasons addObject:v4];
  v7 = AXLogAssetDaemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(NSMutableArray *)self->_queue_activeReasons count];
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2048;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AXATM: Added active reason: '%@'. Reason count=%ld", (uint8_t *)&v10, 0x16u);
  }

  if (!v6 && !self->_queue_transitioningToIdle)
  {
    v9 = AXLogAssetDaemon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AXATM: Will begin os_transaction", (uint8_t *)&v10, 2u);
    }

    v5 = os_transaction_create();
    [(AXAssetsActivityTransactionManager *)self setTransaction:v5];
    goto LABEL_4;
  }
LABEL_9:
}

- (void)_queue_removeActiveReason:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_queue_activeReasons containsObject:v4])
  {
    [(NSMutableArray *)self->_queue_activeReasons removeObject:v4];
    v5 = AXLogAssetDaemon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(NSMutableArray *)self->_queue_activeReasons count];
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = (uint64_t)v4;
      __int16 v13 = 2048;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AXATM: Removed active reason: '%@'. Reason count=%ld", buf, 0x16u);
    }

    if (![(NSMutableArray *)self->_queue_activeReasons count])
    {
      v7 = AXLogAssetDaemon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v12 = 0x4020000000000000;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AXATM: No active reasons remain. Beginning timer of %.2f seconds before we go inactive", buf, 0xCu);
      }

      queue_activityTimer = self->_queue_activityTimer;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10000EED8;
      v10[3] = &unk_100020A90;
      v10[4] = self;
      [(AXDispatchTimer *)queue_activityTimer afterDelay:v10 processBlock:0 cancelBlock:8.0];
    }
  }
  else
  {
    v9 = AXLogAssetDaemon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100014ED8((uint64_t)v4, v9);
    }
  }
}

- (void)_queue_handleInactiveTimerFired
{
  v3 = AXLogAssetDaemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AXATM: Inactive timer fired. Will give delegate a chance to clean up and then transition to idle", (uint8_t *)buf, 2u);
  }

  self->_queue_transitioningToIdle = 1;
  objc_initWeak(buf, self);
  id v4 = [(AXAssetsActivityTransactionManager *)self delegate];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F014;
  v5[3] = &unk_1000207E8;
  objc_copyWeak(&v6, buf);
  [v4 willBecomeIdle:self completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (AXAssetsActivityTransactionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXAssetsActivityTransactionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue_activityTimer, 0);
  objc_storeStrong((id *)&self->_queue_activeReasons, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end