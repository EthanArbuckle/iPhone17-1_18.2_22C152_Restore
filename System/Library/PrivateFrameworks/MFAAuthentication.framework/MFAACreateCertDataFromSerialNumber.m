@interface MFAACreateCertDataFromSerialNumber
@end

@implementation MFAACreateCertDataFromSerialNumber

CFArrayRef __MFAACreateCertDataFromSerialNumber_block_invoke(uint64_t a1)
{
  CFArrayRef result = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 40), *(const void **)(a1 + 48));
  if (result)
  {
    CFArrayRef v3 = result;
    CFArrayRef result = (const __CFArray *)CFArrayGetCount(result);
    if (result == (const __CFArray *)2)
    {
      CFArrayRef result = (const __CFArray *)CFArrayGetValueAtIndex(v3, 1);
      if (result)
      {
        CFArrayRef result = (const __CFArray *)CFRetain(result);
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
      }
    }
  }
  return result;
}

@end