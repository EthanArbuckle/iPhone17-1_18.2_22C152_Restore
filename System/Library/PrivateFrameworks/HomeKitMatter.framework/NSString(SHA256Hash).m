@interface NSString(SHA256Hash)
- (id)hmmtr_sha256hash;
- (unint64_t)chip_unsignedLongLongValue;
@end

@implementation NSString(SHA256Hash)

- (unint64_t)chip_unsignedLongLongValue
{
  v1 = (const char *)[a1 UTF8String];
  return strtoull(v1, 0, 0);
}

- (id)hmmtr_sha256hash
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v1 = (const char *)[a1 UTF8String];
  CC_LONG v2 = strlen(v1);
  CC_SHA256(v1, v2, md);
  v3 = [MEMORY[0x263F089D8] stringWithCapacity:64];
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v3, "appendFormat:", @"%02x", md[i]);
  v5 = [NSString stringWithString:v3];

  return v5;
}

@end