@interface HomePodSetupDisclaimerViewController
- (_TtC14HDSViewService36HomePodSetupDisclaimerViewController)initWithContentView:(id)a3;
- (void)moreInfoButtonTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HomePodSetupDisclaimerViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10001558C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupDisclaimerViewController();
  id v4 = v5.receiver;
  [(HomePodSetupDisclaimerViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10007E75C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)moreInfoButtonTapped:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_100016BCC();
}

- (_TtC14HDSViewService36HomePodSetupDisclaimerViewController)initWithContentView:(id)a3
{
  *(void *)&self->presenter[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  objc_super v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController_viewModel];
  uint64_t v6 = type metadata accessor for HomePodSetupViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController_termsManager] = 0;
  *(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController____lazy_storage___moreInfoButton] = 0;
  *(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController____lazy_storage___disclaimerLabel] = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HomePodSetupDisclaimerViewController();
  return [(HomePodSetupDisclaimerViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
  sub_10001371C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController_presenter]);
  sub_100017068((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController_viewModel]);

  BOOL v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController____lazy_storage___disclaimerLabel];
}

@end