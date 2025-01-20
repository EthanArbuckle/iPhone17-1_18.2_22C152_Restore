@interface CNModificationDateDescription(ABSExtentions)
- (BOOL)absPropertyID:()ABSExtentions;
- (uint64_t)absPropertyType;
@end

@implementation CNModificationDateDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3) {
    *a3 = 27;
  }
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 4;
}

@end