@interface GEODirectionsRequester
+ (void)useLocalProxy;
@end

@implementation GEODirectionsRequester

+ (void)useLocalProxy
{
  uint64_t v3 = objc_opt_class();

  [a1 useProxy:v3];
}

@end