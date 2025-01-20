@interface DemoApplication
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationDidFinishLaunching:(id)a3;
- (void)sendEvent:(id)a3;
@end

@implementation DemoApplication

- (void)applicationDidFinishLaunching:(id)a3
{
  id v4 = objc_alloc((Class)UIWindow);
  v5 = +[UIScreen mainScreen];
  [v5 bounds];
  v6 = [v4 initWithFrame:];
  window = self->_window;
  self->_window = v6;

  v8 = [[DemoPlayerViewController alloc] initWithNibName:0 bundle:0];
  playerViewController = self->_playerViewController;
  self->_playerViewController = v8;

  [(UIWindow *)self->_window setRootViewController:self->_playerViewController];
  v10 = self->_window;

  [(UIWindow *)v10 makeKeyAndVisible];
}

- (void)applicationDidEnterBackground:(id)a3
{
}

- (void)sendEvent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DemoApplication;
  id v4 = a3;
  [(DemoApplication *)&v6 sendEvent:v4];
  id v5 = [v4 type];

  if (!v5) {
    [(DemoApplication *)self suspend];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerViewController, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end