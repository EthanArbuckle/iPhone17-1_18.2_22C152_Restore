@interface HMDHomeAssistantOperation
+ (id)homeAssistantOperationWithActionSet:(id)a3 queue:(id)a4;
+ (id)homeAssistantOperationWithReadRequests:(id)a3 queue:(id)a4;
+ (id)homeAssistantOperationWithWriteRequests:(id)a3 queue:(id)a4;
- (id)initWithAccessories:(void *)a3 queue:;
- (uint64_t)_testForReachability;
- (void)_callCompletion;
- (void)dealloc;
- (void)handleAccessoryIsReachable:(id)a3;
- (void)startWithCompletion:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDHomeAssistantOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_reachableAccessoriesToOperateOn, 0);
  objc_storeStrong((id *)&self->_accessoriesToOperateOn, 0);
  objc_storeStrong((id *)&self->_accessoryConnectivityWaitTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)startWithCompletion:(id)a3
{
  id v4 = a3;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__HMDHomeAssistantOperation_startWithCompletion___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __49__HMDHomeAssistantOperation_startWithCompletion___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_setProperty_nonatomic_copy(v4, a2, v3, 48);
      id v4 = *(void **)(a1 + 32);
    }
    int v5 = -[HMDHomeAssistantOperation _testForReachability]((uint64_t)v4);
    id v6 = (void *)MEMORY[0x1D9452090]();
    v7 = HMFGetOSLogHandle();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v8)
      {
        v9 = HMFGetLogIdentifier();
        uint64_t v10 = *(void *)(a1 + 32);
        int v19 = 138543618;
        v20 = v9;
        __int16 v21 = 2112;
        uint64_t v22 = v10;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@[%@] Reachability test has passed, calling completion right away", (uint8_t *)&v19, 0x16u);
      }
      -[HMDHomeAssistantOperation _callCompletion](*(void *)(a1 + 32));
    }
    else
    {
      if (v8)
      {
        v15 = HMFGetLogIdentifier();
        uint64_t v16 = *(void *)(a1 + 32);
        int v19 = 138543618;
        v20 = v15;
        __int16 v21 = 2112;
        uint64_t v22 = v16;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@[%@] Reachability test did not pass, starting accessory connectivity timer", (uint8_t *)&v19, 0x16u);
      }
      uint64_t v17 = *(void *)(a1 + 32);
      if (v17) {
        v18 = *(void **)(v17 + 24);
      }
      else {
        v18 = 0;
      }
      [v18 resume];
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 32);
      int v19 = 138543618;
      v20 = v13;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@[%@] Did not receive completion handler, cannot perform operation", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (uint64_t)_testForReachability
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 count];
    uint64_t v1 = v3 == [*(id *)(v1 + 32) count];
  }
  return v1;
}

- (void)_callCompletion
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 8))
    {
      id v2 = (void *)MEMORY[0x1D9452090]();
      uint64_t v3 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        id v4 = HMFGetLogIdentifier();
        int v6 = 138543618;
        v7 = v4;
        __int16 v8 = 2112;
        uint64_t v9 = a1;
        _os_log_impl(&dword_1D49D5000, v3, OS_LOG_TYPE_INFO, "%{public}@[%@] Completion handler has already been called", (uint8_t *)&v6, 0x16u);
      }
    }
    else
    {
      [*(id *)(a1 + 24) suspend];
      *(unsigned char *)(a1 + 8) = 1;
      int v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      v5();
    }
  }
}

- (void)timerDidFire:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (HMFTimer *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    accessoryConnectivityWaitTimer = self->_accessoryConnectivityWaitTimer;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    accessoryConnectivityWaitTimer = 0;
  }
  if (accessoryConnectivityWaitTimer == v4)
  {
    int v6 = (void *)MEMORY[0x1D9452090]();
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      __int16 v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      v12 = self;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@[%@] Accessory connectivity wait timer has fired", (uint8_t *)&v9, 0x16u);
    }
    -[HMDHomeAssistantOperation _callCompletion]((uint64_t)self);
  }
}

- (void)handleAccessoryIsReachable:(id)a3
{
  id v4 = a3;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HMDHomeAssistantOperation_handleAccessoryIsReachable___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __56__HMDHomeAssistantOperation_handleAccessoryIsReachable___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = v3 ? *(void **)(v3 + 40) : 0;
    [v4 addObject:v2];
    if (-[HMDHomeAssistantOperation _testForReachability](*(void *)(a1 + 40)))
    {
      int v5 = (void *)MEMORY[0x1D9452090]();
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = HMFGetLogIdentifier();
        uint64_t v8 = *(void *)(a1 + 40);
        int v9 = [v2 uuid];
        uint64_t v10 = [v9 UUIDString];
        int v11 = 138543874;
        v12 = v7;
        __int16 v13 = 2112;
        uint64_t v14 = v8;
        __int16 v15 = 2112;
        uint64_t v16 = v10;
        _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@[%@] Accessory %@ is reachable, reachability test has passed, calling completion right away", (uint8_t *)&v11, 0x20u);
      }
      -[HMDHomeAssistantOperation _callCompletion](*(void *)(a1 + 40));
    }
  }
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDHomeAssistantOperation;
  [(HMDHomeAssistantOperation *)&v4 dealloc];
}

+ (id)homeAssistantOperationWithActionSet:(id)a3 queue:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v41 = a4;
  id v6 = [MEMORY[0x1E4F1CA80] set];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v42 = v5;
  v7 = [v5 actions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v51;
    v43 = v7;
    uint64_t v44 = *(void *)v51;
LABEL_3:
    uint64_t v11 = 0;
    while (2)
    {
      if (*(void *)v51 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v50 + 1) + 8 * v11);
      switch([v12 type])
      {
        case 0:
          id v13 = v12;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v14 = v13;
          }
          else {
            uint64_t v14 = 0;
          }
          id v15 = v14;

          if (v15)
          {
            uint64_t v16 = [v15 characteristic];
            goto LABEL_17;
          }
          v32 = (void *)MEMORY[0x1D9452090]();
          id v33 = a1;
          v34 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v35 = HMFGetLogIdentifier();
            v36 = HMActionTypeAsString();
            *(_DWORD *)buf = 138543874;
            v56 = v35;
            __int16 v57 = 2112;
            id v58 = v13;
            __int16 v59 = 2112;
            v60 = v36;
            _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

            uint64_t v10 = v44;
          }
          goto LABEL_41;
        case 1:
          id v17 = v12;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v21 = v17;
          }
          else {
            __int16 v21 = 0;
          }
          id v15 = v21;

          if (v15)
          {
            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v22 = [v15 mediaProfiles];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v54 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v47;
              do
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v47 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  v27 = [*(id *)(*((void *)&v46 + 1) + 8 * i) accessory];
                  [v6 addObject:v27];
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v46 objects:v54 count:16];
              }
              while (v24);
            }

            uint64_t v10 = v44;
            goto LABEL_42;
          }
          v32 = (void *)MEMORY[0x1D9452090]();
          id v33 = a1;
          v34 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            goto LABEL_41;
          }
          goto LABEL_40;
        case 3:
          id v17 = v12;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v18 = v17;
          }
          else {
            v18 = 0;
          }
          id v15 = v18;

          if (v15)
          {
            uint64_t v16 = [v15 lightProfile];
LABEL_17:
            int v19 = v16;
            v20 = [v16 accessory];

            if (v20) {
              [v6 addObject:v20];
            }
          }
          else
          {
            v32 = (void *)MEMORY[0x1D9452090]();
            id v33 = a1;
            v34 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
LABEL_40:
              v37 = HMFGetLogIdentifier();
              v38 = HMActionTypeAsString();
              *(_DWORD *)buf = 138543874;
              v56 = v37;
              __int16 v57 = 2112;
              id v58 = v17;
              __int16 v59 = 2112;
              v60 = v38;
              _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

              uint64_t v10 = v44;
            }
LABEL_41:

            v7 = v43;
          }
LABEL_42:

LABEL_43:
          if (++v11 != v9) {
            continue;
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v50 objects:v61 count:16];
          if (!v9) {
            goto LABEL_45;
          }
          goto LABEL_3;
        case 5:
          v28 = (void *)MEMORY[0x1D9452090]();
          id v29 = a1;
          v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v56 = v31;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Native matter actions are not supported in HH1", buf, 0xCu);
          }
          goto LABEL_43;
        default:
          goto LABEL_43;
      }
    }
  }
LABEL_45:

  v39 = -[HMDHomeAssistantOperation initWithAccessories:queue:]([HMDHomeAssistantOperation alloc], v6, v41);
  return v39;
}

- (id)initWithAccessories:(void *)a3 queue:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (!a1)
  {
    uint64_t v9 = 0;
    goto LABEL_23;
  }
  v47.receiver = a1;
  v47.super_class = (Class)HMDHomeAssistantOperation;
  uint64_t v8 = (id *)objc_msgSendSuper2(&v47, sel_init);
  uint64_t v9 = v8;
  if (v8)
  {
    id v38 = v7;
    objc_storeStrong(v8 + 2, a3);
    id v10 = objc_alloc(MEMORY[0x1E4F65580]);
    uint64_t v11 = [v10 initWithTimeInterval:0 options:*(double *)&accessoryConnectivityWaitPeriod];
    id v12 = v9[3];
    v9[3] = (id)v11;

    [v9[3] setDelegate:v9];
    [v9[3] setDelegateQueue:v9[2]];
    objc_storeStrong(v9 + 4, a2);
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
    id v14 = v9[5];
    v9[5] = (id)v13;

    *((unsigned char *)v9 + 8) = 0;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v39 = v6;
    id v15 = v6;
    uint64_t v16 = &OBJC_IVAR___HMDAppleAccountManager__accountChangeObserver;
    id v17 = v15;
    uint64_t v18 = [v15 countByEnumeratingWithState:&v43 objects:v56 count:16];
    if (!v18) {
      goto LABEL_20;
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v44;
    v40 = v9;
    id v42 = v17;
    while (1)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v44 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v38);
        [v23 addObserver:v9 selector:sel_handleAccessoryIsReachable_ name:@"HMDAccessoryIsReachableNotification" object:v22];

        id v24 = v22;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v25 = v24;
        }
        else {
          uint64_t v25 = 0;
        }
        id v26 = v25;

        if ([v26 isReachable]) {
          goto LABEL_12;
        }
        if ([v26 isPrimary] && objc_msgSend(v26, "hasBTLELink"))
        {
          v27 = (void *)MEMORY[0x1D9452090]();
          v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v29 = v41 = v27;
            v30 = [v24 uuid];
            v31 = [v30 UUIDString];
            *(_DWORD *)buf = 138543618;
            long long v49 = v29;
            __int16 v50 = 2112;
            long long v51 = v31;
            _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Assuming reachability for primary BTLE accessory %@", buf, 0x16u);

            uint64_t v9 = v40;
            uint64_t v16 = &OBJC_IVAR___HMDAppleAccountManager__accountChangeObserver;

            v27 = v41;
          }

          id v17 = v42;
LABEL_12:
          [*(id *)((char *)v9 + v16[127]) addObject:v24];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v56 count:16];
      if (!v19)
      {
LABEL_20:

        v32 = (void *)MEMORY[0x1D9452090]();
        id v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v34 = HMFGetLogIdentifier();
          uint64_t v35 = [v9[4] count];
          uint64_t v36 = [v9[5] count];
          *(_DWORD *)buf = 138544130;
          long long v49 = v34;
          __int16 v50 = 2112;
          long long v51 = v9;
          __int16 v52 = 2048;
          uint64_t v53 = v35;
          __int16 v54 = 2048;
          uint64_t v55 = v36;
          _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@[%@] Need to perform operation on %ld accessories, and reachable accessory count is %ld", buf, 0x2Au);
        }
        id v7 = v38;
        id v6 = v39;
        break;
      }
    }
  }
LABEL_23:

  return v9;
}

+ (id)homeAssistantOperationWithReadRequests:(id)a3 queue:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "characteristic", (void)v17);
        id v14 = [v13 accessory];

        if (v14) {
          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  id v15 = -[HMDHomeAssistantOperation initWithAccessories:queue:]([HMDHomeAssistantOperation alloc], v7, v6);
  return v15;
}

+ (id)homeAssistantOperationWithWriteRequests:(id)a3 queue:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "characteristic", (void)v17);
        id v14 = [v13 accessory];

        if (v14) {
          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  id v15 = -[HMDHomeAssistantOperation initWithAccessories:queue:]([HMDHomeAssistantOperation alloc], v7, v6);
  return v15;
}

@end