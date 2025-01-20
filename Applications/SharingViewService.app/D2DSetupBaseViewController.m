@interface D2DSetupBaseViewController
- (BOOL)_canShowWhileLocked;
- (_TtC18SharingViewService26D2DSetupBaseViewController)initWithContentView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation D2DSetupBaseViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000184C8((uint64_t)v2, type metadata accessor for D2DSetupBaseViewController, &OBJC_IVAR____TtC18SharingViewService26D2DSetupBaseViewController_viewModel);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100018FE0(a3, (uint64_t)v4, (uint64_t (*)(uint64_t))type metadata accessor for D2DSetupBaseViewController, (SEL *)&selRef_viewWillAppear_, "D2D Setup %@ viewWillAppear");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_100018FE0(a3, (uint64_t)v4, (uint64_t (*)(uint64_t))type metadata accessor for D2DSetupBaseViewController, (SEL *)&selRef_viewDidDisappear_, "D2D Setup %@ viewDidDisappear");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC18SharingViewService26D2DSetupBaseViewController)initWithContentView:(id)a3
{
  return (_TtC18SharingViewService26D2DSetupBaseViewController *)sub_1000189B4((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC18SharingViewService26D2DSetupBaseViewController_presenter, &OBJC_IVAR____TtC18SharingViewService26D2DSetupBaseViewController_viewModel, (uint64_t (*)(uint64_t))type metadata accessor for D2DSetupBaseViewController);
}

- (void).cxx_destruct
{
}

@end