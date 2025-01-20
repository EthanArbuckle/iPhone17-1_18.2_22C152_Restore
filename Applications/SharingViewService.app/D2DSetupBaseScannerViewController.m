@interface D2DSetupBaseScannerViewController
- (BOOL)_canShowWhileLocked;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation D2DSetupBaseScannerViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000184C8(0, type metadata accessor for D2DSetupBaseScannerViewController, &OBJC_IVAR____TtC18SharingViewService33D2DSetupBaseScannerViewController_viewModel);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100018FE0(a3, 0, (uint64_t (*)(uint64_t))type metadata accessor for D2DSetupBaseScannerViewController, (SEL *)&selRef_viewWillAppear_, "D2D Setup %@ viewWillAppear");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_100018FE0(a3, 0, (uint64_t (*)(uint64_t))type metadata accessor for D2DSetupBaseScannerViewController, (SEL *)&selRef_viewDidDisappear_, "D2D Setup %@ viewDidDisappear");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
}

@end