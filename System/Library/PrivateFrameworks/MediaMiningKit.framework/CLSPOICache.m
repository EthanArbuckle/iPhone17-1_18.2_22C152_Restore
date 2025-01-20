@interface CLSPOICache
+ (id)defaultCacheName;
@end

@implementation CLSPOICache

+ (id)defaultCacheName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"CLSBusinessCategoryCache", @"POI"];
}

@end