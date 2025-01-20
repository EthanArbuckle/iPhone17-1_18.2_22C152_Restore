@interface CNPropertyDescription(ABSExtentions)
- (id)CNValueFromABSValue:()ABSExtentions;
- (uint64_t)ABSValueFromCNValue:()ABSExtentions;
- (uint64_t)absPropertyID:()ABSExtentions;
- (uint64_t)absPropertyType;
- (uint64_t)convertABSValue:()ABSExtentions toCNValue:error:;
@end

@implementation CNPropertyDescription(ABSExtentions)

- (uint64_t)absPropertyID:()ABSExtentions
{
  return 0;
}

- (uint64_t)absPropertyType
{
  return 0;
}

- (uint64_t)convertABSValue:()ABSExtentions toCNValue:error:
{
  v6 = objc_msgSend(a1, "CNValueFromABSValue:");
  [a1 assertValueType:v6];
  id v7 = v6;
  *a4 = v7;

  return 1;
}

- (uint64_t)ABSValueFromCNValue:()ABSExtentions
{
  return a3;
}

- (id)CNValueFromABSValue:()ABSExtentions
{
  return a3;
}

@end