@interface A:
- (uint64_t)B;
- (void)B;
@end

@implementation A:

- (uint64_t)B
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

- (void)B
{
}

@end