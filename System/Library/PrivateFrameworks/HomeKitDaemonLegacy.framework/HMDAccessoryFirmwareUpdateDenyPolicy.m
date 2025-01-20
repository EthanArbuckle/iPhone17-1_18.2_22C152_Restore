@interface HMDAccessoryFirmwareUpdateDenyPolicy
+ (id)logCategory;
- (void)configure;
@end

@implementation HMDAccessoryFirmwareUpdateDenyPolicy

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_101845 != -1) {
    dispatch_once(&logCategory__hmf_once_t10_101845, &__block_literal_global_110_101846);
  }
  v2 = (void *)logCategory__hmf_once_v11_101847;
  return v2;
}

uint64_t __51__HMDAccessoryFirmwareUpdateDenyPolicy_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v11_101847;
  logCategory__hmf_once_v11_101847 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)configure
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090]([(HMDAccessoryFirmwareUpdatePolicy *)self setStatus:0]);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Deny policy configured", (uint8_t *)&v7, 0xCu);
  }
}

@end