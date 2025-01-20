@interface PBCodable(HDCodingSupport)
- (uint64_t)encodedByteCount;
@end

@implementation PBCodable(HDCodingSupport)

- (uint64_t)encodedByteCount
{
  v2 = (void *)MEMORY[0x1C187C0E0]();
  v3 = [a1 data];
  uint64_t v4 = [v3 length];

  return v4;
}

@end