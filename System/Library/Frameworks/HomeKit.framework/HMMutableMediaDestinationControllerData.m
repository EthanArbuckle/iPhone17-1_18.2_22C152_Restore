@interface HMMutableMediaDestinationControllerData
+ (id)logCategory;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HMMutableMediaDestinationControllerData

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMMediaDestinationControllerData allocWithZone:a3];
  v5 = [(HMMediaDestinationControllerData *)self identifier];
  v6 = [(HMMediaDestinationControllerData *)self parentIdentifier];
  v7 = [(HMMediaDestinationControllerData *)self destinationIdentifier];
  unint64_t v8 = [(HMMediaDestinationControllerData *)self supportedOptions];
  v9 = [(HMMediaDestinationControllerData *)self availableDestinationIdentifiers];
  v10 = [(HMMediaDestinationControllerData *)v4 initWithIdentifier:v5 parentIdentifier:v6 destinationIdentifier:v7 supportedOptions:v8 availableDestinationIdentifiers:v9];

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13 != -1) {
    dispatch_once(&logCategory__hmf_once_t13, &__block_literal_global_193);
  }
  v2 = (void *)logCategory__hmf_once_v14;

  return v2;
}

uint64_t __54__HMMutableMediaDestinationControllerData_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v14;
  logCategory__hmf_once_v14 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end