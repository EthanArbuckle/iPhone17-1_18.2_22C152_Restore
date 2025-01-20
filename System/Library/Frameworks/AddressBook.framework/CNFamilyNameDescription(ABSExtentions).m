@interface CNFamilyNameDescription(ABSExtentions)
- (BOOL)absPropertyID:()ABSExtentions;
- (uint64_t)absPropertyType;
@end

@implementation CNFamilyNameDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3) {
    *a3 = 1;
  }
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 1;
}

@end