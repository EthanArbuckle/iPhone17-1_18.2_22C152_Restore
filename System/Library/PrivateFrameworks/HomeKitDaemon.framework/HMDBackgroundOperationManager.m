@interface HMDBackgroundOperationManager
+ (id)findAccessoryUsing:(id)a3 fromHome:(id)a4;
+ (id)findAccessoryUsing:(id)a3 homeManager:(id)a4;
+ (id)findHomeUsingIdentifier:(id)a3 homeManager:(id)a4;
+ (id)findHomeWhereThisDeviceIsConfirmedPrimaryResident:(id)a3;
+ (id)findUserWithUUID:(id)a3 fromHomeManager:(id)a4;
+ (id)getAllPairedAccessoriesOfAllHomes:(id)a3;
+ (id)getAllReachableAccessories:(id)a3;
+ (id)logCategory;
- (BOOL)_scheduleKeyRollForAccessory:(id)a3;
- (BOOL)addOperationDependency:(id)a3 dependsOn:(id)a4;
- (BOOL)scheduleHH2KeyRollForAccessory:(id)a3 previousIdentity:(id)a4 newIdentity:(id)a5;
- (BOOL)scheduleHH2KeyRollForAirPlayAccessory:(id)a3 previousIdentity:(id)a4 newIdentity:(id)a5;
- (BOOL)scheduleOperationsWithDependenciesOnEachOtherFromArray:(id)a3;
- (BOOL)shouldWeScheduleKeyRollOperationsOnThisDevice;
- (HAPPairingIdentity)hh1Key;
- (HAPPairingIdentity)hh2Key;
- (HMDBackgroundOperationGraph)opGraph;
- (HMDBackgroundOperationManager)initWithHomeManager:(id)a3;
- (HMDBackgroundOperationManager)initWithHomeManager:(id)a3 currentDeviceStateDataSource:(id)a4 notificationCenter:(id)a5;
- (HMDBackgroundOperationManagerCurrentDeviceStateDataSource)currentDeviceStateDataSource;
- (HMDHomeManager)homeManager;
- (HMFTimer)dataSourceCoalescingTimer;
- (HMFTimer)deferralTimer;
- (HMFTimer)expirationTimer;
- (NSMutableArray)dataSourceList;
- (NSMutableArray)operationList;
- (NSNotificationCenter)notificationCenter;
- (NSOperationQueue)queue;
- (id)__getReadyToExecuteOperations;
- (id)dumpState;
- (id)getHH1ControllerKey;
- (id)getHH2ControllerKey;
- (void)__removeAllDataSourcesForUnitTesting;
- (void)__removeAllOperationsForUnitTesting;
- (void)__resetAndRebuildOperationGraphForUnitTesting;
- (void)_dataSourceHasUpdate:(id)a3;
- (void)_runOperation:(id)a3 withParameters:(id)a4;
- (void)_runOperationsAfterEvaluatingPredicate:(id)a3;
- (void)_scheduleHH2AirPlayKeyRollIfNecessary:(id)a3;
- (void)_scheduleHH2KeyRollIfNecessary:(id)a3;
- (void)addDataSource:(id)a3;
- (void)addDefaultDataSources;
- (void)addOperation:(id)a3;
- (void)auditKeyChainEntriesAndScheduleKeyRollOperationsIfNecessaryForHome:(id)a3 isRunningOnResident:(BOOL)a4;
- (void)auditKeyChainEntryForAccessory:(id)a3 isRunningOnResident:(BOOL)a4;
- (void)auditOwnerPairingForAirPlayAccessory:(id)a3 isRunningOnResident:(BOOL)a4;
- (void)checkAndRemoveExpiredOperations;
- (void)completeProcessingForOperation:(id)a3;
- (void)dataSourceHasUpdate:(id)a3;
- (void)evaluateOperations;
- (void)makeSureToLoadPairingIdentities;
- (void)registerForNotifications;
- (void)removeAllOperationForAccessoryIdentifier:(id)a3;
- (void)removeAllOperationsBeforeStartingHH2Migration;
- (void)removeOperation:(id)a3;
- (void)removeOperationsForAccessoryIdentifier:(id)a3 operationKind:(id)a4;
- (void)removeOperationsForAccessoryIdentifier:(id)a3 operationKind:(id)a4 withBlock:(id)a5;
- (void)scheduleHH2KeyRollForAccessory:(id)a3;
- (void)scheduleHH2KeyRollForAirPlayAccessory:(id)a3;
- (void)scheduleHH2KeyRollIfNecessary;
- (void)scheduleHH2KeyRollIfNecessaryDueToNotification:(id)a3;
- (void)scheduleHH2KeyRollOperationForHome:(id)a3 isRunningOnResident:(BOOL)a4;
- (void)scheduleTimerToCheckAndRemoveExpiredOperation;
- (void)scheduleTimerToRetryDeferredOperations;
- (void)setDataSourceList:(id)a3;
- (void)setHh1Key:(id)a3;
- (void)setHh2Key:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setOperationList:(id)a3;
- (void)setQueue:(id)a3;
- (void)startSchedulingKeyRollOperations:(BOOL)a3 forAccessory:(id)a4;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDBackgroundOperationManager

- (void)registerForNotifications
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__registerForNotifications__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  if (registerForNotifications_onceToken != -1) {
    dispatch_once(&registerForNotifications_onceToken, block);
  }
}

void __77__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__registerForNotifications__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_scheduleHH2KeyRollIfNecessaryDueToNotification_ name:@"HMDFMFStatusUpdateNotification" object:0];
}

- (BOOL)shouldWeScheduleKeyRollOperationsOnThisDevice
{
  v3 = [(HMDBackgroundOperationManager *)self currentDeviceStateDataSource];
  if ([v3 isiOSDevice])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(HMDBackgroundOperationManager *)self currentDeviceStateDataSource];
    if ([v5 isAppleTV])
    {
      char v4 = 1;
    }
    else
    {
      v6 = [(HMDBackgroundOperationManager *)self currentDeviceStateDataSource];
      char v4 = [v6 isHomePod];
    }
  }

  return v4;
}

- (id)getHH2ControllerKey
{
  id v2 = [MEMORY[0x263F35AD0] systemStore];
  v3 = [v2 getPreferredHH2ControllerKey];

  return v3;
}

- (id)getHH1ControllerKey
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F35AD0] systemStore];
  id v14 = 0;
  id v15 = 0;
  id v13 = 0;
  char v3 = [v2 getControllerPublicKey:&v15 secretKey:0 username:&v14 allowCreation:0 error:&v13];
  id v4 = v15;
  id v5 = v14;
  id v6 = v13;

  if (v3)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F425F0]) initWithPairingKeyData:v4];
    v8 = (void *)[objc_alloc(MEMORY[0x263F35A78]) initWithIdentifier:v5 publicKey:v7 privateKey:0 permissions:1];
  }
  else
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[HMDUser] Failed to get current user from keychain with error: %@", buf, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)scheduleHH2KeyRollForAirPlayAccessory:(id)a3 previousIdentity:(id)a4 newIdentity:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
LABEL_27:
    _HMFPreconditionFailure();
  }
  v11 = v10;
  v12 = [v8 identifier];

  if (!v12) {
    goto LABEL_27;
  }
  if (v9 && v11)
  {
    v46[0] = objc_opt_class();
    v46[1] = objc_opt_class();
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
    id v14 = (void *)MEMORY[0x230FBD990](v13);
    id v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v48 = v17;
      __int16 v49 = 2112;
      id v50 = v8;
      __int16 v51 = 2112;
      v52 = v11;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Going to schedule key roll for Accessory : %@, with new pairing : %@", buf, 0x20u);
    }
    __int16 v18 = objc_msgSend(v8, "uuid", v46[0]);
    [(HMDBackgroundOperationManager *)v15 removeOperationsForAccessoryIdentifier:v18 operationKind:v13];

    id v19 = [v8 home];
    uint64_t v20 = [v19 isOwnerUser];

    v21 = [[HMDAddAccessoryPairingOperation alloc] initWithAccessory:v8 newPairingIdentity:v11 asOwner:v20 asAdmin:1 shouldUpdateKeyChainEntry:0];
    if (v21)
    {
      v22 = [[HMDRemoveAccessoryPairingOperation alloc] initWithAccessory:v8 isOwnerIdentity:0 identityToRemove:v9];
      if (v22)
      {
        v23 = v22;
        [(HMDBackgroundOperationManager *)v15 addOperation:v21];
        if ([(HMDBackgroundOperationManager *)v15 addOperationDependency:v23 dependsOn:v21])
        {
          [(HMDBackgroundOperationManager *)v15 evaluateOperations];
          BOOL v24 = 1;
LABEL_24:

          goto LABEL_25;
        }
        v40 = (void *)MEMORY[0x230FBD990]();
        v41 = v15;
        v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v48 = v43;
          _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Could not establish dependency between removeOldPairing & addAccessoryPairingWithHH2Identity", buf, 0xCu);
        }
        v44 = [v8 uuid];
        [(HMDBackgroundOperationManager *)v41 removeOperationsForAccessoryIdentifier:v44 operationKind:v13];
      }
      else
      {
        v35 = (void *)MEMORY[0x230FBD990]();
        v36 = v15;
        v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v48 = v38;
          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Could not create removeOldPairing operation, not adding addAccessoryPairingWithHH2Identity", buf, 0xCu);
        }
        v39 = [v8 uuid];
        [(HMDBackgroundOperationManager *)v36 removeOperationsForAccessoryIdentifier:v39 operationKind:v13];

        v23 = 0;
      }
    }
    else
    {
      v31 = (void *)MEMORY[0x230FBD990]();
      v32 = v15;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v48 = v34;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not create addAccessoryPairingWithHH2Identity operation", buf, 0xCu);
      }
      v23 = [v8 uuid];
      [(HMDBackgroundOperationManager *)v32 removeOperationsForAccessoryIdentifier:v23 operationKind:v13];
    }
    BOOL v24 = 0;
    goto LABEL_24;
  }
  v25 = (void *)MEMORY[0x230FBD990]();
  v26 = self;
  v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = HMFGetLogIdentifier();
    v29 = [(HMDBackgroundOperationManager *)v26 hh1Key];
    v30 = [(HMDBackgroundOperationManager *)v26 hh2Key];
    *(_DWORD *)buf = 138544130;
    v48 = v28;
    __int16 v49 = 2112;
    id v50 = v8;
    __int16 v51 = 2112;
    v52 = v29;
    __int16 v53 = 2112;
    v54 = v30;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Not scheduling key roll operation for accessory [%@] as we don't have needed keys to work with: [hh1: %@] [hh2: %@]", buf, 0x2Au);
  }
  BOOL v24 = 0;
LABEL_25:

  return v24;
}

- (BOOL)scheduleHH2KeyRollForAccessory:(id)a3 previousIdentity:(id)a4 newIdentity:(id)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
LABEL_44:
    _HMFPreconditionFailure();
  }
  v11 = v10;
  v12 = [v8 identifier];

  if (!v12) {
    goto LABEL_44;
  }
  if (v9 && v11)
  {
    if ([(HMDBackgroundOperationManager *)self _scheduleKeyRollForAccessory:v8])
    {
      v56[0] = objc_opt_class();
      v56[1] = objc_opt_class();
      v56[2] = objc_opt_class();
      id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:3];
      id v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = self;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v58 = v17;
        __int16 v59 = 2112;
        id v60 = v8;
        __int16 v61 = 2112;
        v62 = v11;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Going to schedule key roll for Accessory : %@, with new pairing : %@", buf, 0x20u);
      }
      __int16 v18 = [v8 uuid];
      [(HMDBackgroundOperationManager *)v15 removeOperationsForAccessoryIdentifier:v18 operationKind:v13];

      id v19 = [v8 home];
      uint64_t v20 = -[HMDAddAccessoryPairingOperation initWithAccessory:newPairingIdentity:asOwner:asAdmin:shouldUpdateKeyChainEntry:]([HMDAddAccessoryPairingOperation alloc], "initWithAccessory:newPairingIdentity:asOwner:asAdmin:shouldUpdateKeyChainEntry:", v8, v11, [v19 isOwnerUser], 1, 1);
      if (!v20)
      {
        v39 = (void *)MEMORY[0x230FBD990]();
        v40 = v15;
        v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v58 = v42;
          _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Could not create addAccessoryPairingWithHH2Identity operation", buf, 0xCu);
        }
        v21 = [v8 uuid];
        [(HMDBackgroundOperationManager *)v40 removeOperationsForAccessoryIdentifier:v21 operationKind:v13];
        BOOL v33 = 0;
        goto LABEL_41;
      }
      v21 = -[HMDRemoveAccessoryPairingOperation initWithAccessory:isOwnerIdentity:identityToRemove:]([HMDRemoveAccessoryPairingOperation alloc], "initWithAccessory:isOwnerIdentity:identityToRemove:", v8, [v19 isOwnerUser], v9);
      if (!v21)
      {
        v43 = MEMORY[0x230FBD990]();
        v44 = v15;
        v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v46 = os_log_t loga = v43;
          *(_DWORD *)buf = 138543362;
          v58 = v46;
          _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Could not create removeOldPairing operation, not adding addAccessoryPairingWithHH2Identity", buf, 0xCu);

          v43 = loga;
        }

        v23 = [v8 uuid];
        [(HMDBackgroundOperationManager *)v44 removeOperationsForAccessoryIdentifier:v23 operationKind:v13];
        goto LABEL_39;
      }
      if ([v8 hasIPLink])
      {
        v22 = [HMDForcePairVerifyAccessoryOperation alloc];
        v23 = [(HMDAccessoryBackgroundOperation *)v22 initWithAccessory:v8 userData:MEMORY[0x263EFFA78]];
        if (!v23)
        {
          BOOL v24 = (void *)MEMORY[0x230FBD990]();
          v25 = v15;
          log = HMFGetOSLogHandle();
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            v26 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v58 = v26;
            _os_log_impl(&dword_22F52A000, log, OS_LOG_TYPE_ERROR, "%{public}@Could not create forcePV operation, not adding addAccessoryPairingWithHH2Identity and removeOldPairing", buf, 0xCu);
          }
          v23 = 0;
          goto LABEL_38;
        }
      }
      else
      {
        v23 = 0;
      }
      [(HMDBackgroundOperationManager *)v15 addOperation:v20];
      if ([(HMDBackgroundOperationManager *)v15 addOperationDependency:v21 dependsOn:v20])
      {
        if (!v23
          || [(HMDBackgroundOperationManager *)v15 addOperationDependency:v23 dependsOn:v21])
        {
          BOOL v33 = 1;
LABEL_40:

LABEL_41:
          goto LABEL_42;
        }
        uint64_t v53 = MEMORY[0x230FBD990]();
        id v50 = v15;
        log = HMFGetOSLogHandle();
        if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          goto LABEL_37;
        }
        v48 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v58 = v48;
        __int16 v49 = "%{public}@Could not establish dependency between forcePV & removeOldPairing operation";
      }
      else
      {
        uint64_t v53 = MEMORY[0x230FBD990]();
        v47 = v15;
        log = HMFGetOSLogHandle();
        if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
LABEL_37:
          BOOL v24 = (void *)v53;
LABEL_38:

          __int16 v51 = [v8 uuid];
          [(HMDBackgroundOperationManager *)v15 removeOperationsForAccessoryIdentifier:v51 operationKind:v13];

LABEL_39:
          BOOL v33 = 0;
          goto LABEL_40;
        }
        v48 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v58 = v48;
        __int16 v49 = "%{public}@Could not establish dependency between removeOldPairing & addAccessoryPairingWithHH2Identity";
      }
      _os_log_impl(&dword_22F52A000, log, OS_LOG_TYPE_ERROR, v49, buf, 0xCu);

      goto LABEL_37;
    }
    v34 = (void *)MEMORY[0x230FBD990]();
    v35 = self;
    v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = HMFGetLogIdentifier();
      v38 = [v8 shortDescription];
      *(_DWORD *)buf = 138543618;
      v58 = v37;
      __int16 v59 = 2112;
      id v60 = v38;
      _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Not scheduling HH2 key roll operations for accessory: %@", buf, 0x16u);
    }
    BOOL v33 = 1;
  }
  else
  {
    v27 = (void *)MEMORY[0x230FBD990]();
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = HMFGetLogIdentifier();
      v31 = [(HMDBackgroundOperationManager *)v28 hh1Key];
      v32 = [(HMDBackgroundOperationManager *)v28 hh2Key];
      *(_DWORD *)buf = 138544130;
      v58 = v30;
      __int16 v59 = 2112;
      id v60 = v8;
      __int16 v61 = 2112;
      v62 = v31;
      __int16 v63 = 2112;
      v64 = v32;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Not scheduling key roll operation for accessory [%@] as we don't have needed keys to work with: [hh1: %@] [hh2: %@]", buf, 0x2Au);
    }
    BOOL v33 = 0;
  }
LABEL_42:

  return v33;
}

- (void)auditOwnerPairingForAirPlayAccessory:(id)a3 isRunningOnResident:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 home];
  id v8 = v7;
  if (v4)
  {
    if (([v7 isCurrentDeviceConfirmedPrimaryResident] & 1) == 0)
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v18 = v12;
        __int16 v19 = 2112;
        id v20 = v6;
        id v13 = "%{public}@Not scheduling the audit for the accessory [%@] as current device is not the primary resident";
LABEL_8:
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, v13, buf, 0x16u);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if ([v7 hasAnyResident])
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v18 = v12;
      __int16 v19 = 2112;
      id v20 = v6;
      id v13 = "%{public}@Not scheduling the audit for the accessory [%@] as current device is not a resident and the home has residents.";
      goto LABEL_8;
    }
LABEL_9:

LABEL_12:
    goto LABEL_13;
  }
  if ([v8 isOwnerUser])
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v14 = [(HMDBackgroundOperationManager *)self queue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __110__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__auditOwnerPairingForAirPlayAccessory_isRunningOnResident___block_invoke;
    v15[3] = &unk_264A2F820;
    v15[4] = self;
    id v16 = v6;
    [v14 addOperationWithBlock:v15];

    goto LABEL_12;
  }
LABEL_13:
}

void __110__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__auditOwnerPairingForAirPlayAccessory_isRunningOnResident___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = [v2 hh1Key];
  BOOL v4 = [*(id *)(a1 + 32) hh2Key];
  [v2 scheduleHH2KeyRollForAirPlayAccessory:v3 previousIdentity:v5 newIdentity:v4];
}

- (void)auditKeyChainEntryForAccessory:(id)a3 isRunningOnResident:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = v6;
  if (v4)
  {
    id v8 = [v6 home];
    char v9 = [v8 isCurrentDeviceConfirmedPrimaryResident];

    if ((v9 & 1) == 0)
    {
      BOOL v24 = (void *)MEMORY[0x230FBD990]();
      v25 = self;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = HMFGetLogIdentifier();
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        v29 = [v7 uuid];

        if (v29)
        {
          v30 = [v7 uuid];
          [v30 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x263F42690];
        }
        long long v34 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&buf[18] = 2096;
        *(void *)&buf[20] = &v34;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Not scheduling the audit for the accessory [%{uuid_t}.16P] as current device is not the primary resident", buf, 0x1Cu);
        goto LABEL_17;
      }
LABEL_18:

      goto LABEL_19;
    }
  }
  if (![(HMDBackgroundOperationManager *)self _scheduleKeyRollForAccessory:v7])
  {
    BOOL v24 = (void *)MEMORY[0x230FBD990]();
    v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = HMFGetLogIdentifier();
      v28 = [v7 shortDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v28;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Not scheduling the audit for accessory [%@]", buf, 0x16u);

LABEL_17:
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  id v10 = [MEMORY[0x263F35AD0] systemStore];
  v11 = [v7 identifier];
  v12 = [v10 getAssociatedControllerKeyForAccessory:v11];

  id v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    v17 = [v12 identifier];
    __int16 v18 = [v7 identifier];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v18;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Associated controller key : %@ for accessory : %@", buf, 0x20u);
  }
  if (!v12
    || ([MEMORY[0x263F35AD0] systemStore],
        __int16 v19 = objc_claimAutoreleasedReturnValue(),
        [v12 identifier],
        id v20 = objc_claimAutoreleasedReturnValue(),
        char v21 = [v19 isHH2KeyType:v20],
        v20,
        v19,
        (v21 & 1) == 0))
  {
    v22 = (void *)MEMORY[0x230FBD990]();
    v23 = [(HMDBackgroundOperationManager *)v14 queue];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __104__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__auditKeyChainEntryForAccessory_isRunningOnResident___block_invoke;
    v31[3] = &unk_264A2F820;
    v31[4] = v14;
    id v32 = v7;
    [v23 addOperationWithBlock:v31];
  }

LABEL_19:
}

void __104__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__auditKeyChainEntryForAccessory_isRunningOnResident___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = [v2 hh1Key];
  BOOL v4 = [*(id *)(a1 + 32) hh2Key];
  [v2 scheduleHH2KeyRollForAccessory:v3 previousIdentity:v5 newIdentity:v4];
}

- (void)auditKeyChainEntriesAndScheduleKeyRollOperationsIfNecessaryForHome:(id)a3 isRunningOnResident:(BOOL)a4
{
  id v6 = a3;
  [(HMDBackgroundOperationManager *)self makeSureToLoadPairingIdentities];
  v7 = [v6 accessories];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __140__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__auditKeyChainEntriesAndScheduleKeyRollOperationsIfNecessaryForHome_isRunningOnResident___block_invoke;
  v8[3] = &unk_264A20158;
  v8[4] = self;
  BOOL v9 = a4;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);
}

void __140__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__auditKeyChainEntriesAndScheduleKeyRollOperationsIfNecessaryForHome_isRunningOnResident___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  unint64_t v5 = v4;
  id v6 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  unint64_t v8 = v7;

  if (v5 | v8)
  {
    if (v5)
    {
      [*(id *)(a1 + 32) auditKeyChainEntryForAccessory:v5 isRunningOnResident:*(unsigned __int8 *)(a1 + 40)];
    }
    else if (v8)
    {
      [*(id *)(a1 + 32) auditOwnerPairingForAirPlayAccessory:v8 isRunningOnResident:*(unsigned __int8 *)(a1 + 40)];
    }
  }
  else
  {
    BOOL v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v12;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Not scheduling key roll operation for non HAP and non AirPlay accessory : %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)scheduleHH2KeyRollOperationForHome:(id)a3 isRunningOnResident:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (([v6 isOwnerUser] & 1) == 0)
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    int v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      __int16 v18 = v15;
      __int16 v19 = 2112;
      id v20 = v6;
      id v16 = "%{public}@Not scheduling key roll operations for [%@] as this user is not the owner of the home";
LABEL_11:
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v17, 0x16u);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v4 && ([v6 isCurrentDeviceConfirmedPrimaryResident] & 1) == 0)
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    int v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      __int16 v18 = v15;
      __int16 v19 = 2112;
      id v20 = v6;
      id v16 = "%{public}@Not scheduling key roll operations for [%@] as this device is not the primary resident of that home";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v7 = (void *)MEMORY[0x230FBD990]();
  unint64_t v8 = self;
  BOOL v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    v11 = HMFBooleanToString();
    int v17 = 138543874;
    __int16 v18 = v10;
    __int16 v19 = 2112;
    id v20 = v11;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting the accessory key audit: [isResident: %@][Home: %@]", (uint8_t *)&v17, 0x20u);
  }
  [(HMDBackgroundOperationManager *)v8 auditKeyChainEntriesAndScheduleKeyRollOperationsIfNecessaryForHome:v6 isRunningOnResident:v4];
LABEL_13:
}

- (void)makeSureToLoadPairingIdentities
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(HMDBackgroundOperationManager *)self hh1Key];

  if (!v3)
  {
    BOOL v4 = [(HMDBackgroundOperationManager *)self getHH1ControllerKey];
    unint64_t v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    v7 = HMFGetOSLogHandle();
    unint64_t v8 = v7;
    if (v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        BOOL v9 = HMFGetLogIdentifier();
        int v19 = 138543618;
        id v20 = v9;
        __int16 v21 = 2112;
        id v22 = v4;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@HH1 pairing identity : %@", (uint8_t *)&v19, 0x16u);
      }
      [(HMDBackgroundOperationManager *)v6 setHh1Key:v4];
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v10 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v10;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to get HH1 controller key. Cannot schedule key roll operations.", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  v11 = [(HMDBackgroundOperationManager *)self hh2Key];

  if (!v11)
  {
    v12 = [(HMDBackgroundOperationManager *)self getHH2ControllerKey];
    int v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    __int16 v15 = HMFGetOSLogHandle();
    id v16 = v15;
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v17 = HMFGetLogIdentifier();
        int v19 = 138543618;
        id v20 = v17;
        __int16 v21 = 2112;
        id v22 = v12;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@HH2 pairing identity : %@", (uint8_t *)&v19, 0x16u);
      }
      [(HMDBackgroundOperationManager *)v14 setHh2Key:v12];
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v18;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to get HH2 controller key. Cannot schedule key roll operations", (uint8_t *)&v19, 0xCu);
      }
    }
  }
}

- (void)startSchedulingKeyRollOperations:(BOOL)a3 forAccessory:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    unint64_t v8 = self;
    BOOL v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      v11 = [v6 uuid];

      if (v11)
      {
        v12 = [v6 uuid];
        [v12 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v17 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      __int16 v19 = 2096;
      id v20 = &v17;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Going to audit the accessory's key chain entries: %{uuid_t}.16P", buf, 0x1Cu);
    }
    [(HMDBackgroundOperationManager *)v8 auditKeyChainEntryForAccessory:v6 isRunningOnResident:v4];
  }
  else
  {
    int v13 = [(HMDBackgroundOperationManager *)self homeManager];
    id v14 = [v13 homes];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __99__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__startSchedulingKeyRollOperations_forAccessory___block_invoke;
    v15[3] = &unk_264A20130;
    v15[4] = self;
    BOOL v16 = v4;
    objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);
  }
}

uint64_t __99__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__startSchedulingKeyRollOperations_forAccessory___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) scheduleHH2KeyRollOperationForHome:a2 isRunningOnResident:*(unsigned __int8 *)(a1 + 40)];
}

- (void)scheduleHH2KeyRollIfNecessaryDueToNotification:(id)a3
{
  BOOL v4 = [(HMDBackgroundOperationManager *)self queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __100__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__scheduleHH2KeyRollIfNecessaryDueToNotification___block_invoke;
  v5[3] = &unk_264A2F7F8;
  v5[4] = self;
  [v4 addOperationWithBlock:v5];
}

uint64_t __100__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__scheduleHH2KeyRollIfNecessaryDueToNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleHH2KeyRollIfNecessary];
}

- (void)_scheduleHH2KeyRollIfNecessary:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(HMDBackgroundOperationManager *)self shouldWeScheduleKeyRollOperationsOnThisDevice])
  {
    unint64_t v8 = (void *)MEMORY[0x230FBD990]();
    BOOL v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v22 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not scheduling HH2 key roll operations on this device", buf, 0xCu);
LABEL_11:
    }
LABEL_12:

    goto LABEL_17;
  }
  if (![(HMDBackgroundOperationManager *)self _scheduleKeyRollForAccessory:v4])
  {
    unint64_t v8 = (void *)MEMORY[0x230FBD990]();
    BOOL v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [v4 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v22 = v11;
      __int16 v23 = 2112;
      BOOL v24 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not scheduling HH2 key roll operations on this accessory: %@", buf, 0x16u);

      goto LABEL_11;
    }
    goto LABEL_12;
  }
  unint64_t v5 = [v4 home];
  id v6 = v5;
  if (!v5 || [v5 isOwnerUser] && (objc_msgSend(v6, "isAdminUser") & 1) != 0)
  {
    [(HMDBackgroundOperationManager *)self registerForNotifications];
    v7 = [(HMDBackgroundOperationManager *)self queue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __84__HMDBackgroundOperationManager_ScheduleHH2KeyRoll___scheduleHH2KeyRollIfNecessary___block_invoke;
    v19[3] = &unk_264A2F820;
    v19[4] = self;
    id v20 = v4;
    [v7 addOperationWithBlock:v19];
  }
  else
  {
    int v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    __int16 v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      BOOL v16 = HMFGetLogIdentifier();
      long long v17 = [v4 shortDescription];
      __int16 v18 = [v6 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v22 = v16;
      __int16 v23 = 2112;
      BOOL v24 = v17;
      __int16 v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Not scheduling key roll operations for accessory: %@ as this user is not the admin owner of the home: %@", buf, 0x20u);
    }
  }

LABEL_17:
}

void __84__HMDBackgroundOperationManager_ScheduleHH2KeyRoll___scheduleHH2KeyRollIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) currentDeviceStateDataSource];
  int v3 = [v2 isiOSDevice];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) currentDeviceStateDataSource];
    char v5 = [v4 isDesignatedFMFDevice];

    if (v5)
    {
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      [v6 startSchedulingKeyRollOperations:0 forAccessory:v7];
    }
    else
    {
      unint64_t v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 32);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = HMFGetLogIdentifier();
        int v12 = 138543362;
        int v13 = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not scheduling key roll operations as this device is not designated FMF device", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (void)_scheduleHH2AirPlayKeyRollIfNecessary:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMDBackgroundOperationManager *)self shouldWeScheduleKeyRollOperationsOnThisDevice])
  {
    char v5 = [v4 home];
    id v6 = v5;
    if (!v5 || [v5 isOwnerUser] && (objc_msgSend(v6, "isAdminUser") & 1) != 0)
    {
      [(HMDBackgroundOperationManager *)self registerForNotifications];
      [(HMDBackgroundOperationManager *)self makeSureToLoadPairingIdentities];
      uint64_t v7 = [(HMDBackgroundOperationManager *)self queue];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __91__HMDBackgroundOperationManager_ScheduleHH2KeyRoll___scheduleHH2AirPlayKeyRollIfNecessary___block_invoke;
      v18[3] = &unk_264A2F820;
      v18[4] = self;
      id v19 = v4;
      [v7 addOperationWithBlock:v18];
    }
    else
    {
      int v12 = (void *)MEMORY[0x230FBD990]();
      int v13 = self;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = HMFGetLogIdentifier();
        BOOL v16 = [v4 shortDescription];
        long long v17 = [v6 shortDescription];
        *(_DWORD *)buf = 138543874;
        uint64_t v21 = v15;
        __int16 v22 = 2112;
        __int16 v23 = v16;
        __int16 v24 = 2112;
        __int16 v25 = v17;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Not scheduling key roll operations for accessory: %@ as this user is not the admin owner of the home: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    unint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not scheduling HH2 key roll operations on this device", buf, 0xCu);
    }
  }
}

void __91__HMDBackgroundOperationManager_ScheduleHH2KeyRoll___scheduleHH2AirPlayKeyRollIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) currentDeviceStateDataSource];
  if ([v2 isiOSDevice])
  {
    int v3 = [*(id *)(a1 + 32) currentDeviceStateDataSource];
    int v4 = [v3 isDesignatedFMFDevice];

    if (v4)
    {
      char v5 = (void *)MEMORY[0x230FBD990]();
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        unint64_t v8 = HMFGetLogIdentifier();
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        int v12 = v8;
        __int16 v13 = 2112;
        uint64_t v14 = v9;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Going to audit the AirPlay accessory's pairing identities : %@", buf, 0x16u);
      }
      [*(id *)(a1 + 32) auditOwnerPairingForAirPlayAccessory:*(void *)(a1 + 40) isRunningOnResident:0];
      return;
    }
  }
  else
  {
  }
  id v10 = [*(id *)(a1 + 32) currentDeviceStateDataSource];
  [v10 isiOSDevice];
}

- (BOOL)_scheduleKeyRollForAccessory:(id)a3
{
  int v3 = [a3 bridge];

  return v3 == 0;
}

- (void)scheduleHH2KeyRollForAirPlayAccessory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    [(HMDBackgroundOperationManager *)self _scheduleHH2AirPlayKeyRollIfNecessary:v4];
  }
  else
  {
    char v5 = (HMDBackgroundOperationManager *)_HMFPreconditionFailure();
    [(HMDBackgroundOperationManager *)v5 scheduleHH2KeyRollForAccessory:v7];
  }
}

- (void)scheduleHH2KeyRollForAccessory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    [(HMDBackgroundOperationManager *)self _scheduleHH2KeyRollIfNecessary:v4];
  }
  else
  {
    char v5 = (HMDBackgroundOperationManager *)_HMFPreconditionFailure();
    [(HMDBackgroundOperationManager *)v5 scheduleHH2KeyRollIfNecessary];
  }
}

- (void)scheduleHH2KeyRollIfNecessary
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_hh2Key, 0);
  objc_storeStrong((id *)&self->_hh1Key, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_opGraph, 0);
  objc_storeStrong((id *)&self->_dataSourceList, 0);
  objc_storeStrong((id *)&self->_operationList, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_currentDeviceStateDataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_deferralTimer, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
}

- (void)setQueue:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setHh2Key:(id)a3
{
}

- (HAPPairingIdentity)hh2Key
{
  return self->_hh2Key;
}

- (void)setHh1Key:(id)a3
{
}

- (HAPPairingIdentity)hh1Key
{
  return self->_hh1Key;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMDBackgroundOperationGraph)opGraph
{
  return self->_opGraph;
}

- (void)setDataSourceList:(id)a3
{
}

- (NSMutableArray)dataSourceList
{
  return self->_dataSourceList;
}

- (void)setOperationList:(id)a3
{
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (HMDBackgroundOperationManagerCurrentDeviceStateDataSource)currentDeviceStateDataSource
{
  return self->_currentDeviceStateDataSource;
}

- (id)dumpState
{
  int v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(HMDBackgroundOperationManager *)self operationList];
  char v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  SEL v6 = [(HMDBackgroundOperationManager *)self operationList];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__HMDBackgroundOperationManager_dumpState__block_invoke;
  v9[3] = &unk_264A20A80;
  id v7 = v5;
  id v10 = v7;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  return v7;
}

void __42__HMDBackgroundOperationManager_dumpState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 dumpState];
  [v2 addObject:v3];
}

- (BOOL)scheduleOperationsWithDependenciesOnEachOtherFromArray:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  char v5 = [(HMDBackgroundOperationManager *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __88__HMDBackgroundOperationManager_scheduleOperationsWithDependenciesOnEachOtherFromArray___block_invoke;
  v8[3] = &unk_264A2F698;
  id v6 = v4;
  id v9 = v6;
  id v10 = self;
  v11 = &v12;
  [v5 addOperationWithBlock:v8];

  LOBYTE(self) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)self;
}

void __88__HMDBackgroundOperationManager_scheduleOperationsWithDependenciesOnEachOtherFromArray___block_invoke(uint64_t a1)
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__133158;
  v7[4] = __Block_byref_object_dispose__133159;
  id v8 = 0;
  id v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __88__HMDBackgroundOperationManager_scheduleOperationsWithDependenciesOnEachOtherFromArray___block_invoke_2;
  v6[3] = &unk_264A20B48;
  uint64_t v3 = *(void *)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  v6[5] = v7;
  v6[6] = v3;
  objc_msgSend(v2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v6);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 40) evaluateOperations];
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __88__HMDBackgroundOperationManager_scheduleOperationsWithDependenciesOnEachOtherFromArray___block_invoke_43;
    v5[3] = &unk_264A20A80;
    id v4 = *(void **)(a1 + 32);
    v5[4] = *(void *)(a1 + 40);
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v5);
  }
  _Block_object_dispose(v7, 8);
}

void __88__HMDBackgroundOperationManager_scheduleOperationsWithDependenciesOnEachOtherFromArray___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    [v8 addOperation:v7];
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "addOperationDependency:dependsOn:", v7))
  {
LABEL_7:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    goto LABEL_8;
  }
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = *(id *)(a1 + 32);
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v14 = 138543874;
    char v15 = v12;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to add operation %@ which depends on %@", (uint8_t *)&v14, 0x20u);
  }
  *a4 = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
LABEL_8:
}

uint64_t __88__HMDBackgroundOperationManager_scheduleOperationsWithDependenciesOnEachOtherFromArray___block_invoke_43(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeOperation:a2];
}

- (void)__resetAndRebuildOperationGraphForUnitTesting
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [[HMDBackgroundOperationGraph alloc] initWithOperations:self->_operationList];
  opGraph = self->_opGraph;
  self->_opGraph = v4;

  os_unfair_lock_unlock(p_lock);
}

- (void)__removeAllOperationsForUnitTesting
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_operationList removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (void)__removeAllDataSourcesForUnitTesting
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_dataSourceList removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (id)__getReadyToExecuteOperations
{
  uint64_t v3 = [(HMDBackgroundOperationManager *)self operationList];
  char v4 = objc_msgSend(v3, "hmf_isEmpty");

  if (v4)
  {
    id v5 = (id)MEMORY[0x263EFFA68];
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
    id v7 = (void *)MEMORY[0x230FBD990]();
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    id v9 = [(HMDBackgroundOperationGraph *)self->_opGraph getIndependentVertices];
    operationList = self->_operationList;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __62__HMDBackgroundOperationManager___getReadyToExecuteOperations__block_invoke;
    v13[3] = &unk_264A20A58;
    id v11 = v9;
    id v14 = v11;
    id v5 = v6;
    id v15 = v5;
    [(NSMutableArray *)operationList hmf_enumerateWithAutoreleasePoolUsingBlock:v13];

    os_unfair_lock_unlock(p_lock);
  }
  return v5;
}

void __62__HMDBackgroundOperationManager___getReadyToExecuteOperations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = *(void **)(a1 + 32);
  id v6 = v3;
  id v5 = [v3 operationUUID];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (void)removeOperationsForAccessoryIdentifier:(id)a3 operationKind:(id)a4 withBlock:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && (int v11 = objc_msgSend(v9, "hmf_isEmpty"), v10) && !v11)
  {
    uint64_t v12 = [(HMDBackgroundOperationManager *)self operationList];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __96__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind_withBlock___block_invoke;
    v17[3] = &unk_264A20B20;
    id v18 = v9;
    id v19 = v8;
    uint64_t v20 = self;
    id v21 = v10;
    objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v17);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v23 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@List of operation classes are needed.", buf, 0xCu);
    }
  }
}

void __96__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind_withBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __96__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind_withBlock___block_invoke_2;
  v19[3] = &unk_264A20AD0;
  id v5 = v3;
  id v20 = v5;
  if (objc_msgSend(v4, "na_any:", v19))
  {
    id v6 = v5;
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
      id v9 = [v8 accessoryUUID];
      int v10 = [v9 isEqual:*(void *)(a1 + 40)];

      if (v10)
      {
        uint64_t v11 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
        if (v11) {
          uint64_t v11 = [*(id *)(a1 + 48) removeOperation:v8];
        }
        uint64_t v12 = (void *)MEMORY[0x230FBD990](v11);
        id v13 = *(id *)(a1 + 48);
        id v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v15 = HMFGetLogIdentifier();
          uint64_t v16 = objc_opt_class();
          uint64_t v17 = *(void *)(a1 + 40);
          id v18 = HMFBooleanToString();
          *(_DWORD *)buf = 138544130;
          __int16 v22 = v15;
          __int16 v23 = 2112;
          uint64_t v24 = v16;
          __int16 v25 = 2112;
          uint64_t v26 = v17;
          __int16 v27 = 2112;
          v28 = v18;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@[%@] operation for accessory : %@ was removed? %@", buf, 0x2Au);
        }
      }
    }
  }
}

uint64_t __96__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind_withBlock___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

- (void)removeOperationsForAccessoryIdentifier:(id)a3 operationKind:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7 && !objc_msgSend(v7, "hmf_isEmpty"))
  {
    id v13 = [(HMDBackgroundOperationManager *)self operationList];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __86__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind___block_invoke;
    v14[3] = &unk_264A20AF8;
    id v15 = v8;
    id v16 = v6;
    uint64_t v17 = self;
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v19 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@List of operation classes are needed.", buf, 0xCu);
    }
  }
}

void __86__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __86__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind___block_invoke_2;
  v17[3] = &unk_264A20AD0;
  id v5 = v3;
  id v18 = v5;
  if (objc_msgSend(v4, "na_any:", v17))
  {
    id v6 = v5;
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
      id v9 = [v8 accessoryUUID];
      int v10 = [v9 isEqual:*(void *)(a1 + 40)];

      if (v10)
      {
        uint64_t v11 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 48) removeOperation:v8]);
        id v12 = *(id *)(a1 + 48);
        id v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = HMFGetLogIdentifier();
          uint64_t v15 = objc_opt_class();
          uint64_t v16 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          uint64_t v20 = v14;
          __int16 v21 = 2112;
          uint64_t v22 = v15;
          __int16 v23 = 2112;
          uint64_t v24 = v16;
          _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing [%@] operation for accessory : %@", buf, 0x20u);
        }
      }
    }
  }
}

uint64_t __86__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

- (void)removeAllOperationForAccessoryIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBackgroundOperationManager *)self operationList];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__HMDBackgroundOperationManager_removeAllOperationForAccessoryIdentifier___block_invoke;
  v7[3] = &unk_264A20A58;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);
}

void __74__HMDBackgroundOperationManager_removeAllOperationForAccessoryIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
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
    id v6 = [v5 accessoryUUID];
    int v7 = [v6 isEqual:*(void *)(a1 + 32)];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 40) removeOperation:v5]);
      id v9 = *(id *)(a1 + 40);
      int v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = *(void *)(a1 + 32);
        int v14 = 138543874;
        uint64_t v15 = v11;
        __int16 v16 = 2112;
        uint64_t v17 = v12;
        __int16 v18 = 2112;
        uint64_t v19 = v13;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing [%@] operation for accessory : %@", (uint8_t *)&v14, 0x20u);
      }
    }
  }
}

- (void)removeAllOperationsBeforeStartingHH2Migration
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(NSMutableArray *)self->_operationList count])
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    HMFGetOSLogHandle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing all operations before starting HH2 migration", (uint8_t *)&v10, 0xCu);
    }
    id v8 = [MEMORY[0x263EFF980] array];
    operationList = self->_operationList;
    self->_operationList = v8;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)evaluateOperations
{
}

- (void)completeProcessingForOperation:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  uint64_t v6 = os_unfair_lock_lock_with_options();
  int v7 = (void *)MEMORY[0x230FBD990](v6);
  id v8 = self;
  HMFGetOSLogHandle();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v10;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@complete processing for : %@. Will remove it from the graph", buf, 0x16u);
  }
  opGraph = v8->_opGraph;
  uint64_t v12 = [v4 operationUUID];
  [(HMDBackgroundOperationGraph *)opGraph removeVertex:v12];

  [(NSMutableArray *)v8->_operationList removeObject:v4];
  operationList = v8->_operationList;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __64__HMDBackgroundOperationManager_completeProcessingForOperation___block_invoke;
  v21[3] = &unk_264A2AD08;
  id v14 = v4;
  id v22 = v14;
  if ([(NSMutableArray *)operationList na_any:v21])
  {
    uint64_t v15 = v8->_operationList;
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    __int16 v18 = __64__HMDBackgroundOperationManager_completeProcessingForOperation___block_invoke_2;
    uint64_t v19 = &unk_264A20A80;
    id v20 = v14;
    [(NSMutableArray *)v15 hmf_enumerateWithAutoreleasePoolUsingBlock:&v16];

    os_unfair_lock_unlock(p_lock);
    [(HMDBackgroundOperationManager *)v8 scheduleTimerToCheckAndRemoveExpiredOperation];
    [(HMDBackgroundOperationManager *)v8 evaluateOperations];
  }
  else
  {

    os_unfair_lock_unlock(p_lock);
    [(HMDBackgroundOperationManager *)v8 scheduleTimerToCheckAndRemoveExpiredOperation];
  }
}

uint64_t __64__HMDBackgroundOperationManager_completeProcessingForOperation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 operationUUID];
  uint64_t v5 = [v3 hasDependency:v4];

  return v5;
}

void __64__HMDBackgroundOperationManager_completeProcessingForOperation___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 operationUUID];
  [v3 removeDependency:v4];
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBackgroundOperationManager *)self expirationTimer];

  if (v5 == v4)
  {
    [(HMDBackgroundOperationManager *)self checkAndRemoveExpiredOperations];
    [(HMDBackgroundOperationManager *)self scheduleTimerToCheckAndRemoveExpiredOperation];
  }
  else
  {
    id v6 = [(HMDBackgroundOperationManager *)self deferralTimer];

    if (v6 == v4)
    {
      [(HMDBackgroundOperationManager *)self dataSourceHasUpdate:0];
      [(HMDBackgroundOperationManager *)self scheduleTimerToRetryDeferredOperations];
    }
    else
    {
      id v7 = [(HMDBackgroundOperationManager *)self dataSourceCoalescingTimer];

      if (v7 == v4)
      {
        queue = self->_queue;
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __46__HMDBackgroundOperationManager_timerDidFire___block_invoke;
        v9[3] = &unk_264A2F7F8;
        void v9[4] = self;
        [(NSOperationQueue *)queue addOperationWithBlock:v9];
      }
    }
  }
}

uint64_t __46__HMDBackgroundOperationManager_timerDidFire___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dataSourceHasUpdate:0];
}

- (void)scheduleTimerToRetryDeferredOperations
{
  id v3 = [(HMDBackgroundOperationManager *)self operationList];
  char v4 = objc_msgSend(v3, "hmf_isEmpty");

  if ((v4 & 1) == 0)
  {
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__133158;
    uint64_t v27 = __Block_byref_object_dispose__133159;
    id v28 = 0;
    id v5 = [(HMDBackgroundOperationManager *)self currentDeviceStateDataSource];
    id v6 = [v5 currentDate];

    id v7 = [(HMDBackgroundOperationManager *)self operationList];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __71__HMDBackgroundOperationManager_scheduleTimerToRetryDeferredOperations__block_invoke;
    id v20 = &unk_264A20AA8;
    id v8 = v6;
    id v21 = v8;
    id v22 = &v23;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v17);

    id v9 = (void *)v24[5];
    if (v9)
    {
      objc_msgSend(v9, "timeIntervalSinceDate:", v8, v17, v18, v19, v20);
      double v11 = v10;
      if (v10 > 0.0)
      {
        os_unfair_lock_lock_with_options();
        uint64_t v12 = [(HMDBackgroundOperationManager *)self currentDeviceStateDataSource];
        uint64_t v13 = [v12 timerWithTimeInterval:1 options:@"deferralTimer" label:v11];
        deferralTimer = self->_deferralTimer;
        self->_deferralTimer = v13;

        os_unfair_lock_unlock(&self->_lock);
        uint64_t v15 = [(HMDBackgroundOperationManager *)self deferralTimer];
        [v15 setDelegate:self];

        uint64_t v16 = [(HMDBackgroundOperationManager *)self deferralTimer];
        [v16 resume];
      }
    }

    _Block_object_dispose(&v23, 8);
  }
}

void __71__HMDBackgroundOperationManager_scheduleTimerToRetryDeferredOperations__block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = [v15 deferralDate];

  if (v3)
  {
    char v4 = *(void **)(a1 + 32);
    id v5 = [v15 deferralDate];
    uint64_t v6 = [v4 compare:v5];

    if (v6 == -1)
    {
      id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v8 = [v15 deferralDate];
      id v9 = (void *)v8;
      if (v7)
      {
        uint64_t v10 = [v7 earlierDate:v8];
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;
      }
      else
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        id v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v8;
        id v9 = v14;
      }
    }
  }
}

- (void)scheduleTimerToCheckAndRemoveExpiredOperation
{
  id v3 = [(HMDBackgroundOperationManager *)self operationList];
  char v4 = objc_msgSend(v3, "hmf_isEmpty");

  if ((v4 & 1) == 0)
  {
    id v5 = [(HMDBackgroundOperationManager *)self currentDeviceStateDataSource];
    uint64_t v6 = [v5 currentDate];

    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__133158;
    uint64_t v27 = __Block_byref_object_dispose__133159;
    id v28 = 0;
    id v7 = [(HMDBackgroundOperationManager *)self operationList];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __78__HMDBackgroundOperationManager_scheduleTimerToCheckAndRemoveExpiredOperation__block_invoke;
    id v20 = &unk_264A20AA8;
    id v8 = v6;
    id v21 = v8;
    id v22 = &v23;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v17);

    id v9 = (void *)v24[5];
    if (v9)
    {
      objc_msgSend(v9, "timeIntervalSinceDate:", v8, v17, v18, v19, v20);
      double v11 = v10;
      if (v10 > 0.0)
      {
        os_unfair_lock_lock_with_options();
        uint64_t v12 = [(HMDBackgroundOperationManager *)self currentDeviceStateDataSource];
        uint64_t v13 = [v12 timerWithTimeInterval:1 options:@"expirationTimer" label:v11];
        expirationTimer = self->_expirationTimer;
        self->_expirationTimer = v13;

        os_unfair_lock_unlock(&self->_lock);
        id v15 = [(HMDBackgroundOperationManager *)self expirationTimer];
        [v15 setDelegate:self];

        uint64_t v16 = [(HMDBackgroundOperationManager *)self expirationTimer];
        [v16 resume];
      }
    }

    _Block_object_dispose(&v23, 8);
  }
}

void __78__HMDBackgroundOperationManager_scheduleTimerToCheckAndRemoveExpiredOperation__block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = *(void **)(a1 + 32);
  char v4 = [v15 expirationDate];
  uint64_t v5 = [v3 compare:v4];

  uint64_t v6 = v15;
  if (v5 == -1)
  {
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = [v15 expirationDate];
    id v9 = (void *)v8;
    if (v7)
    {
      uint64_t v10 = [v7 earlierDate:v8];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    else
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v8;
      id v9 = v14;
    }

    uint64_t v6 = v15;
  }
}

- (void)checkAndRemoveExpiredOperations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_operationList = &self->_operationList;
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](*p_operationList, "count"));
  uint64_t v6 = *p_operationList;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__HMDBackgroundOperationManager_checkAndRemoveExpiredOperations__block_invoke;
  v9[3] = &unk_264A20A80;
  id v7 = v5;
  id v10 = v7;
  [(NSMutableArray *)v6 hmf_enumerateWithAutoreleasePoolUsingBlock:v9];
  uint64_t v8 = [(NSMutableArray *)*p_operationList count];
  if (v8 != [v7 count]) {
    objc_storeStrong((id *)p_operationList, v5);
  }

  os_unfair_lock_unlock(p_lock);
}

void __64__HMDBackgroundOperationManager_checkAndRemoveExpiredOperations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isExpired] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)_runOperation:(id)a3 withParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isReadyToRun])
  {
    uint64_t v8 = [(id)objc_opt_class() predicate];
    int v9 = [v8 evaluateWithObject:v7];

    if (v9)
    {
      objc_initWeak(&location, v6);
      id v10 = (void *)MEMORY[0x263F086D0];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __62__HMDBackgroundOperationManager__runOperation_withParameters___block_invoke;
      v13[3] = &unk_264A2C148;
      objc_copyWeak(&v14, &location);
      void v13[4] = self;
      uint64_t v11 = [v10 blockOperationWithBlock:v13];
      [v6 setScheduled:1];
      objc_msgSend(v11, "setQualityOfService:", objc_msgSend(v6, "qualityOfService"));
      uint64_t v12 = [(HMDBackgroundOperationManager *)self queue];
      [v12 addOperation:v11];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

void __62__HMDBackgroundOperationManager__runOperation_withParameters___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle();
  id v6 = v5;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = objc_opt_class();
      int v9 = [WeakRetained operationUUID];
      id v10 = [WeakRetained userData];
      int v15 = 138544130;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Going to run : %@/%@/%@", (uint8_t *)&v15, 0x2Au);
    }
    uint64_t v11 = [*(id *)(a1 + 32) homeManager];
    int v12 = [WeakRetained runOperation:v11];

    uint64_t v13 = *(void **)(a1 + 32);
    if (v12) {
      [v13 completeProcessingForOperation:WeakRetained];
    }
    else {
      [v13 scheduleTimerToRetryDeferredOperations];
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v14;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Operation which was supposed to run got deallocated.", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_runOperationsAfterEvaluatingPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDBackgroundOperationManager *)self __getReadyToExecuteOperations];
  id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_133181];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__HMDBackgroundOperationManager__runOperationsAfterEvaluatingPredicate___block_invoke_2;
  v8[3] = &unk_264A20A58;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);
}

void __72__HMDBackgroundOperationManager__runOperationsAfterEvaluatingPredicate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 userData];
  [v4 setObject:v5 forKey:@"userData"];

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v3 operationUUID];
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "failureCount"));
    int v14 = 138544386;
    int v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    __int16 v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    uint64_t v23 = v13;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Scheduling the operation [%@:%@:%@:%@]", (uint8_t *)&v14, 0x34u);
  }
  [*(id *)(a1 + 40) _runOperation:v3 withParameters:*(void *)(a1 + 32)];
}

uint64_t __72__HMDBackgroundOperationManager__runOperationsAfterEvaluatingPredicate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(a2, "failureCount"));
  id v7 = NSNumber;
  uint64_t v8 = [v5 failureCount];

  id v9 = [v7 numberWithLongLong:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (void)_dataSourceHasUpdate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDBackgroundOperationManager *)self operationList];
  int v6 = objc_msgSend(v5, "hmf_isEmpty");

  id v7 = (void *)MEMORY[0x230FBD990]();
  if (v6)
  {
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v10;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@No background operations to run. Not evaluating data source : [%@]", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v12 = [(HMDBackgroundOperationManager *)self dataSourceList];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__HMDBackgroundOperationManager__dataSourceHasUpdate___block_invoke;
    v13[3] = &unk_264A20A10;
    int v14 = v11;
    uint64_t v8 = v11;
    objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);

    [(HMDBackgroundOperationManager *)self _runOperationsAfterEvaluatingPredicate:v8];
    id v9 = v14;
  }
}

void __54__HMDBackgroundOperationManager__dataSourceHasUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v3 values];
  id v4 = objc_opt_class();

  id v5 = [v4 name];
  [v2 setObject:v6 forKey:v5];
}

- (void)dataSourceHasUpdate:(id)a3
{
  id v3 = [(HMDBackgroundOperationManager *)self dataSourceCoalescingTimer];
  [v3 resume];
}

- (void)addDefaultDataSources
{
  dataSourceList = self->_dataSourceList;
  id v4 = [HMDBackgroundOperationAccessoryManagerDataSource alloc];
  id v6 = [(HMDBackgroundOperationManager *)self notificationCenter];
  id v5 = [(HMDBackgroundOperationAccessoryManagerDataSource *)v4 initWithOperationManager:self notificationCenter:v6];
  [(NSMutableArray *)dataSourceList addObject:v5];
}

- (void)addDataSource:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    if ([(NSMutableArray *)self->_dataSourceList containsObject:v4])
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = self;
      HMFGetOSLogHandle();
      uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = HMFGetLogIdentifier();
        int v14 = 138543618;
        int v15 = v9;
        __int16 v16 = 2112;
        id v17 = v4;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Could not add the operation as it already exist : %@", (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      [(NSMutableArray *)self->_dataSourceList addObject:v4];
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      int v15 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not add the data source as it was nil.", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)removeOperation:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v15 = 138543362;
      __int16 v16 = v10;
      uint64_t v11 = "%{public}@Could not remove the operation as it was nil.";
      uint64_t v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 12;
LABEL_8:
      _os_log_impl(&dword_22F52A000, v12, v13, v11, (uint8_t *)&v15, v14);
    }
LABEL_9:

    goto LABEL_10;
  }
  [(HMDBackgroundOperationManager *)self checkAndRemoveExpiredOperations];
  id v5 = [(HMDBackgroundOperationManager *)self operationList];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v15 = 138543618;
      __int16 v16 = v10;
      __int16 v17 = 2112;
      id v18 = v4;
      uint64_t v11 = "%{public}@Could not remove the operation as it was not found : %@";
      uint64_t v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
      uint32_t v14 = 22;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  [(HMDBackgroundOperationManager *)self completeProcessingForOperation:v4];
LABEL_10:
}

- (BOOL)addOperationDependency:(id)a3 dependsOn:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6 || !v7)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v13 = HMFGetLogIdentifier();
      int v39 = 138543362;
      v40 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@The passed parameter is nil. Cannot add dependency.", (uint8_t *)&v39, 0xCu);
    }
    goto LABEL_9;
  }
  if (HMFEqualObjects())
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v39 = 138543362;
      v40 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot add operation as dependency to itself", (uint8_t *)&v39, 0xCu);
    }
LABEL_9:

LABEL_10:
    BOOL v14 = 0;
    goto LABEL_11;
  }
  [(HMDBackgroundOperationManager *)self addOperation:v6];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  __int16 v17 = [(HMDBackgroundOperationManager *)self opGraph];
  id v18 = v8;
  id v19 = v17;
  __int16 v20 = [v6 operationUUID];
  uint64_t v21 = [v18 operationUUID];

  int v22 = [v19 canAddEdgeFrom:v20 to:v21];
  if (v22)
  {
    uint64_t v23 = (void *)MEMORY[0x230FBD990]();
    uint64_t v24 = self;
    HMFGetOSLogHandle();
    uint64_t v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      int v39 = 138543874;
      v40 = v26;
      __int16 v41 = 2112;
      uint64_t v42 = (uint64_t)v18;
      __int16 v43 = 2112;
      id v44 = v6;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cycle detected while adding %@ to as dependency for %@", (uint8_t *)&v39, 0x20u);
    }
    os_unfair_lock_unlock(p_lock);
    goto LABEL_10;
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v27 = [v18 operationUUID];
  [v6 addDependency:v27];

  [(HMDBackgroundOperationManager *)self addOperation:v18];
  id v28 = [(HMDBackgroundOperationManager *)self opGraph];
  uint64_t v29 = [v6 operationUUID];
  v30 = [v18 operationUUID];
  [v28 addEdgeFrom:v29 to:v30];

  v31 = (void *)MEMORY[0x230FBD990]();
  id v32 = self;
  BOOL v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    long long v34 = HMFGetLogIdentifier();
    uint64_t v35 = objc_opt_class();
    v36 = [v6 operationUUID];
    uint64_t v37 = objc_opt_class();
    v38 = [v18 operationUUID];
    int v39 = 138544386;
    v40 = v34;
    __int16 v41 = 2112;
    uint64_t v42 = v35;
    __int16 v43 = 2112;
    id v44 = v36;
    __int16 v45 = 2112;
    uint64_t v46 = v37;
    __int16 v47 = 2112;
    v48 = v38;
    _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@%@/%@ depends on %@/%@", (uint8_t *)&v39, 0x34u);
  }
  BOOL v14 = 1;
LABEL_11:

  return v14;
}

- (void)addOperation:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    [(HMDBackgroundOperationManager *)self checkAndRemoveExpiredOperations];
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    if ([(NSMutableArray *)self->_operationList containsObject:v4])
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      [(NSMutableArray *)self->_operationList addObject:v4];
      opGraph = self->_opGraph;
      uint64_t v11 = [v4 operationUUID];
      [(HMDBackgroundOperationGraph *)opGraph addVertex:v11];

      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      os_log_type_t v13 = self;
      HMFGetOSLogHandle();
      BOOL v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = HMFGetLogIdentifier();
        int v16 = 138543618;
        __int16 v17 = v15;
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Enqueued operation: %@", (uint8_t *)&v16, 0x16u);
      }
      os_unfair_lock_unlock(p_lock);
      [(HMDBackgroundOperationManager *)v13 scheduleTimerToCheckAndRemoveExpiredOperation];
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v16 = 138543362;
      __int16 v17 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Could not add the operation as it was nil.", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (HMFTimer)deferralTimer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_deferralTimer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMFTimer)expirationTimer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_expirationTimer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMFTimer)dataSourceCoalescingTimer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_dataSourceCoalescingTimer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSMutableArray)operationList
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_operationList copy];
  os_unfair_lock_unlock(p_lock);
  return (NSMutableArray *)v4;
}

- (HMDBackgroundOperationManager)initWithHomeManager:(id)a3 currentDeviceStateDataSource:(id)a4 notificationCenter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)HMDBackgroundOperationManager;
  uint64_t v11 = [(HMDBackgroundOperationManager *)&v26 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_homeManager, v8);
    uint64_t v13 = [MEMORY[0x263EFF980] array];
    dataSourceList = v12->_dataSourceList;
    v12->_dataSourceList = (NSMutableArray *)v13;

    int v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    queue = v12->_queue;
    v12->_queue = v15;

    [(NSOperationQueue *)v12->_queue setMaxConcurrentOperationCount:1];
    __int16 v17 = [NSString stringWithUTF8String:HMFDispatchQueueName()];
    [(NSOperationQueue *)v12->_queue setName:v17];

    [(NSOperationQueue *)v12->_queue setQualityOfService:9];
    objc_storeStrong((id *)&v12->_currentDeviceStateDataSource, a4);
    objc_storeStrong((id *)&v12->_notificationCenter, a5);
    v12->_lock._os_unfair_lock_opaque = 0;
    uint64_t v18 = [MEMORY[0x263EFF980] array];
    operationList = v12->_operationList;
    v12->_operationList = (NSMutableArray *)v18;

    uint64_t v20 = [[HMDBackgroundOperationGraph alloc] initWithOperations:v12->_operationList];
    opGraph = v12->_opGraph;
    v12->_opGraph = v20;

    int v22 = [(HMDBackgroundOperationManager *)v12 currentDeviceStateDataSource];
    uint64_t v23 = [v22 timerWithTimeInterval:8 options:@"dataSourceCoalescingTimer" label:1.0];
    dataSourceCoalescingTimer = v12->_dataSourceCoalescingTimer;
    v12->_dataSourceCoalescingTimer = (HMFTimer *)v23;

    [(HMFTimer *)v12->_dataSourceCoalescingTimer setDelegate:v12];
    [(HMDBackgroundOperationManager *)v12 addDefaultDataSources];
    [(HMDBackgroundOperationManager *)v12 checkAndRemoveExpiredOperations];
    [(HMDBackgroundOperationManager *)v12 scheduleTimerToCheckAndRemoveExpiredOperation];
  }

  return v12;
}

- (HMDBackgroundOperationManager)initWithHomeManager:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HMDBackgroundOperationManagerCurrentDeviceStateDataSource);
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  id v7 = [(HMDBackgroundOperationManager *)self initWithHomeManager:v4 currentDeviceStateDataSource:v5 notificationCenter:v6];

  return v7;
}

+ (id)findUserWithUUID:(id)a3 fromHomeManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  __int16 v17 = __Block_byref_object_copy__133158;
  uint64_t v18 = __Block_byref_object_dispose__133159;
  id v19 = 0;
  id v7 = [v6 homes];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__HMDBackgroundOperationManager_findUserWithUUID_fromHomeManager___block_invoke;
  v11[3] = &unk_264A20B70;
  uint64_t v13 = &v14;
  id v8 = v5;
  id v12 = v8;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __66__HMDBackgroundOperationManager_findUserWithUUID_fromHomeManager___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 userWithUUID:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

+ (id)findHomeUsingIdentifier:(id)a3 homeManager:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 homes];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__HMDBackgroundOperationManager_findHomeUsingIdentifier_homeManager___block_invoke;
  v10[3] = &unk_264A2B2D0;
  id v11 = v5;
  id v7 = v5;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __69__HMDBackgroundOperationManager_findHomeUsingIdentifier_homeManager___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 uuid];
  uint64_t v3 = HMFEqualObjects();

  return v3;
}

+ (id)findAccessoryUsing:(id)a3 fromHome:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 accessories];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__HMDBackgroundOperationManager_findAccessoryUsing_fromHome___block_invoke;
  v10[3] = &unk_264A27218;
  id v11 = v5;
  id v7 = v5;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __61__HMDBackgroundOperationManager_findAccessoryUsing_fromHome___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 uuid];
  uint64_t v3 = HMFEqualObjects();

  return v3;
}

+ (id)findAccessoryUsing:(id)a3 homeManager:(id)a4
{
  id v6 = a3;
  id v7 = [a1 getAllPairedAccessoriesOfAllHomes:a4];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__HMDBackgroundOperationManager_findAccessoryUsing_homeManager___block_invoke;
  v11[3] = &unk_264A27218;
  id v12 = v6;
  id v8 = v6;
  id v9 = objc_msgSend(v7, "na_firstObjectPassingTest:", v11);

  return v9;
}

uint64_t __64__HMDBackgroundOperationManager_findAccessoryUsing_homeManager___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 uuid];
  uint64_t v3 = HMFEqualObjects();

  return v3;
}

+ (id)findHomeWhereThisDeviceIsConfirmedPrimaryResident:(id)a3
{
  uint64_t v3 = [a3 homes];
  id v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_47_133222);

  return v4;
}

uint64_t __83__HMDBackgroundOperationManager_findHomeWhereThisDeviceIsConfirmedPrimaryResident___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentDeviceConfirmedPrimaryResident];
}

+ (id)getAllReachableAccessories:(id)a3
{
  uint64_t v3 = [a1 getAllPairedAccessoriesOfAllHomes:a3];
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__HMDBackgroundOperationManager_getAllReachableAccessories___block_invoke;
  v8[3] = &unk_264A21538;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);
  id v6 = (void *)[v5 copy];

  return v6;
}

void __60__HMDBackgroundOperationManager_getAllReachableAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isReachable]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

+ (id)getAllPairedAccessoriesOfAllHomes:(id)a3
{
  return (id)[a3 pairedAccessories];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t38_133224 != -1) {
    dispatch_once(&logCategory__hmf_once_t38_133224, &__block_literal_global_39_133225);
  }
  id v2 = (void *)logCategory__hmf_once_v39_133226;
  return v2;
}

void __44__HMDBackgroundOperationManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v39_133226;
  logCategory__hmf_once_v39_133226 = v0;
}

@end