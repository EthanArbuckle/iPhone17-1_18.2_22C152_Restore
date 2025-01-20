@interface CNInstantMessageAddressesDescription(ABSExtentions)
- (BOOL)absPropertyID:()ABSExtentions;
- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform;
- (id)CNLabeledValueFromABSMultiValueTranform;
- (uint64_t)absPropertyType;
@end

@implementation CNInstantMessageAddressesDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3) {
    *a3 = 13;
  }
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 261;
}

- (id)CNLabeledValueFromABSMultiValueTranform
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = +[ABSConstantsMapping ABToCNLabelConstantsMapping];
  v8[0] = @"username";
  v8[1] = @"service";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  uint64_t v4 = objc_opt_class();
  v5 = +[ABSConstantsMapping ABToCNPersonInstantMessageConstantsMapping];
  v6 = [a1 dictionaryBasedMultiValueTransformWithLabelMapping:v2 inputKeys:v3 destinationClass:v4 valueMapping:v5];

  return v6;
}

- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform
{
  v9[2] = *MEMORY[0x263EF8340];
  v2 = +[ABSConstantsMapping CNToABLabelConstantsMapping];
  uint64_t v3 = *MEMORY[0x263EFE1C8];
  v9[0] = *MEMORY[0x263EFE1D0];
  v9[1] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  uint64_t v5 = objc_opt_class();
  v6 = +[ABSConstantsMapping CNToABPersonInstantMessageConstantsMapping];
  v7 = [a1 dictionaryBasedMultiValueTransformWithLabelMapping:v2 inputKeys:v4 destinationClass:v5 valueMapping:v6];

  return v7;
}

@end