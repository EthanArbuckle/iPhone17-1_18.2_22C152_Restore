@interface MLSNFrameworkHandle
@end

@implementation MLSNFrameworkHandle

void __36___MLSNFrameworkHandle_sharedHandle__block_invoke()
{
  v0 = objc_alloc_init(_MLSNFrameworkHandle);
  v1 = (void *)sharedHandle_singleton;
  sharedHandle_singleton = (uint64_t)v0;
}

@end