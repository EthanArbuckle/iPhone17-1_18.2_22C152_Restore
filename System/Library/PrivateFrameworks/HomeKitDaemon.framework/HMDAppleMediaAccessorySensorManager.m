@interface HMDAppleMediaAccessorySensorManager
+ (id)logCategory;
- (HMDAppleMediaAccessorySensorManager)initWithWorkQueue:(id)a3;
- (NSString)derivedHAPAccessoryIdentifier;
- (NSUUID)derivedSensorUUID;
- (NSUUID)messageTargetUUID;
- (NSUUID)sensorAccessoryUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (id)derivedHAPAccessoryIdentifierDataForHostUUID:(id)a3;
- (id)derivedSensorUUIDForHostUUID:(id)a3;
- (id)logIdentifier;
- (os_unfair_lock_s)derivedHAPAccessoryIdentifierData;
- (void)_checkIfCharacteristicsUpdateServiceName:(void *)a3 sensorUUID:;
- (void)_migrateToDataStoreIfNeeded:(id)a3 completion:(id)a4;
- (void)_readCharacteristicAndUpdateNameIfNeeded:(void *)a1;
- (void)_readDefaultSensorNameAndUpdateToNameIfNeeded:(void *)a3 service:(void *)a4 accessoryUUID:;
- (void)_removeExistingSensorAccessories:(void *)a3 completion:;
- (void)_removeExistingSensorAccessoriesAndPair:(void *)a1;
- (void)_resetSensorPairingAndPair;
- (void)_resetWithCompletion:(uint64_t)a1;
- (void)_updateServiceName:(void *)a3 service:(void *)a4 accessoryUUID:;
- (void)_updateServiceNameIfRequired;
- (void)checkPairingStateAndStartADKIfUnpaired:(void *)a1;
- (void)cleanUpExistingAccessoriesAndStartADKIfReady;
- (void)configureWithDataSource:(id)a3 hpsXPCClient:(id)a4 dataStore:(id)a5;
- (void)doesAccessoryMatchDerivedAccessory:(void *)a1;
- (void)fetchADKSensorStatusCompletion:(id)a3;
- (void)handleAccessoryAdded:(id)a3;
- (void)handleCharacteristicsChangedNotification:(id)a3;
- (void)handleErrorCaseTestMessage:(id)a3;
- (void)localAccessoryAddRequiresConsent:(id)a3;
- (void)logPairingSuccess:(void *)a3 error:(uint64_t)a4 setupFailureReason:;
- (void)managerIsReadyToBePaired;
- (void)setIsCurrentlyPairing:(uint64_t)a1;
- (void)setSensorAccessoryUUID:(uint64_t)a1;
- (void)setShouldUseDerivedSensorUUID:(uint64_t)a1;
- (void)startSensorClientWithCompletion:(uint64_t)a1;
@end

@implementation HMDAppleMediaAccessorySensorManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
  objc_storeStrong((id *)&self->_renamedServiceIDs, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_setupDescription, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_sensorClient, 0);
  objc_storeStrong((id *)&self->_sensorAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_derivedHAPAccessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_derivedHAPAccessoryIdentifierData, 0);
  objc_storeStrong((id *)&self->_derivedSensorUUID, 0);
}

- (id)logIdentifier
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  v4 = [WeakRetained hostUUIDForAppleMediaAccessorySensorManager:self];
  v5 = [v4 UUIDString];
  v6 = v5;
  if (!v5) {
    v5 = &stru_26E2EB898;
  }
  v7 = v5;

  return v7;
}

- (void)managerIsReadyToBePaired
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@HPSManagerDelegate: manager is ready to be paired", (uint8_t *)&v8, 0xCu);
  }
  [(HMDAppleMediaAccessorySensorManager *)v4 cleanUpExistingAccessoriesAndStartADKIfReady];
}

- (void)cleanUpExistingAccessoriesAndStartADKIfReady
{
  if (a1)
  {
    Property = objc_getProperty(a1, a2, 96, 1);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__HMDAppleMediaAccessorySensorManager_cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = a1;
    dispatch_async(Property, block);
  }
}

void __83__HMDAppleMediaAccessorySensorManager_cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 96, 1);
    dispatch_assert_queue_V2(Property);
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 72));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      if ([WeakRetained isResidentConfirmedForAppleMediaAccessorySensorManager:v2])
      {
        if ([v5 isReadyForSensorPairing:v2])
        {
          v6 = [v5 hostUUIDForAppleMediaAccessorySensorManager:v2];
          v7 = [v5 accessoriesWithHostUUID:v6 forAppleMediaAccessorySensorManager:v2];
          *(void *)&long long v42 = MEMORY[0x263EF8330];
          *((void *)&v42 + 1) = 3221225472;
          v43 = __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke;
          v44 = &unk_264A27218;
          uint64_t v45 = v2;
          int v8 = objc_msgSend(v7, "na_filter:", &v42);

          if ([v8 count])
          {
            v9 = [(id)v2 sensorAccessoryUUID];
            BOOL v10 = v9 == 0;

            if (v10)
            {
              v29 = (void *)MEMORY[0x230FBD990]();
              id v30 = (id)v2;
              v31 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                v32 = HMFGetLogIdentifier();
                LODWORD(v38) = 138543362;
                *(void *)((char *)&v38 + 4) = v32;
                _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Removing unexpected sensor accessories as no sensor should be paired", (uint8_t *)&v38, 0xCu);
              }
              -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessoriesAndPair:](v30, v8);
              goto LABEL_29;
            }
            *(void *)&long long v38 = MEMORY[0x263EF8330];
            *((void *)&v38 + 1) = 3221225472;
            v39 = __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_37;
            v40 = &unk_264A27218;
            uint64_t v41 = v2;
            v11 = objc_msgSend(v8, "na_filter:", &v38);
            if ([v11 count])
            {
              v12 = (void *)MEMORY[0x230FBD990]();
              id v13 = (id)v2;
              v14 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                v15 = HMFGetLogIdentifier();
                LODWORD(buf) = 138543362;
                *(void *)((char *)&buf + 4) = v15;
                _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Removing unexpected sensor accessories", (uint8_t *)&buf, 0xCu);
              }
              -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v13, v11, 0);
            }
          }
          os_unfair_lock_lock_with_options();
          int v16 = *(unsigned __int8 *)(v2 + 40);
          os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
          if (v16)
          {
            v17 = (void *)MEMORY[0x230FBD990]();
            id v18 = (id)v2;
            v19 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              v20 = HMFGetLogIdentifier();
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v20;
              _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not checking HomePod sensor pairing status", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            objc_initWeak(&location, (id)v2);
            id v28 = objc_getProperty((id)v2, v27, 64, 1);
            *(void *)&long long buf = MEMORY[0x263EF8330];
            *((void *)&buf + 1) = 3221225472;
            v35 = __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_38;
            v36 = &unk_264A1E530;
            objc_copyWeak(v37, &location);
            [v28 isReadyToPairWithCompletion:&buf];

            objc_destroyWeak(v37);
            objc_destroyWeak(&location);
          }
LABEL_29:

          goto LABEL_30;
        }
        v21 = (void *)MEMORY[0x230FBD990]();
        id v22 = (id)v2;
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v26 = HMFGetLogIdentifier();
          LODWORD(v42) = 138543362;
          *(void *)((char *)&v42 + 4) = v26;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Cannot pair/check sensors yet as data source is not ready for pairing", (uint8_t *)&v42, 0xCu);
        }
      }
      else
      {
        v21 = (void *)MEMORY[0x230FBD990]();
        id v22 = (id)v2;
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v25 = HMFGetLogIdentifier();
          LODWORD(v42) = 138543362;
          *(void *)((char *)&v42 + 4) = v25;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Cannot pair/check sensors yet as no primary is confirmed", (uint8_t *)&v42, 0xCu);
        }
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = (id)v2;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        LODWORD(v42) = 138543362;
        *(void *)((char *)&v42 + 4) = v24;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot check and clean up existing HomePod sensor pairings with nil data source", (uint8_t *)&v42, 0xCu);
      }
    }

LABEL_30:
  }
}

uint64_t __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke(uint64_t a1, void *a2)
{
  return -[HMDAppleMediaAccessorySensorManager doesAccessoryMatchDerivedAccessory:](*(void **)(a1 + 32), a2) ^ 1;
}

- (void)_removeExistingSensorAccessoriesAndPair:(void *)a1
{
  id v3 = a2;
  Property = objc_getProperty(a1, v4, 96, 1);
  dispatch_assert_queue_V2(Property);
  objc_initWeak(&location, a1);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessoriesAndPair___block_invoke;
  v6[3] = &unk_264A2C170;
  objc_copyWeak(&v7, &location);
  -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](a1, v3, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_37(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  SEL v4 = [*(id *)(a1 + 32) sensorAccessoryUUID];
  uint64_t v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4) ^ 1;

  return v5;
}

- (void)_removeExistingSensorAccessories:(void *)a3 completion:
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v22 = a2;
  id v21 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v5, 96, 1);
    dispatch_assert_queue_V2(Property);
    group = dispatch_group_create();
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      long long v38 = v10;
      __int16 v39 = 2112;
      id v40 = v22;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Removing HomePod sensor accessories %@", buf, 0x16u);
    }
    objc_initWeak(&location, v8);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v22;
    uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (-[HMDAppleMediaAccessorySensorManager doesAccessoryMatchDerivedAccessory:](v8, v14))
          {
            v15 = (void *)MEMORY[0x230FBD990]();
            id v16 = v8;
            HMFGetOSLogHandle();
            v17 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              id v18 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = 138543618;
              long long v38 = v18;
              __int16 v39 = 2112;
              id v40 = v14;
              _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Not removing derived HomePod sensor accessory %@", buf, 0x16u);
            }
          }
          else
          {
            dispatch_group_enter(group);
            v27[0] = MEMORY[0x263EF8330];
            v27[1] = 3221225472;
            v27[2] = __83__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessories_completion___block_invoke;
            v27[3] = &unk_264A2B420;
            objc_copyWeak(&v30, &location);
            id v28 = group;
            v29 = v14;
            objc_msgSend(v14, "sendRemovalRequestWithCompletion:", v27, v21);

            objc_destroyWeak(&v30);
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v11);
    }

    v20 = objc_getProperty(v8, v19, 96, 1);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessories_completion___block_invoke_46;
    block[3] = &unk_264A2F870;
    block[4] = v8;
    id v26 = v21;
    dispatch_group_notify(group, v20, block);

    objc_destroyWeak(&location);
  }
}

void __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_38(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SEL v4 = WeakRetained;
  if (a2)
  {
    -[HMDAppleMediaAccessorySensorManager checkPairingStateAndStartADKIfUnpaired:](WeakRetained, (const char *)1);
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = v4;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      BOOL v10 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Not starting HomePod Sensor pairing as homepodsensed is not ready", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)checkPairingStateAndStartADKIfUnpaired:(void *)a1
{
  if (a1)
  {
    char v2 = (char)a2;
    Property = objc_getProperty(a1, a2, 96, 1);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __78__HMDAppleMediaAccessorySensorManager_checkPairingStateAndStartADKIfUnpaired___block_invoke;
    v5[3] = &unk_264A2B870;
    v5[4] = a1;
    char v6 = v2;
    dispatch_async(Property, v5);
  }
}

void __78__HMDAppleMediaAccessorySensorManager_checkPairingStateAndStartADKIfUnpaired___block_invoke(uint64_t a1, const char *a2)
{
  char v2 = *(void **)(a1 + 32);
  if (v2)
  {
    char v3 = *(unsigned char *)(a1 + 40);
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 96, 1);
    dispatch_assert_queue_V2(Property);
    objc_initWeak(&location, v2);
    id v6 = objc_getProperty(v2, v5, 64, 1);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __79__HMDAppleMediaAccessorySensorManager__checkPairingStateAndStartADKIfUnpaired___block_invoke;
    v7[3] = &unk_264A19928;
    objc_copyWeak(&v8, &location);
    char v9 = v3;
    [v6 isPairedWithCompletion:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __79__HMDAppleMediaAccessorySensorManager__checkPairingStateAndStartADKIfUnpaired___block_invoke(uint64_t a1, int a2, char a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (!a2 || !WeakRetained)
  {
    char v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = v8;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      LODWORD(v14) = 138543362;
      *(void *)((char *)&v14 + 4) = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to check sensor pairing due to xpc client error", (uint8_t *)&v14, 0xCu);
    }
  }
  if (a2 && (a3 & 1) != 0 || !*(unsigned char *)(a1 + 40))
  {
    if (a2 && v8)
    {
      Property = objc_getProperty(v8, v7, 96, 1);
      *(void *)&long long v14 = MEMORY[0x263EF8330];
      *((void *)&v14 + 1) = 3221225472;
      v15 = __71__HMDAppleMediaAccessorySensorManager_performPairingFromPairingStatus___block_invoke;
      id v16 = &unk_264A2B870;
      v17 = v8;
      char v18 = a3;
      goto LABEL_14;
    }
  }
  else if (v8)
  {
    Property = objc_getProperty(v8, v7, 96, 1);
    *(void *)&long long v14 = MEMORY[0x263EF8330];
    *((void *)&v14 + 1) = 3221225472;
    v15 = __67__HMDAppleMediaAccessorySensorManager_startADKAndCheckPairingState__block_invoke;
    id v16 = &unk_264A2F7F8;
    v17 = v8;
LABEL_14:
    dispatch_async(Property, &v14);
  }
}

void __71__HMDAppleMediaAccessorySensorManager_performPairingFromPairingStatus___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return;
  }
  int v3 = *(unsigned __int8 *)(a1 + 40);
  Property = objc_getProperty(*(id *)(a1 + 32), a2, 96, 1);
  dispatch_assert_queue_V2(Property);
  os_unfair_lock_lock_with_options();
  int v5 = *(unsigned __int8 *)(v2 + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  if (!v5)
  {
    id v10 = (id *)(v2 + 72);
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 72));
    if (!WeakRetained)
    {
      id v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = (id)v2;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v24;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform HomePod sensor pairing with nil data source", buf, 0xCu);
      }
      goto LABEL_55;
    }
    uint64_t v12 = [(id)v2 sensorAccessoryUUID];

    if (v12)
    {
      id v13 = [(id)v2 sensorAccessoryUUID];
      long long v14 = [WeakRetained accessoryWithUUID:v13 forAppleMediaAccessorySensorManager:v2];

      if (!v14)
      {
        long long v32 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v2, 0, v32, 1);

        long long v33 = (void *)MEMORY[0x230FBD990]();
        id v34 = (id)v2;
        v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = HMFGetLogIdentifier();
          v37 = [v34 sensorAccessoryUUID];
          *(_DWORD *)long long buf = 138543618;
          *(void *)&uint8_t buf[4] = v36;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v37;
          _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@HomePod sensor is missing, expected accessory with UUID: %@", buf, 0x16u);
        }
        __int16 v39 = objc_getProperty(v34, v38, 96, 1);
        dispatch_assert_queue_V2(v39);
        id v40 = objc_loadWeakRetained(v10);
        if (v40)
        {
          uint64_t v41 = [v34 sensorAccessoryUUID];
          uint64_t v42 = [v40 residentSyncClientDidSyncFutureForAppleMediaAccessorySensorManager:v34];
          v43 = (void *)v42;
          if (v42)
          {
            v44 = (void *)MEMORY[0x263F42538];
            uint64_t v89 = v42;
            uint64_t v45 = [v40 firstCloudKitImportFutureForAppleMediaAccessorySensorManager:v34];
            uint64_t v90 = (uint64_t)v45;
            uint64_t v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v89 count:2];
            v47 = [v44 allSettled:v46];

            objc_initWeak(&location, v34);
            id v48 = objc_alloc(MEMORY[0x263F42520]);
            id v50 = objc_getProperty(v34, v49, 96, 1);
            v51 = (void *)[v48 initWithQueue:v50];

            *(void *)long long buf = MEMORY[0x263EF8330];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __57__HMDAppleMediaAccessorySensorManager__recoverLostSensor__block_invoke;
            v85 = &unk_264A19950;
            objc_copyWeak(v88, &location);
            id v86 = v41;
            id v87 = v40;
            id v52 = (id)[v47 inContext:v51 then:buf];

            objc_destroyWeak(v88);
            objc_destroyWeak(&location);
          }
          else
          {
            v75 = (void *)MEMORY[0x230FBD990]();
            id v76 = v34;
            v77 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            {
              v78 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = 138543362;
              *(void *)&uint8_t buf[4] = v78;
              _os_log_impl(&dword_22F52A000, v77, OS_LOG_TYPE_ERROR, "%{public}@Resident sync future was nil", buf, 0xCu);
            }
          }
        }
        else
        {
          v70 = (void *)MEMORY[0x230FBD990]();
          id v71 = v34;
          v72 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            v73 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            *(void *)&uint8_t buf[4] = v73;
            _os_log_impl(&dword_22F52A000, v72, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform HomePod sensor recovery with nil data source", buf, 0xCu);
          }
        }

        goto LABEL_55;
      }
      if (v3)
      {
LABEL_10:
        if (v14)
        {
          id v16 = (void *)MEMORY[0x230FBD990]();
          id v17 = (id)v2;
          char v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v19 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543618;
            *(void *)&uint8_t buf[4] = v19;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v14;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEBUG, "%{public}@HomePod sensor (%@) is already paired -- no action needed", buf, 0x16u);
          }
          [(HMDAppleMediaAccessorySensorManager *)(id *)v17 _updateServiceNameIfRequired];

          goto LABEL_55;
        }
LABEL_31:
        v53 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v2, 0, v53, 2);

        v54 = (void *)MEMORY[0x230FBD990]();
        id v55 = (id)v2;
        v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v57 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543362;
          *(void *)&uint8_t buf[4] = v57;
          _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_ERROR, "%{public}@HomePod sensor is paired but not to any accessory in the home, resetting pairing", buf, 0xCu);
        }
        [(HMDAppleMediaAccessorySensorManager *)v55 _resetSensorPairingAndPair];
        goto LABEL_55;
      }
    }
    else
    {
      os_unfair_lock_lock_with_options();
      int v25 = *(unsigned __int8 *)(v2 + 42);
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
      if (!v25)
      {
        if (v3) {
          goto LABEL_31;
        }
LABEL_34:
        v59 = objc_getProperty((id)v2, v15, 96, 1);
        dispatch_assert_queue_V2(v59);
        id v60 = objc_loadWeakRetained((id *)(v2 + 72));
        if (v60)
        {
          os_unfair_lock_lock_with_options();
          if (!*(unsigned char *)(v2 + 40))
          {
            *(unsigned char *)(v2 + 40) = 1;
            [MEMORY[0x263F499B8] currentTime];
            *(void *)(v2 + 56) = v79;
            [*(id *)(v2 + 112) removeAllObjects];
            os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
            v80 = [MEMORY[0x263F58190] futureWithNoResult];
            *(void *)long long buf = MEMORY[0x263EF8330];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke;
            v85 = &unk_264A2F398;
            id v86 = (id)v2;
            id v81 = (id)[v80 addSuccessBlock:buf];
            uint64_t v89 = MEMORY[0x263EF8330];
            uint64_t v90 = 3221225472;
            v91 = __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_59;
            v92 = &unk_264A2F3E8;
            uint64_t v93 = v2;
            id v82 = (id)[v80 addFailureBlock:&v89];

            goto LABEL_54;
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
          v61 = (void *)MEMORY[0x230FBD990]();
          id v62 = (id)v2;
          v63 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            v64 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            *(void *)&uint8_t buf[4] = v64;
            _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_INFO, "%{public}@Not starting HomePod Sensor pairing as a pairing is already in progress", buf, 0xCu);
          }
        }
        else
        {
          v61 = (void *)MEMORY[0x230FBD990]();
          id v62 = (id)v2;
          v63 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            v74 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            *(void *)&uint8_t buf[4] = v74;
            _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform HomePod sensor pairing with nil data source", buf, 0xCu);
          }
        }

LABEL_54:

LABEL_55:
        return;
      }
      id v26 = [(id)v2 derivedSensorUUID];
      long long v14 = [WeakRetained accessoryWithUUID:v26 forAppleMediaAccessorySensorManager:v2];

      if (v3) {
        goto LABEL_10;
      }
    }
    if (v14)
    {
      SEL v27 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v2, 0, v27, 3);

      os_unfair_lock_lock_with_options();
      LODWORD(v27) = *(unsigned __int8 *)(v2 + 42);
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
      if (!v27
        || (-[HMDAppleMediaAccessorySensorManager doesAccessoryMatchDerivedAccessory:]((void *)v2, v14) & 1) == 0)
      {
        v65 = (void *)MEMORY[0x230FBD990]();
        id v66 = (id)v2;
        v67 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          v68 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          *(void *)&uint8_t buf[4] = v68;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v14;
          _os_log_impl(&dword_22F52A000, v67, OS_LOG_TYPE_ERROR, "%{public}@HomePod sensor is not paired but there is a paired accessory in the home, removing existing sensor: %@", buf, 0x16u);
        }
        *(void *)long long buf = v14;
        v69 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:1];
        -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessoriesAndPair:](v66, v69);

        goto LABEL_55;
      }
      id v28 = (void *)MEMORY[0x230FBD990]();
      id v29 = (id)v2;
      id v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        long long v31 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v31;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@HomePod sensor is not paired but there is a paired derived accessory in the home. Running pairing again. %@", buf, 0x16u);
      }
    }
    goto LABEL_34;
  }
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = (id)v2;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    char v9 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not checking HomePod sensor pairing status", buf, 0xCu);
  }
}

- (void)logPairingSuccess:(void *)a3 error:(uint64_t)a4 setupFailureReason:
{
  if (a1)
  {
    id v7 = (id *)(a1 + 72);
    id v8 = a3;
    id WeakRetained = objc_loadWeakRetained(v7);
    id v13 = [WeakRetained logSubmitterForAppleMediaAccessorySensorManager:a1];

    id v10 = [HMDHomePodSensorPairingLogEvent alloc];
    os_unfair_lock_lock_with_options();
    double v11 = *(double *)(a1 + 56);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    uint64_t v12 = [(HMDHomePodSensorPairingLogEvent *)v10 initWithStartTime:a2 pairingSuccess:a4 failureReason:v11];
    [v13 submitLogEvent:v12 error:v8];
  }
}

- (void)doesAccessoryMatchDerivedAccessory:(void *)a1
{
  id v3 = a2;
  SEL v4 = v3;
  if (a1)
  {
    int v5 = [v3 identifier];
    id v6 = [a1 derivedHAPAccessoryIdentifier];
    if ([v5 isEqualToString:v6])
    {
      id v7 = [v4 uuid];
      id v8 = [a1 derivedSensorUUID];
      a1 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (void)_resetSensorPairingAndPair
{
  if (a1)
  {
    Property = objc_getProperty(a1, a2, 96, 1);
    dispatch_assert_queue_V2(Property);
    objc_initWeak(&location, a1);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __65__HMDAppleMediaAccessorySensorManager__resetSensorPairingAndPair__block_invoke;
    v4[3] = &unk_264A1E530;
    objc_copyWeak(&v5, &location);
    -[HMDAppleMediaAccessorySensorManager _resetWithCompletion:]((uint64_t)a1, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_updateServiceNameIfRequired
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (a1)
  {
    Property = objc_getProperty(a1, a2, 96, 1);
    dispatch_assert_queue_V2(Property);
    SEL v4 = [a1 sensorAccessoryUUID];
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 9);
      id v6 = [WeakRetained accessoryWithUUID:v4 forAppleMediaAccessorySensorManager:a1];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
      id v8 = v7;

      if (v8)
      {
        char v9 = [v8 uuid];
        int v10 = objc_msgSend(v9, "hmf_isEqualToUUID:", v4);

        if (v10)
        {
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v22 = v8;
          double v11 = [v8 services];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v28;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v28 != v14) {
                  objc_enumerationMutation(v11);
                }
                id v16 = *(void **)(*((void *)&v27 + 1) + 8 * v15);
                long long v23 = 0u;
                long long v24 = 0u;
                long long v25 = 0u;
                long long v26 = 0u;
                id v17 = [v16 characteristics];
                uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
                if (v18)
                {
                  uint64_t v19 = v18;
                  uint64_t v20 = *(void *)v24;
                  do
                  {
                    uint64_t v21 = 0;
                    do
                    {
                      if (*(void *)v24 != v20) {
                        objc_enumerationMutation(v17);
                      }
                      -[HMDAppleMediaAccessorySensorManager _checkIfCharacteristicsUpdateServiceName:sensorUUID:]((uint64_t)a1, *(void **)(*((void *)&v23 + 1) + 8 * v21++), v4);
                    }
                    while (v19 != v21);
                    uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
                  }
                  while (v19);
                }

                ++v15;
              }
              while (v15 != v13);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
            }
            while (v13);
          }

          id v8 = v22;
        }
      }
    }
  }
}

- (void)_checkIfCharacteristicsUpdateServiceName:(void *)a3 sensorUUID:
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  Property = objc_getProperty((id)a1, v7, 96, 1);
  dispatch_assert_queue_V2(Property);
  char v9 = [v5 service];
  if (v9)
  {
    os_unfair_lock_lock_with_options();
    int v10 = *(void **)(a1 + 112);
    double v11 = [v9 instanceID];
    LOBYTE(v10) = [v10 containsObject:v11];

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if ((v10 & 1) == 0)
    {
      uint64_t v12 = [v5 accessory];
      uint64_t v13 = v12;
      if (v12)
      {
        uint64_t v14 = [v12 uuid];
        if (objc_msgSend(v14, "hmf_isEqualToUUID:", v6))
        {
          uint64_t v15 = [v5 type];
          int v16 = [v15 isEqualToString:*MEMORY[0x263F0C298]];

          if (v16)
          {
            id v17 = [v5 value];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v18 = v17;
            }
            else {
              uint64_t v18 = 0;
            }
            id v19 = v18;

            if (v19)
            {
              uint64_t v20 = [v9 getConfiguredName];

              if (v20)
              {
                -[HMDAppleMediaAccessorySensorManager _readDefaultSensorNameAndUpdateToNameIfNeeded:service:accessoryUUID:]((void *)a1, v19, v9, v6);
              }
              else
              {
                uint64_t v33 = (void *)MEMORY[0x230FBD990]();
                id v34 = (id)a1;
                v35 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  v36 = HMFGetLogIdentifier();
                  int v37 = 138543618;
                  SEL v38 = v36;
                  __int16 v39 = 2112;
                  id v40 = v9;
                  _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Renaming sensor service as it has no configured name: %@ ", (uint8_t *)&v37, 0x16u);
                }
                -[HMDAppleMediaAccessorySensorManager _updateServiceName:service:accessoryUUID:]((uint64_t)v34, v19, v9, v6);
              }
            }
            else
            {
              long long v29 = (void *)MEMORY[0x230FBD990]();
              id v30 = (id)a1;
              long long v31 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                long long v32 = HMFGetLogIdentifier();
                int v37 = 138543874;
                SEL v38 = v32;
                __int16 v39 = 2112;
                id v40 = v9;
                __int16 v41 = 2112;
                id v42 = v5;
                _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Name for sensor service is nil %@/%@", (uint8_t *)&v37, 0x20u);
              }
              -[HMDAppleMediaAccessorySensorManager _readCharacteristicAndUpdateNameIfNeeded:](v30, v5);
            }
          }
        }
        else
        {
        }
      }
      else
      {
        long long v25 = (void *)MEMORY[0x230FBD990]();
        id v26 = (id)a1;
        long long v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          long long v28 = HMFGetLogIdentifier();
          int v37 = 138543618;
          SEL v38 = v28;
          __int16 v39 = 2112;
          id v40 = v5;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@No accessory for characteristic: %@", (uint8_t *)&v37, 0x16u);
        }
      }
    }
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = (id)a1;
    long long v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v24 = HMFGetLogIdentifier();
      int v37 = 138543618;
      SEL v38 = v24;
      __int16 v39 = 2112;
      id v40 = v5;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@No service for characteristic: %@", (uint8_t *)&v37, 0x16u);
    }
  }
}

- (void)_readCharacteristicAndUpdateNameIfNeeded:(void *)a1
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  Property = objc_getProperty(a1, v4, 96, 1);
  dispatch_assert_queue_V2(Property);
  id v6 = [v3 accessory];
  SEL v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = a1;
  char v9 = HMFGetOSLogHandle();
  int v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v3 service];
      *(_DWORD *)long long buf = 138543874;
      id v22 = v11;
      __int16 v23 = 2112;
      id v24 = v12;
      __int16 v25 = 2112;
      id v26 = v3;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Locally reading name for sensor service %@/%@", buf, 0x20u);
    }
    uint64_t v13 = +[HMDCharacteristicRequest requestWithCharacteristic:v3];
    uint64_t v20 = v13;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    id v16 = objc_getProperty(v8, v15, 96, 1);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __80__HMDAppleMediaAccessorySensorManager__readCharacteristicAndUpdateNameIfNeeded___block_invoke;
    v18[3] = &unk_264A2CEA8;
    v18[4] = v8;
    id v19 = v3;
    [v6 readCharacteristicValues:v14 source:7 queue:v16 completionHandler:v18];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v22 = v17;
      __int16 v23 = 2112;
      id v24 = v3;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@No accessory for characteristic: %@", buf, 0x16u);
    }
  }
}

- (void)_updateServiceName:(void *)a3 service:(void *)a4 accessoryUUID:
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    Property = objc_getProperty((id)a1, v9, 96, 1);
    dispatch_assert_queue_V2(Property);
    os_unfair_lock_lock_with_options();
    uint64_t v12 = *(void **)(a1 + 112);
    uint64_t v13 = [v8 instanceID];
    LOBYTE(v12) = [v12 containsObject:v13];

    if (v12)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    }
    else
    {
      uint64_t v14 = *(void **)(a1 + 112);
      SEL v15 = [v8 instanceID];
      [v14 addObject:v15];

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = (id *)(id)a1;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = HMFGetLogIdentifier();
        int v21 = 138544130;
        id v22 = v19;
        __int16 v23 = 2112;
        id v24 = v8;
        __int16 v25 = 2112;
        id v26 = v10;
        __int16 v27 = 2112;
        id v28 = v7;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Renaming service %@ on accessory %@ to %@ after sensor pairing", (uint8_t *)&v21, 0x2Au);
      }
      id WeakRetained = objc_loadWeakRetained(v17 + 9);
      [WeakRetained renameService:v8 name:v7];
    }
  }
}

- (void)_readDefaultSensorNameAndUpdateToNameIfNeeded:(void *)a3 service:(void *)a4 accessoryUUID:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  Property = objc_getProperty(a1, v10, 96, 1);
  dispatch_assert_queue_V2(Property);
  id v13 = objc_getProperty(a1, v12, 64, 1);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __107__HMDAppleMediaAccessorySensorManager__readDefaultSensorNameAndUpdateToNameIfNeeded_service_accessoryUUID___block_invoke;
  v17[3] = &unk_264A199C8;
  v17[4] = a1;
  id v14 = v7;
  id v18 = v14;
  id v15 = v8;
  id v19 = v15;
  id v16 = v9;
  id v20 = v16;
  [v13 getSensorName:v17];
}

void __107__HMDAppleMediaAccessorySensorManager__readDefaultSensorNameAndUpdateToNameIfNeeded_service_accessoryUUID___block_invoke(id *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  SEL v4 = v3;
  if (v3)
  {
    if (([v3 isEqualToString:a1[5]] & 1) == 0)
    {
      id v5 = [a1[6] getConfiguredName];
      if ([v5 isEqualToString:v4])
      {
      }
      else
      {
        double v11 = [a1[6] name];
        int v12 = [v11 isEqualToString:v4];

        if (!v12) {
          goto LABEL_12;
        }
      }
      id v13 = a1[4];
      if (v13)
      {
        Property = objc_getProperty(v13, v6, 96, 1);
        id v15 = a1[4];
      }
      else
      {
        id v15 = 0;
        Property = 0;
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __107__HMDAppleMediaAccessorySensorManager__readDefaultSensorNameAndUpdateToNameIfNeeded_service_accessoryUUID___block_invoke_76;
      block[3] = &unk_264A2E908;
      block[4] = v15;
      id v17 = a1[6];
      id v18 = v4;
      id v19 = a1[5];
      id v20 = a1[7];
      dispatch_async(Property, block);
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      SEL v10 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v22 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Fetched nil sensor name from adk", buf, 0xCu);
    }
  }
LABEL_12:
}

void __107__HMDAppleMediaAccessorySensorManager__readDefaultSensorNameAndUpdateToNameIfNeeded_service_accessoryUUID___block_invoke_76(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  SEL v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) name];
    id v7 = [*(id *)(a1 + 40) getConfiguredName];
    uint64_t v8 = *(void *)(a1 + 48);
    int v9 = 138544130;
    SEL v10 = v5;
    __int16 v11 = 2112;
    int v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Renaming sensor service as name (%@) or configured name (%@) matches default accessory name: %@", (uint8_t *)&v9, 0x2Au);
  }
  -[HMDAppleMediaAccessorySensorManager _updateServiceName:service:accessoryUUID:](*(void *)(a1 + 32), *(void **)(a1 + 56), *(void **)(a1 + 40), *(void **)(a1 + 64));
}

void __80__HMDAppleMediaAccessorySensorManager__readCharacteristicAndUpdateNameIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  SEL v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v14 = 138543618;
    __int16 v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Received response for read of name for %@", (uint8_t *)&v14, 0x16u);
  }
  if (objc_msgSend(v3, "na_all:", &__block_literal_global_44026))
  {
    -[HMDAppleMediaAccessorySensorManager _updateServiceNameIfRequired](*(void *)(a1 + 32));
  }
  else
  {
    int v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 40);
      int v14 = 138543874;
      __int16 v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Local read of name for %@ did not succeed: %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

BOOL __80__HMDAppleMediaAccessorySensorManager__readCharacteristicAndUpdateNameIfNeeded___block_invoke_73(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v2 value];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

void __65__HMDAppleMediaAccessorySensorManager__resetSensorPairingAndPair__block_invoke(uint64_t a1, char a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (a2)
  {
    -[HMDAppleMediaAccessorySensorManager setShouldUseDerivedSensorUUID:]((uint64_t)WeakRetained, 1);
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = v4;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v13 = 138543362;
      int v14 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Reset HomePod sensor and ready to pair", (uint8_t *)&v13, 0xCu);
    }
    -[HMDAppleMediaAccessorySensorManager cleanUpExistingAccessoriesAndStartADKIfReady](v6);
  }
  else
  {
    int v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = v4;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      int v14 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to reset HomePod sensor due to xpc client error", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_resetWithCompletion:(uint64_t)a1
{
  id v8 = a2;
  Property = objc_getProperty((id)a1, v3, 96, 1);
  dispatch_assert_queue_V2(Property);
  os_unfair_lock_lock_with_options();
  int v5 = *(unsigned __int8 *)(a1 + 42);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  id v7 = objc_getProperty((id)a1, v6, 64, 1);
  if (v5) {
    [v7 resetPairingsWithHandler:v8];
  }
  else {
    [v7 resetWithCompletion:v8];
  }
}

- (void)setShouldUseDerivedSensorUUID:(uint64_t)a1
{
  if (a1)
  {
    BOOL v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 42) = a2;
    os_unfair_lock_unlock(v4);
  }
}

void __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = HMFRandomDataWithLength();
  int v5 = [MEMORY[0x263F08C38] UUID];
  SEL v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    uint64_t v20 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Starting HomePod Sensor pairing", buf, 0xCu);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v10, 64, 1);
  }
  id v12 = Property;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_50;
  v15[3] = &unk_264A19978;
  objc_copyWeak(&v18, (id *)buf);
  id v13 = v4;
  id v16 = v13;
  id v14 = v5;
  id v17 = v14;
  [v12 setupPairing:v13 uuid:v14 completion:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  SEL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v10 = 138543362;
    __int16 v11 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Cannot pair HomePod sensor as zone fetch succeeded future failed", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
  -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v8, 0, v9, 11);

  -[HMDAppleMediaAccessorySensorManager setIsCurrentlyPairing:](*(void *)(a1 + 32));
}

- (void)setIsCurrentlyPairing:(uint64_t)a1
{
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 40) = 0;
    *(void *)(a1 + 56) = 0;
    os_unfair_lock_unlock(v2);
  }
}

void __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_50(uint64_t a1, int a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = WeakRetained;
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = HMFGetLogIdentifier();
    __int16 v11 = @"failed with xpc error";
    *(_DWORD *)uint64_t v20 = 138543874;
    *(void *)&v20[4] = v10;
    *(_WORD *)&v20[12] = 2112;
    if (a2) {
      __int16 v11 = @"completed";
    }
    *(void *)&v20[14] = v11;
    *(_WORD *)&v20[22] = 2112;
    uint64_t v21 = v5;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@HomePod Sensor pairing %@ - pairing URI: %@", v20, 0x20u);
  }
  if (v5 && (a2 & 1) != 0)
  {
    uint64_t v12 = *(void **)(a1 + 32);
    id v13 = *(void **)(a1 + 40);
    id v14 = v5;
    id v15 = v12;
    id v17 = v13;
    if (v8)
    {
      id Property = objc_getProperty(v8, v16, 96, 1);
      *(void *)uint64_t v20 = MEMORY[0x263EF8330];
      *(void *)&v20[8] = 3221225472;
      *(void *)&v20[16] = __75__HMDAppleMediaAccessorySensorManager_pairWithURI_authToken_authTokenUUID___block_invoke;
      uint64_t v21 = &unk_264A2E610;
      id v22 = v8;
      id v23 = v14;
      id v24 = v15;
      id v25 = v17;
      dispatch_async(Property, v20);
    }
  }
  else
  {
    id v19 = objc_msgSend(MEMORY[0x263F087E8], "hmErrorWithCode:", -1, *(void *)v20, *(void *)&v20[8]);
    -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v8, 0, v19, 4);

    -[HMDAppleMediaAccessorySensorManager setIsCurrentlyPairing:]((uint64_t)v8);
  }
}

void __75__HMDAppleMediaAccessorySensorManager_pairWithURI_authToken_authTokenUUID___block_invoke(uint64_t a1)
{
  v46[1] = *(id *)MEMORY[0x263EF8340];
  v1 = *(id **)(a1 + 32);
  id v2 = *(void **)(a1 + 48);
  id v3 = *(void **)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v42 = v2;
  id v6 = v3;
  if (v1)
  {
    id Property = objc_getProperty(v1, v5, 96, 1);
    dispatch_assert_queue_V2(Property);
    id WeakRetained = objc_loadWeakRetained(v1 + 9);
    if (!WeakRetained)
    {
      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = v1;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v15;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor pairing with nil data source", buf, 0xCu);
      }
      id v16 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
      -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v13, 0, v16, 6);

      os_unfair_lock_lock_with_options();
      *((unsigned char *)v13 + 40) = 0;
      v13[7] = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)v13 + 2);
      goto LABEL_23;
    }
    id v9 = v4;
    int v10 = [NSURL URLWithString:v9];
    if (v10)
    {
      if ([MEMORY[0x263F0E080] isHAPSetupPayloadURL:v10])
      {
        __int16 v11 = (void *)[objc_alloc(MEMORY[0x263F0E770]) initWithHAPSetupPayloadURL:v10 error:0];
LABEL_15:

        if (v11)
        {
          id v22 = objc_alloc(MEMORY[0x263F0E768]);
          id v23 = [WeakRetained homeUUIDForAppleMediaAccessorySensorManager:v1];
          id v24 = (void *)[v22 initWithSetupAccessoryPayload:v11 appID:0 homeUUID:v23 ownershipToken:0];
          objc_setProperty_atomic(v1, v25, v24, 80);

          uint64_t v27 = objc_msgSend(objc_getProperty(v1, v26, 80, 1), "updateWithAuthToken:uuid:", v42, v6);
          id v28 = (void *)MEMORY[0x230FBD990](v27);
          uint64_t v29 = v1;
          id v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            long long v31 = HMFGetLogIdentifier();
            id v33 = objc_getProperty(v29, v32, 80, 1);
            *(_DWORD *)long long buf = 138543618;
            *(void *)&uint8_t buf[4] = v31;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v33;
            _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Starting HomePod sensor pairing with accessory description: %@", buf, 0x16u);
          }
          id v34 = [WeakRetained accessoryBrowserForAppleMediaAccessorySensorManager:v29];
          [v34 startDiscoveringAccessoriesWithLinkType:1];
          objc_initWeak(&location, v29);
          id v36 = objc_getProperty(v29, v35, 80, 1);
          *(void *)long long buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __76__HMDAppleMediaAccessorySensorManager__pairWithURI_authToken_authTokenUUID___block_invoke;
          uint64_t v45 = &unk_264A2DE60;
          objc_copyWeak(v46, &location);
          [WeakRetained performLocalAddAccessoryWithDescription:v36 progressHandlerDelegate:v29 completion:buf];

          objc_destroyWeak(v46);
          objc_destroyWeak(&location);
        }
        else
        {
          int v37 = (void *)MEMORY[0x230FBD990]();
          SEL v38 = v1;
          __int16 v39 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            id v40 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            *(void *)&uint8_t buf[4] = v40;
            _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor pairing with nil accessory payload", buf, 0xCu);
          }
          __int16 v41 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
          -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v38, 0, v41, 5);

          os_unfair_lock_lock_with_options();
          *((unsigned char *)v38 + 40) = 0;
          v38[7] = 0;
          os_unfair_lock_unlock((os_unfair_lock_t)v38 + 2);
        }

LABEL_23:
        goto LABEL_24;
      }
      id v17 = (void *)MEMORY[0x230FBD990]();
      id v18 = v1;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not create setup payload from invalid HAP setup payload url string: %@", buf, 0x16u);
      }
    }
    else
    {
      id v17 = (void *)MEMORY[0x230FBD990]();
      id v18 = v1;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil setup payload for url string: %@", buf, 0x16u);
      }
    }

    __int16 v11 = 0;
    goto LABEL_15;
  }
LABEL_24:
}

void __76__HMDAppleMediaAccessorySensorManager__pairWithURI_authToken_authTokenUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  self = objc_loadWeakRetained(v2);
  id v5 = v3;
  if (self)
  {
    id Property = objc_getProperty(self, v4, 96, 1);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__HMDAppleMediaAccessorySensorManager_handleLocalAddCompletedWithError___block_invoke;
    block[3] = &unk_264A2F820;
    block[4] = self;
    id v9 = v5;
    dispatch_async(Property, block);
  }
}

void __72__HMDAppleMediaAccessorySensorManager_handleLocalAddCompletedWithError___block_invoke(uint64_t a1)
{
  v37[1] = *(id *)MEMORY[0x263EF8340];
  v1 = *(id **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (v1)
  {
    id Property = objc_getProperty(v1, v2, 96, 1);
    dispatch_assert_queue_V2(Property);
    id WeakRetained = objc_loadWeakRetained(v1 + 9);
    id v6 = [WeakRetained accessoryBrowserForAppleMediaAccessorySensorManager:v1];
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = v1;
    id v9 = HMFGetOSLogHandle();
    int v10 = v9;
    if (v3)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        __int16 v11 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = objc_getProperty(v8, v12, 80, 1);
        *(_WORD *)&buf[22] = 2112;
        id v36 = v3;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to add HomePod sensor accessory: %@ - %@", buf, 0x20u);
      }
      objc_msgSend(v6, "cancelPairingWithAccessoryDescription:error:", objc_getProperty(v8, v13, 80, 1), v3);
      os_unfair_lock_lock_with_options();
      int v14 = *((unsigned __int8 *)v8 + 42);
      os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
      if (v14)
      {
        id v15 = [v8 derivedHAPAccessoryIdentifier];
        [v6 deregisterPairedAccessory:v15];
      }
      -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)v8, 0);
      objc_setProperty_atomic(v8, v16, 0, 80);
      objc_msgSend(objc_getProperty(v8, v17, 88, 1), "saveSensorUUID:", 0);
      objc_initWeak(&location, v8);
      *(void *)long long buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __73__HMDAppleMediaAccessorySensorManager__handleLocalAddCompletedWithError___block_invoke;
      id v36 = &unk_264A1E530;
      objc_copyWeak(v37, &location);
      -[HMDAppleMediaAccessorySensorManager _resetWithCompletion:]((uint64_t)v8, buf);
      objc_destroyWeak(v37);
      objc_destroyWeak(&location);
      uint64_t v18 = 7;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = HMFGetLogIdentifier();
        uint64_t v20 = [v8 sensorAccessoryUUID];
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v20;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully added HomePod sensor accessory %@", buf, 0x16u);
      }
      uint64_t v21 = [v8 sensorAccessoryUUID];
      id v22 = [WeakRetained accessoryWithUUID:v21 forAppleMediaAccessorySensorManager:v8];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v23 = v22;
      }
      else {
        id v23 = 0;
      }
      id v24 = v23;

      os_unfair_lock_lock_with_options();
      int v25 = *((unsigned __int8 *)v8 + 42);
      os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
      if (v25)
      {
        if (v24)
        {
          uint64_t v27 = objc_msgSend(v6, "unpairedHAPAccessoryWithAccessoryDescription:", objc_getProperty(v8, v26, 80, 1));
          BOOL v28 = v27 == 0;

          if (!v28)
          {
            uint64_t v29 = [v24 identifier];
            *(void *)long long buf = 0;
            [v24 matchesHAPAccessoryWithServerIdentifier:v29 linkType:buf];
            [v6 handleNewlyPairedAccessory:v29 linkType:*(void *)buf];
          }
        }
      }
      objc_setProperty_atomic(v8, v26, 0, 80);
      id v31 = objc_getProperty(v8, v30, 88, 1);
      SEL v32 = [v8 sensorAccessoryUUID];
      [v31 saveSensorUUID:v32];

      [(HMDAppleMediaAccessorySensorManager *)v8 _updateServiceNameIfRequired];
      os_unfair_lock_lock_with_options();
      *((unsigned char *)v8 + 40) = 0;
      v8[7] = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);

      uint64_t v18 = 0;
    }
    [v6 stopDiscoveringForUnpairedAccessoriesWithLinkType:1];
    -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v8, v3 == 0, v3, v18);
  }
}

- (void)setSensorAccessoryUUID:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v3 = [v5 copy];
    id v4 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v3;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
}

void __73__HMDAppleMediaAccessorySensorManager__handleLocalAddCompletedWithError___block_invoke(uint64_t a1, char a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HMDAppleMediaAccessorySensorManager setIsCurrentlyPairing:]((uint64_t)WeakRetained);
  if (a2)
  {
    -[HMDAppleMediaAccessorySensorManager setShouldUseDerivedSensorUUID:]((uint64_t)WeakRetained, 1);
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = WeakRetained;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      LODWORD(v14) = 138543362;
      *(void *)((char *)&v14 + 4) = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Reset HomePod sensor after failed pairing", (uint8_t *)&v14, 0xCu);
    }
    if (v5)
    {
      id Property = objc_getProperty(v5, v8, 96, 1);
      *(void *)&long long v14 = MEMORY[0x263EF8330];
      *((void *)&v14 + 1) = 3221225472;
      id v15 = __60__HMDAppleMediaAccessorySensorManager_scheduleRetryIfNeeded__block_invoke;
      SEL v16 = &unk_264A2F7F8;
      id v17 = v5;
      dispatch_async(Property, &v14);
    }
  }
  else
  {
    int v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = WeakRetained;
    SEL v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      SEL v13 = HMFGetLogIdentifier();
      LODWORD(v14) = 138543362;
      *(void *)((char *)&v14 + 4) = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to reset HomePod sensor due to xpc client error", (uint8_t *)&v14, 0xCu);
    }
  }
}

void __60__HMDAppleMediaAccessorySensorManager_scheduleRetryIfNeeded__block_invoke(uint64_t a1, const char *a2)
{
  v22[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id Property = objc_getProperty(*(id *)(a1 + 32), a2, 96, 1);
    dispatch_assert_queue_V2(Property);
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 72));
    if (WeakRetained)
    {
      os_unfair_lock_lock_with_options();
      if ((*(unsigned char *)(v2 + 43) & 1) != 0 || (id v5 = *(char **)(v2 + 104), (unint64_t)v5 >= 0x32))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
      }
      else
      {
        *(void *)(v2 + 104) = v5 + 1;
        *(unsigned char *)(v2 + 43) = 1;
        os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
        if ((unint64_t)v5 >= [&unk_26E473F18 count]) {
          id v5 = (char *)([&unk_26E473F18 count] - 1);
        }
        id v6 = [&unk_26E473F18 objectAtIndexedSubscript:v5];
        id v7 = (void *)MEMORY[0x230FBD990]();
        id v8 = (id)v2;
        id v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543874;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v5;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v21 = (void *)[v6 integerValue];
          _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Will retry (# %ld) HomePod sensor pairing after %ld sec", buf, 0x20u);
        }
        objc_initWeak(&location, v8);
        [v6 doubleValue];
        double v12 = v11;
        *(void *)long long buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __61__HMDAppleMediaAccessorySensorManager__scheduleRetryIfNeeded__block_invoke;
        uint64_t v21 = &unk_264A199A0;
        objc_copyWeak(v22, &location);
        v22[1] = v5;
        id v14 = objc_getProperty(v8, v13, 96, 1);
        [WeakRetained performAfterDelay:buf block:v14 queue:v12];

        objc_destroyWeak(v22);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      id v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = (id)v2;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot schedule retry due to nil data source", buf, 0xCu);
      }
    }
  }
}

void __61__HMDAppleMediaAccessorySensorManager__scheduleRetryIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_lock_lock_with_options();
    *((unsigned char *)WeakRetained + 43) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
    uint64_t v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = WeakRetained;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = HMFGetLogIdentifier();
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543618;
      id v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v7;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Performing sensor paring retry (# %ld)", (uint8_t *)&v8, 0x16u);
    }
    -[HMDAppleMediaAccessorySensorManager cleanUpExistingAccessoriesAndStartADKIfReady](v4);
  }
}

uint64_t __57__HMDAppleMediaAccessorySensorManager__recoverLostSensor__block_invoke(id *a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained(a1 + 6);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id Property = objc_getProperty(WeakRetained, v5, 96, 1);
    dispatch_assert_queue_V2(Property);
    int v8 = [(os_unfair_lock_s *)v6 derivedSensorUUID];
    id v9 = v8;
    if (v8 && objc_msgSend(v8, "hmf_isEqualToUUID:", a1[4]))
    {
      __int16 v10 = (void *)MEMORY[0x230FBD990]();
      uint64_t v11 = v6;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        SEL v13 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        SEL v38 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Recovering lost derived sensor immediately", buf, 0xCu);
      }
      id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v11, 0, v14, 13);

      id v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = v11;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        id v19 = a1[4];
        *(_DWORD *)long long buf = 138543618;
        SEL v38 = v18;
        __int16 v39 = 2112;
        uint64_t v40 = (uint64_t)v19;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting lost sensor %@", buf, 0x16u);
      }
      -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessoriesAndPair:](v16, MEMORY[0x263EFFA68]);
    }
    else
    {
      uint64_t v20 = os_unfair_lock_lock_with_options();
      if (BYTE1(v6[10]._os_unfair_lock_opaque))
      {
        uint64_t v21 = (void *)MEMORY[0x230FBD990](v20);
        id v22 = v6;
        HMFGetOSLogHandle();
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          id v24 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543362;
          SEL v38 = v24;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Recovery is already pending, will not start another.", buf, 0xCu);
        }
        os_unfair_lock_unlock(v6 + 2);
      }
      else
      {
        BYTE1(v6[10]._os_unfair_lock_opaque) = 1;
        os_unfair_lock_unlock(v6 + 2);
        int v25 = (void *)MEMORY[0x230FBD990]();
        SEL v26 = v6;
        uint64_t v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v28 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          SEL v38 = v28;
          __int16 v39 = 2048;
          uint64_t v40 = 0x40AC200000000000;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Pending sensor recovery for %f seconds", buf, 0x16u);
        }
        id v29 = a1[5];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __57__HMDAppleMediaAccessorySensorManager__recoverLostSensor__block_invoke_44;
        v33[3] = &unk_264A2B5D8;
        objc_copyWeak(&v36, a1 + 6);
        id v34 = a1[5];
        id v35 = a1[4];
        id v31 = objc_getProperty(v26, v30, 96, 1);
        [v29 performAfterDelay:v33 block:v31 queue:3600.0];

        objc_destroyWeak(&v36);
      }
    }
  }
  return 1;
}

void __57__HMDAppleMediaAccessorySensorManager__recoverLostSensor__block_invoke_44(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) accessoryWithUUID:*(void *)(a1 + 40) forAppleMediaAccessorySensorManager:WeakRetained];
    if (v3)
    {
      id v4 = (void *)MEMORY[0x230FBD990]();
      id v5 = WeakRetained;
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = HMFGetLogIdentifier();
        int v23 = 138543618;
        id v24 = v7;
        __int16 v25 = 2112;
        SEL v26 = v3;
        _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Found lost sensor %@, stopping reset", (uint8_t *)&v23, 0x16u);
      }
      int v8 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v5, 0, v8, 8);

      goto LABEL_17;
    }
    os_unfair_lock_lock_with_options();
    int os_unfair_lock_opaque_low = LOBYTE(WeakRetained[10]._os_unfair_lock_opaque);
    os_unfair_lock_unlock(WeakRetained + 2);
    if (os_unfair_lock_opaque_low)
    {
      __int16 v10 = (void *)MEMORY[0x230FBD990]();
      uint64_t v11 = WeakRetained;
      uint64_t v12 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

LABEL_17:

        goto LABEL_18;
      }
      SEL v13 = HMFGetLogIdentifier();
      int v23 = 138543362;
      id v24 = v13;
      id v14 = "%{public}@Already in the process of pairing, not resetting lost sensor";
    }
    else
    {
      id v15 = [(os_unfair_lock_s *)WeakRetained sensorAccessoryUUID];
      int v16 = objc_msgSend(v15, "hmf_isEqualToUUID:", *(void *)(a1 + 40));

      if (v16)
      {
        id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)WeakRetained, 0, v17, 9);

        uint64_t v18 = (void *)MEMORY[0x230FBD990]();
        id v19 = WeakRetained;
        uint64_t v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = HMFGetLogIdentifier();
          id v22 = *(void **)(a1 + 40);
          int v23 = 138543618;
          id v24 = v21;
          __int16 v25 = 2112;
          SEL v26 = v22;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting lost sensor %@", (uint8_t *)&v23, 0x16u);
        }
        -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessoriesAndPair:](v19, MEMORY[0x263EFFA68]);
        goto LABEL_17;
      }
      __int16 v10 = (void *)MEMORY[0x230FBD990]();
      uint64_t v11 = WeakRetained;
      uint64_t v12 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      SEL v13 = HMFGetLogIdentifier();
      int v23 = 138543362;
      id v24 = v13;
      id v14 = "%{public}@Sensor UUID has changed, not resetting lost sensor";
    }
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v23, 0xCu);

    goto LABEL_16;
  }
LABEL_18:
}

void __67__HMDAppleMediaAccessorySensorManager_startADKAndCheckPairingState__block_invoke(uint64_t a1, const char *a2)
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id Property = objc_getProperty(*(id *)(a1 + 32), a2, 96, 1);
    dispatch_assert_queue_V2(Property);
    os_unfair_lock_lock_with_options();
    int v4 = *(unsigned __int8 *)(v2 + 40);
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
    if (v4)
    {
      id v5 = (void *)MEMORY[0x230FBD990]();
      id v6 = (id)v2;
      uint64_t v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not going to restart ADK", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      objc_initWeak(&location, (id)v2);
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v11 = __68__HMDAppleMediaAccessorySensorManager__startADKAndCheckPairingState__block_invoke;
      uint64_t v12 = &unk_264A1E530;
      objc_copyWeak(v13, &location);
      -[HMDAppleMediaAccessorySensorManager startSensorClientWithCompletion:](v2, &buf);
      objc_destroyWeak(v13);
      objc_destroyWeak(&location);
    }
  }
}

void __68__HMDAppleMediaAccessorySensorManager__startADKAndCheckPairingState__block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (a2 && WeakRetained)
  {
    -[HMDAppleMediaAccessorySensorManager checkPairingStateAndStartADKIfUnpaired:](WeakRetained, 0);
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = v4;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      __int16 v10 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Starting the HomePod sensor manager to check pairing failed", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)startSensorClientWithCompletion:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (a1)
  {
    id Property = objc_getProperty((id)a1, v3, 96, 1);
    dispatch_assert_queue_V2(Property);
    os_unfair_lock_lock_with_options();
    int v6 = *(unsigned __int8 *)(a1 + 40);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = (id)a1;
      int v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = HMFGetLogIdentifier();
        int v26 = 138543362;
        uint64_t v27 = v10;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not starting adk again", (uint8_t *)&v26, 0xCu);
      }
    }
    else
    {
      os_unfair_lock_lock_with_options();
      int v11 = *(unsigned __int8 *)(a1 + 42);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      if (v11)
      {
        id v14 = -[HMDAppleMediaAccessorySensorManager derivedHAPAccessoryIdentifierData]((os_unfair_lock_s *)a1);
        if (v14)
        {
          id v15 = objc_msgSend(objc_getProperty((id)a1, v13, 120, 1), "privateKey");
          int v16 = [v15 data];

          if (v16)
          {
            objc_msgSend(objc_getProperty((id)a1, v17, 64, 1), "startWithDeviceID:deviceLTSK:controllerPairingID:controllerLTPK:completion:", v14, v16, 0, 0, v4);
          }
          else
          {
            id v22 = (void *)MEMORY[0x230FBD990]();
            id v23 = (id)a1;
            id v24 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              __int16 v25 = HMFGetLogIdentifier();
              int v26 = 138543362;
              uint64_t v27 = v25;
              _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to get pairing identity to start sensor client", (uint8_t *)&v26, 0xCu);
            }
          }
        }
        else
        {
          uint64_t v18 = (void *)MEMORY[0x230FBD990]();
          id v19 = (id)a1;
          uint64_t v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = HMFGetLogIdentifier();
            int v26 = 138543362;
            uint64_t v27 = v21;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to calculate derived deviceID to start sensor client", (uint8_t *)&v26, 0xCu);
          }
        }
      }
      else
      {
        objc_msgSend(objc_getProperty((id)a1, v12, 64, 1), "startWithCompletion:", v4);
      }
    }
  }
}

- (os_unfair_lock_s)derivedHAPAccessoryIdentifierData
{
  v1 = a1;
  if (a1)
  {
    uint64_t v2 = a1 + 2;
    os_unfair_lock_lock_with_options();
    id v3 = *(void **)&v1[6]._os_unfair_lock_opaque;
    if (!v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v1[18]);
      id v5 = [WeakRetained hostUUIDForAppleMediaAccessorySensorManager:v1];

      if (!v5)
      {
        v1 = 0;
        goto LABEL_6;
      }
      uint64_t v6 = [(os_unfair_lock_s *)v1 derivedHAPAccessoryIdentifierDataForHostUUID:v5];
      uint64_t v7 = *(void **)&v1[6]._os_unfair_lock_opaque;
      *(void *)&v1[6]._os_unfair_lock_opaque = v6;

      id v3 = *(void **)&v1[6]._os_unfair_lock_opaque;
    }
    v1 = v3;
LABEL_6:
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

void __83__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessories_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = WeakRetained;
  uint64_t v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 40);
      int v16 = 138543874;
      id v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      id v21 = v3;
      int v11 = "%{public}@Unable to remove existing HomePod sensor accessory: %@ - %@";
      uint64_t v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v12, v13, v11, (uint8_t *)&v16, v14);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    uint64_t v15 = *(void *)(a1 + 40);
    int v16 = 138543618;
    id v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    int v11 = "%{public}@Removed HomePod sensor accessory %@";
    uint64_t v12 = v8;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 22;
    goto LABEL_6;
  }
}

uint64_t __83__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessories_completion___block_invoke_46(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Removed HomePod sensor accessories", (uint8_t *)&v7, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __79__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessoriesAndPair___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = WeakRetained;
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    uint64_t v10 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Resetting sensor uuid after sensor removal", buf, 0xCu);
  }
  -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)v3, 0);
  if (v3) {
    id Property = objc_getProperty(v3, v6, 88, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessoriesAndPair___block_invoke_47;
  v8[3] = &unk_264A2F3E8;
  v8[4] = v3;
  [Property saveSensorUUID:0 completion:v8];
}

void __79__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessoriesAndPair___block_invoke_47(uint64_t a1, const char *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id Property = objc_getProperty(*(id *)(a1 + 32), a2, 96, 1);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__HMDAppleMediaAccessorySensorManager_resetSensorPairingAndPair__block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = v2;
    dispatch_async(Property, block);
  }
}

void __64__HMDAppleMediaAccessorySensorManager_resetSensorPairingAndPair__block_invoke(uint64_t a1, const char *a2)
{
}

- (NSString)derivedHAPAccessoryIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  derivedHAPAccessoryIdentifier = self->_derivedHAPAccessoryIdentifier;
  if (derivedHAPAccessoryIdentifier)
  {
    id v5 = derivedHAPAccessoryIdentifier;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    id v6 = -[HMDAppleMediaAccessorySensorManager derivedHAPAccessoryIdentifierData]((os_unfair_lock_s *)self);
    if (v6)
    {
      os_unfair_lock_lock_with_options();
      int v7 = self->_derivedHAPAccessoryIdentifier;
      if (!v7)
      {
        id v8 = (void *)[objc_alloc(MEMORY[0x263F359A0]) initWithDeviceIDData:v6];
        uint64_t v9 = [v8 deviceIDString];
        uint64_t v10 = self->_derivedHAPAccessoryIdentifier;
        self->_derivedHAPAccessoryIdentifier = v9;

        int v7 = self->_derivedHAPAccessoryIdentifier;
      }
      id v5 = v7;
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (id)derivedHAPAccessoryIdentifierDataForHostUUID:(id)a3
{
  v5[2] = *MEMORY[0x263EF8340];
  v5[0] = 0;
  v5[1] = 0;
  [a3 getUUIDBytes:v5];
  id v3 = [MEMORY[0x263EFF8F8] dataWithBytes:v5 length:6];
  return v3;
}

- (NSUUID)derivedSensorUUID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  derivedSensorUUID = self->_derivedSensorUUID;
  if (derivedSensorUUID) {
    goto LABEL_4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = [WeakRetained hostUUIDForAppleMediaAccessorySensorManager:self];

  if (v6)
  {
    int v7 = [(HMDAppleMediaAccessorySensorManager *)self derivedSensorUUIDForHostUUID:v6];
    id v8 = self->_derivedSensorUUID;
    self->_derivedSensorUUID = v7;

    derivedSensorUUID = self->_derivedSensorUUID;
LABEL_4:
    uint64_t v9 = derivedSensorUUID;
    goto LABEL_5;
  }
  uint64_t v9 = 0;
LABEL_5:
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)derivedSensorUUIDForHostUUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F08C38];
  uint64_t v9 = @"HMDAppleMediaAccessorySensorManager";
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];
  int v7 = objc_msgSend(v3, "hm_deriveUUIDFromBaseUUID:withSalts:", v5, v6, v9, v10);

  return v7;
}

- (void)fetchADKSensorStatusCompletion:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 64, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__HMDAppleMediaAccessorySensorManager_fetchADKSensorStatusCompletion___block_invoke;
  v8[3] = &unk_264A199F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [Property getCurrentStatusWithCompletion:v8];
}

uint64_t __70__HMDAppleMediaAccessorySensorManager_fetchADKSensorStatusCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch sensor status from adk", (uint8_t *)&v9, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)handleCharacteristicsChangedNotification:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 96, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__HMDAppleMediaAccessorySensorManager_handleCharacteristicsChangedNotification___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __80__HMDAppleMediaAccessorySensorManager_handleCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) userInfo];
  if (v1)
  {
    id Property = objc_getProperty(v1, v2, 96, 1);
    dispatch_assert_queue_V2(Property);
    id v4 = [v1 sensorAccessoryUUID];
    if (v4)
    {
      id v5 = objc_msgSend(v10, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            -[HMDAppleMediaAccessorySensorManager _checkIfCharacteristicsUpdateServiceName:sensorUUID:]((uint64_t)v1, *(void **)(*((void *)&v11 + 1) + 8 * i), v4);
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void)handleAccessoryAdded:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"HMDNotificationAddedAccessoryKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v16 = v6;

  if (v16)
  {
    uint64_t v7 = [(HMDAppleMediaAccessorySensorManager *)self sensorAccessoryUUID];

    if (v7)
    {
      if (self) {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      }
      else {
        id WeakRetained = 0;
      }
      id v9 = [WeakRetained hostUUIDForAppleMediaAccessorySensorManager:self];

      id v10 = [v16 uuid];
      long long v11 = [(HMDAppleMediaAccessorySensorManager *)self sensorAccessoryUUID];
      if (objc_msgSend(v10, "hmf_isEqualToUUID:", v11))
      {
      }
      else
      {
        if (!v9)
        {

          goto LABEL_14;
        }
        long long v13 = [v16 hostAccessory];
        long long v14 = [v13 uuid];
        int v15 = objc_msgSend(v9, "hmf_isEqualToUUID:", v14);

        if (!v15)
        {
LABEL_14:

          goto LABEL_15;
        }
      }
      [(HMDAppleMediaAccessorySensorManager *)self cleanUpExistingAccessoriesAndStartADKIfReady];
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)localAccessoryAddRequiresConsent:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained)
    {
      uint64_t v6 = WeakRetained;
      if ([WeakRetained isReadyForSensorPairing:self])
      {
        os_unfair_lock_lock_with_options();
        BOOL shouldUseDerivedSensorUUID = self->_shouldUseDerivedSensorUUID;
        os_unfair_lock_unlock(&self->_lock);
        if (!shouldUseDerivedSensorUUID)
        {
          [(HMDAppleMediaAccessorySensorManager *)self sensorAccessoryUUID];
          if (objc_claimAutoreleasedReturnValue()) {
            __assert_rtn("-[HMDAppleMediaAccessorySensorManager localAccessoryAddRequiresConsent:]", "HMDAppleMediaAccessorySensorManager.m", 1253, "!self.sensorAccessoryUUID");
          }
          goto LABEL_16;
        }
        uint64_t v8 = [(HMDAppleMediaAccessorySensorManager *)self derivedSensorUUID];
        if (v8)
        {
          id v9 = (void *)v8;
          if ((objc_msgSend(v4, "hmf_isEqualToUUID:", v8) & 1) == 0) {
            __assert_rtn("-[HMDAppleMediaAccessorySensorManager localAccessoryAddRequiresConsent:]", "HMDAppleMediaAccessorySensorManager.m", 1249, "[accessoryUUID hmf_isEqualToUUID:derivedSensorUUID]");
          }

LABEL_16:
          uint64_t v19 = (void *)MEMORY[0x230FBD990]();
          __int16 v20 = self;
          id v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            uint64_t v22 = HMFGetLogIdentifier();
            int v25 = 138543618;
            int v26 = v22;
            __int16 v27 = 2112;
            id v28 = v4;
            _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Confirming HomePod sensor with UUID %@ is allowed to be added locally", (uint8_t *)&v25, 0x16u);
          }
          -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)v20, v4);
          id v23 = [v6 accessoryBrowserForAppleMediaAccessorySensorManager:v20];
          objc_msgSend(v23, "didReceiveUserConsentResponseForSetupAccessoryDetail:consent:", objc_getProperty(v20, v24, 80, 1), 1);

          goto LABEL_19;
        }
        long long v14 = (void *)MEMORY[0x230FBD990]();
        int v15 = self;
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v17 = HMFGetLogIdentifier();
          int v25 = 138543618;
          int v26 = v17;
          __int16 v27 = 2112;
          id v28 = v4;
          __int16 v18 = "%{public}@Cannot confirm that HomePod sensor with UUID %@ is allowed to be added locally due to missing "
                "derived sensor UUID";
          goto LABEL_13;
        }
      }
      else
      {
        long long v14 = (void *)MEMORY[0x230FBD990]();
        int v15 = self;
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v17 = HMFGetLogIdentifier();
          int v25 = 138543618;
          int v26 = v17;
          __int16 v27 = 2112;
          id v28 = v4;
          __int16 v18 = "%{public}@Not consenting to accessory local add for %@ as data source is no longer ready for pairing";
LABEL_13:
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v25, 0x16u);
        }
      }

LABEL_19:

      goto LABEL_20;
    }
  }
  id v10 = (void *)MEMORY[0x230FBD990]();
  long long v11 = self;
  long long v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    long long v13 = HMFGetLogIdentifier();
    int v25 = 138543618;
    int v26 = v13;
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Not consenting to accessory local add for %@ with nil data source", (uint8_t *)&v25, 0x16u);
  }
LABEL_20:
}

- (void)handleErrorCaseTestMessage:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 96, 1);
  }
  else {
    id Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  if (isInternalBuild())
  {
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v8 = [(HMDAppleMediaAccessorySensorManager *)self sensorAccessoryUUID];
    id v9 = [WeakRetained accessoryWithUUID:v8 forAppleMediaAccessorySensorManager:self];

    if (v9) {
      goto LABEL_7;
    }
    if (!self) {
      goto LABEL_15;
    }
    os_unfair_lock_lock_with_options();
    BOOL shouldUseDerivedSensorUUID = self->_shouldUseDerivedSensorUUID;
    os_unfair_lock_unlock(&self->_lock);
    if (!shouldUseDerivedSensorUUID) {
      goto LABEL_15;
    }
    SEL v24 = [(HMDAppleMediaAccessorySensorManager *)self derivedSensorUUID];
    id v9 = [WeakRetained accessoryWithUUID:v24 forAppleMediaAccessorySensorManager:self];

    if (v9)
    {
LABEL_7:
      long long v11 = [v5 messagePayload];
      long long v12 = [v11 objectForKey:*MEMORY[0x263F0B9D8]];

      long long v13 = [v5 messagePayload];
      long long v14 = [v13 objectForKey:*MEMORY[0x263F0B9E0]];
      BOOL v15 = v14 != 0;

      id v16 = [v5 messagePayload];
      id v17 = [v16 objectForKey:*MEMORY[0x263F0B9C8]];
      BOOL v18 = v17 != 0;

      uint64_t v19 = dispatch_group_create();
      dispatch_group_enter(v19);
      if (v12)
      {
        if (self) {
          id v21 = objc_getProperty(self, v20, 64, 1);
        }
        else {
          id v21 = 0;
        }
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        id v37[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke;
        v37[3] = &unk_264A19900;
        v37[4] = self;
        BOOL v40 = v18;
        SEL v38 = v19;
        id v39 = v9;
        BOOL v41 = v15;
        [v21 resetWithCompletion:v37];

        uint64_t v22 = v38;
      }
      else
      {
        if (self) {
          int v26 = objc_getProperty(self, v20, 96, 1);
        }
        else {
          int v26 = 0;
        }
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_5;
        block[3] = &unk_264A26EA0;
        BOOL v35 = v18;
        SEL v32 = v19;
        id v33 = self;
        id v34 = v9;
        BOOL v36 = v15;
        dispatch_async(v26, block);

        uint64_t v22 = v32;
      }

      if (self) {
        id v28 = objc_getProperty(self, v27, 96, 1);
      }
      else {
        id v28 = 0;
      }
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_8;
      v29[3] = &unk_264A2F820;
      v29[4] = self;
      id v30 = v5;
      dispatch_group_notify(v19, v28, v29);
    }
    else
    {
LABEL_15:
      [(HMDAppleMediaAccessorySensorManager *)self cleanUpExistingAccessoriesAndStartADKIfReady];
      int v25 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
      [v5 respondWithError:v25];
    }
  }
  else
  {
    id WeakRetained = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v5 respondWithError:WeakRetained];
  }
}

void __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke(uint64_t a1, const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    id Property = objc_getProperty(v3, a2, 96, 1);
  }
  else {
    id Property = 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_2;
  v7[3] = &unk_264A26EA0;
  char v11 = *(unsigned char *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  id v10 = *(id *)(a1 + 48);
  char v12 = *(unsigned char *)(a1 + 57);
  dispatch_async(Property, v7);
}

void __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_5(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 56))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    uint64_t v2 = *(void **)(a1 + 40);
    v13[0] = *(void *)(a1 + 48);
    id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_6;
    v10[3] = &unk_264A2F7F8;
    id v4 = &v11;
    id v11 = *(id *)(a1 + 32);
    -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v2, v3, v10);

    id v5 = [MEMORY[0x263F08C38] UUID];
    -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:](*(void *)(a1 + 40), v5);

LABEL_5:
    goto LABEL_6;
  }
  if (*(unsigned char *)(a1 + 57))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_7;
    v8[3] = &unk_264A2F7F8;
    id v4 = &v9;
    id v9 = *(id *)(a1 + 32);
    -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v6, v7, v8);

    -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:](*(void *)(a1 + 40), 0);
    goto LABEL_5;
  }
LABEL_6:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_8(uint64_t a1, const char *a2)
{
  [(HMDAppleMediaAccessorySensorManager *)*(void **)(a1 + 32) cleanUpExistingAccessoriesAndStartADKIfReady];
  id v3 = *(void **)(a1 + 40);
  return [v3 respondWithSuccess];
}

void __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_6(uint64_t a1)
{
}

void __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_7(uint64_t a1)
{
}

void __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_2(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 56))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    uint64_t v2 = *(void **)(a1 + 40);
    v13[0] = *(void *)(a1 + 48);
    id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_3;
    v10[3] = &unk_264A2F7F8;
    id v4 = &v11;
    id v11 = *(id *)(a1 + 32);
    -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v2, v3, v10);

    id v5 = [MEMORY[0x263F08C38] UUID];
    -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:](*(void *)(a1 + 40), v5);

LABEL_5:
    goto LABEL_6;
  }
  if (*(unsigned char *)(a1 + 57))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_4;
    v8[3] = &unk_264A2F7F8;
    id v4 = &v9;
    id v9 = *(id *)(a1 + 32);
    -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v6, v7, v8);

    -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:](*(void *)(a1 + 40), 0);
    goto LABEL_5;
  }
LABEL_6:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_3(uint64_t a1)
{
}

void __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_4(uint64_t a1)
{
}

- (NSUUID)messageTargetUUID
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  id v4 = [WeakRetained hostUUIDForAppleMediaAccessorySensorManager:self];

  return (NSUUID *)v4;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  if (self)
  {
    self = (HMDAppleMediaAccessorySensorManager *)objc_getProperty(self, a2, 96, 1);
    uint64_t v2 = vars8;
  }
  return (OS_dispatch_queue *)self;
}

- (NSUUID)sensorAccessoryUUID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_sensorAccessoryUUID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_migrateToDataStoreIfNeeded:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc_init(HMDAppleMediaAccessorySensorManagerLocalDataStore);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __78__HMDAppleMediaAccessorySensorManager__migrateToDataStoreIfNeeded_completion___block_invoke;
    v14[3] = &unk_264A198D8;
    v14[4] = self;
    id v15 = v6;
    id v16 = v8;
    id v17 = v7;
    id v9 = v8;
    [(HMDAppleMediaAccessorySensorManagerLocalDataStore *)v9 fetchSensorUUIDWithCompletion:v14];
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v13 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v19 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot migrate HomePod sensor identifier with nil data source", buf, 0xCu);
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __78__HMDAppleMediaAccessorySensorManager__migrateToDataStoreIfNeeded_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v15 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Found HomePod sensor identifier, need to migrate", buf, 0xCu);
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __78__HMDAppleMediaAccessorySensorManager__migrateToDataStoreIfNeeded_completion___block_invoke_24;
    v11[3] = &unk_264A2E788;
    id v9 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 48);
    [v9 saveSensorUUID:v3 completion:v11];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v15 = v10;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Didn't found HomePod sensor identifier, no migration needed", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __78__HMDAppleMediaAccessorySensorManager__migrateToDataStoreIfNeeded_completion___block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate HomePod sensor identifier: %@", (uint8_t *)&v11, 0x16u);
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Success migrating HomePod sensor identifier", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 40) saveSensorUUID:0];
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v9();
}

- (void)configureWithDataSource:(id)a3 hpsXPCClient:(id)a4 dataStore:(id)a5
{
  id v8 = a5;
  if (self)
  {
    id v9 = a4;
    objc_storeWeak((id *)&self->_dataSource, a3);
    objc_setProperty_atomic(self, v10, v9, 64);

    objc_setProperty_atomic(self, v11, v8, 88);
    id Property = objc_getProperty(self, v12, 96, 1);
  }
  else
  {
    id Property = 0;
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke;
  v15[3] = &unk_264A2F820;
  void v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  dispatch_async(Property, v15);
}

uint64_t __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke_2;
  v4[3] = &unk_264A27D78;
  void v4[4] = v2;
  return [v2 _migrateToDataStoreIfNeeded:v1 completion:v4];
}

void __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke_2(uint64_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id Property = *(NSObject **)(a1 + 32);
    if (Property)
    {
      id Property = objc_getProperty(Property, a2, 96, 1);
      uint64_t v4 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v4 = 0;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke_3;
    block[3] = &unk_264A2F7F8;
    void block[4] = v4;
    dispatch_async(Property, block);
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      SEL v11 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor manager with failed migration", buf, 0xCu);
    }
  }
}

void __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke_3(uint64_t a1, const char *a2)
{
  v19[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = *(id **)(a1 + 32);
  if (v2)
  {
    id Property = objc_getProperty(*(id *)(a1 + 32), a2, 96, 1);
    dispatch_assert_queue_V2(Property);
    id WeakRetained = objc_loadWeakRetained(v2 + 9);
    if (WeakRetained)
    {
      objc_getProperty(v2, v4, 64, 1);
      if ([(id)objc_opt_class() supportSensory])
      {
        objc_initWeak(&location, v2);
        objc_initWeak(&v13, WeakRetained);
        id v7 = objc_getProperty(v2, v6, 88, 1);
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        id v16 = __45__HMDAppleMediaAccessorySensorManager__start__block_invoke;
        id v17 = &unk_264A198B0;
        objc_copyWeak(&v18, &location);
        objc_copyWeak(v19, &v13);
        [v7 fetchSensorUUIDWithCompletion:&buf];

        objc_destroyWeak(v19);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
LABEL_11:

        return;
      }
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = v2;
      SEL v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Cannot start HomePod sensor manager as device does not support sensors", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = v2;
      SEL v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        SEL v11 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor manager with nil data source", (uint8_t *)&buf, 0xCu);
      }
    }

    goto LABEL_11;
  }
}

void __45__HMDAppleMediaAccessorySensorManager__start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SEL v6 = (id *)(a1 + 40);
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v90 = v3;
  -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)WeakRetained, v3);
  uint64_t v89 = v7;
  if (v7 && WeakRetained)
  {
    id v8 = [WeakRetained derivedSensorUUID];
    if (v8)
    {
      id v9 = [WeakRetained sensorAccessoryUUID];
      if (v9) {
        char v10 = objc_msgSend(v3, "hmf_isEqualToUUID:", v8);
      }
      else {
        char v10 = 1;
      }
      os_unfair_lock_lock_with_options();
      *((unsigned char *)WeakRetained + 42) = v10;
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);

      id v20 = objc_loadWeakRetained((id *)WeakRetained + 9);
      id v21 = v20;
      from = v4;
      if (v20)
      {
        id v87 = v8;
        uint64_t v22 = [v20 keychainStoreForAppleMediaAccessorySensorManager:WeakRetained];
        id v23 = [WeakRetained derivedSensorUUID];
        SEL v24 = [v22 pairingIdentityForAppleMediaAccessorySensorWithUUID:v23];

        int v25 = (void *)MEMORY[0x230FBD990]();
        id v26 = WeakRetained;
        __int16 v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v85 = v22;
          id v28 = v6;
          id v30 = v29 = v21;
          *(_DWORD *)long long buf = 138543618;
          v95 = v30;
          __int16 v96 = 2112;
          v97 = v24;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Existing sensor accessory pairing identity: %@", buf, 0x16u);

          id v21 = v29;
          SEL v6 = v28;
          uint64_t v22 = v85;
        }

        if (v24)
        {
          objc_setProperty_atomic_copy(v26, v31, v24, 120);
        }
        else
        {
          id v84 = objc_loadWeakRetained((id *)WeakRetained + 9);
          id v86 = v26;
          if (v84)
          {
            id v82 = v21;
            id v39 = [MEMORY[0x263F425E8] pairingIdentity];
            id v40 = objc_alloc(MEMORY[0x263F425E8]);
            BOOL v41 = [v86 derivedHAPAccessoryIdentifier];
            id v42 = [v39 publicKey];
            uint64_t v43 = [v39 privateKey];
            v44 = v40;
            id v26 = v86;
            uint64_t v45 = [v44 initWithIdentifier:v41 publicKey:v42 privateKey:v43];

            uint64_t v46 = (void *)v45;
            v47 = (void *)MEMORY[0x230FBD990]();
            id v48 = v86;
            SEL v49 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              id v50 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = 138543618;
              v95 = v50;
              __int16 v96 = 2112;
              v97 = v46;
              _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@Creating new sensor accessory pairing identity: %@", buf, 0x16u);

              id v26 = v86;
            }

            v83 = [v84 keychainStoreForAppleMediaAccessorySensorManager:v48];
            if ([v83 saveAppleMediaAccessorySensorPairingIdentity:v46])
            {
              id v52 = v39;
              objc_setProperty_atomic_copy(v48, v51, v46, 120);
              v53 = v46;
              id v21 = v82;
              SEL v24 = 0;
            }
            else
            {
              v53 = v46;
              id v52 = v39;
              v61 = (void *)MEMORY[0x230FBD990]();
              id v62 = v48;
              v63 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              {
                v64 = HMFGetLogIdentifier();
                *(_DWORD *)long long buf = 138543362;
                v95 = v64;
                _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_ERROR, "%{public}@Failed to save new sensor accessory pairing identity in the keychain store", buf, 0xCu);
              }
              id v21 = v82;
              SEL v24 = 0;
              id v26 = v86;
            }
          }
          else
          {
            v54 = (void *)MEMORY[0x230FBD990]();
            id v55 = v26;
            v56 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v57 = v22;
              v58 = v6;
              id v60 = v59 = v21;
              *(_DWORD *)long long buf = 138543362;
              v95 = v60;
              _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_ERROR, "%{public}@Cannot create sensor pairing with nil data source", buf, 0xCu);

              id v21 = v59;
              SEL v6 = v58;
              uint64_t v22 = v57;
            }

            SEL v24 = 0;
            id v26 = v86;
          }
        }
        id Property = objc_getProperty(v26, v32, 120, 1);
        BOOL v38 = Property != 0;
        if (!Property)
        {
          id v66 = (void *)MEMORY[0x230FBD990]();
          id v67 = v26;
          v68 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v69 = v22;
            v70 = v6;
            v72 = id v71 = v21;
            *(_DWORD *)long long buf = 138543362;
            v95 = v72;
            _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_ERROR, "%{public}@Unable to get/create a sensor pairing identity", buf, 0xCu);

            id v21 = v71;
            SEL v6 = v70;
            uint64_t v22 = v69;
          }
        }

        id v8 = v87;
      }
      else
      {
        id v33 = (void *)MEMORY[0x230FBD990]();
        id v34 = WeakRetained;
        BOOL v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          int v37 = v36 = v8;
          *(_DWORD *)long long buf = 138543362;
          v95 = v37;
          _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Cannot load sensor pairing with nil data source", buf, 0xCu);

          id v8 = v36;
        }

        BOOL v38 = 0;
      }

      v73 = (void *)MEMORY[0x230FBD990]();
      id v74 = WeakRetained;
      v75 = HMFGetOSLogHandle();
      id v76 = v75;
      if (v38)
      {
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          v77 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          v95 = v77;
          __int16 v96 = 2112;
          v97 = v90;
          _os_log_impl(&dword_22F52A000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@Local HomePod paired sensor UUID: %@", buf, 0x16u);
        }
        id v79 = objc_getProperty(v74, v78, 96, 1);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __45__HMDAppleMediaAccessorySensorManager__start__block_invoke_21;
        block[3] = &unk_264A2CBC0;
        void block[4] = v74;
        v80 = v79;
        objc_copyWeak(&v92, from);
        objc_copyWeak(&v93, v6);
        dispatch_async(v80, block);

        objc_destroyWeak(&v93);
        objc_destroyWeak(&v92);
        goto LABEL_47;
      }
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        id v81 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        v95 = v81;
        _os_log_impl(&dword_22F52A000, v76, OS_LOG_TYPE_ERROR, "%{public}@Cannot start sensor manager as we are unable to get a pairing identity", buf, 0xCu);
      }
      uint64_t v19 = v73;
    }
    else
    {
      uint64_t v15 = MEMORY[0x230FBD990]();
      id v16 = WeakRetained;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        v95 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to calculate derived sensor UUID start sensor client", buf, 0xCu);
      }
      uint64_t v19 = (void *)v15;
    }
LABEL_47:

    goto LABEL_48;
  }
  SEL v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = WeakRetained;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    v95 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot continue starting HomePod sensor manager with nil data source", buf, 0xCu);
  }
LABEL_48:
}

void __45__HMDAppleMediaAccessorySensorManager__start__block_invoke_21(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__HMDAppleMediaAccessorySensorManager__start__block_invoke_2;
  v3[3] = &unk_264A19888;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  objc_copyWeak(&v5, (id *)(a1 + 48));
  -[HMDAppleMediaAccessorySensorManager startSensorClientWithCompletion:](v2, v3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v4);
}

void __45__HMDAppleMediaAccessorySensorManager__start__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5 && WeakRetained)
  {
    if ((a2 & 1) == 0)
    {
      SEL v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = WeakRetained;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = HMFGetLogIdentifier();
        *(_DWORD *)int v25 = 138543362;
        *(void *)&v25[4] = v9;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Starting the HomePod sensor manager failed", v25, 0xCu);
      }
    }
    id v10 = v5;
    SEL v11 = [v10 notificationCenterForAppleMediaAccessorySensorManager:WeakRetained];
    id v12 = [v10 residentNotificationObjectForAppleMediaAccessorySensorManager:WeakRetained];
    [v11 addObserver:WeakRetained selector:sel_handlePrimaryResidentChanged_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v12];

    id v13 = [v10 residentNotificationObjectForAppleMediaAccessorySensorManager:WeakRetained];
    [v11 addObserver:WeakRetained selector:sel_handlePrimaryResidentChanged_ name:@"HMDResidentDeviceManagerAddResidentNotification" object:v13];

    id v14 = [v10 residentNotificationObjectForAppleMediaAccessorySensorManager:WeakRetained];
    [v11 addObserver:WeakRetained selector:sel_handlePrimaryResidentChanged_ name:@"HMDResidentDeviceManagerUpdateResidentNotification" object:v14];

    uint64_t v15 = [v10 addAccessoryNotificationObjectForAppleMediaAccessorySensorManager:WeakRetained];
    [v11 addObserver:WeakRetained selector:sel_handleAccessoryAdded_ name:@"HMDNotificationHomeAddedAccessory" object:v15];

    [v11 addObserver:WeakRetained selector:sel_handleCharacteristicsChangedNotification_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:0];
    if (isInternalBuild())
    {
      id v16 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
      id v17 = [v10 messageDispatcherForAppleMediaAccessorySensorManager:WeakRetained];
      uint64_t v18 = *MEMORY[0x263F0B9D0];
      *(void *)int v25 = v16;
      uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
      [v17 registerForMessage:v18 receiver:WeakRetained policies:v19 selector:sel_handleErrorCaseTestMessage_];
    }
    [(HMDAppleMediaAccessorySensorManager *)WeakRetained cleanUpExistingAccessoriesAndStartADKIfReady];
  }
  else
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = WeakRetained;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      SEL v24 = HMFGetLogIdentifier();
      *(_DWORD *)int v25 = 138543362;
      *(void *)&v25[4] = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor manager with nil data source or nil self", v25, 0xCu);
    }
  }
}

- (HMDAppleMediaAccessorySensorManager)initWithWorkQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDAppleMediaAccessorySensorManager;
  SEL v6 = [(HMDAppleMediaAccessorySensorManager *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_workQueue, a3);
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    renamedServiceIDs = v7->_renamedServiceIDs;
    v7->_renamedServiceIDs = (NSMutableArray *)v8;

    v7->_isCurrentlyPairing = 0;
    v7->_pairingRetryCount = 0;
    v7->_hasPendingRetry = 0;
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t117 != -1) {
    dispatch_once(&logCategory__hmf_once_t117, &__block_literal_global_82_44152);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v118;
  return v2;
}

void __50__HMDAppleMediaAccessorySensorManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v118;
  logCategory__hmf_once_v118 = v0;
}

@end