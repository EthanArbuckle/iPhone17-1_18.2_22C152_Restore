@interface HealthAppHealthDaemonOrchestrationClient
- (_TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient)init;
- (void)requestBackgroundGenerationForAllModelsAfterUnlockWithCompletion:(id)a3;
- (void)requestBackgroundGenerationForFeedItemsAfterUnlockWithCompletion:(id)a3;
- (void)runBackgroundGenerationWithPlugins:(id)a3 commitAsUrgent:(BOOL)a4 generationType:(unint64_t)a5 completion:(id)a6;
- (void)runOrRequestBackgroundGenerationWithCompletion:(id)a3;
@end

@implementation HealthAppHealthDaemonOrchestrationClient

- (void)requestBackgroundGenerationForFeedItemsAfterUnlockWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_250D5DEC0();

  swift_release();
}

- (void)requestBackgroundGenerationForAllModelsAfterUnlockWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_250D5DEB0();

  swift_release();
}

- (void)runOrRequestBackgroundGenerationWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_250D5DEA0();

  swift_release();
}

- (void)runBackgroundGenerationWithPlugins:(id)a3 commitAsUrgent:(BOOL)a4 generationType:(unint64_t)a5 completion:(id)a6
{
  v8 = _Block_copy(a6);
  if (a3) {
    sub_250D5E090();
  }
  *(void *)(swift_allocObject() + 16) = v8;
  v9 = self;
  sub_250D5DE90();

  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient)init
{
  uint64_t v3 = OBJC_IVAR____TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient_connection;
  id v4 = objc_allocWithZone((Class)sub_250D5DED0());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for HealthAppHealthDaemonOrchestrationClient();
  return [(HealthAppHealthDaemonOrchestrationClient *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient_connection));
}

@end