@interface NSData(CRKAdditions)
- (id)crk_hexString;
- (id)crk_sha1Hash;
@end

@implementation NSData(CRKAdditions)

- (id)crk_sha1Hash
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v1 = a1;
  CC_SHA1((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = [MEMORY[0x263F089D8] stringWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v2, "appendFormat:", @"%02x", md[i]);

  return v2;
}

- (id)crk_hexString
{
  id v1 = a1;
  uint64_t v2 = [v1 bytes];
  v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", 2 * objc_msgSend(v1, "length"));
  if ([v1 length])
  {
    unint64_t v4 = 0;
    do
      objc_msgSend(v3, "appendFormat:", @"%02x", *(unsigned __int8 *)(v2 + v4++));
    while ([v1 length] > v4);
  }

  return v3;
}

@end