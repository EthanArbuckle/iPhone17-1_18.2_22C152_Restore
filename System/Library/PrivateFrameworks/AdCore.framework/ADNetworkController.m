@interface ADNetworkController
+ (id)sharedNetworkController;
- (BOOL)canReachTheNetwork;
- (BOOL)isUpdating;
- (id)getDataContext:(id)a3;
- (int)cellNetworkType;
- (int)dataIndicatorToConnection:(int)a3;
- (int)networkType;
- (void)_checkForNetwork;
- (void)_checkForNetworkAndNotify;
- (void)_updateStatus:(BOOL)a3;
- (void)setCanReachTheNetwork:(BOOL)a3;
- (void)setIsUpdating:(BOOL)a3;
- (void)start;
@end

@implementation ADNetworkController

- (void)_checkForNetwork
{
  v3 = [NSString stringWithFormat:@"[%@] Looking up network type.", objc_opt_class()];
  _ADLog(@"ToroLogging", v3, 0);

  unsigned int reachabilityFlags = self->_reachabilityFlags;
  if ((reachabilityFlags & 2) != 0)
  {
    self->_uint64_t networkType = 2;
    if ((reachabilityFlags & 0x40000) != 0)
    {
      v6 = [NSString stringWithFormat:@"kSCNetworkReachabilityFlagsIsWWAN is true! We are NOT on WiFi"];
      _ADLog(@"ToroLogging", v6, 0);

      self->_uint64_t networkType = [(ADNetworkController *)self cellNetworkType];
    }
    else
    {
      v5 = [NSString stringWithFormat:@"kSCNetworkReachabilityFlagsIsWWAN is false! We are on WiFi"];
      _ADLog(@"ToroLogging", v5, 0);
    }
  }
  if (!self->_networkType) {
    self->_uint64_t networkType = [(ADNetworkController *)self cellNetworkType];
  }
  v7 = NSString;
  uint64_t v8 = objc_opt_class();
  uint64_t networkType = self->_networkType;
  if (networkType >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_networkType);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E68A0960[networkType];
  }
  v12 = v10;
  v11 = [v7 stringWithFormat:@"[%@] Network has a type of: %@", v8, v10];
  _ADLog(@"ToroLogging", v11, 0);
}

- (int)cellNetworkType
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F23A80]);
  v4 = [(ADNetworkController *)self getDataContext:v3];
  id v12 = 0;
  v5 = [v3 getDataStatus:v4 error:&v12];
  id v6 = v12;
  v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    v9 = [NSString stringWithFormat:@"Unable to find cell network type due no data or error: %@", v6];
    _ADLog(@"iAdSettingsLogging", v9, 16);
  }
  int v10 = -[ADNetworkController dataIndicatorToConnection:](self, "dataIndicatorToConnection:", [v5 indicator]);

  return v10;
}

- (id)getDataContext:(id)a3
{
  id v8 = 0;
  id v3 = [a3 getPreferredDataSubscriptionContextSync:&v8];
  id v4 = v8;
  v5 = v4;
  if (!v3 || v4)
  {
    id v6 = [NSString stringWithFormat:@"Unable to find telephone subscription context due to error: %@", v4];
    _ADLog(@"iAdSettingsLogging", v6, 16);
  }
  return v3;
}

- (int)dataIndicatorToConnection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v12[13] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)dataIndicatorToConnection__indicatorToConnectionDictionary;
  if (!dataIndicatorToConnection__indicatorToConnectionDictionary)
  {
    v11[0] = &unk_1F27150E8;
    v11[1] = &unk_1F2715118;
    v12[0] = &unk_1F2715100;
    v12[1] = &unk_1F2715130;
    v11[2] = &unk_1F2715148;
    v11[3] = &unk_1F2715178;
    v12[2] = &unk_1F2715160;
    v12[3] = &unk_1F2715190;
    v11[4] = &unk_1F27151A8;
    v11[5] = &unk_1F27151D8;
    v12[4] = &unk_1F27151C0;
    v12[5] = &unk_1F27151F0;
    v11[6] = &unk_1F2715208;
    v11[7] = &unk_1F2715238;
    v12[6] = &unk_1F2715220;
    v12[7] = &unk_1F2715250;
    v11[8] = &unk_1F2715268;
    v11[9] = &unk_1F2715298;
    v12[8] = &unk_1F2715280;
    v12[9] = &unk_1F2715280;
    v11[10] = &unk_1F27152B0;
    v11[11] = &unk_1F27152C8;
    v12[10] = &unk_1F2715280;
    v12[11] = &unk_1F2715280;
    v11[12] = &unk_1F27152E0;
    v12[12] = &unk_1F2715280;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:13];
    id v6 = (void *)dataIndicatorToConnection__indicatorToConnectionDictionary;
    dataIndicatorToConnection__indicatorToConnectionDictionary = v5;

    id v4 = (void *)dataIndicatorToConnection__indicatorToConnectionDictionary;
  }
  v7 = [NSNumber numberWithUnsignedInt:v3];
  id v8 = [v4 objectForKeyedSubscript:v7];
  int v9 = [v8 integerValue];

  return v9;
}

uint64_t __46__ADNetworkController_sharedNetworkController__block_invoke(uint64_t a1)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___ADNetworkController;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "init");
  v2 = (void *)sharedNetworkController_sharedNetworkController;
  sharedNetworkController_sharedNetworkController = v1;

  return [(id)sharedNetworkController_sharedNetworkController start];
}

- (void)_updateStatus:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ADNetworkController *)self canReachTheNetwork] != a3)
  {
    uint64_t v5 = NSString;
    uint64_t v6 = objc_opt_class();
    v7 = @"is not";
    if (v3) {
      v7 = @"is";
    }
    id v8 = [v5 stringWithFormat:@"[%@] Network %@ connected.", v6, v7];
    _ADLog(@"iAdInternalLogging", v8, 0);

    [(ADNetworkController *)self setCanReachTheNetwork:v3];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__ADNetworkController__updateStatus___block_invoke;
    block[3] = &unk_1E68A0940;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)start
{
  [(ADNetworkController *)self setCanReachTheNetwork:0];
  self->_isUpdating = 0;
  BOOL v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ap.adprivacyd.networkwatcher", 0);
  queue = self->_queue;
  self->_queue = v3;

  uint64_t v5 = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__ADNetworkController_start__block_invoke;
  block[3] = &unk_1E68A0940;
  block[4] = self;
  dispatch_async(v5, block);
  if (!self->_reachability)
  {
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = self;
    uint64_t v6 = SCNetworkReachabilityCreateWithName((CFAllocatorRef)*MEMORY[0x1E4F1CF80], "apple.com");
    self->_reachability = v6;
    if (!v6)
    {
      v7 = @"[%@] Unable to create reachability object.";
      goto LABEL_7;
    }
    if (!SCNetworkReachabilitySetCallback(v6, (SCNetworkReachabilityCallBack)_reachabilityDidChange, &context)
      || !SCNetworkReachabilitySetDispatchQueue(self->_reachability, (dispatch_queue_t)self->_queue))
    {
      v7 = @"[%@] Could not set reachability callback or queue.";
LABEL_7:
      id v8 = objc_msgSend(NSString, "stringWithFormat:", v7, objc_opt_class());
      _ADLog(@"iAdInternalLogging", v8, 16);

      self->_unsigned int reachabilityFlags = 0;
    }
  }
}

- (void)setCanReachTheNetwork:(BOOL)a3
{
  self->_canReachTheNetwork = a3;
}

- (BOOL)canReachTheNetwork
{
  return self->_canReachTheNetwork;
}

void __48__ADNetworkController__checkForNetworkAndNotify__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"ADNetworkDidChangeNotification" object:0];
}

uint64_t __37__ADNetworkController__updateStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkForNetworkAndNotify];
}

uint64_t __28__ADNetworkController_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkForNetworkAndNotify];
}

- (void)_checkForNetworkAndNotify
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_isUpdating)
  {
    obj->_isUpdating = 1;
    BOOL v3 = [NSString stringWithFormat:@"[%@] Checking for the network and sending a notification.", objc_opt_class()];
    _ADLog(@"iAdInternalLogging", v3, 0);

    obj->_uint64_t networkType = 0;
    [(ADNetworkController *)obj _checkForNetwork];
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_9);
    v2 = obj;
    obj->_isUpdating = 0;
  }
  objc_sync_exit(v2);
}

+ (id)sharedNetworkController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ADNetworkController_sharedNetworkController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedNetworkController_onceToken != -1) {
    dispatch_once(&sharedNetworkController_onceToken, block);
  }
  v2 = (void *)sharedNetworkController_sharedNetworkController;
  return v2;
}

- (int)networkType
{
  v2 = self;
  objc_sync_enter(v2);
  int networkType = v2->_networkType;
  if (!networkType)
  {
    [(ADNetworkController *)v2 _checkForNetworkAndNotify];
    int networkType = v2->_networkType;
  }
  objc_sync_exit(v2);

  return networkType;
}

- (BOOL)isUpdating
{
  return self->_isUpdating;
}

- (void)setIsUpdating:(BOOL)a3
{
  self->_isUpdating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationTimer, 0);
}

@end