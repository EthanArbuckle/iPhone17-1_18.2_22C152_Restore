@interface HMDStereoPairSettingsControllerStateManager
+ (id)logCategory;
@end

@implementation HMDStereoPairSettingsControllerStateManager

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_22442 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_22442, &__block_literal_global_22443);
  }
  v2 = (void *)logCategory__hmf_once_v1_22444;
  return v2;
}

uint64_t __58__HMDStereoPairSettingsControllerStateManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_22444;
  logCategory__hmf_once_v1_22444 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end