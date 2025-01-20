@interface CMContinuityCaptureStateMachine
- (BOOL)postEventWithName:(id)a3 data:(id)a4;
- (BOOL)postSameStateAction:(id)a3 transition:(id)a4 event:(id)a5;
- (BOOL)postStateChangeAction:(id)a3 transition:(id)a4 event:(id)a5;
- (CMContinuityCaptureState)currentState;
- (CMContinuityCaptureStateMachine)initWithActionDelegate:(id)a3 queue:(id)a4;
- (NSMutableArray)deferredEvents;
- (OS_dispatch_queue)queue;
- (id)description;
- (id)eventForName:(id)a3;
- (id)getDeferredEventsToPostForState:(id)a3;
- (id)getNewStateAfterPostingDeferredEvents:(id)a3 deferredEventsToPost:(id *)a4;
- (void)_enqueueEventWithNameToPost:(id)a3 data:(id)a4;
- (void)_notifyCompletion:(id)a3;
- (void)addEvents:(id)a3;
- (void)addStateTransitions:(id)a3;
- (void)aggregateEvents;
- (void)enqueueEventWithNameToPost:(id)a3 data:(id)a4;
- (void)notifyCompletion:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setDeferredEvents:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CMContinuityCaptureStateMachine

- (CMContinuityCaptureStateMachine)initWithActionDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CMContinuityCaptureStateMachine;
  v8 = [(CMContinuityCaptureStateMachine *)&v22 init];
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  transactions = v8->_transactions;
  v8->_transactions = v9;

  if (!v8->_transactions) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v8->_queue, a4);
  if (!v8->_queue) {
    goto LABEL_10;
  }
  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  previousStates = v8->_previousStates;
  v8->_previousStates = v11;

  if (!v8->_previousStates) {
    goto LABEL_10;
  }
  v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  deferredEvents = v8->_deferredEvents;
  v8->_deferredEvents = v13;

  if (!v8->_deferredEvents) {
    goto LABEL_10;
  }
  v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  events = v8->_events;
  v8->_events = v15;

  if (!v8->_events) {
    goto LABEL_10;
  }
  v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  eventQueue = v8->_eventQueue;
  v8->_eventQueue = v17;

  if (v8->_eventQueue
    && (id v19 = objc_storeWeak((id *)&v8->_actionDelegate, v6), v6, v6))
  {
    v20 = v8;
  }
  else
  {
LABEL_10:
    v20 = 0;
  }

  return v20;
}

- (id)eventForName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_events objectForKeyedSubscript:a3];
}

- (void)addStateTransitions:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    [(NSMutableArray *)v5->_transactions addObjectsFromArray:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)addEvents:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__CMContinuityCaptureStateMachine_addEvents___block_invoke;
  v3[3] = &unk_264C99A18;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

void __45__CMContinuityCaptureStateMachine_addEvents___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = a2;
  id v4 = [v3 name];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (BOOL)postSameStateAction:(id)a3 transition:(id)a4 event:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 action];

  if (v11)
  {
    v12 = [v9 action];
    ((void (**)(void, id))v12)[2](v12, v10);
  }
  v13 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
    v15 = [v8 name];
    v16 = [(CMContinuityCaptureStateMachine *)self currentState];
    v17 = [v16 name];
    v18 = [(CMContinuityCaptureStateMachine *)self currentState];
    [v18 pendingEvents];
    id v19 = v22 = v8;
    deferredEvents = self->_deferredEvents;
    *(_DWORD *)buf = 138544642;
    id v24 = WeakRetained;
    __int16 v25 = 2114;
    v26 = v15;
    __int16 v27 = 2114;
    v28 = v17;
    __int16 v29 = 2114;
    id v30 = v10;
    __int16 v31 = 2114;
    v32 = v19;
    __int16 v33 = 2114;
    v34 = deferredEvents;
    _os_log_impl(&dword_235FC2000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Transition to state %{public}@ from %{public}@ on event %{public}@ state pendingEvents %{public}@ deferredEvents %{public}@", buf, 0x3Eu);

    id v8 = v22;
  }

  return 1;
}

- (id)getDeferredEventsToPostForState:(id)a3
{
  id v4 = a3;
  if (![(NSMutableArray *)self->_deferredEvents count])
  {
    id v5 = (id)MEMORY[0x263EFFA68];
    goto LABEL_23;
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [v4 name];
  char v7 = [v6 isEqualToString:@"kCMContinuityCaptureStateStreaming"];

  if ((v7 & 1) == 0)
  {
    [v5 addObjectsFromArray:self->_deferredEvents];
    goto LABEL_22;
  }
  id v8 = [(NSMutableArray *)self->_deferredEvents objectAtIndexedSubscript:0];
  unsigned int v9 = [v8 isEntry];

  uint64_t v10 = v9;
  unint64_t v11 = 1;
  if ((unint64_t)[(NSMutableArray *)self->_deferredEvents count] >= 2)
  {
    do
    {
      v12 = [(NSMutableArray *)self->_deferredEvents objectAtIndexedSubscript:0];
      v13 = [v12 name];
      v14 = [(NSMutableArray *)self->_deferredEvents objectAtIndexedSubscript:v11];
      v15 = [v14 name];
      int v16 = CMContinuityCaptureSMValidSameStateEventName(v13, v15);

      if (!v16) {
        break;
      }
      v17 = [(NSMutableArray *)self->_deferredEvents objectAtIndexedSubscript:v11];
      int v18 = [v17 isEntry];

      if (v18) {
        ++v10;
      }
      else {
        uint64_t v10 = 0;
      }
      ++v11;
    }
    while (v11 < [(NSMutableArray *)self->_deferredEvents count]);
  }
  uint64_t v19 = 0;
  while (1)
  {
    v20 = [(NSMutableArray *)self->_deferredEvents objectAtIndexedSubscript:v19];
    int v21 = [v20 isEntry];

    if (!v10) {
      break;
    }
    if (v21) {
      goto LABEL_18;
    }
LABEL_14:
    if (v11 == ++v19) {
      goto LABEL_20;
    }
  }
  if (v21) {
    goto LABEL_14;
  }
LABEL_18:
  uint64_t v22 = [(NSMutableArray *)self->_deferredEvents objectAtIndexedSubscript:v19];
  if (v22)
  {
    v23 = (void *)v22;
    [v5 addObject:v22];
  }
LABEL_20:
  while (v11 < [(NSMutableArray *)self->_deferredEvents count])
  {
    id v24 = [(NSMutableArray *)self->_deferredEvents objectAtIndexedSubscript:v11];
    [v5 addObject:v24];

    ++v11;
  }
LABEL_22:
  __int16 v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  deferredEvents = self->_deferredEvents;
  self->_deferredEvents = v25;

LABEL_23:
  return v5;
}

- (id)getNewStateAfterPostingDeferredEvents:(id)a3 deferredEventsToPost:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x263EFF980]);
  id v8 = [(CMContinuityCaptureStateMachine *)self getDeferredEventsToPostForState:v6];
  unsigned int v9 = (void *)[v7 initWithArray:v8];

  uint64_t v10 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138543618;
    __int16 v27 = self;
    __int16 v28 = 2114;
    __int16 v29 = v9;
    _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Deferred to post %{public}@", (uint8_t *)&v26, 0x16u);
  }

  if (v9 && [v9 count])
  {
    if (!v6)
    {
LABEL_8:
      v15 = [v9 firstObject];
      if (([v15 isEntry] & 1) != 0
        || ([v15 name],
            int v16 = objc_claimAutoreleasedReturnValue(),
            char valid = CMContinuityCaptureSMIsValidExitEventForState(v16, @"kCMContinuityCaptureStateStreaming"),
            v16,
            (valid & 1) == 0))
      {
        *a4 = v9;
      }
      else if ([(NSMutableArray *)self->_previousStates count])
      {
        int v18 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id WeakRetained = (CMContinuityCaptureStateMachine *)objc_loadWeakRetained((id *)&self->_actionDelegate);
          v20 = [(NSMutableArray *)self->_previousStates lastObject];
          int v26 = 138544130;
          __int16 v27 = WeakRetained;
          __int16 v28 = 2114;
          __int16 v29 = v9;
          __int16 v30 = 2114;
          id v31 = v6;
          __int16 v32 = 2114;
          __int16 v33 = v20;
          _os_log_impl(&dword_235FC2000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Deferred exit event %{public}@ for state %{public}@ , move to previous state %{public}@", (uint8_t *)&v26, 0x2Au);
        }
        int v21 = [v6 exitAction];

        if (v21)
        {
          uint64_t v22 = [v6 exitAction];
          v23 = [v9 firstObject];
          ((void (**)(void, void *))v22)[2](v22, v23);
        }
        id v24 = [(NSMutableArray *)self->_previousStates lastObject];
        [(NSMutableArray *)self->_previousStates removeLastObject];
        [v9 removeObjectAtIndex:0];
        *a4 = v9;
        goto LABEL_18;
      }
      id v24 = v6;
LABEL_18:

      goto LABEL_21;
    }
    unint64_t v11 = [v6 name];
    int v12 = [v11 isEqualToString:@"kCMContinuityCaptureStateTerminated"];

    if (!v12)
    {
      v13 = [v6 name];
      int v14 = [v13 isEqualToString:@"kCMContinuityCaptureStateStreaming"];

      if (v14) {
        goto LABEL_8;
      }
      *a4 = v9;
    }
  }
  id v24 = v6;
LABEL_21:

  return v24;
}

- (BOOL)postStateChangeAction:(id)a3 transition:(id)a4 event:(id)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isEntry]) {
    goto LABEL_4;
  }
  if (![(NSMutableArray *)self->_previousStates count]) {
    goto LABEL_10;
  }
  unint64_t v11 = [(NSMutableArray *)self->_previousStates lastObject];
  int v12 = [v11 name];
  v13 = [v8 name];
  int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
LABEL_4:
    v15 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
      v17 = [v8 name];
      int v18 = [(CMContinuityCaptureStateMachine *)self currentState];
      [v18 name];
      id v49 = v8;
      v20 = id v19 = v9;
      int v21 = [(CMContinuityCaptureStateMachine *)self currentState];
      uint64_t v22 = [v21 pendingEvents];
      deferredEvents = self->_deferredEvents;
      *(_DWORD *)buf = 138544642;
      id v54 = WeakRetained;
      __int16 v55 = 2114;
      id v56 = v17;
      __int16 v57 = 2114;
      v58 = v20;
      __int16 v59 = 2114;
      id v60 = v10;
      __int16 v61 = 2114;
      v62 = v22;
      __int16 v63 = 2114;
      v64 = deferredEvents;
      _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Transition to state %{public}@ from %{public}@ on event %{public}@ state pendingEvents %{public}@ deferredEvents %{public}@", buf, 0x3Eu);

      id v9 = v19;
      id v8 = v49;
    }
    id v24 = [(CMContinuityCaptureStateMachine *)self currentState];
    __int16 v25 = [v24 exitAction];

    if (v25)
    {
      int v26 = [(CMContinuityCaptureStateMachine *)self currentState];
      __int16 v27 = [v26 exitAction];
      ((void (**)(void, id))v27)[2](v27, v10);
    }
    int v28 = [v10 isEntry];
    previousStates = self->_previousStates;
    if (v28)
    {
      __int16 v30 = [(CMContinuityCaptureStateMachine *)self currentState];
      [(NSMutableArray *)previousStates addObject:v30];
    }
    else if ([(NSMutableArray *)self->_previousStates count])
    {
      [(NSMutableArray *)self->_previousStates removeLastObject];
    }
    else
    {
      __int16 v33 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        id v47 = objc_loadWeakRetained((id *)&self->_actionDelegate);
        v48 = [(CMContinuityCaptureStateMachine *)self currentState];
        *(_DWORD *)buf = 138413058;
        id v54 = v47;
        __int16 v55 = 2112;
        id v56 = v10;
        __int16 v57 = 2112;
        v58 = v48;
        __int16 v59 = 2112;
        id v60 = v8;
        _os_log_fault_impl(&dword_235FC2000, v33, OS_LOG_TYPE_FAULT, "%@ Unexpected SM event %@ current %@ dst %@", buf, 0x2Au);
      }
    }
    uint64_t v34 = [v9 action];

    if (v34)
    {
      uint64_t v35 = [v9 action];
      ((void (**)(void, id))v35)[2](v35, v10);
    }
    [(CMContinuityCaptureStateMachine *)self willChangeValueForKey:@"currentState"];
    id v52 = 0;
    v36 = [(CMContinuityCaptureStateMachine *)self getNewStateAfterPostingDeferredEvents:v8 deferredEventsToPost:&v52];
    id v32 = v52;
    [(CMContinuityCaptureStateMachine *)self setCurrentState:v36];

    [(CMContinuityCaptureStateMachine *)self didChangeValueForKey:@"currentState"];
    v37 = [(CMContinuityCaptureStateMachine *)self currentState];
    v38 = [v37 entryAction];

    if (v38)
    {
      v39 = [(CMContinuityCaptureStateMachine *)self currentState];
      v40 = [v39 entryAction];
      ((void (**)(void, id))v40)[2](v40, v10);
    }
    if (v32 && [v32 count])
    {
      v41 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        id v42 = objc_loadWeakRetained((id *)&self->_actionDelegate);
        v43 = [(CMContinuityCaptureStateMachine *)self currentState];
        *(_DWORD *)buf = 138543874;
        id v54 = v42;
        __int16 v55 = 2114;
        id v56 = v32;
        __int16 v57 = 2114;
        v58 = v43;
        _os_log_impl(&dword_235FC2000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ Post Deferred event %{public}@ on current state %{public}@", buf, 0x20u);
      }
      id v44 = objc_loadWeakRetained((id *)&self->_actionDelegate);
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __74__CMContinuityCaptureStateMachine_postStateChangeAction_transition_event___block_invoke;
      v50[3] = &unk_264C99A18;
      id v51 = v44;
      id v45 = v44;
      [v32 enumerateObjectsUsingBlock:v50];
    }
    BOOL v31 = 1;
  }
  else
  {
LABEL_10:
    BOOL v31 = 0;
    id v32 = 0;
  }

  return v31;
}

void __74__CMContinuityCaptureStateMachine_postStateChangeAction_transition_event___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 name];
  id v4 = [v3 data];

  [v2 postDeferredEvent:v5 data:v4];
}

- (void)_enqueueEventWithNameToPost:(id)a3 data:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (CMContinuityCaptureValidSMEvent(v6))
  {
    if (v7) {
      id v8 = v7;
    }
    else {
      id v8 = (id)MEMORY[0x263EFFA78];
    }
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    int v12 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      currentState = self->_currentState;
      *(_DWORD *)buf = 138543874;
      int v26 = self;
      __int16 v27 = 2114;
      id v28 = v6;
      __int16 v29 = 2114;
      __int16 v30 = currentState;
      _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueueEvent %{public}@ on current state %{public}@", buf, 0x20u);
    }

    uint64_t v14 = [(NSMutableArray *)self->_eventQueue count];
    eventQueue = self->_eventQueue;
    if (v14)
    {
      v22[0] = v6;
      id v19 = @"kCMContinuityCaptureEventName";
      v20 = @"kCMContinuityCaptureEventEnqueueTime";
      unint64_t v11 = CMContinuityCaptureGetCurrentTimeString();
      int v21 = @"kCMContinuityCaptureEventData";
      v22[1] = v11;
      v22[2] = v8;
      int v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v19 count:3];
      -[NSMutableArray addObject:](eventQueue, "addObject:", v16, v19, v20);
    }
    else
    {
      v24[0] = v6;
      v23[0] = @"kCMContinuityCaptureEventName";
      v23[1] = @"kCMContinuityCaptureEventEnqueueTime";
      v17 = CMContinuityCaptureGetCurrentTimeString();
      v23[2] = @"kCMContinuityCaptureEventData";
      v24[1] = v17;
      v24[2] = v8;
      int v18 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
      [(NSMutableArray *)eventQueue addObject:v18];

      if ([(CMContinuityCaptureStateMachine *)self postEventWithName:v6 data:v8])
      {
LABEL_17:

        goto LABEL_18;
      }
      unint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:2 userInfo:0];
      [(CMContinuityCaptureStateMachine *)self _notifyCompletion:v11];
    }
LABEL_16:

    goto LABEL_17;
  }
  id v9 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[CMContinuityCaptureStateMachine _enqueueEventWithNameToPost:data:]((uint64_t)self, (uint64_t)v6, v9);
  }

  if (v7)
  {
    id v10 = [v7 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataCompletionBlock"];

    if (v10)
    {
      id v8 = [v7 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataCompletionBlock"];
      unint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:2 userInfo:0];
      (*((void (**)(id, void *))v8 + 2))(v8, v11);
      goto LABEL_16;
    }
  }
LABEL_18:
}

- (void)enqueueEventWithNameToPost:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__CMContinuityCaptureStateMachine_enqueueEventWithNameToPost_data___block_invoke;
  v11[3] = &unk_264C99198;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __67__CMContinuityCaptureStateMachine_enqueueEventWithNameToPost_data___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _enqueueEventWithNameToPost:*(void *)(a1 + 32) data:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)aggregateEvents
{
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  id v4 = [WeakRetained aggregateEvents:self->_eventQueue];
  id v5 = (NSMutableArray *)[v3 initWithArray:v4];
  eventQueue = self->_eventQueue;
  self->_eventQueue = v5;
}

- (void)notifyCompletion:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CMContinuityCaptureStateMachine_notifyCompletion___block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__CMContinuityCaptureStateMachine_notifyCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _notifyCompletion:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_notifyCompletion:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id location = (id *)&self->_actionDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  p_eventQueue = &self->_eventQueue;
  if ([(NSMutableArray *)self->_eventQueue count])
  {
    id v7 = CMContinuityCaptureLog(0);
    v40 = &self->_eventQueue;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_loadWeakRetained(location);
      currentState = self->_currentState;
      id v10 = [(NSMutableArray *)self->_eventQueue firstObject];
      unint64_t v11 = [v10 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
      id v12 = [(NSMutableArray *)self->_eventQueue firstObject];
      [v12 objectForKeyedSubscript:@"kCMContinuityCaptureEventEnqueueTime"];
      id v14 = v13 = WeakRetained;
      *(_DWORD *)buf = 138544130;
      id v48 = v8;
      __int16 v49 = 2114;
      v50 = currentState;
      __int16 v51 = 2114;
      id v52 = v11;
      __int16 v53 = 2114;
      id v54 = v14;
      _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ currentState: %{public}@ completedEvent Name:%{public}@ EnqueueTime:%{public}@", buf, 0x2Au);

      id WeakRetained = v13;
      p_eventQueue = &self->_eventQueue;
    }

    if (WeakRetained)
    {
      id v15 = objc_loadWeakRetained(location);
      int v16 = [(NSMutableArray *)*p_eventQueue firstObject];
      v17 = [v16 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
      int v18 = [(NSMutableArray *)*p_eventQueue firstObject];
      id v19 = [v18 objectForKeyedSubscript:@"kCMContinuityCaptureEventData"];
      [v15 postActionCompletionForEventName:v17 eventData:v19 error:v4];

      p_eventQueue = &self->_eventQueue;
    }
    [(NSMutableArray *)*p_eventQueue removeObjectAtIndex:0];
    if (CMContinityCaptureDebugLogEnabled())
    {
      v20 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        [(CMContinuityCaptureStateMachine *)location _notifyCompletion:v20];
      }
    }
    if ([(NSMutableArray *)*p_eventQueue count])
    {
      id v37 = WeakRetained;
      v38 = self;
      id v39 = v4;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      int v21 = *p_eventQueue;
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v43 != v24) {
              objc_enumerationMutation(v21);
            }
            int v26 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            __int16 v27 = CMContinuityCaptureLog(0);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = objc_loadWeakRetained(location);
              __int16 v29 = [v26 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
              __int16 v30 = [v26 objectForKeyedSubscript:@"kCMContinuityCaptureEventEnqueueTime"];
              *(_DWORD *)buf = 138543874;
              id v48 = v28;
              __int16 v49 = 2114;
              v50 = v29;
              __int16 v51 = 2114;
              id v52 = v30;
              _os_log_impl(&dword_235FC2000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ pendingEvent Name:%{public}@ EnqueueTime:%{public}@", buf, 0x20u);
            }
          }
          uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v23);
      }

      self = v38;
      [(CMContinuityCaptureStateMachine *)v38 aggregateEvents];
      id v4 = v39;
      p_eventQueue = v40;
    }
    if ([(NSMutableArray *)*p_eventQueue count])
    {
      uint64_t v31 = [(NSMutableArray *)self->_eventQueue objectAtIndexedSubscript:0];
      id v32 = [v31 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
      __int16 v33 = [(NSMutableArray *)self->_eventQueue objectAtIndexedSubscript:0];
      uint64_t v34 = [v33 objectForKeyedSubscript:@"kCMContinuityCaptureEventData"];
      BOOL v35 = [(CMContinuityCaptureStateMachine *)self postEventWithName:v32 data:v34];

      if (!v35)
      {
        v36 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:2 userInfo:0];
        [(CMContinuityCaptureStateMachine *)self _notifyCompletion:v36];
      }
    }
  }
}

- (BOOL)postEventWithName:(id)a3 data:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v8->_transactions];
  objc_sync_exit(v8);

  if (v9
    && ([(CMContinuityCaptureStateMachine *)v8 currentState],
        id v10 = objc_claimAutoreleasedReturnValue(),
        BOOL v11 = v10 == 0,
        v10,
        !v11)
    && ([(NSMutableDictionary *)v8->_events objectForKeyedSubscript:v6],
        id v12 = objc_claimAutoreleasedReturnValue(),
        (id v13 = v12) != 0))
  {
    [v12 setData:v7];
    id v14 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v8->_actionDelegate);
      int v16 = [(CMContinuityCaptureStateMachine *)v8 currentState];
      v17 = [v16 name];
      *(_DWORD *)buf = 138543874;
      id v31 = WeakRetained;
      __int16 v32 = 2114;
      __int16 v33 = v13;
      __int16 v34 = 2114;
      BOOL v35 = v17;
      _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Post event %{public}@ on currentState %{public}@", buf, 0x20u);
    }
    int v18 = [v13 action];

    if (v18)
    {
      id v19 = [v13 action];
      v19[2]();
    }
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __58__CMContinuityCaptureStateMachine_postEventWithName_data___block_invoke;
    void v23[3] = &unk_264C99A40;
    v23[4] = v8;
    id v20 = v13;
    id v24 = v20;
    __int16 v25 = &v26;
    [v9 enumerateObjectsUsingBlock:v23];
    BOOL v21 = *((unsigned char *)v27 + 24) != 0;
  }
  else
  {
    BOOL v21 = 0;
  }

  _Block_object_dispose(&v26, 8);
  return v21;
}

void __58__CMContinuityCaptureStateMachine_postEventWithName_data___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  id v6 = [*(id *)(a1 + 32) currentState];
  id v7 = [v15 transactionFromStateOnEvent:v6 event:*(void *)(a1 + 40)];

  if (v7)
  {
    id v8 = [v7 name];
    id v9 = [*(id *)(a1 + 32) currentState];
    id v10 = [v9 name];
    int v11 = [v8 isEqualToString:v10];

    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    if (v11) {
      char v14 = [v12 postSameStateAction:v7 transition:v15 event:v13];
    }
    else {
      char v14 = [v12 postStateChangeAction:v7 transition:v15 event:v13];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v14;
    *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

- (id)description
{
  id v3 = NSString;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  id v5 = [v3 stringWithFormat:@"<%p> %@", self, WeakRetained];

  return v5;
}

- (CMContinuityCaptureState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)deferredEvents
{
  return self->_deferredEvents;
}

- (void)setDeferredEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredEvents, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_previousStates, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
}

- (void)_enqueueEventWithNameToPost:(os_log_t)log data:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_235FC2000, log, OS_LOG_TYPE_ERROR, "%@ Invalid SM EventName %@", (uint8_t *)&v3, 0x16u);
}

- (void)_notifyCompletion:(NSObject *)a3 .cold.1(id *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v6 = *a2;
  int v7 = 138543618;
  id v8 = WeakRetained;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_235FC2000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ pendingActions %{public}@", (uint8_t *)&v7, 0x16u);
}

@end