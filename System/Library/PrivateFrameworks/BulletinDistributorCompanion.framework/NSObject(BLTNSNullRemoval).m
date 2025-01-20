@interface NSObject(BLTNSNullRemoval)
- (id)objectWithNoNSNulls:()BLTNSNullRemoval;
- (uint64_t)objectSentinelNull;
- (uint64_t)objectWithNSNulls:()BLTNSNullRemoval;
@end

@implementation NSObject(BLTNSNullRemoval)

- (id)objectWithNoNSNulls:()BLTNSNullRemoval
{
  v2 = [MEMORY[0x263EFF9D0] null];

  if (v2 == a1) {
    id v3 = 0;
  }
  else {
    id v3 = a1;
  }
  return v3;
}

- (uint64_t)objectWithNSNulls:()BLTNSNullRemoval
{
  return [MEMORY[0x263EFF9D0] null];
}

- (uint64_t)objectSentinelNull
{
  return [MEMORY[0x263EFF9D0] null];
}

@end