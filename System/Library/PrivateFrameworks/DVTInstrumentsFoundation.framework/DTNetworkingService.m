@interface DTNetworkingService
+ (id)serviceName;
+ (void)registerCapabilities:(id)a3;
- (DTNetworkingService)initWithChannel:(id)a3;
- (void)messageReceived:(id)a3;
- (void)setTargetPID:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation DTNetworkingService

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  [v4 publishCapability:@"com.apple.instruments.server.services.networking" withVersion:2 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.networking.immediate" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.networking.deferred" withVersion:1 forClass:a1];
}

- (DTNetworkingService)initWithChannel:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)DTNetworkingService;
  v3 = [(DTXService *)&v19 initWithChannel:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_filteredToPid = -1;
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.dt.instruments.networking", 0);
    workQueue = v4->_workQueue;
    v4->_workQueue = (OS_dispatch_queue *)v5;

    v4->_netstatMan = 0;
    v4->_isAppleInternal = +[DTInstrumentServer isAppleInternal];
    v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v8 = [v7 BOOLForKey:@"XRIncludeLoopback"];

    if ((v8 & 1) != 0 || (int v18 = 0, !sub_230884DA0((uint64_t)"lo0", &v18))) {
      NSLog(&cfstr_IncludingLoopb.isa);
    }
    else {
      v4->_hiddenInterfaces |= 1 << v18;
    }
    int v18 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = [&unk_26E533E30 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(&unk_26E533E30);
          }
          if (sub_230884DA0([*(id *)(*((void *)&v14 + 1) + 8 * v12) UTF8String], &v18))
          {
            v4->_hiddenInterfaces |= 1 << v18;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [&unk_26E533E30 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v10);
    }
  }
  return v4;
}

- (void)messageReceived:(id)a3
{
  if ([a3 errorStatus] == 2)
  {
    self->_seenInterfaces = 0;
    self->_isDisconnected = 1;
    MEMORY[0x270F9A6D0](self, sel_stopMonitoring);
  }
}

- (void)startMonitoring
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_230885058;
  v4[3] = &unk_264B8D760;
  objc_copyWeak(&v5, &location);
  dispatch_sync(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (id)serviceName
{
  return @"com.apple.instruments.server.services.networking";
}

- (void)stopMonitoring
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23088539C;
  block[3] = &unk_264B8D590;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

- (void)setTargetPID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 intValue];
    int v7 = v6;
    if ((v6 - 1000001) < 0xFFF0BDBE)
    {
      NSLog(&cfstr_SuppliedPidToF.isa, v6);
      self->_filteredToPid = -1;
    }
  }
  else
  {
    NSLog(&cfstr_PassedANilPidF.isa);
    int v7 = -1;
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308854C4;
  block[3] = &unk_264B8D788;
  block[4] = self;
  int v10 = v7;
  dispatch_async(workQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end