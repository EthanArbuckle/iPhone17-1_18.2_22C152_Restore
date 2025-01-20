@interface NSString(DEURLPathEscaping)
- (uint64_t)escape;
@end

@implementation NSString(DEURLPathEscaping)

- (uint64_t)escape
{
  if (escape_onceToken != -1) {
    dispatch_once(&escape_onceToken, &__block_literal_global_7);
  }
  uint64_t v2 = escape__set;
  return [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];
}

@end