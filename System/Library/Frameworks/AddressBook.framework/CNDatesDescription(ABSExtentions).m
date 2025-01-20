@interface CNDatesDescription(ABSExtentions)
- (BOOL)absPropertyID:()ABSExtentions;
- (uint64_t)absPropertyType;
@end

@implementation CNDatesDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3) {
    *a3 = 12;
  }
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 260;
}

@end