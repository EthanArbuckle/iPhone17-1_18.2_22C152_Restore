@interface ShareViewController
- (_TtC15ConversationKit19ShareViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit19ShareViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ShareViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  ShareViewController.viewDidAppear(_:)(a3);
}

- (_TtC15ConversationKit19ShareViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC15ConversationKit19ShareViewController *)ShareViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC15ConversationKit19ShareViewController)initWithCoder:(id)a3
{
  return (_TtC15ConversationKit19ShareViewController *)ShareViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19ShareViewController_backgroundSendUtility));
  swift_release();
}

@end