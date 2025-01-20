@interface HMDPendingRegionUpdate
@end

@implementation HMDPendingRegionUpdate

uint64_t __38___HMDPendingRegionUpdate_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v105;
  logCategory__hmf_once_v105 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end