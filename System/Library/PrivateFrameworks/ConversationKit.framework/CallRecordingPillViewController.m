@interface CallRecordingPillViewController
- (BOOL)_canShowWhileLocked;
- (_TtC15ConversationKit31CallRecordingPillViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit31CallRecordingPillViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation CallRecordingPillViewController

- (_TtC15ConversationKit31CallRecordingPillViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  CallRecordingPillViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  CallRecordingPillViewController.viewDidLoad()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15ConversationKit31CallRecordingPillViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  CallRecordingPillViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit31CallRecordingPillViewController_viewModel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit31CallRecordingPillViewController____lazy_storage___countdownView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit31CallRecordingPillViewController____lazy_storage___recordingView);
}

@end