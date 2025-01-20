@interface HFAccessoryItem
@end

@implementation HFAccessoryItem

uint64_t __69__HFAccessoryItem_HUBridgeItemServiceContainer__hu_containedServices__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 accessory];
  uint64_t v3 = objc_msgSend(v2, "hf_showAsIndividualServices");

  return v3;
}

uint64_t __72__HFAccessoryItem_HUBridgeItemServiceContainer__hu_containedAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_showAsIndividualServices") ^ 1;
}

@end