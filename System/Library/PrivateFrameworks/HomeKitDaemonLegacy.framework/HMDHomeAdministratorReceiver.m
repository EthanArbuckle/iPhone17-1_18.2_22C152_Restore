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

uint64_t __45____HMDHomeAdministratorReceiver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v14_167009;
  logCategory__hmf_once_v14_167009 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end