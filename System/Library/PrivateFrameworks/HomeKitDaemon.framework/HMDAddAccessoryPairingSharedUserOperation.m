@interface HMDAddAccessoryPairingSharedUserOperation
+ (id)logCategory;
- (BOOL)mainWithError:(id *)a3;
- (HMDAddAccessoryPairingSharedUserOperation)initWithAccessory:(id)a3 forSharedUser:(id)a4 sharedUserPairingIdentity:(id)a5 asOwner:(BOOL)a6 asSharedAdmin:(BOOL)a7;
- (HMDAddAccessoryPairingSharedUserOperation)initWithAccessoryUUID:(id)a3 accessoryIdentifier:(id)a4 forSharedUser:(id)a5 sharedUserPairingIdentity:(id)a6 asOwner:(BOOL)a7 asSharedAdmin:(BOOL)a8 homeUUIDWhereAccessoryWasPaired:(id)a9;
- (id)attributeDescriptions;
- (id)logIdentifier;
@end

@implementation HMDAddAccessoryPairingSharedUserOperation

- (id)logIdentifier
{
  v2 = [(HMDBackgroundOperation *)self operationUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)attributeDescriptions
{
  v12[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)HMDAddAccessoryPairingSharedUserOperation;
  v3 = [(HMDAccessoryBackgroundOperation *)&v11 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMDBackgroundOperation *)self userData];
  v6 = [v5 objectForKey:@"sharedUserUUIDKey"];
  v7 = (void *)[v4 initWithName:@"sharedUserUUID" value:v6];
  v12[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  v9 = [v3 arrayByAddingObjectsFromArray:v8];

  return v9;
}

- (BOOL)mainWithError:(id *)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)HMDAddAccessoryPairingSharedUserOperation;
  unsigned __int8 v5 = -[HMDAddAccessoryPairingOperation mainWithError:](&v34, sel_mainWithError_);
  v6 = [(HMDBackgroundOperation *)self userData];
  v7 = [v6 objectForKeyedSubscript:@"sharedUserUUIDKey"];

  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  objc_super v11 = v10;
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
      v36 = v13;
      *(_WORD *)v37 = 2112;
      *(void *)&v37[2] = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully added pairing for the shared user: %@ on the accessory : %@/%@", buf, 0x2Au);
    }
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v36 = __Block_byref_object_copy__245150;
    *(void *)v37 = __Block_byref_object_dispose__245151;
    *(void *)&v37[8] = 0;
    v15 = +[HMDCoreData sharedInstance];
    v16 = [(HMDAccessoryBackgroundOperation *)v9 homeUUID];
    v17 = [v15 contextWithHomeUUID:v16];

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __59__HMDAddAccessoryPairingSharedUserOperation_mainWithError___block_invoke;
    v25[3] = &unk_264A2D248;
    v25[4] = v9;
    v28 = buf;
    id v26 = v7;
    v29 = &v30;
    id v18 = v17;
    id v27 = v18;
    [v18 unsafeSynchronousBlock:v25];
    if (a3) {
      *a3 = *(id *)(*(void *)&buf[8] + 40);
    }
    BOOL v19 = *((unsigned char *)v31 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      v21 = [(HMDAccessoryBackgroundOperation *)v9 accessoryUUID];
      v22 = [(HMDAccessoryBackgroundOperation *)v9 accessoryIdentifier];
      id v23 = *a3;
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      v36 = v21;
      *(_WORD *)v37 = 2112;
      *(void *)&v37[2] = v22;
      *(_WORD *)&v37[10] = 2112;
      *(void *)&v37[12] = v23;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to add pairing for shared user : %@ for accessory: %@/%@, error: %@", buf, 0x34u);
    }
    BOOL v19 = 0;
  }

  return v19;
}

void __59__HMDAddAccessoryPairingSharedUserOperation_mainWithError___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) accessoryUUID];
  uint64_t v3 = +[HMCContext findAccessoryWithModelID:v2];

  uint64_t v4 = [(id)v3 castIfHAPAccessory];
  unsigned __int8 v5 = [(id)v3 castIfAirPlayAccessory];
  if (v4 | v3)
  {
    uint64_t v6 = +[HMCContext findUserWithModelID:*(void *)(a1 + 40)];
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)v4;
      if (v4 || (v8 = v5) != 0) {
        [v8 addPairedUsersObject:v7];
      }
      v9 = *(void **)(a1 + 48);
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      id obj = *(id *)(v10 + 40);
      char v11 = [v9 save:&obj];
      objc_storeStrong((id *)(v10 + 40), obj);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v11;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
        || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        v12 = (void *)MEMORY[0x230FBD990]();
        id v13 = *(id *)(a1 + 32);
        v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = HMFGetLogIdentifier();
          v16 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          *(_DWORD *)buf = 138543874;
          v35 = v15;
          __int16 v36 = 2112;
          uint64_t v37 = v3;
          __int16 v38 = 2112;
          v39 = v16;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to save after adding user pairings on accessory : %@, %@", buf, 0x20u);
        }
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x230FBD990]();
      id v26 = *(id *)(a1 + 32);
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        uint64_t v29 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v35 = v28;
        __int16 v36 = 2112;
        uint64_t v37 = v29;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the mkfUser with model id: %@", buf, 0x16u);
      }
      uint64_t v30 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      uint64_t v31 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v32 = *(void **)(v31 + 40);
      *(void *)(v31 + 40) = v30;

      v7 = 0;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = *(id *)(a1 + 32);
    BOOL v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      v21 = [*(id *)(a1 + 32) accessoryUUID];
      v22 = [*(id *)(a1 + 32) accessoryIdentifier];
      *(_DWORD *)buf = 138543874;
      v35 = v20;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v21;
      __int16 v38 = 2112;
      v39 = v22;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the mkfHAPAccessory or mkfAccessory with model id: %@/%@", buf, 0x20u);
    }
    uint64_t v23 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
    v7 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
}

- (HMDAddAccessoryPairingSharedUserOperation)initWithAccessoryUUID:(id)a3 accessoryIdentifier:(id)a4 forSharedUser:(id)a5 sharedUserPairingIdentity:(id)a6 asOwner:(BOOL)a7 asSharedAdmin:(BOOL)a8 homeUUIDWhereAccessoryWasPaired:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v16)
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
  if (!v18) {
    goto LABEL_14;
  }
  v20 = v19;
  if (v19)
  {
    v21 = [MEMORY[0x263EFF9A0] dictionary];
    [v21 setObject:v17 forKeyedSubscript:@"sharedUserUUIDKey"];
    v28.receiver = self;
    v28.super_class = (Class)HMDAddAccessoryPairingSharedUserOperation;
    v22 = [(HMDAddAccessoryPairingOperation *)&v28 initWithAccessoryUUID:v15 accessoryIdentifier:v16 newPairingIdentity:v18 homeUUIDWhereAccessoryWasPaired:v20 asOwner:v10 asAdmin:v9 shouldUpdateKeyChainEntry:0 userData:v21];

    uint64_t v23 = v22;
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x230FBD990]();
    v22 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not associated with a home, cannot create add accessory pairing shared user operation", buf, 0xCu);
    }
    uint64_t v23 = 0;
  }

  return v23;
}

- (HMDAddAccessoryPairingSharedUserOperation)initWithAccessory:(id)a3 forSharedUser:(id)a4 sharedUserPairingIdentity:(id)a5 asOwner:(BOOL)a6 asSharedAdmin:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  if (!v13)
  {
LABEL_6:
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v15 = v14;
  if (v14)
  {
    id v16 = [v12 uuid];
    id v17 = [v12 identifier];
    id v18 = [v13 uuid];
    id v19 = [v12 home];
    uint64_t v20 = [v19 uuid];
    BOOL v21 = v7;
    v22 = (void *)v20;
    uint64_t v23 = [(HMDAddAccessoryPairingSharedUserOperation *)self initWithAccessoryUUID:v16 accessoryIdentifier:v17 forSharedUser:v18 sharedUserPairingIdentity:v15 asOwner:v8 asSharedAdmin:v21 homeUUIDWhereAccessoryWasPaired:v20];

    return v23;
  }
LABEL_7:
  v25 = (void *)_HMFPreconditionFailure();
  return (HMDAddAccessoryPairingSharedUserOperation *)+[HMDAddAccessoryPairingSharedUserOperation logCategory];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_245181 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_245181, &__block_literal_global_245182);
  }
  v2 = (void *)logCategory__hmf_once_v7_245183;
  return v2;
}

void __56__HMDAddAccessoryPairingSharedUserOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v7_245183;
  logCategory__hmf_once_v7_245183 = v0;
}

@end