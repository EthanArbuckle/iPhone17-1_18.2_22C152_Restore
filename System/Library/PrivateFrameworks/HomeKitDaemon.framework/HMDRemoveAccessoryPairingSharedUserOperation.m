@interface HMDRemoveAccessoryPairingSharedUserOperation
+ (id)logCategory;
- (BOOL)mainWithError:(id *)a3;
- (HMDRemoveAccessoryPairingSharedUserOperation)initWithAccessory:(id)a3 isOwnerIdentity:(BOOL)a4 sharedUser:(id)a5;
- (HMDRemoveAccessoryPairingSharedUserOperation)initWithAccessoryUUID:(id)a3 accessoryIdentifier:(id)a4 isOwnerIdentity:(BOOL)a5 forSharedUser:(id)a6 sharedUserPairingIdentity:(id)a7 homeUUIDWhereAccessoryWasPaired:(id)a8;
- (id)logIdentifier;
@end

@implementation HMDRemoveAccessoryPairingSharedUserOperation

- (id)logIdentifier
{
  v2 = [(HMDBackgroundOperation *)self operationUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (BOOL)mainWithError:(id *)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)HMDRemoveAccessoryPairingSharedUserOperation;
  unsigned __int8 v5 = -[HMDRemoveAccessoryPairingOperation mainWithError:](&v33, sel_mainWithError_);
  v6 = [(HMDBackgroundOperation *)self userData];
  v7 = [v6 objectForKeyedSubscript:@"sharedUserUUIDKey"];

  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [(HMDAccessoryBackgroundOperation *)v9 accessoryUUID];
      v14 = [(HMDAccessoryBackgroundOperation *)v9 accessoryIdentifier];
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      v35 = v13;
      LOWORD(v36) = 2112;
      *(void *)((char *)&v36 + 2) = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully removed pairing for the shared user: %@ on the accessory : %@/%@", buf, 0x2Au);
    }
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v35 = __Block_byref_object_copy__254644;
    *(void *)&long long v36 = __Block_byref_object_dispose__254645;
    *((void *)&v36 + 1) = 0;
    v15 = +[HMDCoreData sharedInstance];
    v16 = [(HMDAccessoryBackgroundOperation *)v9 homeUUID];
    v17 = [v15 contextWithHomeUUID:v16];

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __62__HMDRemoveAccessoryPairingSharedUserOperation_mainWithError___block_invoke;
    v24[3] = &unk_264A2D248;
    v24[4] = v9;
    v27 = buf;
    id v25 = v7;
    v28 = &v29;
    id v18 = v17;
    id v26 = v18;
    [v18 unsafeSynchronousBlock:v24];
    if (a3) {
      *a3 = *(id *)(*(void *)&buf[8] + 40);
    }
    BOOL v19 = *((unsigned char *)v30 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      v21 = [(HMDAccessoryBackgroundOperation *)v9 accessoryUUID];
      v22 = [(HMDAccessoryBackgroundOperation *)v9 accessoryIdentifier];
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      v35 = v21;
      LOWORD(v36) = 2112;
      *(void *)((char *)&v36 + 2) = v22;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove pairing for shared user : %@ for accessory: %@/%@", buf, 0x2Au);
    }
    BOOL v19 = 0;
  }

  return v19;
}

void __62__HMDRemoveAccessoryPairingSharedUserOperation_mainWithError___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) accessoryUUID];
  v3 = +[HMCContext findAccessoryWithModelID:v2];

  uint64_t v4 = [v3 castIfHAPAccessory];
  uint64_t v5 = [v3 castIfAirPlayAccessory];
  BOOL v6 = v5 != 0;
  if (v4 | v5)
  {
    if (!*(void *)(a1 + 40)
      || (+[HMCContext findUserWithModelID:](HMCContext, "findUserWithModelID:"),
          (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v19 = [*(id *)(a1 + 32) pairingIdentifierToRemove];
      v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = *(id *)(a1 + 32);
      v22 = HMFGetOSLogHandle();
      v46 = v3;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = v45 = (void *)v4;
        v24 = v19;
        id v25 = *(void **)(a1 + 40);
        id v26 = [v45 pairingsToRemove];
        *(_DWORD *)buf = 138544130;
        v52 = v23;
        __int16 v53 = 2112;
        id v54 = v25;
        BOOL v19 = v24;
        __int16 v55 = 2112;
        id v56 = v24;
        __int16 v57 = 2112;
        v58 = v26;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Unable to find the mkfUser with model id: %@, %@, [%@]", buf, 0x2Au);

        uint64_t v4 = (uint64_t)v45;
      }

      if (v4)
      {
        v27 = [(id)v4 pairingsToRemove];
        BOOL v6 = 1;
      }
      else
      {
        v27 = [(id)v5 pairingsToRemove];
      }
      v28 = (void *)[v27 mutableCopy];
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __62__HMDRemoveAccessoryPairingSharedUserOperation_mainWithError___block_invoke_30;
      v48[3] = &unk_264A2D220;
      id v29 = v19;
      id v49 = v29;
      id v30 = v28;
      id v50 = v30;
      uint64_t v31 = objc_msgSend(v27, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v48);
      if (v6)
      {
        if (v4) {
          char v32 = (void *)v4;
        }
        else {
          char v32 = (void *)v5;
        }
        uint64_t v31 = [v32 setPairingsToRemove:v30];
      }
      objc_super v33 = (void *)MEMORY[0x230FBD990](v31);
      id v34 = *(id *)(a1 + 32);
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        long long v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v52 = v36;
        __int16 v53 = 2112;
        id v54 = v29;
        __int16 v55 = 2112;
        id v56 = v30;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Removed pairing : [%@], new list: %@", buf, 0x20u);
      }

      v8 = 0;
      v3 = v46;
      goto LABEL_25;
    }
    v8 = (void *)v7;
    if (v4)
    {
      v9 = (void *)v4;
    }
    else
    {
      if (!v5)
      {
LABEL_25:
        uint64_t v37 = *(void **)(a1 + 48);
        uint64_t v38 = *(void *)(*(void *)(a1 + 56) + 8);
        id obj = *(id *)(v38 + 40);
        char v39 = [v37 save:&obj];
        objc_storeStrong((id *)(v38 + 40), obj);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v39;
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
          || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          v40 = (void *)MEMORY[0x230FBD990]();
          id v41 = *(id *)(a1 + 32);
          v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v43 = HMFGetLogIdentifier();
            v44 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            *(_DWORD *)buf = 138543874;
            v52 = v43;
            __int16 v53 = 2112;
            id v54 = v3;
            __int16 v55 = 2112;
            id v56 = v44;
            _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Unable to save after removing user pairings on the accessory : %@, %@", buf, 0x20u);
          }
        }
        goto LABEL_30;
      }
      v9 = (void *)v5;
    }
    [v9 removePairedUsersObject:v8];
    goto LABEL_25;
  }
  v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 32);
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = HMFGetLogIdentifier();
    v14 = [*(id *)(a1 + 32) accessoryUUID];
    [*(id *)(a1 + 32) accessoryIdentifier];
    v16 = v15 = v3;
    *(_DWORD *)buf = 138543874;
    v52 = v13;
    __int16 v53 = 2112;
    id v54 = v14;
    __int16 v55 = 2112;
    id v56 = v16;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the mkfHAPAccessory or mkfAirPlayAccessory with model id: %@/%@", buf, 0x20u);

    v3 = v15;
  }

  uint64_t v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
  v8 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;
LABEL_30:
}

void __62__HMDRemoveAccessoryPairingSharedUserOperation_mainWithError___block_invoke_30(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 identifier];
  char v4 = HMFEqualObjects();

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (HMDRemoveAccessoryPairingSharedUserOperation)initWithAccessoryUUID:(id)a3 accessoryIdentifier:(id)a4 isOwnerIdentity:(BOOL)a5 forSharedUser:(id)a6 sharedUserPairingIdentity:(id)a7 homeUUIDWhereAccessoryWasPaired:(id)a8
{
  BOOL v11 = a5;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v15)
  {
LABEL_11:
    _HMFPreconditionFailure();
LABEL_12:
    _HMFPreconditionFailure();
  }
  if (!v17) {
    goto LABEL_12;
  }
  BOOL v19 = v18;
  if (v18)
  {
    v20 = [MEMORY[0x263EFF9A0] dictionary];
    [v20 setObject:v16 forKeyedSubscript:@"sharedUserUUIDKey"];
    v27.receiver = self;
    v27.super_class = (Class)HMDRemoveAccessoryPairingSharedUserOperation;
    id v21 = [(HMDRemoveAccessoryPairingOperation *)&v27 initWithAccessory:v14 accessoryIdentifier:v15 homeUUIDWhereAccessoryWasPaired:v19 isOwnerIdentity:v11 identityToRemove:v17 userData:v20];

    v22 = v21;
  }
  else
  {
    v23 = (void *)MEMORY[0x230FBD990]();
    id v21 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v29 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not associated with a home, cannot create remove accessory pairing shared user operation", buf, 0xCu);
    }
    v22 = 0;
  }

  return v22;
}

- (HMDRemoveAccessoryPairingSharedUserOperation)initWithAccessory:(id)a3 isOwnerIdentity:(BOOL)a4 sharedUser:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_6:
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  BOOL v11 = [v9 pairingIdentity];

  if (v11)
  {
    v12 = [v8 uuid];
    v13 = [v8 identifier];
    id v14 = [v10 uuid];
    id v15 = [v10 pairingIdentity];
    id v16 = [v8 home];
    id v17 = [v16 uuid];
    id v18 = [(HMDRemoveAccessoryPairingSharedUserOperation *)self initWithAccessoryUUID:v12 accessoryIdentifier:v13 isOwnerIdentity:v6 forSharedUser:v14 sharedUserPairingIdentity:v15 homeUUIDWhereAccessoryWasPaired:v17];

    return v18;
  }
LABEL_7:
  v20 = (void *)_HMFPreconditionFailure();
  return (HMDRemoveAccessoryPairingSharedUserOperation *)+[HMDRemoveAccessoryPairingSharedUserOperation logCategory];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_254679 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_254679, &__block_literal_global_254680);
  }
  v2 = (void *)logCategory__hmf_once_v8_254681;
  return v2;
}

void __59__HMDRemoveAccessoryPairingSharedUserOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v8_254681;
  logCategory__hmf_once_v8_254681 = v0;
}

@end