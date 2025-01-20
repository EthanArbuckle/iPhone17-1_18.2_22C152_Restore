@interface CLBOpenApplicationVerifier
+ (CLBOpenApplicationVerifier)sharedInstance;
- (BOOL)shouldOpenAppWithBundleIdentifier:(id)a3;
- (CLBOpenApplicationVerifier)init;
- (CLBOpenApplicationVerifier)initWithUserSelectedApplicationBundleIdentifiers:(id)a3;
- (void)verifyRequest:(FBSystemServiceOpenApplicationRequest *)a3 completionHandler:(id)a4;
@end

@implementation CLBOpenApplicationVerifier

+ (CLBOpenApplicationVerifier)sharedInstance
{
  if (qword_10017B5D8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1001864E8;

  return (CLBOpenApplicationVerifier *)v2;
}

- (CLBOpenApplicationVerifier)initWithUserSelectedApplicationBundleIdentifiers:(id)a3
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for OpenApplicationVerifier();
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___CLBOpenApplicationVerifier_implementation) = (Class)OpenApplicationVerifier.init(userSelectedApplicationBundleIdentifiers:)();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for OpenApplicationVerifierWrapper();
  return [(CLBOpenApplicationVerifier *)&v6 init];
}

- (BOOL)shouldOpenAppWithBundleIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)((char *)&self->super.isa
                                                                + OBJC_IVAR___CLBOpenApplicationVerifier_implementation)
                                                  + 96);
  v8 = self;
  swift_retain();
  LOBYTE(v4) = v7(v4, v6);

  swift_bridgeObjectRelease();
  swift_release();
  return v4 & 1;
}

- (void)verifyRequest:(FBSystemServiceOpenApplicationRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100029F90((uint64_t *)&unk_10017C500);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10017E9A8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10017DC20;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10008C550((uint64_t)v9, (uint64_t)&unk_10017DC28, (uint64_t)v14);
  swift_release();
}

- (CLBOpenApplicationVerifier)init
{
  result = (CLBOpenApplicationVerifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end