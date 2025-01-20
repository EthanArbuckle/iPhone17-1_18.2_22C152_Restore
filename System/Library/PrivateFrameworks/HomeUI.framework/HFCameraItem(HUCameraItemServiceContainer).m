@interface HFCameraItem(HUCameraItemServiceContainer)
- (id)hu_containedServices;
- (uint64_t)hu_containedAccessories;
@end

@implementation HFCameraItem(HUCameraItemServiceContainer)

- (id)hu_containedServices
{
  v1 = [a1 accessory];
  v2 = objc_msgSend(v1, "hf_visibleServices");

  return v2;
}

- (uint64_t)hu_containedAccessories
{
  return [MEMORY[0x1E4F1CAD0] set];
}

@end