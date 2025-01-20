@interface ICSCarPlayAlertViewController
- (ICSCarPlayAlertViewController)initWithCoder:(id)a3;
- (ICSCarPlayAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP13InCallService34CarPlayAlertViewControllerDelegate_)delegate;
- (void)callAgain;
- (void)closeAlert;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)loadView;
- (void)playSound;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICSCarPlayAlertViewController

- (_TtP13InCallService34CarPlayAlertViewControllerDelegate_)delegate
{
  v2 = (void *)sub_1001B5CE0();

  return (_TtP13InCallService34CarPlayAlertViewControllerDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1001B5D50();
}

- (void)loadView
{
  v2 = self;
  sub_1001B5DF0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001B5E98();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1001B5FF0(a3);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001B60B8(v6, (uint64_t)v7);
}

- (void)playSound
{
  v2 = self;
  sub_1001B6ABC((SEL *)&selRef_shouldPlaySound);
}

- (void)callAgain
{
  v2 = self;
  sub_1001B6ABC((SEL *)&selRef_shouldCallAgain);
}

- (void)closeAlert
{
  v2 = self;
  sub_1001B6B70();
}

- (ICSCarPlayAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (ICSCarPlayAlertViewController *)sub_1001B6BD0(v5, v7, a4);
}

- (ICSCarPlayAlertViewController)initWithCoder:(id)a3
{
  return (ICSCarPlayAlertViewController *)sub_1001B6CE0(a3);
}

- (void).cxx_destruct
{
}

@end