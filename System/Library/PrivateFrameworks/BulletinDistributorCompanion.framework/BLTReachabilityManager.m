@interface BLTReachabilityManager
+ (id)sharedInstance;
- (BLTReachabilityManager)init;
- (BOOL)isInternetReachable;
- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4;
- (void)interfaceRadioHotnessChanged:(id)a3;
- (void)interfaceReachabilityChanged:(id)a3;
- (void)setInternetReachable:(BOOL)a3;
@end

@implementation BLTReachabilityManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__BLTReachabilityManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance___sharedInstance_0;
  return v2;
}

uint64_t __40__BLTReachabilityManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance___sharedInstance_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (BLTReachabilityManager)init
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)BLTReachabilityManager;
  v2 = [(BLTReachabilityManager *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.bulletindistributor.reachability-updates", v3);
    updateQueue = v2->_updateQueue;
    v2->_updateQueue = (OS_dispatch_queue *)v4;

    v6 = [MEMORY[0x263F5D3F8] sharedInstanceForIdentifier:1];
    [v6 addDelegate:v2 queue:v2->_updateQueue];

    v7 = [MEMORY[0x263F5D3F8] sharedInstanceForIdentifier:0];
    [v7 addDelegate:v2 queue:v2->_updateQueue];

    v8 = [MEMORY[0x263F5D3F8] sharedInstanceForIdentifier:1];
    if ([v8 isInternetReachable])
    {
      v2->_internetReachable = 1;
      p_internetReachable = (unsigned __int8 *)&v2->_internetReachable;
    }
    else
    {
      v10 = [MEMORY[0x263F5D3F8] sharedInstanceForIdentifier:0];
      v2->_internetReachable = [v10 isInternetReachable];
      p_internetReachable = (unsigned __int8 *)&v2->_internetReachable;
    }
    v11 = blt_ids_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [MEMORY[0x263F5D3F8] sharedInstanceForIdentifier:1];
      v13 = [MEMORY[0x263F5D3F8] sharedInstanceForIdentifier:0];
      v14 = [NSNumber numberWithBool:*p_internetReachable];
      *(_DWORD *)buf = 138412802;
      v18 = v12;
      __int16 v19 = 2112;
      v20 = v13;
      __int16 v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_222F4C000, v11, OS_LOG_TYPE_DEFAULT, "according to sPCInterfaceMonitorWWAN=%@ sPCInterfaceMonitorNonCellular=%@ internet reachability = %@", buf, 0x20u);
    }
  }
  return v2;
}

- (void)interfaceReachabilityChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = 1;
  v6 = [MEMORY[0x263F5D3F8] sharedInstanceForIdentifier:1];
  if (([v6 isInternetReachable] & 1) == 0)
  {
    v7 = [MEMORY[0x263F5D3F8] sharedInstanceForIdentifier:0];
    uint64_t v5 = [v7 isInternetReachable];
  }
  if (self->_internetReachable != v5)
  {
    v8 = blt_ids_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [NSNumber numberWithBool:self->_internetReachable];
      v10 = [NSNumber numberWithBool:v5];
      int v12 = 138412802;
      id v13 = v4;
      __int16 v14 = 2112;
      v15 = v9;
      __int16 v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Internet reachability via %@ changed from %@ to %@", (uint8_t *)&v12, 0x20u);
    }
    [(BLTReachabilityManager *)self setInternetReachable:v5];
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 postNotificationName:@"BLTIDSDeviceConnectionStatusChangedNotification" object:0];
  }
}

- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = blt_ids_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [NSNumber numberWithInt:v4];
    v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "linkQuality"));
    int v9 = 138412802;
    id v10 = v5;
    __int16 v11 = 2112;
    int v12 = v7;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl(&dword_222F4C000, v6, OS_LOG_TYPE_INFO, "interfaceLinkQualityChanged %@ previousLinkQuality %@ currentLinkQuality %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)interfaceRadioHotnessChanged:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = blt_ids_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isRadioHot"));
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    int v9 = v5;
    _os_log_impl(&dword_222F4C000, v4, OS_LOG_TYPE_INFO, "interfaceLinkQualityChanged %@ hotness %@", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)isInternetReachable
{
  return self->_internetReachable;
}

- (void)setInternetReachable:(BOOL)a3
{
  self->_internetReachable = a3;
}

- (void).cxx_destruct
{
}

@end