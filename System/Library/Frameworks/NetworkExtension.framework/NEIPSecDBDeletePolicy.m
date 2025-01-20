@interface NEIPSecDBDeletePolicy
@end

@implementation NEIPSecDBDeletePolicy

CFDictionaryRef __NEIPSecDBDeletePolicy_block_invoke(uint64_t a1)
{
  CFDictionaryRef result = *(const __CFDictionary **)(*(void *)(a1 + 48) + 88);
  if (result)
  {
    v3 = NEGetValueFromIntKeyedDictionary(result, *(_DWORD *)(a1 + 56));
    if (v3) {
      v3 = CFRetain(v3);
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
    CFDictionaryRef result = (const __CFDictionary *)NEIPSecDBCreateQueuedRequest(*(void *)(a1 + 48), 22, *(_DWORD *)(a1 + 56));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

@end