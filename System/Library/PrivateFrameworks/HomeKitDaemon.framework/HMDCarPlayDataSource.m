@interface HMDCarPlayDataSource
+ (id)logCategory;
- (BOOL)synchronouslyFetchIsCarPlayConnectedStatus;
- (BOOL)synchronouslyFetchIsConnectedToCarPlayNetwork;
@end

@implementation HMDCarPlayDataSource

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_44225 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_44225, &__block_literal_global_44226);
  }
  v2 = (void *)logCategory__hmf_once_v2_44227;
  return v2;
}

void __35__HMDCarPlayDataSource_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_44227;
  logCategory__hmf_once_v2_44227 = v0;
}

- (BOOL)synchronouslyFetchIsConnectedToCarPlayNetwork
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F386E0]);
  [v3 activate];
  v4 = [v3 currentKnownNetworkProfile];
  v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 isCarPlay];
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = (void *)MEMORY[0x230FBD990]([v3 invalidate]);
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    v11 = [NSNumber numberWithBool:v6];
    int v13 = 138543618;
    v14 = v10;
    __int16 v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@CWFNetworkProfile isCarPlay: %@", (uint8_t *)&v13, 0x16u);
  }

  return v6;
}

- (BOOL)synchronouslyFetchIsCarPlayConnectedStatus
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F30E50]) initAndWaitUntilSessionUpdated];
  id v3 = [v2 currentSession];
  char v4 = [v3 isPaired];

  return v4;
}

@end