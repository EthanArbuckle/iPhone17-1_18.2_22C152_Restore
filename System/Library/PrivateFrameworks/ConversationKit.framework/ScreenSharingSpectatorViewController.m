@interface ScreenSharingSpectatorViewController
- (BOOL)_canShowWhileLocked;
- (_TtC15ConversationKit36ScreenSharingSpectatorViewController)init;
- (_TtC15ConversationKit36ScreenSharingSpectatorViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit36ScreenSharingSpectatorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation ScreenSharingSpectatorViewController

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  unint64_t v3 = ScreenSharingSpectatorViewController.supportedInterfaceOrientations.getter();

  return v3;
}

- (_TtC15ConversationKit36ScreenSharingSpectatorViewController)init
{
  return (_TtC15ConversationKit36ScreenSharingSpectatorViewController *)ScreenSharingSpectatorViewController.init()();
}

- (_TtC15ConversationKit36ScreenSharingSpectatorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  ScreenSharingSpectatorViewController.init(coder:)();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v2 = self;
  ScreenSharingSpectatorViewController.loadView()();
}

- (void)viewDidLoad
{
  v2 = self;
  ScreenSharingSpectatorViewController.viewDidLoad()();
}

- (_TtC15ConversationKit36ScreenSharingSpectatorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  ScreenSharingSpectatorViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit36ScreenSharingSpectatorViewController_contentViewController));
  swift_release();
}

@end