@interface CLLocation
@end

@implementation CLLocation

uint64_t __36__CLLocation_HMFObject__logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_185915;
  logCategory__hmf_once_v1_185915 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end