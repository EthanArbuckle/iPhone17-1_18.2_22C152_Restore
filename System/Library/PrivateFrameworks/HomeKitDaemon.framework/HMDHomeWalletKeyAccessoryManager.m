@interface HMDHomeWalletKeyAccessoryManager
+ (id)createMatterIssuerKeyDataForUser:(id)a3 withUserIndex:(id)a4 flow:(id)a5;
+ (id)logCategory;
- (BOOL)canConfigureAccessories;
- (BOOL)isCurrentDevicePrimaryResident;
- (BOOL)isPrimaryResidentOrSoleOwnerController;
- (HMDDevice)primaryResidentDevice;
- (HMDHome)home;
- (HMDHomeWalletDataSource)dataSource;
- (HMDHomeWalletKeyAccessoryManager)initWithUUID:(id)a3 workQueue:(id)a4;
- (HMDHomeWalletKeyAccessoryManager)initWithUUID:(id)a3 workQueue:(id)a4 dataSource:(id)a5 notificationCenter:(id)a6;
- (HMDHomeWalletKeyAccessoryManagerDelegate)delegate;
- (HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation)pendingPrimaryResidentDeviceCredentialKeyOperation;
- (HMFMessageDispatcher)messageDispatcher;
- (NSArray)matterAccessoriesSupportingWalletKey;
- (NSMutableDictionary)nfcReaderKeyConfigureStateByAccessoryUUID;
- (NSMutableDictionary)pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID;
- (NSMutableSet)logEvents;
- (NSNotificationCenter)notificationCenter;
- (NSNumber)walletKeyColor;
- (NSString)walletKeyColorPreferenceKey;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)_addIssuerKeyForUser:(id)a3 toMatterAccessory:(id)a4 flow:(id)a5;
- (id)addIssuerKeyForUser:(id)a3 toMatterAccessory:(id)a4 flow:(id)a5;
- (id)addIssuerKeysToMatterAccessories:(id)a3 flow:(id)a4;
- (id)addIssuerKeysToMatterAccessory:(id)a3 flow:(id)a4;
- (id)addIssuerKeysToMatterTTUAccessoriesForUser:(id)a3 flow:(id)a4;
- (id)configureMatterAccessory:(id)a3 withDeviceCredentialKey:(id)a4 ofType:(int64_t)a5 forUser:(id)a6 flow:(id)a7;
- (id)configureNFCReaderKeyOnMatterAccessory:(id)a3 flow:(id)a4;
- (id)configureReaderKey:(id)a3 onACWGAccessory:(id)a4 flow:(id)a5;
- (id)fetchMissingWalletKeysForAccessory:(id)a3 users:(id)a4 flow:(id)a5;
- (id)fetchMissingWalletKeysForAccessoryUUID:(id)a3 forUser:(id)a4 flow:(id)a5;
- (id)fetchMissingWalletKeysForUserUUID:(id)a3 flow:(id)a4;
- (id)fetchWalletKeyColorForAccessories_HAP:(id)a3 home:(id)a4 flow:(id)a5;
- (id)fetchWalletKeyColorForAccessories_Matter:(id)a3 home:(id)a4 flow:(id)a5;
- (id)logIdentifier;
- (id)missingWalletKeysForAccessoryUUID:(id)a3 usersByUniqueID:(id)a4 accessoryUsersByUniqueID:(id)a5 flow:(id)a6;
- (id)performHAPWriteRequestsHH2:(id)a3 home:(id)a4 flow:(id)a5;
- (id)restoreMissingWalletKeys:(id)a3 onAccessory:(id)a4 flow:(id)a5;
- (id)walletKeyColorWithCharacteristicValue:(id)a3 flow:(id)a4;
- (id)writeRequestsWithAccessories:(id)a3 home:(id)a4 deviceCredentialKey:(id)a5 user:(id)a6 flow:(id)a7;
- (void)_handleAddIssuerKeysToAccessoriesMessage:(id)a3;
- (void)addIssuerKeysToMatterAccessoriesWithFlow:(id)a3;
- (void)configureAccessories:(id)a3 withDeviceCredentialKey:(id)a4 ofType:(int64_t)a5 flow:(id)a6 completion:(id)a7;
- (void)configureAccessories:(id)a3 withDeviceCredentialKey:(id)a4 ofType:(int64_t)a5 forDeviceWithUUID:(id)a6 user:(id)a7 flow:(id)a8 completion:(id)a9;
- (void)configureAccessories_HH1:(id)a3 withDeviceCredentialKey:(id)a4 forDeviceWithUUID:(id)a5 user:(id)a6 flow:(id)a7 completion:(id)a8;
- (void)configureAccessories_HH2:(id)a3 withDeviceCredentialKey:(id)a4 ofType:(int64_t)a5 forDeviceWithUUID:(id)a6 user:(id)a7 flow:(id)a8 completion:(id)a9;
- (void)configureAccessory:(id)a3 withDeviceCredentialKey:(id)a4 ofType:(int64_t)a5 flow:(id)a6 completion:(id)a7;
- (void)configureAccessoryWithNfcReaderKey:(id)a3 accessory:(id)a4 flow:(id)a5 completion:(id)a6;
- (void)configureAllAccessoriesWithDeviceCredentialKey:(id)a3 ofType:(int64_t)a4 flow:(id)a5 completion:(id)a6;
- (void)configureNFCReaderKeyForAccessory:(id)a3 flow:(id)a4;
- (void)configureNFCReaderKeyForAllAccessoriesWithReason:(id)a3;
- (void)configureNotificationsWithReason:(id)a3;
- (void)configureWithHome:(id)a3;
- (void)createAccessoryDeviceCredentialKeyPendingOperationWithAccessories:(id)a3 deviceCredentialKey:(id)a4 user:(id)a5 deviceUUID:(id)a6;
- (void)createAccessoryDeviceCredentialKeyPendingOperationWithAccessoriesUUIDs:(id)a3 deviceCredentialKey:(id)a4 user:(id)a5 deviceUUID:(id)a6;
- (void)fetchIsAccessoryConfiguredWithReaderKey:(id)a3 accessory:(id)a4 flow:(id)a5 completion:(id)a6;
- (void)fetchOrConfigureNFCReaderKeyForAccessory:(id)a3 flow:(id)a4 completion:(id)a5;
- (void)fetchWalletKeyColorForAccessories:(id)a3 flow:(id)a4 withCompletion:(id)a5;
- (void)fetchWalletKeyColorWithAccessory:(id)a3 flow:(id)a4;
- (void)fetchWalletKeyColorWithFlow:(id)a3 completion:(id)a4;
- (void)handleAccessoryCharacteristicsChangedNotification:(id)a3;
- (void)handleAccessoryConfigured:(id)a3;
- (void)handleConfigureAccessoriesWithDeviceCredentialKeyMessage:(id)a3;
- (void)handleFetchMissingWalletKeysMessage:(id)a3;
- (void)handleFetchWalletKeyColorMessage:(id)a3;
- (void)handleHMDHomeConfigureMatterAccessoryWithReaderKeyMessage:(id)a3;
- (void)handleHomeAccessoryRemovedNotification:(id)a3;
- (void)handleHomeAddedAccessoryNotification:(id)a3;
- (void)handleHomeDidDisableCharacteristicNotification:(id)a3;
- (void)handleHomeDidEnableCharacteristicNotification:(id)a3;
- (void)handleHomeNFCReaderKeyKeychainItemAvailableNotification:(id)a3;
- (void)handleHomeUserAddedNotification:(id)a3;
- (void)handlePendingDeviceCredentialKeysSyncForAccessories:(id)a3 withReason:(id)a4;
- (void)handlePendingDeviceCredentialKeysSyncForAccessory:(id)a3 withReason:(id)a4;
- (void)handlePrimaryResidentUpdateNotification:(id)a3;
- (void)handleRestoreMissingWalletKeysMessage:(id)a3;
- (void)handleWalletKeyRemoved;
- (void)handleWalletKeySupportDidChange:(id)a3;
- (void)registerForNotificationsWithReason:(id)a3;
- (void)removeNfcReaderKeyWithIdentifier:(id)a3 accessory:(id)a4 flow:(id)a5 completion:(id)a6;
- (void)requestPrimaryResident:(id)a3 toConfigureAccessories:(id)a4 withDeviceCredentialKey:(id)a5 ofType:(int64_t)a6 flow:(id)a7 completion:(id)a8;
- (void)setCanConfigureAccessories:(BOOL)a3;
- (void)setCurrentDevicePrimaryResident:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setLogEvents:(id)a3;
- (void)setMessageDispatcher:(id)a3;
- (void)setPendingPrimaryResidentDeviceCredentialKeyOperation:(id)a3;
- (void)startHomeWalletKeyAddForAccessoryUUID:(id)a3 keyType:(unint64_t)a4 expectedCount:(int64_t)a5;
- (void)unconfigure;
- (void)unregisterForNotificationsWithReason:(id)a3;
- (void)updateHomeWalletKeyAddForAccessoryUUID:(id)a3 keyType:(unint64_t)a4;
@end

@implementation HMDHomeWalletKeyAccessoryManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEvents, 0);
  objc_storeStrong((id *)&self->_walletKeyColor, 0);
  objc_storeStrong((id *)&self->_nfcReaderKeyConfigureStateByAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_pendingPrimaryResidentDeviceCredentialKeyOperation, 0);
  objc_storeStrong((id *)&self->_pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLogEvents:(id)a3
{
}

- (NSMutableSet)logEvents
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (NSNumber)walletKeyColor
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableDictionary)nfcReaderKeyConfigureStateByAccessoryUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPendingPrimaryResidentDeviceCredentialKeyOperation:(id)a3
{
}

- (HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation)pendingPrimaryResidentDeviceCredentialKeyOperation
{
  return (HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableDictionary)pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCanConfigureAccessories:(BOOL)a3
{
  self->_canConfigureAccessories = a3;
}

- (BOOL)canConfigureAccessories
{
  return self->_canConfigureAccessories;
}

- (void)setCurrentDevicePrimaryResident:(BOOL)a3
{
  self->_currentDevicePrimaryResident = a3;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  return self->_currentDevicePrimaryResident;
}

- (HMDHomeWalletDataSource)dataSource
{
  return (HMDHomeWalletDataSource *)objc_getProperty(self, a2, 64, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMDHomeWalletKeyAccessoryManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDHomeWalletKeyAccessoryManagerDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDHomeWalletKeyAccessoryManager *)self uuid];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)updateHomeWalletKeyAddForAccessoryUUID:(id)a3 keyType:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(HMDHomeWalletKeyAccessoryManager *)self logEvents];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __83__HMDHomeWalletKeyAccessoryManager_updateHomeWalletKeyAddForAccessoryUUID_keyType___block_invoke;
  v14 = &unk_264A291F0;
  id v15 = v6;
  unint64_t v16 = a4;
  id v8 = v6;
  v9 = objc_msgSend(v7, "na_firstObjectPassingTest:", &v11);

  if (objc_msgSend(v9, "incrementCompleted", v11, v12, v13, v14))
  {
    v10 = [(HMDHomeWalletKeyAccessoryManager *)self logEvents];
    [v10 removeObject:v9];
  }
}

BOOL __83__HMDHomeWalletKeyAccessoryManager_updateHomeWalletKeyAddForAccessoryUUID_keyType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 accessoryUUID];
  if (objc_msgSend(v4, "hmf_isEqualToUUID:", *(void *)(a1 + 32))) {
    BOOL v5 = [v3 keyType] == *(void *)(a1 + 40);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)startHomeWalletKeyAddForAccessoryUUID:(id)a3 keyType:(unint64_t)a4 expectedCount:(int64_t)a5
{
  id v8 = a3;
  v9 = [(HMDHomeWalletKeyAccessoryManager *)self logEvents];
  v10 = objc_msgSend(v9, "na_filter:", &__block_literal_global_378_224183);
  uint64_t v11 = (void *)[v10 mutableCopy];
  [(HMDHomeWalletKeyAccessoryManager *)self setLogEvents:v11];

  uint64_t v12 = [(HMDHomeWalletKeyAccessoryManager *)self logEvents];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __96__HMDHomeWalletKeyAccessoryManager_startHomeWalletKeyAddForAccessoryUUID_keyType_expectedCount___block_invoke_2;
  v22 = &unk_264A291F0;
  id v13 = v8;
  id v23 = v13;
  unint64_t v24 = a4;
  v14 = objc_msgSend(v12, "na_firstObjectPassingTest:", &v19);

  if (!v14)
  {
    id v15 = [(HMDHomeWalletKeyAccessoryManager *)self logEvents];
    unint64_t v16 = [HMDHomeKeySetupLockLogEvent alloc];
    v17 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
    v18 = [(HMDHomeKeySetupLockLogEvent *)v16 initWithAccessoryUUID:v13 withKeyType:a4 expectedCount:a5 queue:v17];
    [v15 addObject:v18];
  }
}

BOOL __96__HMDHomeWalletKeyAccessoryManager_startHomeWalletKeyAddForAccessoryUUID_keyType_expectedCount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 accessoryUUID];
  if (objc_msgSend(v4, "hmf_isEqualToUUID:", *(void *)(a1 + 32))) {
    BOOL v5 = [v3 keyType] == *(void *)(a1 + 40);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __96__HMDHomeWalletKeyAccessoryManager_startHomeWalletKeyAddForAccessoryUUID_keyType_expectedCount___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSubmitted] ^ 1;
}

- (id)fetchWalletKeyColorForAccessories_HAP:(id)a3 home:(id)a4 flow:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  uint64_t v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    id v15 = [v10 UUID];
    *(_DWORD *)buf = 138543874;
    v35 = v14;
    __int16 v36 = 2112;
    v37 = v15;
    __int16 v38 = 2112;
    id v39 = v8;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching wallet key color for HAP accessories: %@", buf, 0x20u);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __84__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_HAP_home_flow___block_invoke;
  v32[3] = &unk_264A29180;
  v32[4] = v12;
  id v16 = v10;
  id v33 = v16;
  v17 = objc_msgSend(v8, "na_map:", v32);
  uint64_t v18 = [v17 count];
  uint64_t v19 = (void *)MEMORY[0x263F58190];
  if (v18)
  {
    id v20 = objc_alloc_init(MEMORY[0x263F58190]);
    objc_initWeak((id *)buf, v12);
    v21 = [(HMFObject *)v12 description];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __84__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_HAP_home_flow___block_invoke_375;
    v27[3] = &unk_264A291A8;
    objc_copyWeak(&v31, (id *)buf);
    id v22 = v20;
    id v28 = v22;
    id v29 = v17;
    id v30 = v16;
    [v9 readCharacteristicValues:v29 source:7 sourceForLogging:v21 qualityOfService:-1 withCompletionHandler:v27];

    id v23 = v30;
    id v24 = v22;

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v25 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    id v24 = [v19 futureWithError:v25];
  }
  return v24;
}

id __84__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_HAP_home_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)*MEMORY[0x263F0D610];
  BOOL v5 = [v3 findServiceWithServiceType:*MEMORY[0x263F0D610]];
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 findCharacteristicWithType:@"0000026C-0000-1000-8000-0026BB765291"];
    if (v7)
    {
      id v8 = +[HMDCharacteristicRequest requestWithCharacteristic:v7];
    }
    else
    {
      id v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = *(id *)(a1 + 32);
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        uint64_t v19 = [*(id *)(a1 + 40) UUID];
        id v20 = [v3 shortDescription];
        int v22 = 138544386;
        id v23 = v18;
        __int16 v24 = 2112;
        v25 = v19;
        __int16 v26 = 2112;
        v27 = v20;
        __int16 v28 = 2112;
        id v29 = v6;
        __int16 v30 = 2112;
        id v31 = @"0000026C-0000-1000-8000-0026BB765291";
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch wallet key color options: %@, accessory information service: %@ doesn't support hardware finish characteristic: %@", (uint8_t *)&v22, 0x34u);
      }
      id v8 = 0;
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      id v13 = [*(id *)(a1 + 40) UUID];
      v14 = [v3 shortDescription];
      int v22 = 138544130;
      id v23 = v12;
      __int16 v24 = 2112;
      v25 = v13;
      __int16 v26 = 2112;
      v27 = v14;
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch wallet key color options: %@, accessory information service not supported %@", (uint8_t *)&v22, 0x2Au);
    }
    id v8 = 0;
  }

  return v8;
}

void __84__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_HAP_home_flow___block_invoke_375(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = [WeakRetained workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_HAP_home_flow___block_invoke_2;
    block[3] = &unk_264A2E908;
    id v11 = a1[5];
    id v12 = v4;
    id v13 = v6;
    id v14 = a1[6];
    id v15 = a1[4];
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = a1[4];
    id v9 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v8 finishWithError:v9];
  }
}

void __84__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_HAP_home_flow___block_invoke_2(id *a1)
{
  v1 = a1;
  uint64_t v53 = *MEMORY[0x263EF8340];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = a1[4];
  v34 = v1;
  uint64_t v36 = [obj countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v39;
    *(void *)&long long v2 = 138544386;
    long long v31 = v2;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        BOOL v5 = objc_msgSend(v4, "characteristic", v31);
        id v6 = v1[5];
        id v37 = 0;
        v7 = objc_msgSend(v6, "hmd_valueOfCharacteristic:error:", v5, &v37);
        id v8 = v37;
        if (v7)
        {
          id v9 = v7;
          objc_opt_class();
          int v10 = objc_opt_isKindOfClass() & 1;
          if (v10) {
            id v11 = v9;
          }
          else {
            id v11 = 0;
          }
          id v12 = v11;

          if (v10)
          {
            v1 = v34;
            uint64_t v13 = [v34[6] walletKeyColorWithCharacteristicValue:v9 flow:v34[7]];
            if (v13)
            {
              __int16 v30 = (void *)v13;

              [v34[8] finishWithResult:v30];
              goto LABEL_25;
            }
          }
          else
          {
            uint64_t v19 = (void *)MEMORY[0x230FBD990]();
            v1 = v34;
            id v20 = v34[6];
            v21 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              int v22 = v32 = v19;
              id v23 = [v34[7] UUID];
              uint64_t v24 = objc_opt_class();
              *(_DWORD *)buf = v31;
              v43 = v22;
              __int16 v44 = 2112;
              v45 = v23;
              __int16 v46 = 2112;
              v47 = v4;
              __int16 v48 = 2112;
              id v49 = v9;
              __int16 v50 = 2112;
              uint64_t v51 = v24;
              _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Characteristic value in the read request: %@ is not of type %@:%@", buf, 0x34u);

              v1 = v34;
              uint64_t v19 = v32;
            }
          }
        }
        else
        {
          id v14 = (void *)MEMORY[0x230FBD990]();
          id v15 = v1[6];
          id v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = HMFGetLogIdentifier();
            uint64_t v18 = [v1[7] UUID];
            *(_DWORD *)buf = 138544130;
            v43 = v17;
            __int16 v44 = 2112;
            v45 = v18;
            __int16 v46 = 2112;
            v47 = v4;
            __int16 v48 = 2112;
            id v49 = v8;
            _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Characteristic read request failed with error %@:%@", buf, 0x2Au);
          }
        }
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v36);
  }

  v25 = (void *)MEMORY[0x230FBD990]();
  id v26 = v1[6];
  v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    __int16 v28 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v43 = v28;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Failed to find wallet key color for HAP accessories", buf, 0xCu);

    v1 = v34;
  }

  id v29 = v1[8];
  __int16 v30 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
  [v29 finishWithError:v30];
LABEL_25:
}

- (id)fetchWalletKeyColorForAccessories_Matter:(id)a3 home:(id)a4 flow:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    id v15 = [v10 UUID];
    *(_DWORD *)buf = 138543874;
    v27 = v14;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 2112;
    id v31 = v8;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching wallet key color for Matter accessories: %@", buf, 0x20u);
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke;
  v24[3] = &unk_264A29130;
  id v16 = v10;
  id v25 = v16;
  v17 = objc_msgSend(v8, "na_map:", v24);
  uint64_t v18 = [v17 combineAllFutures];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke_3;
  v22[3] = &unk_264A29158;
  v22[4] = v12;
  id v23 = v16;
  id v19 = v16;
  id v20 = [v18 flatMap:v22];

  return v20;
}

id __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 waitForDoorLockClusterObjectWithFlow:*(void *)(a1 + 32)];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke_2;
  v7[3] = &unk_264A29108;
  id v8 = *(id *)(a1 + 32);
  id v4 = [v3 then:v7];
  BOOL v5 = [v4 naFuture];

  return v5;
}

id __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_369);
  BOOL v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_372_224198);

  if (v5)
  {
    id v6 = [MEMORY[0x263F58190] futureWithResult:v5];
  }
  else
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) UUID];
      int v15 = 138543618;
      id v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to find wallet key color for Matter accessories", (uint8_t *)&v15, 0x16u);
    }
    id v12 = (void *)MEMORY[0x263F58190];
    uint64_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    id v6 = [v12 futureWithResult:v13];
  }
  return v6;
}

BOOL __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 integerValue] >= 0;
}

id __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

void __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "fetchAccessoryColor_flow:", *(void *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    BOOL v5 = v4;
  }
  else
  {
    id v6 = (HMDHomeWalletKeyAccessoryManager *)_HMFPreconditionFailure();
    [(HMDHomeWalletKeyAccessoryManager *)v6 fetchWalletKeyColorForAccessories:v8 flow:v9 withCompletion:v10];
  }
}

- (void)fetchWalletKeyColorForAccessories:(id)a3 flow:(id)a4 withCompletion:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(HMDHomeWalletKeyAccessoryManager *)self dataSource];
  uint64_t v13 = [(HMDHomeWalletKeyAccessoryManager *)self walletKeyColorPreferenceKey];
  id v14 = [v12 numberValueFromNoBackupStoreWithKey:v13];

  if (v14)
  {
    int v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      uint64_t v19 = [v9 UUID];
      *(_DWORD *)buf = 138543618;
      v43 = v18;
      __int16 v44 = 2112;
      v45 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Skipping fetch, returning wallet key color from persistence store", buf, 0x16u);
    }
    v10[2](v10, v14, 0);
  }
  else
  {
    id v20 = [(HMDHomeWalletKeyAccessoryManager *)self home];
    if (v20)
    {
      v21 = objc_msgSend(v8, "na_filter:", &__block_literal_global_362_224208);
      uint64_t v36 = objc_msgSend(v8, "na_filter:", &__block_literal_global_364_224209);
      uint64_t v35 = [(HMDHomeWalletKeyAccessoryManager *)self fetchWalletKeyColorForAccessories_Matter:v21 home:v20 flow:v9];
      int v22 = [(HMDHomeWalletKeyAccessoryManager *)self fetchWalletKeyColorForAccessories_HAP:v36 home:v20 flow:v9];
      id v38 = v8;
      id v23 = (void *)MEMORY[0x263F58190];
      v41[0] = v35;
      v41[1] = v22;
      uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
      id v25 = (void *)MEMORY[0x263F581B8];
      [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
      id v26 = v37 = v20;
      v27 = [v25 schedulerWithDispatchQueue:v26];
      __int16 v28 = [v23 combineAllFutures:v24 ignoringErrors:1 scheduler:v27];
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __90__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_flow_withCompletion___block_invoke_3;
      v39[3] = &unk_264A290E0;
      v39[4] = self;
      long long v40 = v10;
      id v29 = (id)[v28 addSuccessBlock:v39];

      id v8 = v38;
      id v20 = v37;
    }
    else
    {
      __int16 v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = self;
      uint64_t v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v33 = HMFGetLogIdentifier();
        v34 = [v9 UUID];
        *(_DWORD *)buf = 138543618;
        v43 = v33;
        __int16 v44 = 2112;
        v45 = v34;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch wallet key color options, home is nil", buf, 0x16u);
      }
      v21 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      ((void (**)(id, void *, void *))v10)[2](v10, 0, v21);
    }
  }
}

void __90__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_flow_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_367_224211);
  BOOL v5 = [v4 firstObject];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) dataSource];
    SEL v7 = [*(id *)(a1 + 32) walletKeyColorPreferenceKey];
    [v6 persistNumberValueToNoBackupStore:v5 withKey:v7];

    id v8 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(v8, "accessoryManager:didUpdateWalletKeyColor:", *(void *)(a1 + 32), objc_msgSend(v5, "integerValue"));

    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      [v5 integerValue];
      uint64_t v13 = HMHomeWalletKeyColorAsString();
      int v20 = 138543618;
      v21 = v12;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched wallet key color: %@", (uint8_t *)&v20, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Failed to find color for Matter or HAP accessories", (uint8_t *)&v20, 0xCu);
    }
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v19);
  }
}

id __90__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_flow_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

uint64_t __90__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_flow_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 supportsHAP];
}

uint64_t __90__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_flow_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsCHIP];
}

- (id)walletKeyColorWithCharacteristicValue:(id)a3 flow:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v33 = 0;
  id v8 = [MEMORY[0x263F359C0] parsedFromData:v6 error:&v33];
  id v9 = v33;
  if (v8)
  {
    id v10 = [v8 RGBColorValue];
    id v11 = [v10 value];

    if (v11)
    {
      uint64_t v12 = [v11 integerValue];
      if (v12 > 14935010)
      {
        BOOL v13 = v12 == 15521450;
        uint64_t v14 = 14935011;
      }
      else
      {
        BOOL v13 = v12 == 0;
        uint64_t v14 = 14341582;
      }
      if (v13 || v12 == v14)
      {
        int v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "integerValue"));
LABEL_21:

        goto LABEL_22;
      }
      v21 = (void *)MEMORY[0x230FBD990]();
      __int16 v22 = self;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        id v25 = [v7 UUID];
        uint64_t v31 = [v11 integerValue];
        *(_DWORD *)buf = 138543874;
        uint64_t v35 = v24;
        __int16 v36 = 2112;
        id v37 = v25;
        __int16 v38 = 2048;
        uint64_t v39 = v31;
        id v26 = "%{public}@[Flow: %@] Unable to get wallet key color, unsupported color value: %ld";
        v27 = v23;
        uint32_t v28 = 32;
        goto LABEL_19;
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x230FBD990]();
      __int16 v22 = self;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        id v25 = [v7 UUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = v24;
        __int16 v36 = 2112;
        id v37 = v25;
        id v26 = "%{public}@[Flow: %@] Unable to get wallet key color, color value is set to nil for hardware finish";
        v27 = v23;
        uint32_t v28 = 22;
LABEL_19:
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
      }
    }

    int v20 = 0;
    goto LABEL_21;
  }
  id v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = self;
  __int16 v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    uint64_t v19 = [v7 UUID];
    *(_DWORD *)buf = 138544130;
    uint64_t v35 = v18;
    __int16 v36 = 2112;
    id v37 = v19;
    __int16 v38 = 2112;
    uint64_t v39 = (uint64_t)v6;
    __int16 v40 = 2112;
    id v41 = v9;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Unable to get wallet key color, failed to parse hardware finish from encoded tlv data %@:%@", buf, 0x2Au);
  }
  int v20 = 0;
LABEL_22:

  return v20;
}

- (void)fetchWalletKeyColorWithAccessory:(id)a3 flow:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if ([v6 supportsWalletKey])
  {
    v13[0] = v6;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __74__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorWithAccessory_flow___block_invoke;
    v10[3] = &unk_264A29098;
    v10[4] = self;
    id v11 = v7;
    id v12 = v6;
    [(HMDHomeWalletKeyAccessoryManager *)self fetchWalletKeyColorForAccessories:v9 flow:v11 withCompletion:v10];
  }
}

void __74__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorWithAccessory_flow___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] UUID];
      id v12 = [a1[6] shortDescription];
      int v13 = 138544130;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v11;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      int v20 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch wallet key color when accessory connected %@:%@", (uint8_t *)&v13, 0x2Au);
    }
  }
}

- (id)writeRequestsWithAccessories:(id)a3 home:(id)a4 deviceCredentialKey:(id)a5 user:(id)a6 flow:(id)a7
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v73 = a3;
  id v12 = (__CFString *)a4;
  id v13 = a5;
  id v14 = a6;
  id v77 = a7;
  __int16 v15 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v15);

  v72 = v14;
  uint64_t v16 = [v14 nfcIssuerKeyIdentifier];
  if (v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x263F35A20]);
    [v17 setKey:v13];
    id v18 = (void *)[objc_alloc(MEMORY[0x263F35A30]) initWithValue:2];
    [v17 setType:v18];

    v71 = (void *)v16;
    [v17 setIssuerKeyIdentifier:v16];
    __int16 v19 = (void *)[objc_alloc(MEMORY[0x263F35A28]) initWithValue:1];
    [v17 setState:v19];

    v69 = (void *)[objc_alloc(MEMORY[0x263F35A38]) initWithValue:2];
    v70 = v17;
    id v85 = 0;
    v68 = (void *)[objc_alloc(MEMORY[0x263F35A18]) initWithOperationType:v69 issuerKeyRequest:0 issuerKeyResponse:0 deviceCredentialKeyRequest:v17 deviceCredentialKeyResponse:0 readerKeyRequest:0 readerKeyResponse:0];
    uint64_t v20 = [v68 serializeWithError:&v85];
    v67 = (__CFString *)v85;
    v76 = (void *)v20;
    if (v20)
    {
      id v66 = v13;
      v75 = [MEMORY[0x263EFF9C0] set];
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id obj = v73;
      uint64_t v21 = [obj countByEnumeratingWithState:&v81 objects:v96 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v80 = *(void *)v82;
        v78 = self;
        v74 = v12;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v82 != v80) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void **)(*((void *)&v81 + 1) + 8 * i);
            id v25 = [v24 home];
            id v26 = [v25 uuid];
            v27 = [(__CFString *)v12 uuid];
            char v28 = [v26 isEqual:v27];

            if (v28)
            {
              id v29 = [v24 findServiceWithServiceType:@"00000266-0000-1000-8000-0026BB765291"];
              __int16 v30 = v29;
              if (v29)
              {
                uint64_t v31 = [(__CFString *)v29 findCharacteristicWithType:@"00000264-0000-1000-8000-0026BB765291"];
                if (v31)
                {
                  uint64_t v32 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v31 value:v76 authorizationData:0 identifier:0 type:0 includeResponseValue:1];
                  [v75 addObject:v32];
                }
                else
                {
                  uint64_t v46 = (void *)MEMORY[0x230FBD990]();
                  v47 = self;
                  __int16 v48 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    id v49 = HMFGetLogIdentifier();
                    __int16 v50 = [v77 UUID];
                    uint64_t v51 = [v24 shortDescription];
                    *(_DWORD *)buf = 138544386;
                    v87 = v49;
                    __int16 v88 = 2112;
                    v89 = v50;
                    __int16 v90 = 2112;
                    v91 = v51;
                    __int16 v92 = 2112;
                    v93 = v30;
                    __int16 v94 = 2112;
                    v95 = @"00000264-0000-1000-8000-0026BB765291";
                    _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, NFC access service: %@ doesn't support control point characteristic: %@", buf, 0x34u);

                    id v12 = v74;
                  }

                  self = v78;
                }
              }
              else
              {
                __int16 v40 = (void *)MEMORY[0x230FBD990]();
                id v41 = self;
                uint64_t v42 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  v43 = HMFGetLogIdentifier();
                  __int16 v44 = [v77 UUID];
                  v45 = [v24 shortDescription];
                  *(_DWORD *)buf = 138544130;
                  v87 = v43;
                  __int16 v88 = 2112;
                  v89 = v44;
                  __int16 v90 = 2112;
                  v91 = v45;
                  __int16 v92 = 2112;
                  v93 = @"00000266-0000-1000-8000-0026BB765291";
                  _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, nfc access service not supported %@", buf, 0x2Au);

                  self = v78;
                }
              }
            }
            else
            {
              id v33 = (void *)MEMORY[0x230FBD990]();
              v34 = self;
              uint64_t v35 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                __int16 v36 = HMFGetLogIdentifier();
                id v37 = [v77 UUID];
                __int16 v38 = [v24 shortDescription];
                uint64_t v39 = [v24 home];
                *(_DWORD *)buf = 138544386;
                v87 = v36;
                __int16 v88 = 2112;
                v89 = v37;
                __int16 v90 = 2112;
                v91 = v38;
                __int16 v92 = 2112;
                v93 = v39;
                __int16 v94 = 2112;
                v95 = v12;
                _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, home: %@ doesn't match current home: %@", buf, 0x34u);

                self = v78;
              }
            }
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v81 objects:v96 count:16];
        }
        while (v22);
      }

      v52 = (void *)[v75 copy];
      id v13 = v66;
      uint64_t v53 = v67;
    }
    else
    {
      v60 = (void *)MEMORY[0x230FBD990]();
      v61 = self;
      v62 = HMFGetOSLogHandle();
      uint64_t v53 = v67;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        v63 = HMFGetLogIdentifier();
        v64 = [v77 UUID];
        *(_DWORD *)buf = 138544130;
        v87 = v63;
        __int16 v88 = 2112;
        v89 = v64;
        __int16 v90 = 2112;
        v91 = 0;
        __int16 v92 = 2112;
        v93 = v67;
        _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key, unable to encode nfc access control %@:%@", buf, 0x2Au);
      }
      v52 = [MEMORY[0x263EFFA08] set];
    }

    v54 = v71;
  }
  else
  {
    v54 = 0;
    v55 = (void *)MEMORY[0x230FBD990]();
    v56 = self;
    v57 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v58 = HMFGetLogIdentifier();
      v59 = [v77 UUID];
      *(_DWORD *)buf = 138543618;
      v87 = v58;
      __int16 v88 = 2112;
      v89 = v59;
      _os_log_impl(&dword_22F52A000, v57, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] NFC issuer key identifier for user is nil", buf, 0x16u);
    }
    v52 = [MEMORY[0x263EFFA08] set];
  }

  return v52;
}

- (id)configureMatterAccessory:(id)a3 withDeviceCredentialKey:(id)a4 ofType:(int64_t)a5 forUser:(id)a6 flow:(id)a7
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  __int16 v15 = (void *)MEMORY[0x230FBD990]();
  uint64_t v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    [v14 UUID];
    __int16 v19 = v62 = v16;
    uint64_t v20 = [v11 uuid];
    [v13 uuid];
    id v21 = v14;
    id v22 = v11;
    id v23 = v13;
    v25 = id v24 = v12;
    *(_DWORD *)buf = 138544386;
    v74 = v18;
    __int16 v75 = 2112;
    v76 = v19;
    __int16 v77 = 2112;
    v78 = v20;
    __int16 v79 = 2112;
    id v80 = v24;
    __int16 v81 = 2112;
    id v82 = v25;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Configuring Matter accessory with device credential key. accessory: %@, deviceCredentialKey: %@ forUser: %@", buf, 0x34u);

    id v12 = v24;
    id v13 = v23;
    id v11 = v22;
    id v14 = v21;

    uint64_t v16 = v62;
  }

  if (a5 == 1)
  {
    [v11 supportsMatterWalletKey];
    v34 = id v30 = v12;
    int v35 = [v34 BOOLValue];

    id v12 = v30;
    if (v35)
    {
      id v26 = v14;
      v27 = (void *)MEMORY[0x230FBD990]();
      char v28 = v16;
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = HMFGetLogIdentifier();
        uint64_t v32 = [v26 UUID];
        *(_DWORD *)buf = 138543618;
        v74 = v31;
        __int16 v75 = 2112;
        v76 = v32;
        id v33 = "%{public}@[Flow: %@] Not putting Aliro key on UA accessory";
        goto LABEL_11;
      }
LABEL_12:

      uint64_t v16 = [MEMORY[0x263F58190] futureWithNoResult];
      id v14 = v26;
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  if (a5)
  {
LABEL_13:
    __int16 v36 = v16;
    id v37 = v12;
LABEL_14:
    __int16 v38 = v36;
    uint64_t v39 = [(HMDHomeWalletKeyAccessoryManager *)v36 home];
    __int16 v40 = [v13 uuid];
    id v41 = [v39 findOrAddUserIndexForUserUUID:v40 guestName:0 accessory:v11 flow:v14];
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __105__HMDHomeWalletKeyAccessoryManager_configureMatterAccessory_withDeviceCredentialKey_ofType_forUser_flow___block_invoke;
    v65[3] = &unk_264A29070;
    id v66 = v11;
    id v67 = v14;
    id v37 = v37;
    int64_t v71 = a5;
    id v68 = v37;
    v69 = v38;
    id v70 = v12;
    uint64_t v16 = [v41 flatMap:v65];

    goto LABEL_15;
  }
  if ([v11 supportsACWGProvisioning])
  {
    id v26 = v14;
    v27 = (void *)MEMORY[0x230FBD990]();
    char v28 = v16;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = id v30 = v12;
      uint64_t v32 = [v26 UUID];
      *(_DWORD *)buf = 138543618;
      v74 = v31;
      __int16 v75 = 2112;
      v76 = v32;
      id v33 = "%{public}@[Flow: %@] Not putting UA key on Aliro accessory";
LABEL_11:
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, v33, buf, 0x16u);

      id v12 = v30;
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  id v61 = v12;
  id v37 = v12;
  id v43 = objc_alloc_init(MEMORY[0x263F35998]);
  __int16 v44 = (void *)[objc_alloc(MEMORY[0x263F35A30]) initWithValue:2];
  [v43 setType:v44];

  [v43 setKey:v37];
  v45 = (void *)[objc_alloc(MEMORY[0x263F35A28]) initWithValue:1];
  [v43 setState:v45];

  uint64_t v46 = v43;
  id v47 = objc_alloc_init(MEMORY[0x263F359D8]);
  [v47 setDeviceCredentialKey:v46];
  id v72 = 0;
  v60 = v47;
  __int16 v48 = [v47 serializeWithError:&v72];
  id v63 = v72;
  if (v48)
  {
    __int16 v36 = v16;
    id v49 = v37;
    id v37 = v48;
  }
  else
  {
    v59 = v46;
    __int16 v50 = (void *)MEMORY[0x230FBD990]();
    __int16 v36 = v16;
    uint64_t v51 = v16;
    v52 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v58 = HMFGetLogIdentifier();
      [v14 UUID];
      uint64_t v53 = v56 = v51;
      [v11 shortDescription];
      v54 = v57 = v50;
      *(_DWORD *)buf = 138544386;
      v74 = v58;
      __int16 v75 = 2112;
      v76 = v53;
      __int16 v77 = 2112;
      v78 = v54;
      __int16 v79 = 2112;
      id v80 = 0;
      __int16 v81 = 2112;
      id v82 = v63;
      _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, unable to encode matter credential %@:%@", buf, 0x34u);

      __int16 v50 = v57;
      uint64_t v51 = v56;
    }
    v55 = (void *)MEMORY[0x263F58190];
    id v49 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    uint64_t v16 = [v55 futureWithError:v49];
    uint64_t v46 = v59;
  }

  id v12 = v61;
  if (v48) {
    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  return v16;
}

id __105__HMDHomeWalletKeyAccessoryManager_configureMatterAccessory_withDeviceCredentialKey_ofType_forUser_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) waitForDoorLockClusterObjectWithFlow:*(void *)(a1 + 40)];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __105__HMDHomeWalletKeyAccessoryManager_configureMatterAccessory_withDeviceCredentialKey_ofType_forUser_flow___block_invoke_2;
  v19[3] = &unk_264A29020;
  id v5 = *(id *)(a1 + 48);
  uint64_t v23 = *(void *)(a1 + 72);
  id v20 = v5;
  id v21 = v3;
  id v22 = *(id *)(a1 + 40);
  id v6 = v3;
  id v7 = [v4 then:v19];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __105__HMDHomeWalletKeyAccessoryManager_configureMatterAccessory_withDeviceCredentialKey_ofType_forUser_flow___block_invoke_3;
  id v14 = &unk_264A29048;
  uint64_t v15 = *(void *)(a1 + 56);
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 32);
  id v8 = [v7 then:&v11];
  id v9 = objc_msgSend(v8, "naFuture", v11, v12, v13, v14, v15);

  return v9;
}

uint64_t __105__HMDHomeWalletKeyAccessoryManager_configureMatterAccessory_withDeviceCredentialKey_ofType_forUser_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "addDeviceCredentialKeyData:ofType:forUserIndex:flow:", *(void *)(a1 + 32), *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "integerValue"), *(void *)(a1 + 48));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v5 = v4;

    return 3;
  }
  else
  {
    uint64_t v7 = _HMFPreconditionFailure();
    return __105__HMDHomeWalletKeyAccessoryManager_configureMatterAccessory_withDeviceCredentialKey_ofType_forUser_flow___block_invoke_3(v7);
  }
}

uint64_t __105__HMDHomeWalletKeyAccessoryManager_configureMatterAccessory_withDeviceCredentialKey_ofType_forUser_flow___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 status];
  if (v4
    && (id v5 = (void *)v4,
        [v3 status],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToNumber:&unk_26E473138],
        v6,
        v5,
        v7))
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [*(id *)(a1 + 40) UUID];
      id v13 = *(void **)(a1 + 48);
      id v14 = [*(id *)(a1 + 56) uuid];
      int v27 = 138544130;
      char v28 = v11;
      __int16 v29 = 2112;
      id v30 = v12;
      __int16 v31 = 2112;
      uint64_t v32 = v13;
      __int16 v33 = 2112;
      v34 = v14;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully configured accessory with device credential key %@, accessory: %@", (uint8_t *)&v27, 0x2Au);
    }
    uint64_t v15 = 1;
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      id v20 = [*(id *)(a1 + 40) UUID];
      id v21 = [*(id *)(a1 + 56) shortDescription];
      id v22 = [v3 status];
      int v27 = 138544130;
      char v28 = v19;
      __int16 v29 = 2112;
      id v30 = v20;
      __int16 v31 = 2112;
      uint64_t v32 = v21;
      __int16 v33 = 2112;
      v34 = v22;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@ with status code: %@", (uint8_t *)&v27, 0x2Au);
    }
    id v23 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    id v24 = v23;
    if (v23)
    {
      id v25 = v23;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v15 = 2;
  }

  return v15;
}

- (id)performHAPWriteRequestsHH2:(id)a3 home:(id)a4 flow:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend(v8, "hmf_isEmpty"))
  {
    uint64_t v11 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    uint64_t v12 = [(HMDHomeWalletKeyAccessoryManager *)self dataSource];
    uint64_t v13 = [v12 accessoryWriteMaxRetryCount];
    id v14 = [(HMDHomeWalletKeyAccessoryManager *)self dataSource];
    [v14 accessoryWriteRetryInterval];
    uint64_t v15 = objc_msgSend(v9, "performWriteRequests:withRetries:timeInterval:loggingObject:", v8, v13, self);

    objc_initWeak(&location, self);
    id v16 = (void *)MEMORY[0x263F581B8];
    id v17 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
    id v18 = [v16 schedulerWithDispatchQueue:v17];
    __int16 v19 = [v15 reschedule:v18];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __73__HMDHomeWalletKeyAccessoryManager_performHAPWriteRequestsHH2_home_flow___block_invoke;
    v21[3] = &unk_264A28FF8;
    objc_copyWeak(&v24, &location);
    id v22 = v10;
    id v23 = v8;
    uint64_t v11 = [v19 flatMap:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v11;
}

id __73__HMDHomeWalletKeyAccessoryManager_performHAPWriteRequestsHH2_home_flow___block_invoke(id *a1, void *a2)
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v81 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
  {
    v54 = (void *)MEMORY[0x230FBD990]();
    v55 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v56 = HMFGetLogIdentifier();
      v57 = [a1[4] UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v90 = v56;
      __int16 v91 = 2112;
      __int16 v92 = v57;
      _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key object got invalidated", buf, 0x16u);
    }
    v58 = (void *)MEMORY[0x263F58190];
    v59 = (void *)MEMORY[0x263F087E8];
    uint64_t v60 = 23;
    goto LABEL_46;
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v70 = a1;
  id obj = a1[5];
  uint64_t v80 = [obj countByEnumeratingWithState:&v85 objects:v99 count:16];
  if (v80)
  {
    uint64_t v65 = 0;
    uint64_t v79 = *(void *)v86;
    id v69 = WeakRetained;
    do
    {
      for (uint64_t i = 0; i != v80; ++i)
      {
        if (*(void *)v86 != v79) {
          objc_enumerationMutation(obj);
        }
        id v5 = [*(id *)(*((void *)&v85 + 1) + 8 * i) characteristic];
        id v6 = [v5 accessory];
        id v84 = 0;
        int v7 = objc_msgSend(v81, "hmd_valueOfCharacteristic:error:", v5, &v84);
        id v8 = v84;
        if (v7)
        {
          id v9 = v7;
          objc_opt_class();
          int v10 = objc_opt_isKindOfClass() & 1;
          if (v10) {
            uint64_t v11 = v9;
          }
          else {
            uint64_t v11 = 0;
          }
          id v12 = v11;

          id v82 = v12;
          if (v10)
          {
            id v83 = 0;
            uint64_t v13 = [MEMORY[0x263F35A18] parsedFromData:v9 error:&v83];
            id v72 = v83;
            v74 = v6;
            if (v13)
            {
              id v14 = [v13 deviceCredentialKeyResponse];
              uint64_t v15 = [v14 statusCode];

              if (v15 && (![v15 value] || objc_msgSend(v15, "value") == 2))
              {
                id v16 = (void *)MEMORY[0x230FBD990]();
                id v17 = WeakRetained;
                id v18 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  __int16 v19 = HMFGetLogIdentifier();
                  [v70[4] UUID];
                  __int16 v75 = v7;
                  id v20 = v66 = v8;
                  [v74 shortDescription];
                  id v22 = v21 = v16;
                  *(_DWORD *)buf = 138544130;
                  __int16 v90 = v19;
                  __int16 v91 = 2112;
                  __int16 v92 = v20;
                  __int16 v93 = 2112;
                  __int16 v94 = v22;
                  __int16 v95 = 2112;
                  id v96 = v15;
                  _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully configured with device credential key: %@ with status code: %@", buf, 0x2Au);

                  id v16 = v21;
                  id v8 = v66;
                  int v7 = v75;

                  id WeakRetained = v69;
                }

                ++v65;
              }
              else
              {
                id v47 = (void *)MEMORY[0x230FBD990]();
                id v48 = WeakRetained;
                id v49 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                {
                  __int16 v50 = HMFGetLogIdentifier();
                  [v70[4] UUID];
                  v78 = v7;
                  uint64_t v51 = v68 = v8;
                  [v74 shortDescription];
                  uint64_t v53 = v52 = v47;
                  *(_DWORD *)buf = 138544130;
                  __int16 v90 = v50;
                  __int16 v91 = 2112;
                  __int16 v92 = v51;
                  __int16 v93 = 2112;
                  __int16 v94 = v53;
                  __int16 v95 = 2112;
                  id v96 = v15;
                  _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@ with status code: %@", buf, 0x2Au);

                  id v47 = v52;
                  id v8 = v68;
                  int v7 = v78;

                  id WeakRetained = v69;
                }
              }
            }
            else
            {
              __int16 v40 = (void *)MEMORY[0x230FBD990]();
              id v41 = WeakRetained;
              uint64_t v42 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                id v43 = HMFGetLogIdentifier();
                [v70[4] UUID];
                __int16 v77 = v7;
                __int16 v44 = v67 = v8;
                [v74 shortDescription];
                uint64_t v46 = v45 = v40;
                *(_DWORD *)buf = 138544386;
                __int16 v90 = v43;
                __int16 v91 = 2112;
                __int16 v92 = v44;
                __int16 v93 = 2112;
                __int16 v94 = v46;
                __int16 v95 = 2112;
                id v96 = v9;
                __int16 v97 = 2112;
                id v98 = v72;
                _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure accessory with device credential key: %@, failed to parse response value %@:%@", buf, 0x34u);

                __int16 v40 = v45;
                id v8 = v67;
                int v7 = v77;

                id WeakRetained = v69;
              }
            }
            id v6 = v74;
            uint64_t v39 = v82;
          }
          else
          {
            __int16 v31 = (void *)MEMORY[0x230FBD990]();
            id v32 = WeakRetained;
            __int16 v33 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              id v73 = v31;
              uint64_t v35 = v34 = v6;
              __int16 v36 = [v70[4] UUID];
              [v34 shortDescription];
              v76 = v7;
              __int16 v38 = v37 = v8;
              *(_DWORD *)buf = 138544130;
              __int16 v90 = v35;
              __int16 v91 = 2112;
              __int16 v92 = v36;
              __int16 v93 = 2112;
              __int16 v94 = v38;
              __int16 v95 = 2112;
              id v96 = v9;
              _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, response value: %@ is not of type NSData", buf, 0x2Au);

              id v8 = v37;
              int v7 = v76;

              id WeakRetained = v69;
              id v6 = v34;
              __int16 v31 = v73;
            }

            uint64_t v39 = v82;
          }
        }
        else
        {
          id v23 = (void *)MEMORY[0x230FBD990]();
          id v24 = WeakRetained;
          id v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            id v26 = HMFGetLogIdentifier();
            [v70[4] UUID];
            id v27 = v8;
            v29 = char v28 = v6;
            id v30 = [v28 shortDescription];
            *(_DWORD *)buf = 138544386;
            __int16 v90 = v26;
            __int16 v91 = 2112;
            __int16 v92 = v29;
            __int16 v93 = 2112;
            __int16 v94 = v30;
            __int16 v95 = 2112;
            id v96 = v81;
            __int16 v97 = 2112;
            id v98 = v5;
            _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, unable to parse write response dictionary: %@ with characteristic: %@", buf, 0x34u);

            id WeakRetained = v69;
            id v6 = v28;
            id v8 = v27;
            int v7 = 0;
          }
        }
      }
      uint64_t v80 = [obj countByEnumeratingWithState:&v85 objects:v99 count:16];
    }
    while (v80);
  }
  else
  {
    uint64_t v65 = 0;
  }

  if (v65 == [v70[5] count])
  {
    id v61 = [MEMORY[0x263F58190] futureWithNoResult];
    goto LABEL_48;
  }
  v58 = (void *)MEMORY[0x263F58190];
  v59 = (void *)MEMORY[0x263F087E8];
  if (!v65)
  {
    uint64_t v60 = 52;
LABEL_46:
    uint64_t v62 = [v59 hmErrorWithCode:v60];
    goto LABEL_47;
  }
  uint64_t v62 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2008];
LABEL_47:
  id v63 = (void *)v62;
  id v61 = [v58 futureWithError:v62];

LABEL_48:
  return v61;
}

- (void)configureAccessories_HH2:(id)a3 withDeviceCredentialKey:(id)a4 ofType:(int64_t)a5 forDeviceWithUUID:(id)a6 user:(id)a7 flow:(id)a8 completion:(id)a9
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v80 = a4;
  id v16 = a6;
  id v79 = a7;
  id v81 = a8;
  id v17 = (void (**)(id, void *))a9;
  id v18 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v18);

  __int16 v19 = [(HMDHomeWalletKeyAccessoryManager *)self home];
  id v20 = [v19 currentUser];
  [v20 isOwner];

  id v21 = [(HMDHomeWalletKeyAccessoryManager *)self home];
  if (!v21)
  {
    v34 = (void *)MEMORY[0x230FBD990]();
    uint64_t v35 = self;
    __int16 v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v37 = HMFGetLogIdentifier();
      __int16 v38 = [v81 UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v94 = v37;
      __int16 v95 = 2112;
      id v96 = v38;
      _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key, home is nil", buf, 0x16u);
    }
    uint64_t v39 = (void *)MEMORY[0x263F087E8];
    uint64_t v40 = -1;
    goto LABEL_13;
  }
  if (![v15 count])
  {
    id v41 = (void *)MEMORY[0x230FBD990]();
    uint64_t v42 = self;
    id v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      __int16 v44 = HMFGetLogIdentifier();
      v45 = [v81 UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v94 = v44;
      __int16 v95 = 2112;
      id v96 = v45;
      _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not configuring accessories with device credential key, accessories count is 0", buf, 0x16u);
    }
    uint64_t v39 = (void *)MEMORY[0x263F087E8];
    uint64_t v40 = 3;
LABEL_13:
    uint64_t v46 = [v39 hmErrorWithCode:v40];
    v17[2](v17, v46);
    goto LABEL_20;
  }
  id v22 = objc_msgSend(v15, "na_filter:", &__block_literal_global_348);
  id v78 = v15;
  id v23 = objc_msgSend(v15, "na_filter:", &__block_literal_global_350_224257);
  id v24 = (void *)MEMORY[0x230FBD990]();
  id v25 = self;
  id v26 = HMFGetOSLogHandle();
  id v76 = v16;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = HMFGetLogIdentifier();
    char v28 = [v81 UUID];
    *(_DWORD *)buf = 138544642;
    __int16 v94 = v27;
    __int16 v95 = 2112;
    id v96 = v28;
    __int16 v97 = 2112;
    uint64_t v98 = (uint64_t)v78;
    __int16 v99 = 2112;
    uint64_t v100 = (uint64_t)v80;
    __int16 v101 = 2112;
    v102 = v22;
    __int16 v103 = 2112;
    v104 = v23;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Configuring accessories with device credential key HH2. accessories: %@, deviceCredentialKey: %@, hapAccessories: %@, matterAccessories: %@", buf, 0x3Eu);
  }
  v88[0] = MEMORY[0x263EF8330];
  v88[1] = 3221225472;
  v88[2] = __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_351;
  v88[3] = &unk_264A28F80;
  v88[4] = v25;
  id v29 = v80;
  id v89 = v29;
  int64_t v92 = a5;
  id v30 = v79;
  id v90 = v30;
  id v31 = v81;
  id v91 = v31;
  id v32 = objc_msgSend(v23, "na_map:", v88);
  __int16 v77 = v22;
  v74 = v21;
  __int16 v75 = v23;
  if (a5)
  {
    __int16 v33 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    id v47 = [(HMDHomeWalletKeyAccessoryManager *)v25 writeRequestsWithAccessories:v22 home:v21 deviceCredentialKey:v29 user:v30 flow:v31];
    id v48 = [v47 allObjects];
    __int16 v33 = [(HMDHomeWalletKeyAccessoryManager *)v25 performHAPWriteRequestsHH2:v48 home:v21 flow:v31];

    uint64_t v49 = [v47 count];
    if (v49 != [v22 count])
    {
      __int16 v50 = (void *)MEMORY[0x230FBD990]();
      id v73 = v25;
      log = HMFGetOSLogHandle();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        uint64_t v51 = v71 = v50;
        v52 = [v31 UUID];
        uint64_t v53 = [v22 count];
        v54 = v32;
        uint64_t v55 = v53 - [v47 count];
        uint64_t v56 = [v22 count];
        *(_DWORD *)buf = 138544130;
        __int16 v94 = v51;
        __int16 v95 = 2112;
        id v96 = v52;
        __int16 v97 = 2048;
        uint64_t v98 = v55;
        id v32 = v54;
        __int16 v99 = 2048;
        uint64_t v100 = v56;
        _os_log_impl(&dword_22F52A000, log, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create a write request for a subset of the HAP accessories (%lu of the %lu HAP accessories)", buf, 0x2Au);

        __int16 v50 = v71;
      }

      v86[0] = MEMORY[0x263EF8330];
      v86[1] = 3221225472;
      v86[2] = __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_353;
      v86[3] = &unk_264A28FA8;
      id v87 = v47;
      id v57 = (id)[v33 flatMap:v86];
    }
  }
  v58 = [v32 arrayByAddingObject:v33];
  v59 = [MEMORY[0x263F58190] combineAllFutures:v58];
  uint64_t v60 = (void *)MEMORY[0x263F581B8];
  id v61 = [(HMDHomeWalletKeyAccessoryManager *)v25 workQueue];
  uint64_t v62 = [v60 schedulerWithDispatchQueue:v61];
  [v59 reschedule:v62];
  v64 = id v63 = v32;
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_2_355;
  v84[3] = &unk_264A28FD0;
  uint64_t v65 = v17;
  id v66 = v17;
  id v67 = v33;
  id v68 = v65;
  long long v85 = v65;
  id v69 = [v64 addSuccessBlock:v84];
  v82[0] = MEMORY[0x263EF8330];
  v82[1] = 3221225472;
  v82[2] = __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_3;
  v82[3] = &unk_264A2E288;
  id v83 = v68;
  id v70 = (id)[v69 addFailureBlock:v82];

  id v17 = v66;
  uint64_t v46 = v77;
  id v15 = v78;
  id v16 = v76;
  id v21 = v74;
LABEL_20:
}

uint64_t __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_351(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) configureMatterAccessory:a2 withDeviceCredentialKey:*(void *)(a1 + 40) ofType:*(void *)(a1 + 64) forUser:*(void *)(a1 + 48) flow:*(void *)(a1 + 56)];
}

id __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_353(uint64_t a1)
{
  int v1 = objc_msgSend(*(id *)(a1 + 32), "hmf_isEmpty");
  id v2 = (void *)MEMORY[0x263F58190];
  if (v1) {
    [MEMORY[0x263F087E8] hmErrorWithCode:-1];
  }
  else {
  id v3 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2008];
  }
  uint64_t v4 = [v2 futureWithError:v3];

  return v4;
}

uint64_t __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_2_355(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 supportsCHIP];
}

uint64_t __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsCHIP] ^ 1;
}

- (void)configureAccessories_HH1:(id)a3 withDeviceCredentialKey:(id)a4 forDeviceWithUUID:(id)a5 user:(id)a6 flow:(id)a7 completion:(id)a8
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v52 = a4;
  id v50 = a5;
  id v51 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v17);

  id v18 = [(HMDHomeWalletKeyAccessoryManager *)self home];
  __int16 v19 = [v18 currentUser];
  [v19 isOwner];

  id v20 = [(HMDHomeWalletKeyAccessoryManager *)self home];
  if (v20)
  {
    if ([v14 count])
    {
      id v21 = (void *)MEMORY[0x230FBD990]([(HMDHomeWalletKeyAccessoryManager *)self createAccessoryDeviceCredentialKeyPendingOperationWithAccessories:v14 deviceCredentialKey:v52 user:v51 deviceUUID:v50]);
      id v22 = self;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = HMFGetLogIdentifier();
        id v25 = [v15 UUID];
        *(_DWORD *)buf = 138544130;
        id v63 = v24;
        __int16 v64 = 2112;
        uint64_t v65 = v25;
        __int16 v66 = 2112;
        id v67 = v14;
        __int16 v68 = 2112;
        id v69 = v52;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Configuring accessories with device credential key HH1 %@:%@", buf, 0x2Au);
      }
      id v26 = [(HMDHomeWalletKeyAccessoryManager *)v22 writeRequestsWithAccessories:v14 home:v20 deviceCredentialKey:v52 user:v51 flow:v15];
      if ([v26 count])
      {
        uint64_t v27 = [v26 count];
        if (v27 == [v14 count])
        {
          id v48 = 0;
        }
        else
        {
          id v48 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2008];
        }
        uint64_t v39 = [v26 allObjects];
        uint64_t v40 = [(HMDHomeWalletKeyAccessoryManager *)v22 dataSource];
        uint64_t v41 = [v40 accessoryWriteMaxRetryCount];
        uint64_t v42 = [(HMDHomeWalletKeyAccessoryManager *)v22 dataSource];
        [v42 accessoryWriteRetryInterval];
        uint64_t v49 = objc_msgSend(v20, "performWriteRequests:withRetries:timeInterval:loggingObject:", v39, v41, v22);

        objc_initWeak((id *)buf, v22);
        id v43 = (void *)MEMORY[0x263F581B8];
        __int16 v44 = [(HMDHomeWalletKeyAccessoryManager *)v22 workQueue];
        v45 = [v43 schedulerWithDispatchQueue:v44];
        uint64_t v46 = [v49 reschedule:v45];
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __124__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH1_withDeviceCredentialKey_forDeviceWithUUID_user_flow_completion___block_invoke;
        v53[3] = &unk_264A28F58;
        objc_copyWeak(&v61, (id *)buf);
        id v54 = v15;
        id v60 = v16;
        id v55 = v50;
        id v56 = v52;
        id v57 = v26;
        id v58 = v51;
        id v38 = v48;
        id v59 = v38;
        id v47 = (id)[v46 addCompletionBlock:v53];

        objc_destroyWeak(&v61);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        id v38 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        (*((void (**)(id, id))v16 + 2))(v16, v38);
      }
    }
    else
    {
      __int16 v33 = (void *)MEMORY[0x230FBD990]();
      v34 = self;
      uint64_t v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        __int16 v36 = HMFGetLogIdentifier();
        id v37 = [v15 UUID];
        *(_DWORD *)buf = 138543618;
        id v63 = v36;
        __int16 v64 = 2112;
        uint64_t v65 = v37;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not configuring accessories with device credential key, accessories count is 0", buf, 0x16u);
      }
      id v26 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      (*((void (**)(id, void *))v16 + 2))(v16, v26);
    }
  }
  else
  {
    char v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = self;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      id v32 = [v15 UUID];
      *(_DWORD *)buf = 138543618;
      id v63 = v31;
      __int16 v64 = 2112;
      uint64_t v65 = v32;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key, home is nil", buf, 0x16u);
    }
    id v26 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*((void (**)(id, void *))v16 + 2))(v16, v26);
  }
}

void __124__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH1_withDeviceCredentialKey_forDeviceWithUUID_user_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v104 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  int v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID];
    id v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];

    int v10 = [(HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *)v9 deviceCredentialKey];
    char v11 = [v10 isEqual:*(void *)(a1 + 48)];

    if (v11)
    {
      if (v104)
      {
        long long v85 = v9;
        id v86 = v5;
        id v12 = [(HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *)v9 accessoriesUUIDs];
        id v87 = (void *)[v12 mutableCopy];

        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        uint64_t v93 = a1;
        id obj = *(id *)(a1 + 56);
        uint64_t v103 = [obj countByEnumeratingWithState:&v108 objects:v122 count:16];
        if (v103)
        {
          uint64_t v91 = 0;
          uint64_t v102 = *(void *)v109;
          int64_t v92 = v7;
          do
          {
            for (uint64_t i = 0; i != v103; ++i)
            {
              if (*(void *)v109 != v102) {
                objc_enumerationMutation(obj);
              }
              id v14 = [*(id *)(*((void *)&v108 + 1) + 8 * i) characteristic];
              id v15 = [v14 accessory];
              id v107 = 0;
              id v16 = objc_msgSend(v104, "hmd_valueOfCharacteristic:error:", v14, &v107);
              id v17 = v107;
              if (v16)
              {
                id v18 = v16;
                objc_opt_class();
                int v19 = objc_opt_isKindOfClass() & 1;
                if (v19) {
                  id v20 = v18;
                }
                else {
                  id v20 = 0;
                }
                id v21 = v20;

                id v105 = v21;
                if (v19)
                {
                  id v106 = 0;
                  id v22 = [MEMORY[0x263F35A18] parsedFromData:v18 error:&v106];
                  id v95 = v106;
                  __int16 v101 = v15;
                  if (v22)
                  {
                    id v23 = [v22 deviceCredentialKeyResponse];
                    id v24 = [v23 statusCode];

                    if (v24 && (![v24 value] || objc_msgSend(v24, "value") == 2))
                    {
                      id v25 = (void *)MEMORY[0x230FBD990]();
                      id v26 = v7;
                      uint64_t v27 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                      {
                        HMFGetLogIdentifier();
                        char v28 = v97 = v16;
                        id v29 = [*(id *)(v93 + 32) UUID];
                        [v101 shortDescription];
                        id v30 = v88 = v25;
                        *(_DWORD *)buf = 138544130;
                        v113 = v28;
                        __int16 v114 = 2112;
                        v115 = v29;
                        __int16 v116 = 2112;
                        id v117 = v30;
                        __int16 v118 = 2112;
                        id v119 = v24;
                        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully configured with device credential key: %@ with status code: %@", buf, 0x2Au);

                        id v25 = v88;
                        int v7 = v92;

                        id v16 = v97;
                      }

                      ++v91;
                      id v15 = v101;
                      id v31 = [v101 uuid];
                      [v87 removeObject:v31];
                    }
                    else
                    {
                      id v55 = (void *)MEMORY[0x230FBD990]();
                      id v56 = v7;
                      id v57 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                      {
                        HMFGetLogIdentifier();
                        v58 = uint64_t v100 = v16;
                        id v59 = [*(id *)(v93 + 32) UUID];
                        [v101 shortDescription];
                        v60 = id v90 = v55;
                        *(_DWORD *)buf = 138544130;
                        v113 = v58;
                        __int16 v114 = 2112;
                        v115 = v59;
                        __int16 v116 = 2112;
                        id v117 = v60;
                        __int16 v118 = 2112;
                        id v119 = v24;
                        _os_log_impl(&dword_22F52A000, v57, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@ with status code: %@", buf, 0x2Au);

                        id v55 = v90;
                        int v7 = v92;

                        id v16 = v100;
                      }

                      id v15 = v101;
                    }
                  }
                  else
                  {
                    uint64_t v49 = (void *)MEMORY[0x230FBD990]();
                    id v50 = v7;
                    id v51 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      v52 = __int16 v99 = v16;
                      uint64_t v53 = [*(id *)(v93 + 32) UUID];
                      [v101 shortDescription];
                      v54 = id v89 = v49;
                      *(_DWORD *)buf = 138544386;
                      v113 = v52;
                      __int16 v114 = 2112;
                      v115 = v53;
                      __int16 v116 = 2112;
                      id v117 = v54;
                      __int16 v118 = 2112;
                      id v119 = v18;
                      __int16 v120 = 2112;
                      id v121 = v95;
                      _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure accessory with device credential key: %@, failed to parse response value %@:%@", buf, 0x34u);

                      uint64_t v49 = v89;
                      int v7 = v92;

                      id v16 = v99;
                    }

                    id v15 = v101;
                  }
                  id v48 = v105;
                }
                else
                {
                  uint64_t v40 = (void *)MEMORY[0x230FBD990]();
                  id v41 = v7;
                  uint64_t v42 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    id v98 = v17;
                    __int16 v44 = v43 = v15;
                    v45 = [*(id *)(v93 + 32) UUID];
                    [v43 shortDescription];
                    id v96 = v40;
                    v47 = uint64_t v46 = v16;
                    *(_DWORD *)buf = 138544130;
                    v113 = v44;
                    __int16 v114 = 2112;
                    v115 = v45;
                    __int16 v116 = 2112;
                    id v117 = v47;
                    __int16 v118 = 2112;
                    id v119 = v18;
                    _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, response value: %@ is not of type NSData", buf, 0x2Au);

                    id v16 = v46;
                    uint64_t v40 = v96;

                    int v7 = v92;
                    id v15 = v43;
                    id v17 = v98;
                  }

                  id v48 = v105;
                }
              }
              else
              {
                id v32 = (void *)MEMORY[0x230FBD990]();
                id v33 = v7;
                v34 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v35 = HMFGetLogIdentifier();
                  [*(id *)(v93 + 32) UUID];
                  id v36 = v17;
                  id v38 = v37 = v15;
                  uint64_t v39 = [v37 shortDescription];
                  *(_DWORD *)buf = 138544386;
                  v113 = v35;
                  __int16 v114 = 2112;
                  v115 = v38;
                  __int16 v116 = 2112;
                  id v117 = v39;
                  __int16 v118 = 2112;
                  id v119 = v104;
                  __int16 v120 = 2112;
                  id v121 = v14;
                  _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, unable to parse write response dictionary: %@ with characteristic: %@", buf, 0x34u);

                  int v7 = v92;
                  id v15 = v37;
                  id v17 = v36;
                  id v16 = 0;
                }
              }
            }
            uint64_t v103 = [obj countByEnumeratingWithState:&v108 objects:v122 count:16];
          }
          while (v103);
        }
        else
        {
          uint64_t v91 = 0;
        }

        id v80 = v87;
        if ([v87 count])
        {
          uint64_t v81 = v93;
          id v9 = [[HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation alloc] initWithDeviceCredentialKey:*(void *)(v93 + 48) accessoriesUUIDs:v87 user:*(void *)(v93 + 64)];
          id v5 = v86;
        }
        else
        {
          id v9 = 0;
          id v5 = v86;
          uint64_t v81 = v93;
        }

        id v82 = [v7 pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID];
        [v82 setObject:v9 forKeyedSubscript:*(void *)(v81 + 40)];

        if (v91 == [*(id *)(v81 + 56) count])
        {
          (*(void (**)(void, void))(*(void *)(v81 + 80) + 16))(*(void *)(v81 + 80), *(void *)(v81 + 72));
        }
        else
        {
          uint64_t v83 = *(void *)(v81 + 80);
          if (v91) {
            [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2008];
          }
          else {
          id v84 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
          }
          (*(void (**)(uint64_t, void *))(v83 + 16))(v83, v84);
        }
        goto LABEL_49;
      }
      __int16 v75 = (void *)MEMORY[0x230FBD990]();
      id v76 = v7;
      __int16 v77 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        id v78 = HMFGetLogIdentifier();
        id v79 = [*(id *)(a1 + 32) UUID];
        *(_DWORD *)buf = 138543874;
        v113 = v78;
        __int16 v114 = 2112;
        v115 = v79;
        __int16 v116 = 2112;
        id v117 = v5;
        _os_log_impl(&dword_22F52A000, v77, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key, write response is nil: %@", buf, 0x20u);
      }
      uint64_t v72 = *(void *)(a1 + 80);
      id v73 = (void *)MEMORY[0x263F087E8];
      uint64_t v74 = -1;
    }
    else
    {
      __int16 v66 = (void *)MEMORY[0x230FBD990]();
      id v67 = v7;
      __int16 v68 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        id v69 = HMFGetLogIdentifier();
        uint64_t v70 = [*(id *)(a1 + 32) UUID];
        int64_t v71 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v113 = v69;
        __int16 v114 = 2112;
        v115 = v70;
        __int16 v116 = 2112;
        id v117 = v71;
        _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Operation cancelled because device credential key was updated for deviceUUID: %@", buf, 0x20u);
      }
      uint64_t v72 = *(void *)(a1 + 80);
      id v73 = (void *)MEMORY[0x263F087E8];
      uint64_t v74 = 23;
    }
    id v80 = [v73 hmErrorWithCode:v74];
    (*(void (**)(uint64_t, void *))(v72 + 16))(v72, v80);
LABEL_49:

    goto LABEL_50;
  }
  id v61 = (void *)MEMORY[0x230FBD990]();
  uint64_t v62 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    id v63 = HMFGetLogIdentifier();
    __int16 v64 = [*(id *)(a1 + 32) UUID];
    *(_DWORD *)buf = 138543618;
    v113 = v63;
    __int16 v114 = 2112;
    v115 = v64;
    _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key object got invalidated", buf, 0x16u);
  }
  uint64_t v65 = *(void *)(a1 + 80);
  id v9 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
  (*(void (**)(uint64_t, HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *))(v65 + 16))(v65, v9);
LABEL_50:
}

- (void)configureAccessories:(id)a3 withDeviceCredentialKey:(id)a4 ofType:(int64_t)a5 forDeviceWithUUID:(id)a6 user:(id)a7 flow:(id)a8 completion:(id)a9
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v43 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = [MEMORY[0x263F42608] sharedPreferences];
  id v21 = [v20 preferenceForKey:@"HMDHomeWalletKeyAccessoryManagerDisableAddingDeviceKeys"];
  int v22 = [v21 BOOLValue];

  if (v22)
  {
    id v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v26 = HMFGetLogIdentifier();
      uint64_t v27 = [v18 UUID];
      *(_DWORD *)buf = 138543618;
      id v48 = v26;
      __int16 v49 = 2112;
      id v50 = v27;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not adding device credential key because HMDHomeWalletKeyAccessoryManagerDisableAddingDeviceKeys is set", buf, 0x16u);
    }
    char v28 = v43;
  }
  else
  {
    int64_t v42 = a5;
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __127__HMDHomeWalletKeyAccessoryManager_configureAccessories_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke;
    v44[3] = &unk_264A28F30;
    id v29 = v17;
    id v45 = v29;
    id v30 = v18;
    id v46 = v30;
    uint64_t v31 = objc_msgSend(v15, "na_filter:", v44);

    id v32 = (void *)MEMORY[0x230FBD990]();
    id v33 = self;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      uint64_t v35 = v41 = v16;
      [v30 UUID];
      id v36 = v40 = v17;
      [v29 uuid];
      id v39 = v18;
      id v38 = v37 = v19;
      *(_DWORD *)buf = 138544130;
      id v48 = v35;
      __int16 v49 = 2112;
      id v50 = v36;
      __int16 v51 = 2112;
      id v52 = v38;
      __int16 v53 = 2112;
      uint64_t v54 = v31;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessories supported for user: %@, accessories: %@", buf, 0x2Au);

      id v19 = v37;
      id v18 = v39;

      id v17 = v40;
      id v16 = v41;
    }

    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(@"MatterTTU", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
    {
      char v28 = v43;
      [(HMDHomeWalletKeyAccessoryManager *)v33 configureAccessories_HH2:v31 withDeviceCredentialKey:v43 ofType:v42 forDeviceWithUUID:v16 user:v29 flow:v30 completion:v19];
    }
    else
    {
      char v28 = v43;
      [(HMDHomeWalletKeyAccessoryManager *)v33 configureAccessories_HH1:v31 withDeviceCredentialKey:v43 forDeviceWithUUID:v16 user:v29 flow:v30 completion:v19];
    }

    id v15 = (id)v31;
  }
}

uint64_t __127__HMDHomeWalletKeyAccessoryManager_configureAccessories_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsWalletKeyForUser:*(void *)(a1 + 32) withFlow:*(void *)(a1 + 40)];
}

- (void)unregisterForNotificationsWithReason:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  int v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v17 = 138543618;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Unregistering for notifications with reason: %@", (uint8_t *)&v17, 0x16u);
  }
  int v10 = [(HMDHomeWalletKeyAccessoryManager *)v7 home];
  char v11 = [(HMDHomeWalletKeyAccessoryManager *)v7 notificationCenter];
  [v11 removeObserver:v7 name:@"HMDAccessoryConnectedNotification" object:0];

  id v12 = [(HMDHomeWalletKeyAccessoryManager *)v7 notificationCenter];
  [v12 removeObserver:v7 name:@"HMDAccessorySupportsWalletKeyDidChangeNotification" object:0];

  uint64_t v13 = [(HMDHomeWalletKeyAccessoryManager *)v7 notificationCenter];
  id v14 = [v10 nfcReaderKeyManager];
  [v13 removeObserver:v7 name:@"HMDHomeNFCReaderKeyKeychainItemAvailableNotification" object:v14];

  id v15 = [(HMDHomeWalletKeyAccessoryManager *)v7 notificationCenter];
  [v15 removeObserver:v7 name:@"HMDNotificationHomeAddedAccessory" object:v10];

  id v16 = [(HMDHomeWalletKeyAccessoryManager *)v7 notificationCenter];
  [v16 removeObserver:v7 name:@"HMDHomeUserAddedNotification" object:v10];
}

- (void)handlePendingDeviceCredentialKeysSyncForAccessories:(id)a3 withReason:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v29 = v6;
  if ([v6 count])
  {
    id v9 = [(HMDHomeWalletKeyAccessoryManager *)self home];
    int v10 = [v9 currentUser];
    int v11 = [v10 isOwner];

    if (v11)
    {
      id v12 = (void *)MEMORY[0x230FBD990]();
      uint64_t v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int64_t v42 = v15;
        __int16 v43 = 2112;
        id v44 = v7;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling pending device credential operations with reason: %@", buf, 0x16u);
      }
      id v27 = v7;

      char v28 = v13;
      id v16 = [(HMDHomeWalletKeyAccessoryManager *)v13 pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID];
      int v17 = (void *)[v16 copy];

      long long v39 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v36 = 0u;
      id v18 = v17;
      uint64_t v31 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v31)
      {
        uint64_t v30 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v37 != v30) {
              objc_enumerationMutation(v18);
            }
            uint64_t v20 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            uint64_t v21 = [v18 objectForKeyedSubscript:v20];
            int v22 = [v21 user];
            if (v22)
            {
              v34[0] = MEMORY[0x263EF8330];
              v34[1] = 3221225472;
              v34[2] = __99__HMDHomeWalletKeyAccessoryManager_handlePendingDeviceCredentialKeysSyncForAccessories_withReason___block_invoke;
              v34[3] = &unk_264A28A10;
              id v23 = v21;
              id v35 = v23;
              id v24 = objc_msgSend(v29, "na_filter:", v34);
              id v25 = [v23 deviceCredentialKey];
              id v26 = [MEMORY[0x263F42530] untrackedPlaceholderFlow];
              v32[0] = MEMORY[0x263EF8330];
              v32[1] = 3221225472;
              v32[2] = __99__HMDHomeWalletKeyAccessoryManager_handlePendingDeviceCredentialKeysSyncForAccessories_withReason___block_invoke_2;
              v32[3] = &unk_264A2F370;
              v32[4] = v28;
              id v33 = v23;
              [(HMDHomeWalletKeyAccessoryManager *)v28 configureAccessories:v24 withDeviceCredentialKey:v25 ofType:0 forDeviceWithUUID:v20 user:v22 flow:v26 completion:v32];
            }
          }
          uint64_t v31 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v31);
      }

      id v7 = v27;
    }
  }
}

uint64_t __99__HMDHomeWalletKeyAccessoryManager_handlePendingDeviceCredentialKeysSyncForAccessories_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 accessoriesUUIDs];
  id v5 = [v3 uuid];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

void __99__HMDHomeWalletKeyAccessoryManager_handlePendingDeviceCredentialKeysSyncForAccessories_withReason___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138543874;
      id v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      int v10 = "%{public}@Device credential key pending operation failed %@:%@ ";
      int v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138543618;
    id v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    int v10 = "%{public}@Device credential key pending operation succesed %@ ";
    int v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

- (void)handlePendingDeviceCredentialKeysSyncForAccessory:(id)a3 withReason:(id)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if ([v6 supportsWalletKey])
  {
    v10[0] = v6;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    [(HMDHomeWalletKeyAccessoryManager *)self handlePendingDeviceCredentialKeysSyncForAccessories:v9 withReason:v7];
  }
}

- (void)registerForNotificationsWithReason:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v29 = v9;
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Registering for notifications with reason: %@", buf, 0x16u);
  }
  int v10 = [(HMDHomeWalletKeyAccessoryManager *)v7 home];
  int v11 = [(HMDHomeWalletKeyAccessoryManager *)v7 notificationCenter];
  [v11 addObserver:v7 selector:sel_handleAccessoryConfigured_ name:@"HMDAccessoryConnectedNotification" object:0];

  os_log_type_t v12 = [(HMDHomeWalletKeyAccessoryManager *)v7 notificationCenter];
  [v12 addObserver:v7 selector:sel_handleWalletKeySupportDidChange_ name:@"HMDAccessorySupportsWalletKeyDidChangeNotification" object:0];

  uint32_t v13 = [(HMDHomeWalletKeyAccessoryManager *)v7 notificationCenter];
  uint64_t v14 = [v10 nfcReaderKeyManager];
  [v13 addObserver:v7 selector:sel_handleHomeNFCReaderKeyKeychainItemAvailableNotification_ name:@"HMDHomeNFCReaderKeyKeychainItemAvailableNotification" object:v14];

  int v15 = [(HMDHomeWalletKeyAccessoryManager *)v7 notificationCenter];
  [v15 addObserver:v7 selector:sel_handleHomeAddedAccessoryNotification_ name:@"HMDNotificationHomeAddedAccessory" object:v10];

  id v16 = [(HMDHomeWalletKeyAccessoryManager *)v7 notificationCenter];
  [v16 addObserver:v7 selector:sel_handleHomeUserAddedNotification_ name:@"HMDHomeUserAddedNotification" object:v10];

  [(HMDHomeWalletKeyAccessoryManager *)v7 configureNFCReaderKeyForAllAccessoriesWithReason:@"Registering for notifications"];
  __int16 v17 = [v10 accessoriesWithWalletKeySupport];
  [(HMDHomeWalletKeyAccessoryManager *)v7 handlePendingDeviceCredentialKeysSyncForAccessories:v17 withReason:@"notifications registered"];

  uint64_t v18 = [(HMDHomeWalletKeyAccessoryManager *)v7 delegate];

  if (v18)
  {
    __int16 v19 = [MEMORY[0x263F42530] internalOnlyInitializer];
    id v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v21 = v7;
    int v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      id v24 = [v19 UUID];
      *(_DWORD *)buf = 138543618;
      id v29 = v23;
      __int16 v30 = 2112;
      id v31 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Fetching wallet key color after registering for notifications", buf, 0x16u);
    }
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __71__HMDHomeWalletKeyAccessoryManager_registerForNotificationsWithReason___block_invoke;
    v26[3] = &unk_264A2D978;
    v26[4] = v21;
    id v27 = v19;
    id v25 = v19;
    [(HMDHomeWalletKeyAccessoryManager *)v21 fetchWalletKeyColorWithFlow:v25 completion:v26];
  }
}

void __71__HMDHomeWalletKeyAccessoryManager_registerForNotificationsWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      int v11 = HMFGetLogIdentifier();
      os_log_type_t v12 = [*(id *)(a1 + 40) UUID];
      [v5 integerValue];
      uint32_t v13 = HMHomeWalletKeyColorAsString();
      int v15 = 138543874;
      id v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully fetched wallet key color when registered for notifications %@", (uint8_t *)&v15, 0x20u);

LABEL_6:
    }
  }
  else if (v10)
  {
    int v11 = HMFGetLogIdentifier();
    uint64_t v14 = [*(id *)(a1 + 40) UUID];
    int v15 = 138543874;
    id v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not fetch wallet key color when registered for notifications %@", (uint8_t *)&v15, 0x20u);

    goto LABEL_6;
  }
}

- (void)configureNotificationsWithReason:(id)a3
{
  id v7 = a3;
  id v4 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v4);

  if ([(HMDHomeWalletKeyAccessoryManager *)self isCurrentDevicePrimaryResident])
  {
    if ([(HMDHomeWalletKeyAccessoryManager *)self canConfigureAccessories]) {
      goto LABEL_8;
    }
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = [(HMDHomeWalletKeyAccessoryManager *)self home];
    uint64_t v5 = [v6 hasCharacteristicNotificationRegistrations];

    if (v5 == [(HMDHomeWalletKeyAccessoryManager *)self canConfigureAccessories]) {
      goto LABEL_8;
    }
  }
  [(HMDHomeWalletKeyAccessoryManager *)self setCanConfigureAccessories:v5];
  if ([(HMDHomeWalletKeyAccessoryManager *)self canConfigureAccessories]) {
    [(HMDHomeWalletKeyAccessoryManager *)self registerForNotificationsWithReason:v7];
  }
  else {
    [(HMDHomeWalletKeyAccessoryManager *)self unregisterForNotificationsWithReason:v7];
  }
LABEL_8:
}

- (id)configureReaderKey:(id)a3 onACWGAccessory:(id)a4 flow:(id)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x230FBD990]();
  os_log_type_t v12 = self;
  uint32_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v15 = [v10 UUID];
    id v16 = [v9 uuid];
    *(_DWORD *)buf = 138543874;
    id v58 = v14;
    __int16 v59 = 2112;
    id v60 = v15;
    __int16 v61 = 2112;
    uint64_t v62 = v16;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Configuring reader key on ACWG accessory: %@", buf, 0x20u);
  }
  __int16 v17 = [v9 home];
  if (v17)
  {
    id v18 = (id)objc_opt_new();
    __int16 v19 = [v8 privateKey];
    [v18 setReaderPrivateKey:v19];

    id v20 = [v8 publicKeyExternalRepresentation];
    [v18 setReaderPublicKeyExternalRepresentation:v20];

    uint64_t v21 = [v8 publicKey];
    int v22 = +[HMDNIST256Utilities identifier16BytesForKey:v21];
    [v18 setReaderGroupIdentifier:v22];

    if ([v9 supportsACWGUWB])
    {
      id v23 = [v17 acwgGroupResolvingKey];
      [v18 setGroupResolvingKey:v23];
    }
    uint64_t v24 = [v18 readerPrivateKey];
    if (v24)
    {
      id v25 = (void *)v24;
      uint64_t v26 = [v18 readerPublicKeyExternalRepresentation];
      if (v26)
      {
        id v27 = (void *)v26;
        char v28 = [v18 readerGroupIdentifier];

        if (v28)
        {
          id v29 = [v9 waitForDoorLockClusterObjectWithFlow:v10];
          __int16 v30 = [v29 naFuture];
          v52[0] = MEMORY[0x263EF8330];
          v52[1] = 3221225472;
          v52[2] = __76__HMDHomeWalletKeyAccessoryManager_configureReaderKey_onACWGAccessory_flow___block_invoke;
          v52[3] = &unk_264A28F00;
          v52[4] = v12;
          id v53 = v10;
          id v18 = v18;
          id v54 = v18;
          id v55 = v17;
          id v56 = v9;
          id v31 = [v30 flatMap:v52];

          goto LABEL_18;
        }
      }
      else
      {
      }
    }
    long long v39 = (void *)MEMORY[0x230FBD990]();
    id v40 = v12;
    id v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      int64_t v42 = HMFGetLogIdentifier();
      __int16 v43 = [v10 UUID];
      [v18 readerPublicKeyExternalRepresentation];
      id v44 = v51 = v10;
      [v18 readerGroupIdentifier];
      id v50 = v39;
      id v45 = v9;
      id v46 = v17;
      id v48 = v47 = v8;
      *(_DWORD *)buf = 138544130;
      id v58 = v42;
      __int16 v59 = 2112;
      id v60 = v43;
      __int16 v61 = 2112;
      uint64_t v62 = v44;
      __int16 v63 = 2112;
      __int16 v64 = v48;
      _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] User is missing either readerPrivateKey or readerPublicKey or readerGroupIdentifier. readerPublicKeyExternalRepresentation: %@, readerGroupIdentifier: %@", buf, 0x2Au);

      id v8 = v47;
      __int16 v17 = v46;
      id v9 = v45;
      long long v39 = v50;

      id v10 = v51;
    }

    uint64_t v38 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    uint64_t v32 = (void *)MEMORY[0x230FBD990]();
    id v33 = v12;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v35 = HMFGetLogIdentifier();
      long long v36 = [v10 UUID];
      *(_DWORD *)buf = 138543618;
      id v58 = v35;
      __int16 v59 = 2112;
      id v60 = v36;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Home was nil", buf, 0x16u);
    }
    long long v37 = (void *)MEMORY[0x263F58190];
    id v18 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    uint64_t v38 = [v37 futureWithError:v18];
  }
  id v31 = (void *)v38;
LABEL_18:

  return v31;
}

id __76__HMDHomeWalletKeyAccessoryManager_configureReaderKey_onACWGAccessory_flow___block_invoke(id *a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = a1[4];
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [a1[5] UUID];
    int v22 = [a1[6] readerPublicKeyExternalRepresentation];
    id v9 = objc_msgSend(v22, "hmf_hexadecimalRepresentation");
    id v10 = [a1[6] readerGroupIdentifier];
    objc_msgSend(v10, "hmf_hexadecimalRepresentation");
    int v11 = v23 = v3;
    os_log_type_t v12 = [a1[6] groupResolvingKey];
    objc_msgSend(v12, "hmf_hexadecimalRepresentation");
    uint32_t v13 = v21 = v4;
    *(_DWORD *)buf = 138544386;
    id v31 = v7;
    __int16 v32 = 2112;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = v9;
    __int16 v36 = 2112;
    long long v37 = v11;
    __int16 v38 = 2112;
    long long v39 = v13;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Setting reader config on lock. RPK: %@, RGI: %@, GRK: %@", buf, 0x34u);

    id v4 = v21;
    id v3 = v23;
  }
  uint64_t v14 = [v3 setOrReadReaderConfig:a1[6] flow:a1[5]];
  int v15 = [v14 naFuture];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __76__HMDHomeWalletKeyAccessoryManager_configureReaderKey_onACWGAccessory_flow___block_invoke_325;
  v24[3] = &unk_264A28ED8;
  id v16 = a1[6];
  id v17 = a1[4];
  id v18 = a1[5];
  id v25 = v16;
  id v26 = v17;
  id v27 = v18;
  id v28 = a1[7];
  id v29 = a1[8];
  __int16 v19 = [v15 flatMap:v24];

  return v19;
}

id __76__HMDHomeWalletKeyAccessoryManager_configureReaderKey_onACWGAccessory_flow___block_invoke_325(id *a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (!v5) {
    goto LABEL_8;
  }
  id v6 = [v3 readerPublicKeyExternalRepresentation];
  id v7 = [a1[4] readerPublicKeyExternalRepresentation];
  int v8 = HMFEqualObjects();

  if (v8
    && ([v3 readerGroupIdentifier],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [a1[4] readerGroupIdentifier],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = HMFEqualObjects(),
        v10,
        v9,
        v11))
  {
    os_log_type_t v12 = [v3 groupResolvingKey];
    uint32_t v13 = [a1[4] groupResolvingKey];
    char v14 = HMFEqualObjects();

    if (v14)
    {
LABEL_8:
      id v15 = [MEMORY[0x263F58190] futureWithNoResult];
      goto LABEL_13;
    }
  }
  else
  {
  }
  id v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = a1[5];
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    __int16 v19 = HMFGetLogIdentifier();
    id v20 = [a1[6] UUID];
    __int16 v36 = [v3 readerPublicKeyExternalRepresentation];
    uint64_t v21 = objc_msgSend(v36, "hmf_hexadecimalRepresentation");
    id v35 = [v3 readerGroupIdentifier];
    objc_msgSend(v35, "hmf_hexadecimalRepresentation");
    int v22 = v37 = v16;
    id v23 = [v3 groupResolvingKey];
    uint64_t v24 = objc_msgSend(v23, "hmf_hexadecimalRepresentation");
    *(_DWORD *)buf = 138544386;
    id v46 = v19;
    __int16 v47 = 2112;
    id v48 = v20;
    __int16 v49 = 2112;
    id v50 = v21;
    __int16 v51 = 2112;
    id v52 = v22;
    __int16 v53 = 2112;
    id v54 = v24;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Found existing reader config on lock. RPK: %@, RGI: %@, GRK: %@", buf, 0x34u);

    id v16 = v37;
  }

  id v25 = objc_alloc_init(MEMORY[0x263F58190]);
  id v26 = [a1[7] backingStore];
  id v27 = [v26 context];

  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __76__HMDHomeWalletKeyAccessoryManager_configureReaderKey_onACWGAccessory_flow___block_invoke_327;
  v38[3] = &unk_264A28EB0;
  id v28 = a1[8];
  id v29 = a1[5];
  id v30 = a1[6];
  id v39 = v28;
  id v40 = v29;
  id v41 = v30;
  id v31 = v25;
  id v42 = v31;
  id v43 = v3;
  id v44 = v27;
  id v32 = v27;
  [v32 performBlock:v38];
  id v33 = v44;
  id v15 = v31;

LABEL_13:
  return v15;
}

void __76__HMDHomeWalletKeyAccessoryManager_configureReaderKey_onACWGAccessory_flow___block_invoke_327(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) uuid];
  id v3 = +[HMCContext findHAPAccessoryWithModelID:v2];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 64) readerPublicKeyExternalRepresentation];
    [v3 setPreexistingMatCredRPK:v4];

    id v5 = [*(id *)(a1 + 64) readerGroupIdentifier];
    [v3 setPreexistingMatCredRGI:v5];

    id v6 = [*(id *)(a1 + 64) groupResolvingKey];
    [v3 setPreexistingMatCredGRK:v6];

    id v7 = *(void **)(a1 + 72);
    id v27 = 0;
    char v8 = [v7 save:&v27];
    id v9 = v27;
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 40);
    os_log_type_t v12 = HMFGetOSLogHandle();
    uint32_t v13 = v12;
    if (v8)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        char v14 = HMFGetLogIdentifier();
        id v15 = [*(id *)(a1 + 48) UUID];
        *(_DWORD *)buf = 138543618;
        id v29 = v14;
        __int16 v30 = 2112;
        id v31 = v15;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully saved preexisting reader config for ACWG", buf, 0x16u);
      }
      [*(id *)(a1 + 56) finishWithNoResult];
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        uint64_t v24 = [*(id *)(a1 + 48) UUID];
        *(_DWORD *)buf = 138543618;
        id v29 = v23;
        __int16 v30 = 2112;
        id v31 = v24;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to save preexisting reader config for ACWG", buf, 0x16u);
      }
      id v25 = *(void **)(a1 + 56);
      id v26 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      [v25 finishWithError:v26];
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = *(id *)(a1 + 40);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      id v20 = [*(id *)(a1 + 48) UUID];
      uint64_t v21 = [*(id *)(a1 + 32) uuid];
      *(_DWORD *)buf = 138543874;
      id v29 = v19;
      __int16 v30 = 2112;
      id v31 = v20;
      __int16 v32 = 2112;
      id v33 = v21;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to save supportsACWGUWB because could not find mkfHAPAccessory with UUID: %@", buf, 0x20u);
    }
    int v22 = *(void **)(a1 + 56);
    id v9 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v22 finishWithError:v9];
  }
}

- (void)configureAccessoryWithNfcReaderKey:(id)a3 accessory:(id)a4 flow:(id)a5 completion:(id)a6
{
  uint64_t v152 = *MEMORY[0x263EF8340];
  id v119 = (__CFString *)a3;
  id v10 = a4;
  id v120 = a5;
  __int16 v118 = (void (**)(id, void *))a6;
  id v11 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  os_log_type_t v12 = (void *)MEMORY[0x230FBD990]();
  uint32_t v13 = self;
  char v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    id v16 = [v120 UUID];
    id v17 = [v10 uuid];
    *(_DWORD *)buf = 138544130;
    v143 = v15;
    __int16 v144 = 2112;
    v145 = v16;
    __int16 v146 = 2112;
    v147 = v119;
    __int16 v148 = 2112;
    v149 = v17;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] configureAccessoryWithNfcReaderKey: %@, accessory: %@", buf, 0x2Au);
  }
  id v18 = [(HMDHomeWalletKeyAccessoryManager *)v13 home];
  __int16 v19 = v18;
  if (!v18)
  {
    __int16 v32 = (void *)MEMORY[0x230FBD990]();
    id v33 = v13;
    uint64_t v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v35 = HMFGetLogIdentifier();
      __int16 v36 = [v120 UUID];
      *(_DWORD *)buf = 138543618;
      v143 = v35;
      __int16 v144 = 2112;
      v145 = v36;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure accessory with nfc reader key, home is nil", buf, 0x16u);
    }
    goto LABEL_15;
  }
  id v20 = [(__CFString *)v18 currentUser];
  [v20 isOwner];

  uint64_t v21 = (void *)MEMORY[0x230FBD990]();
  int v22 = v13;
  id v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = HMFGetLogIdentifier();
    id v25 = [v120 UUID];
    id v26 = [v10 shortDescription];
    *(_DWORD *)buf = 138544130;
    v143 = v24;
    __int16 v144 = 2112;
    v145 = v25;
    __int16 v146 = 2112;
    v147 = v26;
    __int16 v148 = 2112;
    v149 = v119;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Configuring accessory with nfc reader key %@:%@", buf, 0x2Au);
  }
  id v27 = [v10 home];
  id v28 = [v27 uuid];
  id v29 = [(__CFString *)v19 uuid];
  char v30 = [v28 isEqual:v29];

  if ((v30 & 1) == 0)
  {
    __int16 v32 = (void *)MEMORY[0x230FBD990]();
    id v33 = v22;
    uint64_t v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      __int16 v38 = HMFGetLogIdentifier();
      id v39 = [v120 UUID];
      id v40 = [v10 shortDescription];
      id v41 = [v10 home];
      *(_DWORD *)buf = 138544386;
      v143 = v38;
      __int16 v144 = 2112;
      v145 = v39;
      __int16 v146 = 2112;
      v147 = v40;
      __int16 v148 = 2112;
      v149 = v41;
      __int16 v150 = 2112;
      v151 = v19;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, its home: %@ doesn't match current home: %@", buf, 0x34u);
    }
LABEL_15:

    long long v37 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    v118[2](v118, v37);

    goto LABEL_47;
  }
  if ([v10 supportsCHIP])
  {
    if ([v10 supportsACWGProvisioning])
    {
      if (_os_feature_enabled_impl()
        && ((isInternalBuild() & 1) != 0
         || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
      {
        id v31 = [(HMDHomeWalletKeyAccessoryManager *)v22 configureReaderKey:v119 onACWGAccessory:v10 flow:v120];
      }
      else
      {
        uint64_t v83 = (void *)MEMORY[0x230FBD990]();
        id v84 = v22;
        long long v85 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          id v86 = HMFGetLogIdentifier();
          id v87 = [v120 UUID];
          *(_DWORD *)buf = 138543618;
          v143 = v86;
          __int16 v144 = 2112;
          v145 = v87;
          _os_log_impl(&dword_22F52A000, v85, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not configureing UA style reader key on Aliro accessory", buf, 0x16u);
        }
        v118[2](v118, 0);
      }
    }
    else
    {
      __int16 v61 = (void *)MEMORY[0x230FBD990]();
      uint64_t v62 = v22;
      __int16 v63 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        __int16 v64 = HMFGetLogIdentifier();
        uint64_t v65 = [v120 UUID];
        *(_DWORD *)buf = 138543618;
        v143 = v64;
        __int16 v144 = 2112;
        v145 = v65;
        _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Configuring NFC reader key for Matter accessory", buf, 0x16u);
      }
      id v66 = objc_alloc_init(MEMORY[0x263F35A88]);
      id v67 = (void *)[objc_alloc(MEMORY[0x263F35A30]) initWithValue:2];
      [v66 setType:v67];

      __int16 v68 = [(__CFString *)v119 privateKey];
      [v66 setKey:v68];

      id v69 = [v10 nfcReaderIdentifier];
      [v66 setKeyIdentifier:v69];

      uint64_t v70 = [v10 nfcReaderIdentifier];
      [v66 setReaderIdentifier:v70];

      id v117 = objc_alloc_init(MEMORY[0x263F359D8]);
      [v117 setReaderKey:v66];
      int64_t v71 = [v10 uuid];
      [(HMDHomeWalletKeyAccessoryManager *)v62 startHomeWalletKeyAddForAccessoryUUID:v71 keyType:0 expectedCount:1];

      id v140 = 0;
      v115 = [v117 serializeWithError:&v140];
      v112 = (__CFString *)v140;
      if (v115)
      {
        uint64_t v72 = [v10 waitForDoorLockClusterObjectWithFlow:v120];
        v137[0] = MEMORY[0x263EF8330];
        v137[1] = 3221225472;
        v137[2] = __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke;
        v137[3] = &unk_264A28E38;
        id v138 = v115;
        id v73 = v120;
        id v139 = v73;
        uint64_t v74 = [v72 then:v137];
        v132[0] = MEMORY[0x263EF8330];
        v132[1] = 3221225472;
        v132[2] = __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke_2;
        v132[3] = &unk_264A28E60;
        v132[4] = v62;
        id v133 = v73;
        v134 = v119;
        id v135 = v10;
        v136 = v118;
        v129[0] = MEMORY[0x263EF8330];
        v129[1] = 3221225472;
        v129[2] = __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke_320;
        v129[3] = &unk_264A28E88;
        v129[4] = v62;
        id v130 = v133;
        v131 = v136;
        id v75 = (id)[v74 then:v132 orRecover:v129];

        id v76 = v138;
      }
      else
      {
        __int16 v94 = (void *)MEMORY[0x230FBD990]();
        id v95 = v62;
        id v96 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
        {
          __int16 v97 = HMFGetLogIdentifier();
          id v98 = [v120 UUID];
          __int16 v99 = [v10 shortDescription];
          *(_DWORD *)buf = 138544386;
          v143 = v97;
          __int16 v144 = 2112;
          v145 = v98;
          __int16 v146 = 2112;
          v147 = v99;
          __int16 v148 = 2112;
          v149 = 0;
          __int16 v150 = 2112;
          v151 = v112;
          _os_log_impl(&dword_22F52A000, v96, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, unable to encode matter credential %@:%@", buf, 0x34u);
        }
        id v76 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1002];
        v118[2](v118, v76);
      }
    }
  }
  else
  {
    id v42 = (void *)MEMORY[0x230FBD990]();
    id v43 = v22;
    id v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      id v45 = HMFGetLogIdentifier();
      id v46 = [v120 UUID];
      *(_DWORD *)buf = 138543618;
      v143 = v45;
      __int16 v144 = 2112;
      v145 = v46;
      _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Configuring NFC reader key for HAP accessory", buf, 0x16u);
    }
    __int16 v47 = [v10 findServiceWithServiceType:@"00000266-0000-1000-8000-0026BB765291"];
    __int16 v114 = v47;
    if (v47)
    {
      __int16 v116 = [(__CFString *)v47 findCharacteristicWithType:@"00000264-0000-1000-8000-0026BB765291"];
      if (v116)
      {
        id v111 = objc_alloc_init(MEMORY[0x263F35A40]);
        id v48 = [(__CFString *)v119 privateKey];
        [v111 setKey:v48];

        __int16 v49 = (void *)[objc_alloc(MEMORY[0x263F35A30]) initWithValue:2];
        [v111 setType:v49];

        id v50 = [v10 nfcReaderIdentifier];
        [v111 setReaderIdentifier:v50];

        long long v110 = (void *)[objc_alloc(MEMORY[0x263F35A38]) initWithValue:2];
        long long v109 = (void *)[objc_alloc(MEMORY[0x263F35A18]) initWithOperationType:v110 issuerKeyRequest:0 issuerKeyResponse:0 deviceCredentialKeyRequest:0 deviceCredentialKeyResponse:0 readerKeyRequest:v111 readerKeyResponse:0];
        id v128 = 0;
        long long v108 = [v109 serializeWithError:&v128];
        id v107 = (__CFString *)v128;
        if (v108)
        {
          __int16 v51 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v116 value:v108 authorizationData:0 identifier:0 type:0 includeResponseValue:1];
          v141 = v51;
          id v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v141 count:1];
          __int16 v53 = [(HMDHomeWalletKeyAccessoryManager *)v43 dataSource];
          uint64_t v54 = [v53 accessoryWriteMaxRetryCount];
          uint64_t v55 = [(HMDHomeWalletKeyAccessoryManager *)v43 dataSource];
          [v55 accessoryWriteRetryInterval];
          id v106 = -[__CFString performWriteRequests:withRetries:timeInterval:loggingObject:](v19, "performWriteRequests:withRetries:timeInterval:loggingObject:", v52, v54, v43);

          objc_initWeak((id *)buf, v43);
          objc_initWeak(&location, v10);
          id v56 = (void *)MEMORY[0x263F581B8];
          id v57 = [(HMDHomeWalletKeyAccessoryManager *)v43 workQueue];
          id v58 = [v56 schedulerWithDispatchQueue:v57];
          __int16 v59 = [v106 reschedule:v58];
          v121[0] = MEMORY[0x263EF8330];
          v121[1] = 3221225472;
          v121[2] = __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke_322;
          v121[3] = &unk_264A28E10;
          objc_copyWeak(&v125, (id *)buf);
          objc_copyWeak(&v126, &location);
          id v122 = v120;
          v124 = v118;
          id v123 = v116;
          id v60 = (id)[v59 addCompletionBlock:v121];

          objc_destroyWeak(&v126);
          objc_destroyWeak(&v125);
          objc_destroyWeak(&location);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          uint64_t v100 = (void *)MEMORY[0x230FBD990]();
          __int16 v101 = v43;
          uint64_t v102 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            uint64_t v103 = HMFGetLogIdentifier();
            id v104 = [v120 UUID];
            id v105 = [v10 shortDescription];
            *(_DWORD *)buf = 138544386;
            v143 = v103;
            __int16 v144 = 2112;
            v145 = v104;
            __int16 v146 = 2112;
            v147 = v105;
            __int16 v148 = 2112;
            v149 = 0;
            __int16 v150 = 2112;
            v151 = v107;
            _os_log_impl(&dword_22F52A000, v102, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, unable to encode nfc access control %@:%@", buf, 0x34u);
          }
          __int16 v51 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
          v118[2](v118, v51);
        }
      }
      else
      {
        long long v88 = (void *)MEMORY[0x230FBD990]();
        id v89 = v43;
        id v90 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          uint64_t v91 = HMFGetLogIdentifier();
          int64_t v92 = [v120 UUID];
          uint64_t v93 = [v10 shortDescription];
          *(_DWORD *)buf = 138544386;
          v143 = v91;
          __int16 v144 = 2112;
          v145 = v92;
          __int16 v146 = 2112;
          v147 = v93;
          __int16 v148 = 2112;
          v149 = v114;
          __int16 v150 = 2112;
          v151 = @"00000264-0000-1000-8000-0026BB765291";
          _os_log_impl(&dword_22F52A000, v90, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, NFC access service: %@ doesn't support control point characteristic: %@", buf, 0x34u);
        }
        v113 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        v118[2](v118, v113);
      }
    }
    else
    {
      __int16 v77 = (void *)MEMORY[0x230FBD990]();
      id v78 = v43;
      id v79 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        id v80 = HMFGetLogIdentifier();
        uint64_t v81 = [v120 UUID];
        id v82 = [v10 shortDescription];
        *(_DWORD *)buf = 138544130;
        v143 = v80;
        __int16 v144 = 2112;
        v145 = v81;
        __int16 v146 = 2112;
        v147 = v82;
        __int16 v148 = 2112;
        v149 = @"00000266-0000-1000-8000-0026BB765291";
        _os_log_impl(&dword_22F52A000, v79, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, it doesn't support nfc access service %@", buf, 0x2Au);
      }
      __int16 v116 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
      v118[2](v118, v116);
    }
  }
LABEL_47:
}

uint64_t __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 addOrUpdateReaderKeyData:*(void *)(a1 + 32) flow:*(void *)(a1 + 40)];
  if (v4)
  {
    id v5 = v4;

    return 3;
  }
  else
  {
    uint64_t v7 = _HMFPreconditionFailure();
    return __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke_2(v7);
  }
}

uint64_t __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 status];
  if (v4
    && (id v5 = (void *)v4,
        [v3 status],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToNumber:&unk_26E473138],
        v6,
        v5,
        v7))
  {
    char v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      os_log_type_t v12 = [*(id *)(a1 + 40) UUID];
      uint32_t v13 = *(void **)(a1 + 48);
      char v14 = [*(id *)(a1 + 56) uuid];
      int v26 = 138544130;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v12;
      __int16 v30 = 2112;
      id v31 = v13;
      __int16 v32 = 2112;
      id v33 = v14;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully configured accessory with NFC reader key: %@, accessory: %@", (uint8_t *)&v26, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v15 = *(void **)(a1 + 32);
    id v16 = [*(id *)(a1 + 56) uuid];
    [v15 updateHomeWalletKeyAddForAccessoryUUID:v16 keyType:0];
  }
  else
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = *(id *)(a1 + 32);
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      uint64_t v21 = [*(id *)(a1 + 40) UUID];
      int v22 = [*(id *)(a1 + 56) shortDescription];
      id v23 = [v3 status];
      int v26 = 138544130;
      id v27 = v20;
      __int16 v28 = 2112;
      id v29 = v21;
      __int16 v30 = 2112;
      id v31 = v22;
      __int16 v32 = 2112;
      id v33 = v23;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@ with status code: %@", (uint8_t *)&v26, 0x2Au);
    }
    uint64_t v24 = *(void *)(a1 + 64);
    id v16 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v16);
  }

  return 1;
}

uint64_t __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke_320(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 domain];
  id v5 = v4;
  if (v4 != (void *)*MEMORY[0x263F497B8])
  {

    goto LABEL_7;
  }
  uint64_t v6 = [v3 code];

  if (v6 != 8)
  {
LABEL_7:
    int v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      os_log_type_t v12 = HMFGetLogIdentifier();
      uint32_t v13 = [*(id *)(a1 + 40) UUID];
      int v15 = 138543874;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v13;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to configure NFC reader key with error: %@", (uint8_t *)&v15, 0x20u);
    }
    goto LABEL_9;
  }
  int v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [*(id *)(a1 + 40) UUID];
    int v15 = 138543618;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Ignoring duplicate error while adding Reader key", (uint8_t *)&v15, 0x16u);
  }
LABEL_9:

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  return 1;
}

void __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke_322(uint64_t a1, void *a2, void *a3)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = objc_loadWeakRetained((id *)(a1 + 64));
  id v9 = v8;
  if (WeakRetained)
  {
    if (v5)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      id v83 = 0;
      id v11 = objc_msgSend(v5, "hmd_valueOfCharacteristic:error:", v10, &v83);
      id v12 = v83;
      uint64_t v81 = v11;
      if (!v11)
      {
        id v45 = (void *)MEMORY[0x230FBD990]();
        id v46 = WeakRetained;
        __int16 v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v76 = v6;
          id v78 = v5;
          v49 = id v48 = v9;
          id v50 = [*(id *)(a1 + 32) UUID];
          [v9 shortDescription];
          v52 = __int16 v51 = v45;
          __int16 v53 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138544386;
          long long v85 = v49;
          __int16 v86 = 2112;
          id v87 = v50;
          __int16 v88 = 2112;
          id v89 = v52;
          __int16 v90 = 2112;
          id v91 = v78;
          __int16 v92 = 2112;
          id v93 = v53;
          _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, unable to parse write response dictionary: %@ with characteristic: %@", buf, 0x34u);

          id v45 = v51;
          id v9 = v48;
          id v6 = v76;
          id v5 = v78;
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_32;
      }
      id v75 = v6;
      id v13 = v11;
      objc_opt_class();
      int v14 = objc_opt_isKindOfClass() & 1;
      if (v14) {
        int v15 = v13;
      }
      else {
        int v15 = 0;
      }
      id v16 = v15;

      if (!v14)
      {
        id v79 = v16;
        uint64_t v54 = (void *)MEMORY[0x230FBD990]();
        id v55 = WeakRetained;
        id v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v57 = id v72 = v55;
          id v58 = [*(id *)(a1 + 32) UUID];
          [v9 shortDescription];
          __int16 v59 = v74 = v54;
          *(_DWORD *)buf = 138544130;
          long long v85 = v57;
          __int16 v86 = 2112;
          id v87 = v58;
          __int16 v88 = 2112;
          id v89 = v13;
          __int16 v90 = 2112;
          id v91 = v59;
          _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, response value: %@ is not of type NSData", buf, 0x2Au);

          uint64_t v54 = v74;
          id v55 = v72;
        }

        uint64_t v60 = *(void *)(a1 + 48);
        __int16 v19 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        (*(void (**)(uint64_t, void *))(v60 + 16))(v60, v19);
        id v6 = v75;
        id v16 = v79;
        goto LABEL_31;
      }
      id v82 = 0;
      __int16 v17 = [MEMORY[0x263F35A18] parsedFromData:v13 error:&v82];
      id v18 = v82;
      __int16 v19 = v18;
      id v73 = v17;
      if (v17)
      {
        id v20 = [v17 readerKeyResponse];
        uint64_t v21 = [v20 statusCode];

        if (v21 && ![v21 value])
        {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          goto LABEL_30;
        }
        id v71 = v19;
        id v77 = v16;
        int v22 = (void *)MEMORY[0x230FBD990]();
        id v23 = WeakRetained;
        uint64_t v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v25 = v67 = v23;
          int v26 = [*(id *)(a1 + 32) UUID];
          [v9 shortDescription];
          id v27 = v69 = v22;
          *(_DWORD *)buf = 138544130;
          long long v85 = v25;
          __int16 v86 = 2112;
          id v87 = v26;
          __int16 v88 = 2112;
          id v89 = v27;
          __int16 v90 = 2112;
          id v91 = v21;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@ with status code: %@", buf, 0x2Au);

          int v22 = v69;
          id v23 = v67;
        }

        uint64_t v28 = *(void *)(a1 + 48);
        id v29 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
        (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v29);

        id v16 = v77;
      }
      else
      {
        id v71 = v18;
        __int16 v61 = (void *)MEMORY[0x230FBD990]();
        id v70 = WeakRetained;
        uint64_t v62 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          __int16 v63 = v68 = v61;
          __int16 v64 = [*(id *)(a1 + 32) UUID];
          [v9 shortDescription];
          v65 = id v80 = v16;
          *(_DWORD *)buf = 138544386;
          long long v85 = v63;
          __int16 v86 = 2112;
          id v87 = v64;
          __int16 v88 = 2112;
          id v89 = v65;
          __int16 v90 = 2112;
          id v91 = v13;
          __int16 v92 = 2112;
          id v93 = v71;
          _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, failed to parse response value %@:%@", buf, 0x34u);

          id v16 = v80;
          __int16 v61 = v68;
        }

        uint64_t v66 = *(void *)(a1 + 48);
        uint64_t v21 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        (*(void (**)(uint64_t, void *))(v66 + 16))(v66, v21);
      }
      __int16 v19 = v71;
LABEL_30:

      id v6 = v75;
LABEL_31:

LABEL_32:
      goto LABEL_33;
    }
    __int16 v36 = v8;
    id v37 = v6;
    __int16 v38 = (void *)MEMORY[0x230FBD990]();
    id v39 = WeakRetained;
    id v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      id v41 = HMFGetLogIdentifier();
      id v42 = [*(id *)(a1 + 32) UUID];
      id v43 = [v36 shortDescription];
      *(_DWORD *)buf = 138544130;
      long long v85 = v41;
      __int16 v86 = 2112;
      id v87 = v42;
      __int16 v88 = 2112;
      id v89 = v43;
      __int16 v90 = 2112;
      id v91 = v37;
      _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, write response is nil: %@", buf, 0x2Au);
    }
    uint64_t v44 = *(void *)(a1 + 48);
    id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, id))(v44 + 16))(v44, v12);
    id v6 = v37;
    id v9 = v36;
    id v5 = 0;
  }
  else
  {
    __int16 v30 = (void *)MEMORY[0x230FBD990]();
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = HMFGetLogIdentifier();
      id v33 = [*(id *)(a1 + 32) UUID];
      uint64_t v34 = [v9 shortDescription];
      *(_DWORD *)buf = 138543874;
      long long v85 = v32;
      __int16 v86 = 2112;
      id v87 = v33;
      __int16 v88 = 2112;
      id v89 = v34;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, object got invalidated", buf, 0x20u);
    }
    uint64_t v35 = *(void *)(a1 + 48);
    id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, id))(v35 + 16))(v35, v12);
  }
LABEL_33:
}

- (void)removeNfcReaderKeyWithIdentifier:(id)a3 accessory:(id)a4 flow:(id)a5 completion:(id)a6
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v77 = (__CFString *)a3;
  id v10 = a4;
  id v78 = a5;
  id v11 = a6;
  id v12 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(HMDHomeWalletKeyAccessoryManager *)self home];
  int v14 = v13;
  if (v13)
  {
    int v15 = [(__CFString *)v13 currentUser];
    [v15 isOwner];

    id v16 = (void *)MEMORY[0x230FBD990]();
    __int16 v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = HMFGetLogIdentifier();
      id v20 = [v78 UUID];
      uint64_t v21 = [v10 shortDescription];
      *(_DWORD *)buf = 138544130;
      id v89 = v19;
      __int16 v90 = 2112;
      id v91 = v20;
      __int16 v92 = 2112;
      id v93 = v21;
      __int16 v94 = 2112;
      id v95 = v77;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing nfc reader key with identifier from accessory %@:%@", buf, 0x2Au);
    }
    int v22 = [v10 home];
    id v23 = [v22 uuid];
    uint64_t v24 = [(__CFString *)v14 uuid];
    char v25 = [v23 isEqual:v24];

    if (v25)
    {
      int v26 = [v10 findServiceWithServiceType:@"00000266-0000-1000-8000-0026BB765291"];
      id v27 = v26;
      if (v26)
      {
        context = [(__CFString *)v26 findCharacteristicWithType:@"00000264-0000-1000-8000-0026BB765291"];
        if (context)
        {
          id v71 = objc_alloc_init(MEMORY[0x263F35A40]);
          [v71 setIdentifier:v77];
          id v70 = (void *)[objc_alloc(MEMORY[0x263F35A38]) initWithValue:3];
          id v69 = (void *)[objc_alloc(MEMORY[0x263F35A18]) initWithOperationType:v70 issuerKeyRequest:0 issuerKeyResponse:0 deviceCredentialKeyRequest:0 deviceCredentialKeyResponse:0 readerKeyRequest:v71 readerKeyResponse:0];
          id v86 = 0;
          __int16 v68 = [v69 serializeWithError:&v86];
          uint64_t v66 = (__CFString *)v86;
          if (v68)
          {
            id v67 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:context value:v68 authorizationData:0 identifier:0 type:0 includeResponseValue:1];
            id v87 = v67;
            uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v87 count:1];
            id v29 = [(HMDHomeWalletKeyAccessoryManager *)v17 dataSource];
            uint64_t v30 = [v29 accessoryWriteMaxRetryCount];
            id v31 = [(HMDHomeWalletKeyAccessoryManager *)v17 dataSource];
            [v31 accessoryWriteRetryInterval];
            uint64_t v65 = -[__CFString performWriteRequests:withRetries:timeInterval:loggingObject:](v14, "performWriteRequests:withRetries:timeInterval:loggingObject:", v28, v30, v17);

            objc_initWeak((id *)buf, v17);
            objc_initWeak(&location, v10);
            __int16 v32 = (void *)MEMORY[0x263F581B8];
            id v33 = [(HMDHomeWalletKeyAccessoryManager *)v17 workQueue];
            uint64_t v34 = [v32 schedulerWithDispatchQueue:v33];
            uint64_t v35 = [v65 reschedule:v34];
            v79[0] = MEMORY[0x263EF8330];
            v79[1] = 3221225472;
            v79[2] = __95__HMDHomeWalletKeyAccessoryManager_removeNfcReaderKeyWithIdentifier_accessory_flow_completion___block_invoke;
            v79[3] = &unk_264A28E10;
            objc_copyWeak(&v83, (id *)buf);
            objc_copyWeak(&v84, &location);
            id v80 = v78;
            id v82 = v11;
            id v81 = context;
            id v36 = (id)[v35 addCompletionBlock:v79];

            objc_destroyWeak(&v84);
            objc_destroyWeak(&v83);
            objc_destroyWeak(&location);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            __int16 v59 = (void *)MEMORY[0x230FBD990]();
            uint64_t v60 = v17;
            __int16 v61 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              uint64_t v62 = HMFGetLogIdentifier();
              __int16 v63 = [v78 UUID];
              __int16 v64 = [v10 shortDescription];
              *(_DWORD *)buf = 138544386;
              id v89 = v62;
              __int16 v90 = 2112;
              id v91 = v63;
              __int16 v92 = 2112;
              id v93 = v64;
              __int16 v94 = 2112;
              id v95 = 0;
              __int16 v96 = 2112;
              __int16 v97 = v66;
              _os_log_impl(&dword_22F52A000, v61, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, unable to encode nfc access control %@:%@", buf, 0x34u);
            }
            id v67 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
            (*((void (**)(id, void *))v11 + 2))(v11, v67);
          }
        }
        else
        {
          id v72 = (void *)MEMORY[0x230FBD990]();
          uint64_t v54 = v17;
          id v55 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            id v56 = HMFGetLogIdentifier();
            id v57 = [v78 UUID];
            id v58 = [v10 shortDescription];
            *(_DWORD *)buf = 138544386;
            id v89 = v56;
            __int16 v90 = 2112;
            id v91 = v57;
            __int16 v92 = 2112;
            id v93 = v58;
            __int16 v94 = 2112;
            id v95 = v27;
            __int16 v96 = 2112;
            __int16 v97 = @"00000264-0000-1000-8000-0026BB765291";
            _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, NFC access service: %@ doesn't support control point characteristic: %@", buf, 0x34u);
          }
          id v73 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
          (*((void (**)(id, void *))v11 + 2))(v11, v73);
        }
      }
      else
      {
        contexta = (void *)MEMORY[0x230FBD990]();
        __int16 v49 = v17;
        id v50 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          __int16 v51 = HMFGetLogIdentifier();
          id v52 = [v78 UUID];
          __int16 v53 = [v10 shortDescription];
          *(_DWORD *)buf = 138544130;
          id v89 = v51;
          __int16 v90 = 2112;
          id v91 = v52;
          __int16 v92 = 2112;
          id v93 = v53;
          __int16 v94 = 2112;
          id v95 = @"00000266-0000-1000-8000-0026BB765291";
          _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, it doesn't support nfc access service %@", buf, 0x2Au);
        }
        contextb = [MEMORY[0x263F087E8] hmErrorWithCode:48];
        (*((void (**)(id, void *))v11 + 2))(v11, contextb);
      }
    }
    else
    {
      id v42 = (void *)MEMORY[0x230FBD990]();
      id v43 = v17;
      uint64_t v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        id v45 = HMFGetLogIdentifier();
        id v46 = [v78 UUID];
        __int16 v47 = [v10 shortDescription];
        id v48 = [v10 home];
        *(_DWORD *)buf = 138544386;
        id v89 = v45;
        __int16 v90 = 2112;
        id v91 = v46;
        __int16 v92 = 2112;
        id v93 = v47;
        __int16 v94 = 2112;
        id v95 = v48;
        __int16 v96 = 2112;
        __int16 v97 = v14;
        _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, its home: %@ doesn't match current home: %@", buf, 0x34u);
      }
      id v27 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      (*((void (**)(id, __CFString *))v11 + 2))(v11, v27);
    }
  }
  else
  {
    id v37 = (void *)MEMORY[0x230FBD990]();
    __int16 v38 = self;
    id v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      id v40 = HMFGetLogIdentifier();
      id v41 = [v78 UUID];
      *(_DWORD *)buf = 138543618;
      id v89 = v40;
      __int16 v90 = 2112;
      id v91 = v41;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from accessory, home is nil", buf, 0x16u);
    }
    id v27 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*((void (**)(id, __CFString *))v11 + 2))(v11, v27);
  }
}

void __95__HMDHomeWalletKeyAccessoryManager_removeNfcReaderKeyWithIdentifier_accessory_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = objc_loadWeakRetained((id *)(a1 + 64));
  id v9 = v8;
  if (WeakRetained)
  {
    if (v5)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      id v83 = 0;
      id v11 = objc_msgSend(v5, "hmd_valueOfCharacteristic:error:", v10, &v83);
      id v12 = v83;
      id v81 = v11;
      if (!v11)
      {
        id v45 = (void *)MEMORY[0x230FBD990]();
        id v46 = WeakRetained;
        __int16 v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v76 = v6;
          id v78 = v5;
          v49 = id v48 = v9;
          id v50 = [*(id *)(a1 + 32) UUID];
          [v9 shortDescription];
          v52 = __int16 v51 = v45;
          __int16 v53 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138544386;
          long long v85 = v49;
          __int16 v86 = 2112;
          id v87 = v50;
          __int16 v88 = 2112;
          id v89 = v52;
          __int16 v90 = 2112;
          id v91 = v78;
          __int16 v92 = 2112;
          id v93 = v53;
          _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, unable to parse write response dictionary: %@ with characteristic: %@", buf, 0x34u);

          id v45 = v51;
          id v9 = v48;
          id v6 = v76;
          id v5 = v78;
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_32;
      }
      id v75 = v6;
      id v13 = v11;
      objc_opt_class();
      int v14 = objc_opt_isKindOfClass() & 1;
      if (v14) {
        int v15 = v13;
      }
      else {
        int v15 = 0;
      }
      id v16 = v15;

      if (!v14)
      {
        id v79 = v16;
        uint64_t v54 = (void *)MEMORY[0x230FBD990]();
        id v55 = WeakRetained;
        id v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v57 = id v72 = v55;
          id v58 = [*(id *)(a1 + 32) UUID];
          [v9 shortDescription];
          __int16 v59 = v74 = v54;
          *(_DWORD *)buf = 138544130;
          long long v85 = v57;
          __int16 v86 = 2112;
          id v87 = v58;
          __int16 v88 = 2112;
          id v89 = v13;
          __int16 v90 = 2112;
          id v91 = v59;
          _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, response value: %@ is not of type NSData", buf, 0x2Au);

          uint64_t v54 = v74;
          id v55 = v72;
        }

        uint64_t v60 = *(void *)(a1 + 48);
        __int16 v19 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        (*(void (**)(uint64_t, void *))(v60 + 16))(v60, v19);
        id v6 = v75;
        id v16 = v79;
        goto LABEL_31;
      }
      id v82 = 0;
      __int16 v17 = [MEMORY[0x263F35A18] parsedFromData:v13 error:&v82];
      id v18 = v82;
      __int16 v19 = v18;
      id v73 = v17;
      if (v17)
      {
        id v20 = [v17 readerKeyResponse];
        uint64_t v21 = [v20 statusCode];

        if (v21 && ![v21 value])
        {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          goto LABEL_30;
        }
        id v71 = v19;
        id v77 = v16;
        int v22 = (void *)MEMORY[0x230FBD990]();
        id v23 = WeakRetained;
        uint64_t v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          char v25 = v67 = v23;
          int v26 = [*(id *)(a1 + 32) UUID];
          [v9 shortDescription];
          id v27 = v69 = v22;
          *(_DWORD *)buf = 138544130;
          long long v85 = v25;
          __int16 v86 = 2112;
          id v87 = v26;
          __int16 v88 = 2112;
          id v89 = v27;
          __int16 v90 = 2112;
          id v91 = v21;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@ with status code: %@", buf, 0x2Au);

          int v22 = v69;
          id v23 = v67;
        }

        uint64_t v28 = *(void *)(a1 + 48);
        id v29 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
        (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v29);

        id v16 = v77;
      }
      else
      {
        id v71 = v18;
        __int16 v61 = (void *)MEMORY[0x230FBD990]();
        id v70 = WeakRetained;
        uint64_t v62 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          __int16 v63 = v68 = v61;
          __int16 v64 = [*(id *)(a1 + 32) UUID];
          [v9 shortDescription];
          v65 = id v80 = v16;
          *(_DWORD *)buf = 138544386;
          long long v85 = v63;
          __int16 v86 = 2112;
          id v87 = v64;
          __int16 v88 = 2112;
          id v89 = v65;
          __int16 v90 = 2112;
          id v91 = v13;
          __int16 v92 = 2112;
          id v93 = v71;
          _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, failed to parse response value %@:%@", buf, 0x34u);

          id v16 = v80;
          __int16 v61 = v68;
        }

        uint64_t v66 = *(void *)(a1 + 48);
        uint64_t v21 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        (*(void (**)(uint64_t, void *))(v66 + 16))(v66, v21);
      }
      __int16 v19 = v71;
LABEL_30:

      id v6 = v75;
LABEL_31:

LABEL_32:
      goto LABEL_33;
    }
    id v36 = v8;
    id v37 = v6;
    __int16 v38 = (void *)MEMORY[0x230FBD990]();
    id v39 = WeakRetained;
    id v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      id v41 = HMFGetLogIdentifier();
      id v42 = [*(id *)(a1 + 32) UUID];
      id v43 = [v36 shortDescription];
      *(_DWORD *)buf = 138544130;
      long long v85 = v41;
      __int16 v86 = 2112;
      id v87 = v42;
      __int16 v88 = 2112;
      id v89 = v43;
      __int16 v90 = 2112;
      id v91 = v37;
      _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, write response is nil: %@", buf, 0x2Au);
    }
    uint64_t v44 = *(void *)(a1 + 48);
    id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, id))(v44 + 16))(v44, v12);
    id v6 = v37;
    id v9 = v36;
    id v5 = 0;
  }
  else
  {
    uint64_t v30 = (void *)MEMORY[0x230FBD990]();
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = HMFGetLogIdentifier();
      id v33 = [*(id *)(a1 + 32) UUID];
      uint64_t v34 = [v9 shortDescription];
      *(_DWORD *)buf = 138543874;
      long long v85 = v32;
      __int16 v86 = 2112;
      id v87 = v33;
      __int16 v88 = 2112;
      id v89 = v34;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, object got invalidated", buf, 0x20u);
    }
    uint64_t v35 = *(void *)(a1 + 48);
    id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, id))(v35 + 16))(v35, v12);
  }
LABEL_33:
}

- (void)fetchIsAccessoryConfiguredWithReaderKey:(id)a3 accessory:(id)a4 flow:(id)a5 completion:(id)a6
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v77 = (__CFString *)a3;
  id v10 = a4;
  id v78 = a5;
  id v11 = a6;
  id v12 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(HMDHomeWalletKeyAccessoryManager *)self home];
  int v14 = v13;
  if (v13)
  {
    int v15 = [(__CFString *)v13 currentUser];
    [v15 isOwner];

    id v16 = (void *)MEMORY[0x230FBD990]();
    __int16 v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = HMFGetLogIdentifier();
      id v20 = [v78 UUID];
      uint64_t v21 = [v10 shortDescription];
      *(_DWORD *)buf = 138544130;
      __int16 v90 = v19;
      __int16 v91 = 2112;
      __int16 v92 = v20;
      __int16 v93 = 2112;
      uint64_t v94 = v21;
      __int16 v95 = 2112;
      __int16 v96 = v77;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching accessory is configured with nfc reader key %@:%@", buf, 0x2Au);
    }
    int v22 = [v10 home];
    id v23 = [v22 uuid];
    uint64_t v24 = [(__CFString *)v14 uuid];
    char v25 = [v23 isEqual:v24];

    if (v25)
    {
      int v26 = [v10 findServiceWithServiceType:@"00000266-0000-1000-8000-0026BB765291"];
      id v27 = v26;
      if (v26)
      {
        context = [(__CFString *)v26 findCharacteristicWithType:@"00000264-0000-1000-8000-0026BB765291"];
        if (context)
        {
          id v71 = objc_alloc_init(MEMORY[0x263F35A40]);
          id v70 = (void *)[objc_alloc(MEMORY[0x263F35A38]) initWithValue:1];
          id v69 = (void *)[objc_alloc(MEMORY[0x263F35A18]) initWithOperationType:v70 issuerKeyRequest:0 issuerKeyResponse:0 deviceCredentialKeyRequest:0 deviceCredentialKeyResponse:0 readerKeyRequest:v71 readerKeyResponse:0];
          id v87 = 0;
          __int16 v68 = [v69 serializeWithError:&v87];
          uint64_t v66 = (__CFString *)v87;
          if (v68)
          {
            id v67 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:context value:v68 authorizationData:0 identifier:0 type:0 includeResponseValue:1];
            __int16 v88 = v67;
            uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v88 count:1];
            id v29 = [(HMDHomeWalletKeyAccessoryManager *)v17 dataSource];
            uint64_t v30 = [v29 accessoryWriteMaxRetryCount];
            id v31 = [(HMDHomeWalletKeyAccessoryManager *)v17 dataSource];
            [v31 accessoryWriteRetryInterval];
            uint64_t v65 = -[__CFString performWriteRequests:withRetries:timeInterval:loggingObject:](v14, "performWriteRequests:withRetries:timeInterval:loggingObject:", v28, v30, v17);

            objc_initWeak((id *)buf, v17);
            objc_initWeak(&location, v10);
            __int16 v32 = (void *)MEMORY[0x263F581B8];
            id v33 = [(HMDHomeWalletKeyAccessoryManager *)v17 workQueue];
            uint64_t v34 = [v32 schedulerWithDispatchQueue:v33];
            uint64_t v35 = [v65 reschedule:v34];
            v79[0] = MEMORY[0x263EF8330];
            v79[1] = 3221225472;
            v79[2] = __102__HMDHomeWalletKeyAccessoryManager_fetchIsAccessoryConfiguredWithReaderKey_accessory_flow_completion___block_invoke;
            v79[3] = &unk_264A28DE8;
            objc_copyWeak(&v84, (id *)buf);
            objc_copyWeak(&v85, &location);
            id v80 = v78;
            id v83 = v11;
            id v81 = context;
            id v82 = v77;
            id v36 = (id)[v35 addCompletionBlock:v79];

            objc_destroyWeak(&v85);
            objc_destroyWeak(&v84);
            objc_destroyWeak(&location);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            __int16 v59 = (void *)MEMORY[0x230FBD990]();
            uint64_t v60 = v17;
            __int16 v61 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              uint64_t v62 = HMFGetLogIdentifier();
              __int16 v63 = [v78 UUID];
              __int16 v64 = [v10 shortDescription];
              *(_DWORD *)buf = 138544386;
              __int16 v90 = v62;
              __int16 v91 = 2112;
              __int16 v92 = v63;
              __int16 v93 = 2112;
              uint64_t v94 = v64;
              __int16 v95 = 2112;
              __int16 v96 = 0;
              __int16 v97 = 2112;
              uint64_t v98 = v66;
              _os_log_impl(&dword_22F52A000, v61, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, unable to encode nfc access control %@:%@", buf, 0x34u);
            }
            id v67 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
            (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v67);
          }
        }
        else
        {
          id v72 = (void *)MEMORY[0x230FBD990]();
          uint64_t v54 = v17;
          id v55 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            id v56 = HMFGetLogIdentifier();
            id v57 = [v78 UUID];
            id v58 = [v10 shortDescription];
            *(_DWORD *)buf = 138544386;
            __int16 v90 = v56;
            __int16 v91 = 2112;
            __int16 v92 = v57;
            __int16 v93 = 2112;
            uint64_t v94 = v58;
            __int16 v95 = 2112;
            __int16 v96 = v27;
            __int16 v97 = 2112;
            uint64_t v98 = @"00000264-0000-1000-8000-0026BB765291";
            _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, NFC access service: %@ doesn't support control point characteristic: %@", buf, 0x34u);
          }
          id v73 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
          (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v73);
        }
      }
      else
      {
        contexta = (void *)MEMORY[0x230FBD990]();
        __int16 v49 = v17;
        id v50 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          __int16 v51 = HMFGetLogIdentifier();
          id v52 = [v78 UUID];
          __int16 v53 = [v10 shortDescription];
          *(_DWORD *)buf = 138544130;
          __int16 v90 = v51;
          __int16 v91 = 2112;
          __int16 v92 = v52;
          __int16 v93 = 2112;
          uint64_t v94 = v53;
          __int16 v95 = 2112;
          __int16 v96 = @"00000266-0000-1000-8000-0026BB765291";
          _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, it doesn't support nfc access service %@", buf, 0x2Au);
        }
        contextb = [MEMORY[0x263F087E8] hmErrorWithCode:48];
        (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, contextb);
      }
    }
    else
    {
      id v42 = (void *)MEMORY[0x230FBD990]();
      id v43 = v17;
      uint64_t v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        id v45 = HMFGetLogIdentifier();
        id v46 = [v78 UUID];
        __int16 v47 = [v10 shortDescription];
        id v48 = [v10 home];
        *(_DWORD *)buf = 138544386;
        __int16 v90 = v45;
        __int16 v91 = 2112;
        __int16 v92 = v46;
        __int16 v93 = 2112;
        uint64_t v94 = v47;
        __int16 v95 = 2112;
        __int16 v96 = v48;
        __int16 v97 = 2112;
        uint64_t v98 = v14;
        _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, its home: %@ doesn't match current home: %@", buf, 0x34u);
      }
      id v27 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      (*((void (**)(id, void, void, __CFString *))v11 + 2))(v11, 0, 0, v27);
    }
  }
  else
  {
    id v37 = (void *)MEMORY[0x230FBD990]();
    __int16 v38 = self;
    id v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      id v40 = HMFGetLogIdentifier();
      id v41 = [v78 UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v90 = v40;
      __int16 v91 = 2112;
      __int16 v92 = v41;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch accessory is configured for wallet key, home is nil", buf, 0x16u);
    }
    id v27 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*((void (**)(id, void, void, __CFString *))v11 + 2))(v11, 0, 0, v27);
  }
}

void __102__HMDHomeWalletKeyAccessoryManager_fetchIsAccessoryConfiguredWithReaderKey_accessory_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = objc_loadWeakRetained((id *)(a1 + 72));
  id v9 = v8;
  if (WeakRetained)
  {
    if (v5)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      id v69 = 0;
      id v11 = objc_msgSend(v5, "hmd_valueOfCharacteristic:error:", v10, &v69);
      id v12 = v69;
      if (v11)
      {
        id v65 = v6;
        id v13 = v11;
        objc_opt_class();
        int v14 = objc_opt_isKindOfClass() & 1;
        if (v14) {
          int v15 = v13;
        }
        else {
          int v15 = 0;
        }
        id v67 = v15;

        if (v14)
        {
          id v68 = 0;
          id v16 = [MEMORY[0x263F35A18] parsedFromData:v13 error:&v68];
          id v17 = v68;
          if (v16)
          {
            __int16 v61 = v11;
            id v18 = [v16 readerKeyResponse];
            __int16 v19 = [v18 identifier];

            id v20 = [*(id *)(a1 + 48) identifier];
            int v21 = [v19 isEqualToData:v20];

            if (v21)
            {
              (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
              id v6 = v65;
            }
            else
            {
              id v6 = v65;
              (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
            }
            id v11 = v61;
          }
          else
          {
            __int16 v51 = (void *)MEMORY[0x230FBD990]();
            id v60 = WeakRetained;
            id v58 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              id v56 = HMFGetLogIdentifier();
              [*(id *)(a1 + 32) UUID];
              id v52 = v64 = v11;
              [v9 shortDescription];
              __int16 v53 = v55 = v51;
              *(_DWORD *)buf = 138544386;
              id v71 = v56;
              __int16 v72 = 2112;
              id v73 = v52;
              __int16 v74 = 2112;
              id v75 = v53;
              __int16 v76 = 2112;
              id v77 = v13;
              __int16 v78 = 2112;
              id v79 = v17;
              _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, failed to parse response value %@:%@", buf, 0x34u);

              __int16 v51 = v55;
              id v11 = v64;
            }
            uint64_t v54 = *(void *)(a1 + 56);
            __int16 v19 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
            (*(void (**)(uint64_t, void, void, void *))(v54 + 16))(v54, 0, 0, v19);
            id v6 = v65;
          }
        }
        else
        {
          uint64_t v44 = (void *)MEMORY[0x230FBD990]();
          id v45 = WeakRetained;
          id v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            __int16 v47 = v57 = v45;
            [*(id *)(a1 + 32) UUID];
            id v48 = v63 = v11;
            [v9 shortDescription];
            __int16 v49 = v59 = v44;
            *(_DWORD *)buf = 138544130;
            id v71 = v47;
            __int16 v72 = 2112;
            id v73 = v48;
            __int16 v74 = 2112;
            id v75 = v49;
            __int16 v76 = 2112;
            id v77 = v13;
            _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, response value: %@ is not of type NSData", buf, 0x2Au);

            uint64_t v44 = v59;
            id v11 = v63;

            id v45 = v57;
          }

          uint64_t v50 = *(void *)(a1 + 56);
          id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
          (*(void (**)(uint64_t, void, void, id))(v50 + 16))(v50, 0, 0, v17);
          id v6 = v65;
        }
      }
      else
      {
        id v37 = (void *)MEMORY[0x230FBD990]();
        id v38 = WeakRetained;
        id v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v40 = v66 = v6;
          [*(id *)(a1 + 32) UUID];
          id v41 = v62 = v37;
          id v42 = [v9 shortDescription];
          id v43 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138544386;
          id v71 = v40;
          __int16 v72 = 2112;
          id v73 = v41;
          __int16 v74 = 2112;
          id v75 = v42;
          __int16 v76 = 2112;
          id v77 = v5;
          __int16 v78 = 2112;
          id v79 = v43;
          _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, unable to parse write response dictionary: %@ with characteristic: %@", buf, 0x34u);

          id v11 = 0;
          id v37 = v62;

          id v6 = v66;
        }

        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
    else
    {
      uint64_t v28 = v8;
      id v29 = v6;
      uint64_t v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = WeakRetained;
      __int16 v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v33 = HMFGetLogIdentifier();
        uint64_t v34 = [*(id *)(a1 + 32) UUID];
        uint64_t v35 = [v28 shortDescription];
        *(_DWORD *)buf = 138544130;
        id v71 = v33;
        __int16 v72 = 2112;
        id v73 = v34;
        __int16 v74 = 2112;
        id v75 = v35;
        __int16 v76 = 2112;
        id v77 = v29;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key: %@, write response is nil: %@", buf, 0x2Au);
      }
      uint64_t v36 = *(void *)(a1 + 56);
      id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      (*(void (**)(uint64_t, void, void, id))(v36 + 16))(v36, 0, 0, v12);
      id v6 = v29;
      id v9 = v28;
      id v5 = 0;
    }
  }
  else
  {
    int v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      char v25 = [*(id *)(a1 + 32) UUID];
      int v26 = [v9 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v71 = v24;
      __int16 v72 = 2112;
      id v73 = v25;
      __int16 v74 = 2112;
      id v75 = v26;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, object got invalidated", buf, 0x20u);
    }
    uint64_t v27 = *(void *)(a1 + 56);
    id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, void, void, id))(v27 + 16))(v27, 0, 0, v12);
  }
}

- (id)configureNFCReaderKeyOnMatterAccessory:(id)a3 flow:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 supportsCHIP])
  {
    id v8 = objc_alloc_init(MEMORY[0x263F58190]);
    id v9 = [(HMDHomeWalletKeyAccessoryManager *)self home];
    uint64_t v10 = [v9 nfcReaderKeyManager];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __80__HMDHomeWalletKeyAccessoryManager_configureNFCReaderKeyOnMatterAccessory_flow___block_invoke;
    v22[3] = &unk_264A28DC0;
    v22[4] = self;
    id v23 = v7;
    id v11 = v8;
    id v24 = v11;
    id v25 = v6;
    [v10 fetchOrCreateReaderKeyWithRequiresPrivateKey:1 flow:v23 completion:v22];

    id v12 = v25;
    id v13 = v11;

    int v14 = v13;
  }
  else
  {
    int v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      __int16 v19 = [v7 UUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      id v29 = v19;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not configuring NFC Reader key on non-matter accessory: %@", buf, 0x20u);
    }
    id v20 = (void *)MEMORY[0x263F58190];
    id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:93];
    int v14 = [v20 futureWithError:v13];
  }

  return v14;
}

void __80__HMDHomeWalletKeyAccessoryManager_configureNFCReaderKeyOnMatterAccessory_flow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 56);
    id v11 = [*(id *)(a1 + 48) errorOnlyCompletionHandlerAdapter];
    [v8 configureAccessoryWithNfcReaderKey:v5 accessory:v10 flow:v9 completion:v11];
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 32);
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      id v16 = [*(id *)(a1 + 40) UUID];
      int v17 = 138543874;
      id v18 = v15;
      __int16 v19 = 2112;
      id v20 = v16;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch or nfc reader key for matter accessory: %@", (uint8_t *)&v17, 0x20u);
    }
    [*(id *)(a1 + 48) finishWithError:v6];
  }
}

- (void)fetchOrConfigureNFCReaderKeyForAccessory:(id)a3 flow:(id)a4 completion:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = self;
  int v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = HMFGetLogIdentifier();
    id v16 = [v9 UUID];
    *(_DWORD *)buf = 138543874;
    id v45 = v15;
    __int16 v46 = 2112;
    __int16 v47 = v16;
    __int16 v48 = 2112;
    id v49 = v8;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] fetchOrConfigureNFCReaderKeyForAccessory: %@", buf, 0x20u);
  }
  int v17 = [(HMDHomeWalletKeyAccessoryManager *)v13 home];
  id v18 = [v17 currentUser];
  [v18 isOwner];

  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterTTU", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& [v8 supportsCHIP]&& !-[HMDHomeWalletKeyAccessoryManager isPrimaryResidentOrSoleOwnerController](v13, "isPrimaryResidentOrSoleOwnerController"))
  {
    id v37 = v10;
    id v20 = (void *)MEMORY[0x230FBD990]();
    __int16 v21 = v13;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      id v24 = [v9 UUID];
      id v25 = [v8 uuid];
      *(_DWORD *)buf = 138543874;
      id v45 = v23;
      __int16 v46 = 2112;
      __int16 v47 = v24;
      __int16 v48 = 2112;
      id v49 = v25;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Messaging resident to configure NFC reader key for matter accessory: %@", buf, 0x20u);
    }
    id v26 = objc_alloc(MEMORY[0x263F42570]);
    uint64_t v27 = [(HMDHomeWalletKeyAccessoryManager *)v21 messageTargetUUID];
    __int16 v28 = (void *)[v26 initWithTarget:v27];

    id v29 = objc_alloc(MEMORY[0x263F42568]);
    v42[0] = @"HMDHomeConfigureMatterAccessoryWithReaderKeyMessageKeyAccessoryUUID";
    __int16 v30 = [v8 uuid];
    id v31 = encodeRootObjectForIncomingXPCMessage(v30, 0);
    v43[0] = v31;
    v42[1] = *MEMORY[0x263F42000];
    uint64_t v32 = HMFEncodedRootObject();
    v43[1] = v32;
    id v33 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    uint64_t v34 = (void *)[v29 initWithName:@"HMDHomeConfigureMatterAccessoryWithReaderKeyMessage" destination:v28 payload:v33];

    uint64_t v35 = [(HMDHomeWalletKeyAccessoryManager *)v21 messageTargetUUID];
    uint64_t v36 = [(HMDHomeWalletKeyAccessoryManager *)v21 workQueue];
    [v17 redispatchToResidentMessage:v34 target:v35 responseQueue:v36];

    id v10 = v37;
  }
  else
  {
    __int16 v19 = [v17 nfcReaderKeyManager];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __93__HMDHomeWalletKeyAccessoryManager_fetchOrConfigureNFCReaderKeyForAccessory_flow_completion___block_invoke;
    v38[3] = &unk_264A28D98;
    void v38[4] = v13;
    id v39 = v9;
    id v41 = v10;
    id v40 = v8;
    [v19 fetchOrCreateReaderKeyWithRequiresPrivateKey:1 flow:v39 completion:v38];
  }
}

void __93__HMDHomeWalletKeyAccessoryManager_fetchOrConfigureNFCReaderKeyForAccessory_flow_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] workQueue];
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    objc_initWeak((id *)location, a1[6]);
    int v8 = [a1[6] supportsCHIP];
    id v10 = a1[5];
    id v9 = a1[6];
    id v11 = a1[4];
    if (v8)
    {
      [a1[4] configureAccessoryWithNfcReaderKey:v5 accessory:a1[6] flow:a1[5] completion:a1[7]];
    }
    else
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __93__HMDHomeWalletKeyAccessoryManager_fetchOrConfigureNFCReaderKeyForAccessory_flow_completion___block_invoke_308;
      v17[3] = &unk_264A28D70;
      v17[4] = v11;
      objc_copyWeak(&v21, (id *)location);
      id v18 = a1[5];
      id v20 = a1[7];
      id v19 = v5;
      [v11 fetchIsAccessoryConfiguredWithReaderKey:v19 accessory:v9 flow:v10 completion:v17];

      objc_destroyWeak(&v21);
    }
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = a1[4];
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      id v16 = [a1[5] UUID];
      *(_DWORD *)id location = 138543874;
      *(void *)&location[4] = v15;
      __int16 v23 = 2112;
      id v24 = v16;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch or nfc reader key: %@", location, 0x20u);
    }
    (*((void (**)(void))a1[7] + 2))();
  }
}

void __93__HMDHomeWalletKeyAccessoryManager_fetchOrConfigureNFCReaderKeyForAccessory_flow_completion___block_invoke_308(id *a1, int a2, void *a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [a1[4] workQueue];
  dispatch_assert_queue_V2(v9);

  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    if (a2)
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = a1[4];
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = id v30 = v7;
        int v15 = [a1[5] UUID];
        id v16 = v8;
        int v17 = v11;
        id v18 = a1[6];
        id v19 = [WeakRetained shortDescription];
        *(_DWORD *)buf = 138544130;
        id v37 = v14;
        __int16 v38 = 2112;
        id v39 = v15;
        __int16 v40 = 2112;
        id v41 = v18;
        id v11 = v17;
        id v8 = v16;
        __int16 v42 = 2112;
        id v43 = v19;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory is already configured with nfc reader key %@:%@", buf, 0x2Au);

        id v7 = v30;
      }

      id v20 = (void (*)(void))*((void *)a1[7] + 2);
    }
    else
    {
      if (v7)
      {
        id v28 = a1[4];
        id v29 = a1[5];
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __93__HMDHomeWalletKeyAccessoryManager_fetchOrConfigureNFCReaderKeyForAccessory_flow_completion___block_invoke_309;
        v31[3] = &unk_264A2B938;
        v31[4] = v28;
        id v35 = a1[7];
        id v32 = a1[6];
        id v33 = WeakRetained;
        id v34 = a1[5];
        [v28 removeNfcReaderKeyWithIdentifier:v7 accessory:v33 flow:v29 completion:v31];

        goto LABEL_12;
      }
      if (!v8)
      {
        [a1[4] configureAccessoryWithNfcReaderKey:a1[6] accessory:WeakRetained flow:a1[5] completion:a1[7]];
        goto LABEL_12;
      }
      id v20 = (void (*)(void))*((void *)a1[7] + 2);
    }
    v20();
  }
  else
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = a1[4];
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      __int16 v25 = [a1[5] UUID];
      *(_DWORD *)buf = 138543618;
      id v37 = v24;
      __int16 v38 = 2112;
      id v39 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure accessory with reader key, accessory object became nil", buf, 0x16u);
    }
    id v26 = (void (**)(id, void *))a1[7];
    uint64_t v27 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    v26[2](v26, v27);
  }
LABEL_12:
}

void __93__HMDHomeWalletKeyAccessoryManager_fetchOrConfigureNFCReaderKeyForAccessory_flow_completion___block_invoke_309(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v3);

  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else {
    [*(id *)(a1 + 32) configureAccessoryWithNfcReaderKey:*(void *)(a1 + 40) accessory:*(void *)(a1 + 48) flow:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
}

- (void)configureNFCReaderKeyForAccessory:(id)a3 flow:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    id v13 = [v7 UUID];
    int v14 = [v6 uuid];
    *(_DWORD *)buf = 138543874;
    __int16 v48 = v12;
    __int16 v49 = 2112;
    uint64_t v50 = v13;
    __int16 v51 = 2112;
    id v52 = v14;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Configuring NFC reader key for accessory: %@", buf, 0x20u);
  }
  if ([v6 supportsWalletKey])
  {
    int v15 = [(HMDHomeWalletKeyAccessoryManager *)v10 dataSource];
    char v16 = [v15 isWatch];

    if ((v16 & 1) == 0)
    {
      int v17 = [(HMDHomeWalletKeyAccessoryManager *)v10 home];
      id v18 = v17;
      if (v17)
      {
        id v19 = [v17 currentUser];
        int v20 = [v19 isOwner];

        if (v20)
        {
          id v21 = [(HMDHomeWalletKeyAccessoryManager *)v10 nfcReaderKeyConfigureStateByAccessoryUUID];
          id v22 = [v6 uuid];
          __int16 v23 = [v21 objectForKeyedSubscript:v22];

          if (!v23)
          {
            __int16 v23 = objc_alloc_init(HMDHomeWalletKeyAccessoryConfigureState);
            id v24 = [(HMDHomeWalletKeyAccessoryManager *)v10 nfcReaderKeyConfigureStateByAccessoryUUID];
            __int16 v25 = [v6 uuid];
            [v24 setObject:v23 forKeyedSubscript:v25];
          }
          if ([(HMDHomeWalletKeyAccessoryConfigureState *)v23 readerKeyConfigured])
          {
            id v26 = (void *)MEMORY[0x230FBD990]();
            uint64_t v27 = v10;
            id v28 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              id v29 = HMFGetLogIdentifier();
              id v30 = [v7 UUID];
              id v31 = [v6 shortDescription];
              *(_DWORD *)buf = 138543874;
              __int16 v48 = v29;
              __int16 v49 = 2112;
              uint64_t v50 = v30;
              __int16 v51 = 2112;
              id v52 = v31;
              _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory is already configured with reader key: %@", buf, 0x20u);
            }
          }
          else if ([(HMDHomeWalletKeyAccessoryConfigureState *)v23 readerKeyConfigureInProgress])
          {
            id v37 = (void *)MEMORY[0x230FBD990]();
            __int16 v38 = v10;
            id v39 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              __int16 v40 = HMFGetLogIdentifier();
              id v41 = [v7 UUID];
              __int16 v42 = [v6 shortDescription];
              *(_DWORD *)buf = 138543874;
              __int16 v48 = v40;
              __int16 v49 = 2112;
              uint64_t v50 = v41;
              __int16 v51 = 2112;
              id v52 = v42;
              _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Setting should retry on nfc reader key configure failure for accessory: %@", buf, 0x20u);
            }
            [(HMDHomeWalletKeyAccessoryConfigureState *)v23 setShouldRetryReaderKeyConfigureOnFailure:1];
          }
          else
          {
            [(HMDHomeWalletKeyAccessoryConfigureState *)v23 setReaderKeyConfigureInProgress:1];
            v43[0] = MEMORY[0x263EF8330];
            v43[1] = 3221225472;
            void v43[2] = __75__HMDHomeWalletKeyAccessoryManager_configureNFCReaderKeyForAccessory_flow___block_invoke;
            v43[3] = &unk_264A28C88;
            v43[4] = v10;
            uint64_t v44 = v23;
            id v45 = v7;
            id v46 = v6;
            [(HMDHomeWalletKeyAccessoryManager *)v10 fetchOrConfigureNFCReaderKeyForAccessory:v46 flow:v45 completion:v43];
          }
        }
      }
      else
      {
        id v32 = (void *)MEMORY[0x230FBD990]();
        id v33 = v10;
        id v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id v35 = HMFGetLogIdentifier();
          uint64_t v36 = [v7 UUID];
          *(_DWORD *)buf = 138543874;
          __int16 v48 = v35;
          __int16 v49 = 2112;
          uint64_t v50 = v36;
          __int16 v51 = 2112;
          id v52 = v6;
          _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Home does not exist when configuring reader key for accessory: %@", buf, 0x20u);
        }
      }
    }
  }
}

void __75__HMDHomeWalletKeyAccessoryManager_configureNFCReaderKeyForAccessory_flow___block_invoke(id *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1[4] workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)MEMORY[0x230FBD990]([a1[5] setReaderKeyConfigureInProgress:0]);
  id v6 = a1[4];
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [a1[6] UUID];
      id v11 = [a1[7] shortDescription];
      int v21 = 138544130;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v11;
      __int16 v27 = 2112;
      id v28 = v3;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure accessory with nfc reader key %@:%@", (uint8_t *)&v21, 0x2Au);
    }
    if ([a1[5] shouldRetryReaderKeyConfigureOnFailure])
    {
      id v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = a1[4];
      int v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = HMFGetLogIdentifier();
        char v16 = [a1[6] UUID];
        int v17 = [a1[7] shortDescription];
        int v21 = 138543874;
        id v22 = v15;
        __int16 v23 = 2112;
        id v24 = v16;
        __int16 v25 = 2112;
        id v26 = v17;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Retrying configuring accessory with nfc reader key: %@", (uint8_t *)&v21, 0x20u);
      }
      [a1[5] setShouldRetryReaderKeyConfigureOnFailure:0];
      [a1[4] configureNFCReaderKeyForAccessory:a1[7] flow:a1[6]];
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      id v19 = [a1[6] UUID];
      int v20 = [a1[7] shortDescription];
      int v21 = 138543874;
      id v22 = v18;
      __int16 v23 = 2112;
      id v24 = v19;
      __int16 v25 = 2112;
      id v26 = v20;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully configured accessory with nfc reader key: %@", (uint8_t *)&v21, 0x20u);
    }
    [a1[5] setReaderKeyConfigured:1];
  }
}

- (void)configureNFCReaderKeyForAllAccessoriesWithReason:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    id v24 = v10;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Configuring NFC reader key for all accessories with reason: %@", buf, 0x20u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = [(HMDHomeWalletKeyAccessoryManager *)v8 home];
  id v13 = [v12 accessoriesWithWalletKeySupport];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [(HMDHomeWalletKeyAccessoryManager *)v8 configureNFCReaderKeyForAccessory:*(void *)(*((void *)&v18 + 1) + 8 * v17++) flow:v6];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void)requestPrimaryResident:(id)a3 toConfigureAccessories:(id)a4 withDeviceCredentialKey:(id)a5 ofType:(int64_t)a6 flow:(id)a7 completion:(id)a8
{
  v56[4] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v44 = a5;
  id v16 = a7;
  uint64_t v17 = (void (**)(id, void *))a8;
  long long v18 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v18);

  long long v19 = objc_msgSend(v15, "na_map:", &__block_literal_global_303_224396);
  if (objc_msgSend(v19, "hmf_isEmpty"))
  {
    long long v20 = (void *)MEMORY[0x230FBD990]();
    long long v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      id v24 = [v16 UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v48 = v23;
      __int16 v49 = 2112;
      uint64_t v50 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Did not send message to configure all accessories with device credential key, accessory uuids is empty", buf, 0x16u);
    }
    __int16 v25 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    v17[2](v17, v25);
  }
  else
  {
    id v26 = [HMDRemoteDeviceMessageDestination alloc];
    __int16 v27 = [(HMDHomeWalletKeyAccessoryManager *)self messageTargetUUID];
    id v43 = v14;
    __int16 v25 = [(HMDRemoteDeviceMessageDestination *)v26 initWithTarget:v27 device:v14];

    v56[0] = v44;
    v55[0] = @"HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyCredentialKey";
    v55[1] = @"HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyTapToUnlockType";
    id v28 = [NSNumber numberWithInteger:a6];
    v56[1] = v28;
    v56[2] = v19;
    uint64_t v29 = *MEMORY[0x263F42000];
    v55[2] = @"HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyAccessoryUUIDs";
    v55[3] = v29;
    id v30 = HMFEncodedRootObject();
    v56[3] = v30;
    id v31 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:4];

    id v32 = [[HMDRemoteMessage alloc] initWithName:@"HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessage" destination:v25 payload:v31 type:0 timeout:1 secure:0.0];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __129__HMDHomeWalletKeyAccessoryManager_requestPrimaryResident_toConfigureAccessories_withDeviceCredentialKey_ofType_flow_completion___block_invoke_306;
    v45[3] = &unk_264A2B228;
    v45[4] = self;
    id v46 = v17;
    id v33 = (void *)MEMORY[0x230FBD990]([(HMDRemoteMessage *)v32 setResponseHandler:v45]);
    id v34 = self;
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      uint64_t v36 = v42 = v15;
      [v16 UUID];
      id v41 = v17;
      id v37 = v31;
      v39 = id v38 = v16;
      *(_DWORD *)buf = 138544130;
      __int16 v48 = v36;
      __int16 v49 = 2112;
      uint64_t v50 = v39;
      __int16 v51 = 2112;
      id v52 = v32;
      __int16 v53 = 2112;
      id v54 = v43;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Sending message to configure device credential key: %@ to primary resident: %@", buf, 0x2Au);

      id v16 = v38;
      id v31 = v37;
      uint64_t v17 = v41;

      id v15 = v42;
    }

    __int16 v40 = [(HMDHomeWalletKeyAccessoryManager *)v34 messageDispatcher];
    [v40 sendMessage:v32];

    id v14 = v43;
  }
}

void __129__HMDHomeWalletKeyAccessoryManager_requestPrimaryResident_toConfigureAccessories_withDeviceCredentialKey_ofType_flow_completion___block_invoke_306(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __129__HMDHomeWalletKeyAccessoryManager_requestPrimaryResident_toConfigureAccessories_withDeviceCredentialKey_ofType_flow_completion___block_invoke_2;
  block[3] = &unk_264A2EE80;
  id v11 = v6;
  id v12 = v5;
  id v13 = *(id *)(a1 + 40);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __129__HMDHomeWalletKeyAccessoryManager_requestPrimaryResident_toConfigureAccessories_withDeviceCredentialKey_ofType_flow_completion___block_invoke_2(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "hmf_BOOLForKey:", @"HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyDidSucceed"))
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    [v5 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x263F08608]];
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:52 userInfo:v5];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

id __129__HMDHomeWalletKeyAccessoryManager_requestPrimaryResident_toConfigureAccessories_withDeviceCredentialKey_ofType_flow_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 uuid];
  uint64_t v3 = [v2 UUIDString];

  return v3;
}

- (void)configureAccessories:(id)a3 withDeviceCredentialKey:(id)a4 ofType:(int64_t)a5 flow:(id)a6 completion:(id)a7
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(id, void *))a7;
  id v16 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v16);

  if (a5 == 1)
  {
    if ([v13 length] != 65)
    {
      uint64_t v17 = (void *)MEMORY[0x230FBD990]();
      long long v18 = self;
      long long v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        long long v20 = HMFGetLogIdentifier();
        long long v21 = [v14 UUID];
        *(_DWORD *)buf = 138544130;
        id v46 = v20;
        __int16 v47 = 2112;
        __int16 v48 = v21;
        __int16 v49 = 2112;
        id v50 = v13;
        __int16 v51 = 2048;
        uint64_t v52 = 65;
        id v22 = "%{public}@[Flow: %@] Failed to configure all accessories with device credential key, key: %@ must be of le"
              "ngth %lu bytes for HMMTRTapToUnlockType1";
        goto LABEL_17;
      }
LABEL_18:

      id v24 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      v15[2](v15, v24);
      goto LABEL_28;
    }
  }
  else if (!a5 && [v13 length] != 64)
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    long long v18 = self;
    long long v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = HMFGetLogIdentifier();
      long long v21 = [v14 UUID];
      *(_DWORD *)buf = 138544130;
      id v46 = v20;
      __int16 v47 = 2112;
      __int16 v48 = v21;
      __int16 v49 = 2112;
      id v50 = v13;
      __int16 v51 = 2048;
      uint64_t v52 = 64;
      id v22 = "%{public}@[Flow: %@] Failed to configure all accessories with device credential key, key: %@ must be of leng"
            "th %lu bytes for Unified Access";
LABEL_17:
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, v22, buf, 0x2Au);

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  __int16 v23 = [(HMDHomeWalletKeyAccessoryManager *)self home];
  id v24 = [v23 currentUser];

  if (v24)
  {
    char v25 = [v24 isOwner];
    uint64_t v26 = [(HMDHomeWalletKeyAccessoryManager *)self primaryResidentDevice];
    __int16 v27 = (void *)v26;
    if (v26 || (v25 & 1) != 0)
    {
      if (v26)
      {
        [(HMDHomeWalletKeyAccessoryManager *)self requestPrimaryResident:v26 toConfigureAccessories:v12 withDeviceCredentialKey:v13 ofType:a5 flow:v14 completion:v15];
      }
      else
      {
        id v34 = [v24 account];
        id v35 = [v34 currentDevice];

        if (v35)
        {
          uint64_t v36 = [v35 identifier];
          [(HMDHomeWalletKeyAccessoryManager *)self configureAccessories:v12 withDeviceCredentialKey:v13 ofType:a5 forDeviceWithUUID:v36 user:v24 flow:v14 completion:v15];
        }
        else
        {
          id v37 = (void *)MEMORY[0x230FBD990]();
          id v38 = self;
          id v39 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            __int16 v40 = v43 = v38;
            [v14 UUID];
            id v41 = v44 = v37;
            *(_DWORD *)buf = 138543618;
            id v46 = v40;
            __int16 v47 = 2112;
            __int16 v48 = v41;
            _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure all accessories with device credential key, current device is nil", buf, 0x16u);

            id v37 = v44;
            id v38 = v43;
          }

          id v42 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
          v15[2](v15, v42);
        }
      }
    }
    else
    {
      id v28 = [[HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation alloc] initWithDeviceCredentialKey:v13 accessories:v12 user:v24];
      uint64_t v29 = [(HMDHomeWalletKeyAccessoryManager *)self pendingPrimaryResidentDeviceCredentialKeyOperation];

      if (v29)
      {
        id v30 = [(HMDHomeWalletKeyAccessoryManager *)self pendingPrimaryResidentDeviceCredentialKeyOperation];
        id v31 = [v30 operationByMergingWithOperation:v28];
        [(HMDHomeWalletKeyAccessoryManager *)self setPendingPrimaryResidentDeviceCredentialKeyOperation:v31];
      }
      else
      {
        [(HMDHomeWalletKeyAccessoryManager *)self setPendingPrimaryResidentDeviceCredentialKeyOperation:v28];
      }
      id v33 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
      v15[2](v15, v33);
    }
  }
  else
  {
    id v32 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    v15[2](v15, v32);

    id v24 = 0;
  }
LABEL_28:
}

- (HMDDevice)primaryResidentDevice
{
  id v2 = [(HMDHomeWalletKeyAccessoryManager *)self home];
  uint64_t v3 = [v2 residentDeviceManager];
  id v4 = [v3 primaryResidentDevice];

  id v5 = [v4 device];
  if (v5)
  {
    id v6 = [v4 capabilities];
    if ([v6 supportsWalletKey])
    {
      int v7 = [v4 isReachable];

      if (v7)
      {
        id v8 = v5;
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v8 = 0;
LABEL_7:

  return (HMDDevice *)v8;
}

- (NSString)walletKeyColorPreferenceKey
{
  id v2 = (void *)MEMORY[0x263F08C38];
  uint64_t v3 = [(HMDHomeWalletKeyAccessoryManager *)self home];
  id v4 = [v3 uuid];
  id v5 = [@"6D369245-5382-4703-8011-3DFE12E5147C" dataUsingEncoding:4];
  id v6 = objc_msgSend(v2, "hmf_UUIDWithNamespace:data:", v4, v5);
  int v7 = [v6 UUIDString];

  return (NSString *)v7;
}

- (NSArray)matterAccessoriesSupportingWalletKey
{
  id v2 = [(HMDHomeWalletKeyAccessoryManager *)self home];
  uint64_t v3 = [v2 matterAccessories];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_297);

  return (NSArray *)v4;
}

id __72__HMDHomeWalletKeyAccessoryManager_matterAccessoriesSupportingWalletKey__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 supportsWalletKey])
  {
    id v3 = v2;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isPrimaryResidentOrSoleOwnerController
{
  id v2 = [(HMDHomeWalletKeyAccessoryManager *)self home];
  if ([v2 isCurrentDeviceConfirmedPrimaryResident])
  {
    BOOL v3 = 1;
  }
  else if ([v2 hasAnyResident])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [v2 currentUser];
    if ([v4 isOwner]) {
      BOOL v3 = isiPhoneDevice() || isiPadDevice();
    }
    else {
      BOOL v3 = 0;
    }
  }
  return v3;
}

- (void)handleHomeUserAddedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__HMDHomeWalletKeyAccessoryManager_handleHomeUserAddedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__HMDHomeWalletKeyAccessoryManager_handleHomeUserAddedNotification___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isPrimaryResidentOrSoleOwnerController])
  {
    id v2 = [*(id *)(a1 + 40) userInfo];
    BOOL v3 = [v2 objectForKey:@"HMDUserNotificationKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;

    int v6 = [v5 isRestrictedGuest];
    int v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v10)
      {
        id v11 = HMFGetLogIdentifier();
        id v12 = [v5 uuid];
        int v21 = 138543618;
        id v22 = v11;
        __int16 v23 = 2112;
        id v24 = v12;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Received notification of restricted guest %@ being added to home but we already scheduled work to configure issuerKeys in invite acceptance, so nothing to be done here", (uint8_t *)&v21, 0x16u);
      }
    }
    else
    {
      if (v10)
      {
        id v13 = HMFGetLogIdentifier();
        int v21 = 138543618;
        id v22 = v13;
        __int16 v23 = 2112;
        id v24 = v5;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling added user: %@", (uint8_t *)&v21, 0x16u);
      }
      if ((_os_feature_enabled_impl() & 1) != 0
        || CFPreferencesGetAppBooleanValue(@"MatterTTU", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
      {
        id v14 = [MEMORY[0x263F42530] internalOnlyInitializer];
        id v15 = (void *)MEMORY[0x230FBD990]();
        id v16 = *(id *)(a1 + 32);
        uint64_t v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          long long v18 = HMFGetLogIdentifier();
          long long v19 = [v14 UUID];
          int v21 = 138543874;
          id v22 = v18;
          __int16 v23 = 2112;
          id v24 = v19;
          __int16 v25 = 2112;
          id v26 = v5;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Adding Issuer Key to accessories for newly added user: %@", (uint8_t *)&v21, 0x20u);
        }
        id v20 = (id)[*(id *)(a1 + 32) addIssuerKeysToMatterTTUAccessoriesForUser:v5 flow:v14];
      }
    }
  }
}

- (void)handleWalletKeySupportDidChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 home];
  id v9 = [(HMDHomeWalletKeyAccessoryManager *)self home];
  if (v8 == v9)
  {
    id v15 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __68__HMDHomeWalletKeyAccessoryManager_handleWalletKeySupportDidChange___block_invoke;
    v16[3] = &unk_264A2F820;
    v16[4] = self;
    id v17 = v7;
    dispatch_async(v15, v16);
  }
  else
  {
    BOOL v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [v8 uuid];
      *(_DWORD *)buf = 138543618;
      long long v19 = v13;
      __int16 v20 = 2112;
      int v21 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Not handling wallet key support change for accessory in other home: %@", buf, 0x16u);
    }
  }
}

void __68__HMDHomeWalletKeyAccessoryManager_handleWalletKeySupportDidChange___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F42530] internalOnlyInitializer];
  BOOL v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    id v8 = [*(id *)(a1 + 40) uuid];
    int v17 = 138543874;
    long long v18 = v6;
    __int16 v19 = 2112;
    __int16 v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Configuring NFC Reader Key because wallet key support did change on accessory: %@", (uint8_t *)&v17, 0x20u);
  }
  [*(id *)(a1 + 32) configureNFCReaderKeyForAccessory:*(void *)(a1 + 40) flow:v2];
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterTTU", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& [*(id *)(a1 + 40) supportsCHIP]&& objc_msgSend(*(id *)(a1 + 40), "supportsWalletKey")&& objc_msgSend(*(id *)(a1 + 32), "isPrimaryResidentOrSoleOwnerController"))
  {
    id v9 = [MEMORY[0x263F42530] internalOnlyInitializer];
    BOOL v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [v9 UUID];
      id v15 = [*(id *)(a1 + 40) uuid];
      int v17 = 138543874;
      long long v18 = v13;
      __int16 v19 = 2112;
      __int16 v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Adding Issuer Key to accessory because wallet key support did change on accessory: %@", (uint8_t *)&v17, 0x20u);
    }
    id v16 = (id)[*(id *)(a1 + 32) addIssuerKeysToMatterAccessory:*(void *)(a1 + 40) flow:v9];
  }
}

- (void)handleAccessoryConfigured:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__HMDHomeWalletKeyAccessoryManager_handleAccessoryConfigured___block_invoke;
    v8[3] = &unk_264A2F820;
    v8[4] = self;
    id v9 = v6;
    dispatch_async(v7, v8);
  }
}

void __62__HMDHomeWalletKeyAccessoryManager_handleAccessoryConfigured___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F42530] internalOnlyInitializer];
  BOOL v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    int v15 = 138543618;
    id v16 = v6;
    __int16 v17 = 2112;
    long long v18 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Configuring NFC Reader Key because accessory was configured", (uint8_t *)&v15, 0x16u);
  }
  [*(id *)(a1 + 32) configureNFCReaderKeyForAccessory:*(void *)(a1 + 40) flow:v2];
  [*(id *)(a1 + 32) handlePendingDeviceCredentialKeysSyncForAccessory:*(void *)(a1 + 40) withReason:@"accessory connected"];
  id v8 = [*(id *)(a1 + 32) delegate];

  if (v8 && [*(id *)(a1 + 40) supportsHAP])
  {
    id v9 = [MEMORY[0x263F42530] internalOnlyInitializer];
    BOOL v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [v9 UUID];
      int v15 = 138543618;
      id v16 = v13;
      __int16 v17 = 2112;
      long long v18 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Fetching wallet key color because accessory was configured", (uint8_t *)&v15, 0x16u);
    }
    [*(id *)(a1 + 32) fetchWalletKeyColorWithAccessory:*(void *)(a1 + 40) flow:v9];
  }
}

- (void)handleHomeAccessoryRemovedNotification:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyAccessoryManager *)self dataSource];
  char v6 = [v5 isWatch];

  if ((v6 & 1) == 0)
  {
    id v7 = [v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:@"HMDAccessoryNotificationKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      id v11 = [v4 object];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }
      id v13 = v12;

      if ([v13 hasAnyAccessoryWithWalletKeySupport])
      {
        id v14 = (void *)MEMORY[0x230FBD990]();
        int v15 = self;
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          __int16 v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v25 = v17;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Not handling accessory removed notification, home still has an accessory that supports wallet key", buf, 0xCu);
        }
      }
      else
      {
        long long v18 = [v4 userInfo];
        uint64_t v19 = objc_msgSend(v18, "hmf_numberForKey:", @"HMDNotificationSourceKey");
        uint64_t v20 = [v19 unsignedIntegerValue];

        if (v20 == 1)
        {
          __int16 v21 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __75__HMDHomeWalletKeyAccessoryManager_handleHomeAccessoryRemovedNotification___block_invoke;
          v22[3] = &unk_264A2F820;
          v22[4] = self;
          id v23 = v13;
          dispatch_async(v21, v22);
        }
      }
    }
  }
}

void __75__HMDHomeWalletKeyAccessoryManager_handleHomeAccessoryRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F42530] internalOnlyInitializer];
  BOOL v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Last accessory supporting wallet key was removed.", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 40) updateHasOnboardedForWalletKey:0 message:0];
}

- (void)handleHomeAddedAccessoryNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"HMDNotificationAddedAccessoryKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    int v8 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __73__HMDHomeWalletKeyAccessoryManager_handleHomeAddedAccessoryNotification___block_invoke;
    v9[3] = &unk_264A2F820;
    v9[4] = self;
    id v10 = v7;
    dispatch_async(v8, v9);
  }
}

void __73__HMDHomeWalletKeyAccessoryManager_handleHomeAddedAccessoryNotification___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F42530] internalOnlyInitializer];
  BOOL v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    int v8 = [*(id *)(a1 + 40) uuid];
    int v21 = 138543874;
    uint64_t v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Configuring NFC Reader Key because new accessory was added: %@", (uint8_t *)&v21, 0x20u);
  }
  [*(id *)(a1 + 32) configureNFCReaderKeyForAccessory:*(void *)(a1 + 40) flow:v2];
  [*(id *)(a1 + 32) handlePendingDeviceCredentialKeysSyncForAccessory:*(void *)(a1 + 40) withReason:@"accessory added"];
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterTTU", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& [*(id *)(a1 + 40) supportsCHIP]&& objc_msgSend(*(id *)(a1 + 40), "supportsWalletKey")&& objc_msgSend(*(id *)(a1 + 32), "isPrimaryResidentOrSoleOwnerController"))
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) uuid];
    id v11 = [*(id *)(a1 + 40) home];
    uint64_t v12 = [v11 users];
    objc_msgSend(v9, "startHomeWalletKeyAddForAccessoryUUID:keyType:expectedCount:", v10, 1, objc_msgSend(v12, "count"));

    id v13 = [MEMORY[0x263F42530] internalOnlyInitializer];
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      long long v18 = [v13 UUID];
      uint64_t v19 = [*(id *)(a1 + 40) uuid];
      int v21 = 138543874;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      id v24 = v18;
      __int16 v25 = 2112;
      uint64_t v26 = v19;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Adding Issuer Key to accessory because new accessory was added: %@", (uint8_t *)&v21, 0x20u);
    }
    id v20 = (id)[*(id *)(a1 + 32) addIssuerKeysToMatterAccessory:*(void *)(a1 + 40) flow:v13];
  }
}

- (void)handleHomeDidDisableCharacteristicNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__HMDHomeWalletKeyAccessoryManager_handleHomeDidDisableCharacteristicNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __83__HMDHomeWalletKeyAccessoryManager_handleHomeDidDisableCharacteristicNotification___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) name];
  [v1 configureNotificationsWithReason:v2];
}

- (void)handleHomeDidEnableCharacteristicNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__HMDHomeWalletKeyAccessoryManager_handleHomeDidEnableCharacteristicNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __82__HMDHomeWalletKeyAccessoryManager_handleHomeDidEnableCharacteristicNotification___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) name];
  [v1 configureNotificationsWithReason:v2];
}

- (void)handleHomeNFCReaderKeyKeychainItemAvailableNotification:(id)a3
{
  id v4 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__HMDHomeWalletKeyAccessoryManager_handleHomeNFCReaderKeyKeychainItemAvailableNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __92__HMDHomeWalletKeyAccessoryManager_handleHomeNFCReaderKeyKeychainItemAvailableNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nfcReaderKeyConfigureStateByAccessoryUUID];
  [v2 removeAllObjects];

  BOOL v3 = *(void **)(a1 + 32);
  return [v3 configureNFCReaderKeyForAllAccessoriesWithReason:@"Keychain item available"];
}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__HMDHomeWalletKeyAccessoryManager_handlePrimaryResidentUpdateNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __76__HMDHomeWalletKeyAccessoryManager_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) home];
  uint64_t v3 = [v2 isCurrentDeviceConfirmedPrimaryResident];
  if (v3 != [*(id *)(a1 + 32) isCurrentDevicePrimaryResident])
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      [*(id *)(a1 + 32) isCurrentDevicePrimaryResident];
      id v8 = HMFBooleanToString();
      id v9 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v7;
      __int16 v28 = 2112;
      uint64_t v29 = v8;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Current device primary changed from: (%@->%@)", buf, 0x20u);
    }
    [*(id *)(a1 + 32) setCurrentDevicePrimaryResident:v3];
    id v10 = *(void **)(a1 + 32);
    id v11 = [*(id *)(a1 + 40) name];
    [v10 configureNotificationsWithReason:v11];
  }
  uint64_t v12 = [*(id *)(a1 + 32) pendingPrimaryResidentDeviceCredentialKeyOperation];
  if (v12)
  {
    id v13 = [v2 accessoriesWithWalletKeySupport];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __76__HMDHomeWalletKeyAccessoryManager_handlePrimaryResidentUpdateNotification___block_invoke_283;
    v24[3] = &unk_264A28A10;
    id v14 = v12;
    id v25 = v14;
    id v15 = objc_msgSend(v13, "na_filter:", v24);

    id v16 = [*(id *)(a1 + 32) primaryResidentDevice];
    __int16 v17 = [v2 currentUser];
    if (([v17 isOwner] & 1) == 0 && objc_msgSend(v15, "count") && v16)
    {
      int v18 = [*(id *)(a1 + 32) canConfigureAccessories];

      if (v18)
      {
        uint64_t v19 = *(void **)(a1 + 32);
        id v20 = [v14 deviceCredentialKey];
        int v21 = [MEMORY[0x263F42530] untrackedPlaceholderFlow];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __76__HMDHomeWalletKeyAccessoryManager_handlePrimaryResidentUpdateNotification___block_invoke_2;
        v22[3] = &unk_264A2F370;
        v22[4] = *(void *)(a1 + 32);
        id v23 = v14;
        [v19 requestPrimaryResident:v16 toConfigureAccessories:v15 withDeviceCredentialKey:v20 ofType:0 flow:v21 completion:v22];
      }
    }
    else
    {
    }
  }
}

uint64_t __76__HMDHomeWalletKeyAccessoryManager_handlePrimaryResidentUpdateNotification___block_invoke_283(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 accessoriesUUIDs];
  id v5 = [v3 uuid];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

void __76__HMDHomeWalletKeyAccessoryManager_handlePrimaryResidentUpdateNotification___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138543874;
      id v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      id v10 = "%{public}@Failed to handle pending operation when primary resident updated %@:%@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138543618;
    id v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    id v10 = "%{public}@Successfully handled pending operation when primary resident updated %@";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }

  [*(id *)(a1 + 32) setPendingPrimaryResidentDeviceCredentialKeyOperation:0];
}

- (void)handleAccessoryCharacteristicsChangedNotification:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if ([v7 supportsWalletKey])
  {
    id v8 = [v4 userInfo];
    uint64_t v9 = objc_msgSend(v8, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");
    id v10 = objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_279_224439);

    if (v10)
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      os_log_type_t v12 = self;
      uint32_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v14;
        __int16 v30 = 2112;
        id v31 = v10;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling value update of hardware finish characteristic: %@", buf, 0x16u);
      }
      int v15 = [v10 value];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v16 = v15;
      }
      else {
        id v16 = 0;
      }
      id v17 = v16;

      if (v17)
      {
        uint64_t v18 = [MEMORY[0x263F42530] untrackedPlaceholderFlow];
        __int16 v19 = [(HMDHomeWalletKeyAccessoryManager *)v12 walletKeyColorWithCharacteristicValue:v17 flow:v18];

        if (v19)
        {
          id v20 = [(HMDHomeWalletKeyAccessoryManager *)v12 workQueue];
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __86__HMDHomeWalletKeyAccessoryManager_handleAccessoryCharacteristicsChangedNotification___block_invoke_282;
          v26[3] = &unk_264A2F820;
          v26[4] = v12;
          id v27 = v19;
          dispatch_async(v20, v26);
        }
      }
      else
      {
        uint64_t v21 = (void *)MEMORY[0x230FBD990]();
        uint64_t v22 = v12;
        id v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          id v24 = HMFGetLogIdentifier();
          uint64_t v25 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          uint64_t v29 = v24;
          __int16 v30 = 2112;
          id v31 = 0;
          __int16 v32 = 2112;
          uint64_t v33 = v25;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Hardware finish characteristic value: %@ is not of type data: %@", buf, 0x20u);
        }
      }
    }
  }
}

void __86__HMDHomeWalletKeyAccessoryManager_handleAccessoryCharacteristicsChangedNotification___block_invoke_282(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataSource];
  id v3 = [*(id *)(a1 + 32) walletKeyColorPreferenceKey];
  id v9 = [v2 numberValueFromNoBackupStoreWithKey:v3];

  id v4 = v9;
  if (!v9)
  {
    id v5 = [*(id *)(a1 + 32) dataSource];
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) walletKeyColorPreferenceKey];
    [v5 persistNumberValueToNoBackupStore:v6 withKey:v7];

    id v8 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(v8, "accessoryManager:didUpdateWalletKeyColor:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "integerValue"));

    id v4 = 0;
  }
}

uint64_t __86__HMDHomeWalletKeyAccessoryManager_handleAccessoryCharacteristicsChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 type];
    uint64_t v7 = [v6 isEqualToString:@"0000026C-0000-1000-8000-0026BB765291"];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_addIssuerKeyForUser:(id)a3 toMatterAccessory:(id)a4 flow:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  char v12 = [v9 supportsWalletKeyForUser:v8 withFlow:v10];
  uint32_t v13 = (void *)MEMORY[0x230FBD990]();
  uint64_t v14 = self;
  int v15 = HMFGetOSLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      id v17 = HMFGetLogIdentifier();
      uint64_t v18 = [v10 UUID];
      *(_DWORD *)buf = 138544130;
      uint64_t v34 = v17;
      __int16 v35 = 2112;
      uint64_t v36 = v18;
      __int16 v37 = 2112;
      id v38 = v8;
      __int16 v39 = 2112;
      id v40 = v9;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addIssuerKeyForUser: %@, toAccessory: %@", buf, 0x2Au);
    }
    __int16 v19 = [(HMDHomeWalletKeyAccessoryManager *)v14 home];
    id v20 = [v8 uuid];
    uint64_t v21 = [v19 findOrAddUserIndexForUserUUID:v20 guestName:0 accessory:v9 flow:v10];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke;
    v29[3] = &unk_264A28D00;
    v29[4] = v14;
    id v30 = v8;
    id v31 = v10;
    id v32 = v9;
    uint64_t v22 = [v21 flatMap:v29];
  }
  else
  {
    if (v16)
    {
      id v23 = HMFGetLogIdentifier();
      id v24 = [v10 UUID];
      uint64_t v25 = [v8 uuid];
      uint64_t v26 = [v9 uuid];
      *(_DWORD *)buf = 138544130;
      uint64_t v34 = v23;
      __int16 v35 = 2112;
      uint64_t v36 = v24;
      __int16 v37 = 2112;
      id v38 = v25;
      __int16 v39 = 2112;
      id v40 = v26;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Skipped adding wallet key to accessory because wallet keys are not supported for user: %@ on accessory: %@", buf, 0x2Au);
    }
    id v27 = (void *)MEMORY[0x263F58190];
    __int16 v19 = [MEMORY[0x263EFF9D0] null];
    uint64_t v22 = [v27 futureWithResult:v19];
  }

  return v22;
}

id __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke(id *a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [(id)objc_opt_class() createMatterIssuerKeyDataForUser:a1[5] withUserIndex:v3 flow:a1[6]];
  if (!_os_feature_enabled_impl()
    || (isInternalBuild() & 1) == 0
    && !CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)|| ![a1[7] supportsACWGProvisioning])
  {
    char v6 = 1;
    if (!v4) {
      goto LABEL_6;
    }
LABEL_10:
    uint64_t v14 = [a1[7] waitForDoorLockClusterObjectWithFlow:a1[6]];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_268;
    v35[3] = &unk_264A28C38;
    id v36 = v4;
    id v37 = v3;
    char v39 = v6;
    id v38 = a1[6];
    BOOL v16 = [v14 then:v35];
    id v17 = [v16 naFuture];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_2;
    v32[3] = &unk_264A28C60;
    v32[4] = a1[4];
    id v33 = a1[7];
    id v34 = a1[6];
    uint64_t v18 = [v17 recover:v32];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_270;
    v28[3] = &unk_264A28C88;
    v28[4] = a1[4];
    id v29 = a1[6];
    id v30 = a1[5];
    id v31 = a1[7];
    __int16 v19 = [v18 addFailureBlock:v28];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_271;
    v24[3] = &unk_264A28CB0;
    void v24[4] = a1[4];
    id v25 = a1[7];
    id v26 = a1[6];
    id v27 = a1[5];
    id v20 = [v19 addSuccessBlock:v24];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_272;
    v22[3] = &unk_264A28CD8;
    id v23 = a1[7];
    int v15 = [v20 flatMap:v22];

    goto LABEL_11;
  }
  uint64_t v5 = [a1[5] acwgIssuerPublicKeyExternalRepresentation];

  char v6 = 0;
  id v4 = (void *)v5;
  if (v5) {
    goto LABEL_10;
  }
LABEL_6:
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = a1[4];
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [a1[6] UUID];
    char v12 = [a1[5] uuid];
    *(_DWORD *)buf = 138543874;
    uint64_t v41 = v10;
    __int16 v42 = 2112;
    id v43 = v11;
    __int16 v44 = 2112;
    id v45 = v12;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not adding issuer key because we don't have one for user: %@", buf, 0x20u);
  }
  uint32_t v13 = (void *)MEMORY[0x263F58190];
  uint64_t v14 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
  int v15 = [v13 futureWithError:v14];
LABEL_11:

  return v15;
}

uint64_t __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_268(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "addIssuerKeyData:forUserIndex:isUnifiedAccess:flow:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "integerValue"), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    uint64_t v5 = v4;

    return 3;
  }
  else
  {
    uint64_t v7 = _HMFPreconditionFailure();
    return __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_2(v7);
  }
}

id __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_2(id *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 domain];
  uint64_t v5 = v4;
  if (v4 != (void *)*MEMORY[0x263F497B8])
  {

LABEL_7:
    uint64_t v14 = [MEMORY[0x263F58190] futureWithError:v3];
    goto LABEL_8;
  }
  uint64_t v6 = [v3 code];

  if (v6 != 8) {
    goto LABEL_7;
  }
  id v7 = a1[4];
  id v8 = [a1[5] uuid];
  [v7 updateHomeWalletKeyAddForAccessoryUUID:v8 keyType:1];

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = a1[4];
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    char v12 = HMFGetLogIdentifier();
    uint32_t v13 = [a1[6] UUID];
    int v17 = 138543618;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    id v20 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Ignoring duplicate error while adding Issuer key", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v14 = [MEMORY[0x263F58190] futureWithNoResult];
LABEL_8:
  int v15 = (void *)v14;

  return v15;
}

void __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_270(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    int v11 = 138544386;
    char v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add issuer key for user: %@, to accessory: %@, with error: %@", (uint8_t *)&v11, 0x34u);
  }
}

void __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_271(id *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = a1[4];
  id v5 = [a1[5] uuid];
  [v4 updateHomeWalletKeyAddForAccessoryUUID:v5 keyType:1];

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = a1[4];
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    uint64_t v10 = [a1[6] UUID];
    int v11 = [a1[7] uuid];
    char v12 = [a1[5] uuid];
    int v13 = 138544130;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    id v20 = v12;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully configured issuer key for user: %@ on accessory: %@", (uint8_t *)&v13, 0x2Au);
  }
}

id __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_272(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F58190];
  id v2 = [*(id *)(a1 + 32) uuid];
  id v3 = [v1 futureWithResult:v2];

  return v3;
}

- (id)addIssuerKeyForUser:(id)a3 toMatterAccessory:(id)a4 flow:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = objc_opt_new();
  char v12 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__HMDHomeWalletKeyAccessoryManager_addIssuerKeyForUser_toMatterAccessory_flow___block_invoke;
  block[3] = &unk_264A2E908;
  void block[4] = self;
  id v21 = v8;
  id v22 = v9;
  id v23 = v10;
  id v13 = v11;
  id v24 = v13;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v12, block);

  __int16 v17 = v24;
  id v18 = v13;

  return v18;
}

void __79__HMDHomeWalletKeyAccessoryManager_addIssuerKeyForUser_toMatterAccessory_flow___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _addIssuerKeyForUser:*(void *)(a1 + 40) toMatterAccessory:*(void *)(a1 + 48) flow:*(void *)(a1 + 56)];
  id v2 = [*(id *)(a1 + 64) completionHandlerAdapter];
  id v3 = (id)[v4 addCompletionBlock:v2];
}

- (id)addIssuerKeysToMatterTTUAccessoriesForUser:(id)a3 flow:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    char v12 = HMFGetLogIdentifier();
    id v13 = [v7 UUID];
    *(_DWORD *)buf = 138543874;
    id v27 = v12;
    __int16 v28 = 2112;
    id v29 = v13;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addIssuerKeysToMatterTTUAccessoriesForUser: %@", buf, 0x20u);
  }
  id v14 = [(HMDHomeWalletKeyAccessoryManager *)v10 matterAccessoriesSupportingWalletKey];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __84__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterTTUAccessoriesForUser_flow___block_invoke;
  v23[3] = &unk_264A28A38;
  v23[4] = v10;
  id v24 = v6;
  id v25 = v7;
  id v15 = v7;
  id v16 = v6;
  __int16 v17 = objc_msgSend(v14, "na_map:", v23);

  id v18 = (void *)MEMORY[0x263F58190];
  __int16 v19 = [MEMORY[0x263F581B8] globalAsyncScheduler];
  id v20 = [v18 combineAllFutures:v17 ignoringErrors:1 scheduler:v19];
  id v21 = [v20 flatMap:&__block_literal_global_258];

  return v21;
}

uint64_t __84__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterTTUAccessoriesForUser_flow___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _addIssuerKeyForUser:*(void *)(a1 + 40) toMatterAccessory:a2 flow:*(void *)(a1 + 48)];
}

id __84__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterTTUAccessoriesForUser_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "na_any:", &__block_literal_global_260))
  {
    id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_262);
    id v4 = [MEMORY[0x263F58190] futureWithResult:v3];
  }
  else
  {
    id v4 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA68]];
  }

  return v4;
}

id __84__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterTTUAccessoriesForUser_flow___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

uint64_t __84__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterTTUAccessoriesForUser_flow___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

- (id)addIssuerKeysToMatterAccessory:(id)a3 flow:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    char v12 = HMFGetLogIdentifier();
    id v13 = [v7 UUID];
    *(_DWORD *)buf = 138543874;
    id v31 = v12;
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addIssuerKeysToMatterAccessory: %@", buf, 0x20u);
  }
  id v14 = [(HMDHomeWalletKeyAccessoryManager *)v10 home];
  id v15 = [v14 users];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __72__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterAccessory_flow___block_invoke;
  v27[3] = &unk_264A28C10;
  void v27[4] = v10;
  id v16 = v6;
  id v28 = v16;
  id v29 = v7;
  id v17 = v7;
  id v18 = objc_msgSend(v15, "na_map:", v27);

  __int16 v19 = (void *)MEMORY[0x263F58190];
  id v20 = [MEMORY[0x263F581B8] globalAsyncScheduler];
  id v21 = [v19 combineAllFutures:v18 ignoringErrors:1 scheduler:v20];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __72__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterAccessory_flow___block_invoke_2;
  v25[3] = &unk_264A2D8B8;
  id v26 = v16;
  id v22 = v16;
  id v23 = [v21 flatMap:v25];

  return v23;
}

uint64_t __72__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterAccessory_flow___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _addIssuerKeyForUser:a2 toMatterAccessory:*(void *)(a1 + 40) flow:*(void *)(a1 + 48)];
}

id __72__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterAccessory_flow___block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  int v3 = objc_msgSend(a2, "na_any:", &__block_literal_global_256_224455);
  id v4 = (void *)MEMORY[0x263F58190];
  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) uuid];
    v9[0] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    id v7 = [v4 futureWithResult:v6];
  }
  else
  {
    id v7 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA68]];
  }
  return v7;
}

uint64_t __72__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterAccessory_flow___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

- (id)addIssuerKeysToMatterAccessories:(id)a3 flow:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    char v12 = HMFGetLogIdentifier();
    id v13 = [v7 UUID];
    *(_DWORD *)buf = 138543874;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addIssuerKeysToMatterAccessories: %@", buf, 0x20u);
  }
  id v14 = (void *)MEMORY[0x263F58190];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  id v21 = __74__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterAccessories_flow___block_invoke;
  id v22 = &unk_264A28BE8;
  id v23 = v10;
  id v24 = v7;
  id v15 = v7;
  id v16 = objc_msgSend(v6, "na_map:", &v19);
  id v17 = objc_msgSend(v14, "combineAllFuturesFlatteningArrayResults:", v16, v19, v20, v21, v22, v23);

  return v17;
}

uint64_t __74__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterAccessories_flow___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addIssuerKeysToMatterAccessory:a2 flow:*(void *)(a1 + 40)];
}

- (void)addIssuerKeysToMatterAccessoriesWithFlow:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v4 UUID];
    int v20 = 138543618;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addIssuerKeysToMatterAccessories", (uint8_t *)&v20, 0x16u);
  }
  int v11 = [(HMDHomeWalletKeyAccessoryManager *)v7 matterAccessoriesSupportingWalletKey];
  int v12 = objc_msgSend(v11, "hmf_isEmpty");

  if (v12)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = v7;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = [v4 UUID];
      int v20 = 138543618;
      id v21 = v16;
      __int16 v22 = 2112;
      id v23 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No Matter accessories supporting wallet key, so nothing to add Issuer key to.", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    id v18 = [(HMDHomeWalletKeyAccessoryManager *)v7 matterAccessoriesSupportingWalletKey];
    id v19 = [(HMDHomeWalletKeyAccessoryManager *)v7 addIssuerKeysToMatterAccessories:v18 flow:v4];
  }
}

- (void)_handleAddIssuerKeysToAccessoriesMessage:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 flow];
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 UUID];
    *(_DWORD *)buf = 138543874;
    id v18 = v9;
    __int16 v19 = 2112;
    int v20 = v10;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] _handleAddIssuerKeysToAccessoriesMessage: %@", buf, 0x20u);
  }
  int v11 = [(HMDHomeWalletKeyAccessoryManager *)v7 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__HMDHomeWalletKeyAccessoryManager__handleAddIssuerKeysToAccessoriesMessage___block_invoke;
  block[3] = &unk_264A2F2F8;
  void block[4] = v7;
  id v15 = v5;
  id v16 = v4;
  id v12 = v4;
  id v13 = v5;
  dispatch_async(v11, block);
}

void __77__HMDHomeWalletKeyAccessoryManager__handleAddIssuerKeysToAccessoriesMessage___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = [a1[4] matterAccessoriesSupportingWalletKey];
  int v3 = objc_msgSend(v2, "hmf_isEmpty");

  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = a1[4];
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [a1[5] UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v19 = v7;
      __int16 v20 = 2112;
      __int16 v21 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No Matter accessories supporting wallet key, so nothing to add Issuer key to.", buf, 0x16u);
    }
    [a1[6] respondWithSuccess];
  }
  id v9 = a1[4];
  id v10 = [v9 matterAccessoriesSupportingWalletKey];
  int v11 = [v9 addIssuerKeysToMatterAccessories:v10 flow:a1[5]];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__HMDHomeWalletKeyAccessoryManager__handleAddIssuerKeysToAccessoriesMessage___block_invoke_253;
  v16[3] = &unk_264A28890;
  id v17 = a1[6];
  id v12 = [v11 addSuccessBlock:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__HMDHomeWalletKeyAccessoryManager__handleAddIssuerKeysToAccessoriesMessage___block_invoke_2;
  v14[3] = &unk_264A2F3E8;
  id v15 = a1[6];
  id v13 = (id)[v12 addFailureBlock:v14];
}

uint64_t __77__HMDHomeWalletKeyAccessoryManager__handleAddIssuerKeysToAccessoriesMessage___block_invoke_253(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithSuccess];
}

uint64_t __77__HMDHomeWalletKeyAccessoryManager__handleAddIssuerKeysToAccessoriesMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

- (void)handleHMDHomeConfigureMatterAccessoryWithReaderKeyMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatterTTU", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    id v5 = [v4 flow];
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [v5 UUID];
      *(_DWORD *)buf = 138543874;
      id v25 = v9;
      __int16 v26 = 2112;
      __int16 v27 = v10;
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling HMDHomeConfigureMatterAccessoryWithReaderKeyMessage message: %@", buf, 0x20u);
    }
    uint64_t v23 = objc_opt_class();
    int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    id v12 = [v4 unarchivedObjectForKey:@"HMDHomeConfigureMatterAccessoryWithReaderKeyMessageKeyAccessoryUUID" ofClasses:v11];

    id v13 = [(HMDHomeWalletKeyAccessoryManager *)v7 home];
    id v14 = [v13 accessoryWithUUID:v12];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    if (v16)
    {
      [(HMDHomeWalletKeyAccessoryManager *)v7 configureNFCReaderKeyForAccessory:v16 flow:v5];
      [v4 respondWithSuccess];
    }
    else
    {
      id v17 = (void *)MEMORY[0x230FBD990]();
      id v18 = v7;
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = HMFGetLogIdentifier();
        __int16 v21 = [v5 UUID];
        *(_DWORD *)buf = 138543874;
        id v25 = v20;
        __int16 v26 = 2112;
        __int16 v27 = v21;
        __int16 v28 = 2112;
        id v29 = v12;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Could not find accessory with uuid: %@", buf, 0x20u);
      }
      uint64_t v22 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      [v4 respondWithError:v22];
    }
  }
}

- (void)handleConfigureAccessoriesWithDeviceCredentialKeyMessage:(id)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v4 = (__CFString *)a3;
  id v5 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(__CFString *)v4 flow];
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v11 = [v6 UUID];
    id v12 = [(__CFString *)v4 messagePayload];
    *(_DWORD *)buf = 138544130;
    __int16 v72 = v10;
    __int16 v73 = 2112;
    uint64_t v74 = (uint64_t)v11;
    __int16 v75 = 2112;
    __int16 v76 = v4;
    __int16 v77 = 2112;
    uint64_t v78 = (uint64_t)v12;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling message to configure device credential key %@ with payload: %@", buf, 0x2Au);
  }
  id v13 = [(HMDHomeWalletKeyAccessoryManager *)v8 home];
  id v14 = [(__CFString *)v4 userForHome:v13];

  if (v14)
  {
    id v15 = [(__CFString *)v4 destination];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;

    if (v17)
    {
      id v18 = [(__CFString *)v4 dataForKey:@"HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyCredentialKey"];
      if (v18)
      {
        uint64_t v62 = v6;
        __int16 v19 = [(__CFString *)v4 numberForKey:@"HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyTapToUnlockType"];
        if (v19)
        {
          __int16 v20 = [(__CFString *)v4 arrayForKey:@"HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyAccessoryUUIDs"];
          if (v20)
          {
            __int16 v21 = [MEMORY[0x263EFF9C0] set];
            v68[0] = MEMORY[0x263EF8330];
            v68[1] = 3221225472;
            v68[2] = __93__HMDHomeWalletKeyAccessoryManager_handleConfigureAccessoriesWithDeviceCredentialKeyMessage___block_invoke;
            v68[3] = &unk_264A28BC0;
            v68[4] = v8;
            id v22 = v6;
            id v69 = v22;
            id v70 = v21;
            id v57 = v21;
            objc_msgSend(v20, "na_map:", v68);
            uint64_t v23 = v59 = v18;
            uint64_t v56 = [v19 integerValue];
            uint64_t v24 = [v17 device];
            id v25 = [v24 identifier];
            v65[0] = MEMORY[0x263EF8330];
            v65[1] = 3221225472;
            v65[2] = __93__HMDHomeWalletKeyAccessoryManager_handleConfigureAccessoriesWithDeviceCredentialKeyMessage___block_invoke_244;
            v65[3] = &unk_264A2E210;
            void v65[4] = v8;
            id v66 = v22;
            id v67 = v4;
            __int16 v26 = v8;
            __int16 v27 = v57;
            [(HMDHomeWalletKeyAccessoryManager *)v26 configureAccessories:v23 withDeviceCredentialKey:v59 ofType:v56 forDeviceWithUUID:v25 user:v14 flow:v66 completion:v65];

            id v18 = v59;
          }
          else
          {
            __int16 v51 = (void *)MEMORY[0x230FBD990]();
            uint64_t v52 = v8;
            uint64_t v53 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              id v58 = HMFGetLogIdentifier();
              __int16 v61 = v51;
              uint64_t v54 = [v62 UUID];
              *(_DWORD *)buf = 138543874;
              __int16 v72 = v58;
              __int16 v73 = 2112;
              uint64_t v74 = v54;
              id v55 = (void *)v54;
              __int16 v75 = 2112;
              __int16 v76 = @"HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyAccessoryUUIDs";
              _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to handle configure device credential key message, mising parameter: %@", buf, 0x20u);

              __int16 v51 = v61;
            }

            __int16 v27 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
            [(__CFString *)v4 respondWithError:v27];
          }
        }
        else
        {
          uint64_t v46 = (void *)MEMORY[0x230FBD990]();
          __int16 v47 = v8;
          __int16 v48 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            __int16 v49 = v60 = v46;
            id v50 = [v6 UUID];
            *(_DWORD *)buf = 138543874;
            __int16 v72 = v49;
            __int16 v73 = 2112;
            uint64_t v74 = (uint64_t)v50;
            __int16 v75 = 2112;
            __int16 v76 = @"HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyTapToUnlockType";
            _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to handle configure device credential key message, missing parameter: %@", buf, 0x20u);

            uint64_t v46 = v60;
          }

          __int16 v20 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
          [(__CFString *)v4 respondWithError:v20];
        }
        id v6 = v62;
      }
      else
      {
        id v40 = (void *)MEMORY[0x230FBD990]();
        uint64_t v41 = v8;
        __int16 v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          __int16 v64 = v40;
          __int16 v44 = v43 = v6;
          id v45 = [v43 UUID];
          *(_DWORD *)buf = 138543874;
          __int16 v72 = v44;
          __int16 v73 = 2112;
          uint64_t v74 = (uint64_t)v45;
          __int16 v75 = 2112;
          __int16 v76 = @"HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyCredentialKey";
          _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to handle configure device credential key message, missing parameter: %@", buf, 0x20u);

          id v6 = v43;
          id v40 = v64;
        }

        __int16 v19 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
        [(__CFString *)v4 respondWithError:v19];
      }
    }
    else
    {
      id v33 = (void *)MEMORY[0x230FBD990]();
      __int16 v34 = v8;
      id v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = HMFGetLogIdentifier();
        id v37 = [v6 UUID];
        [(__CFString *)v4 destination];
        __int16 v63 = v6;
        id v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v39 = objc_opt_class();
        *(_DWORD *)buf = 138544130;
        __int16 v72 = v36;
        __int16 v73 = 2112;
        uint64_t v74 = (uint64_t)v37;
        __int16 v75 = 2112;
        __int16 v76 = v38;
        __int16 v77 = 2112;
        uint64_t v78 = v39;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Message destination is not of expected type %@:%@", buf, 0x2Au);

        id v6 = v63;
      }

      id v18 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [(__CFString *)v4 respondWithError:v18];
    }
  }
  else
  {
    __int16 v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = v8;
    uint64_t v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = HMFGetLogIdentifier();
      __int16 v32 = [v6 UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v72 = v31;
      __int16 v73 = 2112;
      uint64_t v74 = (uint64_t)v32;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to handle configure device credential key message, user not found", buf, 0x16u);
    }
    id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [(__CFString *)v4 respondWithError:v17];
  }
}

id __93__HMDHomeWalletKeyAccessoryManager_handleConfigureAccessoriesWithDeviceCredentialKeyMessage___block_invoke(id *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];
    if (v6)
    {
      id v7 = [a1[4] home];
      id v8 = [v7 accessoryWithUUID:v6];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
      id v10 = v9;

      if (v10) {
        goto LABEL_20;
      }
      int v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = a1[4];
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        id v15 = [a1[5] UUID];
        int v27 = 138543874;
        __int16 v28 = v14;
        __int16 v29 = 2112;
        uint64_t v30 = v15;
        __int16 v31 = 2112;
        id v32 = v6;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not configuring accessory with device credential key, accessory with uuid: %@ not found", (uint8_t *)&v27, 0x20u);
      }
      [a1[6] addObject:v6];
    }
    else
    {
      __int16 v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = a1[4];
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        id v25 = [a1[5] UUID];
        int v27 = 138544130;
        __int16 v28 = v24;
        __int16 v29 = 2112;
        uint64_t v30 = v25;
        __int16 v31 = 2112;
        id v32 = v5;
        __int16 v33 = 2112;
        uint64_t v34 = objc_opt_class();
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not configuring accessory with device credential key, failed to convert accessory uuid: %@ to: %@", (uint8_t *)&v27, 0x2Au);
      }
    }
    id v10 = 0;
LABEL_20:

    goto LABEL_21;
  }
  id v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = a1[4];
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    __int16 v19 = HMFGetLogIdentifier();
    __int16 v20 = [a1[5] UUID];
    int v27 = 138544130;
    __int16 v28 = v19;
    __int16 v29 = 2112;
    uint64_t v30 = v20;
    __int16 v31 = 2112;
    id v32 = v3;
    __int16 v33 = 2112;
    uint64_t v34 = objc_opt_class();
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not configuring accessory with device credential key, unknown type for uuid: %@ expected: %@", (uint8_t *)&v27, 0x2Au);
  }
  id v10 = 0;
LABEL_21:

  return v10;
}

void __93__HMDHomeWalletKeyAccessoryManager_handleConfigureAccessoriesWithDeviceCredentialKeyMessage___block_invoke_244(id *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1[4] workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = a1[4];
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [a1[5] UUID];
      id v11 = a1[6];
      *(_DWORD *)buf = 138544130;
      __int16 v20 = v9;
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v3;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to handle configure device credential key message %@:%@", buf, 0x2Au);
    }
    [a1[6] respondWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [a1[5] UUID];
      id v14 = a1[6];
      *(_DWORD *)buf = 138543874;
      __int16 v20 = v12;
      __int16 v21 = 2112;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully handled configure device credential key message: %@", buf, 0x20u);
    }
    id v15 = a1[6];
    id v17 = @"HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyDidSucceed";
    uint64_t v18 = MEMORY[0x263EFFA88];
    id v16 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    [v15 respondWithPayload:v16];
  }
}

- (id)missingWalletKeysForAccessoryUUID:(id)a3 usersByUniqueID:(id)a4 accessoryUsersByUniqueID:(id)a5 flow:(id)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 uuid];
  id v15 = [v10 supportsMatterWalletKey];
  int v16 = [v15 BOOLValue];

  if (!v16) {
    goto LABEL_4;
  }
  id v17 = [v12 allValues];
  uint64_t v18 = objc_msgSend(v17, "na_firstObjectPassingTest:", &__block_literal_global_226_224478);

  __int16 v19 = [v18 credentials];
  __int16 v20 = objc_msgSend(v19, "na_firstObjectPassingTest:", &__block_literal_global_229_224479);

  if (v20)
  {

LABEL_4:
    __int16 v21 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = [v11 allKeys];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __116__HMDHomeWalletKeyAccessoryManager_missingWalletKeysForAccessoryUUID_usersByUniqueID_accessoryUsersByUniqueID_flow___block_invoke_2_232;
    v35[3] = &unk_264A28B98;
    id v36 = v12;
    id v37 = self;
    id v38 = v13;
    id v39 = v14;
    id v40 = v11;
    id v41 = v10;
    id v22 = v14;
    __int16 v23 = objc_msgSend(v18, "na_map:", v35);
    id v24 = [v21 setWithArray:v23];

    id v25 = v36;
    goto LABEL_5;
  }
  uint64_t v27 = (void *)MEMORY[0x230FBD990]();
  __int16 v28 = self;
  __int16 v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    uint64_t v30 = HMFGetLogIdentifier();
    [v13 UUID];
    __int16 v31 = v34 = v27;
    *(_DWORD *)buf = 138543874;
    id v45 = v30;
    __int16 v46 = 2112;
    __int16 v47 = v31;
    __int16 v48 = 2112;
    __int16 v49 = v14;
    _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Reader key is missing on accessory: %@", buf, 0x20u);

    uint64_t v27 = v34;
  }

  id v32 = (void *)MEMORY[0x263EFFA08];
  id v22 = [v11 allValues];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  void v42[2] = __116__HMDHomeWalletKeyAccessoryManager_missingWalletKeysForAccessoryUUID_usersByUniqueID_accessoryUsersByUniqueID_flow___block_invoke_230;
  v42[3] = &unk_264A28B50;
  id v43 = v14;
  id v25 = v14;
  __int16 v33 = objc_msgSend(v22, "na_map:", v42);
  id v24 = [v32 setWithArray:v33];

LABEL_5:
  return v24;
}

id __116__HMDHomeWalletKeyAccessoryManager_missingWalletKeysForAccessoryUUID_usersByUniqueID_accessoryUsersByUniqueID_flow___block_invoke_230(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F0E568];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [v4 uuid];

  id v8 = (void *)[v5 initWithAccessoryUUID:v6 userUUID:v7];
  return v8;
}

id __116__HMDHomeWalletKeyAccessoryManager_missingWalletKeysForAccessoryUUID_usersByUniqueID_accessoryUsersByUniqueID_flow___block_invoke_2_232(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) allKeys];
  char v5 = [v4 containsObject:v3];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    int v7 = [*(id *)(a1 + 72) supportsACWGProvisioning];
    id v8 = [v6 credentials];
    id v9 = v8;
    if (v7)
    {
      id v10 = objc_msgSend(v8, "na_map:", &__block_literal_global_236_224484);

      if (![v10 count])
      {
        id v11 = (void *)MEMORY[0x230FBD990]();
        id v12 = *(id *)(a1 + 40);
        id v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = HMFGetLogIdentifier();
          id v15 = [*(id *)(a1 + 48) UUID];
          uint64_t v36 = *(void *)(a1 + 56);
          int v16 = [*(id *)(a1 + 64) objectForKeyedSubscript:v3];
          [v16 uuid];
          v17 = id v38 = v11;
          *(_DWORD *)buf = 138544130;
          id v40 = v14;
          __int16 v41 = 2112;
          __int16 v42 = v15;
          __int16 v43 = 2112;
          uint64_t v44 = v36;
          __int16 v45 = 2112;
          __int16 v46 = v17;
          uint64_t v18 = "%{public}@[Flow: %@] User does not have an issuer key on accessory: %@, user: %@";
LABEL_13:
          _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, v18, buf, 0x2Au);

          id v11 = v38;
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else
    {
      id v10 = objc_msgSend(v8, "na_map:", &__block_literal_global_239_224486);

      if (![v10 count])
      {
        id v11 = (void *)MEMORY[0x230FBD990]();
        id v12 = *(id *)(a1 + 40);
        id v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = HMFGetLogIdentifier();
          id v15 = [*(id *)(a1 + 48) UUID];
          uint64_t v37 = *(void *)(a1 + 56);
          int v16 = [*(id *)(a1 + 64) objectForKeyedSubscript:v3];
          [v16 uuid];
          v17 = id v38 = v11;
          *(_DWORD *)buf = 138544130;
          id v40 = v14;
          __int16 v41 = 2112;
          __int16 v42 = v15;
          __int16 v43 = 2112;
          uint64_t v44 = v37;
          __int16 v45 = 2112;
          __int16 v46 = v17;
          uint64_t v18 = "%{public}@[Flow: %@] User does not have at least 1 RFID credentials on accessory: %@, user: %@";
          goto LABEL_13;
        }
LABEL_14:

        id v31 = objc_alloc(MEMORY[0x263F0E568]);
        uint64_t v32 = *(void *)(a1 + 56);
        __int16 v33 = [*(id *)(a1 + 64) objectForKeyedSubscript:v3];
        uint64_t v34 = [v33 uuid];
        uint64_t v30 = (void *)[v31 initWithAccessoryUUID:v32 userUUID:v34];

        goto LABEL_15;
      }
    }

    uint64_t v30 = 0;
    goto LABEL_15;
  }
  __int16 v19 = (void *)MEMORY[0x230FBD990]();
  id v20 = *(id *)(a1 + 40);
  __int16 v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v22 = HMFGetLogIdentifier();
    __int16 v23 = [*(id *)(a1 + 48) UUID];
    uint64_t v24 = *(void *)(a1 + 56);
    id v25 = [*(id *)(a1 + 64) objectForKeyedSubscript:v3];
    id v26 = [v25 uuid];
    *(_DWORD *)buf = 138544130;
    id v40 = v22;
    __int16 v41 = 2112;
    __int16 v42 = v23;
    __int16 v43 = 2112;
    uint64_t v44 = v24;
    __int16 v45 = 2112;
    __int16 v46 = v26;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Matter user is missing on accessory: %@, user: %@", buf, 0x2Au);
  }
  id v27 = objc_alloc(MEMORY[0x263F0E568]);
  uint64_t v28 = *(void *)(a1 + 56);
  uint64_t v6 = [*(id *)(a1 + 64) objectForKeyedSubscript:v3];
  __int16 v29 = [v6 uuid];
  uint64_t v30 = (void *)[v27 initWithAccessoryUUID:v28 userUUID:v29];

LABEL_15:
  return v30;
}

id __116__HMDHomeWalletKeyAccessoryManager_missingWalletKeysForAccessoryUUID_usersByUniqueID_accessoryUsersByUniqueID_flow___block_invoke_237(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 credentialType];
  int v4 = [v3 isEqualToNumber:*MEMORY[0x263F496A0]];

  if (v4) {
    id v5 = v2;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

id __116__HMDHomeWalletKeyAccessoryManager_missingWalletKeysForAccessoryUUID_usersByUniqueID_accessoryUsersByUniqueID_flow___block_invoke_233(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 credentialType];
  int v4 = [v3 isEqualToNumber:*MEMORY[0x263F49698]];

  if (v4) {
    id v5 = v2;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

uint64_t __116__HMDHomeWalletKeyAccessoryManager_missingWalletKeysForAccessoryUUID_usersByUniqueID_accessoryUsersByUniqueID_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 credentialType];
  uint64_t v3 = HMFEqualObjects();

  return v3;
}

uint64_t __116__HMDHomeWalletKeyAccessoryManager_missingWalletKeysForAccessoryUUID_usersByUniqueID_accessoryUsersByUniqueID_flow___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 userUniqueID];
  uint64_t v3 = HMFEqualObjects();

  return v3;
}

- (id)fetchMissingWalletKeysForAccessory:(id)a3 users:(id)a4 flow:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    id v15 = [v10 UUID];
    *(_DWORD *)buf = 138544130;
    id v39 = v14;
    __int16 v40 = 2112;
    __int16 v41 = v15;
    __int16 v42 = 2112;
    id v43 = v8;
    __int16 v44 = 2112;
    id v45 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching missing wallet keys from accessory: %@, users: %@", buf, 0x2Au);
  }
  if (v8)
  {
    int v16 = objc_msgSend(v9, "na_dictionaryWithKeyGenerator:", &__block_literal_global_219);
    id v17 = [v8 waitForDoorLockClusterObjectWithFlow:v10];
    uint64_t v18 = [v17 naFuture];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __82__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessory_users_flow___block_invoke_2;
    v35[3] = &unk_264A28AA0;
    id v19 = v16;
    id v36 = v19;
    id v20 = v10;
    id v37 = v20;
    __int16 v21 = [v18 flatMap:v35];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __82__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessory_users_flow___block_invoke_3;
    v31[3] = &unk_264A28AE8;
    v31[4] = v12;
    id v32 = v8;
    id v33 = v19;
    id v34 = v20;
    id v22 = v19;
    __int16 v23 = [v21 flatMap:v31];
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = v12;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = HMFGetLogIdentifier();
      uint64_t v28 = [v10 UUID];
      *(_DWORD *)buf = 138543618;
      id v39 = v27;
      __int16 v40 = 2112;
      __int16 v41 = v28;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Returning empty set for nil accessory", buf, 0x16u);
    }
    __int16 v29 = (void *)MEMORY[0x263F58190];
    id v17 = [MEMORY[0x263EFFA08] set];
    __int16 v23 = [v29 futureWithResult:v17];
  }

  return v23;
}

id __82__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessory_users_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 allKeys];
  uint64_t v6 = [v5 arrayByAddingObject:*MEMORY[0x263F497C0]];

  int v7 = [v4 getUsersWithUniqueIDs:v6 flow:*(void *)(a1 + 40)];

  id v8 = [v7 naFuture];

  return v8;
}

id __82__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessory_users_flow___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "na_dictionaryWithKeyGenerator:", &__block_literal_global_223_224498);
  id v4 = [*(id *)(a1 + 32) missingWalletKeysForAccessoryUUID:*(void *)(a1 + 40) usersByUniqueID:*(void *)(a1 + 48) accessoryUsersByUniqueID:v3 flow:*(void *)(a1 + 56)];
  id v5 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v5;
}

uint64_t __82__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessory_users_flow___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 userUniqueID];
}

uint64_t __82__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessory_users_flow___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIDForAccessories];
}

- (id)fetchMissingWalletKeysForUserUUID:(id)a3 flow:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [v7 UUID];
    *(_DWORD *)buf = 138543874;
    __int16 v48 = v11;
    __int16 v49 = 2112;
    uint64_t v50 = v12;
    __int16 v51 = 2112;
    id v52 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching missing wallet keys for user UUID: %@", buf, 0x20u);
  }
  id v13 = [(HMDHomeWalletKeyAccessoryManager *)v9 home];
  id v14 = [v13 userWithUUID:v6];
  id v15 = [v13 accessoriesWithWalletKeySupport];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __75__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForUserUUID_flow___block_invoke;
  v45[3] = &unk_264A28A10;
  id v16 = v14;
  id v46 = v16;
  id v17 = objc_msgSend(v15, "na_filter:", v45);

  if (objc_msgSend(v17, "hmf_isEmpty"))
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = v9;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = HMFGetLogIdentifier();
      [v7 UUID];
      __int16 v23 = v22 = v6;
      *(_DWORD *)buf = 138543618;
      __int16 v48 = v21;
      __int16 v49 = 2112;
      uint64_t v50 = v23;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Did not find any Matter accessories supporting TTU", buf, 0x16u);

      id v6 = v22;
    }

    uint64_t v24 = (void *)MEMORY[0x263F58190];
    id v25 = [MEMORY[0x263EFFA08] set];
    id v26 = [v24 futureWithResult:v25];
  }
  else
  {
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    void v42[2] = __75__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForUserUUID_flow___block_invoke_207;
    v42[3] = &unk_264A28A38;
    void v42[4] = v9;
    id v43 = v16;
    id v38 = v13;
    id v27 = v16;
    id v28 = v6;
    id v29 = v7;
    id v44 = v29;
    uint64_t v30 = objc_msgSend(v17, "na_map:", v42);
    id v31 = (void *)MEMORY[0x263F58190];
    id v32 = [MEMORY[0x263F581B8] immediateScheduler];
    id v33 = [v31 combineAllFutures:v30 ignoringErrors:1 scheduler:v32];
    [v33 flatMap:&__block_literal_global_212_224504];
    uint64_t v35 = v34 = v7;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __75__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForUserUUID_flow___block_invoke_4;
    v39[3] = &unk_264A2ED90;
    v39[4] = v9;
    id v36 = v29;
    id v6 = v28;
    id v16 = v27;
    id v13 = v38;
    id v40 = v36;
    id v41 = v6;
    id v26 = [v35 addCompletionBlock:v39];

    id v7 = v34;
  }

  return v26;
}

uint64_t __75__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForUserUUID_flow___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 uuid];
  v9[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  uint64_t v7 = [v4 areAccessoriesInAllowedList:v6];

  if (v7) {
    uint64_t v7 = [v3 supportsCHIP];
  }

  return v7;
}

id __75__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForUserUUID_flow___block_invoke_207(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)a1[4];
  uint64_t v9 = a1[5];
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:&v9 count:1];
  uint64_t v7 = objc_msgSend(v3, "fetchMissingWalletKeysForAccessory:users:flow:", v5, v6, a1[6], v9, v10);

  return v7;
}

void __75__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForUserUUID_flow___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) UUID];
      uint64_t v13 = *(void *)(a1 + 48);
      int v18 = 138544130;
      id v19 = v11;
      __int16 v20 = 2112;
      __int16 v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      id v25 = v5;
      id v14 = "%{public}@[Flow: %@] Found missing wallet keys for userUUID: %@ missing wallet keys: %@";
      id v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v15, v16, v14, (uint8_t *)&v18, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) UUID];
    uint64_t v17 = *(void *)(a1 + 48);
    int v18 = 138544130;
    id v19 = v11;
    __int16 v20 = 2112;
    __int16 v21 = v12;
    __int16 v22 = 2112;
    uint64_t v23 = v17;
    __int16 v24 = 2112;
    id v25 = v6;
    id v14 = "%{public}@[Flow: %@] Failed to fetch missing wallet keys for userUUID: %@, error: %@";
    id v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }
}

id __75__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForUserUUID_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "na_map:", &__block_literal_global_215);
  id v3 = [MEMORY[0x263EFFA08] setWithArray:v2];
  id v4 = objc_msgSend(v3, "na_setByFlattening");

  id v5 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v5;
}

id __75__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForUserUUID_flow___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)fetchMissingWalletKeysForAccessoryUUID:(id)a3 forUser:(id)a4 flow:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    id v15 = [v10 UUID];
    *(_DWORD *)buf = 138543874;
    id v46 = v14;
    __int16 v47 = 2112;
    __int16 v48 = v15;
    __int16 v49 = 2112;
    id v50 = v8;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching missing wallet keys for accessory UUID: %@", buf, 0x20u);
  }
  os_log_type_t v16 = [(HMDHomeWalletKeyAccessoryManager *)v12 home];
  uint64_t v17 = [v16 accessoryWithUUID:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v18 = v17;
  }
  else {
    int v18 = 0;
  }
  id v19 = v18;

  id v44 = v8;
  __int16 v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
  char v21 = [v9 areAccessoriesInAllowedList:v20];

  if (v21)
  {
    if ([v19 supportsWalletKey])
    {
      __int16 v22 = [v16 users];
      uint64_t v23 = [(HMDHomeWalletKeyAccessoryManager *)v12 fetchMissingWalletKeysForAccessory:v19 users:v22 flow:v10];
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      void v41[2] = __88__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessoryUUID_forUser_flow___block_invoke;
      v41[3] = &unk_264A289E8;
      v41[4] = v12;
      id v42 = v10;
      id v43 = v8;
      __int16 v24 = [v23 addCompletionBlock:v41];

      goto LABEL_16;
    }
    id v32 = (void *)MEMORY[0x230FBD990]();
    id v33 = v12;
    id v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = HMFGetLogIdentifier();
      id v36 = [v10 UUID];
      [v19 uuid];
      v37 = id v40 = v32;
      *(_DWORD *)buf = 138543874;
      id v46 = v35;
      __int16 v47 = 2112;
      __int16 v48 = v36;
      __int16 v49 = 2112;
      id v50 = v37;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not fetching missing wallet keys for accessory that does not support wallet key: %@", buf, 0x20u);

      id v32 = v40;
    }

    id v38 = (void *)MEMORY[0x263F58190];
    __int16 v22 = [MEMORY[0x263EFFA08] set];
    uint64_t v31 = [v38 futureWithResult:v22];
  }
  else
  {
    id v25 = (void *)MEMORY[0x230FBD990]();
    uint64_t v26 = v12;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      id v29 = [v10 UUID];
      *(_DWORD *)buf = 138543874;
      id v46 = v28;
      __int16 v47 = 2112;
      __int16 v48 = v29;
      __int16 v49 = 2112;
      id v50 = v8;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] User is not permitted to operate on accessory as it is not in allowed list : %@", buf, 0x20u);
    }
    uint64_t v30 = (void *)MEMORY[0x263F58190];
    __int16 v22 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2907];
    uint64_t v31 = [v30 futureWithError:v22];
  }
  __int16 v24 = (void *)v31;
LABEL_16:

  return v24;
}

void __88__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessoryUUID_forUser_flow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) UUID];
      uint64_t v13 = *(void *)(a1 + 48);
      int v18 = 138544130;
      id v19 = v11;
      __int16 v20 = 2112;
      char v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      id v25 = v5;
      id v14 = "%{public}@[Flow: %@] Found missing wallet keys for accessoryUUID: %@ missing wallet keys: %@";
      id v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v15, v16, v14, (uint8_t *)&v18, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) UUID];
    uint64_t v17 = *(void *)(a1 + 48);
    int v18 = 138544130;
    id v19 = v11;
    __int16 v20 = 2112;
    char v21 = v12;
    __int16 v22 = 2112;
    uint64_t v23 = v17;
    __int16 v24 = 2112;
    id v25 = v6;
    id v14 = "%{public}@[Flow: %@] Failed to fetch missing wallet keys for accessoryUUID: %@, error: %@";
    id v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }
}

- (id)restoreMissingWalletKeys:(id)a3 onAccessory:(id)a4 flow:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    id v15 = [v10 UUID];
    os_log_type_t v16 = [v9 uuid];
    *(_DWORD *)buf = 138544130;
    id v46 = v14;
    __int16 v47 = 2112;
    __int16 v48 = v15;
    __int16 v49 = 2112;
    id v50 = v8;
    __int16 v51 = 2112;
    id v52 = v16;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Restoring missing wallet keys: %@ on accessory: %@", buf, 0x2Au);
  }
  if ([v9 supportsCHIP])
  {
    id v17 = objc_alloc_init(MEMORY[0x263F58190]);
    int v18 = [v9 supportsMatterWalletKey];
    int v19 = [v18 BOOLValue];

    if (v19) {
      [(HMDHomeWalletKeyAccessoryManager *)v12 configureNFCReaderKeyOnMatterAccessory:v9 flow:v10];
    }
    else {
    id v27 = [MEMORY[0x263F58190] futureWithNoResult];
    }
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    void v42[2] = __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke;
    v42[3] = &unk_264A2F370;
    id v29 = v17;
    id v43 = v29;
    id v30 = v8;
    id v44 = v30;
    uint64_t v31 = [v27 addFailureBlock:v42];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_2;
    v36[3] = &unk_264A289C0;
    id v37 = v30;
    id v38 = v12;
    id v39 = v10;
    id v40 = v9;
    id v32 = v29;
    id v41 = v32;
    id v33 = (id)[v31 addSuccessBlock:v36];

    id v34 = v41;
    id v28 = v32;
  }
  else
  {
    __int16 v20 = (void *)MEMORY[0x230FBD990]();
    char v21 = v12;
    __int16 v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      __int16 v24 = [v10 UUID];
      id v25 = [v9 uuid];
      *(_DWORD *)buf = 138543874;
      id v46 = v23;
      __int16 v47 = 2112;
      __int16 v48 = v24;
      __int16 v49 = 2112;
      id v50 = v25;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not restoring wallet key on non-Matter accessory: %@", buf, 0x20u);
    }
    uint64_t v26 = (void *)MEMORY[0x263F58190];
    id v27 = [MEMORY[0x263EFFA08] set];
    id v28 = [v26 futureWithResult:v27];
  }

  return v28;
}

uint64_t __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

void __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allObjects];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_3;
  v17[3] = &unk_264A288B8;
  id v3 = *(void **)(a1 + 48);
  v17[4] = *(void *)(a1 + 40);
  id v18 = v3;
  id v4 = objc_msgSend(v2, "na_map:", v17);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_191;
  v14[3] = &unk_264A28928;
  void v14[4] = *(void *)(a1 + 40);
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 48);
  id v5 = objc_msgSend(v4, "na_map:", v14);
  id v6 = [v5 combineAllFutures];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_4;
  v9[3] = &unk_264A28998;
  uint64_t v7 = *(void **)(a1 + 48);
  v9[4] = *(void *)(a1 + 40);
  id v10 = v7;
  id v11 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 56);
  id v8 = (id)[v6 addSuccessBlock:v9];
}

id __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v3 userUUID];
  id v6 = [v4 userWithUUID:v5];

  if (!v6)
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) UUID];
      id v12 = [v3 userUUID];
      int v14 = 138543874;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      __int16 v18 = 2112;
      int v19 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to find HMDUser with UUID: %@", (uint8_t *)&v14, 0x20u);
    }
  }

  return v6;
}

id __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_191(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _addIssuerKeyForUser:v3 toMatterAccessory:*(void *)(a1 + 40) flow:*(void *)(a1 + 48)];
  id v5 = [v4 flatMap:&__block_literal_global_195_224524];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_3_196;
  v9[3] = &unk_264A28900;
  id v10 = v3;
  id v6 = v3;
  uint64_t v7 = [v5 recover:v9];

  return v7;
}

void __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_202_224520);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_2_203;
    v12[3] = &unk_264A28970;
    id v13 = *(id *)(a1 + 64);
    id v5 = objc_msgSend(v4, "na_map:", v12);
    id v6 = [v5 asSet];

    [*(id *)(a1 + 48) finishWithResult:v6];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Error while restoring wallet keys: Failed to get results.", buf, 0x16u);
    }
    [*(id *)(a1 + 48) finishWithResult:*(void *)(a1 + 56)];
  }
}

id __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_2_203(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F0E568];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [*(id *)(a1 + 32) uuid];
  uint64_t v7 = (void *)[v5 initWithAccessoryUUID:v6 userUUID:v4];

  return v7;
}

id __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_199(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_3_196(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F58190];
  id v2 = [*(id *)(a1 + 32) uuid];
  id v3 = [v1 futureWithResult:v2];

  return v3;
}

uint64_t __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_2_192()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

- (void)handleRestoreMissingWalletKeysMessage:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 UUID];
    *(_DWORD *)buf = 138543874;
    id v36 = v9;
    __int16 v37 = 2112;
    id v38 = v10;
    __int16 v39 = 2112;
    id v40 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling RestoreMissingWalletKeysMessage: %@", buf, 0x20u);
  }
  uint64_t v11 = *MEMORY[0x263F0CF98];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  id v13 = [v4 unarchivedObjectForKey:v11 ofClasses:v12];

  int v14 = objc_msgSend(v13, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_184_224530);
  id v15 = [(HMDHomeWalletKeyAccessoryManager *)v7 home];
  __int16 v16 = [v4 userForHome:v15];

  id v17 = [v14 allKeys];
  char v18 = [v16 areAccessoriesInAllowedList:v17];

  if (v18)
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __74__HMDHomeWalletKeyAccessoryManager_handleRestoreMissingWalletKeysMessage___block_invoke_185;
    v32[3] = &unk_264A28868;
    v32[4] = v7;
    id v33 = v5;
    int v19 = objc_msgSend(v14, "na_map:", v32);
    uint64_t v20 = [v19 combineAllFutures];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __74__HMDHomeWalletKeyAccessoryManager_handleRestoreMissingWalletKeysMessage___block_invoke_2;
    v30[3] = &unk_264A28890;
    id v31 = v4;
    id v21 = (id)[v20 addSuccessBlock:v30];
  }
  else
  {
    __int16 v22 = (void *)MEMORY[0x230FBD990]();
    uint64_t v23 = v7;
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      [v5 UUID];
      v26 = id v29 = v5;
      id v27 = [v14 allKeys];
      *(_DWORD *)buf = 138543874;
      id v36 = v25;
      __int16 v37 = 2112;
      id v38 = v26;
      __int16 v39 = 2112;
      id v40 = v27;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] User is not permitted to operate on accessory as it is not in allowed list : %@", buf, 0x20u);

      id v5 = v29;
    }

    id v28 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2907];
    [v4 respondWithError:v28];
  }
}

id __74__HMDHomeWalletKeyAccessoryManager_handleRestoreMissingWalletKeysMessage___block_invoke_185(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 home];
  id v9 = [v8 accessoryWithUUID:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  id v12 = [*(id *)(a1 + 32) restoreMissingWalletKeys:v6 onAccessory:v11 flow:*(void *)(a1 + 40)];

  return v12;
}

void __74__HMDHomeWalletKeyAccessoryManager_handleRestoreMissingWalletKeysMessage___block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = [a2 asSet];
  id v4 = objc_msgSend(v3, "na_setByFlattening");

  id v5 = *(void **)(a1 + 32);
  uint64_t v8 = *MEMORY[0x263F0CF98];
  id v6 = encodeRootObject();
  v9[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v5 respondWithPayload:v7];
}

uint64_t __74__HMDHomeWalletKeyAccessoryManager_handleRestoreMissingWalletKeysMessage___block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessoryUUID];
}

- (void)handleFetchMissingWalletKeysMessage:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 UUID];
    *(_DWORD *)buf = 138543874;
    uint64_t v41 = v9;
    __int16 v42 = 2112;
    id v43 = v10;
    __int16 v44 = 2112;
    id v45 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling FetchMissingWalletKeysMessage: %@", buf, 0x20u);
  }
  id v11 = [v4 stringForKey:*MEMORY[0x263F0CF78]];
  id v12 = [v4 stringForKey:*MEMORY[0x263F0CFA0]];
  id v13 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v11];
  uint64_t v14 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v12];
  id v15 = (void *)v14;
  if (v13)
  {
    __int16 v16 = [(HMDHomeWalletKeyAccessoryManager *)v7 home];
    id v17 = [v4 userForHome:v16];

    char v18 = [(HMDHomeWalletKeyAccessoryManager *)v7 fetchMissingWalletKeysForAccessoryUUID:v13 forUser:v17 flow:v5];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke;
    v38[3] = &unk_264A28820;
    id v19 = v4;
    id v39 = v19;
    uint64_t v20 = [v18 addSuccessBlock:v38];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke_2;
    v36[3] = &unk_264A2F3E8;
    id v37 = v19;
    id v21 = (id)[v20 addFailureBlock:v36];
  }
  else if (v14)
  {
    __int16 v22 = [(HMDHomeWalletKeyAccessoryManager *)v7 fetchMissingWalletKeysForUserUUID:v14 flow:v5];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    void v34[2] = __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke_3;
    v34[3] = &unk_264A28820;
    id v23 = v4;
    id v35 = v23;
    __int16 v24 = [v22 addSuccessBlock:v34];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke_4;
    v32[3] = &unk_264A2F3E8;
    id v33 = v23;
    id v25 = (id)[v24 addFailureBlock:v32];

    id v17 = v35;
  }
  else
  {
    uint64_t v26 = (void *)MEMORY[0x230FBD990]();
    id v27 = v7;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      [v5 UUID];
      id v30 = v31 = v26;
      *(_DWORD *)buf = 138543874;
      uint64_t v41 = v29;
      __int16 v42 = 2112;
      id v43 = v30;
      __int16 v44 = 2112;
      id v45 = v4;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Did not find either accessoryUUID or userUUID in message: %@", buf, 0x20u);

      uint64_t v26 = v31;
    }

    id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
    [v4 respondWithError:v17];
  }
}

void __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v4 = *MEMORY[0x263F0CF98];
  id v2 = encodeRootObject();
  v5[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v1 respondWithPayload:v3];
}

uint64_t __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

void __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke_3(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v4 = *MEMORY[0x263F0CF98];
  id v2 = encodeRootObject();
  v5[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v1 respondWithPayload:v3];
}

uint64_t __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

- (void)createAccessoryDeviceCredentialKeyPendingOperationWithAccessories:(id)a3 deviceCredentialKey:(id)a4 user:(id)a5 deviceUUID:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v14);

  id v15 = [MEMORY[0x263EFF9C0] set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v16 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v20), "uuid", (void)v22);
        [v15 addObject:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v18);
  }

  [(HMDHomeWalletKeyAccessoryManager *)self createAccessoryDeviceCredentialKeyPendingOperationWithAccessoriesUUIDs:v15 deviceCredentialKey:v11 user:v12 deviceUUID:v13];
}

- (void)createAccessoryDeviceCredentialKeyPendingOperationWithAccessoriesUUIDs:(id)a3 deviceCredentialKey:(id)a4 user:(id)a5 deviceUUID:(id)a6
{
  id v19 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v13);

  uint64_t v14 = [[HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation alloc] initWithDeviceCredentialKey:v11 accessoriesUUIDs:v12 user:v10];
  id v15 = [(HMDHomeWalletKeyAccessoryManager *)self pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID];
  id v16 = [v15 objectForKeyedSubscript:v19];

  if (v16)
  {
    uint64_t v17 = [v16 operationByMergingWithOperation:v14];

    uint64_t v14 = (HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *)v17;
  }
  uint64_t v18 = [(HMDHomeWalletKeyAccessoryManager *)self pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID];
  [v18 setObject:v14 forKeyedSubscript:v19];
}

- (void)handleFetchWalletKeyColorMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 flow];
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 UUID];
    *(_DWORD *)buf = 138543618;
    id v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling HMHomeFetchWalletKeyColorMessage", buf, 0x16u);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__HMDHomeWalletKeyAccessoryManager_handleFetchWalletKeyColorMessage___block_invoke;
  v12[3] = &unk_264A287F8;
  id v13 = v4;
  id v11 = v4;
  [(HMDHomeWalletKeyAccessoryManager *)v7 fetchWalletKeyColorWithFlow:v5 completion:v12];
}

void __69__HMDHomeWalletKeyAccessoryManager_handleFetchWalletKeyColorMessage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v7 = *MEMORY[0x263F0C8C0];
    v8[0] = a2;
    id v4 = NSDictionary;
    id v5 = a2;
    id v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v3 respondWithPayload:v6];
  }
  else
  {
    [*(id *)(a1 + 32) respondWithError:a3];
    id v6 = 0;
  }
}

- (void)unconfigure
{
  id v3 = [(HMDHomeWalletKeyAccessoryManager *)self messageDispatcher];
  [v3 deregisterReceiver:self];

  id v4 = [(HMDHomeWalletKeyAccessoryManager *)self notificationCenter];
  [v4 removeObserver:self];
}

- (void)handleWalletKeyRemoved
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling wallet key removed", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v8 = [(HMDHomeWalletKeyAccessoryManager *)v5 dataSource];
  id v9 = [(HMDHomeWalletKeyAccessoryManager *)v5 walletKeyColorPreferenceKey];
  [v8 persistNumberValueToNoBackupStore:0 withKey:v9];
}

- (void)fetchWalletKeyColorWithFlow:(id)a3 completion:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  uint64_t v8 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    id v13 = [v6 UUID];
    *(_DWORD *)buf = 138543618;
    id v55 = v12;
    __int16 v56 = 2112;
    id v57 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching wallet key color", buf, 0x16u);
  }
  uint64_t v14 = [(HMDHomeWalletKeyAccessoryManager *)v10 dataSource];
  id v15 = [(HMDHomeWalletKeyAccessoryManager *)v10 walletKeyColorPreferenceKey];
  __int16 v16 = [v14 numberValueFromNoBackupStoreWithKey:v15];

  if (v16)
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = v10;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      id v21 = [v6 UUID];
      *(_DWORD *)buf = 138543618;
      id v55 = v20;
      __int16 v56 = 2112;
      id v57 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Skipping fetch, returning wallet key color from persistent store", buf, 0x16u);
    }
    v7[2](v7, v16, 0);
  }
  else
  {
    long long v22 = [(HMDHomeWalletKeyAccessoryManager *)v10 home];
    long long v23 = [v22 accessoriesWithWalletKeySupport];
    int v24 = objc_msgSend(v23, "na_any:", &__block_literal_global_224542);

    long long v25 = (void *)MEMORY[0x230FBD990]();
    uint64_t v26 = v10;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v28 = HMFGetLogIdentifier();
      [v6 UUID];
      __int16 v49 = v7;
      id v29 = v6;
      v31 = id v30 = v22;
      id v32 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      id v55 = v28;
      __int16 v56 = 2112;
      id v57 = v31;
      __int16 v58 = 2112;
      __int16 v59 = v32;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching wallet key color for home that does have Matter accessories: %@", buf, 0x20u);

      long long v22 = v30;
      id v6 = v29;
      uint64_t v7 = v49;
    }
    if ([(HMDHomeWalletKeyAccessoryManager *)v26 isPrimaryResidentOrSoleOwnerController]|| ((v24 ^ 1) & 1) != 0)
    {
      id v40 = [v22 accessoriesWithWalletKeySupport];
      if ([v40 count])
      {
        [(HMDHomeWalletKeyAccessoryManager *)v26 fetchWalletKeyColorForAccessories:v40 flow:v6 withCompletion:v7];
      }
      else
      {
        __int16 v48 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        ((void (**)(id, void *, void *))v7)[2](v7, 0, v48);
      }
    }
    else
    {
      id v33 = (void *)MEMORY[0x230FBD990]();
      id v34 = v26;
      id v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        id v36 = HMFGetLogIdentifier();
        id v37 = [v6 UUID];
        *(_DWORD *)buf = 138543618;
        id v55 = v36;
        __int16 v56 = 2112;
        id v57 = v37;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Redispatching FetchWalletKeyColorMessage to resident because home has matter accessories", buf, 0x16u);
      }
      id v38 = objc_alloc(MEMORY[0x263F42570]);
      id v39 = [(HMDHomeWalletKeyAccessoryManager *)v34 messageTargetUUID];
      id v40 = (void *)[v38 initWithTarget:v39];

      id v41 = objc_alloc(MEMORY[0x263F42568]);
      uint64_t v42 = *MEMORY[0x263F0C8B8];
      uint64_t v52 = *MEMORY[0x263F42000];
      id v43 = HMFEncodedRootObject();
      uint64_t v53 = v43;
      __int16 v44 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      id v45 = (void *)[v41 initWithName:v42 destination:v40 payload:v44];

      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __75__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorWithFlow_completion___block_invoke_172;
      v50[3] = &unk_264A2B228;
      v50[4] = v34;
      __int16 v51 = v7;
      [v45 setResponseHandler:v50];
      uint64_t v46 = [(HMDHomeWalletKeyAccessoryManager *)v34 messageTargetUUID];
      __int16 v47 = [(HMDHomeWalletKeyAccessoryManager *)v34 workQueue];
      [v22 redispatchToResidentMessage:v45 target:v46 responseQueue:v47];
    }
  }
}

void __75__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorWithFlow_completion___block_invoke_172(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = objc_msgSend(a3, "hmf_numberForKey:", *MEMORY[0x263F0C8C0]);
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) dataSource];
    uint64_t v7 = [*(id *)(a1 + 32) walletKeyColorPreferenceKey];
    [v6 persistNumberValueToNoBackupStore:v5 withKey:v7];

    uint64_t v8 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(v8, "accessoryManager:didUpdateWalletKeyColor:", *(void *)(a1 + 32), objc_msgSend(v5, "integerValue"));
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __75__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorWithFlow_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsCHIP];
}

- (void)configureAllAccessoriesWithDeviceCredentialKey:(id)a3 ofType:(int64_t)a4 flow:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v13);

  id v15 = [(HMDHomeWalletKeyAccessoryManager *)self home];
  uint64_t v14 = [v15 accessoriesWithWalletKeySupport];
  [(HMDHomeWalletKeyAccessoryManager *)self configureAccessories:v14 withDeviceCredentialKey:v12 ofType:a4 flow:v11 completion:v10];
}

- (void)configureAccessory:(id)a3 withDeviceCredentialKey:(id)a4 ofType:(int64_t)a5 flow:(id)a6 completion:(id)a7
{
  v18[1] = *MEMORY[0x263EF8340];
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  __int16 v16 = [(HMDHomeWalletKeyAccessoryManager *)self workQueue];
  dispatch_assert_queue_V2(v16);

  v18[0] = v15;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];

  [(HMDHomeWalletKeyAccessoryManager *)self configureAccessories:v17 withDeviceCredentialKey:v14 ofType:a5 flow:v13 completion:v12];
}

- (void)configureWithHome:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v47 = v8;
    __int16 v48 = 2112;
    id v49 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring with home: %@", buf, 0x16u);
  }
  [(HMDHomeWalletKeyAccessoryManager *)v6 setHome:v4];
  id v9 = [v4 msgDispatcher];
  [(HMDHomeWalletKeyAccessoryManager *)v6 setMessageDispatcher:v9];

  id v10 = [(HMDHomeWalletKeyAccessoryManager *)v6 dataSource];
  int v11 = [v10 isResidentCapable];

  if (v11)
  {
    id v12 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:5 remoteAccessRequired:0];
    id v13 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    id v38 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    id v14 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:4 remoteAccessRequired:0];
    v45[0] = v38;
    v45[1] = v14;
    v45[2] = v13;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
    objc_msgSend(v13, "setRoles:", objc_msgSend(v13, "roles") | 4);
    __int16 v16 = [v4 msgDispatcher];
    v44[0] = v12;
    v44[1] = v13;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
    [v16 registerForMessage:@"HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessage" receiver:v6 policies:v17 selector:sel_handleConfigureAccessoriesWithDeviceCredentialKeyMessage_];

    uint64_t v18 = [v4 msgDispatcher];
    uint64_t v19 = *MEMORY[0x263F0CF70];
    v43[0] = v12;
    v43[1] = v13;
    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
    [v18 registerForMessage:v19 receiver:v6 policies:v20 selector:sel_handleFetchMissingWalletKeysMessage_];

    id v21 = [v4 msgDispatcher];
    uint64_t v22 = *MEMORY[0x263F0CFB0];
    v42[0] = v12;
    v42[1] = v13;
    long long v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
    [v21 registerForMessage:v22 receiver:v6 policies:v23 selector:sel_handleRestoreMissingWalletKeysMessage_];

    int v24 = [v4 msgDispatcher];
    uint64_t v25 = *MEMORY[0x263F0C8B8];
    v41[0] = v12;
    v41[1] = v13;
    uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
    [v24 registerForMessage:v25 receiver:v6 policies:v26 selector:sel_handleFetchWalletKeyColorMessage_];

    uint64_t v27 = [v4 msgDispatcher];
    [v27 registerForMessage:@"HMDHomeConfigureMatterAccessoryWithReaderKeyMessage" receiver:v6 policies:v15 selector:sel_handleHMDHomeConfigureMatterAccessoryWithReaderKeyMessage_];

    id v28 = [v4 msgDispatcher];
    [v28 registerForMessage:@"HMDHomeWalletKeyAccessoryManagerAddIssuerKeysToAccessoriesMessage" receiver:v6 policies:v15 selector:sel__handleAddIssuerKeysToAccessoriesMessage_];
  }
  id v29 = [(HMDHomeWalletKeyAccessoryManager *)v6 notificationCenter];
  [v29 addObserver:v6 selector:sel_handleHomeDidEnableCharacteristicNotification_ name:@"HMDHomeDidEnableCharacteristicNotifyEventNotification" object:v4];

  id v30 = [(HMDHomeWalletKeyAccessoryManager *)v6 notificationCenter];
  [v30 addObserver:v6 selector:sel_handleHomeDidDisableCharacteristicNotification_ name:@"HMDHomeDidDisableCharacteristicNotifyEventNotification" object:v4];

  id v31 = [(HMDHomeWalletKeyAccessoryManager *)v6 notificationCenter];
  id v32 = [v4 residentDeviceManager];
  [v31 addObserver:v6 selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v32];

  id v33 = [(HMDHomeWalletKeyAccessoryManager *)v6 notificationCenter];
  [v33 addObserver:v6 selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:0];

  id v34 = [(HMDHomeWalletKeyAccessoryManager *)v6 notificationCenter];
  [v34 addObserver:v6 selector:sel_handleHomeAccessoryRemovedNotification_ name:@"HMDHomeAccessoryRemovedNotification" object:v4];

  id v35 = [(HMDHomeWalletKeyAccessoryManager *)v6 notificationCenter];
  [v35 addObserver:v6 selector:sel_handleAccessoryCharacteristicsChangedNotification_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:0];

  id v36 = [(HMDHomeWalletKeyAccessoryManager *)v6 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HMDHomeWalletKeyAccessoryManager_configureWithHome___block_invoke;
  block[3] = &unk_264A2F820;
  void block[4] = v6;
  id v40 = v4;
  id v37 = v4;
  dispatch_async(v36, block);
}

uint64_t __54__HMDHomeWalletKeyAccessoryManager_configureWithHome___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentDevicePrimaryResident:", objc_msgSend(*(id *)(a1 + 40), "isCurrentDeviceConfirmedPrimaryResident"));
  id v2 = *(void **)(a1 + 32);
  return [v2 configureNotificationsWithReason:@"configure"];
}

- (HMDHomeWalletKeyAccessoryManager)initWithUUID:(id)a3 workQueue:(id)a4 dataSource:(id)a5 notificationCenter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMDHomeWalletKeyAccessoryManager;
  id v15 = [(HMDHomeWalletKeyAccessoryManager *)&v24 init];
  __int16 v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_uuid, a3);
    objc_storeStrong((id *)&v16->_workQueue, a4);
    objc_storeStrong((id *)&v16->_dataSource, a5);
    objc_storeStrong((id *)&v16->_notificationCenter, a6);
    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    nfcReaderKeyConfigureStateByAccessoryUUID = v16->_nfcReaderKeyConfigureStateByAccessoryUUID;
    v16->_nfcReaderKeyConfigureStateByAccessoryUUID = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID = v16->_pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID;
    v16->_pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID = (NSMutableDictionary *)v19;

    id v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    logEvents = v16->_logEvents;
    v16->_logEvents = v21;

    [MEMORY[0x263F42520] blessWithImplicitContext:v16->_workQueue];
  }

  return v16;
}

- (HMDHomeWalletKeyAccessoryManager)initWithUUID:(id)a3 workQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(HMDHomeWalletDataSource);
  id v9 = [MEMORY[0x263F08A00] defaultCenter];
  id v10 = [(HMDHomeWalletKeyAccessoryManager *)self initWithUUID:v7 workQueue:v6 dataSource:v8 notificationCenter:v9];

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t234 != -1) {
    dispatch_once(&logCategory__hmf_once_t234, &__block_literal_global_381);
  }
  id v2 = (void *)logCategory__hmf_once_v235;
  return v2;
}

void __47__HMDHomeWalletKeyAccessoryManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v235;
  logCategory__hmf_once_v235 = v0;
}

+ (id)createMatterIssuerKeyDataForUser:(id)a3 withUserIndex:(id)a4 flow:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x263F359C8]);
  id v12 = (void *)[objc_alloc(MEMORY[0x263F35A30]) initWithValue:1];
  [v11 setType:v12];

  id v13 = [v8 pairingIdentity];
  id v14 = [v13 publicKey];
  id v15 = [v14 data];
  [v11 setKey:v15];

  id v16 = objc_alloc_init(MEMORY[0x263F359D8]);
  [v16 setIssuerKey:v11];
  id v28 = 0;
  uint64_t v17 = [v16 serializeWithError:&v28];
  id v18 = v28;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = a1;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      long long v23 = v27 = v9;
      [v10 UUID];
      objc_super v24 = v26 = v20;
      *(_DWORD *)buf = 138544386;
      id v30 = v23;
      __int16 v31 = 2112;
      id v32 = v24;
      __int16 v33 = 2112;
      id v34 = v8;
      __int16 v35 = 2048;
      id v36 = v27;
      __int16 v37 = 2112;
      id v38 = v18;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to serialize issuer key for user: %@ with user index: %ld with error: %@", buf, 0x34u);

      uint64_t v20 = v26;
      id v9 = v27;
    }
  }

  return v17;
}

@end