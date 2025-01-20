@interface NSString(DAVExtensions)
- (__CFString)stringByURLUnquoting;
- (id)stringByURLQuoting;
- (id)stringByURLQuotingPaths;
- (id)stringByXMLUnquoting;
@end

@implementation NSString(DAVExtensions)

- (id)stringByXMLUnquoting
{
  v1 = (void *)[a1 mutableCopy];
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&amp;",
    @"&",
    0,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&lt;",
    @"<",
    0,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&gt;",
    @">",
    0,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&quot;",
    @"\"",
    0,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&apos;",
    @"'",
    0,
    0,
    [v1 length]);
  v2 = (void *)[v1 copy];

  return v2;
}

- (id)stringByURLQuotingPaths
{
  if (stringByURLQuotingPaths_onceToken != -1) {
    dispatch_once(&stringByURLQuotingPaths_onceToken, &__block_literal_global_1);
  }
  uint64_t v2 = [a1 stringByAddingPercentEncodingWithAllowedCharacters:stringByURLQuotingPaths_allowedCharacterSet];
  v3 = (void *)v2;
  if (v2) {
    v4 = (void *)v2;
  }
  else {
    v4 = a1;
  }
  id v5 = v4;

  return v5;
}

- (id)stringByURLQuoting
{
  if (stringByURLQuoting_onceToken != -1) {
    dispatch_once(&stringByURLQuoting_onceToken, &__block_literal_global_39);
  }
  uint64_t v2 = [a1 stringByAddingPercentEncodingWithAllowedCharacters:stringByURLQuoting_allowedCharacterSet];
  v3 = (void *)v2;
  if (v2) {
    v4 = (void *)v2;
  }
  else {
    v4 = a1;
  }
  id v5 = v4;

  return v5;
}

- (__CFString)stringByURLUnquoting
{
  uint64_t v2 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, originalString, &stru_26C4CD4C0);
  if (!v2) {
    uint64_t v2 = originalString;
  }
  return v2;
}

@end