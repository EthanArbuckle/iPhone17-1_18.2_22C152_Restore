@interface PHCarPlayGenericViewController
- (BOOL)respondsToEventsWhileInCall;
- (BOOL)shouldRespondToHardwareControlEvent;
- (BOOL)viewIsInAppearedState;
- (PHCarPlayGenericViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setRespondsToEventsWhileInCall:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PHCarPlayGenericViewController

- (PHCarPlayGenericViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PHCarPlayGenericViewController;
  v4 = [(PHCarPlayGenericViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(PHCarPlayGenericViewController *)v4 setRespondsToEventsWhileInCall:1];
  }
  return v5;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayGenericViewController;
  [(PHCarPlayGenericViewController *)&v4 viewDidLoad];
  if (+[PHCarPlayUtilities activeInterfaceMechanismIsHardware])
  {
    v3 = [(PHCarPlayGenericViewController *)self navigationItem];
    [v3 setHidesBackButton:1];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHCarPlayGenericViewController;
  [(PHCarPlayGenericViewController *)&v5 viewDidAppear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"hardwareControlEventNotification:" name:TUCarPlayHardwareControlEventNotification object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHCarPlayGenericViewController;
  [(PHCarPlayGenericViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:TUCarPlayHardwareControlEventNotification object:0];
}

- (BOOL)viewIsInAppearedState
{
  return [(PHCarPlayGenericViewController *)self _appearState] - 1 < 2;
}

- (BOOL)shouldRespondToHardwareControlEvent
{
  v3 = +[TUCallCenter sharedInstance];
  if ([v3 currentAudioAndVideoCallCount])
  {
    unsigned __int8 v4 = [(PHCarPlayGenericViewController *)self respondsToEventsWhileInCall];

    if ((v4 & 1) == 0) {
      return 0;
    }
  }
  else
  {
  }
  if (![(PHCarPlayGenericViewController *)self isViewLoaded]
    || ![(PHCarPlayGenericViewController *)self viewIsInAppearedState])
  {
    return 0;
  }
  objc_super v5 = [(PHCarPlayGenericViewController *)self presentedViewController];
  BOOL v6 = v5 == 0;

  return v6;
}

- (BOOL)respondsToEventsWhileInCall
{
  return self->_respondsToEventsWhileInCall;
}

- (void)setRespondsToEventsWhileInCall:(BOOL)a3
{
  self->_respondsToEventsWhileInCall = a3;
}

@end