@interface HomePodSetupPINEntryViewController
- (_TtC14HDSViewService34HomePodSetupPINEntryViewController)initWithContentView:(id)a3;
- (void)didCompleteTextEntry:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HomePodSetupPINEntryViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10005D078();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10005D940(a3);
}

- (void)didCompleteTextEntry:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10005E938(v4);
}

- (_TtC14HDSViewService34HomePodSetupPINEntryViewController)initWithContentView:(id)a3
{
  *(void *)&self->presenter[OBJC_IVAR____TtC14HDSViewService34HomePodSetupPINEntryViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  v5 = &self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC14HDSViewService34HomePodSetupPINEntryViewController_activityIndicatorTitle];
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0xE000000000000000;
  v6 = &self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC14HDSViewService34HomePodSetupPINEntryViewController_viewModel];
  uint64_t v7 = type metadata accessor for HomePodSetupViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for HomePodSetupPINEntryViewController();
  return [(HomePodSetupPINEntryViewController *)&v9 initWithContentView:a3];
}

- (void).cxx_destruct
{
  sub_10001371C((uint64_t)&self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC14HDSViewService34HomePodSetupPINEntryViewController_presenter]);
  swift_bridgeObjectRelease();
  v3 = &self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC14HDSViewService34HomePodSetupPINEntryViewController_viewModel];

  sub_100017068((uint64_t)v3);
}

@end