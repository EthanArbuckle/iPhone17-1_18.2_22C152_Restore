@interface MLNLPFrameworkHandle
@end

@implementation MLNLPFrameworkHandle

void __37___MLNLPFrameworkHandle_sharedHandle__block_invoke()
{
  v0 = objc_alloc_init(_MLNLPFrameworkHandle);
  v1 = (void *)sharedHandle_singleton_22994;
  sharedHandle_singleton_22994 = (uint64_t)v0;
}

@end