@interface DKBiomeStreamCache
@end

@implementation DKBiomeStreamCache

uint64_t __34___DKBiomeStreamCache_sharedCache__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F93B48]) initWithCountLimit:16];
  uint64_t v1 = sharedCache_cache;
  sharedCache_cache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end