@interface HomePodSetupPersonalRequestsViewController
- (_TtC14HDSViewService42HomePodSetupPersonalRequestsViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HomePodSetupPersonalRequestsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100083C30();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1000851F0(a3);
}

- (_TtC14HDSViewService42HomePodSetupPersonalRequestsViewController)initWithContentView:(id)a3
{
  *(void *)&self->presenter[OBJC_IVAR____TtC14HDSViewService42HomePodSetupPersonalRequestsViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  v5 = &self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC14HDSViewService42HomePodSetupPersonalRequestsViewController_viewModel];
  uint64_t v6 = type metadata accessor for HomePodSetupViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC14HDSViewService42HomePodSetupPersonalRequestsViewController_isConfigured] = 0;
  *(void *)&self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC14HDSViewService42HomePodSetupPersonalRequestsViewController_bodyLabel] = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HomePodSetupPersonalRequestsViewController();
  return [(HomePodSetupPersonalRequestsViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
  sub_10001371C((uint64_t)&self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC14HDSViewService42HomePodSetupPersonalRequestsViewController_presenter]);
  sub_10000F674((uint64_t)&self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC14HDSViewService42HomePodSetupPersonalRequestsViewController_viewModel], &qword_1000EF130);
  v3 = *(void **)&self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC14HDSViewService42HomePodSetupPersonalRequestsViewController_bodyLabel];
}

@end