@interface A:
- (uint64_t)B;
@end

@implementation A:

- (uint64_t)B
{
  return swift_retain();
}

@end