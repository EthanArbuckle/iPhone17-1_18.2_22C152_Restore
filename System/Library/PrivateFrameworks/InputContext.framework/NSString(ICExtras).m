@interface NSString(ICExtras)
- (BOOL)_ICEnumerateLongCharactersInRange:()ICExtras usingBlock:;
@end

@implementation NSString(ICExtras)

- (BOOL)_ICEnumerateLongCharactersInRange:()ICExtras usingBlock:
{
  v8 = a5;
  LODWORD(v9) = 0;
  char v16 = 0;
  unint64_t v10 = a3 + a4;
  if (a3 < a3 + a4)
  {
    int v11 = 0;
    while (1)
    {
      uint64_t v12 = [a1 characterAtIndex:a3];
      uint64_t v9 = v12;
      if (v11 || (v12 & 0xF800) == 0xD800)
      {
        int v13 = v12 & 0xFC00;
        if (!v11 && v13 == 55296) {
          goto LABEL_11;
        }
        BOOL v14 = 0;
        if (!v11 || v13 != 56320) {
          goto LABEL_14;
        }
        uint64_t v9 = (v12 + (v11 << 10) - 56613888);
      }
      v8[2](v8, v9, &v16);
      LODWORD(v9) = 0;
LABEL_11:
      if (!v16)
      {
        ++a3;
        int v11 = v9;
        if (a3 < v10) {
          continue;
        }
      }
      break;
    }
  }
  BOOL v14 = v9 == 0;
LABEL_14:

  return v14;
}

@end