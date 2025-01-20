@interface IOHIDLoadConnectionPluginBundles
@end

@implementation IOHIDLoadConnectionPluginBundles

void ___IOHIDLoadConnectionPluginBundles_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  long long v1 = xmmword_1E548B4F0;
  CFArrayRef v0 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&v1, 2, MEMORY[0x1E4F1D510]);
  __hidConnectionPluginBundles = (uint64_t)__IOHIDPlugInLoadBundles(v0);
  CFRelease(v0);
}

@end