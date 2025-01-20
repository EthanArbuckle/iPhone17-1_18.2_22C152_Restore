@interface HMDHAPAccessoryLocalOperationTask
- (NSDictionary)logEvents;
- (NSString)activityRequestEventName;
- (NSString)activityResponseEventName;
- (id)_completionHandlerForAccessory:(id)a3 accessoryRequests:(id)a4 responseWaitGroup:(id)a5;
- (void)_dispatchToAccessory:(id)a3 requests:(id)a4 logEvent:(id)a5 completion:(id)a6;
- (void)execute;
- (void)setLogEvents:(id)a3;
@end

@implementation HMDHAPAccessoryLocalOperationTask

- (void).cxx_destruct
{
}

- (void)setLogEvents:(id)a3
{
}

- (NSDictionary)logEvents
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)_dispatchToAccessory:(id)a3 requests:(id)a4 logEvent:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v15 = *MEMORY[0x1E4F1C3B8];
  v16 = NSString;
  v17 = NSStringFromSelector(a2);
  v18 = [v16 stringWithFormat:@"%@ is unavailable", v17];
  id v19 = [v14 exceptionWithName:v15 reason:v18 userInfo:0];

  objc_exception_throw(v19);
}

- (NSString)activityResponseEventName
{
  v2 = NSString;
  v3 = [(HMDHAPAccessoryTask *)self operationName];
  v4 = [v3 capitalizedString];
  v5 = [v2 stringWithFormat:@"HMDHAPAccessoryLocalOperationTask.MultiCharacteristic%@Response", v4];

  return (NSString *)v5;
}

- (NSString)activityRequestEventName
{
  v2 = NSString;
  v3 = [(HMDHAPAccessoryTask *)self operationName];
  v4 = [v3 capitalizedString];
  v5 = [v2 stringWithFormat:@"HMDHAPAccessoryLocalOperationTask.MultiCharacteristic%@Accessory", v4];

  return (NSString *)v5;
}

- (id)_completionHandlerForAccessory:(id)a3 accessoryRequests:(id)a4 responseWaitGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __104__HMDHAPAccessoryLocalOperationTask__completionHandlerForAccessory_accessoryRequests_responseWaitGroup___block_invoke;
  v16[3] = &unk_1E6A19020;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  v14 = _Block_copy(v16);

  return v14;
}

void __104__HMDHAPAccessoryLocalOperationTask__completionHandlerForAccessory_accessoryRequests_responseWaitGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v50 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v29;
    do
    {
      uint64_t v8 = 0;
      id v9 = v6;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = [*(id *)(*((void *)&v28 + 1) + 8 * v8) error];
        id v11 = (void *)v10;
        if (v10) {
          id v12 = (void *)v10;
        }
        else {
          id v12 = v9;
        }
        id v6 = v12;

        id v13 = [*(id *)(a1 + 32) activity];
        [*(id *)(a1 + 32) activityResponseEventName];

        [*(id *)(a1 + 40) uuid];
        [v11 domain];

        [v11 code];
        ++v8;
        id v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v28 objects:v50 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = *(id *)(a1 + 32);
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = HMFGetLogIdentifier();
    uint64_t v18 = *(void *)(a1 + 32);
    v25 = [*(id *)(a1 + 40) name];
    v26 = [*(id *)(a1 + 40) uuid];
    id v19 = [v26 UUIDString];
    [*(id *)(a1 + 40) uniqueIdentifier];
    v20 = v27 = v14;
    uint64_t v24 = [v3 count];
    uint64_t v21 = [*(id *)(a1 + 48) count];
    [*(id *)(a1 + 32) executionTimeInterval];
    *(_DWORD *)buf = 138545410;
    v33 = v17;
    __int16 v34 = 2114;
    uint64_t v35 = v18;
    __int16 v36 = 2112;
    v37 = v25;
    __int16 v38 = 2114;
    v39 = v19;
    __int16 v40 = 2114;
    v41 = v20;
    __int16 v42 = 2048;
    uint64_t v43 = v24;
    __int16 v44 = 2048;
    uint64_t v45 = v21;
    __int16 v46 = 2048;
    uint64_t v47 = v22;
    __int16 v48 = 2114;
    id v49 = v6;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Completed operation for accessory %@/%{public}@/%{public}@ with %ld/%ld responses. Execution Time: %.3fs. Error: %{public}@", buf, 0x5Cu);

    v14 = v27;
  }

  [*(id *)(a1 + 32) addCharacteristicResponses:v3 isRemote:0];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  if ([*(id *)(a1 + 32) supportsMultiPartResponse])
  {
    v23 = [*(id *)(a1 + 32) completion];
    ((void (**)(void, id))v23)[2](v23, v3);
  }
}

- (void)execute
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(HMDHAPAccessoryTask *)self setExecutionTime:v3];

  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [(HMDHAPAccessoryTask *)self requests];
  __int16 v36 = self;
  id v6 = [(HMDHAPAccessoryTask *)self context];
  uint64_t v7 = [v6 user];
  long long v31 = v4;
  uint64_t v8 = accessoryRequestMapFromRequests(v5, v4, v7);

  group = dispatch_group_create();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v8;
  uint64_t v35 = [obj countByEnumeratingWithState:&v39 objects:v55 count:16];
  if (v35)
  {
    uint64_t v33 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v40 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v11 = [obj objectForKey:v10];
        id v12 = [(HMDHAPAccessoryTask *)v36 activity];
        id v13 = [(HMDHAPAccessoryTask *)v36 operationName];
        v14 = [v10 shortDescription];
        [v12 markWithFormat:@"Starting %@ for accessory: %@", v13, v14];

        id v15 = (void *)MEMORY[0x1D9452090]();
        v16 = v36;
        id v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = HMFGetLogIdentifier();
          id v19 = [v10 name];
          v20 = [v10 uuid];
          [v20 UUIDString];
          uint64_t v21 = v32 = v15;
          uint64_t v22 = [v10 uniqueIdentifier];
          uint64_t v23 = [v11 count];
          *(_DWORD *)buf = 138544642;
          __int16 v44 = v18;
          __int16 v45 = 2114;
          __int16 v46 = v36;
          __int16 v47 = 2112;
          __int16 v48 = v19;
          __int16 v49 = 2114;
          v50 = v21;
          __int16 v51 = 2114;
          v52 = v22;
          __int16 v53 = 2048;
          uint64_t v54 = v23;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Starting for accessory %@/%{public}@/%{public}@ with %ld requests", buf, 0x3Eu);

          id v15 = v32;
        }

        uint64_t v24 = [(HMDHAPAccessoryTask *)v16 activity];
        [(HMDHAPAccessoryLocalOperationTask *)v16 activityRequestEventName];

        [(HMDHAPAccessoryTask *)v16 operationName];
        [v10 uuid];

        [v11 count];
        v25 = [(HMDHAPAccessoryLocalOperationTask *)v16 logEvents];
        v26 = [v10 uuid];
        v27 = [v26 UUIDString];
        long long v28 = [v25 objectForKeyedSubscript:v27];

        dispatch_group_enter(group);
        long long v29 = [(HMDHAPAccessoryLocalOperationTask *)v16 _completionHandlerForAccessory:v10 accessoryRequests:v11 responseWaitGroup:group];
        [(HMDHAPAccessoryLocalOperationTask *)v16 _dispatchToAccessory:v10 requests:v11 logEvent:v28 completion:v29];
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v39 objects:v55 count:16];
    }
    while (v35);
  }

  [(HMDHAPAccessoryTask *)v36 addCharacteristicResponses:v31 isRemote:0];
  long long v30 = [(HMDHAPAccessoryTask *)v36 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HMDHAPAccessoryLocalOperationTask_execute__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = v36;
  dispatch_group_notify(group, v30, block);
}

void __44__HMDHAPAccessoryLocalOperationTask_execute__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) supportsMultiPartResponse] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) completion];
    v2 = [*(id *)(a1 + 32) characteristicResponses];
    v3[2](v3, v2);
  }
}

@end