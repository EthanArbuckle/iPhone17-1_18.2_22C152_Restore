@interface NSKeyValueObservation.Helper
- (_TtCC10Foundation21NSKeyValueObservationP33_6DA0945A07226B3278459E9368612FF46Helper)init;
- (void)_swizzle_me_observeValueForKeyPath:(id)a3 of:(id)a4 change:(id)a5 context:(void *)a6;
- (void)dealloc;
@end

@implementation NSKeyValueObservation.Helper

- (void)_swizzle_me_observeValueForKeyPath:(id)a3 of:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v15, 0, sizeof(v15));
    id v13 = a5;
    v14 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  specialized static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v12 = v11;

LABEL_8:
  specialized NSKeyValueObservation.Helper._swizzle_me_observeValue(forKeyPath:of:change:context:)((uint64_t)v15, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?((uint64_t)v15, (uint64_t *)&demangling cache variable for type metadata for Any?);
}

- (void)dealloc
{
  v2 = self;
  NSKeyValueObservation.Helper.invalidate()();
  MEMORY[0x185309510](*(Class *)((char *)&v2->super.isa+ OBJC_IVAR____TtCC10Foundation21NSKeyValueObservationP33_6DA0945A07226B3278459E9368612FF46Helper_lock), -1, -1);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for NSKeyValueObservation.Helper();
  [(NSKeyValueObservation.Helper *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtCC10Foundation21NSKeyValueObservationP33_6DA0945A07226B3278459E9368612FF46Helper)init
{
  result = (_TtCC10Foundation21NSKeyValueObservationP33_6DA0945A07226B3278459E9368612FF46Helper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end