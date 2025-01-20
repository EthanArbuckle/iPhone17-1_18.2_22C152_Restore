@interface HMDHAPAccessoryPrimaryResidentOperationTask
+ (void)filterAccessoriesByDevicesFromMap:(id)a3 currentDeviceAccessories:(id)a4 otherDeviceAccessories:(id)a5;
- (HMDHAPAccessoryPrimaryResidentOperationTask)initWithContext:(id)a3 requests:(id)a4 completion:(id)a5;
- (HMDHAPAccessoryTask)localTask;
- (NSMutableArray)remoteFallbackTasks;
- (id)_fallbackTaskForDevice:(id)a3;
- (id)_makeLocalTaskWithRequests:(id)a3 completion:(id)a4;
- (id)_makeRemoteWithFallbackTaskWithRequests:(id)a3 delegateDevice:(id)a4 completion:(id)a5;
- (void)_fanOutRemoteRequests:(id)a3 residentToAccessoriesMap:(id)a4 responseWaitGroup:(id)a5;
- (void)_processLocalRequests:(id)a3 responseWaitGroup:(id)a4;
- (void)execute;
- (void)setLocalTask:(id)a3;
- (void)setRemoteFallbackTasks:(id)a3;
@end

@implementation HMDHAPAccessoryPrimaryResidentOperationTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localTask, 0);
  objc_storeStrong((id *)&self->_remoteFallbackTasks, 0);
}

- (void)setLocalTask:(id)a3
{
}

- (HMDHAPAccessoryTask)localTask
{
  return self->_localTask;
}

- (void)setRemoteFallbackTasks:(id)a3
{
}

- (NSMutableArray)remoteFallbackTasks
{
  return self->_remoteFallbackTasks;
}

- (id)_makeLocalTaskWithRequests:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"%@ is unavailable", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (id)_makeRemoteWithFallbackTaskWithRequests:(id)a3 delegateDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v12 = *MEMORY[0x1E4F1C3B8];
  id v13 = NSString;
  v14 = NSStringFromSelector(a2);
  v15 = [v13 stringWithFormat:@"%@ is unavailable", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (id)_fallbackTaskForDevice:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  v5 = v4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(HMDHAPAccessoryPrimaryResidentOperationTask *)self remoteFallbackTasks];
  id v7 = (id)[v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(id *)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v11 = v10;
        }
        else {
          v11 = 0;
        }
        id v12 = v11;

        id v13 = [v12 remoteTask];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v14 = v13;
        }
        else {
          v14 = 0;
        }
        id v15 = v14;

        id v16 = [v15 delegateDevice];
        char v17 = [v16 isEqual:v5];

        if (v17)
        {
          id v7 = v10;

          goto LABEL_18;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v7;
}

- (void)_processLocalRequests:(id)a3 responseWaitGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[v6 mutableCopy];
  id v9 = [MEMORY[0x1E4F1CA48] array];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke;
  v22[3] = &unk_1E6A18E90;
  v22[4] = self;
  migrateRequestsPassingTest(v8, v9, v22);
  if ((objc_msgSend(v9, "hmf_isEmpty") & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4];
    v11 = +[HMDCharacteristicResponse responsesWithRequests:v9 error:v10];

    id v12 = [(HMDHAPAccessoryTask *)self completion];
    ((void (**)(void, void *))v12)[2](v12, v11);
  }
  if ((objc_msgSend(v8, "hmf_isEmpty") & 1) == 0)
  {
    dispatch_group_enter(v7);
    objc_initWeak(&location, self);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    char v17 = __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke_428;
    v18 = &unk_1E6A191F8;
    objc_copyWeak(&v20, &location);
    long long v19 = v7;
    id v13 = [(HMDHAPAccessoryPrimaryResidentOperationTask *)self _makeLocalTaskWithRequests:v8 completion:&v15];
    -[HMDHAPAccessoryPrimaryResidentOperationTask setLocalTask:](self, "setLocalTask:", v13, v15, v16, v17, v18);

    v14 = [(HMDHAPAccessoryPrimaryResidentOperationTask *)self localTask];
    [v14 execute];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

uint64_t __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) context];
  v5 = [v4 requestMessage];

  id v6 = [v3 accessory];
  if ([v5 isRemote]
    && [v6 hasBTLELink]
    && ([v6 hasIPLink] & 1) == 0)
  {
    id v9 = [v5 dictionaryForKey:@"kAccessoriesListKey"];
    id v10 = [v6 uuid];
    v11 = [v10 UUIDString];
    id v12 = [v9 objectForKeyedSubscript:v11];
    id v13 = [v12 objectForKeyedSubscript:@"kAccessoryLinkQuality"];

    v14 = [v6 uuid];
    uint64_t v15 = [v14 UUIDString];
    uint64_t v16 = [v9 objectForKeyedSubscript:v15];
    char v17 = [v16 objectForKeyedSubscript:@"kAccessoryLastSeen"];

    uint64_t v7 = 0;
    if (v13 && v17)
    {
      char v36 = 0;
      v18 = [v6 home];
      unint64_t v35 = 5;
      long long v19 = [v6 identifier];
      id v34 = 0;
      v32 = v18;
      [v18 retrieveStateForTrackedAccessory:v19 stateNumber:0 isReachable:&v36 linkQuality:&v35 lastSeen:&v34];
      id v33 = v34;

      id v20 = [MEMORY[0x1E4F65530] sharedPreferences];
      long long v21 = [v20 preferenceForKey:@"BTLEAccessoryLossDetectionTimeInSec"];
      long long v22 = [v21 numberValue];
      unint64_t v23 = [v22 unsignedIntegerValue];

      if (v36
        || (unint64_t v24 = [v13 integerValue], v24 >= v35)
        || [v17 unsignedIntegerValue] >= v23)
      {

        uint64_t v7 = 0;
      }
      else
      {
        v25 = (void *)MEMORY[0x1D9452090]();
        v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = HMFGetLogIdentifier();
          [NSNumber numberWithUnsignedInteger:v35];
          v28 = v31 = v25;
          v29 = [v5 shortDescription];
          *(_DWORD *)buf = 138544898;
          v38 = v27;
          __int16 v39 = 2112;
          id v40 = v3;
          __int16 v41 = 2112;
          v42 = v13;
          __int16 v43 = 2112;
          v44 = v17;
          __int16 v45 = 2112;
          v46 = v28;
          __int16 v47 = 2112;
          id v48 = v33;
          __int16 v49 = 2112;
          v50 = v29;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Skipping characteristic request: %@, accessory has a better link quality: %@(%@s) / %@(%@s) to the device originating message: %@", buf, 0x48u);

          v25 = v31;
        }

        v30 = [v6 workQueue];
        [v32 retrieveHAPAccessoryForHMDAccessory:v6 linkType:2 forceRetrieve:0 queue:v30 completion:0];

        uint64_t v7 = 1;
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke_428(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained addCharacteristicResponses:v3 isRemote:0];
    id v6 = [v5 localTask];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    if (v8 && [v8 allResponsesReceived])
    {
      if ([v5 supportsMultiPartResponse]
        && ([v5 allResponsesReceived] & 1) == 0)
      {
        id v9 = [v5 completion];
        ((void (**)(void, id))v9)[2](v9, v3);
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
    else if ([v5 supportsMultiPartResponse])
    {
      id v10 = [v5 completion];
      ((void (**)(void, id))v10)[2](v10, v3);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint64_t v15 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for local task completion handler", (uint8_t *)&v14, 0xCu);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

- (void)_fanOutRemoteRequests:(id)a3 residentToAccessoriesMap:(id)a4 responseWaitGroup:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v30 = a4;
  id v9 = a5;
  v29 = v8;
  if ((objc_msgSend(v8, "hmf_isEmpty") & 1) == 0)
  {
    group = v9;
    v28 = [MEMORY[0x1E4F1CA48] array];
    id v10 = [(HMDHAPAccessoryTask *)self context];
    v11 = [v10 user];
    id v12 = accessoryRequestMapFromRequests(v8, v28, v11);

    [(HMDHAPAccessoryTask *)self addCharacteristicResponses:v28 isRemote:0];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obuint64_t j = v30;
    uint64_t v33 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v33)
    {
      uint64_t v31 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v45 != v31) {
            objc_enumerationMutation(obj);
          }
          int v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          uint64_t v15 = [obj objectForKey:v14];
          uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v17 = v15;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v41;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v41 != v19) {
                  objc_enumerationMutation(v17);
                }
                long long v21 = [v12 objectForKey:*(void *)(*((void *)&v40 + 1) + 8 * j)];
                [v16 addObjectsFromArray:v21];
              }
              uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v48 count:16];
            }
            while (v18);
          }

          if ((objc_msgSend(v16, "hmf_isEmpty") & 1) == 0)
          {
            dispatch_group_enter(group);
            objc_initWeak(&location, self);
            long long v22 = (void *)[v16 copy];
            unint64_t v23 = [v14 device];
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __112__HMDHAPAccessoryPrimaryResidentOperationTask__fanOutRemoteRequests_residentToAccessoriesMap_responseWaitGroup___block_invoke;
            v35[3] = &unk_1E6A191D0;
            objc_copyWeak(&v38, &location);
            char v36 = group;
            v37 = v14;
            unint64_t v24 = [(HMDHAPAccessoryPrimaryResidentOperationTask *)self _makeRemoteWithFallbackTaskWithRequests:v22 delegateDevice:v23 completion:v35];

            v25 = [(HMDHAPAccessoryPrimaryResidentOperationTask *)self remoteFallbackTasks];
            LODWORD(v22) = v25 == 0;

            if (v22)
            {
              v26 = [MEMORY[0x1E4F1CA48] array];
              [(HMDHAPAccessoryPrimaryResidentOperationTask *)self setRemoteFallbackTasks:v26];
            }
            v27 = [(HMDHAPAccessoryPrimaryResidentOperationTask *)self remoteFallbackTasks];
            [v27 addObject:v24];

            [v24 execute];
            objc_destroyWeak(&v38);
            objc_destroyWeak(&location);
          }
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v33);
    }

    id v9 = group;
  }
}

void __112__HMDHAPAccessoryPrimaryResidentOperationTask__fanOutRemoteRequests_residentToAccessoriesMap_responseWaitGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained addCharacteristicResponses:v3 isRemote:0];
    id v6 = [*(id *)(a1 + 40) device];
    uint64_t v7 = [v5 _fallbackTaskForDevice:v6];

    if (v7 && [v7 allResponsesReceived])
    {
      if ([v5 supportsMultiPartResponse]
        && ([v5 allResponsesReceived] & 1) == 0)
      {
        id v8 = [v5 completion];
        ((void (**)(void, id))v8)[2](v8, v3);
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
    else if ([v5 supportsMultiPartResponse])
    {
      id v9 = [v5 completion];
      ((void (**)(void, id))v9)[2](v9, v3);
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      int v14 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for fallback task completion handler", (uint8_t *)&v13, 0xCu);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

- (void)execute
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(HMDHAPAccessoryTask *)self setExecutionTime:v3];

  id v4 = dispatch_group_create();
  v5 = [(HMDHAPAccessoryTask *)self requests];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  migrateRequestsPassingTest(v6, v7, &__block_literal_global_424_186680);
  id v8 = objc_msgSend(v6, "na_map:", &__block_literal_global_427_186681);
  id v9 = [(HMDHAPAccessoryTask *)self context];
  id v10 = [v9 residentMapForAccessories:v8];

  v11 = [MEMORY[0x1E4F1CA80] set];
  id v12 = [MEMORY[0x1E4F1CA80] set];
  [(id)objc_opt_class() filterAccessoriesByDevicesFromMap:v10 currentDeviceAccessories:v11 otherDeviceAccessories:v12];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke_3;
  v17[3] = &unk_1E6A191A8;
  id v18 = v11;
  id v19 = v12;
  id v13 = v12;
  id v14 = v11;
  migrateRequestsPassingTest(v6, v7, v17);
  [(HMDHAPAccessoryPrimaryResidentOperationTask *)self _fanOutRemoteRequests:v6 residentToAccessoriesMap:v10 responseWaitGroup:v4];
  [(HMDHAPAccessoryPrimaryResidentOperationTask *)self _processLocalRequests:v7 responseWaitGroup:v4];
  uint64_t v15 = [(HMDHAPAccessoryTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke_4;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_group_notify(v4, v15, block);
}

uint64_t __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v5 = [v3 accessory];
  if ([v4 containsObject:v5])
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = [v3 accessory];
    uint64_t v6 = [v7 containsObject:v8] ^ 1;
  }
  return v6;
}

void __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke_4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) completion];
  v2 = [*(id *)(a1 + 32) characteristicResponses];
  v3[2](v3, v2);
}

uint64_t __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

uint64_t __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 accessory];
  id v4 = v2;
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();

  if ([v3 hasIPLink] & 1) != 0 || (objc_msgSend(v3, "custom1WoBLE"))
  {
    uint64_t v6 = 1;
  }
  else
  {
    int v8 = isKindOfClass & (v4 != 0);
    uint64_t v6 = [v3 isBLELinkConnected];
    if (((v6 | v8) & 1) == 0)
    {
      id v9 = [v4 characteristic];
      uint64_t v6 = [v3 hasValidCachedValueForCharacteristic:v9 shouldLog:0];
    }
  }

  return v6;
}

- (HMDHAPAccessoryPrimaryResidentOperationTask)initWithContext:(id)a3 requests:(id)a4 completion:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HMDHAPAccessoryPrimaryResidentOperationTask;
  return [(HMDHAPAccessoryTask *)&v6 initWithContext:a3 requests:a4 completion:a5];
}

+ (void)filterAccessoriesByDevicesFromMap:(id)a3 currentDeviceAccessories:(id)a4 otherDeviceAccessories:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v15 = [v7 objectForKey:v14];
        if ([v14 isCurrentDevice]) {
          uint64_t v16 = v8;
        }
        else {
          uint64_t v16 = v9;
        }
        [v16 addObjectsFromArray:v15];
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

@end