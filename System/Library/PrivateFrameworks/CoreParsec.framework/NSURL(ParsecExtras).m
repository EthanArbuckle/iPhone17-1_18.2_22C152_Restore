@interface NSURL(ParsecExtras)
+ (uint64_t)parsec_hostAndPortRangeFromURLString:()ParsecExtras;
@end

@implementation NSURL(ParsecExtras)

+ (uint64_t)parsec_hostAndPortRangeFromURLString:()ParsecExtras
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"://" options:2];
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v4;
    uint64_t v8 = v5;
    v9 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-."];
    v10 = [v9 invertedSet];

    if (objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v10, 2, 0, v7) == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = [v3 length];
      v12 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"/?#"];
      uint64_t v13 = v7 + v8;
      uint64_t v14 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v12, 2, v13, v11 - v13);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v15 = v11;
      }
      else {
        uint64_t v15 = v14;
      }
      uint64_t v16 = objc_msgSend(v3, "rangeOfString:options:range:", @"@", 2, v13, v15 - v13);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v6 = v13;
      }
      else {
        uint64_t v6 = v16 + v17;
      }
    }
  }

  return v6;
}

@end