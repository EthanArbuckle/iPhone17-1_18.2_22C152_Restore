@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (UIWindow)window;
- (void)applicationWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = objc_alloc((Class)UINavigationController);
  v6 = objc_opt_new();
  id v7 = [v5 initWithRootViewController:v6];

  id v8 = objc_alloc((Class)UIWindow);
  v9 = +[UIScreen mainScreen];
  [v9 bounds];
  id v10 = [v8 initWithFrame:];
  [(AppDelegate *)self setWindow:v10];

  v11 = +[UIColor blackColor];
  v12 = [(AppDelegate *)self window];
  [v12 setBackgroundColor:v11];

  v13 = [(AppDelegate *)self window];
  [v13 setRootViewController:v7];

  v14 = [(AppDelegate *)self window];
  [v14 makeKeyAndVisible];

  return 1;
}

- (void)applicationWillResignActive:(id)a3
{
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end