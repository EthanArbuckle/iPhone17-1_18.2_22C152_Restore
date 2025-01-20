@interface AKRemoteBaseViewController
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation AKRemoteBaseViewController

- (void)loadView
{
  id v3 = objc_alloc_init((Class)UIView);
  [(AKRemoteBaseViewController *)self setView:v3];

  v4 = +[UIColor clearColor];
  v5 = [(AKRemoteBaseViewController *)self view];
  [v5 setBackgroundColor:v4];

  id v6 = [(AKRemoteBaseViewController *)self view];
  [v6 setClipsToBounds:0];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)AKRemoteBaseViewController;
  [(AKRemoteBaseViewController *)&v2 viewDidLoad];
}

@end