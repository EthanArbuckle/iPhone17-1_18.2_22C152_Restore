@interface HealthAppOrchestrationServer
- (_TtC14HealthPlatform28HealthAppOrchestrationServer)init;
- (id)remote_runForegroundGenerationWithCompletion:(id)a3;
- (void)remote_cancelAllGenerationWithCompletion:(id)a3;
- (void)remote_deleteCacheAndTerminateWithCompletion:(id)a3;
- (void)remote_fetchOrchestrationGraphWithCompletion:(id)a3;
- (void)remote_fetchOrchestrationStatusWithCompletion:(id)a3;
- (void)remote_fireOnceWithCompletion:(id)a3;
- (void)remote_requestBackgroundGenerationForAllModelsAfterUnlockWithCompletion:(id)a3;
- (void)remote_requestBackgroundGenerationForFeedItemsAfterUnlockWithCompletion:(id)a3;
- (void)remote_resetAndFireWithCompletion:(id)a3;
- (void)remote_runBackgroundGenerationWithPlugins:(id)a3 commitAsUrgent:(BOOL)a4 generationType:(unint64_t)a5 completion:(id)a6;
- (void)remote_runOrRequestBackgroundGenerationWithCompletion:(id)a3;
@end

@implementation HealthAppOrchestrationServer

- (id)remote_runForegroundGenerationWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(void *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1C27268C8;
  *(void *)(v8 + 24) = v5;
  v9 = *(uint64_t (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v6 + 56);
  v10 = self;
  swift_retain();
  v11 = (void *)v9(sub_1C2726918, v8, ObjectType, v6);

  swift_release();
  swift_release();

  return v11;
}

- (void)remote_fireOnceWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1C2718FF4;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = *(void *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  uint64_t ObjectType = swift_getObjectType();
  v9 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v7 + 8);
  v10 = self;
  swift_retain();
  v9(sub_1C261AED4, v6, ObjectType, v7);

  swift_release();

  swift_release();
}

- (void)remote_resetAndFireWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1C2718FF4;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = *(void *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  uint64_t ObjectType = swift_getObjectType();
  v9 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v7 + 16);
  v10 = self;
  swift_retain();
  v9(sub_1C261AED4, v6, ObjectType, v7);

  swift_release();

  swift_release();
}

- (void)remote_fetchOrchestrationStatusWithCompletion:(id)a3
{
  v4 = (void (**)(void *, void *))_Block_copy(a3);
  uint64_t v5 = *(void *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v5 + 24);
  v9 = self;
  v7(ObjectType, v5);
  uint64_t v8 = (void *)sub_1C277B820();
  v4[2](v4, v8);
  swift_bridgeObjectRelease();

  _Block_release(v4);
}

- (void)remote_fetchOrchestrationGraphWithCompletion:(id)a3
{
  v4 = (void (**)(void *, void *))_Block_copy(a3);
  uint64_t v5 = *(void *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v5 + 32);
  v9 = self;
  v7(ObjectType, v5);
  uint64_t v8 = (void *)sub_1C277BA30();
  v4[2](v4, v8);
  swift_bridgeObjectRelease();

  _Block_release(v4);
}

- (void)remote_deleteCacheAndTerminateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1C26B9C98;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = *(void *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  uint64_t ObjectType = swift_getObjectType();
  v9 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v7 + 40);
  v10 = self;
  swift_retain();
  v9(sub_1C27268C4, v6, ObjectType, v7);

  swift_release();

  swift_release();
}

- (void)remote_cancelAllGenerationWithCompletion:(id)a3
{
  v4 = (void (**)(void))_Block_copy(a3);
  uint64_t v5 = *(void *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v5 + 48);
  uint64_t v8 = self;
  v7(ObjectType, v5);
  v4[2](v4);
  _Block_release(v4);
}

- (void)remote_runBackgroundGenerationWithPlugins:(id)a3 commitAsUrgent:(BOOL)a4 generationType:(unint64_t)a5 completion:(id)a6
{
  BOOL v17 = a4;
  uint64_t v8 = _Block_copy(a6);
  if (a3) {
    uint64_t v9 = sub_1C277BA40();
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1C26B9D50;
  *(void *)(v11 + 24) = v10;
  uint64_t v12 = *(void *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_1C2664914;
  *(void *)(v13 + 24) = v11;
  v14 = *(void (**)(uint64_t, BOOL, unint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v12 + 64);
  v15 = self;
  swift_retain();
  swift_retain();
  v14(v9, v17, a5, sub_1C2726918, v13, ObjectType, v12);

  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)remote_requestBackgroundGenerationForFeedItemsAfterUnlockWithCompletion:(id)a3
{
  v4 = (void (**)(void))_Block_copy(a3);
  uint64_t v5 = *(void *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v5 + 72);
  uint64_t v8 = self;
  v7(ObjectType, v5);
  v4[2](v4);
  _Block_release(v4);
}

- (void)remote_requestBackgroundGenerationForAllModelsAfterUnlockWithCompletion:(id)a3
{
  v4 = (void (**)(void))_Block_copy(a3);
  uint64_t v5 = *(void *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v5 + 80);
  uint64_t v8 = self;
  v7(ObjectType, v5);
  v4[2](v4);
  _Block_release(v4);
}

- (void)remote_runOrRequestBackgroundGenerationWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1C2718FF4;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = *(void *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v7 + 88);
  uint64_t v10 = self;
  swift_retain();
  v9(sub_1C261AED4, v6, ObjectType, v7);

  swift_release();

  swift_release();
}

- (_TtC14HealthPlatform28HealthAppOrchestrationServer)init
{
  result = (_TtC14HealthPlatform28HealthAppOrchestrationServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectRelease();
}

@end