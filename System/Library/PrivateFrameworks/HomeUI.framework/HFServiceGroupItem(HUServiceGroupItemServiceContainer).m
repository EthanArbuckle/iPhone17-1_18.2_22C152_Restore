@interface HFServiceGroupItem(HUServiceGroupItemServiceContainer)
- (uint64_t)hu_containedAccessories;
@end

@implementation HFServiceGroupItem(HUServiceGroupItemServiceContainer)

- (uint64_t)hu_containedAccessories
{
  return [MEMORY[0x1E4F1CAD0] set];
}

@end