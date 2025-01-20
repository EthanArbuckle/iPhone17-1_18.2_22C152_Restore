@interface CachePathForIcon
@end

@implementation CachePathForIcon

uint64_t ___CachePathForIcon_block_invoke(uint64_t a1)
{
  return +[BPSIconCachePrivacyHelper setCachePath:*(void *)(a1 + 32)];
}

@end