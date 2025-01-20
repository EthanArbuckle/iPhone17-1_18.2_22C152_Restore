@interface InCallBannerHostViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)menuPresented;
- (_TtC15ConversationKit30InCallBannerHostViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit30InCallBannerHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation InCallBannerHostViewController

- (_TtC15ConversationKit30InCallBannerHostViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  InCallBannerHostViewController.init(coder:)();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  InCallBannerHostViewController.viewDidLoad()();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  InCallBannerHostViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (BOOL)menuPresented
{
  v2 = self;
  char v3 = InCallBannerHostViewController.menuPresented.getter();

  return v3 & 1;
}

- (_TtC15ConversationKit30InCallBannerHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  InCallBannerHostViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30InCallBannerHostViewController_inCallBannerDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30InCallBannerHostViewController_controlsManager));
  outlined destroy of ConversationControlsType((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30InCallBannerHostViewController_controlsType);
  outlined destroy of Conversation?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30InCallBannerHostViewController_notice, &demangling cache variable for type metadata for Notice?);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30InCallBannerHostViewController_features));
  char v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit30InCallBannerHostViewController_conversationControlsViewController);
}

@end