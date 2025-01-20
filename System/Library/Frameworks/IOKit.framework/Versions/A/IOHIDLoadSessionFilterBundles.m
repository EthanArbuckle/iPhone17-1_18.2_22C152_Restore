@interface IOHIDLoadSessionFilterBundles
@end

@implementation IOHIDLoadSessionFilterBundles

void ___IOHIDLoadSessionFilterBundles_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = xmmword_1E548B438;
  v1[1] = *(_OWORD *)off_1E548B448;
  CFArrayRef v0 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)v1, 4, MEMORY[0x1E4F1D510]);
  __hidSessionFilterBundles = (uint64_t)__IOHIDPlugInLoadBundles(v0);
  CFRelease(v0);
}

@end