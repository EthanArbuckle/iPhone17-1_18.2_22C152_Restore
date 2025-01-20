@interface CGImageMetadataGetTagMatchingImageProperty
@end

@implementation CGImageMetadataGetTagMatchingImageProperty

CFDictionaryRef __CGImageMetadataGetTagMatchingImageProperty_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  CFDictionaryRef result = (const __CFDictionary *)CFStringCompare(*(CFStringRef *)(a1 + 40), **(CFStringRef **)a2, 0);
  if (!result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFStringCompare(*(CFStringRef *)(a1 + 48), **(CFStringRef **)(a2 + 8), 0);
    if (!result)
    {
      uint64_t v7 = *(void *)(a1 + 56);
      if (v7)
      {
        CFDictionaryRef result = *(const __CFDictionary **)(v7 + 24);
        if (result)
        {
          uint64_t v8 = **(void **)(a2 + 24);
          key[1] = **(void **)(a2 + 32);
          key[2] = 0;
          key[0] = v8;
          CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, key);
        }
      }
      else
      {
        CFDictionaryRef result = 0;
      }
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
      *a3 = 1;
    }
  }
  return result;
}

@end