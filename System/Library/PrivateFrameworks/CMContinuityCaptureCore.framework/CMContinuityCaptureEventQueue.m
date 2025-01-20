@interface CMContinuityCaptureEventQueue
- (CMContinuityCaptureEventQueue)initWithActionDelegate:(id)a3 queue:(id)a4;
- (void)_dropStreamStartEventsForEntityIfApplicable;
- (void)_notifyCompletion;
- (void)enqueueEventAction:(unint64_t)a3 args:(id)a4;
- (void)notifyCompletion;
- (void)notifyCompletionForIdentfier:(id)a3;
- (void)setEventCompletionExpectationForIdentifiers:(id)a3;
@end

@implementation CMContinuityCaptureEventQueue

- (CMContinuityCaptureEventQueue)initWithActionDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CMContinuityCaptureEventQueue;
  v8 = [(CMContinuityCaptureEventQueue *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    eventQueue = v9->_eventQueue;
    v9->_eventQueue = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    completedIdentifiers = v9->_completedIdentifiers;
    v9->_completedIdentifiers = v12;

    v14 = v9;
  }

  return v9;
}

- (void)enqueueEventAction:(unint64_t)a3 args:(id)a4
{
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__CMContinuityCaptureEventQueue_enqueueEventAction_args___block_invoke;
  block[3] = &unk_264C9A078;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __57__CMContinuityCaptureEventQueue_enqueueEventAction_args___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_loadWeakRetained(v2);
      uint64_t v6 = *(void *)(a1 + 56);
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = [WeakRetained[3] count];
      *(_DWORD *)buf = 138413058;
      id v16 = v5;
      __int16 v17 = 1024;
      int v18 = v6;
      __int16 v19 = 2112;
      uint64_t v20 = v7;
      __int16 v21 = 2048;
      uint64_t v22 = v8;
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ enqueueEventAction %d %@ pendingActionCount %ld", buf, 0x26u);
    }
    id v9 = objc_loadWeakRetained(WeakRetained + 1);
    id v10 = WeakRetained[3];
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(void *)(a1 + 56), @"ContinuityCaptureSelector");
    v13[1] = @"ContinuityCaptureArgs";
    v14[0] = v11;
    v14[1] = *(void *)(a1 + 32);
    v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v10 addObject:v12];

    if ([WeakRetained[3] count] == 1
      && ([v9 postEventAction:*(void *)(a1 + 56) args:*(void *)(a1 + 32)] & 1) == 0)
    {
      [*(id *)(a1 + 40) notifyCompletion];
    }
  }
  else
  {
    id v9 = 0;
  }
}

- (void)setEventCompletionExpectationForIdentifiers:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__CMContinuityCaptureEventQueue_setEventCompletionExpectationForIdentifiers___block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __77__CMContinuityCaptureEventQueue_setEventCompletionExpectationForIdentifiers___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:*(void *)(a1 + 32)];
    v3 = (void *)WeakRetained[4];
    WeakRetained[4] = v2;
  }
}

- (void)notifyCompletionForIdentfier:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__CMContinuityCaptureEventQueue_notifyCompletionForIdentfier___block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__CMContinuityCaptureEventQueue_notifyCompletionForIdentfier___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (CMContinityCaptureDebugLogEnabled())
    {
      id v4 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        id v7 = objc_loadWeakRetained(v2);
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *((void *)WeakRetained + 4);
        uint64_t v10 = *((void *)WeakRetained + 5);
        int v11 = 138413058;
        id v12 = v7;
        __int16 v13 = 2114;
        uint64_t v14 = v8;
        __int16 v15 = 2114;
        uint64_t v16 = v9;
        __int16 v17 = 2114;
        uint64_t v18 = v10;
        _os_log_debug_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEBUG, "%@ notify completion for identifier %{public}@ expected %{public}@ completed %{public}@", (uint8_t *)&v11, 0x2Au);
      }
    }
    [*((id *)WeakRetained + 5) addObject:*(void *)(a1 + 32)];
    id v5 = (void *)*((void *)WeakRetained + 4);
    if (v5 && [v5 isEqualToSet:*((void *)WeakRetained + 5)])
    {
      [*((id *)WeakRetained + 5) removeAllObjects];
      id v6 = (void *)*((void *)WeakRetained + 4);
      *((void *)WeakRetained + 4) = 0;

      [WeakRetained _notifyCompletion];
    }
  }
}

- (void)notifyCompletion
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__CMContinuityCaptureEventQueue_notifyCompletion__block_invoke;
  v4[3] = &unk_264C990F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__CMContinuityCaptureEventQueue_notifyCompletion__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyCompletion];
}

- (void)_dropStreamStartEventsForEntityIfApplicable
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (![(NSMutableArray *)self->_eventQueue count]) {
    return;
  }
  v3 = [(NSMutableArray *)self->_eventQueue firstObject];
  id v4 = [v3 objectForKeyedSubscript:@"ContinuityCaptureArgs"];

  if (!v4 || (unint64_t)[v4 count] < 3) {
    goto LABEL_33;
  }
  id v5 = [v4 objectAtIndexedSubscript:0];
  id v6 = [v4 objectAtIndexedSubscript:1];
  id v7 = [v4 objectAtIndexedSubscript:2];
  if (![v5 isEqualToString:@"kCMContinuityCaptureEventStartStream"]
    || (unint64_t)[(NSMutableArray *)self->_eventQueue count] < 2)
  {
    goto LABEL_32;
  }
  v34 = v5;
  v33 = v7;
  char v8 = 0;
  unint64_t v9 = 1;
  do
  {
    uint64_t v10 = [(NSMutableArray *)self->_eventQueue objectAtIndexedSubscript:v9];
    int v11 = [v10 objectForKeyedSubscript:@"ContinuityCaptureSelector"];

    if (v11)
    {
      id v12 = [(NSMutableArray *)self->_eventQueue objectAtIndexedSubscript:v9];
      __int16 v13 = [v12 objectForKeyedSubscript:@"ContinuityCaptureSelector"];
      int v14 = [v13 unsignedIntValue];

      if (v14 == 3)
      {
        __int16 v15 = [(NSMutableArray *)self->_eventQueue objectAtIndexedSubscript:v9];
        uint64_t v16 = [v15 objectForKeyedSubscript:@"ContinuityCaptureArgs"];

        if (!v16 || (unint64_t)[v16 count] < 3) {
          goto LABEL_23;
        }
        __int16 v17 = [v16 objectAtIndexedSubscript:0];
        uint64_t v18 = [v16 objectAtIndexedSubscript:1];
        if ([v17 isEqualToString:@"kCMContinuityCaptureEventStopStream"]
          && (int v19 = [v18 unsignedIntValue], v19 == objc_msgSend(v6, "unsignedIntValue")))
        {
          uint64_t v20 = CMContinuityCaptureLog(0);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v31 = [(NSMutableArray *)self->_eventQueue objectAtIndexedSubscript:v9];
            uint64_t v21 = [(NSMutableArray *)self->_eventQueue firstObject];
            *(_DWORD *)buf = 138412802;
            v36 = self;
            __int16 v37 = 2112;
            v38 = v31;
            __int16 v39 = 2112;
            uint64_t v40 = v21;
            uint64_t v22 = (void *)v21;
            _os_log_impl(&dword_235FC2000, v20, OS_LOG_TYPE_DEFAULT, "%@ Associated stop %@ for %@", buf, 0x20u);
          }
          char v8 = 1;
        }
        else
        {
          if (![v17 isEqualToString:@"kCMContinuityCaptureEventStartStream"]) {
            goto LABEL_22;
          }
          int v23 = [v18 unsignedIntValue];
          if (v23 != [v6 unsignedIntValue]) {
            goto LABEL_22;
          }
          uint64_t v20 = CMContinuityCaptureLog(0);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v32 = [(NSMutableArray *)self->_eventQueue objectAtIndexedSubscript:v9];
            uint64_t v24 = [(NSMutableArray *)self->_eventQueue firstObject];
            *(_DWORD *)buf = 138412802;
            v36 = self;
            __int16 v37 = 2112;
            v38 = v32;
            __int16 v39 = 2112;
            uint64_t v40 = v24;
            v25 = (void *)v24;
            _os_log_impl(&dword_235FC2000, v20, OS_LOG_TYPE_DEFAULT, "%@ Associated start %@ for %@", buf, 0x20u);
          }
          char v8 = 0;
        }

LABEL_22:
LABEL_23:
      }
    }
    ++v9;
  }
  while ([(NSMutableArray *)self->_eventQueue count] > v9);
  id v7 = v33;
  id v5 = v34;
  if (v8)
  {
    v26 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [(NSMutableArray *)self->_eventQueue firstObject];
      *(_DWORD *)buf = 138412546;
      v36 = self;
      __int16 v37 = 2112;
      v38 = v27;
      _os_log_impl(&dword_235FC2000, v26, OS_LOG_TYPE_DEFAULT, "%@ Dropping %@", buf, 0x16u);
    }
    if (v33)
    {
      v28 = [v33 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataCompletionBlock"];

      if (v28)
      {
        v29 = [v33 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataCompletionBlock"];
        v30 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:2 userInfo:0];
        ((void (**)(void, void *))v29)[2](v29, v30);
      }
    }
    [(NSMutableArray *)self->_eventQueue removeObjectAtIndex:0];
  }
LABEL_32:

LABEL_33:
}

- (void)_notifyCompletion
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [*a2 firstObject];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  unint64_t v9 = v5;
  _os_log_debug_impl(&dword_235FC2000, a3, OS_LOG_TYPE_DEBUG, "%@ Completed %@", (uint8_t *)&v6, 0x16u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedIdentifiers, 0);
  objc_storeStrong((id *)&self->_expectedIdentifiers, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end