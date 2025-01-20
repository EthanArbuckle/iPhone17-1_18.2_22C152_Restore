@interface SKANPersistentTokenHandler
+ (id)generateRandomPrivateInput;
- (_TtC9appstored15SKANBlindedData)blindedData;
- (_TtC9appstored26SKANPersistentTokenHandler)init;
- (_TtC9appstored26SKANPersistentTokenHandler)initWithRandomPrivateInput:(id)a3;
- (id)tryFinalizeWithPublicData:(id)a3 finalizationDict:(id)a4 pubCertString:(id)a5 error:(id *)a6;
- (id)tryGenerateBlindedElement;
- (unint64_t)timestamp;
- (void)setBlindedData:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation SKANPersistentTokenHandler

- (unint64_t)timestamp
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_timestamp);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_timestamp) = (Class)a3;
}

- (_TtC9appstored15SKANBlindedData)blindedData
{
  return (_TtC9appstored15SKANBlindedData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                    + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_blindedData));
}

- (void)setBlindedData:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_blindedData);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_blindedData) = (Class)a3;
  id v3 = a3;
}

- (_TtC9appstored26SKANPersistentTokenHandler)initWithRandomPrivateInput:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = type metadata accessor for SKANUTClient();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_timestamp) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_blindedData) = 0;
  v14 = self;
  sub_10001EC28(v11, v13);
  SKANUTClient.init(privateInput:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))((uint64_t)v14 + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_utClient, v9, v6);
  v15 = (uint64_t *)((char *)v14 + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_privateInput);
  uint64_t *v15 = v11;
  v15[1] = v13;
  sub_10001EC28(v11, v13);

  v18.receiver = v14;
  v18.super_class = ObjectType;
  v16 = [(SKANPersistentTokenHandler *)&v18 init];
  sub_10001EC80(v11, v13);
  return v16;
}

+ (id)generateRandomPrivateInput
{
  v2 = sub_1000361F4(0, 0x20uLL);
  size_t v3 = v2[2];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v2 = sub_1000E7E64(0, v3, 0, v2);
  }
  SecRandomCopyBytes(kSecRandomDefault, v3, v2 + 4);
  uint64_t v4 = sub_100037210((unsigned char *)v2 + 32, 32);
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  v7.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10001EC80(v4, v6);
  return v7.super.isa;
}

- (id)tryGenerateBlindedElement
{
  v2 = self;
  size_t v3 = sub_100036374();

  return v3;
}

- (id)tryFinalizeWithPublicData:(id)a3 finalizationDict:(id)a4 pubCertString:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = self;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  uint64_t v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v17 = sub_1000364F0(v13, v15, v16);
  unint64_t v19 = v18;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_10001EC80(v13, v15);
  v20.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10001EC80(v17, v19);
  return v20.super.isa;
}

- (_TtC9appstored26SKANPersistentTokenHandler)init
{
  result = (_TtC9appstored26SKANPersistentTokenHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  size_t v3 = (char *)self + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_utClient;
  uint64_t v4 = type metadata accessor for SKANUTClient();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_privateInput);
  unint64_t v6 = *(void *)&self->timestamp[OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_privateInput];
  sub_10001EC80(v5, v6);
}

@end