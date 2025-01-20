@interface CNJobTitleDescription(ABSExtentions)
- (BOOL)absPropertyID:()ABSExtentions;
- (uint64_t)absPropertyType;
@end

@implementation CNJobTitleDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3) {
    *a3 = 18;
  }
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 1;
}

@end