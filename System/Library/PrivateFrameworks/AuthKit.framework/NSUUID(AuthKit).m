@interface NSUUID(AuthKit)
- (id)ak_uuidData;
@end

@implementation NSUUID(AuthKit)

- (id)ak_uuidData
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 getUUIDBytes:v3];
  v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:16];

  return v1;
}

@end