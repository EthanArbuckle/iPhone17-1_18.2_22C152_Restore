@interface APConnectivityHelperHandleDynamicStoreNetworkEntityValueChange
@end

@implementation APConnectivityHelperHandleDynamicStoreNetworkEntityValueChange

void ___APConnectivityHelperHandleDynamicStoreNetworkEntityValueChange_block_invoke(uint64_t a1, const __CFString *a2)
{
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, a2, @"/");
  if (CFArrayGetCount(ArrayBySeparatingStrings) >= 2)
  {
    CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
    CFArrayGetValueAtIndex(ArrayBySeparatingStrings, Count - 1);
    CFIndex v4 = CFArrayGetCount(ArrayBySeparatingStrings);
    CFArrayGetValueAtIndex(ArrayBySeparatingStrings, v4 - 2);
    CFDictionaryApplyBlock();
  }
  if (ArrayBySeparatingStrings) {
    CFRelease(ArrayBySeparatingStrings);
  }
}

CFIndex ___APConnectivityHelperHandleDynamicStoreNetworkEntityValueChange_block_invoke_2(void *a1, CFStringRef theString, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  CFIndex result = CFStringFind(theString, (CFStringRef)a1[4], 0xCuLL).location;
  if (result != -1)
  {
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    uint64_t v7 = a1[7];
    uint64_t v8 = a1[8];
    return a3(v5, v6, v7, v8);
  }
  return result;
}

@end