@interface CNOrganizationNameDescription(ABSExtentions)
- (BOOL)absPropertyID:()ABSExtentions;
- (uint64_t)absPropertyType;
@end

@implementation CNOrganizationNameDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3) {
    *a3 = 10;
  }
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 1;
}

@end