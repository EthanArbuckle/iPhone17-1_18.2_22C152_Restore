@interface SOSCircleRemoveRetired
@end

@implementation SOSCircleRemoveRetired

CFDictionaryRef __SOSCircleRemoveRetired_block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  CFDictionaryRef result = *(const __CFDictionary **)(a2 + 16);
  if (result) {
    return (const __CFDictionary *)(CFDictionaryGetValue(result, @"RetirementDate") != 0);
  }
  return result;
}

@end