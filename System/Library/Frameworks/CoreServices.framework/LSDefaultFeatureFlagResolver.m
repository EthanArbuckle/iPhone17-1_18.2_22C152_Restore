@interface LSDefaultFeatureFlagResolver
@end

@implementation LSDefaultFeatureFlagResolver

void __47___LSDefaultFeatureFlagResolver_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_LSDefaultFeatureFlagResolver);
  v1 = (void *)+[_LSDefaultFeatureFlagResolver sharedInstance]::resolver;
  +[_LSDefaultFeatureFlagResolver sharedInstance]::resolver = (uint64_t)v0;
}

@end