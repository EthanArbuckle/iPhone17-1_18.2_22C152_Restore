@interface AddCryptorToJar
@end

@implementation AddCryptorToJar

void __audioHoseManagerBuffered_AddCryptorToJar_block_invoke(uint64_t a1)
{
  if (!CFDictionaryContainsKey(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 448), *(const void **)(a1 + 48))
    && (CMNotificationCenterGetDefaultLocalCenter(),
        (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigNotificationCenterAddWeakListener()) != 0))
  {
    APSLogErrorAt();
  }
  else
  {
    v2 = *(const void **)(a1 + 48);
    v3 = *(__CFDictionary **)(*(void *)(a1 + 40) + 448);
    v4 = *(const void **)(a1 + 64);
    CFDictionarySetValue(v3, v2, v4);
  }
}

@end