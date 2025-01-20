@interface HMDBackgroundOperationManagerHelper
+ (BOOL)checkAndRaiseFaultIfHH2KeyIsMissing;
+ (BOOL)didAuditTimeExpiredOnThisAccessory:(id)a3;
+ (BOOL)didAuditTimeExpiredOnThisAirPlayAccessory:(id)a3;
+ (BOOL)shouldWeAuditFromLastAudit:(id)a3;
+ (id)auditAllowedAccessToRestrictedGuest:(id)a3 forAccessories:(id)a4 shouldRemoveScheduledOperations:(BOOL)a5 parentFlow:(id)a6;
+ (id)auditProhibitedAccessToRestrictedGuest:(id)a3 forAccessories:(id)a4 shouldRemoveScheduledOperations:(BOOL)a5 parentFlow:(id)a6;
+ (id)homeManager;
+ (id)logCategory;
+ (void)_scheduleRemovePairingForAccessory:(id)a3 usingPairingIdentity:(id)a4;
+ (void)addPairingOnAllAccessoriesOfHome:(id)a3 forSharedUser:(id)a4;
+ (void)auditAllRestrictedGuestAccessoriesForHome:(id)a3;
+ (void)auditSharedUserEntriesInDatabase:(id)a3;
+ (void)auditSharedUserEntriesInDatabaseForAccessory:(id)a3;
+ (void)auditSharedUserEntriesInDatabaseForHome:(id)a3 withCompletionHandler:(id)a4;
+ (void)dumpUsers:(id)a3 usingTag:(id)a4;
+ (void)makeSureToCreateBackUpOfHH2KeysIfNecessary:(id)a3;
+ (void)removeAllScheduledOperationsForGuest:(id)a3 forAccessoryUUID:(id)a4;
+ (void)removeAllUsersFromAccessory:(id)a3 withCompletionHandler:(id)a4;
+ (void)removeAllUsersFromAirPlayAccessory:(id)a3 withCompletionHandler:(id)a4;
+ (void)removeAllUsersFromHAPAccessory:(id)a3 withCompletionHandler:(id)a4;
+ (void)removeAllUsersFromMatterAccessory:(id)a3 withCompletionHandler:(id)a4;
+ (void)removePairingOnAllAccessoriesOfHome:(id)a3 forSharedUser:(id)a4;
+ (void)scheduleAddPairingForAccessory:(id)a3 forSharedUser:(id)a4;
+ (void)scheduleAddPairingForAccessory:(id)a3 sharedUser:(id)a4;
+ (void)scheduleFullAuditForAccessory:(id)a3;
+ (void)scheduleRemovePairingForAccessory:(id)a3 forSharedUser:(id)a4;
+ (void)scheduleRemovePairingForAccessory:(id)a3 sharedUser:(id)a4;
@end

@implementation HMDBackgroundOperationManagerHelper

+ (id)logCategory
{
  if (logCategory__hmf_once_t128 != -1) {
    dispatch_once(&logCategory__hmf_once_t128, &__block_literal_global_97);
  }
  v2 = (void *)logCategory__hmf_once_v129;
  return v2;
}

void __50__HMDBackgroundOperationManagerHelper_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v129;
  logCategory__hmf_once_v129 = v0;
}

+ (void)removeAllScheduledOperationsForGuest:(id)a3 forAccessoryUUID:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isRestrictedGuest])
  {
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    v9 = [a1 homeManager];
    v10 = [v9 bgOpsManager];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __93__HMDBackgroundOperationManagerHelper_removeAllScheduledOperationsForGuest_forAccessoryUUID___block_invoke;
    v11[3] = &unk_264A2AD08;
    id v12 = v6;
    [v10 removeOperationsForAccessoryIdentifier:v7 operationKind:v8 withBlock:v11];
  }
}

uint64_t __93__HMDBackgroundOperationManagerHelper_removeAllScheduledOperationsForGuest_forAccessoryUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  id v6 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  v9 = v5;
  if ((v5 || (v9 = v8) != 0) && ([v9 guestUUID], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = (void *)v10;
    id v12 = [*(id *)(a1 + 32) uuid];
    uint64_t v13 = HMFEqualObjects();
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)auditProhibitedAccessToRestrictedGuest:(id)a3 forAccessories:(id)a4 shouldRemoveScheduledOperations:(BOOL)a5 parentFlow:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [v10 home];
  if (v7)
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke;
    v30[3] = &unk_264A2AC40;
    id v31 = v10;
    objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v30);
  }
  v14 = (void *)MEMORY[0x263F42538];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2;
  v25[3] = &unk_264A2AC90;
  id v26 = v13;
  id v27 = v12;
  id v28 = v10;
  id v29 = a1;
  id v15 = v10;
  id v16 = v12;
  id v17 = v13;
  v18 = objc_msgSend(v11, "na_map:", v25);
  v19 = [v14 allSettled:v18];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_93;
  v23[3] = &unk_264A2BEF0;
  id v24 = v11;
  id v20 = v11;
  v21 = [v19 then:v23];

  return v21;
}

uint64_t __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMDBackgroundOperationManagerHelper removeAllScheduledOperationsForGuest:*(void *)(a1 + 32) forAccessoryUUID:a2];
}

id __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [(id)objc_opt_class() findAccessoryUsing:v3 fromHome:*(void *)(a1 + 32)];
  id v5 = v4;
  if (!v4)
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = *(id *)(a1 + 56);
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      v25 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v46 = v24;
      __int16 v47 = 2112;
      id v48 = v3;
      __int16 v49 = 2112;
      id v50 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Did not find the accessory with UUID : %@ in home: %@", buf, 0x20u);
    }
    id v26 = (void *)MEMORY[0x263F42538];
    id v9 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2020];
    uint64_t v20 = [v26 futureWithError:v9];
    goto LABEL_15;
  }
  id v6 = v4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if ((isKindOfClass & 1) == 0 || ([v6 supportsAnyInPersonAccess] & 1) == 0)
  {
    uint64_t v20 = [MEMORY[0x263F42538] futureWithNoValue];
LABEL_15:
    v19 = (void *)v20;
    goto LABEL_16;
  }
  v38 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 56);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v36 = HMFGetLogIdentifier();
    v35 = [v38 UUID];
    uint64_t v13 = [*(id *)(a1 + 40) UUID];
    v14 = [v6 shortDescription];
    [*(id *)(a1 + 48) shortDescription];
    id v15 = v37 = v10;
    *(_DWORD *)buf = 138544386;
    v46 = v36;
    __int16 v47 = 2112;
    id v48 = v35;
    __int16 v49 = 2112;
    id v50 = v13;
    __int16 v51 = 2112;
    v52 = v14;
    __int16 v53 = 2112;
    v54 = v15;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[ChildFlow: %@ Parent: %@] auditProhibitedAccessToRestrictedGuest with accessory: %@ and restricted guest:%@", buf, 0x34u);

    id v10 = v37;
  }

  id v16 = [[HMDAuditProhibitedAccessoryForRestrictedGuestOperation alloc] initWithAccessory:v6 restrictedGuest:*(void *)(a1 + 48)];
  if (v16)
  {
    id v17 = [*(id *)(a1 + 56) homeManager];
    v18 = [(HMDAuditProhibitedAccessoryForRestrictedGuestOperation *)v16 executeOperationWithHomeManager:v17 flow:v38];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_91;
    v39[3] = &unk_264A2ACE0;
    uint64_t v44 = *(void *)(a1 + 56);
    id v40 = v38;
    id v41 = v3;
    id v42 = *(id *)(a1 + 48);
    v43 = v16;
    v19 = [v18 then:v39];
  }
  else
  {
    id v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = *(id *)(a1 + 56);
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      v32 = [v38 UUID];
      v33 = [*(id *)(a1 + 48) uuid];
      *(_DWORD *)buf = 138544130;
      v46 = v31;
      __int16 v47 = 2112;
      id v48 = v32;
      __int16 v49 = 2112;
      id v50 = v3;
      __int16 v51 = 2112;
      v52 = v33;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create audit prohibited accessory restricted guest operation for accessory: %@ and restricted guest: %@", buf, 0x2Au);
    }
    v34 = (void *)MEMORY[0x263F42538];
    id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    v19 = [v34 futureWithError:v17];
  }

LABEL_16:
  return v19;
}

uint64_t __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_93(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2_94;
  id v12 = &unk_264A2ACB8;
  uint64_t v13 = v6;
  id v14 = *(id *)(a1 + 32);
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v9);

  id v7 = (id)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
  return 1;
}

void __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2_94(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v8 && (isKindOfClass & 1) != 0)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
    [v6 setObject:v8 forKeyedSubscript:v7];
  }
}

uint64_t __136__HMDBackgroundOperationManagerHelper_auditProhibitedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_91(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 error];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 64);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = [*(id *)(a1 + 32) UUID];
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = [*(id *)(a1 + 48) uuid];
      int v26 = 138544130;
      id v27 = v8;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      uint64_t v31 = v10;
      __int16 v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Audit Prohibited restricted guest operation for accessory: %@ and restricted guest: %@ failed.", (uint8_t *)&v26, 0x2Au);
    }
    if ([v3 shouldReschedule])
    {
      id v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = *(id *)(a1 + 64);
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = HMFGetLogIdentifier();
        id v16 = [*(id *)(a1 + 32) UUID];
        uint64_t v17 = *(void *)(a1 + 40);
        v18 = [*(id *)(a1 + 48) uuid];
        int v26 = 138544130;
        id v27 = v15;
        __int16 v28 = 2112;
        id v29 = v16;
        __int16 v30 = 2112;
        uint64_t v31 = v17;
        __int16 v32 = 2112;
        v33 = v18;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Resulted in an unexpected failure, will schedule work for accessory: %@ and guest %@.", (uint8_t *)&v26, 0x2Au);
      }
      v19 = [*(id *)(a1 + 64) homeManager];
      uint64_t v20 = [v19 bgOpsManager];
      [v20 addOperation:*(void *)(a1 + 56)];
    }
    id v21 = [v3 error];
    id v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v24 = 2;
  }
  else
  {
    uint64_t v24 = 1;
  }

  return v24;
}

+ (id)auditAllowedAccessToRestrictedGuest:(id)a3 forAccessories:(id)a4 shouldRemoveScheduledOperations:(BOOL)a5 parentFlow:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v10 home];
  if (v7)
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke;
    v30[3] = &unk_264A2AC40;
    id v31 = v10;
    objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v30);
  }
  id v14 = (void *)MEMORY[0x263F42538];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2;
  v25[3] = &unk_264A2AC90;
  id v26 = v13;
  id v27 = v12;
  id v28 = v10;
  id v29 = a1;
  id v15 = v10;
  id v16 = v12;
  id v17 = v13;
  v18 = objc_msgSend(v11, "na_map:", v25);
  v19 = [v14 allSettled:v18];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_87;
  v23[3] = &unk_264A2BEF0;
  id v24 = v11;
  id v20 = v11;
  id v21 = [v19 then:v23];

  return v21;
}

uint64_t __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMDBackgroundOperationManagerHelper removeAllScheduledOperationsForGuest:*(void *)(a1 + 32) forAccessoryUUID:a2];
}

id __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [(id)objc_opt_class() findAccessoryUsing:v3 fromHome:*(void *)(a1 + 32)];
  id v5 = v4;
  if (!v4)
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = *(id *)(a1 + 56);
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      v25 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v46 = v24;
      __int16 v47 = 2112;
      id v48 = v3;
      __int16 v49 = 2112;
      id v50 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Did not find the accessory with UUID : %@ in home: %@", buf, 0x20u);
    }
    id v26 = (void *)MEMORY[0x263F42538];
    id v9 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2020];
    uint64_t v20 = [v26 futureWithError:v9];
    goto LABEL_15;
  }
  id v6 = v4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if ((isKindOfClass & 1) == 0 || ([v6 supportsAnyInPersonAccess] & 1) == 0)
  {
    uint64_t v20 = [MEMORY[0x263F42538] futureWithNoValue];
LABEL_15:
    v19 = (void *)v20;
    goto LABEL_16;
  }
  v38 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 56);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v36 = HMFGetLogIdentifier();
    v35 = [v38 UUID];
    id v13 = [*(id *)(a1 + 40) UUID];
    id v14 = [v6 shortDescription];
    [*(id *)(a1 + 48) shortDescription];
    id v15 = v37 = v10;
    *(_DWORD *)buf = 138544386;
    v46 = v36;
    __int16 v47 = 2112;
    id v48 = v35;
    __int16 v49 = 2112;
    id v50 = v13;
    __int16 v51 = 2112;
    v52 = v14;
    __int16 v53 = 2112;
    v54 = v15;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[ChildFlow: %@ Parent: %@] auditAllowedAccessToRestrictedGuest with accessory: %@ and restricted guest:%@", buf, 0x34u);

    id v10 = v37;
  }

  id v16 = [[HMDAuditAllowedAccessoryForRestrictedGuestOperation alloc] initWithAccessory:v6 restrictedGuest:*(void *)(a1 + 48)];
  if (v16)
  {
    id v17 = [*(id *)(a1 + 56) homeManager];
    v18 = [(HMDAuditAllowedAccessoryForRestrictedGuestOperation *)v16 executeOperationWithHomeManager:v17 flow:v38];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_84;
    v39[3] = &unk_264A2AC68;
    uint64_t v44 = *(void *)(a1 + 56);
    id v40 = v38;
    id v41 = v3;
    id v42 = *(id *)(a1 + 48);
    v43 = v16;
    v19 = [v18 then:v39];
  }
  else
  {
    id v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = *(id *)(a1 + 56);
    __int16 v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      __int16 v32 = [v38 UUID];
      v33 = [*(id *)(a1 + 48) uuid];
      *(_DWORD *)buf = 138544130;
      v46 = v31;
      __int16 v47 = 2112;
      id v48 = v32;
      __int16 v49 = 2112;
      id v50 = v3;
      __int16 v51 = 2112;
      v52 = v33;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create audit allowed accessory restricted guest operation for accessory: %@ and restricted guest: %@", buf, 0x2Au);
    }
    uint64_t v34 = (void *)MEMORY[0x263F42538];
    id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    v19 = [v34 futureWithError:v17];
  }

LABEL_16:
  return v19;
}

uint64_t __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_87(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2_89;
  id v12 = &unk_264A2ACB8;
  id v13 = v6;
  id v14 = *(id *)(a1 + 32);
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v9);

  id v7 = (id)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
  return 1;
}

void __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_2_89(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v8 && (isKindOfClass & 1) != 0)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
    [v6 setObject:v8 forKeyedSubscript:v7];
  }
}

uint64_t __133__HMDBackgroundOperationManagerHelper_auditAllowedAccessToRestrictedGuest_forAccessories_shouldRemoveScheduledOperations_parentFlow___block_invoke_84(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 64);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 32) UUID];
    [v3 credentialsRemoved];
    uint64_t v9 = HMFBooleanToString();
    uint64_t v10 = *(void **)(a1 + 40);
    int v33 = 138544130;
    uint64_t v34 = v7;
    __int16 v35 = 2112;
    v36 = v8;
    __int16 v37 = 2112;
    v38 = v9;
    __int16 v39 = 2112;
    id v40 = v10;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Audit allowed accessory operation had an end state for credentials to be removed as %@ for accessory: %@", (uint8_t *)&v33, 0x2Au);
  }
  id v11 = [v3 error];

  if (v11)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 64);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      id v16 = [*(id *)(a1 + 32) UUID];
      id v17 = *(void **)(a1 + 40);
      v18 = [*(id *)(a1 + 48) uuid];
      int v33 = 138544130;
      uint64_t v34 = v15;
      __int16 v35 = 2112;
      v36 = v16;
      __int16 v37 = 2112;
      v38 = v17;
      __int16 v39 = 2112;
      id v40 = v18;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Audit Allowed restricted guest operation for accessory: %@ and restricted guest: %@ failed.", (uint8_t *)&v33, 0x2Au);
    }
    if ([v3 shouldReschedule])
    {
      v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 64);
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        id v23 = [*(id *)(a1 + 32) UUID];
        id v24 = *(void **)(a1 + 40);
        v25 = [*(id *)(a1 + 48) uuid];
        int v33 = 138544130;
        uint64_t v34 = v22;
        __int16 v35 = 2112;
        v36 = v23;
        __int16 v37 = 2112;
        v38 = v24;
        __int16 v39 = 2112;
        id v40 = v25;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Resulted in an unexpected failure, will schedule work for accessory: %@ and guest %@.", (uint8_t *)&v33, 0x2Au);
      }
      id v26 = [*(id *)(a1 + 64) homeManager];
      id v27 = [v26 bgOpsManager];
      [v27 addOperation:*(void *)(a1 + 56)];
    }
    id v28 = [v3 error];
    id v29 = v28;
    if (v28)
    {
      id v30 = v28;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v31 = 2;
  }
  else
  {
    uint64_t v31 = 1;
  }

  return v31;
}

+ (void)auditAllRestrictedGuestAccessoriesForHome:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 restrictedGuests];
  int v6 = objc_msgSend(v5, "hmf_isEmpty");

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = a1;
  uint64_t v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@The home does not have any restricted guests", buf, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting the full audit for accessories which are restricted for the home: %@", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v20 = 0;
    id v13 = [v4 backingStore];
    id v14 = [v13 context];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __81__HMDBackgroundOperationManagerHelper_auditAllRestrictedGuestAccessoriesForHome___block_invoke;
    v15[3] = &unk_264A2A9A8;
    id v16 = v4;
    id v17 = buf;
    id v18 = v8;
    [v14 performBlockWithPinnedQueryGeneration:v15];

    _Block_object_dispose(buf, 8);
  }
}

void __81__HMDBackgroundOperationManagerHelper_auditAllRestrictedGuestAccessoriesForHome___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  v122[2] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uuid];
  id v3 = +[HMCContext findHomeWithModelID:v2];

  if (v3)
  {
    v122[0] = objc_opt_class();
    v122[1] = objc_opt_class();
    v86 = [MEMORY[0x263EFF8C0] arrayWithObjects:v122 count:2];
    id v4 = [*(id *)(v1 + 32) homeManager];
    id v5 = [v4 bgOpsManager];

    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    obuint64_t j = [v3 accessories];
    uint64_t v92 = [obj countByEnumeratingWithState:&v107 objects:v121 count:16];
    if (!v92) {
      goto LABEL_57;
    }
    uint64_t v7 = *(void *)v108;
    *(void *)&long long v6 = 138544130;
    long long v84 = v6;
    uint64_t v94 = v1;
    v88 = v3;
    v89 = v5;
    uint64_t v85 = *(void *)v108;
    while (1)
    {
      for (uint64_t i = 0; i != v92; ++i)
      {
        if (*(void *)v108 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v107 + 1) + 8 * i);
        context = (void *)MEMORY[0x230FBD990]();
        if ([v9 hasRGCapableService])
        {
          uint64_t v10 = [v9 lastPairingAuditTimeForRG];
          if (!v10) {
            goto LABEL_10;
          }
          id v11 = (void *)v10;
          [v9 lastPairingAuditTimeForRG];
          id v12 = v9;
          v14 = uint64_t v13 = i;
          BOOL v15 = +[HMDBackgroundOperationManagerHelper shouldWeAuditFromLastAudit:v14];

          uint64_t i = v13;
          uint64_t v9 = v12;

          if (v15)
          {
LABEL_10:
            uint64_t v91 = i;
            id v16 = objc_msgSend(v9, "modelID", v84);
            [v5 removeOperationsForAccessoryIdentifier:v16 operationKind:v86];

            v95 = [MEMORY[0x263EFF980] array];
            id v17 = [v9 modelID];
            uint64_t v18 = +[HMDBackgroundOperationManager findAccessoryUsing:v17 fromHome:*(void *)(v1 + 32)];

            v98 = (void *)v18;
            if (v18)
            {
              long long v105 = 0u;
              long long v106 = 0u;
              long long v103 = 0u;
              long long v104 = 0u;
              v87 = v9;
              v19 = [v9 allowedGuests];
              uint64_t v20 = [v19 countByEnumeratingWithState:&v103 objects:v120 count:16];
              if (v20)
              {
                uint64_t v21 = v20;
                id v22 = *(id *)v104;
                id v96 = *(id *)v104;
                do
                {
                  for (uint64_t j = 0; j != v21; ++j)
                  {
                    if (*(id *)v104 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    id v24 = *(void **)(v1 + 32);
                    v25 = [*(id *)(*((void *)&v103 + 1) + 8 * j) modelID];
                    id v26 = [v24 userWithUUID:v25];

                    if (v26 && [v26 isRestrictedGuest])
                    {
                      id v27 = (void *)MEMORY[0x230FBD990]();
                      id v28 = *(id *)(v1 + 48);
                      id v29 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                      {
                        id v30 = HMFGetLogIdentifier();
                        [v26 uuid];
                        v32 = uint64_t v31 = v19;
                        int v33 = [v98 uuid];
                        *(_DWORD *)buf = 138543874;
                        v112 = v30;
                        __int16 v113 = 2112;
                        v114 = v32;
                        __int16 v115 = 2112;
                        v116 = v33;
                        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Making sure guest's %@ credentials is on accessory %@", buf, 0x20u);

                        v19 = v31;
                        id v22 = v96;

                        uint64_t v1 = v94;
                      }

                      uint64_t v34 = [[HMDAuditAllowedAccessoryForRestrictedGuestOperation alloc] initWithAccessory:v98 restrictedGuest:v26];
                      if (v34) {
                        [v95 addObject:v34];
                      }
                    }
                  }
                  uint64_t v21 = [v19 countByEnumeratingWithState:&v103 objects:v120 count:16];
                }
                while (v21);
              }

              __int16 v35 = [v88 guests];
              v36 = [v35 asSet];
              __int16 v37 = [v87 allowedGuests];
              v38 = [v37 asSet];
              __int16 v39 = objc_msgSend(v36, "na_setByRemovingObjectsFromSet:", v38);

              long long v101 = 0u;
              long long v102 = 0u;
              long long v99 = 0u;
              long long v100 = 0u;
              id v97 = v39;
              uint64_t v40 = [v97 countByEnumeratingWithState:&v99 objects:v119 count:16];
              if (v40)
              {
                uint64_t v41 = v40;
                uint64_t v42 = *(void *)v100;
                do
                {
                  for (uint64_t k = 0; k != v41; ++k)
                  {
                    if (*(void *)v100 != v42) {
                      objc_enumerationMutation(v97);
                    }
                    uint64_t v44 = *(void **)(v1 + 32);
                    v45 = [*(id *)(*((void *)&v99 + 1) + 8 * k) modelID];
                    v46 = [v44 userWithUUID:v45];

                    if (v46 && [v46 isRestrictedGuest])
                    {
                      __int16 v47 = (void *)MEMORY[0x230FBD990]();
                      id v48 = *(id *)(v1 + 48);
                      __int16 v49 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                      {
                        id v50 = HMFGetLogIdentifier();
                        __int16 v51 = [v46 uuid];
                        v52 = [v98 uuid];
                        *(_DWORD *)buf = 138543874;
                        v112 = v50;
                        __int16 v113 = 2112;
                        v114 = v51;
                        __int16 v115 = 2112;
                        v116 = v52;
                        _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_INFO, "%{public}@Making sure guest's %@ credentials isn't on accessory %@", buf, 0x20u);

                        uint64_t v1 = v94;
                      }

                      __int16 v53 = [[HMDAuditProhibitedAccessoryForRestrictedGuestOperation alloc] initWithAccessory:v98 restrictedGuest:v46];
                      if (v53) {
                        [v95 addObject:v53];
                      }
                    }
                  }
                  uint64_t v41 = [v97 countByEnumeratingWithState:&v99 objects:v119 count:16];
                }
                while (v41);
              }

              id v54 = [[HMDPersistAuditAccessoryResultOperation alloc] initForRestrictedGuestWithAccessory:v98];
              if (v54)
              {
                [v95 addObject:v54];
                uint64_t v55 = (void *)[v95 copy];
                int v56 = [v89 scheduleOperationsWithDependenciesOnEachOtherFromArray:v55];

                v57 = (void *)MEMORY[0x230FBD990]();
                id v58 = *(id *)(v1 + 48);
                v59 = HMFGetOSLogHandle();
                v60 = v59;
                uint64_t i = v91;
                if (v56)
                {
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                  {
                    v61 = HMFGetLogIdentifier();
                    v62 = [v98 uuid];
                    v63 = [v98 identifier];
                    *(_DWORD *)buf = v84;
                    v112 = v61;
                    __int16 v113 = 2112;
                    v114 = v95;
                    __int16 v115 = 2112;
                    v116 = v62;
                    __int16 v117 = 2112;
                    v118 = v63;
                    v64 = v60;
                    os_log_type_t v65 = OS_LOG_TYPE_INFO;
                    v66 = "%{public}@[RG] Successfully added the operations to the BGOperationManager : %@ for accessory: %@/%@";
                    goto LABEL_51;
                  }
                }
                else if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  v61 = HMFGetLogIdentifier();
                  v62 = [v98 uuid];
                  v63 = [v98 identifier];
                  *(_DWORD *)buf = v84;
                  v112 = v61;
                  __int16 v113 = 2112;
                  v114 = v95;
                  __int16 v115 = 2112;
                  v116 = v62;
                  __int16 v117 = 2112;
                  v118 = v63;
                  v64 = v60;
                  os_log_type_t v65 = OS_LOG_TYPE_ERROR;
                  v66 = "%{public}@[RG] Unable to schedule all the audit operations : %@ for accessory: %@/%@. Removing them";
LABEL_51:
                  _os_log_impl(&dword_22F52A000, v64, v65, v66, buf, 0x2Au);

                  uint64_t v1 = v94;
                }

                *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
              }
              else
              {
                v74 = (void *)MEMORY[0x230FBD990]();
                id v75 = *(id *)(v1 + 48);
                v76 = HMFGetOSLogHandle();
                uint64_t i = v91;
                if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                {
                  v77 = HMFGetLogIdentifier();
                  v78 = [v98 shortDescription];
                  *(_DWORD *)buf = 138543618;
                  v112 = v77;
                  __int16 v113 = 2112;
                  v114 = v78;
                  _os_log_impl(&dword_22F52A000, v76, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audit pairing operation for accessory: %@", buf, 0x16u);
                }
              }
              id v3 = v88;

              id v5 = v89;
              uint64_t v7 = v85;
            }
            else
            {
              v67 = (void *)MEMORY[0x230FBD990]();
              id v68 = *(id *)(v1 + 48);
              v69 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                uint64_t v70 = HMFGetLogIdentifier();
                v71 = v9;
                v72 = (void *)v70;
                v73 = [v71 debugDescription];
                *(_DWORD *)buf = 138543618;
                v112 = v72;
                __int16 v113 = 2112;
                v114 = v73;
                _os_log_impl(&dword_22F52A000, v69, OS_LOG_TYPE_ERROR, "%{public}@Strange: Couldn't find the accessory in the memory but exist in working store : %@", buf, 0x16u);
              }
              id v5 = v89;
              uint64_t v7 = v85;
              uint64_t i = v91;
            }
          }
        }
      }
      uint64_t v92 = [obj countByEnumeratingWithState:&v107 objects:v121 count:16];
      if (!v92)
      {
LABEL_57:

        if (*(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24)) {
          [v5 evaluateOperations];
        }

        goto LABEL_63;
      }
    }
  }
  v79 = (void *)MEMORY[0x230FBD990]();
  id v80 = *(id *)(v1 + 48);
  v81 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
  {
    v82 = HMFGetLogIdentifier();
    v83 = [*(id *)(v1 + 32) uuid];
    *(_DWORD *)buf = 138543618;
    v112 = v82;
    __int16 v113 = 2112;
    v114 = v83;
    _os_log_impl(&dword_22F52A000, v81, OS_LOG_TYPE_ERROR, "%{public}@Could not start audit for home as it was not found inside working store: %@", buf, 0x16u);

    id v3 = 0;
  }

LABEL_63:
}

+ (void)makeSureToCreateBackUpOfHH2KeysIfNecessary:(id)a3
{
  id v5 = a3;
  if (+[HMDAuditHH2KeysForBackupOperation shouldWeScheduleHH2KeyBackupOperation])
  {
    id v3 = [HMDAuditHH2KeysForBackupOperation alloc];
    id v4 = [(HMDBackgroundOperation *)v3 initWithUserData:MEMORY[0x263EFFA78]];
    [v5 addOperation:v4];
    [v5 evaluateOperations];
  }
}

+ (BOOL)checkAndRaiseFaultIfHH2KeyIsMissing
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [a1 homeManager];
  id v4 = [v3 bgOpsManager];
  id v5 = [v4 getHH2ControllerKey];

  if (!v5)
  {
    long long v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Missing HH2 Controller Key. Please Debug!!!", (uint8_t *)&v11, 0xCu);
    }
  }
  return v5 == 0;
}

+ (BOOL)shouldWeAuditFromLastAudit:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  id v5 = [v3 date];
  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;

  return v7 >= 604800.0;
}

+ (void)removeAllUsersFromAirPlayAccessory:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  aBlocuint64_t k = a4;
  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = [v9 home];
  int v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = a1;
    BOOL v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = objc_msgSend(v9, "shortDescription", aBlock);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2112;
      __int16 v51 = v11;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Invalid instance of airplay accessory: %@ or Home: %@", buf, 0x20u);
    }
    uint64_t v18 = _Block_copy(aBlock);
    uint64_t v20 = v18;
    if (v18) {
      (*((void (**)(void *))v18 + 2))(v18);
    }
  }
  else
  {
    v19 = [v10 users];
    uint64_t v20 = objc_msgSend(v19, "na_filter:", &__block_literal_global_68_239721);

    uint64_t v21 = [v20 count];
    if (v21)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      __int16 v51 = __Block_byref_object_copy__239723;
      v52 = __Block_byref_object_dispose__239724;
      id v53 = 0;
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x2020000000;
      v49[3] = 0;
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __96__HMDBackgroundOperationManagerHelper_removeAllUsersFromAirPlayAccessory_withCompletionHandler___block_invoke_69;
      v41[3] = &unk_264A2AB80;
      v45 = v49;
      v46 = buf;
      id v47 = a1;
      uint64_t v48 = v21;
      id v22 = v7;
      id v42 = v22;
      v43 = v11;
      id v44 = aBlock;
      id v23 = _Block_copy(v41);
      id v24 = [v20 sortedArrayUsingComparator:&__block_literal_global_74_239725];
      v25 = [v24 reverseObjectEnumerator];
      id v26 = [v25 allObjects];

      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __96__HMDBackgroundOperationManagerHelper_removeAllUsersFromAirPlayAccessory_withCompletionHandler___block_invoke_70;
      v36[3] = &unk_264A2ABF8;
      id v40 = a1;
      id v37 = v22;
      id v38 = v9;
      id v27 = v23;
      id v39 = v27;
      objc_msgSend(v26, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v36);

      _Block_object_dispose(v49, 8);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v28 = (void *)MEMORY[0x230FBD990]();
      id v29 = a1;
      id v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = HMFGetLogIdentifier();
        __int16 v32 = objc_msgSend(v9, "shortDescription", aBlock);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v31;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v32;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@No admin users exist on this home. Not scheduling any remove pairing operation for accessory: %@", buf, 0x16u);
      }
      int v33 = _Block_copy(aBlock);
      uint64_t v34 = v33;
      if (v33) {
        (*((void (**)(void *))v33 + 2))(v33);
      }
    }
  }
}

void __96__HMDBackgroundOperationManagerHelper_removeAllUsersFromAirPlayAccessory_withCompletionHandler___block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = v4;
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v4)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v7 = *(void *)(v6 + 40);
    id v4 = (id *)(v6 + 40);
    if (!v7) {
      objc_storeStrong(v4, a2);
    }
  }
  id v8 = (void *)MEMORY[0x230FBD990](v4);
  id v9 = *(id *)(a1 + 72);
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    BOOL v12 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
    id v14 = [*(id *)(a1 + 32) shortDescription];
    int v34 = 138544386;
    __int16 v35 = v11;
    __int16 v36 = 2112;
    id v37 = v5;
    __int16 v38 = 2112;
    id v39 = v12;
    __int16 v40 = 2112;
    uint64_t v41 = v13;
    __int16 v42 = 2112;
    v43 = v14;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Removed accessory pairing finished with error: %@, pairingsRemoved: (%@/%@), accessory: %@", (uint8_t *)&v34, 0x34u);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == *(void *)(a1 + 80))
  {
    BOOL v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 72);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      v19 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
      uint64_t v20 = NSNumber;
      uint64_t v21 = [*(id *)(a1 + 40) users];
      id v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
      id v23 = [*(id *)(a1 + 32) shortDescription];
      int v34 = 138544130;
      __int16 v35 = v18;
      __int16 v36 = 2112;
      id v37 = v19;
      __int16 v38 = 2112;
      id v39 = v22;
      __int16 v40 = 2112;
      uint64_t v41 = v23;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Removed all pairings (%@/%@) from accessory %@", (uint8_t *)&v34, 0x2Au);
    }
    id v24 = _Block_copy(*(const void **)(a1 + 48));
    v25 = v24;
    if (v24) {
      (*((void (**)(void *))v24 + 2))(v24);
    }

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v26 = (void *)MEMORY[0x230FBD990]();
      id v27 = *(id *)(a1 + 72);
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = HMFGetLogIdentifier();
        id v30 = [*(id *)(a1 + 32) shortDescription];
        uint64_t v31 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        int v34 = 138543874;
        __int16 v35 = v29;
        __int16 v36 = 2112;
        id v37 = v30;
        __int16 v38 = 2112;
        id v39 = v31;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Since we could not remove all the pairings from the accessory: %@, let's schedule database audit on the database: %@", (uint8_t *)&v34, 0x20u);
      }
      __int16 v32 = *(void **)(a1 + 72);
      int v33 = [*(id *)(a1 + 40) homeManager];
      [v32 auditSharedUserEntriesInDatabase:v33];
    }
  }
}

void __96__HMDBackgroundOperationManagerHelper_removeAllUsersFromAirPlayAccessory_withCompletionHandler___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 32) shortDescription];
    id v9 = [v3 pairingIdentity];
    uint64_t v10 = [v9 identifier];
    int v11 = 138544130;
    BOOL v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Going to perform remove pairing operation of accessory: %@ for user:  %@ / %@", (uint8_t *)&v11, 0x2Au);
  }
  [*(id *)(a1 + 40) removeUser:v3 completionHandler:*(void *)(a1 + 48)];
}

uint64_t __96__HMDBackgroundOperationManagerHelper_removeAllUsersFromAirPlayAccessory_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAdministrator];
}

+ (BOOL)didAuditTimeExpiredOnThisAirPlayAccessory:(id)a3
{
  id v3 = a3;
  id v4 = [v3 lastPairingAuditTime];

  if (v4)
  {
    id v5 = [v3 lastPairingAuditTime];
    BOOL v6 = +[HMDBackgroundOperationManagerHelper shouldWeAuditFromLastAudit:v5];
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

+ (void)removeAllUsersFromHAPAccessory:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  int v11 = [v10 bridge];

  if (v11)
  {
    BOOL v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = a1;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = HMFGetLogIdentifier();
      id v16 = [v10 shortDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Not scheduling any remove pairing operation for accessory: %@", buf, 0x16u);
    }
    __int16 v17 = (uint64_t (*)(uint64_t, uint64_t))_Block_copy(v7);
    id v18 = v17;
    if (v17) {
      (*((void (**)(uint64_t (*)(uint64_t, uint64_t)))v17 + 2))(v17);
    }
  }
  else
  {
    uint64_t v19 = [v10 home];
    id v18 = v19;
    if (v10) {
      BOOL v20 = v19 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    if (v20)
    {
      uint64_t v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = a1;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        v25 = [v10 shortDescription];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v25;
        *(_WORD *)&buf[22] = 2112;
        v60 = v18;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid instance of accessory: %@ or Home: %@", buf, 0x20u);
      }
      id v26 = _Block_copy(v7);
      id v28 = v26;
      if (v26) {
        (*((void (**)(void *))v26 + 2))(v26);
      }
    }
    else
    {
      id v27 = [v19 users];
      id v28 = objc_msgSend(v27, "na_filter:", &__block_literal_global_61_239738);

      uint64_t v29 = [v28 count];
      if (v29)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v60 = __Block_byref_object_copy__239723;
        v61 = __Block_byref_object_dispose__239724;
        id v62 = 0;
        v58[0] = 0;
        v58[1] = v58;
        v58[2] = 0x2020000000;
        v58[3] = 0;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __92__HMDBackgroundOperationManagerHelper_removeAllUsersFromHAPAccessory_withCompletionHandler___block_invoke_62;
        aBlock[3] = &unk_264A2AB80;
        uint64_t v54 = v58;
        uint64_t v55 = buf;
        id v56 = a1;
        uint64_t v57 = v29;
        id v30 = v8;
        id v51 = v30;
        uint64_t v31 = v18;
        v52 = v31;
        id v53 = v7;
        uint64_t v41 = _Block_copy(aBlock);
        __int16 v32 = [v28 sortedArrayUsingComparator:&__block_literal_global_74_239725];
        int v33 = [v32 reverseObjectEnumerator];
        contexta = [v33 allObjects];

        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __92__HMDBackgroundOperationManagerHelper_removeAllUsersFromHAPAccessory_withCompletionHandler___block_invoke_64;
        v44[3] = &unk_264A2ABD0;
        id v49 = a1;
        id v45 = v30;
        id v46 = v10;
        id v47 = v31;
        id v34 = v41;
        id v48 = v34;
        objc_msgSend(contexta, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v44);

        _Block_object_dispose(v58, 8);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        context = (void *)MEMORY[0x230FBD990]();
        id v35 = a1;
        __int16 v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          id v37 = HMFGetLogIdentifier();
          __int16 v38 = [v10 shortDescription];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v37;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v38;
          _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@No admin users exist on this home. Not scheduling any remove pairing operation for accessory: %@", buf, 0x16u);
        }
        id v39 = _Block_copy(v7);
        __int16 v40 = v39;
        if (v39) {
          (*((void (**)(void *))v39 + 2))(v39);
        }
      }
    }
  }
}

void __92__HMDBackgroundOperationManagerHelper_removeAllUsersFromHAPAccessory_withCompletionHandler___block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = v4;
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v4)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v7 = *(void *)(v6 + 40);
    id v4 = (id *)(v6 + 40);
    if (!v7) {
      objc_storeStrong(v4, a2);
    }
  }
  id v8 = (void *)MEMORY[0x230FBD990](v4);
  id v9 = *(id *)(a1 + 72);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    BOOL v12 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    id v13 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
    id v14 = [*(id *)(a1 + 32) shortDescription];
    int v34 = 138544386;
    id v35 = v11;
    __int16 v36 = 2112;
    id v37 = v5;
    __int16 v38 = 2112;
    id v39 = v12;
    __int16 v40 = 2112;
    uint64_t v41 = v13;
    __int16 v42 = 2112;
    v43 = v14;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Remove accessory pairing finished with error: %@, pairingsRemoved: (%@/%@), accessory: %@", (uint8_t *)&v34, 0x34u);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == *(void *)(a1 + 80))
  {
    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 72);
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      uint64_t v19 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
      BOOL v20 = NSNumber;
      uint64_t v21 = [*(id *)(a1 + 40) users];
      id v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
      id v23 = [*(id *)(a1 + 32) shortDescription];
      int v34 = 138544130;
      id v35 = v18;
      __int16 v36 = 2112;
      id v37 = v19;
      __int16 v38 = 2112;
      id v39 = v22;
      __int16 v40 = 2112;
      uint64_t v41 = v23;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Removed all pairings (%@/%@) from accessory %@", (uint8_t *)&v34, 0x2Au);
    }
    id v24 = _Block_copy(*(const void **)(a1 + 48));
    v25 = v24;
    if (v24) {
      (*((void (**)(void *))v24 + 2))(v24);
    }

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v26 = (void *)MEMORY[0x230FBD990]();
      id v27 = *(id *)(a1 + 72);
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        id v30 = [*(id *)(a1 + 32) shortDescription];
        uint64_t v31 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        int v34 = 138543874;
        id v35 = v29;
        __int16 v36 = 2112;
        id v37 = v30;
        __int16 v38 = 2112;
        id v39 = v31;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Since we could not remove all the pairings from the accessory: %@, let's schedule database audit on the database: %@", (uint8_t *)&v34, 0x20u);
      }
      __int16 v32 = *(void **)(a1 + 72);
      int v33 = [*(id *)(a1 + 40) homeManager];
      [v32 auditSharedUserEntriesInDatabase:v33];
    }
  }
}

void __92__HMDBackgroundOperationManagerHelper_removeAllUsersFromHAPAccessory_withCompletionHandler___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 64);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 32) shortDescription];
    id v9 = [v3 pairingIdentity];
    id v10 = [v9 identifier];
    *(_DWORD *)buf = 138544130;
    uint64_t v21 = v7;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    v25 = v10;
    __int16 v26 = 2112;
    id v27 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Going to perform remove pairing operation of accessory: %@ for user:  %@ / %@", buf, 0x2Au);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __92__HMDBackgroundOperationManagerHelper_removeAllUsersFromHAPAccessory_withCompletionHandler___block_invoke_65;
  v14[3] = &unk_264A2ABA8;
  uint64_t v19 = *(void *)(a1 + 64);
  id v15 = v3;
  int v11 = *(void **)(a1 + 40);
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 56);
  id v13 = v3;
  [v11 performOperation:6 linkType:0 operationBlock:v14 errorBlock:v12];
}

void __92__HMDBackgroundOperationManagerHelper_removeAllUsersFromHAPAccessory_withCompletionHandler___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 64);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 32) pairingIdentity];
    id v9 = [v8 identifier];
    id v10 = *(void **)(a1 + 32);
    int v11 = [*(id *)(a1 + 40) shortDescription];
    int v26 = 138544130;
    id v27 = v7;
    __int16 v28 = 2112;
    uint64_t v29 = v9;
    __int16 v30 = 2112;
    uint64_t v31 = v10;
    __int16 v32 = 2112;
    int v33 = v11;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Going to remove pairing %@ for user : %@ from accessory: %@", (uint8_t *)&v26, 0x2Au);
  }
  uint64_t v12 = [v3 server];
  if ([*(id *)(a1 + 32) isCurrentUser])
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = *(id *)(a1 + 64);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = [*(id *)(a1 + 32) pairingIdentity];
      id v18 = [v17 identifier];
      uint64_t v19 = [*(id *)(a1 + 40) shortDescription];
      int v26 = 138543874;
      id v27 = v16;
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      __int16 v30 = 2112;
      uint64_t v31 = v19;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Going to remove pairing for current user: %@ from accessory: %@", (uint8_t *)&v26, 0x20u);
    }
    BOOL v20 = [*(id *)(a1 + 48) workQueue];
    [v12 removePairingForCurrentControllerOnQueue:v20 completion:*(void *)(a1 + 56)];
  }
  else
  {
    BOOL v20 = [*(id *)(a1 + 32) pairingIdentity];
    uint64_t v21 = [v20 identifier];
    __int16 v22 = [*(id *)(a1 + 32) pairingIdentity];
    id v23 = [v22 publicKey];
    __int16 v24 = [v23 data];
    v25 = [*(id *)(a1 + 48) workQueue];
    [v12 removePairingIdentifier:v21 pairingPublicKey:v24 completionQueue:v25 completionHandler:*(void *)(a1 + 56)];
  }
}

uint64_t __92__HMDBackgroundOperationManagerHelper_removeAllUsersFromHAPAccessory_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAdministrator];
}

+ (void)removeAllUsersFromMatterAccessory:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 home];
  id v9 = [v8 featureDataSource];
  char v10 = [v9 isRVCEnabled];

  if (v10)
  {
    id v11 = v6;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (v8 && v11 && (isKindOfClass & 1) != 0)
    {
      id v46 = [v11 accessoryServer];
      if (v46)
      {
        id v13 = [v8 users];
        id v14 = objc_msgSend(v13, "na_filter:", &__block_literal_global_239751);

        if ([v14 count])
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          LOBYTE(v61) = 0;
          dispatch_group_t v15 = dispatch_group_create();
          id v16 = [v14 sortedArrayUsingComparator:&__block_literal_global_74_239725];
          id v17 = [v16 reverseObjectEnumerator];
          contexta = [v17 allObjects];

          v53[0] = MEMORY[0x263EF8330];
          v53[1] = 3221225472;
          v53[2] = __95__HMDBackgroundOperationManagerHelper_removeAllUsersFromMatterAccessory_withCompletionHandler___block_invoke_54;
          v53[3] = &unk_264A2AB30;
          id v18 = v15;
          uint64_t v54 = v18;
          id v59 = a1;
          id v19 = v11;
          id v55 = v19;
          id v56 = v46;
          id v20 = v8;
          id v57 = v20;
          id v58 = buf;
          objc_msgSend(contexta, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v53);
          uint64_t v21 = [v20 workQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __95__HMDBackgroundOperationManagerHelper_removeAllUsersFromMatterAccessory_withCompletionHandler___block_invoke_59;
          block[3] = &unk_264A2AB58;
          id v51 = buf;
          id v52 = a1;
          id v48 = v19;
          id v49 = v20;
          id v50 = v7;
          dispatch_group_notify(v18, v21, block);

          _Block_object_dispose(buf, 8);
        }
        else
        {
          context = (void *)MEMORY[0x230FBD990]();
          id v38 = a1;
          id v39 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            __int16 v40 = HMFGetLogIdentifier();
            uint64_t v41 = [v11 shortDescription];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v40;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v41;
            _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@No admin users exist on this home. Not scheduling any remove pairing operation for accessory: %@", buf, 0x16u);
          }
          __int16 v42 = _Block_copy(v7);
          v43 = v42;
          if (v42) {
            (*((void (**)(void *))v42 + 2))(v42);
          }
        }
      }
      else
      {
        uint64_t v31 = (void *)MEMORY[0x230FBD990]();
        id v32 = a1;
        int v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = HMFGetLogIdentifier();
          id v35 = [v11 shortDescription];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v34;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v35;
          _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@No accessory server found for accessory: %@. Scheduling database audit", buf, 0x16u);
        }
        __int16 v36 = [v8 homeManager];
        [v32 auditSharedUserEntriesInDatabase:v36];

        id v37 = _Block_copy(v7);
        id v14 = v37;
        if (v37) {
          (*((void (**)(void *))v37 + 2))(v37);
        }
      }
    }
    else
    {
      __int16 v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = a1;
      int v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = HMFGetLogIdentifier();
        __int16 v28 = [v11 shortDescription];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 2112;
        v61 = v8;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Invalid instance of accessory: %@ or Home: %@", buf, 0x20u);
      }
      uint64_t v29 = _Block_copy(v7);
      __int16 v30 = v29;
      if (v29) {
        (*((void (**)(void *))v29 + 2))(v29);
      }
    }
  }
  else
  {
    __int16 v22 = _Block_copy(v7);
    id v23 = v22;
    if (v22) {
      (*((void (**)(void *))v22 + 2))(v22);
    }
  }
}

void __95__HMDBackgroundOperationManagerHelper_removeAllUsersFromMatterAccessory_withCompletionHandler___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  if ([v3 isCurrentUser])
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 72);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [v3 pairingIdentity];
      id v9 = [v8 identifier];
      char v10 = [*(id *)(a1 + 40) shortDescription];
      *(_DWORD *)buf = 138543874;
      int v33 = v7;
      __int16 v34 = 2112;
      id v35 = v9;
      __int16 v36 = 2112;
      id v37 = v10;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Going to remove pairing for current user: %@ from accessory: %@", buf, 0x20u);
    }
    id v11 = *(void **)(a1 + 48);
    uint64_t v12 = [*(id *)(a1 + 56) workQueue];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __95__HMDBackgroundOperationManagerHelper_removeAllUsersFromMatterAccessory_withCompletionHandler___block_invoke_55;
    v28[3] = &unk_264A2AB08;
    v31[2] = *(void *)(a1 + 72);
    id v13 = &v29;
    id v14 = &v30;
    id v29 = *(id *)(a1 + 40);
    id v30 = v3;
    v31[1] = *(void *)(a1 + 64);
    dispatch_group_t v15 = (id *)v31;
    v31[0] = *(id *)(a1 + 32);
    id v16 = v3;
    [v11 removePairingForCurrentControllerOnQueue:v12 completion:v28];
  }
  else
  {
    id v23 = *(void **)(a1 + 48);
    uint64_t v12 = [v3 pairingIdentity];
    __int16 v22 = [v12 identifier];
    id v17 = [v3 pairingIdentity];
    id v18 = [v17 publicKey];
    id v19 = [v18 data];
    id v20 = [*(id *)(a1 + 56) workQueue];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __95__HMDBackgroundOperationManagerHelper_removeAllUsersFromMatterAccessory_withCompletionHandler___block_invoke_57;
    v24[3] = &unk_264A2AB08;
    v27[2] = *(void *)(a1 + 72);
    id v13 = &v25;
    id v14 = &v26;
    id v25 = *(id *)(a1 + 40);
    id v26 = v3;
    v27[1] = *(void *)(a1 + 64);
    dispatch_group_t v15 = (id *)v27;
    v27[0] = *(id *)(a1 + 32);
    id v21 = v3;
    [v23 removePairingIdentifier:v22 pairingPublicKey:v19 completionQueue:v20 completionHandler:v24];
  }
}

void __95__HMDBackgroundOperationManagerHelper_removeAllUsersFromMatterAccessory_withCompletionHandler___block_invoke_59(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 64);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      id v6 = [*(id *)(a1 + 32) shortDescription];
      int v11 = 138543618;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Since we could not remove all the pairings from the accessory: %@, let's schedule database audit on the database", (uint8_t *)&v11, 0x16u);
    }
    id v7 = *(void **)(a1 + 64);
    id v8 = [*(id *)(a1 + 40) homeManager];
    [v7 auditSharedUserEntriesInDatabase:v8];
  }
  id v9 = _Block_copy(*(const void **)(a1 + 48));
  char v10 = v9;
  if (v9) {
    (*((void (**)(void *))v9 + 2))(v9);
  }
}

void __95__HMDBackgroundOperationManagerHelper_removeAllUsersFromMatterAccessory_withCompletionHandler___block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 64);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 32) shortDescription];
      id v9 = [*(id *)(a1 + 40) shortDescription];
      int v10 = 138544130;
      int v11 = v7;
      __int16 v12 = 2112;
      __int16 v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove pairing from accessory: %@ for user %@ with error: %@", (uint8_t *)&v10, 0x2Au);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __95__HMDBackgroundOperationManagerHelper_removeAllUsersFromMatterAccessory_withCompletionHandler___block_invoke_57(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 64);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 32) shortDescription];
      id v9 = [*(id *)(a1 + 40) shortDescription];
      int v10 = 138544130;
      int v11 = v7;
      __int16 v12 = 2112;
      __int16 v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove pairing from accessory: %@ for user %@ with error: %@", (uint8_t *)&v10, 0x2Au);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __95__HMDBackgroundOperationManagerHelper_removeAllUsersFromMatterAccessory_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAdministrator];
}

+ (void)removeAllUsersFromAccessory:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v11 = v10;
  }
  else {
    int v11 = 0;
  }
  id v12 = v11;

  id v13 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v14 = v13;
  }
  else {
    __int16 v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    +[HMDBackgroundOperationManagerHelper removeAllUsersFromMatterAccessory:v15 withCompletionHandler:v7];
  }
  else if (v9)
  {
    if ([v9 supportsAccessCode] & 1) != 0 || (objc_msgSend(v9, "supportsWalletKey"))
    {
      __int16 v16 = [v9 home];
      id v17 = dispatch_get_global_queue(25, 0);
      id v29 = (void *)[objc_alloc(MEMORY[0x263F42520]) initWithQueue:v17];
      uint64_t v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = a1;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = __int16 v28 = v16;
        [v13 uuid];
        v22 = id v27 = v17;
        *(_DWORD *)buf = 138543618;
        __int16 v36 = v21;
        __int16 v37 = 2112;
        uint64_t v38 = v22;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Removing Matter users from accessory: %@", buf, 0x16u);

        id v17 = v27;
        __int16 v16 = v28;
      }

      id v23 = [v16 removeUsersFromAccessory:v9];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __89__HMDBackgroundOperationManagerHelper_removeAllUsersFromAccessory_withCompletionHandler___block_invoke;
      v30[3] = &unk_264A2AAC0;
      id v34 = v19;
      id v31 = v13;
      id v32 = v9;
      id v33 = v7;
      id v24 = (id)[v23 inContext:v29 then:v30];
    }
    else
    {
      +[HMDBackgroundOperationManagerHelper removeAllUsersFromHAPAccessory:v9 withCompletionHandler:v7];
    }
  }
  else if (v12)
  {
    +[HMDBackgroundOperationManagerHelper removeAllUsersFromAirPlayAccessory:v12 withCompletionHandler:v7];
  }
  else
  {
    id v25 = _Block_copy(v7);
    id v26 = v25;
    if (v25) {
      (*((void (**)(void *))v25 + 2))(v25);
    }
  }
}

uint64_t __89__HMDBackgroundOperationManagerHelper_removeAllUsersFromAccessory_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 56);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 32) uuid];
    int v10 = 138543618;
    int v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Finished removing Matter users from accessory: %@", (uint8_t *)&v10, 0x16u);
  }
  +[HMDBackgroundOperationManagerHelper removeAllUsersFromHAPAccessory:*(void *)(a1 + 40) withCompletionHandler:*(void *)(a1 + 48)];

  return 1;
}

+ (BOOL)didAuditTimeExpiredOnThisAccessory:(id)a3
{
  id v3 = a3;
  id v4 = [v3 lastPairingAuditTime];

  if (v4)
  {
    id v5 = [v3 lastPairingAuditTime];
    BOOL v6 = +[HMDBackgroundOperationManagerHelper shouldWeAuditFromLastAudit:v5];
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

+ (void)_scheduleRemovePairingForAccessory:(id)a3 usingPairingIdentity:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (HMDRemoveAccessoryPairingSharedUserOperation *)a4;
  id v8 = [v6 castIfHAPAccessory];
  id v9 = v8;
  if (v8 && isBridgedAccessory(v8))
  {
    int v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    __int16 v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v9 uniqueIdentifier];
      int v32 = 138543618;
      id v33 = v13;
      __int16 v34 = 2112;
      id v35 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@(c) Not scheduling remove pairing operation for accessory: %@", (uint8_t *)&v32, 0x16u);
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  id v15 = [v6 identifier];

  if (v15)
  {
    __int16 v16 = [HMDRemoveAccessoryPairingSharedUserOperation alloc];
    id v17 = [v6 modelID];
    uint64_t v18 = [v6 identifier];
    id v19 = [v6 home];
    id v20 = [v19 modelID];
    id v21 = [(HMDRemoveAccessoryPairingSharedUserOperation *)v16 initWithAccessoryUUID:v17 accessoryIdentifier:v18 isOwnerIdentity:0 forSharedUser:0 sharedUserPairingIdentity:v7 homeUUIDWhereAccessoryWasPaired:v20];

    if (v21)
    {
      __int16 v22 = [a1 homeManager];
      id v23 = [v22 bgOpsManager];
      [v23 addOperation:v21];

      id v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = a1;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = HMFGetLogIdentifier();
        int v32 = 138543618;
        id v33 = v27;
        __int16 v34 = 2112;
        id v35 = v21;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@(c) Scheduled remove pairing operation for pairing identity : %@", (uint8_t *)&v32, 0x16u);
LABEL_15:
      }
    }
    else
    {
      id v24 = (void *)MEMORY[0x230FBD990]();
      id v29 = a1;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = HMFGetLogIdentifier();
        id v30 = [v6 modelID];
        id v31 = [v6 identifier];
        int v32 = 138544130;
        id v33 = v27;
        __int16 v34 = 2112;
        id v35 = v7;
        __int16 v36 = 2112;
        __int16 v37 = v30;
        __int16 v38 = 2112;
        uint64_t v39 = v31;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@(c) Failed to create remove pairing operation for pairing identity : %@, %@/%@", (uint8_t *)&v32, 0x2Au);

        goto LABEL_15;
      }
    }

    goto LABEL_17;
  }
  int v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = a1;
  __int16 v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = HMFGetLogIdentifier();
    uint64_t v14 = [v6 modelID];
    __int16 v28 = [v6 identifier];
    int v32 = 138543874;
    id v33 = v13;
    __int16 v34 = 2112;
    id v35 = v14;
    __int16 v36 = 2112;
    __int16 v37 = v28;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@(c) Cannot remove pairing for mkfAccessory without critical data, modelID: %@ ... identifier: %@", (uint8_t *)&v32, 0x20u);

    goto LABEL_11;
  }
LABEL_12:

LABEL_17:
}

+ (void)scheduleRemovePairingForAccessory:(id)a3 sharedUser:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (HMDRemoveAccessoryPairingSharedUserOperation *)a4;
  id v8 = [v6 castIfHAPAccessory];
  id v9 = v8;
  if (v8 && isBridgedAccessory(v8))
  {
    int v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    __int16 v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v9 uniqueIdentifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v13;
      __int16 v41 = 2112;
      __int16 v42 = v14;
      __int16 v43 = 2112;
      uint64_t v44 = v7;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@(b) Not scheduling remove pairing operation for accessory: %@ and shared user: %@", buf, 0x20u);
LABEL_12:

LABEL_15:
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  id v15 = [v6 identifier];

  if (v15)
  {
    if (([(HMDRemoveAccessoryPairingSharedUserOperation *)v7 isAllowedToAddOrRemoveHAPPairingsOnAccessory] & 1) == 0)
    {
      int v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = a1;
      __int16 v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v40 = v13;
        __int16 v41 = 2112;
        __int16 v42 = v7;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@(b) Cannot remove pairing for user as not allowed by policy: %@", buf, 0x16u);
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    __int16 v37 = v9;
    __int16 v16 = [HMDRemoveAccessoryPairingSharedUserOperation alloc];
    id v17 = [v6 modelID];
    uint64_t v18 = [v6 identifier];
    uint64_t v19 = [(HMDRemoveAccessoryPairingSharedUserOperation *)v7 isOwner];
    id v20 = [(HMDRemoveAccessoryPairingSharedUserOperation *)v7 uuid];
    __int16 v38 = v7;
    id v21 = [(HMDRemoveAccessoryPairingSharedUserOperation *)v7 pairingIdentity];
    __int16 v22 = [v6 home];
    id v23 = [v22 modelID];
    id v24 = [(HMDRemoveAccessoryPairingSharedUserOperation *)v16 initWithAccessoryUUID:v17 accessoryIdentifier:v18 isOwnerIdentity:v19 forSharedUser:v20 sharedUserPairingIdentity:v21 homeUUIDWhereAccessoryWasPaired:v23];

    if (v24)
    {
      id v25 = [a1 homeManager];
      id v26 = [v25 bgOpsManager];
      [v26 addOperation:v24];

      id v27 = (void *)MEMORY[0x230FBD990]();
      id v28 = a1;
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        id v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v40 = v30;
        __int16 v41 = 2112;
        id v7 = v38;
        __int16 v42 = v38;
        __int16 v43 = 2112;
        uint64_t v44 = v24;
        id v31 = "%{public}@(b) Scheduled remove pairing operation for shared user : %@, %@";
        int v32 = v29;
        os_log_type_t v33 = OS_LOG_TYPE_INFO;
        uint32_t v34 = 32;
LABEL_19:
        _os_log_impl(&dword_22F52A000, v32, v33, v31, buf, v34);

LABEL_21:
        id v9 = v37;

        goto LABEL_22;
      }
    }
    else
    {
      id v27 = (void *)MEMORY[0x230FBD990]();
      id v36 = a1;
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        id v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v40 = v30;
        __int16 v41 = 2112;
        id v7 = v38;
        __int16 v42 = v38;
        id v31 = "%{public}@(b) Failed to create remove pairing operation for shared user : %@";
        int v32 = v29;
        os_log_type_t v33 = OS_LOG_TYPE_ERROR;
        uint32_t v34 = 22;
        goto LABEL_19;
      }
    }
    id v7 = v38;
    goto LABEL_21;
  }
  int v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = a1;
  __int16 v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = HMFGetLogIdentifier();
    uint64_t v14 = [v6 modelID];
    id v35 = [v6 identifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v40 = v13;
    __int16 v41 = 2112;
    __int16 v42 = v14;
    __int16 v43 = 2112;
    uint64_t v44 = v35;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@(b) Cannot remove pairing for mkfAccessory without critical data, modelID: %@ ... identifier: %@", buf, 0x20u);

    goto LABEL_12;
  }
LABEL_16:

LABEL_22:
}

+ (void)scheduleRemovePairingForAccessory:(id)a3 forSharedUser:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (HMDRemoveAccessoryPairingSharedUserOperation *)a4;
  id v8 = [v6 castIfHAPAccessory];
  id v9 = v8;
  if (!v8 || !isBridgedAccessory(v8))
  {
    id v15 = [v6 identifier];

    if (v15)
    {
      if (+[HMDUser isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:v7])
      {
        __int16 v38 = v9;
        __int16 v16 = [(HMDRemoveAccessoryPairingSharedUserOperation *)v7 pairingIdentity];
        id v17 = [HMDRemoveAccessoryPairingSharedUserOperation alloc];
        uint64_t v18 = [v6 modelID];
        uint64_t v19 = [v6 identifier];
        uint64_t v20 = [(HMDRemoveAccessoryPairingSharedUserOperation *)v7 isOwner];
        uint64_t v39 = v7;
        id v21 = [(HMDRemoveAccessoryPairingSharedUserOperation *)v7 modelID];
        __int16 v22 = [v6 home];
        id v23 = [v22 modelID];
        id v24 = [(HMDRemoveAccessoryPairingSharedUserOperation *)v17 initWithAccessoryUUID:v18 accessoryIdentifier:v19 isOwnerIdentity:v20 forSharedUser:v21 sharedUserPairingIdentity:v16 homeUUIDWhereAccessoryWasPaired:v23];

        if (v24)
        {
          id v25 = [a1 homeManager];
          id v26 = [v25 bgOpsManager];
          [v26 addOperation:v24];

          id v27 = (void *)MEMORY[0x230FBD990]();
          id v28 = a1;
          id v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            id v30 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            __int16 v41 = v30;
            __int16 v42 = 2112;
            id v7 = v39;
            __int16 v43 = v39;
            __int16 v44 = 2112;
            uint64_t v45 = v24;
            _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@(a) Scheduled remove pairing operation for shared user : %@, %@", buf, 0x20u);
LABEL_19:

LABEL_21:
            id v9 = v38;

            goto LABEL_22;
          }
        }
        else
        {
          id v27 = (void *)MEMORY[0x230FBD990]();
          id v35 = a1;
          id v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            id v30 = HMFGetLogIdentifier();
            id v36 = [v6 modelID];
            __int16 v37 = [v6 identifier];
            *(_DWORD *)buf = 138544130;
            __int16 v41 = v30;
            __int16 v42 = 2112;
            id v7 = v39;
            __int16 v43 = v39;
            __int16 v44 = 2112;
            uint64_t v45 = v36;
            __int16 v46 = 2112;
            id v47 = v37;
            _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@(a) Failed to create remove pairing operation for shared user : %@, %@/%@", buf, 0x2Au);

            goto LABEL_19;
          }
        }
        id v7 = v39;
        goto LABEL_21;
      }
      int v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = a1;
      __int16 v12 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v6 debugDescription];
      id v31 = [(HMFObject *)v7 debugDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v41 = v13;
      __int16 v42 = 2112;
      __int16 v43 = v14;
      __int16 v44 = 2112;
      uint64_t v45 = v31;
      int v32 = "%{public}@(a) Not allowed to remove pairing for mkfAccessory: %@, shared user: %@";
      os_log_type_t v33 = v12;
      os_log_type_t v34 = OS_LOG_TYPE_INFO;
    }
    else
    {
      int v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = a1;
      __int16 v12 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v6 modelID];
      id v31 = [v6 identifier];
      *(_DWORD *)buf = 138543874;
      __int16 v41 = v13;
      __int16 v42 = 2112;
      __int16 v43 = v14;
      __int16 v44 = 2112;
      uint64_t v45 = v31;
      int v32 = "%{public}@(a) Cannot remove pairing for mkfAccessory without critical data, modelID: %@ ... identifier: %@";
      os_log_type_t v33 = v12;
      os_log_type_t v34 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_22F52A000, v33, v34, v32, buf, 0x20u);

    goto LABEL_15;
  }
  int v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = a1;
  __int16 v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    uint64_t v14 = [v9 uniqueIdentifier];
    *(_DWORD *)buf = 138543874;
    __int16 v41 = v13;
    __int16 v42 = 2112;
    __int16 v43 = v14;
    __int16 v44 = 2112;
    uint64_t v45 = v7;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@(a) Not scheduling remove pairing operation for accessory: %@ and shared user: %@", buf, 0x20u);
LABEL_15:
  }
LABEL_16:

LABEL_22:
}

+ (void)scheduleAddPairingForAccessory:(id)a3 sharedUser:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (!v10 || ([v10 bridge], id v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
  {
    if (([v7 isOwner] & 1) != 0 || objc_msgSend(v7, "isPending"))
    {
      __int16 v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = a1;
      uint64_t v14 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v15;
      __int16 v46 = 2112;
      id v47 = v7;
      uint64_t v18 = "%{public}@(b) Failed to create add pairing operation for user: %@";
      uint64_t v19 = v14;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
LABEL_12:
      _os_log_impl(&dword_22F52A000, v19, v20, v18, buf, 0x16u);
      goto LABEL_13;
    }
    if (([v7 isAllowedToAddOrRemoveHAPPairingsOnAccessory] & 1) == 0)
    {
      __int16 v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = a1;
      uint64_t v14 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v15;
      __int16 v46 = 2112;
      id v47 = v7;
      uint64_t v18 = "%{public}@(b) Not allowed to add pairing for this user : %@";
      uint64_t v19 = v14;
      os_log_type_t v20 = OS_LOG_TYPE_INFO;
      goto LABEL_12;
    }
    __int16 v43 = [HMDAddAccessoryPairingSharedUserOperation alloc];
    __int16 v42 = [v8 uuid];
    id v21 = [v8 identifier];
    uint64_t v22 = [v7 uuid];
    id v23 = [v7 pairingIdentity];
    unsigned int v41 = [v7 isAdministrator];
    id v24 = [v7 home];
    id v25 = [v24 uuid];
    id v26 = (void *)v22;
    id v27 = [(HMDAddAccessoryPairingSharedUserOperation *)v43 initWithAccessoryUUID:v42 accessoryIdentifier:v21 forSharedUser:v22 sharedUserPairingIdentity:v23 asOwner:0 asSharedAdmin:v41 homeUUIDWhereAccessoryWasPaired:v25];

    if (v27)
    {
      id v28 = [a1 homeManager];
      id v29 = [v28 bgOpsManager];
      [v29 addOperation:v27];

      id v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = a1;
      int v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        os_log_type_t v33 = HMFGetLogIdentifier();
        [v7 isAdministrator];
        HMFBooleanToString();
        os_log_type_t v34 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
        id v35 = [v8 shortDescription];
        *(_DWORD *)buf = 138544386;
        uint64_t v45 = v33;
        __int16 v46 = 2112;
        id v47 = v7;
        __int16 v48 = 2112;
        id v49 = v27;
        __int16 v50 = 2112;
        id v51 = v34;
        __int16 v52 = 2112;
        id v53 = v35;
        id v36 = "%{public}@(b) Scheduled add pairing operation for shared user : %@, %@, asSharedAdmin: %@, accessory: %@";
        __int16 v37 = v32;
        os_log_type_t v38 = OS_LOG_TYPE_INFO;
        uint32_t v39 = 52;
LABEL_24:
        _os_log_impl(&dword_22F52A000, v37, v38, v36, buf, v39);
      }
    }
    else
    {
      id v30 = (void *)MEMORY[0x230FBD990]();
      id v40 = a1;
      int v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        os_log_type_t v33 = HMFGetLogIdentifier();
        [v7 isAdministrator];
        HMFBooleanToString();
        os_log_type_t v34 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
        id v35 = [v8 shortDescription];
        *(_DWORD *)buf = 138544130;
        uint64_t v45 = v33;
        __int16 v46 = 2112;
        id v47 = v7;
        __int16 v48 = 2112;
        id v49 = v34;
        __int16 v50 = 2112;
        id v51 = v35;
        id v36 = "%{public}@(b) Failed to create add pairing operation for shared user : %@, asSharedAdmin: %@, accessory: %@";
        __int16 v37 = v32;
        os_log_type_t v38 = OS_LOG_TYPE_ERROR;
        uint32_t v39 = 42;
        goto LABEL_24;
      }
    }

    goto LABEL_15;
  }
  __int16 v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = a1;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    [v7 isAdministrator];
    HMFBooleanToString();
    __int16 v16 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
    id v17 = [v10 shortDescription];
    *(_DWORD *)buf = 138544130;
    uint64_t v45 = v15;
    __int16 v46 = 2112;
    id v47 = v7;
    __int16 v48 = 2112;
    id v49 = v16;
    __int16 v50 = 2112;
    id v51 = v17;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@(b) Not scheduling add pairing operation for shared user: %@, asSharedAdmin: %@, accessory: %@", buf, 0x2Au);

LABEL_13:
  }
LABEL_14:

LABEL_15:
}

+ (void)scheduleAddPairingForAccessory:(id)a3 forSharedUser:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (HMDAddAccessoryPairingSharedUserOperation *)a4;
  id v8 = [v6 castIfHAPAccessory];
  id v9 = v8;
  if (v8 && isBridgedAccessory(v8))
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    __int16 v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v9 uniqueIdentifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v54 = v13;
      __int16 v55 = 2112;
      id v56 = v14;
      __int16 v57 = 2112;
      id v58 = v7;
      id v15 = "%{public}@(a) Not scheduling add pairing operation for accessory: %@ and user: %@";
LABEL_17:
      unsigned int v41 = v12;
      os_log_type_t v42 = OS_LOG_TYPE_ERROR;
      uint32_t v43 = 32;
LABEL_18:
      _os_log_impl(&dword_22F52A000, v41, v42, v15, buf, v43);
LABEL_19:

      goto LABEL_20;
    }
    goto LABEL_20;
  }
  __int16 v16 = [(HMDAddAccessoryPairingSharedUserOperation *)v7 privilege];
  uint64_t v17 = [v16 unsignedIntegerValue];

  uint64_t v18 = [(HMDAddAccessoryPairingSharedUserOperation *)v7 privilege];
  if (!v18 || v17 == 2)
  {
  }
  else
  {

    if (v17 != 3)
    {
      uint64_t v19 = [v6 identifier];

      if (!v19)
      {
        id v10 = (void *)MEMORY[0x230FBD990]();
        id v11 = a1;
        __int16 v12 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          goto LABEL_20;
        }
        id v13 = HMFGetLogIdentifier();
        uint64_t v14 = [v6 modelID];
        __int16 v44 = [v6 identifier];
        *(_DWORD *)buf = 138543874;
        uint64_t v54 = v13;
        __int16 v55 = 2112;
        id v56 = v14;
        __int16 v57 = 2112;
        id v58 = v44;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@(a) Cannot add pairing for mkfAccessory without critical data, modelID: %@ ... identifier: %@", buf, 0x20u);

        goto LABEL_19;
      }
      if (!+[HMDUser isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:v7])
      {
        id v10 = (void *)MEMORY[0x230FBD990]();
        id v11 = a1;
        __int16 v12 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
          goto LABEL_20;
        }
        id v13 = HMFGetLogIdentifier();
        uint64_t v14 = [(HMDAddAccessoryPairingSharedUserOperation *)v7 modelID];
        *(_DWORD *)buf = 138543618;
        uint64_t v54 = v13;
        __int16 v55 = 2112;
        id v56 = v14;
        id v15 = "%{public}@(a) Cannot create add pairing operation for user:%@ as not allowed by policy";
        unsigned int v41 = v12;
        os_log_type_t v42 = OS_LOG_TYPE_INFO;
        uint32_t v43 = 22;
        goto LABEL_18;
      }
      os_log_type_t v20 = [(HMDAddAccessoryPairingSharedUserOperation *)v7 pairingIdentity];
      if (!v20)
      {
        uint64_t v45 = (void *)MEMORY[0x230FBD990]();
        id v46 = a1;
        id v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        {
          __int16 v48 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v54 = v48;
          __int16 v55 = 2114;
          id v56 = v7;
          _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_FAULT, "%{public}@(a) Cannot create add pairing operation for user %{public}@ with no pairingIdentity", buf, 0x16u);
        }
        goto LABEL_33;
      }
      id v51 = [HMDAddAccessoryPairingSharedUserOperation alloc];
      id v21 = [v6 modelID];
      uint64_t v22 = [v6 identifier];
      id v23 = [(HMDAddAccessoryPairingSharedUserOperation *)v7 modelID];
      id v24 = [v6 home];
      uint64_t v25 = [v24 modelID];
      id v26 = v20;
      id v27 = (void *)v25;
      uint64_t v50 = v25;
      id v28 = v51;
      __int16 v52 = v26;
      id v29 = -[HMDAddAccessoryPairingSharedUserOperation initWithAccessoryUUID:accessoryIdentifier:forSharedUser:sharedUserPairingIdentity:asOwner:asSharedAdmin:homeUUIDWhereAccessoryWasPaired:](v28, "initWithAccessoryUUID:accessoryIdentifier:forSharedUser:sharedUserPairingIdentity:asOwner:asSharedAdmin:homeUUIDWhereAccessoryWasPaired:", v21, v22, v23, v50);

      if (v29)
      {
        id v30 = [a1 homeManager];
        id v31 = [v30 bgOpsManager];
        [v31 addOperation:v29];

        int v32 = (void *)MEMORY[0x230FBD990]();
        id v33 = a1;
        os_log_type_t v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          id v35 = HMFGetLogIdentifier();
          HMFBooleanToString();
          id v36 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          uint64_t v54 = v35;
          __int16 v55 = 2112;
          id v56 = v7;
          __int16 v57 = 2112;
          id v58 = v29;
          __int16 v59 = 2112;
          v60 = v36;
          __int16 v37 = "%{public}@(a) Scheduled add pairing operation for shared user : %@, %@, asSharedAdmin: %@";
          os_log_type_t v38 = v34;
          os_log_type_t v39 = OS_LOG_TYPE_INFO;
          uint32_t v40 = 42;
LABEL_31:
          _os_log_impl(&dword_22F52A000, v38, v39, v37, buf, v40);
        }
      }
      else
      {
        int v32 = (void *)MEMORY[0x230FBD990]();
        id v49 = a1;
        os_log_type_t v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id v35 = HMFGetLogIdentifier();
          HMFBooleanToString();
          id v36 = (HMDAddAccessoryPairingSharedUserOperation *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          uint64_t v54 = v35;
          __int16 v55 = 2112;
          id v56 = v7;
          __int16 v57 = 2112;
          id v58 = v36;
          __int16 v37 = "%{public}@(a) Failed to create add pairing operation for shared user : %@, asSharedAdmin: %@";
          os_log_type_t v38 = v34;
          os_log_type_t v39 = OS_LOG_TYPE_ERROR;
          uint32_t v40 = 32;
          goto LABEL_31;
        }
      }
      os_log_type_t v20 = v52;

LABEL_33:

      goto LABEL_21;
    }
  }
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = a1;
  __int16 v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = HMFGetLogIdentifier();
    uint64_t v14 = [(HMDAddAccessoryPairingSharedUserOperation *)v7 privilege];
    *(_DWORD *)buf = 138543874;
    uint64_t v54 = v13;
    __int16 v55 = 2112;
    id v56 = v7;
    __int16 v57 = 2112;
    id v58 = v14;
    id v15 = "%{public}@(a) Cannot create add pairing operation for user: %@ with privilege: %@";
    goto LABEL_17;
  }
LABEL_20:

LABEL_21:
}

+ (void)scheduleFullAuditForAccessory:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([a1 checkAndRaiseFaultIfHH2KeyIsMissing])
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = a1;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [v4 modelID];
      int v25 = 138543618;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v9;
      id v10 = "%{public}@Cannot audit shared user entries in Database for accessory : %@ due to missing HH2 key";
LABEL_9:
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v25, 0x16u);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  id v11 = [v4 identifier];

  if (!v11)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = a1;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [v4 debugDescription];
      int v25 = 138543618;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v9;
      id v10 = "%{public}@Cannot audit the accessory with nil identifier. Ignoring audit for : %@";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_15;
  }
  __int16 v12 = [HMDAuditAccessoryPairingOperation alloc];
  id v13 = [v4 modelID];
  uint64_t v14 = [v4 identifier];
  id v15 = [v4 home];
  __int16 v16 = [v15 modelID];
  uint64_t v17 = [(HMDAuditAccessoryPairingOperation *)v12 initWithAccessoryUUID:v13 accessoryIdentifier:v14 homeUUIDWhereAccessoryWasPaired:v16];

  if (v17)
  {
    uint64_t v18 = [a1 homeManager];
    uint64_t v19 = [v18 bgOpsManager];
    [v19 addOperation:v17];
  }
  else
  {
    os_log_type_t v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = a1;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      id v24 = [v4 modelID];
      int v25 = 138543618;
      id v26 = v23;
      __int16 v27 = 2112;
      id v28 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audit pairing operation for : %@", (uint8_t *)&v25, 0x16u);
    }
  }

LABEL_15:
}

+ (void)dumpUsers:(id)a3 usingTag:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__HMDBackgroundOperationManagerHelper_dumpUsers_usingTag___block_invoke;
  v8[3] = &unk_264A2AA98;
  id v9 = v6;
  id v10 = a1;
  id v7 = v6;
  objc_msgSend(a3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);
}

void __58__HMDBackgroundOperationManagerHelper_dumpUsers_usingTag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 40);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [v3 userID];
    id v10 = [v3 privilege];
    int v11 = 138544130;
    __int16 v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    __int16 v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@%@ : %@ (%@)", (uint8_t *)&v11, 0x2Au);
  }
}

+ (void)auditSharedUserEntriesInDatabaseForHome:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [a1 checkAndRaiseFaultIfHH2KeyIsMissing];
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = a1;
  int v11 = HMFGetOSLogHandle();
  __int16 v12 = v11;
  if (!v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v24 = v16;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Going to audit shared user entries in database for home : %@", buf, 0x16u);
    }
    __int16 v17 = +[HMDCoreData sharedInstance];
    uint64_t v18 = [v6 uuid];
    uint64_t v14 = [v17 contextWithHomeUUID:v18];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke;
    v19[3] = &unk_264A2C968;
    id v20 = v6;
    id v22 = v10;
    id v21 = v7;
    [v14 performBlockWithPinnedQueryGeneration:v19];

    __int16 v15 = v20;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v24 = v13;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot trigger audit for shared users for %@ due to missing HH2 controller key", buf, 0x16u);
  }
  uint64_t v14 = (void (**)(void, void))_Block_copy(v7);
  if (v14)
  {
    __int16 v15 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    ((void (**)(void, void *))v14)[2](v14, v15);
LABEL_9:
  }
}

void __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uuid];
  id v3 = +[HMCContext findHomeWithModelID:v2];

  if (v3)
  {
    id v4 = [v3 accessories];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    __int16 v17 = __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_28;
    uint64_t v18 = &unk_264A2A9F8;
    uint64_t v20 = *(void *)(a1 + 48);
    id v19 = v3;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v15);

    id v5 = objc_msgSend(*(id *)(a1 + 32), "homeManager", v15, v16, v17, v18);
    id v6 = [v5 bgOpsManager];
    [v6 evaluateOperations];

    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
    int v8 = v19;
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 48);
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = HMFGetLogIdentifier();
      __int16 v13 = [*(id *)(a1 + 32) uuid];
      *(_DWORD *)buf = 138543618;
      id v22 = v12;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Did not find the home with model id : %@", buf, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 40);
    int v8 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    if (v14) {
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v8);
    }
  }
}

void __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 castIfHAPAccessory];
  uint64_t v5 = [v3 castIfAirPlayAccessory];
  if (v5 | v4 && (!v4 || (isBridgedAccessory((void *)v4) & 1) == 0))
  {
    id v6 = [(id)v4 needsPairingAudit];
    if ([v6 BOOLValue])
    {

LABEL_8:
      int v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 40);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = HMFGetLogIdentifier();
        __int16 v12 = [(id)v4 needsPairingAudit];
        [v12 BOOLValue];
        __int16 v13 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        v67 = v11;
        __int16 v68 = 2112;
        uint64_t v69 = v4;
        __int16 v70 = 2112;
        v71 = v13;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Accessory needs full audit: [%@] [needsAudit: %@]", buf, 0x20u);
      }
      uint64_t v14 = *(void **)(a1 + 40);
      uint64_t v15 = v4;
LABEL_19:
      [v14 scheduleFullAuditForAccessory:v15];
      goto LABEL_20;
    }
    if (v4)
    {
      char v7 = [*(id *)(a1 + 40) didAuditTimeExpiredOnThisAccessory:v4];

      if (v7) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    uint64_t v16 = [(id)v5 needsPairingAudit];
    if ([v16 BOOLValue])
    {

LABEL_16:
      uint64_t v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = *(id *)(a1 + 40);
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        id v22 = [(id)v5 needsPairingAudit];
        [v22 BOOLValue];
        __int16 v23 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        v67 = v21;
        __int16 v68 = 2112;
        uint64_t v69 = v5;
        __int16 v70 = 2112;
        v71 = v23;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Accessory needs full audit: [%@] [needsAudit: %@]", buf, 0x20u);
      }
      uint64_t v14 = *(void **)(a1 + 40);
      uint64_t v15 = v5;
      goto LABEL_19;
    }
    if (v5)
    {
      char v17 = [*(id *)(a1 + 40) didAuditTimeExpiredOnThisAirPlayAccessory:v5];

      if (v17) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    id v24 = (void *)MEMORY[0x230FBD990]();
    uint64_t v25 = (void *)MEMORY[0x263EFF9C0];
    id v26 = [*(id *)(a1 + 32) users];
    id v53 = [v25 setWithArray:v26];

    if (v4)
    {
      uint64_t v27 = (void *)MEMORY[0x263EFF9C0];
      id v28 = (void *)v4;
    }
    else
    {
      if (!v5)
      {
        id v30 = 0;
        goto LABEL_27;
      }
      uint64_t v27 = (void *)MEMORY[0x263EFF9C0];
      id v28 = (void *)v5;
    }
    uint64_t v29 = [v28 pairedUsers];
    id v30 = [v27 setWithArray:v29];

LABEL_27:
    [*(id *)(a1 + 40) dumpUsers:v53 usingTag:@"Home users list"];
    [*(id *)(a1 + 40) dumpUsers:v30 usingTag:@"paired users list"];
    id v31 = (void *)[v53 mutableCopy];
    [v31 minusSet:v30];
    [*(id *)(a1 + 40) dumpUsers:v31 usingTag:@"Users to add"];
    int v32 = (void *)[v30 mutableCopy];
    [v32 minusSet:v53];
    [*(id *)(a1 + 40) dumpUsers:v32 usingTag:@"Users to remove"];
    if ([v31 count] || objc_msgSend(v32, "count"))
    {
      if (![v31 isEqualToSet:v32])
      {
        v62[0] = MEMORY[0x263EF8330];
        v62[1] = 3221225472;
        v62[2] = __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_42;
        v62[3] = &unk_264A2AA48;
        id v41 = (id)v4;
        uint64_t v42 = *(void *)(a1 + 40);
        id v63 = v41;
        uint64_t v65 = v42;
        __int16 v52 = v24;
        id v43 = (id)v5;
        id v64 = v43;
        objc_msgSend(v31, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v62);
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_2;
        v58[3] = &unk_264A2AA48;
        id v44 = v41;
        uint64_t v45 = *(void *)(a1 + 40);
        id v59 = v44;
        uint64_t v61 = v45;
        id v46 = v43;
        id v60 = v46;
        objc_msgSend(v32, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v58);
        id v47 = [v44 pairingsToRemove];
        v54[0] = MEMORY[0x263EF8330];
        v54[1] = 3221225472;
        v54[2] = __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_3;
        v54[3] = &unk_264A2AA70;
        id v48 = v44;
        uint64_t v49 = *(void *)(a1 + 40);
        id v55 = v48;
        uint64_t v57 = v49;
        id v50 = v46;
        id v24 = v52;
        id v56 = v50;
        objc_msgSend(v47, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v54);

LABEL_38:
        goto LABEL_20;
      }
      id v33 = (void *)MEMORY[0x230FBD990]();
      id v34 = *(id *)(a1 + 40);
      id v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v51 = v33;
        __int16 v37 = v36 = v24;
        *(_DWORD *)buf = 138543874;
        v67 = v37;
        __int16 v68 = 2112;
        uint64_t v69 = (uint64_t)v31;
        __int16 v70 = 2112;
        v71 = v32;
        os_log_type_t v38 = "%{public}@Users to add & remove cannot be same : [Add: %@] [Remove: %@]";
        os_log_type_t v39 = v35;
        os_log_type_t v40 = OS_LOG_TYPE_ERROR;
LABEL_36:
        _os_log_impl(&dword_22F52A000, v39, v40, v38, buf, 0x20u);

        id v24 = v36;
        id v33 = v51;
      }
    }
    else
    {
      id v33 = (void *)MEMORY[0x230FBD990]();
      id v34 = *(id *)(a1 + 40);
      id v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v51 = v33;
        __int16 v37 = v36 = v24;
        *(_DWORD *)buf = 138543874;
        v67 = v37;
        __int16 v68 = 2112;
        uint64_t v69 = (uint64_t)v31;
        __int16 v70 = 2112;
        v71 = v32;
        os_log_type_t v38 = "%{public}@No users to add & remove : [Add: %@] [Remove: %@]";
        os_log_type_t v39 = v35;
        os_log_type_t v40 = OS_LOG_TYPE_INFO;
        goto LABEL_36;
      }
    }

    goto LABEL_38;
  }
LABEL_20:
}

void __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_42(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (+[HMDUser isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:](HMDUser, "isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:"))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3 || (uint64_t v3 = *(void *)(a1 + 40)) != 0) {
      [*(id *)(a1 + 48) scheduleAddPairingForAccessory:v3 forSharedUser:v4];
    }
  }
}

void __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (+[HMDUser isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:](HMDUser, "isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:"))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3 || (uint64_t v3 = *(void *)(a1 + 40)) != 0) {
      [*(id *)(a1 + 48) scheduleRemovePairingForAccessory:v3 forSharedUser:v4];
    }
  }
}

void __101__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForHome_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 || (uint64_t v4 = *(void *)(a1 + 40)) != 0)
  {
    id v5 = v3;
    [*(id *)(a1 + 48) _scheduleRemovePairingForAccessory:v4 usingPairingIdentity:v3];
    id v3 = v5;
  }
}

+ (void)removePairingOnAllAccessoriesOfHome:(id)a3 forSharedUser:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isAllowedToAddOrRemoveHAPPairingsOnAccessory])
  {
    if ([v7 isOwner]) {
      _HMFPreconditionFailure();
    }
    int v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = a1;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      int v32 = v11;
      __int16 v33 = 2112;
      id v34 = v7;
      __int16 v35 = 2112;
      id v36 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Scheduling remove accessory pairing operation for shared user : %@ / %@", buf, 0x20u);
    }
    __int16 v12 = +[HMDCoreData sharedInstance];
    __int16 v13 = [v6 uuid];
    uint64_t v14 = [v12 contextWithHomeUUID:v13];

    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __89__HMDBackgroundOperationManagerHelper_removePairingOnAllAccessoriesOfHome_forSharedUser___block_invoke;
    id v26 = &unk_264A2AA20;
    id v15 = v6;
    id v27 = v15;
    id v30 = v9;
    id v28 = v7;
    id v29 = v14;
    id v16 = v14;
    [v16 performBlockWithPinnedQueryGeneration:&v23];
    char v17 = objc_msgSend(v15, "homeManager", v23, v24, v25, v26);
    uint64_t v18 = [v17 bgOpsManager];
    [v18 evaluateOperations];
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = a1;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      int v32 = v22;
      __int16 v33 = 2112;
      id v34 = v6;
      __int16 v35 = 2112;
      id v36 = v7;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Not allowed to remove pairings for all the accessories of the home: %@, sharedUser: %@", buf, 0x20u);
    }
  }
}

void __89__HMDBackgroundOperationManagerHelper_removePairingOnAllAccessoriesOfHome_forSharedUser___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uuid];
  id v3 = +[HMCContext findHomeWithModelID:v2];

  if (v3)
  {
    uint64_t v4 = [v3 accessories];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __89__HMDBackgroundOperationManagerHelper_removePairingOnAllAccessoriesOfHome_forSharedUser___block_invoke_25;
    v25[3] = &unk_264A2A9F8;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 56);
    id v26 = v5;
    uint64_t v27 = v6;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v25);

    id v7 = *(void **)(a1 + 48);
    id v24 = 0;
    int v8 = [v7 save:&v24];
    id v9 = v24;
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 56);
    __int16 v12 = HMFGetOSLogHandle();
    __int16 v13 = v12;
    if (!v8 || v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        uint64_t v23 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        id v29 = v14;
        __int16 v30 = 2112;
        id v31 = v23;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the pairingsToRemove on accessories for home : %@", buf, 0x16u);
        goto LABEL_11;
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      id v15 = [*(id *)(a1 + 40) pairingIdentity];
      id v16 = [v15 identifier];
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v29 = v14;
      __int16 v30 = 2112;
      id v31 = v16;
      __int16 v32 = 2112;
      uint64_t v33 = v17;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully added [%@] to pairingsToRemove on all accessories of the home : %@", buf, 0x20u);

LABEL_11:
    }

    goto LABEL_13;
  }
  uint64_t v18 = (void *)MEMORY[0x230FBD990]();
  id v19 = *(id *)(a1 + 56);
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    id v21 = HMFGetLogIdentifier();
    id v22 = [*(id *)(a1 + 32) uuid];
    *(_DWORD *)buf = 138543618;
    id v29 = v21;
    __int16 v30 = 2112;
    id v31 = v22;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Did not find the home with model id : %@", buf, 0x16u);
  }
LABEL_13:
}

void __89__HMDBackgroundOperationManagerHelper_removePairingOnAllAccessoriesOfHome_forSharedUser___block_invoke_25(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 castIfHAPAccessory];
  uint64_t v4 = [v11 castIfAirPlayAccessory];
  id v5 = (void *)v4;
  if (v3 | v4)
  {
    if (v3)
    {
      char v6 = isBridgedAccessory((void *)v3);
      uint64_t v4 = v3;
      if (v6) {
        goto LABEL_12;
      }
    }
    else if (!v4)
    {
      int v8 = 0;
      goto LABEL_8;
    }
    id v7 = [(id)v4 pairingsToRemove];
    int v8 = (void *)[v7 mutableCopy];

LABEL_8:
    id v9 = [*(id *)(a1 + 32) pairingIdentity];
    [v8 addObject:v9];

    if (v3) {
      id v10 = (void *)v3;
    }
    else {
      id v10 = v5;
    }
    [v10 setPairingsToRemove:v8];
    [*(id *)(a1 + 40) scheduleRemovePairingForAccessory:v11 sharedUser:*(void *)(a1 + 32)];
  }
LABEL_12:
}

+ (void)addPairingOnAllAccessoriesOfHome:(id)a3 forSharedUser:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isOwner]) {
    _HMFPreconditionFailure();
  }
  int v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = a1;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v11;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Scheduling add accessory pairing operation for shared user: %@ / %@", buf, 0x20u);
  }
  __int16 v12 = [v6 accessories];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __86__HMDBackgroundOperationManagerHelper_addPairingOnAllAccessoriesOfHome_forSharedUser___block_invoke;
  id v19 = &unk_264A2A9D0;
  id v20 = v7;
  id v21 = v9;
  id v13 = v7;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v16);

  uint64_t v14 = objc_msgSend(v6, "homeManager", v16, v17, v18, v19);
  id v15 = [v14 bgOpsManager];
  [v15 evaluateOperations];
}

void __86__HMDBackgroundOperationManagerHelper_addPairingOnAllAccessoriesOfHome_forSharedUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  id v6 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (!v5)
  {
    if (!v8) {
      goto LABEL_16;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    id v15 = *(void **)(a1 + 40);
    id v17 = v8;
LABEL_15:
    [v15 scheduleAddPairingForAccessory:v17 sharedUser:v16];
    goto LABEL_16;
  }
  id v9 = [v5 bridge];

  if (!v9)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    id v15 = *(void **)(a1 + 40);
    id v17 = v5;
    goto LABEL_15;
  }
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 40);
  __int16 v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = HMFGetLogIdentifier();
    uint64_t v14 = [v5 shortDescription];
    int v18 = 138543618;
    id v19 = v13;
    __int16 v20 = 2112;
    id v21 = v14;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Not scheduling add pairing operation for accessory: %@", (uint8_t *)&v18, 0x16u);
  }
LABEL_16:
}

+ (void)auditSharedUserEntriesInDatabaseForAccessory:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([a1 checkAndRaiseFaultIfHH2KeyIsMissing])
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = a1;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      id v9 = [v4 uuid];

      if (v9)
      {
        id v10 = [v4 uuid];
        [v10 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v16 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      __int16 v18 = 2096;
      id v19 = &v16;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot audit shared user entries in Database for accessory : %{uuid_t}.16P due to missing HH2 key", buf, 0x1Cu);
    }
  }
  else
  {
    id v11 = [MEMORY[0x263F42628] defaultScheduler];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __84__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForAccessory___block_invoke;
    void v13[3] = &unk_264A2C6A0;
    id v14 = v4;
    id v15 = a1;
    id v12 = (id)[v11 performWithQualityOfService:9 block:v13];
  }
}

void __84__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForAccessory___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) home];
  if (([v2 isCurrentDeviceConfirmedPrimaryResident] & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 40);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [v2 shortDescription];
      id v14 = [*(id *)(a1 + 32) shortDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2112;
      id v41 = v14;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Invalid home or this device is not a resident for home: %@. Not auditing the shared users for accessory: %@", buf, 0x20u);
    }
    goto LABEL_8;
  }
  id v3 = *(id *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 bridge];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 40);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 32) shortDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Not scheduling any audit pairing operation for accessory: %@", buf, 0x16u);
    }
LABEL_8:

    goto LABEL_19;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v41) = 0;
  id v15 = +[HMDCoreData sharedInstance];
  long long v16 = [v2 uuid];
  id v17 = [v15 contextWithHomeUUID:v16];

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __84__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForAccessory___block_invoke_12;
  v30[3] = &unk_264A2A9A8;
  id v18 = *(id *)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 40);
  id v31 = v18;
  __int16 v32 = buf;
  uint64_t v33 = v19;
  uint64_t v20 = (void *)MEMORY[0x230FBD990]([v17 performBlockWithPinnedQueryGeneration:v30]);
  id v21 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  uint64_t v22 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    int v24 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
    uint64_t v25 = [*(id *)(a1 + 32) shortDescription];
    __int16 v26 = (void *)v25;
    id v27 = &stru_26E2EB898;
    *(_DWORD *)uint64_t v34 = 138543874;
    id v35 = v23;
    __int16 v36 = 2112;
    if (!v24) {
      id v27 = @"NOT ";
    }
    uint64_t v37 = v27;
    __int16 v38 = 2112;
    uint64_t v39 = v25;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@%@Going to audit pairings for accessory: %@", v34, 0x20u);
  }
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    uint64_t v28 = [v2 homeManager];
    id v29 = [v28 bgOpsManager];
    [v29 evaluateOperations];
  }
  _Block_object_dispose(buf, 8);
LABEL_19:
}

void __84__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabaseForAccessory___block_invoke_12(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uuid];
  uint64_t v3 = +[HMCContext findHAPAccessoryWithModelID:v2];

  id v4 = [*(id *)(a1 + 32) uuid];
  uint64_t v5 = +[HMCContext findAirPlayAccessoryWithModelID:v4];

  if (v3 | v5)
  {
    if (v3)
    {
      id v6 = (id)v3;
      id v7 = [v6 needsPairingAudit];
      if ([v7 BOOLValue]) {
        char v8 = 1;
      }
      else {
        char v8 = [*(id *)(a1 + 48) didAuditTimeExpiredOnThisAccessory:v6];
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;

      long long v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 48);
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        [*(id *)(a1 + 32) shortDescription];
        uint64_t v20 = v29 = v17;
        id v21 = [v6 needsPairingAudit];
        [v21 BOOLValue];
        HMFBooleanToString();
        v22 = id v31 = v16;
        id v23 = [v6 lastPairingAuditTime];
        *(_DWORD *)buf = 138544130;
        uint64_t v34 = v19;
        __int16 v35 = 2112;
        __int16 v36 = v20;
        __int16 v37 = 2112;
        uint64_t v38 = (uint64_t)v22;
        __int16 v39 = 2112;
        os_log_type_t v40 = v23;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Checking shared user entries audit for accessory: %@ [needsAudit: %@ - lastPairingAuditTime: %@]", buf, 0x2Au);

        id v17 = v29;
        long long v16 = v31;
      }
    }
    else
    {
      if (!v5)
      {
        id v6 = 0;
LABEL_19:
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          [*(id *)(a1 + 48) scheduleFullAuditForAccessory:v6];
        }

        goto LABEL_22;
      }
      id v6 = (id)v5;
      id v14 = [v6 needsPairingAudit];
      if ([v14 BOOLValue]) {
        char v15 = 1;
      }
      else {
        char v15 = [*(id *)(a1 + 48) didAuditTimeExpiredOnThisAirPlayAccessory:v6];
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v15;

      long long v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 48);
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        int v24 = [*(id *)(a1 + 32) shortDescription];
        __int16 v30 = [v6 needsPairingAudit];
        __int16 v32 = v16;
        [v30 BOOLValue];
        uint64_t v25 = HMFBooleanToString();
        __int16 v26 = [v6 lastPairingAuditTime];
        *(_DWORD *)buf = 138544130;
        uint64_t v34 = v28;
        __int16 v35 = 2112;
        __int16 v36 = v24;
        __int16 v37 = 2112;
        uint64_t v38 = v25;
        id v27 = (void *)v25;
        __int16 v39 = 2112;
        os_log_type_t v40 = v26;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Checking shared user entries audit for airplay accessory: %@ [needsAudit: %@ - lastPairingAuditTime: %@]", buf, 0x2Au);

        long long v16 = v32;
      }
    }

    goto LABEL_19;
  }
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = *(id *)(a1 + 48);
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = HMFGetLogIdentifier();
    id v13 = [*(id *)(a1 + 32) shortDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v34 = v12;
    __int16 v35 = 2112;
    __int16 v36 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Did not find the accessory model for %@ to audit", buf, 0x16u);
  }
LABEL_22:
}

+ (void)auditSharedUserEntriesInDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F42628] defaultScheduler];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabase___block_invoke;
  v8[3] = &unk_264A2C6A0;
  id v9 = v4;
  id v10 = a1;
  id v6 = v4;
  id v7 = (id)[v5 performWithQualityOfService:9 block:v8];
}

void __72__HMDBackgroundOperationManagerHelper_auditSharedUserEntriesInDatabase___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = +[HMDBackgroundOperationManager findHomeWhereThisDeviceIsConfirmedPrimaryResident:*(void *)(a1 + 32)];
  uint64_t v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      id v7 = HMFGetLogIdentifier();
      int v9 = 138543618;
      id v10 = v7;
      __int16 v11 = 2112;
      id v12 = v2;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@This device is primary resident on home: %@", (uint8_t *)&v9, 0x16u);
    }
    [*(id *)(a1 + 40) auditSharedUserEntriesInDatabaseForHome:v2 withCompletionHandler:0];
  }
  else
  {
    if (v6)
    {
      char v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@This device is not a resident on any home. Not auditing the shared users in database", (uint8_t *)&v9, 0xCu);
    }
  }
}

+ (id)homeManager
{
  v2 = +[HMDMainDriver driver];
  uint64_t v3 = [v2 homeManager];

  return v3;
}

@end