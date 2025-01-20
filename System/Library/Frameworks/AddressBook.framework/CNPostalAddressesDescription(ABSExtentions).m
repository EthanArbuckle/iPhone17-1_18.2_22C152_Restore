@interface CNPostalAddressesDescription(ABSExtentions)
- (BOOL)absPropertyID:()ABSExtentions;
- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform;
- (id)CNLabeledValueFromABSMultiValueTranform;
- (uint64_t)absPropertyType;
@end

@implementation CNPostalAddressesDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3) {
    *a3 = 5;
  }
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 261;
}

- (id)CNLabeledValueFromABSMultiValueTranform
{
  v8[6] = *MEMORY[0x263EF8340];
  v2 = +[ABSConstantsMapping ABToCNLabelConstantsMapping];
  v8[0] = @"Street";
  v8[1] = @"City";
  v8[2] = @"State";
  v8[3] = @"ZIP";
  v8[4] = @"Country";
  v8[5] = @"CountryCode";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:6];
  uint64_t v4 = objc_opt_class();
  v5 = +[ABSConstantsMapping ABToCNPersonAddressConstantsMapping];
  v6 = [a1 dictionaryBasedMultiValueTransformWithLabelMapping:v2 inputKeys:v3 destinationClass:v4 valueMapping:v5];

  return v6;
}

- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform
{
  v11[6] = *MEMORY[0x263EF8340];
  v2 = +[ABSConstantsMapping CNToABLabelConstantsMapping];
  uint64_t v3 = *MEMORY[0x263EFE918];
  v11[0] = *MEMORY[0x263EFE950];
  v11[1] = v3;
  uint64_t v4 = *MEMORY[0x263EFE938];
  v11[2] = *MEMORY[0x263EFE948];
  v11[3] = v4;
  uint64_t v5 = *MEMORY[0x263EFE928];
  v11[4] = *MEMORY[0x263EFE920];
  v11[5] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:6];
  uint64_t v7 = objc_opt_class();
  v8 = +[ABSConstantsMapping CNToABPersonAddressConstantsMapping];
  v9 = [a1 dictionaryBasedMultiValueTransformWithLabelMapping:v2 inputKeys:v6 destinationClass:v7 valueMapping:v8];

  return v9;
}

@end