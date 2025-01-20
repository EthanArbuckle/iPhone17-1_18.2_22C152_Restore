@interface HMDPersistAuditAccessoryResultOperation
+ (id)logCategory;
+ (id)predicate;
- (BOOL)mainWithError:(id *)a3;
- (id)initForRestrictedGuestWithAccessory:(id)a3;
- (id)logIdentifier;
@end

@implementation HMDPersistAuditAccessoryResultOperation

- (id)logIdentifier
{
  v2 = [(HMDBackgroundOperation *)self operationUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (BOOL)mainWithError:(id *)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  unint64_t v4 = [(HMDAccessoryBackgroundOperation *)self accessoryOperationStatus];
  v5 = objc_opt_class();
  v6 = [(HMDAccessoryBackgroundOperation *)self accessoryUUID];
  v7 = [(HMDBackgroundOperation *)self homeManager];
  v8 = [v5 findAccessoryUsing:v6 homeManager:v7];

  id v9 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  unint64_t v11 = v10;

  id v12 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  unint64_t v14 = v13;

  if (!v4)
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      v20 = [(HMDAccessoryBackgroundOperation *)v17 accessoryUUID];
      v21 = [(HMDAccessoryBackgroundOperation *)v17 accessoryIdentifier];
      v22 = [(HMDAccessoryBackgroundOperation *)v17 homeUUID];
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      v52 = v21;
      LOWORD(v53) = 2112;
      *(void *)((char *)&v53 + 2) = v22;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to run audit operation on accessory : %@/%@, for Home: %@ due to invalid status", buf, 0x2Au);
    }
    if (a3) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (!(v11 | v14))
  {
    v23 = (void *)MEMORY[0x230FBD990]();
    v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      v27 = [(HMDAccessoryBackgroundOperation *)v24 accessoryUUID];
      v28 = [(HMDAccessoryBackgroundOperation *)v24 accessoryIdentifier];
      v29 = [(HMDAccessoryBackgroundOperation *)v24 homeUUID];
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2112;
      v52 = v28;
      LOWORD(v53) = 2112;
      *(void *)((char *)&v53 + 2) = v29;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to run audit operation on nil accessory : %@/%@, for Home: %@", buf, 0x2Au);
    }
    if (a3)
    {
LABEL_18:
      [MEMORY[0x263F087E8] hmErrorWithCode:20];
      BOOL v15 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
LABEL_19:
    BOOL v15 = 0;
    goto LABEL_23;
  }
  if (v4 == 1)
  {
    BOOL v15 = 1;
  }
  else
  {
    v30 = [(HMDBackgroundOperation *)self userData];
    v31 = [v30 objectForKeyedSubscript:@"HMDBackgroundOpsUpdateAuditTimeForRestrictedGuestKey"];
    char v32 = [v31 BOOLValue];

    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2020000000;
    char v50 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v52 = __Block_byref_object_copy__51687;
    *(void *)&long long v53 = __Block_byref_object_dispose__51688;
    *((void *)&v53 + 1) = 0;
    v33 = +[HMDCoreData sharedInstance];
    v34 = [v12 home];
    v35 = [v34 uuid];
    v36 = [v33 contextWithHomeUUID:v35];

    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __57__HMDPersistAuditAccessoryResultOperation_mainWithError___block_invoke;
    v40[3] = &unk_264A1A9D0;
    id v41 = v12;
    v42 = self;
    char v46 = v32;
    v44 = buf;
    v45 = &v47;
    id v37 = v36;
    id v43 = v37;
    [v37 unsafeSynchronousBlock:v40];
    if (a3) {
      *a3 = *(id *)(*(void *)&buf[8] + 40);
    }
    BOOL v15 = *((unsigned char *)v48 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v47, 8);
  }
LABEL_23:

  return v15;
}

void __57__HMDPersistAuditAccessoryResultOperation_mainWithError___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uuid];
  v3 = +[HMCContext findAccessoryWithModelID:v2];

  uint64_t v4 = [v3 castIfHAPAccessory];
  uint64_t v5 = [v3 castIfAirPlayAccessory];
  v6 = (void *)v5;
  if (v4 | v5)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      v7 = [MEMORY[0x263EFF910] now];
      [(id)v4 setLastPairingAuditTimeForRG:v7];
    }
    else
    {
      if (v4)
      {
        [(id)v4 setNeedsPairingAudit:MEMORY[0x263EFFA80]];
        v7 = [MEMORY[0x263EFF910] now];
        v16 = (void *)v4;
      }
      else
      {
        if (!v5)
        {
LABEL_13:
          v17 = *(void **)(a1 + 48);
          uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
          id obj = *(id *)(v18 + 40);
          char v19 = [v17 save:&obj];
          objc_storeStrong((id *)(v18 + 40), obj);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v19;
          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
            || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
          {
            v20 = (void *)MEMORY[0x230FBD990]();
            id v21 = *(id *)(a1 + 40);
            v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = HMFGetLogIdentifier();
              uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
              *(_DWORD *)buf = 138543874;
              v27 = v23;
              __int16 v28 = 2112;
              uint64_t v29 = v4;
              __int16 v30 = 2112;
              uint64_t v31 = v24;
              _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to save needsAudit & lastAuditTime on the accessory : %@, %@", buf, 0x20u);
            }
          }
          goto LABEL_18;
        }
        [(id)v5 setNeedsPairingAudit:MEMORY[0x263EFFA80]];
        v7 = [MEMORY[0x263EFF910] now];
        v16 = v6;
      }
      [v16 setLastPairingAuditTime:v7];
    }

    goto LABEL_13;
  }
  v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 40);
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    unint64_t v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 32) uuid];
    *(_DWORD *)buf = 138543618;
    v27 = v11;
    __int16 v28 = 2112;
    uint64_t v29 = (uint64_t)v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the mkfHAPAccessory or mkfAirPlayAccessory with model id: %@", buf, 0x16u);
  }
  uint64_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

LABEL_18:
}

- (id)initForRestrictedGuestWithAccessory:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  v10 = @"HMDBackgroundOpsUpdateAuditTimeForRestrictedGuestKey";
  v11[0] = MEMORY[0x263EFFA88];
  uint64_t v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v9.receiver = self;
  v9.super_class = (Class)HMDPersistAuditAccessoryResultOperation;
  v7 = [(HMDAccessoryBackgroundOperation *)&v9 initWithAccessory:v5 userData:v6];

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_51702 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_51702, &__block_literal_global_51703);
  }
  v2 = (void *)logCategory__hmf_once_v9_51704;
  return v2;
}

void __54__HMDPersistAuditAccessoryResultOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v9_51704;
  logCategory__hmf_once_v9_51704 = v0;
}

+ (id)predicate
{
  return (id)[MEMORY[0x263F08A98] predicateWithValue:1];
}

@end