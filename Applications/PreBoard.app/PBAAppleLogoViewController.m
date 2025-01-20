@interface PBAAppleLogoViewController
- (BOOL)_canShowWhileLocked;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation PBAAppleLogoViewController

- (void)loadView
{
  id v3 = [objc_alloc((Class)SBUIAppleLogoView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(PBAAppleLogoViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)PBAAppleLogoViewController;
  [(PBAAppleLogoViewController *)&v2 viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)PBAAppleLogoViewController;
  [(PBAAppleLogoViewController *)&v2 didReceiveMemoryWarning];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end