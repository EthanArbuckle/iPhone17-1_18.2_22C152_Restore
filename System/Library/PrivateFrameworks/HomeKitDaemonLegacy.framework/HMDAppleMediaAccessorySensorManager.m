@interface HMDAppleMediaAccessorySensorManager
+ (id)logCategory;
- (HMDAppleMediaAccessorySensorManager)initWithWorkQueue:(id)a3;
- (NSUUID)messageTargetUUID;
- (NSUUID)sensorAccessoryUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (id)logIdentifier;
- (void)_checkIfCharacteristicsUpdateServiceName:(void *)a3 sensorUUID:;
- (void)_migrateToDataStoreIfNeeded:(id)a3 completion:(id)a4;
- (void)_readCharacteristicAndUpdateNameIfNeeded:(void *)a1;
- (void)_readDefaultSensorNameAndUpdateToNameIfNeeded:(void *)a3 service:(void *)a4 accessoryUUID:;
- (void)_removeExistingSensorAccessories:(void *)a3 completion:;
- (void)_removeExistingSensorAccessoriesAndPair:(void *)a1;
- (void)_resetSensorPairingAndPair;
- (void)_resetWithCompletion:(void *)a1;
- (void)_updateServiceName:(void *)a3 service:(void *)a4 accessoryUUID:;
- (void)_updateServiceNameIfRequired;
- (void)checkPairingStateAndStartADKIfUnpaired:(void *)a1;
- (void)cleanUpExistingAccessoriesAndStartADKIfReady;
- (void)configureWithDataSource:(id)a3 hpsXPCClient:(id)a4 dataStore:(id)a5;
- (void)fetchADKSensorStatusCompletion:(id)a3;
- (void)handleAccessoryAdded:(id)a3;
- (void)handleCharacteristicsChangedNotification:(id)a3;
- (void)handleErrorCaseTestMessage:(id)a3;
- (void)localAccessoryAddRequiresConsent:(id)a3;
- (void)logPairingSuccess:(void *)a3 error:(uint64_t)a4 setupFailureReason:;
- (void)managerIsReadyToBePaired;
- (void)setIsCurrentlyPairing:(uint64_t)a1;
- (void)setSensorAccessoryUUID:(uint64_t)a1;
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
    v5 = &stru_1F2C9F1A8;
  }
  v7 = v5;

  return v7;
}

- (void)managerIsReadyToBePaired
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@HPSManagerDelegate: manager is ready to be paired", (uint8_t *)&v8, 0xCu);
  }
  [(HMDAppleMediaAccessorySensorManager *)v4 cleanUpExistingAccessoriesAndStartADKIfReady];
}

- (void)cleanUpExistingAccessoriesAndStartADKIfReady
{
  if (a1)
  {
    Property = objc_getProperty(a1, a2, 72, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__HMDAppleMediaAccessorySensorManager_cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = a1;
    dispatch_async(Property, block);
  }
}

void __83__HMDAppleMediaAccessorySensorManager_cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 72, 1);
    dispatch_assert_queue_V2(Property);
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      if ([WeakRetained isResidentConfirmedForAppleMediaAccessorySensorManager:v2])
      {
        if ([v5 isReadyForSensorPairing:v2])
        {
          v6 = [v5 hostUUIDForAppleMediaAccessorySensorManager:v2];
          v7 = [v5 accessoriesWithHostUUID:v6 forAppleMediaAccessorySensorManager:v2];
          *(void *)&long long v42 = MEMORY[0x1E4F143A8];
          *((void *)&v42 + 1) = 3221225472;
          v43 = __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke;
          v44 = &unk_1E6A10BD0;
          uint64_t v45 = v2;
          int v8 = objc_msgSend(v7, "na_filter:", &v42);

          if ([v8 count])
          {
            v9 = [(id)v2 sensorAccessoryUUID];
            BOOL v10 = v9 == 0;

            if (v10)
            {
              v29 = (void *)MEMORY[0x1D9452090]();
              id v30 = (id)v2;
              v31 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                v32 = HMFGetLogIdentifier();
                LODWORD(v38) = 138543362;
                *(void *)((char *)&v38 + 4) = v32;
                _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Removing unexpected sensor accessories as no sensor should be paired", (uint8_t *)&v38, 0xCu);
              }
              -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessoriesAndPair:](v30, v8);
              goto LABEL_29;
            }
            *(void *)&long long v38 = MEMORY[0x1E4F143A8];
            *((void *)&v38 + 1) = 3221225472;
            v39 = __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_25;
            v40 = &unk_1E6A10BD0;
            uint64_t v41 = v2;
            v11 = objc_msgSend(v8, "na_filter:", &v38);
            if ([v11 count])
            {
              v12 = (void *)MEMORY[0x1D9452090]();
              id v13 = (id)v2;
              v14 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                v15 = HMFGetLogIdentifier();
                LODWORD(buf) = 138543362;
                *(void *)((char *)&buf + 4) = v15;
                _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Removing unexpected sensor accessories", (uint8_t *)&buf, 0xCu);
              }
              -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v13, v11, 0);
            }
          }
          os_unfair_lock_lock_with_options();
          int v16 = *(unsigned __int8 *)(v2 + 12);
          os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
          if (v16)
          {
            v17 = (void *)MEMORY[0x1D9452090]();
            id v18 = (id)v2;
            v19 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              v20 = HMFGetLogIdentifier();
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v20;
              _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not checking HomePod sensor pairing status", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            objc_initWeak(&location, (id)v2);
            id v28 = objc_getProperty((id)v2, v27, 40, 1);
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            v35 = __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_26;
            v36 = &unk_1E6A10BF8;
            objc_copyWeak(v37, &location);
            [v28 isReadyToPairWithCompletion:&buf];

            objc_destroyWeak(v37);
            objc_destroyWeak(&location);
          }
LABEL_29:

          goto LABEL_30;
        }
        v21 = (void *)MEMORY[0x1D9452090]();
        id v22 = (id)v2;
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v26 = HMFGetLogIdentifier();
          LODWORD(v42) = 138543362;
          *(void *)((char *)&v42 + 4) = v26;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Cannot pair/check sensors yet as data source is not ready for pairing", (uint8_t *)&v42, 0xCu);
        }
      }
      else
      {
        v21 = (void *)MEMORY[0x1D9452090]();
        id v22 = (id)v2;
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v25 = HMFGetLogIdentifier();
          LODWORD(v42) = 138543362;
          *(void *)((char *)&v42 + 4) = v25;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Cannot pair/check sensors yet as no primary is confirmed", (uint8_t *)&v42, 0xCu);
        }
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x1D9452090]();
      id v22 = (id)v2;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        LODWORD(v42) = 138543362;
        *(void *)((char *)&v42 + 4) = v24;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot check and clean up existing HomePod sensor pairings with nil data source", (uint8_t *)&v42, 0xCu);
      }
    }

LABEL_30:
  }
}

uint64_t __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke()
{
  return 1;
}

- (void)_removeExistingSensorAccessoriesAndPair:(void *)a1
{
  id v3 = a2;
  Property = objc_getProperty(a1, v4, 72, 1);
  dispatch_assert_queue_V2(Property);
  objc_initWeak(&location, a1);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessoriesAndPair___block_invoke;
  v6[3] = &unk_1E6A16E40;
  objc_copyWeak(&v7, &location);
  -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](a1, v3, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  SEL v4 = [*(id *)(a1 + 32) sensorAccessoryUUID];
  uint64_t v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4) ^ 1;

  return v5;
}

- (void)_removeExistingSensorAccessories:(void *)a3 completion:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  id v18 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v5, 72, 1);
    dispatch_assert_queue_V2(Property);
    id v7 = dispatch_group_create();
    int v8 = (void *)MEMORY[0x1D9452090]();
    id val = a1;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      v33 = v10;
      __int16 v34 = 2112;
      id v35 = v19;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Removing HomePod sensor accessories %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, val);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = v19;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v28;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
          dispatch_group_enter(v7);
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __83__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessories_completion___block_invoke;
          v23[3] = &unk_1E6A15888;
          objc_copyWeak(&v26, (id *)buf);
          v24 = v7;
          v25 = v15;
          objc_msgSend(v15, "sendRemovalRequestWithCompletion:", v23, v18);

          objc_destroyWeak(&v26);
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v12);
    }

    v17 = objc_getProperty(val, v16, 72, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessories_completion___block_invoke_31;
    block[3] = &unk_1E6A19530;
    block[4] = val;
    id v22 = v18;
    dispatch_group_notify(v7, v17, block);

    objc_destroyWeak((id *)buf);
  }
}

void __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_26(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SEL v4 = WeakRetained;
  if (a2)
  {
    -[HMDAppleMediaAccessorySensorManager checkPairingStateAndStartADKIfUnpaired:](WeakRetained, (const char *)1);
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = v4;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      BOOL v10 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Not starting HomePod Sensor pairing as homepodsensed is not ready", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)checkPairingStateAndStartADKIfUnpaired:(void *)a1
{
  if (a1)
  {
    char v2 = (char)a2;
    Property = objc_getProperty(a1, a2, 72, 1);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __78__HMDAppleMediaAccessorySensorManager_checkPairingStateAndStartADKIfUnpaired___block_invoke;
    v5[3] = &unk_1E6A19B58;
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
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 72, 1);
    dispatch_assert_queue_V2(Property);
    objc_initWeak(&location, v2);
    id v6 = objc_getProperty(v2, v5, 40, 1);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__HMDAppleMediaAccessorySensorManager__checkPairingStateAndStartADKIfUnpaired___block_invoke;
    v7[3] = &unk_1E6A10C48;
    objc_copyWeak(&v8, &location);
    char v9 = v3;
    [v6 isPairedWithCompletion:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __79__HMDAppleMediaAccessorySensorManager__checkPairingStateAndStartADKIfUnpaired___block_invoke(uint64_t a1, int a2, char a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (!a2 || !WeakRetained)
  {
    char v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = v8;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      LODWORD(v14) = 138543362;
      *(void *)((char *)&v14 + 4) = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to check sensor pairing due to xpc client error", (uint8_t *)&v14, 0xCu);
    }
  }
  if (a2 && (a3 & 1) != 0 || !*(unsigned char *)(a1 + 40))
  {
    if (a2 && v8)
    {
      Property = objc_getProperty(v8, v7, 72, 1);
      *(void *)&long long v14 = MEMORY[0x1E4F143A8];
      *((void *)&v14 + 1) = 3221225472;
      v15 = __71__HMDAppleMediaAccessorySensorManager_performPairingFromPairingStatus___block_invoke;
      SEL v16 = &unk_1E6A19B58;
      v17 = v8;
      char v18 = a3;
      goto LABEL_14;
    }
  }
  else if (v8)
  {
    Property = objc_getProperty(v8, v7, 72, 1);
    *(void *)&long long v14 = MEMORY[0x1E4F143A8];
    *((void *)&v14 + 1) = 3221225472;
    v15 = __67__HMDAppleMediaAccessorySensorManager_startADKAndCheckPairingState__block_invoke;
    SEL v16 = &unk_1E6A19B30;
    v17 = v8;
LABEL_14:
    dispatch_async(Property, &v14);
  }
}

void __71__HMDAppleMediaAccessorySensorManager_performPairingFromPairingStatus___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return;
  }
  int v3 = *(unsigned __int8 *)(a1 + 40);
  Property = objc_getProperty(*(id *)(a1 + 32), a2, 72, 1);
  dispatch_assert_queue_V2(Property);
  os_unfair_lock_lock_with_options();
  int v5 = *(unsigned __int8 *)(v2 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  if (!v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
    if (!WeakRetained)
    {
      v20 = (void *)MEMORY[0x1D9452090]();
      id v21 = (id)v2;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v23;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform HomePod sensor pairing with nil data source", buf, 0xCu);
      }
      goto LABEL_41;
    }
    uint64_t v11 = [(id)v2 sensorAccessoryUUID];

    if (v11)
    {
      uint64_t v13 = [(id)v2 sensorAccessoryUUID];
      long long v14 = [WeakRetained accessoryWithUUID:v13 forAppleMediaAccessorySensorManager:v2];

      if (v14)
      {
        if (v3)
        {
          v15 = (void *)MEMORY[0x1D9452090]();
          id v16 = (id)v2;
          v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            char v18 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543618;
            *(void *)&uint8_t buf[4] = v18;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v14;
            _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@HomePod sensor (%@) is already paired -- no action needed", buf, 0x16u);
          }
          [(HMDAppleMediaAccessorySensorManager *)(id *)v16 _updateServiceNameIfRequired];
        }
        else
        {
          long long v38 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
          -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v2, 0, v38, 3);

          v39 = (void *)MEMORY[0x1D9452090]();
          id v40 = (id)v2;
          uint64_t v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            long long v42 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543618;
            *(void *)&uint8_t buf[4] = v42;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v14;
            _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@HomePod sensor is not paired but there is a paired accessory in the home, removing existing sensor: %@", buf, 0x16u);
          }
          *(void *)long long buf = v14;
          v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
          -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessoriesAndPair:](v40, v43);
        }
      }
      else
      {
        long long v30 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
        -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v2, 0, v30, 1);

        v31 = (void *)MEMORY[0x1D9452090]();
        id v32 = (id)v2;
        v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          __int16 v34 = HMFGetLogIdentifier();
          id v35 = [v32 sensorAccessoryUUID];
          *(_DWORD *)long long buf = 138543618;
          *(void *)&uint8_t buf[4] = v34;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v35;
          _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@HomePod sensor is missing, expected accessory with UUID: %@", buf, 0x16u);
        }
        v37 = objc_getProperty(v32, v36, 72, 1);
        dispatch_assert_queue_V2(v37);
      }
      goto LABEL_41;
    }
    if (v3)
    {
      v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v2, 0, v24, 2);

      v25 = (void *)MEMORY[0x1D9452090]();
      id v26 = (id)v2;
      long long v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        long long v28 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v28;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@HomePod sensor is paired but not to any accessory in the home, resetting pairing", buf, 0xCu);
      }
      [(HMDAppleMediaAccessorySensorManager *)v26 _resetSensorPairingAndPair];
      goto LABEL_41;
    }
    v44 = objc_getProperty((id)v2, v12, 72, 1);
    dispatch_assert_queue_V2(v44);
    id v45 = objc_loadWeakRetained((id *)(v2 + 48));
    if (v45)
    {
      os_unfair_lock_lock_with_options();
      if (!*(unsigned char *)(v2 + 12))
      {
        *(unsigned char *)(v2 + 12) = 1;
        [MEMORY[0x1E4F6A278] currentTime];
        *(void *)(v2 + 32) = v51;
        [*(id *)(v2 + 88) removeAllObjects];
        os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
        v52 = [v45 fetchSentinelZoneDidFinishFutureForAppleMediaAccessorySensorManager:v2];
        if (v52)
        {
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke;
          v62 = &unk_1E6A19730;
          id v63 = v45;
          uint64_t v64 = v2;
          id v53 = (id)[v52 addSuccessBlock:buf];
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v60[2] = __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_42;
          v60[3] = &unk_1E6A197F0;
          v60[4] = v2;
          id v54 = (id)[v52 addFailureBlock:v60];
        }
        else
        {
          v55 = (void *)MEMORY[0x1D9452090]();
          id v56 = (id)v2;
          v57 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            v58 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            *(void *)&uint8_t buf[4] = v58;
            _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_ERROR, "%{public}@Cannot pair HomePod sensor as zone fetch succeeded future is nil", buf, 0xCu);
          }
          v59 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
          -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v56, 0, v59, 12);

          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v2 + 12) = 0;
          *(void *)(v2 + 32) = 0;
          os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
        }

        goto LABEL_40;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
      uint64_t v46 = (void *)MEMORY[0x1D9452090]();
      id v47 = (id)v2;
      v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        v49 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v49;
        _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_INFO, "%{public}@Not starting HomePod Sensor pairing as a pairing is already in progress", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v46 = (void *)MEMORY[0x1D9452090]();
      id v47 = (id)v2;
      v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v50 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v50;
        _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform HomePod sensor pairing with nil data source", buf, 0xCu);
      }
    }

LABEL_40:

LABEL_41:
    return;
  }
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = (id)v2;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    char v9 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not checking HomePod sensor pairing status", buf, 0xCu);
  }
}

- (void)logPairingSuccess:(void *)a3 error:(uint64_t)a4 setupFailureReason:
{
  if (a1)
  {
    id v7 = (id *)(a1 + 48);
    id v8 = a3;
    id WeakRetained = objc_loadWeakRetained(v7);
    id v13 = [WeakRetained logSubmitterForAppleMediaAccessorySensorManager:a1];

    id v10 = [HMDHomePodSensorPairingLogEvent alloc];
    os_unfair_lock_lock_with_options();
    double v11 = *(double *)(a1 + 32);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    uint64_t v12 = [(HMDHomePodSensorPairingLogEvent *)v10 initWithStartTime:a2 pairingSuccess:a4 failureReason:v11];
    [v13 submitLogEvent:v12 error:v8];
  }
}

- (void)_resetSensorPairingAndPair
{
  if (a1)
  {
    Property = objc_getProperty(a1, a2, 72, 1);
    dispatch_assert_queue_V2(Property);
    objc_initWeak(&location, a1);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __65__HMDAppleMediaAccessorySensorManager__resetSensorPairingAndPair__block_invoke;
    v4[3] = &unk_1E6A10BF8;
    objc_copyWeak(&v5, &location);
    -[HMDAppleMediaAccessorySensorManager _resetWithCompletion:](a1, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_updateServiceNameIfRequired
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    Property = objc_getProperty(a1, a2, 72, 1);
    dispatch_assert_queue_V2(Property);
    SEL v4 = [a1 sensorAccessoryUUID];
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 6);
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
                v17 = [v16 characteristics];
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
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  Property = objc_getProperty((id)a1, v7, 72, 1);
  dispatch_assert_queue_V2(Property);
  char v9 = [v5 service];
  if (v9)
  {
    os_unfair_lock_lock_with_options();
    int v10 = *(void **)(a1 + 88);
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
          int v16 = [v15 isEqualToString:*MEMORY[0x1E4F2CF48]];

          if (v16)
          {
            v17 = [v5 value];
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
                uint64_t v33 = (void *)MEMORY[0x1D9452090]();
                id v34 = (id)a1;
                id v35 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  SEL v36 = HMFGetLogIdentifier();
                  int v37 = 138543618;
                  long long v38 = v36;
                  __int16 v39 = 2112;
                  id v40 = v9;
                  _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Renaming sensor service as it has no configured name: %@ ", (uint8_t *)&v37, 0x16u);
                }
                -[HMDAppleMediaAccessorySensorManager _updateServiceName:service:accessoryUUID:]((uint64_t)v34, v19, v9, v6);
              }
            }
            else
            {
              long long v29 = (void *)MEMORY[0x1D9452090]();
              id v30 = (id)a1;
              v31 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                id v32 = HMFGetLogIdentifier();
                int v37 = 138543874;
                long long v38 = v32;
                __int16 v39 = 2112;
                id v40 = v9;
                __int16 v41 = 2112;
                id v42 = v5;
                _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Name for sensor service is nil %@/%@", (uint8_t *)&v37, 0x20u);
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
        long long v25 = (void *)MEMORY[0x1D9452090]();
        id v26 = (id)a1;
        long long v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          long long v28 = HMFGetLogIdentifier();
          int v37 = 138543618;
          long long v38 = v28;
          __int16 v39 = 2112;
          id v40 = v5;
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@No accessory for characteristic: %@", (uint8_t *)&v37, 0x16u);
        }
      }
    }
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = (id)a1;
    long long v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v24 = HMFGetLogIdentifier();
      int v37 = 138543618;
      long long v38 = v24;
      __int16 v39 = 2112;
      id v40 = v5;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@No service for characteristic: %@", (uint8_t *)&v37, 0x16u);
    }
  }
}

- (void)_readCharacteristicAndUpdateNameIfNeeded:(void *)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  Property = objc_getProperty(a1, v4, 72, 1);
  dispatch_assert_queue_V2(Property);
  id v6 = [v3 accessory];
  SEL v7 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Locally reading name for sensor service %@/%@", buf, 0x20u);
    }
    uint64_t v13 = +[HMDCharacteristicRequest requestWithCharacteristic:v3];
    uint64_t v20 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    id v16 = objc_getProperty(v8, v15, 72, 1);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __80__HMDAppleMediaAccessorySensorManager__readCharacteristicAndUpdateNameIfNeeded___block_invoke;
    v18[3] = &unk_1E6A178E0;
    v18[4] = v8;
    id v19 = v3;
    [v6 readCharacteristicValues:v14 source:7 queue:v16 completionHandler:v18];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v22 = v17;
      __int16 v23 = 2112;
      id v24 = v3;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@No accessory for characteristic: %@", buf, 0x16u);
    }
  }
}

- (void)_updateServiceName:(void *)a3 service:(void *)a4 accessoryUUID:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    Property = objc_getProperty((id)a1, v9, 72, 1);
    dispatch_assert_queue_V2(Property);
    os_unfair_lock_lock_with_options();
    uint64_t v12 = *(void **)(a1 + 88);
    uint64_t v13 = [v8 instanceID];
    LOBYTE(v12) = [v12 containsObject:v13];

    if (v12)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    }
    else
    {
      uint64_t v14 = *(void **)(a1 + 88);
      SEL v15 = [v8 instanceID];
      [v14 addObject:v15];

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      id v16 = (void *)MEMORY[0x1D9452090]();
      v17 = (id *)(id)a1;
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
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Renaming service %@ on accessory %@ to %@ after sensor pairing", (uint8_t *)&v21, 0x2Au);
      }
      id WeakRetained = objc_loadWeakRetained(v17 + 6);
      [WeakRetained renameService:v8 name:v7];
    }
  }
}

- (void)_readDefaultSensorNameAndUpdateToNameIfNeeded:(void *)a3 service:(void *)a4 accessoryUUID:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  Property = objc_getProperty(a1, v10, 72, 1);
  dispatch_assert_queue_V2(Property);
  id v13 = objc_getProperty(a1, v12, 40, 1);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __107__HMDAppleMediaAccessorySensorManager__readDefaultSensorNameAndUpdateToNameIfNeeded_service_accessoryUUID___block_invoke;
  v17[3] = &unk_1E6A10C98;
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
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
        Property = objc_getProperty(v13, v6, 72, 1);
        id v15 = a1[4];
      }
      else
      {
        id v15 = 0;
        Property = 0;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __107__HMDAppleMediaAccessorySensorManager__readDefaultSensorNameAndUpdateToNameIfNeeded_service_accessoryUUID___block_invoke_58;
      block[3] = &unk_1E6A190C0;
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
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      SEL v10 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v22 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Fetched nil sensor name from adk", buf, 0xCu);
    }
  }
LABEL_12:
}

void __107__HMDAppleMediaAccessorySensorManager__readDefaultSensorNameAndUpdateToNameIfNeeded_service_accessoryUUID___block_invoke_58(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Renaming sensor service as name (%@) or configured name (%@) matches default accessory name: %@", (uint8_t *)&v9, 0x2Au);
  }
  -[HMDAppleMediaAccessorySensorManager _updateServiceName:service:accessoryUUID:](*(void *)(a1 + 32), *(void **)(a1 + 56), *(void **)(a1 + 40), *(void **)(a1 + 64));
}

void __80__HMDAppleMediaAccessorySensorManager__readCharacteristicAndUpdateNameIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  SEL v4 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Received response for read of name for %@", (uint8_t *)&v14, 0x16u);
  }
  if (objc_msgSend(v3, "na_all:", &__block_literal_global_126069))
  {
    -[HMDAppleMediaAccessorySensorManager _updateServiceNameIfRequired](*(void *)(a1 + 32));
  }
  else
  {
    int v9 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Local read of name for %@ did not succeed: %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

BOOL __80__HMDAppleMediaAccessorySensorManager__readCharacteristicAndUpdateNameIfNeeded___block_invoke_55(uint64_t a1, void *a2)
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
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = WeakRetained;
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v10 = 138543362;
      __int16 v11 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Reset HomePod sensor and ready to pair", (uint8_t *)&v10, 0xCu);
    }
    -[HMDAppleMediaAccessorySensorManager cleanUpExistingAccessoriesAndStartADKIfReady](v5);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      __int16 v11 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to reset HomePod sensor due to xpc client error", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_resetWithCompletion:(void *)a1
{
  id v6 = a2;
  Property = objc_getProperty(a1, v3, 72, 1);
  dispatch_assert_queue_V2(Property);
  objc_msgSend(objc_getProperty(a1, v5, 40, 1), "resetWithCompletion:", v6);
}

- (void)setIsCurrentlyPairing:(uint64_t)a1
{
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 12) = 0;
    *(void *)(a1 + 32) = 0;
    os_unfair_lock_unlock(v2);
  }
}

void __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) accountHasSentinelZoneForAppleMediaAccessorySensorManager:*(void *)(a1 + 40)])
  {
    BOOL v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v26 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Cannot pair HomePod sensor as sentinel zone was detected in HH1, relaunch imminent", buf, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v8, 0, v9, 10);

    -[HMDAppleMediaAccessorySensorManager setIsCurrentlyPairing:](*(void *)(a1 + 40));
  }
  else
  {
    int v10 = HMFRandomDataWithLength();
    __int16 v11 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 40);
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v26 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Starting HomePod Sensor pairing", buf, 0xCu);
    }
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    id Property = *(id *)(a1 + 40);
    if (Property) {
      id Property = objc_getProperty(Property, v16, 40, 1);
    }
    id v18 = Property;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_33;
    v21[3] = &unk_1E6A10C70;
    objc_copyWeak(&v24, (id *)buf);
    id v19 = v10;
    id v22 = v19;
    id v20 = v11;
    id v23 = v20;
    [v18 setupPairing:v19 uuid:v20 completion:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
}

void __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v10 = 138543362;
    __int16 v11 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Cannot pair HomePod sensor as zone fetch succeeded future failed", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v8, 0, v9, 11);

  -[HMDAppleMediaAccessorySensorManager setIsCurrentlyPairing:](*(void *)(a1 + 32));
}

void __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_33(uint64_t a1, int a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = WeakRetained;
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = HMFGetLogIdentifier();
    __int16 v11 = @"failed with xpc error";
    *(_DWORD *)id v20 = 138543874;
    *(void *)&v20[4] = v10;
    *(_WORD *)&v20[12] = 2112;
    if (a2) {
      __int16 v11 = @"completed";
    }
    *(void *)&v20[14] = v11;
    *(_WORD *)&v20[22] = 2112;
    int v21 = v5;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@HomePod Sensor pairing %@ - pairing URI: %@", v20, 0x20u);
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
      id Property = objc_getProperty(v8, v16, 72, 1);
      *(void *)id v20 = MEMORY[0x1E4F143A8];
      *(void *)&v20[8] = 3221225472;
      *(void *)&v20[16] = __75__HMDAppleMediaAccessorySensorManager_pairWithURI_authToken_authTokenUUID___block_invoke;
      int v21 = &unk_1E6A18668;
      id v22 = v8;
      id v23 = v14;
      id v24 = v15;
      id v25 = v17;
      dispatch_async(Property, v20);
    }
  }
  else
  {
    id v19 = objc_msgSend(MEMORY[0x1E4F28C58], "hmErrorWithCode:", -1, *(void *)v20, *(void *)&v20[8]);
    -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v8, 0, v19, 4);

    -[HMDAppleMediaAccessorySensorManager setIsCurrentlyPairing:]((uint64_t)v8);
  }
}

void __75__HMDAppleMediaAccessorySensorManager_pairWithURI_authToken_authTokenUUID___block_invoke(uint64_t a1)
{
  v46[1] = *(id *)MEMORY[0x1E4F143B8];
  v1 = *(id **)(a1 + 32);
  id v2 = *(void **)(a1 + 48);
  id v3 = *(void **)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v42 = v2;
  id v6 = v3;
  if (v1)
  {
    id Property = objc_getProperty(v1, v5, 72, 1);
    dispatch_assert_queue_V2(Property);
    id WeakRetained = objc_loadWeakRetained(v1 + 6);
    if (!WeakRetained)
    {
      uint64_t v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = v1;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor pairing with nil data source", buf, 0xCu);
      }
      __int16 v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v13, 0, v16, 6);

      os_unfair_lock_lock_with_options();
      *((unsigned char *)v13 + 12) = 0;
      v13[4] = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)v13 + 2);
      goto LABEL_23;
    }
    id v9 = v4;
    int v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
    if (v10)
    {
      if ([MEMORY[0x1E4F2E630] isHAPSetupPayloadURL:v10])
      {
        __int16 v11 = (void *)[objc_alloc(MEMORY[0x1E4F2EAD8]) initWithHAPSetupPayloadURL:v10 error:0];
LABEL_15:

        if (v11)
        {
          id v22 = objc_alloc(MEMORY[0x1E4F2EAD0]);
          id v23 = [WeakRetained homeUUIDForAppleMediaAccessorySensorManager:v1];
          id v24 = (void *)[v22 initWithSetupAccessoryPayload:v11 appID:0 homeUUID:v23 ownershipToken:0];
          objc_setProperty_atomic(v1, v25, v24, 56);

          uint64_t v27 = objc_msgSend(objc_getProperty(v1, v26, 56, 1), "updateWithAuthToken:uuid:", v42, v6);
          id v28 = (void *)MEMORY[0x1D9452090](v27);
          uint64_t v29 = v1;
          id v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = HMFGetLogIdentifier();
            id v33 = objc_getProperty(v29, v32, 56, 1);
            *(_DWORD *)long long buf = 138543618;
            *(void *)&uint8_t buf[4] = v31;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v33;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Starting HomePod sensor pairing with accessory description: %@", buf, 0x16u);
          }
          id v34 = [WeakRetained accessoryBrowserForAppleMediaAccessorySensorManager:v29];
          [v34 startDiscoveringAccessoriesWithLinkType:1];
          objc_initWeak(&location, v29);
          id v36 = objc_getProperty(v29, v35, 56, 1);
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __76__HMDAppleMediaAccessorySensorManager__pairWithURI_authToken_authTokenUUID___block_invoke;
          id v45 = &unk_1E6A18528;
          objc_copyWeak(v46, &location);
          [WeakRetained performLocalAddAccessoryWithDescription:v36 progressHandlerDelegate:v29 completion:buf];

          objc_destroyWeak(v46);
          objc_destroyWeak(&location);
        }
        else
        {
          int v37 = (void *)MEMORY[0x1D9452090]();
          long long v38 = v1;
          __int16 v39 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            id v40 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            *(void *)&uint8_t buf[4] = v40;
            _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor pairing with nil accessory payload", buf, 0xCu);
          }
          __int16 v41 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
          -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v38, 0, v41, 5);

          os_unfair_lock_lock_with_options();
          *((unsigned char *)v38 + 12) = 0;
          v38[4] = 0;
          os_unfair_lock_unlock((os_unfair_lock_t)v38 + 2);
        }

LABEL_23:
        goto LABEL_24;
      }
      id v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = v1;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v21 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not create setup payload from invalid HAP setup payload url string: %@", buf, 0x16u);
      }
    }
    else
    {
      id v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = v1;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil setup payload for url string: %@", buf, 0x16u);
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
    id Property = objc_getProperty(self, v4, 72, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HMDAppleMediaAccessorySensorManager_handleLocalAddCompletedWithError___block_invoke;
    block[3] = &unk_1E6A197C8;
    block[4] = self;
    id v9 = v5;
    dispatch_async(Property, block);
  }
}

void __72__HMDAppleMediaAccessorySensorManager_handleLocalAddCompletedWithError___block_invoke(uint64_t a1)
{
  v27[1] = *(id *)MEMORY[0x1E4F143B8];
  v1 = *(id **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (v1)
  {
    id Property = objc_getProperty(v1, v2, 72, 1);
    dispatch_assert_queue_V2(Property);
    id WeakRetained = objc_loadWeakRetained(v1 + 6);
    id v6 = [WeakRetained accessoryBrowserForAppleMediaAccessorySensorManager:v1];
    id v7 = (void *)MEMORY[0x1D9452090]();
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
        *(void *)&buf[14] = objc_getProperty(v8, v12, 56, 1);
        *(_WORD *)&buf[22] = 2112;
        SEL v26 = v3;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to add HomePod sensor accessory: %@ - %@", buf, 0x20u);
      }
      objc_msgSend(v6, "cancelPairingWithAccessoryDescription:error:", objc_getProperty(v8, v13, 56, 1), v3);
      -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)v8, 0);
      objc_setProperty_atomic(v8, v14, 0, 56);
      objc_msgSend(objc_getProperty(v8, v15, 64, 1), "saveSensorUUID:", 0);
      objc_initWeak(&location, v8);
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __73__HMDAppleMediaAccessorySensorManager__handleLocalAddCompletedWithError___block_invoke;
      SEL v26 = &unk_1E6A10BF8;
      objc_copyWeak(v27, &location);
      -[HMDAppleMediaAccessorySensorManager _resetWithCompletion:](v8, buf);
      objc_destroyWeak(v27);
      objc_destroyWeak(&location);
      uint64_t v16 = 7;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = HMFGetLogIdentifier();
        id v18 = [v8 sensorAccessoryUUID];
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully added HomePod sensor accessory %@", buf, 0x16u);
      }
      objc_setProperty_atomic(v8, v19, 0, 56);
      id v21 = objc_getProperty(v8, v20, 64, 1);
      id v22 = [v8 sensorAccessoryUUID];
      [v21 saveSensorUUID:v22];

      [(HMDAppleMediaAccessorySensorManager *)v8 _updateServiceNameIfRequired];
      os_unfair_lock_lock_with_options();
      *((unsigned char *)v8 + 12) = 0;
      v8[4] = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
      uint64_t v16 = 0;
    }
    [v6 stopDiscoveringForUnpairedAccessoriesWithLinkType:1];
    -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v8, v3 == 0, v3, v16);
  }
}

- (void)setSensorAccessoryUUID:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v3 = [v5 copy];
    id v4 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v3;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
}

void __73__HMDAppleMediaAccessorySensorManager__handleLocalAddCompletedWithError___block_invoke(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HMDAppleMediaAccessorySensorManager setIsCurrentlyPairing:]((uint64_t)WeakRetained);
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = WeakRetained;
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = HMFGetLogIdentifier();
      LODWORD(v12) = 138543362;
      *(void *)((char *)&v12 + 4) = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Reset HomePod sensor after failed pairing", (uint8_t *)&v12, 0xCu);
    }
    if (v5)
    {
      id Property = objc_getProperty(v5, v9, 72, 1);
      *(void *)&long long v12 = MEMORY[0x1E4F143A8];
      *((void *)&v12 + 1) = 3221225472;
      SEL v13 = __60__HMDAppleMediaAccessorySensorManager_scheduleRetryIfNeeded__block_invoke;
      SEL v14 = &unk_1E6A19B30;
      id v15 = v5;
      dispatch_async(Property, &v12);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = HMFGetLogIdentifier();
      LODWORD(v12) = 138543362;
      *(void *)((char *)&v12 + 4) = v11;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to reset HomePod sensor due to xpc client error", (uint8_t *)&v12, 0xCu);
    }
  }
}

void __60__HMDAppleMediaAccessorySensorManager_scheduleRetryIfNeeded__block_invoke(uint64_t a1, const char *a2)
{
  v22[3] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id Property = objc_getProperty(*(id *)(a1 + 32), a2, 72, 1);
    dispatch_assert_queue_V2(Property);
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
    if (WeakRetained)
    {
      os_unfair_lock_lock_with_options();
      if ((*(unsigned char *)(v2 + 15) & 1) != 0 || (id v5 = *(char **)(v2 + 80), (unint64_t)v5 >= 0x32))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
      }
      else
      {
        *(void *)(v2 + 80) = v5 + 1;
        *(unsigned char *)(v2 + 15) = 1;
        os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
        if ((unint64_t)v5 >= [&unk_1F2DC6F10 count]) {
          id v5 = (char *)([&unk_1F2DC6F10 count] - 1);
        }
        id v6 = [&unk_1F2DC6F10 objectAtIndexedSubscript:v5];
        id v7 = (void *)MEMORY[0x1D9452090]();
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
          id v21 = (void *)[v6 integerValue];
          _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Will retry (# %ld) HomePod sensor pairing after %ld sec", buf, 0x20u);
        }
        objc_initWeak(&location, v8);
        [v6 doubleValue];
        double v12 = v11;
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __61__HMDAppleMediaAccessorySensorManager__scheduleRetryIfNeeded__block_invoke;
        id v21 = &unk_1E6A15B88;
        objc_copyWeak(v22, &location);
        v22[1] = v5;
        id v14 = objc_getProperty(v8, v13, 72, 1);
        [WeakRetained performAfterDelay:buf block:v14 queue:v12];

        objc_destroyWeak(v22);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      id v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = (id)v2;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v18;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot schedule retry due to nil data source", buf, 0xCu);
      }
    }
  }
}

void __61__HMDAppleMediaAccessorySensorManager__scheduleRetryIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_lock_lock_with_options();
    *((unsigned char *)WeakRetained + 15) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
    uint64_t v3 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Performing sensor paring retry (# %ld)", (uint8_t *)&v8, 0x16u);
    }
    -[HMDAppleMediaAccessorySensorManager cleanUpExistingAccessoriesAndStartADKIfReady](v4);
  }
}

void __67__HMDAppleMediaAccessorySensorManager_startADKAndCheckPairingState__block_invoke(uint64_t a1, const char *a2)
{
  v13[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id Property = objc_getProperty(*(id *)(a1 + 32), a2, 72, 1);
    dispatch_assert_queue_V2(Property);
    os_unfair_lock_lock_with_options();
    int v4 = *(unsigned __int8 *)(v2 + 12);
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
    if (v4)
    {
      id v5 = (void *)MEMORY[0x1D9452090]();
      id v6 = (id)v2;
      uint64_t v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not going to restart ADK", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      objc_initWeak(&location, (id)v2);
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v11 = __68__HMDAppleMediaAccessorySensorManager__startADKAndCheckPairingState__block_invoke;
      uint64_t v12 = &unk_1E6A10BF8;
      objc_copyWeak(v13, &location);
      -[HMDAppleMediaAccessorySensorManager startSensorClientWithCompletion:](v2, &buf);
      objc_destroyWeak(v13);
      objc_destroyWeak(&location);
    }
  }
}

void __68__HMDAppleMediaAccessorySensorManager__startADKAndCheckPairingState__block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (a2 && WeakRetained)
  {
    -[HMDAppleMediaAccessorySensorManager checkPairingStateAndStartADKIfUnpaired:](WeakRetained, 0);
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = v4;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      __int16 v10 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Starting the HomePod sensor manager to check pairing failed", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)startSensorClientWithCompletion:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    id Property = objc_getProperty((id)a1, v3, 72, 1);
    dispatch_assert_queue_V2(Property);
    os_unfair_lock_lock_with_options();
    int v6 = *(unsigned __int8 *)(a1 + 12);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v6)
    {
      int v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = (id)a1;
      __int16 v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        int v12 = 138543362;
        SEL v13 = v11;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not starting adk again", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      objc_msgSend(objc_getProperty((id)a1, v7, 40, 1), "startWithCompletion:", v4);
    }
  }
}

void __83__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessories_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  uint64_t v7 = HMFGetOSLogHandle();
  int v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 40);
      int v16 = 138543874;
      id v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      id v21 = v3;
      uint64_t v11 = "%{public}@Unable to remove existing HomePod sensor accessory: %@ - %@";
      int v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v12, v13, v11, (uint8_t *)&v16, v14);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v15 = *(void *)(a1 + 40);
    int v16 = 138543618;
    id v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    uint64_t v11 = "%{public}@Removed HomePod sensor accessory %@";
    int v12 = v8;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 22;
    goto LABEL_6;
  }
}

uint64_t __83__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessories_completion___block_invoke_31(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    int v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Removed HomePod sensor accessories", (uint8_t *)&v7, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __79__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessoriesAndPair___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = WeakRetained;
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Resetting sensor uuid after sensor removal", buf, 0xCu);
  }
  -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)v3, 0);
  if (v3) {
    id Property = objc_getProperty(v3, v6, 64, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessoriesAndPair___block_invoke_32;
  v8[3] = &unk_1E6A197F0;
  v8[4] = v3;
  [Property saveSensorUUID:0 completion:v8];
}

void __79__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessoriesAndPair___block_invoke_32(uint64_t a1, const char *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id Property = objc_getProperty(*(id *)(a1 + 32), a2, 72, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__HMDAppleMediaAccessorySensorManager_resetSensorPairingAndPair__block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = v2;
    dispatch_async(Property, block);
  }
}

void __64__HMDAppleMediaAccessorySensorManager_resetSensorPairingAndPair__block_invoke(uint64_t a1, const char *a2)
{
}

- (void)fetchADKSensorStatusCompletion:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 40, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__HMDAppleMediaAccessorySensorManager_fetchADKSensorStatusCompletion___block_invoke;
  v8[3] = &unk_1E6A10CC0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [Property getCurrentStatusWithCompletion:v8];
}

uint64_t __70__HMDAppleMediaAccessorySensorManager_fetchADKSensorStatusCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch sensor status from adk", (uint8_t *)&v9, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)handleCharacteristicsChangedNotification:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 72, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__HMDAppleMediaAccessorySensorManager_handleCharacteristicsChangedNotification___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __80__HMDAppleMediaAccessorySensorManager_handleCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) userInfo];
  if (v1)
  {
    id Property = objc_getProperty(v1, v2, 72, 1);
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self && (id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource)) != 0)
  {
    uint64_t v6 = WeakRetained;
    if ([WeakRetained isReadyForSensorPairing:self])
    {
      [(HMDAppleMediaAccessorySensorManager *)self sensorAccessoryUUID];
      if (objc_claimAutoreleasedReturnValue()) {
        __assert_rtn("-[HMDAppleMediaAccessorySensorManager localAccessoryAddRequiresConsent:]", "HMDAppleMediaAccessorySensorManager.m", 1253, "!self.sensorAccessoryUUID");
      }
      uint64_t v7 = (void *)MEMORY[0x1D9452090]();
      uint64_t v8 = self;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        int v21 = 138543618;
        uint64_t v22 = v10;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Confirming HomePod sensor with UUID %@ is allowed to be added locally", (uint8_t *)&v21, 0x16u);
      }
      -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)v8, v4);
      long long v11 = [v6 accessoryBrowserForAppleMediaAccessorySensorManager:v8];
      objc_msgSend(v11, "didReceiveUserConsentResponseForSetupAccessoryDetail:consent:", objc_getProperty(v8, v12, 56, 1), 1);
    }
    else
    {
      id v17 = (void *)MEMORY[0x1D9452090]();
      __int16 v18 = self;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        int v21 = 138543618;
        uint64_t v22 = v20;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Not consenting to accessory local add for %@ as data source is no longer ready for pairing", (uint8_t *)&v21, 0x16u);
      }
    }
  }
  else
  {
    long long v13 = (void *)MEMORY[0x1D9452090]();
    long long v14 = self;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      int v21 = 138543618;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Not consenting to accessory local add for %@ with nil data source", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)handleErrorCaseTestMessage:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 72, 1);
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

    if (v9)
    {
      long long v11 = [v5 messagePayload];
      SEL v12 = [v11 objectForKey:*MEMORY[0x1E4F2C9D0]];

      long long v13 = [v5 messagePayload];
      long long v14 = [v13 objectForKey:*MEMORY[0x1E4F2C9D8]];
      BOOL v15 = v14 != 0;

      id v16 = [v5 messagePayload];
      id v17 = [v16 objectForKey:*MEMORY[0x1E4F2C9C0]];
      BOOL v18 = v17 != 0;

      uint64_t v19 = dispatch_group_create();
      dispatch_group_enter(v19);
      if (v12)
      {
        if (self) {
          id v21 = objc_getProperty(self, v20, 40, 1);
        }
        else {
          id v21 = 0;
        }
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke;
        v35[3] = &unk_1E6A10C20;
        v35[4] = self;
        BOOL v38 = v18;
        id v36 = v19;
        id v37 = v9;
        BOOL v39 = v15;
        [v21 resetWithCompletion:v35];

        uint64_t v22 = v36;
      }
      else
      {
        if (self) {
          id v24 = objc_getProperty(self, v20, 72, 1);
        }
        else {
          id v24 = 0;
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_5;
        block[3] = &unk_1E6A12D20;
        BOOL v33 = v18;
        id v30 = v19;
        v31 = self;
        id v32 = v9;
        BOOL v34 = v15;
        dispatch_async(v24, block);

        uint64_t v22 = v30;
      }

      if (self) {
        SEL v26 = objc_getProperty(self, v25, 72, 1);
      }
      else {
        SEL v26 = 0;
      }
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      id v27[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_8;
      v27[3] = &unk_1E6A197C8;
      v27[4] = self;
      id v28 = v5;
      dispatch_group_notify(v19, v26, v27);
    }
    else
    {
      [(HMDAppleMediaAccessorySensorManager *)self cleanUpExistingAccessoriesAndStartADKIfReady];
      __int16 v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v5 respondWithError:v23];
    }
  }
  else
  {
    id WeakRetained = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v5 respondWithError:WeakRetained];
  }
}

void __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke(uint64_t a1, const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    id Property = objc_getProperty(v3, a2, 72, 1);
  }
  else {
    id Property = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_2;
  v7[3] = &unk_1E6A12D20;
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
  v13[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    uint64_t v2 = *(void **)(a1 + 40);
    v13[0] = *(void *)(a1 + 48);
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_6;
    v10[3] = &unk_1E6A19B30;
    id v4 = &v11;
    id v11 = *(id *)(a1 + 32);
    -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v2, v3, v10);

    id v5 = [MEMORY[0x1E4F29128] UUID];
    -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:](*(void *)(a1 + 40), v5);

LABEL_5:
    goto LABEL_6;
  }
  if (*(unsigned char *)(a1 + 57))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_7;
    v8[3] = &unk_1E6A19B30;
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
  v13[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    uint64_t v2 = *(void **)(a1 + 40);
    v13[0] = *(void *)(a1 + 48);
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_3;
    v10[3] = &unk_1E6A19B30;
    id v4 = &v11;
    id v11 = *(id *)(a1 + 32);
    -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v2, v3, v10);

    id v5 = [MEMORY[0x1E4F29128] UUID];
    -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:](*(void *)(a1 + 40), v5);

LABEL_5:
    goto LABEL_6;
  }
  if (*(unsigned char *)(a1 + 57))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_4;
    v8[3] = &unk_1E6A19B30;
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
    self = (HMDAppleMediaAccessorySensorManager *)objc_getProperty(self, a2, 72, 1);
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
}

- (void)configureWithDataSource:(id)a3 hpsXPCClient:(id)a4 dataStore:(id)a5
{
  id v8 = a5;
  if (self)
  {
    id v9 = a4;
    objc_storeWeak((id *)&self->_dataSource, a3);
    objc_setProperty_atomic(self, v10, v9, 40);

    objc_setProperty_atomic(self, v11, v8, 64);
    id Property = objc_getProperty(self, v12, 72, 1);
  }
  else
  {
    id Property = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke;
  v15[3] = &unk_1E6A197C8;
  v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  dispatch_async(Property, v15);
}

uint64_t __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke_2;
  v4[3] = &unk_1E6A18288;
  void v4[4] = v2;
  return [v2 _migrateToDataStoreIfNeeded:v1 completion:v4];
}

void __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke_2(uint64_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id Property = *(NSObject **)(a1 + 32);
    if (Property)
    {
      id Property = objc_getProperty(Property, a2, 72, 1);
      uint64_t v4 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v4 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke_3;
    block[3] = &unk_1E6A19B30;
    void block[4] = v4;
    dispatch_async(Property, block);
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      SEL v11 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor manager with failed migration", buf, 0xCu);
    }
  }
}

void __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke_3(uint64_t a1, const char *a2)
{
  v19[2] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(id **)(a1 + 32);
  if (v2)
  {
    id Property = objc_getProperty(*(id *)(a1 + 32), a2, 72, 1);
    dispatch_assert_queue_V2(Property);
    id WeakRetained = objc_loadWeakRetained(v2 + 6);
    if (WeakRetained)
    {
      objc_getProperty(v2, v4, 40, 1);
      if ([(id)objc_opt_class() supportSensory])
      {
        objc_initWeak(&location, v2);
        objc_initWeak(&v13, WeakRetained);
        id v7 = objc_getProperty(v2, v6, 64, 1);
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        id v16 = __45__HMDAppleMediaAccessorySensorManager__start__block_invoke;
        id v17 = &unk_1E6A10BA8;
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
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = v2;
      SEL v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Cannot start HomePod sensor manager as device does not support sensors", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = v2;
      SEL v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        SEL v11 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor manager with nil data source", (uint8_t *)&buf, 0xCu);
      }
    }

    goto LABEL_11;
  }
}

void __45__HMDAppleMediaAccessorySensorManager__start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SEL v6 = (id *)(a1 + 40);
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)WeakRetained, v3);
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = WeakRetained;
  if (v7 && WeakRetained)
  {
    SEL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      SEL v11 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Local HomePod paired sensor UUID: %@", buf, 0x16u);
    }
    id Property = objc_getProperty(v9, v12, 72, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__HMDAppleMediaAccessorySensorManager__start__block_invoke_12;
    block[3] = &unk_1E6A177A8;
    void block[4] = v9;
    id v14 = Property;
    objc_copyWeak(&v18, v4);
    objc_copyWeak(&v19, v6);
    dispatch_async(v14, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
  }
  else
  {
    BOOL v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v21 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Cannot continue starting HomePod sensor manager with nil data source", buf, 0xCu);
    }
  }
}

void __45__HMDAppleMediaAccessorySensorManager__start__block_invoke_12(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__HMDAppleMediaAccessorySensorManager__start__block_invoke_2;
  v3[3] = &unk_1E6A10B80;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  objc_copyWeak(&v5, (id *)(a1 + 48));
  -[HMDAppleMediaAccessorySensorManager startSensorClientWithCompletion:](v2, v3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v4);
}

void __45__HMDAppleMediaAccessorySensorManager__start__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5 && WeakRetained)
  {
    if ((a2 & 1) == 0)
    {
      SEL v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = WeakRetained;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = HMFGetLogIdentifier();
        *(_DWORD *)uint64_t v25 = 138543362;
        *(void *)&v25[4] = v9;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Starting the HomePod sensor manager failed", v25, 0xCu);
      }
    }
    id v10 = v5;
    SEL v11 = [v10 notificationCenterForAppleMediaAccessorySensorManager:WeakRetained];
    SEL v12 = [v10 residentNotificationObjectForAppleMediaAccessorySensorManager:WeakRetained];
    [v11 addObserver:WeakRetained selector:sel_handlePrimaryResidentChanged_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v12];

    id v13 = [v10 residentNotificationObjectForAppleMediaAccessorySensorManager:WeakRetained];
    [v11 addObserver:WeakRetained selector:sel_handlePrimaryResidentChanged_ name:@"HMDResidentDeviceManagerAddResidentNotification" object:v13];

    id v14 = [v10 residentNotificationObjectForAppleMediaAccessorySensorManager:WeakRetained];
    [v11 addObserver:WeakRetained selector:sel_handlePrimaryResidentChanged_ name:@"HMDResidentDeviceManagerUpdateResidentNotification" object:v14];

    BOOL v15 = [v10 addAccessoryNotificationObjectForAppleMediaAccessorySensorManager:WeakRetained];
    [v11 addObserver:WeakRetained selector:sel_handleAccessoryAdded_ name:@"HMDNotificationHomeAddedAccessory" object:v15];

    [v11 addObserver:WeakRetained selector:sel_handleCharacteristicsChangedNotification_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:0];
    if (isInternalBuild())
    {
      id v16 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
      id v17 = [v10 messageDispatcherForAppleMediaAccessorySensorManager:WeakRetained];
      uint64_t v18 = *MEMORY[0x1E4F2C9C8];
      *(void *)uint64_t v25 = v16;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      [v17 registerForMessage:v18 receiver:WeakRetained policies:v19 selector:sel_handleErrorCaseTestMessage_];
    }
    [(HMDAppleMediaAccessorySensorManager *)WeakRetained cleanUpExistingAccessoriesAndStartADKIfReady];
  }
  else
  {
    id v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = WeakRetained;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)uint64_t v25 = 138543362;
      *(void *)&v25[4] = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor manager with nil data source or nil self", v25, 0xCu);
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
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
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
  if (logCategory__hmf_once_t85 != -1) {
    dispatch_once(&logCategory__hmf_once_t85, &__block_literal_global_62_126159);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v86;
  return v2;
}

uint64_t __50__HMDAppleMediaAccessorySensorManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v86;
  logCategory__hmf_once_v86 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end