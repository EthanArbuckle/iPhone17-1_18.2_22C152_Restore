@interface NSString(ParsecSharedExtras)
+ (uint64_t)parsec_stringByBase64EncodingData:()ParsecSharedExtras;
- (BOOL)parsec_caseInsensitiveContainsString:()ParsecSharedExtras;
- (BOOL)parsec_hasCaseInsensitivePrefix:()ParsecSharedExtras;
- (BOOL)parsec_hasCaseInsensitiveSuffix:()ParsecSharedExtras;
- (BOOL)parsec_hasLocalizedCaseInsensitivePrefix:()ParsecSharedExtras;
- (BOOL)parsec_isCaseInsensitiveEqualToString:()ParsecSharedExtras;
- (id)parsec_base64DecodedData;
- (id)parsec_readableURLStringAfterRemovingSubdomains;
- (uint64_t)parsec_hasPrefix:()ParsecSharedExtras;
@end

@implementation NSString(ParsecSharedExtras)

- (id)parsec_readableURLStringAfterRemovingSubdomains
{
  v2 = (void *)[a1 copy];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "parsec_hostAndPortRangeFromURLString:", v2);
  uint64_t v5 = v4;
  int v6 = objc_msgSend(v2, "parsec_hasPrefix:", @"http://");
  int v7 = objc_msgSend(v2, "parsec_hasPrefix:", @"https://");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL && (v6 | v7) != 0)
  {
    uint64_t v9 = objc_msgSend(a1, "rangeOfString:options:range:", @":", 4, v3, v5);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = v9;
      uint64_t v11 = v3 + v5 - v9;
      if (objc_msgSend(a1, "rangeOfString:options:range:", @"]", 0, v9, v11) == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = objc_msgSend(v2, "stringByReplacingCharactersInRange:withString:", v10, v11, &stru_1EED51C28);

        v5 -= v11;
        v2 = (void *)v12;
      }
    }
  }
  if (v6)
  {
    if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_20;
    }
  }
  else
  {
    if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
      char v13 = 0;
    }
    else {
      char v13 = v7;
    }
    if ((v13 & 1) == 0) {
      goto LABEL_20;
    }
  }
  v14 = objc_msgSend(v2, "substringWithRange:", v3, v5);
  v15 = @"www.";
  if ((objc_msgSend(v14, "parsec_hasPrefix:", @"www.") & 1) != 0
    || (v15 = @"m.", objc_msgSend(v14, "parsec_hasPrefix:", @"m.")))
  {
    v16 = objc_msgSend(v14, "parsec_getHighLevelDomainFromHost");
    char v17 = [v14 isEqualToString:v16];

    if ((v17 & 1) == 0)
    {
      uint64_t v18 = objc_msgSend(v2, "stringByReplacingCharactersInRange:withString:", v3, -[__CFString length](v15, "length"), &stru_1EED51C28);

      v2 = (void *)v18;
    }
  }

LABEL_20:

  return v2;
}

- (BOOL)parsec_caseInsensitiveContainsString:()ParsecSharedExtras
{
  return a3 && [a1 rangeOfString:a3 options:1] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)parsec_base64DecodedData
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:a1 options:0];

  return v1;
}

- (BOOL)parsec_hasLocalizedCaseInsensitivePrefix:()ParsecSharedExtras
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && (unint64_t v6 = [v4 length], v6 <= objc_msgSend(a1, "length")))
  {
    v8 = [MEMORY[0x1E4F1CA20] currentLocale];
    BOOL v7 = objc_msgSend(a1, "compare:options:range:locale:", v5, 1, 0, v6, v8) == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)parsec_hasCaseInsensitiveSuffix:()ParsecSharedExtras
{
  return a3 && [a1 rangeOfString:a3 options:13] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)parsec_hasCaseInsensitivePrefix:()ParsecSharedExtras
{
  return a3 && [a1 rangeOfString:a3 options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)parsec_isCaseInsensitiveEqualToString:()ParsecSharedExtras
{
  return a3 && [a1 compare:a3 options:3] == 0;
}

- (uint64_t)parsec_hasPrefix:()ParsecSharedExtras
{
  if (a3) {
    return objc_msgSend(a1, "hasPrefix:");
  }
  else {
    return 0;
  }
}

+ (uint64_t)parsec_stringByBase64EncodingData:()ParsecSharedExtras
{
  return [a3 base64EncodedStringWithOptions:0];
}

@end