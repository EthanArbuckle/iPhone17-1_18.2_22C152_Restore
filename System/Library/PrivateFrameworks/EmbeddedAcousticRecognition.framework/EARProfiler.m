@interface EARProfiler
@end

@implementation EARProfiler

void __30___EARProfiler_sharedProfiler__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[_EARProfiler sharedProfiler]::sharedProfiler;
  +[_EARProfiler sharedProfiler]::sharedProfiler = (uint64_t)v1;
}

@end