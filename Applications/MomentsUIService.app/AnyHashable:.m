@interface AnyHashable:
- (uint64_t)Any;
- (void)Any;
@end

@implementation AnyHashable:

- (uint64_t)Any
{
  v6 = *(void (**)(void *, void *, uint64_t))(a1 + 32);
  if (a4) {
    uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v7 = 0;
  }
  swift_retain();
  id v8 = a2;
  id v9 = a3;
  v6(a2, a3, v7);
  swift_release();

  return swift_bridgeObjectRelease();
}

- (void)Any
{
  v3 = *(void (**)(void *, uint64_t))(a1 + 32);
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  id v5 = a2;
  v3(a2, v4);
  swift_release();
  swift_bridgeObjectRelease();
}

@end