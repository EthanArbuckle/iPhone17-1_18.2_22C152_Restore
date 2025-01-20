@interface HMDCoreFollowUpManager
+ (NSArray)allPossibleFollowUpItemIdentifiers;
+ (id)logCategory;
- (HMDCoreFollowUpManager)init;
- (HMDCoreFollowUpManager)initWithDataSource:(id)a3;
- (HMDCoreFollowUpManagerDataSource)dataSource;
- (NSOperationQueue)followUpOperationQueue;
- (OS_dispatch_queue)workQueue;
- (void)_startAdvertising:(int64_t)a3;
- (void)_stopAdvertising:(int64_t)a3;
- (void)removeAllFollowUpItemsWithCompletion:(id)a3;
- (void)startAdvertising:(int64_t)a3;
- (void)stopAdvertising:(int64_t)a3;
@end

@implementation HMDCoreFollowUpManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpOperationQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (NSOperationQueue)followUpOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMDCoreFollowUpManagerDataSource)dataSource
{
  return (HMDCoreFollowUpManagerDataSource *)objc_getProperty(self, a2, 16, 1);
}

- (void)_stopAdvertising:(int64_t)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v5 = [(HMDCoreFollowUpManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v40 = v9;
    __int16 v41 = 2048;
    int64_t v42 = a3;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Stopping advertising for followup mode: %ld", buf, 0x16u);
  }
  if (a3 != 1)
  {
    if (a3 != 3)
    {
      if (a3 == 2)
      {
        v10 = [(HMDCoreFollowUpManager *)v7 dataSource];
        int v11 = [v10 currentDeviceSupportsSetupFollowUp];

        if (v11)
        {
          v38 = @"com.apple.HomeKit.UpdateTvOS";
          v12 = (void *)MEMORY[0x1E4F1C978];
          v13 = &v38;
LABEL_10:
          uint64_t v15 = 1;
          goto LABEL_11;
        }
        uint64_t v31 = MEMORY[0x1D9452090]();
        v32 = v7;
        v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v40 = v34;
          _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly called stop advertising for tvos update mode on non-atv device", buf, 0xCu);
        }
        v25 = (void *)v31;
      }
      else
      {
        uint64_t v21 = MEMORY[0x1D9452090]();
        v22 = v7;
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v40 = v24;
          __int16 v41 = 2048;
          int64_t v42 = a3;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unknown followup mode passed to stop advertising: %ld", buf, 0x16u);
        }
        v25 = (void *)v21;
      }
      v16 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_24;
    }
    uint64_t v35 = *MEMORY[0x1E4F2DCD8];
    v12 = (void *)MEMORY[0x1E4F1C978];
    v13 = (__CFString **)&v35;
    goto LABEL_10;
  }
  uint64_t v14 = *MEMORY[0x1E4F2D0C0];
  uint64_t v36 = *MEMORY[0x1E4F2D0B8];
  uint64_t v37 = v14;
  v12 = (void *)MEMORY[0x1E4F1C978];
  v13 = (__CFString **)&v36;
  uint64_t v15 = 2;
LABEL_11:
  v16 = objc_msgSend(v12, "arrayWithObjects:count:", v13, v15, v35, v36, v37, v38);
  v17 = [(HMDCoreFollowUpManager *)v7 dataSource];
  v18 = [v17 followUpControllerForDeviceSetupManager:v7];

  if (v18)
  {
    v19 = [[HMDCoreFollowUpRemoveItemsOperation alloc] initWithIdentifiersToRemove:v16 followUpController:v18];
    v20 = [(HMDCoreFollowUpManager *)v7 followUpOperationQueue];
    [v20 addOperation:v19];
  }
  else
  {
    v26 = (void *)MEMORY[0x1D9452090]();
    v27 = v7;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      v30 = [(HMDCoreFollowUpManager *)v27 dataSource];
      *(_DWORD *)buf = 138543618;
      v40 = v29;
      __int16 v41 = 2112;
      int64_t v42 = (int64_t)v30;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to get followup controller from data source: %@", buf, 0x16u);
    }
  }

LABEL_24:
}

- (void)stopAdvertising:(int64_t)a3
{
  v5 = [(HMDCoreFollowUpManager *)self dataSource];
  int v6 = [v5 currentDeviceSupportsDeviceSetup];

  if (v6)
  {
    v7 = [(HMDCoreFollowUpManager *)self workQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__HMDCoreFollowUpManager_stopAdvertising___block_invoke;
    v8[3] = &unk_1E6A189D0;
    v8[4] = self;
    v8[5] = a3;
    dispatch_async(v7, v8);
  }
}

uint64_t __42__HMDCoreFollowUpManager_stopAdvertising___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopAdvertising:*(void *)(a1 + 40)];
}

- (void)removeAllFollowUpItemsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCoreFollowUpManager *)self dataSource];
  int v6 = [v5 followUpControllerForDeviceSetupManager:self];

  if (v6)
  {
    v7 = [(HMDCoreFollowUpManager *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__HMDCoreFollowUpManager_removeAllFollowUpItemsWithCompletion___block_invoke;
    block[3] = &unk_1E6A193D0;
    block[4] = self;
    id v10 = v6;
    id v11 = v4;
    dispatch_async(v7, block);
  }
  else
  {
    v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __63__HMDCoreFollowUpManager_removeAllFollowUpItemsWithCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    v5 = [v1 workQueue];
    dispatch_assert_queue_V2(v5);

    int v6 = [HMDCoreFollowUpRemoveItemsOperation alloc];
    v7 = [(id)objc_opt_class() allPossibleFollowUpItemIdentifiers];
    v8 = [(HMDCoreFollowUpRemoveItemsOperation *)v6 initWithIdentifiersToRemove:v7 followUpController:v3];

    if (v4)
    {
      objc_initWeak(&location, v8);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __61__HMDCoreFollowUpManager__removeAllFollowUpItems_completion___block_invoke;
      v10[3] = &unk_1E6A15DB8;
      objc_copyWeak(&v12, &location);
      id v11 = v4;
      [(HMDCoreFollowUpRemoveItemsOperation *)v8 setCompletionBlock:v10];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    v9 = [v1 followUpOperationQueue];
    [v9 addOperation:v8];
  }
}

void __61__HMDCoreFollowUpManager__removeAllFollowUpItems_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [WeakRetained error];
  id v4 = [WeakRetained error];
  (*(void (**)(uint64_t, BOOL, void *))(v2 + 16))(v2, v3 == 0, v4);
}

- (void)_startAdvertising:(int64_t)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v5 = [(HMDCoreFollowUpManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [(HMDCoreFollowUpManager *)self dataSource];
  v7 = [v6 followUpItemForDeviceSetupManager:self];

  v8 = [(HMDCoreFollowUpManager *)self dataSource];
  v9 = [v8 followUpPreferencesBundleIdentifierForDeviceSetupManager:self];
  [v7 setTargetBundleIdentifier:v9];

  switch(a3)
  {
    case 2:
      [v7 setUniqueIdentifier:@"com.apple.HomeKit.UpdateTvOS"];
      id v10 = @"FOLLOW_UP_ITEM_DEVICE_UPDATE_TVOS_TITLE";
      goto LABEL_7;
    case 3:
      [v7 setUniqueIdentifier:*MEMORY[0x1E4F2DCD8]];
      id v10 = @"FOLLOW_UP_ITEM_DEVICE_UNREACHABLE_PRIMARY";
LABEL_7:
      id v11 = HMDLocalizedStringForKey(v10);
      [v7 setTitle:v11];

      id v12 = [(HMDCoreFollowUpManager *)self dataSource];
      int v13 = [v12 currentDeviceSupportsSetupFollowUp];

      if (!v13)
      {
LABEL_14:
        v19 = (void *)MEMORY[0x1D9452090]();
        v20 = self;
        uint64_t v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v38 = v22;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Checking existing follow up setup items", buf, 0xCu);
        }
        v23 = [(HMDCoreFollowUpManager *)v20 dataSource];
        v24 = [v23 followUpControllerForDeviceSetupManager:v20];

        if (v24)
        {
          v25 = [[HMDCoreFollowUpPostItemOperation alloc] initWithItemToPost:v7 followUpController:v24];
          v26 = [(HMDCoreFollowUpManager *)v20 followUpOperationQueue];
          [v26 addOperation:v25];
        }
        else
        {
          v27 = (void *)MEMORY[0x1D9452090]();
          v28 = v20;
          v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = HMFGetLogIdentifier();
            uint64_t v31 = [(HMDCoreFollowUpManager *)v28 dataSource];
            *(_DWORD *)buf = 138543618;
            v38 = v30;
            __int16 v39 = 2112;
            int64_t v40 = (int64_t)v31;
            _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to get followup controller from datasource: %@", buf, 0x16u);
          }
        }

        goto LABEL_22;
      }
      uint64_t v14 = [(HMDCoreFollowUpManager *)self dataSource];
      uint64_t v15 = [v14 followUpActionForDeviceSetupManager:self];

      if (a3 == 2)
      {
        v16 = @"prefs:root=Home&cfuAction=updateOS";
      }
      else
      {
        if (a3 != 1)
        {
LABEL_13:
          uint64_t v36 = v15;
          v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
          [v7 setActions:v18];

          goto LABEL_14;
        }
        v16 = @"prefs:root=Home&cfuAction=finishSetup";
      }
      v17 = [MEMORY[0x1E4F1CB10] URLWithString:v16];
      [v15 setUrl:v17];

      goto LABEL_13;
    case 1:
      [v7 setUniqueIdentifier:*MEMORY[0x1E4F2D0C0]];
      id v10 = @"FOLLOW_UP_ITEM_DEVICE_SETUP_TITLE";
      goto LABEL_7;
  }
  v32 = (void *)MEMORY[0x1D9452090]();
  v33 = self;
  v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    uint64_t v35 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v38 = v35;
    __int16 v39 = 2048;
    int64_t v40 = a3;
    _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unexpected setup mode to start advertising: %ld", buf, 0x16u);
  }
LABEL_22:
}

- (void)startAdvertising:(int64_t)a3
{
  v5 = [(HMDCoreFollowUpManager *)self dataSource];
  int v6 = [v5 currentDeviceSupportsDeviceSetup];

  if (v6)
  {
    v7 = [(HMDCoreFollowUpManager *)self dataSource];
    int v8 = [v7 currentDeviceSupportsSetupFollowUp];

    if (a3 != 2 || v8)
    {
      v9 = [(HMDCoreFollowUpManager *)self workQueue];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __43__HMDCoreFollowUpManager_startAdvertising___block_invoke;
      v10[3] = &unk_1E6A189D0;
      void v10[4] = self;
      v10[5] = a3;
      dispatch_async(v9, v10);
    }
  }
}

uint64_t __43__HMDCoreFollowUpManager_startAdvertising___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startAdvertising:*(void *)(a1 + 40)];
}

- (HMDCoreFollowUpManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v16.receiver = self;
    v16.super_class = (Class)HMDCoreFollowUpManager;
    int v6 = [(HMDCoreFollowUpManager *)&v16 init];
    v7 = v6;
    if (v6)
    {
      v6->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v6->_dataSource, a3);
      int v8 = (const char *)HMFDispatchQueueName();
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
      workQueue = v7->_workQueue;
      v7->_workQueue = (OS_dispatch_queue *)v10;

      id v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
      followUpOperationQueue = v7->_followUpOperationQueue;
      v7->_followUpOperationQueue = v12;

      [(NSOperationQueue *)v7->_followUpOperationQueue setUnderlyingQueue:v7->_workQueue];
      [(NSOperationQueue *)v7->_followUpOperationQueue setMaxConcurrentOperationCount:1];
    }
    self = v7;
    uint64_t v14 = self;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (HMDCoreFollowUpManager)init
{
  id v3 = objc_alloc_init(HMDCoreFollowUpManagerDataSource);
  id v4 = [(HMDCoreFollowUpManager *)self initWithDataSource:v3];

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_52349 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_52349, &__block_literal_global_52350);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v8_52351;
  return v2;
}

uint64_t __37__HMDCoreFollowUpManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v8_52351;
  logCategory__hmf_once_v8_52351 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (NSArray)allPossibleFollowUpItemIdentifiers
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = *MEMORY[0x1E4F2D0C0];
  v5[1] = @"com.apple.HomeKit.UpdateTvOS";
  uint64_t v2 = *MEMORY[0x1E4F2DCD8];
  v5[2] = *MEMORY[0x1E4F2D0B8];
  v5[3] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  return (NSArray *)v3;
}

@end