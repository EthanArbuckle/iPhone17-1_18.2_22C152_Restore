@interface VideoReactionPickerViewController
- (BOOL)_canShowWhileLocked;
- (_TtC15ConversationKit33VideoReactionPickerViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit33VideoReactionPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation VideoReactionPickerViewController

- (_TtC15ConversationKit33VideoReactionPickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  VideoReactionPickerViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  VideoReactionPickerViewController.viewDidLoad()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15ConversationKit33VideoReactionPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  VideoReactionPickerViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
}

@end