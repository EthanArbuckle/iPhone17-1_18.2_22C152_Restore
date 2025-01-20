@interface CFBinaryPlistCreateObjectFiltered
@end

@implementation CFBinaryPlistCreateObjectFiltered

BOOL ____CFBinaryPlistCreateObjectFiltered_block_invoke(uint64_t a1, int8x16_t *a2, CFIndex a3)
{
  v4 = *(void **)(a1 + 32);
  if (v4) {
    void *v4 = 7;
  }
  if (!*(void *)(a1 + 40)) {
    return 1;
  }
  uint64_t v5 = *(void *)(a1 + 48);
  CFAllocatorRef v6 = *(const __CFAllocator **)(a1 + 64);
  if (v5 != 2 && *(void *)(a1 + 56) >> 31 == 0)
  {
    CFStringRef v12 = CFStringCreateWithBytes(v6, (const UInt8 *)a2, a3, 0x600u, 0);
    CFStringRef v9 = v12;
    if (v12)
    {
      if (*(void *)(a1 + 72))
      {
        if (malloc_size(v12))
        {
          uint64_t v13 = __NSCreateBPlistMappedString();
          if (v13)
          {
            CFStringRef v14 = (const __CFString *)v13;
            CFRelease(v9);
            CFStringRef v9 = v14;
          }
        }
      }
      v15 = *(__CFDictionary **)(a1 + 88);
      if (v15) {
        CFDictionarySetValue(v15, *(const void **)(a1 + 96), v9);
      }
    }
  }
  else
  {
    CFStringRef v8 = (const __CFString *)_CFStringCreateWithBytesNoCopyDisallowROM((__objc2_class **)v6, a2, a3, 1536, 0, &__kCFAllocatorNull);
    CFStringRef v9 = v8;
    if (v5 == 2)
    {
      if (v8)
      {
        CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(*(CFAllocatorRef *)(a1 + 64), 0, v8);
        CFRelease(v9);
        CFStringRef v9 = MutableCopy;
      }
    }
  }
  **(void **)(a1 + 40) = v9;
  return v9 != 0;
}

BOOL ____CFBinaryPlistCreateObjectFiltered_block_invoke_2(uint64_t a1, int8x16_t *a2, CFIndex a3)
{
  v4 = *(void **)(a1 + 32);
  if (v4) {
    void *v4 = 7;
  }
  if (!*(void *)(a1 + 40)) {
    return 1;
  }
  if (a3)
  {
    if (a3 < 0) {
      return 0;
    }
    a3 *= 2;
  }
  uint64_t v5 = *(void *)(a1 + 48);
  CFAllocatorRef v6 = *(const __CFAllocator **)(a1 + 64);
  if (v5 != 2 && *(void *)(a1 + 56) >> 31 == 0)
  {
    CFStringRef v12 = CFStringCreateWithBytes(v6, (const UInt8 *)a2, a3, 0x10000100u, 0);
    CFStringRef v9 = v12;
    if (v12)
    {
      if (*(void *)(a1 + 72))
      {
        if (malloc_size(v12))
        {
          uint64_t v13 = __NSCreateBPlistMappedString();
          if (v13)
          {
            CFStringRef v14 = (const __CFString *)v13;
            CFRelease(v9);
            CFStringRef v9 = v14;
          }
        }
      }
      v15 = *(__CFDictionary **)(a1 + 88);
      if (v15) {
        CFDictionarySetValue(v15, *(const void **)(a1 + 96), v9);
      }
    }
  }
  else
  {
    CFStringRef v8 = (const __CFString *)_CFStringCreateWithBytesNoCopyDisallowROM((__objc2_class **)v6, a2, a3, 268435712, 0, &__kCFAllocatorNull);
    CFStringRef v9 = v8;
    if (v5 == 2)
    {
      if (v8)
      {
        CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(*(CFAllocatorRef *)(a1 + 64), 0, v8);
        CFRelease(v9);
        CFStringRef v9 = MutableCopy;
      }
    }
  }
  **(void **)(a1 + 40) = v9;
  return v9 != 0;
}

@end