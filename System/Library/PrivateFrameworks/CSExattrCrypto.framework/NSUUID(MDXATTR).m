@interface NSUUID(MDXATTR)
- (uint64_t)MDUUIDData;
@end

@implementation NSUUID(MDXATTR)

- (uint64_t)MDUUIDData
{
  v2[2] = *MEMORY[0x263EF8340];
  v2[0] = 0;
  v2[1] = 0;
  [a1 getUUIDBytes:v2];
  return [MEMORY[0x263EFF8F8] dataWithBytes:v2 length:16];
}

@end