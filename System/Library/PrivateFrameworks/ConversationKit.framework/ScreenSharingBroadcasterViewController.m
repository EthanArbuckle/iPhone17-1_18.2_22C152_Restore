@interface ScreenSharingBroadcasterViewController
- (BOOL)_canShowWhileLocked;
- (_TtC15ConversationKit38ScreenSharingBroadcasterViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit38ScreenSharingBroadcasterViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation ScreenSharingBroadcasterViewController

- (_TtC15ConversationKit38ScreenSharingBroadcasterViewController)initWithCoder:(id)a3
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v2 = self;
  ScreenSharingBroadcasterViewController.loadView()();
}

- (_TtC15ConversationKit38ScreenSharingBroadcasterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  ScreenSharingBroadcasterViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38ScreenSharingBroadcasterViewController_bannerPresentationManager));
  swift_release();
}

@end