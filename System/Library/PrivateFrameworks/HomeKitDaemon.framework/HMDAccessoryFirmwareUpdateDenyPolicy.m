@interface HMDAccessoryFirmwareUpdateDenyPolicy
+ (id)logCategory;
- (void)configure;
@end

@implementation HMDAccessoryFirmwareUpdateDenyPolicy

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_149196 != -1) {
    dispatch_once(&logCategory__hmf_once_t10_149196, &__block_literal_global_110_149197);
  }
  v2 = (void *)logCategory__hmf_once_v11_149198;
  return v2;
}

void __51__HMDAccessoryFirmwareUpdateDenyPolicy_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v11_149198;
  logCategory__hmf_once_v11_149198 = v0;
}

- (void)configure
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990]([(HMDAccessoryFirmwareUpdatePolicy *)self setStatus:0]);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Deny policy configured", (uint8_t *)&v7, 0xCu);
  }
}

@end