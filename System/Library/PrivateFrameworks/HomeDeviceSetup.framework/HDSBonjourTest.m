@interface HDSBonjourTest
- (HDSBonjourTest)init;
- (OS_dispatch_queue)dispatchQueue;
- (SFSession)sfSession;
- (double)metricTotalSeconds;
- (double)timeout;
- (id)completionHandler;
- (int)bonjourTestState;
- (void)_complete;
- (void)_handleFoundDevice:(id)a3;
- (void)_handleTimeout;
- (void)activate;
- (void)invalidate;
- (void)setCompletionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setSfSession:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation HDSBonjourTest

- (HDSBonjourTest)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDSBonjourTest;
  v2 = [(HDSBonjourTest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__HDSBonjourTest_activate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __26__HDSBonjourTest_activate__block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x263EF8340];
  if (gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = a1 + 32;
  *(_DWORD *)(*(void *)(a1 + 32) + 44) = 1;
  *(void *)(*(void *)v2 + 24) = mach_absolute_time();
  RandomBytes();
  uint64_t v3 = NSStringWithMACAddress();
  v4 = *(void **)(*(void *)(a1 + 32) + 16);
  *(void *)(*(void *)v2 + 16) = v3;

  if (gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 16);
    LogPrintF();
  }
  uint64_t v5 = a1 + 32;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "invalidate", v18);
  uint64_t v6 = objc_opt_new();
  v7 = *(void **)(*(void *)(a1 + 32) + 8);
  *(void *)(*(void *)v5 + 8) = v6;

  [*(id *)(*(void *)v5 + 8) setDispatchQueue:*(void *)(*(void *)v5 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 8) setServiceType:@"_bonjourtest._tcp"];
  [*(id *)(*(void *)(a1 + 32) + 8) setChangeFlags:0xFFFFFFFFLL];
  [*(id *)(*(void *)(a1 + 32) + 8) setDomain:@"local."];
  [*(id *)(*(void *)(a1 + 32) + 8) setLabel:@"HDSBonjour"];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __26__HDSBonjourTest_activate__block_invoke_2;
  v23[3] = &unk_26503FD38;
  objc_copyWeak(&v24, &location);
  [*(id *)(*(void *)(a1 + 32) + 8) setDeviceFoundHandler:v23];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __26__HDSBonjourTest_activate__block_invoke_3;
  v21[3] = &unk_26503FD60;
  objc_copyWeak(&v22, &location);
  [*(id *)(*(void *)(a1 + 32) + 8) setDeviceChangedHandler:v21];
  [*(id *)(*(void *)(a1 + 32) + 8) activate];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 16);
  v26 = @"bjtID";
  v27[0] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 48);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __26__HDSBonjourTest_activate__block_invoke_4;
  v20[3] = &unk_26503FC20;
  v20[4] = v10;
  [v11 sendRequestID:@"_bjtS" options:0 request:v9 responseHandler:v20];
  uint64_t v12 = *(void *)(a1 + 32);
  if (*(double *)(v12 + 80) > 0.0)
  {
    dispatch_source_t v13 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(v12 + 56));
    uint64_t v14 = *(void *)(a1 + 32);
    v15 = *(void **)(v14 + 32);
    *(void *)(v14 + 32) = v13;

    uint64_t v16 = *(void *)(a1 + 32);
    v17 = *(NSObject **)(v16 + 32);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __26__HDSBonjourTest_activate__block_invoke_5;
    handler[3] = &unk_26503F6A8;
    handler[4] = v16;
    dispatch_source_set_event_handler(v17, handler);
    HDSDispatchTimerSet(*(void **)(*(void *)(a1 + 32) + 32), *(double *)(*(void *)(a1 + 32) + 80), -1.0, 1.0);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 32));
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __26__HDSBonjourTest_activate__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleFoundDevice:v3];
}

void __26__HDSBonjourTest_activate__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleFoundDevice:v3];
}

void __26__HDSBonjourTest_activate__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 40)
    && gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __26__HDSBonjourTest_activate__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleTimeout];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__HDSBonjourTest_invalidate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __28__HDSBonjourTest_invalidate__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

- (void)_handleFoundDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 txtDictionary];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"rpBA"];

  if ([v6 isEqualToString:self->_testID])
  {
    if (gLogCategory_HDSBonjourTest <= 30
      && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
    {
      id v12 = v4;
      LogPrintF();
    }
    self->_bonjourTestState = 4;
    timer = self->_timer;
    if (timer)
    {
      id v8 = timer;
      dispatch_source_cancel(v8);
      id v9 = self->_timer;
      self->_timer = 0;
    }
    [(CUBonjourBrowser *)self->_browser invalidate];
    browser = self->_browser;
    self->_browser = 0;

    sfSession = self->_sfSession;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __37__HDSBonjourTest__handleFoundDevice___block_invoke;
    v13[3] = &unk_26503FC20;
    v13[4] = self;
    [(SFSession *)sfSession sendRequestID:@"_bjtD" options:0 request:MEMORY[0x263EFFA78] responseHandler:v13];
  }
  else if (gLogCategory_HDSBonjourTest <= 30 {
         && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __37__HDSBonjourTest__handleFoundDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a2;
  id v6 = a4;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 40))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 72) = v7;
    if (gLogCategory_HDSBonjourTest <= 30
      && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 72);
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "_complete", v9, v6, v12);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_complete", v8, v10, v11);
    }
  }
}

- (void)_handleTimeout
{
  if (!self->_invalidateCalled)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_metricTotalSeconds = v3;
    if (gLogCategory_HDSBonjourTest <= 90
      && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_bonjourTestState = 3;
    [(HDSBonjourTest *)self _complete];
  }
}

- (void)_complete
{
  if (!self->_invalidateCalled)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_metricTotalSeconds = v3;
    completionHandler = (void (**)(void))self->_completionHandler;
    if (completionHandler)
    {
      completionHandler[2]();
      id v5 = self->_completionHandler;
      self->_completionHandler = 0;
    }
  }
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (double)metricTotalSeconds
{
  return self->_metricTotalSeconds;
}

- (int)bonjourTestState
{
  return self->_bonjourTestState;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_testID, 0);
  objc_storeStrong((id *)&self->_browser, 0);
}

@end