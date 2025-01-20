@interface CARSettingsAppDelegate
+ (CARSettingsAppDelegate)sharedDelegate;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (CARCarManager)carManager;
- (CARSignpostManager)signpostManager;
- (UIWindow)window;
- (void)setWindow:(id)a3;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CARSettingsAppDelegate

+ (CARSettingsAppDelegate)sharedDelegate
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 delegate];

  return (CARSettingsAppDelegate *)v3;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = objc_alloc_init(CARCarManager);
  carManager = self->_carManager;
  self->_carManager = v5;

  v7 = objc_alloc_init(CARSignpostManager);
  signpostManager = self->_signpostManager;
  self->_signpostManager = v7;

  v9 = +[UNUserNotificationCenter currentNotificationCenter];
  [v9 setDelegate:self];

  id v10 = objc_alloc((Class)NSSet);
  v11 = +[UNNotificationCategory categoryWithIdentifier:@"CarPlaySettings" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:2];
  v16 = v11;
  v12 = +[NSArray arrayWithObjects:&v16 count:1];
  id v13 = [v10 initWithArray:v12];

  v14 = +[UNUserNotificationCenter currentNotificationCenter];
  [v14 setNotificationCategories:v13];

  +[CARSignpostManager emitLaunched];
  return 1;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (CARCarManager)carManager
{
  return self->_carManager;
}

- (CARSignpostManager)signpostManager
{
  return self->_signpostManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostManager, 0);
  objc_storeStrong((id *)&self->_carManager, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end