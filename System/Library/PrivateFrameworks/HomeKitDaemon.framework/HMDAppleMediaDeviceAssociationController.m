@interface HMDAppleMediaDeviceAssociationController
+ (id)logCategory;
- (BOOL)_currentDeviceHasDeviceAddress;
- (BOOL)_statusBusy;
- (HMDAppleMediaDeviceAssociationController)initWithHome:(id)a3 accessory:(id)a4 dataSource:(id)a5;
- (HMDAppleMediaDeviceAssociationController)initWithQueue:(id)a3 homeUUID:(id)a4 accessoryUUID:(id)a5 residentSyncManager:(id)a6 backingStore:(id)a7 notificationCenter:(id)a8 dataSource:(id)a9;
- (HMDAppleMediaDeviceAssociationControllerDataSource)dataSource;
- (HMDBackingStore)backingStore;
- (HMDResidentSyncManager)residentSyncManager;
- (HMDTimerProvider)timerProvider;
- (HMFTimer)backoffTimer;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)accessoryUUID;
- (NSUUID)homeUUID;
- (OS_dispatch_queue)queue;
- (double)nextInterval;
- (id)_deviceAssociationInfoFromProtoData:(id)a3;
- (id)logIdentifier;
- (id)mkfAppleMediaAccessoryWithModelIdentifier:(id)a3;
- (id)mkfAppleMediaModelFinder;
- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4;
- (int64_t)timerIntervalIndex;
- (void)_handleAppleAccountManagerResolvedNotification:(id)a3;
- (void)_handleDeviceUpdatedNotification:(id)a3;
- (void)_handleHMDAppleMediaDeviceAssociationPushMessage:(id)a3;
- (void)_handlePrimaryChange:(id)a3;
- (void)_handlePrimaryResidentDeviceAddressUpdate;
- (void)_process;
- (void)_pushDeviceAddress;
- (void)_pushDeviceAddressIfNeeded;
- (void)_registerForMessages:(id)a3 messageDispatcher:(id)a4;
- (void)_registerForNotifications:(id)a3;
- (void)_setStatusBusy:(BOOL)a3;
- (void)_shouldPushDeviceAddressWithCompletion:(id)a3;
- (void)_startRetryTimer;
- (void)_updateIdsAddressWithAccessoryUUID:(id)a3 idsIdentifier:(id)a4 idsDestination:(id)a5 completion:(id)a6;
- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4;
- (void)handleTransactionObjectUpdated;
- (void)setBackoffTimer:(id)a3;
- (void)setMkfAppleMediaModelFinder:(id)a3;
- (void)setTimerIntervalIndex:(int64_t)a3;
- (void)setTimerProvider:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDAppleMediaDeviceAssociationController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mkfAppleMediaModelFinder, 0);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_destroyWeak((id *)&self->_timerProvider);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_residentSyncManager, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setMkfAppleMediaModelFinder:(id)a3
{
}

- (id)mkfAppleMediaModelFinder
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setTimerIntervalIndex:(int64_t)a3
{
  self->_timerIntervalIndex = a3;
}

- (int64_t)timerIntervalIndex
{
  return self->_timerIntervalIndex;
}

- (void)setBackoffTimer:(id)a3
{
}

- (HMFTimer)backoffTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTimerProvider:(id)a3
{
}

- (HMDTimerProvider)timerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timerProvider);
  return (HMDTimerProvider *)WeakRetained;
}

- (HMDAppleMediaDeviceAssociationControllerDataSource)dataSource
{
  return (HMDAppleMediaDeviceAssociationControllerDataSource *)objc_getProperty(self, a2, 64, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 56, 1);
}

- (HMDBackingStore)backingStore
{
  return (HMDBackingStore *)objc_getProperty(self, a2, 48, 1);
}

- (HMDResidentSyncManager)residentSyncManager
{
  return (HMDResidentSyncManager *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDAppleMediaDeviceAssociationController *)self homeUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)mkfAppleMediaAccessoryWithModelIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = [(HMDAppleMediaDeviceAssociationController *)self mkfAppleMediaModelFinder];

    if (v6)
    {
      v7 = [(HMDAppleMediaDeviceAssociationController *)self mkfAppleMediaModelFinder];
      v8 = ((void (**)(void, void *))v7)[2](v7, v5);
    }
    else
    {
      v8 = +[HMCContext findAppleMediaAccessoryWithModelID:v5];
    }

    return v8;
  }
  else
  {
    v10 = (HMDAppleMediaDeviceAssociationController *)_HMFPreconditionFailure();
    [(HMDAppleMediaDeviceAssociationController *)v10 nextInterval];
  }
  return result;
}

- (double)nextInterval
{
  v3 = objc_msgSend(&unk_26E474020, "objectAtIndexedSubscript:", -[HMDAppleMediaDeviceAssociationController timerIntervalIndex](self, "timerIntervalIndex"));
  [v3 doubleValue];
  double v5 = v4;

  unint64_t v6 = [(HMDAppleMediaDeviceAssociationController *)self timerIntervalIndex];
  if (v6 < [&unk_26E474020 count] - 1) {
    [(HMDAppleMediaDeviceAssociationController *)self setTimerIntervalIndex:[(HMDAppleMediaDeviceAssociationController *)self timerIntervalIndex] + 1];
  }
  return v5;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAppleMediaDeviceAssociationController *)self backoffTimer];

  unint64_t v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  v9 = v8;
  if (v5 == v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      SEL v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Backoff timer fired, retry", buf, 0xCu);
    }
    v12 = [(HMDAppleMediaDeviceAssociationController *)v7 backoffTimer];
    [v12 suspend];

    [(HMDAppleMediaDeviceAssociationController *)v7 setBackoffTimer:0];
    v13 = [(HMDAppleMediaDeviceAssociationController *)v7 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__HMDAppleMediaDeviceAssociationController_timerDidFire___block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = v7;
    dispatch_async(v13, block);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Wrong timer", buf, 0xCu);
    }
  }
}

uint64_t __57__HMDAppleMediaDeviceAssociationController_timerDidFire___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _process];
}

- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  id v4 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:a4 options:a3];
  return v4;
}

- (void)_setStatusBusy:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_busy = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_statusBusy
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_busy;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)_deviceAssociationInfoFromProtoData:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAppleMediaDeviceAssociationController *)self queue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = [[HMDDeviceAssociationInfoProto alloc] initWithProtoData:v4];
  if (v6)
  {
    v7 = [(HMDDeviceAssociationInfoProto *)v6 accessoryUUID];
    if (!v7) {
      goto LABEL_8;
    }
    uint64_t v8 = [(HMDDeviceAssociationInfoProto *)v6 idsIdentifier];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(HMDDeviceAssociationInfoProto *)v6 idsDestination];

      if (v10)
      {
        v7 = v6;
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (void)_handleHMDAppleMediaDeviceAssociationPushMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAppleMediaDeviceAssociationController *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __93__HMDAppleMediaDeviceAssociationController__handleHMDAppleMediaDeviceAssociationPushMessage___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __93__HMDAppleMediaDeviceAssociationController__handleHMDAppleMediaDeviceAssociationPushMessage___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) dataForKey:@"HMDAppleMediaDeviceAssociationInfoProtoKey"];
  if (v2)
  {
    v3 = [*(id *)(a1 + 40) _deviceAssociationInfoFromProtoData:v2];
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    v7 = v6;
    if (v3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        v9 = [*(id *)(a1 + 32) shortDescription];
        v10 = [v3 accessoryUUID];
        *(_DWORD *)buf = 138543874;
        v26 = v8;
        __int16 v27 = 2112;
        v28 = v9;
        __int16 v29 = 2112;
        v30 = v10;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling remote message: %@ accessory: %@", buf, 0x20u);
      }
      SEL v11 = [*(id *)(a1 + 40) residentSyncManager];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __93__HMDAppleMediaDeviceAssociationController__handleHMDAppleMediaDeviceAssociationPushMessage___block_invoke_60;
      v23[3] = &unk_264A2AFF0;
      uint64_t v12 = *(void *)(a1 + 32);
      v23[4] = *(void *)(a1 + 40);
      id v13 = v3;
      id v24 = v13;
      [v11 interceptRemoteResidentRequest:v12 proceed:v23];
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v26 = v20;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to create device association info object", buf, 0xCu);
      }
      v21 = *(void **)(a1 + 32);
      v22 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
      [v21 respondWithError:v22];

      id v13 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 40);
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      __int16 v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Missing proto data from the message: %@", buf, 0x16u);
    }
    v19 = *(void **)(a1 + 32);
    id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
    [v19 respondWithError:v13];
  }
}

void __93__HMDAppleMediaDeviceAssociationController__handleHMDAppleMediaDeviceAssociationPushMessage___block_invoke_60(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v16 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Intercepting remote resident request message", buf, 0xCu);
  }
  id v8 = *(void **)(a1 + 32);
  v9 = [*(id *)(a1 + 40) accessoryUUID];
  v10 = [*(id *)(a1 + 40) idsIdentifier];
  SEL v11 = [*(id *)(a1 + 40) idsDestination];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __93__HMDAppleMediaDeviceAssociationController__handleHMDAppleMediaDeviceAssociationPushMessage___block_invoke_61;
  v13[3] = &unk_264A2F370;
  v13[4] = *(void *)(a1 + 32);
  id v14 = v3;
  id v12 = v3;
  [v8 _updateIdsAddressWithAccessoryUUID:v9 idsIdentifier:v10 idsDestination:v11 completion:v13];
}

void __93__HMDAppleMediaDeviceAssociationController__handleHMDAppleMediaDeviceAssociationPushMessage___block_invoke_61(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      SEL v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Remote message update failed: error: %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v3];
  }
  else
  {
    if (v7)
    {
      v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      SEL v11 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Remote message update succeeded", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) respondWithSuccess];
  }
}

- (void)_updateIdsAddressWithAccessoryUUID:(id)a3 idsIdentifier:(id)a4 idsDestination:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  uint64_t v14 = [(HMDAppleMediaDeviceAssociationController *)self backingStore];
  id v15 = [v14 context];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __119__HMDAppleMediaDeviceAssociationController__updateIdsAddressWithAccessoryUUID_idsIdentifier_idsDestination_completion___block_invoke;
  v20[3] = &unk_264A2B760;
  objc_copyWeak(&v25, &location);
  id v16 = v10;
  id v21 = v16;
  id v17 = v13;
  id v24 = v17;
  id v18 = v11;
  id v22 = v18;
  id v19 = v12;
  id v23 = v19;
  [v15 performBlock:v20];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __119__HMDAppleMediaDeviceAssociationController__updateIdsAddressWithAccessoryUUID_idsIdentifier_idsDestination_completion___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = [WeakRetained mkfAppleMediaAccessoryWithModelIdentifier:*(void *)(a1 + 32)];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 resident];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = WeakRetained;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = HMFGetLogIdentifier();
        uint64_t v10 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        __int16 v27 = v9;
        __int16 v28 = 2112;
        uint64_t v29 = v10;
        __int16 v30 = 2112;
        uint64_t v31 = v11;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Update IDS identifier: %@ destination: %@", buf, 0x20u);
      }
      [v4 setIdsIdentifier:*(void *)(a1 + 40)];
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = [v4 resident];
      [v13 setIdsIdentifier:v12];

      [v4 setIdsDestination:*(void *)(a1 + 48)];
      uint64_t v14 = *(void *)(a1 + 48);
      id v15 = [v4 resident];
      [v15 setIdsDestination:v14];

      id v16 = [v7 backingStore];
      id v17 = [v16 context];
      id v25 = 0;
      [v17 save:&v25];
      id v18 = v25;

      id v19 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      goto LABEL_10;
    }
  }
  v20 = (void *)MEMORY[0x230FBD990]();
  id v21 = WeakRetained;
  id v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v27 = v23;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@MKF models do not exist for media accessory and resident", buf, 0xCu);
  }
  [v21 _setStatusBusy:0];
  uint64_t v24 = *(void *)(a1 + 56);
  if (v24)
  {
    id v18 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
    id v19 = *(void (**)(void))(v24 + 16);
LABEL_10:
    v19();
  }
}

- (void)_handlePrimaryResidentDeviceAddressUpdate
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAppleMediaDeviceAssociationController *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(HMDAppleMediaDeviceAssociationController *)self _statusBusy];
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v8)
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v19 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Controller is busy: do not update primary locally", buf, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v19 = v10;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Primary resident: update device IDS address locally", buf, 0xCu);
    }
    [(HMDAppleMediaDeviceAssociationController *)v6 _setStatusBusy:1];
    uint64_t v11 = [(HMDAppleMediaDeviceAssociationController *)v6 dataSource];
    uint64_t v12 = [v11 currentDevice];
    id v13 = [v12 deviceAddress];
    uint64_t v14 = [(HMDAppleMediaDeviceAssociationController *)v6 accessoryUUID];
    id v15 = [v13 idsIdentifier];
    id v16 = [v13 idsDestination];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __85__HMDAppleMediaDeviceAssociationController__handlePrimaryResidentDeviceAddressUpdate__block_invoke;
    v17[3] = &unk_264A2F3E8;
    v17[4] = v6;
    [(HMDAppleMediaDeviceAssociationController *)v6 _updateIdsAddressWithAccessoryUUID:v14 idsIdentifier:v15 idsDestination:v16 completion:v17];
  }
}

void __85__HMDAppleMediaDeviceAssociationController__handlePrimaryResidentDeviceAddressUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __85__HMDAppleMediaDeviceAssociationController__handlePrimaryResidentDeviceAddressUpdate__block_invoke_2;
  v7[3] = &unk_264A2F820;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __85__HMDAppleMediaDeviceAssociationController__handlePrimaryResidentDeviceAddressUpdate__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Primary local update failed: error %@", (uint8_t *)&v11, 0x16u);
    }
    [*(id *)(a1 + 40) _startRetryTimer];
  }
  else
  {
    if (v6)
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Primary local update succeeded", (uint8_t *)&v11, 0xCu);
    }
  }
  return [*(id *)(a1 + 40) _setStatusBusy:0];
}

- (void)_startRetryTimer
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAppleMediaDeviceAssociationController *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAppleMediaDeviceAssociationController *)self backoffTimer];

  if (v4)
  {
    uint64_t v5 = [(HMDAppleMediaDeviceAssociationController *)self backoffTimer];
    [v5 suspend];

    [(HMDAppleMediaDeviceAssociationController *)self setBackoffTimer:0];
  }
  uint64_t v6 = [(HMDAppleMediaDeviceAssociationController *)self nextInterval];
  double v8 = v7;
  uint64_t v9 = (void *)MEMORY[0x230FBD990](v6);
  uint64_t v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v18 = 138543618;
    id v19 = v12;
    __int16 v20 = 2048;
    double v21 = v8;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting timer with interval: %f", (uint8_t *)&v18, 0x16u);
  }
  __int16 v13 = [(HMDAppleMediaDeviceAssociationController *)v10 timerWithTimeInterval:8 options:v8];
  [(HMDAppleMediaDeviceAssociationController *)v10 setBackoffTimer:v13];

  uint64_t v14 = [(HMDAppleMediaDeviceAssociationController *)v10 backoffTimer];
  [v14 setDelegate:v10];

  uint64_t v15 = [(HMDAppleMediaDeviceAssociationController *)v10 queue];
  id v16 = [(HMDAppleMediaDeviceAssociationController *)v10 backoffTimer];
  [v16 setDelegateQueue:v15];

  id v17 = [(HMDAppleMediaDeviceAssociationController *)v10 backoffTimer];
  [v17 resume];
}

- (void)_pushDeviceAddress
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAppleMediaDeviceAssociationController *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAppleMediaDeviceAssociationController *)self dataSource];
  if ([v4 isCurrentDeviceConfirmedPrimary])
  {
    [(HMDAppleMediaDeviceAssociationController *)self _handlePrimaryResidentDeviceAddressUpdate];
  }
  else
  {
    BOOL v5 = [(HMDAppleMediaDeviceAssociationController *)self _statusBusy];
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    double v7 = self;
    double v8 = HMFGetOSLogHandle();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v9)
      {
        uint64_t v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v36 = v10;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Controller is busy: do not send push message", buf, 0xCu);
      }
    }
    else
    {
      if (v9)
      {
        int v11 = HMFGetLogIdentifier();
        uint64_t v12 = [(HMDAppleMediaDeviceAssociationController *)v7 messageTargetUUID];
        *(_DWORD *)buf = 138543618;
        v36 = v11;
        __int16 v37 = 2112;
        v38 = v12;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Sending remote message with target: %@", buf, 0x16u);
      }
      [(HMDAppleMediaDeviceAssociationController *)v7 _setStatusBusy:1];
      __int16 v13 = [v4 currentDevice];
      uint64_t v14 = [v13 deviceAddress];
      id v15 = objc_alloc(MEMORY[0x263F42570]);
      id v16 = [(HMDAppleMediaDeviceAssociationController *)v7 messageTargetUUID];
      id v17 = (void *)[v15 initWithTarget:v16];

      int v18 = [HMDDeviceAssociationInfoProto alloc];
      id v19 = [(HMDAppleMediaDeviceAssociationController *)v7 accessoryUUID];
      __int16 v20 = [v14 idsIdentifier];
      double v21 = [v14 idsDestination];
      uint64_t v22 = [(HMDDeviceAssociationInfoProto *)v18 initWithAccessoryUUID:v19 idsIdentifier:v20 idsDestination:v21];

      v33 = @"HMDAppleMediaDeviceAssociationInfoProtoKey";
      id v23 = [(HMDDeviceAssociationInfoProto *)v22 protoData];
      v34 = v23;
      uint64_t v24 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];

      id v25 = (void *)[objc_alloc(MEMORY[0x263F42590]) initWithName:@"HMDAM.p" destination:v17 payload:v24];
      objc_initWeak((id *)buf, v25);
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      uint64_t v29 = __62__HMDAppleMediaDeviceAssociationController__pushDeviceAddress__block_invoke;
      __int16 v30 = &unk_264A2D420;
      objc_copyWeak(&v32, (id *)buf);
      uint64_t v31 = v7;
      [v25 setResponseHandler:&v27];
      v26 = [(HMDAppleMediaDeviceAssociationController *)v7 residentSyncManager];
      [v26 performResidentRequest:v25 options:0];

      [(HMDAppleMediaDeviceAssociationController *)v7 _startRetryTimer];
      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __62__HMDAppleMediaDeviceAssociationController__pushDeviceAddress__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([*(id *)(a1 + 32) _statusBusy] & 1) == 0)
  {
    double v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      int v22 = 138543362;
      id v23 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Controller status set to idle prematurely", (uint8_t *)&v22, 0xCu);
    }
  }
  uint64_t v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = HMFGetOSLogHandle();
  id v15 = v14;
  if (v5)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = [WeakRetained shortDescription];
      int v22 = 138543874;
      id v23 = v16;
      __int16 v24 = 2112;
      id v25 = v17;
      __int16 v26 = 2112;
      id v27 = v5;
      int v18 = "%{public}@Remote message %@ failed with error: %@";
      id v19 = v15;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      uint32_t v21 = 32;
LABEL_10:
      _os_log_impl(&dword_22F52A000, v19, v20, v18, (uint8_t *)&v22, v21);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    id v17 = [WeakRetained shortDescription];
    int v22 = 138543618;
    id v23 = v16;
    __int16 v24 = 2112;
    id v25 = v17;
    int v18 = "%{public}@Remote message %@ succeeded";
    id v19 = v15;
    os_log_type_t v20 = OS_LOG_TYPE_INFO;
    uint32_t v21 = 22;
    goto LABEL_10;
  }

  [*(id *)(a1 + 32) _setStatusBusy:0];
}

- (void)_shouldPushDeviceAddressWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  id v5 = [(HMDAppleMediaDeviceAssociationController *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDAppleMediaDeviceAssociationController *)self _statusBusy])
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    double v7 = self;
    double v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v24 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Controller busy: do not push", buf, 0xCu);
    }
    v4[2](v4, 0);
  }
  else
  {
    uint64_t v10 = [(HMDAppleMediaDeviceAssociationController *)self dataSource];
    int v11 = [v10 currentDevice];

    if (v11
      && ([v11 deviceAddress], uint64_t v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      objc_initWeak((id *)buf, self);
      id v13 = [(HMDAppleMediaDeviceAssociationController *)self backingStore];
      uint64_t v14 = [v13 context];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __83__HMDAppleMediaDeviceAssociationController__shouldPushDeviceAddressWithCompletion___block_invoke;
      v19[3] = &unk_264A2D108;
      objc_copyWeak(&v22, (id *)buf);
      uint32_t v21 = v4;
      id v20 = v11;
      [v14 performBlock:v19];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = self;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v24 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Current device has no IDS address: do not push", buf, 0xCu);
      }
      v4[2](v4, 0);
    }
  }
}

void __83__HMDAppleMediaDeviceAssociationController__shouldPushDeviceAddressWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained accessoryUUID];
  id v4 = [WeakRetained mkfAppleMediaAccessoryWithModelIdentifier:v3];

  if (!v4 || ([v4 resident], id v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    uint64_t v30 = MEMORY[0x230FBD990]();
    id v31 = WeakRetained;
    id v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v48 = v33;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@No MKF model: do not push", buf, 0xCu);
    }
    uint64_t v29 = (void *)v30;
    goto LABEL_17;
  }
  id v6 = [v4 idsIdentifier];
  double v7 = [*(id *)(a1 + 32) deviceAddress];
  double v8 = [v7 idsIdentifier];
  if (!HMFEqualObjects()) {
    goto LABEL_20;
  }
  id v9 = [v4 idsDestination];
  uint64_t v10 = [*(id *)(a1 + 32) deviceAddress];
  int v11 = [v10 idsDestination];
  if (!HMFEqualObjects())
  {
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  v46 = [v4 resident];
  uint64_t v12 = [v46 idsIdentifier];
  v44 = [*(id *)(a1 + 32) deviceAddress];
  [v44 idsIdentifier];
  id v13 = v45 = (void *)v12;
  if (!HMFEqualObjects())
  {

    goto LABEL_19;
  }
  v41 = [v4 resident];
  [v41 idsDestination];
  uint64_t v14 = v40 = v10;
  uint64_t v39 = [*(id *)(a1 + 32) deviceAddress];
  [v39 idsDestination];
  id v15 = v42 = v9;
  int v43 = HMFEqualObjects();

  if (v43)
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = WeakRetained;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      id v20 = [v4 idsIdentifier];
      uint32_t v21 = [v4 idsDestination];
      *(_DWORD *)buf = 138543874;
      v48 = v19;
      __int16 v49 = 2112;
      v50 = v20;
      __int16 v51 = 2112;
      v52 = v21;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@IDS identifier: %@ destination: %@", buf, 0x20u);
    }
    id v22 = [v17 backoffTimer];

    if (v22)
    {
      __int16 v24 = [v17 backoffTimer];
      [v24 suspend];

      uint64_t v23 = [v17 setBackoffTimer:0];
    }
    uint64_t v25 = MEMORY[0x230FBD990](v23);
    id v26 = v17;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v48 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@MKF model IDS address already set: do not push", buf, 0xCu);
    }
    uint64_t v29 = (void *)v25;
LABEL_17:
    v34 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_24;
  }
LABEL_21:
  v35 = (void *)MEMORY[0x230FBD990]();
  id v36 = WeakRetained;
  __int16 v37 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    v38 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v48 = v38;
    _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@MKF model IDS not set: should push", buf, 0xCu);
  }
  v34 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_24:
  v34();
}

- (void)_pushDeviceAddressIfNeeded
{
  id v3 = [(HMDAppleMediaDeviceAssociationController *)self queue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__HMDAppleMediaDeviceAssociationController__pushDeviceAddressIfNeeded__block_invoke;
  v4[3] = &unk_264A1E530;
  objc_copyWeak(&v5, &location);
  [(HMDAppleMediaDeviceAssociationController *)self _shouldPushDeviceAddressWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __70__HMDAppleMediaDeviceAssociationController__pushDeviceAddressIfNeeded__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__HMDAppleMediaDeviceAssociationController__pushDeviceAddressIfNeeded__block_invoke_2;
  v5[3] = &unk_264A2B870;
  char v6 = a2;
  v5[4] = WeakRetained;
  dispatch_async(v4, v5);
}

uint64_t __70__HMDAppleMediaDeviceAssociationController__pushDeviceAddressIfNeeded__block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _pushDeviceAddress];
  }
  return result;
}

- (BOOL)_currentDeviceHasDeviceAddress
{
  uint64_t v2 = [(HMDAppleMediaDeviceAssociationController *)self dataSource];
  id v3 = [v2 currentDevice];

  if (v3)
  {
    id v4 = [v3 deviceAddress];
    if (v4)
    {
      id v5 = [v3 deviceAddress];
      char v6 = [v5 idsIdentifier];
      if (v6)
      {
        double v7 = [v3 deviceAddress];
        double v8 = [v7 idsDestination];
        BOOL v9 = v8 != 0;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_process
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAppleMediaDeviceAssociationController *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAppleMediaDeviceAssociationController *)self dataSource];
  char v5 = [v4 homeHasConfirmedPrimaryResident];

  if ((v5 & 1) == 0)
  {
    char v6 = (void *)MEMORY[0x230FBD990]();
    double v7 = self;
    double v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v9;
      uint64_t v10 = "%{public}@Do not process: home has no primary";
LABEL_10:
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v11, 0xCu);
    }
LABEL_11:

    return;
  }
  if (![(HMDAppleMediaDeviceAssociationController *)self _currentDeviceHasDeviceAddress])
  {
    char v6 = (void *)MEMORY[0x230FBD990]();
    double v7 = self;
    double v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v9;
      uint64_t v10 = "%{public}@Do not process: current device has no IDS address";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  [(HMDAppleMediaDeviceAssociationController *)self _pushDeviceAddressIfNeeded];
}

- (void)_handlePrimaryChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x230FBD990]();
  char v6 = self;
  double v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = HMFGetLogIdentifier();
    BOOL v9 = [v4 name];
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handle notification: %@", buf, 0x16u);
  }
  uint64_t v10 = [(HMDAppleMediaDeviceAssociationController *)v6 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__HMDAppleMediaDeviceAssociationController__handlePrimaryChange___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = v6;
  dispatch_async(v10, block);
}

uint64_t __65__HMDAppleMediaDeviceAssociationController__handlePrimaryChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _process];
}

- (void)handleTransactionObjectUpdated
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  char v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Handle transaction object updated", buf, 0xCu);
  }
  double v7 = [(HMDAppleMediaDeviceAssociationController *)v4 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__HMDAppleMediaDeviceAssociationController_handleTransactionObjectUpdated__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = v4;
  dispatch_async(v7, block);
}

uint64_t __74__HMDAppleMediaDeviceAssociationController_handleTransactionObjectUpdated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _process];
}

- (void)_handleDeviceUpdatedNotification:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x230FBD990]();
  char v6 = self;
  double v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = HMFGetLogIdentifier();
    BOOL v9 = [v4 name];
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handle notification: %@", buf, 0x16u);
  }
  uint64_t v10 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  uint64_t v13 = [(HMDAppleMediaDeviceAssociationController *)v6 dataSource];
  __int16 v14 = [v13 currentDevice];

  if (v12
    && v14
    && ([v14 identifier],
        id v15 = objc_claimAutoreleasedReturnValue(),
        [v12 identifier],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = objc_msgSend(v15, "hmf_isEqualToUUID:", v16),
        v16,
        v15,
        (v17 & 1) != 0))
  {
    int v18 = [(HMDAppleMediaDeviceAssociationController *)v6 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__HMDAppleMediaDeviceAssociationController__handleDeviceUpdatedNotification___block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = v6;
    dispatch_async(v18, block);
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = v6;
    uint32_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Not the current device, do not process", buf, 0xCu);
    }
  }
}

uint64_t __77__HMDAppleMediaDeviceAssociationController__handleDeviceUpdatedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _process];
}

- (void)_handleAppleAccountManagerResolvedNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x230FBD990]();
  char v6 = self;
  double v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = HMFGetLogIdentifier();
    BOOL v9 = [v4 name];
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handle notification: %@", buf, 0x16u);
  }
  uint64_t v10 = [(HMDAppleMediaDeviceAssociationController *)v6 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__HMDAppleMediaDeviceAssociationController__handleAppleAccountManagerResolvedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = v6;
  dispatch_async(v10, block);
}

uint64_t __91__HMDAppleMediaDeviceAssociationController__handleAppleAccountManagerResolvedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _process];
}

- (void)_registerForNotifications:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x230FBD990]();
  char v6 = self;
  double v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = HMFGetLogIdentifier();
    int v16 = 138543362;
    char v17 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Register for notifications", (uint8_t *)&v16, 0xCu);
  }
  BOOL v9 = [(HMDAppleMediaDeviceAssociationController *)v6 notificationCenter];
  [v9 removeObserver:v6 name:@"HMDAppleAccountManagerResolved" object:0];

  uint64_t v10 = [(HMDAppleMediaDeviceAssociationController *)v6 notificationCenter];
  [v10 addObserver:v6 selector:sel__handleAppleAccountManagerResolvedNotification_ name:@"HMDAppleAccountManagerResolved" object:0];

  uint64_t v11 = [(HMDAppleMediaDeviceAssociationController *)v6 notificationCenter];
  [v11 removeObserver:v6 name:@"HMDDeviceUpdatedNotification" object:0];

  id v12 = [(HMDAppleMediaDeviceAssociationController *)v6 notificationCenter];
  [v12 addObserver:v6 selector:sel__handleDeviceUpdatedNotification_ name:@"HMDDeviceUpdatedNotification" object:0];

  uint64_t v13 = [(HMDAppleMediaDeviceAssociationController *)v6 notificationCenter];
  [v13 removeObserver:v6 name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:0];

  __int16 v14 = [(HMDAppleMediaDeviceAssociationController *)v6 notificationCenter];
  id v15 = [v4 residentDeviceManager];
  [v14 addObserver:v6 selector:sel__handlePrimaryChange_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v15];
}

- (void)_registerForMessages:(id)a3 messageDispatcher:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)MEMORY[0x230FBD990]();
  BOOL v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    id v20 = @"HMDAM.p";
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Register for message: %@", buf, 0x16u);
  }
  id v12 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v12, "setRoles:", objc_msgSend(v12, "roles") | 8);
  uint64_t v13 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v16[0] = v13;
  __int16 v14 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v6 userPrivilege:3 remoteAccessRequired:0];
  v16[1] = v14;
  v16[2] = v12;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];

  [v7 registerForMessage:@"HMDAM.p" receiver:v9 policies:v15 selector:sel__handleHMDAppleMediaDeviceAssociationPushMessage_];
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  double v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  BOOL v9 = (void *)MEMORY[0x230FBD990]();
  uint64_t v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    uint64_t v13 = [(HMDAppleMediaDeviceAssociationController *)v10 homeUUID];
    __int16 v14 = [(HMDAppleMediaDeviceAssociationController *)v10 accessoryUUID];
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    id v20 = v13;
    __int16 v21 = 2112;
    id v22 = v14;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Configuring with home: %@ accessory: %@", buf, 0x20u);
  }
  [(HMDAppleMediaDeviceAssociationController *)v10 _registerForMessages:v6 messageDispatcher:v8];
  [(HMDAppleMediaDeviceAssociationController *)v10 _registerForNotifications:v6];
  id v15 = [(HMDAppleMediaDeviceAssociationController *)v10 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__HMDAppleMediaDeviceAssociationController_configureWithHome_messageDispatcher___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = v10;
  dispatch_async(v15, block);
}

uint64_t __80__HMDAppleMediaDeviceAssociationController_configureWithHome_messageDispatcher___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _process];
}

- (HMDAppleMediaDeviceAssociationController)initWithQueue:(id)a3 homeUUID:(id)a4 accessoryUUID:(id)a5 residentSyncManager:(id)a6 backingStore:(id)a7 notificationCenter:(id)a8 dataSource:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)HMDAppleMediaDeviceAssociationController;
  uint64_t v18 = [(HMDAppleMediaDeviceAssociationController *)&v26 init];
  __int16 v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v19->_homeUUID, a4);
    objc_storeStrong((id *)&v19->_accessoryUUID, a5);
    objc_storeStrong((id *)&v19->_residentSyncManager, a6);
    objc_storeStrong((id *)&v19->_backingStore, a7);
    objc_storeStrong((id *)&v19->_notificationCenter, a8);
    objc_storeStrong((id *)&v19->_dataSource, a9);
  }

  return v19;
}

- (HMDAppleMediaDeviceAssociationController)initWithHome:(id)a3 accessory:(id)a4 dataSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  uint64_t v11 = v10;
  id v12 = [v8 workQueue];

  if (!v12)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  uint64_t v13 = [v8 uuid];

  if (!v13)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  __int16 v14 = [v8 residentSyncManager];

  if (!v14)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  id v15 = [v8 backingStore];

  if (!v15)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  id v16 = [v8 backingStore];
  id v17 = [v16 context];

  if (!v17)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v9)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  uint64_t v18 = [v9 uuid];

  if (v18)
  {
    __int16 v19 = [v8 workQueue];
    id v20 = [v8 uuid];
    id v21 = [v9 uuid];
    id v22 = [v8 residentSyncManager];
    id v23 = [v8 backingStore];
    id v24 = [MEMORY[0x263F08A00] defaultCenter];
    id v25 = [(HMDAppleMediaDeviceAssociationController *)self initWithQueue:v19 homeUUID:v20 accessoryUUID:v21 residentSyncManager:v22 backingStore:v23 notificationCenter:v24 dataSource:v11];

    return v25;
  }
LABEL_17:
  id v27 = (void *)_HMFPreconditionFailure();
  return (HMDAppleMediaDeviceAssociationController *)+[HMDAppleMediaDeviceAssociationController logCategory];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t39_83525 != -1) {
    dispatch_once(&logCategory__hmf_once_t39_83525, &__block_literal_global_83526);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v40_83527;
  return v2;
}

void __55__HMDAppleMediaDeviceAssociationController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v40_83527;
  logCategory__hmf_once_v40_83527 = v0;
}

@end