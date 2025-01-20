@interface GCCurrentApplicationForegroundMonitor
@end

@implementation GCCurrentApplicationForegroundMonitor

void __56___GCCurrentApplicationForegroundMonitor_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_Shared;
  sharedInstance_Shared = v0;
}

void __46___GCCurrentApplicationForegroundMonitor_init__block_invoke(uint64_t a1)
{
  v2 = +[NSNotificationCenter defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_CBApplicationWillResignActive_ name:UIApplicationWillResignActiveNotification object:0];

  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel_CBApplicationDidBecomeActive_ name:UIApplicationDidBecomeActiveNotification object:0];

  v4 = +[UIApplication sharedApplication];
  unsigned __int8 v5 = [v4 applicationState] != 0;

  atomic_store(v5, (unsigned __int8 *)(*(void *)(a1 + 32) + 16));
}

uint64_t __68___GCCurrentApplicationForegroundMonitor_addObserver_notifyCurrent___block_invoke(uint64_t a1)
{
  -[_GCCurrentApplicationForegroundMonitor addObserver:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  int v2 = [*(id *)(a1 + 32) isAppInBackground];
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    return [v3 CBApplicationWillResignActive];
  }
  else
  {
    return [v3 CBApplicationDidBecomeActive];
  }
}

void __71___GCCurrentApplicationForegroundMonitor_CBApplicationDidBecomeActive___block_invoke(uint64_t a1)
{
}

void __72___GCCurrentApplicationForegroundMonitor_CBApplicationWillResignActive___block_invoke(uint64_t a1)
{
}

@end