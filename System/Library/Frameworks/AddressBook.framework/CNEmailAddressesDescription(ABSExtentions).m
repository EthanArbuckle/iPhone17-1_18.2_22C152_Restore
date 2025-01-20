@interface CNEmailAddressesDescription(ABSExtentions)
- (BOOL)absPropertyID:()ABSExtentions;
- (uint64_t)absPropertyType;
@end

@implementation CNEmailAddressesDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3) {
    *a3 = 4;
  }
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 257;
}

@end