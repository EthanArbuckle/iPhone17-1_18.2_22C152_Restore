@interface CNPhoneNumbersDescription
@end

@implementation CNPhoneNumbersDescription

uint64_t __83__CNPhoneNumbersDescription_ABSExtentions__CNLabeledValueFromABSMultiValueTranform__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263EFEB28] phoneNumberWithStringValue:a2];
}

uint64_t __96__CNPhoneNumbersDescription_ABSExtentions__ABSMultiValueLabeledValueFromCNLabeledValueTransform__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

@end