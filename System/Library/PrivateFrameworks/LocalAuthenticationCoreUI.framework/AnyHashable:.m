@interface AnyHashable:
- (id)Any;
- (uint64_t)Any;
- (void)Any;
@end

@implementation AnyHashable:

- (uint64_t)Any
{
  return swift_release();
}

- (void)Any
{
  if (a2) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

- (id)Any
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_bridgeObjectRetain();
  }
}

@end