@interface HMDAccessoryUserIdentifierManager
+ (id)logCategory;
@end

@implementation HMDAccessoryUserIdentifierManager

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_88725 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_88725, &__block_literal_global_88726);
  }
  v2 = (void *)logCategory__hmf_once_v1_88727;
  return v2;
}

void __48__HMDAccessoryUserIdentifierManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_88727;
  logCategory__hmf_once_v1_88727 = v0;
}

@end