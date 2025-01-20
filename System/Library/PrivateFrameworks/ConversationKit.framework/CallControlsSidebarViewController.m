@interface CallControlsSidebarViewController
- (BOOL)isCaptioningEnabled;
- (_TtC15ConversationKit33CallControlsSidebarViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit33CallControlsSidebarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)wantsDismissal;
@end

@implementation CallControlsSidebarViewController

- (_TtC15ConversationKit33CallControlsSidebarViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  CallControlsSidebarViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  CallControlsSidebarViewController.viewDidLoad()();
}

- (_TtC15ConversationKit33CallControlsSidebarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  CallControlsSidebarViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33CallControlsSidebarViewController____lazy_storage___contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33CallControlsSidebarViewController____lazy_storage___detailsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33CallControlsSidebarViewController____lazy_storage___topConverView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33CallControlsSidebarViewController____lazy_storage___bottomBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33CallControlsSidebarViewController_controlsManager));
  swift_release();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit33CallControlsSidebarViewController_captionsStateController;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

- (BOOL)isCaptioningEnabled
{
  v2 = self;
  char v3 = CallControlsSidebarViewController.isCaptioningEnabled.getter();

  return v3 & 1;
}

- (void)wantsDismissal
{
  v2 = self;
  CallControlsSidebarViewController.wantsDismissal()();
}

@end