@interface JSDatabaseStore
- (_TtC14amsengagementd15JSDatabaseStore)init;
- (id)create:(id)a3;
- (id)scheduleDatabase;
- (id)ubiquitousDatabase;
@end

@implementation JSDatabaseStore

- (id)create:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_100011FA0(v4);

  swift_bridgeObjectRelease();
  v6.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v6.super.isa;
}

- (id)ubiquitousDatabase
{
  return sub_100027D80(self, (uint64_t)a2, (void (*)(void))sub_100027DFC);
}

- (id)scheduleDatabase
{
  return sub_100027D80(self, (uint64_t)a2, (void (*)(void))sub_1000DDB50);
}

- (_TtC14amsengagementd15JSDatabaseStore)init
{
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->config[OBJC_IVAR____TtC14amsengagementd15JSDatabaseStore_config];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end