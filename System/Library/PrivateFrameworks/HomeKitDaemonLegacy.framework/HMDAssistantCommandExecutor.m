@interface HMDAssistantCommandExecutor
+ (id)executorWithCommand:(id)a3 workQueue:(id)a4 messageDispatcher:(id)a5;
- (BOOL)_initialCommandIsMultipleActions;
- (HMDAssistantCommandExecutor)initWithCommand:(id)a3 workQueue:(id)a4 messageDispatcher:(id)a5;
- (id)_command;
- (void)_executeCommand:(id *)a1;
- (void)_sendResponse:(uint64_t)a1;
- (void)performWithCompletion:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDAssistantCommandExecutor

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_executionTimer, 0);
  objc_storeStrong((id *)&self->_clientValidity, 0);
  objc_storeStrong((id *)&self->_pendingCommands, 0);
  objc_storeStrong((id *)&self->_actionResults, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_initialCommand, 0);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = (HMFTimer *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    executionTimer = self->_executionTimer;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    executionTimer = 0;
  }
  if (executionTimer == v4)
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Timer expired - reporting results", buf, 0xCu);
    }
    if (self)
    {
      [(HMFTimer *)v7->_executionTimer suspend];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      pendingCommands = v7->_pendingCommands;
    }
    else
    {
      [0 suspend];
      pendingCommands = 0;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
    }
    v11 = pendingCommands;
    uint64_t v12 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          if (self) {
            v16 = v7->_pendingCommands;
          }
          else {
            v16 = 0;
          }
          v17 = -[NSMutableDictionary objectForKey:](v16, "objectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * v15), (void)v19);
          [v17 timeoutAndReportResults];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v18 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v13 = v18;
      }
      while (v18);
    }
  }
}

- (id)_command
{
  v2 = objc_alloc_init(HMDAssistantCommand);
  return v2;
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id newValue = a3;
  if (!self)
  {
    dispatch_assert_queue_V2(0);
    goto LABEL_50;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (self->_executionTimer)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__HMDAssistantCommandExecutor_performWithCompletion___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v74 = newValue;
    dispatch_async(workQueue, block);

    goto LABEL_50;
  }
  objc_setProperty_nonatomic_copy(self, v4, newValue, 64);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v6 = [(HMDAssistantCommand *)self->_initialCommand commandTimeout];
  [v6 doubleValue];
  double v8 = v7 / 1000.0;

  if (v8 + -2.0 < 3.0)
  {
    v9 = (void *)MEMORY[0x1D9452090](v8 + -2.0);
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = self->_initialCommand;
      uint64_t v14 = [(HMDAssistantCommand *)v13 timeout];
      *(_DWORD *)buf = 138543618;
      v88 = v12;
      __int16 v89 = 2112;
      v90 = v14;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Timeout %@ specified by Siri Command is below threshold, falling back to default timeout", buf, 0x16u);
    }
    double v8 = *(double *)&assistantClientReadWriteTimeoutSeconds;
  }
  uint64_t v15 = (HMFTimer *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:19 options:v8];
  executionTimer = self->_executionTimer;
  self->_executionTimer = v15;

  [(HMFTimer *)self->_executionTimer setDelegate:self];
  v17 = self->_executionTimer;
  uint64_t v18 = self->_workQueue;
  [(HMFTimer *)v17 setDelegateQueue:v18];

  [(HMFTimer *)self->_executionTimer resume];
  long long v19 = self->_initialCommand;
  long long v20 = [(HMDAssistantCommand *)v19 actionRequests];
  if ([v20 count])
  {
  }
  else
  {
    long long v21 = [(HMDAssistantCommand *)self->_initialCommand actions];
    uint64_t v22 = [v21 count];

    if (!v22)
    {
      v54 = (void *)MEMORY[0x1D9452090]();
      v55 = self;
      v56 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        v57 = HMFGetLogIdentifier();
        *(_DWORD *)v91 = 138543362;
        v92 = v57;
        _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_INFO, "%{public}@No actions to perform", v91, 0xCu);
      }
LABEL_48:
      dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
      id v35 = objc_alloc_init(MEMORY[0x1E4F96680]);
      [v35 setCommandOutcome:*MEMORY[0x1E4F96EB8]];
      v58 = [(HMDAssistantCommand *)self->_initialCommand serverValidity];
      [v35 setServerValidity:v58];

      v59 = [v35 dictionary];
      -[HMDAssistantCommandExecutor _sendResponse:]((uint64_t)self, v59);

      goto LABEL_49;
    }
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v23 = [(HMDAssistantCommand *)self->_initialCommand actionRequests];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v79 objects:buf count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v80 != v25) {
          objc_enumerationMutation(v23);
        }
        v27 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        v28 = [v27 actions];
        uint64_t v29 = [v28 countByEnumeratingWithState:&v75 objects:v86 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v76;
          while (2)
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v76 != v30) {
                objc_enumerationMutation(v28);
              }
              v32 = [*(id *)(*((void *)&v75 + 1) + 8 * j) aceId];
              BOOL v33 = v32 == 0;

              if (v33)
              {

                goto LABEL_48;
              }
            }
            uint64_t v29 = [v28 countByEnumeratingWithState:&v75 objects:v86 count:16];
            if (v29) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v79 objects:buf count:16];
    }
    while (v24);

    if (!-[HMDAssistantCommandExecutor _initialCommandIsMultipleActions]((uint64_t)self)) {
      goto LABEL_27;
    }
  }
  else
  {

    if (!-[HMDAssistantCommandExecutor _initialCommandIsMultipleActions]((uint64_t)self))
    {
LABEL_27:
      v34 = [(HMDAssistantCommand *)self->_initialCommand actions];
      id v35 = [v34 firstObject];

      v36 = self->_initialCommand;
      v37 = self->_pendingCommands;
      v38 = [v35 aceId];
      [(NSMutableDictionary *)v37 setObject:v36 forKeyedSubscript:v38];

      -[HMDAssistantCommandExecutor _executeCommand:]((id *)&self->super.isa, self->_initialCommand);
LABEL_49:

      goto LABEL_50;
    }
  }
  v39 = [(HMDAssistantCommand *)self->_initialCommand homeManager];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = [(HMDAssistantCommand *)self->_initialCommand actionRequests];
  uint64_t v63 = [obj countByEnumeratingWithState:&v69 objects:v85 count:16];
  if (v63)
  {
    uint64_t v62 = *(void *)v70;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v70 != v62)
        {
          uint64_t v41 = v40;
          objc_enumerationMutation(obj);
          uint64_t v40 = v41;
        }
        uint64_t v64 = v40;
        v42 = *(void **)(*((void *)&v69 + 1) + 8 * v40);
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        v43 = [v42 actions];
        uint64_t v44 = [v43 countByEnumeratingWithState:&v65 objects:v84 count:16];
        if (v44)
        {
          uint64_t v45 = *(void *)v66;
          do
          {
            for (uint64_t k = 0; k != v44; ++k)
            {
              if (*(void *)v66 != v45) {
                objc_enumerationMutation(v43);
              }
              v47 = *(void **)(*((void *)&v65 + 1) + 8 * k);
              v48 = [(HMDAssistantCommandExecutor *)self _command];
              v49 = [(HMDAssistantCommand *)self->_initialCommand serverValidity];
              [v48 setServerValidity:v49];

              v50 = [v42 filter];
              [v48 setFilter:v50];

              v83 = v47;
              v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
              [v48 setActions:v51];

              [v48 setHomeManager:v39];
              v52 = self->_pendingCommands;
              v53 = [v47 aceId];
              [(NSMutableDictionary *)v52 setObject:v48 forKeyedSubscript:v53];

              -[HMDAssistantCommandExecutor _executeCommand:]((id *)&self->super.isa, v48);
            }
            uint64_t v44 = [v43 countByEnumeratingWithState:&v65 objects:v84 count:16];
          }
          while (v44);
        }

        uint64_t v40 = v64 + 1;
      }
      while (v64 + 1 != v63);
      uint64_t v63 = [obj countByEnumeratingWithState:&v69 objects:v85 count:16];
    }
    while (v63);
  }

LABEL_50:
}

void __53__HMDAssistantCommandExecutor_performWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (BOOL)_initialCommandIsMultipleActions
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [*(id *)(a1 + 8) actions];
  BOOL v2 = [v1 count] == 0;

  return v2;
}

- (void)_executeCommand:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    id v4 = a1[1];
    v5 = [v4 homeManager];
    v6 = [v5 gatherer];
    id v7 = a1[3];
    id v8 = a1[2];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__HMDAssistantCommandExecutor__executeCommand___block_invoke;
    v9[3] = &unk_1E6A0DF08;
    objc_copyWeak(&v11, &location);
    id v10 = v3;
    [v10 performWithGather:v6 queue:v7 msgDispatcher:v8 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __47__HMDAssistantCommandExecutor__executeCommand___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[3]);
    v6 = [*(id *)(a1 + 32) actions];
    id v7 = [v6 firstObject];
    id v8 = [v7 aceId];

    uint64_t v9 = [*(id *)(v5 + 40) removeObjectForKey:v8];
    if (!v3)
    {
      id v10 = (void *)MEMORY[0x1D9452090](v9);
      id v11 = (id)v5;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        int v30 = 138543618;
        v31 = v13;
        __int16 v32 = 2112;
        BOOL v33 = v8;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Nil response for action %@", (uint8_t *)&v30, 0x16u);
      }
    }
    if (-[HMDAssistantCommandExecutor _initialCommandIsMultipleActions](v5))
    {
      uint64_t v14 = *(void **)(a1 + 32);
      id v15 = v3;
      id v16 = v14;
      if (v3)
      {
        v17 = (void *)[objc_alloc(MEMORY[0x1E4F96680]) initWithDictionary:v15];
        uint64_t v18 = [v17 clientValidity];
        long long v19 = *(void **)(v5 + 48);
        *(void *)(v5 + 48) = v18;

        long long v20 = [v17 commandOutcome];
        if (mapToFailureActionOutcome_onceToken != -1) {
          dispatch_once(&mapToFailureActionOutcome_onceToken, &__block_literal_global_88490);
        }
        id v21 = [(id)mapToFailureActionOutcome_outcomeMap objectForKey:v20];

        if (v21)
        {
          uint64_t v22 = failedActionResultFor(v16);
          [v22 setOutcome:v21];
          [*(id *)(v5 + 32) addObject:v22];
        }
        else
        {
          id v23 = *(id *)(v5 + 32);
          uint64_t v22 = [v17 actionResults];
          [v23 addObjectsFromArray:v22];
        }
      }
      else
      {
        id v21 = *(id *)(v5 + 32);
        v17 = failedActionResultFor(v16);
        [v21 addObject:v17];
      }

      if (![*(id *)(v5 + 40) count])
      {
        uint64_t v24 = *(NSObject **)(v5 + 24);
        id v25 = (id)*MEMORY[0x1E4F96EC0];
        dispatch_assert_queue_V2(v24);
        id v26 = objc_alloc_init(MEMORY[0x1E4F96680]);
        [v26 setCommandOutcome:v25];

        v27 = (void *)[*(id *)(v5 + 32) copy];
        [v26 setActionResults:v27];

        v28 = [*(id *)(v5 + 8) serverValidity];
        [v26 setServerValidity:v28];

        [v26 setClientValidity:*(void *)(v5 + 48)];
        uint64_t v29 = [v26 dictionary];
        -[HMDAssistantCommandExecutor _sendResponse:](v5, v29);
      }
    }
    else
    {
      -[HMDAssistantCommandExecutor _sendResponse:](v5, v3);
    }
  }
}

- (void)_sendResponse:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  id v4 = *(void **)(a1 + 64);
  if (v4)
  {
    uint64_t v5 = v4;
    objc_setProperty_nonatomic_copy((id)a1, v6, 0, 64);
    v5[2](v5, v3, 0);
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = (id)a1;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Results already reported for Siri command - aborting report", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (HMDAssistantCommandExecutor)initWithCommand:(id)a3 workQueue:(id)a4 messageDispatcher:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDAssistantCommandExecutor;
  uint64_t v12 = [(HMDAssistantCommandExecutor *)&v19 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_initialCommand, a3);
    objc_storeStrong((id *)&v13->_workQueue, a4);
    objc_storeStrong((id *)&v13->_msgDispatcher, a5);
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    actionResults = v13->_actionResults;
    v13->_actionResults = (NSMutableArray *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingCommands = v13->_pendingCommands;
    v13->_pendingCommands = (NSMutableDictionary *)v16;
  }
  return v13;
}

+ (id)executorWithCommand:(id)a3 workQueue:(id)a4 messageDispatcher:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[HMDAssistantCommandExecutor alloc] initWithCommand:v9 workQueue:v8 messageDispatcher:v7];

  return v10;
}

@end