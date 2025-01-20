@interface IOHIDServiceCopyPropertiesForClient
@end

@implementation IOHIDServiceCopyPropertiesForClient

void ___IOHIDServiceCopyPropertiesForClient_block_invoke(uint64_t a1, const void *a2)
{
  v4 = (const void *)_IOHIDServiceCopyPropertyForClient(*(void *)(a1 + 32), a2, *(const void **)(a1 + 40));
  if (v4)
  {
    v5 = v4;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), a2, v4);
    CFRelease(v5);
  }
}

@end