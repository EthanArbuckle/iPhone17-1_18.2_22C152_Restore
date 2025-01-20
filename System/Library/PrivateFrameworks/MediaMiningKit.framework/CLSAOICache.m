@interface CLSAOICache
+ (id)defaultCacheName;
@end

@implementation CLSAOICache

+ (id)defaultCacheName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"CLSBusinessCategoryCache", @"AOI"];
}

@end