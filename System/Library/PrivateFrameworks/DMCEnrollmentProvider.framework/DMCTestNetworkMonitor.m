@interface DMCTestNetworkMonitor
- (BOOL)isNetworkAvailableWithFlags:(unsigned int)a3;
- (BOOL)verifyNetworkFlags:(unsigned int)a3;
- (DMCTestNetworkMonitor)initWithNetworkAvailableHandler:(id)a3;
- (__SCNetworkReachability)reachability;
- (id)availableHanlder;
- (void)setAvailableHanlder:(id)a3;
- (void)setReachability:(__SCNetworkReachability *)a3;
- (void)startMonitoring;
@end

@implementation DMCTestNetworkMonitor

- (DMCTestNetworkMonitor)initWithNetworkAvailableHandler:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMCTestNetworkMonitor;
  v5 = [(DMCTestNetworkMonitor *)&v13 init];
  if (v5)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__DMCTestNetworkMonitor_initWithNetworkAvailableHandler___block_invoke;
    v10[3] = &unk_2645E91B8;
    id v12 = v4;
    v6 = v5;
    v11 = v6;
    uint64_t v7 = MEMORY[0x223C90320](v10);
    id availableHanlder = v6->_availableHanlder;
    v6->_id availableHanlder = (id)v7;
  }
  return v5;
}

uint64_t __57__DMCTestNetworkMonitor_initWithNetworkAvailableHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startMonitoring
{
  v10[2] = *MEMORY[0x263EF8340];
  if (!self->_reachability)
  {
    v9[0] = @"nodename";
    v9[1] = @"ResolverBypass";
    v10[0] = @"www.apple.com";
    v10[1] = MEMORY[0x263EFFA88];
    v3 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    id v4 = (__SCNetworkReachability *)SCNetworkReachabilityCreateWithOptions();
    self->_reachability = v4;
    SCNetworkReachabilityFlags flags = 0;
    SCNetworkReachabilityGetFlags(v4, &flags);
    if (![(DMCTestNetworkMonitor *)self verifyNetworkFlags:flags])
    {
      v7.version = 0;
      memset(&v7.retain, 0, 24);
      v7.info = self;
      SCNetworkReachabilitySetCallback(self->_reachability, (SCNetworkReachabilityCallBack)_networkReachabilityCallback, &v7);
      reachability = self->_reachability;
      Main = CFRunLoopGetMain();
      SCNetworkReachabilityScheduleWithRunLoop(reachability, Main, (CFStringRef)*MEMORY[0x263EFFE78]);
    }
  }
}

- (BOOL)verifyNetworkFlags:(unsigned int)a3
{
  BOOL v4 = [(DMCTestNetworkMonitor *)self isNetworkAvailableWithFlags:*(void *)&a3];
  if (v4)
  {
    v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_221CC5000, v5, OS_LOG_TYPE_DEFAULT, "Network is available.", v10, 2u);
    }
    v6 = [(DMCTestNetworkMonitor *)self availableHanlder];
    v6[2]();

    [(DMCTestNetworkMonitor *)self setAvailableHanlder:0];
    SCNetworkReachabilitySetCallback(self->_reachability, 0, 0);
    reachability = self->_reachability;
    Main = CFRunLoopGetMain();
    SCNetworkReachabilityUnscheduleFromRunLoop(reachability, Main, (CFStringRef)*MEMORY[0x263EFFE78]);
    CFRelease(self->_reachability);
  }
  return v4;
}

- (BOOL)isNetworkAvailableWithFlags:(unsigned int)a3
{
  return (a3 >> 1) & 1;
}

- (__SCNetworkReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(__SCNetworkReachability *)a3
{
  self->_reachability = a3;
}

- (id)availableHanlder
{
  return self->_availableHanlder;
}

- (void)setAvailableHanlder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end