@interface SetHIDInputMode
@end

@implementation SetHIDInputMode

void __carEndpoint_SetHIDInputMode_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 272);
  if (v2)
  {
    if (APHIDClientSetInputModeForUUID(v2, *(const void **)(a1 + 40), *(const void **)(a1 + 48))
      || (Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540])) == 0)
    {
      APSLogErrorAt();
    }
    else
    {
      v4 = Mutable;
      CFDictionarySetValue(Mutable, @"uuid", *(const void **)(a1 + 40));
      CFDictionarySetValue(v4, @"hidInputMode", *(const void **)(a1 + 48));
      if (carEndpoint_sendCommandInternal(*(const void **)(a1 + 56), @"hidSetInputMode", v4, 0, 0))APSLogErrorAt(); {
      CFRelease(v4);
      }
    }
  }
  v5 = *(const void **)(a1 + 40);
  if (v5) {
    CFRelease(v5);
  }
  v6 = *(const void **)(a1 + 48);
  if (v6) {
    CFRelease(v6);
  }
  v7 = *(const void **)(a1 + 56);
  CFRelease(v7);
}

@end