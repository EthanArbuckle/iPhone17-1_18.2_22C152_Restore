@interface CNUrlAddressesDescription(ABSExtentions)
- (BOOL)absPropertyID:()ABSExtentions;
- (uint64_t)absPropertyType;
@end

@implementation CNUrlAddressesDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3) {
    *a3 = 22;
  }
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 257;
}

@end