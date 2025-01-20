@interface VCPInternetReachability
+ (id)sharedInstance;
- (BOOL)hasWifiOrEthernetConnection;
- (VCPInternetReachability)init;
- (void)dealloc;
- (void)setReachabilityForFlags:(unsigned int)a3 update:(BOOL)a4;
@end

@implementation VCPInternetReachability

- (VCPInternetReachability)init
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)VCPInternetReachability;
  v2 = [(VCPInternetReachability *)&v15 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&address.sa_len = 528;
    *(void *)&address.sa_data[6] = 0;
    context.version = 0;
    context.info = v2;
    memset(&context.retain, 0, 24);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mediaanalysis.reachability", 0);
    callbackQueue = v3->_callbackQueue;
    v3->_callbackQueue = (OS_dispatch_queue *)v4;

    if (v3->_callbackQueue
      && (v6 = SCNetworkReachabilityCreateWithAddress(0, &address), (v3->_reachability = v6) != 0)
      && SCNetworkReachabilitySetCallback(v6, (SCNetworkReachabilityCallBack)ReachabilityCallback, &context)
      && SCNetworkReachabilitySetDispatchQueue(v3->_reachability, (dispatch_queue_t)v3->_callbackQueue))
    {
      v7 = v3->_callbackQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __31__VCPInternetReachability_init__block_invoke;
      block[3] = &unk_1E6296FF8;
      v12 = v3;
      dispatch_sync(v7, block);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v8 = VCPLogInstance();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEFAULT, "Reachability initialization failed; assuming no connection",
            buf,
            2u);
        }
      }
      v3->_hasWifiOrEthernetConnection = 0;
    }
    v9 = v3;
  }

  return v3;
}

void __31__VCPInternetReachability_init__block_invoke(uint64_t a1)
{
  SCNetworkReachabilityFlags flags = 0;
  if (SCNetworkReachabilityGetFlags(*(SCNetworkReachabilityRef *)(*(void *)(a1 + 32) + 16), &flags))
  {
    [*(id *)(a1 + 32) setReachabilityForFlags:flags update:0];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v2 = VCPLogInstance();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "Reachability flags invalid; assuming no connection",
          v3,
          2u);
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  }
}

+ (id)sharedInstance
{
  if (+[VCPInternetReachability sharedInstance]::once != -1) {
    dispatch_once(&+[VCPInternetReachability sharedInstance]::once, &__block_literal_global_2);
  }
  v2 = (void *)+[VCPInternetReachability sharedInstance]::instance;
  return v2;
}

void __41__VCPInternetReachability_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VCPInternetReachability);
  v1 = (void *)+[VCPInternetReachability sharedInstance]::instance;
  +[VCPInternetReachability sharedInstance]::instance = (uint64_t)v0;
}

- (void)dealloc
{
  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilitySetDispatchQueue(reachability, 0);
    CFRelease(self->_reachability);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPInternetReachability;
  [(VCPInternetReachability *)&v4 dealloc];
}

- (void)setReachabilityForFlags:(unsigned int)a3 update:(BOOL)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (a3 & 0x28) != 0;
  if ((a3 & 0x10) != 0) {
    BOOL v5 = 0;
  }
  if ((a3 & 4) == 0) {
    BOOL v5 = 1;
  }
  if ((a3 & 0x40000) != 0) {
    BOOL v5 = 0;
  }
  if ((a3 & 2) == 0) {
    BOOL v5 = 0;
  }
  if (!a4 || self->_hasWifiOrEthernetConnection != v5)
  {
    self->_hasWifiOrEthernetConnection = v5;
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        if (self->_hasWifiOrEthernetConnection) {
          v7 = "C";
        }
        else {
          v7 = "Not c";
        }
        int v8 = 136315138;
        v9 = v7;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "%sonnected to internet via WiFi/Ethernet", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

- (BOOL)hasWifiOrEthernetConnection
{
  return self->_hasWifiOrEthernetConnection;
}

- (void).cxx_destruct
{
}

@end