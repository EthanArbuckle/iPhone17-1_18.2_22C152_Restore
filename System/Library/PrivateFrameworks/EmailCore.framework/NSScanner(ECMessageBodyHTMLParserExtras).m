@interface NSScanner(ECMessageBodyHTMLParserExtras)
- (BOOL)ec_scanUpToRegularExpression:()ECMessageBodyHTMLParserExtras;
- (uint64_t)_rangeOfFirstMatchWithRegularExpression:()ECMessageBodyHTMLParserExtras;
@end

@implementation NSScanner(ECMessageBodyHTMLParserExtras)

- (uint64_t)_rangeOfFirstMatchWithRegularExpression:()ECMessageBodyHTMLParserExtras
{
  v5 = (void *)[a1 string];
  uint64_t v6 = [a1 scanLocation];
  uint64_t v7 = [v5 length] - v6;
  return objc_msgSend(a3, "rangeOfFirstMatchInString:options:range:", v5, 0, v6, v7);
}

- (BOOL)ec_scanUpToRegularExpression:()ECMessageBodyHTMLParserExtras
{
  uint64_t v2 = objc_msgSend(a1, "_rangeOfFirstMatchWithRegularExpression:");
  if (v2 != 0x7FFFFFFFFFFFFFFFLL) {
    [a1 setScanLocation:v2];
  }
  return v2 != 0x7FFFFFFFFFFFFFFFLL;
}

@end