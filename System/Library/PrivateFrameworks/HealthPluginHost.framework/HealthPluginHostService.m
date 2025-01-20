@interface HealthPluginHostService
- (NSString)description;
- (_TtC10healthappd23HealthPluginHostService)init;
- (id)runLaunchGenerationIfIdleWithCompletion:(id)a3;
- (id)startInteractiveFeedItemGenerationWithCompletion:(id)a3;
- (void)collectFeedItemCacheDiagnosticsWithCompletion:(id)a3;
- (void)commitSharedSummaryTransactionAsUrgent:(BOOL)a3 completion:(id)a4;
- (void)dealloc;
- (void)debuggingInfoRequestedWithNote:(id)a3;
- (void)deleteFeedWithFeedKinds:(id)a3 completion:(id)a4;
- (void)handleJournaledSharingEntries:(id)a3 completion:(id)a4;
- (void)invalidateStoreCache;
- (void)populateFeedWithFeedKinds:(id)a3 for:(id)a4 completion:(id)a5;
- (void)postNotificationWith:(id)a3 userInfo:(id)a4;
- (void)submitTrainingFor:(id)a3 completion:(id)a4;
@end

@implementation HealthPluginHostService

- (NSString)description
{
  v2 = self;
  sub_10000D52C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)invalidateStoreCache
{
  v2 = self;
  sub_10001CCAC();
}

- (id)startInteractiveFeedItemGenerationWithCompletion:(id)a3
{
  return sub_1000238AC(self, (int)a2, a3, (uint64_t)&unk_100042728, (uint64_t)sub_10002999C, (uint64_t (*)(uint64_t, uint64_t))sub_100009178);
}

- (void)populateFeedWithFeedKinds:(id)a3 for:(id)a4 completion:(id)a5
{
  uint64_t v7 = type metadata accessor for DateInterval();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  v14 = self;
  sub_100020108(v12, v15, (unint64_t *)sub_100029998, v13);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)submitTrainingFor:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  sub_10000C49C(0, &qword_1000467F8);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = self;
  sub_100020938(v6, (void (*)(void))sub_100029998, v7);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)postNotificationWith:(id)a3 userInfo:(id)a4
{
  if (a4) {
    uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  uint64_t v8 = self;
  sub_1000210EC(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)collectFeedItemCacheDiagnosticsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_1000215E4((uint64_t (*)(void))sub_100029934, v5);

  swift_release();
}

- (void)deleteFeedWithFeedKinds:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  id v7 = self;
  sub_100028B94(v6, (uint64_t)v7, (void (**)(void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)commitSharedSummaryTransactionAsUrgent:(BOOL)a3 completion:(id)a4
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = _Block_copy(a4);
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = *(uint64_t *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC10healthappd23HealthPluginHostService_longRunningProcessOracle);
  *(void *)(v9 + 16) = v8;
  v11 = *(void **)(v10 + 16);
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = sub_100029994;
  *(void *)(v12 + 32) = v9;
  *(void *)(v12 + 40) = ObjectType;
  uint64_t v13 = self;
  id v14 = v11;
  swift_retain();
  dispatch thunk of OpenTransactionBuilderManager.commitTransaction(healthStore:asUrgent:completion:)();

  swift_release();

  swift_release();
}

- (void)handleJournaledSharingEntries:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = self;
  sub_100028F40((uint64_t (*)(void, void))sub_1000298D4, v6);

  swift_release();
}

- (id)runLaunchGenerationIfIdleWithCompletion:(id)a3
{
  return sub_1000238AC(self, (int)a2, a3, (uint64_t)&unk_1000425E8, (uint64_t)sub_1000298BC, (uint64_t (*)(uint64_t, uint64_t))sub_1000228A4);
}

- (void)dealloc
{
  NSString v3 = (objc_class *)type metadata accessor for HealthPluginHostService(0);
  v4 = self;
  DebuggingResponder.deregisterForDebuggingRequests()();
  v5.receiver = v4;
  v5.super_class = v3;
  [(HealthPluginHostService *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10healthappd23HealthPluginHostService_schedulerDispatchQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10healthappd23HealthPluginHostService_healthExperienceStoreOracle));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  NSString v3 = (char *)self + OBJC_IVAR____TtC10healthappd23HealthPluginHostService__appFirstLaunchDate;
  sub_100005FEC(0, &qword_1000460C8, (uint64_t (*)(uint64_t))sub_10000FBEC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for UserDefault);
  uint64_t v5 = v4;
  id v7 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v7)((void *)(v4 - 8), v3, v4);
  uint64_t v6 = (char *)self + OBJC_IVAR____TtC10healthappd23HealthPluginHostService__appLastOpenedDate;

  v7(v6, v5);
}

- (_TtC10healthappd23HealthPluginHostService)init
{
  result = (_TtC10healthappd23HealthPluginHostService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)debuggingInfoRequestedWithNote:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_1000258C8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end