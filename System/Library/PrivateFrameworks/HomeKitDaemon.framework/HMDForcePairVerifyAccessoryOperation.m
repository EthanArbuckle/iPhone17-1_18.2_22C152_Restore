@interface HMDForcePairVerifyAccessoryOperation
+ (id)logCategory;
+ (id)predicate;
- (BOOL)mainWithError:(id *)a3;
- (id)logIdentifier;
@end

@implementation HMDForcePairVerifyAccessoryOperation

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_150064 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_150064, &__block_literal_global_150065);
  }
  v2 = (void *)logCategory__hmf_once_v5_150066;
  return v2;
}

void __51__HMDForcePairVerifyAccessoryOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_150066;
  logCategory__hmf_once_v5_150066 = v0;
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
  uint64_t v36 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(HMDAccessoryBackgroundOperation *)self accessoryOperationStatus];
  v6 = objc_opt_class();
  v7 = [(HMDAccessoryBackgroundOperation *)self accessoryUUID];
  v8 = [(HMDBackgroundOperation *)self homeManager];
  v9 = [v6 findAccessoryUsing:v7 homeManager:v8];

  id v10 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (v12) {
    BOOL v13 = v5 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  BOOL v14 = !v13;
  if (v13)
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      v20 = [(HMDAccessoryBackgroundOperation *)v17 accessoryUUID];
      v21 = [(HMDAccessoryBackgroundOperation *)v17 accessoryIdentifier];
      [(HMDAccessoryBackgroundOperation *)v17 homeUUID];
      v25 = v16;
      v23 = v22 = a3;
      *(_DWORD *)buf = 138544130;
      v29 = v19;
      __int16 v30 = 2112;
      v31 = v20;
      __int16 v32 = 2112;
      v33 = v21;
      __int16 v34 = 2112;
      v35 = v23;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to force Pair Verify with accessory : %@/%@, for Home: %@", buf, 0x2Au);

      a3 = v22;
      v16 = v25;
    }
    if (a3)
    {
      *a3 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    }
  }
  else if (v5 != 1)
  {
    v15 = dispatch_get_global_queue(-32768, 0);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __54__HMDForcePairVerifyAccessoryOperation_mainWithError___block_invoke;
    v26[3] = &unk_264A2F370;
    v26[4] = self;
    id v27 = v12;
    [v27 establishLocalHAPConnectionWithQueue:v15 completion:v26];
  }
  return v14;
}

void __54__HMDForcePairVerifyAccessoryOperation_mainWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    v8 = [*(id *)(a1 + 40) shortDescription];
    int v9 = 138543874;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Force PV with accessory [%@] finished with error: %@", (uint8_t *)&v9, 0x20u);
  }
}

@end