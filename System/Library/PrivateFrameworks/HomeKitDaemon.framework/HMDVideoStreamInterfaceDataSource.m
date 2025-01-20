@interface HMDVideoStreamInterfaceDataSource
+ (id)logCategory;
@end

@implementation HMDVideoStreamInterfaceDataSource

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_144623 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_144623, &__block_literal_global_144624);
  }
  v2 = (void *)logCategory__hmf_once_v1_144625;
  return v2;
}

void __48__HMDVideoStreamInterfaceDataSource_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_144625;
  logCategory__hmf_once_v1_144625 = v0;
}

@end