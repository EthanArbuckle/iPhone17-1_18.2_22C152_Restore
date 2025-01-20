@interface CNContactTypeDescription(ABSExtentions)
- (BOOL)absPropertyID:()ABSExtentions;
- (id)CNValueFromABSValue:()ABSExtentions;
- (uint64_t)ABSValueFromCNValue:()ABSExtentions;
- (uint64_t)absPropertyType;
@end

@implementation CNContactTypeDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3) {
    *a3 = 15;
  }
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 2;
}

- (uint64_t)ABSValueFromCNValue:()ABSExtentions
{
  v5.receiver = a1;
  v5.super_class = (Class)&off_26C5974F8;
  id v1 = objc_msgSendSuper2(&v5, sel_ABSValueFromCNValue_);
  v2 = +[ABSConstantsMapping CNToABPersonKindConstantsMapping];
  uint64_t v3 = [v2 mappedConstant:v1];

  return v3;
}

- (id)CNValueFromABSValue:()ABSExtentions
{
  v5.receiver = a1;
  v5.super_class = (Class)&off_26C5974F8;
  id v1 = objc_msgSendSuper2(&v5, sel_CNValueFromABSValue_);
  v2 = +[ABSConstantsMapping ABToCNPersonKindConstantsMapping];
  uint64_t v3 = [v2 mappedConstant:v1];

  return v3;
}

@end