@interface LocalWindowScene
- (_TtC12DrawingBoard16LocalWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4;
- (void)_invalidate;
- (void)_readySceneForConnection;
@end

@implementation LocalWindowScene

- (void)_readySceneForConnection
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_24CFBE5C8();
  swift_release();
}

- (void)_invalidate
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4 = self;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(LocalWindowScene *)&v5 _invalidate];
  swift_release();

  swift_release();
}

- (_TtC12DrawingBoard16LocalWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12DrawingBoard16LocalWindowScene_myWindow) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = [(LocalWindowScene *)&v10 initWithSession:a3 connectionOptions:a4];
  swift_release();
  return v8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12DrawingBoard16LocalWindowScene_myWindow));
}

@end