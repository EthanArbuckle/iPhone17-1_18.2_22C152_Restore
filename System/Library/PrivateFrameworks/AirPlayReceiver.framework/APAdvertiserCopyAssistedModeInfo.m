@interface APAdvertiserCopyAssistedModeInfo
@end

@implementation APAdvertiserCopyAssistedModeInfo

uint64_t ___APAdvertiserCopyAssistedModeInfo_block_invoke(uint64_t a1)
{
  _APAdvertiserEnsureAssistedModeInfoCreated(*(void *)(a1 + 32), 0);
  if (*MEMORY[0x263EFFB40]) {
    v2 = (const void *)*MEMORY[0x263EFFB40];
  }
  else {
    v2 = (const void *)*MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), @"AssistedOverAWDL", v2);
  CFDictionarySetCString();
  CFDictionarySetCString();

  return CFDictionarySetCString();
}

@end