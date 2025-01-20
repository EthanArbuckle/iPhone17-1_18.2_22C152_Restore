@interface BuddyLockscreenSceneDelegate
- (UIWindow)lockscreenWindow;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setLockscreenWindow:(id)a3;
@end

@implementation BuddyLockscreenSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  v21 = self;
  SEL v20 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() ^ 1))
  {
    v7 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v7 handleFailureInMethod:v20, v21, @"BuddyLockscreenSceneDelegate.m", 36, @"Invalid parameter not satisfying: %@", @"[scene isKindOfClass:[UIWindowScene class]]" object file lineNumber description];
  }
  id v16 = location;
  v8 = +[BuddyApplicationAndSceneSharedStorage setupController];
  v9 = [(SetupController *)v8 miscState];
  id v15 = [(BuddyMiscState *)v9 migrationLockscreenController];

  v10 = [(BuddyLockscreenSceneDelegate *)v21 lockscreenWindow];
  LOBYTE(v8) = v10 == 0;

  if (v8)
  {
    id v11 = [objc_alloc((Class)sub_1001BE84C()) initWithWindowScene:v16];
    [(BuddyLockscreenSceneDelegate *)v21 setLockscreenWindow:v11];
  }
  v12 = [(BuddyLockscreenSceneDelegate *)v21 lockscreenWindow];
  id v13 = [v15 navigationController];
  [(UIWindow *)v12 setRootViewController:v13];

  v14 = [(BuddyLockscreenSceneDelegate *)v21 lockscreenWindow];
  [(UIWindow *)v14 makeKeyAndVisible];

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&location, 0);
}

- (void)sceneDidDisconnect:(id)a3
{
  v10 = self;
  SEL v9 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() ^ 1))
  {
    v3 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v3 handleFailureInMethod:v9, v10, @"BuddyLockscreenSceneDelegate.m", 51, @"Invalid parameter not satisfying: %@", @"[scene isKindOfClass:[UIWindowScene class]]" object file lineNumber description];
  }
  v4 = [(BuddyLockscreenSceneDelegate *)v10 lockscreenWindow];
  v5 = [(UIWindow *)v4 windowScene];
  v6 = (UIWindowScene *)location;

  if (v5 == v6)
  {
    v7 = [(BuddyLockscreenSceneDelegate *)v10 lockscreenWindow];
    [(UIWindow *)v7 setHidden:1];

    [(BuddyLockscreenSceneDelegate *)v10 setLockscreenWindow:0];
  }
  objc_storeStrong(&location, 0);
}

- (UIWindow)lockscreenWindow
{
  return self->_lockscreenWindow;
}

- (void)setLockscreenWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end