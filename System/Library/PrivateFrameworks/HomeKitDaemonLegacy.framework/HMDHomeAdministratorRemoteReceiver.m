@interface HMDHomeAdministratorRemoteReceiver
@end

@implementation HMDHomeAdministratorRemoteReceiver

uint64_t __68____HMDHomeAdministratorRemoteReceiver_registerForMessage_policies___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __68____HMDHomeAdministratorRemoteReceiver_registerForMessage_policies___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __51____HMDHomeAdministratorRemoteReceiver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v20_167031;
  logCategory__hmf_once_v20_167031 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end