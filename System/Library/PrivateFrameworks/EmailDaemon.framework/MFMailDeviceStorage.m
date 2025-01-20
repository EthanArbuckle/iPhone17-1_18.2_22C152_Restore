@interface MFMailDeviceStorage
- (int64_t)freeSpaceGuidanceForSpaceIncrease:(int64_t)a3 urgency:(int64_t)a4;
@end

@implementation MFMailDeviceStorage

- (int64_t)freeSpaceGuidanceForSpaceIncrease:(int64_t)a3 urgency:(int64_t)a4
{
  MFMailDirectoryURL();
  +[NSNumber numberWithLongLong:a3];
  v5 = (void *)CacheDeleteRequestCacheableSpaceGuidance();
  id v6 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_GUIDANCE"];
  if ([v6 isEqualToString:@"CACHE_DELETE_GUIDANCE_CAN_EXPAND_CACHE"])
  {
    int64_t v7 = 0;
  }
  else if ([v6 isEqualToString:@"CACHE_DELETE_GUIDANCE_WILL_EVICT_LOWER_PRIORITY"])
  {
    int64_t v7 = 1;
  }
  else if ([v6 isEqualToString:@"CACHE_DELETE_GUIDANCE_DO_NOT_EXPAND_CACHE"])
  {
    int64_t v7 = 2;
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

@end