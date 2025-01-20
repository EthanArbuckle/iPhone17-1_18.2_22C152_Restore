@interface CNMultiValuePropertyDescription(ABSExtentions)
- (CFTypeRef)ABSValueFromCNValue:()ABSExtentions;
- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform;
- (id)CNLabeledValueFromABSMultiValueTranform;
- (id)CNValueFromABSValue:()ABSExtentions;
- (id)dictionaryBasedMultiValueTransformWithLabelMapping:()ABSExtentions inputKeys:destinationClass:valueMapping:;
- (id)multiValueTransformWithLabelMapping:()ABSExtentions valueTransform:;
- (uint64_t)isABSLabeledValueValue:()ABSExtentions equalToValue:;
- (uint64_t)passThroughMultivalueTransformWithLabelMapping:()ABSExtentions;
@end

@implementation CNMultiValuePropertyDescription(ABSExtentions)

- (CFTypeRef)ABSValueFromCNValue:()ABSExtentions
{
  id v4 = a3;
  ABPropertyID property = -1;
  if ([a1 absPropertyID:&property])
  {
    uint64_t TypeOfProperty = ABPersonGetTypeOfProperty(property);
    id v6 = v4;
    v7 = [a1 ABSMultiValueLabeledValueFromCNLabeledValueTransform];
    v8 = objc_msgSend(v6, "_cn_map:", v7);
    v9 = (void *)[v8 mutableCopy];

    v10 = [[ABSMultiValue alloc] initWithPropertyType:TypeOfProperty mutable:0 values:v9];
    if (v10) {
      CFTypeRef v11 = CFAutorelease(v10);
    }
    else {
      CFTypeRef v11 = 0;
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"AddressBookInvalidPropertyIDException", @"%@ didn't return a absPropertyID", a1 format];
    CFTypeRef v11 = (CFTypeRef)*MEMORY[0x263EFFD08];
  }

  return v11;
}

- (id)CNValueFromABSValue:()ABSExtentions
{
  id v4 = [a3 values];
  v5 = [a1 CNLabeledValueFromABSMultiValueTranform];
  id v6 = objc_msgSend(v4, "_cn_map:", v5);

  return v6;
}

- (id)CNLabeledValueFromABSMultiValueTranform
{
  v2 = +[ABSConstantsMapping ABToCNLabelConstantsMapping];
  v3 = [a1 passThroughMultivalueTransformWithLabelMapping:v2];

  return v3;
}

- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform
{
  v2 = +[ABSConstantsMapping CNToABLabelConstantsMapping];
  v3 = [a1 passThroughMultivalueTransformWithLabelMapping:v2];

  return v3;
}

- (id)multiValueTransformWithLabelMapping:()ABSExtentions valueTransform:
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __101__CNMultiValuePropertyDescription_ABSExtentions__multiValueTransformWithLabelMapping_valueTransform___block_invoke;
  v11[3] = &unk_264223CF0;
  id v12 = v5;
  id v13 = v6;
  id v7 = v5;
  id v8 = v6;
  v9 = (void *)[v11 copy];

  return v9;
}

- (id)dictionaryBasedMultiValueTransformWithLabelMapping:()ABSExtentions inputKeys:destinationClass:valueMapping:
{
  id v10 = a4;
  id v11 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __141__CNMultiValuePropertyDescription_ABSExtentions__dictionaryBasedMultiValueTransformWithLabelMapping_inputKeys_destinationClass_valueMapping___block_invoke;
  v16[3] = &unk_264223D18;
  id v18 = v11;
  uint64_t v19 = a5;
  id v17 = v10;
  id v12 = v11;
  id v13 = v10;
  v14 = [a1 multiValueTransformWithLabelMapping:a3 valueTransform:v16];

  return v14;
}

- (uint64_t)passThroughMultivalueTransformWithLabelMapping:()ABSExtentions
{
  return [a1 multiValueTransformWithLabelMapping:a3 valueTransform:0];
}

- (uint64_t)isABSLabeledValueValue:()ABSExtentions equalToValue:
{
  if (a3 | a4) {
    return [(id)a3 isEqual:a4];
  }
  else {
    return 1;
  }
}

@end