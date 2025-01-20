@interface CopyDebugDescription
@end

@implementation CopyDebugDescription

void __carEndpoint_CopyDebugDescription_block_invoke(void *a1)
{
  CFStringAppendFormat(*(CFMutableStringRef *)(*(void *)(a1[4] + 8) + 24), 0, @"<APEndpointCarPlay %p>\n", a1[6]);
  v2 = (const void *)a1[6];
  CFAllocatorRef v3 = CFGetAllocator(v2);
  carEndpoint_copyShowInfoDictionary((uint64_t)v2, v3, (__CFDictionary **)(*(void *)(a1[5] + 8) + 24));
  ASPrintF();
  size_t v4 = strlen(0);
  if (v4 && *(unsigned char *)(v4 - 1) == 10) {
    *(unsigned char *)(v4 - 1) = 0;
  }
  CFStringAppendFormat(*(CFMutableStringRef *)(*(void *)(a1[4] + 8) + 24), 0, @"%s", 0);
  free(0);
}

@end