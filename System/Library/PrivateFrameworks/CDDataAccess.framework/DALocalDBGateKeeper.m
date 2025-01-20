@interface DALocalDBGateKeeper
+ (id)sharedGateKeeper;
- (BOOL)_canWakenWaiter:(id)a3;
- (BOOL)claimedOwnershipOfEvents;
- (DADataclassLockWatcher)eventsLockHolder;
- (DALocalDBGateKeeper)init;
- (NSMutableArray)eventsWaiters;
- (NSMutableSet)waiterIDsExpectingEventsLock;
- (NSString)unitTestHackRunLoopMode;
- (id)stateString;
- (void)_abortWaiterForWrappers:(id)a3;
- (void)_notifyWaitersForDataclasses:(id)a3;
- (void)_registerWaiter:(id)a3 forDataclassLocks:(int64_t)a4 preempt:(BOOL)a5 completionHandler:(id)a6;
- (void)_sendAllClearNotifications;
- (void)_setUnitTestHackRunLoopMode:(id)a3;
- (void)claimedOwnershipOfDataclasses:(int64_t)a3;
- (void)dealloc;
- (void)registerPreemptiveWaiter:(id)a3 forDataclassLocks:(int64_t)a4 completionHandler:(id)a5;
- (void)registerWaiter:(id)a3 forDataclassLocks:(int64_t)a4 completionHandler:(id)a5;
- (void)relinquishLocksForWaiter:(id)a3 dataclasses:(int64_t)a4 moreComing:(BOOL)a5;
- (void)setClaimedOwnershipOfEvents:(BOOL)a3;
- (void)setEventsLockHolder:(id)a3;
- (void)setEventsWaiters:(id)a3;
- (void)setUnitTestHackRunLoopMode:(id)a3;
- (void)setWaiterIDsExpectingEventsLock:(id)a3;
- (void)unregisterWaiterForDataclassLocks:(id)a3;
@end

@implementation DALocalDBGateKeeper

+ (id)sharedGateKeeper
{
  if (sharedGateKeeper_onceToken != -1) {
    dispatch_once(&sharedGateKeeper_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedGateKeeper___sharedGateKeeper;
  return v2;
}

uint64_t __39__DALocalDBGateKeeper_sharedGateKeeper__block_invoke()
{
  sharedGateKeeper___sharedGateKeeper = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (DALocalDBGateKeeper)init
{
  v6.receiver = self;
  v6.super_class = (Class)DALocalDBGateKeeper;
  v2 = [(DALocalDBGateKeeper *)&v6 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(DALocalDBGateKeeper *)v2 setEventsWaiters:v3];

    v4 = objc_opt_new();
    [(DALocalDBGateKeeper *)v2 setWaiterIDsExpectingEventsLock:v4];
  }
  return v2;
}

- (void)dealloc
{
  if (self->_eventsLockHolder)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"DALocalDBGateKeeper.m", 95, @"DALocalDBGateKeeper is shutting down, but the following account is still holding the dataclass lock for dataclass %lx.  Account %@", 4, self->_eventsLockHolder object file lineNumber description];
  }
  if ([(NSMutableArray *)self->_eventsWaiters count])
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"DALocalDBGateKeeper.m", 96, @"DALocalDBGateKeeper is shutting down, but the following accounts are still waiting on the dataclass lock for dataclass type %lx.  Account %@", 4, self->_eventsWaiters object file lineNumber description];
  }
  v6.receiver = self;
  v6.super_class = (Class)DALocalDBGateKeeper;
  [(DALocalDBGateKeeper *)&v6 dealloc];
}

- (void)setEventsLockHolder:(id)a3
{
  v5 = (DADataclassLockWatcher *)a3;
  eventsLockHolder = self->_eventsLockHolder;
  p_eventsLockHolder = &self->_eventsLockHolder;
  if (eventsLockHolder != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_eventsLockHolder, a3);
    v5 = v8;
  }
}

- (BOOL)_canWakenWaiter:(id)a3
{
  id v4 = a3;
  char v5 = [v4 dataclasses];
  int v6 = [v4 waiterNum];
  if ((v5 & 0x14) == 0) {
    goto LABEL_6;
  }
  if (!self->_eventsLockHolder)
  {
    int v7 = v6;
    v8 = [(NSMutableArray *)self->_eventsWaiters objectAtIndexedSubscript:0];
    int v9 = [v8 waiterNum];

    if (v9 == v7)
    {
      v11 = [v4 waiter];
      [(DALocalDBGateKeeper *)self setEventsLockHolder:v11];

      [(NSMutableArray *)self->_eventsWaiters removeObjectAtIndex:0];
LABEL_6:
      BOOL v10 = 1;
      goto LABEL_7;
    }
  }
  BOOL v10 = 0;
LABEL_7:

  return v10;
}

- (void)_abortWaiterForWrappers:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "waiterNum"));
        [v5 setObject:v11 forKeyedSubscript:v12];

        v13 = [v11 waiter];
        v14 = [v13 waiterID];

        if (v14) {
          [(NSMutableSet *)self->_waiterIDsExpectingEventsLock removeObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v8);
  }
  v27 = v6;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v26 = v5;
  v15 = [v5 allValues];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    os_log_type_t v19 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        v22 = DALoggingwithCategory();
        if (os_log_type_enabled(v22, v19))
        {
          uint64_t v23 = [v21 dataclasses];
          v24 = [v21 waiter];
          *(_DWORD *)buf = 134218242;
          uint64_t v37 = v23;
          __int16 v38 = 2112;
          v39 = v24;
          _os_log_impl(&dword_1C86FF000, v22, v19, "Aborting locks for dataclasses %lx to %@", buf, 0x16u);
        }
        v25 = [v21 completionHandler];
        v25[2](v25, [v21 dataclasses], 0);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v17);
  }
}

- (void)_notifyWaitersForDataclasses:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_log_type_t v19 = _os_activity_create(&dword_1C86FF000, "DALocalDBGateKeeper notifyWaiters", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v19, &state);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:3];
  char v5 = self;
  objc_sync_enter(v5);
  int v6 = [v20 intValue];
  uint64_t v7 = DALoggingwithCategory();
  os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v27 = v6;
    _os_log_impl(&dword_1C86FF000, v7, v8, "Notifying waiters for dataclasses %ldd", buf, 0xCu);
  }

  if ((v6 & 0x14) != 0 && !v5->_eventsLockHolder && [(NSMutableArray *)v5->_eventsWaiters count])
  {
    uint64_t v9 = [(NSMutableArray *)v5->_eventsWaiters objectAtIndexedSubscript:0];
    if ([(DALocalDBGateKeeper *)v5 _canWakenWaiter:v9]) {
      [v4 addObject:v9];
    }
  }
  objc_sync_exit(v5);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v15 = DALoggingwithCategory();
        if (os_log_type_enabled(v15, v8))
        {
          uint64_t v16 = [v14 dataclasses];
          uint64_t v17 = [v14 waiter];
          *(_DWORD *)buf = 134218242;
          uint64_t v27 = v16;
          __int16 v28 = 2112;
          long long v29 = v17;
          _os_log_impl(&dword_1C86FF000, v15, v8, "Granting locks for dataclasses %lx to %@", buf, 0x16u);
        }
        uint64_t v18 = [v14 completionHandler];
        v18[2](v18, [v14 dataclasses], 1);
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v11);
  }

  os_activity_scope_leave(&state);
}

- (void)_registerWaiter:(id)a3 forDataclassLocks:(int64_t)a4 preempt:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = DALoggingwithCategory();
  uint64_t v13 = MEMORY[0x1E4F50E48];
  os_log_type_t v14 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v12, v14))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v10;
    __int16 v29 = 2048;
    int64_t v30 = a4;
    _os_log_impl(&dword_1C86FF000, v12, v14, "registerWaiter %@ forDataclassLocks %lx", buf, 0x16u);
  }

  v15 = self;
  objc_sync_enter(v15);
  uint64_t v16 = objc_opt_new();
  [v16 setCompletionHandler:v11];
  [v16 setWaiter:v10];
  [v16 setDataclasses:a4];
  int v17 = [MEMORY[0x1E4F50E38] isInHoldingPattern];
  if (v17)
  {
    uint64_t v18 = DALoggingwithCategory();
    os_log_type_t v19 = *(unsigned char *)(v13 + 3);
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v16;
      _os_log_impl(&dword_1C86FF000, v18, v19, "Not allowing waiter %@ to get the gate, as we're in a holding pattern", buf, 0xCu);
    }

    v26 = v16;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [(DALocalDBGateKeeper *)v15 _abortWaiterForWrappers:v20];

    goto LABEL_10;
  }
  if ((a4 & 0x14) == 0)
  {
LABEL_10:
    BOOL v22 = 0;
    goto LABEL_11;
  }
  eventsWaiters = v15->_eventsWaiters;
  BOOL v22 = v15->_eventsLockHolder == 0;
  if (v7) {
    [(NSMutableArray *)eventsWaiters insertObject:v16 atIndex:0];
  }
  else {
    [(NSMutableArray *)eventsWaiters addObject:v16];
  }
LABEL_11:

  objc_sync_exit(v15);
  if (((v17 | !v22) & 1) == 0)
  {
    if (v15->_unitTestHackRunLoopMode)
    {
      unitTestHackRunLoopMode = v15->_unitTestHackRunLoopMode;
      long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&unitTestHackRunLoopMode count:1];
      [(DALocalDBGateKeeper *)v15 _setUnitTestHackRunLoopMode:0];
    }
    else
    {
      long long v23 = runLoopModesToPerformDelayedSelectorsIn();
    }
    long long v24 = [NSNumber numberWithInteger:a4];
    [v15 da_addNullRunLoopSourceAndPerformSelector:sel__notifyWaitersForDataclasses_ withObject:v24 afterDelay:v23 inModes:0.0];
  }
}

- (void)registerPreemptiveWaiter:(id)a3 forDataclassLocks:(int64_t)a4 completionHandler:(id)a5
{
}

- (void)registerWaiter:(id)a3 forDataclassLocks:(int64_t)a4 completionHandler:(id)a5
{
}

- (void)_sendAllClearNotifications
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_claimedOwnershipOfEvents
    || [(NSMutableArray *)self->_eventsWaiters count]
    || self->_eventsLockHolder
    || [(NSMutableSet *)self->_waiterIDsExpectingEventsLock count])
  {
    v3 = DALoggingwithCategory();
    os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 7);
    if (os_log_type_enabled(v3, v4))
    {
      BOOL claimedOwnershipOfEvents = self->_claimedOwnershipOfEvents;
      uint64_t v6 = [(NSMutableArray *)self->_eventsWaiters count];
      eventsLockHolder = self->_eventsLockHolder;
      uint64_t v8 = [(NSMutableSet *)self->_waiterIDsExpectingEventsLock count];
      v9[0] = 67109888;
      v9[1] = claimedOwnershipOfEvents;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = eventsLockHolder;
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1C86FF000, v3, v4, "Not notifying for events.  Claimed %d waiters count %lu holder %p expectant waiters %lu", (uint8_t *)v9, 0x26u);
    }
  }
  else
  {
    self->_BOOL claimedOwnershipOfEvents = 0;
  }
}

- (void)unregisterWaiterForDataclassLocks:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v4;
    _os_log_impl(&dword_1C86FF000, v5, v6, "unregisterWaiterForDataclassLocks %@", buf, 0xCu);
  }

  BOOL v7 = objc_opt_new();
  uint64_t v8 = self;
  objc_sync_enter(v8);
  p_isa = (id *)&v8->super.isa;
  eventsWaiters = v8->_eventsWaiters;
  [MEMORY[0x1E4F1C978] arrayWithObjects:&eventsWaiters count:1];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v20 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int v12 = [v11 count];
        if (v12 >= 1)
        {
          unint64_t v13 = v12 + 1;
          do
          {
            __int16 v14 = [v11 objectAtIndexedSubscript:(v13 - 2)];
            uint64_t v15 = [v14 waiter];
            int v16 = [v15 isEqual:v4];

            if (v16)
            {
              [v7 addObject:v14];
              [v11 removeObjectAtIndex:(v13 - 2)];
            }

            --v13;
          }
          while (v13 > 1);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  int v17 = [p_isa[2] isEqual:v4];
  objc_sync_exit(p_isa);

  if (v17) {
    [p_isa relinquishLocksForWaiter:v4 dataclasses:20 moreComing:0];
  }
  [p_isa _abortWaiterForWrappers:v7];
  [p_isa _sendAllClearNotifications];
}

- (void)relinquishLocksForWaiter:(id)a3 dataclasses:(int64_t)a4 moreComing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  __int16 v10 = DALoggingwithCategory();
  os_log_type_t v11 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v10, v11))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v9;
    __int16 v21 = 2048;
    int64_t v22 = a4;
    _os_log_impl(&dword_1C86FF000, v10, v11, "relinquishing locks for waiter %@ dataclasses %lx", buf, 0x16u);
  }

  int v12 = self;
  objc_sync_enter(v12);
  if ((a4 & 0x14) != 0)
  {
    if (([(DADataclassLockWatcher *)v12->_eventsLockHolder isEqual:v9] & 1) == 0)
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v12, @"DALocalDBGateKeeper.m", 448, @"Waiter %@ tried to relinquish a lock for data class %ld, but it was held by another waiter: %@", v9, a4, v12->_eventsLockHolder object file lineNumber description];
    }
    [(DALocalDBGateKeeper *)v12 setEventsLockHolder:0];
    unint64_t v13 = [v9 waiterID];

    if (v13)
    {
      waiterIDsExpectingEventsLock = v12->_waiterIDsExpectingEventsLock;
      [v9 waiterID];
      if (v5) {
        uint64_t v15 = {;
      }
        [(NSMutableSet *)waiterIDsExpectingEventsLock addObject:v15];
      }
      else {
        uint64_t v15 = {;
      }
        [(NSMutableSet *)waiterIDsExpectingEventsLock removeObject:v15];
      }
    }
  }
  objc_sync_exit(v12);

  [(DALocalDBGateKeeper *)v12 _sendAllClearNotifications];
  int v16 = [NSNumber numberWithInteger:a4];
  int v17 = runLoopModesToPerformDelayedSelectorsIn();
  [v12 da_addNullRunLoopSourceAndPerformSelector:sel__notifyWaitersForDataclasses_ withObject:v16 afterDelay:v17 inModes:0.0];
}

- (void)claimedOwnershipOfDataclasses:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    int v7 = 134217984;
    int64_t v8 = a3;
    _os_log_impl(&dword_1C86FF000, v5, v6, "Claiming ownership of dataclasses 0x%lx", (uint8_t *)&v7, 0xCu);
  }

  if ((a3 & 4) != 0) {
    self->_BOOL claimedOwnershipOfEvents = 1;
  }
}

- (id)stateString
{
  v3 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1F231BAB0];
  id v4 = self;
  objc_sync_enter(v4);
  [v3 appendFormat:@"_eventsLockHolder %@\n", v4->_eventsLockHolder];
  [v3 appendFormat:@"_eventsWaiters %@\n", v4->_eventsWaiters];
  [v3 appendFormat:@"_waiterIDsExpectingEventsLock %@\n", v4->_waiterIDsExpectingEventsLock];
  objc_sync_exit(v4);

  return v3;
}

- (void)_setUnitTestHackRunLoopMode:(id)a3
{
  BOOL v5 = (NSString *)a3;
  unitTestHackRunLoopMode = self->_unitTestHackRunLoopMode;
  p_unitTestHackRunLoopMode = &self->_unitTestHackRunLoopMode;
  if (unitTestHackRunLoopMode != v5)
  {
    int64_t v8 = v5;
    objc_storeStrong((id *)p_unitTestHackRunLoopMode, a3);
    BOOL v5 = v8;
  }
}

- (BOOL)claimedOwnershipOfEvents
{
  return self->_claimedOwnershipOfEvents;
}

- (void)setClaimedOwnershipOfEvents:(BOOL)a3
{
  self->_BOOL claimedOwnershipOfEvents = a3;
}

- (DADataclassLockWatcher)eventsLockHolder
{
  return self->_eventsLockHolder;
}

- (NSMutableArray)eventsWaiters
{
  return self->_eventsWaiters;
}

- (void)setEventsWaiters:(id)a3
{
}

- (NSMutableSet)waiterIDsExpectingEventsLock
{
  return self->_waiterIDsExpectingEventsLock;
}

- (void)setWaiterIDsExpectingEventsLock:(id)a3
{
}

- (NSString)unitTestHackRunLoopMode
{
  return self->_unitTestHackRunLoopMode;
}

- (void)setUnitTestHackRunLoopMode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTestHackRunLoopMode, 0);
  objc_storeStrong((id *)&self->_waiterIDsExpectingEventsLock, 0);
  objc_storeStrong((id *)&self->_eventsWaiters, 0);
  objc_storeStrong((id *)&self->_eventsLockHolder, 0);
}

@end