@interface DATaskManager
- (BOOL)_allowsMoreConcurrentIndependentTasks;
- (BOOL)_hasTasksForcingNetworkConnection;
- (BOOL)_hasTasksIndicatingARunningSync;
- (BOOL)_taskForcesNetworking:(id)a3;
- (BOOL)_taskInQueueForcesNetworkConnection:(id)a3;
- (BOOL)_useFakeDescriptions;
- (BOOL)didLogSyncStart;
- (BOOL)isShutdown;
- (BOOL)shouldCancelTaskDueToOnPowerFetchMode;
- (BOOL)taskIsModal:(id)a3;
- (BOOL)useSSL;
- (DAAccount)account;
- (DATask)activeExclusiveTask;
- (DATask)activeModalTask;
- (DATask)activeQueuedTask;
- (DATask)modalHeldActiveQueuedTask;
- (DATaskManager)init;
- (DATaskManager)initWithAccount:(id)a3;
- (NSArray)allTasks;
- (NSMutableArray)mQueuedTasks;
- (NSMutableArray)queuedExclusiveTasks;
- (NSMutableArray)queuedIndependentTasks;
- (NSMutableArray)queuedModalTasks;
- (NSMutableSet)heldIndependentTasks;
- (NSMutableSet)independentTasks;
- (NSMutableSet)modalHeldIndependentTasks;
- (NSString)powerAssertionGroupID;
- (NSTimer)managerIdleTimer;
- (NSTimer)powerLogIdleTimer;
- (NSTimer)userInitiatedSyncTimer;
- (NSTimer)xpcTransactionTimer;
- (id)OAuth2Token;
- (id)_powerLogInfoDictionary;
- (id)_version;
- (id)accountID;
- (id)accountPersistentUUID;
- (id)identityPersist;
- (id)password;
- (id)server;
- (id)stateString;
- (id)user;
- (id)userAgent;
- (int)state;
- (int64_t)port;
- (unint64_t)maxConcurrentIndependentTasks;
- (void)_cancelTasksWithReason:(int)a3;
- (void)_clearUserInitiatedSyncTimer;
- (void)_endXpcTransaction;
- (void)_logSyncEnd;
- (void)_makeStateTransition;
- (void)_performTask:(id)a3;
- (void)_populateVersionDescriptions;
- (void)_reactivateHeldTasks;
- (void)_releasePowerAssertionForTask:(id)a3;
- (void)_requestCancelTasksWithReason:(int)a3;
- (void)_retainPowerAssertionForTask:(id)a3;
- (void)_schedulePerformTask:(id)a3;
- (void)_scheduleSelector:(SEL)a3 withArgument:(id)a4;
- (void)_scheduleStartModal:(id)a3;
- (void)_startModal:(id)a3;
- (void)_useOpportunisticSocketsAgain;
- (void)cancelAllTasks;
- (void)cancelTask:(id)a3;
- (void)cancelTask:(id)a3 withUnderlyingError:(id)a4;
- (void)cancelTasksDueToOnPowerMode;
- (void)dealloc;
- (void)setAccount:(id)a3;
- (void)setActiveExclusiveTask:(id)a3;
- (void)setActiveModalTask:(id)a3;
- (void)setActiveQueuedTask:(id)a3;
- (void)setDidLogSyncStart:(BOOL)a3;
- (void)setHeldIndependentTasks:(id)a3;
- (void)setIndependentTasks:(id)a3;
- (void)setMQueuedTasks:(id)a3;
- (void)setManagerIdleTimer:(id)a3;
- (void)setMaxConcurrentIndependentTasks:(unint64_t)a3;
- (void)setModalHeldActiveQueuedTask:(id)a3;
- (void)setModalHeldIndependentTasks:(id)a3;
- (void)setPowerAssertionGroupID:(id)a3;
- (void)setPowerLogIdleTimer:(id)a3;
- (void)setQueuedExclusiveTasks:(id)a3;
- (void)setQueuedIndependentTasks:(id)a3;
- (void)setQueuedModalTasks:(id)a3;
- (void)setState:(int)a3;
- (void)setUserInitiatedSyncTimer:(id)a3;
- (void)setXpcTransactionTimer:(id)a3;
- (void)shutdown;
- (void)submitExclusiveTask:(id)a3;
- (void)submitExclusiveTask:(id)a3 toFrontOfQueue:(BOOL)a4;
- (void)submitIndependentTask:(id)a3;
- (void)submitQueuedTask:(id)a3;
- (void)taskDidFinish:(id)a3;
- (void)taskEndModal:(id)a3;
- (void)taskRequestModal:(id)a3;
@end

@implementation DATaskManager

- (DATaskManager)init
{
  return [(DATaskManager *)self initWithAccount:0];
}

- (NSArray)allTasks
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  v5 = [(DATaskManager *)v4 queuedExclusiveTasks];

  if (v5)
  {
    v6 = [(DATaskManager *)v4 queuedExclusiveTasks];
    [v3 addObjectsFromArray:v6];
  }
  v7 = [(DATaskManager *)v4 activeExclusiveTask];

  if (v7)
  {
    v8 = [(DATaskManager *)v4 activeExclusiveTask];
    [v3 addObject:v8];
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v9 = [(DATaskManager *)v4 independentTasks];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v9);
        }
        [v3 addObject:*(void *)(*((void *)&v36 + 1) + 8 * i)];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v10);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v13 = v4->_heldIndependentTasks;
  uint64_t v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v13);
        }
        [v3 addObject:*(void *)(*((void *)&v32 + 1) + 8 * j)];
      }
      uint64_t v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v14);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v17 = v4->_modalHeldIndependentTasks;
  uint64_t v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(v3, "addObject:", *(void *)(*((void *)&v28 + 1) + 8 * k), (void)v28);
      }
      uint64_t v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v18);
  }

  if (v4->_queuedIndependentTasks) {
    objc_msgSend(v3, "addObjectsFromArray:");
  }
  v21 = [(DATaskManager *)v4 mQueuedTasks];

  if (v21)
  {
    v22 = [(DATaskManager *)v4 mQueuedTasks];
    [v3 addObjectsFromArray:v22];
  }
  v23 = [(DATaskManager *)v4 activeQueuedTask];

  if (v23)
  {
    v24 = [(DATaskManager *)v4 activeQueuedTask];
    [v3 addObject:v24];
  }
  v25 = [(DATaskManager *)v4 modalHeldActiveQueuedTask];

  if (v25)
  {
    v26 = [(DATaskManager *)v4 modalHeldActiveQueuedTask];
    [v3 addObject:v26];
  }
  objc_sync_exit(v4);

  return (NSArray *)v3;
}

- (DATaskManager)initWithAccount:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DATaskManager;
  v5 = [(DATaskManager *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    objc_sync_enter(v7);
    [(DATaskManager *)v7 setAccount:v4];
    [(DATaskManager *)v7 setState:0];
    v7->_maxConcurrentIndependentTasks = 20;
    objc_sync_exit(v7);
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = self;
  objc_sync_enter(v3);
  if ([(NSMutableArray *)v3->_queuedExclusiveTasks count])
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:v3 file:@"DATaskManager.m" lineNumber:121 description:@"There are queued exclusive tasks remaining during dealloc"];
  }
  if (v3->_activeExclusiveTask)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:v3 file:@"DATaskManager.m" lineNumber:122 description:@"There is an active exclusive task remaining during dealloc"];
  }
  if ([(NSMutableSet *)v3->_independentTasks count])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:v3 file:@"DATaskManager.m" lineNumber:123 description:@"There are independent tasks remaining during dealloc"];
  }
  if ([(NSMutableSet *)v3->_heldIndependentTasks count])
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:v3 file:@"DATaskManager.m" lineNumber:124 description:@"There are held independent tasks remaining during dealloc"];
  }
  if ([(NSMutableSet *)v3->_modalHeldIndependentTasks count])
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:v3 file:@"DATaskManager.m" lineNumber:125 description:@"There are modal-held independent tasks remaining during dealloc"];
  }
  if ([(NSMutableArray *)v3->_queuedIndependentTasks count])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:v3 file:@"DATaskManager.m" lineNumber:126 description:@"There are queued independent tasks remaining during dealloc"];
  }
  if ([(NSMutableArray *)v3->_mQueuedTasks count])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:v3 file:@"DATaskManager.m" lineNumber:127 description:@"There are queued tasks remaining during dealloc"];
  }
  if (v3->_activeQueuedTask)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:v3 file:@"DATaskManager.m" lineNumber:128 description:@"There is an active queued task remaining during dealloc"];
  }
  if (v3->_modalHeldActiveQueuedTask)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:v3 file:@"DATaskManager.m" lineNumber:129 description:@"There is a modal-held active queued task remaining during dealloc"];
  }
  [(NSTimer *)v3->_powerLogIdleTimer invalidate];
  if (v3->_didLogSyncStart) {
    [(DATaskManager *)v3 _logSyncEnd];
  }
  [(NSTimer *)v3->_managerIdleTimer invalidate];
  [(NSTimer *)v3->_userInitiatedSyncTimer invalidate];
  [(NSTimer *)v3->_xpcTransactionTimer invalidate];
  uint64_t v4 = MEMORY[0x1E4F5E9A0];
  if (v3->_transaction)
  {
    v5 = DALoggingwithCategory();
    os_log_type_t v6 = *(unsigned char *)(v4 + 6);
    if (os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v3;
      _os_log_impl(&dword_1BA384000, v5, v6, "Task manager %@ is being deallocated. Ending XPC transaction", buf, 0xCu);
    }

    transaction = v3->_transaction;
    v3->_transaction = 0;
  }
  if (v3->_daActivity)
  {
    v8 = DALoggingwithCategory();
    os_log_type_t v9 = *(unsigned char *)(v4 + 6);
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v3;
      _os_log_impl(&dword_1BA384000, v8, v9, "Task manager %@ is being deallocated. Ending XPC activity", buf, 0xCu);
    }

    daActivity = v3->_daActivity;
    v3->_daActivity = 0;
  }
  objc_sync_exit(v3);

  v20.receiver = v3;
  v20.super_class = (Class)DATaskManager;
  [(DATaskManager *)&v20 dealloc];
}

- (void)_populateVersionDescriptions
{
  v2 = (void *)_CFCopyServerVersionDictionary();
  if (!v2) {
    v2 = (void *)_CFCopySystemVersionDictionary();
  }
  id v6 = v2;
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
  uint64_t v4 = [v3 copy];
  v5 = (void *)sVersion;
  sVersion = v4;
}

- (id)_version
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__DATaskManager__version__block_invoke;
  block[3] = &unk_1E6211630;
  block[4] = self;
  if (_version_onceToken != -1) {
    dispatch_once(&_version_onceToken, block);
  }
  return (id)sVersion;
}

uint64_t __25__DATaskManager__version__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _populateVersionDescriptions];
}

- (BOOL)_useFakeDescriptions
{
  return 0;
}

- (id)userAgent
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__DATaskManager_userAgent__block_invoke;
  block[3] = &unk_1E6211630;
  block[4] = self;
  if (userAgent_onceToken != -1) {
    dispatch_once(&userAgent_onceToken, block);
  }
  return (id)userAgent_sUserAgentString;
}

void __26__DATaskManager_userAgent__block_invoke(uint64_t a1)
{
  v2 = NSString;
  DAModelString();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [*(id *)(a1 + 32) _version];
  uint64_t v4 = [v2 stringWithFormat:@"Apple-%@/%@", v6, v3];
  v5 = (void *)userAgent_sUserAgentString;
  userAgent_sUserAgentString = v4;
}

- (id)user
{
  v2 = [(DATaskManager *)self account];
  v3 = [v2 username];

  return v3;
}

- (int64_t)port
{
  v2 = [(DATaskManager *)self account];
  int64_t v3 = [v2 port];

  return v3;
}

- (id)server
{
  v2 = [(DATaskManager *)self account];
  int64_t v3 = [v2 host];

  return v3;
}

- (id)password
{
  v2 = [(DATaskManager *)self account];
  int64_t v3 = [v2 password];

  return v3;
}

- (id)OAuth2Token
{
  v2 = [(DATaskManager *)self account];
  int64_t v3 = [v2 backingAccountInfo];
  uint64_t v4 = [v3 credential];

  if (v4)
  {
    v5 = [v4 credentialType];
    if ([v5 isEqualToString:*MEMORY[0x1E4F178B8]])
    {

LABEL_5:
      v8 = [v4 oauthToken];
      goto LABEL_7;
    }
    id v6 = [v4 credentialType];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F178C0]];

    if (v7) {
      goto LABEL_5;
    }
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (BOOL)useSSL
{
  v2 = [(DATaskManager *)self account];
  char v3 = [v2 useSSL];

  return v3;
}

- (id)identityPersist
{
  v2 = [(DATaskManager *)self account];
  char v3 = [v2 identityPersist];

  return v3;
}

- (id)accountID
{
  v2 = [(DATaskManager *)self account];
  char v3 = [v2 accountID];

  return v3;
}

- (id)accountPersistentUUID
{
  v2 = [(DATaskManager *)self account];
  char v3 = [v2 persistentUUID];

  return v3;
}

- (BOOL)isShutdown
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_state == 5;
  objc_sync_exit(v2);

  return v3;
}

- (void)submitExclusiveTask:(id)a3
{
}

- (void)submitExclusiveTask:(id)a3 toFrontOfQueue:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = DALoggingwithCategory();
  uint64_t v9 = MEMORY[0x1E4F5E9A0];
  os_log_type_t v10 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v8, v10))
  {
    int v36 = 138412546;
    id v37 = v7;
    __int16 v38 = 1024;
    BOOL v39 = v4;
    _os_log_impl(&dword_1BA384000, v8, v10, "Exclusive task %@ submitted, to front: %d", (uint8_t *)&v36, 0x12u);
  }

  uint64_t v11 = self;
  objc_sync_enter(v11);
  if (objc_opt_respondsToSelector()) {
    [v7 setTaskManager:v11];
  }
  if ([(DATaskManager *)v11 state] == 5)
  {
    [v7 cancelTaskWithReason:1 underlyingError:0];
    objc_sync_exit(v11);

    goto LABEL_35;
  }
  v12 = [(DATaskManager *)v11 xpcTransactionTimer];

  if (v12)
  {
    v13 = [(DATaskManager *)v11 xpcTransactionTimer];
    [v13 invalidate];

    [(DATaskManager *)v11 setXpcTransactionTimer:0];
  }
  if (!v11->_transaction)
  {
    uint64_t v14 = DALoggingwithCategory();
    if (os_log_type_enabled(v14, v10))
    {
      LOWORD(v36) = 0;
      _os_log_impl(&dword_1BA384000, v14, v10, "Begin an xpc transaction due to exclusive task", (uint8_t *)&v36, 2u);
    }

    uint64_t v15 = objc_opt_new();
    transaction = v11->_transaction;
    v11->_transaction = (DATransaction *)v15;

    v17 = DALoggingwithCategory();
    os_log_type_t v18 = *(unsigned char *)(v9 + 6);
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = [(DATransaction *)v11->_transaction transactionId];
      int v36 = 138543362;
      id v37 = v19;
      _os_log_impl(&dword_1BA384000, v17, v18, "DATransaction starting, ID: %{public}@", (uint8_t *)&v36, 0xCu);
    }
  }
  if (!v11->_daActivity)
  {
    objc_super v20 = [(DATaskManager *)v11 account];
    int v21 = [v20 hasXpcActivity];

    if (v21)
    {
      v22 = DALoggingwithCategory();
      if (os_log_type_enabled(v22, v10))
      {
        uint64_t v23 = [(DATaskManager *)v11 account];
        v24 = [v23 accountID];
        int v36 = 138543362;
        id v37 = v24;
        _os_log_impl(&dword_1BA384000, v22, v10, "Retain an xpc activity due to exclusive task for account %{public}@", (uint8_t *)&v36, 0xCu);
      }
      v25 = [DAActivity alloc];
      v26 = [(DATaskManager *)v11 account];
      uint64_t v27 = [(DAActivity *)v25 initWithAccount:v26];
      daActivity = v11->_daActivity;
      v11->_daActivity = (DAActivity *)v27;
    }
  }
  int v29 = [(DATaskManager *)v11 state];
  if ((v29 - 1) < 4)
  {
    int v30 = 0;
    if (v4)
    {
LABEL_22:
      long long v31 = [(DATaskManager *)v11 queuedExclusiveTasks];
      [v31 insertObject:v7 atIndex:0];
LABEL_31:

      goto LABEL_32;
    }
LABEL_30:
    long long v31 = [(DATaskManager *)v11 queuedExclusiveTasks];
    [v31 addObject:v7];
    goto LABEL_31;
  }
  if (v29)
  {
    long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:v11 file:@"DATaskManager.m" lineNumber:322 description:@"Out of bounds state"];
  }
  else
  {
    long long v32 = [(DATaskManager *)v11 activeQueuedTask];
    if (v32)
    {

      goto LABEL_29;
    }
    long long v34 = [(DATaskManager *)v11 independentTasks];
    BOOL v35 = [v34 count] == 0;

    if (!v35)
    {
LABEL_29:
      int v30 = 1;
      if (v4) {
        goto LABEL_22;
      }
      goto LABEL_30;
    }
    [(DATaskManager *)v11 setActiveExclusiveTask:v7];
  }
  [(DATaskManager *)v11 _schedulePerformTask:v7];
  int v30 = 0;
LABEL_32:
  [(DATaskManager *)v11 _makeStateTransition];
  if (v30) {
    [(DATaskManager *)v11 _requestCancelTasksWithReason:0];
  }
  objc_sync_exit(v11);

  [(DATaskManager *)v11 taskManagerDidAddTask:v7];
LABEL_35:
}

- (void)submitIndependentTask:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = DALoggingwithCategory();
  uint64_t v7 = MEMORY[0x1E4F5E9A0];
  os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v6, v8))
  {
    int v31 = 138412290;
    id v32 = v5;
    _os_log_impl(&dword_1BA384000, v6, v8, "Independent task %@ submitted", (uint8_t *)&v31, 0xCu);
  }

  uint64_t v9 = self;
  objc_sync_enter(v9);
  if (objc_opt_respondsToSelector()) {
    [v5 setTaskManager:v9];
  }
  if ([(DATaskManager *)v9 state] != 5)
  {
    os_log_type_t v10 = [(DATaskManager *)v9 xpcTransactionTimer];

    if (v10)
    {
      uint64_t v11 = [(DATaskManager *)v9 xpcTransactionTimer];
      [v11 invalidate];

      [(DATaskManager *)v9 setXpcTransactionTimer:0];
    }
    if (!v9->_transaction)
    {
      v12 = DALoggingwithCategory();
      if (os_log_type_enabled(v12, v8))
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_1BA384000, v12, v8, "Begin an xpc transaction due to independent task", (uint8_t *)&v31, 2u);
      }

      uint64_t v13 = objc_opt_new();
      transaction = v9->_transaction;
      v9->_transaction = (DATransaction *)v13;

      uint64_t v15 = DALoggingwithCategory();
      os_log_type_t v16 = *(unsigned char *)(v7 + 6);
      if (os_log_type_enabled(v15, v16))
      {
        v17 = [(DATransaction *)v9->_transaction transactionId];
        int v31 = 138543362;
        id v32 = v17;
        _os_log_impl(&dword_1BA384000, v15, v16, "DATransaction starting, ID: %{public}@", (uint8_t *)&v31, 0xCu);
      }
    }
    if (!v9->_daActivity)
    {
      os_log_type_t v18 = [(DATaskManager *)v9 account];
      int v19 = [v18 hasXpcActivity];

      if (v19)
      {
        objc_super v20 = DALoggingwithCategory();
        if (os_log_type_enabled(v20, v8))
        {
          int v21 = [(DATaskManager *)v9 account];
          v22 = [v21 accountID];
          int v31 = 138543362;
          id v32 = v22;
          _os_log_impl(&dword_1BA384000, v20, v8, "Retain an xpc activity due to independent task for account %{public}@", (uint8_t *)&v31, 0xCu);
        }
        uint64_t v23 = [DAActivity alloc];
        v24 = [(DATaskManager *)v9 account];
        uint64_t v25 = [(DAActivity *)v23 initWithAccount:v24];
        daActivity = v9->_daActivity;
        v9->_daActivity = (DAActivity *)v25;
      }
    }
    int v27 = [(DATaskManager *)v9 state];
    if ((v27 - 1) >= 4)
    {
      if (v27)
      {
        long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
        [v28 handleFailureInMethod:a2 object:v9 file:@"DATaskManager.m" lineNumber:394 description:@"Out of bounds state"];
      }
      else
      {
        if ([(DATaskManager *)v9 _allowsMoreConcurrentIndependentTasks])
        {
          int v29 = [(DATaskManager *)v9 independentTasks];
          [v29 addObject:v5];

          [(DATaskManager *)v9 _schedulePerformTask:v5];
LABEL_30:
          objc_sync_exit(v9);

          [(DATaskManager *)v9 taskManagerDidAddTask:v5];
          goto LABEL_31;
        }
        int v30 = DALoggingwithCategory();
        if (os_log_type_enabled(v30, v8))
        {
          int v31 = 138412290;
          id v32 = v5;
          _os_log_impl(&dword_1BA384000, v30, v8, "Too many independent tasks running concurrently; adding %@ to the queue for later",
            (uint8_t *)&v31,
            0xCu);
        }

        long long v28 = [(DATaskManager *)v9 queuedIndependentTasks];
        [v28 addObject:v5];
      }
    }
    else
    {
      long long v28 = [(DATaskManager *)v9 heldIndependentTasks];
      [v28 addObject:v5];
    }

    goto LABEL_30;
  }
  [v5 cancelTaskWithReason:1 underlyingError:0];
  objc_sync_exit(v9);

LABEL_31:
}

- (void)submitQueuedTask:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = DALoggingwithCategory();
  uint64_t v7 = MEMORY[0x1E4F5E9A0];
  os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v6, v8))
  {
    int v31 = 138412290;
    id v32 = v5;
    _os_log_impl(&dword_1BA384000, v6, v8, "Queued task %@ submitted", (uint8_t *)&v31, 0xCu);
  }

  uint64_t v9 = self;
  objc_sync_enter(v9);
  if (objc_opt_respondsToSelector()) {
    [v5 setTaskManager:v9];
  }
  if ([(DATaskManager *)v9 state] != 5)
  {
    os_log_type_t v10 = [(DATaskManager *)v9 xpcTransactionTimer];

    if (v10)
    {
      uint64_t v11 = [(DATaskManager *)v9 xpcTransactionTimer];
      [v11 invalidate];

      [(DATaskManager *)v9 setXpcTransactionTimer:0];
    }
    if (!v9->_transaction)
    {
      v12 = DALoggingwithCategory();
      if (os_log_type_enabled(v12, v8))
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_1BA384000, v12, v8, "Begin an xpc transaction due to queued task", (uint8_t *)&v31, 2u);
      }

      uint64_t v13 = objc_opt_new();
      transaction = v9->_transaction;
      v9->_transaction = (DATransaction *)v13;

      uint64_t v15 = DALoggingwithCategory();
      os_log_type_t v16 = *(unsigned char *)(v7 + 6);
      if (os_log_type_enabled(v15, v16))
      {
        v17 = [(DATransaction *)v9->_transaction transactionId];
        int v31 = 138543362;
        id v32 = v17;
        _os_log_impl(&dword_1BA384000, v15, v16, "DATransaction starting, ID: %{public}@", (uint8_t *)&v31, 0xCu);
      }
    }
    if (!v9->_daActivity)
    {
      os_log_type_t v18 = [(DATaskManager *)v9 account];
      int v19 = [v18 hasXpcActivity];

      if (v19)
      {
        objc_super v20 = DALoggingwithCategory();
        if (os_log_type_enabled(v20, v8))
        {
          int v21 = [(DATaskManager *)v9 account];
          v22 = [v21 accountID];
          int v31 = 138543362;
          id v32 = v22;
          _os_log_impl(&dword_1BA384000, v20, v8, "Retain an xpc activity due to queued task for account %{public}@", (uint8_t *)&v31, 0xCu);
        }
        uint64_t v23 = [DAActivity alloc];
        v24 = [(DATaskManager *)v9 account];
        uint64_t v25 = [(DAActivity *)v23 initWithAccount:v24];
        daActivity = v9->_daActivity;
        v9->_daActivity = (DAActivity *)v25;
      }
    }
    int v27 = [(DATaskManager *)v9 state];
    if ((v27 - 1) >= 4)
    {
      if (v27)
      {
        long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
        [v28 handleFailureInMethod:a2 object:v9 file:@"DATaskManager.m" lineNumber:450 description:@"Out of bounds state"];
        goto LABEL_22;
      }
      int v29 = [(DATaskManager *)v9 activeQueuedTask];
      BOOL v30 = v29 == 0;

      if (v30)
      {
        [(DATaskManager *)v9 setActiveQueuedTask:v5];
        [(DATaskManager *)v9 _schedulePerformTask:v5];
        goto LABEL_23;
      }
    }
    long long v28 = [(DATaskManager *)v9 mQueuedTasks];
    [v28 addObject:v5];
LABEL_22:

LABEL_23:
    objc_sync_exit(v9);

    [(DATaskManager *)v9 taskManagerDidAddTask:v5];
    goto LABEL_24;
  }
  [v5 cancelTaskWithReason:1 underlyingError:0];
  objc_sync_exit(v9);

LABEL_24:
}

- (BOOL)_allowsMoreConcurrentIndependentTasks
{
  return !self->_maxConcurrentIndependentTasks
      || [(NSMutableSet *)self->_independentTasks count] < self->_maxConcurrentIndependentTasks;
}

- (void)cancelTask:(id)a3 withUnderlyingError:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = DALoggingwithCategory();
  os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1BA384000, v7, v8, "Task %@ aborted", (uint8_t *)&v9, 0xCu);
  }

  [v5 cancelTaskWithReason:0 underlyingError:v6];
}

- (void)cancelTask:(id)a3
{
}

- (void)cancelAllTasks
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(DATaskManager *)self allTasks];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(DATaskManager *)self cancelTask:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)shutdown
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v3 = DALoggingwithCategory();
  uint64_t v4 = MEMORY[0x1E4F5E9A0];
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v3, v5))
  {
    uint64_t v6 = [(DATaskManager *)self account];
    int v23 = 134218240;
    v24 = self;
    __int16 v25 = 2048;
    v26 = v6;
    _os_log_impl(&dword_1BA384000, v3, v5, "Task Manager %p shutting down with account at %p", (uint8_t *)&v23, 0x16u);
  }
  [(DATaskManager *)self setAccount:0];
  uint64_t v7 = DALoggingwithCategory();
  if (os_log_type_enabled(v7, v5))
  {
    long long v8 = [(DATaskManager *)self stateString];
    int v23 = 134218242;
    v24 = self;
    __int16 v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_1BA384000, v7, v5, "Task Manager %p shutting down with state %@", (uint8_t *)&v23, 0x16u);
  }
  if ([(DATaskManager *)self state] != 5)
  {
    long long v9 = self;
    objc_sync_enter(v9);
    [(DATaskManager *)v9 setState:5];
    long long v10 = [(DATaskManager *)v9 managerIdleTimer];

    if (v10)
    {
      long long v11 = [(DATaskManager *)v9 managerIdleTimer];
      [v11 invalidate];

      [(DATaskManager *)v9 setManagerIdleTimer:0];
    }
    v12 = [(DATaskManager *)v9 userInitiatedSyncTimer];

    if (v12)
    {
      uint64_t v13 = [(DATaskManager *)v9 userInitiatedSyncTimer];
      [v13 invalidate];

      [(DATaskManager *)v9 setUserInitiatedSyncTimer:0];
    }
    uint64_t v14 = [(DATaskManager *)v9 xpcTransactionTimer];

    if (v14)
    {
      uint64_t v15 = [(DATaskManager *)v9 xpcTransactionTimer];
      [v15 invalidate];

      [(DATaskManager *)v9 setXpcTransactionTimer:0];
    }
    if (v9->_transaction)
    {
      os_log_type_t v16 = DALoggingwithCategory();
      os_log_type_t v17 = *(unsigned char *)(v4 + 6);
      if (os_log_type_enabled(v16, v17))
      {
        int v23 = 138412290;
        v24 = v9;
        _os_log_impl(&dword_1BA384000, v16, v17, "Task manager %@ is being shut down. Ending XPC transaction", (uint8_t *)&v23, 0xCu);
      }

      transaction = v9->_transaction;
      v9->_transaction = 0;
    }
    if (v9->_daActivity)
    {
      int v19 = DALoggingwithCategory();
      if (os_log_type_enabled(v19, v5))
      {
        int v23 = 138412290;
        v24 = v9;
        _os_log_impl(&dword_1BA384000, v19, v5, "Task manager %@ is being shut down. Releasing XPC activity", (uint8_t *)&v23, 0xCu);
      }

      daActivity = v9->_daActivity;
      v9->_daActivity = 0;
    }
    int v21 = [(DATaskManager *)v9 powerLogIdleTimer];

    if (v21)
    {
      v22 = [(DATaskManager *)v9 powerLogIdleTimer];
      [v22 invalidate];

      [(DATaskManager *)v9 setPowerLogIdleTimer:0];
    }
    if (v9->_didLogSyncStart) {
      [(DATaskManager *)v9 _logSyncEnd];
    }
    objc_sync_exit(v9);

    [(DATaskManager *)v9 _cancelTasksWithReason:1];
  }
}

- (void)cancelTasksDueToOnPowerMode
{
}

- (id)stateString
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v14 = NSString;
  os_log_type_t v17 = getStateName([(DATaskManager *)v2 state]);
  os_log_type_t v16 = [(DATaskManager *)v2 activeExclusiveTask];
  uint64_t v15 = [(DATaskManager *)v2 queuedExclusiveTasks];
  BOOL v3 = [(DATaskManager *)v2 independentTasks];
  uint64_t v4 = [(DATaskManager *)v2 heldIndependentTasks];
  os_log_type_t v5 = [(DATaskManager *)v2 modalHeldIndependentTasks];
  queuedIndependentTasks = v2->_queuedIndependentTasks;
  uint64_t v7 = [(DATaskManager *)v2 activeQueuedTask];
  long long v8 = [(DATaskManager *)v2 mQueuedTasks];
  long long v9 = [(DATaskManager *)v2 activeModalTask];
  long long v10 = [(DATaskManager *)v2 queuedModalTasks];
  long long v11 = [(DATaskManager *)v2 account];
  v12 = [v14 stringWithFormat:@"DATaskManager %@ state:%@\nActive exclusive task: %@\nQueued exclusive tasks: %@\nIndependent tasks: %@\nHeld independent tasks: %@\nModal-held independent tasks: %@\nQueued independent tasks: %@\nActive queued task: %@\nQueued tasks: %@\nActive modal task: %@\nQueued modal tasks: %@\n\nAssociated with account: %@\n", v2, v17, v16, v15, v3, v4, v5, queuedIndependentTasks, v7, v8, v9, v10, v11];

  objc_sync_exit(v2);
  return v12;
}

- (void)_useOpportunisticSocketsAgain
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(DATaskManager *)self state] != 5)
  {
    BOOL v3 = DALoggingwithCategory();
    os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
    if (os_log_type_enabled(v3, v4))
    {
      int v6 = 138412290;
      uint64_t v7 = self;
      _os_log_impl(&dword_1BA384000, v3, v4, "Task manager %@ has finally drained its queue. Turning opportunistic socket support back on", (uint8_t *)&v6, 0xCu);
    }

    os_log_type_t v5 = [(DATaskManager *)self account];
    [v5 setShouldUseOpportunisticSockets:1];
  }
}

- (id)_powerLogInfoDictionary
{
  BOOL v3 = objc_opt_new();
  os_log_type_t v4 = [(DATaskManager *)self account];
  os_log_type_t v5 = [v4 accountID];

  if (v5)
  {
    int v6 = [(DATaskManager *)self account];
    uint64_t v7 = [v6 accountID];
    [v3 setObject:v7 forKeyedSubscript:@"AccountID"];
  }
  uint64_t v8 = [(DATaskManager *)self account];
  long long v9 = [v8 accountDescription];

  if (v9)
  {
    long long v10 = [(DATaskManager *)self account];
    long long v11 = [v10 accountDescription];
    [v3 setObject:v11 forKeyedSubscript:@"AccountName"];
  }
  v12 = [(DATaskManager *)self account];
  uint64_t v13 = objc_opt_class();

  if (v13)
  {
    uint64_t v14 = [(DATaskManager *)self account];
    uint64_t v15 = (objc_class *)objc_opt_class();
    os_log_type_t v16 = NSStringFromClass(v15);
    [v3 setObject:v16 forKeyedSubscript:@"AccountClass"];
  }
  return v3;
}

- (void)_clearUserInitiatedSyncTimer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(DATaskManager *)self state] != 5)
  {
    BOOL v3 = DALoggingwithCategory();
    os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
    if (os_log_type_enabled(v3, v4))
    {
      int v6 = 138412290;
      uint64_t v7 = self;
      _os_log_impl(&dword_1BA384000, v3, v4, "Task manager %@ has finally drained its queue. Clearing its user initiated sync state", (uint8_t *)&v6, 0xCu);
    }

    os_log_type_t v5 = [(DATaskManager *)self account];
    [v5 setWasUserInitiated:0];
  }
}

- (void)_endXpcTransaction
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    int v10 = 138412290;
    long long v11 = self;
    _os_log_impl(&dword_1BA384000, v3, v4, "Task manager %@ has finally drained its queue. Ending XPC transaction", (uint8_t *)&v10, 0xCu);
  }

  transaction = self->_transaction;
  self->_transaction = 0;

  int v6 = DALoggingwithCategory();
  if (os_log_type_enabled(v6, v4))
  {
    int v10 = 138412290;
    long long v11 = self;
    _os_log_impl(&dword_1BA384000, v6, v4, "Task manager %@ has finally drained its queue. Releasing XPC activity", (uint8_t *)&v10, 0xCu);
  }

  daActivity = self->_daActivity;
  self->_daActivity = 0;

  uint64_t v8 = DALoggingwithCategory();
  if (os_log_type_enabled(v8, v4))
  {
    int v10 = 138412290;
    long long v11 = self;
    _os_log_impl(&dword_1BA384000, v8, v4, "Task manager %@ has finally drained its queue. Reset automatic fetching state", (uint8_t *)&v10, 0xCu);
  }

  long long v9 = [(DATaskManager *)self account];
  [v9 saveFetchingAutomaticallyState:0];
}

- (void)_logSyncEnd
{
  v3[3] = *MEMORY[0x1E4F143B8];
  [(DATaskManager *)self _powerLogInfoDictionary];
  v3[0] = @"AccountName";
  v3[1] = @"AccountClass";
  v3[2] = @"AccountID";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  PLLogRegisteredEvent();
  self->_didLogSyncStart = 0;
}

- (BOOL)_taskForcesNetworking:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      char v4 = [v3 shouldForceNetworking];
    }
    else {
      char v4 = 1;
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_taskInQueueForcesNetworkConnection:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[DATaskManager _taskForcesNetworking:](self, "_taskForcesNetworking:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)_hasTasksForcingNetworkConnection
{
  id v3 = [(DATaskManager *)self queuedExclusiveTasks];
  BOOL v4 = [(DATaskManager *)self _taskInQueueForcesNetworkConnection:v3];

  if (v4) {
    return 1;
  }
  uint64_t v5 = [(DATaskManager *)self independentTasks];
  uint64_t v6 = [v5 allObjects];
  BOOL v7 = [(DATaskManager *)self _taskInQueueForcesNetworkConnection:v6];

  if (v7) {
    return 1;
  }
  uint64_t v8 = [(DATaskManager *)self heldIndependentTasks];
  BOOL v9 = [v8 allObjects];
  BOOL v10 = [(DATaskManager *)self _taskInQueueForcesNetworkConnection:v9];

  if (v10) {
    return 1;
  }
  long long v11 = [(DATaskManager *)self modalHeldIndependentTasks];
  long long v12 = [v11 allObjects];
  BOOL v13 = [(DATaskManager *)self _taskInQueueForcesNetworkConnection:v12];

  if (v13) {
    return 1;
  }
  if ([(DATaskManager *)self _taskInQueueForcesNetworkConnection:self->_queuedIndependentTasks])
  {
    return 1;
  }
  long long v14 = [(DATaskManager *)self mQueuedTasks];
  BOOL v15 = [(DATaskManager *)self _taskInQueueForcesNetworkConnection:v14];

  if (v15) {
    return 1;
  }
  uint64_t v16 = [(DATaskManager *)self queuedModalTasks];
  BOOL v17 = [(DATaskManager *)self _taskInQueueForcesNetworkConnection:v16];

  if (v17) {
    return 1;
  }
  os_log_type_t v18 = [(DATaskManager *)self activeModalTask];
  BOOL v19 = [(DATaskManager *)self _taskForcesNetworking:v18];

  if (v19) {
    return 1;
  }
  objc_super v20 = [(DATaskManager *)self activeQueuedTask];
  BOOL v21 = [(DATaskManager *)self _taskForcesNetworking:v20];

  if (v21) {
    return 1;
  }
  v22 = [(DATaskManager *)self modalHeldActiveQueuedTask];
  BOOL v23 = [(DATaskManager *)self _taskForcesNetworking:v22];

  if (v23) {
    return 1;
  }
  __int16 v25 = [(DATaskManager *)self activeModalTask];
  BOOL v26 = [(DATaskManager *)self _taskForcesNetworking:v25];

  return v26;
}

- (BOOL)_hasTasksIndicatingARunningSync
{
  v2 = [(DATaskManager *)self allTasks];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)taskDidFinish:(id)a3
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = DALoggingwithCategory();
  uint64_t v7 = MEMORY[0x1E4F5E9A0];
  os_log_type_t type = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v6, type))
  {
    *(_DWORD *)buf = 138412290;
    id v155 = v5;
    _os_log_impl(&dword_1BA384000, v6, type, "Task %@ finished.", buf, 0xCu);
  }

  uint64_t v8 = self;
  objc_sync_enter(v8);
  if ([(DATaskManager *)v8 state] == 5)
  {
    [(DATaskManager *)v8 taskManagerWillRemoveTask:v5];
    [(DATaskManager *)v8 _releasePowerAssertionForTask:v5];
    goto LABEL_115;
  }
  id v9 = [(DATaskManager *)v8 activeExclusiveTask];

  if (v9 == v5)
  {
    [(DATaskManager *)v8 setActiveExclusiveTask:0];
    goto LABEL_20;
  }
  id v10 = [(DATaskManager *)v8 activeQueuedTask];
  BOOL v11 = v10 == v5;

  if (v11)
  {
    [(DATaskManager *)v8 setActiveQueuedTask:0];
    goto LABEL_20;
  }
  id v12 = [(DATaskManager *)v8 modalHeldActiveQueuedTask];
  BOOL v13 = v12 == v5;

  if (v13)
  {
    [(DATaskManager *)v8 setModalHeldActiveQueuedTask:0];
    goto LABEL_20;
  }
  long long v14 = [(DATaskManager *)v8 queuedExclusiveTasks];
  int v15 = [v14 containsObject:v5];

  if (v15)
  {
    uint64_t v16 = [(DATaskManager *)v8 queuedExclusiveTasks];
    [v16 removeObject:v5];
LABEL_19:

    goto LABEL_20;
  }
  BOOL v17 = [(DATaskManager *)v8 independentTasks];
  int v18 = [v17 containsObject:v5];

  if (v18)
  {
    uint64_t v16 = [(DATaskManager *)v8 independentTasks];
    [v16 removeObject:v5];
    goto LABEL_19;
  }
  BOOL v19 = [(DATaskManager *)v8 heldIndependentTasks];
  int v20 = [v19 containsObject:v5];

  if (v20)
  {
    uint64_t v16 = [(DATaskManager *)v8 heldIndependentTasks];
    [v16 removeObject:v5];
    goto LABEL_19;
  }
  BOOL v21 = [(DATaskManager *)v8 modalHeldIndependentTasks];
  int v22 = [v21 containsObject:v5];

  if (v22)
  {
    uint64_t v16 = [(DATaskManager *)v8 modalHeldIndependentTasks];
    [v16 removeObject:v5];
    goto LABEL_19;
  }
  if (![(NSMutableArray *)v8->_queuedIndependentTasks containsObject:v5])
  {
    v125 = [(DATaskManager *)v8 mQueuedTasks];
    int v126 = [v125 containsObject:v5];

    if (!v126)
    {
      id v127 = [(DATaskManager *)v8 activeModalTask];
      BOOL v128 = v127 == v5;

      if (v128)
      {
        v132 = [MEMORY[0x1E4F28B00] currentHandler];
        [v132 handleFailureInMethod:a2, v8, @"DATaskManager.m", 703, @"Finished task is not being managed, so cannot be active modal task." object file lineNumber description];
      }
      v129 = [(DATaskManager *)v8 queuedModalTasks];
      int v130 = [v129 containsObject:v5];

      if (v130)
      {
        v133 = [MEMORY[0x1E4F28B00] currentHandler];
        [v133 handleFailureInMethod:a2, v8, @"DATaskManager.m", 705, @"Finished task is not being managed, so cannot be in modal queue." object file lineNumber description];
      }
      v117 = DALoggingwithCategory();
      os_log_type_t v131 = *(unsigned char *)(v7 + 6);
      if (os_log_type_enabled(v117, v131))
      {
        *(_DWORD *)buf = 138412290;
        id v155 = v5;
        _os_log_impl(&dword_1BA384000, v117, v131, "Early return because task %@ isn't in our collection", buf, 0xCu);
      }
      goto LABEL_114;
    }
    uint64_t v16 = [(DATaskManager *)v8 mQueuedTasks];
    [v16 removeObject:v5];
    goto LABEL_19;
  }
  [(NSMutableArray *)v8->_queuedIndependentTasks removeObject:v5];
LABEL_20:
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:v8 selector:sel__performTask_ object:v5];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:v8 selector:sel__startModal_ object:v5];
  [(DATaskManager *)v8 taskManagerWillRemoveTask:v5];
  [(DATaskManager *)v8 _releasePowerAssertionForTask:v5];
  id v23 = [(DATaskManager *)v8 activeModalTask];

  if (v23 == v5)
  {
    [(DATaskManager *)v8 setActiveModalTask:0];
    goto LABEL_24;
  }
  v24 = [(DATaskManager *)v8 queuedModalTasks];
  int v25 = [v24 containsObject:v5];

  if (!v25)
  {
LABEL_24:
    int v27 = 0;
    goto LABEL_25;
  }
  BOOL v26 = [(DATaskManager *)v8 queuedModalTasks];
  [v26 removeObject:v5];

  int v27 = 1;
LABEL_25:
  switch([(DATaskManager *)v8 state])
  {
    case 0:
      long long v28 = [(DATaskManager *)v8 queuedModalTasks];
      if ([v28 count]) {
        goto LABEL_63;
      }
      int v29 = [(DATaskManager *)v8 queuedExclusiveTasks];
      if ([v29 count])
      {

        goto LABEL_63;
      }
      v52 = [(DATaskManager *)v8 activeQueuedTask];
      BOOL v53 = v52 == 0;

      if (v53)
      {
        v54 = [(DATaskManager *)v8 mQueuedTasks];
        uint64_t v55 = [v54 count];

        if (v55)
        {
          v57 = [(DATaskManager *)v8 mQueuedTasks];
          v58 = [v57 objectAtIndexedSubscript:0];
          [(DATaskManager *)v8 setActiveQueuedTask:v58];

          v59 = [(DATaskManager *)v8 mQueuedTasks];
          [v59 removeObjectAtIndex:0];

          v60 = [(DATaskManager *)v8 activeQueuedTask];
          [(DATaskManager *)v8 _schedulePerformTask:v60];
        }
        *(void *)&long long v56 = 138412290;
        long long v134 = v56;
        while ([(DATaskManager *)v8 _allowsMoreConcurrentIndependentTasks]&& [(NSMutableArray *)v8->_queuedIndependentTasks count])
        {
          v61 = [(NSMutableArray *)v8->_queuedIndependentTasks objectAtIndexedSubscript:0];
          [(NSMutableArray *)v8->_queuedIndependentTasks removeObjectAtIndex:0];
          v62 = DALoggingwithCategory();
          if (os_log_type_enabled(v62, type))
          {
            *(_DWORD *)buf = v134;
            id v155 = v61;
            _os_log_impl(&dword_1BA384000, v62, type, "Scheduling queued independent task %@", buf, 0xCu);
          }

          v63 = [(DATaskManager *)v8 independentTasks];
          [v63 addObject:v61];

          [(DATaskManager *)v8 _schedulePerformTask:v61];
        }
      }
      goto LABEL_64;
    case 1:
      id v32 = [(DATaskManager *)v8 activeQueuedTask];
      if (v32)
      {

        goto LABEL_46;
      }
      v41 = [(DATaskManager *)v8 independentTasks];
      BOOL v42 = [v41 count] == 0;

      if (!v42)
      {
LABEL_46:
        uint64_t v43 = [(DATaskManager *)v8 queuedExclusiveTasks];
        BOOL v44 = [v43 count] == 0;

        if (v44) {
          goto LABEL_47;
        }
        goto LABEL_64;
      }
      v64 = [(DATaskManager *)v8 queuedExclusiveTasks];
      uint64_t v65 = [v64 count];

      if (v65) {
        goto LABEL_62;
      }
LABEL_64:
      [(DATaskManager *)v8 _makeStateTransition];
      v69 = [(DATaskManager *)v8 managerIdleTimer];

      if (v69)
      {
        v70 = [(DATaskManager *)v8 managerIdleTimer];
        [v70 invalidate];

        [(DATaskManager *)v8 setManagerIdleTimer:0];
      }
      v71 = [(DATaskManager *)v8 account];
      if (([v71 shouldUseOpportunisticSockets] & 1) == 0)
      {
        BOOL v72 = [(DATaskManager *)v8 _hasTasksForcingNetworkConnection];

        if (v72) {
          goto LABEL_76;
        }
        id v73 = objc_alloc(MEMORY[0x1E4F1CB00]);
        v74 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5.0];
        v75 = (void *)[v73 initWithFireDate:v74 interval:v8 target:sel__useOpportunisticSocketsAgain selector:0 userInfo:0 repeats:0.0];
        [(DATaskManager *)v8 setManagerIdleTimer:v75];

        long long v150 = 0u;
        long long v151 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        v71 = runLoopModesToPerformDelayedSelectorsIn();
        uint64_t v76 = [v71 countByEnumeratingWithState:&v148 objects:v159 count:16];
        if (v76)
        {
          uint64_t v77 = *(void *)v149;
          do
          {
            for (uint64_t i = 0; i != v76; ++i)
            {
              if (*(void *)v149 != v77) {
                objc_enumerationMutation(v71);
              }
              uint64_t v79 = *(void *)(*((void *)&v148 + 1) + 8 * i);
              v80 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
              v81 = [(DATaskManager *)v8 managerIdleTimer];
              [v80 addTimer:v81 forMode:v79];
            }
            uint64_t v76 = [v71 countByEnumeratingWithState:&v148 objects:v159 count:16];
          }
          while (v76);
        }
      }

LABEL_76:
      v82 = [(DATaskManager *)v8 userInitiatedSyncTimer];

      if (v82)
      {
        v83 = [(DATaskManager *)v8 userInitiatedSyncTimer];
        [v83 invalidate];

        [(DATaskManager *)v8 setUserInitiatedSyncTimer:0];
      }
      v84 = [(DATaskManager *)v8 account];
      if ([v84 wasUserInitiated])
      {
        BOOL v85 = [(DATaskManager *)v8 _hasTasksIndicatingARunningSync];

        if (v85) {
          goto LABEL_88;
        }
        id v86 = objc_alloc(MEMORY[0x1E4F1CB00]);
        v87 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5.0];
        v88 = (void *)[v86 initWithFireDate:v87 interval:v8 target:sel__clearUserInitiatedSyncTimer selector:0 userInfo:0 repeats:0.0];
        [(DATaskManager *)v8 setUserInitiatedSyncTimer:v88];

        long long v146 = 0u;
        long long v147 = 0u;
        long long v144 = 0u;
        long long v145 = 0u;
        v84 = runLoopModesToPerformDelayedSelectorsIn();
        uint64_t v89 = [v84 countByEnumeratingWithState:&v144 objects:v158 count:16];
        if (v89)
        {
          uint64_t v90 = *(void *)v145;
          do
          {
            for (uint64_t j = 0; j != v89; ++j)
            {
              if (*(void *)v145 != v90) {
                objc_enumerationMutation(v84);
              }
              uint64_t v92 = *(void *)(*((void *)&v144 + 1) + 8 * j);
              v93 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
              v94 = [(DATaskManager *)v8 userInitiatedSyncTimer];
              [v93 addTimer:v94 forMode:v92];
            }
            uint64_t v89 = [v84 countByEnumeratingWithState:&v144 objects:v158 count:16];
          }
          while (v89);
        }
      }

LABEL_88:
      v95 = [(DATaskManager *)v8 xpcTransactionTimer];

      if (v95)
      {
        v96 = [(DATaskManager *)v8 xpcTransactionTimer];
        [v96 invalidate];

        [(DATaskManager *)v8 setXpcTransactionTimer:0];
      }
      if (![(DATaskManager *)v8 _hasTasksIndicatingARunningSync])
      {
        v97 = DALoggingwithCategory();
        if (os_log_type_enabled(v97, type))
        {
          v98 = [(DATaskManager *)v8 account];
          id v99 = [v98 accountDescription];
          v100 = [(DATaskManager *)v8 account];
          v101 = [v100 publicDescription];
          *(_DWORD *)buf = 138412546;
          id v155 = v99;
          __int16 v156 = 2114;
          v157 = v101;
          _os_log_impl(&dword_1BA384000, v97, type, "Pending tasks are finished for account \"%@\" (%{public}@)", buf, 0x16u);
        }
        id v102 = objc_alloc(MEMORY[0x1E4F1CB00]);
        v103 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5.0];
        v104 = (void *)[v102 initWithFireDate:v103 interval:v8 target:sel__endXpcTransaction selector:0 userInfo:0 repeats:0.0];
        [(DATaskManager *)v8 setXpcTransactionTimer:v104];

        long long v142 = 0u;
        long long v143 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        v105 = runLoopModesToPerformDelayedSelectorsIn();
        uint64_t v106 = [v105 countByEnumeratingWithState:&v140 objects:v153 count:16];
        if (v106)
        {
          uint64_t v107 = *(void *)v141;
          do
          {
            for (uint64_t k = 0; k != v106; ++k)
            {
              if (*(void *)v141 != v107) {
                objc_enumerationMutation(v105);
              }
              uint64_t v109 = *(void *)(*((void *)&v140 + 1) + 8 * k);
              v110 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
              v111 = [(DATaskManager *)v8 xpcTransactionTimer];
              [v110 addTimer:v111 forMode:v109];
            }
            uint64_t v106 = [v105 countByEnumeratingWithState:&v140 objects:v153 count:16];
          }
          while (v106);
        }
      }
      v112 = [(DATaskManager *)v8 powerLogIdleTimer];

      if (v112)
      {
        v113 = [(DATaskManager *)v8 powerLogIdleTimer];
        [v113 invalidate];

        [(DATaskManager *)v8 setPowerLogIdleTimer:0];
      }
      if (![(DATaskManager *)v8 _hasTasksIndicatingARunningSync]
        && [(DATaskManager *)v8 didLogSyncStart])
      {
        id v114 = objc_alloc(MEMORY[0x1E4F1CB00]);
        v115 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
        v116 = (void *)[v114 initWithFireDate:v115 interval:v8 target:sel__logSyncEnd selector:0 userInfo:0 repeats:0.0];
        [(DATaskManager *)v8 setPowerLogIdleTimer:v116];

        long long v138 = 0u;
        long long v139 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        v117 = runLoopModesToPerformDelayedSelectorsIn();
        uint64_t v118 = [v117 countByEnumeratingWithState:&v136 objects:v152 count:16];
        if (v118)
        {
          uint64_t v119 = *(void *)v137;
          do
          {
            for (uint64_t m = 0; m != v118; ++m)
            {
              if (*(void *)v137 != v119) {
                objc_enumerationMutation(v117);
              }
              uint64_t v121 = *(void *)(*((void *)&v136 + 1) + 8 * m);
              v122 = [(DATaskManager *)v8 powerLogIdleTimer];

              if (v122)
              {
                v123 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
                v124 = [(DATaskManager *)v8 powerLogIdleTimer];
                [v123 addTimer:v124 forMode:v121];
              }
            }
            uint64_t v118 = [v117 countByEnumeratingWithState:&v136 objects:v152 count:16];
          }
          while (v118);
        }
LABEL_114:
      }
LABEL_115:
      objc_sync_exit(v8);

      return;
    case 2:
      if (v9 == v5)
      {
        uint64_t v33 = [(DATaskManager *)v8 queuedExclusiveTasks];
        uint64_t v34 = [v33 count];

        if (v34) {
          goto LABEL_62;
        }
        v47 = [(DATaskManager *)v8 queuedModalTasks];
        uint64_t v48 = [v47 count];

        if (!v48) {
          goto LABEL_47;
        }
        goto LABEL_51;
      }
      goto LABEL_64;
    case 3:
      if (v27)
      {
        BOOL v35 = [(DATaskManager *)v8 queuedModalTasks];
        BOOL v36 = [v35 count] == 0;

        if (v36) {
          goto LABEL_47;
        }
      }
      else
      {
        long long v28 = [(DATaskManager *)v8 activeQueuedTask];
        if (v28) {
          goto LABEL_63;
        }
        id v37 = [(DATaskManager *)v8 independentTasks];
        BOOL v38 = [v37 count] == 0;

        if (v38)
        {
          BOOL v39 = [(DATaskManager *)v8 queuedModalTasks];
          uint64_t v40 = [v39 count];

          if (v40) {
            goto LABEL_51;
          }
        }
      }
      goto LABEL_64;
    case 4:
      if (v23 == v5)
      {
        BOOL v30 = [(DATaskManager *)v8 queuedModalTasks];
        uint64_t v31 = [v30 count];

        if (v31)
        {
LABEL_51:
          v49 = [(DATaskManager *)v8 queuedModalTasks];
          v50 = [v49 objectAtIndexedSubscript:0];
          [(DATaskManager *)v8 setActiveModalTask:v50];

          v51 = [(DATaskManager *)v8 queuedModalTasks];
          [v51 removeObjectAtIndex:0];

          long long v28 = [(DATaskManager *)v8 activeModalTask];
          [(DATaskManager *)v8 _scheduleStartModal:v28];
          goto LABEL_63;
        }
        v45 = [(DATaskManager *)v8 queuedExclusiveTasks];
        uint64_t v46 = [v45 count];

        if (v46)
        {
LABEL_62:
          v66 = [(DATaskManager *)v8 queuedExclusiveTasks];
          v67 = [v66 objectAtIndexedSubscript:0];
          [(DATaskManager *)v8 setActiveExclusiveTask:v67];

          v68 = [(DATaskManager *)v8 queuedExclusiveTasks];
          [v68 removeObjectAtIndex:0];

          long long v28 = [(DATaskManager *)v8 activeExclusiveTask];
          [(DATaskManager *)v8 _schedulePerformTask:v28];
          goto LABEL_63;
        }
LABEL_47:
        [(DATaskManager *)v8 _reactivateHeldTasks];
      }
      goto LABEL_64;
    default:
      long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2 object:v8 file:@"DATaskManager.m" lineNumber:805 description:@"Out of bounds state"];
LABEL_63:

      goto LABEL_64;
  }
}

- (void)taskRequestModal:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    BOOL v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:864 description:@"A nil task requested modal?"];
  }
  uint64_t v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v6, v7))
  {
    int v38 = 138412290;
    id v39 = v5;
    _os_log_impl(&dword_1BA384000, v6, v7, "Task %@ requesting modal", (uint8_t *)&v38, 0xCu);
  }

  if ([(DATaskManager *)self state] == 5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:870 description:@"Cannot request modal behavior during shutdown"];

    goto LABEL_27;
  }
  id v9 = self;
  objc_sync_enter(v9);
  int v10 = 1;
  int v11 = 1;
  switch([(DATaskManager *)v9 state])
  {
    case 0:
      id v12 = [(DATaskManager *)v9 activeQueuedTask];
      if (v12 == v5)
      {
        BOOL v30 = [(DATaskManager *)v9 independentTasks];
        BOOL v31 = [v30 count] == 0;

        if (v31) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      id v32 = [(DATaskManager *)v9 activeQueuedTask];
      if (v32)
      {
      }
      else
      {
        uint64_t v33 = [(DATaskManager *)v9 independentTasks];
        if ([v33 count] == 1)
        {
          uint64_t v34 = [(DATaskManager *)v9 independentTasks];
          int v35 = [v34 containsObject:v5];

          int v10 = v35 ^ 1;
          int v11 = v35 ^ 1;
        }
        else
        {
        }
      }
      goto LABEL_15;
    case 1:
      goto LABEL_15;
    case 2:
      id v14 = [(DATaskManager *)v9 activeExclusiveTask];
      BOOL v15 = v14 == v5;

      if (!v15)
      {
        id v37 = [MEMORY[0x1E4F28B00] currentHandler];
        [v37 handleFailureInMethod:a2 object:v9 file:@"DATaskManager.m" lineNumber:897 description:@"Only the active exclusive task can go modal immediately"];
      }
      goto LABEL_13;
    case 3:
    case 4:
      goto LABEL_14;
    default:
      BOOL v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:v9 file:@"DATaskManager.m" lineNumber:907 description:@"Out of bounds state."];

LABEL_13:
      int v10 = 0;
LABEL_14:
      int v11 = 0;
LABEL_15:
      id v16 = [(DATaskManager *)v9 activeQueuedTask];
      BOOL v17 = v16 == v5;

      if (v17)
      {
        int v22 = [(DATaskManager *)v9 activeQueuedTask];
        [(DATaskManager *)v9 setModalHeldActiveQueuedTask:v22];

        [(DATaskManager *)v9 setActiveQueuedTask:0];
      }
      else
      {
        int v18 = [(DATaskManager *)v9 independentTasks];
        int v19 = [v18 containsObject:v5];

        if (v19)
        {
          int v20 = [(DATaskManager *)v9 modalHeldIndependentTasks];
          [v20 addObject:v5];

          BOOL v21 = [(DATaskManager *)v9 independentTasks];
          [v21 removeObject:v5];
        }
      }
      if (v10)
      {
        if (v5)
        {
          id v23 = [(DATaskManager *)v9 queuedModalTasks];
          [v23 addObject:v5];
        }
        v24 = [(DATaskManager *)v9 independentTasks];
        if ([v24 count]) {
          goto LABEL_23;
        }
        int v25 = [(DATaskManager *)v9 activeQueuedTask];
        BOOL v26 = v25 == 0;

        if (v26)
        {
          int v27 = [(DATaskManager *)v9 queuedModalTasks];
          long long v28 = [v27 objectAtIndexedSubscript:0];
          [(DATaskManager *)v9 setActiveModalTask:v28];

          int v29 = [(DATaskManager *)v9 queuedModalTasks];
          [v29 removeObjectAtIndex:0];

          v24 = [(DATaskManager *)v9 activeModalTask];
          [(DATaskManager *)v9 _scheduleStartModal:v24];
LABEL_23:
        }
      }
      else
      {
        [(DATaskManager *)v9 setActiveModalTask:v5];
        [(DATaskManager *)v9 _scheduleStartModal:v5];
      }
      [(DATaskManager *)v9 _makeStateTransition];
      objc_sync_exit(v9);

      if (v11) {
        [(DATaskManager *)v9 _requestCancelTasksWithReason:1];
      }
LABEL_27:

      return;
  }
}

- (void)taskEndModal:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v6, v7))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_1BA384000, v6, v7, "Task %@ ending modal", buf, 0xCu);
  }

  if ([(DATaskManager *)self state] != 5)
  {
    if ([(DATaskManager *)self state] == 4)
    {
      uint64_t v8 = self;
      objc_sync_enter(v8);
      id v9 = [(DATaskManager *)v8 activeModalTask];
      BOOL v10 = v9 == v5;

      if (!v10)
      {
        id v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:a2 object:v8 file:@"DATaskManager.m" lineNumber:957 description:@"Only the active modal task can end modal behavior."];
      }
      [(DATaskManager *)v8 setActiveModalTask:0];
      int v11 = [(DATaskManager *)v8 queuedModalTasks];
      BOOL v12 = [v11 count] == 0;

      if (v12)
      {
        BOOL v13 = [(DATaskManager *)v8 activeExclusiveTask];

        if (!v13)
        {
          id v14 = [(DATaskManager *)v8 queuedExclusiveTasks];
          uint64_t v15 = [v14 count];

          if (!v15) {
            [(DATaskManager *)v8 _reactivateHeldTasks];
          }
        }
      }
      [(DATaskManager *)v8 _makeStateTransition];
      objc_sync_exit(v8);
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [(DATaskManager *)v8 handleFailureInMethod:a2, self, @"DATaskManager.m", 952, @"taskEndModal can only be called in Run Modal state, not %d", [(DATaskManager *)self state] object file lineNumber description];
    }
  }
}

- (BOOL)taskIsModal:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(DATaskManager *)v5 modalHeldIndependentTasks];
  if ([v6 containsObject:v4])
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [(DATaskManager *)v5 modalHeldActiveQueuedTask];
    if (v8 == v4)
    {
      BOOL v7 = 1;
    }
    else
    {
      id v9 = [(DATaskManager *)v5 activeModalTask];
      BOOL v7 = v9 == v4;
    }
  }

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)shouldCancelTaskDueToOnPowerFetchMode
{
  v2 = [(DATaskManager *)self account];
  char v3 = [v2 shouldCancelTaskDueToOnPowerFetchMode];

  return v3;
}

- (void)_performTask:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(DATaskManager *)self isShutdown])
  {
    id v5 = DALoggingwithCategory();
    os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v5, v6))
    {
      BOOL v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138543618;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_1BA384000, v5, v6, "The _performTask is invoked after taskManager has been shutdown. Canceling %{public}@ %@", buf, 0x16u);
    }
    [v4 cancelTaskWithReason:1 underlyingError:0];
  }
  else
  {
    BOOL v9 = [(DATaskManager *)self shouldCancelTaskDueToOnPowerFetchMode];
    BOOL v10 = DALoggingwithCategory();
    int v11 = v10;
    if (v9)
    {
      os_log_type_t v12 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
      if (os_log_type_enabled(v10, v12))
      {
        BOOL v13 = (objc_class *)objc_opt_class();
        id v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138543618;
        id v20 = v14;
        __int16 v21 = 2112;
        id v22 = v4;
        _os_log_impl(&dword_1BA384000, v11, v12, "The device is in on-power fetch mode, but is no longer on power or on wifi. Canceling %{public}@ %@", buf, 0x16u);
      }
      [v4 cancelTaskWithReason:2 underlyingError:0];
      [(DATaskManager *)self cancelTasksDueToOnPowerMode];
    }
    else
    {
      int v15 = *(unsigned __int8 *)(MEMORY[0x1E4F5E9A0] + 7);
      if (os_log_type_enabled(v10, *(os_log_type_t *)(MEMORY[0x1E4F5E9A0] + 7)))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_impl(&dword_1BA384000, v11, (os_log_type_t)v15, "performTask called on task %@", buf, 0xCu);
      }

      if (PLShouldLogRegisteredEvent()
        && [(DATaskManager *)self _hasTasksIndicatingARunningSync])
      {
        if (self->_didLogSyncStart)
        {
          id v16 = [(DATaskManager *)self powerLogIdleTimer];

          if (v16)
          {
            BOOL v17 = [(DATaskManager *)self powerLogIdleTimer];
            [v17 invalidate];

            [(DATaskManager *)self setPowerLogIdleTimer:0];
          }
        }
        else
        {
          [(DATaskManager *)self _powerLogInfoDictionary];
          v18[0] = @"AccountName";
          v18[1] = @"AccountClass";
          v18[2] = @"AccountID";
          [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
          PLLogRegisteredEvent();
          self->_didLogSyncStart = 1;
        }
      }
      [(DATaskManager *)self _retainPowerAssertionForTask:v4];
      [v4 performTask];
    }
  }
}

- (void)_requestCancelTasksWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = [(DATaskManager *)self independentTasks];
  os_log_type_t v6 = (void *)[v5 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        os_log_type_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "requestCancelTaskWithReason:", v3, (void)v16);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  BOOL v13 = [(DATaskManager *)self activeQueuedTask];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    int v15 = [(DATaskManager *)self activeQueuedTask];
    [v15 requestCancelTaskWithReason:v3];
  }
}

- (void)_startModal:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(DATaskManager *)self isShutdown])
  {
    os_log_type_t v6 = DALoggingwithCategory();
    os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      int v13 = 138543618;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_1BA384000, v6, v7, "The _startModal is invoked after taskManager has been shutdown. Canceling %{public}@ %@", (uint8_t *)&v13, 0x16u);
    }
    [v5 cancelTaskWithReason:1 underlyingError:0];
  }
  else
  {
    if ([(DATaskManager *)self state] == 5)
    {
      os_log_type_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1046 description:@"Cannot handle _startModal: in Shutdown state"];
    }
    uint64_t v10 = DALoggingwithCategory();
    os_log_type_t v11 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
    if (os_log_type_enabled(v10, v11))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_1BA384000, v10, v11, "startModal called on task %@", (uint8_t *)&v13, 0xCu);
    }

    [v5 startModal];
  }
}

- (void)_reactivateHeldTasks
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v3 = [(DATaskManager *)self heldIndependentTasks];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v32;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v31 + 1) + 8 * v7);
        if ([(DATaskManager *)self _allowsMoreConcurrentIndependentTasks])
        {
          uint64_t v9 = [(DATaskManager *)self independentTasks];
          [v9 addObject:v8];

          [(DATaskManager *)self _schedulePerformTask:v8];
        }
        else
        {
          uint64_t v10 = [(DATaskManager *)self queuedIndependentTasks];
          [v10 addObject:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v5);
  }

  os_log_type_t v11 = [(DATaskManager *)self heldIndependentTasks];
  [v11 removeAllObjects];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  os_log_type_t v12 = [(DATaskManager *)self modalHeldIndependentTasks];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * v16);
        long long v18 = [(DATaskManager *)self independentTasks];
        [v18 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v14);
  }

  long long v19 = [(DATaskManager *)self modalHeldIndependentTasks];
  [v19 removeAllObjects];

  id v20 = [(DATaskManager *)self modalHeldActiveQueuedTask];

  if (v20)
  {
    [(DATaskManager *)self setActiveQueuedTask:self->_modalHeldActiveQueuedTask];
    [(DATaskManager *)self setModalHeldActiveQueuedTask:0];
  }
  else
  {
    uint64_t v21 = [(DATaskManager *)self mQueuedTasks];
    uint64_t v22 = [v21 count];

    if (v22)
    {
      uint64_t v23 = [(DATaskManager *)self mQueuedTasks];
      v24 = [v23 objectAtIndexedSubscript:0];
      [(DATaskManager *)self setActiveQueuedTask:v24];

      int v25 = [(DATaskManager *)self mQueuedTasks];
      [v25 removeObjectAtIndex:0];

      BOOL v26 = [(DATaskManager *)self activeQueuedTask];
      [(DATaskManager *)self _schedulePerformTask:v26];
    }
  }
}

- (void)_makeStateTransition
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(DATaskManager *)self activeExclusiveTask];

  if (v4)
  {
    uint64_t v5 = [(DATaskManager *)self activeQueuedTask];

    if (v5)
    {
      v69 = [MEMORY[0x1E4F28B00] currentHandler];
      [v69 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1081 description:@"Cannot have active queued task and active exclusive task at the same time."];
    }
    uint64_t v6 = [(DATaskManager *)self independentTasks];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      v70 = [MEMORY[0x1E4F28B00] currentHandler];
      [v70 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1083 description:@"Cannot have running independent tasks and an active exclusive task at the same time."];
    }
  }
  uint64_t v8 = [(DATaskManager *)self activeModalTask];

  if (v8)
  {
    uint64_t v9 = [(DATaskManager *)self activeQueuedTask];

    if (v9)
    {
      v71 = [MEMORY[0x1E4F28B00] currentHandler];
      [v71 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1086 description:@"Cannot have active queued task and a modal task at the same time."];
    }
    uint64_t v10 = [(DATaskManager *)self independentTasks];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      BOOL v72 = [MEMORY[0x1E4F28B00] currentHandler];
      [v72 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1088 description:@"Cannot have running independent tasks and a modal task at the same time."];
    }
  }
  os_log_type_t v12 = DALoggingwithCategory();
  os_log_type_t v13 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = getStateName([(DATaskManager *)self state]);
    int v83 = 138412546;
    v84 = self;
    __int16 v85 = 2112;
    id v86 = v14;
    _os_log_impl(&dword_1BA384000, v12, v13, "Task Manager %@ transitioning from state: %@", (uint8_t *)&v83, 0x16u);
  }
  switch([(DATaskManager *)self state])
  {
    case 0:
      uint64_t v15 = [(DATaskManager *)self activeExclusiveTask];

      if (v15) {
        goto LABEL_36;
      }
      uint64_t v16 = [(DATaskManager *)self activeModalTask];

      if (v16) {
        goto LABEL_28;
      }
      uint64_t v17 = [(DATaskManager *)self queuedModalTasks];
      uint64_t v18 = [v17 count];

      if (v18) {
        goto LABEL_31;
      }
      long long v19 = [(DATaskManager *)self queuedExclusiveTasks];
      uint64_t v20 = [v19 count];

      if (v20) {
        goto LABEL_75;
      }
      break;
    case 1:
      uint64_t v22 = [(DATaskManager *)self activeExclusiveTask];

      if (v22) {
        goto LABEL_36;
      }
      if (self->_activeModalTask) {
        goto LABEL_28;
      }
      if (![(NSMutableArray *)self->_queuedExclusiveTasks count]) {
        goto LABEL_76;
      }
      break;
    case 2:
      uint64_t v23 = [(DATaskManager *)self activeModalTask];

      if (v23) {
        goto LABEL_28;
      }
      v24 = [(DATaskManager *)self activeExclusiveTask];

      if (!v24) {
        goto LABEL_76;
      }
      break;
    case 3:
      int v25 = [(DATaskManager *)self activeModalTask];

      if (v25)
      {
LABEL_28:
        BOOL v26 = self;
        uint64_t v27 = 4;
        goto LABEL_37;
      }
      long long v31 = [(DATaskManager *)self activeExclusiveTask];

      if (v31) {
        goto LABEL_36;
      }
      long long v32 = [(DATaskManager *)self queuedModalTasks];
      uint64_t v33 = [v32 count];

      if (!v33) {
        goto LABEL_76;
      }
      break;
    case 4:
      long long v28 = [(DATaskManager *)self activeModalTask];

      if (!v28)
      {
        long long v29 = [(DATaskManager *)self queuedModalTasks];
        uint64_t v30 = [v29 count];

        if (v30)
        {
LABEL_31:
          BOOL v26 = self;
          uint64_t v27 = 3;
        }
        else
        {
          long long v34 = [(DATaskManager *)self activeExclusiveTask];

          if (v34)
          {
LABEL_36:
            BOOL v26 = self;
            uint64_t v27 = 2;
          }
          else
          {
            v67 = [(DATaskManager *)self queuedExclusiveTasks];
            uint64_t v68 = [v67 count];

            if (v68)
            {
LABEL_75:
              BOOL v26 = self;
              uint64_t v27 = 1;
            }
            else
            {
LABEL_76:
              BOOL v26 = self;
              uint64_t v27 = 0;
            }
          }
        }
LABEL_37:
        [(DATaskManager *)v26 setState:v27];
      }
      break;
    case 5:
      break;
    default:
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1146 description:@"Out of bounds state."];

      break;
  }
  int v35 = DALoggingwithCategory();
  if (os_log_type_enabled(v35, v13))
  {
    BOOL v36 = getStateName([(DATaskManager *)self state]);
    int v83 = 138412546;
    v84 = self;
    __int16 v85 = 2112;
    id v86 = v36;
    _os_log_impl(&dword_1BA384000, v35, v13, "Task Manager %@ transitioning to state: %@", (uint8_t *)&v83, 0x16u);
  }
  switch([(DATaskManager *)self state])
  {
    case 0:
      uint64_t v37 = [(DATaskManager *)self activeExclusiveTask];

      if (v37)
      {
        id v73 = [MEMORY[0x1E4F28B00] currentHandler];
        [v73 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1154 description:@"Cannot have active exclusive task in Nominal state."];
      }
      int v38 = [(DATaskManager *)self activeModalTask];

      if (v38)
      {
        v74 = [MEMORY[0x1E4F28B00] currentHandler];
        [v74 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1155 description:@"Cannot have modal task in Nominal state."];
      }
      id v39 = [(DATaskManager *)self heldIndependentTasks];
      uint64_t v40 = [v39 count];

      if (v40)
      {
        v75 = [MEMORY[0x1E4F28B00] currentHandler];
        [v75 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1156 description:@"We shouldn't be holding independent tasks in Nominal state"];
      }
      v41 = [(DATaskManager *)self queuedExclusiveTasks];
      uint64_t v42 = [v41 count];

      if (v42)
      {
        uint64_t v76 = [MEMORY[0x1E4F28B00] currentHandler];
        [v76 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1157 description:@"We shouldn't have queued exclusive tasks in Nominal state"];
      }
      uint64_t v43 = [(DATaskManager *)self modalHeldIndependentTasks];
      uint64_t v44 = [v43 count];

      if (v44)
      {
        v45 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v46 = v45;
        v47 = @"We shouldn't have any independent tasks that are modal in Nominal state";
        SEL v48 = a2;
        v49 = self;
        uint64_t v50 = 1159;
        goto LABEL_52;
      }
      break;
    case 1:
      v51 = [(DATaskManager *)self activeExclusiveTask];

      if (v51)
      {
        uint64_t v77 = [MEMORY[0x1E4F28B00] currentHandler];
        [v77 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1162 description:@"Cannot have active exclusive task in Hold for Exclusive state."];
      }
      v52 = [(DATaskManager *)self activeModalTask];

      if (v52)
      {
        v78 = [MEMORY[0x1E4F28B00] currentHandler];
        [v78 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1163 description:@"Should not have any modal task active in Hold for Exclusive state"];
      }
      BOOL v53 = [(DATaskManager *)self queuedExclusiveTasks];
      uint64_t v54 = [v53 count];

      if (!v54)
      {
        v45 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v46 = v45;
        v47 = @"Should have at least one queued exclusive task in Hold for Exclusive state";
        SEL v48 = a2;
        v49 = self;
        uint64_t v50 = 1165;
        goto LABEL_52;
      }
      break;
    case 2:
      uint64_t v55 = [(DATaskManager *)self independentTasks];
      uint64_t v56 = [v55 count];

      if (v56)
      {
        uint64_t v79 = [MEMORY[0x1E4F28B00] currentHandler];
        [v79 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1168 description:@"Cannot have running independent tasks in Run Exclusive state."];
      }
      v57 = [(DATaskManager *)self activeQueuedTask];

      if (v57)
      {
        v45 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v46 = v45;
        v47 = @"Cannot have active queued task in Run Exclusive state.";
        SEL v48 = a2;
        v49 = self;
        uint64_t v50 = 1169;
        goto LABEL_52;
      }
      break;
    case 3:
      v58 = [(DATaskManager *)self activeModalTask];

      if (v58)
      {
        v80 = [MEMORY[0x1E4F28B00] currentHandler];
        [v80 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1172 description:@"Cannot have active modal task in Hold for Modal state."];
      }
      v59 = [(DATaskManager *)self queuedModalTasks];
      uint64_t v60 = [v59 count];

      if (!v60)
      {
        v45 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v46 = v45;
        v47 = @"Should have at least one queued modal task in Hold for Modal state.";
        SEL v48 = a2;
        v49 = self;
        uint64_t v50 = 1173;
        goto LABEL_52;
      }
      break;
    case 4:
      v61 = [(DATaskManager *)self independentTasks];
      uint64_t v62 = [v61 count];

      if (v62)
      {
        v81 = [MEMORY[0x1E4F28B00] currentHandler];
        [v81 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1176 description:@"Should not be running other independent tasks in Run Modal state."];
      }
      v63 = [(DATaskManager *)self activeQueuedTask];

      if (v63)
      {
        v82 = [MEMORY[0x1E4F28B00] currentHandler];
        [v82 handleFailureInMethod:a2 object:self file:@"DATaskManager.m" lineNumber:1177 description:@"Should not be running other queued task in Run Modal state."];
      }
      v64 = [(DATaskManager *)self activeExclusiveTask];

      if (v64)
      {
        uint64_t v65 = [(DATaskManager *)self activeModalTask];
        v66 = [(DATaskManager *)self activeExclusiveTask];

        if (v65 != v66)
        {
          v45 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v46 = v45;
          v47 = @"Only the exclusive task can currently go modal.";
          SEL v48 = a2;
          v49 = self;
          uint64_t v50 = 1179;
          goto LABEL_52;
        }
      }
      break;
    case 5:
      return;
    default:
      v45 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v46 = v45;
      v47 = @"Out of bounds state.";
      SEL v48 = a2;
      v49 = self;
      uint64_t v50 = 1185;
LABEL_52:
      [v45 handleFailureInMethod:v48 object:v49 file:@"DATaskManager.m" lineNumber:v50 description:v47];

      break;
  }
}

- (void)_scheduleSelector:(SEL)a3 withArgument:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = runLoopModesToPerformDelayedSelectorsIn();
  uint64_t v8 = DALoggingwithCategory();
  os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v8, v9))
  {
    Name = sel_getName(a3);
    uint64_t v11 = [v7 count];
    os_log_type_t v12 = v7;
    if (v11 == 1)
    {
      os_log_type_t v12 = [v7 lastObject];
    }
    int v13 = 136315650;
    uint64_t v14 = Name;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    _os_log_impl(&dword_1BA384000, v8, v9, "Scheduling selector: %s with argument: %@ in modes %@", (uint8_t *)&v13, 0x20u);
    if (v11 == 1) {
  }
    }
  [(DATaskManager *)self performSelector:a3 withObject:v6 afterDelay:v7 inModes:0.0];
}

- (void)_schedulePerformTask:(id)a3
{
}

- (void)_scheduleStartModal:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1BA384000, v5, v6, "Scheduling modal task: %@", (uint8_t *)&v7, 0xCu);
  }

  [(DATaskManager *)self _scheduleSelector:sel__startModal_ withArgument:v4];
}

- (void)_cancelTasksWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(DATaskManager *)self allTasks];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = DALoggingwithCategory();
        if (os_log_type_enabled(v11, v8))
        {
          *(_DWORD *)buf = 138412546;
          v24 = v10;
          __int16 v25 = 1024;
          int v26 = v3;
          _os_log_impl(&dword_1BA384000, v11, v8, "Cancelling task %@ with reason %d", buf, 0x12u);
        }

        [v10 cancelTaskWithReason:v3 underlyingError:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v6);
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  os_log_type_t v12 = [(DATaskManager *)self queuedExclusiveTasks];
  [v12 removeAllObjects];

  [(DATaskManager *)self setActiveExclusiveTask:0];
  int v13 = [(DATaskManager *)self independentTasks];
  [v13 removeAllObjects];

  uint64_t v14 = [(DATaskManager *)self heldIndependentTasks];
  [v14 removeAllObjects];

  __int16 v15 = [(DATaskManager *)self modalHeldIndependentTasks];
  [v15 removeAllObjects];

  [(NSMutableArray *)self->_queuedIndependentTasks removeAllObjects];
  id v16 = [(DATaskManager *)self mQueuedTasks];
  [v16 removeAllObjects];

  [(DATaskManager *)self setActiveQueuedTask:0];
  [(DATaskManager *)self setModalHeldActiveQueuedTask:0];
  __int16 v17 = [(DATaskManager *)self queuedModalTasks];
  [v17 removeAllObjects];

  [(DATaskManager *)self setActiveModalTask:0];
}

- (void)_retainPowerAssertionForTask:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v13 = v4;
    uint64_t v5 = [(DATaskManager *)self account];

    if (v5)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (v7 = [v13 shouldHoldPowerAssertion], uint64_t v6 = v13, v7))
      {
        os_log_type_t v8 = [(DATaskManager *)self powerAssertionGroupID];
        uint64_t v9 = v8;
        if (v8)
        {
          id v10 = v8;
        }
        else
        {
          uint64_t v11 = [(DATaskManager *)self account];
          id v10 = [v11 persistentUUID];
        }
        os_log_type_t v12 = +[DAPowerAssertionManager sharedPowerAssertionManager];
        [v12 retainPowerAssertion:v13 withGroupIdentifier:v10];
      }
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)_releasePowerAssertionForTask:(id)a3
{
  id v3 = a3;
  if (v3 && ((objc_opt_respondsToSelector() & 1) == 0 || [v3 shouldHoldPowerAssertion]))
  {
    dispatch_time_t v4 = dispatch_time(0, 1000000000);
    uint64_t v5 = dataaccess_get_global_queue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__DATaskManager__releasePowerAssertionForTask___block_invoke;
    block[3] = &unk_1E6211630;
    id v7 = v3;
    dispatch_after(v4, v5, block);
  }
}

void __47__DATaskManager__releasePowerAssertionForTask___block_invoke(uint64_t a1)
{
  id v2 = +[DAPowerAssertionManager sharedPowerAssertionManager];
  [v2 releasePowerAssertion:*(void *)(a1 + 32)];
}

- (NSMutableArray)queuedExclusiveTasks
{
  queuedExclusiveTasks = self->_queuedExclusiveTasks;
  if (!queuedExclusiveTasks)
  {
    dispatch_time_t v4 = (NSMutableArray *)objc_opt_new();
    uint64_t v5 = self->_queuedExclusiveTasks;
    self->_queuedExclusiveTasks = v4;

    queuedExclusiveTasks = self->_queuedExclusiveTasks;
  }
  return queuedExclusiveTasks;
}

- (NSMutableSet)independentTasks
{
  independentTasks = self->_independentTasks;
  if (!independentTasks)
  {
    dispatch_time_t v4 = (NSMutableSet *)objc_opt_new();
    uint64_t v5 = self->_independentTasks;
    self->_independentTasks = v4;

    independentTasks = self->_independentTasks;
  }
  return independentTasks;
}

- (NSMutableSet)heldIndependentTasks
{
  heldIndependentTasks = self->_heldIndependentTasks;
  if (!heldIndependentTasks)
  {
    dispatch_time_t v4 = (NSMutableSet *)objc_opt_new();
    uint64_t v5 = self->_heldIndependentTasks;
    self->_heldIndependentTasks = v4;

    heldIndependentTasks = self->_heldIndependentTasks;
  }
  return heldIndependentTasks;
}

- (NSMutableSet)modalHeldIndependentTasks
{
  modalHeldIndependentTasks = self->_modalHeldIndependentTasks;
  if (!modalHeldIndependentTasks)
  {
    dispatch_time_t v4 = (NSMutableSet *)objc_opt_new();
    uint64_t v5 = self->_modalHeldIndependentTasks;
    self->_modalHeldIndependentTasks = v4;

    modalHeldIndependentTasks = self->_modalHeldIndependentTasks;
  }
  return modalHeldIndependentTasks;
}

- (NSMutableArray)queuedIndependentTasks
{
  queuedIndependentTasks = self->_queuedIndependentTasks;
  if (!queuedIndependentTasks)
  {
    dispatch_time_t v4 = (NSMutableArray *)objc_opt_new();
    uint64_t v5 = self->_queuedIndependentTasks;
    self->_queuedIndependentTasks = v4;

    queuedIndependentTasks = self->_queuedIndependentTasks;
  }
  return queuedIndependentTasks;
}

- (NSMutableArray)mQueuedTasks
{
  mQueuedTasks = self->_mQueuedTasks;
  if (!mQueuedTasks)
  {
    dispatch_time_t v4 = (NSMutableArray *)objc_opt_new();
    uint64_t v5 = self->_mQueuedTasks;
    self->_mQueuedTasks = v4;

    mQueuedTasks = self->_mQueuedTasks;
  }
  return mQueuedTasks;
}

- (NSMutableArray)queuedModalTasks
{
  queuedModalTasks = self->_queuedModalTasks;
  if (!queuedModalTasks)
  {
    dispatch_time_t v4 = (NSMutableArray *)objc_opt_new();
    uint64_t v5 = self->_queuedModalTasks;
    self->_queuedModalTasks = v4;

    queuedModalTasks = self->_queuedModalTasks;
  }
  return queuedModalTasks;
}

- (DAAccount)account
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_account);
  return (DAAccount *)WeakRetained;
}

- (void)setAccount:(id)a3
{
}

- (DATask)activeModalTask
{
  return self->_activeModalTask;
}

- (void)setActiveModalTask:(id)a3
{
}

- (DATask)activeQueuedTask
{
  return self->_activeQueuedTask;
}

- (void)setActiveQueuedTask:(id)a3
{
}

- (NSString)powerAssertionGroupID
{
  return self->_powerAssertionGroupID;
}

- (void)setPowerAssertionGroupID:(id)a3
{
}

- (unint64_t)maxConcurrentIndependentTasks
{
  return self->_maxConcurrentIndependentTasks;
}

- (void)setMaxConcurrentIndependentTasks:(unint64_t)a3
{
  self->_maxConcurrentIndependentTasks = a3;
}

- (void)setQueuedExclusiveTasks:(id)a3
{
}

- (DATask)activeExclusiveTask
{
  return self->_activeExclusiveTask;
}

- (void)setActiveExclusiveTask:(id)a3
{
}

- (void)setIndependentTasks:(id)a3
{
}

- (void)setQueuedIndependentTasks:(id)a3
{
}

- (void)setHeldIndependentTasks:(id)a3
{
}

- (void)setModalHeldIndependentTasks:(id)a3
{
}

- (void)setMQueuedTasks:(id)a3
{
}

- (DATask)modalHeldActiveQueuedTask
{
  return self->_modalHeldActiveQueuedTask;
}

- (void)setModalHeldActiveQueuedTask:(id)a3
{
}

- (void)setQueuedModalTasks:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSTimer)managerIdleTimer
{
  return self->_managerIdleTimer;
}

- (void)setManagerIdleTimer:(id)a3
{
}

- (NSTimer)userInitiatedSyncTimer
{
  return self->_userInitiatedSyncTimer;
}

- (void)setUserInitiatedSyncTimer:(id)a3
{
}

- (NSTimer)xpcTransactionTimer
{
  return self->_xpcTransactionTimer;
}

- (void)setXpcTransactionTimer:(id)a3
{
}

- (NSTimer)powerLogIdleTimer
{
  return self->_powerLogIdleTimer;
}

- (void)setPowerLogIdleTimer:(id)a3
{
}

- (BOOL)didLogSyncStart
{
  return self->_didLogSyncStart;
}

- (void)setDidLogSyncStart:(BOOL)a3
{
  self->_didLogSyncStart = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLogIdleTimer, 0);
  objc_storeStrong((id *)&self->_xpcTransactionTimer, 0);
  objc_storeStrong((id *)&self->_userInitiatedSyncTimer, 0);
  objc_storeStrong((id *)&self->_managerIdleTimer, 0);
  objc_storeStrong((id *)&self->_queuedModalTasks, 0);
  objc_storeStrong((id *)&self->_modalHeldActiveQueuedTask, 0);
  objc_storeStrong((id *)&self->_mQueuedTasks, 0);
  objc_storeStrong((id *)&self->_modalHeldIndependentTasks, 0);
  objc_storeStrong((id *)&self->_heldIndependentTasks, 0);
  objc_storeStrong((id *)&self->_queuedIndependentTasks, 0);
  objc_storeStrong((id *)&self->_independentTasks, 0);
  objc_storeStrong((id *)&self->_activeExclusiveTask, 0);
  objc_storeStrong((id *)&self->_queuedExclusiveTasks, 0);
  objc_storeStrong((id *)&self->_powerAssertionGroupID, 0);
  objc_storeStrong((id *)&self->_activeQueuedTask, 0);
  objc_storeStrong((id *)&self->_activeModalTask, 0);
  objc_destroyWeak((id *)&self->_account);
  objc_storeStrong((id *)&self->_daActivity, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end