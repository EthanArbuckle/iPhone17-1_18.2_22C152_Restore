@interface FBANetworkMonitor
+ (FBANetworkMonitor)sharedInstance;
- (BOOL)_isConnectedToCellNetwork;
- (BOOL)isConnectedToCellNetwork;
- (BOOL)shouldShowWaitingOnWifi;
- (FBANetworkMonitor)init;
- (FBANetworkMonitorDelegate)delegate;
- (Reachability)reachability;
- (id)allowCellDefaultKey;
- (id)reachabilityWithHost:(id)a3;
- (void)dealloc;
- (void)reachabilityDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsConnectedToCellNetwork:(BOOL)a3;
- (void)setReachability:(id)a3;
- (void)updateCache;
@end

@implementation FBANetworkMonitor

- (FBANetworkMonitor)init
{
  v3 = +[FBKSharedConstants appleSeedURL];
  v4 = [v3 URLByAppendingPathComponent:@"sp"];
  v5 = [v4 path];

  v13.receiver = self;
  v13.super_class = (Class)FBANetworkMonitor;
  v6 = [(FBANetworkMonitor *)&v13 init];
  v7 = v6;
  if (v6) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    v9 = [(FBANetworkMonitor *)v6 reachabilityWithHost:v5];
    [(FBANetworkMonitor *)v7 setReachability:v9];

    v10 = [(FBANetworkMonitor *)v7 reachability];
    [v10 startNotifier];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v7 selector:"reachabilityDidChange:" name:off_100121AF8 object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FBANetworkMonitor;
  [(FBANetworkMonitor *)&v4 dealloc];
}

- (id)reachabilityWithHost:(id)a3
{
  return +[Reachability reachabilityWithHostName:a3];
}

- (id)allowCellDefaultKey
{
  return FBKAllowCellularFileUploads;
}

+ (FBANetworkMonitor)sharedInstance
{
  if (qword_100123FA8 != -1) {
    dispatch_once(&qword_100123FA8, &stru_1000F2A00);
  }
  v2 = (void *)qword_100123FA0;

  return (FBANetworkMonitor *)v2;
}

- (BOOL)shouldShowWaitingOnWifi
{
  v3 = +[NSUserDefaults standardUserDefaults];
  objc_super v4 = [(FBANetworkMonitor *)self allowCellDefaultKey];
  unsigned __int8 v5 = [v3 BOOLForKey:v4];

  return [(FBANetworkMonitor *)self isConnectedToCellNetwork] & ~v5;
}

- (void)reachabilityDidChange:(id)a3
{
  objc_super v4 = [(FBANetworkMonitor *)self reachability];
  id v5 = [v4 currentReachabilityStatus];

  if (v5 == (id)2)
  {
    [(FBANetworkMonitor *)self setIsConnectedToCellNetwork:1];
    v7 = [(FBANetworkMonitor *)self delegate];

    if (!v7) {
      return;
    }
    id v8 = [(FBANetworkMonitor *)self delegate];
    [v8 connectionDidChangeToCellular];
  }
  else
  {
    if (v5 != (id)1) {
      return;
    }
    [(FBANetworkMonitor *)self setIsConnectedToCellNetwork:0];
    v6 = [(FBANetworkMonitor *)self delegate];

    if (!v6) {
      return;
    }
    id v8 = [(FBANetworkMonitor *)self delegate];
    [v8 connectionDidChangeToWifi];
  }
}

- (BOOL)_isConnectedToCellNetwork
{
  v2 = [(FBANetworkMonitor *)self reachability];
  id v3 = [v2 currentReachabilityStatus];

  return v3 == (id)2;
}

- (void)updateCache
{
  BOOL v3 = [(FBANetworkMonitor *)self _isConnectedToCellNetwork];

  [(FBANetworkMonitor *)self setIsConnectedToCellNetwork:v3];
}

- (FBANetworkMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBANetworkMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isConnectedToCellNetwork
{
  return self->_isConnectedToCellNetwork;
}

- (void)setIsConnectedToCellNetwork:(BOOL)a3
{
  self->_isConnectedToCellNetwork = a3;
}

- (Reachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachability, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end