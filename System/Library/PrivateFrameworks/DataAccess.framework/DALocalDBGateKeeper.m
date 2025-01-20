@interface DALocalDBGateKeeper
+ (id)sharedGateKeeper;
- (BOOL)_canWakenWaiter:(id)a3;
- (BOOL)claimedOwnershipOfContacts;
- (BOOL)claimedOwnershipOfEvents;
- (BOOL)claimedOwnershipOfNotes;
- (DADataclassLockWatcher)contactsLockHolder;
- (DADataclassLockWatcher)eventsLockHolder;
- (DADataclassLockWatcher)notesLockHolder;
- (DALocalDBGateKeeper)init;
- (NSMutableArray)contactsWaiters;
- (NSMutableArray)eventsWaiters;
- (NSMutableArray)notesWaiters;
- (NSMutableSet)waiterIDsExpectingContactsLock;
- (NSMutableSet)waiterIDsExpectingEventsLock;
- (NSMutableSet)waiterIDsExpectingNotesLock;
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
- (void)setClaimedOwnershipOfContacts:(BOOL)a3;
- (void)setClaimedOwnershipOfEvents:(BOOL)a3;
- (void)setClaimedOwnershipOfNotes:(BOOL)a3;
- (void)setContactsLockHolder:(id)a3;
- (void)setContactsWaiters:(id)a3;
- (void)setEventsLockHolder:(id)a3;
- (void)setEventsWaiters:(id)a3;
- (void)setNotesLockHolder:(id)a3;
- (void)setNotesWaiters:(id)a3;
- (void)setUnitTestHackRunLoopMode:(id)a3;
- (void)setWaiterIDsExpectingContactsLock:(id)a3;
- (void)setWaiterIDsExpectingEventsLock:(id)a3;
- (void)setWaiterIDsExpectingNotesLock:(id)a3;
- (void)unregisterWaiterForDataclassLocks:(id)a3;
@end

@implementation DALocalDBGateKeeper

+ (id)sharedGateKeeper
{
  if (sharedGateKeeper_onceToken != -1) {
    dispatch_once(&sharedGateKeeper_onceToken, &__block_literal_global_9);
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
  v10.receiver = self;
  v10.super_class = (Class)DALocalDBGateKeeper;
  v2 = [(DALocalDBGateKeeper *)&v10 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(DALocalDBGateKeeper *)v2 setEventsWaiters:v3];

    v4 = objc_opt_new();
    [(DALocalDBGateKeeper *)v2 setWaiterIDsExpectingEventsLock:v4];

    v5 = objc_opt_new();
    [(DALocalDBGateKeeper *)v2 setContactsWaiters:v5];

    v6 = objc_opt_new();
    [(DALocalDBGateKeeper *)v2 setNotesWaiters:v6];

    v7 = objc_opt_new();
    [(DALocalDBGateKeeper *)v2 setWaiterIDsExpectingContactsLock:v7];

    v8 = objc_opt_new();
    [(DALocalDBGateKeeper *)v2 setWaiterIDsExpectingNotesLock:v8];
  }
  return v2;
}

- (void)dealloc
{
  if (self->_contactsLockHolder)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"DALocalDBGateKeeper.m", 87, @"DALocalDBGateKeeper is shutting down, but the following account is still holding the dataclass lock for dataclass %lx.  Account %@", 2, self->_contactsLockHolder object file lineNumber description];
  }
  if ([(NSMutableArray *)self->_contactsWaiters count])
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"DALocalDBGateKeeper.m", 88, @"DALocalDBGateKeeper is shutting down, but the following accounts are still waiting on the dataclass lock for dataclass %lx.  Account %@", 2, self->_contactsWaiters object file lineNumber description];
  }
  if (self->_eventsLockHolder)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"DALocalDBGateKeeper.m", 90, @"DALocalDBGateKeeper is shutting down, but the following account is still holding the dataclass lock for dataclass %lx.  Account %@", 4, self->_eventsLockHolder object file lineNumber description];
  }
  if ([(NSMutableArray *)self->_eventsWaiters count])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"DALocalDBGateKeeper.m", 91, @"DALocalDBGateKeeper is shutting down, but the following accounts are still waiting on the dataclass lock for dataclass type %lx.  Account %@", 4, self->_eventsWaiters object file lineNumber description];
  }
  if (self->_notesLockHolder)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"DALocalDBGateKeeper.m", 93, @"DALocalDBGateKeeper is shutting down, but the following account is still holding the dataclass lock for dataclass %lx.  Account %@", 32, self->_notesLockHolder object file lineNumber description];
  }
  if ([(NSMutableArray *)self->_notesWaiters count])
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"DALocalDBGateKeeper.m", 94, @"DALocalDBGateKeeper is shutting down, but the following accounts are still waiting on the dataclass lock for dataclass type %lx.  Account %@", 32, self->_notesWaiters object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)DALocalDBGateKeeper;
  [(DALocalDBGateKeeper *)&v10 dealloc];
}

- (void)setContactsLockHolder:(id)a3
{
  v5 = (DADataclassLockWatcher *)a3;
  contactsLockHolder = self->_contactsLockHolder;
  p_contactsLockHolder = &self->_contactsLockHolder;
  v6 = contactsLockHolder;
  if (contactsLockHolder != v5)
  {
    v11 = v5;
    if (v5)
    {
      v9 = +[DAPriorityManager sharedManager];
      [v9 requestPriority:1 forClient:v11 dataclasses:2];

      v6 = *p_contactsLockHolder;
    }
    if (v6)
    {
      objc_super v10 = +[DAPriorityManager sharedManager];
      [v10 requestPriority:0 forClient:*p_contactsLockHolder dataclasses:2];
    }
    objc_storeStrong((id *)p_contactsLockHolder, a3);
    v5 = v11;
  }
}

- (void)setEventsLockHolder:(id)a3
{
  v5 = (DADataclassLockWatcher *)a3;
  eventsLockHolder = self->_eventsLockHolder;
  p_eventsLockHolder = &self->_eventsLockHolder;
  v6 = eventsLockHolder;
  if (eventsLockHolder != v5)
  {
    v11 = v5;
    if (v5)
    {
      v9 = +[DAPriorityManager sharedManager];
      [v9 requestPriority:1 forClient:v11 dataclasses:20];

      v6 = *p_eventsLockHolder;
    }
    if (v6)
    {
      objc_super v10 = +[DAPriorityManager sharedManager];
      [v10 requestPriority:0 forClient:*p_eventsLockHolder dataclasses:20];
    }
    objc_storeStrong((id *)p_eventsLockHolder, a3);
    v5 = v11;
  }
}

- (void)setNotesLockHolder:(id)a3
{
  v5 = (DADataclassLockWatcher *)a3;
  notesLockHolder = self->_notesLockHolder;
  p_notesLockHolder = &self->_notesLockHolder;
  v6 = notesLockHolder;
  if (notesLockHolder != v5)
  {
    v11 = v5;
    if (v5)
    {
      v9 = +[DAPriorityManager sharedManager];
      [v9 requestPriority:1 forClient:v11 dataclasses:32];

      v6 = *p_notesLockHolder;
    }
    if (v6)
    {
      objc_super v10 = +[DAPriorityManager sharedManager];
      [v10 requestPriority:0 forClient:*p_notesLockHolder dataclasses:32];
    }
    objc_storeStrong((id *)p_notesLockHolder, a3);
    v5 = v11;
  }
}

- (BOOL)_canWakenWaiter:(id)a3
{
  id v4 = a3;
  char v5 = [v4 dataclasses];
  int v6 = [v4 waiterNum];
  BOOL v7 = 1;
  if ((v5 & 2) != 0)
  {
    if (self->_contactsLockHolder
      || ([(NSMutableArray *)self->_contactsWaiters objectAtIndexedSubscript:0],
          v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 waiterNum],
          v8,
          v9 != v6))
    {
      BOOL v7 = 0;
    }
  }
  uint64_t v10 = v5 & 0x14;
  if ((v5 & 0x14) != 0
    && (self->_eventsLockHolder
     || ([(NSMutableArray *)self->_eventsWaiters objectAtIndexedSubscript:0],
         v11 = objc_claimAutoreleasedReturnValue(),
         int v12 = [v11 waiterNum],
         v11,
         v12 != v6)))
  {
    BOOL v7 = 0;
    BOOL v13 = 0;
    if ((v5 & 0x20) == 0) {
      goto LABEL_25;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    if (!v7)
    {
LABEL_15:
      BOOL v13 = 0;
      goto LABEL_25;
    }
    BOOL v13 = 1;
    goto LABEL_18;
  }
  if (self->_notesLockHolder) {
    goto LABEL_15;
  }
  v14 = [(NSMutableArray *)self->_notesWaiters objectAtIndexedSubscript:0];
  int v15 = [v14 waiterNum];

  BOOL v13 = 0;
  if (v15 == v6 && v7)
  {
LABEL_18:
    if ((v5 & 2) != 0)
    {
      v16 = [v4 waiter];
      [(DALocalDBGateKeeper *)self setContactsLockHolder:v16];

      [(NSMutableArray *)self->_contactsWaiters removeObjectAtIndex:0];
    }
    if (v10)
    {
      v17 = [v4 waiter];
      [(DALocalDBGateKeeper *)self setEventsLockHolder:v17];

      [(NSMutableArray *)self->_eventsWaiters removeObjectAtIndex:0];
    }
    if (!v13)
    {
      v18 = [v4 waiter];
      [(DALocalDBGateKeeper *)self setNotesLockHolder:v18];

      [(NSMutableArray *)self->_notesWaiters removeObjectAtIndex:0];
    }
    BOOL v13 = 1;
  }
LABEL_25:

  return v13;
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
        int v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "waiterNum"));
        [v5 setObject:v11 forKeyedSubscript:v12];

        BOOL v13 = [v11 waiter];
        v14 = [v13 waiterID];

        if (v14)
        {
          [(NSMutableSet *)self->_waiterIDsExpectingContactsLock removeObject:v14];
          [(NSMutableSet *)self->_waiterIDsExpectingEventsLock removeObject:v14];
          [(NSMutableSet *)self->_waiterIDsExpectingNotesLock removeObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v8);
  }
  v26 = v6;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v27 = v5;
  int v15 = [v5 allValues];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    os_log_type_t v19 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
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
          uint64_t v23 = objc_msgSend(v21, "dataclasses", v26);
          v24 = [v21 waiter];
          *(_DWORD *)buf = 134218242;
          uint64_t v37 = v23;
          __int16 v38 = 2112;
          v39 = v24;
          _os_log_impl(&dword_1BA384000, v22, v19, "Aborting locks for dataclasses %lx to %@", buf, 0x16u);
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
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:3];
  id v6 = self;
  objc_sync_enter(v6);
  v22 = v4;
  LODWORD(self) = [v4 intValue];
  uint64_t v7 = DALoggingwithCategory();
  uint64_t v8 = (int)self;
  os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v7, v9))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v28 = v8;
    _os_log_impl(&dword_1BA384000, v7, v9, "Notifying waiters for dataclasses %ldd", buf, 0xCu);
  }

  if ((v8 & 2) != 0 && !v6->_contactsLockHolder && [(NSMutableArray *)v6->_contactsWaiters count])
  {
    uint64_t v10 = [(NSMutableArray *)v6->_contactsWaiters objectAtIndexedSubscript:0];
    if ([(DALocalDBGateKeeper *)v6 _canWakenWaiter:v10]) {
      [v5 addObject:v10];
    }
  }
  if ((v8 & 0x14) != 0 && !v6->_eventsLockHolder && [(NSMutableArray *)v6->_eventsWaiters count])
  {
    v11 = [(NSMutableArray *)v6->_eventsWaiters objectAtIndexedSubscript:0];
    if ([(DALocalDBGateKeeper *)v6 _canWakenWaiter:v11]) {
      [v5 addObject:v11];
    }
  }
  if ((v8 & 0x20) != 0 && !v6->_notesLockHolder && [(NSMutableArray *)v6->_notesWaiters count])
  {
    int v12 = [(NSMutableArray *)v6->_notesWaiters objectAtIndexedSubscript:0];
    if ([(DALocalDBGateKeeper *)v6 _canWakenWaiter:v12]) {
      [v5 addObject:v12];
    }
  }
  objc_sync_exit(v6);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v18 = DALoggingwithCategory();
        if (os_log_type_enabled(v18, v9))
        {
          uint64_t v19 = [v17 dataclasses];
          v20 = [v17 waiter];
          *(_DWORD *)buf = 134218242;
          uint64_t v28 = v19;
          __int16 v29 = 2112;
          long long v30 = v20;
          _os_log_impl(&dword_1BA384000, v18, v9, "Granting locks for dataclasses %lx to %@", buf, 0x16u);
        }
        v21 = [v17 completionHandler];
        v21[2](v21, [v17 dataclasses], 1);
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v14);
  }
}

- (void)_registerWaiter:(id)a3 forDataclassLocks:(int64_t)a4 preempt:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  int v12 = DALoggingwithCategory();
  uint64_t v13 = MEMORY[0x1E4F5E9A0];
  os_log_type_t v14 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v12, v14))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v10;
    __int16 v29 = 2048;
    int64_t v30 = a4;
    _os_log_impl(&dword_1BA384000, v12, v14, "registerWaiter %@ forDataclassLocks %lx", buf, 0x16u);
  }

  uint64_t v15 = self;
  objc_sync_enter(v15);
  uint64_t v16 = objc_opt_new();
  [v16 setCompletionHandler:v11];
  [v16 setWaiter:v10];
  [v16 setDataclasses:a4];
  int v17 = [MEMORY[0x1E4F5E940] isInHoldingPattern];
  if (v17)
  {
    uint64_t v18 = DALoggingwithCategory();
    os_log_type_t v19 = *(unsigned char *)(v13 + 3);
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v16;
      _os_log_impl(&dword_1BA384000, v18, v19, "Not allowing waiter %@ to get the gate, as we're in a holding pattern", buf, 0xCu);
    }

    long long v26 = v16;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [(DALocalDBGateKeeper *)v15 _abortWaiterForWrappers:v20];

    goto LABEL_7;
  }
  if ((a4 & 2) == 0)
  {
    if ((a4 & 0x14) == 0)
    {
      if ((a4 & 0x20) == 0)
      {
LABEL_7:
        BOOL v21 = 0;
        goto LABEL_8;
      }
      BOOL v21 = v15->_notesLockHolder == 0;
      if (!v7) {
        goto LABEL_30;
      }
LABEL_21:
      [(NSMutableArray *)v15->_notesWaiters insertObject:v16 atIndex:0];
      goto LABEL_8;
    }
    BOOL v21 = v15->_eventsLockHolder == 0;
    if (!v7) {
      goto LABEL_27;
    }
    goto LABEL_18;
  }
  contactsWaiters = v15->_contactsWaiters;
  BOOL v21 = v15->_contactsLockHolder == 0;
  if (v7)
  {
    [(NSMutableArray *)contactsWaiters insertObject:v16 atIndex:0];
    if ((a4 & 0x14) == 0)
    {
LABEL_19:
      if ((a4 & 0x20) == 0) {
        goto LABEL_8;
      }
      BOOL v21 = v15->_notesLockHolder == 0;
      goto LABEL_21;
    }
    BOOL v21 = v15->_eventsLockHolder == 0;
LABEL_18:
    [(NSMutableArray *)v15->_eventsWaiters insertObject:v16 atIndex:0];
    goto LABEL_19;
  }
  [(NSMutableArray *)contactsWaiters addObject:v16];
  if ((a4 & 0x14) != 0)
  {
    BOOL v21 = v15->_eventsLockHolder == 0;
LABEL_27:
    [(NSMutableArray *)v15->_eventsWaiters addObject:v16];
  }
  if ((a4 & 0x20) == 0) {
    goto LABEL_8;
  }
  BOOL v21 = v15->_notesLockHolder == 0;
LABEL_30:
  [(NSMutableArray *)v15->_notesWaiters addObject:v16];
LABEL_8:

  objc_sync_exit(v15);
  if (((v17 | !v21) & 1) == 0)
  {
    if (v15->_unitTestHackRunLoopMode)
    {
      unitTestHackRunLoopMode = v15->_unitTestHackRunLoopMode;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&unitTestHackRunLoopMode count:1];
      [(DALocalDBGateKeeper *)v15 _setUnitTestHackRunLoopMode:0];
    }
    else
    {
      v22 = runLoopModesToPerformDelayedSelectorsIn();
    }
    long long v24 = [NSNumber numberWithInteger:a4];
    [v15 da_addNullRunLoopSourceAndPerformSelector:sel__notifyWaitersForDataclasses_ withObject:v24 afterDelay:v22 inModes:0.0];
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
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MEMORY[0x1E4F5E9A0];
  if (!self->_claimedOwnershipOfContacts
    || [(NSMutableArray *)self->_contactsWaiters count]
    || self->_contactsLockHolder
    || [(NSMutableSet *)self->_waiterIDsExpectingContactsLock count])
  {
    id v4 = DALoggingwithCategory();
    os_log_type_t v5 = *(unsigned char *)(v3 + 7);
    if (os_log_type_enabled(v4, v5))
    {
      BOOL claimedOwnershipOfContacts = self->_claimedOwnershipOfContacts;
      uint64_t v7 = [(NSMutableArray *)self->_contactsWaiters count];
      contactsLockHolder = self->_contactsLockHolder;
      uint64_t v9 = [(NSMutableSet *)self->_waiterIDsExpectingContactsLock count];
      int v30 = 67109888;
      BOOL v31 = claimedOwnershipOfContacts;
      __int16 v32 = 2048;
      uint64_t v33 = v7;
      __int16 v34 = 2048;
      long long v35 = contactsLockHolder;
      __int16 v36 = 2048;
      uint64_t v37 = v9;
      _os_log_impl(&dword_1BA384000, v4, v5, "Not notifying for contacts.  Claimed %d waiters count %lu holder %p expectant waiters %lu", (uint8_t *)&v30, 0x26u);
    }
  }
  else
  {
    v22 = DALoggingwithCategory();
    os_log_type_t v23 = *(unsigned char *)(v3 + 6);
    if (os_log_type_enabled(v22, v23))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1BA384000, v22, v23, "Letting everyone know we're done with contacts", (uint8_t *)&v30, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E4F49E70], 0, 0, 1u);
    self->_BOOL claimedOwnershipOfContacts = 0;
  }
  if (!self->_claimedOwnershipOfEvents
    || [(NSMutableArray *)self->_eventsWaiters count]
    || self->_eventsLockHolder
    || [(NSMutableSet *)self->_waiterIDsExpectingEventsLock count])
  {
    id v10 = DALoggingwithCategory();
    os_log_type_t v11 = *(unsigned char *)(v3 + 7);
    if (os_log_type_enabled(v10, v11))
    {
      BOOL claimedOwnershipOfEvents = self->_claimedOwnershipOfEvents;
      uint64_t v13 = [(NSMutableArray *)self->_eventsWaiters count];
      eventsLockHolder = self->_eventsLockHolder;
      uint64_t v15 = [(NSMutableSet *)self->_waiterIDsExpectingEventsLock count];
      int v30 = 67109888;
      BOOL v31 = claimedOwnershipOfEvents;
      __int16 v32 = 2048;
      uint64_t v33 = v13;
      __int16 v34 = 2048;
      long long v35 = eventsLockHolder;
      __int16 v36 = 2048;
      uint64_t v37 = v15;
      _os_log_impl(&dword_1BA384000, v10, v11, "Not notifying for events.  Claimed %d waiters count %lu holder %p expectant waiters %lu", (uint8_t *)&v30, 0x26u);
    }
  }
  else
  {
    long long v25 = DALoggingwithCategory();
    os_log_type_t v26 = *(unsigned char *)(v3 + 6);
    if (os_log_type_enabled(v25, v26))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1BA384000, v25, v26, "Letting everyone know we're done with events", (uint8_t *)&v30, 2u);
    }

    v27 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v27, (CFNotificationName)*MEMORY[0x1E4F57540], 0, 0, 1u);
    self->_BOOL claimedOwnershipOfEvents = 0;
  }
  if (!self->_claimedOwnershipOfNotes
    || [(NSMutableArray *)self->_notesWaiters count]
    || self->_notesLockHolder
    || [(NSMutableSet *)self->_waiterIDsExpectingNotesLock count])
  {
    uint64_t v16 = DALoggingwithCategory();
    os_log_type_t v17 = *(unsigned char *)(v3 + 7);
    if (os_log_type_enabled(v16, v17))
    {
      BOOL claimedOwnershipOfNotes = self->_claimedOwnershipOfNotes;
      uint64_t v19 = [(NSMutableArray *)self->_notesWaiters count];
      notesLockHolder = self->_notesLockHolder;
      uint64_t v21 = [(NSMutableSet *)self->_waiterIDsExpectingNotesLock count];
      int v30 = 67109888;
      BOOL v31 = claimedOwnershipOfNotes;
      __int16 v32 = 2048;
      uint64_t v33 = v19;
      __int16 v34 = 2048;
      long long v35 = notesLockHolder;
      __int16 v36 = 2048;
      uint64_t v37 = v21;
      _os_log_impl(&dword_1BA384000, v16, v17, "Not notifying for notes.  Claimed %d waiters count %lu holder %p expectant waiters %lu", (uint8_t *)&v30, 0x26u);
    }
  }
  else
  {
    id v28 = DALoggingwithCategory();
    os_log_type_t v29 = *(unsigned char *)(v3 + 6);
    if (os_log_type_enabled(v28, v29))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1BA384000, v28, v29, "Letting everyone know we're done with notes", (uint8_t *)&v30, 2u);
    }

    self->_BOOL claimedOwnershipOfNotes = 0;
  }
}

- (void)unregisterWaiterForDataclassLocks:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_log_type_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v4;
    _os_log_impl(&dword_1BA384000, v5, v6, "unregisterWaiterForDataclassLocks %@", buf, 0xCu);
  }

  uint64_t v7 = objc_opt_new();
  v22 = self;
  objc_sync_enter(v22);
  eventsWaiters = v22->_eventsWaiters;
  v30[0] = v22->_contactsWaiters;
  v30[1] = eventsWaiters;
  v30[2] = v22->_notesWaiters;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v24 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v24) {
          objc_enumerationMutation(obj);
        }
        os_log_type_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int v12 = [v11 count];
        if (v12 >= 1)
        {
          unint64_t v13 = v12 + 1;
          do
          {
            os_log_type_t v14 = [v11 objectAtIndexedSubscript:(v13 - 2)];
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
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  int v17 = [(DADataclassLockWatcher *)v22->_contactsLockHolder isEqual:v4];
  int v18 = [(DADataclassLockWatcher *)v22->_eventsLockHolder isEqual:v4];
  int v19 = [(DADataclassLockWatcher *)v22->_notesLockHolder isEqual:v4];
  uint64_t v20 = 2;
  if (!v17) {
    uint64_t v20 = 0;
  }
  if (v18) {
    v20 |= 0x14uLL;
  }
  if (v19) {
    uint64_t v21 = v20 | 0x20;
  }
  else {
    uint64_t v21 = v20;
  }

  objc_sync_exit(v22);
  if (v21) {
    [(DALocalDBGateKeeper *)v22 relinquishLocksForWaiter:v4 dataclasses:v21 moreComing:0];
  }
  [(DALocalDBGateKeeper *)v22 _abortWaiterForWrappers:v7];
  [(DALocalDBGateKeeper *)v22 _sendAllClearNotifications];
}

- (void)relinquishLocksForWaiter:(id)a3 dataclasses:(int64_t)a4 moreComing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = DALoggingwithCategory();
  os_log_type_t v11 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v10, v11))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v9;
    __int16 v29 = 2048;
    int64_t v30 = a4;
    _os_log_impl(&dword_1BA384000, v10, v11, "relinquishing locks for waiter %@ dataclasses %lx", buf, 0x16u);
  }

  int v12 = self;
  objc_sync_enter(v12);
  if ((a4 & 2) != 0)
  {
    if (([(DADataclassLockWatcher *)v12->_contactsLockHolder isEqual:v9] & 1) == 0)
    {
      long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, v12, @"DALocalDBGateKeeper.m", 421, @"Waiter %@ tried to relinquish a lock for data class %ld, but it was held by another waiter: %@", v9, a4, v12->_contactsLockHolder object file lineNumber description];
    }
    [(DALocalDBGateKeeper *)v12 setContactsLockHolder:0];
    unint64_t v13 = [v9 waiterID];

    if (v13)
    {
      waiterIDsExpectingContactsLock = v12->_waiterIDsExpectingContactsLock;
      uint64_t v15 = [v9 waiterID];
      if (v5) {
        [(NSMutableSet *)waiterIDsExpectingContactsLock addObject:v15];
      }
      else {
        [(NSMutableSet *)waiterIDsExpectingContactsLock removeObject:v15];
      }
    }
  }
  if ((a4 & 0x14) != 0)
  {
    if (([(DADataclassLockWatcher *)v12->_eventsLockHolder isEqual:v9] & 1) == 0)
    {
      uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v12, @"DALocalDBGateKeeper.m", 434, @"Waiter %@ tried to relinquish a lock for data class %ld, but it was held by another waiter: %@", v9, a4, v12->_eventsLockHolder object file lineNumber description];
    }
    [(DALocalDBGateKeeper *)v12 setEventsLockHolder:0];
    int v16 = [v9 waiterID];

    if (v16)
    {
      waiterIDsExpectingEventsLock = v12->_waiterIDsExpectingEventsLock;
      int v18 = [v9 waiterID];
      if (v5) {
        [(NSMutableSet *)waiterIDsExpectingEventsLock addObject:v18];
      }
      else {
        [(NSMutableSet *)waiterIDsExpectingEventsLock removeObject:v18];
      }
    }
  }
  if ((a4 & 0x20) != 0)
  {
    if (([(DADataclassLockWatcher *)v12->_notesLockHolder isEqual:v9] & 1) == 0)
    {
      long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, v12, @"DALocalDBGateKeeper.m", 447, @"Waiter %@ tried to relinquish a lock for data class %ld, but it was held by another waiter: %@", v9, a4, v12->_notesLockHolder object file lineNumber description];
    }
    [(DALocalDBGateKeeper *)v12 setNotesLockHolder:0];
    int v19 = [v9 waiterID];

    if (v19)
    {
      waiterIDsExpectingNotesLock = v12->_waiterIDsExpectingNotesLock;
      [v9 waiterID];
      if (v5) {
        uint64_t v21 = {;
      }
        [(NSMutableSet *)waiterIDsExpectingNotesLock addObject:v21];
      }
      else {
        uint64_t v21 = {;
      }
        [(NSMutableSet *)waiterIDsExpectingNotesLock removeObject:v21];
      }
    }
  }
  objc_sync_exit(v12);

  [(DALocalDBGateKeeper *)v12 _sendAllClearNotifications];
  v22 = [NSNumber numberWithInteger:a4];
  os_log_type_t v23 = runLoopModesToPerformDelayedSelectorsIn();
  [v12 da_addNullRunLoopSourceAndPerformSelector:sel__notifyWaitersForDataclasses_ withObject:v22 afterDelay:v23 inModes:0.0];
}

- (void)claimedOwnershipOfDataclasses:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    int v7 = 134217984;
    int64_t v8 = a3;
    _os_log_impl(&dword_1BA384000, v5, v6, "Claiming ownership of dataclasses 0x%lx", (uint8_t *)&v7, 0xCu);
  }

  if ((a3 & 2) != 0)
  {
    self->_BOOL claimedOwnershipOfContacts = 1;
    if ((a3 & 4) == 0)
    {
LABEL_5:
      if ((a3 & 0x20) == 0) {
        return;
      }
      goto LABEL_6;
    }
  }
  else if ((a3 & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_BOOL claimedOwnershipOfEvents = 1;
  if ((a3 & 0x20) == 0) {
    return;
  }
LABEL_6:
  self->_BOOL claimedOwnershipOfNotes = 1;
}

- (id)stateString
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1F13DB4B0];
  id v4 = self;
  objc_sync_enter(v4);
  [v3 appendFormat:@"_contactsLockHolder %@\n", v4->_contactsLockHolder];
  [v3 appendFormat:@"_contactsWaiters %@\n", v4->_contactsWaiters];
  [v3 appendFormat:@"_waiterIDsExpectingContactsLock %@\n", v4->_waiterIDsExpectingContactsLock];
  [v3 appendFormat:@"_eventsLockHolder %@\n", v4->_eventsLockHolder];
  [v3 appendFormat:@"_eventsWaiters %@\n", v4->_eventsWaiters];
  [v3 appendFormat:@"_waiterIDsExpectingEventsLock %@\n", v4->_waiterIDsExpectingEventsLock];
  [v3 appendFormat:@"_notesLockHolder %@\n", v4->_notesLockHolder];
  [v3 appendFormat:@"_notesWaiters %@\n", v4->_notesWaiters];
  [v3 appendFormat:@"_waiterIDsExpectingNotesLock %@\n", v4->_waiterIDsExpectingNotesLock];
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

- (BOOL)claimedOwnershipOfContacts
{
  return self->_claimedOwnershipOfContacts;
}

- (void)setClaimedOwnershipOfContacts:(BOOL)a3
{
  self->_BOOL claimedOwnershipOfContacts = a3;
}

- (DADataclassLockWatcher)contactsLockHolder
{
  return self->_contactsLockHolder;
}

- (NSMutableArray)contactsWaiters
{
  return self->_contactsWaiters;
}

- (void)setContactsWaiters:(id)a3
{
}

- (NSMutableSet)waiterIDsExpectingContactsLock
{
  return self->_waiterIDsExpectingContactsLock;
}

- (void)setWaiterIDsExpectingContactsLock:(id)a3
{
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

- (BOOL)claimedOwnershipOfNotes
{
  return self->_claimedOwnershipOfNotes;
}

- (void)setClaimedOwnershipOfNotes:(BOOL)a3
{
  self->_BOOL claimedOwnershipOfNotes = a3;
}

- (DADataclassLockWatcher)notesLockHolder
{
  return self->_notesLockHolder;
}

- (NSMutableArray)notesWaiters
{
  return self->_notesWaiters;
}

- (void)setNotesWaiters:(id)a3
{
}

- (NSMutableSet)waiterIDsExpectingNotesLock
{
  return self->_waiterIDsExpectingNotesLock;
}

- (void)setWaiterIDsExpectingNotesLock:(id)a3
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
  objc_storeStrong((id *)&self->_waiterIDsExpectingNotesLock, 0);
  objc_storeStrong((id *)&self->_notesWaiters, 0);
  objc_storeStrong((id *)&self->_notesLockHolder, 0);
  objc_storeStrong((id *)&self->_waiterIDsExpectingEventsLock, 0);
  objc_storeStrong((id *)&self->_eventsWaiters, 0);
  objc_storeStrong((id *)&self->_eventsLockHolder, 0);
  objc_storeStrong((id *)&self->_waiterIDsExpectingContactsLock, 0);
  objc_storeStrong((id *)&self->_contactsWaiters, 0);
  objc_storeStrong((id *)&self->_contactsLockHolder, 0);
}

@end