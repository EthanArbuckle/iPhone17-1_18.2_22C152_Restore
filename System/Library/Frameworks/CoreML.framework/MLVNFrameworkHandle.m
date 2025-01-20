@interface MLVNFrameworkHandle
@end

@implementation MLVNFrameworkHandle

void __36___MLVNFrameworkHandle_sharedHandle__block_invoke()
{
  v0 = objc_alloc_init(_MLVNFrameworkHandle);
  v1 = (void *)sharedHandle_singleton_9643;
  sharedHandle_singleton_9643 = (uint64_t)v0;
}

@end