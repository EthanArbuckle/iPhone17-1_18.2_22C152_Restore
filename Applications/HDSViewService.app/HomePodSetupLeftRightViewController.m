@interface HomePodSetupLeftRightViewController
- (_TtC14HDSViewService35HomePodSetupLeftRightViewController)initWithContentView:(id)a3;
- (void)leftButtonPressed:(id)a3;
- (void)rightButtonPressed:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HomePodSetupLeftRightViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10006AB74();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupLeftRightViewController();
  id v4 = v5.receiver;
  [(HomePodSetupLeftRightViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10007E75C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)leftButtonPressed:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_10006BD54();
}

- (void)rightButtonPressed:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_10006BEB0();
}

- (_TtC14HDSViewService35HomePodSetupLeftRightViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  objc_super v5 = (_TtC14HDSViewService35HomePodSetupLeftRightViewController *)sub_10006C00C((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  sub_10001371C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService35HomePodSetupLeftRightViewController_presenter]);

  BOOL v3 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService35HomePodSetupLeftRightViewController_viewModel];

  sub_100017068((uint64_t)v3);
}

@end