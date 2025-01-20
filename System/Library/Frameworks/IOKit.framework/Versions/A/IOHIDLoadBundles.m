@interface IOHIDLoadBundles
@end

@implementation IOHIDLoadBundles

CFMutableDictionaryRef ___IOHIDLoadBundles_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4[0] = xmmword_1E548B3F8;
  v4[1] = *(_OWORD *)off_1E548B408;
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFArrayRef v1 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)v4, 4, MEMORY[0x1E4F1D510]);
  __hidPlugInBundles = (uint64_t)__IOHIDPlugInLoadBundles(v1);
  CFRelease(v1);
  CFMutableDictionaryRef result = (CFMutableDictionaryRef)__hidPlugInBundles;
  if (__hidPlugInBundles)
  {
    int Count = CFArrayGetCount((CFArrayRef)__hidPlugInBundles);
    CFMutableDictionaryRef result = CFDictionaryCreateMutable(v0, Count, MEMORY[0x1E4F1D530], 0);
    __hidPlugInInstanceCache = (uint64_t)result;
  }
  return result;
}

@end