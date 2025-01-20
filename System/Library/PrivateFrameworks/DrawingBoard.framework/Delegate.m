@interface Delegate
- (_TtC12DrawingBoard8Delegate)init;
- (void)scene:(id)a3 willUpdateSettings:(id)a4;
- (void)sceneDidActivate:(id)a3;
@end

@implementation Delegate

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a3;
  id v9 = a4;
  v8 = self;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }

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
  id v6 = a3;
  v5 = self;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }

  swift_release();
  swift_release();
}

- (_TtC12DrawingBoard8Delegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  v4 = [(Delegate *)&v6 init];
  swift_release();
  return v4;
}

@end