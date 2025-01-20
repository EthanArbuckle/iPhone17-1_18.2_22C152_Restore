@interface BCUIMappedImageCache
+ (id)sharedCache;
@end

@implementation BCUIMappedImageCache

+ (id)sharedCache
{
  if (sharedCache___once[0] != -1) {
    dispatch_once(sharedCache___once, &__block_literal_global_0);
  }
  v2 = (void *)sharedCache___cache;

  return v2;
}

uint64_t __35__BCUIMappedImageCache_sharedCache__block_invoke()
{
  v0 = [[BCUIMappedImageCache alloc] initWithUniqueIdentifier:@"BCUIMappedImageCache"];
  v1 = (void *)sharedCache___cache;
  sharedCache___cache = (uint64_t)v0;

  v2 = (void *)sharedCache___cache;

  return [v2 removeAllImagesWithCompletion:0];
}

@end