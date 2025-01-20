@interface PHCarPlayRootContainerViewController
- (PHCarPlayMainMenuContainerViewController)mainMenuContainerViewController;
- (PHCarPlayRootContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UINavigationController)wrapperNavigationController;
- (id)preferredFocusEnvironments;
- (void)loadView;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)setMainMenuContainerViewController:(id)a3;
- (void)setWrapperNavigationController:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PHCarPlayRootContainerViewController

- (PHCarPlayRootContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PHCarPlayRootContainerViewController;
  return [(PHCarPlayRootContainerViewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (void)loadView
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 200.0, 120.0];
  [(PHCarPlayRootContainerViewController *)self setView:v3];
  v4 = objc_alloc_init(PHCarPlayMainMenuContainerViewController);
  [(PHCarPlayRootContainerViewController *)self setMainMenuContainerViewController:v4];

  id v5 = objc_alloc((Class)UINavigationController);
  v6 = [(PHCarPlayRootContainerViewController *)self mainMenuContainerViewController];
  id v7 = [v5 initWithRootViewController:v6];

  [v7 setDelegate:self];
  v8 = [v7 view];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"PHONE" value:&stru_100285990 table:@"PHCarPlay"];
  v11 = [(PHCarPlayRootContainerViewController *)self mainMenuContainerViewController];
  v12 = [v11 navigationItem];
  [v12 setTitle:v10];

  v13 = [(PHCarPlayRootContainerViewController *)self mainMenuContainerViewController];
  v14 = [v13 view];
  [v14 setAutoresizingMask:18];

  [(PHCarPlayRootContainerViewController *)self addChildViewController:v7];
  v15 = [(PHCarPlayRootContainerViewController *)self view];
  v16 = [v7 view];
  [v15 addSubview:v16];

  [(PHCarPlayRootContainerViewController *)self setWrapperNavigationController:v7];
  v17 = [(PHCarPlayRootContainerViewController *)self view];
  CFStringRef v27 = @"view";
  v18 = [v7 view];
  v28 = v18;
  v19 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  v20 = +[NSLayoutConstraint constraintsWithVisualFormat:@"|[view]|" options:0 metrics:0 views:v19];
  [v17 addConstraints:v20];

  v21 = [(PHCarPlayRootContainerViewController *)self view];
  CFStringRef v25 = @"view";
  v22 = [v7 view];
  v26 = v22;
  v23 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  v24 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:0 views:v23];
  [v21 addConstraints:v24];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHCarPlayRootContainerViewController;
  [(PHCarPlayRootContainerViewController *)&v5 viewWillAppear:a3];
  v4 = [(PHCarPlayRootContainerViewController *)self wrapperNavigationController];
  [v4 setNavigationBarHidden:1 animated:0];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 viewControllers];
  id v10 = [v9 objectAtIndex:0];

  v11 = PHDefaultLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10 == v7)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      v13 = "-> Hiding the navigation bar.";
      v14 = buf;
      goto LABEL_6;
    }
  }
  else if (v12)
  {
    __int16 v15 = 0;
    v13 = "-> Showing the navigation bar.";
    v14 = (uint8_t *)&v15;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
  }

  [v8 setNavigationBarHidden:v10 == v7 animated:v5];
}

- (id)preferredFocusEnvironments
{
  id v3 = [(PHCarPlayRootContainerViewController *)self childViewControllers];
  v4 = [v3 firstObject];

  if (v4)
  {
    BOOL v5 = [(PHCarPlayRootContainerViewController *)self childViewControllers];
    v6 = [v5 firstObject];
    id v10 = v6;
    id v7 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PHCarPlayRootContainerViewController;
    id v7 = [(PHCarPlayRootContainerViewController *)&v9 preferredFocusEnvironments];
  }

  return v7;
}

- (PHCarPlayMainMenuContainerViewController)mainMenuContainerViewController
{
  return (PHCarPlayMainMenuContainerViewController *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMainMenuContainerViewController:(id)a3
{
}

- (UINavigationController)wrapperNavigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWrapperNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapperNavigationController, 0);

  objc_storeStrong((id *)&self->_mainMenuContainerViewController, 0);
}

@end