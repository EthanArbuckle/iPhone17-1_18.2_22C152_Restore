@interface GEOSearchRequest
- (Class)responseClass;
@end

@implementation GEOSearchRequest

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

@end