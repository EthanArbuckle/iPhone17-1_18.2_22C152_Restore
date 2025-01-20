@interface EndpointNotificationCallback
@end

@implementation EndpointNotificationCallback

void __endpointCentricPlugin_EndpointNotificationCallback_block_invoke(uint64_t a1)
{
  uint64_t v2 = CFEqual(*(CFTypeRef *)(a1 + 32), @"Endpoint_Dissociated");
  if (endpointCentricPlugin_UpdateEndpoint(*(void *)(a1 + 40), *(void *)(a1 + 48), v2))
  {
    uint64_t v3 = *(void *)(a1 + 56);
    v4 = *(NSObject **)(v3 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = __endpointCentricPlugin_EndpointNotificationCallback_block_invoke_2;
    block[3] = &__block_descriptor_tmp_17_3;
    block[4] = v3;
    dispatch_async(v4, block);
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __endpointCentricPlugin_EndpointNotificationCallback_block_invoke_2(uint64_t a1)
{
}

@end