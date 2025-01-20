@interface HomePodSetupFeatureListViewController
- (_TtC14HDSViewService37HomePodSetupFeatureListViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HomePodSetupFeatureListViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10005F2A0();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupFeatureListViewController();
  id v4 = v5.receiver;
  [(HomePodSetupFeatureListViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10007E75C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC14HDSViewService37HomePodSetupFeatureListViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  objc_super v5 = (_TtC14HDSViewService37HomePodSetupFeatureListViewController *)sub_1000608DC((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  sub_10001371C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupFeatureListViewController_presenter]);
  swift_bridgeObjectRelease();

  sub_100017068((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupFeatureListViewController_viewModel]);
  BOOL v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupFeatureListViewController_stackView];
}

@end