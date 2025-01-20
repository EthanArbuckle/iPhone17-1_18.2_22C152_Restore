@interface HMDAccountUpdateDeviceModels
@end

@implementation HMDAccountUpdateDeviceModels

uint64_t ____HMDAccountUpdateDeviceModels_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldSyncDevice:a2];
}

@end