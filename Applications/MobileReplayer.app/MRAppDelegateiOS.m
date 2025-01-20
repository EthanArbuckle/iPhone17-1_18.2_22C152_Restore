@interface MRAppDelegateiOS
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (void)applicationWillTerminate:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation MRAppDelegateiOS

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a3;
  sub_100003F80((uint64_t)v19, 1, 1);
  id v6 = objc_alloc((Class)UIWindow);
  v7 = +[UIScreen mainScreen];
  [v7 bounds];
  id v8 = [v6 initWithFrame:];
  v9 = *(void **)(&self->super._shouldCreateViewController + 1);
  *(void *)(&self->super._shouldCreateViewController + 1) = v8;

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v18[0] = xmmword_100005EF8;
  v18[1] = unk_100005F08;
  v11 = CGColorCreate(DeviceRGB, (const CGFloat *)v18);
  id v12 = objc_alloc((Class)UIView);
  [*(id *)(&self->super._shouldCreateViewController + 1) bounds];
  id v13 = [v12 initWithFrame:];
  v14 = [v13 layer];
  [v14 setBackgroundColor:v11];

  CGColorRelease(v11);
  CGColorSpaceRelease(DeviceRGB);
  [v5 setIdleTimerDisabled:1];
  [v5 setIdleTimerDisabled:1];
  v15 = (UIWindow *)objc_alloc_init((Class)UIViewController);
  v16 = *(UIWindow **)((char *)&self->_window + 1);
  *(UIWindow **)((char *)&self->_window + 1) = v15;

  [*(id *)((char *)&self->_window + 1) setView:v13];
  [*(id *)(&self->super._shouldCreateViewController + 1) setRootViewController:*(UIWindow **)((char *)&self->_window + 1)];
  [*(id *)(&self->super._shouldCreateViewController + 1) makeKeyAndVisible];

  sub_10000404C((uint64_t)v19);
  [(MRAppDelegate *)self startupAndCreateViewController:1];

  return 1;
}

- (void)applicationWillTerminate:(id)a3
{
}

- (void)setViewController:(id)a3
{
  id v4 = a3;
  sub_100003F80((uint64_t)v5, 1, 1);
  if (v4) {
    [*(id *)(&self->super._shouldCreateViewController + 1) setRootViewController:v4];
  }
  else {
    [*(id *)(&self->super._shouldCreateViewController + 1) setRootViewController:*(UIWindow **)((char *)&self->_window + 1)];
  }
  sub_10000404C((uint64_t)v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_window + 1), 0);

  objc_storeStrong((id *)(&self->super._shouldCreateViewController + 1), 0);
}

@end