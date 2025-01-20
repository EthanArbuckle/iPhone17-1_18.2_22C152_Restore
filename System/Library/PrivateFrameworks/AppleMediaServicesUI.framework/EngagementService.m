@interface EngagementService
+ (_TtC14amsengagementd17EngagementService)shared;
- (_TtC14amsengagementd17EngagementService)init;
- (void)contentInfoForApp:(NSString *)a3 cacheKey:(NSString *)a4 version:(NSString *)a5 reply:(id)a6;
- (void)enqueueWithRequest:(id)a3 completion:(id)a4;
- (void)fetchMetricsIdentifiers;
- (void)manualSyncMetricsIdentifiers;
- (void)notifyBlockedMessages:(id)a3;
- (void)syncMetricsIdentifiers;
- (void)syncWithRequest:(id)a3 completion:(id)a4;
- (void)treatmentStoreServiceWithReply:(id)a3;
@end

@implementation EngagementService

- (void)treatmentStoreServiceWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;
  sub_100021888((uint64_t)&unk_10022F128, v5);
}

- (void)enqueueWithRequest:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100017B38((uint64_t)v8, (uint64_t)sub_100022970, v7, sub_100017BD0, (uint64_t)&unk_1002105F0, (uint64_t)sub_100022940, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1000221A8);

  swift_release();
}

+ (_TtC14amsengagementd17EngagementService)shared
{
  id v2 = sub_1000B17D8();
  return (_TtC14amsengagementd17EngagementService *)v2;
}

- (_TtC14amsengagementd17EngagementService)init
{
}

- (void).cxx_destruct
{
  swift_release();

  sub_10004377C((uint64_t)self + OBJC_IVAR____TtC14amsengagementd17EngagementService_appDefaultsProvider);
  sub_100053A18(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14amsengagementd17EngagementService_currentEnginePerformer), *(void *)&self->priorityQueue[OBJC_IVAR____TtC14amsengagementd17EngagementService_currentEnginePerformer]);
  swift_bridgeObjectRelease();
  sub_10004377C((uint64_t)self + OBJC_IVAR____TtC14amsengagementd17EngagementService_enginePerformerProvider);
  sub_10004377C((uint64_t)self + OBJC_IVAR____TtC14amsengagementd17EngagementService_featureFlagProvider);
  swift_release();
}

- (void)contentInfoForApp:(NSString *)a3 cacheKey:(NSString *)a4 version:(NSString *)a5 reply:(id)a6
{
  v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_100021888((uint64_t)&unk_10022F158, (uint64_t)v11);
}

- (void)notifyBlockedMessages:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  sub_1000B70F8(v4);

  swift_bridgeObjectRelease();
}

- (void)syncWithRequest:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100017B38((uint64_t)v8, (uint64_t)sub_100022974, v7, sub_1000B0CFC, (uint64_t)&unk_100210028, (uint64_t)sub_100022944, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1000AF460);

  swift_release();
}

- (void)syncMetricsIdentifiers
{
  id v2 = self;
  sub_1000B9208();
}

- (void)fetchMetricsIdentifiers
{
  id v2 = self;
  sub_1000B92F0(0, (uint64_t (*)(void))sub_1001384B4);
}

- (void)manualSyncMetricsIdentifiers
{
  id v2 = self;
  sub_1000B92F0(1, (uint64_t (*)(void))sub_100137720);
}

@end