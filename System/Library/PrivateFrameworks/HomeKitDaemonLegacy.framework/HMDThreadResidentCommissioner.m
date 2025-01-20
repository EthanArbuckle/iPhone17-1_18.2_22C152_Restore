@interface HMDThreadResidentCommissioner
+ (HMDThreadResidentCommissioner)sharedCommissioner;
+ (id)logCategory;
- (HMDThreadRadioClient)threadRadioClient;
- (HMDThreadResidentCommissioner)initWithThreadRadioClient:(id)a3;
- (OS_dispatch_queue)workQueue;
- (id)initInternal;
- (void)_connectToThreadAccessoryWithExtendedMACAddress:(id)a3 completion:(id)a4;
- (void)_informThreadLayerOfResidentChange:(BOOL)a3 primaryResidentIsThreadCapable:(BOOL)a4;
- (void)_startThreadNetworkWithID:(id)a3 completion:(id)a4;
- (void)_startThreadNetworkWithOperationalDataset:(id)a3 threadNetworkID:(id)a4 isOwnerUser:(BOOL)a5 completion:(id)a6;
- (void)_stopThreadNetworkWithCompletion:(id)a3;
- (void)connectToThreadAccessoryWithExtendedMACAddress:(id)a3 completion:(id)a4;
- (void)informThreadLayerOfResidentChange:(BOOL)a3 primaryResidentIsThreadCapable:(BOOL)a4;
- (void)registerForThreadNetworkEvents:(id)a3;
- (void)setGeoAvailable:(BOOL)a3;
- (void)startThreadAccessoryFirmwareUpdateWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5;
- (void)startThreadAccessoryPairingWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5;
- (void)startThreadNetworkWithID:(id)a3 completion:(id)a4;
- (void)startThreadNetworkWithOperationalDataset:(id)a3 threadNetworkID:(id)a4 isOwnerUser:(BOOL)a5 completion:(id)a6;
- (void)stopThreadAccessoryFirmwareUpdateWithCompletion:(id)a3;
- (void)stopThreadAccessoryPairingWithCompletion:(id)a3;
- (void)stopThreadNetworkOnDeviceLockWithCompletion:(id)a3;
- (void)stopThreadNetworkWithCompletion:(id)a3;
- (void)unregisterForThreadNetworkEvents:(id)a3;
@end

@implementation HMDThreadResidentCommissioner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadRadioClient, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (HMDThreadRadioClient)threadRadioClient
{
  return self->_threadRadioClient;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)_informThreadLayerOfResidentChange:(BOOL)a3 primaryResidentIsThreadCapable:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [(HMDThreadResidentCommissioner *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDThreadResidentCommissioner *)self threadRadioClient];
  [v8 informThreadLayerOfResidentChange:v5 primaryResidentIsThreadCapable:v4];
}

- (void)informThreadLayerOfResidentChange:(BOOL)a3 primaryResidentIsThreadCapable:(BOOL)a4
{
  v7 = [(HMDThreadResidentCommissioner *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__HMDThreadResidentCommissioner_informThreadLayerOfResidentChange_primaryResidentIsThreadCapable___block_invoke;
  v8[3] = &unk_1E6A0F918;
  v8[4] = self;
  BOOL v9 = a3;
  BOOL v10 = a4;
  dispatch_async(v7, v8);
}

uint64_t __98__HMDThreadResidentCommissioner_informThreadLayerOfResidentChange_primaryResidentIsThreadCapable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _informThreadLayerOfResidentChange:*(unsigned __int8 *)(a1 + 40) primaryResidentIsThreadCapable:*(unsigned __int8 *)(a1 + 41)];
}

- (void)unregisterForThreadNetworkEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDThreadResidentCommissioner *)self threadRadioClient];
  [v5 unregisterForThreadNetworkEvents:v4];
}

- (void)registerForThreadNetworkEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDThreadResidentCommissioner *)self threadRadioClient];
  [v5 registerForThreadNetworkEvents:v4];
}

- (void)stopThreadAccessoryFirmwareUpdateWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling stopThreadAccessoryFirmwareUpdateWithCompletion", buf, 0xCu);
  }
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    BOOL v9 = [(HMDThreadResidentCommissioner *)v6 workQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__HMDThreadResidentCommissioner_stopThreadAccessoryFirmwareUpdateWithCompletion___block_invoke;
    v15[3] = &unk_1E6A19530;
    v15[4] = v6;
    id v16 = v4;
    dispatch_async(v9, v15);
  }
  else
  {
    BOOL v10 = (void *)MEMORY[0x1D9452090]();
    v11 = v6;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Thread Service feature is not enabled", buf, 0xCu);
    }
    v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
    (*((void (**)(id, void *))v4 + 2))(v4, v14);
  }
}

void __81__HMDThreadResidentCommissioner_stopThreadAccessoryFirmwareUpdateWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) threadRadioClient];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__HMDThreadResidentCommissioner_stopThreadAccessoryFirmwareUpdateWithCompletion___block_invoke_2;
  v4[3] = &unk_1E6A17D78;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 stopFirmwareUpdateWithCompletion:v4];
}

uint64_t __81__HMDThreadResidentCommissioner_stopThreadAccessoryFirmwareUpdateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startThreadAccessoryFirmwareUpdateWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = (void *)MEMORY[0x1D9452090]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v25 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling startThreadAccessoryFirmwareUpdateWithExtendedMACAddress", buf, 0xCu);
  }
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    v14 = [(HMDThreadResidentCommissioner *)v11 workQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __113__HMDThreadResidentCommissioner_startThreadAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke;
    v20[3] = &unk_1E6A16328;
    v20[4] = v11;
    id v21 = v8;
    BOOL v23 = a4;
    id v22 = v9;
    dispatch_async(v14, v20);
  }
  else
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = v11;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Thread Service feature is not enabled", buf, 0xCu);
    }
    uint64_t v19 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
    (*((void (**)(id, void *))v9 + 2))(v9, v19);
  }
}

void __113__HMDThreadResidentCommissioner_startThreadAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) threadRadioClient];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __113__HMDThreadResidentCommissioner_startThreadAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke_2;
  v6[3] = &unk_1E6A17D78;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 startFirmwareUpdateWithExtendedMACAddress:v4 isWedDevice:v3 completion:v6];
}

uint64_t __113__HMDThreadResidentCommissioner_startThreadAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)stopThreadAccessoryPairingWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling stopThreadAccessoryPairingWithCompletion", buf, 0xCu);
  }
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    id v9 = [(HMDThreadResidentCommissioner *)v6 workQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__HMDThreadResidentCommissioner_stopThreadAccessoryPairingWithCompletion___block_invoke;
    v15[3] = &unk_1E6A19530;
    v15[4] = v6;
    id v16 = v4;
    dispatch_async(v9, v15);
  }
  else
  {
    BOOL v10 = (void *)MEMORY[0x1D9452090]();
    v11 = v6;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Thread Service feature is not enabled", buf, 0xCu);
    }
    v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
    (*((void (**)(id, void *))v4 + 2))(v4, v14);
  }
}

void __74__HMDThreadResidentCommissioner_stopThreadAccessoryPairingWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) threadRadioClient];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__HMDThreadResidentCommissioner_stopThreadAccessoryPairingWithCompletion___block_invoke_2;
  v4[3] = &unk_1E6A17D78;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 stopThreadPairingWithCompletion:v4];
}

uint64_t __74__HMDThreadResidentCommissioner_stopThreadAccessoryPairingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startThreadAccessoryPairingWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = (void *)MEMORY[0x1D9452090]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v25 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling startThreadAccessoryPairingWithExtendedMACAddress", buf, 0xCu);
  }
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    v14 = [(HMDThreadResidentCommissioner *)v11 workQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __106__HMDThreadResidentCommissioner_startThreadAccessoryPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke;
    v20[3] = &unk_1E6A16328;
    v20[4] = v11;
    id v21 = v8;
    BOOL v23 = a4;
    id v22 = v9;
    dispatch_async(v14, v20);
  }
  else
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = v11;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Thread Service feature is not enabled", buf, 0xCu);
    }
    uint64_t v19 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
    (*((void (**)(id, void *))v9 + 2))(v9, v19);
  }
}

void __106__HMDThreadResidentCommissioner_startThreadAccessoryPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) threadRadioClient];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __106__HMDThreadResidentCommissioner_startThreadAccessoryPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke_2;
  v6[3] = &unk_1E6A17D78;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 startThreadPairingWithExtendedMACAddress:v4 isWedDevice:v3 completion:v6];
}

uint64_t __106__HMDThreadResidentCommissioner_startThreadAccessoryPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_connectToThreadAccessoryWithExtendedMACAddress:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDThreadResidentCommissioner *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x1D9452090]();
  BOOL v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to connect to accessory with emac %@", buf, 0x16u);
  }
  v13 = [(HMDThreadResidentCommissioner *)v10 threadRadioClient];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__HMDThreadResidentCommissioner__connectToThreadAccessoryWithExtendedMACAddress_completion___block_invoke;
  v15[3] = &unk_1E6A17D78;
  v15[4] = v10;
  id v16 = v7;
  id v14 = v7;
  [v13 connectToExtendedMACAddress:v6 completion:v15];
}

uint64_t __92__HMDThreadResidentCommissioner__connectToThreadAccessoryWithExtendedMACAddress_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)connectToThreadAccessoryWithExtendedMACAddress:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  BOOL v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v22 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling connectToThreadAccessoryWithExtendedMACAddress", buf, 0xCu);
  }
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    v12 = [(HMDThreadResidentCommissioner *)v9 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__HMDThreadResidentCommissioner_connectToThreadAccessoryWithExtendedMACAddress_completion___block_invoke;
    block[3] = &unk_1E6A193D0;
    block[4] = v9;
    id v19 = v6;
    id v20 = v7;
    dispatch_async(v12, block);
  }
  else
  {
    v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = v9;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v22 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Thread Service feature is not enabled", buf, 0xCu);
    }
    v17 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
    (*((void (**)(id, void *))v7 + 2))(v7, v17);
  }
}

uint64_t __91__HMDThreadResidentCommissioner_connectToThreadAccessoryWithExtendedMACAddress_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectToThreadAccessoryWithExtendedMACAddress:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_stopThreadNetworkWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDThreadResidentCommissioner *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping thread network", buf, 0xCu);
  }
  BOOL v10 = [(HMDThreadResidentCommissioner *)v7 threadRadioClient];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HMDThreadResidentCommissioner__stopThreadNetworkWithCompletion___block_invoke;
  v12[3] = &unk_1E6A17D78;
  v12[4] = v7;
  id v13 = v4;
  id v11 = v4;
  [v10 stopThreadNetworkWithCompletion:v12];
}

void __66__HMDThreadResidentCommissioner__stopThreadNetworkWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v8;
      __int16 v18 = 2112;
      id v19 = v3;
      id v9 = "%{public}@Failed to stop thread network: %@";
      BOOL v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v10, v11, v9, (uint8_t *)&v16, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v16 = 138543362;
    v17 = v8;
    id v9 = "%{public}@Stopped thread network";
    BOOL v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 12;
    goto LABEL_6;
  }

  id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 postNotificationName:@"HMDThreadNetworkStateChangeNotification" object:0];

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v14, v15);
}

- (void)stopThreadNetworkOnDeviceLockWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@stopThreadNetworkOnDeviceLock: Scheduling stopThreadNetworkWithCompletion", buf, 0xCu);
  }
  if (!CFPreferencesGetAppBooleanValue(@"StartThreadOnWake", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))goto LABEL_8; {
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"StartThreadOnWakeAllowHomeThreadStop", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0);
  }
  BOOL v10 = (void *)MEMORY[0x1D9452090]();
  os_log_type_t v11 = v6;
  uint32_t v12 = HMFGetOSLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (AppBooleanValue)
  {
    if (v13)
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Allowing stop thread", buf, 0xCu);
    }
LABEL_8:
    uint64_t v15 = [(HMDThreadResidentCommissioner *)v6 workQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__HMDThreadResidentCommissioner_stopThreadNetworkOnDeviceLockWithCompletion___block_invoke;
    v17[3] = &unk_1E6A19530;
    v17[4] = v6;
    id v18 = v4;
    dispatch_async(v15, v17);

    goto LABEL_12;
  }
  if (v13)
  {
    int v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v16;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Suppressing thread stop on device lock - thread will stop by itself", buf, 0xCu);
  }
  (*((void (**)(id, void))v4 + 2))(v4, 0);
LABEL_12:
}

uint64_t __77__HMDThreadResidentCommissioner_stopThreadNetworkOnDeviceLockWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopThreadNetworkWithCompletion:*(void *)(a1 + 40)];
}

- (void)stopThreadNetworkWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"StartThreadOnWake", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0);
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (AppBooleanValue)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v16 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Suppressing thread stop", buf, 0xCu);
    }
    v4[2](v4, 0);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v16 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling stopThreadNetworkWithCompletion", buf, 0xCu);
    }
    uint32_t v12 = [(HMDThreadResidentCommissioner *)v7 workQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__HMDThreadResidentCommissioner_stopThreadNetworkWithCompletion___block_invoke;
    v13[3] = &unk_1E6A19530;
    v13[4] = v7;
    uint64_t v14 = v4;
    dispatch_async(v12, v13);
  }
}

uint64_t __65__HMDThreadResidentCommissioner_stopThreadNetworkWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopThreadNetworkWithCompletion:*(void *)(a1 + 40)];
}

- (void)_startThreadNetworkWithOperationalDataset:(id)a3 threadNetworkID:(id)a4 isOwnerUser:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  BOOL v13 = [(HMDThreadResidentCommissioner *)self workQueue];
  dispatch_assert_queue_V2(v13);

  uint64_t v14 = (void *)MEMORY[0x1D9452090]();
  uint64_t v15 = self;
  int v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v27 = v17;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Starting thread network id %@ with operational dataset %@", buf, 0x20u);
  }
  id v18 = [(HMDThreadResidentCommissioner *)v15 threadRadioClient];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __114__HMDThreadResidentCommissioner__startThreadNetworkWithOperationalDataset_threadNetworkID_isOwnerUser_completion___block_invoke;
  v22[3] = &unk_1E6A19A28;
  v22[4] = v15;
  id v23 = v11;
  id v24 = v10;
  id v25 = v12;
  id v19 = v12;
  id v20 = v10;
  id v21 = v11;
  [v18 startThreadNetworkWithOperationalDataset:v20 isOwnerUser:v7 completion:v22];
}

void __114__HMDThreadResidentCommissioner__startThreadNetworkWithOperationalDataset_threadNetworkID_isOwnerUser_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 48);
      int v12 = 138543874;
      BOOL v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to start thread network %@: %@", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      BOOL v13 = v10;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Started thread network", (uint8_t *)&v12, 0xCu);
    }
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"HMDThreadNetworkStateChangeNotification" object:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)startThreadNetworkWithOperationalDataset:(id)a3 threadNetworkID:(id)a4 isOwnerUser:(BOOL)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  BOOL v13 = (void *)MEMORY[0x1D9452090]();
  __int16 v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v27 = v16;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling startThreadNetworkWithOperationalDataset", buf, 0xCu);
  }
  id v17 = [(HMDThreadResidentCommissioner *)v14 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __113__HMDThreadResidentCommissioner_startThreadNetworkWithOperationalDataset_threadNetworkID_isOwnerUser_completion___block_invoke;
  block[3] = &unk_1E6A17B40;
  block[4] = v14;
  id v22 = v10;
  BOOL v25 = a5;
  id v23 = v11;
  id v24 = v12;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(v17, block);
}

uint64_t __113__HMDThreadResidentCommissioner_startThreadNetworkWithOperationalDataset_threadNetworkID_isOwnerUser_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startThreadNetworkWithOperationalDataset:*(void *)(a1 + 40) threadNetworkID:*(void *)(a1 + 48) isOwnerUser:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

- (void)_startThreadNetworkWithID:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDThreadResidentCommissioner *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v20 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Starting thread network", buf, 0xCu);
  }
  BOOL v13 = [(HMDThreadResidentCommissioner *)v10 threadRadioClient];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__HMDThreadResidentCommissioner__startThreadNetworkWithID_completion___block_invoke;
  v16[3] = &unk_1E6A0D208;
  v16[4] = v10;
  id v17 = v6;
  id v18 = v7;
  id v14 = v7;
  id v15 = v6;
  [v13 startThreadNetwork:v15 completion:v16];
}

void __70__HMDThreadResidentCommissioner__startThreadNetworkWithID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      int v15 = 138543618;
      __int16 v16 = v11;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Started thread network: %@", (uint8_t *)&v15, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"HMDThreadNetworkStateChangeNotification" object:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = HMFGetLogIdentifier();
      id v14 = *(void **)(a1 + 40);
      int v15 = 138543874;
      __int16 v16 = v13;
      __int16 v17 = 2112;
      id v18 = v14;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to start thread network %@: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setGeoAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1D9452090](self, a2);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 1024;
    BOOL v13 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Setting isGeoAvailable: %d", (uint8_t *)&v10, 0x12u);
  }
  uint64_t v9 = [(HMDThreadResidentCommissioner *)v6 threadRadioClient];
  [v9 setIsGeoAvailable:v3];
}

- (void)startThreadNetworkWithID:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v19 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling startThreadNetworkWithID", buf, 0xCu);
  }
  __int16 v12 = [(HMDThreadResidentCommissioner *)v9 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__HMDThreadResidentCommissioner_startThreadNetworkWithID_completion___block_invoke;
  block[3] = &unk_1E6A193D0;
  block[4] = v9;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

uint64_t __69__HMDThreadResidentCommissioner_startThreadNetworkWithID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startThreadNetworkWithID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (id)initInternal
{
  BOOL v3 = objc_opt_new();
  id v4 = [(HMDThreadResidentCommissioner *)self initWithThreadRadioClient:v3];

  return v4;
}

- (HMDThreadResidentCommissioner)initWithThreadRadioClient:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDThreadResidentCommissioner;
  id v6 = [(HMDThreadResidentCommissioner *)&v13 init];
  if (v6)
  {
    id v7 = (const char *)HMFDispatchQueueName();
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v9 = dispatch_get_global_queue(17, 0);
    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2(v7, v8, v9);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v6->_threadRadioClient, a3);
  }

  return v6;
}

+ (HMDThreadResidentCommissioner)sharedCommissioner
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained(&sharedCommissioner_weakCommissioner);
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = a1;
  if (WeakRetained)
  {
    HMFGetOSLogHandle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = HMFGetLogIdentifier();
      int v11 = 138543362;
      __int16 v12 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Reusing existing commissioner", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    HMFGetOSLogHandle();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      __int16 v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Creating new commissioner", (uint8_t *)&v11, 0xCu);
    }
    id WeakRetained = [[HMDThreadResidentCommissioner alloc] initInternal];
    objc_storeWeak(&sharedCommissioner_weakCommissioner, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedCommissioner_lock);
  return (HMDThreadResidentCommissioner *)WeakRetained;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_78272 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_78272, &__block_literal_global_78273);
  }
  v2 = (void *)logCategory__hmf_once_v1_78274;
  return v2;
}

uint64_t __44__HMDThreadResidentCommissioner_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_78274;
  logCategory__hmf_once_v1_78274 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end