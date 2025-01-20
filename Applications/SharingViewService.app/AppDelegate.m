@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (void)applicationWillTerminate:(id)a3;
@end

@implementation AppDelegate

- (void)applicationWillTerminate:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_1001CC180 <= 30)
  {
    id v5 = v3;
    if (dword_1001CC180 != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v5, v3))
    {
      id v3 = (id)LogPrintF();
      id v4 = v5;
    }
  }

  _objc_release_x1(v3, v4);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (dword_1001CC180 <= 30 && (dword_1001CC180 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  SFAWDEnsureInitialized();

  return 1;
}

@end