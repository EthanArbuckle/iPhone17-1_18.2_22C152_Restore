@interface HLPReachabilityManager
+ (id)defaultManager;
- (BOOL)connected;
- (BOOL)internetActive;
- (BOOL)isNetworkError:(id)a3;
- (BOOL)reachabilityInitialized;
- (HLPReachability)hostReachability;
- (HLPReachability)internetReachability;
- (HLPReachabilityManager)init;
- (HLPReachabilityManagerDelegate)delegate;
- (NSString)hostName;
- (void)dealloc;
- (void)reachabilityChanged:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHostName:(id)a3;
- (void)setHostReachability:(id)a3;
- (void)setInternetActive:(BOOL)a3;
- (void)setInternetReachability:(id)a3;
- (void)setReachabilityInitialized:(BOOL)a3;
- (void)startNotifier;
- (void)stopNotifier;
@end

@implementation HLPReachabilityManager

+ (id)defaultManager
{
  if (defaultManager_predicate != -1) {
    dispatch_once(&defaultManager_predicate, &__block_literal_global_3);
  }
  v2 = (void *)defaultManager_gSharedManager;
  return v2;
}

uint64_t __40__HLPReachabilityManager_defaultManager__block_invoke()
{
  defaultManager_gSharedManager = objc_alloc_init(HLPReachabilityManager);
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  [(HLPReachabilityManager *)self stopNotifier];
  v3.receiver = self;
  v3.super_class = (Class)HLPReachabilityManager;
  [(HLPReachabilityManager *)&v3 dealloc];
}

- (HLPReachabilityManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HLPReachabilityManager;
  v2 = [(HLPReachabilityManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[HLPReachability reachabilityForInternetConnection];
    internetReachability = v2->_internetReachability;
    v2->_internetReachability = (HLPReachability *)v3;

    v2->_internetActive = [(HLPReachability *)v2->_internetReachability currentReachabilityStatus] != 0;
  }
  return v2;
}

- (BOOL)isNetworkError:(id)a3
{
  return !self->_internetActive || [a3 code] == -1009;
}

- (void)startNotifier
{
  if (!self->_notifying)
  {
    self->_notifying = 1;
    if (!self->_hostReachability)
    {
      if (self->_hostName) {
        hostName = (__CFString *)self->_hostName;
      }
      else {
        hostName = @"www.apple.com";
      }
      v4 = +[HLPReachability reachabilityWithHostName:hostName];
      hostReachability = self->_hostReachability;
      self->_hostReachability = v4;
    }
    objc_super v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:self selector:sel_reachabilityChanged_ name:kHLPReachabilityChangedNotification[0] object:0];

    [(HLPReachability *)self->_internetReachability startNotifier];
    v7 = self->_hostReachability;
    [(HLPReachability *)v7 startNotifier];
  }
}

- (void)stopNotifier
{
  if (self->_notifying)
  {
    self->_notifying = 0;
    uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self];

    [(HLPReachability *)self->_internetReachability stopNotifier];
    [(HLPReachability *)self->_hostReachability stopNotifier];
    [(HLPReachabilityManager *)self setReachabilityInitialized:0];
  }
}

- (void)reachabilityChanged:(id)a3
{
  [(HLPReachabilityManager *)self setReachabilityInitialized:1];
  unint64_t v4 = [(HLPReachability *)self->_internetReachability currentReachabilityStatus];
  if (v4 <= 2) {
    self->_internetActive = 0x10100u >> (8 * v4);
  }
  unint64_t v5 = [(HLPReachability *)self->_hostReachability currentReachabilityStatus];
  if (v5 <= 2) {
    self->_BOOL hostActive = 0x10100u >> (8 * v5);
  }
  if (self->_internetActive)
  {
    BOOL hostActive = self->_hostActive;
    if ([(HLPReachabilityManager *)self connected] == hostActive) {
      return;
    }
  }
  else
  {
    if (![(HLPReachabilityManager *)self connected]) {
      return;
    }
    BOOL hostActive = 0;
  }
  [(HLPReachabilityManager *)self setConnected:hostActive];
  id v7 = [(HLPReachabilityManager *)self delegate];
  objc_msgSend(v7, "reachabilityManagerConnectionStatusChanged:connected:", self, -[HLPReachabilityManager connected](self, "connected"));
}

- (BOOL)reachabilityInitialized
{
  return self->_reachabilityInitialized;
}

- (void)setReachabilityInitialized:(BOOL)a3
{
  self->_reachabilityInitialized = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)internetActive
{
  return self->_internetActive;
}

- (void)setInternetActive:(BOOL)a3
{
  self->_internetActive = a3;
}

- (HLPReachabilityManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HLPReachabilityManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HLPReachability)internetReachability
{
  return self->_internetReachability;
}

- (void)setInternetReachability:(id)a3
{
}

- (HLPReachability)hostReachability
{
  return self->_hostReachability;
}

- (void)setHostReachability:(id)a3
{
}

- (NSString)hostName
{
  return self->_hostName;
}

- (void)setHostName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_hostReachability, 0);
  objc_storeStrong((id *)&self->_internetReachability, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end