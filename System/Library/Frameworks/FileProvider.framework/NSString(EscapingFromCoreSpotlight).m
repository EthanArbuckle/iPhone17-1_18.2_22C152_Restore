@interface NSString(EscapingFromCoreSpotlight)
- (id)_fp_escapedStringForSearchQuery;
@end

@implementation NSString(EscapingFromCoreSpotlight)

- (id)_fp_escapedStringForSearchQuery
{
  v1 = [a1 decomposedStringWithCanonicalMapping];
  v2 = (void *)[v1 mutableCopy];

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\\", @"\\\\", 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\", @"\\\", 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"'", @"\\'", 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"*", @"\\*", 0, 0, objc_msgSend(v2, "length"));

  return v2;
}

@end