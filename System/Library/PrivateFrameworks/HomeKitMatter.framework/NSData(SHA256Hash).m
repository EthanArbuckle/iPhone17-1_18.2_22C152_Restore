@interface NSData(SHA256Hash)
- (id)hmmtr_sha256hash;
@end

@implementation NSData(SHA256Hash)

- (id)hmmtr_sha256hash
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v1 = a1;
  CC_SHA256((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = [MEMORY[0x263F089D8] stringWithCapacity:64];
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v2, "appendFormat:", @"%02x", md[i]);
  v4 = [NSString stringWithString:v2];

  return v4;
}

@end