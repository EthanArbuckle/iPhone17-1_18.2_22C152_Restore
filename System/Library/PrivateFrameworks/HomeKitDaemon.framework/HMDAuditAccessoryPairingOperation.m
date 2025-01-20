@interface HMDAuditAccessoryPairingOperation
+ (id)logCategory;
- (BOOL)mainWithError:(id *)a3;
- (HMDAuditAccessoryPairingOperation)initWithAccessoryUUID:(id)a3 accessoryIdentifier:(id)a4 homeUUIDWhereAccessoryWasPaired:(id)a5;
- (id)getPairingsFromAccessory:(id)a3;
- (id)getPairingsFromAirPlayAccessory:(id)a3;
- (id)logIdentifier;
- (id)usersOnHomeWhosePairingsNeedsToBeAddedOrRemoved:(id)a3;
- (void)auditPairings:(id)a3 forAccessory:(id)a4;
- (void)scheduleAuditOperations:(id)a3;
@end

@implementation HMDAuditAccessoryPairingOperation

- (id)logIdentifier
{
  v2 = [(HMDBackgroundOperation *)self operationUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)usersOnHomeWhosePairingsNeedsToBeAddedOrRemoved:(id)a3
{
  v3 = [a3 users];
  v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_162547);

  v5 = [MEMORY[0x263EFF9C0] setWithArray:v4];

  return v5;
}

uint64_t __85__HMDAuditAccessoryPairingOperation_usersOnHomeWhosePairingsNeedsToBeAddedOrRemoved___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isOwner]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isAllowedToAddOrRemoveHAPPairingsOnAccessory];
  }

  return v3;
}

- (id)getPairingsFromAirPlayAccessory:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [v4 shortDescription];
    *(_DWORD *)buf = 138543618;
    v40 = v8;
    __int16 v41 = 2112;
    v42 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Get pairings from accessory : %@", buf, 0x16u);
  }
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v11 = [MEMORY[0x263EFF980] array];
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 3221225472;
  v33 = __69__HMDAuditAccessoryPairingOperation_getPairingsFromAirPlayAccessory___block_invoke;
  v34 = &unk_264A2A648;
  v35 = v6;
  id v12 = v4;
  id v36 = v12;
  id v13 = v11;
  id v37 = v13;
  v14 = v10;
  v38 = v14;
  [v12 pairingsWithCompletionHandler:&v31];
  dispatch_time_t v15 = dispatch_time(0, 120000000000);
  intptr_t v16 = dispatch_group_wait(v14, v15);
  if (v16)
  {
    v23 = (void *)MEMORY[0x230FBD990](v16, v17, v18, v19, v20, v21, v22);
    v24 = v6;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      v27 = objc_msgSend(v12, "shortDescription", v31, v32, v33, v34, v35, v36, v37);
      *(_DWORD *)buf = 138543618;
      v40 = v26;
      __int16 v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Timed out while getting list of pairings from the accessory : %@", buf, 0x16u);
    }
  }
  v28 = v38;
  id v29 = v13;

  return v29;
}

void __69__HMDAuditAccessoryPairingOperation_getPairingsFromAirPlayAccessory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    v11 = [*(id *)(a1 + 40) shortDescription];
    int v13 = 138544130;
    v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@AirPlay list pairing operation finished with: %@ for accessory: %@, error: %@", (uint8_t *)&v13, 0x2Au);
  }
  id v12 = *(void **)(a1 + 48);
  if (v12) {
    [v12 addObjectsFromArray:v5];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (id)getPairingsFromAccessory:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    v9 = [v4 shortDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v32 = v8;
    __int16 v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Get pairings from accessory : %@", buf, 0x16u);
  }
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v11 = [MEMORY[0x263EFF980] array];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __62__HMDAuditAccessoryPairingOperation_getPairingsFromAccessory___block_invoke;
  v27[3] = &unk_264A22C00;
  v27[4] = v6;
  id v28 = v4;
  id v29 = v10;
  id v12 = v11;
  id v30 = v12;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __62__HMDAuditAccessoryPairingOperation_getPairingsFromAccessory___block_invoke_30;
  v24[3] = &unk_264A2E210;
  v24[4] = v6;
  id v13 = v28;
  id v25 = v13;
  v14 = v29;
  v26 = v14;
  [v13 performOperation:7 linkType:0 operationBlock:v27 errorBlock:v24];
  dispatch_time_t v15 = dispatch_time(0, 120000000000);
  if (dispatch_group_wait(v14, v15))
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    __int16 v17 = v6;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      id v20 = [v13 shortDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v19;
      __int16 v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Timed out while getting list of pairings from the accessory : %@", buf, 0x16u);
    }
  }
  uint64_t v21 = v26;
  id v22 = v12;

  return v22;
}

void __62__HMDAuditAccessoryPairingOperation_getPairingsFromAccessory___block_invoke(id *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 server];
  if (v4)
  {
    id v5 = dispatch_get_global_queue(-32768, 0);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __62__HMDAuditAccessoryPairingOperation_getPairingsFromAccessory___block_invoke_27;
    v12[3] = &unk_264A2A648;
    id v6 = a1[5];
    v12[4] = a1[4];
    id v13 = v6;
    id v14 = a1[7];
    id v15 = a1[6];
    [v4 listPairingsWithCompletionQueue:v5 completionHandler:v12];
  }
  else
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1[4];
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [a1[5] shortDescription];
      *(_DWORD *)buf = 138543618;
      __int16 v17 = v10;
      __int16 v18 = 2112;
      __int16 v19 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to list pairing as there is no accessory server for accessory : %@", buf, 0x16u);
    }
    dispatch_group_leave((dispatch_group_t)a1[6]);
  }
}

void __62__HMDAuditAccessoryPairingOperation_getPairingsFromAccessory___block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) shortDescription];
    int v9 = 138543618;
    v10 = v7;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to list pairings for accessory : %@", (uint8_t *)&v9, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __62__HMDAuditAccessoryPairingOperation_getPairingsFromAccessory___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    __int16 v11 = [*(id *)(a1 + 40) shortDescription];
    int v12 = 138544130;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    __int16 v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@HAP list pairing operation finished with: %@ for accessory: %@, error: %@", (uint8_t *)&v12, 0x2Au);
  }
  [*(id *)(a1 + 48) addObjectsFromArray:v5];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void)scheduleAuditOperations:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDBackgroundOperation *)self bgOpsManager];
  int v6 = [v5 scheduleOperationsWithDependenciesOnEachOtherFromArray:v4];
  v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  int v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = HMFGetLogIdentifier();
      int v12 = [(HMDAccessoryBackgroundOperation *)v8 accessoryUUID];
      uint64_t v13 = [(HMDAccessoryBackgroundOperation *)v8 accessoryIdentifier];
      int v17 = 138544130;
      __int16 v18 = v11;
      __int16 v19 = 2112;
      id v20 = v4;
      __int16 v21 = 2112;
      id v22 = v12;
      __int16 v23 = 2112;
      v24 = v13;
      __int16 v14 = "%{public}@Successfully added the operations to the BGOperationManager : %@ for accessory: %@/%@";
      id v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v15, v16, v14, (uint8_t *)&v17, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __int16 v11 = HMFGetLogIdentifier();
    int v12 = [(HMDAccessoryBackgroundOperation *)v8 accessoryUUID];
    uint64_t v13 = [(HMDAccessoryBackgroundOperation *)v8 accessoryIdentifier];
    int v17 = 138544130;
    __int16 v18 = v11;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    v24 = v13;
    __int16 v14 = "%{public}@Unable to schedule all the audit operations : %@ for accessory: %@/%@. Removing them";
    id v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }
}

- (void)auditPairings:(id)a3 forAccessory:(id)a4
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  int v6 = (HMDPersistAuditAccessoryResultOperation *)a3;
  id v7 = a4;
  id v8 = [v7 home];
  int v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  __int16 v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    uint64_t v13 = [v7 shortDescription];
    *(_DWORD *)buf = 138544130;
    v76 = v12;
    __int16 v77 = 2112;
    v78 = v6;
    __int16 v79 = 2112;
    v80 = v13;
    __int16 v81 = 2112;
    v82 = v8;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Going to audit HAP pairings: %@ on Accessory %@ for home: %@", buf, 0x2Au);
  }
  if (v8)
  {
    v60 = [(HMDBackgroundOperation *)v10 bgOpsManager];
    __int16 v14 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", -[HMDPersistAuditAccessoryResultOperation count](v6, "count"));
    id v15 = [MEMORY[0x263EFF9C0] set];
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __64__HMDAuditAccessoryPairingOperation_auditPairings_forAccessory___block_invoke;
    v71[3] = &unk_264A2BC08;
    id v16 = v8;
    id v72 = v16;
    int v17 = v15;
    v73 = v17;
    id v18 = v14;
    id v74 = v18;
    [(HMDPersistAuditAccessoryResultOperation *)v6 hmf_enumerateWithAutoreleasePoolUsingBlock:v71];
    __int16 v19 = [(HMDAuditAccessoryPairingOperation *)v10 usersOnHomeWhosePairingsNeedsToBeAddedOrRemoved:v16];
    v59 = v18;
    [(HMDPersistAuditAccessoryResultOperation *)v19 minusSet:v18];
    v61 = v6;
    if (![(HMDPersistAuditAccessoryResultOperation *)v19 hmf_isEmpty]
      || ![(HMDPersistAuditAccessoryResultOperation *)v17 hmf_isEmpty])
    {
      id v30 = (void *)MEMORY[0x230FBD990]();
      uint64_t v31 = v10;
      uint64_t v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        __int16 v33 = HMFGetLogIdentifier();
        v34 = [v7 shortDescription];
        *(_DWORD *)buf = 138543874;
        v76 = v33;
        __int16 v77 = 2112;
        v78 = v19;
        __int16 v79 = 2112;
        v80 = v34;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Going to add pairings [%@] on accessory [%@]", buf, 0x20u);
      }
      uint64_t v35 = (void *)MEMORY[0x230FBD990]();
      id v36 = v31;
      id v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = HMFGetLogIdentifier();
        v39 = [v7 shortDescription];
        *(_DWORD *)buf = 138543874;
        v76 = v38;
        __int16 v77 = 2112;
        v78 = v17;
        __int16 v79 = 2112;
        v80 = v39;
        _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Going to remove pairings [%@] from accessory [%@]", buf, 0x20u);
      }
      v40 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[HMDPersistAuditAccessoryResultOperation count](v17, "count")+ -[HMDPersistAuditAccessoryResultOperation count](v19, "count"));
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __64__HMDAuditAccessoryPairingOperation_auditPairings_forAccessory___block_invoke_20;
      v67[3] = &unk_264A22BB0;
      id v41 = v7;
      id v68 = v41;
      v69 = v36;
      id v42 = v40;
      id v70 = v42;
      [(HMDPersistAuditAccessoryResultOperation *)v19 hmf_enumerateWithAutoreleasePoolUsingBlock:v67];
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __64__HMDAuditAccessoryPairingOperation_auditPairings_forAccessory___block_invoke_24;
      v62[3] = &unk_264A22BD8;
      id v43 = v41;
      id v63 = v43;
      id v64 = v16;
      v65 = v36;
      __int16 v21 = (HMDPersistAuditAccessoryResultOperation *)v42;
      v66 = v21;
      [(HMDPersistAuditAccessoryResultOperation *)v17 hmf_enumerateWithAutoreleasePoolUsingBlock:v62];
      v44 = [HMDPersistAuditAccessoryResultOperation alloc];
      v45 = [(HMDAccessoryBackgroundOperation *)v44 initWithAccessory:v43 userData:MEMORY[0x263EFFA78]];
      if (v45)
      {
        [(HMDPersistAuditAccessoryResultOperation *)v21 addObject:v45];
        v46 = (void *)[(HMDPersistAuditAccessoryResultOperation *)v21 copy];
        [(HMDAuditAccessoryPairingOperation *)v36 scheduleAuditOperations:v46];
      }
      else
      {
        v52 = (void *)MEMORY[0x230FBD990]();
        v53 = v36;
        v54 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v55 = v58 = v52;
          v56 = [v43 shortDescription];
          *(_DWORD *)buf = 138543618;
          v76 = v55;
          __int16 v77 = 2112;
          v78 = v56;
          _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audit pairing operation for accessory: %@", buf, 0x16u);

          v52 = v58;
        }
      }

      id v22 = v60;
      goto LABEL_26;
    }
    id v20 = [HMDPersistAuditAccessoryResultOperation alloc];
    __int16 v21 = [(HMDAccessoryBackgroundOperation *)v20 initWithAccessory:v7 userData:MEMORY[0x263EFFA78]];
    if (v21)
    {
      id v22 = v60;
      __int16 v23 = (void *)MEMORY[0x230FBD990]([v60 addOperation:v21]);
      v24 = v10;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v76 = v26;
        __int16 v77 = 2112;
        v78 = v21;
        v27 = "%{public}@Added audit finished operation for accessory : %@";
        id v28 = v25;
        os_log_type_t v29 = OS_LOG_TYPE_INFO;
LABEL_24:
        _os_log_impl(&dword_22F52A000, v28, v29, v27, buf, 0x16u);
      }
    }
    else
    {
      __int16 v23 = (void *)MEMORY[0x230FBD990]();
      v57 = v10;
      uint64_t v25 = HMFGetOSLogHandle();
      id v22 = v60;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v76 = v26;
        __int16 v77 = 2112;
        v78 = 0;
        v27 = "%{public}@Cannot create audit finished operation for accessory : %@";
        id v28 = v25;
        os_log_type_t v29 = OS_LOG_TYPE_ERROR;
        goto LABEL_24;
      }
    }

LABEL_26:

    int v6 = v61;
    goto LABEL_27;
  }
  v47 = (void *)MEMORY[0x230FBD990]();
  v48 = v10;
  v49 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    v50 = HMFGetLogIdentifier();
    v51 = [v7 shortDescription];
    *(_DWORD *)buf = 138543618;
    v76 = v50;
    __int16 v77 = 2112;
    v78 = v51;
    _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_INFO, "%{public}@Cannot process audit HAP pairings operation as home is nil : %@", buf, 0x16u);
  }
LABEL_27:
}

void __64__HMDAuditAccessoryPairingOperation_auditPairings_forAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "userWithPairingIdentity:");
  if (v3)
  {
    id v4 = *(void **)(a1 + 48);
    id v5 = v3;
  }
  else
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = v6;
  }
  [v4 addObject:v5];
}

void __64__HMDAuditAccessoryPairingOperation_auditPairings_forAccessory___block_invoke_20(id *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([v3 isPending] & 1) != 0
    || (id v4 = [HMDAddAccessoryPairingSharedUserOperation alloc],
        id v5 = a1[4],
        [v3 pairingIdentity],
        id v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = -[HMDAddAccessoryPairingSharedUserOperation initWithAccessory:forSharedUser:sharedUserPairingIdentity:asOwner:asSharedAdmin:](v4, "initWithAccessory:forSharedUser:sharedUserPairingIdentity:asOwner:asSharedAdmin:", v5, v3, v6, [v3 isOwner], objc_msgSend(v3, "isAdministrator")), v6, !v7))
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = a1[5];
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = HMFGetLogIdentifier();
      int v12 = [v3 shortDescription];
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "privilege"));
      __int16 v14 = [v3 pairingIdentity];
      id v15 = [a1[4] shortDescription];
      int v16 = 138544386;
      int v17 = v11;
      __int16 v18 = 2112;
      __int16 v19 = v12;
      __int16 v20 = 2112;
      __int16 v21 = v13;
      __int16 v22 = 2112;
      __int16 v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create add pairing operation for pairing identity : %@ (Pv: %@)/%@ of accessory: %@", (uint8_t *)&v16, 0x34u);
    }
  }
  else
  {
    [a1[6] addObject:v7];
  }
}

void __64__HMDAuditAccessoryPairingOperation_auditPairings_forAccessory___block_invoke_24(id *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [HMDRemoveAccessoryPairingSharedUserOperation alloc];
  id v5 = [a1[4] uuid];
  id v6 = [a1[4] identifier];
  id v7 = [a1[5] uuid];
  id v8 = [(HMDRemoveAccessoryPairingSharedUserOperation *)v4 initWithAccessoryUUID:v5 accessoryIdentifier:v6 isOwnerIdentity:0 forSharedUser:0 sharedUserPairingIdentity:v3 homeUUIDWhereAccessoryWasPaired:v7];

  if (v8)
  {
    [a1[7] addObject:v8];
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1[6];
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      uint64_t v13 = [a1[4] shortDescription];
      int v14 = 138543874;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v3;
      __int16 v18 = 2112;
      __int16 v19 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create remove pairing operation for pairing identity : %@ of accessory: %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (BOOL)mainWithError:(id *)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = [(HMDBackgroundOperation *)self homeManager];
  unint64_t v6 = [(HMDAccessoryBackgroundOperation *)self accessoryOperationStatus];
  id v7 = objc_opt_class();
  id v8 = [(HMDAccessoryBackgroundOperation *)self accessoryUUID];
  id v9 = [v7 findAccessoryUsing:v8 homeManager:v5];

  id v10 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v11 = v10;
  }
  else {
    __int16 v11 = 0;
  }
  unint64_t v12 = v11;

  id v13 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v14 = v13;
  }
  else {
    int v14 = 0;
  }
  unint64_t v15 = v14;

  if (v12 | v15) {
    BOOL v16 = v6 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  char v17 = v16;
  if (v16)
  {
    __int16 v18 = (void *)MEMORY[0x230FBD990]();
    __int16 v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      __int16 v21 = v29 = v17;
      __int16 v22 = [(HMDAccessoryBackgroundOperation *)v19 accessoryUUID];
      [(HMDAccessoryBackgroundOperation *)v19 accessoryIdentifier];
      v23 = id v30 = a3;
      [(HMDAccessoryBackgroundOperation *)v19 homeUUID];
      v24 = id v28 = v18;
      *(_DWORD *)buf = 138544130;
      uint64_t v32 = v21;
      __int16 v33 = 2112;
      v34 = v22;
      __int16 v35 = 2112;
      id v36 = v23;
      __int16 v37 = 2112;
      v38 = v24;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to run audit operation on accessory : %@/%@, for Home: %@", buf, 0x2Au);

      __int16 v18 = v28;
      a3 = v30;

      char v17 = v29;
    }

    if (a3)
    {
      *a3 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    }
  }
  else if (v6 != 1)
  {
    if (v12)
    {
      uint64_t v25 = [(HMDAuditAccessoryPairingOperation *)self getPairingsFromAccessory:v12];
    }
    else
    {
      if (!v15)
      {
        uint64_t v26 = 0;
        goto LABEL_25;
      }
      uint64_t v25 = [(HMDAuditAccessoryPairingOperation *)self getPairingsFromAirPlayAccessory:v15];
    }
    uint64_t v26 = (void *)v25;
LABEL_25:
    [(HMDAuditAccessoryPairingOperation *)self auditPairings:v26 forAccessory:v13];
  }
  return v17 ^ 1;
}

- (HMDAuditAccessoryPairingOperation)initWithAccessoryUUID:(id)a3 accessoryIdentifier:(id)a4 homeUUIDWhereAccessoryWasPaired:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  if (!v9) {
    goto LABEL_10;
  }
  __int16 v11 = v10;
  if (v10)
  {
    v18.receiver = self;
    v18.super_class = (Class)HMDAuditAccessoryPairingOperation;
    unint64_t v12 = [(HMDAccessoryBackgroundOperation *)&v18 initWithAccessoryUUID:v8 accessoryIdentifier:v9 homeUUIDWhereAccessoryWasPaired:v10 userData:MEMORY[0x263EFFA78]];
    id v13 = v12;
  }
  else
  {
    int v14 = (void *)MEMORY[0x230FBD990]();
    unint64_t v12 = self;
    unint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not associated with a home, cannot create audit accessory pairing operation for %@/%@", buf, 0x20u);
    }
    id v13 = 0;
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_162596 != -1) {
    dispatch_once(&logCategory__hmf_once_t24_162596, &__block_literal_global_35_162597);
  }
  id v2 = (void *)logCategory__hmf_once_v25_162598;
  return v2;
}

void __48__HMDAuditAccessoryPairingOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v25_162598;
  logCategory__hmf_once_v25_162598 = v0;
}

@end