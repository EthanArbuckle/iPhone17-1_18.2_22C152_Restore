@interface NSString(GEOTransitExtras)
- (GEOFormattedString)_geo_serverFormattedString;
@end

@implementation NSString(GEOTransitExtras)

- (GEOFormattedString)_geo_serverFormattedString
{
  v1 = [[GEOFormattedString alloc] initWithString:a1];

  return v1;
}

@end