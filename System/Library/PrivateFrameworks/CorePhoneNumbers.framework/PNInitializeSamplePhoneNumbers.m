@interface PNInitializeSamplePhoneNumbers
@end

@implementation PNInitializeSamplePhoneNumbers

void ___PNInitializeSamplePhoneNumbers_block_invoke()
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  sSamplePhoneNumbers = (uint64_t)Mutable;
  CFDictionarySetValue(Mutable, @"us", @"14085551212");
}

@end