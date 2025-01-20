@interface NSString(AvatarUI)
- (id)avt_MD5String;
@end

@implementation NSString(AvatarUI)

- (id)avt_MD5String
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v1 = [a1 dataUsingEncoding:4];
  CC_MD5((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = [MEMORY[0x263F089D8] stringWithCapacity:32];
  for (uint64_t i = 0; i != 16; ++i)
    objc_msgSend(v2, "appendFormat:", @"%02x", md[i]);
  v4 = (void *)[v2 copy];

  return v4;
}

@end