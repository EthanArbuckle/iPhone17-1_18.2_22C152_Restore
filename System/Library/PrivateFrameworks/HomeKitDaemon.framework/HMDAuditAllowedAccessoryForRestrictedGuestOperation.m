@interface HMDAuditAllowedAccessoryForRestrictedGuestOperation
+ (id)logCategory;
- (BOOL)_anyModificationsFailedExcludingAlreadyExistsError:(id)a3 responseError:(id *)a4;
- (BOOL)mainWithError:(id *)a3;
- (HMDAuditAllowedAccessoryForRestrictedGuestOperation)initWithAccessory:(id)a3 restrictedGuest:(id)a4;
- (NSUUID)guestUUID;
- (id)_auditHAPAccessory:(id)a3 forRestrictedGuest:(id)a4 inHome:(id)a5 flow:(id)a6;
- (id)_auditMatterAccessory:(id)a3 forRestrictedGuest:(id)a4 inHome:(id)a5 flow:(id)a6;
- (id)executeOperationWithHomeManager:(id)a3 flow:(id)a4;
- (id)loadConfiguredCredentialsOnMatterAccessory:(id)a3 forUser:(id)a4 inHome:(id)a5 flow:(id)a6;
- (id)logIdentifier;
@end

@implementation HMDAuditAllowedAccessoryForRestrictedGuestOperation

- (id)logIdentifier
{
  v2 = [(HMDBackgroundOperation *)self operationUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (BOOL)_anyModificationsFailedExcludingAlreadyExistsError:(id)a3 responseError:(id *)a4
{
  id v5 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__113539;
  v13 = __Block_byref_object_dispose__113540;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __120__HMDAuditAllowedAccessoryForRestrictedGuestOperation__anyModificationsFailedExcludingAlreadyExistsError_responseError___block_invoke;
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

void __120__HMDAuditAllowedAccessoryForRestrictedGuestOperation__anyModificationsFailedExcludingAlreadyExistsError_responseError___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  uint64_t v6 = [v15 error];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [v15 error];
    if ([v8 code] == 2602)
    {
      uint64_t v9 = [v15 error];
      v10 = [v9 domain];
      char v11 = [v10 isEqualToString:*MEMORY[0x263F0C710]];

      if (v11) {
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
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v74 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = HMFGetLogIdentifier();
    v17 = [v12 UUID];
    v18 = [v11 shortDescription];
    [v10 shortDescription];
    id v19 = v11;
    id v20 = v10;
    v22 = id v21 = v12;
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v16;
    __int16 v90 = 2112;
    v91 = v17;
    __int16 v92 = 2112;
    v93 = v18;
    __int16 v94 = 2112;
    v95 = v22;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Attempting to add restricted guest [%@] from the HAP accessory [%@]", buf, 0x2Au);

    id v12 = v21;
    id v10 = v20;
    id v11 = v19;
  }
  v23 = objc_opt_new();
  v24 = [v11 restrictedGuestAccessSettings];
  v25 = [v24 schedule];

  v26 = (void *)MEMORY[0x230FBD990]();
  v27 = v14;
  v28 = HMFGetOSLogHandle();
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
  if (v25)
  {
    if (v29)
    {
      v30 = HMFGetLogIdentifier();
      v31 = [v12 UUID];
      [v11 description];
      v72 = v23;
      v32 = v27;
      id v33 = v11;
      v35 = id v34 = v12;
      v36 = [v10 shortDescription];
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v30;
      __int16 v90 = 2112;
      v91 = v31;
      __int16 v92 = 2112;
      v93 = v35;
      __int16 v94 = 2112;
      v95 = v36;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Restricted Guest [%@] schedule is restricted so no credentials should be on the HAP accessory [%@]. Attempting to remove.", buf, 0x2Au);

      id v12 = v34;
      id v11 = v33;
      v27 = v32;
      v23 = v72;
    }
    [v23 setCredentialsRemoved:1];
    v37 = [[HMDAuditProhibitedAccessoryForRestrictedGuestOperation alloc] initWithAccessory:v10 restrictedGuest:v11];
    v38 = [v74 homeManager];
    id v39 = [(HMDAuditProhibitedAccessoryForRestrictedGuestOperation *)v37 executeOperationWithHomeManager:v38 flow:v12];
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_100;
    v75[3] = &unk_264A1EFA8;
    id v76 = v23;
    v40 = [v39 then:v75];
  }
  else
  {
    if (v29)
    {
      v41 = HMFGetLogIdentifier();
      v42 = [v12 UUID];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v41;
      __int16 v90 = 2112;
      v91 = v42;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Schedule is unrestricted, attempt to add credentials", buf, 0x16u);
    }
    v37 = [MEMORY[0x263EFF980] array];
    if ([v10 supportsAccessCode])
    {
      v43 = [v11 accessCode];

      if (v43)
      {
        v71 = v12;
        v73 = v23;
        v44 = (void *)MEMORY[0x230FBD990]();
        v45 = v27;
        v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          v47 = HMFGetLogIdentifier();
          v48 = [v71 UUID];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v47;
          __int16 v90 = 2112;
          v91 = v48;
          _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Adding access codes if not on the accessory already", buf, 0x16u);
        }
        v69 = [v74 accessCodeManager];
        id v49 = objc_alloc(MEMORY[0x263F0DEF8]);
        v70 = [v11 accessCode];
        v67 = (void *)[v49 initWithStringValue:v70];
        v50 = [v11 uuid];
        v68 = [v10 uuid];
        v88 = v68;
        v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v88 count:1];
        [v69 addNewAccessCode:v67 forUserWithUUID:v50 toAccessoriesWithUUIDs:v51 withRetries:1];
        v53 = v52 = v45;
        v54 = [v53 hmfFuture];
        v86[0] = MEMORY[0x263EF8330];
        v86[1] = 3221225472;
        v86[2] = __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke;
        v86[3] = &unk_264A1EF80;
        v86[4] = v52;
        id v87 = v71;
        v55 = [v54 then:v86];
        [(HMDAuditProhibitedAccessoryForRestrictedGuestOperation *)v37 addObject:v55];

        id v12 = v71;
        v23 = v73;
      }
    }
    if ([v10 supportsWalletKey])
    {
      v56 = (void *)MEMORY[0x230FBD990]();
      v57 = v27;
      v58 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        v59 = HMFGetLogIdentifier();
        [v12 UUID];
        id v60 = v11;
        id v61 = v10;
        v63 = id v62 = v12;
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v59;
        __int16 v90 = 2112;
        v91 = v63;
        _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Starting add pairing key audit", buf, 0x16u);

        id v12 = v62;
        id v10 = v61;
        id v11 = v60;
      }
      *(void *)buf = 0;
      v64 = [MEMORY[0x263F42538] futureWithPromise:buf];
      [(HMDAuditProhibitedAccessoryForRestrictedGuestOperation *)v37 addObject:v64];

      v65 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_92;
      block[3] = &unk_264A2E610;
      id v82 = v10;
      id v83 = v12;
      id v84 = *(id *)buf;
      v85 = v57;
      dispatch_async(v65, block);
    }
    v38 = +[HMDAuditProhibitedAccessoryForRestrictedGuestOperation awaitForAllSettledFutures:v37];
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_97;
    v79[3] = &unk_264A2C4A0;
    id v80 = v23;
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_2_99;
    v77[3] = &unk_264A2C4C8;
    id v78 = v80;
    v40 = [v38 then:v79 orRecover:v77];

    id v39 = v80;
  }

  return v40;
}

uint64_t __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v20 = 0;
  int v5 = [v4 _anyModificationsFailedExcludingAlreadyExistsError:v3 responseError:&v20];
  id v6 = v20;
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
      v22 = v11;
      __int16 v23 = 2112;
      v24 = v12;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] At least one modification response had an error [%@] that isn't HMErrorCodePrivateAccessCodeDuplicate, so operation did not succeed.", buf, 0x20u);
    }
    id v13 = v6;
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v18 = 2;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      v17 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      __int16 v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Access code has been added to the accessory", buf, 0x16u);
    }
    uint64_t v18 = 1;
  }

  return v18;
}

void __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_92(id *a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = +[HMDAuditProhibitedAccessoryForRestrictedGuestOperation getPairingsFromAccessory:a1[4] flow:a1[5]];
  id v3 = v2;
  if (!v2)
  {
    id v11 = a1[6];
    id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
    [v11 rejectWithError:v12];
LABEL_16:

    goto LABEL_17;
  }
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_2;
  v28[3] = &unk_264A2BB18;
  v28[4] = a1[7];
  int v4 = objc_msgSend(v2, "na_any:", v28);
  int v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = a1[7];
  v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (!v4)
  {
    if (v8)
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = a1[4];
      *(_DWORD *)buf = 138543618;
      v30 = v13;
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Going to add user pairing to the HAP accessory : %@", buf, 0x16u);
    }
    v26.receiver = a1[7];
    v26.super_class = (Class)HMDAuditAllowedAccessoryForRestrictedGuestOperation;
    id v27 = 0;
    unsigned __int8 v15 = objc_msgSendSuper2(&v26, sel_mainWithError_, &v27);
    id v12 = v27;
    if ((v15 & 1) == 0)
    {
      v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = a1[7];
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        id v20 = [a1[5] UUID];
        *(_DWORD *)buf = 138543874;
        v30 = v19;
        __int16 v31 = 2112;
        v32 = v20;
        __int16 v33 = 2112;
        id v34 = v12;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add pairing with error: %@", buf, 0x20u);
      }
      [a1[6] rejectWithError:v12];
    }
    id v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = a1[7];
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      __int16 v25 = [a1[5] UUID];
      *(_DWORD *)buf = 138543618;
      v30 = v24;
      __int16 v31 = 2112;
      v32 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added pairing", buf, 0x16u);
    }
    [a1[6] fulfillWithNoValue];
    goto LABEL_16;
  }
  if (v8)
  {
    uint64_t v9 = HMFGetLogIdentifier();
    id v10 = [a1[4] shortDescription];
    *(_DWORD *)buf = 138543618;
    v30 = v9;
    __int16 v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@User's pairing is already on the Accessory: %@, nothing to add.", buf, 0x16u);
  }
  [a1[6] fulfillWithNoValue];
LABEL_17:
}

uint64_t __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_97(uint64_t a1)
{
  return 1;
}

uint64_t __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_2_99(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setShouldReschedule:1];
  [*(id *)(a1 + 32) setError:v4];

  return 1;
}

uint64_t __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_100(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setShouldReschedule:", objc_msgSend(v3, "shouldReschedule"));
  id v4 = [v3 error];

  [*(id *)(a1 + 32) setError:v4];
  return 1;
}

uint64_t __105__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditHAPAccessory_forRestrictedGuest_inHome_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) userData];
  int v5 = [v4 objectForKeyedSubscript:@"newPairingIdentifier"];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

- (id)loadConfiguredCredentialsOnMatterAccessory:(id)a3 forUser:(id)a4 inHome:(id)a5 flow:(id)a6
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x230FBD990]();
  unsigned __int8 v15 = self;
  v16 = HMFGetOSLogHandle();
  v67 = v15;
  v69 = v10;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    uint64_t v18 = [v13 UUID];
    id v19 = [v10 shortDescription];
    [v11 shortDescription];
    v21 = id v20 = v11;
    [v12 name];
    id v22 = v13;
    v24 = id v23 = v12;
    *(_DWORD *)buf = 138544386;
    id v74 = v17;
    __int16 v75 = 2112;
    id v76 = v18;
    __int16 v77 = 2112;
    id v78 = v19;
    __int16 v79 = 2112;
    id v80 = v21;
    __int16 v81 = 2112;
    id v82 = v24;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] loadConfiguredCredentialsOnMatterAccessory with accessory: %@, forUser: %@, inHome: %@", buf, 0x34u);

    id v12 = v23;
    id v13 = v22;

    id v11 = v20;
    id v10 = v69;

    unsigned __int8 v15 = v67;
  }

  __int16 v25 = [v11 accessCode];
  objc_super v26 = [MEMORY[0x263EFF980] array];
  id v27 = [v10 supportsMatterAccessCode];

  if (v27 && v25)
  {
    v65 = v26;
    v28 = v11;
    BOOL v29 = (void *)MEMORY[0x230FBD990]();
    v30 = v15;
    __int16 v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = HMFGetLogIdentifier();
      [v13 UUID];
      __int16 v33 = v59 = v29;
      [v11 shortDescription];
      id v62 = v25;
      v35 = id v34 = v12;
      v36 = [v10 shortDescription];
      *(_DWORD *)buf = 138544130;
      id v74 = v32;
      __int16 v75 = 2112;
      id v76 = v33;
      __int16 v77 = 2112;
      id v78 = v35;
      __int16 v79 = 2112;
      id v80 = v36;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Attempting to add RG's [%@] access code to accessory [%@]", buf, 0x2Au);

      id v12 = v34;
      __int16 v25 = v62;

      BOOL v29 = v59;
    }
    id v61 = v12;

    v63 = [v12 accessCodeManager];
    v37 = (void *)[objc_alloc(MEMORY[0x263F0DEF8]) initWithStringValue:v25];
    id v60 = v28;
    v38 = [v28 uuid];
    id v39 = [v69 uuid];
    v72 = v39;
    v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v72 count:1];
    v41 = [v63 addNewAccessCode:v37 forUserWithUUID:v38 toAccessoriesWithUUIDs:v40 withRetries:1];
    [v41 hmfFuture];
    v43 = v42 = v25;
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __118__HMDAuditAllowedAccessoryForRestrictedGuestOperation_loadConfiguredCredentialsOnMatterAccessory_forUser_inHome_flow___block_invoke;
    v70[3] = &unk_264A1EF80;
    v70[4] = v30;
    id v71 = v13;
    v44 = [v43 then:v70];
    objc_super v26 = v65;
    [v65 addObject:v44];

    __int16 v25 = v42;
    id v12 = v61;

    id v10 = v69;
    id v11 = v60;

    unsigned __int8 v15 = v67;
  }
  if ([v10 supportsWalletKey])
  {
    v64 = v13;
    v45 = (void *)MEMORY[0x230FBD990]();
    v46 = v15;
    v47 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v48 = HMFGetLogIdentifier();
      [v64 UUID];
      id v49 = v68 = v45;
      v50 = [v11 shortDescription];
      [v10 shortDescription];
      v66 = v26;
      v52 = v51 = v25;
      *(_DWORD *)buf = 138544130;
      id v74 = v48;
      __int16 v75 = 2112;
      id v76 = v49;
      __int16 v77 = 2112;
      id v78 = v50;
      __int16 v79 = 2112;
      id v80 = v52;
      _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Attempting to add RG's [%@] issuer key to accessory [%@]", buf, 0x2Au);

      __int16 v25 = v51;
      objc_super v26 = v66;

      v45 = v68;
    }

    v53 = [v12 nfcReaderKeyManager];
    v54 = [v53 accessoryManager];
    id v13 = v64;
    v55 = [v54 addIssuerKeyForUser:v11 toMatterAccessory:v10 flow:v64];
    v56 = [v55 hmfFuture];
    [v26 addObject:v56];
  }
  v57 = +[HMDAuditProhibitedAccessoryForRestrictedGuestOperation awaitForAllSettledFutures:v26];

  return v57;
}

uint64_t __118__HMDAuditAllowedAccessoryForRestrictedGuestOperation_loadConfiguredCredentialsOnMatterAccessory_forUser_inHome_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v20 = 0;
  int v5 = [v4 _anyModificationsFailedExcludingAlreadyExistsError:v3 responseError:&v20];
  id v6 = v20;
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
      id v22 = v11;
      __int16 v23 = 2112;
      v24 = v12;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] At least one modification response had an error [%@] that isn't HMErrorCodePrivateAccessCodeDuplicate, so operation did not succeed.", buf, 0x20u);
    }
    id v13 = v6;
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v18 = 2;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      id v17 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      id v22 = v16;
      __int16 v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Access code has been added to the accessory", buf, 0x16u);
    }
    uint64_t v18 = 1;
  }

  return v18;
}

- (id)_auditMatterAccessory:(id)a3 forRestrictedGuest:(id)a4 inHome:(id)a5 flow:(id)a6
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v17 = v32 = v12;
    uint64_t v18 = [v13 UUID];
    id v19 = [v11 shortDescription];
    id v20 = [MEMORY[0x263F35860] shortDescription];
    *(_DWORD *)buf = 138544130;
    v45 = v17;
    __int16 v46 = 2112;
    v47 = v18;
    __int16 v48 = 2112;
    id v49 = v19;
    __int16 v50 = 2112;
    v51 = v20;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Attempting to add restricted guest [%@] to matter accessory [%@]", buf, 0x2Au);

    id v12 = v32;
  }

  id v21 = objc_opt_new();
  id v22 = [v10 waitForDoorLockClusterObjectWithFlow:v13];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke;
  v37[3] = &unk_264A1EF30;
  id v38 = v10;
  id v39 = v11;
  id v40 = v12;
  id v41 = v13;
  v42 = v15;
  id v23 = v21;
  id v43 = v23;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  id v27 = v13;
  v28 = [v22 then:v37];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke_83;
  v35[3] = &unk_264A1EF58;
  id v36 = v23;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke_2_85;
  v33[3] = &unk_264A2C4C8;
  id v34 = v36;
  id v29 = v36;
  v30 = [v28 then:v35 orRecover:v33];

  return v30;
}

uint64_t __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke(id *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = a1[4];
  int v5 = [a1[5] restrictedGuestAccessSettings];
  id v6 = [v5 schedule];
  LODWORD(v4) = [v4 supportsConfiguredSchedule:v6];

  if (!v4)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1[8];
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [a1[7] UUID];
      id v15 = a1[4];
      *(_DWORD *)buf = 138543874;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v14;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Attempting to remove user from the matter accessory : %@", buf, 0x20u);
    }
    [a1[9] setCredentialsRemoved:1];
    id v16 = [a1[6] removeUser:a1[5] fromAccessory:a1[4]];
    if (v16)
    {
      v7 = v16;

      goto LABEL_8;
    }
LABEL_9:
    _HMFPreconditionFailure();
  }
  v7 = [a1[6] findOrAddUser:a1[5] onAccessory:a1[4] flow:a1[7]];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke_2;
  v18[3] = &unk_264A1EF08;
  v18[4] = a1[8];
  id v19 = a1[4];
  id v20 = a1[5];
  id v21 = a1[6];
  id v22 = a1[7];
  id v8 = [v7 then:v18];
  if (!v8) {
    goto LABEL_9;
  }
  uint64_t v9 = v8;

LABEL_8:
  return 3;
}

uint64_t __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke_83(uint64_t a1)
{
  return 1;
}

uint64_t __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke_2_85(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __108__HMDAuditAllowedAccessoryForRestrictedGuestOperation__auditMatterAccessory_forRestrictedGuest_inHome_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) loadConfiguredCredentialsOnMatterAccessory:*(void *)(a1 + 40) forUser:*(void *)(a1 + 48) inHome:*(void *)(a1 + 56) flow:*(void *)(a1 + 64)];
  if (v4)
  {
    int v5 = v4;

    return 3;
  }
  else
  {
    v7 = (HMDAuditAllowedAccessoryForRestrictedGuestOperation *)_HMFPreconditionFailure();
    return (uint64_t)[(HMDAuditAllowedAccessoryForRestrictedGuestOperation *)v7 executeOperationWithHomeManager:v9 flow:v10];
  }
}

- (id)executeOperationWithHomeManager:(id)a3 flow:(id)a4
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(HMDBackgroundOperation *)self setHomeManager:v6];
  SEL v8 = objc_opt_new();
  id v9 = [(HMDBackgroundOperation *)self userData];
  id v10 = [v9 objectForKeyedSubscript:@"sharedUserUUIDKey"];

  uint64_t v11 = [(id)objc_opt_class() findUserWithUUID:v10 fromHomeManager:v6];
  id v12 = objc_opt_class();
  id v13 = [(HMDAccessoryBackgroundOperation *)self accessoryUUID];
  id v14 = [v12 findAccessoryUsing:v13 homeManager:v6];

  id v15 = v14;
  id v16 = (void *)v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v17 = v15;
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  unint64_t v19 = [(HMDAccessoryBackgroundOperation *)self accessoryOperationStatus];
  if (v18) {
    BOOL v20 = v11 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  BOOL v21 = v20 || v19 == 0;
  v102 = v18;
  if (v21)
  {
    id v22 = (void *)MEMORY[0x230FBD990](v19);
    id v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = HMFGetLogIdentifier();
      [v7 UUID];
      id v26 = v97 = v10;
      [(HMDAccessoryBackgroundOperation *)v23 accessoryUUID];
      contexta = v8;
      id v92 = v6;
      v28 = id v27 = v7;
      [(HMDAccessoryBackgroundOperation *)v23 accessoryIdentifier];
      id v29 = v15;
      __int16 v31 = v30 = v16;
      *(_DWORD *)buf = 138544130;
      v104 = v25;
      __int16 v105 = 2112;
      v106 = v26;
      __int16 v107 = 2112;
      v108 = v28;
      __int16 v109 = 2112;
      v110 = v31;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Required parameters does not exist to properly execute this operation : [%@/%@]", buf, 0x2Au);

      id v16 = v30;
      id v15 = v29;

      id v7 = v27;
      SEL v8 = contexta;
      id v6 = v92;

      id v10 = v97;
    }

    id v32 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v8 setError:v32];

    [v8 setShouldReschedule:1];
    goto LABEL_30;
  }
  if (v19 == 1)
  {
    __int16 v33 = (void *)MEMORY[0x230FBD990]();
    id v34 = self;
    uint64_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v36 = HMFGetLogIdentifier();
      [v7 UUID];
      v37 = v98 = v10;
      [v15 shortDescription];
      contextb = v8;
      id v93 = v6;
      id v39 = v38 = v7;
      [v16 shortDescription];
      id v40 = v15;
      v42 = id v41 = v16;
      *(_DWORD *)buf = 138544130;
      v104 = v36;
      __int16 v105 = 2112;
      v106 = v37;
      __int16 v107 = 2112;
      v108 = v39;
      __int16 v109 = 2112;
      v110 = v42;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] For the accessory [%@] with user [%@], this operation can never successfully run in the future. Hence marking this operation as finished.", buf, 0x2Au);

      id v16 = v41;
      id v15 = v40;

      id v7 = v38;
      SEL v8 = contextb;
      id v6 = v93;

      id v10 = v98;
    }

    id v43 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = 23;
LABEL_29:
    v68 = [v43 hmErrorWithCode:v44];
    [v8 setError:v68];

LABEL_30:
    v69 = [MEMORY[0x263F42538] futureWithValue:v8];
    v57 = v102;
    goto LABEL_31;
  }
  if (([v18 supportsAnyInPersonAccess] & 1) == 0)
  {
    v58 = (void *)MEMORY[0x230FBD990]();
    v59 = self;
    id v60 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      id v61 = HMFGetLogIdentifier();
      [v7 UUID];
      v95 = v16;
      id v62 = v100 = v10;
      [v15 shortDescription];
      id v63 = v15;
      id v64 = v6;
      v65 = v8;
      v67 = id v66 = v7;
      *(_DWORD *)buf = 138543874;
      v104 = v61;
      __int16 v105 = 2112;
      v106 = v62;
      __int16 v107 = 2112;
      v108 = v67;
      _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory [%@] does not support features that enforce access directly. Hence marking this operation as finished.", buf, 0x20u);

      id v7 = v66;
      SEL v8 = v65;
      id v6 = v64;
      id v15 = v63;

      id v16 = v95;
      id v10 = v100;
    }
    id v43 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = 48;
    goto LABEL_29;
  }
  v45 = [v18 home];
  if (v45)
  {
    char v46 = [v16 isRestrictedGuest];
    context = (void *)MEMORY[0x230FBD990]();
    v47 = self;
    __int16 v48 = HMFGetOSLogHandle();
    BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
    if (v46)
    {
      __int16 v94 = v16;
      if (v49)
      {
        __int16 v50 = HMFGetLogIdentifier();
        v51 = [v7 UUID];
        [v102 shortDescription];
        uint64_t v52 = v99 = v10;
        [v94 shortDescription];
        id v86 = v15;
        id v53 = v6;
        v54 = v8;
        v56 = id v55 = v7;
        *(_DWORD *)buf = 138544130;
        v104 = v50;
        __int16 v105 = 2112;
        v106 = v51;
        __int16 v107 = 2112;
        v108 = v52;
        __int16 v109 = 2112;
        v110 = v56;
        _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] All checks are completed, now attempting to audit allowed accessory [%@] with restricted guest [%@]", buf, 0x2Au);

        id v7 = v55;
        SEL v8 = v54;
        id v6 = v53;
        id v15 = v86;

        id v10 = v99;
      }

      v57 = v102;
      id v16 = v94;
      if ([v102 supportsCHIP]) {
        [(HMDAuditAllowedAccessoryForRestrictedGuestOperation *)v47 _auditMatterAccessory:v102 forRestrictedGuest:v94 inHome:v45 flow:v7];
      }
      else {
      v69 = [(HMDAuditAllowedAccessoryForRestrictedGuestOperation *)v47 _auditHAPAccessory:v102 forRestrictedGuest:v94 inHome:v45 flow:v7];
      }
      goto LABEL_43;
    }
    if (v49)
    {
      id v82 = HMFGetLogIdentifier();
      [v7 UUID];
      id v87 = v15;
      v84 = uint64_t v83 = v10;
      *(_DWORD *)buf = 138543874;
      v104 = v82;
      __int16 v105 = 2112;
      v106 = v84;
      __int16 v107 = 2112;
      v108 = v16;
      _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Cannot proceed with removing the user as it is not restricted guest. : %@", buf, 0x20u);

      id v10 = v83;
      id v15 = v87;
    }
    v85 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v8 setError:v85];
  }
  else
  {
    id v71 = (void *)MEMORY[0x230FBD990]();
    v72 = self;
    v73 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v74 = contextc = v71;
      [v7 UUID];
      uint64_t v96 = v16;
      __int16 v75 = v101 = v10;
      [v15 shortDescription];
      id v76 = v15;
      id v77 = v6;
      id v78 = v8;
      id v80 = v79 = v7;
      *(_DWORD *)buf = 138543874;
      v104 = v74;
      __int16 v105 = 2112;
      v106 = v75;
      __int16 v107 = 2112;
      v108 = v80;
      _os_log_impl(&dword_22F52A000, v73, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Accessory [%@] does not have a home", buf, 0x20u);

      id v7 = v79;
      SEL v8 = v78;
      id v6 = v77;
      id v15 = v76;

      id v16 = v96;
      id v10 = v101;

      id v71 = contextc;
    }

    __int16 v81 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v8 setError:v81];

    [v8 setShouldReschedule:1];
  }
  v69 = [MEMORY[0x263F42538] futureWithValue:v8];
  v57 = v102;
LABEL_43:

LABEL_31:
  return v69;
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
    int v5 = (HMDAuditAllowedAccessoryForRestrictedGuestOperation *)_HMFPreconditionFailure();
    return (NSUUID *)[(HMDAuditAllowedAccessoryForRestrictedGuestOperation *)v5 mainWithError:v7];
  }
}

- (BOOL)mainWithError:(id *)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F42530] internalOnlyInitializer];
  int v5 = (void *)MEMORY[0x230FBD990]();
  SEL v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    SEL v8 = HMFGetLogIdentifier();
    id v9 = [v4 UUID];
    id v10 = [(HMDAccessoryBackgroundOperation *)v6 accessoryUUID];
    uint64_t v11 = [(HMDBackgroundOperation *)v6 userData];
    id v12 = [v11 objectForKeyedSubscript:@"sharedUserUUIDKey"];
    *(_DWORD *)buf = 138544130;
    id v55 = v8;
    __int16 v56 = 2112;
    v57 = v9;
    __int16 v58 = 2112;
    id v59 = v10;
    __int16 v60 = 2112;
    id v61 = v12;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Performing audit for allowed accessory [%@] for restricted guest [%@]", buf, 0x2Au);
  }
  id v13 = objc_alloc(MEMORY[0x263F42520]);
  id v14 = dispatch_get_global_queue(21, 0);
  id v15 = (void *)[v13 initWithQueue:v14];

  id v16 = (void *)MEMORY[0x263F42538];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __69__HMDAuditAllowedAccessoryForRestrictedGuestOperation_mainWithError___block_invoke;
  v52[3] = &unk_264A2EC78;
  v52[4] = v6;
  id v17 = v4;
  id v53 = v17;
  id v18 = [v16 inContext:v15 perform:v52];
  id v50 = 0;
  id v51 = 0;
  char v19 = [v18 waitForResult:&v51 orError:&v50 withTimeout:1.2e11];
  BOOL v20 = (void *)MEMORY[0x230FBD990]();
  BOOL v21 = v6;
  id v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    __int16 v48 = v18;
    v24 = id v23 = v15;
    __int16 v25 = [v17 UUID];
    id v26 = [(HMDAccessoryBackgroundOperation *)v21 accessoryUUID];
    id v27 = HMFBooleanToString();
    *(_DWORD *)buf = 138544386;
    id v55 = v24;
    __int16 v56 = 2112;
    v57 = v25;
    __int16 v58 = 2112;
    id v59 = v26;
    __int16 v60 = 2112;
    id v61 = v27;
    __int16 v62 = 2112;
    id v63 = v50;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Finished adding the user from [%@] resulted in outcome: [%@] with error: [%@]", buf, 0x34u);

    id v15 = v23;
    id v18 = v48;
  }

  if ((v19 & 1) == 0)
  {
    uint64_t v35 = (void *)MEMORY[0x230FBD990]();
    id v36 = v21;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      id v38 = HMFGetLogIdentifier();
      id v39 = [v17 UUID];
      *(_DWORD *)buf = 138543618;
      id v55 = v38;
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
    id v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = v21;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = HMFGetLogIdentifier();
      id v32 = [v17 UUID];
      *(_DWORD *)buf = 138543874;
      id v55 = v31;
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
    v42 = (void *)MEMORY[0x230FBD990]();
    id v43 = v21;
    uint64_t v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = HMFGetLogIdentifier();
      char v46 = [v17 UUID];
      *(_DWORD *)buf = 138543874;
      id v55 = v45;
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

HMDAuditAllowedAccessoryForRestrictedGuestOperation *__69__HMDAuditAllowedAccessoryForRestrictedGuestOperation_mainWithError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 homeManager];
  id v4 = [v2 executeOperationWithHomeManager:v3 flow:*(void *)(a1 + 40)];
  if (v4)
  {
    int v5 = v4;

    return (HMDAuditAllowedAccessoryForRestrictedGuestOperation *)3;
  }
  else
  {
    id v7 = (HMDAuditAllowedAccessoryForRestrictedGuestOperation *)_HMFPreconditionFailure();
    return [(HMDAuditAllowedAccessoryForRestrictedGuestOperation *)v7 initWithAccessory:v9 restrictedGuest:v10];
  }
}

- (HMDAuditAllowedAccessoryForRestrictedGuestOperation)initWithAccessory:(id)a3 restrictedGuest:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  SEL v8 = [v6 uuid];
  id v9 = [v6 identifier];
  id v10 = [v6 home];

  if (v10)
  {
    uint64_t v11 = [v6 home];
    id v12 = [v7 pairingIdentity];
    id v13 = [v11 uuid];
    id v24 = @"sharedUserUUIDKey";
    id v14 = [v7 uuid];
    __int16 v25 = v14;
    id v15 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v23.receiver = self;
    v23.super_class = (Class)HMDAuditAllowedAccessoryForRestrictedGuestOperation;
    char v22 = 0;
    id v16 = [(HMDAddAccessoryPairingOperation *)&v23 initWithAccessoryUUID:v8 accessoryIdentifier:v9 newPairingIdentity:v12 homeUUIDWhereAccessoryWasPaired:v13 asOwner:0 asAdmin:0 shouldUpdateKeyChainEntry:v22 userData:v15];

    id v17 = v16;
  }
  else
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    char v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      BOOL v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v27 = v20;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 2112;
      __int16 v31 = v9;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not associated with a home, cannot create add accessory pairing operation for accessory: %@/%@", buf, 0x20u);
    }
    id v17 = 0;
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t34 != -1) {
    dispatch_once(&logCategory__hmf_once_t34, &__block_literal_global_113602);
  }
  v2 = (void *)logCategory__hmf_once_v35;
  return v2;
}

void __66__HMDAuditAllowedAccessoryForRestrictedGuestOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v35;
  logCategory__hmf_once_uint64_t v35 = v0;
}

@end