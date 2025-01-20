@interface NSData(HomeKit)
- (id)hm_generateSHA1;
- (id)hm_generateSHA256;
- (id)hm_stringInHexFormat;
@end

@implementation NSData(HomeKit)

- (id)hm_generateSHA256
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(v4, 0, sizeof(v4));
  id v1 = a1;
  CC_SHA256((const void *)objc_msgSend(v1, "bytes", 0, 0, 0, 0), objc_msgSend(v1, "length"), (unsigned __int8 *)v4);
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:32];

  return v2;
}

- (id)hm_generateSHA1
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  v4[1] = 0;
  LODWORD(v5) = 0;
  id v1 = a1;
  v2 = CC_SHA1((const void *)objc_msgSend(v1, "bytes", 0, 0, v5, v6), objc_msgSend(v1, "length"), (unsigned __int8 *)v4);
  if (v2)
  {
    v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:20];
  }

  return v2;
}

- (id)hm_stringInHexFormat
{
  id v1 = a1;
  uint64_t v2 = [v1 bytes];
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", 2 * objc_msgSend(v1, "length"));
  if ([v1 length])
  {
    unint64_t v4 = 0;
    do
      objc_msgSend(v3, "appendFormat:", @"%02x", *(unsigned __int8 *)(v2 + v4++));
    while ([v1 length] > v4);
  }
  uint64_t v5 = [NSString stringWithString:v3];

  return v5;
}

@end