@interface _EXExtensionApplicationDelegate
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)applicationDidFinishLaunching:(id)a3;
@end

@implementation _EXExtensionApplicationDelegate

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[_EXRunningUIExtension sharedInstance];
  char v8 = [v7 application:v6 willFinishLaunchingWithOptions:v5];

  return v8;
}

- (void)applicationDidFinishLaunching:(id)a3
{
  id v3 = a3;
  id v4 = +[_EXRunningUIExtension sharedInstance];
  [v4 applicationDidFinishLaunching:v3];
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[_EXRunningUIExtension sharedInstance];
  v11 = [v10 application:v9 configurationForConnectingSceneSession:v8 options:v7];

  return v11;
}

@end