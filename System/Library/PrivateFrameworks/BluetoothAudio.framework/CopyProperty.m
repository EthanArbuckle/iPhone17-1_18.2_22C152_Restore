@interface CopyProperty
@end

@implementation CopyProperty

void *__endpoint_CopyProperty_block_invoke(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(*(void *)(a1 + 32) + 64);
  if (v2)
  {
    result = CFDictionaryCreateCopy(*(CFAllocatorRef *)(a1 + 48), v2);
  }
  else
  {
    Empty = (const void *)CFDictionaryGetEmpty();
    result = (void *)CFRetain(Empty);
  }
  **(void **)(a1 + 40) = result;
  return result;
}

CFTypeRef __audioStream_CopyProperty_block_invoke(uint64_t a1)
{
  if (CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)*MEMORY[0x263F01588]))
  {
    CFDictionaryRef v2 = (const void **)MEMORY[0x263F01598];
LABEL_5:
    v3 = *v2;
LABEL_6:
    CFTypeRef result = CFRetain(v3);
    **(void **)(a1 + 48) = result;
    return result;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)*MEMORY[0x263F01580]))
  {
    CFDictionaryRef v2 = (const void **)MEMORY[0x263F01590];
    goto LABEL_5;
  }
  CFTypeRef result = (CFTypeRef)CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)*MEMORY[0x263F01578]);
  if (result)
  {
    v3 = *(const void **)(*(void *)(a1 + 56) + 24);
    goto LABEL_6;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -12784;
  return result;
}

@end