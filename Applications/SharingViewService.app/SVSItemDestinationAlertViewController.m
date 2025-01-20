@interface SVSItemDestinationAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (SVSItemDestinationAlertViewController)initWithCoder:(id)a3;
- (SVSItemDestinationAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation SVSItemDestinationAlertViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_100069EE0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_100093B40(a3, v6, v7);
  sub_100017C38((uint64_t)v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100094B38(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_100094DFC(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (SVSItemDestinationAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (SVSItemDestinationAlertViewController *)sub_100096340(v5, v7, a4);
}

- (SVSItemDestinationAlertViewController)initWithCoder:(id)a3
{
  return (SVSItemDestinationAlertViewController *)sub_1000964A8(a3);
}

- (void).cxx_destruct
{
  sub_1000118F8((uint64_t)self + OBJC_IVAR___SVSItemDestinationAlertViewController_viewModel, &qword_1001CA5B8);
  v3 = *(void **)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___SVSItemDestinationAlertViewController_replyAction];
}

@end