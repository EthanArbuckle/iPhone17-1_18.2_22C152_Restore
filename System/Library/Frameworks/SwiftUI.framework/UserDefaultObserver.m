@interface UserDefaultObserver
- (_TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)userDefaultsDidChange:(id)a3;
@end

@implementation UserDefaultObserver

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver_state;
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver_state);
  if (v5)
  {
    uint64_t v6 = *((void *)v4 + 1);
    uint64_t v7 = *((void *)v4 + 2);
    self;
    id v8 = v5;
    swift_bridgeObjectRetain();
    UserDefaultObserver.unobserve(oldDefaults:key:)(v8, v6, v7);

    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = self;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  [(UserDefaultObserver *)&v10 dealloc];
}

- (void).cxx_destruct
{
  outlined consume of UserDefaultObserver.State(*(void **)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver_state));
  v3 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver_target;

  outlined destroy of UserDefaultObserver.Target((uint64_t)v3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v17, 0, sizeof(v17));
    id v15 = a5;
    v16 = self;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    lazy protocol witness table accessor for type EnvironmentPropertyKey<DefaultAppStorageDefaultsKey> and conformance EnvironmentPropertyKey<A>((unint64_t *)&lazy protocol witness table cache variable for type NSKeyValueChangeKey and conformance NSKeyValueChangeKey, type metadata accessor for NSKeyValueChangeKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
LABEL_7:
  specialized UserDefaultObserver.observeValue(forKeyPath:of:change:context:)(v10, v12, (uint64_t)v17, a6);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  outlined destroy of Any?((uint64_t)v17);
}

- (void)userDefaultsDidChange:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = self;
  UserDefaultObserver.userDefaultsDidChange(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver)init
{
  result = (_TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end