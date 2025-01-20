@interface CFCopyResolvedFormatStringWithConfiguration
@end

@implementation CFCopyResolvedFormatStringWithConfiguration

const void *___CFCopyResolvedFormatStringWithConfiguration_block_invoke(uint64_t a1, CFDictionaryRef theDict, UniChar a3)
{
  v15[1] = *(void *)off_1ECE0A5B0;
  CFIndex Count = CFDictionaryGetCount(theDict);
  uint64_t v7 = Count;
  unint64_t v8 = (8 * Count + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = (const void **)((char *)v15 - v8);
  if ((unint64_t)(8 * Count) >= 0x200) {
    size_t v10 = 512;
  }
  else {
    size_t v10 = 8 * Count;
  }
  bzero((char *)v15 - v8, v10);
  v11 = (char *)v15 - v8;
  bzero(v11, v10);
  CFDictionaryGetKeysAndValues(theDict, v9, (const void **)v11);
  if (v7 < 1) {
    return CFDictionaryGetValue(theDict, @"default");
  }
  while (1)
  {
    v12 = *v9;
    if (CFStringCompare((CFStringRef)*v9, @"default", 0))
    {
      CFCharacterSetRef Value = (const __CFCharacterSet *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), v12);
      if (CFCharacterSetIsCharacterMember(Value, a3)) {
        break;
      }
    }
    v11 += 8;
    ++v9;
    if (!--v7) {
      return CFDictionaryGetValue(theDict, @"default");
    }
  }
  return *(const void **)v11;
}

Class ___CFCopyResolvedFormatStringWithConfiguration_block_invoke_2()
{
  __NSPersonNameComponentsClass = (uint64_t)objc_lookUpClass("NSPersonNameComponents");
  Class result = objc_lookUpClass("NSPersonNameComponentsFormatter");
  __NSPersonNameComponentsFormatterClass = (uint64_t)result;
  return result;
}

id ___CFCopyResolvedFormatStringWithConfiguration_block_invoke_3()
{
  id result = objc_alloc_init((Class)__NSPersonNameComponentsFormatterClass);
  _CFCopyResolvedFormatStringWithConfiguration_formatter = (uint64_t)result;
  return result;
}

@end