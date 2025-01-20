@interface NSURLResponse
- (NSDictionary)bl_allHeaderFields;
- (int64_t)bl_statusCode;
@end

@implementation NSURLResponse

- (int64_t)bl_statusCode
{
  return 200;
}

- (NSDictionary)bl_allHeaderFields
{
  return +[NSDictionary dictionary];
}

@end