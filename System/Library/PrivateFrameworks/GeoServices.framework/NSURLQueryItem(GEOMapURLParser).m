@interface NSURLQueryItem(GEOMapURLParser)
- (id)_geo_unescapedValue;
@end

@implementation NSURLQueryItem(GEOMapURLParser)

- (id)_geo_unescapedValue
{
  v1 = [a1 value];
  v2 = [v1 stringByReplacingOccurrencesOfString:@"+" withString:@" "];

  return v2;
}

@end