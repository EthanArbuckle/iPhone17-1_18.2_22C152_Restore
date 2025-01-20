@interface CLSLocationCacheEntry
+ (NSString)entityName;
@end

@implementation CLSLocationCacheEntry

+ (NSString)entityName
{
  return (NSString *)@"Entry";
}

@end