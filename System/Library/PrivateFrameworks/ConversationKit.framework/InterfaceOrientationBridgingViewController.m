@interface InterfaceOrientationBridgingViewController
- (BOOL)_canShowWhileLocked;
- (_TtC15ConversationKit42InterfaceOrientationBridgingViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit42InterfaceOrientationBridgingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation InterfaceOrientationBridgingViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  InterfaceOrientationBridgingViewController.viewDidLoad()();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  InterfaceOrientationBridgingViewController.viewDidMove(to:shouldAppearOrDisappear:)((UIWindow_optional *)v6, 0);
}

- (_TtC15ConversationKit42InterfaceOrientationBridgingViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC15ConversationKit42InterfaceOrientationBridgingViewController *)InterfaceOrientationBridgingViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC15ConversationKit42InterfaceOrientationBridgingViewController)initWithCoder:(id)a3
{
  return (_TtC15ConversationKit42InterfaceOrientationBridgingViewController *)InterfaceOrientationBridgingViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end