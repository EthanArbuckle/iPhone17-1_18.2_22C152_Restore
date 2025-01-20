@interface HMDAccessoryFirmwareUpdateAllowPolicy
+ (id)logCategory;
@end

@implementation HMDAccessoryFirmwareUpdateAllowPolicy

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_149206 != -1) {
    dispatch_once(&logCategory__hmf_once_t13_149206, &__block_literal_global_119);
  }
  v2 = (void *)logCategory__hmf_once_v14_149207;
  return v2;
}

void __52__HMDAccessoryFirmwareUpdateAllowPolicy_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v14_149207;
  logCategory__hmf_once_v14_149207 = v0;
}

@end