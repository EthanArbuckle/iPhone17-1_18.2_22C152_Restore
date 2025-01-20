@interface LogKey
+ (BOOL)supportsSecureCoding;
+ (NSArray)appInstallProperties;
- (BOOL)isEqual:(id)a3;
- (_TtC9appstored6LogKey)init;
- (_TtC9appstored6LogKey)initWithAppInstallDictionary:(id)a3;
- (_TtC9appstored6LogKey)initWithAppInstallEntity:(id)a3;
- (_TtC9appstored6LogKey)initWithAppInstallMemoryEntity:(id)a3;
- (_TtC9appstored6LogKey)initWithAppMetadata:(id)a3;
- (_TtC9appstored6LogKey)initWithBase:(id)a3;
- (_TtC9appstored6LogKey)initWithBase:(id)a3 IDs:(id)a4;
- (_TtC9appstored6LogKey)initWithBaseUUID:(id)a3;
- (_TtC9appstored6LogKey)initWithBaseUUIDString:(id)a3;
- (_TtC9appstored6LogKey)initWithBatchLogKey:(id)a3 logCode:(id)a4 externalID:(id)a5 bundleID:(id)a6 itemID:(id)a7;
- (_TtC9appstored6LogKey)initWithCategory:(id)a3;
- (_TtC9appstored6LogKey)initWithCategory:(id)a3 base:(id)a4;
- (_TtC9appstored6LogKey)initWithCategory:(id)a3 baseUUID:(id)a4;
- (_TtC9appstored6LogKey)initWithCode:(id)a3;
- (_TtC9appstored6LogKey)initWithCode:(id)a3 IDs:(id)a4;
- (_TtC9appstored6LogKey)initWithCode:(id)a3 base:(id)a4;
- (_TtC9appstored6LogKey)initWithCode:(id)a3 base:(id)a4 ID:(id)a5;
- (_TtC9appstored6LogKey)initWithCoder:(id)a3;
- (_TtC9appstored6LogKey)initWithCoordinatorTag:(id)a3 logCode:(id)a4;
- (id)description;
- (id)makeActivity;
- (id)prependingCategory:(id)a3;
- (int64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LogKey

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (id)description
{
  swift_bridgeObjectRetain();
  NSString v0 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v0;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored6LogKey_activity))
  {
    v4 = (os_activity_scope_state_s *)((char *)self + OBJC_IVAR____TtC9appstored6LogKey_activityState);
    swift_beginAccess();
    v5 = self;
    os_activity_scope_leave(v4);
    swift_endAccess();
  }
  else
  {
    v6 = self;
  }
  v7.receiver = self;
  v7.super_class = ObjectType;
  [(LogKey *)&v7 dealloc];
}

- (_TtC9appstored6LogKey)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_stdlib_random();
  sub_100016534();
  uint64_t v3 = String.init<A>(_:radix:uppercase:)();
  v5 = v4;
  id v6 = objc_allocWithZone(ObjectType);
  objc_super v7 = sub_100016180(0, 0xE000000000000000, (uint64_t)"/", 1, 2, 0, (void *)0xE000000000000000, v3, v5, 0);
  swift_bridgeObjectRelease();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC9appstored6LogKey *)v7;
}

- (id)prependingCategory:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored6LogKey_value);
  v9 = *(void **)&self->value[OBJC_IVAR____TtC9appstored6LogKey_value];
  uint64_t v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored6LogKey_activity);
  id v11 = objc_allocWithZone(ObjectType);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v12 = sub_100016180(v5, v7, (uint64_t)"/", 1, 2, 0, (void *)0xE000000000000000, v8, v9, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return v12;
}

- (_TtC9appstored6LogKey)initWithBaseUUID:(id)a3
{
  uint64_t v4 = sub_10001644C((uint64_t *)&unk_1005A6330);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  return (_TtC9appstored6LogKey *)sub_100015E10((uint64_t)v6);
}

- (_TtC9appstored6LogKey)initWithBatchLogKey:(id)a3 logCode:(id)a4 externalID:(id)a5 bundleID:(id)a6 itemID:(id)a7
{
  uint64_t v12 = sub_10001644C((uint64_t *)&unk_1005A6330);
  __chkstk_darwin(v12 - 8);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v17 = (char *)&v32 - v16;
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v18 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 1, 1, v19);
  }
  if (a6)
  {
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v22 = v21;
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v22 = 0;
  }
  swift_getObjectType();
  sub_100016588((uint64_t)v17, (uint64_t)v14, (uint64_t *)&unk_1005A6330);
  if (a7)
  {
    uint64_t v32 = 0;
    char v33 = 1;
    id v23 = a7;
    id v24 = a3;
    id v25 = a4;
    static UInt64._conditionallyBridgeFromObjectiveC(_:result:)();
    uint64_t v26 = v32;
    char v27 = v33;
  }
  else
  {
    id v28 = a3;
    id v29 = a4;
    uint64_t v26 = 0;
    char v27 = 1;
  }
  v30 = sub_100071078((char *)a3, a4, (uint64_t)v14, v20, v22, v26, v27);

  sub_100016714((uint64_t)v17, (uint64_t *)&unk_1005A6330);
  swift_deallocPartialClassInstance();
  return (_TtC9appstored6LogKey *)v30;
}

- (_TtC9appstored6LogKey)initWithAppMetadata:(id)a3
{
  return (_TtC9appstored6LogKey *)sub_1000706C8((id *)a3);
}

- (_TtC9appstored6LogKey)initWithCoordinatorTag:(id)a3 logCode:(id)a4
{
  return (_TtC9appstored6LogKey *)sub_1000708BC(a3, a4);
}

- (_TtC9appstored6LogKey)initWithAppInstallDictionary:(id)a3
{
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC9appstored6LogKey *)sub_100070A68(v3);
}

+ (NSArray)appInstallProperties
{
  sub_10007191C();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (_TtC9appstored6LogKey)initWithAppInstallEntity:(id)a3
{
  return (_TtC9appstored6LogKey *)sub_100070D10(a3, (uint64_t (*)(void *))sub_1002C2074, (uint64_t (*)(void *))sub_1002C1FCC, (uint64_t (*)(void *))sub_1002C2264);
}

- (_TtC9appstored6LogKey)initWithAppInstallMemoryEntity:(id)a3
{
  return (_TtC9appstored6LogKey *)sub_100070D10(a3, (uint64_t (*)(void *))sub_100424E2C, (uint64_t (*)(void *))sub_100424D84, (uint64_t (*)(void *))sub_100424E64);
}

- (_TtC9appstored6LogKey)initWithBaseUUIDString:(id)a3
{
  return (_TtC9appstored6LogKey *)sub_1000FB3A0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1000FA274);
}

- (id)makeActivity
{
  NSArray v2 = self;
  sub_1000165EC();

  return v2;
}

- (int64_t)hash
{
  NSArray v2 = self;
  int64_t v3 = String.hashValue.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_1000FA4D4((uint64_t)v8);

  sub_100016714((uint64_t)v8, &qword_1005A5660);
  return v6 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000FA794(v4);
}

- (_TtC9appstored6LogKey)initWithCoder:(id)a3
{
  return (_TtC9appstored6LogKey *)sub_1000FA960(a3);
}

- (_TtC9appstored6LogKey)initWithBase:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    a3 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    char v6 = v5;
  }
  else
  {
    char v6 = (void *)0xE000000000000000;
  }
  id v7 = objc_allocWithZone(ObjectType);
  uint64_t v8 = sub_100016180(0, 0xE000000000000000, (uint64_t)"/", 1, 2, 0, (void *)0xE000000000000000, (uint64_t)a3, v6, 0);
  swift_bridgeObjectRelease();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC9appstored6LogKey *)v8;
}

- (_TtC9appstored6LogKey)initWithCategory:(id)a3 base:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    a3 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (a4)
    {
LABEL_3:
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
LABEL_6:
  if (!v8)
  {
    a3 = 0;
    uint64_t v8 = 0xE000000000000000;
  }
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = (void *)0xE000000000000000;
  }
  id v13 = objc_allocWithZone(ObjectType);
  v14 = sub_100016180((uint64_t)a3, v8, (uint64_t)"/", 1, 2, 0, (void *)0xE000000000000000, v11, v12, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC9appstored6LogKey *)v14;
}

- (_TtC9appstored6LogKey)initWithBase:(id)a3 IDs:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v8;
    if (a4) {
      goto LABEL_3;
    }
LABEL_8:
    if (!a3)
    {
      uint64_t v7 = 0;
      a3 = (id)0xE000000000000000;
    }
    goto LABEL_10;
  }
  uint64_t v7 = 0;
  if (!a4) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = (void *)v9;
  if (!a3)
  {
    uint64_t v7 = 0;
    a3 = (id)0xE000000000000000;
  }
  if (!v9) {
LABEL_10:
  }
    uint64_t v10 = _swiftEmptyArrayStorage;
  id v11 = objc_allocWithZone(ObjectType);
  uint64_t v12 = sub_1000FBB48(0, 0xE000000000000000, (uint64_t)"/", 1, 2, 0, (void *)0xE000000000000000, v7, a3, (uint64_t)v10, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC9appstored6LogKey *)v12;
}

- (_TtC9appstored6LogKey)initWithCode:(id)a3 base:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    a3 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (a4)
    {
LABEL_3:
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
LABEL_6:
  if (!v8)
  {
    a3 = 0;
    uint64_t v8 = (void *)0xE000000000000000;
  }
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = (void *)0xE000000000000000;
  }
  id v13 = objc_allocWithZone(ObjectType);
  v14 = sub_100016180(0, 0xE000000000000000, (uint64_t)"/", 1, 2, (uint64_t)a3, v8, v11, v12, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC9appstored6LogKey *)v14;
}

- (_TtC9appstored6LogKey)initWithCode:(id)a3 base:(id)a4 ID:(id)a5
{
  uint64_t v6 = (uint64_t)a4;
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;
    if (v6) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v11 = 0;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v12 = 0;
    uint64_t v14 = 0;
    return (_TtC9appstored6LogKey *)sub_1000FAF54(v7, v9, v6, v11, v12, v14);
  }
  uint64_t v7 = 0;
  uint64_t v9 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  return (_TtC9appstored6LogKey *)sub_1000FAF54(v7, v9, v6, v11, v12, v14);
}

- (_TtC9appstored6LogKey)initWithCategory:(id)a3
{
  return (_TtC9appstored6LogKey *)sub_1000FB3A0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1000FB140);
}

- (_TtC9appstored6LogKey)initWithCode:(id)a3
{
  return (_TtC9appstored6LogKey *)sub_1000FB3A0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1000FB270);
}

- (_TtC9appstored6LogKey)initWithCode:(id)a3 IDs:(id)a4
{
  if (!a3)
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    return (_TtC9appstored6LogKey *)sub_1000FB3E4(v5, v7, v8);
  }
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC9appstored6LogKey *)sub_1000FB3E4(v5, v7, v8);
}

- (_TtC9appstored6LogKey)initWithCategory:(id)a3 baseUUID:(id)a4
{
  uint64_t v6 = sub_10001644C((uint64_t *)&unk_1005A6330);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    uint64_t v10 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
    return (_TtC9appstored6LogKey *)sub_1000FB590((uint64_t)a3, v10, (uint64_t)v8);
  }
  a3 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = type metadata accessor for UUID();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 0, 1, v11);
  return (_TtC9appstored6LogKey *)sub_1000FB590((uint64_t)a3, v10, (uint64_t)v8);
}

@end