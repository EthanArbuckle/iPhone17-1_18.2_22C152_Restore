@interface HMDHAPAccessoryPrimaryResidentOperationTask
- (HMDHAPAccessoryPrimaryResidentOperationTask)initWithContext:(id)a3 requests:(id)a4 completion:(id)a5;
- (HMDHAPAccessoryTask)localTask;
- (NSMutableArray)remoteFallbackTasks;
- (id)_makeLocalTaskWithRequests:(id)a3 completion:(id)a4;
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
  v8 = (void *)MEMORY[0x263EFF940];
  uint64_t v9 = *MEMORY[0x263EFF498];
  v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"%@ is unavailable", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)_processLocalRequests:(id)a3 responseWaitGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[v6 mutableCopy];
  uint64_t v9 = [MEMORY[0x263EFF980] array];
  v27[0] = (id)MEMORY[0x263EF8330];
  v27[1] = (id)3221225472;
  v27[2] = __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke;
  v27[3] = &unk_264A2E6B0;
  v27[4] = self;
  id v10 = v8;
  id v11 = v9;
  v12 = v27;
  if (v10 == v11)
  {
    v20 = (_Unwind_Exception *)_HMFPreconditionFailure();
    objc_destroyWeak(v27);
    objc_destroyWeak(location);
    _Unwind_Resume(v20);
  }
  location[0] = (id)MEMORY[0x263EF8330];
  location[1] = (id)3221225472;
  location[2] = __migrateRequestsPassingTest_block_invoke;
  location[3] = &unk_264A2EA68;
  v29 = v12;
  id v13 = [v10 indexesOfObjectsPassingTest:location];
  v14 = [v10 objectsAtIndexes:v13];
  [v11 addObjectsFromArray:v14];

  [v10 removeObjectsAtIndexes:v13];
  if ((objc_msgSend(v11, "hmf_isEmpty") & 1) == 0)
  {
    v15 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
    v16 = +[HMDCharacteristicResponse responsesWithRequests:v11 error:v15];

    v17 = [(HMDHAPAccessoryTask *)self completion];
    ((void (**)(void, void *))v17)[2](v17, v16);
  }
  if ((objc_msgSend(v10, "hmf_isEmpty") & 1) == 0)
  {
    dispatch_group_enter(v7);
    objc_initWeak(location, self);
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke_418;
    v24 = &unk_264A2E9D0;
    objc_copyWeak(&v26, location);
    v25 = v7;
    v18 = [(HMDHAPAccessoryPrimaryResidentOperationTask *)self _makeLocalTaskWithRequests:v10 completion:&v21];
    -[HMDHAPAccessoryPrimaryResidentOperationTask setLocalTask:](self, "setLocalTask:", v18, v21, v22, v23, v24);

    v19 = [(HMDHAPAccessoryPrimaryResidentOperationTask *)self localTask];
    [v19 execute];

    objc_destroyWeak(&v26);
    objc_destroyWeak(location);
  }
}

uint64_t __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) context];
  v5 = [v4 requestMessage];

  id v6 = [v3 accessory];
  if ([v5 isRemote]
    && [v6 hasBTLELink]
    && ([v6 hasIPLink] & 1) == 0)
  {
    uint64_t v9 = [v5 dictionaryForKey:@"kAccessoriesListKey"];
    id v10 = [v6 uuid];
    id v11 = [v10 UUIDString];
    v12 = [v9 objectForKeyedSubscript:v11];
    id v13 = [v12 objectForKeyedSubscript:@"kAccessoryLinkQuality"];

    v14 = [v6 uuid];
    v15 = [v14 UUIDString];
    v16 = [v9 objectForKeyedSubscript:v15];
    v17 = [v16 objectForKeyedSubscript:@"kAccessoryLastSeen"];

    uint64_t v7 = 0;
    if (v13 && v17)
    {
      char v36 = 0;
      v18 = [v6 home];
      unint64_t v35 = 5;
      v19 = [v6 identifier];
      id v34 = 0;
      v32 = v18;
      [v18 retrieveStateForTrackedAccessory:v19 stateNumber:0 isReachable:&v36 linkQuality:&v35 lastSeen:&v34];
      id v33 = v34;

      v20 = [MEMORY[0x263F42608] sharedPreferences];
      uint64_t v21 = [v20 preferenceForKey:@"BTLEAccessoryLossDetectionTimeInSec"];
      uint64_t v22 = [v21 numberValue];
      unint64_t v23 = [v22 unsignedIntegerValue];

      if (v36
        || (unint64_t v24 = [v13 integerValue], v24 >= v35)
        || [v17 unsignedIntegerValue] >= v23)
      {

        uint64_t v7 = 0;
      }
      else
      {
        v25 = (void *)MEMORY[0x230FBD990]();
        id v26 = HMFGetOSLogHandle();
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
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Skipping characteristic request: %@, accessory has a better link quality: %@(%@s) / %@(%@s) to the device originating message: %@", buf, 0x48u);

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

void __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke_418(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
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
        uint64_t v9 = [v5 completion];
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
    id v11 = (void *)MEMORY[0x230FBD990]();
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for local task completion handler", (uint8_t *)&v14, 0xCu);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

- (void)execute
{
  id v3 = [MEMORY[0x263EFF910] date];
  [(HMDHAPAccessoryTask *)self setExecutionTime:v3];

  v4 = dispatch_group_create();
  v5 = [(HMDHAPAccessoryTask *)self requests];
  [(HMDHAPAccessoryPrimaryResidentOperationTask *)self _processLocalRequests:v5 responseWaitGroup:v4];
  id v6 = [(HMDHAPAccessoryTask *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_group_notify(v4, v6, block);
}

void __54__HMDHAPAccessoryPrimaryResidentOperationTask_execute__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) completion];
  v2 = [*(id *)(a1 + 32) characteristicResponses];
  v3[2](v3, v2);
}

- (HMDHAPAccessoryPrimaryResidentOperationTask)initWithContext:(id)a3 requests:(id)a4 completion:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HMDHAPAccessoryPrimaryResidentOperationTask;
  return [(HMDHAPAccessoryTask *)&v6 initWithContext:a3 requests:a4 completion:a5];
}

@end