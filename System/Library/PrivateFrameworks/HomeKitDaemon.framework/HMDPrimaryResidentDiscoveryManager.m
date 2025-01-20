@interface HMDPrimaryResidentDiscoveryManager
+ (id)logCategory;
- (HMDPrimaryResidentDiscoveryManager)initWithQueue:(id)a3;
- (HMDPrimaryResidentDiscoveryManager)initWithQueue:(id)a3 dataSource:(id)a4;
- (HMDPrimaryResidentDiscoveryManagerDelegate)delegate;
- (NSString)logIdentifier;
- (void)_discoverPrimaryResident;
- (void)_handleDeviceMonitorReachableNotification:(id)a3;
- (void)_removeRetryTimer;
- (void)_startRetryTimer;
- (void)cancel;
- (void)completedDiscoveryWithPrimaryResident:(id)a3 primaryResidentGenerationID:(id)a4 error:(id)a5;
- (void)configureWithContext:(id)a3;
- (void)discoverPrimaryResident;
- (void)sendCheckForResidentsInHomeNotification;
- (void)setDelegate:(id)a3;
- (void)setLogIdentifier:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDPrimaryResidentDiscoveryManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_primaryDiscoveryOperation, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (void)setLogIdentifier:(id)a3
{
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setDelegate:(id)a3
{
}

- (HMDPrimaryResidentDiscoveryManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HMDPrimaryResidentDiscoveryManagerDelegate *)WeakRetained;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 56, 1);
  }
  else {
    id Property = 0;
  }
  if (Property == v5)
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Primary resident discovery retry timer fired", (uint8_t *)&v11, 0xCu);
    }
    [(HMDPrimaryResidentDiscoveryManager *)v8 _discoverPrimaryResident];
  }
}

- (void)_handleDeviceMonitorReachableNotification:(id)a3
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__HMDPrimaryResidentDiscoveryManager__handleDeviceMonitorReachableNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __80__HMDPrimaryResidentDiscoveryManager__handleDeviceMonitorReachableNotification___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[4];
  }
  v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id WeakRetained = objc_loadWeakRetained((id *)(v4 + 40));
  }
  else {
    id WeakRetained = 0;
  }
  v6 = [v3 remoteDeviceMonitorFromContext:WeakRetained];

  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = objc_getProperty(v8, v7, 56, 1);
    if (v9)
    {
      v10 = v9;
      int v11 = [v6 isReachable];

      if (v11)
      {
        v12 = (void *)MEMORY[0x230FBD990]();
        id v13 = *(id *)(a1 + 32);
        v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = HMFGetLogIdentifier();
          int v16 = 138543362;
          v17 = v15;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Current device is now reachable. Resetting retry timer and running discovery if it's not running already.", (uint8_t *)&v16, 0xCu);
        }
        [*(id *)(a1 + 32) discoverPrimaryResident];
      }
    }
  }
}

- (void)_removeRetryTimer
{
  if (self)
  {
    objc_msgSend(objc_getProperty(self, a2, 56, 1), "suspend");
    objc_setProperty_atomic(self, v4, 0, 56);
  }
  else
  {
    [0 suspend];
  }
}

- (void)_startRetryTimer
{
  uint64_t v2 = self;
  if (self)
  {
    if (objc_getProperty(self, a2, 56, 1))
    {
LABEL_7:
      id Property = objc_getProperty(v2, v3, 56, 1);
      goto LABEL_8;
    }
    self = (HMDPrimaryResidentDiscoveryManager *)v2->_dataSource;
  }
  uint64_t v4 = [(HMDPrimaryResidentDiscoveryManager *)self createBackoffTimer];
  v6 = v4;
  if (v2)
  {
    objc_setProperty_atomic(v2, v5, v4, 56);

    objc_msgSend(objc_getProperty(v2, v7, 56, 1), "setDelegate:", v2);
    v8 = v2->_queue;
    id v10 = objc_getProperty(v2, v9, 56, 1);
  }
  else
  {

    [0 setDelegate:0];
    v8 = 0;
    id v10 = 0;
  }
  [v10 setDelegateQueue:v8];

  if (v2) {
    goto LABEL_7;
  }
  id Property = 0;
LABEL_8:
  [Property resume];
}

- (void)completedDiscoveryWithPrimaryResident:(id)a3 primaryResidentGenerationID:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(HMDPrimaryResidentDiscoveryManager *)self _removeRetryTimer];
  id v11 = [(HMDPrimaryResidentDiscoveryManager *)self delegate];
  [v11 discoveryManager:self didCompleteDiscoveryWithPrimaryResidentDevice:v10 primaryResidentGenerationID:v9 error:v8];
}

- (void)sendCheckForResidentsInHomeNotification
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v4 = [WeakRetained home];
  if (v4)
  {
    id v5 = [WeakRetained availableResidentDevices];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      if (self) {
        dataSource = self->_dataSource;
      }
      else {
        dataSource = 0;
      }
      id v8 = dataSource;
      id v9 = [(HMDPrimaryResidentDiscoveryManagerDataSource *)v8 notificationCenter];
      id v10 = objc_msgSend(v4, "uuid", @"kHomeUUID");
      id v11 = [v10 UUIDString];
      uint64_t v18 = v11;
      v12 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      [v9 postNotificationName:@"HMDPrimaryResidentDiscoveryFindResidentsNotification" object:0 userInfo:v12];
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v20 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Home is nil. Not sending HMDPrimaryResidentDiscoveryFindResidentsNotification.", buf, 0xCu);
    }
  }
}

- (void)_discoverPrimaryResident
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (!self)
  {
    dispatch_assert_queue_V2(0);
LABEL_8:
    v27 = (void *)MEMORY[0x230FBD990]();
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v38 = v30;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform the operation because the resident manager context is nil", buf, 0xCu);
    }
    uint64_t v6 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [(HMDPrimaryResidentDiscoveryManager *)v28 completedDiscoveryWithPrimaryResident:0 primaryResidentGenerationID:0 error:v6];
    goto LABEL_11;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_getProperty(self, v3, 48, 1)) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if (!WeakRetained) {
    goto LABEL_8;
  }
  uint64_t v6 = WeakRetained;
  objc_msgSend(objc_getProperty(self, v5, 56, 1), "suspend");
  SEL v7 = [v6 home];
  id v8 = [v7 homeManager];

  id v9 = [v8 currentAccessorySetupMetricDispatcher];
  [v9 markSetupBeginStage:14 error:0];

  id v10 = (void *)[objc_alloc(MEMORY[0x263F42520]) initWithQueue:self->_queue];
  id v11 = self->_dataSource;
  v12 = [(HMDPrimaryResidentDiscoveryManagerDataSource *)v11 createPrimaryResidentDiscoveryOperationWithContext:v6];
  objc_setProperty_atomic(self, v13, v12, 48);

  v15 = objc_msgSend(objc_getProperty(self, v14, 48, 1), "completionFuture");
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke;
  v36[3] = &unk_264A1F910;
  v36[4] = self;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_84;
  v35[3] = &unk_264A2C4C8;
  v35[4] = self;
  id v16 = (id)[v15 inContext:v10 then:v36 orRecover:v35];

  uint64_t v18 = objc_msgSend(objc_getProperty(self, v17, 48, 1), "initialDiscoveryAttemptCompletionFuture");
  v33[4] = self;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_86;
  v34[3] = &unk_264A2C4A0;
  v34[4] = self;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_2;
  v33[3] = &unk_264A2C4C8;
  id v19 = (id)[v18 inContext:v10 then:v34 orRecover:v33];

  v20 = (void *)MEMORY[0x230FBD990]();
  uint64_t v21 = self;
  v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v38 = v23;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling primary resident discovery operation", buf, 0xCu);
  }
  objc_initWeak((id *)buf, v21);
  v24 = self->_dataSource;
  v25 = [(HMDPrimaryResidentDiscoveryManagerDataSource *)v24 transportStartFutureFromContext:v6];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_88;
  v31[3] = &unk_264A2B1B0;
  objc_copyWeak(&v32, (id *)buf);
  id v26 = (id)[v25 inContext:v10 then:v31];

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);

LABEL_11:
}

uint64_t __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 currentPrimaryResident];
  uint64_t v6 = [v3 currentPrimaryResidentGenerationID];
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v5, 48, 1);
  }
  id v9 = [Property logEvent];
  id v10 = *(void **)(a1 + 32);
  if (v10) {
    objc_setProperty_atomic(v10, v8, 0, 48);
  }
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = *(id *)(a1 + 32);
  SEL v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    SEL v14 = HMFGetLogIdentifier();
    int v19 = 138543618;
    v20 = v14;
    __int16 v21 = 2112;
    uint64_t v22 = v4;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Primary resident discovery operation completed with: %@", (uint8_t *)&v19, 0x16u);
  }
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    id v16 = *(void **)(v15 + 32);
  }
  else {
    id v16 = 0;
  }
  SEL v17 = [v16 logEventSubmitter];
  [v17 submitLogEvent:v9];

  [*(id *)(a1 + 32) completedDiscoveryWithPrimaryResident:v4 primaryResidentGenerationID:v6 error:0];
  return 1;
}

uint64_t __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_84(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 48, 1);
  }
  uint64_t v6 = [Property error];
  SEL v7 = (void *)v6;
  if (v6) {
    id v8 = (void *)v6;
  }
  else {
    id v8 = v4;
  }
  id v9 = v8;

  id v11 = *(id *)(a1 + 32);
  if (v11) {
    id v11 = objc_getProperty(v11, v10, 48, 1);
  }
  SEL v13 = [v11 logEvent];
  SEL v14 = *(void **)(a1 + 32);
  if (v14) {
    objc_setProperty_atomic(v14, v12, 0, 48);
  }
  if ([v9 isHMFError] && objc_msgSend(v9, "code") == 12)
  {
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    SEL v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v35 = 138543362;
      v36 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Primary discovery operation canceled", (uint8_t *)&v35, 0xCu);
    }
    [*(id *)(a1 + 32) completedDiscoveryWithPrimaryResident:0 primaryResidentGenerationID:0 error:v9];
  }
  else
  {
    int v19 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) _startRetryTimer]);
    id v20 = *(id *)(a1 + 32);
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      id v24 = *(id *)(a1 + 32);
      if (v24) {
        id v24 = objc_getProperty(v24, v22, 56, 1);
      }
      v25 = [v24 fireDate];
      [v25 timeIntervalSinceNow];
      int v35 = 138543874;
      v36 = v23;
      __int16 v37 = 2112;
      id v38 = v9;
      __int16 v39 = 2048;
      uint64_t v40 = v26;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Primary discovery failed with error: %@, retrying after %.03f seconds", (uint8_t *)&v35, 0x20u);
    }
    uint64_t v27 = *(void *)(a1 + 32);
    if (v27) {
      v28 = *(void **)(v27 + 32);
    }
    else {
      v28 = 0;
    }
    v29 = [v28 logEventSubmitter];
    [v29 submitLogEvent:v13];

    [*(id *)(a1 + 32) sendCheckForResidentsInHomeNotification];
    v30 = [*(id *)(a1 + 32) delegate];
    [v30 discoveryManager:*(void *)(a1 + 32) didNotCompleteDiscoveryWithError:v9];
  }
  id v31 = v9;
  id v32 = v31;
  if (v31)
  {
    id v33 = v31;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_86(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  [v2 discoveryManager:*(void *)(a1 + 32) didCompleteInitialDiscoveryAttemptWithError:0];

  return 1;
}

uint64_t __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 discoveryManager:*(void *)(a1 + 32) didCompleteInitialDiscoveryAttemptWithError:v3];

  id v5 = v3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained) {
    id WeakRetained = objc_getProperty(WeakRetained, v2, 48, 1);
  }
  [WeakRetained run];

  return 1;
}

- (void)cancel
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (objc_getProperty(self, v3, 48, 1))
    {
      id v5 = (void *)MEMORY[0x230FBD990]();
      uint64_t v6 = self;
      id v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v12 = v8;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Cancelling primary resident discovery operation.", buf, 0xCu);
      }
      objc_msgSend(objc_getProperty(v6, v9, 48, 1), "cancel");
    }
    else if (objc_getProperty(self, v4, 56, 1))
    {
      id v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
      -[HMDPrimaryResidentDiscoveryManager completedDiscoveryWithPrimaryResident:primaryResidentGenerationID:error:](self, "completedDiscoveryWithPrimaryResident:primaryResidentGenerationID:error:", 0, 0);
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
  }
}

- (void)discoverPrimaryResident
{
  uint64_t v2 = self;
  if (self) {
    self = (HMDPrimaryResidentDiscoveryManager *)self->_queue;
  }
  dispatch_assert_queue_V2(&self->super);
  [(HMDPrimaryResidentDiscoveryManager *)v2 _discoverPrimaryResident];
}

- (void)configureWithContext:(id)a3
{
  p_context = &self->_context;
  id v5 = a3;
  objc_storeWeak((id *)p_context, v5);
  uint64_t v6 = [v5 home];
  id v7 = [v6 uuid];
  id v8 = [v7 UUIDString];
  logIdentifier = self->_logIdentifier;
  self->_logIdentifier = v8;

  id v12 = [(HMDPrimaryResidentDiscoveryManagerDataSource *)self->_dataSource remoteDeviceMonitorFromContext:v5];

  id v10 = self->_dataSource;
  id v11 = [(HMDPrimaryResidentDiscoveryManagerDataSource *)v10 notificationCenter];
  [v11 addObserver:self selector:sel__handleDeviceMonitorReachableNotification_ name:@"HMDRemoteDeviceMonitorReachableNotification" object:v12];
}

- (HMDPrimaryResidentDiscoveryManager)initWithQueue:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDPrimaryResidentDiscoveryManager;
  SEL v9 = [(HMDPrimaryResidentDiscoveryManager *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    logIdentifier = v10->_logIdentifier;
    v10->_logIdentifier = (NSString *)@"<unconfigured>";

    objc_storeStrong((id *)&v10->_dataSource, a4);
  }

  return v10;
}

- (HMDPrimaryResidentDiscoveryManager)initWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HMDPrimaryResidentDiscoveryManagerDefaultDataSource);
  uint64_t v6 = [(HMDPrimaryResidentDiscoveryManager *)self initWithQueue:v4 dataSource:v5];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_119172 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_119172, &__block_literal_global_119173);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v10_119174;
  return v2;
}

void __49__HMDPrimaryResidentDiscoveryManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v10_119174;
  logCategory__hmf_once_v10_119174 = v0;
}

@end