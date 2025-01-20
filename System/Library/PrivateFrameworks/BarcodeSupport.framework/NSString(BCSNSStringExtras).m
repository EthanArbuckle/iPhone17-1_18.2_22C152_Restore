@interface NSString(BCSNSStringExtras)
- (BOOL)_bcs_hasCaseInsensitivePrefix:()BCSNSStringExtras;
- (BOOL)_bcs_looksLikeEmailAddress;
- (__CFString)_bcs_stringWithEnclosingDoubleQuotesRemoved;
- (id)_bcs_unescapedString;
- (uint64_t)_bcs_stringForcingLeftToRightDirection;
- (uint64_t)_bcs_trimmedString;
- (uint64_t)_bcs_urlEncodedQueryValue;
@end

@implementation NSString(BCSNSStringExtras)

- (uint64_t)_bcs_trimmedString
{
  if (_bcs_trimmedString_once != -1) {
    dispatch_once(&_bcs_trimmedString_once, &__block_literal_global_6);
  }
  uint64_t v2 = _bcs_trimmedString_whitespaceCharacterSet;
  return [a1 stringByTrimmingCharactersInSet:v2];
}

- (id)_bcs_unescapedString
{
  uint64_t v2 = [a1 rangeOfString:@"\\""];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = a1;
  }
  else
  {
    unint64_t v4 = v2;
    unint64_t v5 = [a1 length];
    id v3 = [MEMORY[0x263F089D8] stringWithCapacity:v5];
    v6 = [a1 substringToIndex:v4];
    [v3 appendString:v6];

    if (v4 < v5)
    {
      int v7 = 0;
      do
      {
        unsigned int v8 = [a1 characterAtIndex:v4];
        int v9 = v7 | (v8 != 92);
        if (v9) {
          objc_msgSend(v3, "appendFormat:", @"%C", v8);
        }
        int v7 = v9 ^ 1;
        ++v4;
      }
      while (v5 != v4);
    }
  }
  return v3;
}

- (uint64_t)_bcs_urlEncodedQueryValue
{
  if (_bcs_urlEncodedQueryValue_once != -1) {
    dispatch_once(&_bcs_urlEncodedQueryValue_once, &__block_literal_global_10);
  }
  uint64_t v2 = _bcs_urlEncodedQueryValue_queryValueAllowedCharacters;
  return [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];
}

- (uint64_t)_bcs_stringForcingLeftToRightDirection
{
  return [NSString stringWithFormat:@"⁦\u202A%@\u202C⁩", a1];
}

- (__CFString)_bcs_stringWithEnclosingDoubleQuotesRemoved
{
  unint64_t v2 = [a1 length];
  unint64_t v3 = v2 - 1;
  if (v2 > 1
    && (unint64_t v4 = v2, [a1 characterAtIndex:0] == 34)
    && [a1 characterAtIndex:v3] == 34)
  {
    if (v4 == 2)
    {
      unint64_t v5 = &stru_26D608FC8;
    }
    else
    {
      objc_msgSend(a1, "substringWithRange:", 1, v4 - 2);
      unint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    unint64_t v5 = a1;
  }
  return v5;
}

- (BOOL)_bcs_hasCaseInsensitivePrefix:()BCSNSStringExtras
{
  return a3 && [a1 rangeOfString:a3 options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_bcs_looksLikeEmailAddress
{
  unint64_t v2 = [a1 length];
  if (v2 < 3) {
    return 0;
  }
  unint64_t v4 = v2;
  uint64_t v5 = [a1 rangeOfString:@"@"];
  BOOL result = 0;
  if (v5 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5 == v4 - 1) {
      return 0;
    }
    return objc_msgSend(a1, "rangeOfString:options:range:", @"@", 0, v5 + 1, v4 + ~v5) == 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

@end