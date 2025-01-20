@interface NSMutableData(HKUUID)
- (uint64_t)hk_appendBytesWithUUID:()HKUUID;
- (uint64_t)hk_appendUUIDBytes:()HKUUID;
@end

@implementation NSMutableData(HKUUID)

- (uint64_t)hk_appendBytesWithUUID:()HKUUID
{
  v4[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = (void *)result;
    v4[0] = 0;
    v4[1] = 0;
    [a3 getUUIDBytes:v4];
    return [v3 appendBytes:v4 length:16];
  }
  return result;
}

- (uint64_t)hk_appendUUIDBytes:()HKUUID
{
  return [a1 appendBytes:a3 length:16];
}

@end