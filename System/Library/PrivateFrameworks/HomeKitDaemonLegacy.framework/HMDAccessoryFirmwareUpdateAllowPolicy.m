@interface HMDAccessoryFirmwareUpdateAllowPolicy
+ (id)logCategory;
@end

@implementation HMDAccessoryFirmwareUpdateAllowPolicy

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_101855 != -1) {
    dispatch_once(&logCategory__hmf_once_t13_101855, &__block_literal_global_119_101856);
  }
  v2 = (void *)logCategory__hmf_once_v14_101857;
  return v2;
}

uint64_t __52__HMDAccessoryFirmwareUpdateAllowPolicy_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v14_101857;
  logCategory__hmf_once_v14_101857 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end