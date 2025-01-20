@interface ECIDNADecoder
+ (id)stringByDecodingDomainName:(id)a3;
@end

@implementation ECIDNADecoder

+ (id)stringByDecodingDomainName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if (v4
    && (objc_msgSend(MEMORY[0x1E4F1CA20], "ef_posixLocale"),
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = objc_msgSend(v3, "rangeOfString:options:range:locale:", @"xn--", 1, 0, v4, v5),
        v5,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v7 = _stringByApplyingIDNATranslationWithRange(v3, MEMORY[0x1E4FBA620]);
  }
  else
  {
    uint64_t v7 = [v3 copy];
  }
  v8 = (void *)v7;

  return v8;
}

@end