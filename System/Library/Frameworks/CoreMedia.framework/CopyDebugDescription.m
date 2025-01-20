@interface CopyDebugDescription
@end

@implementation CopyDebugDescription

CFIndex __brokeredPlugin_CopyDebugDescription_block_invoke(uint64_t a1)
{
  CFIndex result = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 40) + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFIndex __plugin_CopyDebugDescription_block_invoke(uint64_t a1)
{
  CFIndex result = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 40) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFIndex __plugin_CopyDebugDescription_block_invoke_2(void *a1)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = CFArrayGetCount(*(CFArrayRef *)(a1[6] + 72));
  CFIndex result = CFArrayGetCount(*(CFArrayRef *)(a1[6] + 80));
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

CFDictionaryRef __endpointCentricPlugin_CopyDebugDescription_block_invoke(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator(*(CFTypeRef *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFDictionaryCreateCopy(v2, *(CFDictionaryRef *)(*(void *)(a1 + 56) + 80));
  CFAllocatorRef v3 = CFGetAllocator(*(CFTypeRef *)(a1 + 48));
  CFDictionaryRef result = CFDictionaryCreateCopy(v3, *(CFDictionaryRef *)(*(void *)(a1 + 56) + 72));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end