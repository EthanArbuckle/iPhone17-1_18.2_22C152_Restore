@interface HFServiceItem(HUServiceItemServiceContainer)
- (id)hu_containedServices;
- (uint64_t)hu_containedAccessories;
@end

@implementation HFServiceItem(HUServiceItemServiceContainer)

- (id)hu_containedServices
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  v3 = [a1 service];
  v4 = [v3 accessory];
  int v5 = objc_msgSend(v4, "hf_isBridge");

  if (v5)
  {
    v6 = [a1 service];
    v7 = [v6 accessory];
    v8 = objc_msgSend(v7, "hf_servicesBehindBridge");
    [v2 unionSet:v8];
  }

  return v2;
}

- (uint64_t)hu_containedAccessories
{
  return [MEMORY[0x1E4F1CAD0] set];
}

@end