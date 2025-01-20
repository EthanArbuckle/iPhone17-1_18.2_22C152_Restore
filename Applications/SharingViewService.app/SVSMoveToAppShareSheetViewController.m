@interface SVSMoveToAppShareSheetViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (SVSMoveToAppShareSheetViewController)initWithCoder:(id)a3;
- (SVSMoveToAppShareSheetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation SVSMoveToAppShareSheetViewController

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
  sub_100070C0C(a3, v6, v7);
  sub_100017C38((uint64_t)v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100072188(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_10007242C(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (SVSMoveToAppShareSheetViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (SVSMoveToAppShareSheetViewController *)sub_100072F98(v5, v7, a4);
}

- (SVSMoveToAppShareSheetViewController)initWithCoder:(id)a3
{
  return (SVSMoveToAppShareSheetViewController *)sub_1000730B0(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(void **)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___SVSMoveToAppShareSheetViewController_replyAction];
}

@end