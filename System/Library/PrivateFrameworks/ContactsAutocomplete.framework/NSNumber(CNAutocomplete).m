@interface NSNumber(CNAutocomplete)
+ (uint64_t)_cnac_numberWithAutocompleteAddressType:()CNAutocomplete;
@end

@implementation NSNumber(CNAutocomplete)

+ (uint64_t)_cnac_numberWithAutocompleteAddressType:()CNAutocomplete
{
  return objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:");
}

@end