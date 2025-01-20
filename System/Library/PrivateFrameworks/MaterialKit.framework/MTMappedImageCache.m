@interface MTMappedImageCache
+ (id)sharedCache;
@end

@implementation MTMappedImageCache

+ (id)sharedCache
{
  if (sharedCache___once != -1) {
    dispatch_once(&sharedCache___once, &__block_literal_global_5);
  }
  v2 = (void *)sharedCache___cache;

  return v2;
}

uint64_t __33__MTMappedImageCache_sharedCache__block_invoke()
{
  v0 = [MTMappedImageCache alloc];
  v1 = (void *)MEMORY[0x263F29D48];
  v2 = objc_alloc_init(_MTClientDemarcatedCurrentContainerPathProvider);
  v3 = [v1 optionsWithContainerPathProvider:v2];
  uint64_t v4 = [(MTMappedImageCache *)v0 initWithUniqueIdentifier:@"MTMappedImageCache" options:v3];
  v5 = (void *)sharedCache___cache;
  sharedCache___cache = v4;

  v6 = (void *)sharedCache___cache;

  return [v6 removeAllImagesWithCompletion:0];
}

@end