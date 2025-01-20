@interface Application
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (UIWindow)window;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
- (void)applicationWillTerminate:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation Application

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)applicationWillTerminate:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BuddyApplicationAndSceneSharedStorage setupController];
  [(SetupController *)v3 willTerminate];

  objc_storeStrong(location, 0);
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  v5 = +[UIDevice currentDevice];
  id v6 = [(UIDevice *)v5 userInterfaceIdiom];

  if (v6 == (id)1) {
    unint64_t v10 = 30;
  }
  else {
    unint64_t v10 = 2;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
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