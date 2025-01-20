@interface HMDAuditHH2KeysForBackupOperation
+ (BOOL)shouldWeScheduleHH2KeyBackupOperation;
+ (id)logCategory;
+ (id)predicate;
+ (void)recordCurrentBackupRunToUserDefault;
+ (void)resetHH2KeyBackupOperationFromUserDefault;
- (BOOL)mainWithError:(id *)a3;
- (id)logIdentifier;
- (int64_t)qualityOfService;
@end

@implementation HMDAuditHH2KeysForBackupOperation

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_182508 != -1) {
    dispatch_once(&logCategory__hmf_once_t14_182508, &__block_literal_global_182509);
  }
  v2 = (void *)logCategory__hmf_once_v15_182510;
  return v2;
}

void __48__HMDAuditHH2KeysForBackupOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v15_182510;
  logCategory__hmf_once_v15_182510 = v0;
}

+ (void)resetHH2KeyBackupOperationFromUserDefault
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](a1, a2);
  id v4 = a1;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Going to reset the last backup run from user defaults", (uint8_t *)&v8, 0xCu);
  }
  v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v7 removeObjectForKey:@"HMDHH2BackUpKeyBackgroundOperationTimeStampKey"];
}

+ (void)recordCurrentBackupRunToUserDefault
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](a1, a2);
  id v4 = a1;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Going to record the successful backup run", (uint8_t *)&v9, 0xCu);
  }
  v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v8 = [MEMORY[0x263EFF910] now];
  [v7 setObject:v8 forKey:@"HMDHH2BackUpKeyBackgroundOperationTimeStampKey"];
}

+ (BOOL)shouldWeScheduleHH2KeyBackupOperation
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v4 = [v3 objectForKey:@"HMDHH2BackUpKeyBackgroundOperationTimeStampKey"];

  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    id v17 = a1;
    v13 = HMFGetOSLogHandle();
    BOOL v16 = 1;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    v18 = HMFGetLogIdentifier();
    int v23 = 138543362;
    v24 = v18;
    v19 = "%{public}@Allowing the backup operation to run as there is no object stored inside user defaults";
    v20 = v13;
    uint32_t v21 = 12;
LABEL_13:
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v23, v21);

    goto LABEL_15;
  }
  int v8 = [MEMORY[0x263EFF910] now];
  [v8 timeIntervalSinceDate:v7];
  double v10 = v9;

  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = a1;
  v13 = HMFGetOSLogHandle();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10 >= 86400.0)
  {
    if (!v14)
    {
      BOOL v16 = 1;
      goto LABEL_15;
    }
    v18 = HMFGetLogIdentifier();
    int v23 = 138543618;
    v24 = v18;
    __int16 v25 = 2112;
    id v26 = v7;
    v19 = "%{public}@Allowing the backup operation to run as it was last run at %@";
    BOOL v16 = 1;
    v20 = v13;
    uint32_t v21 = 22;
    goto LABEL_13;
  }
  if (v14)
  {
    v15 = HMFGetLogIdentifier();
    int v23 = 138543618;
    v24 = v15;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Not allowing the backup operation to run as it was last run at %@", (uint8_t *)&v23, 0x16u);
  }
  BOOL v16 = 0;
LABEL_15:

  return v16;
}

+ (id)predicate
{
  return (id)[MEMORY[0x263F08A98] predicateWithValue:1];
}

- (id)logIdentifier
{
  v2 = [(HMDBackgroundOperation *)self operationUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (BOOL)mainWithError:(id *)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x230FBD990](self, a2, a3);
  id v5 = self;
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Going to make sure that we did back up our HH2 keys.", buf, 0xCu);
  }
  [(id)objc_opt_class() recordCurrentBackupRunToUserDefault];
  int v8 = [MEMORY[0x263F35AD0] systemStore];
  id v38 = 0;
  double v9 = [v8 allKeysForType:&unk_26E4725C8 error:&v38];
  id v10 = v38;
  id v37 = v10;
  uint64_t v11 = [v8 allKeysForType:&unk_26E4725E0 error:&v37];
  id v12 = v37;

  BOOL v13 = [v9 count] == 0;
  BOOL v14 = (void *)MEMORY[0x230FBD990]();
  v15 = v5;
  BOOL v16 = HMFGetOSLogHandle();
  id v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v30;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@There are no HH2 keys. Nothing to backup.", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      v42 = v9;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Found %@ HH2 keys in the list: %@{public}", buf, 0x20u);
    }
    v20 = (void *)MEMORY[0x230FBD990]();
    uint32_t v21 = v15;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v23 = HMFGetLogIdentifier();
      v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2112;
      v42 = v11;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Found %@ keys in back up list: %@{public}", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v42) = 0;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __51__HMDAuditHH2KeysForBackupOperation_mainWithError___block_invoke;
    v32[3] = &unk_264A242D0;
    id v33 = v11;
    v34 = v21;
    v35 = v8;
    v36 = buf;
    uint64_t v25 = objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v32);
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      id v26 = (void *)MEMORY[0x230FBD990](v25);
      uint64_t v27 = v21;
      HMFGetOSLogHandle();
      v28 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = HMFGetLogIdentifier();
        *(_DWORD *)v39 = 138543362;
        v40 = v29;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Looks like we failed to back up at least one key. Will retry the back up operation again in next homed reboot.", v39, 0xCu);
      }
    }

    _Block_object_dispose(buf, 8);
  }

  return 1;
}

void __51__HMDAuditHH2KeysForBackupOperation_mainWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __51__HMDAuditHH2KeysForBackupOperation_mainWithError___block_invoke_2;
  v19[3] = &unk_264A2BB18;
  id v5 = v3;
  id v20 = v5;
  v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v19);
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 40);
  double v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = [v5 identifier];
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@We already have the back up for the key: %@", buf, 0x16u);
    }
  }
  else
  {
    if (v10)
    {
      BOOL v13 = HMFGetLogIdentifier();
      BOOL v14 = [v5 identifier];
      *(_DWORD *)buf = 138543618;
      v22 = v13;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Looks like we do not have back up for key : %@. Adding it into the list", buf, 0x16u);
    }
    if (([*(id *)(a1 + 48) savePairingIdentityToBackUpTable:v5] & 1) == 0)
    {
      v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = *(id *)(a1 + 40);
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v22 = v18;
        __int16 v23 = 2112;
        id v24 = v5;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to back up the key : %@", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

uint64_t __51__HMDAuditHH2KeysForBackupOperation_mainWithError___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 identifier];
  id v5 = [v3 identifier];

  uint64_t v6 = HMFEqualObjects();
  return v6;
}

- (int64_t)qualityOfService
{
  return 17;
}

@end