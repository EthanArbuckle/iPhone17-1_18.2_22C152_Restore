@interface PushToTalkFullScreenViewController
- (BOOL)_canShowWhileLocked;
- (_TtC15ConversationKit34PushToTalkFullScreenViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit34PushToTalkFullScreenViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation PushToTalkFullScreenViewController

- (_TtC15ConversationKit34PushToTalkFullScreenViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  PushToTalkFullScreenViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  PushToTalkFullScreenViewController.viewDidLoad()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15ConversationKit34PushToTalkFullScreenViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  PushToTalkFullScreenViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit34PushToTalkFullScreenViewController____lazy_storage___backgroundMaterialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit34PushToTalkFullScreenViewController_conversationControlsManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit34PushToTalkFullScreenViewController_pttView));
  swift_bridgeObjectRelease();
}

@end