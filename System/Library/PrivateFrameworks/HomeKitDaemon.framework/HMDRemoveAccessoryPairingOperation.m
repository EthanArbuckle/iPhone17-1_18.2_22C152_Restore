@interface HMDRemoveAccessoryPairingOperation
+ (id)logCategory;
- (BOOL)mainWithError:(id *)a3;
- (HMDRemoveAccessoryPairingOperation)initWithAccessory:(id)a3 accessoryIdentifier:(id)a4 homeUUIDWhereAccessoryWasPaired:(id)a5 isOwnerIdentity:(BOOL)a6 identityToRemove:(id)a7 userData:(id)a8;
- (HMDRemoveAccessoryPairingOperation)initWithAccessory:(id)a3 isOwnerIdentity:(BOOL)a4 identityToRemove:(id)a5;
- (HMDRemoveAccessoryPairingOperation)initWithAccessory:(id)a3 isOwnerIdentity:(BOOL)a4 identityToRemove:(id)a5 userData:(id)a6;
- (NSString)pairingIdentifierToRemove;
- (id)logIdentifier;
@end

@implementation HMDRemoveAccessoryPairingOperation

- (id)logIdentifier
{
  v2 = [(HMDBackgroundOperation *)self operationUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (NSString)pairingIdentifierToRemove
{
  v2 = [(HMDBackgroundOperation *)self userData];
  v3 = [v2 objectForKeyedSubscript:@"PairingIdentifierToRemove"];

  if (v3)
  {
    return (NSString *)v3;
  }
  else
  {
    v5 = (HMDRemoveAccessoryPairingOperation *)_HMFPreconditionFailure();
    return (NSString *)[(HMDRemoveAccessoryPairingOperation *)v5 mainWithError:v7];
  }
}

- (BOOL)mainWithError:(id *)a3
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  v68 = [(HMDAccessoryBackgroundOperation *)self accessoryIdentifier];
  v4 = [(HMDBackgroundOperation *)self userData];
  v70 = [v4 objectForKeyedSubscript:@"PairingIdentifierToRemove"];

  v5 = [(HMDBackgroundOperation *)self userData];
  v69 = [v5 objectForKeyedSubscript:@"PairingPublicKeyToRemove"];

  SEL v6 = [(HMDBackgroundOperation *)self userData];
  v7 = objc_msgSend(v6, "hmf_numberForKey:", @"IsOwnerUser");
  uint64_t v8 = [v7 BOOLValue];

  unint64_t v9 = [(HMDAccessoryBackgroundOperation *)self accessoryOperationStatus];
  v10 = objc_opt_class();
  v11 = [(HMDAccessoryBackgroundOperation *)self accessoryUUID];
  v12 = [(HMDBackgroundOperation *)self homeManager];
  v13 = [v10 findAccessoryUsing:v11 homeManager:v12];

  id v14 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  unint64_t v16 = v15;

  id v17 = v14;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  unint64_t v19 = v18;

  id v20 = v17;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  unint64_t v22 = v21;

  v66 = (void *)v19;
  if (v22 | v16 | v19 && v70 && v69 && v9)
  {
    if (v9 == 1)
    {
      v23 = (void *)MEMORY[0x230FBD990]();
      v24 = self;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = HMFGetLogIdentifier();
        v27 = [v20 shortDescription];
        v28 = [v20 home];
        v29 = [v28 uuid];
        *(_DWORD *)buf = 138543874;
        id v89 = v26;
        __int16 v90 = 2112;
        id v91 = v27;
        __int16 v92 = 2112;
        v93 = v29;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Since the accessory [%@] is already added back to this home [%@], there is no way this operation can successfully run in the future as the required parameters will never be true. Hence marking this operation as finished.", buf, 0x20u);
      }
      BOOL v30 = 1;
      goto LABEL_52;
    }
    id v87 = (id)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Remove accessory pairing operation"];
    v63 = dispatch_get_global_queue(-32768, 0);
    v36 = dispatch_group_create();
    dispatch_group_enter(v36);
    uint64_t v81 = 0;
    v82 = &v81;
    uint64_t v83 = 0x3032000000;
    v84 = __Block_byref_object_copy__273684;
    v85 = __Block_byref_object_dispose__273685;
    id v86 = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__HMDRemoveAccessoryPairingOperation_mainWithError___block_invoke;
    aBlock[3] = &unk_264A2F7A8;
    aBlock[4] = self;
    id v37 = v70;
    id v77 = v37;
    id v38 = v20;
    id v78 = v38;
    v80 = &v81;
    dispatch_group_t group = v36;
    dispatch_group_t v79 = group;
    v64 = _Block_copy(aBlock);
    if (v16)
    {
      v71[0] = MEMORY[0x263EF8330];
      v71[1] = 3221225472;
      v71[2] = __52__HMDRemoveAccessoryPairingOperation_mainWithError___block_invoke_41;
      v71[3] = &unk_264A2F7D0;
      id v72 = v37;
      id v73 = v69;
      id v74 = v63;
      id v75 = v64;
      [(id)v16 performOperation:6 linkType:0 operationBlock:v71 errorBlock:v75];

      v39 = v72;
    }
    else if (v19)
    {
      id v48 = objc_alloc(MEMORY[0x263F35A78]);
      v49 = (void *)[objc_alloc(MEMORY[0x263F425F0]) initWithPairingKeyData:v69];
      v39 = (void *)[v48 initWithIdentifier:v37 publicKey:v49 privateKey:0];

      if (!v39)
      {
        v52 = (void *)MEMORY[0x230FBD990]();
        v53 = self;
        HMFGetOSLogHandle();
        v54 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v55 = (id)objc_claimAutoreleasedReturnValue();
          v56 = [(HMDAccessoryBackgroundOperation *)v53 accessoryUUID];
          *(_DWORD *)buf = 138544386;
          id v89 = v55;
          __int16 v90 = 2112;
          id v91 = v37;
          __int16 v92 = 2112;
          v93 = v69;
          __int16 v94 = 2112;
          v95 = v56;
          __int16 v96 = 2112;
          v97 = v68;
          _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_INFO, "%{public}@Unable to create pairing identity from %@/%@ for operation : [%@/%@]", buf, 0x34u);
        }
        if (a3)
        {
          id v47 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
          goto LABEL_49;
        }
        goto LABEL_50;
      }
      [v66 removeUserPairingIdentity:v39 isOwner:v8 completionHandler:v64];
    }
    else
    {
      if (!v22)
      {
LABEL_25:
        dispatch_time_t v40 = dispatch_time(0, 120000000000);
        if (dispatch_group_wait(group, v40))
        {
          v41 = (void *)MEMORY[0x230FBD990]();
          id v42 = v37;
          v43 = self;
          HMFGetOSLogHandle();
          v44 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            id v45 = (id)objc_claimAutoreleasedReturnValue();
            v46 = [v38 shortDescription];
            *(_DWORD *)buf = 138543874;
            id v89 = v45;
            __int16 v90 = 2112;
            id v91 = v42;
            __int16 v92 = 2112;
            v93 = v46;
            _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@Could not remove accessory pairing %@ from accessory %@ as the operation timed out", buf, 0x20u);
          }
          if (a3)
          {
            id v47 = [MEMORY[0x263F087E8] hmErrorWithCode:100];
LABEL_49:
            BOOL v30 = 0;
            *a3 = v47;
            goto LABEL_51;
          }
        }
        else
        {
          v50 = (void *)v82[5];
          if (!v50)
          {
            BOOL v30 = 1;
LABEL_51:

            _Block_object_dispose(&v81, 8);
            __HMFActivityScopeLeave();

            goto LABEL_52;
          }
          if (a3)
          {
            id v47 = v50;
            goto LABEL_49;
          }
        }
LABEL_50:
        BOOL v30 = 0;
        goto LABEL_51;
      }
      v51 = [(id)v22 accessoryServer];
      v39 = v51;
      if (!v51)
      {
        v57 = (void *)MEMORY[0x230FBD990]();
        v58 = self;
        HMFGetOSLogHandle();
        v59 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v60 = (id)objc_claimAutoreleasedReturnValue();
          v61 = [(HMDAccessoryBackgroundOperation *)v58 accessoryUUID];
          *(_DWORD *)buf = 138544386;
          id v89 = v60;
          __int16 v90 = 2112;
          id v91 = v37;
          __int16 v92 = 2112;
          v93 = v69;
          __int16 v94 = 2112;
          v95 = v61;
          __int16 v96 = 2112;
          v97 = v68;
          _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_ERROR, "%{public}@No accessory server from to remove %@/%@ for operation : [%@/%@]", buf, 0x34u);
        }
        if (a3)
        {
          id v47 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
          goto LABEL_49;
        }
        goto LABEL_50;
      }
      [v51 removePairingIdentifier:v37 pairingPublicKey:v69 completionQueue:v63 completionHandler:v64];
    }

    goto LABEL_25;
  }
  v31 = (void *)MEMORY[0x230FBD990]();
  v32 = self;
  v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = HMFGetLogIdentifier();
    v35 = [(HMDAccessoryBackgroundOperation *)v32 accessoryUUID];
    *(_DWORD *)buf = 138543874;
    id v89 = v34;
    __int16 v90 = 2112;
    id v91 = v35;
    __int16 v92 = 2112;
    v93 = v68;
    _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Required parameters does not exist to properly execute this operation : [%@/%@]", buf, 0x20u);
  }
  if (a3)
  {
    [MEMORY[0x263F087E8] hmErrorWithCode:20];
    BOOL v30 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v30 = 0;
  }
LABEL_52:

  return v30;
}

void __52__HMDRemoveAccessoryPairingOperation_mainWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  SEL v6 = HMFGetOSLogHandle();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      v10 = [*(id *)(a1 + 48) shortDescription];
      int v19 = 138544130;
      id v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      v24 = v10;
      __int16 v25 = 2112;
      id v26 = v3;
      v11 = "%{public}@Unable to remove pairing %@ from accessory %@ with error: %@";
      v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 42;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v12, v13, v11, (uint8_t *)&v19, v14);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v15 = *(void *)(a1 + 40);
    v10 = [*(id *)(a1 + 48) shortDescription];
    int v19 = 138543874;
    id v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v15;
    __int16 v23 = 2112;
    v24 = v10;
    v11 = "%{public}@Successfully removed pairing %@ from accessory %@";
    v12 = v7;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 32;
    goto LABEL_6;
  }

  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v3;
  id v18 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __52__HMDRemoveAccessoryPairingOperation_mainWithError___block_invoke_41(void *a1, void *a2)
{
  id v3 = [a2 server];
  [v3 removePairingIdentifier:a1[4] pairingPublicKey:a1[5] completionQueue:a1[6] completionHandler:a1[7]];
}

- (HMDRemoveAccessoryPairingOperation)initWithAccessory:(id)a3 accessoryIdentifier:(id)a4 homeUUIDWhereAccessoryWasPaired:(id)a5 isOwnerIdentity:(BOOL)a6 identityToRemove:(id)a7 userData:(id)a8
{
  BOOL v10 = a6;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v15)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v17)
  {
LABEL_13:
    _HMFPreconditionFailure();
LABEL_14:
    _HMFPreconditionFailure();
  }
  int v19 = v18;
  if (!v18) {
    goto LABEL_14;
  }
  if (v16)
  {
    id v20 = (void *)[v18 mutableCopy];
    __int16 v21 = [v17 identifier];
    [v20 setObject:v21 forKeyedSubscript:@"PairingIdentifierToRemove"];

    uint64_t v22 = [v17 publicKey];
    __int16 v23 = [v22 data];
    [v20 setObject:v23 forKeyedSubscript:@"PairingPublicKeyToRemove"];

    v24 = [NSNumber numberWithBool:v10];
    [v20 setObject:v24 forKeyedSubscript:@"IsOwnerUser"];

    v31.receiver = self;
    v31.super_class = (Class)HMDRemoveAccessoryPairingOperation;
    __int16 v25 = [(HMDAccessoryBackgroundOperation *)&v31 initWithAccessoryUUID:v14 accessoryIdentifier:v15 homeUUIDWhereAccessoryWasPaired:v16 userData:v20];

    id v26 = v25;
  }
  else
  {
    uint64_t v27 = (void *)MEMORY[0x230FBD990]();
    __int16 v25 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v29;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not associated with a home, cannot create remove accessory pairing operation", buf, 0xCu);
    }
    id v26 = 0;
  }

  return v26;
}

- (HMDRemoveAccessoryPairingOperation)initWithAccessory:(id)a3 isOwnerIdentity:(BOOL)a4 identityToRemove:(id)a5 userData:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  if (!v11)
  {
LABEL_6:
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  os_log_type_t v13 = v12;
  if (v12)
  {
    id v14 = [v10 uuid];
    id v15 = [v10 identifier];
    id v16 = [v10 home];
    id v17 = [v16 uuid];
    id v18 = [(HMDRemoveAccessoryPairingOperation *)self initWithAccessory:v14 accessoryIdentifier:v15 homeUUIDWhereAccessoryWasPaired:v17 isOwnerIdentity:v8 identityToRemove:v11 userData:v13];

    return v18;
  }
LABEL_7:
  id v20 = (HMDRemoveAccessoryPairingOperation *)_HMFPreconditionFailure();
  return [(HMDRemoveAccessoryPairingOperation *)v20 initWithAccessory:v22 isOwnerIdentity:v23 identityToRemove:v24];
}

- (HMDRemoveAccessoryPairingOperation)initWithAccessory:(id)a3 isOwnerIdentity:(BOOL)a4 identityToRemove:(id)a5
{
  return [(HMDRemoveAccessoryPairingOperation *)self initWithAccessory:a3 isOwnerIdentity:a4 identityToRemove:a5 userData:MEMORY[0x263EFFA78]];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15_273725 != -1) {
    dispatch_once(&logCategory__hmf_once_t15_273725, &__block_literal_global_273726);
  }
  v2 = (void *)logCategory__hmf_once_v16_273727;
  return v2;
}

void __49__HMDRemoveAccessoryPairingOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v16_273727;
  logCategory__hmf_once_v16_273727 = v0;
}

@end