@interface FlexReachability
+ (id)reachabilityForInternetConnection;
+ (id)reachabilityForLocalWiFi;
+ (id)reachabilityWithAddress:(const sockaddr_in *)a3;
+ (id)reachabilityWithHostName:(id)a3;
- (BOOL)connectionRequired;
- (BOOL)interventionRequired;
- (BOOL)startNotifier;
- (FlexReachability)init;
- (OS_dispatch_queue)reachabilityQueue;
- (int64_t)currentReachabilityStatus;
- (int64_t)localWiFiStatusForFlags:(unsigned int)a3;
- (int64_t)networkStatusForFlags:(unsigned int)a3;
- (void)dealloc;
- (void)setReachabilityQueue:(id)a3;
- (void)stopNotifier;
@end

@implementation FlexReachability

- (FlexReachability)init
{
  v7.receiver = self;
  v7.super_class = (Class)FlexReachability;
  v2 = [(FlexReachability *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.FlexMusic.reachability", v3);
    reachabilityQueue = v2->_reachabilityQueue;
    v2->_reachabilityQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)reachabilityWithHostName:(id)a3
{
  id v4 = a3;
  v9 = (const char *)objc_msgSend_UTF8String(v4, v5, v6, v7, v8);
  id result = SCNetworkReachabilityCreateWithName(0, v9);
  if (result)
  {
    id v11 = result;
    id result = objc_alloc_init((Class)a1);
    if (result)
    {
      *((void *)result + 2) = v11;
      *((unsigned char *)result + 9) = 0;
    }
  }
  return result;
}

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  id result = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x263EFFB08], (const sockaddr *)a3);
  if (result)
  {
    id v5 = result;
    id result = objc_alloc_init((Class)a1);
    if (result)
    {
      *((void *)result + 2) = v5;
      *((unsigned char *)result + 9) = 0;
    }
  }
  return result;
}

+ (id)reachabilityForInternetConnection
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[1] = 0;
  v6[0] = 528;
  id v4 = objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v6, v2, v3);
  return v4;
}

+ (id)reachabilityForLocalWiFi
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[1] = 0;
  v6[0] = 0xFEA900000210;
  id v4 = (unsigned char *)objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v6, v2, v3);
  if (v4) {
    v4[9] = 1;
  }
  return v4;
}

- (BOOL)startNotifier
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_isNotifying)
  {
    uint64_t v3 = FlexLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(context.version) = 138412290;
      *(CFIndex *)((char *)&context.version + 4) = (CFIndex)self;
      id v4 = "ERROR: Attempting to start notifier when already notifying for %@";
      p_SCNetworkReachabilityContext context = (uint8_t *)&context;
LABEL_9:
      _os_log_impl(&dword_217A2F000, v3, OS_LOG_TYPE_DEFAULT, v4, p_context, 0xCu);
    }
  }
  else
  {
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = self;
    if (SCNetworkReachabilitySetCallback(self->reachabilityRef, (SCNetworkReachabilityCallBack)sub_217A320BC, &context)
      && SCNetworkReachabilitySetDispatchQueue(self->reachabilityRef, (dispatch_queue_t)self->_reachabilityQueue))
    {
      BOOL result = 1;
      self->_isNotifying = 1;
      return result;
    }
    uint64_t v3 = FlexLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = self;
      id v4 = "ERROR: Could not start notifier for %@";
      p_SCNetworkReachabilityContext context = (uint8_t *)&v7;
      goto LABEL_9;
    }
  }

  return 0;
}

- (void)stopNotifier
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->_isNotifying)
  {
    reachabilityRef = self->reachabilityRef;
    if (reachabilityRef
      && SCNetworkReachabilitySetDispatchQueue(reachabilityRef, 0)
      && SCNetworkReachabilitySetCallback(self->reachabilityRef, 0, 0))
    {
      self->_isNotifying = 0;
    }
    else if (self->_isNotifying)
    {
      id v4 = FlexLogForCategory(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 138412290;
        uint64_t v6 = self;
        _os_log_impl(&dword_217A2F000, v4, OS_LOG_TYPE_DEFAULT, "ERROR: Could not stop notifier for %@", (uint8_t *)&v5, 0xCu);
      }
    }
  }
}

- (void)dealloc
{
  objc_msgSend_stopNotifier(self, a2, v2, v3, v4);
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef) {
    CFRelease(reachabilityRef);
  }
  v7.receiver = self;
  v7.super_class = (Class)FlexReachability;
  [(FlexReachability *)&v7 dealloc];
}

- (int64_t)localWiFiStatusForFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

- (int64_t)networkStatusForFlags:(unsigned int)a3
{
  if ((a3 & 2) == 0) {
    return 0;
  }
  LODWORD(v4) = (a3 & 0x28) != 0;
  if ((a3 & 0x10) != 0) {
    LODWORD(v4) = 0;
  }
  if ((a3 & 4) != 0) {
    int64_t v4 = v4;
  }
  else {
    int64_t v4 = 1;
  }
  if ((a3 & 0x40000) != 0) {
    return 2;
  }
  else {
    return v4;
  }
}

- (BOOL)connectionRequired
{
  SCNetworkReachabilityFlags flags = 0;
  return SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags) && (flags & 4) != 0;
}

- (BOOL)interventionRequired
{
  SCNetworkReachabilityFlags flags = 0;
  return SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags) && (flags & 0x10) != 0;
}

- (int64_t)currentReachabilityStatus
{
  SCNetworkReachabilityFlags flags = 0;
  if (!SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags)) {
    return 0;
  }
  if (self->localWiFiRef) {
    return objc_msgSend_localWiFiStatusForFlags_(self, v3, flags, v4, v5);
  }
  return objc_msgSend_networkStatusForFlags_(self, v3, flags, v4, v5);
}

- (OS_dispatch_queue)reachabilityQueue
{
  return self->_reachabilityQueue;
}

- (void)setReachabilityQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end