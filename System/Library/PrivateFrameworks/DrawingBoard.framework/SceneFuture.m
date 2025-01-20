@interface SceneFuture
- (BOOL)isEqual:(id)a3;
- (_TtC12DrawingBoard11SceneFuture)init;
- (id)scene:(id)a3 handleActions:(id)a4;
- (void)scene:(id)a3 clientDidConnect:(id)a4;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidInvalidate:(id)a3 withContext:(id)a4;
- (void)sceneWillActivate:(id)a3;
- (void)sceneWillDeactivate:(id)a3 withContext:(id)a4;
@end

@implementation SceneFuture

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_24CFD35B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_24CFCE86C((uint64_t)v8);

  sub_24CF92868((uint64_t)v8, &qword_2698488B0);
  return v6 & 1;
}

- (_TtC12DrawingBoard11SceneFuture)init
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (_TtC12DrawingBoard11SceneFuture *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24CF928C4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12DrawingBoard11SceneFuture_onUpdate));
  sub_24CF92868((uint64_t)self + OBJC_IVAR____TtC12DrawingBoard11SceneFuture_processToken, (uint64_t *)&unk_269849AC0);

  v3 = (char *)self + OBJC_IVAR____TtC12DrawingBoard11SceneFuture___observationRegistrar;
  uint64_t v4 = sub_24CFD2F18();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (void)sceneDidInvalidate:(id)a3 withContext:(id)a4
{
}

- (void)sceneContentStateDidChange:(id)a3
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  char v6 = self;
  sub_24CFCF3BC();
  swift_release();
}

- (void)sceneWillActivate:(id)a3
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  char v6 = self;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  memset(v7, 0, sizeof(v7));
  uint64_t v8 = 0;
  unint64_t v9 = 0xA000000000000000;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  sub_24CFCEE8C((uint64_t)v7);
  swift_release();

  swift_release();
}

- (void)sceneDidActivate:(id)a3
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  char v6 = self;
  sub_24CFD0820();
  swift_release();
}

- (void)sceneWillDeactivate:(id)a3 withContext:(id)a4
{
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = self;
  sub_24CFD0ACC();
  swift_release();
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CF949B8(0, (unint64_t *)&qword_269848B88);
  sub_24CF91064();
  unint64_t v6 = sub_24CFD34D8();
  id v7 = a3;
  id v8 = self;
  sub_24CFD0C24(v6);
  uint64_t v10 = v9;

  swift_bridgeObjectRelease();
  if (v10)
  {
    uint64_t v11 = (void *)sub_24CFD34C8();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    uint64_t v11 = 0;
  }
  return v11;
}

@end