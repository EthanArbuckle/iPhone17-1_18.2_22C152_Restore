@interface HKGraphTileDelayedRendererReleaseManager
@end

@implementation HKGraphTileDelayedRendererReleaseManager

uint64_t __54___HKGraphTileDelayedRendererReleaseManager_singleton__block_invoke(uint64_t a1)
{
  singleton_singletonDelayedRendererReleaseManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

@end