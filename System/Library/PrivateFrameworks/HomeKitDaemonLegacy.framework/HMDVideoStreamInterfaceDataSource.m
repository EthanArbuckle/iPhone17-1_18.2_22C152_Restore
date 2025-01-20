@interface HMDVideoStreamInterfaceDataSource
+ (id)logCategory;
@end

@implementation HMDVideoStreamInterfaceDataSource

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_66191 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_66191, &__block_literal_global_66192);
  }
  v2 = (void *)logCategory__hmf_once_v1_66193;
  return v2;
}

uint64_t __48__HMDVideoStreamInterfaceDataSource_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_66193;
  logCategory__hmf_once_v1_66193 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end