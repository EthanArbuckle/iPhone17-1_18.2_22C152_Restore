@interface NSData(EvernoteSDK)
+ (id)endataWithHexDigits:()EvernoteSDK;
- (id)enlowercaseHexDigits;
- (id)enmd5;
@end

@implementation NSData(EvernoteSDK)

- (id)enlowercaseHexDigits
{
  id v1 = a1;
  uint64_t v2 = [v1 bytes];
  v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", 2 * objc_msgSend(v1, "length"));
  if ([v1 length])
  {
    unint64_t v4 = 0;
    do
      objc_msgSend(v3, "appendFormat:", @"%.2x", *(unsigned __int8 *)(v2 + v4++));
    while (v4 < [v1 length]);
  }
  return v3;
}

- (id)enmd5
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = a1;
  CC_MD5((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  uint64_t v2 = [MEMORY[0x263EFF990] dataWithBytes:md length:16];
  return v2;
}

+ (id)endataWithHexDigits:()EvernoteSDK
{
  id v3 = a3;
  unint64_t v4 = v3;
  if (!v3 || ([v3 length] & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", (unint64_t)objc_msgSend(v4, "length") >> 1);
    id v6 = v4;
    v7 = (const char *)[v6 cStringUsingEncoding:1];
    id v8 = v5;
    uint64_t v9 = [v8 mutableBytes];
    if ((unint64_t)[v6 length] >= 2)
    {
      unint64_t v10 = 0;
      do
      {
        sscanf(v7, "%2hhx", v9 + v10);
        v7 += 2;
        ++v10;
      }
      while (v10 < (unint64_t)[v6 length] >> 1);
    }
    v11 = [MEMORY[0x263EFF8F8] dataWithData:v8];
  }
  return v11;
}

@end