@interface HMMutableMediaDestination
+ (id)logCategory;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HMMutableMediaDestination

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMMediaDestination allocWithZone:a3];
  v5 = [(HMMediaDestination *)self uniqueIdentifier];
  v6 = [(HMMediaDestination *)self parentIdentifier];
  unint64_t v7 = [(HMMediaDestination *)self supportedOptions];
  v8 = [(HMMediaDestination *)self audioGroupIdentifier];
  v9 = [(HMMediaDestination *)v4 initWithUniqueIdentifier:v5 parentIdentifier:v6 supportedOptions:v7 audioGroupIdentifier:v8];

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14 != -1) {
    dispatch_once(&logCategory__hmf_once_t14, &__block_literal_global_267);
  }
  v2 = (void *)logCategory__hmf_once_v15;

  return v2;
}

uint64_t __40__HMMutableMediaDestination_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v15;
  logCategory__hmf_once_v15 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end