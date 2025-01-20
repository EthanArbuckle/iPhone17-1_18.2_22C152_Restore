@interface Defaults.Observation
- (_TtCC11MobilePhone8Defaults11Observation)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation Defaults.Observation

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCC11MobilePhone8Defaults11Observation_userDefault);
  v3 = self;
  id v4 = v2;
  swift_bridgeObjectRetain();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v4 removeObserver:v3 forKeyPath:v5];

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for Defaults.Observation();
  [(Defaults.Observation *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v16, 0, sizeof(v16));
    id v15 = a5;
    v11 = self;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  _bridgeAnyObjectToAny(_:)();
  v11 = (_TtCC11MobilePhone8Defaults11Observation *)swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    lazy protocol witness table accessor for type NSKeyValueChangeKey and conformance NSKeyValueChangeKey();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
LABEL_7:
  (*(void (**)(_TtCC11MobilePhone8Defaults11Observation *, uint64_t, uint64_t, uint64_t))((char *)&self->super.isa
                                                                                                + OBJC_IVAR____TtCC11MobilePhone8Defaults11Observation_onChange))(v11, v12, v13, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?((uint64_t)v16);
}

- (_TtCC11MobilePhone8Defaults11Observation)init
{
  result = (_TtCC11MobilePhone8Defaults11Observation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end