@interface HMIHomePersonManager
- (HMFTimer)analyticsTimer;
- (HMFTimer)watchdogTimer;
- (HMIHomePersonManager)initWithUUID:(id)a3 homeUUID:(id)a4;
- (HMIHomePersonManagerDataSource)dataSource;
- (HMIHomePersonManagerSettings)settings;
- (NSMutableDictionary)unknownFacesSavedCounts;
- (NSOperationQueue)operationQueue;
- (id)logIdentifier;
- (void)_updateSettings:(id)a3;
- (void)handleMisclassifiedPersonForFaceCrop:(id)a3;
- (void)handleNewFaceEvents:(id)a3;
- (void)handleRemovedFaceCropWithUUID:(id)a3;
- (void)handleRemovedFaceprintWithUUID:(id)a3;
- (void)handleRemovedPersonWithUUID:(id)a3;
- (void)handleUpdatedFaceprint:(id)a3;
- (void)handleUpdatedPerson:(id)a3;
- (void)handleUpdatedPersonFaceCrop:(id)a3;
- (void)handleUpdatedSettings:(id)a3;
- (void)handleUpdatedUnassociatedFaceCrop:(id)a3;
- (void)setDataSource:(id)a3;
- (void)storeFaceprint:(id)a3 completion:(id)a4;
- (void)storeUnassociatedFaceCrop:(id)a3 completion:(id)a4;
- (void)timerDidFire:(id)a3;
@end

@implementation HMIHomePersonManager

- (HMIHomePersonManager)initWithUUID:(id)a3 homeUUID:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)HMIHomePersonManager;
  v4 = [(HMIPersonManager *)&v14 initWithUUID:a3 homeUUID:a4];
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v4->_operationQueue;
    v4->_operationQueue = v5;

    [(NSOperationQueue *)v4->_operationQueue setMaxConcurrentOperationCount:1];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:28 options:5.0];
    watchdogTimer = v4->_watchdogTimer;
    v4->_watchdogTimer = (HMFTimer *)v7;

    [(HMFTimer *)v4->_watchdogTimer setDelegate:v4];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:12 options:3600.0];
    analyticsTimer = v4->_analyticsTimer;
    v4->_analyticsTimer = (HMFTimer *)v9;

    [(HMFTimer *)v4->_analyticsTimer setDelegate:v4];
    [(HMFTimer *)v4->_analyticsTimer resume];
    v4->_lock._os_unfair_lock_opaque = 0;
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    unknownFacesSavedCounts = v4->_unknownFacesSavedCounts;
    v4->_unknownFacesSavedCounts = (NSMutableDictionary *)v11;
  }
  return v4;
}

- (void)setDataSource:(id)a3
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_dataSource, v4);
  os_unfair_lock_unlock(&self->_lock);
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F42500]) initWithTimeout:0.0];
    objc_initWeak(location, v5);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __38__HMIHomePersonManager_setDataSource___block_invoke;
    v11[3] = &unk_26477BA30;
    objc_copyWeak(&v13, location);
    v11[4] = self;
    id v12 = v4;
    [v5 addExecutionBlock:v11];
    v6 = [(HMIHomePersonManager *)self operationQueue];
    [v6 addOperation:v5];

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x22A641C70]();
    v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v10;
      _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_ERROR, "%{public}@Received nil data source", (uint8_t *)location, 0xCu);
    }
  }
}

void __38__HMIHomePersonManager_setDataSource___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)MEMORY[0x22A641C70]();
  id v4 = *(id *)(a1 + 32);
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching settings using data source: %@", buf, 0x16u);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__HMIHomePersonManager_setDataSource___block_invoke_4;
  v10[3] = &unk_26477BA08;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = WeakRetained;
  id v9 = WeakRetained;
  [v8 fetchSettingsWithCompletion:v10];
}

void __38__HMIHomePersonManager_setDataSource___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) _updateSettings:v5];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x22A641C70]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error fetching settings: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  [*(id *)(a1 + 40) finish];
}

- (HMIHomePersonManagerSettings)settings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_settings;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)handleUpdatedPerson:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    int v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@handleUpdatedPerson: %@", (uint8_t *)&v10, 0x16u);
  }
  id v9 = [(HMIHomePersonManager *)v6 watchdogTimer];
  [v9 resume];
}

- (void)handleUpdatedUnassociatedFaceCrop:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    int v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@handleUpdatedUnassociatedFaceCrop: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)handleUpdatedPersonFaceCrop:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    __int16 v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@handleUpdatedPersonFaceCrop: %@", (uint8_t *)&v10, 0x16u);
  }
  int v9 = [(HMIHomePersonManager *)v6 watchdogTimer];
  [v9 resume];
}

- (void)handleUpdatedFaceprint:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    int v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@handleUpdatedFaceprint: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)handleUpdatedSettings:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    int v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_INFO, "%{public}@handleUpdatedSettings: %@", (uint8_t *)&v9, 0x16u);
  }
  [(HMIHomePersonManager *)v6 _updateSettings:v4];
}

- (void)handleRemovedPersonWithUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    __int16 v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@handleRemovedPersonWithUUID: %@", (uint8_t *)&v10, 0x16u);
  }
  int v9 = [(HMIHomePersonManager *)v6 watchdogTimer];
  [v9 resume];
}

- (void)handleRemovedFaceCropWithUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    __int16 v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@handleRemovedFaceCropWithUUID: %@", (uint8_t *)&v10, 0x16u);
  }
  int v9 = [(HMIHomePersonManager *)v6 watchdogTimer];
  [v9 resume];
}

- (void)handleRemovedFaceprintWithUUID:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    int v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@handleRemovedFaceprintWithUUID: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)handleMisclassifiedPersonForFaceCrop:(id)a3
{
  v19[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[HMITaskService taskServiceClient];
  v19[0] = HMITaskTypeFaceMisclassificationTask;
  v18[0] = @"taskType";
  v18[1] = @"homeUUID";
  id v6 = [(HMIPersonManager *)self homeUUID];
  v18[2] = @"faceCrop";
  v19[1] = v6;
  v19[2] = v4;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__HMIHomePersonManager_handleMisclassifiedPersonForFaceCrop___block_invoke;
  v13[3] = &unk_26477BA58;
  v13[4] = self;
  int v8 = [v5 submitTaskWithOptions:v7 progressHandler:0 completionHandler:v13];
  int v9 = (void *)MEMORY[0x22A641C70]();
  int v10 = self;
  __int16 v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v12;
    __int16 v16 = 1024;
    int v17 = v8;
    _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_INFO, "%{public}@Submitted face misclassification task, taskID:%u", buf, 0x12u);
  }
}

void __61__HMIHomePersonManager_handleMisclassifiedPersonForFaceCrop___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"resultCode"];
  int v8 = HMITaskResultCodeAsString(0);
  int v9 = [v7 isEqualToString:v8];

  int v10 = (void *)MEMORY[0x22A641C70]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  uint64_t v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v14;
      uint64_t v15 = "%{public}@Successfully handled face misclassification";
      __int16 v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_INFO;
      uint32_t v18 = 12;
LABEL_6:
      _os_log_impl(&dword_225DC6000, v16, v17, v15, (uint8_t *)&v19, v18);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v19 = 138543618;
    v20 = v14;
    __int16 v21 = 2112;
    id v22 = v6;
    uint64_t v15 = "%{public}@Error in handling face misclassification, error:%@";
    __int16 v16 = v13;
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    uint32_t v18 = 22;
    goto LABEL_6;
  }
}

- (void)storeUnassociatedFaceCrop:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMIHomePersonManager *)self dataSource];
  if (v8)
  {
    int v9 = [[HMIStoreFaceCropOperation alloc] initWithDataSource:v8 faceCrop:v6];
    objc_initWeak(&location, v9);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__HMIHomePersonManager_storeUnassociatedFaceCrop_completion___block_invoke;
    v11[3] = &unk_26477BA80;
    objc_copyWeak(&v13, &location);
    id v12 = v7;
    [(HMIStoreFaceCropOperation *)v9 setCompletionBlock:v11];
    int v10 = [(HMIHomePersonManager *)self operationQueue];
    [v10 addOperation:v9];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    int v9 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1036];
    (*((void (**)(id, HMIStoreFaceCropOperation *))v7 + 2))(v7, v9);
  }
}

void __61__HMIHomePersonManager_storeUnassociatedFaceCrop_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [WeakRetained error];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

- (void)storeFaceprint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMIHomePersonManager *)self dataSource];
  if (v8)
  {
    int v9 = [[HMIStoreFaceprintOperation alloc] initWithDataSource:v8 faceprint:v6];
    objc_initWeak(&location, v9);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__HMIHomePersonManager_storeFaceprint_completion___block_invoke;
    v11[3] = &unk_26477BA80;
    objc_copyWeak(&v13, &location);
    id v12 = v7;
    [(HMIStoreFaceprintOperation *)v9 setCompletionBlock:v11];
    int v10 = [(HMIHomePersonManager *)self operationQueue];
    [v10 addOperation:v9];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    int v9 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1036];
    (*((void (**)(id, HMIStoreFaceprintOperation *))v7 + 2))(v7, v9);
  }
}

void __50__HMIHomePersonManager_storeFaceprint_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [WeakRetained error];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

- (void)handleNewFaceEvents:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = a3;
  uint64_t v41 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v50;
    v37 = v43;
    v38 = v46;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v50 != v40) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        id v6 = objc_msgSend(v5, "faceRecognition", v37, v38);
        id v7 = v6;
        if (v6)
        {
          int v8 = [v6 classifications];
          v48[0] = MEMORY[0x263EF8330];
          v48[1] = 3221225472;
          v48[2] = __44__HMIHomePersonManager_handleNewFaceEvents___block_invoke;
          v48[3] = &unk_26477BAA8;
          v48[4] = self;
          int v9 = objc_msgSend(v8, "na_firstObjectPassingTest:", v48);

          if (v9)
          {
            os_unfair_lock_lock_with_options();
            int v10 = [(HMIHomePersonManager *)self unknownFacesSavedCounts];
            id v11 = [v9 sessionEntityUUID];
            id v12 = [v10 objectForKeyedSubscript:v11];

            if (v12) {
              unsigned int v13 = [v12 intValue];
            }
            else {
              unsigned int v13 = 0;
            }

            os_unfair_lock_unlock(&self->_lock);
            if (v13 >= 0xA)
            {
              v31 = (void *)MEMORY[0x22A641C70]();
              v32 = self;
              v33 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                v34 = HMFGetLogIdentifier();
                v35 = [v9 sessionEntityUUID];
                v36 = [(HMIPersonManager *)v32 UUID];
                *(_DWORD *)buf = 138543874;
                v54 = v34;
                __int16 v55 = 2112;
                v56 = v35;
                __int16 v57 = 2112;
                v58 = v36;
                _os_log_impl(&dword_225DC6000, v33, OS_LOG_TYPE_DEBUG, "%{public}@Reached face crop limit for sessionEntityUUID:%@ for HMIHomePersonManager.UUID:%@; not storing",
                  buf,
                  0x20u);
              }
            }
            else
            {
              os_unfair_lock_lock_with_options();
              int v19 = [NSNumber numberWithInt:v13 + 1];
              v20 = [(HMIHomePersonManager *)self unknownFacesSavedCounts];
              __int16 v21 = [v9 sessionEntityUUID];
              [v20 setObject:v19 forKeyedSubscript:v21];

              os_unfair_lock_unlock(&self->_lock);
              id v22 = (void *)MEMORY[0x22A641C70]();
              uint64_t v23 = self;
              v24 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                v25 = HMFGetLogIdentifier();
                v26 = [v7 faceCrop];
                v27 = [v7 faceprint];
                *(_DWORD *)buf = 138543874;
                v54 = v25;
                __int16 v55 = 2112;
                v56 = v26;
                __int16 v57 = 2112;
                v58 = v27;
                _os_log_impl(&dword_225DC6000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Storing unknown to Home face crop:%@ and faceprint:%@", buf, 0x20u);
              }
              v28 = [v7 faceCrop];
              v45[0] = MEMORY[0x263EF8330];
              v45[1] = 3221225472;
              v46[0] = __44__HMIHomePersonManager_handleNewFaceEvents___block_invoke_15;
              v46[1] = &unk_26477BAD0;
              v46[2] = v23;
              id v29 = v7;
              id v47 = v29;
              [(HMIHomePersonManager *)v23 storeUnassociatedFaceCrop:v28 completion:v45];

              v30 = [v29 faceprint];
              v42[0] = MEMORY[0x263EF8330];
              v42[1] = 3221225472;
              v43[0] = __44__HMIHomePersonManager_handleNewFaceEvents___block_invoke_17;
              v43[1] = &unk_26477BAD0;
              v43[2] = v23;
              id v44 = v29;
              [(HMIHomePersonManager *)v23 storeFaceprint:v30 completion:v42];
            }
          }
          else
          {
            uint64_t v14 = (void *)MEMORY[0x22A641C70]();
            uint64_t v15 = self;
            __int16 v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              os_log_type_t v17 = HMFGetLogIdentifier();
              uint32_t v18 = [(HMIPersonManager *)v15 UUID];
              *(_DWORD *)buf = 138543874;
              v54 = v17;
              __int16 v55 = 2112;
              v56 = v18;
              __int16 v57 = 2112;
              v58 = v5;
              _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Not storing face crop and faceprint for HMIHomePersonManager.UUID:%@ from face event:%@", buf, 0x20u);
            }
          }
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v41);
  }
}

uint64_t __44__HMIHomePersonManager_handleNewFaceEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 familiarity])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [v3 sourceUUID];
    id v6 = [*(id *)(a1 + 32) UUID];
    uint64_t v4 = [v5 isEqual:v6];
  }
  return v4;
}

void __44__HMIHomePersonManager_handleNewFaceEvents___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x22A641C70]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = HMFGetLogIdentifier();
      int v9 = [*(id *)(a1 + 40) faceCrop];
      int v14 = 138543874;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      os_log_type_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      int v10 = "%{public}@Error storing unassociated face crop:%@, error:%@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_225DC6000, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v9 = [*(id *)(a1 + 40) faceCrop];
    int v14 = 138543618;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    os_log_type_t v17 = v9;
    int v10 = "%{public}@Stored unassociated face crop:%@";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

void __44__HMIHomePersonManager_handleNewFaceEvents___block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x22A641C70]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = HMFGetLogIdentifier();
      int v9 = [*(id *)(a1 + 40) faceprint];
      int v14 = 138543874;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      os_log_type_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      int v10 = "%{public}@Error storing faceprint:%@, error:%@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_225DC6000, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = HMFGetLogIdentifier();
    int v9 = [*(id *)(a1 + 40) faceprint];
    int v14 = 138543618;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    os_log_type_t v17 = v9;
    int v10 = "%{public}@Stored faceprint:%@";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

- (void)timerDidFire:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = [(HMIHomePersonManager *)self watchdogTimer];

  if (v6 == v4)
  {
    BOOL v12 = [(HMIPersonManager *)self isPersonDataAvailableViaHomeKit];
    uint32_t v13 = (void *)MEMORY[0x22A641C70]();
    int v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v16)
      {
        os_log_type_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v48 = v17;
        _os_log_impl(&dword_225DC6000, v15, OS_LOG_TYPE_INFO, "%{public}@Timer fired, updating home persons model", buf, 0xCu);
      }
      __int16 v18 = [HMIUpdatePersonsModelOperation alloc];
      id v19 = [(HMIPersonManager *)v14 UUID];
      uint64_t v20 = [(HMIPersonManager *)v14 homeUUID];
      __int16 v21 = [(HMIUpdatePersonsModelOperation *)v18 initWithSourceUUID:v19 homeUUID:v20 external:0];

      id v22 = [(HMIHomePersonManager *)v14 operationQueue];
      [v22 addOperation:v21];

      uint64_t v23 = [(HMIHomePersonManager *)v14 watchdogTimer];
      [v23 suspend];
    }
    else
    {
      if (v16)
      {
        v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v48 = v38;
        _os_log_impl(&dword_225DC6000, v15, OS_LOG_TYPE_INFO, "%{public}@Timer fired, but person data is not yet available, waiting...", buf, 0xCu);
      }
      v39 = [(HMIHomePersonManager *)v14 watchdogTimer];
      [v39 resume];
    }
  }
  else
  {
    id v7 = [(HMIHomePersonManager *)self analyticsTimer];

    if (v7 != v4)
    {
      int v8 = (void *)MEMORY[0x22A641C70]();
      int v9 = self;
      int v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v48 = v11;
        __int16 v49 = 2112;
        id v50 = v4;
        _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized timer: %@", buf, 0x16u);
      }
LABEL_20:

      goto LABEL_21;
    }
    v24 = [(HMIHomePersonManager *)self settings];
    int v25 = [v24 isFaceClassificationEnabled];

    if (v25)
    {
      v26 = [MEMORY[0x263EFFA40] standardUserDefaults];
      [v26 doubleForKey:@"HMICoreAnalyticsVIPModelReportTime"];
      double v28 = v27;

      id v29 = [MEMORY[0x263EFF910] date];
      [v29 timeIntervalSinceReferenceDate];
      BOOL v31 = v30 - v28 >= 86400.0;

      int v8 = (void *)MEMORY[0x22A641C70]();
      int v9 = self;
      int v10 = HMFGetOSLogHandle();
      BOOL v32 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
      if (!v31)
      {
        if (v32)
        {
          uint64_t v40 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v48 = v40;
          _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_INFO, "%{public}@Not triggering daily VIP Model Core Analytics event, last event was sent less than 1 day ago", buf, 0xCu);
        }
        goto LABEL_20;
      }
      if (v32)
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v48 = v33;
        _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_INFO, "%{public}@Triggering daily VIP Model Core Analytics event", buf, 0xCu);
      }
      v34 = [MEMORY[0x263EFFA40] standardUserDefaults];
      v35 = [MEMORY[0x263EFF910] date];
      [v35 timeIntervalSinceReferenceDate];
      objc_msgSend(v34, "setDouble:forKey:", @"HMICoreAnalyticsVIPModelReportTime");

      v36 = (void *)[objc_alloc(MEMORY[0x263F42500]) initWithTimeout:0.0];
      objc_initWeak((id *)buf, v36);
      uint64_t v41 = MEMORY[0x263EF8330];
      uint64_t v42 = 3221225472;
      v43 = __37__HMIHomePersonManager_timerDidFire___block_invoke;
      id v44 = &unk_26477BB20;
      objc_copyWeak(&v46, (id *)buf);
      v45 = v9;
      [v36 addExecutionBlock:&v41];
      v37 = [(HMIHomePersonManager *)v9 operationQueue];
      [v37 addOperation:v36];

      objc_destroyWeak(&v46);
      objc_destroyWeak((id *)buf);
    }
  }
LABEL_21:
}

void __37__HMIHomePersonManager_timerDidFire___block_invoke(uint64_t a1)
{
  v24[2] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = +[HMITaskService taskServiceClient];
  v24[0] = HMITaskTypePersonsModelsSummaryTask;
  v23[0] = @"taskType";
  v23[1] = @"homeUUID";
  id v4 = [*(id *)(a1 + 32) homeUUID];
  v24[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __37__HMIHomePersonManager_timerDidFire___block_invoke_2;
  v17[3] = &unk_26477BAF8;
  v17[4] = *(void *)(a1 + 32);
  id v6 = WeakRetained;
  id v18 = v6;
  uint64_t v7 = [v3 submitTaskWithOptions:v5 progressHandler:0 completionHandler:v17];
  int v8 = v7;
  uint32_t v13 = (void *)MEMORY[0x22A641C70](v7, v9, v10, v11, v12);
  id v14 = *(id *)(a1 + 32);
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    BOOL v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v16;
    __int16 v21 = 1024;
    int v22 = v8;
    _os_log_impl(&dword_225DC6000, v15, OS_LOG_TYPE_INFO, "%{public}@Submitted persons model summary task, taskID:%u", buf, 0x12u);
  }
}

void __37__HMIHomePersonManager_timerDidFire___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"resultCode"];
  int v8 = HMITaskResultCodeAsString(0);
  int v9 = [v7 isEqualToString:v8];

  uint64_t v10 = (void *)MEMORY[0x22A641C70]();
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = HMFGetOSLogHandle();
  uint32_t v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v16 = 138543362;
      os_log_type_t v17 = v14;
      _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully ran persons model summary task", (uint8_t *)&v16, 0xCu);
    }
    [*(id *)(a1 + 40) finish];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v16 = 138543618;
      os_log_type_t v17 = v15;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to run persons model summary task, error:%@", (uint8_t *)&v16, 0x16u);
    }
    [*(id *)(a1 + 40) cancelWithError:v6];
  }
}

- (id)logIdentifier
{
  id v3 = NSString;
  id v4 = [(HMIPersonManager *)self UUID];
  id v5 = [(HMIPersonManager *)self homeUUID];
  id v6 = [v3 stringWithFormat:@"UUID:%@ HomeUUID:%@", v4, v5];

  return v6;
}

- (void)_updateSettings:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x22A641C70]();
  uint64_t v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    int v23 = 138543618;
    v24 = v9;
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating with settings: %@", (uint8_t *)&v23, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&v7->_settings, a3);
  os_unfair_lock_unlock(&v7->_lock);
  if (v5 && ([v5 isFaceClassificationEnabled] & 1) != 0)
  {
    uint64_t v10 = (void *)MEMORY[0x22A641C70]();
    id v11 = v7;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint32_t v13 = HMFGetLogIdentifier();
      int v23 = 138543362;
      v24 = v13;
      _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_INFO, "%{public}@Settings have enabled face classification, updating home persons model", (uint8_t *)&v23, 0xCu);
    }
    id v14 = [(HMIHomePersonManager *)v11 watchdogTimer];
    [(HMIRemovePersonsModelOperation *)v14 resume];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x22A641C70]();
    int v16 = v7;
    os_log_type_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      int v23 = 138543362;
      v24 = v18;
      _os_log_impl(&dword_225DC6000, v17, OS_LOG_TYPE_INFO, "%{public}@Settings have disabled face classification, removing home persons model", (uint8_t *)&v23, 0xCu);
    }
    id v19 = [HMIRemovePersonsModelOperation alloc];
    uint64_t v20 = [(HMIPersonManager *)v16 UUID];
    __int16 v21 = [(HMIPersonManager *)v16 homeUUID];
    id v14 = [(HMIRemovePersonsModelOperation *)v19 initWithSourceUUID:v20 homeUUID:v21 external:0];

    int v22 = [(HMIHomePersonManager *)v16 operationQueue];
    [v22 addOperation:v14];
  }
}

- (HMIHomePersonManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMIHomePersonManagerDataSource *)WeakRetained;
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 64, 1);
}

- (HMFTimer)watchdogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 72, 1);
}

- (HMFTimer)analyticsTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableDictionary)unknownFacesSavedCounts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFacesSavedCounts, 0);
  objc_storeStrong((id *)&self->_analyticsTimer, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end