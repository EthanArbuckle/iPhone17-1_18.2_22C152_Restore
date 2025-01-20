@interface IOHIDServiceClientCacheProperties
@end

@implementation IOHIDServiceClientCacheProperties

uint64_t ___IOHIDServiceClientCacheProperties_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  int valuePtr = 0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"DeviceUsagePage");
  if (Value && (CFNumberRef v5 = Value, v6 = CFGetTypeID(Value), v6 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
    int v7 = valuePtr;
  }
  else
  {
    int v7 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 136)
            + 8 * *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) = v7;
  int v13 = 0;
  uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, @"DeviceUsage");
  if (result
    && (CFNumberRef v9 = (const __CFNumber *)result,
        CFTypeID v10 = CFGetTypeID((CFTypeRef)result),
        uint64_t result = CFNumberGetTypeID(),
        v10 == result))
  {
    uint64_t result = CFNumberGetValue(v9, kCFNumberSInt32Type, &v13);
    int v11 = v13;
  }
  else
  {
    int v11 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 136)
            + 8 * (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))++
            + 4) = v11;
  return result;
}

@end