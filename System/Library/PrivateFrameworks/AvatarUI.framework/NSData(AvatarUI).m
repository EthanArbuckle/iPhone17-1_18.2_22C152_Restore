@interface NSData(AvatarUI)
- (id)avt_SHA256;
@end

@implementation NSData(AvatarUI)

- (id)avt_SHA256
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v1 = a1;
  CC_SHA256((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = [MEMORY[0x263F089D8] stringWithCapacity:64];
  for (uint64_t i = 0; i != 16; ++i)
    objc_msgSend(v2, "appendFormat:", @"%02x", md[i]);
  return v2;
}

@end