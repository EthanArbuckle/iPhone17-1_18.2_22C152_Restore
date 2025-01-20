@interface NSString(CRXUExtensions)
- (BOOL)crxu_matchesPattern:()CRXUExtensions;
- (id)crxu_stringByRemovingPattern:()CRXUExtensions;
- (id)crxu_stringByTrimmingWhitespace;
- (uint64_t)locationOfPattern:()CRXUExtensions;
@end

@implementation NSString(CRXUExtensions)

- (id)crxu_stringByRemovingPattern:()CRXUExtensions
{
  uint64_t v2 = objc_msgSend(a1, "locationOfPattern:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = a1;
  }
  else
  {
    objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v2, v3, &stru_26FECA190);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)crxu_matchesPattern:()CRXUExtensions
{
  return !objc_msgSend(a1, "locationOfPattern:") && v2 == objc_msgSend(a1, "length");
}

- (uint64_t)locationOfPattern:()CRXUExtensions
{
  id v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:a3 options:0 error:0];
  uint64_t v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));

  return v5;
}

- (id)crxu_stringByTrimmingWhitespace
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [a1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

@end