@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (UIWindow)window;
- (void)setWindow:(id)a3;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = objc_alloc((Class)UIWindow);
  v6 = +[UIScreen mainScreen];
  [v6 bounds];
  id v7 = [v5 initWithFrame:];
  [(AppDelegate *)self setWindow:v7];

  v8 = +[UIColor blackColor];
  v9 = [(AppDelegate *)self window];
  [v9 setBackgroundColor:v8];

  v10 = objc_opt_new();
  v11 = [(AppDelegate *)self window];
  [v11 setRootViewController:v10];

  v12 = [(AppDelegate *)self window];
  [v12 makeKeyAndVisible];

  return 1;
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