@interface _DKBiomeStreamCache
+ (id)sharedCache;
@end

@implementation _DKBiomeStreamCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_0 != -1) {
    dispatch_once(&sharedCache_onceToken_0, &__block_literal_global_14);
  }
  v2 = (void *)sharedCache_cache;
  return v2;
}

@end