@interface HMDStereoPairSettingsControllerStateManager
+ (id)logCategory;
@end

@implementation HMDStereoPairSettingsControllerStateManager

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_264609 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_264609, &__block_literal_global_264610);
  }
  v2 = (void *)logCategory__hmf_once_v1_264611;
  return v2;
}

void __58__HMDStereoPairSettingsControllerStateManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_264611;
  logCategory__hmf_once_v1_264611 = v0;
}

@end