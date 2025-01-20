@interface HMCameraControl
- (HMCameraControl)init;
@end

@implementation HMCameraControl

- (HMCameraControl)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMCameraControl;
  return [(HMCameraControl *)&v3 init];
}

uint64_t __31___HMCameraControl_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_29972;
  logCategory__hmf_once_v1_29972 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end