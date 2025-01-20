@interface CNUIRTTUtilities
+ (id)defaultUtilities;
@end

@implementation CNUIRTTUtilities

uint64_t __36___CNUIRTTUtilities_utilityProvider__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyUtilityProvider");
}

+ (id)defaultUtilities
{
  v2 = objc_alloc_init(_CNUIRTTUtilities);
  return v2;
}

@end