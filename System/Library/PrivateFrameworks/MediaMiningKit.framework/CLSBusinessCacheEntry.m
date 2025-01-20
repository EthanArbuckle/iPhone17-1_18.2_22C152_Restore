@interface CLSBusinessCacheEntry
+ (NSString)entityName;
@end

@implementation CLSBusinessCacheEntry

+ (NSString)entityName
{
  return (NSString *)@"Entry";
}

@end