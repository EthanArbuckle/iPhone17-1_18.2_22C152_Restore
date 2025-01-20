@interface HMIExternalPersonManager
- (HMFTimer)watchdogTimer;
- (HMIExternalPersonManager)initWithUUID:(id)a3 homeUUID:(id)a4;
- (HMIExternalPersonManagerDataSource)dataSource;
- (HMIExternalPersonManagerSettings)settings;
- (NSOperationQueue)operationQueue;
- (id)logIdentifier;
- (void)_updateSettings:(id)a3;
- (void)handleRemovedFaceCropWithUUID:(id)a3;
- (void)handleRemovedFaceprintWithUUID:(id)a3;
- (void)handleRemovedPersonWithUUID:(id)a3;
- (void)handleUpdatedFaceprint:(id)a3;
- (void)handleUpdatedPerson:(id)a3;
- (void)handleUpdatedPersonFaceCrop:(id)a3;
- (void)handleUpdatedSettings:(id)a3;
- (void)setDataSource:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMIExternalPersonManager

- (HMIExternalPersonManager)initWithUUID:(id)a3 homeUUID:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HMIExternalPersonManager;
  v4 = [(HMIPersonManager *)&v10 initWithUUID:a3 homeUUID:a4];
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
    v4->_lock._os_unfair_lock_opaque = 0;
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
    v11[2] = __42__HMIExternalPersonManager_setDataSource___block_invoke;
    v11[3] = &unk_26477BA30;
    objc_copyWeak(&v13, location);
    v11[4] = self;
    id v12 = v4;
    [v5 addExecutionBlock:v11];
    v6 = [(HMIExternalPersonManager *)self operationQueue];
    [v6 addOperation:v5];

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x22A641C70]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_super v10 = HMFGetLogIdentifier();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v10;
      _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_ERROR, "%{public}@Received nil data source", (uint8_t *)location, 0xCu);
    }
  }
}

void __42__HMIExternalPersonManager_setDataSource___block_invoke(uint64_t a1)
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
  v10[2] = __42__HMIExternalPersonManager_setDataSource___block_invoke_3;
  v10[3] = &unk_26477DE40;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = WeakRetained;
  id v9 = WeakRetained;
  [v8 fetchSettingsWithCompletion:v10];
}

void __42__HMIExternalPersonManager_setDataSource___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
      objc_super v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error fetching settings: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  [*(id *)(a1 + 40) finish];
}

- (HMIExternalPersonManagerSettings)settings
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
  id v9 = [(HMIExternalPersonManager *)v6 watchdogTimer];
  [v9 resume];
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
    int v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@handleUpdatedPersonFaceCrop: %@", (uint8_t *)&v10, 0x16u);
  }
  id v9 = [(HMIExternalPersonManager *)v6 watchdogTimer];
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
  [(HMIExternalPersonManager *)v6 _updateSettings:v4];
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
  int v9 = [(HMIExternalPersonManager *)v6 watchdogTimer];
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
  int v9 = [(HMIExternalPersonManager *)v6 watchdogTimer];
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

- (void)timerDidFire:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  BOOL v6 = [(HMIPersonManager *)self isPersonDataAvailableViaHomeKit];
  uint64_t v7 = (void *)MEMORY[0x22A641C70]();
  id v8 = self;
  int v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      __int16 v11 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v11;
      _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_INFO, "%{public}@Timer fired, updating external persons model", (uint8_t *)&v19, 0xCu);
    }
    id v12 = [HMIUpdatePersonsModelOperation alloc];
    uint64_t v13 = [(HMIPersonManager *)v8 UUID];
    uint64_t v14 = [(HMIPersonManager *)v8 homeUUID];
    uint64_t v15 = [(HMIUpdatePersonsModelOperation *)v12 initWithSourceUUID:v13 homeUUID:v14 external:1];

    uint64_t v16 = [(HMIExternalPersonManager *)v8 operationQueue];
    [v16 addOperation:v15];

    v17 = [(HMIExternalPersonManager *)v8 watchdogTimer];
    [v17 suspend];
  }
  else
  {
    if (v10)
    {
      v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_INFO, "%{public}@Timer fired, but person data is not yet available, waiting...", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v15 = [(HMIExternalPersonManager *)v8 watchdogTimer];
    [(HMIUpdatePersonsModelOperation *)v15 resume];
  }
}

- (id)logIdentifier
{
  v3 = NSString;
  id v4 = [(HMIPersonManager *)self UUID];
  id v5 = [(HMIPersonManager *)self homeUUID];
  BOOL v6 = [v3 stringWithFormat:@"UUID:%@ HomeUUID:%@", v4, v5];

  return v6;
}

- (void)_updateSettings:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = (void *)MEMORY[0x22A641C70]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
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
  if (v5 && ([v5 isImportingFromPhotoLibraryEnabled] & 1) != 0)
  {
    BOOL v10 = (void *)MEMORY[0x22A641C70]();
    __int16 v11 = v7;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v23 = 138543362;
      v24 = v13;
      _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_INFO, "%{public}@Settings have enabled face classification, updating external persons model", (uint8_t *)&v23, 0xCu);
    }
    uint64_t v14 = [(HMIExternalPersonManager *)v11 watchdogTimer];
    [(HMIRemovePersonsModelOperation *)v14 resume];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x22A641C70]();
    uint64_t v16 = v7;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      int v23 = 138543362;
      v24 = v18;
      _os_log_impl(&dword_225DC6000, v17, OS_LOG_TYPE_INFO, "%{public}@Settings have disabled face classification, removing external persons model", (uint8_t *)&v23, 0xCu);
    }
    int v19 = [HMIRemovePersonsModelOperation alloc];
    v20 = [(HMIPersonManager *)v16 UUID];
    uint64_t v21 = [(HMIPersonManager *)v16 homeUUID];
    uint64_t v14 = [(HMIRemovePersonsModelOperation *)v19 initWithSourceUUID:v20 homeUUID:v21 external:1];

    v22 = [(HMIExternalPersonManager *)v16 operationQueue];
    [v22 addOperation:v14];
  }
}

- (HMIExternalPersonManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMIExternalPersonManagerDataSource *)WeakRetained;
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 64, 1);
}

- (HMFTimer)watchdogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end