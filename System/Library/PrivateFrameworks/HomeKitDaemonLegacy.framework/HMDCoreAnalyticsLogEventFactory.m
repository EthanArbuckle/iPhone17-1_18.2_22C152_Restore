@interface HMDCoreAnalyticsLogEventFactory
+ (id)logCategory;
- (id)logEventForTaggedEvent:(id)a3;
- (id)supportedTags;
@end

@implementation HMDCoreAnalyticsLogEventFactory

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_99870 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_99870, &__block_literal_global_99871);
  }
  v2 = (void *)logCategory__hmf_once_v2_99872;
  return v2;
}

uint64_t __46__HMDCoreAnalyticsLogEventFactory_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_99872;
  logCategory__hmf_once_v2_99872 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)supportedTags
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)logEventForTaggedEvent:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to get log event for unknown tagged event: %@", (uint8_t *)&v10, 0x16u);
  }

  return 0;
}

@end