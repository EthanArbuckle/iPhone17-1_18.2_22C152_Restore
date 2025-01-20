@interface CLSNatureCache
+ (id)defaultCacheName;
@end

@implementation CLSNatureCache

+ (id)defaultCacheName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"CLSBusinessCategoryCache", @"Nature"];
}

@end