@interface FIUINavigationController
- (BOOL)shouldAutorotate;
- (FIUINavigationController)initWithRootViewController:(id)a3;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation FIUINavigationController

- (FIUINavigationController)initWithRootViewController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FIUINavigationController;
  v3 = [(FIUINavigationController *)&v8 initWithRootViewController:a3];
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x263F81708], "fu_sausageFontOfSize:", 18.0);
    v5 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v4, *MEMORY[0x263F814F0], 0);
    v6 = [(FIUINavigationController *)v3 navigationBar];
    [v6 setTitleTextAttributes:v5];
  }
  return v3;
}

- (BOOL)shouldAutorotate
{
  v2 = [(FIUINavigationController *)self topViewController];
  char v3 = [v2 shouldAutorotate];

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(FIUINavigationController *)self topViewController];
  unint64_t v3 = [v2 supportedInterfaceOrientations];

  return v3;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  v2 = [(FIUINavigationController *)self topViewController];
  int64_t v3 = [v2 preferredInterfaceOrientationForPresentation];

  return v3;
}

@end