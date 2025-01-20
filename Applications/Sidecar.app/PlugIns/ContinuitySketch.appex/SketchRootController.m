@interface SketchRootController
- (BOOL)_canShowWhileLocked;
- (SketchRootController)initWithCoder:(id)a3;
- (SketchRootController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)requestCompleted;
- (void)viewDidLoad;
@end

@implementation SketchRootController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100006204();
}

- (int64_t)requestCompleted
{
  return 2;
}

- (SketchRootController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100006A00();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (SketchRootController *)sub_100006594(v5, v7, a4);
}

- (SketchRootController)initWithCoder:(id)a3
{
  return (SketchRootController *)sub_1000066E4(a3);
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->SidecarServiceViewController_opaque[OBJC_IVAR___SketchRootController_sketchController];
}

@end