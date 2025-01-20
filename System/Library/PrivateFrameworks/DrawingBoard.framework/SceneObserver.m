@interface SceneObserver
- (_TtC12DrawingBoard13SceneObserver)init;
- (id)scene:(id)a3 handleActions:(id)a4;
- (void)scene:(id)a3 clientDidConnect:(id)a4;
- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4;
- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5;
- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
- (void)sceneWillDeactivate:(id)a3 withError:(id)a4;
@end

@implementation SceneObserver

- (_TtC12DrawingBoard13SceneObserver)init
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (_TtC12DrawingBoard13SceneObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
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
  v6 = self;
  sub_24CF8FA5C(v5);
  swift_release();
}

- (void)sceneDidActivate:(id)a3
{
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a3;
  v8 = self;
  id v9 = a4;
  sub_24CF91770(a4);
  swift_release();
}

- (void)sceneDidInvalidate:(id)a3
{
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
}

- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4
{
}

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  id v12 = a5;
  sub_24CF91C80(v10, 136, 5);
  swift_release();
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = self;
  sub_24CF91F18(v12, v13, a6);
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
  sub_24CF91024();
  sub_24CF91064();
  sub_24CFD34D8();
  id v6 = a3;
  id v7 = self;
  uint64_t v8 = sub_24CF925C0();

  swift_bridgeObjectRelease();
  if (v8)
  {
    id v9 = (void *)sub_24CFD34C8();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    id v9 = 0;
  }
  return v9;
}

@end