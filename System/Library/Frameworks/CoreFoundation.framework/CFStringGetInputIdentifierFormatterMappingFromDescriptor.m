@interface CFStringGetInputIdentifierFormatterMappingFromDescriptor
@end

@implementation CFStringGetInputIdentifierFormatterMappingFromDescriptor

void ___CFStringGetInputIdentifierFormatterMappingFromDescriptor_block_invoke(uint64_t a1)
{
  v22[1] = *(void *)off_1ECE0A5B0;
  CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 32));
  _CFStringGetInputIdentifierFormatterMappingFromDescriptor_localizedStringFormattingFamilyInfo = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, Count, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  unint64_t v3 = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 32));
  if (((v3 >> 59) & 0xF) != 0)
  {
    CFStringRef v18 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", 2 * v3);
    v19 = +[NSException exceptionWithName:@"NSGenericException" reason:v18 userInfo:0];
    CFRelease(v18);
    objc_exception_throw(v19);
  }
  uint64_t v5 = v3;
  if (v3) {
    uint64_t v6 = 2 * v3;
  }
  else {
    uint64_t v6 = 1;
  }
  unint64_t v7 = MEMORY[0x1F4188790](v6, v4);
  v9 = (const void **)((char *)&v20 - v8);
  v22[0] = 0;
  if (v10 >= 0x101)
  {
    v9 = (const void **)_CFCreateArrayStorage(v7, 0, v22);
    v11 = v9;
  }
  else
  {
    v11 = 0;
  }
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 32), v9, &v9[v5]);
  if (v5 >= 1)
  {
    uint64_t v12 = v5;
    do
    {
      v13 = *v9;
      CFStringRef v14 = (const __CFString *)v9[v5];
      v21 = 0;
      BOOL v15 = __CFStringCopyCharSetWithPattern(v14, &v21);
      v16 = v21;
      if (v21) {
        BOOL v17 = v15;
      }
      else {
        BOOL v17 = 0;
      }
      if (v17)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)_CFStringGetInputIdentifierFormatterMappingFromDescriptor_localizedStringFormattingFamilyInfo, v13, v21);
        CFRelease(v16);
      }
      ++v9;
      --v12;
    }
    while (v12);
  }
  free(v11);
}

@end