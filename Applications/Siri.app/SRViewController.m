@interface SRViewController
- (BOOL)_canShowWhileLocked;
- (id)preferredFocusEnvironments;
- (void)_cleanupAllViews;
- (void)didBecomeActiveHandler;
- (void)setUpViews;
- (void)tearDownViews;
- (void)viewDidLoad;
- (void)willEnterForegroundHandler;
- (void)willResignActiveHandler;
@end

@implementation SRViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SRViewController;
  [(SRViewController *)&v5 viewDidLoad];
  v3 = [(SRViewController *)self view];
  v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];
}

- (id)preferredFocusEnvironments
{
  if (self->_siriVC)
  {
    siriVC = self->_siriVC;
    v2 = +[NSArray arrayWithObjects:&siriVC count:1];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SRViewController;
    v2 = [(SRViewController *)&v4 preferredFocusEnvironments];
  }

  return v2;
}

- (BOOL)_canShowWhileLocked
{
  return _SiriUISafeForLockScreen(self, a2);
}

- (void)setUpViews
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

- (void)_cleanupAllViews
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

- (void)tearDownViews
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

- (void)didBecomeActiveHandler
{
}

- (void)willResignActiveHandler
{
}

- (void)willEnterForegroundHandler
{
}

- (void).cxx_destruct
{
}

@end