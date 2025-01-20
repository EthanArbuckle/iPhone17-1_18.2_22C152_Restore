@interface CallRecordingButtonViewController
- (BOOL)_canShowWhileLocked;
- (_TtC15ConversationKit33CallRecordingButtonViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit33CallRecordingButtonViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)buttonTapped;
- (void)textSizeDidChange;
- (void)viewDidLoad;
@end

@implementation CallRecordingButtonViewController

- (_TtC15ConversationKit33CallRecordingButtonViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  CallRecordingButtonViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  CallRecordingButtonViewController.viewDidLoad()();
}

- (void)buttonTapped
{
  v2 = self;
  CallRecordingButtonViewController.buttonTapped()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)textSizeDidChange
{
  v2 = self;
  CallRecordingButtonViewController.textSizeDidChange()();
}

- (_TtC15ConversationKit33CallRecordingButtonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  CallRecordingButtonViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33CallRecordingButtonViewController____lazy_storage___button));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit33CallRecordingButtonViewController____lazy_storage___educationScreen);
}

@end