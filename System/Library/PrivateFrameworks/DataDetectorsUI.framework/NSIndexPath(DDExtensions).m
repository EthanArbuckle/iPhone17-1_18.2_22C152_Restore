@interface NSIndexPath(DDExtensions)
- (__CFString)dd_stringValue;
@end

@implementation NSIndexPath(DDExtensions)

- (__CFString)dd_stringValue
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 length];
  switch(v2)
  {
    case 0:
      v8 = &stru_1EF5023D8;
      goto LABEL_16;
    case 2:
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu/%lu", objc_msgSend(a1, "indexAtPosition:", 0), objc_msgSend(a1, "indexAtPosition:", 1));
LABEL_11:
      v8 = (__CFString *)v7;
      goto LABEL_16;
    case 1:
      unint64_t v3 = [a1 indexAtPosition:0];
      uint64_t v4 = 0;
      v13[32] = 0;
      do
      {
        v13[v4 + 31] = v3 % 0xA + 48;
        uint64_t v5 = v4 - 1;
        if (v3 < 0xA) {
          break;
        }
        v3 /= 0xAuLL;
      }
      while (v4-- != -31);
      uint64_t v7 = [NSString stringWithCString:&v13[v5 + 32] encoding:4];
      goto LABEL_11;
  }
  v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v2];
  if ([a1 length])
  {
    unint64_t v10 = 0;
    do
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(a1, "indexAtPosition:", v10));
      [v9 addObject:v11];

      ++v10;
    }
    while (v10 < [a1 length]);
  }
  v8 = [v9 componentsJoinedByString:@"/"];

LABEL_16:
  return v8;
}

@end