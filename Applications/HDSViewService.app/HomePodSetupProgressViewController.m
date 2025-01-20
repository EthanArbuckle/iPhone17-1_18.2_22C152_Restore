@interface HomePodSetupProgressViewController
- (_TtC14HDSViewService34HomePodSetupProgressViewController)initWithContentView:(id)a3;
- (void)handleTimer:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HomePodSetupProgressViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000971BC();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100097804(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupProgressViewController();
  v4 = (char *)v5.receiver;
  [(HomePodSetupProgressViewController *)&v5 viewDidDisappear:v3];
  [*(id *)&v4[OBJC_IVAR____TtC14HDSViewService34HomePodSetupProgressViewController_timer] invalidate];
}

- (void)handleTimer:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_100099274();
}

- (_TtC14HDSViewService34HomePodSetupProgressViewController)initWithContentView:(id)a3
{
  *(void *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService34HomePodSetupProgressViewController_timer] = 0;
  objc_super v5 = &self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService34HomePodSetupProgressViewController_startDate];
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HomePodSetupProgressViewController();
  return [(HomePodSetupStereoViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
  sub_10000F674((uint64_t)self + OBJC_IVAR____TtC14HDSViewService34HomePodSetupProgressViewController_startDate, &qword_1000F0308);
}

@end