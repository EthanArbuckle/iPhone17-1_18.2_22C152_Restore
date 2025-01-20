@interface HMResidentDevice
@end

@implementation HMResidentDevice

uint64_t __51__HMResidentDevice_HFAdditions__hf_linkedAccessory__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 device];
  v4 = [*(id *)(a1 + 32) device];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

@end