@interface AppDelegateService
- (AppDelegateService)init;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (void)setLocalPlayer:(id)a3;
@end

@implementation AppDelegateService

- (AppDelegateService)init
{
  v5.receiver = self;
  v5.super_class = (Class)AppDelegateService;
  v2 = [(AppDelegateService *)&v5 init];
  if (v2)
  {
    GKUISetRemote();
    v3 = +[GKDaemonProxy daemonProxy];
    [v3 setDataUpdateDelegate:v2];
  }
  return v2;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  if (a3 == 12)
  {
    id v5 = +[GKPreferences shared];
    [v5 synchronize];
  }
}

- (void)setLocalPlayer:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[GKLocalPlayer localPlayer];
    [v4 updateFromLocalPlayer:v3];
  }
}

@end