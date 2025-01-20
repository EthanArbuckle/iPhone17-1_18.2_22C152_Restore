@interface ICDocCamScanCache
+ (ICDocCamScanCacheItem)cachedItem;
+ (void)setCachedItem:(id)a3;
@end

@implementation ICDocCamScanCache

+ (void)setCachedItem:(id)a3
{
  id v3 = a3;
  if (sCachedItem) {
    [(id)sCachedItem deleteCacheImages];
  }
  v4 = (void *)sCachedItem;
  sCachedItem = (uint64_t)v3;
}

+ (ICDocCamScanCacheItem)cachedItem
{
  return (ICDocCamScanCacheItem *)(id)sCachedItem;
}

@end