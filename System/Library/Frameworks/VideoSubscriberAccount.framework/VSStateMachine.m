@interface VSStateMachine
- (BOOL)enqueueEvent:(id)a3;
- (BOOL)ignoresUnassignedEvents;
- (NSMutableArray)enqueuedTransitions;
- (NSMutableDictionary)ignoredEventsByState;
- (NSMutableDictionary)transitionTable;
- (NSOperationQueue)transitionQueue;
- (NSString)name;
- (VSOptional)currentState;
- (VSStateMachine)init;
- (VSStateMachineDelegate)delegate;
- (id)description;
- (void)_enteringState:(id)a3;
- (void)_exitingState:(id)a3;
- (void)_handleEnqueuedTransitions;
- (void)_setDestinationState:(id)a3 forEvent:(id)a4 inState:(id)a5 ignoringEvent:(BOOL)a6;
- (void)activateWithState:(id)a3;
- (void)ignoreEvent:(id)a3 inState:(id)a4;
- (void)setCurrentState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationState:(id)a3 forEvent:(id)a4 inState:(id)a5;
- (void)setEnqueuedTransitions:(id)a3;
- (void)setIgnoredEventsByState:(id)a3;
- (void)setIgnoresUnassignedEvents:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setTransitionQueue:(id)a3;
- (void)setTransitionTable:(id)a3;
@end

@implementation VSStateMachine

- (VSStateMachine)init
{
  v16.receiver = self;
  v16.super_class = (Class)VSStateMachine;
  v2 = [(VSStateMachine *)&v16 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_1F34B2EC8;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    transitionQueue = v3->_transitionQueue;
    v3->_transitionQueue = v5;

    [(NSOperationQueue *)v3->_transitionQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v3->_transitionQueue setName:@"com.apple.VideoSubscriberAccount.StateMachine"];
    v7 = objc_alloc_init(VSOptional);
    currentState = v3->_currentState;
    v3->_currentState = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    enqueuedTransitions = v3->_enqueuedTransitions;
    v3->_enqueuedTransitions = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    transitionTable = v3->_transitionTable;
    v3->_transitionTable = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    ignoredEventsByState = v3->_ignoredEventsByState;
    v3->_ignoredEventsByState = v13;
  }
  return v3;
}

- (void)_enteringState:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = (NSString *)a3;
  v5 = [(NSString *)v4 capitalizedString];
  v6 = [v5 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F34B2EC8];

  v7 = [NSString stringWithFormat:@"transitionTo%@State", v6];
  v8 = NSSelectorFromString(v7);
  v9 = [(VSStateMachine *)self delegate];
  v10 = VSDefaultLogObject();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (!v11) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412546;
    v20 = self;
    __int16 v21 = 2112;
    v22 = v4;
    goto LABEL_18;
  }
  if (v11)
  {
    NSStringFromSelector(v8);
    v12 = (VSStateMachine *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v12;
    _os_log_impl(&dword_1DA674000, v10, OS_LOG_TYPE_DEFAULT, "Checking transition selector %@", buf, 0xCu);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    char v17 = objc_opt_respondsToSelector();
    v10 = VSDefaultLogObject();
    BOOL v18 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v18)
      {
        *(_DWORD *)buf = 138412546;
        v20 = self;
        __int16 v21 = 2112;
        v22 = v4;
      }

      [v9 stateMachine:self transitionToState:v4];
      v10 = VSDefaultLogObject();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 138412546;
      v20 = self;
      __int16 v21 = 2112;
      v22 = v4;
    }
    else
    {
      if (!v18) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 138412546;
      v20 = self;
      __int16 v21 = 2112;
      v22 = v4;
    }
LABEL_18:
    v15 = v10;
    uint32_t v16 = 22;
    goto LABEL_19;
  }
  v13 = VSDefaultLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v20 = self;
    __int16 v21 = 2112;
    v22 = v7;
    __int16 v23 = 2112;
    v24 = v4;
  }

  objc_msgSend(v9, v8, self);
  v10 = VSDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v20 = self;
    __int16 v21 = 2112;
    v22 = v7;
    __int16 v23 = 2112;
    v24 = v4;
    v15 = v10;
    uint32_t v16 = 32;
LABEL_19:
    _os_log_impl(&dword_1DA674000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
  }
LABEL_20:
}

- (void)_exitingState:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = (NSString *)a3;
  v5 = (void *)MEMORY[0x1E0173AA0]();
  v6 = [(NSString *)v4 capitalizedString];
  v7 = [v6 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F34B2EC8];

  v8 = [NSString stringWithFormat:@"transitionFrom%@State", v7];
  v9 = NSSelectorFromString(v8);
  v10 = [(VSStateMachine *)self delegate];
  BOOL v11 = VSDefaultLogObject();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (!v12) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412546;
    __int16 v21 = self;
    __int16 v22 = 2112;
    __int16 v23 = v4;
    goto LABEL_18;
  }
  if (v12)
  {
    NSStringFromSelector(v9);
    v13 = (VSStateMachine *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    __int16 v21 = v13;
    _os_log_impl(&dword_1DA674000, v11, OS_LOG_TYPE_DEFAULT, "Checking transition selector %@", buf, 0xCu);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    char v18 = objc_opt_respondsToSelector();
    BOOL v11 = VSDefaultLogObject();
    BOOL v19 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412546;
        __int16 v21 = self;
        __int16 v22 = 2112;
        __int16 v23 = v4;
      }

      [v10 stateMachine:self transitionFromState:v4];
      BOOL v11 = VSDefaultLogObject();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 138412546;
      __int16 v21 = self;
      __int16 v22 = 2112;
      __int16 v23 = v4;
    }
    else
    {
      if (!v19) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 138412546;
      __int16 v21 = self;
      __int16 v22 = 2112;
      __int16 v23 = v4;
    }
LABEL_18:
    uint32_t v16 = v11;
    uint32_t v17 = 22;
    goto LABEL_19;
  }
  v14 = VSDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v21 = self;
    __int16 v22 = 2112;
    __int16 v23 = v8;
    __int16 v24 = 2112;
    uint64_t v25 = v4;
  }

  objc_msgSend(v10, v9, self);
  BOOL v11 = VSDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v21 = self;
    __int16 v22 = 2112;
    __int16 v23 = v8;
    __int16 v24 = 2112;
    uint64_t v25 = v4;
    uint32_t v16 = v11;
    uint32_t v17 = 32;
LABEL_19:
    _os_log_impl(&dword_1DA674000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
  }
LABEL_20:
}

- (void)_handleEnqueuedTransitions
{
  char v3 = 0;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  do
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = [(VSStateMachine *)v4 enqueuedTransitions];
    v6 = [v5 objectAtIndex:0];
    v7 = +[VSOptional optionalWithObject:v6];

    [v5 removeObjectAtIndex:0];
    BOOL v8 = [v5 count] != 0;
    v9 = [v7 forceUnwrapObject];
    v10 = [v9 previousState];
    BOOL v11 = [v10 forceUnwrapObject];

    BOOL v12 = [v9 nextState];
    v13 = [v12 forceUnwrapObject];

    v14 = VSDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      __int16 v27 = 2112;
      v28 = self;
    }

    v15 = +[VSOptional optionalWithObject:v13];
    [(VSStateMachine *)v4 setCurrentState:v15];

    uint32_t v16 = [(VSStateMachine *)v4 transitionQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __44__VSStateMachine__handleEnqueuedTransitions__block_invoke;
    v20[3] = &unk_1E6BD2EE0;
    v20[4] = v4;
    id v17 = v11;
    id v21 = v17;
    id v18 = v13;
    id v22 = v18;
    [v16 addOperationWithBlock:v20];

    objc_sync_exit(v4);
    char v19 = v3 | v8;
    char v3 = 1;
  }
  while ((v19 & 1) != 0);
}

void __44__VSStateMachine__handleEnqueuedTransitions__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _exitingState:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _enteringState:*(void *)(a1 + 48)];
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
  }
}

- (void)_setDestinationState:(id)a3 forEvent:(id)a4 inState:(id)a5 ignoringEvent:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)MEMORY[0x1E4F1C3C8];
  if (v12)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_25:
    [MEMORY[0x1E4F1CA00] raise:*v13 format:@"The destinationState parameter must not be nil."];
    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_26;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The sourceState parameter must not be nil."];
  if (!v10) {
    goto LABEL_25;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_26:
  [MEMORY[0x1E4F1CA00] raise:*v13 format:@"The triggeringEvent parameter must not be nil."];
LABEL_4:
  v14 = (void *)[v12 copy];

  id v27 = (id)[v10 copy];
  v15 = (void *)[v11 copy];

  if (atomic_load((unsigned int *)&self->_mode)) {
    [MEMORY[0x1E4F1CA00] raise:*v13, @"Attempt to allow state transition after activation of state machine %@.", self format];
  }
  id v17 = self;
  objc_sync_enter(v17);
  id v18 = [(VSStateMachine *)v17 ignoredEventsByState];
  id v19 = [v18 objectForKey:v14];
  if (!v19)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [v18 setObject:v19 forKey:v14];

    if (!v19)
    {
      [MEMORY[0x1E4F1CA00] raise:*v13 format:@"The ignoredEventsOrNil parameter must not be nil."];
      id v19 = 0;
    }
  }
  id v20 = v19;
  id v21 = [(VSStateMachine *)v17 transitionTable];
  id v22 = [v21 objectForKey:v14];
  if (!v22)
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v21 setObject:v22 forKey:v14];

    if (!v22)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The transitionsOrNil parameter must not be nil."];
      id v22 = 0;
    }
  }
  id v23 = v22;
  __int16 v24 = v23;
  if (v6)
  {
    __int16 v25 = [v23 objectForKey:v15];
    if (v25) {
    [v20 addObject:v15];
    }
  }
  else
  {
    if ([v20 containsObject:v15]) {
    [v24 setObject:v27 forKey:v15];
    }
  }

  objc_sync_exit(v17);
  if (atomic_load((unsigned int *)&self->_mode)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Attempt to allow state transition after activation of state machine %@.", v17 format];
  }
}

- (void)setName:(id)a3
{
  if (self->_name != a3)
  {
    id v4 = a3;
    uint64_t v5 = (NSString *)[v4 copy];
    name = self->_name;
    self->_name = v5;

    id v8 = [(VSStateMachine *)self transitionQueue];
    uint64_t v7 = [NSString stringWithFormat:@"%@ State Machine Transition Queue", v4];

    [v8 setName:v7];
  }
}

- (void)ignoreEvent:(id)a3 inState:(id)a4
{
}

- (void)setDestinationState:(id)a3 forEvent:(id)a4 inState:(id)a5
{
}

- (void)activateWithState:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  if (!v36) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The initialState parameter must not be nil."];
  }
  uint64_t v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v51 = self;
    __int16 v52 = 2112;
    id v53 = v36;
  }

  int v4 = 0;
  atomic_compare_exchange_strong(&self->_mode, (unsigned int *)&v4, 1u);
  if (v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Attempt to activate already-activated state machine %@.", self format];
  }
  else
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    obuint64_t j = v5;
    v34 = [(VSStateMachine *)v5 ignoredEventsByState];
    BOOL v6 = [(VSStateMachine *)v5 transitionTable];
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v8 = [v6 allKeys];
    [v39 addObjectsFromArray:v8];

    uint64_t v9 = [v34 allKeys];
    [v39 addObjectsFromArray:v9];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v10 = [v6 allValues];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v45 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = [*(id *)(*((void *)&v44 + 1) + 8 * i) allValues];
          [v39 addObjectsFromArray:v14];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v11);
    }

    v15 = [v39 allObjects];
    [v37 addObjectsFromArray:v15];

    [v7 addObject:v36];
    [v37 removeObject:v36];
    v32 = [v6 objectForKey:v36];
    if (v32)
    {
      id v16 = v32;
      id v17 = [v16 allValues];
      [v38 addObjectsFromArray:v17];

      [v38 minusSet:v7];
    }
    do
    {
      [v37 minusSet:v38];
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v19 = v38;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v41 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(void *)(*((void *)&v40 + 1) + 8 * j);
            [v7 addObject:v23];
            __int16 v24 = [v6 objectForKey:v23];
            __int16 v25 = v24;
            if (v24)
            {
              id v26 = v24;
              id v27 = [v26 allValues];
              [v18 addObjectsFromArray:v27];
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v20);
      }

      v28 = [v18 allObjects];
      [v19 addObjectsFromArray:v28];

      [v19 minusSet:v7];
    }
    while ([v19 count]);
    uint64_t v29 = (void *)[v39 mutableCopy];
    [v29 minusSet:v7];
    if ([v29 count])
    {
    }
    else
    {
      v30 = +[VSOptional optionalWithObject:v36];
      [(VSStateMachine *)obj setCurrentState:v30];
    }
    objc_sync_exit(obj);

    int v31 = 1;
    atomic_compare_exchange_strong(&self->_mode, (unsigned int *)&v31, 2u);
  }
}

- (BOOL)enqueueEvent:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The event parameter must not be nil."];
  }
  uint64_t v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v32 = v4;
    __int16 v33 = 2112;
    v34 = self;
  }

  BOOL v6 = (void *)[v4 copy];
  unsigned int v7 = atomic_load((unsigned int *)&self->_mode);
  if (v7 != 2) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Attempt to enqueue an event prior to activation of state machine %@.", self format];
  }
  id v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = [(VSStateMachine *)v8 currentState];
  id v10 = [(VSStateMachine *)v8 enqueuedTransitions];
  uint64_t v11 = [v10 count];
  BOOL v12 = v11 == 0;
  if (v11)
  {
    v13 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v10, "count") - 1);
    uint64_t v14 = [v13 nextState];

    uint64_t v9 = (void *)v14;
  }
  v15 = [v9 forceUnwrapObject];
  BOOL v29 = v12;
  id v16 = [(VSStateMachine *)v8 transitionTable];
  id v17 = [v16 objectForKey:v15];

  id v18 = [v17 objectForKey:v6];
  BOOL v30 = v18 != 0;
  if (v18)
  {
    id v19 = objc_alloc_init(VSStateTransition);
    uint64_t v20 = +[VSOptional optionalWithObject:v15];
    [(VSStateTransition *)v19 setPreviousState:v20];

    uint64_t v21 = +[VSOptional optionalWithObject:v6];
    [(VSStateTransition *)v19 setTriggeringEvent:v21];

    id v22 = +[VSOptional optionalWithObject:v18];
    [(VSStateTransition *)v19 setNextState:v22];

    [v10 addObject:v19];
    goto LABEL_11;
  }
  __int16 v25 = [(VSStateMachine *)v8 ignoredEventsByState];
  id v26 = [v25 objectForKey:v15];
  int v27 = [v26 containsObject:v6];

  if (v27)
  {
    VSDefaultLogObject();
    id v19 = (VSStateTransition *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 0;
      BOOL v29 = 0;
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412802;
    id v32 = v6;
    __int16 v33 = 2112;
    v34 = v15;
    __int16 v35 = 2112;
    id v36 = v8;
    BOOL v29 = 0;
LABEL_11:
    int v23 = 0;
LABEL_12:

    goto LABEL_13;
  }
  if ([(VSStateMachine *)v8 ignoresUnassignedEvents])
  {
    VSDefaultLogObject();
    id v19 = (VSStateTransition *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v32 = v6;
      __int16 v33 = 2112;
      v34 = v15;
      __int16 v35 = 2112;
      id v36 = v8;
    }
    int v23 = 1;
    goto LABEL_12;
  }
  v28 = VSErrorLogObject();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v32 = v6;
    __int16 v33 = 2112;
    v34 = v15;
    __int16 v35 = 2112;
    id v36 = v8;
  }

  int v23 = 0;
LABEL_13:

  objc_sync_exit(v8);
  if ((v23 | !v29)) {
    BOOL v30 = (v18 != 0) & (v23 ^ 1);
  }
  else {
    [(VSStateMachine *)v8 _handleEnqueuedTransitions];
  }

  return v30;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VSStateMachine;
  id v4 = [(VSStateMachine *)&v8 description];
  uint64_t v5 = [(VSStateMachine *)self name];
  BOOL v6 = [v3 stringWithFormat:@"<%@ name=%@>", v4, v5];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (VSOptional)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (VSStateMachineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VSStateMachineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)ignoresUnassignedEvents
{
  return self->_ignoresUnassignedEvents;
}

- (void)setIgnoresUnassignedEvents:(BOOL)a3
{
  self->_ignoresUnassignedEvents = a3;
}

- (NSOperationQueue)transitionQueue
{
  return self->_transitionQueue;
}

- (void)setTransitionQueue:(id)a3
{
}

- (NSMutableArray)enqueuedTransitions
{
  return self->_enqueuedTransitions;
}

- (void)setEnqueuedTransitions:(id)a3
{
}

- (NSMutableDictionary)transitionTable
{
  return self->_transitionTable;
}

- (void)setTransitionTable:(id)a3
{
}

- (NSMutableDictionary)ignoredEventsByState
{
  return self->_ignoredEventsByState;
}

- (void)setIgnoredEventsByState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredEventsByState, 0);
  objc_storeStrong((id *)&self->_transitionTable, 0);
  objc_storeStrong((id *)&self->_enqueuedTransitions, 0);
  objc_storeStrong((id *)&self->_transitionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentState, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end