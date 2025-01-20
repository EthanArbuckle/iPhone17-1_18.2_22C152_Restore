@interface Int:
- (void)String;
@end

@implementation Int:

- (void)String
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain();
  result = a2;
  *a2 = v4;
  return result;
}

@end