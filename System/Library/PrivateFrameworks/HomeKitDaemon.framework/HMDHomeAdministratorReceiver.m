@interface HMDHomeAdministratorReceiver
@end

@implementation HMDHomeAdministratorReceiver

BOOL __62____HMDHomeAdministratorReceiver_registerForMessage_policies___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

void __45____HMDHomeAdministratorReceiver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v8_240767;
  logCategory__hmf_once_v8_240767 = v0;
}

@end