@interface ActivatedEndpointsChangedNotificationCallback
@end

@implementation ActivatedEndpointsChangedNotificationCallback

void __endpointCentricPlugin_ActivatedEndpointsChangedNotificationCallback_block_invoke(uint64_t a1)
{
  endpointCentricPlugin_PeruseActivatedEndpoints(*(void *)(a1 + 32));
  v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

@end