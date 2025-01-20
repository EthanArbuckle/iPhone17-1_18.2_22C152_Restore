@interface HomePodSetupStereoViewController
- (_TtC14HDSViewService32HomePodSetupStereoViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HomePodSetupStereoViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100071320();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupStereoViewController();
  id v4 = v5.receiver;
  [(HomePodSetupStereoViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10007E75C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC14HDSViewService32HomePodSetupStereoViewController)initWithContentView:(id)a3
{
  *(void *)&self->presenter[OBJC_IVAR____TtC14HDSViewService32HomePodSetupStereoViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  objc_super v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupStereoViewController_viewModel];
  uint64_t v6 = type metadata accessor for HomePodSetupViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupStereoViewController_isConfigured] = 0;
  *(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupStereoViewController_bodyLabel] = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HomePodSetupStereoViewController();
  return [(HomePodSetupStereoViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
  sub_10001371C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupStereoViewController_presenter]);
  sub_10000F674((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupStereoViewController_viewModel], &qword_1000EF130);
  BOOL v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupStereoViewController_bodyLabel];
}

@end