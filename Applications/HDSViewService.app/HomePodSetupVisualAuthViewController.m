@interface HomePodSetupVisualAuthViewController
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HomePodSetupVisualAuthViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10006E83C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10006EFAC(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupVisualAuthViewController();
  id v4 = v5.receiver;
  [(HomePodSetupVisualAuthViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10007E75C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_10006F73C(a3);
}

- (void).cxx_destruct
{
  sub_10001371C((uint64_t)self + OBJC_IVAR____TtC14HDSViewService36HomePodSetupVisualAuthViewController_presenter);
  BOOL v3 = &self->super.viewfinderViewController[OBJC_IVAR____TtC14HDSViewService36HomePodSetupVisualAuthViewController_viewModel];

  sub_100017068((uint64_t)v3);
}

@end