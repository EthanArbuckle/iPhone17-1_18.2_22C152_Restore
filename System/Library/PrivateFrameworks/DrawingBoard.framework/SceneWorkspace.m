@interface SceneWorkspace
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC12DrawingBoard14SceneWorkspace)init;
- (void)workspace:(id)a3 didAddScene:(id)a4;
- (void)workspace:(id)a3 willRemoveScene:(id)a4;
@end

@implementation SceneWorkspace

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
  char v6 = SceneWorkspace.isEqual(_:)((uint64_t)v8);

  sub_24CF8DE78((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24CFD3398();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC12DrawingBoard14SceneWorkspace)init
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (_TtC12DrawingBoard14SceneWorkspace *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)workspace:(id)a3 didAddScene:(id)a4
{
}

- (void)workspace:(id)a3 willRemoveScene:(id)a4
{
}

@end