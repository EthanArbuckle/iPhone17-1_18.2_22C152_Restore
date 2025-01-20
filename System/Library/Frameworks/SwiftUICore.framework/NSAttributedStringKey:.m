@interface NSAttributedStringKey:
- (Class)Any;
- (uint64_t)Any;
- (void)Any;
@end

@implementation NSAttributedStringKey:

- (uint64_t)Any
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

- (void)Any
{
  v8 = *(void (**)(id, uint64_t, id, uint64_t))(a1 + 32);
  type metadata accessor for NSAttributedStringKey(0);
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey();
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a2;
  id v10 = a4;
  v8(v11, v9, v10, a5);
  swift_bridgeObjectRelease();
}

- (Class)Any
{
  uint64_t v4 = a2;
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    type metadata accessor for NSAttributedStringKey(0);
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey();
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  uint64_t v6 = v5(v4, a3);
  swift_release();
  swift_bridgeObjectRelease();
  if (v6)
  {
    type metadata accessor for NSAttributedStringKey(0);
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey();
    v7.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }

  return v7.super.isa;
}

@end