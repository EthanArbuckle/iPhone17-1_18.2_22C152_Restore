@interface AnyHashable:
- (uint64_t)Any;
- (void)Any;
@end

@implementation AnyHashable:

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

- (uint64_t)Any
{
  v8 = a2;
  v9 = *(void (**)(void *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v10 = v8;
    v8 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v12 = v11;

    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    swift_retain();
    unint64_t v12 = 0xF000000000000000;
    if (a3)
    {
LABEL_3:
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      a3 = v14;
      if (!a5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  uint64_t v13 = 0;
  if (a5) {
LABEL_4:
  }
    a5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_5:
  v9(v8, v12, v13, a3, a4, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data?((uint64_t)v8, v12);
  return swift_release();
}

@end