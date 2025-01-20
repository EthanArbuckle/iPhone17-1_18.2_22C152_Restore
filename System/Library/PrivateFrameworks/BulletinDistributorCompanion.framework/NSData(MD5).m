@interface NSData(MD5)
- (id)blt_sha256;
- (id)blt_sha256String;
- (unsigned)MD5:()MD5;
@end

@implementation NSData(MD5)

- (id)blt_sha256
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = CC_SHA256((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  if (v2)
  {
    v2 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:32];
  }
  return v2;
}

- (id)blt_sha256String
{
  id v1 = objc_msgSend(a1, "blt_sha256");
  v2 = [v1 base64EncodedStringWithOptions:0];

  return v2;
}

- (unsigned)MD5:()MD5
{
  if (!a3) {
    -[NSData(MD5) MD5:]();
  }
  id v4 = a1;
  uint64_t v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];
  return CC_MD5(v5, v6, a3);
}

- (void)MD5:()MD5 .cold.1()
{
}

@end