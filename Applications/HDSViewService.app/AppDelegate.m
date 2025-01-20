@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (void)applicationWillTerminate:(id)a3;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (void)applicationWillTerminate:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_1000ED0A0 <= 30)
  {
    id v5 = v3;
    if (dword_1000ED0A0 != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v5, v3))
    {
      id v3 = (id)LogPrintF();
      id v4 = v5;
    }
  }

  _objc_release_x1(v3, v4);
}

@end