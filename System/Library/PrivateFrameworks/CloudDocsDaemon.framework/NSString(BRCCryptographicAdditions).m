@interface NSString(BRCCryptographicAdditions)
+ (__CFString)brc_hexadecimalStringWithBytes:()BRCCryptographicAdditions length:;
- (id)brc_SHA1WithSalt:()BRCCryptographicAdditions;
- (id)brc_SHA256;
- (id)brc_SHA256WithSalt:()BRCCryptographicAdditions;
- (id)brc_dataFromHexidecimalString;
@end

@implementation NSString(BRCCryptographicAdditions)

+ (__CFString)brc_hexadecimalStringWithBytes:()BRCCryptographicAdditions length:
{
  unint64_t v4 = a4;
  v15[128] = *MEMORY[0x1E4F143B8];
  v6 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:2 * a4];
  if (v6)
  {
    for (; v4; v4 -= v7)
    {
      if (v4 >= 0x200) {
        uint64_t v7 = 512;
      }
      else {
        uint64_t v7 = v4;
      }
      v8 = v15;
      v9 = a3;
      uint64_t v10 = v7;
      do
      {
        unsigned int v11 = *v9++;
        *(v8 - 1) = a0123456789abcd[(unint64_t)v11 >> 4];
        unsigned char *v8 = a0123456789abcd[v11 & 0xF];
        v8 += 2;
        --v10;
      }
      while (v10);
      cStr[2 * v7] = 0;
      CFStringAppendCString(v6, cStr, 0x600u);
      a3 += v7;
    }
    v12 = v6;
  }

  return v6;
}

- (id)brc_SHA256
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = (const char *)[a1 UTF8String];
  memset(v5, 0, sizeof(v5));
  CC_LONG v2 = strlen(v1);
  CC_SHA256(v1, v2, (unsigned __int8 *)v5);
  v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:32];
  return v3;
}

- (id)brc_SHA1WithSalt:()BRCCryptographicAdditions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v5 = a3;
  uint64_t v6 = (const char *)[v4 UTF8String];
  id v7 = v5;
  v8 = (const char *)[v7 UTF8String];

  size_t v9 = strlen(v6);
  size_t v10 = strlen(v8);
  CCHmac(0, v6, v9, v8, v10, macOut);
  unsigned int v11 = objc_msgSend(NSString, "brc_hexadecimalStringWithBytes:length:", macOut, 20);
  return v11;
}

- (id)brc_SHA256WithSalt:()BRCCryptographicAdditions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v5 = a3;
  uint64_t v6 = (const char *)[v4 UTF8String];
  id v7 = v5;
  v8 = (const char *)[v7 bytes];

  memset(v13, 0, sizeof(v13));
  size_t v9 = strlen(v6);
  size_t v10 = strlen(v8);
  CCHmac(2u, v6, v9, v8, v10, v13);
  unsigned int v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v13 length:32];
  return v11;
}

- (id)brc_dataFromHexidecimalString
{
  id v1 = a1;
  uint64_t v2 = [v1 UTF8String];
  unint64_t v3 = [v1 length];
  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA58] dataWithCapacity:v3 >> 1];
    char v9 = 0;
    char v7 = 0;
    if (v3)
    {
      for (unint64_t i = 0; i < v3; i += 2)
      {
        *(_WORD *)__str = *(_WORD *)(v2 + i);
        char v7 = strtoul(__str, 0, 16);
        [v4 appendBytes:&v7 length:1];
      }
    }
  }
  return v4;
}

@end