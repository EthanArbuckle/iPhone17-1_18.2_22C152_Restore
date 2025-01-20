@interface AXMIdleManager
- (AXMIdleManager)init;
- (AXMIdleManagerDelegate)delegate;
- (OS_os_transaction)transaction;
- (void)_queue_addActiveReason:(id)a3;
- (void)_queue_removeActiveReason:(id)a3;
- (void)_queue_voiceOverActivityOccurred;
- (void)setDelegate:(id)a3;
- (void)setTransaction:(id)a3;
- (void)voiceOverActivityOccurred;
@end

@implementation AXMIdleManager

- (AXMIdleManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXMIdleManager;
  v2 = [(AXMIdleManager *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AXMIdleManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSMutableArray array];
    queue_activeReasons = v2->_queue_activeReasons;
    v2->_queue_activeReasons = (NSMutableArray *)v5;

    v7 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:v2->_queue];
    queue_voiceOverActivityTimer = v2->_queue_voiceOverActivityTimer;
    v2->_queue_voiceOverActivityTimer = v7;

    [(AXDispatchTimer *)v2->_queue_voiceOverActivityTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  return v2;
}

- (void)voiceOverActivityOccurred
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __43__AXMIdleManager_voiceOverActivityOccurred__block_invoke;
  block[3] = &unk_100008268;
  block[4] = self;
  dispatch_async(queue, block);
}

id __43__AXMIdleManager_voiceOverActivityOccurred__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_voiceOverActivityOccurred");
}

- (void)_queue_voiceOverActivityOccurred
{
  if (([(NSMutableArray *)self->_queue_activeReasons containsObject:@"VoiceOverActivity"] & 1) == 0)[(AXMIdleManager *)self _queue_addActiveReason:@"VoiceOverActivity"]; {
  queue_voiceOverActivityTimer = self->_queue_voiceOverActivityTimer;
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __50__AXMIdleManager__queue_voiceOverActivityOccurred__block_invoke;
  v4[3] = &unk_100008268;
  v4[4] = self;
  [(AXDispatchTimer *)queue_voiceOverActivityTimer afterDelay:v4 processBlock:0 cancelBlock:180.0];
}

id __50__AXMIdleManager__queue_voiceOverActivityOccurred__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeActiveReason:", @"VoiceOverActivity");
}

- (void)_queue_addActiveReason:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_queue_activeReasons containsObject:v4])
  {
    uint64_t v5 = AXMediaLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[AXMIdleManager _queue_addActiveReason:]((uint64_t)v4, v5);
    }
  }
  id v6 = [(NSMutableArray *)self->_queue_activeReasons count];
  [(NSMutableArray *)self->_queue_activeReasons addObject:v4];
  v7 = AXMediaLogService();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    queue_activeReasons = self->_queue_activeReasons;
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    v14 = queue_activeReasons;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Added activeReason: '%@'. all:[%@]", (uint8_t *)&v11, 0x16u);
  }

  if (!v6 && !self->_queue_transitioningToIdle)
  {
    v9 = AXMediaLogService();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Will begin xpc transaction now", (uint8_t *)&v11, 2u);
    }

    [v4 UTF8String];
    objc_super v10 = (void *)os_transaction_create();
    [(AXMIdleManager *)self setTransaction:v10];
  }
}

- (void)_queue_removeActiveReason:(id)a3
{
  id v4 = a3;
  if (([(NSMutableArray *)self->_queue_activeReasons containsObject:v4] & 1) == 0)
  {
    uint64_t v5 = AXMediaLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[AXMIdleManager _queue_removeActiveReason:]((uint64_t)v4, v5);
    }
  }
  [(NSMutableArray *)self->_queue_activeReasons removeObject:v4];
  id v6 = AXMediaLogService();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    queue_activeReasons = self->_queue_activeReasons;
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    v14 = queue_activeReasons;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removed activeReason: '%@'. all:[%@]", buf, 0x16u);
  }

  if (![(NSMutableArray *)self->_queue_activeReasons count])
  {
    v8 = AXMediaLogService();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No activeReasons remain. Will transition to idle", buf, 2u);
    }

    self->_queue_transitioningToIdle = 1;
    v9 = [(AXMIdleManager *)self delegate];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __44__AXMIdleManager__queue_removeActiveReason___block_invoke;
    v10[3] = &unk_100008268;
    v10[4] = self;
    [v9 willBecomeIdle:self completion:v10];
  }
}

void __44__AXMIdleManager__queue_removeActiveReason___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __44__AXMIdleManager__queue_removeActiveReason___block_invoke_2;
  block[3] = &unk_100008268;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __44__AXMIdleManager__queue_removeActiveReason___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  dispatch_queue_t v3 = AXMediaLogService();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "activeReason added while transitioning to idle. aborting", v5, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Will end xpc transaction now", buf, 2u);
    }

    [*(id *)(a1 + 32) setTransaction:0];
  }
}

- (AXMIdleManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXMIdleManagerDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_queue_voiceOverActivityTimer, 0);
  objc_storeStrong((id *)&self->_queue_activeReasons, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_queue_addActiveReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "active reason already exists: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_queue_removeActiveReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "active reason did not exist: %@", (uint8_t *)&v2, 0xCu);
}

@end