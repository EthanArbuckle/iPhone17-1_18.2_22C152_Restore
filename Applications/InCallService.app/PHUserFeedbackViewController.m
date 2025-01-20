@interface PHUserFeedbackViewController
- (PHUserFeedbackViewController)init;
- (PHUserFeedbackViewController)initWithCoder:(id)a3;
- (PHUserFeedbackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PHUserFeedbackViewController)initWithScoreController:(id)a3;
- (void)viewDidLoad;
@end

@implementation PHUserFeedbackViewController

- (PHUserFeedbackViewController)initWithScoreController:(id)a3
{
  return (PHUserFeedbackViewController *)UserFeedbackViewController.init(scoreController:)((uint64_t)a3);
}

- (PHUserFeedbackViewController)init
{
}

- (PHUserFeedbackViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  UserFeedbackViewController.viewDidLoad()();
}

- (PHUserFeedbackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  UserFeedbackViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
}

@end