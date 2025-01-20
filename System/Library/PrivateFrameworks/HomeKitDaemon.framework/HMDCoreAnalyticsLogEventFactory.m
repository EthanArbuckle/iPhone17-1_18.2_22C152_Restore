@interface HMDCoreAnalyticsLogEventFactory
+ (id)logCategory;
- (id)logEventForTaggedEvent:(id)a3;
- (id)supportedTags;
@end

@implementation HMDCoreAnalyticsLogEventFactory

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_199128 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_199128, &__block_literal_global_199129);
  }
  v2 = (void *)logCategory__hmf_once_v2_199130;
  return v2;
}

void __46__HMDCoreAnalyticsLogEventFactory_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_199130;
  logCategory__hmf_once_v2_199130 = v0;
}

- (id)supportedTags
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)logEventForTaggedEvent:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to get log event for unknown tagged event: %@", (uint8_t *)&v10, 0x16u);
  }

  return 0;
}

@end