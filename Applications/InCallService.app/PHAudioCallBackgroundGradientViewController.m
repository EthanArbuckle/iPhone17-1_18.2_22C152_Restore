@interface PHAudioCallBackgroundGradientViewController
- (BOOL)_canShowWhileLocked;
- (PHAudioCallBackgroundGradientViewController)initWithCoder:(id)a3;
- (PHAudioCallBackgroundGradientViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation PHAudioCallBackgroundGradientViewController

- (void)viewDidLoad
{
  v2 = self;
  AudioCallBackgroundGradientViewController.viewDidLoad()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PHAudioCallBackgroundGradientViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (PHAudioCallBackgroundGradientViewController *)AudioCallBackgroundGradientViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (PHAudioCallBackgroundGradientViewController)initWithCoder:(id)a3
{
  return (PHAudioCallBackgroundGradientViewController *)AudioCallBackgroundGradientViewController.init(coder:)(a3);
}

@end