@interface CNSocialProfilesDescription(ABSExtentions)
- (BOOL)absPropertyID:()ABSExtentions;
- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform;
- (id)CNLabeledValueFromABSMultiValueTranform;
- (uint64_t)absPropertyType;
@end

@implementation CNSocialProfilesDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3) {
    *a3 = 46;
  }
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 261;
}

- (id)CNLabeledValueFromABSMultiValueTranform
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __85__CNSocialProfilesDescription_ABSExtentions__CNLabeledValueFromABSMultiValueTranform__block_invoke;
  v3[3] = &unk_264223DA0;
  v3[4] = a1;
  v1 = (void *)MEMORY[0x2166ACA40](v3);

  return v1;
}

- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform
{
  v10[4] = *MEMORY[0x263EF8340];
  v2 = +[ABSConstantsMapping CNToABLabelConstantsMapping];
  uint64_t v3 = *MEMORY[0x263EFE9C0];
  v10[0] = *MEMORY[0x263EFE9B0];
  v10[1] = v3;
  uint64_t v4 = *MEMORY[0x263EFE978];
  v10[2] = *MEMORY[0x263EFE9B8];
  v10[3] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
  uint64_t v6 = objc_opt_class();
  v7 = +[ABSConstantsMapping CNToABPersonSocialProfileConstantsMapping];
  v8 = [a1 dictionaryBasedMultiValueTransformWithLabelMapping:v2 inputKeys:v5 destinationClass:v6 valueMapping:v7];

  return v8;
}

@end