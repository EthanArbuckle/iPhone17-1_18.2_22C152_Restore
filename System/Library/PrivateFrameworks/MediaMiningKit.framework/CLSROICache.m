@interface CLSROICache
+ (id)defaultCacheName;
@end

@implementation CLSROICache

+ (id)defaultCacheName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"CLSBusinessCategoryCache", @"ROI"];
}

@end