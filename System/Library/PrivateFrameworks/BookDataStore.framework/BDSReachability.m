@interface BDSReachability
+ (BOOL)isOffline;
+ (id)reachabilityForInternetConnection;
+ (id)reachabilityForLocalWiFi;
+ (id)reachabilityWithAddress:(const sockaddr_in *)a3;
+ (id)reachabilityWithHostName:(id)a3;
+ (id)sharedReachabilityForInternetConnection;
+ (void)_updateIsOffline;
- (BOOL)connectionRequired;
- (BOOL)startNotifier;
- (int)currentReachabilityStatus;
- (int)localWiFiStatusForFlags:(unsigned int)a3;
- (int)networkStatusForFlags:(unsigned int)a3;
- (void)dealloc;
- (void)stopNotifier;
@end

@implementation BDSReachability

- (BOOL)startNotifier
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v7.version = 0;
  memset(&v7.retain, 0, 24);
  v7.info = self;
  int v3 = SCNetworkReachabilitySetCallback(self->reachabilityRef, (SCNetworkReachabilityCallBack)sub_236104690, &v7);
  if (v3)
  {
    reachabilityRef = self->reachabilityRef;
    Current = CFRunLoopGetCurrent();
    LOBYTE(v3) = SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Current, (CFStringRef)*MEMORY[0x263EFFE88]) != 0;
  }
  return v3;
}

- (void)stopNotifier
{
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef)
  {
    Current = CFRunLoopGetCurrent();
    CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE88];
    SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef, Current, v4);
  }
}

- (void)dealloc
{
  objc_msgSend_stopNotifier(self, a2, v2, v3, v4, v5, v6, v7);
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef) {
    CFRelease(reachabilityRef);
  }
  v10.receiver = self;
  v10.super_class = (Class)BDSReachability;
  [(BDSReachability *)&v10 dealloc];
}

+ (id)reachabilityWithHostName:(id)a3
{
  id v4 = a3;
  v12 = (const char *)objc_msgSend_UTF8String(v4, v5, v6, v7, v8, v9, v10, v11);
  SCNetworkReachabilityRef v13 = SCNetworkReachabilityCreateWithName(0, v12);
  if (v13)
  {
    SCNetworkReachabilityRef v14 = v13;
    SCNetworkReachabilityRef v13 = (SCNetworkReachabilityRef)objc_alloc_init((Class)a1);
    if (v13)
    {
      *((void *)v13 + 2) = v14;
      *((unsigned char *)v13 + 8) = 0;
    }
    else
    {
      CFRelease(v14);
      SCNetworkReachabilityRef v13 = 0;
    }
  }
  return v13;
}

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  SCNetworkReachabilityRef v4 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x263EFFB08], (const sockaddr *)a3);
  if (v4)
  {
    SCNetworkReachabilityRef v5 = v4;
    SCNetworkReachabilityRef v4 = (SCNetworkReachabilityRef)objc_alloc_init((Class)a1);
    if (v4)
    {
      *((void *)v4 + 2) = v5;
      *((unsigned char *)v4 + 8) = 0;
    }
    else
    {
      CFRelease(v5);
      SCNetworkReachabilityRef v4 = 0;
    }
  }
  return v4;
}

+ (id)reachabilityForInternetConnection
{
  v9[2] = *MEMORY[0x263EF8340];
  v9[1] = 0;
  v9[0] = 528;
  uint64_t v7 = objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v9, v2, v3, v4, v5, v6);
  return v7;
}

+ (id)reachabilityForLocalWiFi
{
  v9[2] = *MEMORY[0x263EF8340];
  v9[1] = 0;
  v9[0] = 0xFEA900000210;
  objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v9, v2, v3, v4, v5, v6);
  uint64_t v7 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    v7[8] = 1;
  }
  return v7;
}

- (int)localWiFiStatusForFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

- (int)networkStatusForFlags:(unsigned int)a3
{
  int v3 = ((a3 >> 2) & 1) == 0;
  if ((a3 & 0x10) == 0 && (a3 & 0x28) != 0) {
    int v3 = 1;
  }
  if ((a3 & 0x40000) != 0) {
    int v3 = 2;
  }
  if ((a3 & 2) != 0) {
    return v3;
  }
  else {
    return 0;
  }
}

- (BOOL)connectionRequired
{
  SCNetworkReachabilityFlags flags = 0;
  return SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags) && (flags & 4) != 0;
}

- (int)currentReachabilityStatus
{
  SCNetworkReachabilityFlags flags = 0;
  int result = SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags);
  if (result)
  {
    if (self->localWiFiRef) {
      return objc_msgSend_localWiFiStatusForFlags_(self, v4, flags, v5, v6, v7, v8, v9);
    }
    else {
      return objc_msgSend_networkStatusForFlags_(self, v4, flags, v5, v6, v7, v8, v9);
    }
  }
  return result;
}

+ (void)_updateIsOffline
{
  objc_msgSend_sharedReachabilityForInternetConnection(BDSReachability, a2, v2, v3, v4, v5, v6, v7);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  byte_26AD760E0 = objc_msgSend_currentReachabilityStatus(v15, v8, v9, v10, v11, v12, v13, v14) == 0;
}

+ (BOOL)isOffline
{
  return byte_26AD760E0;
}

+ (id)sharedReachabilityForInternetConnection
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_236104B90;
  block[3] = &unk_264CA15B8;
  block[4] = a1;
  if (qword_26AD77658 != -1) {
    dispatch_once(&qword_26AD77658, block);
  }
  uint64_t v2 = (void *)qword_26AD77660;
  return v2;
}

@end