@interface NSString(CALIDExtensions)
- (__CFString)stringByDecodingSlashes;
- (uint64_t)stringByEncodingSlashes;
@end

@implementation NSString(CALIDExtensions)

- (uint64_t)stringByEncodingSlashes
{
  if (stringByEncodingSlashes_onceToken != -1) {
    dispatch_once(&stringByEncodingSlashes_onceToken, &__block_literal_global_0);
  }
  uint64_t v2 = stringByEncodingSlashes_allowedCharacterSet;
  return [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];
}

- (__CFString)stringByDecodingSlashes
{
  v1 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, originalString, &stru_26C4CD4C0);
  return v1;
}

@end