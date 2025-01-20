@interface CNBirthdayDescription(ABSExtentions)
- (BOOL)absPropertyID:()ABSExtentions;
- (uint64_t)ABSValueFromCNValue:()ABSExtentions;
- (uint64_t)CNValueFromABSValue:()ABSExtentions;
- (uint64_t)absPropertyType;
@end

@implementation CNBirthdayDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3) {
    *a3 = 17;
  }
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 4;
}

- (uint64_t)ABSValueFromCNValue:()ABSExtentions
{
  return objc_msgSend(MEMORY[0x263F33590], "dateFromDayComponents:");
}

- (uint64_t)CNValueFromABSValue:()ABSExtentions
{
  return objc_msgSend(MEMORY[0x263F33590], "dayComponentsFromDate:");
}

@end