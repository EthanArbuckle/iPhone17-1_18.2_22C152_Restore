@interface HMDAuditProhibitedAccessoryForRestrictedGuestOperation
+ (id)awaitForAllSettledFutures:(id)a3;
+ (id)getPairingsFromAccessory:(id)a3 flow:(id)a4;
+ (id)logCategory;
- (BOOL)_anyModificationsFailedExcludingDoesNotExistError:(id)a3 responseError:(id *)a4;
- (BOOL)mainWithError:(id *)a3;
- (HMDAuditProhibitedAccessoryForRestrictedGuestOperation)initWithAccessory:(id)a3 restrictedGuest:(id)a4;
- (NSUUID)guestUUID;
- (id)_auditHAPAccessory:(id)a3 forRestrictedGuest:(id)a4 inHome:(id)a5 flow:(id)a6;
- (id)executeOperationWithHomeManager:(id)a3 flow:(id)a4;
- (id)logIdentifier;
@end

@implementation HMDAuditProhibitedAccessoryForRestrictedGuestOperation

- (id)logIdentifier
{
  v2 = [(HMDBackgroundOperation *)self operationUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (BOOL)_anyModificationsFailedExcludingDoesNotExistError:(id)a3 responseError:(id *)a4
{
  id v5 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__148976;
  v13 = __Block_byref_object_dispose__148977;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __122__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__anyModificationsFailedExcludingDoesNotExistError_responseError___block_invoke;
  v8[3] = &unk_264A21B68;
  v8[4] = &v9;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);
  v6 = (void *)v10[5];
  if (v6) {
    *a4 = v6;
  }
  _Block_object_dispose(&v9, 8);

  return v6 != 0;
}

void __122__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__anyModificationsFailedExcludingDoesNotExistError_responseError___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  uint64_t v6 = [v15 error];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [v15 error];
    uint64_t v9 = [v8 domain];
    if ([v9 isEqualToString:*MEMORY[0x263F0C710]])
    {
      v10 = [v15 error];
      uint64_t v11 = [v10 code];

      if (v11 == 2606) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    uint64_t v12 = [v15 error];
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a4 = 1;
  }
LABEL_7:
}

- (id)_auditHAPAccessory:(id)a3 forRestrictedGuest:(id)a4 inHome:(id)a5 flow:(id)a6
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    v18 = [v13 UUID];
    [v11 shortDescription];
    v65 = v15;
    id v19 = v13;
    id v20 = v11;
    v22 = id v21 = v12;
    v23 = [v10 shortDescription];
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v17;
    __int16 v75 = 2112;
    v76 = v18;
    __int16 v77 = 2112;
    v78 = v22;
    __int16 v79 = 2112;
    v80 = v23;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Attempting to remove restricted guest [%@] from the HAP accessory [%@]", buf, 0x2Au);

    id v12 = v21;
    id v11 = v20;
    id v13 = v19;
    id v15 = v65;
  }
  v24 = [MEMORY[0x263EFF980] array];
  if (![v10 supportsAccessCode]) {
    goto LABEL_9;
  }
  v25 = [v11 accessCode];

  if (!v25) {
    goto LABEL_9;
  }
  v26 = (void *)MEMORY[0x230FBD990]();
  v27 = v15;
  v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = HMFGetLogIdentifier();
    [v13 UUID];
    v66 = v15;
    id v30 = v10;
    id v31 = v13;
    id v32 = v11;
    v34 = id v33 = v12;
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v29;
    __int16 v75 = 2112;
    v76 = v34;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Starting audit access code removal", buf, 0x16u);

    id v12 = v33;
    id v11 = v32;
    id v13 = v31;
    id v10 = v30;
    id v15 = v66;
  }
  uint64_t v35 = [v12 accessCodeManager];
  if (v35)
  {
    v36 = (void *)v35;
    v67 = [v11 accessCode];
    v37 = [v36 removeAccessCode:v67 fromHAPAccessory:v10];
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __108__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke;
    v72[3] = &unk_264A29158;
    v72[4] = v27;
    id v73 = v13;
    v38 = [v37 flatMap:v72];
    [v38 hmfFuture];
    v39 = v15;
    id v40 = v10;
    id v41 = v13;
    id v42 = v11;
    v44 = id v43 = v12;
    [v24 addObject:v44];

    id v12 = v43;
    id v11 = v42;
    id v13 = v41;
    id v10 = v40;
    id v15 = v39;

LABEL_9:
    if ([v10 supportsWalletKey])
    {
      v45 = (void *)MEMORY[0x230FBD990]();
      v46 = v15;
      v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v48 = HMFGetLogIdentifier();
        [v13 UUID];
        id v49 = v10;
        id v50 = v13;
        id v51 = v11;
        v53 = id v52 = v12;
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v48;
        __int16 v75 = 2112;
        v76 = v53;
        _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Starting audit removal of pairing key", buf, 0x16u);

        id v12 = v52;
        id v11 = v51;
        id v13 = v50;
        id v10 = v49;
      }
      *(void *)buf = 0;
      v54 = [MEMORY[0x263F42538] futureWithPromise:buf];
      [v24 addObject:v54];

      v55 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __108__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_43;
      block[3] = &unk_264A2E610;
      block[4] = v46;
      id v69 = v10;
      id v70 = v13;
      id v71 = *(id *)buf;
      dispatch_async(v55, block);
    }
    v56 = [(id)objc_opt_class() awaitForAllSettledFutures:v24];
    goto LABEL_14;
  }
  v58 = (void *)MEMORY[0x230FBD990]();
  v59 = v27;
  v60 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
  {
    v61 = HMFGetLogIdentifier();
    v62 = [v13 UUID];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v61;
    __int16 v75 = 2112;
    v76 = v62;
    _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Cannot attempt to remove access code because accessCodeManager is nil", buf, 0x16u);
  }
  v63 = (void *)MEMORY[0x263F42538];
  v64 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
  v56 = [v63 futureWithError:v64];

LABEL_14:
  return v56;
}

id __108__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v18 = 0;
  int v5 = [v4 _anyModificationsFailedExcludingDoesNotExistError:v3 responseError:&v18];
  id v6 = v18;
  v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543874;
      id v20 = v11;
      __int16 v21 = 2112;
      v22 = v12;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] At least one modification response had an error [%@] that isn't HMErrorCodePrivateAccessCodeIdentifierDoesNotExist, so operation did not succeed.", buf, 0x20u);
    }
    uint64_t v13 = [MEMORY[0x263F58190] futureWithError:v6];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      id v20 = v14;
      __int16 v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Access code has been removed on accessory", buf, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  v16 = (void *)v13;

  return v16;
}

void __108__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_43(id *a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v2 = [(id)objc_opt_class() getPairingsFromAccessory:a1[5] flow:a1[6]];
  id v3 = v2;
  if (!v2)
  {
    id v24 = a1[7];
    id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
    [v24 rejectWithError:v13];
LABEL_13:

    goto LABEL_17;
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __108__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_2;
  v30[3] = &unk_264A2BB18;
  v30[4] = a1[4];
  char v4 = objc_msgSend(v2, "na_any:", v30);
  int v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = a1[4];
  v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v8)
    {
      uint64_t v9 = HMFGetLogIdentifier();
      id v10 = [a1[6] UUID];
      id v11 = a1[5];
      *(_DWORD *)buf = 138543874;
      id v32 = v9;
      __int16 v33 = 2112;
      v34 = v10;
      __int16 v35 = 2112;
      id v36 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Attempting to remove restricted guest pairing from the HAP accessory : %@", buf, 0x20u);
    }
    v28.receiver = a1[4];
    v28.super_class = (Class)HMDAuditProhibitedAccessoryForRestrictedGuestOperation;
    id v29 = 0;
    unsigned __int8 v12 = objc_msgSendSuper2(&v28, sel_mainWithError_, &v29);
    id v13 = v29;
    if ((v12 & 1) == 0)
    {
      id v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = a1[4];
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        id v18 = [a1[6] UUID];
        *(_DWORD *)buf = 138543874;
        id v32 = v17;
        __int16 v33 = 2112;
        v34 = v18;
        __int16 v35 = 2112;
        id v36 = v13;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove pairing with error: %@", buf, 0x20u);
      }
      [a1[7] rejectWithError:v13];
    }
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = a1[4];
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      __int16 v23 = [a1[6] UUID];
      *(_DWORD *)buf = 138543618;
      id v32 = v22;
      __int16 v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully removed pairing", buf, 0x16u);
    }
    [a1[7] fulfillWithNoValue];
    goto LABEL_13;
  }
  if (v8)
  {
    uint64_t v25 = HMFGetLogIdentifier();
    v26 = [a1[6] UUID];
    v27 = [a1[5] shortDescription];
    *(_DWORD *)buf = 138543874;
    id v32 = v25;
    __int16 v33 = 2112;
    v34 = v26;
    __int16 v35 = 2112;
    id v36 = v27;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Restricted guest's pairing is not on the Accessory: %@, nothing to remove.", buf, 0x20u);
  }
  [a1[7] fulfillWithNoValue];
LABEL_17:
}

uint64_t __108__HMDAuditProhibitedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  char v4 = [*(id *)(a1 + 32) pairingIdentifierToRemove];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)executeOperationWithHomeManager:(id)a3 flow:(id)a4
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(HMDBackgroundOperation *)self setHomeManager:v6];
  BOOL v8 = objc_opt_new();
  uint64_t v9 = [(HMDBackgroundOperation *)self userData];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"sharedUserUUIDKey"];

  v106 = (void *)v10;
  id v11 = [(id)objc_opt_class() findUserWithUUID:v10 fromHomeManager:v6];
  unsigned __int8 v12 = objc_opt_class();
  id v13 = [(HMDAccessoryBackgroundOperation *)self accessoryUUID];
  id v14 = [v12 findAccessoryUsing:v13 homeManager:v6];

  id v15 = v14;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  unint64_t v18 = [(HMDAccessoryBackgroundOperation *)self accessoryOperationStatus];
  if (v17) {
    BOOL v19 = v11 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19 || v18 == 0)
  {
    __int16 v21 = (void *)MEMORY[0x230FBD990](v18);
    v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      [v7 UUID];
      uint64_t v25 = v94 = v7;
      [(HMDAccessoryBackgroundOperation *)v22 accessoryUUID];
      id v99 = v17;
      id v26 = v15;
      id v27 = v6;
      objc_super v28 = v8;
      id v30 = v29 = v11;
      *(_DWORD *)buf = 138543874;
      v116 = v24;
      __int16 v117 = 2112;
      v118 = v25;
      __int16 v119 = 2112;
      id v120 = v30;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Required parameters does not exist to properly execute this operation : [%@]", buf, 0x20u);

      id v11 = v29;
      BOOL v8 = v28;
      id v6 = v27;
      id v15 = v26;
      id v17 = v99;

      id v7 = v94;
    }

    id v31 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v8 setError:v31];

    [v8 setShouldReschedule:1];
    goto LABEL_32;
  }
  if (v18 == 1)
  {
    id v32 = (void *)MEMORY[0x230FBD990]();
    __int16 v33 = self;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v35 = HMFGetLogIdentifier();
      [v15 shortDescription];
      id v36 = v95 = v7;
      [v11 shortDescription];
      id v100 = v17;
      id v37 = v15;
      id v38 = v6;
      v39 = v8;
      v41 = id v40 = v11;
      *(_DWORD *)buf = 138543874;
      v116 = v35;
      __int16 v117 = 2112;
      v118 = v36;
      __int16 v119 = 2112;
      id v120 = v41;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@For the accessory [%@] with user [%@], this operation can never successfully run in the future. Hence marking this operation as finished.", buf, 0x20u);

      id v11 = v40;
      BOOL v8 = v39;
      id v6 = v38;
      id v15 = v37;
      id v17 = v100;

      id v7 = v95;
    }

    id v42 = (void *)MEMORY[0x263F087E8];
    uint64_t v43 = 20;
LABEL_31:
    v74 = [v42 hmErrorWithCode:v43];
    [v8 setError:v74];

LABEL_32:
    v62 = [MEMORY[0x263F42538] futureWithValue:v8];
    goto LABEL_33;
  }
  if (([v17 supportsAnyInPersonAccess] & 1) == 0)
  {
    v64 = (void *)MEMORY[0x230FBD990]();
    v65 = self;
    v66 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      v67 = HMFGetLogIdentifier();
      [v7 UUID];
      v68 = id v97 = v7;
      [v15 shortDescription];
      id v103 = v17;
      id v69 = v15;
      id v70 = v6;
      id v71 = v8;
      id v73 = v72 = v11;
      *(_DWORD *)buf = 138543874;
      v116 = v67;
      __int16 v117 = 2112;
      v118 = v68;
      __int16 v119 = 2112;
      id v120 = v73;
      _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory [%@] does not support features that enforce access directly. Hence marking this operation as finished.", buf, 0x20u);

      id v11 = v72;
      BOOL v8 = v71;
      id v6 = v70;
      id v15 = v69;
      id v17 = v103;

      id v7 = v97;
    }

    id v42 = (void *)MEMORY[0x263F087E8];
    uint64_t v43 = 48;
    goto LABEL_31;
  }
  v93 = [v17 home];
  if (v93)
  {
    char v44 = [v11 isRestrictedGuest];
    v45 = (void *)MEMORY[0x230FBD990]();
    v46 = self;
    v47 = HMFGetOSLogHandle();
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_INFO);
    if (v44)
    {
      if (v48)
      {
        id v49 = HMFGetLogIdentifier();
        [v7 UUID];
        id v50 = v92 = v45;
        [v17 shortDescription];
        id v51 = v96 = v7;
        [v11 shortDescription];
        id v101 = v17;
        v53 = id v52 = v11;
        *(_DWORD *)buf = 138544130;
        v116 = v49;
        __int16 v117 = 2112;
        v118 = v50;
        __int16 v119 = 2112;
        id v120 = v51;
        __int16 v121 = 2112;
        v122 = v53;
        _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] All checks are completed, now attempting to audit prohibited accessory [%@] with restricted guest [%@]", buf, 0x2Au);

        id v11 = v52;
        id v17 = v101;

        id v7 = v96;
        v45 = v92;
      }
      if ([v17 supportsCHIP])
      {
        v54 = (void *)MEMORY[0x230FBD990]();
        v55 = v46;
        v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          v57 = HMFGetLogIdentifier();
          [v7 UUID];
          v102 = v11;
          v59 = id v58 = v7;
          *(_DWORD *)buf = 138543874;
          v116 = v57;
          __int16 v117 = 2112;
          v118 = v59;
          __int16 v119 = 2112;
          id v120 = v17;
          _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Going to remove restricted guest from the matter accessory : %@", buf, 0x20u);

          id v7 = v58;
          id v11 = v102;
        }
        v60 = v93;
        v61 = [v93 removeUser:v11 fromAccessory:v17];
        v109[0] = MEMORY[0x263EF8330];
        v109[1] = 3221225472;
        v109[2] = __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke_38;
        v109[3] = &unk_264A2C4A0;
        id v110 = v8;
        v107[0] = MEMORY[0x263EF8330];
        v107[1] = 3221225472;
        v107[2] = __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke_2_39;
        v107[3] = &unk_264A2C4C8;
        id v108 = v110;
        v62 = [v61 then:v109 orRecover:v107];

        id v63 = v110;
      }
      else
      {
        v60 = v93;
        v61 = [(HMDAuditProhibitedAccessoryForRestrictedGuestOperation *)v46 _auditHAPAccessory:v17 forRestrictedGuest:v11 inHome:v93 flow:v7];
        v113[0] = MEMORY[0x263EF8330];
        v113[1] = 3221225472;
        v113[2] = __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke;
        v113[3] = &unk_264A2C4A0;
        id v114 = v8;
        v111[0] = MEMORY[0x263EF8330];
        v111[1] = 3221225472;
        v111[2] = __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke_2;
        v111[3] = &unk_264A2C4C8;
        id v112 = v114;
        v62 = [v61 then:v113 orRecover:v111];

        id v63 = v114;
      }

      goto LABEL_45;
    }
    if (v48)
    {
      v87 = HMFGetLogIdentifier();
      [v7 UUID];
      id v105 = v17;
      v88 = v11;
      v90 = id v89 = v7;
      *(_DWORD *)buf = 138543874;
      v116 = v87;
      __int16 v117 = 2112;
      v118 = v90;
      __int16 v119 = 2112;
      id v120 = v88;
      _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Cannot proceed with removing the user as it is not restricted guest. : %@", buf, 0x20u);

      id v7 = v89;
      id v11 = v88;
      id v17 = v105;
    }
    v91 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v8 setError:v91];
  }
  else
  {
    v76 = (void *)MEMORY[0x230FBD990]();
    __int16 v77 = self;
    v78 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      __int16 v79 = HMFGetLogIdentifier();
      [v7 UUID];
      v80 = id v98 = v7;
      [v15 shortDescription];
      id v104 = v17;
      id v81 = v15;
      id v82 = v6;
      v83 = v8;
      v85 = v84 = v11;
      *(_DWORD *)buf = 138543874;
      v116 = v79;
      __int16 v117 = 2112;
      v118 = v80;
      __int16 v119 = 2112;
      id v120 = v85;
      _os_log_impl(&dword_22F52A000, v78, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Accessory [%@] does not have a home", buf, 0x20u);

      id v11 = v84;
      BOOL v8 = v83;
      id v6 = v82;
      id v15 = v81;
      id v17 = v104;

      id v7 = v98;
    }

    v86 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v8 setError:v86];

    [v8 setShouldReschedule:1];
  }
  v62 = [MEMORY[0x263F42538] futureWithValue:v8];
  v60 = v93;
LABEL_45:

LABEL_33:
  return v62;
}

uint64_t __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke_38(uint64_t a1)
{
  return 1;
}

uint64_t __95__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_executeOperationWithHomeManager_flow___block_invoke_2_39(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (NSUUID)guestUUID
{
  v2 = [(HMDBackgroundOperation *)self userData];
  id v3 = [v2 objectForKeyedSubscript:@"sharedUserUUIDKey"];

  if (v3)
  {
    return (NSUUID *)v3;
  }
  else
  {
    uint64_t v5 = (HMDAuditProhibitedAccessoryForRestrictedGuestOperation *)_HMFPreconditionFailure();
    return (NSUUID *)[(HMDAuditProhibitedAccessoryForRestrictedGuestOperation *)v5 mainWithError:v7];
  }
}

- (BOOL)mainWithError:(id *)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  char v4 = [MEMORY[0x263F42530] internalOnlyInitializer];
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  SEL v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 UUID];
    uint64_t v10 = [(HMDAccessoryBackgroundOperation *)v6 accessoryUUID];
    id v11 = [(HMDBackgroundOperation *)v6 userData];
    unsigned __int8 v12 = [v11 objectForKeyedSubscript:@"sharedUserUUIDKey"];
    *(_DWORD *)buf = 138544130;
    v55 = v8;
    __int16 v56 = 2112;
    v57 = v9;
    __int16 v58 = 2112;
    id v59 = v10;
    __int16 v60 = 2112;
    v61 = v12;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Performing audit for prohibited accessory [%@] for restricted guest [%@]", buf, 0x2Au);
  }
  id v13 = objc_alloc(MEMORY[0x263F42520]);
  id v14 = dispatch_get_global_queue(21, 0);
  id v15 = (void *)[v13 initWithQueue:v14];

  v16 = (void *)MEMORY[0x263F42538];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __72__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_mainWithError___block_invoke;
  v52[3] = &unk_264A2EC78;
  v52[4] = v6;
  id v17 = v4;
  id v53 = v17;
  unint64_t v18 = [v16 inContext:v15 perform:v52];
  id v50 = 0;
  id v51 = 0;
  char v19 = [v18 waitForResult:&v51 orError:&v50 withTimeout:1.2e11];
  id v20 = (void *)MEMORY[0x230FBD990]();
  __int16 v21 = v6;
  v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    BOOL v48 = v18;
    v24 = __int16 v23 = v15;
    uint64_t v25 = [v17 UUID];
    id v26 = [(HMDAccessoryBackgroundOperation *)v21 accessoryUUID];
    id v27 = HMFBooleanToString();
    *(_DWORD *)buf = 138544386;
    v55 = v24;
    __int16 v56 = 2112;
    v57 = v25;
    __int16 v58 = 2112;
    id v59 = v26;
    __int16 v60 = 2112;
    v61 = v27;
    __int16 v62 = 2112;
    id v63 = v50;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Finished removing the restricted guest from [%@] resulted in outcome: [%@] with error: [%@]", buf, 0x34u);

    id v15 = v23;
    unint64_t v18 = v48;
  }

  if ((v19 & 1) == 0)
  {
    __int16 v35 = (void *)MEMORY[0x230FBD990]();
    id v36 = v21;
    id v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      id v38 = HMFGetLogIdentifier();
      v39 = [v17 UUID];
      *(_DWORD *)buf = 138543618;
      v55 = v38;
      __int16 v56 = 2112;
      v57 = v39;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Operation timed out", buf, 0x16u);
    }
    __int16 v33 = a3;
    if (a3)
    {
      id v34 = [MEMORY[0x263F087E8] hmErrorWithCode:8];
      goto LABEL_15;
    }
LABEL_16:
    LOBYTE(v40) = 0;
    goto LABEL_24;
  }
  if (v50)
  {
    objc_super v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = v21;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      id v32 = [v17 UUID];
      *(_DWORD *)buf = 138543874;
      v55 = v31;
      __int16 v56 = 2112;
      v57 = v32;
      __int16 v58 = 2112;
      id v59 = v50;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Operation should not have resulted in a rejected promise. File a radar. Operation failed to succeed with error: %@", buf, 0x20u);
    }
    __int16 v33 = a3;
    if (a3)
    {
      id v34 = v50;
LABEL_15:
      LOBYTE(v40) = 0;
      *__int16 v33 = v34;
      goto LABEL_24;
    }
    goto LABEL_16;
  }
  id v41 = [v51 error];

  if (v41)
  {
    id v42 = (void *)MEMORY[0x230FBD990]();
    uint64_t v43 = v21;
    char v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = HMFGetLogIdentifier();
      v46 = [v17 UUID];
      *(_DWORD *)buf = 138543874;
      v55 = v45;
      __int16 v56 = 2112;
      v57 = v46;
      __int16 v58 = 2112;
      id v59 = v50;
      _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Operation failed to succeed with error: %@", buf, 0x20u);
    }
    if (a3) {
      *a3 = v50;
    }
    int v40 = [v51 shouldReschedule] ^ 1;
  }
  else
  {
    LOBYTE(v40) = 1;
  }
LABEL_24:

  return v40;
}

HMDAuditProhibitedAccessoryForRestrictedGuestOperation *__72__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_mainWithError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 homeManager];
  id v4 = [v2 executeOperationWithHomeManager:v3 flow:*(void *)(a1 + 40)];
  if (v4)
  {
    uint64_t v5 = v4;

    return (HMDAuditProhibitedAccessoryForRestrictedGuestOperation *)3;
  }
  else
  {
    id v7 = (HMDAuditProhibitedAccessoryForRestrictedGuestOperation *)_HMFPreconditionFailure();
    return [(HMDAuditProhibitedAccessoryForRestrictedGuestOperation *)v7 initWithAccessory:v9 restrictedGuest:v10];
  }
}

- (HMDAuditProhibitedAccessoryForRestrictedGuestOperation)initWithAccessory:(id)a3 restrictedGuest:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  SEL v8 = [v6 uuid];
  id v9 = [v6 identifier];
  id v10 = [v6 home];

  if (v10)
  {
    id v11 = [v6 home];
    unsigned __int8 v12 = [v11 uuid];
    id v13 = [v7 pairingIdentity];
    __int16 v23 = @"sharedUserUUIDKey";
    id v14 = [v7 uuid];
    id v24 = v14;
    id v15 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v22.receiver = self;
    v22.super_class = (Class)HMDAuditProhibitedAccessoryForRestrictedGuestOperation;
    v16 = [(HMDRemoveAccessoryPairingOperation *)&v22 initWithAccessory:v8 accessoryIdentifier:v9 homeUUIDWhereAccessoryWasPaired:v12 isOwnerIdentity:0 identityToRemove:v13 userData:v15];

    id v17 = v16;
  }
  else
  {
    unint64_t v18 = (void *)MEMORY[0x230FBD990]();
    v16 = self;
    char v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v26 = v20;
      __int16 v27 = 2112;
      objc_super v28 = v8;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not associated with a home, cannot create add accessory pairing operation for accessory: %@/%@", buf, 0x20u);
    }
    id v17 = 0;
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t32_149026 != -1) {
    dispatch_once(&logCategory__hmf_once_t32_149026, &__block_literal_global_59_149027);
  }
  v2 = (void *)logCategory__hmf_once_v33_149028;
  return v2;
}

void __69__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v33_149028;
  logCategory__hmf_once_v33_149028 = v0;
}

+ (id)awaitForAllSettledFutures:(id)a3
{
  id v3 = [MEMORY[0x263F42538] allSettled:a3];
  id v4 = [v3 then:&__block_literal_global_149033];

  return v4;
}

uint64_t __84__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_awaitForAllSettledFutures___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "na_firstObjectPassingTest:", &__block_literal_global_57_149035);
  id v3 = v2;
  if (v2)
  {
    v2;
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

uint64_t __84__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_awaitForAllSettledFutures___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)getPairingsFromAccessory:(id)a3 flow:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  SEL v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = a1;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    unsigned __int8 v12 = [v7 UUID];
    id v13 = [v6 shortDescription];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    __int16 v56 = v13;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Get pairings from accessory : %@", buf, 0x20u);
  }
  id v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v56 = __Block_byref_object_copy__148976;
  v57 = __Block_byref_object_dispose__148977;
  id v58 = [MEMORY[0x263EFF980] array];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __88__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_getPairingsFromAccessory_flow___block_invoke;
  v43[3] = &unk_264A21BB8;
  id v48 = v9;
  id v44 = v7;
  id v45 = v6;
  v46 = v14;
  v47 = buf;
  uint64_t v34 = MEMORY[0x263EF8330];
  uint64_t v35 = 3221225472;
  id v36 = __88__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_getPairingsFromAccessory_flow___block_invoke_52;
  id v37 = &unk_264A2AB08;
  id v42 = v9;
  id v15 = v44;
  id v38 = v15;
  id v16 = v45;
  id v39 = v16;
  id v41 = buf;
  id v17 = v46;
  int v40 = v17;
  [v16 performOperation:7 linkType:0 operationBlock:v43 errorBlock:&v34];
  dispatch_time_t v18 = dispatch_time(0, 120000000000);
  intptr_t v19 = dispatch_group_wait(v17, v18);
  if (v19)
  {
    uint64_t v25 = (void *)MEMORY[0x230FBD990](v19, v20, v21, v22, v23, v24);
    id v26 = v9;
    HMFGetOSLogHandle();
    __int16 v27 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v29 = objc_msgSend(v15, "UUID", v34, v35, v36, v37, v38, v39);
      id v30 = [v16 shortDescription];
      *(_DWORD *)id v49 = 138543874;
      id v50 = v28;
      __int16 v51 = 2112;
      id v52 = v29;
      __int16 v53 = 2112;
      v54 = v30;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Timed out while getting list of pairings from the accessory : %@", v49, 0x20u);
    }
    uint64_t v31 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = 0;
  }
  id v32 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v32;
}

void __88__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_getPairingsFromAccessory_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 server];
  if (v4)
  {
    uint64_t v5 = dispatch_get_global_queue(-32768, 0);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __88__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_getPairingsFromAccessory_flow___block_invoke_49;
    v15[3] = &unk_264A21B90;
    uint64_t v19 = *(void *)(a1 + 64);
    id v16 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    long long v14 = *(_OWORD *)(a1 + 48);
    id v6 = (id)v14;
    long long v18 = v14;
    [v4 listPairingsWithCompletionQueue:v5 completionHandler:v15];
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 64);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 32) UUID];
      unsigned __int8 v12 = [*(id *)(a1 + 40) shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      __int16 v24 = 2112;
      uint64_t v25 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Unable to list pairing as there is no accessory server for accessory : %@", buf, 0x20u);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v5 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
  }
}

void __88__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_getPairingsFromAccessory_flow___block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 64);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 32) UUID];
    id v9 = [*(id *)(a1 + 40) shortDescription];
    int v12 = 138543874;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Unable to list pairings for accessory : %@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __88__HMDAuditProhibitedAccessoryForRestrictedGuestOperation_getPairingsFromAccessory_flow___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 64);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    id v11 = [*(id *)(a1 + 32) UUID];
    int v12 = [*(id *)(a1 + 40) shortDescription];
    int v13 = 138544386;
    __int16 v14 = v10;
    __int16 v15 = 2112;
    __int16 v16 = v11;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] HAP list pairing operation finished with: %@ for accessory: %@, error: %@", (uint8_t *)&v13, 0x34u);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v5];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

@end