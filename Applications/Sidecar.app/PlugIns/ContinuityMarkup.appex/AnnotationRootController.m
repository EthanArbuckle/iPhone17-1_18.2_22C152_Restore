@interface AnnotationRootController
- (AnnotationRootController)initWithCoder:(id)a3;
- (AnnotationRootController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)_canShowWhileLocked;
- (int64_t)requestCompleted;
- (void)receivedItems:(id)a3;
- (void)requestDidStart:(id)a3;
- (void)viewDidLoad;
@end

@implementation AnnotationRootController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100009958();
}

- (void)requestDidStart:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100009CB8(v4);
}

- (void)receivedItems:(id)a3
{
  sub_100009294(0, &qword_100010C10);
  unint64_t v4 = sub_10000A240();
  v5 = self;
  sub_100009D4C(v4);

  swift_bridgeObjectRelease();
}

- (int64_t)requestCompleted
{
  return 2;
}

- (AnnotationRootController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10000A210();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (AnnotationRootController *)sub_100009DF4(v5, v7, a4);
}

- (AnnotationRootController)initWithCoder:(id)a3
{
  return (AnnotationRootController *)sub_100009F44(a3);
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->SidecarServiceViewController_opaque[OBJC_IVAR___AnnotationRootController_markupController];
}

@end