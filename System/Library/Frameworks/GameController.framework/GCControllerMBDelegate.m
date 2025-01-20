@interface GCControllerMBDelegate
- (id)completionHandler;
- (void)dealloc;
- (void)fireCompletionHandler;
- (void)scanTimeout:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)startScan;
- (void)stopScan;
@end

@implementation GCControllerMBDelegate

- (void)dealloc
{
  if (gc_isInternalBuild())
  {
    v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_DEFAULT, "[GCControllerMBDelegate dealloc]", buf, 2u);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)GCControllerMBDelegate;
  [(GCControllerMBDelegate *)&v4 dealloc];
}

- (void)fireCompletionHandler
{
  v3 = (void *)MEMORY[0x223C6E420](self->_completionHandler, a2);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __47__GCControllerMBDelegate_fireCompletionHandler__block_invoke;
    block[3] = &unk_26D22C018;
    id v6 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t __47__GCControllerMBDelegate_fireCompletionHandler__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)scanTimeout:(id)a3
{
  [(GCControllerMBDelegate *)self stopScan];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)startScan
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __35__GCControllerMBDelegate_startScan__block_invoke;
  block[3] = &unk_26D22A8C0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __35__GCControllerMBDelegate_startScan__block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    v7 = getGCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_DEFAULT, "BT session attach", (uint8_t *)v9, 2u);
    }
  }
  v9[0] = GCControllerMBDelegateBTSessionEventCallback;
  int v2 = BTSessionAttachWithQueue();
  if (v2)
  {
    int v3 = v2;
    if (gc_isInternalBuild())
    {
      v8 = getGCLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v11 = v3;
        _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "failed to attach BTSession (error %x)", buf, 8u);
      }
    }
    [*(id *)(a1 + 32) fireCompletionHandler];
  }
  else
  {
    uint64_t v4 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel_scanTimeout_ selector:0 userInfo:0 repeats:10.0];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;
  }
}

- (void)stopScan
{
  if (self->_discoveryAgent)
  {
    if (gc_isInternalBuild())
    {
      id v6 = getGCLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220998000, v6, OS_LOG_TYPE_DEFAULT, "BT discovery stop", buf, 2u);
      }
    }
    *(void *)buf = 0;
    v13 = buf;
    uint64_t v14 = 0x2020000000;
    discoveryAgent = self->_discoveryAgent;
    self->_discoveryAgent = 0;
    BTDiscoveryAgentStopScan();
    dispatch_time_t v3 = dispatch_time(0, 3000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __34__GCControllerMBDelegate_stopScan__block_invoke;
    block[3] = &unk_26D22C150;
    void block[4] = buf;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
    _Block_object_dispose(buf, 8);
  }
  if (self->_pairingAgent)
  {
    if (gc_isInternalBuild())
    {
      v7 = getGCLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_DEFAULT, "BT pairing stop", buf, 2u);
      }
    }
    *(void *)buf = 0;
    v13 = buf;
    uint64_t v14 = 0x2020000000;
    discoveryAgent = self->_pairingAgent;
    self->_pairingAgent = 0;
    BTPairingAgentStop();
    dispatch_time_t v4 = dispatch_time(0, 3000000000);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __34__GCControllerMBDelegate_stopScan__block_invoke_86;
    v10[3] = &unk_26D22C150;
    v10[4] = buf;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v10);
    _Block_object_dispose(buf, 8);
  }
  if (self->_session)
  {
    if (gc_isInternalBuild())
    {
      v8 = getGCLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "BT session detach", buf, 2u);
      }
    }
    *(void *)buf = 0;
    v13 = buf;
    uint64_t v14 = 0x2020000000;
    discoveryAgent = self->_session;
    self->_session = 0;
    dispatch_time_t v5 = dispatch_time(0, 4000000000);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __34__GCControllerMBDelegate_stopScan__block_invoke_87;
    v9[3] = &unk_26D22C150;
    v9[4] = buf;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v9);
    _Block_object_dispose(buf, 8);
  }
  [(GCControllerMBDelegate *)self fireCompletionHandler];
}

uint64_t __34__GCControllerMBDelegate_stopScan__block_invoke()
{
  if (gc_isInternalBuild())
  {
    v1 = getGCLogger();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v2 = 0;
      _os_log_impl(&dword_220998000, v1, OS_LOG_TYPE_DEFAULT, "BT discovery destroy", v2, 2u);
    }
  }
  return BTDiscoveryAgentDestroy();
}

uint64_t __34__GCControllerMBDelegate_stopScan__block_invoke_86()
{
  if (gc_isInternalBuild())
  {
    v1 = getGCLogger();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v2 = 0;
      _os_log_impl(&dword_220998000, v1, OS_LOG_TYPE_DEFAULT, "BT pairing destroy", v2, 2u);
    }
  }
  return BTPairingAgentDestroy();
}

void __34__GCControllerMBDelegate_stopScan__block_invoke_87()
{
  BTSessionDetachWithQueue();
  if (gc_isInternalBuild())
  {
    v0 = getGCLogger();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_220998000, v0, OS_LOG_TYPE_DEFAULT, "BT session detached", v1, 2u);
    }
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end