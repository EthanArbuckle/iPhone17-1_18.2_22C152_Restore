@interface IOHIDLoadServicePluginBundles
@end

@implementation IOHIDLoadServicePluginBundles

void ___IOHIDLoadServicePluginBundles_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  long long v1 = xmmword_1E548B4B8;
  v2 = @"/usr/appleinternal/lib/HIDPlugins/ServicePlugins";
  CFArrayRef v0 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&v1, 3, MEMORY[0x1E4F1D510]);
  __hidServicePluginBundles = (uint64_t)__IOHIDPlugInLoadBundles(v0);
  CFRelease(v0);
}

@end