@interface HostedSceneObserver
- (_TtC12DrawingBoard19HostedSceneObserver)init;
- (id)scene:(id)a3 handleActions:(id)a4;
- (void)scene:(id)a3 didUpdateHostHandle:(id)a4;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
@end

@implementation HostedSceneObserver

- (_TtC12DrawingBoard19HostedSceneObserver)init
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (_TtC12DrawingBoard19HostedSceneObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
  sub_24CFA8380(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__hostHandle), *(void *)&self->scene[OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__hostHandle]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__displayConfiguration));
  v3 = (char *)self + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver___observationRegistrar;
  uint64_t v4 = sub_24CFD2F18();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (void)scene:(id)a3 didUpdateHostHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24CFA7F84(a4);
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24CFA6DFC(v6);
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  sub_24CF949B8(0, (unint64_t *)&qword_269848B88);
  sub_24CF91064();
  uint64_t v4 = (void *)sub_24CFD34C8();
  return v4;
}

@end