@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5 = a4;
  id v6 = objc_alloc((Class)UISceneConfiguration);
  v7 = [v5 role];

  id v8 = [v6 initWithName:@"Default Configuration" sessionRole:v7];

  return v8;
}

@end