@interface CNPhoneNumbersDescription(ABSExtentions)
- (BOOL)absPropertyID:()ABSExtentions;
- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform;
- (id)CNLabeledValueFromABSMultiValueTranform;
- (uint64_t)absPropertyType;
- (uint64_t)isABSLabeledValueValue:()ABSExtentions equalToValue:;
@end

@implementation CNPhoneNumbersDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3) {
    *a3 = 3;
  }
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 257;
}

- (id)CNLabeledValueFromABSMultiValueTranform
{
  v2 = +[ABSConstantsMapping ABToCNLabelConstantsMapping];
  v3 = [a1 multiValueTransformWithLabelMapping:v2 valueTransform:&__block_literal_global_7];

  return v3;
}

- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform
{
  v2 = +[ABSConstantsMapping CNToABLabelConstantsMapping];
  v3 = [a1 multiValueTransformWithLabelMapping:v2 valueTransform:&__block_literal_global_44];

  return v3;
}

- (uint64_t)isABSLabeledValueValue:()ABSExtentions equalToValue:
{
  v5 = (void *)MEMORY[0x263EFEB28];
  id v6 = a4;
  uint64_t v7 = [v5 phoneNumberWithStringValue:a3];
  uint64_t v8 = [MEMORY[0x263EFEB28] phoneNumberWithStringValue:v6];

  if (v7 | v8) {
    uint64_t v9 = [(id)v8 isLikePhoneNumber:v7];
  }
  else {
    uint64_t v9 = 1;
  }

  return v9;
}

@end