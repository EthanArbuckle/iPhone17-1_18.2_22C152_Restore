@interface GetPropertyDataSize
@end

@implementation GetPropertyDataSize

CFIndex __brokeredPlugin_GetPropertyDataSize_block_invoke(uint64_t a1)
{
  CFIndex result = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 40) + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFIndex __plugin_GetPropertyDataSize_block_invoke(uint64_t a1)
{
  CFIndex result = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 40) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFIndex __endpointCentricPlugin_GetPropertyDataSize_block_invoke(uint64_t a1)
{
  CFIndex result = CFDictionaryGetCount(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 72));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 4 * result;
  return result;
}

@end